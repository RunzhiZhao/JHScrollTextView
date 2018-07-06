//
//  JHScrollTextView.m
//  JHScrollTextView
//
//  Created by Runzhi.Zhao on 2018/7/6.
//

#import "JHScrollTextView.h"

@interface JHScrollTextView ()

@property (nonatomic, strong) UILabel *contentLabel;

@end


@implementation JHScrollTextView


- (instancetype)initWithFrame:(CGRect)frame texts:(NSArray <NSString *> *)texts {
    if (self = [super initWithFrame:frame]) {
        
        _texts = [texts copy];
        _scrollTimeInterval = 2.0;
        _speed = 6.0;
        
        [self shareUI];
    }
    return self;
}


#pragma mark - Private

static NSInteger textIndex = 0;

- (void)shareUI {
    self.clipsToBounds = YES;
    [self addSubview:self.contentLabel];
    [self configContentLabel];
}

/// 动画1：从视图左侧滚出, -label.width
- (void)animateFirstStep {
    
    // 文本frame
    CGRect labelFrame = self.contentLabel.frame;
    
    __block CGRect block_labelFrame = labelFrame;
    
    // 保持相同速度动画时间
    NSTimeInterval duration = labelFrame.size.width/self.speed * 0.1;
    
    [UIView animateWithDuration:duration delay:self.scrollTimeInterval options:UIViewAnimationOptionCurveLinear animations:^{
        
        block_labelFrame.origin.x = - labelFrame.size.width;
        self.contentLabel.frame = block_labelFrame;
        
    } completion:^(BOOL finished) {
        
        // 执行动画2
        [self animateSecondStep];
    }];
}

/// 动画2: 从视图右侧滚进, - self.width
- (void)animateSecondStep {
    
    // 刷新文本显示
    textIndex++;
    if (textIndex >= self.texts.count) {
        textIndex = 0;
    }
    [self configContentLabel];
    
    // 视图frame
    CGRect frame = self.frame;
    // 文本frame
    CGRect labelFrame = self.contentLabel.frame;
    
    // 确保label在视图右侧
    labelFrame.origin.x = frame.size.width;
    self.contentLabel.frame = labelFrame;
    labelFrame = self.contentLabel.frame;
    
    __block CGRect block_labelFrame = labelFrame;
    
    // 保持相同速度动画时间
    NSTimeInterval duration = frame.size.width/self.speed * 0.1;
    
    // 开始动画
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{

        block_labelFrame.origin.x = 0.0f;
        self.contentLabel.frame = block_labelFrame;
        
    } completion:^(BOOL finished) {
        
        // 执行动画1
        [self animateFirstStep];
    }];
    
}


/**
 根据index设置文本显示，并适配label的frame
 */
- (void)configContentLabel {
    if (self.texts.count > 0 && textIndex < self.texts.count) {
        // text
        self.contentLabel.text = self.texts[textIndex];
        // centerY
        [self.contentLabel sizeToFit];
        CGPoint center = self.contentLabel.center;
        center.y = self.frame.size.height/2.0;
        self.contentLabel.center = center;
    } else {
        self.contentLabel.text = @"";
    }
}

#pragma mark - Public
- (void)startAnimating {
    if (self.texts.count > 0) {
        [self animateFirstStep];
    }
}

- (void)stopAnimating {
    
}


#pragma mark - Setter
- (void)setTexts:(NSArray *)texts {
    _texts = [texts copy];
    [self configContentLabel];
}


#pragma mark - Getter

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        label.textColor = UIColor.whiteColor;
        label.font = [UIFont systemFontOfSize:12.0];
        _contentLabel = label;
    }
    return _contentLabel;
}


@end
