//
//  TemplateManager.swift
//  DS2CodeGenerator
//
//  Created by Drew Sullivan on 4/20/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import Foundation

enum SuperclassName {
    case uiView
}

enum TemplateLanguage {
    case swift
    case objectiveC
}

struct TemplateRequest {
    var superclassName: SuperclassName
    var subclassName: String
    var language: TemplateLanguage
}

class TemplateManager {
    
    static let shared = TemplateManager()
    private var templates: [TemplateLanguage: [SuperclassName: [String]]] = [
        TemplateLanguage.swift: [
            SuperclassName.uiView: ["<CLASS_NAME> template"]
        ],
        TemplateLanguage.objectiveC: [
            SuperclassName.uiView: ["<CLASS_NAME> template.h", "<CLASS_NAME> template.m"]
        ]
    ]
    
    private init() { }
    
    func templates(forTemplateRequest templateRequest: TemplateRequest) -> [String] {
        guard let templates = templates[templateRequest.language]?[templateRequest.superclassName] else {
            return ["No template returned"]
        }
        var cleanedTemplates = [String]()
        for template in templates {
            cleanedTemplates.append(template.replacingOccurrences(of: "<CLASS_NAME>", with: templateRequest.subclassName))
        }
        return cleanedTemplates
    }
    
}
