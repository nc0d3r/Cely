//
//  CelyWindowManagerTest.swift
//  Cely
//
//  Created by Fabian Buentello on 10/15/16.
//  Copyright © 2016 Fabian Buentello. All rights reserved.
//

import XCTest
@testable import Cely

class CelyWindowManagerTest: XCTestCase {

    let testWindow = UIWindow()
    let testStoryboard = UIStoryboard()
    let testLoginScreen = UIViewController()

    override func setUp() {
        super.setUp()
        CelyWindowManager.setup(window: testWindow, withLoginScreen: testLoginScreen)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSetup() {
        XCTAssert(CelyWindowManager.manager.window == testWindow, "did not properly set manager's window object")
    }

    func testMatchingLoginScreens() {
        XCTAssert(CelyWindowManager.manager.loginScreen == testLoginScreen, "did not properly set manager's login screen")
    }

    func testMatchingHomeScreens() {
        CelyWindowManager.setInitialStoryboard(testStoryboard)
        XCTAssert(CelyWindowManager.manager.initialStoryboard == testStoryboard, "did not properly set manager's home screen")
    }

    func testShowScreen() {
        testMatchingHomeScreens()
        Cely.changeStatus(to: .LoggedIn)
        // TODO: fix this!!!
//        XCTAssert(CelyWindowManager.manager.window.rootViewController == testStoryboard.instantiateInitialViewController(), "did not properly set manager's home screen")

        Cely.changeStatus(to: .LoggedOut)
        XCTAssert(CelyWindowManager.manager.window.rootViewController == testLoginScreen, "did not properly set manager's login screen")
    }
}