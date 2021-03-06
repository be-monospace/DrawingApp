//
//  ViewController.swift
//  SketchpadApp
//
//  Created by Beatriz Novais on 16/06/2020.
//  Copyright © 2020 Beatriz Novais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // VARS
    var swiped = false
    var lastPoint = CGPoint.zero
    var red: CGFloat = 40.0/255.0
    var green: CGFloat = 40.0/255.0
    
    var blue : CGFloat = 40.0/255.0
    var brushWidth: CGFloat = 5.0
    
    //var brushWidth: CGFloat = 40.0
    var opacity: CGFloat = 1.0
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- DRAWING FUNCTIONALITY
    
    //SCREEN TOUCHING CHARACTERISTICS
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first as UITouch? {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first as UITouch? {
            let currentPoint = touch.location(in: view)
            drawLine(lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(lastPoint, toPoint: lastPoint)
        }
        
        // new code
        UIGraphicsBeginImageContext(secondImage.frame.size)
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: CGBlendMode.normal, alpha: 1.0)
        secondImage.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: CGBlendMode.normal, alpha: opacity)
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        secondImage.image = nil
        
    }
    
    // LINE CHARACTERISTICS
    
    func drawLine(_ fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        secondImage.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushWidth)
        context?.setStrokeColor(red: red, green: green, blue: blue, alpha: opacity)
        context?.setBlendMode(CGBlendMode.normal)
        
        context?.strokePath()
        
        secondImage.image = UIGraphicsGetImageFromCurrentImageContext()
        secondImage.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    //MARK:- PRE-SET COLORS BUTTONS
    
    
    @IBAction func pinkPreset(_ sender: Any) {
        (red, green, blue) = (234.0/255.0, 145/255.0, 165/255.0)
    }
    
    @IBAction func greenPreset(_ sender: Any) {
        (red, green, blue) = (77.0/255.0, 168.0/255.0, 65.0/255.0)
    }
    
    @IBAction func bluePreset(_ sender: Any) {
        (red, green, blue) = (76.0/255.0, 145.0/255.0, 212.0/255.0)
    }
    
    @IBAction func redPreset(_ sender: Any) {
        (red, green, blue) = (237.0/255.0, 75.0/255.0, 62.0/255.0)
    }
    
    @IBAction func yellowPreset(_ sender: Any) {
        (red, green, blue) = (240.0/255.0, 207.0/255.0, 46.0/255.0)
    }
    
    @IBAction func blackPreset(_ sender: Any) {
        (red, green, blue) = (40.0/255.0, 40.0/255.0, 40.0/255.0)
    }
    
    //MARK:- DIFFERENT BRUSH WIDTHS
    
    
    @IBAction func penWidth(_ sender: Any) {
        brushWidth = 10.0
    }
    
    @IBAction func highlighterWidth(_ sender: Any) {
        brushWidth = 20
    }
    
    @IBAction func pencilWidth(_ sender: Any) {
        brushWidth = 6.0
    }
    
    @IBAction func ballPenWidth(_ sender: Any) {
        brushWidth = 15
    }
    
    //MARK:- RESET BUTTON
    
    @IBAction func resetButton(_ sender: Any) {
        imageView.image = nil
    }
    
    //NEW CODE
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        let settingsVC = segue.destination as! SettingsViewController
//        settingsVC.delegate = self
//        settingsVC.brushWidth = brushWidth
//        settingsVC.red = red
//        settingsVC.green = green
//        settingsVC.blue = blue
//        settingsVC.opacity = opacity
//        
//    }
    
    
    
    
    
    
    
    
    
}

//NEW CODE
extension ViewController: SettingsViewControllerDelegate {
    
    func settingsViewcontrollerFinihsed(_ settingsViewController: SettingsViewController) {
        
        self.brushWidth = settingsViewController.brushWidth
        self.red = settingsViewController.red
        self.green = settingsViewController.green
        self.blue = settingsViewController.blue
        self.opacity = settingsViewController.opacity
        
        //self.brushSize()
        
    }
    
    
}
