//
//  ContentView.swift
//  swiftui-vertical-paging
//
//  Created by Zac Snider on 7/11/22.
//

import SwiftUI

struct ContentView: View {
    
    let colors: [Color] = [.red, .orange, .yellow, .green, .teal, .blue, .indigo, .purple]
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                TabView {
                    ForEach (colors, id: \.self) { color in
                        color
                            .scaledToFill()
                    }
                    .frame (
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .rotationEffect(.degrees(-90))
                }
                .frame (
                    width: geometry.size.height,
                    height: geometry.size.width
                )
                .rotationEffect(.degrees(90), anchor: .topLeading)
                .offset(x: geometry.size.width)
                .tabViewStyle(
                    PageTabViewStyle(indexDisplayMode: .never)
                )
            }
            VStack {
                Spacer()
                TabBar()
            }.padding(40)
        }
        .statusBar(hidden: true)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBar: View {
    var body: some View {
        HStack(spacing: 32) {
            TabBarIcon(icon: "house")
                .frame(maxWidth: .infinity)
            TabBarIcon(icon: "safari", isActive: true)
                .frame(maxWidth: .infinity)
            TabBarIcon(icon: "bell")
                .frame(maxWidth: .infinity)
            TabBarIcon(icon: "person.crop.circle")
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 14, leading: 30, bottom: 16, trailing: 30))
        .background(.background)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.2), radius: 16, x: 0, y: 8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .shadow(color: Color.black.opacity(0.05), radius: 1)
    }
}

struct TabBarIcon: View {
    let icon: String
    var isActive: Bool? = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .fontWeight(.medium)
                .foregroundColor(isActive! ? .primary : .secondary)
                .font(.system(size: 24))
            
        }
    }
}
