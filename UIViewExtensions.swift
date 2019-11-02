import UIKit

extension UIView {

    func addConstrainedSubview(
        _ view: UIView,
        top: CGFloat = 0,
        left: CGFloat = 0,
        bottom: CGFloat = 0,
        right: CGFloat = 0
        )
    {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: top),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: left),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottom),
            view.rightAnchor.constraint(equalTo: rightAnchor, constant: -right)
            ])
    }

    func addGradient(startColor: UIColor, endColor: UIColor, isHorizontal: Bool = false) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        if isHorizontal {
            gradient.startPoint = CGPoint(x: 0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1, y: 0.5)
        }
        layer.insertSublayer(gradient, at: 0)
    }

    func clipToCircle() {
        let diameter = min(frame.width, frame.height)
        roundCorners(withRadius: diameter * 0.5)
    }

    func roundCorners(withRadius radius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        layer.mask = mask
    }

    func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

}
