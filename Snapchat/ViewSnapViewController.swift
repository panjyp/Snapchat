//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Jeff Pan on 11/18/16.
//  Copyright © 2016 Jeff Pan. All rights reserved.
//

import UIKit

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descripLabel: UILabel!
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descripLabel.text = snap.descrip

        // Do any additional setup after loading the view.
    }

}
