//
//  UIBAlertView.h
//  UIBAlertView
//
//  Created by Stav Ashuri on 1/31/13.
//  Copyright (c) 2013 Stav Ashuri. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AlertDefaultButtonHandler) ();
typedef void (^AlertCancelButtonHandler) ();
typedef void (^AlertOtherButtonHandler) (NSInteger selectedIndex);

@interface UIBAlertView : NSObject

// UIAlertView passthroughs
@property(nonatomic,assign) UIAlertViewStyle alertViewStyle NS_AVAILABLE_IOS(5_0);
- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(5_0);

// UIBAlertView functionality
- (id)initWithTitle:(NSString *)aTitle message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSString *)otherTitles,...NS_REQUIRES_NIL_TERMINATION;

- (void)showWithDefaultHandler:(AlertDefaultButtonHandler)defaultHandler
                  canceHandler:(AlertCancelButtonHandler)cancelHandler
                  otherHandler:(AlertOtherButtonHandler)otherHandler;

@end
