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
        fetchStoryboards()
    }
    
    private func fetchStoryboards() {
        
        // Load all Storyboard entities from CoreData database
        
        // Create a fetch requset for a Storyboard
        let fetchRequest = NSFetchRequest<Storyboard>(entityName: "Storyboard")
        
        // Get the Core Data context that represents the database (TODO: optimsie with background context)
        let context = applicationDelegate.persistentContainer.viewContext
        
        // Fetch the storyboards from the context
        var storyboards: [Storyboard] = []
        do {
            storyboards = try context.fetch(fetchRequest)
        } catch {
            print("Error: error fetching: \(error)")
        }
        // TODO: display in UI
        print(storyboards)
        storyboards.forEach { print(String(describing: $0.name)) }
    }
    
    
    // MARK: - Actions
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        // Get the Core Data context that represents the database (TODO: optimsie with background context)
        let context = applicationDelegate.persistentContainer.viewContext
        
        // Create new Storyboard entity
        let storyboard: Storyboard = NSEntityDescription.insertNewObject(forEntityName: "Storyboard",
                                                                         into: context) as! Storyboard
        
        
        // TODO: create Frame entities with image paths and add those to the new Storyboard
        
        storyboard.id = UUID()
        storyboard.name = "Test"
        
        // Save new entities into the core data database
        applicationDelegate.saveContext()
        
        // Show UI alert popup for debug
        let alert = UIAlertController(title: "Success", message: "Created Storyboard: \(storyboard)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

