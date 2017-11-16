//
//  DifferentDefines.h
//  myappp_simpleRocket
//
//  Created by daniel on 16.06.2017.
//  Copyright © 2017 code masterss. All rights reserved.
//

#ifndef DifferentDefines_h
#define DifferentDefines_h





//#define  DELTA_Y  2U
//#define  DELTA_X  2U
#define  IMG_DELTA  5U
#define  GYRO_DELTA 2U
#define  MAX_X    250U
#define  MAX_Y    500U
#define  DELTA_TIME     0.02

uint32_t rand_nu;

NSTimer *timer1;
NSTimer *timer2_1s;
NSTimer *timer_05;
NSTimer *timer_moving_enemy;
UITextField *new_text_copied;

double currentMaxAccelX = 0;
double currentMaxAccelY = 0;
double currentMaxAccelZ =0 ;
double currentMaxRotX = 0 ;
double currentMaxRotY = 0;
double currentMaxRotZ = 0 ;

CGFloat red_f = 0.0, blue_f=0.0, green_f = 0.0 ;
CGFloat var ;

CGPoint Point_of_uiview_cgp;
CGPoint imgCenter;
CGPoint delta_img1 = {IMG_DELTA, IMG_DELTA};
CGPoint rocket_loc_cgp;
CGPoint point_shoot;
//UIButton *button1;
char *string1;
SInt8   DELTA_X = 2U;
SInt8   DELTA_Y = 2U;


uint8_t SwitchState = 0;
uint8_t RocketState = 0;
uint8_t ShootHidden = 0;



#endif /* DifferentDefines_h */

