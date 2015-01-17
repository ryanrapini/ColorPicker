//
//  HSVColor.m
//  ColorPicker
//
//  Created by Ryan Rapini on 1/17/15.
//  Copyright (c) 2015 betaDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSVColor.h"
#import <tgmath.h>

@interface HSVColor ()

@end


@implementation HSVColor

- (id)initWithDegrees:(CGFloat) degrees
       withSaturation:(CGFloat) saturation
{
    self = [super init];
    if (self) {
        [self calculateRGBFromDegree:degrees
                      withSaturation:saturation];
    }
    return self;
}

-(void)calculateRGBFromDegree:(CGFloat) degrees
               withSaturation:(CGFloat) saturation {
    CGFloat redVal = 0.0, greenVal = 0.0, blueVal = 0.0;
    
    CGFloat hue = degrees;
    CGFloat value = 1.0;
    
    CGFloat M = 255*value;
    CGFloat m = M*(1-saturation);
    
    // z = (M-m)[1 - |(H/60)mod_2 - 1|],
    CGFloat z = (M-m)*(1-ABS(fmod((hue/60),2) - 1));
    
    if (hue >= 0 && hue < 60){
        redVal = M;
        greenVal = z + m;
        blueVal = m;
    }
    else if (hue >= 60 && hue < 120){
        redVal = z + m;
        greenVal = M;
        blueVal = m;
    }
    else if (hue >= 120 && hue < 180){
        redVal = m;
        greenVal = M;
        blueVal = z + m;
    }
    else if (hue >= 180 && hue < 240){
        redVal = m;
        greenVal = z + m;
        blueVal = M;
    }
    else if (hue >= 240 && hue < 300){
        redVal = z + m;
        greenVal = m;
        blueVal = M;
    }
    else if (hue >= 300 && hue < 360){
        redVal = M;
        greenVal = m;
        blueVal = z + m;
    }
    
    
    self.color = [[UIColor alloc] initWithRed:(redVal/255) green:(greenVal/255) blue:(blueVal/255) alpha:1];
}



@end