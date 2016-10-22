//
//  ViewController.swift
//  汉堡按钮测试
//
//  Created by 叶俊中 on 2016/10/19.
//  Copyright © 2016年 叶俊中. All rights reserved.
//

import UIKit
import pop
class ViewController: UIViewController {
    var hamburgerOpen = true
    var hamburgerButton:EkoButton?
    var top:UIView?
    var middle:UIView?
    var bottom:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hamburgerButton = EkoButton()
        self.hamburgerButton?.backgroundColor = UIColor.black
        self.hamburgerButton?.frame = CGRect(x: self.view.bounds.size.width / 2 - 80, y: self.view.bounds.size.height / 2 - 80, width: 150, height: 150)
        self.hamburgerButton?.layer.cornerRadius = 75
        self.view.addSubview(hamburgerButton!)
        self.hamburgerButton?.addTarget(self, action: #selector(touch), for: .touchUpInside)
        let sectionWidth = CGFloat(80.0)
        let sectionHeight = CGFloat(10.0)
        top = UIView(frame: CGRect(x: self.hamburgerButton!.bounds.size.width / 2 - sectionWidth / 2, y: 40, width: sectionWidth, height: sectionHeight))
        top!.backgroundColor = UIColor.white
        top!.isUserInteractionEnabled = false
        top!.layer.cornerRadius = sectionHeight/2
        self.hamburgerButton?.addSubview(top!)
        middle = UIView(frame: CGRect(x: self.hamburgerButton!.bounds.size.width / 2 - sectionWidth / 2, y: 70, width: sectionWidth, height: sectionHeight))
        middle!.backgroundColor = UIColor.white
        middle!.isUserInteractionEnabled = false
        middle!.layer.cornerRadius = sectionHeight/2
        self.hamburgerButton?.addSubview(middle!)
        bottom = UIView(frame: CGRect(x: self.hamburgerButton!.bounds.size.width / 2 - sectionWidth / 2, y: 100, width: sectionWidth, height: sectionHeight))
        bottom!.backgroundColor = UIColor.white
        bottom!.isUserInteractionEnabled = false
        bottom!.layer.cornerRadius = sectionHeight/2
        self.hamburgerButton?.addSubview(bottom!)
        
        
        

    }
    func touch() {
        var topColor = self.top?.pop_animation(forKey: "topColor") as! POPSpringAnimation?
        var bottomColor = self.top?.pop_animation(forKey: "bottomColor") as! POPSpringAnimation?
        var topRotate = self.top?.pop_animation(forKey: "topRotate") as! POPSpringAnimation?
        var bottomRotate = self.top?.pop_animation(forKey: "bottomRotate") as! POPSpringAnimation?
        var topPosition = self.top?.pop_animation(forKey: "topPosition") as! POPSpringAnimation?
        var bottomPosition = self.top?.pop_animation(forKey: "bottomPosition") as! POPSpringAnimation?
        if hamburgerOpen{
            hamburgerOpen = false
            //隐藏中间
            UIView.animate(withDuration: 0.2, animations: { 
                self.middle?.alpha = 0
            })
            //上下变色
            if topColor != nil{
                topColor?.toValue = UIColor.red
            }else{
                topColor = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
                topColor?.toValue = UIColor.red
                topColor?.springBounciness = 0
                topColor?.springSpeed = 18
                top?.pop_add(topColor, forKey: "topColor")
            }
            if bottomColor != nil{
                bottomColor?.toValue = UIColor.red
            }else{
                bottomColor = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
                bottomColor?.toValue = UIColor.red
                bottomColor?.springBounciness = 0
                bottomColor?.springSpeed = 18
                bottom?.pop_add(bottomColor, forKey: "bottomColor")
            }
            //上下旋转
            if topRotate != nil{
                topRotate?.toValue = -M_PI / 4
            }else{
                topRotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
                topRotate?.toValue = -M_PI / 4
                topRotate?.springBounciness = 0
                topRotate?.springSpeed = 18
                top?.layer.pop_add(topRotate, forKey: "topRotate")
            }
            if bottomRotate != nil{
                bottomRotate?.toValue = M_PI / 4
            }else{
                bottomRotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
                bottomRotate?.toValue = M_PI / 4
                bottomRotate?.springBounciness = 0
                bottomRotate?.springSpeed = 18
                bottom?.layer.pop_add(bottomRotate, forKey: "bottomRotate")
            }
            //上下移动
            if topPosition != nil{
                topPosition?.toValue = 30
            }else{
                topPosition = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
                topPosition?.toValue = 30
                topPosition?.springBounciness = 0
                topPosition?.springSpeed = 18
                top?.layer.pop_add(topPosition, forKey: "topPosition")
            }
            if bottomPosition != nil{
                bottomPosition?.toValue = -30
            }else{
                bottomPosition = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
                bottomPosition?.toValue = -30
                bottomPosition?.springBounciness = 0
                bottomPosition?.springSpeed = 18
                bottom?.layer.pop_add(bottomPosition, forKey: "bottomPosition")
            }
        }else{
            hamburgerOpen = true
            //隐藏中间
            UIView.animate(withDuration: 0.2, animations: {
                self.middle?.alpha = 1
            })
            //上下变色
            if topColor != nil{
                topColor?.toValue = UIColor.white
            }else{
                topColor = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
                topColor?.toValue = UIColor.white
                topColor?.springBounciness = 0
                topColor?.springSpeed = 18
                top?.pop_add(topColor, forKey: "topColor")
            }
            if bottomColor != nil{
                bottomColor?.toValue = UIColor.white
            }else{
                bottomColor = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
                bottomColor?.toValue = UIColor.white
                bottomColor?.springBounciness = 0
                bottomColor?.springSpeed = 18
                bottom?.pop_add(bottomColor, forKey: "bottomColor")
            }
            //上下旋转
            if topRotate != nil{
                topRotate?.toValue = 0
            }else{
                topRotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
                topRotate?.toValue = 0
                topRotate?.springBounciness = 0
                topRotate?.springSpeed = 18
                top?.layer.pop_add(topRotate, forKey: "topRotate")
            }
            if bottomRotate != nil{
                bottomRotate?.toValue = 0
            }else{
                bottomRotate = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
                bottomRotate?.toValue = 0
                bottomRotate?.springBounciness = 0
                bottomRotate?.springSpeed = 18
                bottom?.layer.pop_add(bottomRotate, forKey: "bottomRotate")
            }
            //上下移动
            if topPosition != nil{
                topPosition?.toValue = 0
            }else{
                topPosition = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
                topPosition?.toValue = 0
                topPosition?.springBounciness = 0
                topPosition?.springSpeed = 18
                top?.layer.pop_add(topPosition, forKey: "topPosition")
            }
            if bottomPosition != nil{
                bottomPosition?.toValue = 0
            }else{
                bottomPosition = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
                bottomPosition?.toValue = 0
                bottomPosition?.springBounciness = 0
                bottomPosition?.springSpeed = 18
                bottom?.layer.pop_add(bottomPosition, forKey: "bottomPosition")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

