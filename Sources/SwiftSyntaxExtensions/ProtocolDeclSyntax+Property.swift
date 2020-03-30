//
//  ProtocolDeclSyntax+Property.swift
//  SwiftSyntaxExtensions
//
//  Created by yuka ezura on 2019/04/28.
//

import Foundation
import SwiftSyntax

extension ProtocolDeclSyntax {
    public func extractVariableDecl() -> [(IdentifierPatternSyntax, TypeAnnotationSyntax)] {
        return self.members.members.compactMap { declMember in
            guard let varDecl = declMember.decl.as(VariableDeclSyntax.self),
                let binding = varDecl.bindings.first(where: { $0.pattern.is(IdentifierPatternSyntax.self) }),
                let pattern = binding.pattern.as(IdentifierPatternSyntax.self),
                let typeAnnotation = binding.typeAnnotation else { return nil }
            return (pattern, typeAnnotation)
        }
    }
}
