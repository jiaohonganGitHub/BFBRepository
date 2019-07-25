//
//  AYRHeaderView.h
//  自适应高度HeaderView
//
//  Created by 佳运 on 2019/5/6.
//  Copyright © 2019 佳运. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYRModel.h"
#import "UIView+AYRLib.h"
NS_ASSUME_NONNULL_BEGIN

@interface AYRHeaderView : UICollectionReusableView
//@property (nonatomic, assign) CGFloat estimatedHeight;
@property (nonatomic, strong) AYRModel *model;
@end

NS_ASSUME_NONNULL_END
