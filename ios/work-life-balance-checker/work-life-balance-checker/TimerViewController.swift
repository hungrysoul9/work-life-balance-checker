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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func onTimerCallback() {
        let now = Date()
        let date = DateFormatter()
        date.locale = Locale(identifier: "ko_kr")
        date.timeZone = TimeZone(abbreviation: "KST") // "2018-03-21 18:07:27"
        date.dateFormat = "yyyy-MM-dd HH:mm:ss"

        _lbTime.text = date.string(from: now)
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
        _timer = Timer.scheduledTimer(
            timeInterval: 1
            , target: self
            , selector: #selector(onTimerCallback)
            , userInfo: nil
            , repeats: true)
    }
}
