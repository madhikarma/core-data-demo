//
//  ViewController.swift
//  StoryboardDemo
//
//  Created by Shagun Madhikarmi on 18/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import UIKit
import CoreData

final class ViewController: UIViewController {

    // MARK: - Properties
    
    private var applicationDelegate: AppDelegate {
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else { fatalError() }
        return appDelegate
    }

    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load all Storyboard entities from CoreData database
        let fetchRequest = NSFetchRequest<Storyboard>(entityName: "Storyboard")
        let context = applicationDelegate.persistentContainer.viewContext
        var objects: [Storyboard] = []
        do {
            objects = try context.fetch(fetchRequest)
        } catch {
            print("Error: error fetching: \(error)")
        }
        // TODO: display in UI
        print(objects)
        objects.forEach { print($0.name) }
    }
    
    
    // MARK: - Actions
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let context = applicationDelegate.persistentContainer.viewContext
        
        // Create new Storyboard entity
        let storyboard: Storyboard = NSEntityDescription.insertNewObject(forEntityName: "Storyboard",
                                                                         into: context) as! Storyboard
        // assign its properties
        storyboard.id = UUID()
        storyboard.name = "Test"
        
        // TODO: create Frame entities with image paths and add those to the new Storyboard
        
        
        // Save new entities into the core data database
        applicationDelegate.saveContext()
    }
}

