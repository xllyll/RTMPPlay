//
//  PushViewController.m
//  RTMPPlayDemo
//
//  Created by 杨卢银 on 2018/5/22.
//  Copyright © 2018年 杨卢银. All rights reserved.
//

#import "PushViewController.h"
#import "LFLivePreview.h"

@interface PushViewController ()

@property (strong , nonatomic)LFLivePreview *livePreview;

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _livePreview = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
    _livePreview.rootViewController = self;
    _livePreview.url = _url.absoluteString;
    [self.view addSubview:_livePreview];
    
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
