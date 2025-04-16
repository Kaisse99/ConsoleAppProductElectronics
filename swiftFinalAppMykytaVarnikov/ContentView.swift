//
//  ContentView.swift
//  swiftFinalAppMykytaVarnikov
//
//  Created by Mykyta Kaisenberg on 2025-04-16.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AboutMeView()){
                    Text("About Me Page")
                }
                .padding()
                NavigationLink(destination: OrderPizzaView()){
                    Text("Order Pizza Page")
                }
            }
            .navigationTitle("Final Exam")
        }
        
 
    }
}

struct AboutMeView: View {
    var body: some View {
        
        Section(header: Text("About me")){
            List {
                Text("Mykyta Varnikov")
                Text("Student Number: 991701116")
                Text("Hobbies: Volleyball, Coding, Gym, Hiking")
            }
        }
    }
}
struct OrderPizzaView: View {
    var body: some View {
        Text("hHA")
    }
}

#Preview {
    OrderPizzaView()
}
