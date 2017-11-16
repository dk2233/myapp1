//
//  ViewController.h
//  test1_simple_ios7
//
//  Created by daniel on 15.05.2017.
//  Copyright © 2017 code masterss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIDevice.h>
#include "DifferentDefines.h"
#import <CoreMotion/CoreMotion.h>



@interface ViewController : UIViewController<UIAccelerometerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label_x;
@property (weak, nonatomic) IBOutlet UILabel *label_y;

@property (weak, nonatomic) IBOutlet UIView *Myview1;
@property (weak, nonatomic) IBOutlet UITextField *text_x;
@property (weak, nonatomic) IBOutlet UITextField *text_y;
@property (weak, atomic) IBOutlet UITextField *text1;




@property (weak, nonatomic) IBOutlet UIImageView *shoot1;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *imgRocket;

//ViewController.text1.minimumFontsize =1.0;
@property (weak, nonatomic) IBOutlet UILabel *AccLabel;
@property (weak, nonatomic) IBOutlet UILabel *accX;
@property (weak, nonatomic) IBOutlet UILabel *accY;
@property (weak, nonatomic) IBOutlet UILabel *accZ;

@property (weak, nonatomic) IBOutlet UILabel *RotLabel;
@property (weak, nonatomic) IBOutlet UILabel *RotX;
@property (weak, nonatomic) IBOutlet UILabel *RotY;
@property (weak, nonatomic) IBOutlet UILabel *RotZ;

- (IBAction)switchSwitched:(UISwitch *)sender;
- (IBAction)switchRocket2:(UISwitch *)sender;

- (IBAction)button1:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIPageControl *PageChange;

/*

@property (strong, nonatomic) IBOutlet UILabel *maxAccX;
@property (strong, nonatomic) IBOutlet UILabel *maxAccY;
@property (strong, nonatomic) IBOutlet UILabel *maxAccZ;

@property (strong, nonatomic) IBOutlet UILabel *rotX;
@property (strong, nonatomic) IBOutlet UILabel *rotY;
@property (strong, nonatomic) IBOutlet UILabel *rotZ;

@property (strong, nonatomic) IBOutlet UILabel *maxRotX;
@property (strong, nonatomic) IBOutlet UILabel *maxRotY;
@property (strong, nonatomic) IBOutlet UILabel *maxRotZ;
*/


//- (IBAction)resetMaxValues:(id)sender;

@property (strong, nonatomic) CMMotionManager *motionManager;

//@property (weak, nonatomic) IBOutlet UILabel *xlabel;
//@property (weak, nonatomic) IBOutlet UILabel *ylabel;
//@property (weak, nonatomic) IBOutlet UILabel *zlabel;

@end

