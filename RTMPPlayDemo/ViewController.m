//
//  ViewController.m
//  RTMPPlayDemo
//
//  Created by 杨卢银 on 2018/5/18.
//  Copyright © 2018年 杨卢银. All rights reserved.
//

#import "ViewController.h"
#import "PlayViewController.h"
#import "PushViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _textField.text = @"rtmp://47.96.17.63:1935/live/demo";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if ([segue.identifier isEqualToString:@"main2play"]) {
        PlayViewController *vc = segue.destinationViewController;
        NSString *s = [[NSBundle mainBundle] pathForResource:@"fengqing" ofType:@"mp4"];
        vc.url = [NSURL fileURLWithPath:s];
    }else if ([@"main2push" isEqualToString:segue.identifier]){
        
        PushViewController *vc = segue.destinationViewController;
        vc.url = [NSURL URLWithString:_textField.text];
        
    }else{
        PlayViewController *vc = segue.destinationViewController;
        vc.url = [NSURL URLWithString:_textField.text];
    }
    
}


@end
