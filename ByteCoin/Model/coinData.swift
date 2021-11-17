//
//  coinData.swift
//  ByteCoin
//
//  Created by Luiz Silva on 16/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let rate: Double
    let asset_id_base: String
    let asset_id_quote: String
}
