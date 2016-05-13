//
//  ViewController.m
//  TipCalculator
//
//  Created by Jayesh Wadhwani on 2016-05-13.
//  Copyright © 2016 Jayesh Wadhwani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>



@end

@implementation ViewController
@synthesize tipAmountLabel,billAmountTextField;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)calculateTip:(id)sender {
    NSDecimalNumber * n2;
    NSDecimalNumber *tip;
    
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init] ;
    if ([nf numberFromString: billAmountTextField.text] != nil) {
        
        if ([self.tippercentage hasText]) {
            
            
            
            n2 = [NSDecimalNumber decimalNumberWithString:self.tippercentage.text ];
            n2= [n2 decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"100"]];
            
        }
        else
            
        {  n2 = [NSDecimalNumber decimalNumberWithString:@"0.15"];}
        
        
        
        
        tip = [NSDecimalNumber decimalNumberWithString:billAmountTextField.text];
        tipAmountLabel.text =  [NSString stringWithFormat:@"%@ $ ",[tip decimalNumberByMultiplyingBy:n2] ];
        
    }else
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Alert " message:@"Only Numbers" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    
    
    NSValue *keyboardInfo = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = [keyboardInfo CGRectValue];
    
    CGFloat height = rect.size.height;
    
    
    CGRect viewBounds = self.view.bounds;
    viewBounds.origin.y += height;
    NSLog(@"%@", NSStringFromCGRect(viewBounds));
    self.view.bounds = viewBounds;
    
    
    NSLog(@"check");
}



-(void)keyboardDidHide:(NSNotification *)notification
{
    NSValue *keyboardInfo = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = [keyboardInfo CGRectValue];
    CGFloat height = rect.size.height;
    
    CGRect viewBounds = self.view.bounds;
    viewBounds.origin.y -= height;
    NSLog(@"%@", NSStringFromCGRect(viewBounds));
    self.view.bounds = viewBounds;
    
    
    
    NSLog(@"check");
    
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    if ([self.textField isFirstResponder]) {
//        [self.textField resignFirstResponder];
//    }
//}


    
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}









- (IBAction)slidervalueChange:(id)sender {
self.tippercentage.text = [NSString stringWithFormat:@"%0.2f", self.mySlider.value];

}
@end
