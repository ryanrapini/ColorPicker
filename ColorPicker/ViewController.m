//
//  ViewController.m
//  ColorPicker
//
//  Created by Ryan Rapini on 1/17/15.
//  Copyright (c) 2015 betaDev. All rights reserved.
//

#import "ViewController.h"
#import "HSVColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView {
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    contentView.backgroundColor = [UIColor blackColor];
    self.view = contentView;
    
    [self drawColorSquares];
}

- (void)drawColorSquares {
    int pickerSquaresXCount = 20;
    int pickerSquaresYCount = 8;
    int pickerSquaresSize = 10;
    
    int pickerSizeX = pickerSquaresXCount*10-10;
    int pickerSizeY = pickerSquaresYCount*10-10;
    
    UIView *centerView = [[UIView alloc] init];
    [centerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    centerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:centerView];
    
    // Width constraint, half of parent view width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0
                                                           constant:pickerSizeX]];
    
    // Height constraint, half of parent view height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0
                                                           constant:pickerSizeY]];
    
    // Center horizontally
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    // Center vertically
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    for (int y = 0; y < pickerSquaresYCount; y++){
        for (int x = 0; x < pickerSquaresXCount; x++){
            CGRect aSquare = CGRectMake(x*11, y*11, pickerSquaresSize, pickerSquaresSize);
            
            UIView *squareView = [[UIView alloc] initWithFrame:aSquare];
            
            CGFloat rangeX = 360.0 * ((CGFloat) x / (CGFloat) pickerSquaresXCount);
            CGFloat rangeY = (CGFloat)(pickerSquaresYCount - y) / (CGFloat) pickerSquaresYCount;
            
            HSVColor *kellyColor = [[HSVColor alloc]
                                    initWithDegrees:rangeX
                                    withSaturation:rangeY];
            
            squareView.backgroundColor = kellyColor.color;
            
            [centerView addSubview:squareView];
        }
    }
    
}

//
//+ (UIImage *)colorMapImageWithSize:(CGSize)size
//                          tileSize:(CGFloat)tileSize
//              saturationUpperLimit:(CGFloat)saturationUpperLimit {
//    
//    int pixelCountX = (int) (size.width / tileSize);
//    int pixelCountY = (int) (size.height / tileSize);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGRect rect = CGRectMake(0.f, 0.f, size.width, size.height);
//
//    
//        CGFloat margin = 0;
//        
//        HRHSVColor pixelHsv;
//        pixelHsv.s = pixelHsv.v = 1;
//        for (int i = 0; i < pixelCountX; ++i) {
//            CGFloat pixelX = (CGFloat) i / pixelCountX;
//            
//            pixelHsv.h = pixelX;
//            UIColor *color;
//            color = [UIColor colorWithHue:pixelHsv.h
//                               saturation:pixelHsv.s
//                               brightness:pixelHsv.v
//                                    alpha:1];
//            CGContextSetFillColorWithColor(context, color.CGColor);
//            CGContextFillRect(context, CGRectMake(tileSize * i + rect.origin.x, rect.origin.y, tileSize - margin, CGRectGetHeight(rect)));
//        }
//        
//        CGFloat top;
//        for (int j = 0; j < pixelCountY; ++j) {
//            top = tileSize * j + rect.origin.y;
//            CGFloat pixelY = (CGFloat) j / (pixelCountY - 1);
//            CGFloat alpha = (pixelY * saturationUpperLimit);
//            CGContextSetRGBFillColor(context, 1, 1, 1, alpha);
//            CGContextFillRect(context, CGRectMake(rect.origin.x, top, CGRectGetWidth(rect), tileSize - margin));
//        }
//    return [UIImage context];
//}


@end
