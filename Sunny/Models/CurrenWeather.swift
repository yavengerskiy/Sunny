//
//  CurrenWeather.swift
//  Sunny
//
//  Created by Beelab on 27/11/21.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//

import Foundation

struct CurrenWeather{
    let cityName: String
    
    let temperature: Double
    var temperatireString: String{
        String(format: "%.0f", temperature)
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String{
        String(format: "%.0f", feelsLikeTemperature)
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    init?(currenWeatherData: CurrenWeatherData){
        cityName = currenWeatherData.name
        temperature = currenWeatherData.main.temp
        feelsLikeTemperature = currenWeatherData.main.feelsLike
        conditionCode = currenWeatherData.weather.first!.id
    }
}
