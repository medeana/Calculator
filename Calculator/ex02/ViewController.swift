import UIKit
import Swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBOutlet weak var label: UILabel!
    var numberFromScreen:Double = 0;
    var firstNum:Double = 0;
    var operation:Int = 0;
    var mathSign:Bool = false;
    
    @IBAction func digits(_ sender: UIButton) {
        
        if mathSign == true {
            label.text = String(sender.tag)
            mathSign = false
        }
        else {
            label.text = label.text! +  String(sender.tag)
        }
        numberFromScreen = Double(label.text!)!
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 10
            && sender.tag != 11 && sender.tag != 12 {
            
            firstNum = Double(label.text!)!
            
            if sender.tag == 16 { // деление
                label.text = "/";
            }
            else if sender.tag == 15 { // умножение
                label.text = "*";
            }
            else if sender.tag == 14 { // вычет
                label.text = "-";
            }
            else if sender.tag == 13 { // слож
                label.text = "+";
            }
            operation = sender.tag
            
            mathSign = true;
        }
        else if sender.tag == 12 {
            if operation == 16 {
                label.text = String(firstNum / numberFromScreen)
            }
            else if operation == 15 {
                label.text = String(firstNum * numberFromScreen)
            }
            else if operation == 14 {
                label.text = String(firstNum - numberFromScreen)
            }
            else if operation == 13 {
                label.text = String(firstNum + numberFromScreen)
            }
        }
        else if sender.tag == 10 {
            label.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0 
        }
    }
    
    
}

