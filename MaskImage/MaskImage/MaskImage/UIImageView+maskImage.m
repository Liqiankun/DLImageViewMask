//
//  UIImageView+maskImage.m
//  MaskImage
//
//  Created by DavidLee on 16/3/18.
//  Copyright © 2016年 DavidLee. All rights reserved.
//

#import "UIImageView+maskImage.h"

@implementation UIImageView (maskImage)


-(void)maskImageWithSize:(CGSize)size
{
    //创建一个新的maskLayer
    CALayer *mask = [[CALayer alloc] init];
    
    //创建maskIamge
    UIImage *maskImage = [UIImage imageNamed:@"maskImage"];
    
    //开启一个图形处理上下文
    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    //将图片画上去
    [maskImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形处理上下文
    UIGraphicsEndImageContext();
    //设置mask的内容
    mask.contents = (__bridge id _Nullable)([newImage CGImage]);
    mask.frame = CGRectMake(0, 0, size.width, size.height);
    
    //设置图片的图片模式
    self.contentMode = UIViewContentModeScaleAspectFill;
    //设置imageView的mask
    self.layer.mask = mask;
}


-(void)setSingleCornerRadius:(CGFloat)cornerRadius ByRoundingCorners:(UIRectCorner)rect
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rect cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
    
}

@end
