//
//  ViewController.swift
//  CarOptionsBrianW
//
//  Created by student on 2/11/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var options = ["Green", "Blue", "Gun Metal", "Pink"]
    
    // AVAudioPlayer instance to hold AVAudioPlayer instance
    var fog = AVAudioPlayer()
    var stan = AVAudioPlayer()
    var war = AVAudioPlayer()
    var train = AVAudioPlayer()
    var music = AVAudioPlayer()
    
    // get value of selected row
    lazy var selectedValue = options[pickerView.selectedRow(inComponent: 0)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fogHorn = Bundle.main.path(forResource: "fogHorn", ofType: "wav")
        let trainHorn = Bundle.main.path(forResource: "train", ofType: "wav")
        let standardHorn = Bundle.main.path(forResource: "standard", ofType: "wav")
        let wOw = Bundle.main.path(forResource: "warOfTheWorlds", ofType: "mp3")
        let musicHorn = Bundle.main.path(forResource: "musical", ofType: "wav")
        do {
            fog = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fogHorn!))
        }
        catch{
            print(error)
        }
        do {
            stan = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: standardHorn!))
        }
        catch{
            print(error)
        }
        do {
            train = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: trainHorn!))
        }
        catch{
            print(error)
        }
        do {
            war = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: wOw!))
        }
        catch{
            print(error)
        }
        do {
            music = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicHorn!))
        }
        catch{
            print(error)
        }
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBOutlet weak var stockImage: UIImageView!
    @IBOutlet weak var hardwareOverlay: UIImageView!
    @IBOutlet weak var wheelOverlay: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var segmentedOptions: UISegmentedControl!
    @IBOutlet weak var decalOverlay: UIImageView!
    
    // updates picker based on SegmentedControl choice
    @IBAction func featureChoice(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            options = ["Green", "Blue", "Gun Metal", "Pink"]
            pickerView.reloadAllComponents()
            break
        case 1:
            options = ["Chrome", "Copper", "Black"]
            pickerView.reloadAllComponents()
            break
        case 2:
            options = ["Red", "Standard", "Copper", "OversizeChrome"]
            pickerView.reloadAllComponents()
            break
        case 3:
            options = ["Fog Horn", "Train Horn", "Standard", "War of the Worlds", "Musical"]
            pickerView.reloadAllComponents()
            break
        case 4:
            options = ["Flames Decal", "Skull Decal", "Snakes Decal", "None"]
            pickerView.reloadAllComponents()
            break
        default:
            break
        }
    }
    
    // gets value of picker and updates images/sounds
    @IBAction func UpdateChoice(_ sender: UIButton) {
        
        selectedValue = options[pickerView.selectedRow(inComponent: 0)]
        
        switch segmentedOptions.selectedSegmentIndex {
        case 0:
            switch selectedValue {
            case "Green":
                stockImage.image = UIImage(named:"peterbiltGreen")
                stockImage.isHidden = false
                break
            case "Blue":
                stockImage.image = UIImage(named:"peterbiltBlue")
                stockImage.isHidden = false
                break
            case "Gun Metal":
                stockImage.image = UIImage(named:"peterbiltGunMetal")
                stockImage.isHidden = false
                break
            case "Pink":
                stockImage.image = UIImage(named:"peterbiltPink")
                stockImage.isHidden = false
                break
            default:
                stockImage.isHidden = true
                break
            }
            break
        case 1:
            switch selectedValue {
            case "Chrome":
                hardwareOverlay.isHidden = true
                break
            case "Copper":
                hardwareOverlay.image = UIImage(named: "copperHardware")
                hardwareOverlay.isHidden = false
                break
            case "Black":
                hardwareOverlay.image = UIImage(named: "blackHardware")
                hardwareOverlay.isHidden = false
                break
            default:
                hardwareOverlay.isHidden = true
                break
            }
            break
        case 2:
            switch selectedValue {
            case "Red":
                wheelOverlay.image = UIImage(named: "redRimOverlay")
                wheelOverlay.isHidden = false
                break
            case "Standard":
                wheelOverlay.isHidden = true
                break
            case "Copper":
                wheelOverlay.image = UIImage(named: "copperRimOverlay")
                wheelOverlay.isHidden = false
                break
            case "OversizeChrome":
                wheelOverlay.image = UIImage(named: "oversizeChrome")
                wheelOverlay.isHidden = false
                break
            default:
                wheelOverlay.isHidden = true
                break
            }
            break
            
            
        case 3:
            switch selectedValue {
            case "Fog Horn":
                fog.play()
                break
            case "Train Horn":
                train.play()
                break
            case "Standard":
                stan.play()
                break
            case "War of the Worlds":
                war.play()
                break
            case "Musical":
                music.play()
                break
            default:
                break
            }
            break
            
        case 4:
            switch selectedValue {
            case "Flames Decal":
                decalOverlay.isHidden = false
                decalOverlay.image = UIImage(named: "flamesDecal")
                break
            case "Skull Decal":
                decalOverlay.isHidden = false
                decalOverlay.image = UIImage(named: "skullsDecal")
                break
            case "Snakes Decal":
                decalOverlay.isHidden = false
                decalOverlay.image = UIImage(named: "snakesDecal")
                break
            case "None":
                decalOverlay.isHidden = true
                break
                
                
            default:
                break
            }
        default:
            break
            
        }
    }
    
    // Defines the number of components in the pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // Defines the number of rows in the pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    // Returns picker row values
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
}
