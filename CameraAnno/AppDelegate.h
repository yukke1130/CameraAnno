//
//  AppDelegate.h
//  CameraAnno
//
//  Created by 橋本 雄祐 on 11/11/07.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class Tab1Controller;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UITabBarController *tabBar; // タブ・バーの宣言
}
@property (strong, nonatomic) UIWindow *window;
// @property *window のプロパティを定義
// [strong, nonatomic] 
// strong = ''
// nonatomic

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) Tab1Controller *tab1Controller;


@end
