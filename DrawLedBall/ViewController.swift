//
//  ViewController.swift
//  DrawLedBall
//
//  Created by techmaster on 1/6/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumber: UITextField!
    
    var ball = UIImageView()
    var viewShow = UIView()
    let marginTop: CGFloat = 70.0
    var marginLeading: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNumber.text = String(0)
    }
    
    func setBall() {
        ball = UIImageView(image: UIImage(named: "green"))
        viewShow.addSubview(ball)
    }
    
    @IBAction func btnDraw(_ sender: UIButton) {
        viewShow.removeFromSuperview()
        viewShow = UIView()
        view.addSubview(viewShow)
        let number: Int = (Int(tfNumber.text!))!
        if number >= 2{
            for index1 in 0..<number {
                for index2 in 0..<number {
                    setBall()
                    ball.center = CGPoint(x: marginLeading + spaceBetweenCol()*CGFloat(index2)/CGFloat(number - 1), y: marginTop + spaceBetweenRow()*CGFloat(index1)/CGFloat(number - 1))
                }
            }
        } else if number == 1 {
            setBall()
            ball.center = view.center
        }
    }
    
    func spaceBetweenCol() -> CGFloat {
        return view.bounds.size.width - 2*marginLeading
    }
    
    func spaceBetweenRow() -> CGFloat {
        return view.bounds.size.height - 2*marginTop
    }
}

