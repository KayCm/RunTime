//
//  UIControl+ActionRecord.m
//  RunTime
//
//  Created by KayCM on 16/4/23.
//  Copyright © 2016年 M1989.COM. All rights reserved.
//

#import "UIControl+ActionRecord.h"

#import <objc/runtime.h>

@implementation UIControl (ActionRecord)

+(void)load
{
    
    
    Class class = [self class];
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        SEL SelfSel = @selector(touchesBegan:withEvent:);
        SEL SwizzSel = @selector(Change_touchesBegan:withEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, SelfSel);
        
        Method swizzledMethod = class_getInstanceMethod(class, SwizzSel);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
    });
    
    
    unsigned int FuncCount = 0;
    
    Method *membersFuncs = class_copyMethodList([self class], &FuncCount);
    
    //遍历已有函数名
    for (int i = 0 ; i< FuncCount; i++) {
        
        SEL Met = method_getName(membersFuncs[i]);
        
        NSString *MetName = [NSString stringWithCString:sel_getName(Met) encoding:NSUTF8StringEncoding];
        
        
        NSLog(@"\n函数:%@",MetName);
        
    }
    
    
    unsigned int count = 0;
    
    Ivar *members = class_copyIvarList([self class] , &count);
    
    
    for (int i = 0; i<count ; i++) {
        
        Ivar var = members[i];
        
        const char *memName = ivar_getName(var);
        
        const char *memType = ivar_getTypeEncoding(var);
        
        NSLog(@"\n %s type:%s", memName, memType);
        
    }
   
}



-(void)Change_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self Change_touchesBegan:touches withEvent:event];
    
    NSLog(@"Touch"); //记录日志
    
}


@end




