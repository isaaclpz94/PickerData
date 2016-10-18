//
//  ViewController.swift
//  PickerData
//
//  Created by Isaac Mac on 30/9/16.
//  Copyright (c) 2016 Isaac Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    let pickerData = [["10\"","14\"","18\"","24\""],["Cheese","Pepperoni","Sausage","Veggie","BBQ Chicken"]]
    
    enum PickerComponent:Int{
        case size = 0
        case topping = 1
    }
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        myPicker.selectRow(2, inComponent: PickerComponent.size.rawValue, animated: false)
        updateLabel()
    }
    
    //MARK -Delgates and DataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }
    
    func updateLabel(){
        var sizeComponent = PickerComponent.size.rawValue
        let toppingComponent = PickerComponent.topping.rawValue
        let size = pickerData[sizeComponent][myPicker.selectedRowInComponent(sizeComponent)]
        let topping = pickerData[toppingComponent][myPicker.selectedRowInComponent(toppingComponent)]
        myLabel.text = "Pizza: " + size + " " + topping
    }
}

