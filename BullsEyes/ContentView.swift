//
//  ContentView.swift
//  BullsEyes
//
//  Created by daria on 23/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bulls eyes as close as you can:")
                Text("\(target)")
            }
            Spacer()
            // Slider row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            // Button row
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible){ () -> Alert in
                return Alert(title: Text("Hello there"), message: Text(
                    "The slider value is \(sliderValueRounded()).\n" +
                        "You scored \(pointsForCurrentRound()) points this round."
                ), dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            // Score row
            HStack {
                Button(action: {}) {
                    Text("Start over")
                }
                Spacer()
                Text("Score")
                Text("999999")
                Spacer()
                Text("Round")
                Text("99")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        100 - abs(target - sliderValueRounded())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
