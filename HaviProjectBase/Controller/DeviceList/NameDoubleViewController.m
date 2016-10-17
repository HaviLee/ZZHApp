//
//  NameDoubleViewController.m
//  SleepRecoding
//
//  Created by Havi on 15/11/13.
//  Copyright © 2015年 Havi. All rights reserved.
//

#import "NameDoubleViewController.h"
#import "MMPopupItem.h"
#import "LBXAlertAction.h"
#import "ReactiveDoubleViewController.h"
#import "ProgressView.h"
@interface NameDoubleViewController ()
@property (nonatomic, strong) UITextField *leftText;
@property (nonatomic, strong) UITextField *rightText;
@property (nonatomic, strong) SCBarButtonItem *leftBarItem;

@end

@implementation NameDoubleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubView];
}

- (void)initSubView
{
    
    ProgressView *p = [[ProgressView alloc]init];
    p.frame = (CGRect){0,64,self.view.frame.size.width,3};
    [self.view addSubview:p];
    p.selectIndex = 2;
    self.backgroundImageView.image = [UIImage imageNamed:@""];

    self.leftBarItem = [[SCBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"new_navi_back"] style:SCBarButtonItemStylePlain handler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.sc_navigationItem.title = @"床垫命名";
    self.sc_navigationItem.leftBarButtonItem = self.leftBarItem;
    self.view.backgroundColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.00];
    //
    UILabel *deviceLabel = [[UILabel alloc]init];
    [self.view addSubview:deviceLabel];
    [deviceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.height.equalTo(@44);
    }];
    deviceLabel.font = kDefaultWordFont;
    deviceLabel.text = self.doubleDeviceName;
    deviceLabel.textColor = kWhiteBackTextColor;
    //
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.image = [UIImage imageNamed:@"bed@3x"];
    [self.view addSubview:bgView];
    bgView.userInteractionEnabled = YES;
    bgView.layer.borderColor = [UIColor whiteColor].CGColor;
    bgView.layer.borderWidth = 1;
    [bgView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(deviceLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(bgView.mas_width);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
    }];
    //
    UIView *lineView = [[UIView alloc]init];
    [bgView addSubview:lineView];
    lineView.backgroundColor = [UIColor clearColor];
    [lineView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView.mas_centerX);
        make.width.equalTo(@2);
        make.top.equalTo(bgView.mas_top);
        make.bottom.equalTo(bgView.mas_bottom);
    }];
    //
    _leftText = [[UITextField alloc]init];
    [bgView addSubview:_leftText];
    _leftText.text = @"Left";
    _leftText.layer.masksToBounds = YES;
    _leftText.layer.borderWidth = 1;
    _leftText.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _leftText.textAlignment = NSTextAlignmentLeft;
    _leftText.borderStyle = UITextBorderStyleNone;
    _leftText.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    leftImage.image = [UIImage imageNamed:@"bi"];
    [bgView addSubview:leftImage];
    _rightText = [[UITextField alloc]init];
    [bgView addSubview:_rightText];
    _rightText.textAlignment = NSTextAlignmentLeft;
    _rightText.layer.masksToBounds = YES;
    _rightText.layer.borderWidth = 1;
    _rightText.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _rightText.text = @"Right";
    _rightText.leftViewMode = UITextFieldViewModeAlways;
    _rightText.borderStyle = UITextBorderStyleNone;
    UIImageView *rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    rightImage.image = [UIImage imageNamed:@"bi"];
    [bgView addSubview:rightImage];
    //
    [_leftText makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView.mas_centerY).offset(5);
        make.height.equalTo(@25);
        make.width.equalTo(@60);
        make.left.equalTo(bgView.mas_left).offset(10);
    }];
    
    UIImageView *left_line = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"left_text_line"]];
    [bgView addSubview:left_line];
    [left_line makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftText.mas_right).offset(1);
        make.top.equalTo(_leftText.mas_top).offset(12.5);
        make.height.equalTo(@22);
        make.width.equalTo(@30);
    }];
    [_rightText makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView.mas_centerY).offset(-15);
        make.height.equalTo(@25);
        make.width.equalTo(@60);
        make.right.equalTo(bgView.mas_right).offset(-5);
    }];
    UIImageView *left_line1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"right_text_line"]];
    [bgView addSubview:left_line1];
    [left_line1 makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_rightText.mas_left).offset(-1);
        make.top.equalTo(_rightText.mas_top).offset(12.5);
        make.height.equalTo(@22);
        make.width.equalTo(@30);
    }];
    
    
    //
    [leftImage makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_leftText.mas_top);
        make.left.equalTo(bgView.mas_left).offset(0);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    [rightImage makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_rightText.mas_top);
        make.right.equalTo(bgView.mas_right).offset(0);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    
    //
    //
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:nextButton];
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(addProduct:) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"button_down_image@3x"] forState:UIControlStateNormal];
    nextButton.layer.cornerRadius = 0;
    nextButton.layer.masksToBounds = YES;
    [nextButton.titleLabel setFont:kDefaultWordFont];
    [nextButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(bgView.mas_bottom).offset(40);
        make.height.equalTo(@49);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
    }];
    //返回
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:backButton];
//    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [backButton setTitle:@"暂时不关联" forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(backSuperView:) forControlEvents:UIControlEventTouchUpInside];
//    [backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"textbox_hollow_%d",selectedThemeIndex]] forState:UIControlStateNormal];
//    backButton.layer.cornerRadius = 0;
//    backButton.layer.masksToBounds = YES;
//    [backButton.titleLabel setFont:kDefaultWordFont];
//    [backButton makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.top.equalTo(nextButton.mas_bottom).offset(20);
//        make.height.equalTo(@49);
//        make.width.equalTo(bgView.mas_width);
//    }];
    
}

- (void)addProduct:(UIButton *)sender
{
    [self bindingDeviceWithUUID:nil];
}

-(void)backSuperView:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark 绑定硬件

- (void)bindingDeviceWithUUID:(NSString *)UUID
{
    if (self.leftText.text.length == 0) {
        [NSObject showHudTipStr:@"请输入左侧床垫名称"];
        return;
    }
    if (self.rightText.text.length == 0) {
        [NSObject showHudTipStr:@"请输入右侧床垫名称"];
        return;
    }
    
    if (self.leftText.text.length > 8) {
        [NSObject showHudTipStr:@"设备名称超过8位"];
        return;
    }
    
    if (self.rightText.text.length > 8) {
        [NSObject showHudTipStr:@"设备名称超过8位"];
        return;
    }
    NSArray *_arrDeatilListDescription = self.dicDetailDevice;
    NSArray *_sortedDetailDevice = [_arrDeatilListDescription sortedArrayUsingComparator:^NSComparisonResult(SensorList* _Nonnull obj1, SensorList* _Nonnull obj2) {
        return [obj1.subDeviceUUID compare:obj2.subDeviceUUID options:NSCaseInsensitiveSearch];
    }];
    NSDictionary *para = @{
                           @"UserID":thirdPartyLoginUserId,
                           @"DeviceList":@[
                                   @{
                                       @"UUID":self.barUUIDString,
                                       @"Description":self.doubleDeviceName,
                                       },
                                   @{
                                       @"UUID":((SensorList *)[_sortedDetailDevice objectAtIndex:0]).subDeviceUUID,
                                       @"Description":self.leftText.text,
                                       },
                                   @{
                                       @"UUID":((SensorList *)[_sortedDetailDevice objectAtIndex:1]).subDeviceUUID,
                                       @"Description":self.rightText.text,
                                       }
                                   ]
                           };
    DeBugLog(@"初始化设备信息是%@",para);
    ZZHAPIManager *client = [ZZHAPIManager sharedAPIManager];
    [client requestRenameMyDeviceParams:para andBlock:^(BaseModel *resultModel, NSError *error) {
        if (resultModel) {
            [self activeUUID:self.barUUIDString];
        }
    }];
}
//激活
- (void)activeUUID:(NSString *)UUID
{
    NSDictionary *dic14 = @{
                            @"UserID": thirdPartyLoginUserId,
                            @"UUID": UUID,
                            };
    ZZHAPIManager *client = [ZZHAPIManager sharedAPIManager];
    
    [client requestActiveMyDeviceParams:dic14 andBlock:^(BaseModel *resultModel, NSError *error) {
        if (resultModel) {
            [[NSNotificationCenter defaultCenter]postNotificationName:kUserChangeUUIDInCenterView object:nil];
            @weakify(self);
            
            [LBXAlertAction showAlertWithTitle:@"绑定成功" msg:@"您已经成功绑定该设备，是否现在激活？" chooseBlock:^(NSInteger buttonIdx) {
                @strongify(self);
                //点击完，继续扫码
                [[NSNotificationCenter defaultCenter]postNotificationName:kRefreshDeviceList object:nil];
                switch (buttonIdx) {
                    case 0:{
                        [self.navigationController popToRootViewControllerAnimated:YES];
                        break;
                    }
                    case 1:{
                        ReactiveDoubleViewController *doubleUDP = [[ReactiveDoubleViewController alloc]init];
                        [self.navigationController pushViewController:doubleUDP animated:YES];
                        break;
                    }
                        
                    default:
                        break;
                }
            } buttonsStatement:@"稍后激活",@"现在激活",nil];
        }
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
