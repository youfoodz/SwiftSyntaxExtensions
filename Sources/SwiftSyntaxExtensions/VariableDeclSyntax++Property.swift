//
//  VariableDeclSyntax+Identifier.swift
//  SwiftSyntaxExtensions
//
//  Created by yuka ezura on 2019/04/28.
//

import Foundation
import SwiftSyntax

extension VariableDeclSyntax {
    public func havingSameName(with variableDecl: VariableDeclSyntax) -> Bool {
        return self.variableName == variableDecl.variableName
    }
    
    public var variableName: String? {
        guard let binding = self.bindings.first(where: { $0.pattern is IdentifierPatternSyntax }),
            let pattern = binding.pattern as? IdentifierPatternSyntax else {
                return nil
        }
        return String(pattern.identifier.text
            .filter { !$0.isWhitespace }) // remove trivia
    }
}
