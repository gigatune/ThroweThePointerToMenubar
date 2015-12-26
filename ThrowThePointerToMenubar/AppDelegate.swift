//
//  AppDelegate.swift
//  ThrowThePointerToMenubar
//
//  Created by gigatune on 2015/12/26.
//  Copyright © 2015年 gigatune. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        setMenu()
    
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

