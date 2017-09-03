//
//  DKAssetGroupDetailImageCell.swift
//  DKImagePickerController
//
//  Created by ZhangAo on 07/12/2016.
//  Copyright © 2016 ZhangAo. All rights reserved.
//

import UIKit

class DKAssetGroupDetailImageCell: DKAssetGroupDetailBaseCell {
    
    class override func cellReuseIdentifier() -> String {
        return "DKImageAssetIdentifier"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.thumbnailImageView.frame = self.bounds
        self.thumbnailImageView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.contentView.addSubview(self.thumbnailImageView)
        
        self.checkView.frame = self.bounds
        self.checkView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.checkView.checkImageView.tintColor = nil
        self.checkView.checkLabel.font = UIFont.boldSystemFontOfSize(14)
        self.checkView.checkLabel.textColor = UIColor.whiteColor()
        self.contentView.addSubview(self.checkView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class DKImageCheckView: UIView {
        
        internal lazy var checkImageView: UIImageView = {
            let imageView = UIImageView(image: DKImageResource.checkedImage().imageWithRenderingMode(.AlwaysTemplate))
            return imageView
        }()
        
        internal lazy var checkLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .Right
            
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.addSubview(checkImageView)
            self.addSubview(checkLabel)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.checkImageView.frame = self.bounds
            self.checkLabel.frame = CGRect(x: 0, y: 5, width: self.bounds.width - 5, height: 20)
        }
        
    } /* DKImageCheckView */
    
    override var thumbnailImage: UIImage? {
        didSet {
            self.thumbnailImageView.image = self.thumbnailImage
        }
    }
    override var index: Int {
        didSet {
            self.checkView.checkLabel.text =  "\(self.index + 1)"
        }
    }
    
    lazy var thumbnailImageView: UIImageView = {
        let thumbnailImageView = UIImageView()
        thumbnailImageView.contentMode = .ScaleAspectFill
        thumbnailImageView.clipsToBounds = true
        
        return thumbnailImageView
    }()
    
    let checkView = DKImageCheckView()
    
    override var selected: Bool {
        didSet {
            checkView.hidden = !super.selected
        }
    }
    
} /* DKAssetGroupDetailCell */
