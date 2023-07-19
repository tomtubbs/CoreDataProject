//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Tom on 19/07/2023.
//

import SwiftUI


struct Student: Hashable {
	let name: String
}

struct ContentView: View {
	
	@Environment(\.managedObjectContext) var moc
	
	@FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
	
	let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
	
	var body: some View {
		VStack {
			List(wizards, id: \.self) { wizard in
				Text(wizard.name ?? "Unknown")
			}
			
			Button("Add") {
				let wizard = Wizard(context: moc)
				wizard.name = "Harry Potter"
			}
			
			Button("Save") {
				do {
					try moc.save()
				} catch {
					print(error.localizedDescription)
				}
			}
		}
	}
}





#Preview {
    ContentView()
}
