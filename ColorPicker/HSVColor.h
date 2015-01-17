//
//  HSVColor.h
//  ColorPicker
//
//  Created by Ryan Rapini on 1/17/15.
//  Copyright (c) 2015 betaDev. All rights reserved.
//
#import <UIKit/UIKit.h>
#ifndef ColorPicker_HSVColor_h
#define ColorPicker_HSVColor_h

@interface HSVColor : NSObject

@property (nonatomic, strong) UIColor* color;

- (id)initWithDegrees:(CGFloat) degrees
       withSaturation:(CGFloat) saturation;

@end

#endif
