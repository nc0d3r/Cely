
//
//  CelyLoginViewController.swift
//  Cely
//
//  Created by Fabian Buentello on 7/31/16.
//  Copyright © 2016 Fabian Buentello. All rights reserved.
//

import UIKit

class CelyLoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var usernameField: UITextField?
    @IBOutlet weak var passwordField: UITextField?
    @IBOutlet weak var loginButton: UIButton?
    @IBOutlet var textFields: [UITextField]?

    // MARK: - Variables


    // MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField?.delegate = self
        passwordField?.delegate = self

        loginButton?.addTarget(self, action: #selector(didPressLogin), for: .touchUpInside)
    }

    func didPressLogin() {
        if let fields = textFields ,
            fields.flatMap({$0}).reduce(true, {$0 && !$1.text!.isEmpty}) {


            Cely.set(usernameField?.text, key: "username")
            Cely.set("\(usernameField?.text) + \(passwordField?.text)", key: "token")
            Cely.userAction(.LoggedIn)
        }
    }

    deinit {
        print("CelyLoginViewController released!!")
    }
}

extension CelyLoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let next = textFields?.filter({$0.tag == nextTag}).first {
            next.becomeFirstResponder()
            return true
        }

        textField.resignFirstResponder()
        return true
    }
}