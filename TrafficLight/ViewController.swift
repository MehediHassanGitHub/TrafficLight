/*
 
 Assignment: Trafic Light Tutorial App.
 Target Device : IPhone 8 Plus
 
 File: ViewController.swift
 Created by Mehedi Hassan on 9/12/17.
 Copyright © 2017 Mehedi Hassan. All rights reserved.

 
 **NOTES:

 This is a very simple app to explain the common colores that are used in a traffic light system.
 
 The app is very simple to use. The user have to tap on the light image to turn on each light and the description will appear accordingly.
 
 
 Possible Enhencement: To make the app more interactive a short quiz would improve the user experience. Also for kids a simple interactive game is suggested where the user can may have a start and stop button to control a moving car through some traffic lights and the user will be awarded if they can stop the car or start the car based on traffic light appears on the screen. This will help a kid to understand the light system.
 

 Refference:
 **The Original Traffic Light Image was copied from https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Traffic_lights_3_states.svg/1200px-Traffic_lights_3_states.svg.png and then edited for educational purpose only
 
 **The colour description are gathered from www.vicroads.com.au for educational purpose only.
*/

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgVwTrafficLight: UIImageView!
    @IBOutlet weak var btnLight: UIButton!
    
    @IBOutlet weak var lblTrafficLightShortDescription: UILabel!
    @IBOutlet weak var trafficLightDescriptionLabel: UILabel!
  
    
    
    /********************************************** Application Configuration Section ***************************************/
    
    var isAppStart: Bool = true
    
    let headerDescriptionAtStart = "HELLO"
    let LongDescriptionAtStart = "Tap on the Image below to turn on each light sequentially and learn the meaning of those colors in a traffic light system."
    
    //Set the default color state
    //0 for default, 1 for Green, 2 for Amber and 3 or Red
    var currentLightStateCode = 0 ;
    
    //Setting Image array to set background image of the image view accordig to color state
    var images  = [UIImage(named: "ImageStart"),UIImage(named: "ImageGreen"),UIImage(named: "ImageYellow"),UIImage(named: "ImageRed")]
    
    //Array to store color description to display them on screen
    var shortColorDescriptions = ["CONGRATULATION!!!", "GREEN TO GO", "AMBER TO WARN", "RED TO STOP"]
    var longColorDescriptions = ["You have Completed your Traffic Light Tutorial. You can tap the image to start again.",
                                     "The color green indicates that you can go through the intersection when it is safe to do so and there is room on the other side of the intersection.",
                                     "The color amber means the signal is about to change to red. You must stop unless you can't stop safely.",
                                     "The color red indicates you must stop and don't go into the intersection."]
    
    
    /********************************************** End Configuration Section ***************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //render default description for the first load
        showTrafficLight(imageIndex: currentLightStateCode, color: .white)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Event to execute on tapping on image
    @IBAction func btnPreas(_ sender: Any) {
        
        //setting up the color code state on each button press event
        //0 = start , 1 = green, 2 = yellow , 3 = red
        currentLightStateCode += 1
        currentLightStateCode = currentLightStateCode % 4
        
        //Display Traffic light color and description
        switch (currentLightStateCode){
            case 0: showTrafficLight(imageIndex: currentLightStateCode, color: .white)
            
            case 1: showTrafficLight(imageIndex: currentLightStateCode, color: .green)
                    
            case 2: showTrafficLight(imageIndex: currentLightStateCode, color: .orange)
            
            case 3: showTrafficLight(imageIndex: currentLightStateCode, color: .red)
            
            default: showTrafficLight(imageIndex: currentLightStateCode, color: .white)
        }
        
    }
    
    //This Function will change the traffic light color and description. This will take current color state, color as arguments.
    func showTrafficLight (imageIndex: Int, color: UIColor)
    {
        btnLight.layer.cornerRadius = 50
        //Set Label Description and color for Short description section
        
        lblTrafficLightShortDescription.textColor = color
        
        //set descriptions if application loaded for the first time or not
        
        lblTrafficLightShortDescription.text = isAppStart == true ? headerDescriptionAtStart : shortColorDescriptions[imageIndex]
        trafficLightDescriptionLabel.text = isAppStart ? LongDescriptionAtStart : longColorDescriptions[imageIndex]
        
        //set the value to false. so that from next tap the default description will not render
        isAppStart = false

        
        //Change image based on color code state
        imgVwTrafficLight.image = images[imageIndex]
        
        
    }
}

