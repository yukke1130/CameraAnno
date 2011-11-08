//
//  AppDelegate.m
//  CameraAnno
//
//  Created by 橋本 雄祐 on 11/11/07.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "Tab1Controller.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize tab1Controller = _tab1Controller;

- (void)dealloc
{
    [tabBar release]; // タブ・バーのメモリを開放
    [_window release];
    [_viewController release];
    [super dealloc];
}

/**
 * 一番初めに呼ばれます
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    // ViewControllerにオブジェクトが渡される
//    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
//    self.window.rootViewController = self.viewController;
//    [self.window makeKeyAndVisible];
    
    
//    UITabBarController *tbc =[[UITabBarController alloc] init];
//    UIView *view1 = [[UIView alloc] init];
//    UIView *view2 = [[UIView alloc] init];
//    NSArray *views = [NSArray arrayWithObjects:view1, view2, nil];
//    [tbc setViewControllers:views animated:NO];
//    [self.window addSubview:tbc.view];    
//    [self.window makeKeyAndVisible];
    
    
    // １番目のViewControllerを作ってタブのタイトルとアイコンを指定
    Tab1Controller *view1 = [[[Tab1Controller alloc] init] autorelease];
    view1.title = @"一番";
    view1.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0] autorelease];
    
    // １番目のViewControllerにテキストを加える
    UITextView *text1 = [[[UITextView alloc] initWithFrame:CGRectMake(10, 100, 200, 50)] autorelease];
    text1.text = @"これはView 1です";
    text1.font = [UIFont systemFontOfSize:30];
    [view1.view addSubview:text1];
    

    // カメラのボタンを作ります
    UIViewController *cameraView = [[[ViewController alloc] init] autorelease];
    cameraView.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1] autorelease];

    
        
    
    // 2番目のViewControllerを作ってタブのタイトルとアイコンを指定
    UIViewController *view2 = [[[ViewController alloc] init] autorelease];
    view2.title = @"二番";
    view2.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2] autorelease];
    
    // 2番目のViewControllerにテキストを加える
    UITextView *text2 = [[[UITextView alloc] initWithFrame:CGRectMake(10, 100, 200, 50)] autorelease];
    text2.text = @"View 2はこれです";
    text2.font = [UIFont systemFontOfSize:30];
    [view2.view addSubview:text2];
    
    // タブ・バーを作って二つのViewControllerを付け加える
    tabBar = [[UITabBarController alloc] init];
    tabBar.viewControllers = [NSArray arrayWithObjects:view1, cameraView, view2, nil];
    // delegete を自分自身に設定してあげると tabBarControllerが呼ばれる
    tabBar.delegate = self;
    
        
    
    // タブ・バーをメインのウインドウに付け加える
    [self.window addSubview:tabBar.view];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    if (tabBarController.selectedIndex == 1) {
        NSLog(@"tab click");
        
        UIImagePickerController *ipc = [[[UIImagePickerController alloc] init] autorelease];  // 生成
        ipc.delegate = self;  // デリゲートを自分自身に設定
        // ipc.sourceType = UIImagePickerControllerSourceTypeCamera;  // 画像の取得先をカメラに設定
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary; // 画像の取得先ギャラリー
        
        ipc.allowsEditing = YES;  // 画像取得後編集する
        [viewController presentModalViewController:ipc animated:YES];
        // モーダルビューとしてカメラ画面を呼び出す
    }

    
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    NSLog(@"pic choosed");
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
