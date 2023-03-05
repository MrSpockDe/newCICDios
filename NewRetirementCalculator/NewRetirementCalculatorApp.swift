//
//  NewRetirementCalculatorApp.swift
//  NewRetirementCalculator
//
//  Created by Albert on 25.02.23.
//

import SwiftUI
import AppCenter
import AppCenterCrashes
import AppCenterAnalytics

@main
struct NewRetirementCalculatorApp: App {
    init() {
        AppCenter.start(withAppSecret: "566711fe-c066-4dcf-8117-1b06e93e2c68", services: [Analytics.self, Crashes.self])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
