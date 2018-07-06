//
//  JHViewController.m
//  JHScrollTextView
//
//  Created by Runzhi.Zhao on 07/06/2018.
//  Copyright (c) 2018 Runzhi.Zhao. All rights reserved.
//

#import "JHViewController.h"
#import "JHScrollTextView.h"

@interface JHViewController ()

@end

@implementation JHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.grayColor;
    
    NSArray *titles = @[@"本届世界杯的四分之一决赛即将来临,率先吹响号角的将是乌拉圭队和法国队之间的攻防大战,开赛时间是7月6日星期五22点整", @"[世界杯]C罗之神：帽子戏法 扛起全队", @"[豪门盛宴]C罗：没有遗憾 唯有再见"];
    
    JHScrollTextView *scrollTextView = [[JHScrollTextView alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 30) texts:nil];
    [self.view addSubview:scrollTextView];
    
    scrollTextView.texts = titles;
    [scrollTextView startAnimating];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
