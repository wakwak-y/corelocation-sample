//
//  LocationsHandler.swift
//  CoreLocationExample
//
//  Created by Yu Wakui on 2024/09/26.
//

import os
import CoreLocation

@MainActor
final class LocationsHandler: ObservableObject {
    let logger = Logger(subsystem: "com.wakwak.CoreLocationExample", category: "LocationsHandler")
    static let shared = LocationsHandler()
    
    @Published var location: CLLocation = .init()
    
    // Start receiving location updates and authentication status changes
    func startUpdatingLocation() {
        Task {
            do {
                let updates = CLLocationUpdate.liveUpdates()
                for try await update in updates {
                    if let location = update.location {
                        self.location = location
                        self.logger.info("Location: \(self.location)")
                    }
                }
            } catch {
                self.logger.info("Could not start location updates")
            }
        }
    }
}

