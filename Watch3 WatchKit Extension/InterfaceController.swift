//
//  InterfaceController.swift
//  Watch3 WatchKit Extension
//
//  Created by Macbook on 22/05/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        testUserDefaults()
        testUserDefaults()
    }
    
    func testUserDefaults() {
     
     let defaults = UserDefaults.standard
     
          if let contents = defaults.string(forKey: "shared_default") {
          
               // saved data was found
               print("Reading from defaults")
               print(contents)
          
          } else {
         
               // no saved data - create it
               print("Writing to defaults")
               defaults.set("This is the saved default", forKey: "shared_default")
          
          }
     }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
