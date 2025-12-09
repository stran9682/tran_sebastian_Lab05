//
//  TempConverter.swift
//  tran_sebastian_Lab05
//
//  Created by Tran, Sebastian on 12/9/25.
//

import Foundation

enum scale {
    case fahrenheit
    case celcius
}

class TempConverter {
    
    var scale: scale = .fahrenheit
    
    var inputTemp : Double?
    
    var converetedTemp : Double? {
        if inputTemp == nil || inputTemp! < -270 {
            return nil
        }
        
        if scale == .fahrenheit {
            return (inputTemp! - 32) * 5 / 9
        }
        
        return inputTemp! * 9 / 5 + 32
    }
    
    func switchScale () {
        if scale == .fahrenheit {
            scale = .celcius
            return
        }
        
        scale = .fahrenheit
    }
}
