//
//  RecordButton.m
//  RunTime
//
//  Created by KayCM on 16/4/23.
//  Copyright © 2016年 M1989.COM. All rights reserved.
//

#import "RecordButton.h"
#import "UIControl+ActionRecord.h"

@implementation RecordButton


-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _BtnName = @"Test1111";
        
        NSLog(@"Init");
        
    }
    return self;
    
}

@end
