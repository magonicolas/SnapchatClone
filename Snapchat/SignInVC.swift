//
//  ViewController.swift
//  Snapchat
//
//  Created by Mago Nicolas Palacios on 9/2/16.
//  Copyright © 2016 Mago Nicolas Palacios. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func turnUpTapped(_ sender: AnyObject) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user, error) in
            if error != nil {
                print("There was an error with Log In with Friebase")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    if error != nil {
                        print("There was an error Creating an Account")
                    } else
                    {
                        print("Account Created Sucsessfully")
                        self.performSegue(withIdentifier: "signinSegue", sender: nil)
                    }
                })
            } else {
                print("Signed In Successfully")
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            }
        })
    }

}

