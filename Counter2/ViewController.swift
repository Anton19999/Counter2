//
//  ViewController.swift
//  Counter2
//
//  Created by Шмельцер Антон on 07.01.2025.
//

import UIKit

final class ViewController: UIViewController {
    private var counter: Int = 0
    private var counterString = "Значение счетчика: "
    @IBOutlet private var textViewTwo: [UITextView]!
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTextViews()
    }
    private func initializeTextViews() {
        for (_, textView) in textViewTwo.enumerated() {
                textView.text = "История изменений:\n"
                textView.isEditable = false
            }
        }
    private func getCurrentDateString() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yy HH:mm:ss "
            return formatter.string(from: Date())
        }
    private func addLineToTextViews(_ line: String) {
        let timestamp = getCurrentDateString()
        
            for textView in textViewTwo {
                textView.text += timestamp + line + "\n"
                scrollToBottom(textView)
            }
        }
  
    private func scrollToBottom(_ textView: UITextView) {
            let bottom = NSRange(location: textView.text.count - 1, length: 1)
            textView.scrollRangeToVisible(bottom)
        }
    
    @IBAction private func resetButton(_ sender: Any) {
        counter = 0
        labelOfCounter.text = "\(counterString) \(counter)"
        var newValue = " :значение сброшено"
        
        addLineToTextViews(newValue)
    }
    @IBOutlet private weak var labelOfCounter: UILabel!
    @IBAction private func plusButton(_ sender: Any) {
        counter += 1
        labelOfCounter.text = "\(counterString) \(counter)"
        var newValue = " :значение изменено на +1"
                addLineToTextViews(newValue)
    }
    @IBAction private func minusButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            var newValue = " :значение изменено на -1"
            
            addLineToTextViews(newValue)
        } else {
            counter = 0
            var newValue = " :попытка уменьшить значение счётчика ниже 0"
            
            addLineToTextViews(newValue)
        }
        labelOfCounter.text = "\(counterString) \(counter)"
    }
    
}

