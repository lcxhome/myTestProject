//
//  ViewController.m
//  图片浏览器
//
//  Created by znxass on 15/8/4.
//  Copyright (c) 2015年 lcx. All rights reserved.
//

#import "ViewController.h"
//类拓展：
@interface ViewController ()

@property(nonatomic,strong) NSArray *imageData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.加载images.plist
    NSBundle *bundle = [NSBundle mainBundle];
    //获取images.plist在用户手机上的全路径
    NSString *path = [bundle pathForResource:@"images" ofType:@"plist"];
    self.imageData = [NSArray arrayWithContentsOfFile:path];
    
    //2.对控件进行初始化
    self.imageNoView.text = [NSString stringWithFormat:@"1/%zd",self.imageData.count];
    self.silder.maximumValue = self.imageData.count;
    self.silder.minimumValue = 1;
    
    NSDictionary *dict = self.imageData[0];
    self.imageView.image = [UIImage imageNamed:dict[@"icon"]];
    self.imageTitleView.text = dict[@"title"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)imageNoChange {
    //1.获取当前的进度值
    int index = self.silder.value;
    //2.取出对应的字典
    NSDictionary *dct = self.imageData[index - 1];
    self.imageView.image = [UIImage imageNamed:dct[@"icon"]];
    self.imageTitleView.text = dct[@"title"];
    self.imageNoView.text = [NSString stringWithFormat:@"%zd/%zd",index,self.imageData.count];
}

- (IBAction)nightMode:(UISwitch *)sender {
    self.view.backgroundColor = sender.isOn ? [UIColor grayColor] : [UIColor whiteColor];
}

- (IBAction)nextImage:(UIStepper *)sender {
    //[sender setWraps:YES];//设置是否循环
    if(sender.continuous)
    {
        int index = sender.value;
        NSDictionary *dct = self.imageData[index - 1];
        self.imageView.image = [UIImage imageNamed:dct[@"icon"]];
        self.imageTitleView.text = dct[@"title"];
        self.imageNoView.text = [NSString stringWithFormat:@"%zd/%zd",index,self.imageData.count];
    }
}


@end
