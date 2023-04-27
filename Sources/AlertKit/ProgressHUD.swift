//
//  ProgressHUD.swift
//  
//
//  Created by Wesley Calazans on 25/04/23.
//

import UIKit
import ProductKit

public class ProgressHUD {
    public let overlayView = UIView()
    public let activityIndicator = UIActivityIndicatorView()
    
    public class var shared: ProgressHUD {
        struct Static {
            static let instance: ProgressHUD = ProgressHUD()
        }
        
        return Static.instance
    }
    
    public init() {
        initViewCode()
    }
    
    public let isKeyWindow = Array(UIApplication.shared.connectedScenes)
        .compactMap {$0 as? UIWindowScene }
        .flatMap { $0.windows}
        .first (where: {$0.isKeyWindow})
    
    public func show() {
        if var topController = isKeyWindow?.rootViewController {
            while let presentedController = topController.presentedViewController {
                topController = presentedController
            }
            show(in: topController.view)
        }
    }
    
    public func show(in view: UIView) {
        overlayView.center = view.center
        view.addSubview(overlayView)
        activityIndicator.startAnimating()
    }
    
    public func hide() {
        activityIndicator.startAnimating()
        overlayView.removeFromSuperview()
    }
    
}

extension ProgressHUD: ViewCode {
    
    public func configureSubViews() {
        self.overlayView.addSubview(activityIndicator)
    }
    
    public func configureAdditionalBehaviors() {
        overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        overlayView.backgroundColor = .tertiarySystemFill
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.layer.zPosition = 1
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = CGPoint(x: self.overlayView.bounds.width / 2, y: self.overlayView.bounds.height / 2)
        activityIndicator.style = UIActivityIndicatorView.Style.large
    }
    
    public func configureConstraints() { }
    
    public func configureAccessibility() { }
    
}
