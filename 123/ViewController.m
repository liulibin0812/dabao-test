//
//  ViewController.m
//  123
//
//  Created by DABAO on 16/1/13.
//  Copyright © 2016年 DABAO. All rights reserved.
//

#import "ViewController.h"
#import "AdColonyVideoViewController.h"
//#import "Constants.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnAction:(id)sender {
//    [AdColony playVideoAdForZone:kAdColonyZoneID withDelegate:self withV4VCPrePopup:YES andV4VCPostPopup:YES];
//    [[AdColonyVideoViewController ShareInstance]initSDK];
    NSArray*arr=[[NSArray alloc]init];
    [[AdColonyVideoViewController ShareInstance]showVungleVideo:1 array:arr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
