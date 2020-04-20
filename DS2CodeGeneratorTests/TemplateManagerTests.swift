//
//  TemplateManagerTests.swift
//  DS2CodeGeneratorTests
//
//  Created by Drew Sullivan on 4/20/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import XCTest
@testable import DS2CodeGenerator

class TemplateManagerTests: XCTestCase {
    
    var sut: TemplateManager!
    var templateRequest: TemplateRequest!
    var templates: [String]!

    override func setUp() {
        sut = TemplateManager.shared
        templateRequest = TemplateRequest(superclassName: .uiView, subclassName: "MyView", language: .swift)
        templates = sut.templates(forTemplateRequest: templateRequest)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_templates_returns_templates() {
        XCTAssertFalse(templates.isEmpty)
    }
    
    func test_templates_no_longer_contain_variables() {
        for template in templates {
            XCTAssertFalse(template.contains("<CLASS_NAME>"), "Class name has not been updated")
        }
    }
    
    func test_templates_returns_correct_number_of_templates() {
        templateRequest = TemplateRequest(superclassName: .uiView, subclassName: "MyView", language: .swift)
        templates = sut.templates(forTemplateRequest: templateRequest)
        XCTAssertEqual(templates.count, 1)
        
        templateRequest = TemplateRequest(superclassName: .uiView, subclassName: "MyView", language: .objectiveC)
        templates = sut.templates(forTemplateRequest: templateRequest)
        XCTAssertEqual(templates.count, 2)
    }
    
}
