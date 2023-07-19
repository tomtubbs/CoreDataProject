//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Tom on 19/07/2023.
//


// Previous mention of ViewBuilder at https://www.hackingwithswift.com/quick-start/swiftui/how-to-return-different-view-types
//	Which at the end mentions "honestly if you find yourself reaching for @ViewBuilder you should question whether you’re trying to put too much into one view."
//	"The fourth solution, and the one that works best the majority of the time, is to break up your views into smaller views, then combine them together as needed:"

//	@ViewBuilder lets our containing view (whatever is using the list) send in multiple views if they want.
//	@escaping says the closure will be stored away and used later, which means Swift needs to take care of its memory.

//	adding import of CoreData
import CoreData

import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
	@FetchRequest var fetchRequest: FetchedResults<T>
	
	let content: (T) -> Content
	
	
	var body: some View {
		List(fetchRequest, id: \.self) { item in
			self.content(item)
		}
	}
	
//	init(filter: String) {
//		_fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//	}
	
//	changing init to
	
	init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
		_fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
		self.content = content
	}
	
	
	
}




//#Preview {
//    FilteredList()
//}
