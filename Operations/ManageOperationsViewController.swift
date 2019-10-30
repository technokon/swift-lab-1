//
//  ManageOperationsViewController.swift
//  Operations
//
//  Created by Emil Iakoupov on 2019-10-29.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

import UIKit

class ManageOperationsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var operationSigns = ["*", "+", "-", "/"]
    
    var selectedOperationSign = ""

    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedOperationSign = operationSigns[0]

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var onDone: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onDone(_ sender: Any) {
        // save data and go back
        
        let expression = firstNumber.text! + selectedOperationSign + secondNumber.text!;
        print("expression: \(expression)")
        let exp: NSExpression = NSExpression(format: expression)
        let result: Double = (exp.expressionValue(with: nil, context: nil) as! Double).rounded()
        let resultStr = String(format: "%.0f", result)
        let fullExpression = expression + "=" + resultStr
        print("result: \(fullExpression)")
        self.navigationController?.popViewController(animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return operationSigns.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return operationSigns[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedOperationSign = operationSigns[row]
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
