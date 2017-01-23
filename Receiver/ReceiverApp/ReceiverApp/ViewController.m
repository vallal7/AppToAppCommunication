//
//  ViewController.m
//  ReceiverApp
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

-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.receivedLabel setText:[NSString stringWithFormat:@"Received Message!!!"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
