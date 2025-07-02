//
//  ContentView.swift
//  QuickCalc
//
//  Created by 長橋和敏 on 2025/07/01.
//

import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    @State private var currentNumber: Double = 0
    @State private var previousNumber: Double = 0
    @State private var operation: String = ""
    @State private var isTypingNumber = false
    
    var body: some View {
        VStack(spacing: 1) {
            Spacer()
            
            // ディスプレイ部分
            HStack {
                Spacer()
                Text(display)
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, minHeight: 100)
            .background(Color.black)
            
            // ボタン部分
            VStack(spacing: 1) {
                // 1行目: C, ±, %, ÷
                HStack(spacing: 1) {
                    CalculatorButton(title: "C", color: .gray) {
                        clearAll()
                    }
                    CalculatorButton(title: "±", color: .gray) {
                        // 今回は実装しない
                    }
                    CalculatorButton(title: "%", color: .gray) {
                        // 今回は実装しない
                    }
                    CalculatorButton(title: "÷", color: .orange) {
                        setOperation("÷")
                    }
                }
                
                // 2行目: 7, 8, 9, ×
                HStack(spacing: 1) {
                    CalculatorButton(title: "7", color: .darkGray) {
                        numberPressed("7")
                    }
                    CalculatorButton(title: "8", color: .darkGray) {
                        numberPressed("8")
                    }
                    CalculatorButton(title: "9", color: .darkGray) {
                        numberPressed("9")
                    }
                    CalculatorButton(title: "×", color: .orange) {
                        setOperation("×")
                    }
                }
                
                // 3行目: 4, 5, 6, -
                HStack(spacing: 1) {
                    CalculatorButton(title: "4", color: .darkGray) {
                        numberPressed("4")
                    }
                    CalculatorButton(title: "5", color: .darkGray) {
                        numberPressed("5")
                    }
                    CalculatorButton(title: "6", color: .darkGray) {
                        numberPressed("6")
                    }
                    CalculatorButton(title: "-", color: .orange) {
                        setOperation("-")
                    }
                }
                
                // 4行目: 1, 2, 3, +
                HStack(spacing: 1) {
                    CalculatorButton(title: "1", color: .darkGray) {
                        numberPressed("1")
                    }
                    CalculatorButton(title: "2", color: .darkGray) {
                        numberPressed("2")
                    }
                    CalculatorButton(title: "3", color: .darkGray) {
                        numberPressed("3")
                    }
                    CalculatorButton(title: "+", color: .orange) {
                        setOperation("+")
                    }
                }
                
                // 5行目: 0, ., =
                HStack(spacing: 1) {
                    CalculatorButton(title: "0", color: .darkGray, isWide: true) {
                        numberPressed("0")
                    }
                    CalculatorButton(title: ".", color: .darkGray) {
                        numberPressed(".")
                    }
                    CalculatorButton(title: "=", color: .orange) {
                        calculate()
                    }
                }
            }
        }
        .background(Color.black)
        .ignoresSafeArea(.all)
    }
    
    // MARK: - Functions
    
    func numberPressed(_ number: String) {
        if isTypingNumber {
            display += number
        } else {
            display = number
            isTypingNumber = true
        }
    }
    
    func setOperation(_ op: String) {
        // Day 3-4で実装予定
        print("Operation set: \(op)")
    }
    
    func calculate() {
        // Day 3-4で実装予定
        print("Calculate pressed")
    }
    
    func clearAll() {
        display = "0"
        currentNumber = 0
        previousNumber = 0
        operation = ""
        isTypingNumber = false
    }
}

struct CalculatorButton: View {
    let title: String
    let color: Color
    var isWide: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: isWide ? 180 : 85, height: 85)
                .background(color)
        }
    }
}

// カスタムカラー
extension Color {
    static let darkGray = Color(red: 0.2, green: 0.2, blue: 0.2)
    static let gray = Color(red: 0.6, green: 0.6, blue: 0.6)
    static let orange = Color.orange
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
