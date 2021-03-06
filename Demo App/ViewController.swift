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

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePictureView: FBSDKProfilePictureView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add the log in with facebook button to the bottom of our app
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = CGPoint(x: CGRectGetMidX(self.view.frame), y: CGRectGetHeight(self.view.frame)-loginButton.frame.height)
        
        loginButton.delegate = self
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
    
    @IBAction func enterApp(sender: AnyObject) {
        if FBSDKAccessToken.currentAccessToken() != nil {
            self.performSegueWithIdentifier("mainApp", sender: self)
        } else {
              let alertController = UIAlertController(title: "Error", message: "You are not logged in to Facebook", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    //Mark -- Facebook Login button Delegate
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        statusLabel.text = "You are logged in as"
        displayName()
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        statusLabel.text = "You are logged out"
        nameLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

