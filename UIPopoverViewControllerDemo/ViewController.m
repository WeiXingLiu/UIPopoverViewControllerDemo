//
//  ViewController.m
//  UIPopoverViewControllerDemo
//
//  Created by LZXuan on 15-8-6.
//  Copyright (c) 2015年 轩哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"pop" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    UIButton*button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 100, 50);
    [button setTitle:@"pop" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)btnClick:(UIButton *)button {
    //设置 泡泡内容视图控制器
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    //设置弹出模式
    vc.modalPresentationStyle = UIModalPresentationPopover;//气泡弹出
    //设置弹出的大小
    vc.preferredContentSize = CGSizeMake(200, 200);
   
    //获取视图控制器的 泡泡控制器
    UIPopoverPresentationController *popVC = vc.popoverPresentationController;
    //设置泡泡 从哪个视图弹出
    vc.popoverPresentationController.sourceView = button;
    //设置泡泡弹出的位置
    vc.popoverPresentationController.sourceRect = button.bounds;
    //设置三角标的方向
    popVC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    //设置代理
    popVC.delegate = self;
    //弹出气泡
    [self presentViewController:vc animated:YES completion:nil];
}
#pragma mark - 协议方法
//如果要想在iPhone上也能弹出泡泡的样式必须要实现下面协议的方法
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {

    return UIModalPresentationNone;
}

- (void)itemClick:(UIBarButtonItem *)item {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    //弹出模式
    vc.modalPresentationStyle = UIModalPresentationPopover;
    //泡泡内容的大小
    vc.preferredContentSize = CGSizeMake(200, 200);
    //获取泡泡
    UIPopoverPresentationController *popVC = vc.popoverPresentationController;
    //从item 弹出
    popVC.barButtonItem = item;
    popVC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popVC.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
