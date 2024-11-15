//
//  ViewUnitTestView.swift
//  SwiftUIDemo
//
//  Created by MTPC-363 on 07/11/24.
//

import SwiftUI
import UIKit

struct ViewUnitTestView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ViewUnitTestView()
}

class CalculatorController: ObservableObject {
    @Published var firstNumber: String = ""
    @Published var secondNumber: String = ""
    @Published var result: Int = 0
    
    func calculateSum() {
        if let first = Int(firstNumber), let second = Int(secondNumber) {
            result = first + second
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Result", message: "The sum is \(result)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}


struct MyContentView: View {
    @ObservedObject var controller: CalculatorController
    
    var body: some View {
        VStack {
            TextField("First number", text: $controller.firstNumber)
                .padding()
            TextField("Second number", text: $controller.secondNumber)
                .padding()
            Button(action: controller.calculateSum) {
                Text("Calculate")
            }
        }
    }
}
