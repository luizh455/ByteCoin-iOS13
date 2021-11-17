//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
    func didUpdateCurrencyPicker(currency currencyLabel: String, value valueLabel: String) {
        DispatchQueue.main.async {
            
            self.currencyLabel.text = currencyLabel
            self.bitcoinLabel.text = valueLabel
        }
        
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = "error"
        }
    }
    

    
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var coinManager = CoinManager()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
            return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
    
    
   

    


    override func viewDidLoad() {
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

