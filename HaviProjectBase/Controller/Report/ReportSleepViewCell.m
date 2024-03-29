//
//  ReportSleepViewCell.m
//  HaviProjectBase
//
//  Created by Havi on 16/2/27.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import "ReportSleepViewCell.h"
#import "SleepTimeTagView.h"

@interface ReportSleepViewCell ()

@property (nonatomic,strong) SleepTimeTagView *longSleepView;

@end
@implementation ReportSleepViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.longSleepView];
        UIView *lineViewBottom = [[UIView alloc]init];
        lineViewBottom.dk_backgroundColorPicker = DKColorWithColors([UIColor colorWithRed:0.161f green:0.251f blue:0.365f alpha:1.00f], [UIColor colorWithRed:0.349f green:0.608f blue:0.780f alpha:1.00f]);
        [self addSubview:lineViewBottom];
        [lineViewBottom makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_bottom).offset(-0.5);
            make.height.equalTo(@0.5);
            make.width.equalTo(self.mas_width);
        }];
    }
    return self;
}

- (SleepTimeTagView *)longSleepView
{
    if (_longSleepView == nil) {
        _longSleepView = [[SleepTimeTagView alloc]init ];
        _longSleepView.frame = CGRectMake(0, 1, self.frame.size.width, 58);
        _longSleepView.sleepNightCategoryString = @"睡眠时长";
        _longSleepView.dk_backgroundColorPicker = DKColorWithColors([UIColor colorWithRed:0.059f green:0.141f blue:0.231f alpha:1.00f], [UIColor colorWithRed:0.475f green:0.686f blue:0.820f alpha:1.00f]);

    }
    return _longSleepView;
}

- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath
    withOtherInfo:(id)objInfo
{
    // Rewrite this func in SubClass !
    SleepQualityModel *model = objInfo;
    __block QualityDetailModel *detailModel;
    if (indexPath.row == 1) {
        _longSleepView.sleepNightCategoryString = @"最长夜晚";
        @weakify(self);
        [SleepModelChange getSleepLongOrShortDurationWith:model type:1 callBack:^(id longSleep) {
            detailModel = longSleep;
            @strongify(self);
            self.longSleepView.sleepYearMonthDayString = detailModel.date;
            self.longSleepView.grade = [detailModel.sleepDuration floatValue]/24;
            NSString *sleepDuration = detailModel.sleepDuration;
            int hour = [sleepDuration intValue];
            double second2 = 0.0;
            double subsecond2 = modf([sleepDuration floatValue], &second2);
            NSString *sleepTimeDuration= @"";
            if((int)round(subsecond2*60)<10){
                sleepTimeDuration = [NSString stringWithFormat:@"%@时0%d分",hour<10?[NSString stringWithFormat:@"0%d",hour]:[NSString stringWithFormat:@"%d",hour],(int)round(subsecond2*60)];
            }else{
                sleepTimeDuration = [NSString stringWithFormat:@"%@时%d分",hour<10?[NSString stringWithFormat:@"0%d",hour]:[NSString stringWithFormat:@"%d",hour],(int)round(subsecond2*60)];
            }
            self.longSleepView.sleepTimeLongString = sleepTimeDuration;
        }];
    }else if(indexPath.row == 2){
        _longSleepView.sleepNightCategoryString = @"最短夜晚";
        @weakify(self);
        [SleepModelChange getSleepLongOrShortDurationWith:model type:-1 callBack:^(id longSleep) {
            detailModel = longSleep;
            @strongify(self);
            self.longSleepView.sleepYearMonthDayString = detailModel.date;
            self.longSleepView.grade = [detailModel.sleepDuration floatValue]/24;
            NSString *sleepDuration = detailModel.sleepDuration;
            int hour = [sleepDuration intValue];
            double second2 = 0.0;
            double subsecond2 = modf([sleepDuration floatValue], &second2);
            NSString *sleepTimeDuration= @"";
            if((int)round(subsecond2*60)<10){
                sleepTimeDuration = [NSString stringWithFormat:@"%@时0%d分",hour<10?[NSString stringWithFormat:@"0%d",hour]:[NSString stringWithFormat:@"%d",hour],(int)round(subsecond2*60)];
            }else{
                sleepTimeDuration = [NSString stringWithFormat:@"%@时%d分",hour<10?[NSString stringWithFormat:@"0%d",hour]:[NSString stringWithFormat:@"%d",hour],(int)round(subsecond2*60)];
            }
            self.longSleepView.sleepTimeLongString = sleepTimeDuration;
        }];
    }
    cell.dk_backgroundColorPicker = DKColorWithColors([UIColor colorWithRed:0.059f green:0.141f blue:0.231f alpha:1.00f], [UIColor colorWithRed:0.475f green:0.686f blue:0.820f alpha:1.00f]);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}


@end
