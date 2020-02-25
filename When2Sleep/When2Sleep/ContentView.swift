//
//  ContentView.swift
//  When2Sleep
//
//  Created by Dominick Lee on 2/25/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let dateFormatter = DateFormatter()
    let today = Date()

    func getTime() -> String {
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "H:mm a"
        return dateFormatter.string(from: today)
    }
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                HStack {
                    Text("Good Evening")
                        .font(.system(size: 40, weight: .medium, design: .default))
                        .padding(.leading, 20)
                        .padding(.top, 20)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    Spacer()
                }
                HStack {
                    Text("The time is now \(getTime())")
                        .font(.system(size: 25, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.top, 20)
                    Spacer()
                }
                Spacer()
            }
            
            
            
        }.statusBar(hidden: true)
        
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
