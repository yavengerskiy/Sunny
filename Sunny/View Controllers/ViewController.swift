//
//  ViewController.swift
//  Sunny
//
//  Created by Beelab on 27/11/21.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] cityName in self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.onComplition = { [weak self]  currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
            
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "Tashkent")
    }
    
    func updateInterfaceWith(weather: CurrenWeather){
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatireString
            self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}


