//
//  ViewController.swift
//  weatherDemo
//
//  Created by Naidu, Kodidhela (Contractor) on 29/05/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var currentL: UILabel!
    
    @IBOutlet weak var degL: UILabel!
    
    @IBOutlet weak var HumL: UILabel!
    
    @IBOutlet weak var speedL: UILabel!
    
    @IBOutlet weak var PressL: UILabel!
    
    
    @IBOutlet weak var temL: UILabel!
    
    
    @IBOutlet weak var visL: UILabel!
    
    @IBOutlet weak var maxTempL: UILabel!
    
    
    @IBOutlet weak var minTempL: UILabel!
    
    
    @IBOutlet weak var lonL: UILabel!
    
    
    @IBOutlet weak var laL: UILabel!
    
    var info : [WeatherList] = []
    @IBOutlet weak var textF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cLocation : CLLocation!
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways{
            cLocation = locManager.location
        }
        print(cLocation!)
        let lat:Double
        let long:Double
        lat = cLocation.coordinate.latitude
        long = cLocation.coordinate.longitude
        
        

        webUtility.shared.geoWeather(lat: lat, long: long) { weatherArray in
            DispatchQueue.main.async {
                self.currentL.text = "\(weatherArray[0].name)"
                self.degL.text = "\(weatherArray[0].wind.deg) °"
                let visible = weatherArray[0].visibility / 1000
                self.visL.text = "\(visible) km/hr "
                self.HumL.text = "\(weatherArray[0].main.humidity) %"
                self.PressL.text = "\(weatherArray[0].main.pressure) hpa"
                self.maxTempL.text = "\(weatherArray[0].main.temp_max) °C"
                self.minTempL.text = "\(weatherArray[0].main.temp_min) °C"
                self.temL.text = "\(weatherArray[0].main.temp) °C"
                self.laL.text = "\(weatherArray[0].coord.lat) °"
                self.lonL.text = "\(weatherArray[0].coord.lon) °"
                self.speedL.text = "\(weatherArray[0].wind.speed) km/hr"
            }
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func clickB(_ sender: Any) {
        
        let geoCoder = CLGeocoder()
        let geoName = textF.text ?? ""
        
        geoCoder.geocodeAddressString(geoName) { placeData, _ in
            
            let lat = placeData?[0].location?.coordinate.latitude
            let long = placeData?[0].location?.coordinate.longitude
            print(geoName)
            webUtility.shared.geoWeather(lat: lat ?? 0, long: long ?? 0) { weatherArray in
    
                
                DispatchQueue.main.async {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
                     vc.weatherData = weatherArray
                    self.present(vc, animated: true)
                }
                
            }
        }
        
      
        
        
        
    }
    
}

