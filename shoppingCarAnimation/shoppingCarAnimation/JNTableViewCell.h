//
//  JNTableViewCell.h
//  shoppingCarAnimation
//
//  Created by Jiangergo Pk Czt on 16/9/7.
//  Copyright © 2016年 jiangergo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JNTableViewCell;
@protocol JNTableViewCellDelegate <NSObject>

@optional
- (void)sendJNCell:(JNTableViewCell *)cell location:(CGPoint)location;

@end

@interface JNTableViewCell : UITableViewCell

@property (nonatomic, weak) id <JNTableViewCellDelegate> delegate;

@end
