//
//  TextRepeaterViewController.h
//  TextRepeater
//
//  Created by Derek Maurer on 11/17/10.
//  Copyright 2010 Home School Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextRepeaterViewController : UIViewController {
}
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UITextField *numberOfTimesTextField;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UIButton *closeKeyboardButton;
@property (nonatomic, strong) IBOutlet UIButton *calculateButton;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityView;

- (IBAction)calculateButtonPressed:(id)sender;
- (IBAction)textFieldDidBeginEditing:(id)sender;
- (IBAction)hideKeyboardButtonPressed:(id)sender;
@end

