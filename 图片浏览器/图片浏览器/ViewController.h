//
//  ViewController.h
//  图片浏览器
//
//  Created by znxass on 15/8/4.
//  Copyright (c) 2015年 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *imageNoView;

@property (weak, nonatomic) IBOutlet UISlider *silder;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *imageTitleView;

- (IBAction)imageNoChange;

- (IBAction)nightMode:(UISwitch *)sender;

- (IBAction)nextImage:(UIStepper *)sender;

@end

