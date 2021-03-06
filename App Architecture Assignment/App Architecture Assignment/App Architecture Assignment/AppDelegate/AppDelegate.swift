//
//  AppDelegate.swift
//  App Architecture Assignment
//
//  Created by Pranay Swar on 3/30/18.
//  Copyright © 2018 Pranay Swar. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	var coreDataStack = CoreDataStack()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
		
		guard let locationSearchNC = mainStoryBoard.instantiateInitialViewController() as? UINavigationController, let locationSearchVC = locationSearchNC.topViewController as? LocationSearchViewController else {
			fatalError("incorrect initial View Controller")
		}
		
		// App delegate should not be responsible for creating and injecting dependencies. But for the sake of simplicity and brevity, I am making the AppDelegate inject it.
		locationSearchVC.locationSearchManager = LocationSearchManager()
		let dataStoreManager = DataStoreManager(withDataStack: coreDataStack)
		locationSearchVC.dataStoreManager = dataStoreManager
		
		window?.rootViewController = locationSearchNC
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
		// Saves changes in the application's managed object context before the application terminates.
	}

}

