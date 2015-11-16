//
//  ViewController.m
//  BINPopViewDemo
//
//  Created by BIN on 15/11/16.
//  Copyright © 2015年 BIN. All rights reserved.
//

#import "ViewController.h"
#import "BINPopView.h"
#define BINScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,BInPopViewDelegate>


@property (weak, nonatomic) IBOutlet UIBarButtonItem *left;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *right;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * titleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    titleBtn.frame = CGRectMake(0, 0, 60, 44);
    
    [titleBtn setTitle:@"标题" forState:(UIControlStateNormal)];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [titleBtn addTarget:self action:@selector(titleItemClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    self.navigationItem.titleView = titleBtn;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BINPopView *)popViewWith:(BINPopViewArrowPosition)arrowPosition{
    UITableView * tabelView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    tabelView.tag = arrowPosition;
    tabelView.delegate = self;
    tabelView.dataSource = self;
    BINPopView * popView = [BINPopView menuWithContentView:tabelView];
    popView.delegate = self;
    popView.arrowPosition = arrowPosition;
    
    
    return popView;
    
}

NSString * NSStringFromEnum(BINPopViewArrowPosition arrowPosition){
    switch (arrowPosition) {
        case BINPopViewArrowPositionLeft:
            return @"ArrowPositionLeft";
            break;
        case BINPopViewArrowPositionCenter:
            return @"ArrowPositionCenter";
            break;
        case BINPopViewArrowPositionRight:
            return @"ArrowPositionRight";
            break;
        default:
            return nil;
        break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * ID = [NSString stringWithFormat:@"cellWithtag:%ld",tableView.tag];
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
    }
    
    cell.textLabel.text = NSStringFromEnum(tableView.tag);
    
    return cell;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (tableView.tag) {
        case BINPopViewArrowPositionLeft:
            return 3;
            break;
        case BINPopViewArrowPositionCenter:
            return 8;
            break;
        case BINPopViewArrowPositionRight:
            return 5;
            break;
        default:
            return 0;
            break;
    }
    
    
}

-(void)titleItemClick:(UIButton *)sender{
    
    BINPopView * popView = [self popViewWith:BINPopViewArrowPositionCenter];
    popView.fuzzyBackground = YES;
    CGFloat menuW = 200;
    CGFloat menuH = 300;
    [popView showInRect:CGRectMake((BINScreenW/2.0)-(menuW/2.0),self.topLayoutGuide.length, menuW, menuH)];
    
    
    
}

- (IBAction)leftItemClick:(UIBarButtonItem *)sender {
    
    BINPopView * popView = [self popViewWith:BINPopViewArrowPositionLeft];
    popView.fuzzyBackground = NO;
    CGFloat menuW = 200;
    CGFloat menuH = 88;
    [popView showInRect:CGRectMake(0,self.topLayoutGuide.length, menuW, menuH)];
    
    
}
- (IBAction)rightItemClick:(UIBarButtonItem *)sender {

    BINPopView * popView = [self popViewWith:BINPopViewArrowPositionRight];
    popView.fuzzyBackground = YES;
    CGFloat menuW = 200;
    CGFloat menuH = 144;
    [popView showInRect:CGRectMake((BINScreenW- menuW),self.topLayoutGuide.length, menuW, menuH)];




}

@end
