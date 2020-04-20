//
//  FileInteractorTests.swift
//  CodeGeneratorTests
//
//  Created by Drew Sullivan on 4/20/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import XCTest
@testable import CodeGenerator

class FileInteractorTests: XCTestCase {
    
    var sut: FileInteractor!

    override func setUp() {
        sut = FileInteractor()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateDirectory() {
        sut.createDirectory(at: <#T##URL#>, withIntermediateDirectories: <#T##Bool#>, attributes: <#T##[FileAttributeKey : Any]?#>)
    }

}

class MockFileInteractor: FileInteractorProtocol {
    func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey : Any]?) throws {
        print("Directory created")
    }
    
    func createFile(at url: URL, contents data: Data?, attributes attr: [FileAttributeKey : Any]?) -> Bool {
        print("File created")
        return true
    }
    
    func removeItem(at URL: URL) throws {
        print("Item deleted")
    }
}
