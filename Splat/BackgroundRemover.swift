import UIKit
import CoreGraphics

class BackgroundRemover {
    func remove(background: UIImage, from image: UIImage) -> UIImage {
        let backgroundRef = background.cgImage!
        let imageRef = image.cgImage!

        // Dimensions
        let backgroundFrame = CGRect(x: 0, y: 0, width: backgroundRef.width, height: backgroundRef.height)
        let imageFrame = CGRect(x: 0, y: 0, width: imageRef.width, height: imageRef.height)
        let renderFrame = backgroundFrame.union(imageFrame).integral

        // Create context
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: nil, width: Int(renderFrame.size.width), height: Int(renderFrame.size.height), bitsPerComponent: 8, bytesPerRow: Int(renderFrame.size.width) * 4, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!

        // Draw images
        context.setBlendMode(.normal)
        context.draw(backgroundRef, in: backgroundFrame.offsetBy(dx: -renderFrame.origin.x, dy: -renderFrame.origin.y))
        context.setBlendMode(.difference)
        context.draw(imageRef, in: imageFrame.offsetBy(dx: -renderFrame.origin.x, dy: -renderFrame.origin.y))

        // Create image from context
        let newImage = context.makeImage()!

        return UIImage(cgImage: newImage)
    }
}
