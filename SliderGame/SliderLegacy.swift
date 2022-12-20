//
//  SliderLegacy.swift
//  SliderGame
//
//  Created by Denis on 2022/12/20.
//

import Foundation
import SwiftUI

struct sliderLegacy: UIViewRepresentable {
    
    @Binding var currentValue: Int
    var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let uiSlider = UISlider()

        uiSlider.minimumValue = 0
        uiSlider.maximumValue = 100
        
        uiSlider.addTarget(
          context.coordinator,
          action: #selector(Coordinator.valueChanged),
          for: .valueChanged
        )
        return uiSlider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(currentValue), animated: true)
        uiView.alpha = CGFloat(computeScore()) / 100
    }
    
    func makeCoordinator() -> Coordinator {
      Coordinator(value: $currentValue)
    }
    
    private func computeScore() -> Int {
        100 - abs(targetValue - lround(Double(currentValue)))
    }
}

extension sliderLegacy {
    
    final class Coordinator: NSObject {
        
        @Binding var value: Int
        
        init(value: Binding<Int>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            self._value.wrappedValue = Int(sender.value)
        }
    }
}
