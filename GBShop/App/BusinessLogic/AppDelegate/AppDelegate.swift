//
//  AppDelegate.swift
//  GBShop
//
//  Created by macbookpro on 01.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let requestFactory = RequestFactory()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Login
        let auth: AuthRequestFactory = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print("---\nlogin: \(login)")
            case .failure(let error):
                print(error)
            }
        }
        
        // Logout
        auth.logout { response in
            switch response.result {
            case .success(let logout):
                print("---\nlogout: \(logout)")
            case .failure(let error):
                print(error)
            }
        }
        
        // Register
        let register: AuthRequestFactory = requestFactory.makeAuthRequestFatory()
        let userData = UserData(
            id: 123,
            userName: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language")
        
        register.register(userData: userData) { response in
            switch response.result {
            case .success(let result):
                print("---\nregister: \(result)")
            case .failure(let error):
                print(error)
            }
        }
        
        // Change user data
        let profile: ProfileRequestFactory = requestFactory.makeProfileRequestFatory()
        
        profile.dataChange(userData: userData) { response in
            switch response.result {
            case .success(let result):
                print("---\nchange-profile: \(result)")
            case .failure(let error):
                print(error)
            }
        }
        
        // Get products catalog
        let shop: ShoppingRequestFactory = requestFactory.makeShoppingRequestFatory()
        shop.getCatalog(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let catalogData):
                print("---\nget-catalog: \(catalogData)")
            case .failure(let error):
                print(error)
            }
        }
        
        // Get product by ID
        shop.getProduct(idProduct: 123) { response in
            switch response.result {
            case .success(let productData):
                print("---\nget-product-by-id: \(productData)")
            case .failure(let error):
                print(error)
            }
        }

        
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
    }


}

