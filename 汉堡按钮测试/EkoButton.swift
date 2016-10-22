//
//  EkoButton.swift
//  汉堡按钮测试
//
//  Created by 叶俊中 on 2016/10/19.
//  Copyright © 2016年 叶俊中. All rights reserved.
//

import UIKit
import pop
class EkoButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        var scale = self.pop_animation(forKey: "scale") as? POPSpringAnimation
        if scale != nil {
            scale?.toValue = NSValue(cgPoint:CGPoint(x: 0.8, y: 0.8))
        }else{
            scale = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            scale?.toValue = NSValue(cgPoint:CGPoint(x: 0.8, y: 0.8))
            scale?.springBounciness = 20
            scale?.springSpeed = 18
            self.pop_add(scale, forKey: "scale")
        }
        var rotate = self.pop_animation(forKey: "rotate") as? POPSpringAnimation
        if rotate != nil {
            rotate?.toValue = M_PI / 6
        }else{
            rotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
            rotate?.toValue = M_PI / 6
            rotate?.springBounciness = 20
            rotate?.springSpeed = 18
            self.layer.pop_add(rotate, forKey: "rotate")
        }
        
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        var scale = self.pop_animation(forKey: "scale") as? POPSpringAnimation
        if scale != nil {
            scale?.toValue = NSValue(cgPoint:CGPoint(x: 1, y: 1))
        }else{
            scale = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            scale?.toValue = NSValue(cgPoint:CGPoint(x: 1, y: 1))
            scale?.springBounciness = 20
            scale?.springSpeed = 18
            self.pop_add(scale, forKey: "scale")
        }
        var rotate = self.pop_animation(forKey: "rotate") as? POPSpringAnimation
        if rotate != nil {
            rotate?.toValue = 0
        }else{
            rotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
            rotate?.toValue = 0
            rotate?.springBounciness = 20
            rotate?.springSpeed = 18
            self.layer.pop_add(rotate, forKey: "rotate")
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
