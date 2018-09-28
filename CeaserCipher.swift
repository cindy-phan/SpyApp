import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ plaintext: String, secret: String) -> String?
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded += shiftedCharacter
        }
        
        return decoded
    }
}

struct Alphanumeric: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext.uppercased() {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            if (shiftedUnicode == 57){
                shiftedUnicode = shiftBy + 64
            }
            else if (shiftedUnicode == 90){
                shiftedUnicode = shiftBy + 47
            }
            else{
                shiftedUnicode = unicode + shiftBy
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded += shiftedCharacter
        }
        
        return encoded
    }
    
    func decode(_ encoded: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var plaintext = ""
        
        for character in encoded.uppercased() {
            let unicode = character.unicodeScalars.last!.value
            var shiftedUnicode = unicode - shiftBy
            while shiftedUnicode < 48 {
                shiftedUnicode += 43
            }
            if (shiftedUnicode > 57 && shiftedUnicode < 65) {
                shiftedUnicode -= 7
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            plaintext = plaintext + shiftedCharacter
        }
        
        return plaintext
    }
}

struct Atbash: Cipher{
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        
        for character in plaintext.lowercased() {
            let unicode = character.unicodeScalars.first!.value
            let characterUnicode = Int(Unicode.Scalar("z")!.value - (unicode - Unicode.Scalar("a")!.value))
            encoded += String(UnicodeScalar(UInt8(characterUnicode)))
        }
        
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        var decoded = ""
        
        for character in plaintext.lowercased() {
            let unicode = character.unicodeScalars.last!.value
            let characterUnicode = Int(Unicode.Scalar("z")!.value - (unicode - Unicode.Scalar("a")!.value))
            decoded += String(UnicodeScalar(UInt8(characterUnicode)))
        }
        
        return decoded
    }
}
struct Reverse: Cipher{
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext.lowercased() {
            
            let unicode = character.unicodeScalars.last!.value
            let shiftedUnicode = unicode + shiftBy
       //     let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            let i = 0
            while i >= 0{
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        var decoded = ""
        
        for character in plaintext.lowercased() {
            let unicode = character.unicodeScalars.first!.value
            let characterUnicode = Int(Unicode.Scalar("z")!.value - (unicode - Unicode.Scalar("a")!.value))
            decoded += String(UnicodeScalar(UInt8(characterUnicode)))
        }
        
        return decoded
    }
}


