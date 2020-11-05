//
//  ViewController.m
//  WKWebView探究
//
//  Created by 许明洋 on 2020/10/22.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSURLRequest *request;

@end

@implementation ViewController

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"WKWebView探究";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    if (self.request) {
        [self.webView loadRequest:self.request];
    }
}

- (WKWebView *)webView {
    if (_webView) {
        return _webView;
    }
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) configuration:config];
    _webView.opaque = NO;
    _webView.navigationDelegate = self;
//    [_webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
    return _webView;
}

#pragma mark - WKNavigationDelegate


@end
