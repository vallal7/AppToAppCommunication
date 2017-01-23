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
    //Encode the message to send
    NSString *URLEncodedText = [self.sendTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //openApp is the URLScheme of the receiver App
    NSString *ourPath = [@"openApp://" stringByAppendingString:URLEncodedText];
    NSURL *ourURL = [NSURL URLWithString:ourPath];
    if ([ourApplication canOpenURL:ourURL]) {
        if([[UIDevice currentDevice].systemVersion floatValue] >= 10.0){
            // openURL is supported only on devices with OS > 10
            [ourApplication openURL:ourURL options:@{} completionHandler:^(BOOL success) {
                NSLog(@"Open %d",success);
            }];
        } else {
            // for older devices use the old deprecated method
            [ourApplication openURL:ourURL];
        }
    }
    else {
        // in this case, the app is not installed
        NSLog(@"App Not Found");
    }
}
@end
