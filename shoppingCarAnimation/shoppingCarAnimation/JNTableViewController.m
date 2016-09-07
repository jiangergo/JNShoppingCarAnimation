//
//  JNTableViewController.m
//  shoppingCarAnimation
//
//  Created by Jiangergo Pk Czt on 16/9/7.
//  Copyright © 2016年 jiangergo. All rights reserved.
//

#import "JNTableViewController.h"
#import "JNTableViewCell.h"

static NSString *reuseID = @"cell";

@interface JNTableViewController ()<JNTableViewCellDelegate>

@end

@implementation JNTableViewController

- (void)viewDidAppear:(BOOL)animated{
    // 添加底部视图
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 50, [UIScreen mainScreen].bounds.size.width, 50)];
    bottomView.backgroundColor = [UIColor colorWithRed:0.42 green:0.27 blue:0.04 alpha:1.00];
    [[UIApplication sharedApplication].keyWindow addSubview:bottomView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)sendJNCell:(JNTableViewCell *)cell location:(CGPoint)location{
    
    // 创建小圆点
    UIImageView *smallBall = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_common_point"]];
    smallBall.center = location;
    
    // 添加到keywindow
    [[UIApplication sharedApplication].keyWindow addSubview:smallBall];
    
    // 创建关键帧动画
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 设置起点
    [path moveToPoint:location];
    
    // 最高点
    CGPoint controlPoint = CGPointMake(location.x - 100, location.y - 300);
    
    // 终点
    CGPoint endPoint = CGPointMake(50, [UIScreen mainScreen].bounds.size.height - 50);
    
    // 抛物线
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    // 设置关键帧动画路径
    keyframeAnimation.path = path.CGPath;
    
    // 设置动画时长
    keyframeAnimation.duration = 0.5;
    
    // KVO设置删除小球
    [keyframeAnimation setValue:smallBall forKey:@"smallBall"];
    
    // 设置代理监听动画执行
    keyframeAnimation.delegate = self;
    
    // 添加动画
    [smallBall.layer addAnimation:keyframeAnimation forKey:@"keyframeAnimation"];
    
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    UIImageView *smallBall = (UIImageView *)[anim valueForKey:@"smallBall"];
    
    [smallBall removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    cell.delegate = self;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
