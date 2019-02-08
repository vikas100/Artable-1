//
//  RegisterViewController.swift
//  Artable
//
//  Created by МакЛарен on 2/6/19.
//  Copyright © 2019 Asset Ryskul. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPassTextfield: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImageView: UIImageView!
    @IBOutlet weak var confirmPassCheckImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPassTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        
        guard let passText = passwordTextfield.text else {return}
        
        if textField == confirmPassTextfield {
            passCheckImageView.isHidden = false
            confirmPassCheckImageView.isHidden = false
        } else {
            if passText.isEmpty {
                passCheckImageView.isHidden = true
                confirmPassCheckImageView.isHidden = true
                confirmPassTextfield.text = ""
            }
        }
        
        if passwordTextfield.text == confirmPassTextfield.text {
            passCheckImageView.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImageView.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passCheckImageView.image = UIImage(named: AppImages.RedCheck)
            confirmPassCheckImageView.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    @IBAction func registerButton_Clicked(_ sender: Any) {
        guard let email = emailTextfield.text, email.isNotEmpty,
            let username = usernameTextfield.text, username.isNotEmpty,
            let password = passwordTextfield.text, password.isNotEmpty else {return}
        
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                debugPrint(error)
                return
            }
            
            self.activityIndicator.stopAnimating()
            print("success")
        }
    }
    


}
