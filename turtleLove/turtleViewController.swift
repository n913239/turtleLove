//
//  turtleViewController.swift
//  turtleLove
//
//  Created by mikewang on 2017/8/1.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class turtleViewController: UIViewController {
    
    // 結果文字
    @IBOutlet weak var resultLabel: UILabel!
    // 結果圖片
    @IBOutlet weak var resultImage: UIImageView!
    // 飼料種類
    @IBOutlet weak var kindSegmented: UISegmentedControl!
    // 預算
    @IBOutlet weak var moneySegmented: UISegmentedControl!
    // 幫寵物洗香香
    @IBOutlet weak var haveBathSwitch: UISwitch!
    // 有時間
    @IBOutlet weak var haveTimeSwitch: UISwitch!
    // 有耐心
    @IBOutlet weak var havePatientSwitch: UISwitch!
    // 有愛心
    @IBOutlet weak var haveLoveSwitch: UISwitch!
    // 飼養數量標籤
    @IBOutlet weak var countLabel: UILabel!
    // 飼養數量
    @IBOutlet weak var countStepper: UIStepper!
    // 飼養地點
    @IBOutlet weak var placeSegmented: UISegmentedControl!
    // 年齡
    @IBOutlet weak var ageSlider: UISlider!
    // 年齡標籤
    @IBOutlet weak var ageLabel: UILabel!
    // 姓名文字輸入框
    @IBOutlet weak var nameTextField: UITextField!
    
    // 年齡改變
    @IBAction func ageAction(_ sender: Any) {
        // 將Sender轉型成UISlider or 傳入的時候指定型別為UISlider
        let currentValue = Int((sender as! UISlider).value)
        ageLabel.text = "\(currentValue)"
    }
    // 飼養數量改變
    @IBAction func countAction(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        countLabel.text = "\(currentValue)"
    }
    // 取得結果
    @IBAction func getResultAction(_ sender: Any) {
        // 取得地點：
        let placeIndex = placeSegmented.selectedSegmentIndex
        let place = placeSegmented.titleForSegment(at: placeIndex)
        // 取得預算
        let moneyIndex = moneySegmented.selectedSegmentIndex
        let money:Int = Int(moneySegmented.titleForSegment(at: moneyIndex)!)!
        
        // 適合養澤龜
        if money < 3000 {
            resultLabel.text = "密西西比地圖龜"
            resultImage.image = UIImage(named: "密西西比地圖龜P")
        }
        
        // 適合飼養箱龜 => 庭院,造景區 + 預算3000,5000
        if (place == "庭院" || place == "造景區") && money > 1000 {
            resultLabel.text = "太陽箱龜"
            resultImage.image = UIImage(named: "太陽箱龜P")
        }
        
        // 適合飼養陸龜 => 庭院 + 預算5000
        if place == "庭院" && money > 3000 {
            resultLabel.text = "輻射龜"
            resultImage.image = UIImage(named: "輻射龜P")
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
