//
//  ViewController.swift
//  CustomControl
//
//  Created by Angel Buenrostro on 1/29/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        switch ratingControl.value {
        case 0:
            self.title = "User Rating: 0 stars"
        case 1:
            self.title = "User Rating: 1 star"
        case 2:
            self.title = "User Rating: 2 stars"
        case 3:
            self.title = "User Rating: 3 stars"
        case 4:
            self.title = "User Rating: 4 stars"
        case 5:
            self.title = "User Rating: 5 stars"
        default:
            self.title = "No rating"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
