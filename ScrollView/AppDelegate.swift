//  AppDelegate.swift
//  ScrollView
//
//  Created by Frederick C. Lee on 7/16/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        // Note: custom color currently doesn't work in Swift 3.0; hence the blue.
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont(name: "Roboto-Regular", size: 16)!,
                                                            NSForegroundColorAttributeName:UIColor.blue]

        return true
    }
}

