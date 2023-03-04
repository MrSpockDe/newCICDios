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

// Github: 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

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
