var englishText = "this is a secret message".lowercased() //phrase which user can change

var secretMessage = ".... ..   -... ..- -. --. ---" //three spaces betwen words - user can change
var letterToMorse : [String : String] = [ //dictionary
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--.."
]


var morseText : String = ""

for element in englishText {
  if let morseChar = letterToMorse["\(element)"] {
    morseText = morseText + morseChar + " "
  } else {
    morseText += "   "
  }
}

print("Text to morse: \(morseText)") //Text to morse

var decodedMessage : String = ""
var morseCodeArray = [String]()
var currMorse : String = ""



for char in secretMessage {
  if char != " " {
    currMorse += ("\(char)")
  } else {
    switch currMorse {
      case "":
        currMorse = " "
      case " ":
        morseCodeArray.append(" ")
        currMorse = ""
      default:
        morseCodeArray.append(currMorse)
        currMorse = ""
    }
  }
}

morseCodeArray.append(currMorse)

var morseToLetter : [String : String] = [:]

for (letter, morseChar) in letterToMorse { //fils another dictionary with the values of the previous one becoming the keys for this one
  morseToLetter[morseChar] = letter
}

var counter = 1
for morseValue in morseCodeArray {
  if let letterChar = morseToLetter[morseValue]{
    if counter == 1{
       decodedMessage += letterChar.uppercased()
       counter = 0
    }else {
       decodedMessage += letterChar
    }
  } else {
    decodedMessage += " "
  }
}
print("Morse to text:  \(decodedMessage)") //Morse to text