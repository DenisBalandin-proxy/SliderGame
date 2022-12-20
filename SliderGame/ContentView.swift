//
//  ContentView.swift
//  SliderGame
//
//  Created by Denis on 2022/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var slider = Int.random(in: 0...100)
    @State private var showingAlert = false
    
    let targetValue = 80
    
    var body: some View {
        VStack {
            Text("Подвинте слайдер, как можно ближе к: 80")
            HStack {
                Text("0")
                sliderLegacy(
                    currentValue: $slider,
                    targetValue: targetValue
                )
                Text("100")
            }
            Button("SCORE") {
                showingAlert = true
            }
            .alert(slider.formatted(), isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        showingAlert.toggle()
                    }
                }
            Button("TO MIDDLE") {
                slider = 50
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
