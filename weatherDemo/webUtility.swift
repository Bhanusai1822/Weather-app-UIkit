//
//  webUtility.swift
//  weatherDemo
//
//  Created by Naidu, Kodidhela (Contractor) on 29/05/23.
//

import Foundation




struct WeatherList : Codable{
    var weather: [WeatherSub]
    var main : mainInfo
    var visibility :Int
    var wind: WindInfo
    var coord : coOrdinates
    var name : String
}
    
    struct WeatherSub : Codable{
        
        var main : String
        var icon : String
    }
    struct mainInfo : Codable{
        var temp : Double
        var temp_min : Double
        var temp_max : Double
        var humidity : Int
        var pressure : Int
    }
    struct WindInfo : Codable{
        var speed : Double
        var deg : Double
    }
   struct coOrdinates:Codable{
        var  lon : Double
        var lat : Double
    }



    struct webUtility{
        static let shared = webUtility()
        private init(){
            
        }
        
        
//        func downLoadIcon(icon:  ){
//            
//        }
        
        
        
        
        
        func geoWeather(lat : Double, long : Double, handler:@escaping([WeatherList]) ->Void){
            print("excuted: \(Thread.current.isMainThread)")
            
            let session = URLSession.shared
            //
            let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=dc8606b5294e9f24b042383e39d8ccaa&units=metric"
            //
            if let url = URL(string: weatherUrl){
            
            
               let task = session.dataTask(with: url){ urlData, resp, err in
                    
                    if err == nil{
//                        print("Request Successfull \(weatherUrl)")
//                        print("kkkkk")
//                        print(urlData?)
                        let statusCode = (resp as! HTTPURLResponse).statusCode
                        
                        switch statusCode{
                        case 200...299:
                            print("request successful")
                            let parseWeatherData = parseData(jsonResponse: urlData)
                            handler(parseWeatherData)
                        case 300...399:
                            print("Redirection")
                        case 400...499:
                            print("error")
                        case 500...599:
                            print("server error")
                        default:
                            print("unknown error")
                            
                            
                        }
                        
                        
                    }else{
                        print("request could not be completed")
                    }
                    
                }
                task.resume()
                
                }
            }
            
        func parseData(jsonResponse: Data?) ->[WeatherList]{
            guard let jresponse = jsonResponse else{
                return[]
            }
            do{
                let geoList = try JSONDecoder().decode(WeatherList.self, from: jresponse)
               
                return [geoList]
            }catch{
                print("\(error.localizedDescription)")
            }
            return[]
        }
    }

  



    
