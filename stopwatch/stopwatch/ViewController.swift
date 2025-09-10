//
//  ViewController.swift
//  stopwatch
//
//  Created by SDC-USER on 05/08/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var timer: Timer?
    //var timer = Timer()
    var totalSeconds: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        updateLabel()
    }
    
    @objc func updateTimer() {
        totalSeconds += 1
        updateLabel()
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
    }
    @IBAction func resetButton(_ sender: UIButton) {
        stopButton(sender)
        totalSeconds = 0
        updateLabel()
    }
    func updateLabel () {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        minuteLabel.text = String(format: "%.2d", minutes)
        secondsLabel.text = String(format: "%.2d", seconds)
    }
}


