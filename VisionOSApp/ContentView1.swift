//
//  ContentView.swift
//  VisionOSApp
//
//  Created by Илья Кузнецов on 24.06.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct ContentView1: View {
    @State private var startAnimation = false
    @State private var message = ""
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        VStack {
            Button("Show bird") {
                withAnimation {
                    startAnimation = true
                }
            }.padding3D(.all)
            
            EmptyView()
            
            Button("Open second Window") {
                openWindow(id: "Window 2")
            }
            
            RealityView { content in
                if let bird = loadBird() {
                    content.add(bird)
                    bird.isEnabled = false
                }
            } update: { content in
                if startAnimation {
                    guard let bird = content.entities.first else { return }
                    bird.isEnabled = true
                    bird.availableAnimations.forEach {
                        bird.playAnimation($0.repeat(), transitionDuration: 3)
                    }
                }
            }
        }
    }
    
    private func loadBird() -> Entity? {
        let entity = try? Entity.load(named: "Bird", in: realityKitContentBundle)
        entity?.setScale(.init(x: 0.1, y: 0.1, z: 0.1), relativeTo: nil)
        return entity
    }
}

#Preview(windowStyle: .automatic) {
    ContentView1()
}
