import UIKit
import Swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var label: UILabel!
    
    var numberFromScreen:Double = 0
    var firstNum:Double = 0
    var operation:Int = 0
    var mathSign:Bool = false
    
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
            && sender.tag != 11 && sender.tag != 12  && mathSign == false{
            
            firstNum = Double(label.text!)!
            
            if sender.tag == 16 {// деление
                label.text = "/";
            }
            else if sender.tag == 15 {// умножение
                label.text = "*";
            }
            else if sender.tag == 14 {// вычет
                label.text = "-";
            }
            else if sender.tag == 13 {// слож
                label.text = "+";
            }
            operation = sender.tag
            
            mathSign = true;
        }
        else if sender.tag == 12 {
            if operation == 16 {
                if numberFromScreen != 0 {
                    firstNum = firstNum / numberFromScreen
                    label.text = String(firstNum)
                }
                else {
                    label.text = ""
                }
            }
            else if operation == 15 {
                firstNum = firstNum * numberFromScreen
                label.text = String(firstNum)
            }
            else if operation == 14 {
                firstNum = firstNum - numberFromScreen
                label.text = String(firstNum)
            }
            else if operation == 13 {
                firstNum = firstNum + numberFromScreen
                label.text = String(firstNum)
            }
        }
        else if sender.tag == 10 {
            label.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
        else if sender.tag == 11 {
            numberFromScreen = Double(label.text!)!
            if numberFromScreen > 0 {
                label.text = "-" + String(numberFromScreen)
                numberFromScreen *= -1;
            }
            else if numberFromScreen < 0 {
                numberFromScreen *= -1
                label.text = String(numberFromScreen)
            }
        }
    }
}

