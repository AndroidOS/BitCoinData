//
//  ViewController.swift
//  BitCoinData
//
//  Created by Manuel Carvalho on 18/1/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import Cocoa
import CoreData

class ViewController: NSViewController, BitcoinDataManagerDelegate {
   
    var dataManager = BitcoinDataManager()

   
    @IBOutlet weak var dataScrollView: NSScrollView!
    
    
    @IBOutlet var dataTextView: NSTextView!
    
    let context = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
        var labelText = ""
        for (date, value) in prices {
            //print("date is - \(date) and value is - \(value)\n")
            labelText += "date is - \(date) and value is - \(value)\n"
            var tmp = Price(context: context)
            tmp.date = date
            tmp.amount = value
            save()
        }
        //print(labelText)
         DispatchQueue.main.async {
            //textFieldOutlet.textStorage.mutableString.setString("Hello w0rld!")
            //self.dataScrollView
            self.dataTextView.string = labelText
        }
    }

    @IBAction func saveButton(_ sender: NSButton) {
        save()
    }
    
    @IBAction func loadButton(_ sender: NSButton) {
        print("download button pressed.")
    }
    
    func save(){
        do{
                   try context.save()
               } catch {
                   print("Error saving context \(error)")
               }
    }
    
}

