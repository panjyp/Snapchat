//
//  SelectUserViewController.swift
//  Snapchat
//
//  Created by Jeff Pan on 11/15/16.
//  Copyright © 2016 Jeff Pan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SelectUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            
            let user = User()
            user.email = (snapshot.value! as AnyObject)["email"] as! String
            user.uid = snapshot.key
            
            print(user.email)
            
            self.users.append(user)
            self.tableView.reloadData()
            
        })
        

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        
        let snap = ["from": user.email, "description":"hello", "imageURL": "www.img/yea"]
        FIRDatabase.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        return cell
    }
}
