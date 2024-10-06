//
//  AppDelegate.swift
//  CoreLocationExample
//
//  Created by Yu Wakui on 2024/10/06.
//

import Foundation
import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        let locationsHandler = LocationsHandler.shared
        locationsHandler.startUpdatingLocation()
        locationsHandler.backgroundUpdates = true
        
        return true
    }
}
