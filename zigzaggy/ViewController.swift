//
//  ViewController.swift
//  zigzaggy
//
//  Created by Naail Bhai on 6/17/16.
//  Copyright © 2016 Naail Bhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func Play(_ sender: AnyObject) {
        
        BallChange = true
        TapsValid = true
        self.GameOver.isHidden = true
        self.Ball.isHidden = false
        self.Scoreboard.isHidden = true
        self.Retry.isHidden=true
        
        self.Ball.center.x = 178.0
        self.Ball.center.y = 390.0
        
        self.p1.center = CGPoint(x: 175.0, y: 436.0)
        self.p2.center = CGPoint(x: 214.0, y: 407.0)
        
        timer = Timer.scheduledTimer(timeInterval: 0.045, target: self, selector: #selector(ViewController.movement) , userInfo: nil, repeats: true)
        
        self.p3.center = pillarPlacement(p2.center.x, y: p2.center.y)
        self.p4.center = pillarPlacement(p3.center.x, y: p3.center.y)
        self.p5.center = pillarPlacement(p4.center.x, y: p4.center.y)
        self.p6.center = pillarPlacement(p5.center.x, y: p5.center.y)
        self.p7.center = pillarPlacement(p6.center.x, y: p6.center.y)
        self.p8.center = pillarPlacement(p7.center.x, y: p7.center.y)
        self.p9.center = pillarPlacement(p8.center.x, y: p8.center.y)
        self.p10.center = pillarPlacement(p9.center.x, y: p9.center.y)
        
        self.p1.isHidden = false
        self.p2.isHidden = false
        self.p3.isHidden = false
        self.p4.isHidden = false // this area is what is seen when playing the game
        self.p5.isHidden = false
        self.p6.isHidden = false
        self.p7.isHidden = false
        self.p8.isHidden = false
        self.p9.isHidden = false
        self.p10.isHidden = false
        self.pt1.isHidden = false
        self.pt2.isHidden = false
        self.pt3.isHidden = false
        self.Logo.isHidden = true
        self.Play.isHidden = true
    }
    @IBAction func Retry(_ sender: AnyObject) {
    }
    @IBOutlet weak var p10: UIImageView!
    @IBOutlet weak var p9: UIImageView!
    @IBOutlet weak var p8: UIImageView!
    @IBOutlet weak var p7: UIImageView!
    @IBOutlet weak var p6: UIImageView!
    @IBOutlet weak var p5: UIImageView!
    @IBOutlet weak var p4: UIImageView!
    @IBOutlet weak var p3: UIImageView!
    @IBOutlet weak var p2: UIImageView!
    @IBOutlet weak var p1: UIImageView!
    @IBOutlet weak var pt3: UIImageView! //connecting the objects
    @IBOutlet weak var pt2: UIImageView!
    @IBOutlet weak var pt1: UIImageView!
    @IBOutlet weak var Play: UIButton!
    @IBOutlet weak var Scoreboard: UIImageView!
    @IBOutlet weak var Retry: UIButton!
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var GameOver: UIImageView!
    @IBOutlet weak var Ball: UIImageView!
    var timer = Timer()
    var TapsValid: Bool?
    var BallRight: Bool?
    var BallChange: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.GameOver.isHidden = true
        self.Ball.isHidden = true
        self.Scoreboard.isHidden = true
        self.Retry.isHidden=true
        self.p1.isHidden = true
        self.p2.isHidden = true
        self.p3.isHidden = true
        self.p4.isHidden = true
        self.p5.isHidden = true
        self.p6.isHidden = true   //menu items
        self.p7.isHidden = true
        self.p8.isHidden = true
        self.p9.isHidden = true
        self.p10.isHidden = true
        self.pt1.isHidden = true
        self.pt2.isHidden = true
        self.pt3.isHidden = true
        self.Logo.isHidden=false
        self.Play.isHidden = false
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if TapsValid == true{
            if BallRight == true{
                BallChange = false
            } else {
               BallChange = true
            }
        }
    }
    
    func movement() {
        
        if BallChange == false{
           BallRight = false
            
        }else{
            BallRight = true
        }
        if BallRight == true{
            Ball.center.x += 6.5
            Ball.center.y -= 0.5
        } else{
            Ball.center.x -= 6.5
            Ball.center.y -= 0.5
        }
        
        Ball.center.y += 0.5
        p1.center.y += 5
        p2.center.y += 5
        p3.center.y += 5
        p4.center.y += 5
        p5.center.y += 5
        p6.center.y += 5
        p7.center.y += 5
        p8.center.y += 5
        p9.center.y += 5
        p10.center.y += 5
    }
    
    func movePillarUp(_ floatx: CGFloat, floaty: CGFloat, pillarNumber:Int) -> CGPoint {
        let center = CGPoint(x: floatx, y: floaty)
        
//        if checkPillarPosition(floaty) == true{
//            switch(checkPillarPosition(floaty)){
//            case 1:
//                center = pillarPlacement(self.p10.center.x, y: self.p10.center.y)
//            break
//            case 2:
//                center = pillarPlacement(self.p1.center.x, y: self.p1.center.y)
//                break
//            case 3:
//                center = pillarPlacement(self.p2.center.x, y: self.p2.center.y)
//                break
//            case 4:
//                center = pillarPlacement(self.p3.center.x, y: self.p3.center.y)
//                break
//            case 5:
//                center = pillarPlacement(self.p4.center.x, y: self.p4.center.y)
//                break
//            case 6:
//                center = pillarPlacement(self.p5.center.x, y: self.p5.center.y)
//                break
//            case 7:
//                center = pillarPlacement(self.p6.center.x, y: self.p6.center.y)
//                break
//            case 8:
//                center = pillarPlacement(self.p7.center.x, y: self.p7.center.y)
//                break
//            case 9:
//                center = pillarPlacement(self.p8.center.x, y: self.p8.center.y)
//                break
//            case 10:
//                center = pillarPlacement(self.p9.center.x, y: self.p9.center.y)
//                break
//            default:
//                break
//            }
//            
        return center
        }
        
    
    func checkPillarPosition(_ y: CGFloat) -> (Bool){
        var low = false
        
        if (y > 720){
            low = true
        }
        return low
    }
    
    func pillarPlacement(_ x: CGFloat, y: CGFloat) -> CGPoint {
        var PillarNewX:CGFloat
        var PillarNewY:CGFloat
        
        let random: Int = Int(arc4random() % 2)
        if random == 1 {
        
        PillarNewX = x + 39
        PillarNewY = y - 29
        
            if PillarNewX >= 319 {
                
                PillarNewX = x - 40
                PillarNewY = y - 30
            }
        
        } else {
            
        PillarNewX = x - 40
        PillarNewY = y - 30
           
            if PillarNewX <= 17 {
                
                PillarNewX = x + 39
                PillarNewY = y - 29   //constraints on the zigzag
            }
        }
        let NewPillarCenter = CGPoint(x: PillarNewX, y: PillarNewY)
        
        return(NewPillarCenter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


