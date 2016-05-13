//
//  ViewController.h
//  TipCalculator
//
//  Created by Jayesh Wadhwani on 2016-05-13.
//  Copyright © 2016 Jayesh Wadhwani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)calculateTip:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;


@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;

@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UITextField *tippercentage;
- (IBAction)slidervalueChange:(id)sender;

@end

