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
    static let shared = LocationsHandler()
    
    private let logger = Logger(subsystem: "com.wakwak.CoreLocationExample", category: "LocationsHandler")
    // This is the object that keeps your app running in the background and receives updates and events.
    private var backgroundActivitySession: CLBackgroundActivitySession?
    
    @Published var location: CLLocation = .init()
    
    var backgroundUpdates: Bool = false {
        didSet {
            backgroundUpdates ? self.backgroundActivitySession = CLBackgroundActivitySession() : self.backgroundActivitySession?.invalidate()
        }
    }
    
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
                    if update.insufficientlyInUse {
                        logger.warning("Location updates are insufficiently in use. ")
                    }
                }
            } catch {
                self.logger.error("Could not start location updates")
            }
        }
    }
}

