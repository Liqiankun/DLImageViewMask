//
//  ViewController.m
//  MaskImage
//
//  Created by DavidLee on 16/3/18.
//  Copyright © 2016年 DavidLee. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+maskImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gao"]];
    imageView.backgroundColor = [UIColor redColor];
    //调用切图
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView maskImageWithSize:CGSizeMake(100, 100)];
    imageView.frame = CGRectMake(50, 60, 100, 100);
    imageView.center = CGPointMake(self.view.center.x, 120);
    
    
    UIImageView *imageViewOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gao"]];
    imageViewOne.frame = CGRectMake(50, 60, 100, 100);
    [imageViewOne setSingleCornerRadius:5 ByRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight];
    imageViewOne.center = CGPointMake(self.view.center.x, 230);
    [self.view addSubview:imageViewOne];
    
    
    
    
    
  
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
