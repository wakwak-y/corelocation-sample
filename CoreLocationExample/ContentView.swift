//
//  ContentView.swift
//  CoreLocationExample
//
//  Created by Yu Wakui on 2024/09/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationsHandler = LocationsHandler.shared
    
    var body: some View {
        VStack {
            Text("Location: \(self.locationsHandler.location.description)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
