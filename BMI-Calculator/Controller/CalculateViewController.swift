import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorCore: CalculatorCore = CalculatorCore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorCore.setHeight(n: heightSlider.value)
        calculatorCore.setWeight(n: Int(weightSlider.value))
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        calculatorCore.setHeight(n: Float(String(format: "%.2f", sender.value))!)
        let height: Float? = calculatorCore.getHeight()
        if let height = height {
            heightLabel.text = "\(String(height))m"
        }
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        calculatorCore.setWeight(n: Int(sender.value))
        let weight: Int? = calculatorCore.getWeight()
        if let weight = weight {
            weightLabel.text = "\(String(weight))kg"
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorCore.calculateBMI()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationViewController: ResultViewController = segue.destination as! ResultViewController
            destinationViewController.setUI(v: calculatorCore.getBMI(), a: calculatorCore.getAdvice(), c: calculatorCore.getColor())
        }
    }
}

