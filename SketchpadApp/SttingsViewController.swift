//
//  SttingsViewController.swift
//  Sketchpad
//
//  Created by Beatriz Novais on 16/06/2020.
//  Copyright © 2020 Beatriz Novais. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    
    func settingsViewcontrollerFinihsed(_ settingsViewController: SettingsViewController)
    
}

class SettingsViewController: UIViewController {
    
    // Characteristics example image
    @IBOutlet weak var imageView: UIImageView!
    
    // Brush Size
    @IBOutlet weak var brushSizeLabel: UILabel!
    
    @IBOutlet weak var brushSizeSlider: UISlider!
    
    // Opacity Level
    @IBOutlet weak var opacityLevelLabel: UILabel!
    
    @IBOutlet weak var opacityLevelSlider: UISlider!
    
    // Color RGB Settings
    
    //red
    @IBOutlet weak var redColorSlider: UISlider!
    
    @IBOutlet weak var redColorLabel: UILabel!
   
    //green
    @IBOutlet weak var greenColorSlider: UISlider!
    
    @IBOutlet weak var greenColorLabel: UILabel!
    
    //blue
    @IBOutlet weak var blueColorSlider: UISlider!
    
    @IBOutlet weak var blueColorLabel: UILabel!
    
    //VARS
    var brushWidth: CGFloat = 40.0
    var opacity: CGFloat = 1.0
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.updatePreview()
        
        brushSizeLabel.text = String(format: "Brush Size: %.0f", brushWidth)
        brushSizeSlider.value = Float(brushWidth)
        
        opacityLevelLabel.text = String(format: "Opacity: %.1f", opacity)
        opacityLevelSlider.value = Float(opacity)
        
        redColorSlider.value = Float(red * 255)
        greenColorSlider.value = Float(green * 255)
        blueColorSlider.value = Float(blue * 255)
        
        redColorLabel.text = String(format: "%.0f/255", redColorSlider.value)
        greenColorLabel.text = String(format: "%.0f/255", greenColorSlider.value)
        blueColorLabel.text = String(format: "%.0f/255", blueColorSlider.value)
    }
    
    //ACTIONS
    
    @IBAction func exitView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
         //self.delegate?.settingsViewcontrollerFinihsed(self)
    }
    
    @IBAction func brushSize(_ sender: Any) {
        brushWidth = CGFloat(round(brushSizeSlider.value))
        brushSizeLabel.text = String(format: "Brush Size: %.0f", brushWidth)
        
        self.updatePreview()
    }
    
    @IBAction func opacityLevel(_ sender: Any) {
        opacity = CGFloat(opacityLevelSlider.value)
        opacityLevelLabel.text = String(format: "Opacity: %.1f", opacity)
        
        self.updatePreview()
    }
    
    @IBAction func redValue(_ sender: Any) {
        red = CGFloat(redColorSlider.value / 255)
        redColorLabel.text = String(format: "%.0f/255", redColorSlider.value)
        
        self.updatePreview()
    }
    
    @IBAction func greenValue(_ sender: Any) {
        green = CGFloat(greenColorSlider.value / 255)
        greenColorLabel.text = String(format: "%.0f/255", greenColorSlider.value)
        
        self.updatePreview()
    }
    
    @IBAction func blueValue(_ sender: Any) {
        blue = CGFloat(blueColorSlider.value / 255)
        blueColorLabel.text = String(format: "%.0f/255", blueColorSlider.value)
        
        self.updatePreview()
    }
    
    // UPDATE THE PREVIEW WITH SLIDER VALUES
    func updatePreview() {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushWidth)
        
        context?.setStrokeColor(red: red, green: green, blue: blue, alpha: opacity)
        
        context?.move(to: CGPoint(x: imageView.frame.width / 2, y: imageView.frame.height / 2))
        context?.addLine(to: CGPoint(x: imageView.frame.width / 2, y: imageView.frame.height / 2))
        
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
}
