//
//  AdColonyVideoViewController.m
//  Unity-iPhone
//
//  Created by DABAO on 16/1/7.
//
//

#import "AdColonyVideoViewController.h"
#import "AdColony/AdColony.h"
#import "Constants.h"
//#import "VungleVideoViewController.h"
//#import "ChartBoostViewController.h"
@interface AdColonyVideoViewController ()<AdColonyDelegate,AdColonyAdDelegate>
{
    int type;
    NSArray*arr0;

}
@end
static AdColonyVideoViewController* instance = nil;

@implementation AdColonyVideoViewController

+(AdColonyVideoViewController*)ShareInstance{
    if (instance == nil) {
        instance = [[AdColonyVideoViewController alloc] init];
    }
    return instance;
}

-(id)init{
    self = [super init];
    if (self) {
        return self;
    }
    return nil;
}

-(void)initSDK{
    
    //Initialize AdColony only once, on initial launch
    [AdColony configureWithAppID:kAdColonyAppID zoneIDs:@[kAdColonyZoneID] delegate:self logging:YES];
    
}

-(void)showVungleVideo:(int)withType array:(NSArray*)array{
    arr0=array;
    if (isShowVideo) {
        
//        for (int i=3; i<array.count; i++) {
//            NSString*str=[array objectAtIndex:i];
//            if ([str isEqualToString:@"1"] ) {
//                if (i==3){
//                    [[VungleVideoViewController ShareInstance]showVungleVideo:withType array:array];
//                    return;
//                }else if (i==4){
//                    [[ChartBoostViewController ShareInstance]showRewardedVideo:withType array:array];
//                    return;
//                }
//                
//            }
//        }
        
        return;
    }
    type=withType;
    [AdColony playVideoAdForZone:kAdColonyZoneID withDelegate:self withV4VCPrePopup:YES andV4VCPostPopup:YES];
    
    
}


#pragma mark -AdColonyAdDelegate
- (void)onAdColonyAdFinishedWithInfo:(AdColonyAdInfo *)info{
//    NSLog(@"info=============%@",info);
    BOOL is=info.shown;
    if (is) {
        NSString *str = [NSString stringWithFormat:@"%d:%i",type,1];
        
//        UnitySendMessage("Platform", "OnVideoADSucc", [str UTF8String]);
        NSLog(@"视频播放成功！＊＊＊＊＊＊＊＊＊＊＊＊＊");
        
    }else{
//        UnitySendMessage("Platform", "OnVideoADFail", type);
        NSLog(@"视频播放不成功！＋＋＋＋＋＋＋＋＋＋");
    }
    [self checkVideoAvailable:false array:arr0];
    
}

-(void)checkVideoAvailable:(BOOL)isAvailable array:(NSArray*)array{
    isShowVideo=true;
    int a=[AdColony getVirtualCurrencyRewardsAvailableTodayForZone:kAdColonyZoneID];
    if (a!=0) {
        isShowVideo=false;
//        UnitySendMessage("Platform", "VideoCheck",[@"true" UTF8String]);
        NSLog(@"有视频可以播放＋＋＋＋＋＋＋＋＋＋");
        
    }else{
        isShowVideo=true;
        
        for (int i=3; i<arr0.count; i++) {
//            NSString*str=[arr0 objectAtIndex:i];
//            if ([str isEqualToString:@"1"]) {
//                if (i==3){
//                    
//                    [[VungleVideoViewController ShareInstance]checkVideoAvailable:false array:arr0];
//                    return;
//                }else if (i==4){
//                    [[ChartBoostViewController ShareInstance]checkVideoAvailable:false array:arr0];
//                    return;
//                }
//            }
//            
        }
        
        
//        UnitySendMessage("Platform", "VideoCheck",[@"false" UTF8String]);
        
        NSLog(@"没有视频可以播放＊＊＊＊＊＊＊＊＊＊＊");

        
        
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self updateCurrencyBalance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
