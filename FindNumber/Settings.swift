//
//  Settings.swift
//  FindNumber
//
//  Created by Kirill Gusev on 28.03.2023.
//

import Foundation


enum KeysUserDefaults{
    static let settingGame = "settingsGame"
    static let recordGame = "recordGame"
}



struct SettingsGame:Codable{
    var timerState:Bool
    var timeForGame:Int
}


class Settings {
    
    
    static var shared = Settings()
    
    private let defaultSettings = SettingsGame(timerState: true, timeForGame: 30)
    
    var currentSetting:SettingsGame{
        
        
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserDefaults.settingGame) as? Data{
                return try! PropertyListDecoder().decode(SettingsGame.self,from: data)
            }else{
                if let data = try? PropertyListEncoder().encode(defaultSettings){
                    UserDefaults.standard.set(data, forKey: KeysUserDefaults.settingGame)
                }
                return defaultSettings
            }
        }
        

        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                UserDefaults.standard.set(data, forKey: KeysUserDefaults.settingGame)
            }
        }
    }
    
    func resetSettings(){
        currentSetting = defaultSettings
    }
    
    
}
