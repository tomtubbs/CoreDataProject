//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Tom on 19/07/2023.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

	public var wrappedTitle: String {
		title ?? "Unknown Title"
	}
	
	public var wrappedDirector: String {
		title ?? "Unknown Director"
	}
	
}

extension Movie : Identifiable {

}
