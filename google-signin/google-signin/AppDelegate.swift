//
//  AppDelegate.swift
//  google-signin
//
//  Created by Duc Nguyen on 1/2/16.
//  Copyright © 2016 ND NINJA. All rights reserved.
//

import UIKit
import Google

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		var configureError: NSError?
		GGLContext.sharedInstance().configureWithError(&configureError)
		assert(configureError == nil, "Error configuring Google services: \(configureError)")
		
		GIDSignIn.sharedInstance().delegate = self
		// var configureError: NSError?
		// GGLContext.sharedInstance().configureWithError(&configureError)
		// if configureError != nil {
		// print("We have an error! \(configureError)")
		// }
		// GIDSignIn.sharedInstance().delegate = self
		return true
	}
	
	
	func applicationWillResignActive(application: UIApplication) {
	}
	
	func applicationDidEnterBackground(application: UIApplication) {
	}
	
	func applicationWillEnterForeground(application: UIApplication) {
	}
	
	func applicationDidBecomeActive(application: UIApplication) {
	}
	
	func applicationWillTerminate(application: UIApplication) {
	}
	
	func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
		return GIDSignIn.sharedInstance().handleURL(url, sourceApplication: sourceApplication, annotation: annotation)
	}
}

extension AppDelegate: GIDSignInDelegate {
	
	
	func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
		if (error == nil) {
			let userId = user.userID // For client-side use only!
			let idToken = user.authentication.idToken // Safe to send to the server
			let name = user.profile.name
			let email = user.profile.email
			print(userId)
			print(idToken)
			print(name)
			print(email)
		} else {
			print("\(error.localizedDescription)")
		}
	}
	
	func signIn(signIn: GIDSignIn!, didDisconnectWithUser user: GIDGoogleUser!, withError error: NSError!) {
		if error == nil {
			print("logged out!")
		} else {
			
		}
	}
}

