//
//  BINMenuView.m
//  BIN_Weibo_Sina
//
//  Created by 彬~ on 15/6/13.
//  Copyright (c) 2015年 bin~. All rights reserved.
//

#import "BINPopView.h"

#define CurrentScreenBounds [[UIScreen mainScreen] bounds]

@interface BINPopView ()
@property(nonatomic,weak)UIImageView * meunImageView;
@property(nonatomic,weak)UIButton * cover;
@property(nonatomic,strong)UIView * contentView;
@end

@implementation BINPopView
+(instancetype)menuWithContentView:(UIView*)contentView{
    return [[self alloc] initWithContentView:contentView];
}
/**
 *初始化方法
 */
-(instancetype)initWithContentView:(UIView*)contentView{
    self = [super init];
    
    if(self){
        self.contentView = contentView;
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CurrentScreenBounds;
        UIButton * cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        UIImageView * meunImageView = [[UIImageView alloc] init];
        meunImageView.userInteractionEnabled = YES;
        [self addSubview:meunImageView];
        self.meunImageView = meunImageView;
        self.arrowPosition = BINPopViewArrowPositionCenter;
        
    }
    return self;
}

-(void)coverClick:(UIButton*)sender{
    [self dismiss];
}

-(void)setBackgroundImage:(UIImage *)img{
    self.meunImageView.image = img;
}

-(void)setArrowPosition:(BINPopViewArrowPosition)arrowPosition{
    _arrowPosition = arrowPosition;
    switch (arrowPosition) {
        case BINPopViewArrowPositionLeft:
            self.meunImageView.image = [self resizedImage:@"popover_background_left"];
            break;
        case BINPopViewArrowPositionCenter:
            self.meunImageView.image = [self resizedImage:@"popover_background"];
            break;
        case BINPopViewArrowPositionRight:
            self.meunImageView.image = [self resizedImage:@"popover_background_right"];
            break;
        default:
            break;
    }
}


-(void)setFuzzyBackground:(BOOL)fuzzyBackground{
    _fuzzyBackground = fuzzyBackground;
    if(fuzzyBackground){
        self.cover.backgroundColor = [UIColor blackColor];
        self.cover.alpha = 0.3;
    }else{
        self.cover.backgroundColor = [UIColor clearColor];
        self.cover.alpha = 1.0;
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.cover.frame = self.bounds;
}

/**
 *在指定区域显示菜单
 */
-(void)showInRect:(CGRect)rect{
   UIWindow * window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
    self.meunImageView.frame = rect;
    if(self.contentView){
    CGFloat margin = 10;
    CGRect contentVF = CGRectMake(margin, 5+margin, rect.size.width-2*margin, (rect.size.height-2*margin)-5);
    self.contentView.frame = contentVF;
    [self.meunImageView addSubview:self.contentView];

    }
}
/**
 *关闭菜单
 */
-(void)dismiss{
    if([self.delegate respondsToSelector:@selector(popViewWillDismiss:)]){
        [self.delegate popViewWillDismiss:self];
    }
    [self removeFromSuperview];
}


-(UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
