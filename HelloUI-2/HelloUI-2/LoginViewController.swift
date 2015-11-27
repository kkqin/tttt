//
//  LoginViewController.swift
//  HelloUI-2
//
//  Created by Gatsby on 15/11/20.
//  Copyright © 2015年 Gatsby. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{//
    var lbName:UILabel!
    var lbPs:UILabel!
    var tfName:UITextField!
    var tfPs:UITextField!
    
    var btSignin:UIButton!
    var btRegist:UIButton!
    var btForgetPs:UIButton!
    
    var switch_Ps:UISwitch!//control password secure
    
    override func loadView() {
        super.loadView()
        
        var rect = CGRectMake(30, 200, 80, 30)
        rect.size.width = 100
        lbName = UILabel(frame:rect)
        
        lbPs = UILabel()
        rect.origin.y = 250
        lbPs.frame = rect
        
        tfName = UITextField(frame: CGRectMake(110, 200, 200, 30))
        tfPs = UITextField(frame: CGRectMake(110, 250, 200, 30))
        
        btSignin = UIButton(frame: CGRectMake(110, 300, 90, 30))
        btForgetPs = UIButton(frame: CGRectMake(103, 330, 150, 30))
        btRegist = UIButton(frame: CGRectMake(220, 300, 90, 30))
        
        switch_Ps = UISwitch()
        switch_Ps.frame.origin = CGPoint(x: 320, y: 250)
        
        self.view.addSubview(lbPs)
        self.view.addSubview(lbName)
        self.view.addSubview(tfName)
        self.view.addSubview(tfPs)
        self.view.addSubview(btSignin)
        self.view.addSubview(btForgetPs)
        self.view.addSubview(btRegist)
        self.view.addSubview(switch_Ps)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        lbName.text = "User"
        lbPs.text = "PassWord"
        lbName.textAlignment = NSTextAlignment.Left
        lbPs.textAlignment = NSTextAlignment.Left
        
        tfName.borderStyle = UITextBorderStyle.Line
        tfName.placeholder = "enter your username"
        tfName.returnKeyType = UIReturnKeyType.Done
        tfName.clearButtonMode = UITextFieldViewMode.WhileEditing
        
        tfPs.borderStyle = UITextBorderStyle.Line
        tfPs.placeholder = "enter your password"
        tfPs.returnKeyType = UIReturnKeyType.Done
        tfPs.clearButtonMode = UITextFieldViewMode.WhileEditing
        tfPs.secureTextEntry = true
        tfPs.delegate = self
        tfName.delegate = self
        
        btSignin.setTitle("SignIn", forState: UIControlState.Normal)//设置按钮标题与文字状态
        btRegist.setTitle("Regist", forState:UIControlState.Normal)
        btForgetPs.setTitle("ForgotPassword?", forState: UIControlState.Normal)
        
        btSignin.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btSignin.backgroundColor = UIColor.blueColor()
        //btSignin.enabled = false //和下面解锁按键函数使用, 已注释
        btSignin.addTarget(self, action: Selector("SignIn"), forControlEvents: UIControlEvents.TouchUpInside)
        btSignin.showsTouchWhenHighlighted = true;//使按键按下时有亮点出现
        
        switch_Ps.addTarget(self, action: Selector("switchDidChange"), forControlEvents: UIControlEvents.TouchUpInside)//添加按钮触摸事件
        
        btRegist.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btRegist.backgroundColor = UIColor.blueColor()
        btRegist.showsTouchWhenHighlighted = true;//使按键按下时有亮点出现
        
        btForgetPs.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK :SignIn
    func SignIn(){
        if (tfName.text!.isEmpty) || (tfPs.text!.isEmpty){
            let alertView  = UIAlertView(title: "Warning", message: "lack info", delegate: self, cancelButtonTitle: "ok")
            alertView.show()
        }
        
        
        else if tfName.text == "ok"{
            if tfPs.text == "123"{
                let alertView  = UIAlertView(title: "Message", message: "succeed", delegate: self, cancelButtonTitle: "ok")
                alertView.show()
            }else{
                let alertView  = UIAlertView(title: "Warning", message: "passwordWrong", delegate: self, cancelButtonTitle: "ok")
                alertView.show()
            }
        }else{
            let alertView  = UIAlertView(title: "Warning", message: "WrongEverthing", delegate: self, cancelButtonTitle: "ok")
            alertView.show()
        }
    }
    
    //MARK : Switch Password
    func switchDidChange(){
        if switch_Ps.on{
            tfPs.secureTextEntry = !true
        }else{
            tfPs.secureTextEntry = !false
        }
    }
    
    //MARK: delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        //keyborad disappear
        tfName.resignFirstResponder()
        tfPs.resignFirstResponder()
        return true
    }

//    func textFieldDidEndEditing(textField: UITextField) {
//        if (tfName.text!.isEmpty) || (tfPs.text!.isEmpty){
//            btSignin.enabled = false
//        }
//        else{
//            btSignin.enabled = true
//           // btSignin.backgroundColor = UIColor.greenColor()
//        }
//    }
//    用于解锁按键，已注释
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
