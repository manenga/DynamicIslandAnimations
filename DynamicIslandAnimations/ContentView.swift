//
//  ContentView.swift
//  DynamicIslandAnimations
//
//  Created by Manenga Mungandi on 2023/08/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(8)
            Text("Hello, Dynamic Island!")
                .font(.system(size: 18))
                .padding(8)
            Button("Notify Me") {
                NotificationCenter.default.post(name: .init("NOTIFY"), object: NotificationModel(title: "Dynamic Island", content: "This is an example"))
            }
            .foregroundColor(.black)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
