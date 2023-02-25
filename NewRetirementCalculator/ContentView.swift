//
//  ContentView.swift
//  NewRetirementCalculator
//
//  Created by Albert on 25.02.23.
//

import SwiftUI
import AppCenter
import AppCenterCrashes

let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimum = .init(integerLiteral: 1)
    formatter.maximum = .init(integerLiteral: 65)
    formatter.generatesDecimalNumbers = false
    formatter.maximumFractionDigits = 0
    return formatter
}()
 
let numberFormatterFrac: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimum = .init(integerLiteral: 0)
    formatter.maximum = .init(integerLiteral: 1000000)
    formatter.generatesDecimalNumbers = true
    formatter.maximumFractionDigits = 2
    //formatter.alwaysShowsDecimalSeparator = true
    return formatter
}()


struct ContentView: View {
    @State private var monthInvest: Float = 300.0
    @State private var age: Int = 30
    @State private var retireAge: Int = 65
    @State private var interestRate: Float = 2.1
    @State private var currentInvest: Float = 100000.0
    @State private var result: String = ""
    @State private var hasCrashed: Bool = false
    var body: some View {
        VStack {
            Form {
                Section(header: Text("my Invest")) {
                    TextField("myInvest", value: $monthInvest, formatter: numberFormatterFrac)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("current age")){
                    TextField("current age", value: $age, formatter: numberFormatter)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("retirement age")){
                    TextField("current age", value: $retireAge, formatter: numberFormatter)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("interest rate")) {
                    TextField("interst rate", value: $interestRate, formatter: numberFormatterFrac)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("current Invest")) {
                    TextField("current invest", value: $currentInvest, formatter: numberFormatterFrac)
                        .keyboardType(.decimalPad)
                }
            }
            Button(action: {
                hasCrashed = Crashes.hasCrashedInLastSession
                result = "If you invest \(monthInvest) EUR every month for \(retireAge - age) years, and invest this money plus your current investment of \(currentInvest) EUR at an interest rate of \(interestRate)% you will have xxx EUR by your retirement age of \(retireAge)"
                //Crashes.generateTestCrash()
                }){
                    Text("Compute")
                        .foregroundColor(.green)
                        .font(.title)
                }
                .buttonStyle(.bordered)
                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                
                
            Text(hasCrashed ? "has crashed" : "\(result)")
                .frame(height: 150)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
