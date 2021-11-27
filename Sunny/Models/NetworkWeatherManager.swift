//
//  NetworkWeatherManager.swift
//  Sunny
//
//  Created by Beelab on 27/11/21.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//

import Foundation

struct NetworkWeatherManager {
    
    var onComplition: ((CurrenWeather) -> Void)?
    
    func fetchCurrentWeather(forCity city: String){
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let data = data {
                if let currentWeather = parseJSON(withData: data){
                    self.onComplition?(currentWeather)
                }
            }
        }.resume()
    }
    func parseJSON(withData data: Data) -> CurrenWeather?{
        let decoder = JSONDecoder()
        do {
            let currentWeatherDate = try decoder.decode(CurrenWeatherData.self, from: data)
            print(currentWeatherDate)
            guard let currentWeather = CurrenWeather(currenWeatherData: currentWeatherDate) else { return nil }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
