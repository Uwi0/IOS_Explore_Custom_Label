//
//  ContentView.swift
//  Explore Custom Label
//
//  Created by dwi prasetyo on 30/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            Label("Custom Label", systemImage: "globe")
            Label("Custom Label", systemImage: "globe").labelStyle(RightLabelStyle())
            Label("Fade in Label", systemImage: "globe").labelStyle(FadeInLabelStyle())
            Label("Fade in Label", systemImage: "globe").labelStyle(WideLabelStyle())
            Label("Fade in Label", systemImage: "globe").labelStyle(
                NewLabelStyle(
                    color1: .green.opacity(0.3),
                    color2: .cyan.opacity(0.7),
                    cornerRadius: 15
                )
            )
            HStack {
                Text("Custom Label ")
                Image(systemName: "globe")
            }
            CustomLabel(text: "Custom Label", systemName: "globe")
        }
        .padding()
    }
}

struct FadeInLabelStyle: LabelStyle {
    @State var opacity = 0.0
    func makeBody(configuration: Configuration) -> some View {
        
        let backgroundGradient = LinearGradient(
            colors: [.purple, .blue],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        HStack {
            configuration.title
            configuration.icon
        }
        .foregroundColor(.white)
        .opacity(opacity)
        .padding()
        .background(backgroundGradient)
        .cornerRadius(10)
        .onAppear() {
            opacity = 1.0
        }
    }
}

struct RightLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        let backgroundGradient = LinearGradient(
            colors: [.purple, .blue],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        HStack {
            configuration.title
            configuration.icon
        }
        .foregroundColor(.white)
        .padding()
        .background(backgroundGradient)
        .cornerRadius(10)
    }
}

struct WideLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        let backgroundGradient = LinearGradient(
            colors: [.purple, .blue],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        HStack {
            configuration.title
            Spacer()
            configuration.icon
        }
        .foregroundColor(.white)
        .padding()
        .background(backgroundGradient)
        .cornerRadius(10)
    }
}

struct NewLabelStyle: LabelStyle {
    let color1: Color
    let color2: Color
    let cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        
        let backgroundGradient = LinearGradient(
            colors: [color1, color2],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        HStack {
            configuration.title
            configuration.icon
        }
        .foregroundColor(.white)
        .padding()
        .background(backgroundGradient)
        .cornerRadius(cornerRadius)
    }
}

struct CustomLabel: View {
    let text: String
    let systemName: String
    var body: some View {
        HStack {
            Text(text)
            Image(systemName: systemName)
        }
    }
}

#Preview {
    ContentView()
}
