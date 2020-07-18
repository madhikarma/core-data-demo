//
//  Storyboard+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Shagun Madhikarmi on 18/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//
//

import Foundation
import CoreData


extension Storyboard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Storyboard> {
        return NSFetchRequest<Storyboard>(entityName: "Storyboard")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var frames: Frame?

}
