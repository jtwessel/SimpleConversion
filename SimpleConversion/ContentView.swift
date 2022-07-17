//
//  ContentView.swift
//  SimpleConversion
//
//  Created by Jonathan  Wessel on 7/9/22.
//

// user selects input and output units
// user enters value
// conversion dispalys in output

// GOAL: make app so user can decide conversion type too (temp, length, volume, time)

import SwiftUI

struct ContentView: View {
    //types of conversions that can be made
    let conversionTypes = ["Temperature", "Length", "Time", "Volume"]
    let tempTypes = ["Celcius", "Fahrenheit", "Kelvin"]
    let lenTypes = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    let timeTypes = ["Seconds", "Minutes", "Hours", "Days"]
    let volumeTypes = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
    
    //initialized user input variables
    @State private var unitType = "Temperature"
    @State private var inputUnits = 100.0
    @State private var inputUnitIndex = "Celcius"
    @State private var outputUnitIndex = "Fahrenheit"
    
    //calculated results depending on conversion type (see: conversions.swift)
    var outputUnits: Double {
        if unitType == "Temperature" {
            return convertTemp(from: inputUnitIndex, to: outputUnitIndex, units: inputUnits)
        } else if unitType == "Length" {
            return convertLength(from: inputUnitIndex, to: outputUnitIndex, units: inputUnits)
        } else if unitType == "Time" {
            return convertTime(from: inputUnitIndex, to: outputUnitIndex, units: inputUnits)
        } else {
            return convertVolume(from: inputUnitIndex, to: outputUnitIndex, units: inputUnits)
        }
    }
    
    //yield conversion options based on user selected unit type
    var conversionOptions: [(String)] {
        let empty: [String] = []
        if unitType == "Temperature"{
            return tempTypes
        } else if unitType == "Length" {
            return lenTypes
        } else if unitType == "Time" {
            return timeTypes
        } else if unitType == "Volume" {
            return volumeTypes
        } else {
            return empty
        }
    }
        
    var body: some View {
        NavigationView {
                Form {
                    //user selects conversion type
                    Section {
                        Picker("Conversion Type", selection: $unitType, content: {
                            ForEach(conversionTypes, id: \.self) {type in
                                Text(type)
                            }
                        }) .pickerStyle(.menu)
                            .onChange(of: unitType, perform: { value in
                                inputUnitIndex = conversionOptions[0]
                                outputUnitIndex = conversionOptions[1]
                            })
                    } header: {
                        Text("What would you like to convert?")
                    }
                    
                    //user inputs number of units to convert
                    Section {
                        TextField("Enter Units", value: $inputUnits, format: .number)
                    } header: {
                        Text("Input amount")
                    }
                    
                    //user selects input type
                    Section {
                        Picker("Units", selection: $inputUnitIndex, content: {
                            ForEach(conversionOptions, id: \.self) { label in
                                Text(label)
                            }
                        }) .pickerStyle(.menu)
                    } header: {
                        Text("From")
                    }
                    
                    //user selects output type
                    Section {
                        Picker("Units", selection: $outputUnitIndex, content: {
                            ForEach(conversionOptions, id: \.self) { label in
                                Text(label)
                            }
                        }) .pickerStyle(.menu)
                    } header: {
                        Text("To")
                    }
                    
                    //output converted units
                    Section {
                        Text("\(outputUnits.formatted())")
                        //Text("\(String(format: "%.2f", outputUnits))")
                    } header: {
                        Text("Result")
                    }
                }
            .navigationTitle("MeasureConvertion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
