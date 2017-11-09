import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let bundle = Bundle.main
//        let backgroundPath = bundle.path(forResource: "IMG_3981", ofType: "jpg")!
//        let backgroundUrl = URL(fileURLWithPath: backgroundPath)
        let backgroundImage = #imageLiteral(resourceName: "IMG_3981.jpg")
        let image = #imageLiteral(resourceName: "IMG_3982.jpg")
        
        imageView.image = BackgroundRemover().remove(background: backgroundImage, from: image)
    }

}
