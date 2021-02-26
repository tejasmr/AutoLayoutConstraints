//
//  AutoLayoutConstraints.swift
//  AutoLayoutConstraints
//
//  Created by tezz on 25/02/21.
//

import Foundation
import SwiftUI
import UIKit

struct AutoLayoutConstraints {
    // subView is view for which you want to add the ALC
    var subView: UIView
    // width constraint - in points or relative to the screenWidth = UIScreen.main.bounds.width
    var width: CGFloat
    // height constraint - in points or relative to the screenHeight = UIScreen.main.bounds.height
    var height: CGFloat
    // xOffset is the offset from either the left margin or right margin
    var xOffset: CGFloat = 0.0
    // yOffset is the offset from either the top margin or bottom margin
    var yOffset: CGFloat = 0.0
    // whether the subView should be centered horizontally
    var xCentered: Bool = true
    // whether the subview should be centered verically
    var yCentered: Bool = true
    // if this is true, the we offset it from the leading margin, else we do it from trailing margin
    var xLeading: Bool = true
    // if this is true, the we offset it from the top margin, else we do it from bottom margin
    var yTop: Bool = true
    
    func setAutoConstraints(_ viewController: UIViewController) {
        
        // I don't know what this does.
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        //
        let widthConstraint = NSLayoutConstraint(
           item: subView,
           attribute: NSLayoutConstraint.Attribute.width,
           relatedBy: NSLayoutConstraint.Relation.equal,
           toItem: nil,
           attribute: NSLayoutConstraint.Attribute.notAnAttribute,
           multiplier: 1,
            constant: width
        )
        let heightConstraint = NSLayoutConstraint(
           item: subView,
           attribute: NSLayoutConstraint.Attribute.height,
           relatedBy: NSLayoutConstraint.Relation.equal,
           toItem: nil,
           attribute: NSLayoutConstraint.Attribute.notAnAttribute,
           multiplier: 1,
            constant: height
        )
        var xConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutConstraint.Attribute.centerX,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: viewController.view,
            attribute: NSLayoutConstraint.Attribute.centerX,
            multiplier: 1,
            constant: 0
        )
        var yConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: viewController.view,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0
        )
        if !xCentered {
            if xLeading {
                xConstraint = NSLayoutConstraint(
                   item: subView,
                   attribute: NSLayoutConstraint.Attribute.leading,
                   relatedBy: NSLayoutConstraint.Relation.equal,
                   toItem: viewController.view,
                   attribute: NSLayoutConstraint.Attribute.leadingMargin,
                   multiplier: 1.0,
                    constant: xOffset
                )
            }
            else {
                xConstraint = NSLayoutConstraint(
                   item: subView,
                   attribute: NSLayoutConstraint.Attribute.trailing,
                   relatedBy: NSLayoutConstraint.Relation.equal,
                   toItem: viewController.view,
                   attribute: NSLayoutConstraint.Attribute.trailingMargin,
                   multiplier: 1.0,
                    constant: -xOffset
                )
            }
        }
        if !yCentered {
            if yTop {
                yConstraint = NSLayoutConstraint(
                    item: subView,
                    attribute: NSLayoutConstraint.Attribute.top,
                    relatedBy: NSLayoutConstraint.Relation.equal,
                    toItem: viewController.view,
                    attribute: NSLayoutConstraint.Attribute.topMargin,
                    multiplier: 1.0,
                    constant: yOffset
                )
            }
            else {
                yConstraint = NSLayoutConstraint(
                    item: subView,
                    attribute: NSLayoutConstraint.Attribute.bottom,
                    relatedBy: NSLayoutConstraint.Relation.equal,
                    toItem: viewController.view,
                    attribute: NSLayoutConstraint.Attribute.bottomMargin,
                    multiplier: 1.0,
                    constant: -yOffset
                )
            }
        }
        viewController.view.addConstraints(
                [widthConstraint, heightConstraint, xConstraint, yConstraint]
        )
    }
}
