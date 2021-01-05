//
//  imageViewController.swift
//  SlideshowApp
//
//  Created by 森ゆうり on 2021/01/03.
//  Copyright © 2021 yuuri.mori. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var bigImgView: UIImageView!
    
    // imageの番号
    var imgNo : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bigImgView.image = UIImage(named:"image\(imgNo).jpg")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
