//
//  ViewController.swift
//  Car Options
//
//  Created by Dominik Penkava on 9/16/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    // MARK: Initialized things
    
    var btn: UIButton?
    var img: UIImageView?
    var txtdesc: UITextView?
    var customizations: UITextView?
    
    var currentImg = "front"
    
    // MARK: on load
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // timer
        let _ = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true, block: {timer in
//            print(timer)
            self.btnClicked()
            
        })
        
        // get screen dimensions
        let screenWidth = view.frame.width
        let screenWidthCenter = screenWidth / 2
        let screenHeight = view.frame.height
        let screenHeightCenter = screenHeight / 2
        
        
        // create elements
        btn = {
            let btn = UIButton()
            btn.setAttributedTitle(NSAttributedString(string: "Customize", attributes: [.font: UIFont.boldSystemFont(ofSize: 20)]), for: .normal)
            btn.frame = CGRect(x: screenWidthCenter - 100, y: screenHeightCenter - 50, width: 200, height: 100)
            btn.backgroundColor = UIColor.lightGray
            btn.addTarget(self, action: #selector(openNewScene), for: .touchDown)
            return btn
        }()
        
        img = {
            let imgName = "front"
            let img = UIImage(named: imgName)
            let imgView = UIImageView(image: img)
            imgView.frame = CGRect(x: screenWidthCenter - 150, y: (screenHeightCenter - 100) - 250, width: 300, height: 200)
            
            return imgView
        }()
        
        txtdesc = {
            let txt = UITextView()
            txt.text = "placeholder images, would change with customizations"
            txt.backgroundColor = .clear
            txt.frame = CGRect(x: screenWidthCenter - 150, y: (screenHeightCenter - 60) - 250, width: 305, height: 30)
            return txt
        }()
        
        customizations = {
            let txt = UITextView()
            txt.text = """
List of Changes requested:

"""
            txt.backgroundColor = .clear
            txt.frame = CGRect(x: screenWidthCenter - 150, y: (screenHeightCenter - 15) + 100, width: 305, height: 200)
            return txt
        }()
        
        // add elements to view
        
        view.addSubview(btn!)
        view.addSubview(img!)
        view.addSubview(txtdesc!)
        view.addSubview(customizations!)

        
//        updateCustomizations(s: "example")
        
    }
    
    func updateCustomizations(s: String) {
        let stringCheese = """
List of Changes requested:

""" + s
        customizations?.text = stringCheese
    }
    
    @objc func btnClicked() {
        
        switch currentImg {
        case "front": setImg("frontRight")
        case "frontLeft": setImg("front")
        case "left": setImg("frontLeft")
        case "backLeft": setImg("left")
        case "back": setImg("backLeft")
        case "backRight": setImg("back")
        case "right": setImg("backRight")
        case "frontRight": setImg("right")
        default: return
        }
        
    }
    
    @objc func openNewScene() {
        
        let newVC = SecondViewController()
        self.present(newVC, animated: true)

    }
    
    func setImg(_ name: String) {
        img!.image = UIImage(named: name)
        currentImg = name
    }

}

#Preview {
    ViewController()
}
