//
//  SigninViewController.swift
//  Snapchat
//
//  Created by Jeff Pan on 11/14/16.
//  Copyright © 2016 Jeff Pan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SigninViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func turnupTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("Hey we have an error:\(error)")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextfield.text!, password: self.passwordTextfield.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("Hey we have an error:\(error)")
                    } else {
                        print("Created user successfully")
                        self.performSegue(withIdentifier: "signinSegue", sender: nil)
                    }
                })
                
                
                
            } else {
                print("Signed in Successfully")
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            }
            
        })
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
