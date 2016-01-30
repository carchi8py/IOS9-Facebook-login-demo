//
//  ViewController.swift
//  Demo App
//
//  Created by Chris Archibald on 1/30/16.
//  Copyright © 2016 Chris Archibald. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add the log in with facebook button to the bottom of our app
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = CGPoint(x: CGRectGetMidX(self.view.frame), y: CGRectGetHeight(self.view.frame)-loginButton.frame.height)
        self.view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

