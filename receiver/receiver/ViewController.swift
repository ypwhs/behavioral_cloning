//
//  ViewController.swift
//  receiver
//
//  Created by 杨培文 on 2017/1/4.
//  Copyright © 2017年 杨培文. All rights reserved.
//

import Cocoa
import Quartz
import CocoaAsyncSocket

extension NSImage {
    func imageRotated(by degrees: CGFloat) -> NSImage {
        let imageRotator = IKImageView()
        var imageRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        let cgImage = self.cgImage(forProposedRect: &imageRect, context: nil, hints: nil)
        imageRotator.setImage(cgImage, imageProperties: [:])
        imageRotator.rotationAngle = CGFloat(-(degrees / 180) * CGFloat(M_PI))
        let rotatedCGImage = imageRotator.image().takeUnretainedValue()
        return NSImage(cgImage: rotatedCGImage, size: NSSize.zero)
    }
}

class ViewController: NSViewController, GCDAsyncUdpSocketDelegate {
    @IBOutlet weak var image: NSImageView!
    var socket:GCDAsyncUdpSocket!
    var img = NSImage(named: "f")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: DispatchQueue.main)
        try! socket.bind(toPort: 20160)
        try! socket.beginReceiving()
    }
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didReceive data: Data, fromAddress address: Data, withFilterContext filterContext: Any?) {
        let value = Double(String(data: data, encoding: .utf8)!)!
        self.image.image = self.img.imageRotated(by: CGFloat(value*180))
    }
    
}
