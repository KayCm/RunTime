//
//  ViewController.m
//  RunTime
//
//  Created by 凯 on 16/4/23.
//  Copyright © 2016年 M1989.COM. All rights reserved.
//

#import "ViewController.h"
#import "RecordButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    RecordButton *Btn = [[RecordButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    Btn.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:Btn];
    
    [Btn addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    
    
    //RunTime
}


-(void)Click
{
    NSLog(@"Click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
