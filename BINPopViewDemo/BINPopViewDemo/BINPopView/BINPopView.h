//
//  BINMenuView.h
//  BIN_Weibo_Sina
//
//  Created by 彬~ on 15/6/13.
//  Copyright (c) 2015年 bin~. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BINPopView;

typedef NS_ENUM(NSInteger, BINPopViewArrowPosition){
    BINPopViewArrowPositionLeft,
    BINPopViewArrowPositionCenter,
    BINPopViewArrowPositionRight
};

@protocol BInPopViewDelegate <NSObject>

@optional
-(void)popViewWillDismiss:(BINPopView*)popView;
@end

@interface BINPopView : UIView
@property(nonatomic,weak)id <BInPopViewDelegate> delegate;
/**
 *菜单箭头位置
 */
@property(nonatomic,unsafe_unretained)BINPopViewArrowPosition arrowPosition;
/**
 *是否虚化背景
 */
@property(nonatomic,unsafe_unretained,getter=isFuzzyBackground)BOOL fuzzyBackground;
/**
 *初始化方法
 */
-(instancetype)initWithContentView:(UIView*)contentView;
+(instancetype)menuWithContentView:(UIView*)contentView;

/**
 *设置菜单的背景图片
 */
-(void)setBackgroundImage:(UIImage*)img;
/**
 *在指定区域显示菜单
 */
-(void)showInRect:(CGRect)rect;
/**
 *关闭菜单
 */
-(void)dismiss;

@end
