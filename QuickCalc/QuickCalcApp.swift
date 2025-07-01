//
//  QuickCalcApp.swift
//  QuickCalc
//
//  Created by 長橋和敏 on 2025/07/01.
//

import SwiftUI

@main
struct QuickCalcApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
