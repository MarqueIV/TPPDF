//
//  ObjectAttributesExampleFactory.swift
//  TPPDF_Example
//
//  Created by Philip Niedertscheider on 19.12.19.
//  Copyright © 2019 techprimate GmbH & Co. KG. All rights reserved.
//

import Foundation
import TPPDF

class ObjectAttributesExampleFactory: ExampleFactory {

    func generateDocument() -> [PDFDocument] {
        let document = PDFDocument(format: .a4)

        let logoImage = PDFImage(image: UIImage(named: "Icon.png")!, size: CGSize(width: 150, height: 150))
        logoImage.add(attribute: .link(url: URL(string: "https://www.github.com/techprimate/TPPDF")!))
        document.add(.contentCenter, image: logoImage)

        let count = 20
        let text = (0..<count).reduce("", { (prev, _) in prev + "Word Link Word - " })
        let attributedString = NSMutableAttributedString(string: text)
        for i in 0..<20 {
            attributedString.addAttribute(.link,
                                          value: "https://www.github.com/techprimate/TPPDF",
                                          range: NSRange(location: 17 * i + 5, length: 4))
        }
        document.add(attributedText: attributedString)
        
        return [document]
    }
}
