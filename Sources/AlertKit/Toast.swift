//
//  File.swift
//  
//
//  Created by Wesley Calazans on 25/04/23.
//

import UIKit
import ProductView

public class Toast {
    
    public class func show(message: String) {
        if var topController = UIApplication.currentUIWindow()?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            Toast.show(message: message, controller: topController)
        }
    }
    
    public class func show(message: String, controller: UIViewController) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.90)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 5
        toastContainer.clipsToBounds  =  true
        toastContainer.layer.shadowRadius = 5
        toastContainer.isUserInteractionEnabled = false
        
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.adjustsFontSizeToFitWidth = true
        toastLabel.clipsToBounds  =  true
        toastLabel.font = UIFont.systemFont(ofSize: 12)
        toastLabel.numberOfLines = 1
        toastLabel.text = message
        toastLabel.textAlignment = .left
        toastLabel.textColor = UIColor.white
        
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let sh = controller.view.safeAreaInsets.bottom/2
        
        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .leading, multiplier: 1, constant: Const.space)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -Const.space)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -Const.space)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .top, multiplier: 1, constant: Const.space)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal,
                                    toItem: controller.view, attribute: .leading, multiplier: 1, constant: Const.space/2)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal,
                                    toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -Const.space/2)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal,
                                    toItem: controller.view, attribute: .bottom, multiplier: 1, constant: Const.space*3)
        controller.view.addConstraints([c1, c2, c3])
        
        controller.view.layoutIfNeeded()
        
        c3.constant = -Const.space-sh
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            controller.view.layoutIfNeeded()
            toastContainer.alpha = 1.0
        }, completion: { _ in
            c3.constant = Const.space*3
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                controller.view.layoutIfNeeded()
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
    
    public class func showDefault(message: String, controller: UIViewController) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 16
        toastContainer.clipsToBounds  =  true
        
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.adjustsFontSizeToFitWidth = true
        toastLabel.clipsToBounds  =  true
        toastLabel.font = UIFont.systemFont(ofSize: 12)
        toastLabel.numberOfLines = 1
        toastLabel.text = message
        toastLabel.textAlignment = .center
        toastLabel.textColor = UIColor.white
        
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 8)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -8)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -8)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .top, multiplier: 1, constant: 8)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal,
                                    toItem: controller.view, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal,
                                    toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal,
                                    toItem: controller.view, attribute: .bottom, multiplier: 1, constant: -75)
        controller.view.addConstraints([c1, c2, c3])
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
    
    public class func showAlertWith(message: String, icon: String, iconColor: UIColor) {
        if var topController = UIApplication.currentUIWindow()?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            Toast.showAlertWith(message: message, controller: topController, icon: icon, iconColor: iconColor)
        }
    }
    
    public class func showAlertWith(message: String, controller: UIViewController, icon: String, iconColor: UIColor) {
        
        lazy var toastContainer = UIView(frame: CGRect())
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.backgroundColor = .black
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 8
        toastContainer.clipsToBounds  =  true
        toastContainer.layer.shadowRadius = 8
        toastContainer.isUserInteractionEnabled = false
        
        let img = UIImage(systemName: icon)?.withRenderingMode(.alwaysTemplate)
        lazy var toastImageView = UIImageView(image: img)
        toastImageView.tintColor = iconColor
        toastImageView.translatesAutoresizingMaskIntoConstraints = false
        toastImageView.clipsToBounds  =  true
        toastImageView.contentMode = .scaleAspectFit
        
        lazy var toastLabel = UILabel(frame: CGRect())
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.adjustsFontSizeToFitWidth = false
        toastLabel.clipsToBounds  =  true
        toastLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        toastLabel.numberOfLines = 0
        toastLabel.text = message
        toastLabel.textAlignment = .center
        toastLabel.textColor = .white
        
        toastContainer.addSubview(toastLabel)
        toastContainer.addSubview(toastImageView)
        controller.view.addSubview(toastContainer)
        
        NSLayoutConstraint.activate([
            toastContainer.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor),
            toastContainer.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            toastContainer.heightAnchor.constraint(equalToConstant: 150),
            toastContainer.widthAnchor.constraint(equalToConstant: 150),
            
            toastImageView.topAnchor.constraint(equalTo: toastContainer.topAnchor, constant: Const.space),
            toastImageView.centerXAnchor.constraint(equalTo: toastContainer.centerXAnchor),
            toastImageView.heightAnchor.constraint(equalToConstant: 70),
            toastImageView.widthAnchor.constraint(equalToConstant: 70),
            
            toastLabel.topAnchor.constraint(equalTo: toastImageView.bottomAnchor, constant: Const.space/2),
            toastLabel.leadingAnchor.constraint(equalTo: toastContainer.leadingAnchor, constant: Const.space),
            toastLabel.trailingAnchor.constraint(equalTo: toastContainer.trailingAnchor, constant: -Const.space),
            toastLabel.bottomAnchor.constraint(equalTo: toastContainer.bottomAnchor, constant: -Const.space),
        ])
        
        controller.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            controller.view.layoutIfNeeded()
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                controller.view.layoutIfNeeded()
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}
