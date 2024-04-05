//
//  PersistenceController.swift
//
//
//  Created by takasqr on 2024/04/06.
//

import Foundation

import CoreData

struct PersistenceController {
    
    static var shared = PersistenceController(name: "Default")

    let container: NSPersistentContainer

    init(name: String, inMemory: Bool = false) {
        
        container = NSPersistentContainer(name: name)
        
        if inMemory {
            // インメモリストアの場合はURLを/dev/nullに設定
            let storeDescription = NSPersistentStoreDescription()
            storeDescription.url = URL(fileURLWithPath: "/dev/null")
            container.persistentStoreDescriptions = [storeDescription]
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        // ライトウェイトマイグレーション用のオプションを設定
        if !inMemory {
            container.persistentStoreDescriptions.forEach { description in
                description.setOption(true as NSNumber, forKey: NSMigratePersistentStoresAutomaticallyOption)
                description.setOption(true as NSNumber, forKey: NSInferMappingModelAutomaticallyOption)
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    static func createSharedInstance(name: String, inMemory: Bool = false) {
        PersistenceController.shared = PersistenceController(name: name, inMemory: inMemory)
    }
}
