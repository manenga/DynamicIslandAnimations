//
//  DynamicIslandAnimationsApp.swift
//  DynamicIslandAnimations
//
//  Created by Manenga Mungandi on 2023/08/19.
//

import SwiftUI

@main
struct DynamicIslandAnimationsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .top) {
                    GeometryReader { proxy in
                        let size = proxy.size
                        NotificationView(size: size).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
                .ignoresSafeArea()
            }
        }
    }
}
