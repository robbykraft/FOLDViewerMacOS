//
//  ViewController.swift
//  FoldQuickLook
//
//  Created by Robby on 3/24/21.
//

import Cocoa
import Metal
import MetalKit

class ViewController: NSViewController {
  
  var renderer: Renderer!
  var metalView: MetalView!
  
  override func viewWillLayout() {
    super.viewWillLayout()
    metalView.frame = self.view.bounds
  }
  
  override func viewDidDisappear() {
    super.viewDidDisappear()
    renderer.deallocMesh()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    renderer = Renderer()
    metalView = MetalView()
    renderer.mtkView = metalView

    if let vfxview = self.view as? NSVisualEffectView {
      vfxview.blendingMode = .behindWindow
      vfxview.isEmphasized = true
      vfxview.material = .underWindowBackground
    }

    self.view.addSubview(metalView)
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

}

