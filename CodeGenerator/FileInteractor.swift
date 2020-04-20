//
//  FileInteractor.swift
//  CodeGenerator
//
//  Created by Drew Sullivan on 4/20/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import Foundation

protocol FileInteractorProtocol {
    func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey : Any]?) throws
    func createFile(at url: URL, contents data: Data?, attributes attr: [FileAttributeKey : Any]?) -> Bool
    func removeItem(at URL: URL) throws
}

struct FileInteractor: FileInteractorProtocol {
    
    func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey : Any]?) throws {
        return
    }
    
    func createFile(at url: URL, contents data: Data?, attributes attr: [FileAttributeKey : Any]?) -> Bool {
        return true
    }
    
    func removeItem(at URL: URL) throws {
        return
    }
    
}

//extension FileManager: FileInteractorProtocol { }
