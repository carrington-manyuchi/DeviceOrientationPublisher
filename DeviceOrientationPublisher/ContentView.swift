//
//  ContentView.swift
//  DeviceOrientationPublisher
//
//  Created by Manyuchi, Carrington C on 2025/05/19.
//

import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var value: Int = 0
    var cancellable: AnyCancellable?
    
    init() {
        let publisher = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .map { _ in
                self.value + 1
            }
        
        cancellable = publisher.assign(to: \.value, on: self)
    }
}

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.value.description)
                .font(.largeTitle)
        }
        .padding()
        .onDisappear {
            viewModel.cancellable?.cancel()
        }
    }
}

#Preview {
    ContentView()
}
