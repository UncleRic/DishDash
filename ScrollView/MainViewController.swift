//  MainViewController.swift
//  ScrollView
//
//  Created by Frederick C. Lee on 7/16/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import UIKit
import QuickLook
import Foundation

class MainViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Page 1:
    @IBOutlet weak var page1Title1Label: UILabel!
    @IBOutlet weak var page1Title2Label: UILabel!
    
    // Page 2:
    @IBOutlet weak var page2Title1Label: UILabel!
    @IBOutlet weak var page2Title2Label: UILabel!
    @IBOutlet weak var page2Title3Label: UILabel!
    
    // Page 3:
    @IBOutlet weak var page3Title1Label: UILabel!
    @IBOutlet weak var page3Title2Label: UILabel!
    @IBOutlet weak var page3Title3Label: UILabel!
    
    // Page 4:
    @IBOutlet weak var page4Title1Label: UILabel!
    
    // Page 5:
    @IBOutlet weak var page5Title1Label: UILabel!
    @IBOutlet weak var page5Title2Label: UILabel!
    
    // Page 6:
    @IBOutlet weak var page6Title1Label: UILabel!
    
    // MARK:
    // MARK: UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Today's Menu"
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.frame.size.height = self.view.frame.size.height
        scrollView.contentSize = CGSize(width: 2000, height: scrollView.frame.size.height)
        filloutPageTitles()
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func filloutPageTitles() {
        // Page 1: Avocado with Buffalo
        let Avocado = NSMutableAttributedString.robotoBold(str:"Avocado")
        let Buffalo = NSMutableAttributedString.robotoBold(str:"Buffalo")
        let with = NSMutableAttributedString.robotoLight(str:" with ")
        let attrString = NSMutableAttributedString()
        attrString.append(Avocado)
        attrString.append(with)
        attrString.append(Buffalo)
        page1Title1Label.attributedText = attrString
        
        // Page 2: with Pear and
        let with2 = NSMutableAttributedString.robotoLight(str:"with")
        let Pear = NSMutableAttributedString.robotoBold(str:" Pear ")
        let and = NSMutableAttributedString.robotoLight(str:"and")
        
        let attrString2 = NSMutableAttributedString()
        attrString2.append(with2)
        attrString2.append(Pear)
        attrString2.append(and)
        page2Title2Label.attributedText = attrString2
        
        // Page 3a: Chicken Breast With
        let Chicken = NSMutableAttributedString.robotoBold(str:"Chicken")
        let Breast = NSMutableAttributedString.robotoBold(str:" Breast ")
        let with3 = NSMutableAttributedString.robotoLight(str:" with")
        
        let attrString3a = NSMutableAttributedString()
        attrString3a.append(Chicken)
        attrString3a.append(Breast)
        attrString3a.append(with3)
        page3Title1Label.attributedText = attrString3a
        
        // Page 3b: Caponata and
        let Caponata = NSMutableAttributedString.robotoBold(str:"Caponata")
        let and3 = NSMutableAttributedString.robotoLight(str:" and")
        
        let attrString3b = NSMutableAttributedString()
        attrString3b.append(Caponata)
        attrString3b.append(and3)
        page3Title2Label.attributedText = attrString3b
        
        // Page 5: Herb Schnitzel with
        let Herb = NSMutableAttributedString.robotoBold(str:"Herb")
        let Schnitzel = NSMutableAttributedString.robotoBold(str:"Schnitzel")
        
        let attrString3 = NSMutableAttributedString()
        attrString3.append(Herb)
        attrString3.append(Schnitzel)
        attrString3.append(with3)
        page5Title1Label.attributedText = attrString3
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func showCode() {
        if (nil != Bundle.main.url(forResource: "DishDash", withExtension: "pdf")) {
            let preview = QLPreviewController()
            preview.dataSource = self
            preview.currentPreviewItemIndex = 0
            self.present(preview, animated: true, completion: nil)
        }
    }

    // -----------------------------------------------------------------------------------------------------
    // MARK: - Action methods
    
    @IBAction func tapGestureHandler(_ sender: UITapGestureRecognizer) {
        showCode()
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    @IBAction func exitAction(_ sender: UIBarButtonItem) {
        exit(0)
    }
    
}

// ===================================================================================================
// MARK:

extension MainViewController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Did Scroll...")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("ScrollViewDidEndDragging")
    }
}

// ===================================================================================================


extension MainViewController:QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return Bundle.main.url(forResource: "DishDash", withExtension: "pdf")! as QLPreviewItem
    }
}

// ===================================================================================================
// MARK:

extension NSMutableAttributedString {
    class func robotoLight(str:String) -> NSAttributedString {
        let labelFont = UIFont(name: "Roboto-Light", size: 17.0)
        let attributes = [NSFontAttributeName : labelFont!]
        let attrString = NSAttributedString(string:str, attributes: attributes)
        
        return attrString
    }
    
    class func robotoBold(str:String) -> NSAttributedString {
        let labelFont = UIFont(name: "Roboto-Bold", size: 17.0)
        let attributes :[String:AnyObject] = [NSFontAttributeName : labelFont!]
        let attrString = NSAttributedString(string:str, attributes: attributes)
        
        return attrString
    }
    
    
}






