//
//  AdColonyVideoViewController.h
//  Unity-iPhone
//
//  Created by DABAO on 16/1/7.
//
//

#import <UIKit/UIKit.h>

@interface AdColonyVideoViewController : UIViewController
{
    __block BOOL isShowVideo;
    
}
+(AdColonyVideoViewController*)ShareInstance;

-(void)initSDK;

-(void)showVungleVideo:(int)withType array:(NSArray*)array;
-(void)checkVideoAvailable:(BOOL)isAvailable array:(NSArray*)array;
@end
