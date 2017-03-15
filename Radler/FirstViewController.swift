//
//  FirstViewController.swift
//  Radler
//
//  Created by James Browning on 2/27/17.
//  Copyright © 2017 James Browning. All rights reserved.
//

import UIKit
import Firebase

import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class FirstViewController: UIViewController {
    
    var place = GMSUserAddedPlace()
    
    @IBAction func getNearbyPlaces(_ sender: UIButton) {
                
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlace(callback: { (place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            guard let place = place else {
                print("No place selected")
                return
            }
            
            if     place.types.contains("bar")
                || place.types.contains("restaurant")
                || place.types.contains("food") {
                
                print("Place name \(place.name)")
                print("Place address \(place.formattedAddress)")
                print("Place attributions \(place.attributions)")
            }
            
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMain() {
        performSegue(withIdentifier: "unwindToMain", sender: nil)
        
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
