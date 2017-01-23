//
//  ViewController.m
//  SenderApp
//
//  Created by Ganesh, Ashwin on 1/23/17.
//  Copyright © 2017 Ashwin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)invokeApp:(id)sender {
    UIApplication *ourApplication = [UIApplication sharedApplication];
    NSString *URLEncodedText = [self.sendTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *ourPath = [@"openApp://" stringByAppendingString:URLEncodedText];
    NSURL *ourURL = [NSURL URLWithString:ourPath];
    if ([ourApplication canOpenURL:ourURL]) {
        if([[UIDevice currentDevice].systemVersion floatValue] >= 10.0){
            [ourApplication openURL:ourURL options:@{} completionHandler:^(BOOL success) {
                NSLog(@"Open %d",success);
            }];
        } else {
            [ourApplication openURL:ourURL];
        }
    }
    else {
        NSLog(@"App Not Found");
    }
}
@end
