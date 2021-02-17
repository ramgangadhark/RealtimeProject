//
//  SignUpViewController.swift
//  RealtimeProject
//
//  Created by Ram on 17/02/21.
//

import UIKit
import TextFieldEffects
import SkyFloatingLabelTextField
import Toast_Swift

class SignUpViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userNameTxtFld: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTxtFld: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTxtFld: SkyFloatingLabelTextField!
    @IBOutlet weak var mobileNoTxtFld: SkyFloatingLabelTextField!
    var returnValue:Bool = false
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let prefix = UILabel()
        prefix.font = prefix.font.withSize(20)
        prefix.text = "+1"
        // set font, color etc.
        prefix.frame = CGRect(x: 0, y: 10, width: 20, height: 20)
        prefix.sizeToFit()

        mobileNoTxtFld.leftView = prefix
        mobileNoTxtFld.leftViewMode = .always
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        
        userNameTxtFld.placeholder = "Name"
        userNameTxtFld.title = "Name"
        userNameTxtFld.tintColor = overcastBlueColor
        userNameTxtFld.selectedTitleColor = overcastBlueColor
        userNameTxtFld.selectedLineColor = overcastBlueColor
        
        
        emailTxtFld.placeholder = "Email"
        emailTxtFld.title = "Email"
        emailTxtFld.tintColor = overcastBlueColor
        emailTxtFld.selectedTitleColor = overcastBlueColor
        emailTxtFld.selectedLineColor = overcastBlueColor
       
        passwordTxtFld.placeholder = "Password"
        passwordTxtFld.title = "Password"
        passwordTxtFld.tintColor = overcastBlueColor
        passwordTxtFld.selectedTitleColor = overcastBlueColor
        passwordTxtFld.selectedLineColor = overcastBlueColor
        
        mobileNoTxtFld.placeholder = "     Phone Number"
        mobileNoTxtFld.title = "Phone Number"
        mobileNoTxtFld.tintColor = overcastBlueColor
        mobileNoTxtFld.selectedTitleColor = overcastBlueColor
        mobileNoTxtFld.selectedLineColor = overcastBlueColor
        
        signUpBtn.layer.cornerRadius = 10
        emailTxtFld.delegate = self
        mobileNoTxtFld.delegate = self
        passwordTxtFld.delegate = self
    }
    
    
    @IBAction func onTapOfSignUpBtn(_ sender: UIButton)
    {

//        let providedPassword = passwordTxtFld.text
//        let isPasswordValid = isValidPassword(password: providedPassword!)
//        if(isPasswordValid == true)
//        {
//            var style = ToastStyle()
//            style.messageColor = .green
//            style.backgroundColor = .white
//            self.view.makeToast("Password is Good", duration: 3.0, position: .top, style: style)
//
            let providedMobileNumber = mobileNoTxtFld.text
            let isMobileNumberValid = validateMobile(value: providedMobileNumber!)
            if(isMobileNumberValid == true)
            {
//                    var style = ToastStyle()
//                    style.messageColor = .green
//                    style.backgroundColor = .white
//                    self.view.makeToast("Mobile number is Valid", duration: 3.0, position: .top, style: style)
                print("Mobile number is Valid")

            }
            else
            {
                    var style = ToastStyle()
                    style.messageColor = .red
                    style.backgroundColor = .white
                    self.view.makeToast("Mobile number is not Valid", duration: 3.0, position: .top, style: style)
                print("Mobile number is not Valid")
        }
            
             
        }
//        else
//        {
//            var style = ToastStyle()
//            style.messageColor = .red
//            style.backgroundColor = .white
//            self.view.makeToast("Password must be minimum 8 characters long \n Minimum one Alphabet \n Minimum one Number", duration: 3.0, position: .top, style: style)
//
//
//        }
//    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //var rtrnVal:Bool = false
        if(textField == emailTxtFld)
        {
        let providedEmailAddress = emailTxtFld.text
        let isEmailAddressValid = isValidEmailAddress(emailStr: providedEmailAddress!)
        if isEmailAddressValid == true
        {
            var style = ToastStyle()
            style.messageColor = .green
            style.backgroundColor = .white
            self.view.makeToast("Email ID is Valid", duration: 3.0, position: .top, style: style)
            print("Email Id is Valid")
            returnValue = true

        } else
        {
            var style = ToastStyle()
            style.messageColor = .red
            style.backgroundColor = .white
            self.view.makeToast("Email ID is not Valid", duration: 3.0, position: .top, style: style)
            print("Email Id is not Valid")
            returnValue = false
        }
        }
        else if(textField == passwordTxtFld)
        {
            let providedPassword = passwordTxtFld.text
            let isPasswordValid = isValidPassword(password: providedPassword!)
            if(isPasswordValid == true)
            {
                var style = ToastStyle()
                style.messageColor = .green
                style.backgroundColor = .white
                self.view.makeToast("Password is Good", duration: 3.0, position: .top, style: style)
                
                 returnValue = true
            }
            else
            {
                var style = ToastStyle()
                style.messageColor = .red
                style.backgroundColor = .white
                self.view.makeToast("Password must be minimum 8 characters long \n Minimum one Alphabet \n Minimum one Number", duration: 3.0, position: .top, style: style)
                
                 returnValue = false
            }
        }
        return returnValue
    }
    
    // MARK: - Validation Methods
    //Validating mobile number
    func validateMobile(value: String) -> Bool
    {
        let PHONE_REGEX = "^[6-9]{1}[0-9]{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    //E-Mial Validation Method
    func isValidEmailAddress(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,9}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    func isValidPassword(password:String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        return passwordTest.evaluate(with: password)
        
    }
    
}
