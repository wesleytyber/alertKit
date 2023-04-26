import UIKit

public class Alert: NSObject {
    
    public var controller: UIViewController
    
    public init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func getAlert(title: String?, message: String?, titleCancel: String?, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: titleCancel, style: .default) { action in
            completion?()
        }
        alertController.addAction(cancel)
        self.controller.present(alertController, animated: true)
    }
    
}
