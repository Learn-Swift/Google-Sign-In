//
//  ViewController.swift
//  google-signin
//
//  Created by Duc Nguyen on 1/2/16.
//  Copyright © 2016 ND NINJA. All rights reserved.
//

import UIKit
import Google

class ViewController: UIViewController, GIDSignInUIDelegate {
	
	@IBOutlet weak var buttonSignIn: GIDSignInButton!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		GIDSignIn.sharedInstance().uiDelegate = self
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func signOut(sender: AnyObject) {
		GIDSignIn.sharedInstance().signOut()
	}
	
	func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
		
	}
	
	// Present a view that prompts the user to sign in with Google
	func signIn(signIn: GIDSignIn!,
		presentViewController viewController: UIViewController!) {
			print("Sign In presented")
			self.presentViewController(viewController, animated: true, completion: nil)
	}
	
	// Dismiss the "Sign in with Google" view
	func signIn(signIn: GIDSignIn!,
		dismissViewController viewController: UIViewController!) {
			print("Sign In dismissed")
			self.dismissViewControllerAnimated(true, completion: nil)
	}
}