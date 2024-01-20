//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Ej Dogar on 21/02/2023.
//


import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
//        if let email = emailTextfield.text, let password = passwordTextfield.text {
//            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//                if let e = error {
//                    print(e.localizedDescription)
//                } else {
//                    //navigate to the chat view controller
//                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
//                }
//            }
//        }
        // Replacing Firebase URL with my Node.js server login endpoint, for my Chat API Testing.
               let loginURL = URL(string: "http://localhost:3000/auth/login")!

               // Creating JSON data
               let json: [String: Any] = [
                   "username": emailTextfield.text!,
                   "password": passwordTextfield.text!,
               ]

               guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
                   print("Error faced while converting JSON to data")
                   return
               }

               // Creating URLRequest
               var request = URLRequest(url: loginURL)
               request.httpMethod = "POST"
               request.httpBody = jsonData
               request.addValue("application/json", forHTTPHeaderField: "Content-Type")

               // Performing URL request to my API
               let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                   if let error = error {
                       print("Error: \(error.localizedDescription)")
                       return
                   }

                   guard let data = data else {
                       print("No data received")
                       return
                   }

                   // Parsing response data
                   do {
                       let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                       print("Response: \(jsonResponse ?? [:])")
                   } catch {
                       print("Error parsing JSON: \(error.localizedDescription)")
                   }
               }

               task.resume()
           }
       }
        
//    }
//
//}

//loadPicture(from: someServer) { picture in
//    someView.currentPicture = picture
//} onFailure: {
//    print("Couldn't download the next picture.")
//}
