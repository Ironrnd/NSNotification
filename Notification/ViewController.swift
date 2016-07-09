//
//  ViewController.swift
//  Notification
//
//  Created by Andrew Belozerov on 09.07.16.
//  Copyright © 2016 Andrew Iron. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let blueView = UIView(frame: CGRect(x: 20, y: 30, width: 70, height: 80))
    let greenView = UIView(frame: CGRect(x: 100, y: 30, width: 70, height: 80))
    let grayView = UIView(frame: CGRect(x: 180, y: 30, width: 70, height: 80))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blueView.backgroundColor = UIColor.blueColor()
        greenView.backgroundColor = UIColor.greenColor()
        grayView.backgroundColor = UIColor.grayColor()
        
        view.addSubview(blueView)
        view.addSubview(greenView)
        view.addSubview(grayView)
        
        let runButton = UIButton(frame: CGRect(x: 70, y: 180, width: 134, height: 26))
        runButton.setTitle("Запуск", forState: UIControlState.Normal)
        runButton.setTitleColor(UIColor.lightGrayColor(), forState: .Highlighted)
        runButton.backgroundColor = UIColor.orangeColor()
        runButton.layer.cornerRadius = 6
        
        
        runButton.addTarget(self, action: #selector(runActon), forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(runButton)
        
        // Добавим обозревателя для события нажатия на оранжевую кнопку
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notificationAction), name: "OrangeButtonTapped", object: nil)
        
        
        // Добавим обозревателя для события перехода приложения в фон
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplicationDidEnterBackgroundNotification, object: nil)


    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func runActon() {
        print("tap")
        NSNotificationCenter.defaultCenter().postNotificationName("OrangeButtonTapped", object: nil)
    }
    
    
    func notificationAction() {
        print("Наблюдатель увидел сообщение")
        UIView.animateWithDuration(1.5, delay: 0.0, options: .CurveEaseInOut, animations: {
            self.blueView.center = CGPoint(x: self.blueView.center.x + 160, y: self.blueView.center.y)
            self.greenView.center = CGPoint(x: self.greenView.center.x, y: self.greenView.center.y + 40)
            self.grayView.center = CGPoint(x: self.grayView.center.x - 160, y: self.grayView.center.y)
            }, completion: nil)
    }


    func appDidEnterBackground() {
        print("Приложение перешло в фон")
    }
}

