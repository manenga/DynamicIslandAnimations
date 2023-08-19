//
//  NotificationView.swift
//  DynamicIslandAnimations
//
//  Created by Manenga Mungandi on 2023/08/19.
//

import SwiftUI

struct NotificationView: View {

    var size: CGSize
    @State var isExpanded = false
    @State var notification: NotificationModel?

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "swift")
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
                .padding(8)
            Text("Hello, Dynamic Island!")
                .font(.system(size: 18))
                .foregroundColor(.white)
                .padding(8)
        }.frame(width: isExpanded ? size.width - 22 : 126,
                height: isExpanded ? 120 : 37.33)
        .blur(radius: isExpanded ? 0 : 30)
        .opacity(isExpanded ? 1 : 0)
        .scaleEffect(isExpanded ? 1 : 0.5, anchor: .top)
        .background(
            RoundedRectangle(cornerRadius: isExpanded ? 50 : 63,
                             style: .continuous)
            .fill(.black)
        )
        .clipped()
        .offset(y: 11)
        .onReceive(NotificationCenter.default.publisher(for: .init("NOTIFY"))) { output in
            guard let notification = output.object as? NotificationModel else { return }
            self.notification = notification
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.7)) {
                isExpanded = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.7)) {
                        isExpanded = false
                        self.notification = nil
                    }
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            let size = proxy.size
            NotificationView(size: size).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
    }
}
