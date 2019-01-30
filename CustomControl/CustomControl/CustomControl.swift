//
//  CustomControl.swift
//  CustomControl
//
//  Created by Angel Buenrostro on 1/29/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var labelArray = [UILabel]()
    var value: Int = 1
    
    func updateValue(for touch: UITouch){
        let touchPoint = touch.location(in: self)
        
        for labels in labelArray {
            if labels.frame.contains(touchPoint){
                self.value = labels.tag
                if labels.textColor == componentActiveColor{
                    return
                }
                labels.textColor = componentActiveColor
                sendActions(for: .valueChanged)
            }
        }
    }
    
    private let componentDimension : CGFloat = 40.0
    private let componentCount : Int = 5
    private let componentActiveColor : UIColor = .black
    private let componentInactiveColor : UIColor = .gray
    
    required init?(coder aCoder: NSCoder){
        super.init(coder: aCoder)
        setUp()
        
    }
    
    func setUp(){
        
        
        
        
        var i = 0
        while i < 5 {
            let newLabel = UILabel()
            newLabel.tag = i+1
            let frame = CGRect(x: CGFloat(8 + (i * 40)), y: CGFloat(0), width: componentDimension, height: componentDimension)
            newLabel.frame = frame
            newLabel.font = UIFont.boldSystemFont(ofSize: 32)
            newLabel.text = "★"
            newLabel.textAlignment = .center
            newLabel.textColor = i == 0 ? componentActiveColor : componentInactiveColor
            labelArray.append(newLabel)
            self.addSubview(newLabel)
            i += 1
        }
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: .touchDown)
        updateValue(for: touch)
        print("begin tracking: touchdown")
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
            updateValue(for: touch)
            print("continue tracking: touchDragInside")
        } else {
            sendActions(for: .touchDragOutside)
            print("continue tracking: touchDragOutside")
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchUpInside)
            print("endTracking: touchUpInside")
        } else {
            sendActions(for: .touchUpOutside)
            print("endTracking: touchUpOutside")
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
}
