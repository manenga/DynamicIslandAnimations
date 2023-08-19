//
//  UIDeviceExtensions.swift
//  DynamicIslandAnimations
//
//  Created by Manenga Mungandi on 2023/08/19.
//

import UIKit

extension UIDevice {
    static var hasDynamicIsland: Bool {
        ["iPhone 14 Pro", "iPhone 14 Pro Max"].contains(current.name)
    }
}
