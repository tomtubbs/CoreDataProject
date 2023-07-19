//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Tom on 19/07/2023.
//

import CoreData
import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext) var moc
	@State private var lastNameFilter = "A"
	
	
	var body: some View {
		VStack {
			FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
				Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
			}
			

			Button("Add Examples") {
				let taylor = Singer(context: moc)
				taylor.firstName = "Taylor"
				taylor.lastName = "Swift"

				let ed = Singer(context: moc)
				ed.firstName = "Ed"
				ed.lastName = "Sheeran"

				let adele = Singer(context: moc)
				adele.firstName = "Adele"
				adele.lastName = "Adkins"

				try? moc.save()
			}

			Button("Show A") {
				lastNameFilter = "A"
			}

			Button("Show S") {
				lastNameFilter = "S"
			}
		}

	}
}





#Preview {
    ContentView()
}
