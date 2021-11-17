//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrencyPicker(currency currencyLabel: String,value valueLabel: String)
    func didFailWithError(error:Error)
}


struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "406CD61E-817A-4006-A617-0BA9F9ECCC27"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice (for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print("error")
                    //self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    let coinData: CoinData = try! JSONDecoder().decode(CoinData.self, from: safeData)
                    print(coinData.rate)
                    self.delegate?.didUpdateCurrencyPicker(currency: coinData.asset_id_quote, value: String(format: "%.2f", coinData.rate))
                    
                }
            }
            task.resume()
        }
        
    }
    
   

    
}
