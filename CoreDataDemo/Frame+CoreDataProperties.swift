//
//  Frame+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Shagun Madhikarmi on 18/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//
//

import Foundation
import CoreData


extension Frame {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Frame> {
        return NSFetchRequest<Frame>(entityName: "Frame")
    }

    @NSManaged public var index: Int64
    @NSManaged public var imageURL: URL?

}
