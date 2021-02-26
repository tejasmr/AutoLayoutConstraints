//
//  ViewController.swift
//  AutoLayoutConstraints
//
//  Created by tezz on 25/02/21.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.text = "Title"
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .red
        
        self.view.addSubview(titleLabel)
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        /*
         the view is centered horizontally.
         the view is centered vertically.
         
         x is leading - left
         y is top
         
         xOffset is 0.0
         yOffset is 0.0
         */
        
        let x = AutoLayoutConstraints(subView: titleLabel, width: screenWidth / 3, height: screenHeight / 8, xOffset: 30, yOffset: 30, xCentered: false, yCentered: false, xLeading: false, yTop: true)
        x.setAutoConstraints(self)
    }


}

