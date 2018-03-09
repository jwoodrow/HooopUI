//
//  HooopCheckbox.swift
//  HOOOP
//
//  Created by James Woodrow on 26/01/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class HooopCheckbox: UIButton {
    
    // Images
    @IBInspectable var checkedImage:UIImage? = nil {
        didSet {
            decorate()
        }
    }
    @IBInspectable var uncheckedImage:UIImage? = nil {
        didSet {
            decorate()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(HooopCheckbox.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(HooopCheckbox.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
    }
    
    // Bool property
    @IBInspectable var isChecked: Bool = false {
        didSet{
            decorate()
        }
    }
    
    func decorate() {
        if isChecked {
            if (checkedImage != nil) {
                self.setImage(checkedImage, for: UIControlState.normal)
            }
        } else {
            if (uncheckedImage != nil) {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(HooopCheckbox.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
    }
    
    func buttonClicked(_ sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}

