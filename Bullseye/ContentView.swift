//
//  ContentView.swift
//  Bullseye
//
//  Created by Vivek Selvaraj on 12/02/20.
//  Copyright © 2020 Vivek Selvaraj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            Spacer()
            //Target Row
            HStack {
                Text("Target to Hit: ")
                Text("100")
            }
            Spacer()
            //Slider Row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            
            
            
            //Hit me Row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible){ () ->
                Alert in
                return Alert(title: Text("Hello"), message: Text("\(Int(self.sliderValue.rounded()))"), dismissButton: Alert.Button.default(Text("Okkkaaay")))
            }
            Spacer()
            //Third Row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score: ")
                Text("99999")
                Spacer()
                Text("Round: ")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

