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
        
        testFile()
        testFile()
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
     
     func testKeyChain() {
          
          let keychain = KeychainWrapper.standard
          
          if let contents = keychain.string(forKey: "shared_keychain") {
          
               print("Reading from keychain")
               print(contents)
          
          } else {
     
               print("Writing to keychain")
               keychain.set("This is the saved keychain", forKey: "shared_keychain")
     
          }
     }
     
     func testFile() {
          
          let savedURL = getDocumentsDirectory().appendingPathComponent("shared_file")
          
          if let contents = try? String(contentsOf: savedURL) {
               
               print("Reading from file")
               print(contents)
               
          } else {
               
               print("Writing to file")
               try? "This is the saved file.".write(to: savedURL, atomically: true, encoding: String.Encoding.utf8)
               
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
    
    func getDocumentsDirectory() -> URL {
     
          let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
     
          return paths[0]
     
     
     
     }

}
