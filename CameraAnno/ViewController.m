//
//  ViewController.m
//  CameraAnno
//
//  Created by 橋本 雄祐 on 11/11/07.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"test");
    CGRect rect = CGRectMake(160, 200, 200, 30);
    myLabel = [[UILabel alloc]initWithFrame:(rect)];
    myLabel.text = @"anno";
    
    CGRect rect2 = CGRectMake(160, 300, 200, 30);
    myLabel2 = [[UILabel alloc]initWithFrame:(rect2)];
    myLabel2.text = @"anno2";
    
    // ボタン例文
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(160, 100, 100, 30);
    [btn setTitle:@"押してね" forState:UIControlStateNormal];
    [btn setTitle:@"ぽち" forState:UIControlStateHighlighted];
    [btn setTitle:@"押せません" forState:UIControlStateDisabled];
    
        
    // ボタンがタッチダウンされた時にhogeメソッドを呼び出す
    [btn addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventTouchDown];
    
    
    [self.view addSubview:btn];
    
    
    
    [self.view addSubview:myLabel];
    [self.view addSubview:myLabel2];
    
    
    //    self.view = myLabel2;
}

- (void)hoge:(UIButton*)button
{
    NSLog(@"click");
    NSLog(@"%d", [self.view.subviews count]);
    
    [myLabel removeFromSuperview];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) dealloc {
    NSLog(@"release");
    [myLabel release];
}

@end
