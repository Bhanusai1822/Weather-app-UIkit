//
//  SecondVC.swift
//  weatherDemo
//
//  Created by Naidu, Kodidhela (Contractor) on 31/05/23.
//

import UIKit


class SecondVC: UIViewController {

    var weatherData :[WeatherList] = []
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    
    
    @IBOutlet weak var minL: UILabel!
    @IBOutlet weak var maxL: UILabel!
    @IBOutlet weak var visibilityL: UILabel!
   
    @IBOutlet weak var latL: UILabel!
    @IBOutlet weak var longL: UILabel!
    @IBOutlet weak var speedL: UILabel!
    
    @IBOutlet weak var tempL: UILabel!
    @IBOutlet weak var degL: UILabel!
    @IBOutlet weak var pressureL: UILabel!
    @IBOutlet weak var humidityL: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameL.text = weatherData[0].name
        let visible = weatherData[0].visibility / 1000
        visibilityL.text = "\(visible) km"
        tempL.text = "\(weatherData[0].main.temp) °C"
        speedL.text = "\(weatherData[0].wind.speed) km/hr"
       // let degree = weatherData[0].wind.deg /
        degL.text = "\(weatherData[0].wind.deg)"
        pressureL.text = "\(weatherData[0].main.pressure) hPa"
        humidityL.text = "\(weatherData[0].main.humidity)"
        latL.text = "\(weatherData[0].coord.lat) °"
        longL.text = "\(weatherData[0].coord.lon) °"
        minL.text = "\(weatherData[0].main.temp_min) °C"
        maxL.text = "\(weatherData[0].main.temp_max) °C"
   
        // Do any additional setup after loading the view.
    }
    
    
        
    
    
          
        
    
    

}
