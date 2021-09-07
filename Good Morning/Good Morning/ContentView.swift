//
//  ContentView.swift
// Created by Rahul
// 

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 111/255, green: 105/255, blue: 172/255)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/3)
                .edgesIgnoringSafeArea(.all)
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: .infinity,
                      alignment: .topLeading
                    )
            
            VStack(spacing: 10) {
                Spacer()
                
                Text("Hi Rahul").frame(width: 200, height: 20, alignment: .leading)
                
                Spacer(minLength: 100)
                TodayTaskView()
                
                

            }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TodayTaskView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0 ..< 5) { item in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 30)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .rotation3DEffect(
                                Angle(
                                    degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
                                ),
                                axis: (x: 0, y: 0, z: 0),
                                anchor: .center,
                                anchorZ: 0.0,
                                perspective: 1.0
                            )
                    }
                    .frame(width: 250, height: 200)
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                    .offset(x: 0, y: 0)
                }
            }
            .padding()
        }
    }
}
