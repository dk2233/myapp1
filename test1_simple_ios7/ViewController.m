//
//  ViewController.m
//  test1_single_view
//
//  Created by daniel on 13.05.2017.
//  Copyright © 2017 code masterss. All rights reserved.
//

#import "ViewController.h"
#include "math.h"
//#import "CoreMotion\CoreMotion.h"




@interface ViewController ()

@end



/*
void  position_of_text1(NSObject view1)
{
    
    
    
}*/


// TODO �
/* adding of moving shoot with moving ship */
/* adding of moving ENEMY */

@implementation ViewController

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    //if ( [Switch1.SwitchState])
    return UIInterfaceOrientationMaskPortrait;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}




-(IBAction)switchSwitched:(UISwitch *)sender{
    
    //ViewController.
    //[ Switch1 isOn];
    if (SwitchState==0)
        SwitchState = 1;
    else
        SwitchState = 0;
    
    //self.label1.text = @"aaaa";
}
/*
- (IBAction)switchRocket2:(UISwitch *)sender {
    if (RocketState==0)
        RocketState = 1;
    else
        RocketState = 0;
}
*/
- (IBAction)button1:(UIButton *)sender {
    
    sender.showsTouchWhenHighlighted = TRUE;
    if (sender.state == TRUE)
    {
        
        point_shoot = self.imgRocket.center;
        
        [_text1 setText: @"PAFF"];
        [_shoot1  setHidden:(NO) ];
        ShootHidden = NO;
        point_shoot.y -= 40;
        [self.shoot1 setCenter:point_shoot];
        
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    currentMaxAccelX = 0.0;
    currentMaxAccelY = 0.0;
    currentMaxAccelZ =0.0 ;
    currentMaxRotX = 0.0 ;
    currentMaxRotY = 0.0;
    currentMaxRotZ = 0.0 ;
    
    self.text1.textColor = [UIColor colorWithRed:0.4 green:0.1 blue:1.0 alpha:1.0];
    self.text1.font = [UIFont fontWithName:(@"Futura") size:16];
    self.text1.minimumFontSize =  1.0;
    
    self.text_x.enabled= NO;
    self.text_x.highlighted = YES;
    self.text_y.enabled= NO;
    self.text1.enabled= NO;
    
    // i start that timer as soon as app load
timer1 = [NSTimer scheduledTimerWithTimeInterval:0.2
                    target: self
                selector:@selector(onTimer)
                userInfo: nil repeats: YES];

    
timer2_1s = [NSTimer scheduledTimerWithTimeInterval:DELTA_TIME
            target: self
            selector:@selector(onTimer_1s)
                userInfo: nil
            repeats: YES];
   
    
    timer_05 = [NSTimer scheduledTimerWithTimeInterval:0.4
                  target: self
                selector:@selector(onTimer_shoot)
                userInfo: nil repeats: YES];

    timer_moving_enemy = [NSTimer scheduledTimerWithTimeInterval:4.0
                      target: self
                      selector:@selector(whenEnemyChangeDirection)
                      userInfo:nil repeats:(YES)];
    
    
    
    Point_of_uiview_cgp.x = 0.0;
    Point_of_uiview_cgp.y = 0.0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.1;
    self.motionManager.gyroUpdateInterval = 0.1;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
       withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
        [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
            }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
        withHandler:^(CMGyroData *gyroData, NSError *error) {
      [self outputRotationData:gyroData.rotationRate];
                                    }];
    
    _RotLabel.transform = CGAffineTransformMakeRotation(-M_PI/2.0);
    
    //self.imgRocket.copy = imgRocket2;
    
    //new_text_copied
    [_shoot1 setHidden:(YES)];
    ShootHidden = YES;
    
    
    
    
    self.text1.textColor = [UIColor colorWithRed:0.4 green:0.1 blue:1.0 alpha:1.0];
    self.text1.font = [UIFont fontWithName:(@"Futura") size:16];
    self.text1.minimumFontSize =  1.0;
    rocket_loc_cgp = _imgRocket.center;
    self.text1.center = CGPointMake(rocket_loc_cgp.x + 50.0,   rocket_loc_cgp.y+10.0);
    self.text1.enabled= NO;
    [self.text1 setHidden:YES];
    
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    
    self.accX.text = [NSString stringWithFormat:@" %.2fg",acceleration.x];
    if(fabs(acceleration.x) > fabs(currentMaxAccelX))
    {
        currentMaxAccelX = acceleration.x;
    }
    self.accY.text = [NSString stringWithFormat:@" %.2fg",acceleration.y];
    if(fabs(acceleration.y) > fabs(currentMaxAccelY))
    {
        currentMaxAccelY = acceleration.y;
    }
    self.accZ.text = [NSString stringWithFormat:@" %.2fg",acceleration.z];
    if(fabs(acceleration.z) > fabs(currentMaxAccelZ))
    {
        currentMaxAccelZ = acceleration.z;
    }
    
    rocket_loc_cgp = _imgRocket.center;
    
    if (RocketState == 1)
    {
        [self.imgRocket setCenter:CGPointMake(
            rocket_loc_cgp.x+acceleration.x*IMG_DELTA,
            rocket_loc_cgp.y- acceleration.y*IMG_DELTA )];
        self.text1.center = CGPointMake(rocket_loc_cgp.x + 50.0,   rocket_loc_cgp.y+10.0);
        
        if (ShootHidden == (NO))
        {
            point_shoot = self.imgRocket.center;
            point_shoot.y -= 40;
            [self.shoot1 setCenter:point_shoot];

        }
        
    }
    
    /*self.maxAccX.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelX];
    self.maxAccY.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelY];
    self.maxAccZ.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelZ];
    */

}
-(void)outputRotationData:(CMRotationRate)rotation
{
    
    self.RotX.text = [NSString stringWithFormat:@" %.2fr/s",rotation.x];
    if(fabs(rotation.x) > fabs(currentMaxRotX))
    {
        currentMaxRotX = rotation.x;
    }
    self.RotY.text = [NSString stringWithFormat:@" %.2fr/s",rotation.y];
    if(fabs(rotation.y) > fabs(currentMaxRotY))
    {
        currentMaxRotY = rotation.y;
    }
    self.RotZ.text = [NSString stringWithFormat:@" %.2fr/s",rotation.z];
    if(fabs(rotation.z) > fabs(currentMaxRotZ))
    {
        currentMaxRotZ = rotation.z;
    }
    /*
    self.maxRotX.text = [NSString stringWithFormat:@" %.2f",currentMaxRotX];
    self.maxRotY.text = [NSString stringWithFormat:@" %.2f",currentMaxRotY];
    self.maxRotZ.text = [NSString stringWithFormat:@" %.2f",currentMaxRotZ];
    */
    imgCenter =  self.img1.center;
    delta_img1.x =  GYRO_DELTA*rotation.y;
    delta_img1.y =  GYRO_DELTA*rotation.x;
    
    if ((imgCenter.y < 0) || (imgCenter.y > MAX_Y))
    {
        if(imgCenter.y < 0)
        {
            imgCenter.y = 15;
        }
        else if (imgCenter.y > MAX_Y)
        {
            imgCenter.y = MAX_Y-20;
        }
    }
    //imgCenter.y += delta_img1;
    self.img1.center = CGPointMake(imgCenter.x+delta_img1.x,
                                   imgCenter.y+delta_img1.y);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onTimer {
    
    if (red_f >= 1.0 ){
        red_f = 0.0;
        //blue_f = 0.0 ;
        green_f = 0.0;
    }
    else{
        red_f +=0.1;
        green_f +=0.1;
        //blue_f +=0.1;
    }
    
    rand_nu =arc4random_uniform(100);
    [_text1 setText: @(rand_nu).stringValue];
    
    //[NSString stringWithFormat:(@"%d",(NSNumber *)rand_nu)];
    
    //[ NSString stringWithCharacters:(string1) length:10];

    blue_f = rand_nu/100;
   self.text1.textColor = [UIColor colorWithRed: red_f green:green_f blue:blue_f alpha:1.0];
    }


-(void)onTimer_1s {
    /* this is for UIView -> rectangular 
     */
    if (SwitchState == 1)
    {
        Point_of_uiview_cgp.y += DELTA_Y;
        Point_of_uiview_cgp.x += DELTA_X;

        
        if (Point_of_uiview_cgp.y > MAX_Y ){
            Point_of_uiview_cgp.y -= MAX_Y ;
        }
        else if (Point_of_uiview_cgp.y < 0 )
        {
            Point_of_uiview_cgp.y += MAX_Y ;
        }
        
        
        if (Point_of_uiview_cgp.x > MAX_X ){
            Point_of_uiview_cgp.x -= MAX_X ;
        }
        else if (Point_of_uiview_cgp.x < 0 )
        {
            Point_of_uiview_cgp.x += MAX_X ;
        }
        
    }
    
    /* 
     *this is how I set properties
     */
    //self.text_x.text = @(delta_img1).stringValue;
    //this is how I use method to set property
     //[self.text_x  setText:@(delta_img1).stringValue];
    
    
    
    [self.text_x setTextColor:[UIColor colorWithRed: red_f green:green_f blue:blue_f alpha: 1.0]];
    [self.text_x setTextColor:[UIColor colorWithRed: red_f green:green_f blue:blue_f alpha:1.0] ];
    //[self set.text_x:@"aaaa"];
    //[self.text_x setText:@"aaaa"];
    
    self.Myview1.center = Point_of_uiview_cgp;
    
    
    //self.accX.text = @(rand_nu).stringValue;
    //CGPointMake(rand_nu*1.5, rand_nu*2.0);
    self.text_x.text =@(rocket_loc_cgp.x).stringValue;
    self.text_y.text = @(rocket_loc_cgp.y).stringValue;
}



-(void)onTimer_shoot {
    
    [_shoot1  setHidden:(YES)];
    ShootHidden = YES;
}


-(void)whenEnemyChangeDirection {
    rand_nu =arc4random_uniform(6);
    DELTA_X = rand_nu -3;
    rand_nu =arc4random_uniform(6);
    DELTA_Y = rand_nu -3;

    
    
}



/*
-(IBAction)switchSwitched:(UISwitch *)sender{
    
    if (SwitchState==0)
        SwitchState = 1;
    else
        SwitchState = 0;
    
    //self.label1.text = @"aaaa";
}
*/



- (IBAction)switchRocket2:(UISwitch *)sender {
    if (RocketState==0)
    {
        RocketState = 1;
        [ _text1 setHidden:NO];
    }
    else
    {
        RocketState = 0;
        
        [_text1 setHidden:YES];
    }
}


@end

