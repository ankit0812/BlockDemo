//
//  ViewController.m
//  BlockDemo
//
//  Created by optimusmac4 on 8/18/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

-(void) test;

-(void)addNumber:(int)number1 withNumber:(int)number2 andCompletionHandler:(void (^)(int result))completionHandler;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test];
    
    [self addNumber:5 withNumber:7 andCompletionHandler:^(int result) {
        // We just log the result, no need to do anything else.
        NSLog(@"The result of add number block is : %d", result);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) test{
    __block int value=10;
    int (^calc)(void) = ^(void){
        value += 10;
        return value;
    };
    NSLog(@" Result of test block after increment = %d",calc());
}

-(void)addNumber:(int)number1 withNumber:(int)number2 andCompletionHandler:(void (^)(int result))completionHandler{
    int result = number1 + number2;
    completionHandler(result);
}
@end
