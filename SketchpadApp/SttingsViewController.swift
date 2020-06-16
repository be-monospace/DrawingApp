//
//  SttingsViewController.swift
//  Sketchpad
//
//  Created by Beatriz Novais on 16/06/2020.
//  Copyright © 2020 Beatriz Novais. All rights reserved.
//

import UIKit

class SttingsViewController: UIViewController {
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //ACTIONS
    
    @IBAction func exitView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func brushSize(_ sender: Any) {
    }
    
    @IBAction func opacityLevel(_ sender: Any) {
    }
    
    @IBAction func redValue(_ sender: Any) {
    }
    
    @IBAction func greenValue(_ sender: Any) {
    }
    
    @IBAction func blueValue(_ sender: Any) {
    }
}
