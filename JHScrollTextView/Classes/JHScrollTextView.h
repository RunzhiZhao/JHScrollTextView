//
//  JHScrollTextView.h
//  JHScrollTextView
//
//  Created by Runzhi.Zhao on 2018/7/6.
//

#import <UIKit/UIKit.h>

@interface JHScrollTextView : UIView

@property (nonatomic, copy) NSArray *texts;

@property (nonatomic, assign) BOOL isCycle;

/**
 文本滚动速度系数，默认6, 必须大于0
 */
@property (nonatomic, assign) CGFloat speed;

/**
 滚动时间间隔，默认2s
 */
@property (nonatomic, assign) NSTimeInterval scrollTimeInterval;

- (instancetype)initWithFrame:(CGRect)frame texts:(NSArray <NSString *> *)texts;

- (void)startAnimating;
- (void)stopAnimating;

@end
