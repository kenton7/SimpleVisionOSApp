//
//  VisionOSAppApp.swift
//  VisionOSApp
//
//  Created by Илья Кузнецов on 24.06.2024.
//

import SwiftUI

@main
struct VisionOSAppApp: App {
    var body: some Scene {
        
        WindowGroup() {
            ContentView1()
        }
        
        WindowGroup(id: "Window 2") {
            ContentView2()
        }
    }
}
