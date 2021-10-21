//
//  ViewController.swift
//  OmikujiApp
//
//  Created by arase shuwa on 2021/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var Label: UILabel!
    
    var timer = Timer()
    var count = Int()
    var imageArray = [UIImage]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        imageView.isHidden = true
        Label.text = "スタートボタンをおしてね！"
        startButton.layer.cornerRadius = 60.0
        stopButton.layer.cornerRadius = 60.0
        stopButton.isEnabled = false
        
        let attrText = NSMutableAttributedString(string: Label.text!)
        attrText.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: NSMakeRange(0, 4))
        Label.attributedText = attrText
        
    }
    
    
    @IBAction func start(_ sender: Any) {
        
        uranaiStart()
        startButton.isEnabled = false
        stopButton.isEnabled = true
        listButton.isHidden = true
        imageView.isHidden = false
        Label.text = "ストップボタンを押してね！"
        
        let attrText = NSMutableAttributedString(string: Label.text!)
        attrText.addAttribute(.foregroundColor, value: UIColor.red, range: NSMakeRange(0, 4))
        Label.attributedText = attrText
        
    }
    
    
    @IBAction func stop(_ sender: Any) {
        
        timer.invalidate()
        startButton.isEnabled = true
        stopButton.isEnabled = false
        listButton.isHidden = false
        Label.text = ""
        
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let ShareVC = segue.destination as? ShareViewController
        ShareVC?.resultImage = imageView.image!
        
    }
    
    
    func uranaiStart(){
        
        for i in 0...5{
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
            
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(timeUpDate), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func timeUpDate(){
        
        count = count + 1
        
        if count > 5{
            count = 0
            
        }
        
        imageView.image = imageArray[count]
        
    }
    
}
