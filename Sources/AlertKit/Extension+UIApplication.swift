//
//  Extension+UIApplication.swift
//  
//
//  Created by Wesley Calazans on 25/04/23.
//

import UIKit

extension UIApplication {
    public static func currentUIWindow() -> UIWindow? {
        let connetedScenes = UIApplication.shared.connectedScenes.filter({
            $0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
        
        let window = connetedScenes.first?.windows.first { $0.isKeyWindow }
        
        return window
    }
}
