//
//  JNTableViewCell.m
//  shoppingCarAnimation
//
//  Created by Jiangergo Pk Czt on 16/9/7.
//  Copyright © 2016年 jiangergo. All rights reserved.
//

#import "JNTableViewCell.h"

@implementation JNTableViewCell

// 购物车按钮点击事件
- (IBAction)shoppingCarButtonAction:(UIButton *)sender {
    
    CGPoint point = [[UIApplication sharedApplication].keyWindow convertPoint:sender.center fromView:self];
    
    if ([self.delegate respondsToSelector:@selector(sendJNCell:location:)]) {
        [self.delegate sendJNCell:self location:point];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
