//
//  ConversationListTableViewCell.m
//  HaviProjectBase
//
//  Created by Havi on 16/9/12.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import "ConversationListTableViewCell.h"
#import "JAActionButton.h"
#import "JASwipeCell.h"

@interface ConversationListTableViewCell ()
@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UILabel *titleDoctorLabel;
@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) UILabel *lineLabel1;

@property (nonatomic, strong) UILabel *titleStateLabel;
@property (nonatomic, strong) UIImageView *titleStateImage;
@property (nonatomic, strong) UILabel *textResponseLabel;

@property (nonatomic, strong) UIImageView *assementImage;
@property (nonatomic, strong) UIButton *assementButton;
@property (nonatomic, strong) UILabel *assementTime;
@property (nonatomic, strong) NSString *problemID;

@end

@implementation ConversationListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
        _lineLabel.alpha = 0.3;
        [self.topContentView addSubview:_lineLabel];
        [_lineLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topContentView.mas_left).offset(16);
            make.right.equalTo(self.topContentView.mas_right).offset(-16);
            make.height.equalTo(@0.5);
            make.top.equalTo(self.topContentView.mas_top).offset(44);
        }];
        _titleImageView = [[UIImageView alloc]init];
        _titleImageView.image = [UIImage imageNamed:@"docTitle"];
        [self.topContentView addSubview:_titleImageView];
        [_titleImageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topContentView.mas_left).offset(16);
            make.height.width.equalTo(@32);
            make.top.equalTo(self.topContentView.mas_top).offset(6);
        }];
        
        _titleDoctorLabel = [[UILabel alloc]init];
        _titleDoctorLabel.text = @"医生咨询";
        _titleDoctorLabel.font = [UIFont systemFontOfSize:13];
        _titleDoctorLabel.textColor = kTextDefaultWordColor;
        [self.topContentView addSubview:_titleDoctorLabel];
        [_titleDoctorLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleImageView.mas_right).offset(8);
            make.centerY.equalTo(self.titleImageView.mas_centerY);
        }];
        
        _titleStateLabel = [[UILabel alloc]init];
        _titleStateLabel.text = @"已回复";
        _titleStateLabel.textColor = kTextDefaultWordColor;
        _titleStateLabel.font = [UIFont systemFontOfSize:13];
        [self.topContentView addSubview:_titleStateLabel];
        
        [_titleStateLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.topContentView.mas_right).offset(-16);
            make.centerY.equalTo(self.titleImageView.mas_centerY);
        }];
        
        _titleStateImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"diage"]];
        [self.topContentView addSubview:_titleStateImage];
        [_titleStateImage makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleStateLabel.mas_left).offset(-8);
            make.centerY.equalTo(self.titleImageView.mas_centerY);
            make.height.width.equalTo(@20);
        }];
        
        _lineLabel1 = [[UILabel alloc]init];
        _lineLabel1.backgroundColor = [UIColor lightGrayColor];
        _lineLabel1.alpha = 0.3;
        [self.topContentView addSubview:_lineLabel1];
        [_lineLabel1 makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topContentView.mas_left).offset(16);
            make.right.equalTo(self.topContentView.mas_right).offset(-16);
            make.height.equalTo(@0.5);
            make.top.equalTo(self.topContentView.mas_top).offset(88);
        }];
        
        _textResponseLabel = [[UILabel alloc]init];
        _textResponseLabel.text= @"最近胃疼,天冷就胃疼，肿么办?";
        _textResponseLabel.font = [UIFont systemFontOfSize:14];
        _textResponseLabel.textColor = kTextDefaultWordColor;
        [self.topContentView addSubview:_textResponseLabel];
        [_textResponseLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_lineLabel.mas_bottom);
            make.left.equalTo(self.topContentView.mas_left).offset(16);
            make.right.equalTo(self.topContentView.mas_right).offset(-16);
            make.bottom.equalTo(_lineLabel1.mas_top);
        }];
        
        _assementImage = [[UIImageView alloc]init];
        _assementImage.image = [UIImage imageNamed:@"time"];
        [self.topContentView addSubview:_assementImage];
        [_assementImage makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topContentView.mas_left).offset(16);
            make.top.equalTo(self.lineLabel1).offset(6);
            make.height.width.equalTo(@15);
        }];
        
        _assementTime = [[UILabel alloc]init];
        _assementTime.text = @"09-10 13:44";
        _assementTime.textColor = kTextDefaultWordColor;
        _assementTime.font = [UIFont systemFontOfSize:11];
        [self.topContentView addSubview:_assementTime];
        [_assementTime makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_assementImage.mas_right).offset(8);
            make.centerY.equalTo(_assementImage.mas_centerY);
        }];
        
        _assementButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_assementButton setTitle:@"去评价" forState:UIControlStateNormal];
        _assementButton.hidden = YES;
        [_assementButton setTitleColor:[UIColor colorWithRed:0.153 green:0.659 blue:0.902 alpha:1.00] forState:UIControlStateNormal];
        _assementButton.layer.borderColor = [UIColor colorWithRed:0.153 green:0.659 blue:0.902 alpha:1.00].CGColor;
        _assementButton.layer.borderWidth = 0.5;
        _assementButton.layer.cornerRadius = 3;
        _assementButton.layer.masksToBounds = YES;
        [_assementButton.titleLabel setFont:[UIFont systemFontOfSize:11]];
        [_assementButton addTarget:self action:@selector(tapAssementButton) forControlEvents:UIControlEventTouchUpInside];
        [self.topContentView addSubview:_assementButton];
        [_assementButton makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.topContentView.mas_right).offset(-16);
            make.centerY.equalTo(self.assementImage.mas_centerY);
            make.height.equalTo(@20);
            make.width.equalTo(@40);
        }];
    }
    return self;
}

- (void)configCellWithDic:(id)para
{
    NSDictionary *paraDic = (NSDictionary *)para;
    self.problemID = [[paraDic objectForKey:@"problem"]objectForKey:@"id"];
    NSString *ask = [[paraDic objectForKey:@"problem"]objectForKey:@"title"];
    NSString *time = [[paraDic objectForKey:@"problem"] objectForKey:@"last_modified"];
    NSString *isAnswer = [[paraDic objectForKey:@"problem"]objectForKey:@"status"];
    _textResponseLabel.text = ask;
    _assementTime.text = [time substringWithRange:NSMakeRange(5, 11)];
    if ([isAnswer isEqualToString:@"n"]) {//新问题
        _titleStateLabel.text = @"待认领";
        _titleStateLabel.textColor = [UIColor colorWithRed:0.153 green:0.659 blue:0.902 alpha:1.00];
    }else if ([isAnswer isEqualToString:@"a"]){//已认领
        _titleStateLabel.text = @"已认领";
        _titleStateLabel.textColor = [UIColor colorWithRed:0.153 green:0.659 blue:0.902 alpha:1.00];
    }else if ([isAnswer isEqualToString:@"s"]){//已回复
        _titleStateLabel.text = @"已回复";
        _titleStateLabel.textColor = [UIColor colorWithRed:0.153 green:0.659 blue:0.902 alpha:1.00];
    }else if ([isAnswer isEqualToString:@"c"]){//已关闭
        _titleStateLabel.text = @"已关闭";
        _titleStateLabel.textColor = kTextDefaultWordColor;
    }else if ([isAnswer isEqualToString:@"d"]){//已评价
        _titleStateLabel.text = @"已评价";
        _titleStateLabel.textColor = kTextDefaultWordColor;
    }else if ([isAnswer isEqualToString:@"v"]){//用户以查看
        _titleStateLabel.text = @"待查看";
        _titleStateLabel.textColor = kTextDefaultWordColor;
    }
    int need_asses = [[[paraDic objectForKey:@"problem"]objectForKey:@"need_assess"]intValue];
    if (need_asses == 1) {
        _assementButton.hidden = NO;
    }else{
        _assementButton.hidden = YES;
    }
}

- (void)tapAssementButton
{
    self.didSelectedAssessmentButton(self.problemID);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end