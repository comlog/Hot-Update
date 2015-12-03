//
//  ViewController.m
//  HotUpdateDemo
//
//  Created by comnslog on 12/3/15.
//  Copyright © 2015 comnslog. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)userPrivateFrameworksBtnClicked:(id)sender {
    
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *bundlePath = [NSString stringWithFormat:@"%@/%@",documentDirectory,@"HotUpdateDemoFramework.framework"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:bundlePath]) {
        NSLog(@"file not exist ,now  return");
        return;
    }
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    if (!bundle || ![bundle load]) {
        NSLog(@"bundle load error");
    }
    
    Class loadClass = [bundle principalClass];
    if (!loadClass) {
        NSLog(@"get bundle class fail");
        return;
    }
    NSObject *bundleObj = [loadClass new];
    [bundleObj performSelector:@selector(showMyLog:) withObject:@"showMyLog"];

}

@end
