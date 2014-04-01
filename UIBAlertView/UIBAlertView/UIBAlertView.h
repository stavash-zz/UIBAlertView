//
//  UIBAlertView.h
//  UIBAlertView
//
//  Created by Stav Ashuri on 1/31/13.
//  Copyright (c) 2013 Stav Ashuri. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AlertDismissedHandler) (NSInteger selectedIndex, BOOL didCancel);

@interface UIBAlertView : NSObject

// UIAlertView passthroughs
@property(nonatomic,assign) UIAlertViewStyle alertViewStyle NS_AVAILABLE_IOS(5_0);
- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(5_0);
@property (strong, nonatomic, readonly) UIAlertView *activeAlert;

// UIBAlertView functionality
- (id)initWithTitle:(NSString *)aTitle message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSString *)otherTitles,...NS_REQUIRES_NIL_TERMINATION;
- (void)showWithDismissHandler:(AlertDismissedHandler)handler;

@end
