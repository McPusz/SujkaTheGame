//
//  ViewController.swift
//  Sujka The Game
//
//  Created by McPusz on 08/05/16.
//  Copyright © 2016 McPusz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var timerLabel : UILabel!
    
    var count = 0
    var seconds = 0
    var timer = NSTimer()
    
    @IBAction func buttonPressed(){ /* nacisniecie guzika */
        count += 1
        scoreLabel.text = "Score \n\(count)"
        
        NSLog("Button Pressed")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      assignbackground()
        setupGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func assignbackground(){    /* tlo */
        
        let background = UIImage(named: "background")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func setupGame(){   /* setting the game */
        seconds = 30
        count = 0
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
        timerLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \(count)"
        
    }
    
    func subtractTime(){    /* decrement seconds, update time, alert pop */
        seconds -= 1
        timerLabel.text = "Time: \(seconds)"
        
        if (seconds == 0){
            timer.invalidate()
            
            let alert = UIAlertController(title: "Starczy luju!", message: "Wypilas \(count) browcow. Dumna jestes z siebie?", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Nie ;____;", style:  UIAlertActionStyle.Default, handler : {
                action in self.setupGame()
            }))
            
            
            presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }
}

