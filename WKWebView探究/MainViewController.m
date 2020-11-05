//
//  MainViewController.m
//  WKWebView探究
//
//  Created by 许明洋 on 2020/10/22.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"

@interface MainViewController ()

@property (nonatomic) UIButton *testButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"主界面";
    
    self.testButton.center = self.view.center;
    [self.view addSubview:self.testButton];
}

- (UIButton *)testButton {
    if (_testButton) {
        return _testButton;
    }
    _testButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_testButton setTitle:@"点击跳转" forState:UIControlStateNormal];
    [_testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_testButton addTarget:self action:@selector(testButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    return _testButton;
}

- (void)testButtonClicked {
    ViewController *vc = [[ViewController alloc] initWithUrl:[NSURL URLWithString:@"https://www.baidu.com/"]];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
