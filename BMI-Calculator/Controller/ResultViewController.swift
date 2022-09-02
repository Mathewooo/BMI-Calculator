import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    
    var v: String?
    var a: String?
    var c: UIColor?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if let v = v, let a = a, let c = c {
            bmiLabel.text = v
            suggestionLabel.text = a
            self.view.backgroundColor = c
        }
    }
    
    func setUI(v: String, a: String, c: UIColor) {
        self.v = v
        self.a = a
        self.c = c
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
