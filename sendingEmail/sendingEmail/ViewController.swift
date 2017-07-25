//
//  ViewController.swift
//  sendingEmail
//
//  Created by Puneet on 25/07/17.
//  Copyright © 2017 PuneetGupta. All rights reserved.
//
import Foundation
import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBAction func sendButtonTapped(_ sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail(){
          self.present(mailComposeViewController, animated: true, completion: nil)
        }
        else{
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
       mailComposerVC.setToRecipients(["gupts.puneet@tftus.com"])
       mailComposerVC.setSubject("Sending you an in-app e-mail")
        mailComposerVC.setMessageBody("Sending an in-app e-mail nt so bad!!!", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert(){
        let sendMailErrorAlert = UIAlertView(title:"Could not send email", message:"Your device could not send email. please check email configuration and try again.", delegate:self, cancelButtonTitle:"Ok")
        sendMailErrorAlert.show()
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

