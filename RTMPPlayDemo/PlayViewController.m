//
//  PlayViewController.m
//  RTMPPlayDemo
//
//  Created by 杨卢银 on 2018/5/22.
//  Copyright © 2018年 杨卢银. All rights reserved.
//

#import "PlayViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface PlayViewController ()

@property(nonatomic,strong)IJKFFMoviePlayerController * player;

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //    IJKFFOptions *options = [IJKFFOptions optionsByDefault]; //使用默认配置
    //    //硬解
    //    [options setPlayerOptionIntValue:0 forKey:@"videotoolbox"];
    
    
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    
    // Set param
    [options setFormatOptionIntValue:1024 * 16 forKey:@"probsize"];
    [options setFormatOptionIntValue:50000 forKey:@"analyzeduration"];
    [options setPlayerOptionIntValue:0 forKey:@"videotoolbox"];
    [options setCodecOptionIntValue:IJK_AVDISCARD_DEFAULT forKey:@"skip_loop_filter"];
    [options setCodecOptionIntValue:IJK_AVDISCARD_DEFAULT forKey:@"skip_frame"];
    
    [options setPlayerOptionIntValue:100 forKey:@"max_cached_duration"];   // 最大缓存大小是3秒，可以依据自己的需求修改
    [options setPlayerOptionIntValue:1 forKey:@"infbuf"];  // 无限读
    [options setPlayerOptionIntValue:0 forKey:@"packet-buffering"];  //  关闭播放器缓冲
    
    //    if (_isLive) {
    //        // Param for living
    //        [options setPlayerOptionIntValue:3000 forKey:@"max_cached_duration"];   // 最大缓存大小是3秒，可以依据自己的需求修改
    //        [options setPlayerOptionIntValue:1 forKey:@"infbuf"];  // 无限读
    //        [options setPlayerOptionIntValue:0 forKey:@"packet-buffering"];  //  关闭播放器缓冲
    //    } else {
    //        // Param for playback
    //        [options setPlayerOptionIntValue:0 forKey:@"max_cached_duration"];
    //        [options setPlayerOptionIntValue:0 forKey:@"infbuf"];
    //        [options setPlayerOptionIntValue:1 forKey:@"packet-buffering"];
    //    }
    
    
    NSURL * url = _url;
    if (url == nil ) {
        NSString *s = @"rtmp://47.96.17.63:1935/live/demo";
        url = [NSURL URLWithString:s];
    }
    
    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:options]; //初始化播放器，播放在线视频或直播(RTMP)
    self.player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.player.view.frame = self.view.bounds;
    self.player.scalingMode = IJKMPMovieScalingModeAspectFit; //缩放模式
    self.player.shouldAutoplay = YES; //开启自动播放
    
    self.view.autoresizesSubviews = YES;
    [self.view addSubview:self.player.view];
    
    
    [self.player prepareToPlay];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.player shutdown];
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
