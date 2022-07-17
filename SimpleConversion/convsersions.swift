//
//  convsersions.swift
//  SimpleConversion
//
//  Created by Jonathan  Wessel on 7/9/22.
//

import Foundation

func convertTemp(from input: String, to output: String, units degrees: Double) -> Double {
    if input == output {
        return degrees
    }
    switch input {
    case "Celcius":
        if output == "Kelvin" {
            return degrees + 273.15
        }
        return (9.0/5)*degrees+32
    case "Fahrenheit":
        if output == "Kelvin" {
            return (degrees-32) * 5.0/9.0 + 273.15
        }
        return (degrees-32) * 5.0/9.0
    case "Kelvin":
        if output == "Celcius" {
            return degrees - 273.15
        }
        return (degrees-273.15) * 9.0/5 + 32
    default:
        return degrees
    }
}

func convertTime(from input: String, to output: String, units: Double) -> Double {
    var seconds = 0.0
    if input == output {
        return units
    }
    if input != "Seconds"{
        if input == "Minutes"{
            seconds = units*60
        } else if input == "Hours"{
            seconds = units*60*60
        } else {
            seconds = units*60*60*24
        }
    } else {
        seconds = units
    }
    if output == "Seconds" {
        return seconds
    } else if output == "Minutes" {
        return seconds/60
    } else if output == "Hours" {
        return (seconds/60)/60
    } else { //days
        return ((seconds/60)/60)/24
    }
}

func convertVolume(from input: String, to output: String, units: Double) -> Double {
    var milliliters = 0.0
    if input == output {
        return units
    }
    if input != "Milliliters"{
        if input == "Liters"{
            milliliters = units*1000
        } else if input == "Cups"{
            milliliters = units*240
        } else if input == "Pints"{
            milliliters = units*473.176
        } else { //gallons
            milliliters = units*3785.40800010238
        }
    } else {
        milliliters = units
    }
    if output == "Milliliters" {
        return milliliters
    } else if output == "Liters" {
        return milliliters/1000
    } else if output == "Cups" {
        return milliliters/240
    } else if output == "Pints" {
        return milliliters/473.2
    } else { //gallons
        return milliliters/3785
    }
}

func convertLength(from input: String, to output: String, units: Double) -> Double {
    var meters = 0.0
    if input == output {
        return units
    }
    if input != "Meters"{
        if input == "Kilometers"{
            meters = units*(1/0.001)
        } else if input == "Feet"{
            meters = units/3.281
        } else if input == "Yards"{
            meters = units/1.094
        } else { //miles
            meters = units*1609
        }
    } else {
        meters = units
    }
    if output == "Meters" {
        return meters
    } else if output == "Kilometers" {
        return meters/1000
    } else if output == "Feet" {
        return meters/0.3048
    } else if output == "Yards" {
        return meters/0.9144
    } else { //miles
        return meters/1609
    }
}
