//
//  ViewController.swift
//  BitCoinData
//
//  Created by Manuel Carvalho on 18/1/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, BitcoinDataManagerDelegate {
   
    var dataManager = BitcoinDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.delegate = self
        dataManager.fetchBitcoinData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func didUpdateBitcoin(prices: [String : Double]) {
        print("didUpdateBitcoin")
        print(prices)
    }


}

