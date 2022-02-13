//
//  ContentView.swift
//  Biometric_SwiftUI
//
//  Created by Ahmed Fayeq on 11/02/2022.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @State private var isUnlocked = false
    
    var body: some View {
        VStack{
            if isUnlocked {
                Text("Unlocked")
            }else{
                Text("Locked")
            }
        }
        .onAppear(perform: authenticateUser)
    }
    
    func authenticateUser(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "we need to access your face Id"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){success, authenticationFailed in DispatchQueue.main.async {
                if success{
                    self.isUnlocked = true
                }else{
                }
            }
                
            }
        }else{
        // can not use this feature
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
