//
//  ButtonForCalc.swift
//  Calculator
//
//  Created by Care Farrar on 1/20/21.
//

import UIKit

@IBDesignable
class ButtonForCalc: UIButton {
    override func prepareForInterfaceBuilder() {
        design()
    }

    override func awakeFromNib() {
        design()
    }
    
    func design() {
        layer.borderWidth = 5
        layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 0.2)
    }
}
