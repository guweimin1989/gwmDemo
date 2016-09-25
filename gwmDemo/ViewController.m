//
//  ViewController.m
//  gwmDemo
//
//  Created by pangye on 16/9/24.
//  Copyright © 2016年 pangye. All rights reserved.
//
//1）学习uiviewcontroller执行次序，打印程序过程
//2）学习创建label
//3）学习创建button
//4）学习创建UITextField。如何收起键盘？
//5）学习创建UISwitch

#import "ViewController.h"

int tip=0;

@interface ViewController ()

@end

@implementation ViewController
//类的初始化方法
+(void)initialize{
    [super initialize];
    NSLog(@"%d initialize",++tip);
}
//对象初始化方法
-(instancetype)init{
    self = [super init];
    if(self){
    
    }
    NSLog(@"%d init",++tip);
    return self;
}
//从归档初始化
-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if(self){
    }
    NSLog(@"%d initWithCoder",++tip);
    return self;
}
//从nib初始化
-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%d awakeFromNib",++tip);
}
//加载视图
-(void)loadView{
    [super loadView];
    NSLog(@"%d loadView",++tip);
}
//将要加载视图
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%d viewDidLoad",++tip);
    //创建一个label
    {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 280, 80)];
        label.text=@"Hello World!it is a good idea.so what?";
        //设置背景颜色
        label.backgroundColor=[UIColor redColor];
        //设置字体和字号
        label.font=[UIFont systemFontOfSize:23];
        //设置字体颜色
        label.textColor=[UIColor whiteColor];
        //设置对齐模式
        label.textAlignment=NSTextAlignmentCenter;
        //设置阴影
          //label.shadowColor=[UIColor greenColor];
        //设置阴影偏移量，必须要设置，否则不显示阴影
          //label.shadowOffset=CGSizeMake(10, 10);
        //默认label都单行显示，可设置行数，0代表无限换行。但不好控制，需截断
        label.numberOfLines=0;
        //设置截断模式换行
        label.lineBreakMode=NSLineBreakByWordWrapping;
        [self.view addSubview:label];
    }
    //创建一个button
    {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
        button.frame=CGRectMake(50, 200, 280, 30);
        button.backgroundColor=[UIColor greenColor];
        [button setTitle:@"点我一下" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    //创建一个输入框textfield
    {
        UITextField *textfield=[[UITextField alloc]initWithFrame:CGRectMake(50, 260, 280, 30)];
        textfield.borderStyle=UITextBorderStyleRoundedRect;
        textfield.placeholder=@"请输入文字";
        [self.view addSubview:textfield];
    }
    //创建一个switch
    {
        UISwitch *swi=[[UISwitch alloc]initWithFrame:CGRectMake(50, 300, 100, 40)];
        swi.onTintColor=[UIColor greenColor];
        swi.tintColor=[UIColor redColor];
        swi.thumbTintColor=[UIColor orangeColor];
        [self.view addSubview:swi];
    }
}
//将要布局子视图
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"%d viewWillLayoutSubviews",++tip);
}
//已经布局子视图
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"%d viewDidLayoutSubviews",++tip);
}
//内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"%d didReceiveMemoryWarning",++tip);
}
//将要展示
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%d viewWillAppear",++tip);
}
//已经展示
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%d viewDidApper",++tip);
}
//将要消失
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%d viewWillDisappear",++tip);
}
//已经消失
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%d viewDidDisapper",++tip);
}
//被释放
-(void)dealloc{
    NSLog(@"%d dealloc",++tip);
}

//自定义的方法
-(void)changeColor{
    self.view.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
}

@end
