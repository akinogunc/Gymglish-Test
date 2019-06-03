//
//  ViewController.swift
//  Gymglish Test
//
//  Created by AKIN on 3.06.2019.
//  Copyright © 2019 AKIN. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        login()
        return true
    }
    
    @IBAction func login() {
        if(usernameTextfield.text == "" || passwordTextfield.text == ""){
            presentAlertWithTitle(title: "Error", message: "Username and password can not be blank", options: "OK", completion: { (option) in })
        }else if(usernameTextfield.text != "test" || passwordTextfield.text != "12345"){
            presentAlertWithTitle(title: "Error", message: "Wrong Credentials", options: "OK", completion: { (option) in })
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let listViewController = storyboard.instantiateViewController(withIdentifier: "list") as! ListViewController
            self.navigationController?.pushViewController(listViewController, animated: true)
        }
        usernameTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
    }

}

extension UIViewController {
    
    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}

