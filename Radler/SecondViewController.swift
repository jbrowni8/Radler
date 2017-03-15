//
//  SecondViewController.swift
//  Radler
//
//  Created by James Browning on 2/27/17.
//  Copyright © 2017 James Browning. All rights reserved.
//

import UIKit
import GooglePlaces

class SecondViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var rating: UITextField!
    @IBOutlet weak var hours: UITextField!
    @IBOutlet weak var comment: UITextField!
    
    var place = GMSUserAddedPlace()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: UIButton) {
        place.name = name.text
        place.address = address.text
        performSegue(withIdentifier: "unwindWithDataToMain", sender: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    @IBAction func clear(_ sender: UIButton) {
        name.text = ""
        address.text = ""
        rating.text = ""
        hours.text = ""
        comment.text = ""
    }
    
    // Pass the selected place to the new view controller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "unwindToMain" {
            print("Cancelled.")
        } else if segue.identifier == "unwindWithDataToMain" {
            if let nextViewController = segue.destination as? MapController {
                nextViewController.place = self.place
            }
            
        }
    }
}

