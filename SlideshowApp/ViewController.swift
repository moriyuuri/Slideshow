//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 森ゆうり on 2021/01/03.
//  Copyright © 2021 yuuri.mori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    // 進むボタン
    @IBOutlet weak var nextButton: UIButton!
    // 戻るボタン
    @IBOutlet weak var backButton: UIButton!
    // 再生/停止ボタン
    @IBOutlet weak var startStopButton: UIButton!
    
    // ラベル
    let labelArray = ["函館","角島","銀山温泉","兼六園","倉敷","草津","鍋ヶ滝"]
    // タイマー
    var timer: Timer!
    // imageの番号
    var imgNo : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 初期表示
        // imgNoを「1」で宣言しているため、image1が表示
        setImageView(imgNo)
    }
    
    // 画像タップ
    @IBAction func tapImage(_ sender: Any) {
        // スライドショー再生時以外
        if self.timer == nil {
            // 画面遷移
            performSegue(withIdentifier: "imageTap",sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueのidentifierが "imageTap" の場合
        if segue.identifier == "imageTap" {
            // 遷移先取得
            let imageViewController:ImageViewController = segue.destination as! ImageViewController
            // image番号を渡す
            imageViewController.imgNo = self.imgNo
        }
    }

    // 進むボタン
    @IBAction func nextImage(_ sender: Any) {
        // 画像最後の場合
        if imgNo == 7 {
            imgNo = 1
        } else {
            imgNo += 1
        }
        setImageView(imgNo)
        //imageView.image = UIImage(named:"image\(imgNo).jpg")
    }
    
    // 戻るボタン
    @IBAction func backImage(_ sender: Any) {
        // 画像最初の場合
        if imgNo == 1 {
            imgNo = 7
        } else {
            imgNo -= 1
        }
        setImageView(imgNo)
        //imageView.image = UIImage(named:"image\(imgNo).jpg")
    }
    
    // 再生/停止ボタン
    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil {
            // 2秒毎に進むボタンの処理呼び出し
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextImage(_:)), userInfo: nil, repeats: true)
            
            // 進む、戻るボタン不可
            nextButton.isEnabled = false
            backButton.isEnabled = false
            // ボタン名を「停止」に変更
            startStopButton.setTitle("停止", for: .normal)
            
        } else {
            // タイマー停止
            self.timer.invalidate()
            // 初期化
            self.timer = nil
            // 進む、戻るボタン有効
            nextButton.isEnabled = true
            backButton.isEnabled = true
            // ボタン名を「再生」に変更
            startStopButton.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        setImageView(imgNo)
    }
    
    // 引数をもとにimageViewに設定する関数
    func setImageView (_ imgNo: Int) {
        imageView.image = UIImage(named:"image\(imgNo).jpg")
        label.text = "\(imgNo) : \(labelArray[imgNo-1])"
    }
}

