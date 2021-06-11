//
//  ViewController.swift
//  macoswebauthn2
//
//  Created by Igor Okulist on 6/11/21.
//

import Cocoa
import AuthenticationServices


class ViewController: NSViewController,
                      ASWebAuthenticationPresentationContextProviding{
    private var authSession: ASWebAuthenticationSession?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func authenticateAction(_ sender: Any) {
        
        authenticate()
    }
    func authenticate()
    {
        let string = self.createWebAuthUrl()
        NSLog(string)
        guard let url = URL(string: string) else { return }
        
        let callbackScheme = "callback_scheme_tbd"
        
        self.authSession = ASWebAuthenticationSession(url: url, callbackURLScheme: callbackScheme, completionHandler:
                                                        {
                                                            url, error in
                                                            
                                                        })
        
        self.authSession!.presentationContextProvider = self
        
        self.authSession?.start()
    }
    
    fileprivate func createWebAuthUrl() -> String
    {
        
        // use https://chrome.google.com/webstore/detail/virtual-authenticators-ta/gafbpmlmeiikmhkhiapjlfjgdioafmja
        
        var url = String.init()
        
        url = "https://webauthn.io"
        return url
    }
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        print(session)
        return view.window!
    }
    
    
}

