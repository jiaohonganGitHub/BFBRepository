//
//  AYRHeaderView.m
//  自适应高度HeaderView
//
//  Created by 佳运 on 2019/5/6.
//  Copyright © 2019 佳运. All rights reserved.
//

#import "AYRHeaderView.h"
#import <Masonry/Masonry.h>
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface AYRHeaderView()
@property (nonatomic, weak) UILabel *label;
@end

@implementation AYRHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(10);
            make.top.equalTo(self).with.offset(10);
            make.height.mas_equalTo(@100);
            make.width.mas_equalTo(@(SCREEN_WIDTH - 20));
        }];
        
        imageView.backgroundColor = [UIColor redColor];
        
        UILabel *label = [[UILabel alloc]init];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(10);
            make.top.equalTo(imageView.mas_bottom).with.offset(10);
            make.right.equalTo(self).with.offset(-10);
            make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        }];
        label.font = [UIFont systemFontOfSize:18];
//        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 0;
        label.textColor = [UIColor greenColor];
        self.label = label;
        
        [self layoutIfNeeded];
        self.height = CGRectGetMaxY(self.label.frame) + 120;
    }
    return self;
}

- (void)setModel:(AYRModel *)model{
    _model = model;
    self.label.text = model.title;
    
    [self layoutIfNeeded];
    self.height = CGRectGetMaxY(self.label.frame) + 120;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
