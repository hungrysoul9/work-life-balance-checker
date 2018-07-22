//
//  TimerViewController
//  work-life-balance-checker
//
//  Created by 문희대 on 2018. 7. 12..
//  Copyright © 2018년 문희대. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var _lbTime: UILabel!
    var _timer: Timer? = nil
    var _startDateTime: Date? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func onTimerCallback() {
        let now = Date()
        let interval = now.timeIntervalSince(_startDateTime!)
        _lbTime.text = String(interval)
    }

    @IBAction func onClickTimerBtn(_ sender: UIButton) {
        if let timer = _timer {
            if timer.isValid {
                timer.invalidate()
                sender.setTitle("출근", for: .normal)
                return
            }
        }
        
        sender.setTitle("퇴근", for: .normal)
        _startDateTime = Date()
        _timer = Timer.scheduledTimer(
            timeInterval: 1
            , target: self
            , selector: #selector(onTimerCallback)
            , userInfo: nil
            , repeats: true)
    }
}
