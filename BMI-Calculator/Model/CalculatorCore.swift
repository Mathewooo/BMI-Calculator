import Foundation
import UIKit

struct CalculatorCore {
    var height: Float?
    var weight: Int?
    var bmi: BMI?
    
    mutating func calculateBMI() {
        if let height = height, let weight = weight {
            let bmi: Float = Float(weight) / powf(height, 2)
            var adviceAndColor: (String, UIColor)?
            adviceAndColor = pickSuggestion(bmi: bmi)
            if let adviceAndColor = adviceAndColor {
                self.bmi = BMI(value: bmi, advice: adviceAndColor.0, color: adviceAndColor.1)
            }
        }
    }
    
    func pickSuggestion(bmi: Float) -> (String, UIColor)? {
        var adviceAndColor: (String, UIColor)?
        switch bmi {
            case ..<18.5:
                adviceAndColor = ("Mal by si viac jesť! ⬆️", .lightGray)
            case 18.5...24.9:
                adviceAndColor = ("Si na pohodu. ⚡️", .green)
            case 25...29.9:
                adviceAndColor = ("Mal by si zlepšiť tvoju stravu.. 💥", .orange)
            case let n where n > 30:
                adviceAndColor = ("Mal by si si ísť okamžite zabehať! 💥", .red)
            default: break
        }
        return adviceAndColor
    }
    
    func getBMI() -> String {
        let value: String = String(format: "%.1f", bmi?.value ?? "0.0")
        return value
    }
    
    func getAdvice() -> String {
        let value: String = bmi?.advice ?? "No suggestion."
        return value
    }
    
    func getColor() -> UIColor {
        let value: UIColor = bmi?.color ?? .white
        return value
    }
    
    mutating func setHeight(n: Float) {
        height = n
    }
    
    mutating func setWeight(n: Int) {
        weight = n
    }
    
    func getHeight() -> Float? {
        height!
    }
    
    func getWeight() -> Int? {
        weight!
    }
}
