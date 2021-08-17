//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Amanda Nolasco on 17/08/21.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijlmnopqrstuvwxyz"
    private let speciaCharacters = "!@#$%&*()_-+=`|]}[{:;?/<>.,"
    private let numbers = "0123456789"
    
    init(numberOfCharacters:Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        
        self.useSpecialCharacters = useSpecialCharacters
        self.useCapitalLetters = useCapitalLetters
        self.useNumbers = useNumbers
        self.useLetters = useLetters
        self.numberOfCharacters = numchars
    }
    
    func generatePasswords (total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = " "
        
        if useLetters{
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useCapitalLetters {
            
            universe += letters.uppercased()
        }
        
        if useSpecialCharacters {
            
            universe += speciaCharacters
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
              let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            
            passwords.append(password)
        }
        return passwords
    }
}
