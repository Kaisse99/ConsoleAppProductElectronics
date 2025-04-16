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
    @State var userName : String = ""
    @State private var selectedSize : Int = 0
    @State var amountPizza : Int?
    @State var addTip = false
    var size = ["Small", "Medium", "Large"]
    @State var totalPrice : Double = 0
    var tip : Double { return totalPrice * 0.05 }
    @State var totalPriceWithTip : Double = 0
    
    
    private func priceCalculate() {
        if (addTip == true) {
            switch(selectedSize){
            case 0:
                totalPrice = Double(10 * (amountPizza ?? 0))
                totalPriceWithTip = totalPrice + (tip)
                break
            case 1:
                totalPrice = Double(12 * (amountPizza ?? 0))
                totalPriceWithTip = totalPrice + (tip)
                break
            case 2:
                totalPrice = Double(10 * (amountPizza ?? 0))
                totalPriceWithTip = totalPrice + (tip)
                break
            default:
                print("Something Went wrong")
                break
            }
        }
        if (addTip == false) {
            switch(selectedSize) {
            case 0:
                totalPrice = Double(10 * (amountPizza ?? 0))
                break
            case 1:
                totalPrice = Double(12 * (amountPizza ?? 0))
                break
            case 2:
                totalPrice = Double(10 * (amountPizza ?? 0))
                break
            default:
                print("Something Went wrong")
                break
            }
        }
    }
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    var body: some View {
        Section(header: Text("Order Pizza")){
            Form {
                Section(header: Text("Enter Data")){
                    
                    TextField("Enter User Name:", text: $userName)
                    
                    Picker(selection: $selectedSize, label: Text("Choose a size")) {
                        ForEach(0 ..< 3) {
                            Text(self.size[$0])
                        }
                    }
                    
                    TextField("Enter amount of Pizza:", value: $amountPizza, formatter: formatter)
                    
                    Toggle(isOn: $addTip) {
                        Text("Do you wanna tip 5% ?")
                    }
                    Button("Submit") {
                        priceCalculate()
                        
                    }
                }
                Section(header: Text("Your Info")){
                    Text("Hi \(userName)")
                    Text("You ordered \(String(describing: amountPizza)) \(size[selectedSize]) Pizza's")
                    Text("Your total Price  \(totalPrice)")
                    Text("Plus tips \(tip) ")
                    
                }
                
            }
        }
        
    }
}

#Preview {
    OrderPizzaView()
}
