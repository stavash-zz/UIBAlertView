//
//  UIBAlertView.m
//  UIBAlertView
//
//  Created by Stav Ashuri on 1/31/13.
//  Copyright (c) 2013 Stav Ashuri. All rights reserved.
//

#import "UIBAlertView.h"

@interface UIBAlertView() <UIAlertViewDelegate>

@property (strong, nonatomic) UIBAlertView *strongAlertReference;

@property (copy) AlertDefaultButtonHandler defaultHandler;
@property (copy) AlertCancelButtonHandler cancelHandler;
@property (copy) AlertOtherButtonHandler otherHandler;

@property (strong, nonatomic) NSString *activeTitle;
@property (strong, nonatomic) NSString *activeMessage;
@property (strong, nonatomic) NSString *activeCancelTitle;
@property (strong, nonatomic) NSString *activeOtherTitles;
@property (strong, nonatomic) UIAlertView *activeAlert;

@end

@implementation UIBAlertView

#pragma mark - Public (Initialization)
- (id)initWithTitle:(NSString *)aTitle message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSString *)otherTitles,... {
    self = [super init];
    if (self) {
		self.alertViewStyle = UIAlertViewStyleDefault;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:self cancelButtonTitle:aCancelTitle otherButtonTitles:nil];
        if (otherTitles != nil) {
            [alert addButtonWithTitle:otherTitles];
            va_list args;
            va_start(args, otherTitles);
            NSString * title = nil;
            while((title = va_arg(args,NSString*))) {
                [alert addButtonWithTitle:title];
            }
            va_end(args);
        }
        _activeAlert = alert;
    }
    return self;
}

#pragma mark - Public (Functionality)
- (void)showWithDefaultHandler:(AlertDefaultButtonHandler)defaultHandler
                  canceHandler:(AlertCancelButtonHandler)cancelHandler
                  otherHandler:(AlertOtherButtonHandler)otherHandler {
    _defaultHandler = defaultHandler;
    _cancelHandler = cancelHandler;
    _otherHandler = otherHandler;
    
    _strongAlertReference = self;
    [_activeAlert show];
}

#pragma mark UIAlertView passthroughs

- (void)setAlertViewStyle:(UIAlertViewStyle)alertViewStyle
{
	_alertViewStyle = alertViewStyle;
	self.activeAlert.alertViewStyle = alertViewStyle;
}

- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex
{
	return [self.activeAlert textFieldAtIndex:textFieldIndex];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0 && _cancelHandler) _cancelHandler();
    if (buttonIndex == 1 && _defaultHandler) _defaultHandler();
    if (buttonIndex > 1 && _otherHandler) _otherHandler(buttonIndex);
    _strongAlertReference = nil;
}

@end
