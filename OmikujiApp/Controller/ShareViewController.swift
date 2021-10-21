//
//  ShareViewController.swift
//  OmikujiApp
//
//  Created by arase shuwa on 2021/10/22.
//

import UIKit
import Photos

class ShareViewController: UIViewController {
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    var resultImage = UIImage()
    var screenShotImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultImageView.image = resultImage
        resultLabel.adjustsFontSizeToFitWidth = true
        shareButton.layer.cornerRadius = 60.0
        againButton.layer.cornerRadius = 60.0
        
        
        switch resultImageView.image {
        
        case UIImage(named: "0"):
            resultLabel.text = "最高の一日になるでしょう\n😆"
            resultLabel.textColor = UIColor.systemRed
            backGroundImage.image = UIImage(named: "6")
            
        case UIImage(named: "1"):
            resultLabel.text = "とても良い一日になるでしょう\n😄"
            resultLabel.textColor = UIColor.systemRed
            backGroundImage.image = UIImage(named: "7")
            
        case UIImage(named: "2"):
            resultLabel.text = "良いことが起こるかも\n😀"
            resultLabel.textColor = UIColor.systemPink
            backGroundImage.image = UIImage(named: "8")
            
        case UIImage(named: "3"):
            resultLabel.text = "平凡な一日になるでしょう\n🙂"
            resultLabel.textColor = UIColor.black
            backGroundImage.image = UIImage(named: "9")
            
        case UIImage(named: "4"):
            resultLabel.text = "良くないことが起こるかも\n😢"
            resultLabel.textColor = UIColor.white
            backGroundImage.image = UIImage(named: "10")
            
        case UIImage(named: "5"):
            resultLabel.text = "最悪な一日になるかも\n😭"
            resultLabel.textColor = UIColor.white
            backGroundImage.image = UIImage(named: "11")
            
        default:
            break
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func share(_ sender: Any) {
        
        takeScreenShot()
        
        let items = [screenShotImage] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        present(activityVC, animated: true, completion: nil)
        
    }
    
    
    func takeScreenShot() {
        
        let width = CGFloat(UIScreen.main.bounds.size.width)
        let height = CGFloat(UIScreen.main.bounds.size.height)
        let size = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndPDFContext()
        
    }
    
    
    @IBAction func again(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
