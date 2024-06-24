//
//  ContentView2.swift
//  VisionOSApp
//
//  Created by Илья Кузнецов on 24.06.2024.
//

import SwiftUI

struct ContentView2: View {
    @State private var droppedObjects: [String] = []
    @State private var startObjects: [String] = ["1", "2", "3", "4", "5"]
    @Environment(\.dismissWindow) private var dismissWindow
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Button("Close this window") {
                dismissWindow(id: "Window 2")
            }
            
            HStack {
                VStack {
                    Text("Some objects")
                    List(startObjects, id: \.self) { object in
                        Text(object)
                            .onDrag {
                                return NSItemProvider(object: object as NSString)
                            }
                    }
                }
                .padding()
                
                VStack {
                    Text("Dropped objects")
                    List(droppedObjects, id: \.self) {
                        Text("dropped: \($0)")
                    }
                }
            }
            .dropDestination(for: String.self) { objects, location in
                for object in objects {
                    startObjects.removeAll { $0 == object }
                }
                droppedObjects += objects
                return true
            }
        }
    }
}

#Preview {
    ContentView2()
}
