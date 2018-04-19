//
//  OptionsViewController.swift
//  What am I ?
//
//  Created by Vincent Ratford on 4/18/18.
//  Copyright © 2018 Vincent Ratford. All rights reserved.
//


import UIKit
import Vision
class OptionsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    

//    if var tbc: bool = self.tabBarController as? myCustomTabController {
 
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.navigationItem.title = "Options"
            
             print("viewdidload")
                
            }
    @IBAction func imageSource(_ sender: UISwitch) {
        
        if sender.isOn {
        
            print("switch is on")
        } else {
           print("switch is off")
        }
    }

}
 
    
    
    
    

    

