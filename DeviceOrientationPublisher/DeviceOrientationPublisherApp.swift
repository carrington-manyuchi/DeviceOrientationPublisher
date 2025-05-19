//
//  DeviceOrientationPublisherApp.swift
//  DeviceOrientationPublisher
//
//  Created by Manyuchi, Carrington C on 2025/05/19.
//

import SwiftUI
import Combine

@main
struct DeviceOrientationPublisherApp: App {
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { _ in
                let currentOrientation = UIDevice.current.orientation
                print("Current orientation: \(currentOrientation)")
            }
            .store(in: &cancellables)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
