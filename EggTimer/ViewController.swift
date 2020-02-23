//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var Main_label: UILabel!
    @IBOutlet weak var timer_bar: UIProgressView!
    
    @IBAction func Egg_type(_ sender: UIButton) {
        type_Egg_chosen(type: sender.currentTitle!)
    }
    func type_Egg_chosen(type: String){
        let timings: [String:Int] = ["Soft":5,"Medium":8,"Hard":12]
        let init_str = "You have chosen"
        switch type{
            case "Soft":
                print(init_str+" Soft")
                break
            case "Medium":
                print(init_str+" Medium")
                break
            case "Hard":
                print(init_str+" Hard")
                break
            default:
                print("There was a problem with the type of egg you have chosen")
                break
        }
        print("Timer is starting to run")
        var time = Float(timings[type]!*60)
        let st_time = time
        var time_ratio:Float?
        var timer: Timer?
        Update_timer_bar(value: 0.0)
        timer = Timer.scheduledTimer(withTimeInterval: 15.0, repeats: true, block: { timer in
            time = self.countdown_timer(time: &time)
            print("You have \(time) remaining in \(st_time) : \(1.0 - time/st_time)!")
            
            time_ratio = 1.0 - time/st_time
            print(time_ratio!)
            self.Update_timer_bar(value: time_ratio ?? 0.0)
            if time == 0{
                 print("Your Eggs are done ! Enjoy !")
                timer.invalidate()
                self.Update_label(result: true)
                self.Update_timer_bar(value: 0.0)
            }
        })
        timer = nil
    }
    
    func countdown_timer(time: inout Float) -> Float{
        if time > 0{
            time -= 15.0
        }
        return time
    }
    
    func Update_timer_bar(value:Float){
        timer_bar.setProgress(value, animated: true)
    }
    
    func Update_label(result:Bool){
        if result{
            Main_label.text? = "The Eggs are cooked and ready ! ENJOY!!"
        }
        else{
            Main_label.text? = "How do you like your eggs?"
        }
    }

}
