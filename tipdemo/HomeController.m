//
//  HomeController.m
//  tipdemo
//
//  Created by David Sainte-Claire on 6/6/14.
//  Copyright (c) 2014 David Sainte-Claire. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()
- (IBAction)tenPercentButtonTapGesture:(id)sender;
- (IBAction)twentyPercentButtonTapGesture:(id)sender;
- (IBAction)fifteenPercentButtonTapGesture:(id)sender;
- (void)onSettingsButton;
@property (weak, nonatomic) IBOutlet UIButton *twentyPercentTipButton;
@property (weak, nonatomic) IBOutlet UIButton *fifteenPercentTipButton;
@property (weak, nonatomic) IBOutlet UIButton *tenPercentTipButton;
@property (weak, nonatomic) IBOutlet UILabel *twentyPercentTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *fifteenPercentTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *tenPercentTipLabel;

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@end

@implementation HomeController
UIColor *unselected;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Homework";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    unselected = self.tenPercentTipLabel.backgroundColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tenPercentButtonTapGesture:(id)sender {
    if (![self.billTextField.text isEqualToString:@""]) {
        [self.view endEditing:YES];
        self.tenPercentTipLabel.backgroundColor = [UIColor darkGrayColor];
        self.fifteenPercentTipLabel.backgroundColor = unselected;
        self.twentyPercentTipLabel.backgroundColor = unselected;
        float billAmount = [self.billTextField.text floatValue];
        float tipAmout = billAmount * 0.10;
        float totalAmount = billAmount + tipAmout;
        self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tipAmout];
        self.totalLabel.text = [NSString stringWithFormat:@"%.2f", totalAmount];
    }
    
}
- (IBAction)twentyPercentButtonTapGesture:(id)sender {
    if (![self.billTextField.text isEqualToString:@""]) {
        [self.view endEditing:YES];
        self.twentyPercentTipLabel.backgroundColor = [UIColor darkGrayColor];
        self.fifteenPercentTipLabel.backgroundColor = unselected;
        self.tenPercentTipLabel.backgroundColor = unselected;
        float billAmount = [self.billTextField.text floatValue];
        float tipAmout = billAmount * 0.20;
        float totalAmount = billAmount + tipAmout;
        self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tipAmout];
        self.totalLabel.text = [NSString stringWithFormat:@"%.2f", totalAmount];
    }
}

- (IBAction)fifteenPercentButtonTapGesture:(id)sender {
    if (![self.billTextField.text isEqualToString:@""]) {
        [self.view endEditing:YES];
        self.fifteenPercentTipLabel.backgroundColor = [UIColor darkGrayColor];
        self.twentyPercentTipLabel.backgroundColor = unselected;
        self.tenPercentTipLabel.backgroundColor = unselected;
        float billAmount = [self.billTextField.text floatValue];
        float tipAmout = billAmount * 0.15;
        float totalAmount = billAmount + tipAmout;
        self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tipAmout];
        self.totalLabel.text = [NSString stringWithFormat:@"%.2f", totalAmount];
    }
}

- (void)onSettingsButton {
    NSLog(@"Settings Button Clicked");
}
@end
