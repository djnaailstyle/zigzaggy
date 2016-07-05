//
//  ViewController.swift
//  zigzaggy
//
//  Created by Naail Bhai on 6/17/16.
//  Copyright © 2016 Naail Bhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func Play(sender: AnyObject) {
        
        BallChange = true
        TapsValid = true
        self.GameOver.hidden = true
        self.Ball.hidden = false
        self.Scoreboard.hidden = true
        self.Retry.hidden=true
        
        self.Ball.center.x = 178.0
        self.Ball.center.y = 390.0
        
        self.p1.center = CGPoint(x: 175.0, y: 436.0)
        self.p2.center = CGPoint(x: 214.0, y: 407.0)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.045, target: self, selector: Selector("movement") , userInfo: nil, repeats: true)
        
        self.p3.center = pillarPlacement(p2.center.x, y: p2.center.y)
        self.p4.center = pillarPlacement(p3.center.x, y: p3.center.y)
        self.p5.center = pillarPlacement(p4.center.x, y: p4.center.y)
        self.p6.center = pillarPlacement(p5.center.x, y: p5.center.y)
        self.p7.center = pillarPlacement(p6.center.x, y: p6.center.y)
        self.p8.center = pillarPlacement(p7.center.x, y: p7.center.y)
        self.p9.center = pillarPlacement(p8.center.x, y: p8.center.y)
        self.p10.center = pillarPlacement(p9.center.x, y: p9.center.y)
        
        self.p1.hidden = false
        self.p2.hidden = false
        self.p3.hidden = false
        self.p4.hidden = false // this area is what is seen when playing the game
        self.p5.hidden = false
        self.p6.hidden = false
        self.p7.hidden = false
        self.p8.hidden = false
        self.p9.hidden = false
        self.p10.hidden = false
        self.pt1.hidden = false
        self.pt2.hidden = false
        self.pt3.hidden = false
        self.Logo.hidden = true
        self.Play.hidden = true
    }
    @IBAction func Retry(sender: AnyObject) {
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
    var timer = NSTimer()
    var TapsValid: Bool?
    var BallRight: Bool?
    var BallChange: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.GameOver.hidden = true
        self.Ball.hidden = true
        self.Scoreboard.hidden = true
        self.Retry.hidden=true
        self.p1.hidden = true
        self.p2.hidden = true
        self.p3.hidden = true
        self.p4.hidden = true
        self.p5.hidden = true
        self.p6.hidden = true   //menu items
        self.p7.hidden = true
        self.p8.hidden = true
        self.p9.hidden = true
        self.p10.hidden = true
        self.pt1.hidden = true
        self.pt2.hidden = true
        self.pt3.hidden = true
        self.Logo.hidden=false
        self.Play.hidden = false
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
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
    
    func movePillarUp(floatx: CGFloat, floaty: CGFloat, pillarNumber:Int) -> CGPoint {
        var center = CGPointMake(floatx, floaty)
        
        if checkPillarPosition(floaty) == true{
            switch{
            case 1:
                center = pillarPlacement(self.p10.center.x, y: self.p10.center.y)
            break
            case 2:
                center = pillarPlacement(self.p1.center.x, y: self.p1.center.y)
                break
            case 3:
                center = pillarPlacement(self.p2.center.x, y: self.p2.center.y)
                break
            case 4:
                center = pillarPlacement(self.p3.center.x, y: self.p3.center.y)
                break
            case 5:
                center = pillarPlacement(self.p4.center.x, y: self.p4.center.y)
                break
            case 6:
                center = pillarPlacement(self.p5.center.x, y: self.p5.center.y)
                break
            case 7:
                center = pillarPlacement(self.p6.center.x, y: self.p6.center.y)
                break
            case 8:
                center = pillarPlacement(self.p7.center.x, y: self.p7.center.y)
                break
            case 9:
                center = pillarPlacement(self.p8.center.x, y: self.p8.center.y)
                break
            case 10:
                center = pillarPlacement(self.p9.center.x, y: self.p9.center.y)
                break
            default:
                break
            }
            
        }
        
        }
    func checkPillarPosition(y: CGFloat) -> (Bool){
        var low = false
        
        if (y > 720){
            low = true
        }
    }
    
    func pillarPlacement(x: CGFloat, y: CGFloat) -> CGPoint {
        var PillarNewX:CGFloat
        var PillarNewY:CGFloat
        
        var random: Int = Int(arc4random() % 2)
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
        var NewPillarCenter = CGPointMake(PillarNewX, PillarNewY)
        
        return(NewPillarCenter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


