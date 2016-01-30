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

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePictureView: FBSDKProfilePictureView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add the log in with facebook button to the bottom of our app
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = CGPoint(x: CGRectGetMidX(self.view.frame), y: CGRectGetHeight(self.view.frame)-loginButton.frame.height)
        self.view.addSubview(loginButton)
        
        if FBSDKAccessToken.currentAccessToken() != nil {
            statusLabel.text = "You are logged in as"
            
            displayName()
        } else {
            statusLabel.text = "You are logged out"
            nameLabel.text = ""
        }
    }

    func displayName() {
        let graphRequest: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler { (graphConnectionRequest, result, error) -> Void in
         
            let name = result.valueForKey("name") as! String
            self.nameLabel.text = name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

