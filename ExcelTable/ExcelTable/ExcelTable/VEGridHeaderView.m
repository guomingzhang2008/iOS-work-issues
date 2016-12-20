//
//  VEGridHeaderView.m
//  venus
//
//  Created by deyi on 2016/12/16.
//  Copyright © 2016年 deyi. All rights reserved.
//

#import "VEGridHeaderView.h"

@interface VEGridHeaderView ()

@property (nonatomic, assign) NSInteger contentColumn;

@end

@implementation VEGridHeaderView


- (instancetype)initWithFrame:(CGRect)frame withColumn:(NSInteger)column {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        _labels = [NSMutableArray array];
        _contentColumn = column;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    for (int i = 0; i < _contentColumn; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [_labels addObject:label];
        [self addSubview:label];
    }
    for (int i = 0; i < _contentColumn; i++) {
        if (i == 0) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(1);
                make.top.equalTo(self.mas_top).offset(.5);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-.5);
                make.width.equalTo(_labels[i + 1]);
            }];
        } else if (i == _contentColumn - 1) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(.5);
                make.top.equalTo(self.mas_top).offset(.5);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(self.mas_right).offset(-.5);
                make.width.equalTo(_labels[0]);
            }];
        } else {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(.5);
                make.top.equalTo(self.mas_top).offset(.5);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-.5);
                make.width.equalTo(_labels[i + 1]);
            }];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
