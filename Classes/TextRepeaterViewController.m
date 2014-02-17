//
//  TextRepeaterViewController.m
//  TextRepeater
//
//  Created by Derek Maurer on 11/17/10.
//  Copyright 2010 Home School Dev. All rights reserved.
//

#import "TextRepeaterViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TextRepeaterViewController () <UITextFieldDelegate>

@end

@implementation TextRepeaterViewController

- (void)performIteration
{
    NSString *repeatedText = @"";
    
    for (int i = 0; i < [[self.numberOfTimesTextField text] integerValue]; i++)
    {
        if (i == 0)
            repeatedText = [NSString stringWithFormat:@"%@",[self.textField text]];
        else
            repeatedText = [NSString stringWithFormat:@"%@ %@", repeatedText, [self.textField text]];
    }
    
    if ([[self.numberOfTimesTextField text] length] == 0 || [[self.numberOfTimesTextField text] isEqualToString:@"0"])
    {
        [self.numberOfTimesTextField setText:@"1"];
        repeatedText = [self.textField text];
    }
    
    [self performSelectorOnMainThread:@selector(finishedCalculationWithText:) withObject:repeatedText waitUntilDone:NO];
}

- (void)finishedCalculationWithText:(NSString*)text
{
    [self.textView setText:text];
    [self.activityView setHidden:YES];
}

- (IBAction)calculateButtonPressed:(id)sender
{
    [self hideKeyboardButtonPressed:nil];
    [self.activityView setHidden:NO];
    [self performSelectorOnMainThread:@selector(performIteration) withObject:nil waitUntilDone:NO];
}

- (IBAction)textFieldDidBeginEditing:(id)sender
{
    [self.closeKeyboardButton setHidden:NO];
}

- (IBAction)hideKeyboardButtonPressed:(id)sender
{
    [self.closeKeyboardButton setHidden:YES];
    [self.textField resignFirstResponder];
    [self.numberOfTimesTextField resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (!string.length) return YES;
    
    if (textField.keyboardType == UIKeyboardTypeNumberPad)
    {
        if ([string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound)
        {
            return NO;
        }
    }
    
    /*NSUInteger newLength = textField.text.length + string.length - range.length;
    if (newLength > 4) return NO;
    BOOL withinMaxLengthLimit = (newLength <= 4);
    if (!withinMaxLengthLimit) return NO;*/
    
    if (textField.text.length > 3) return NO;
    
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.calculateButton setBackgroundColor:[UIColor colorWithRed:0.063 green:0.486 blue:0.965 alpha:1.0]];
}

@end
