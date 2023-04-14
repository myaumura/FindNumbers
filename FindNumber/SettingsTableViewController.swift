//  SettingsTableViewController.swift
//  FindNumber
//  Created by Kirill Gusev on 20.03.2023.

import UIKit

class SettingsTableViewController: UITableViewController {
    

    @IBOutlet weak var switchTimer: UISwitch!
    
    @IBOutlet weak var timeGameLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
    }
    
    
    @IBAction func changeTimerState(_ sender: UISwitch) {
        Settings.shared.currentSetting.timerState = sender.isOn
    }
    
    
    func loadSettings(){
        timeGameLabel.text = "\(Settings.shared.currentSetting.timeForGame) сек"
        switchTimer?.isOn = Settings.shared.currentSetting.timerState
    }
    
    @IBAction func resetSettings(_ sender: Any) {
        Settings.shared.resetSettings()
        loadSettings()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "selectTimeVC":
            if let vc = segue.destination as? SelectTimeViewController{
                vc.data = [10,20,30,40,50,60,70,80,90,100,110,120]
            }
        default:
            break
        }
    }
}
