//
//  AppDelegate.swift
//  ThrowThePointerToMenubar
//
//  Created by gigatune on 2015/12/26.
//  Copyright © 2015年 gigatune. All rights reserved.
//

import Cocoa
import Foundation
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    var isThrowed = false
    let jumpKeyCode = UInt16(7)  // x
    let backKeyCode = UInt16(40) // k
    var orgPositon = CGPointMake(0, 0)
    let menuMousePositon = CGPoint(x: 100, y: 10)
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        setMenu()
        setWatcher()
    }


    func setWatcher(){
        NSEvent.addGlobalMonitorForEventsMatchingMask(NSEventMask.KeyDownMask, handler:self.handler)
    }
    
    func handler( event: NSEvent!){
        if( event.keyCode == self.jumpKeyCode ){
            if( event.modifierFlags.contains( [.CommandKeyMask, .ShiftKeyMask] ) ){
                self.gotoMenuPosition()
            }
        }
        if( event.keyCode == self.backKeyCode ){
            if( event.modifierFlags.contains( [.CommandKeyMask, .ShiftKeyMask] ) ){
                self.backToMousePositon()
            }
        }
    }
    
    func gotoMenuPosition(){
        let event = CGEventCreate( nil )
        self.orgPositon = CGEventGetLocation(event)
        CGWarpMouseCursorPosition( self.menuMousePositon )
    }

    func backToMousePositon(){
        CGWarpMouseCursorPosition(self.orgPositon)
    }
    
    func setMenu(){
        self.statusItem.title = "ThrowThePointerToMenuBar"
        self.statusItem.highlightMode = true

        let menu = NSMenu()
        self.statusItem.menu = menu

        
        let menuItem = NSMenuItem()
        menuItem.title = "Quit"
        menuItem.action = Selector("quit:")

        menu.addItem(menuItem)
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func quit(sender:NSButton){
        NSApplication.sharedApplication().terminate(self)
    }

}

