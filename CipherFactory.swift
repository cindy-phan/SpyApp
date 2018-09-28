import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphanumeric": Alphanumeric(),
        "Atbash": Atbash(),
        "Reverse": Reverse()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
