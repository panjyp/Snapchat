//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Jeff Pan on 11/18/16.
//  Copyright © 2016 Jeff Pan. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descripLabel: UILabel!
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descripLabel.text = snap.descrip
        imageView.sd_setImage(with: URL(string: snap.imageURL))

        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.key).removeValue()
        
        FIRStorage.storage().reference().child("images").child("\(snap.uuid).jpg").delete {(error) in print("We deleted the pic")
        }
    }
}
