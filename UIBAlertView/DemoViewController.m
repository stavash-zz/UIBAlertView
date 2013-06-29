//
//  ViewController.m
//  UIBAlertView
//
//  Created by Stav Ashuri on 1/31/13.
//  Copyright (c) 2013 Stav Ashuri. All rights reserved.
//

#import "DemoViewController.h"
#import "UIBAlertView.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)activateAlert:(id)sender {
    UIBAlertView *alert = [[UIBAlertView alloc] initWithTitle:@"Alert" message:@"Testing" cancelButtonTitle:@"Cancel" otherButtonTitles:@"Default",@"Button 2",nil];
    [alert showWithDefaultHandler:^() { NSLog(@"Default button pressed"); }
                     canceHandler:^() { NSLog(@"Cancel button pressed"); }
                     otherHandler:^(NSInteger selectedIndex) { NSLog(@"Index button: %d", selectedIndex); }
     ];
}

@end
