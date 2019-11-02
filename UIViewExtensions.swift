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

}
