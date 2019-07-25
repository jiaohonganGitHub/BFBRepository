//
//  AYRTableViewController.m
//  自适应高度HeaderView
//
//  Created by 佳运 on 2019/5/6.
//  Copyright © 2019 佳运. All rights reserved.
//

#import "AYRTableViewController.h"
#import <Masonry/Masonry.h>
#import "UIView+AYRLib.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


@interface AYRTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *headView;
@property (nonatomic,weak) UILabel *label;

@end

@implementation AYRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self configHeadView];
    [self configData];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)configHeadView{
    
    self.tableView.tableHeaderView = [UIView new];
    
    self.headView = [UIView new];
    [self.tableView.tableHeaderView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tableView.tableHeaderView).with.offset(0);
        make.top.equalTo(self.tableView.tableHeaderView).with.offset(0);
        make.right.equalTo(self.tableView.tableHeaderView).with.offset(0);
    }];
    self.headView.backgroundColor = [UIColor grayColor];
    
    UIView *View = [[UIView alloc]init];
    [self.headView addSubview:View];
    [View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView).with.offset(10);
        make.top.equalTo(self.headView).with.offset(10);
        make.right.equalTo(self.headView).with.offset(-10);
        make.height.mas_equalTo(@100);
    }];
    View.backgroundColor = [UIColor redColor];
    
    
    UILabel *Label = [[UILabel alloc]init];
    [self.headView addSubview:Label];
    [Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView).with.offset(10);
        make.top.equalTo(View.mas_bottom).with.offset(10);
        make.right.equalTo(self.headView).with.offset(-10);
        make.bottom.equalTo(self.headView.mas_bottom).with.offset(-10);
    }];
    Label.font = [UIFont systemFontOfSize:18];
    Label.textAlignment = NSTextAlignmentLeft;
    Label.numberOfLines = 0;
    Label.textColor = [UIColor greenColor];
    self.label = Label;
}
- (void)setupUI{
    
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        CGRect aFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _tableView = [[UITableView alloc]initWithFrame:aFrame style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.userInteractionEnabled = YES;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 100;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.textLabel.text = @"CELL";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *dataArray = [[NSArray alloc]initWithObjects:@"翻拍的《新方世玉》定于2019年2月开拍，总集数40，就是剧情有点随意，五枚师太成了终极幕后黑手，在部分野史上记载，方世玉是死于五枚师太手上，可是在大部分的影视剧作品中，五枚师太都是好人设定，总有点担心这个《新方世玉》会成为雷剧。在此之前，我们还是先看看下面十四个版本方世玉，新版能超越哪一个？",@"傅声前后四次参演方世玉一角，曾是张彻最疼爱的弟子之一，是邵氏的台柱级影星，不仅身手了得，而且为人热情、搞笑。遗憾的是英年早逝，去世时仅29岁。",@"傅声前后四次参演方世玉一角，曾是张彻最疼爱的弟子之一，是邵氏的台柱级影星，不仅身手了得，而且为人热情、搞笑。遗憾的是英年早逝，去世时仅29岁。",@"《新火烧红莲寺》：季天笙",@"电影中最知名的是李连杰版本，那么电视剧最知名的就是张卫健了，是许多人的童年记忆。整部剧集妙趣横生、起伏跌宕，最喜欢里面的方世玉和苗翠花，两个人更像是一对姐弟，亲密无间。当然也有不少揪心的地方，那就是小小和方世玉之间的感情，还好最后小小没有出家，要不然真像《少年张三丰》一样那么遗憾了",@"在演艺圈哪一个演员比较合适呢？", nil];
    
    self.label.text = dataArray[[self getRandomNumber:0 with:5]];
    
    [self.tableView.tableHeaderView layoutIfNeeded];
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.headView.height);
    [self.tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (void)configData{
    
    NSArray *dataArray = [[NSArray alloc]initWithObjects:@"翻拍的《新方世玉》定于2019年2月开拍，总集数40，就是剧情有点随意，五枚师太成了终极幕后黑手，在部分野史上记载，方世玉是死于五枚师太手上，可是在大部分的影视剧作品中，五枚师太都是好人设定，总有点担心这个《新方世玉》会成为雷剧。在此之前，我们还是先看看下面十四个版本方世玉，新版能超越哪一个？",@"傅声前后四次参演方世玉一角，曾是张彻最疼爱的弟子之一，是邵氏的台柱级影星，不仅身手了得，而且为人热情、搞笑。遗憾的是英年早逝，去世时仅29岁。",@"傅声前后四次参演方世玉一角，曾是张彻最疼爱的弟子之一，是邵氏的台柱级影星，不仅身手了得，而且为人热情、搞笑。遗憾的是英年早逝，去世时仅29岁。",@"《新火烧红莲寺》：季天笙",@"电影中最知名的是李连杰版本，那么电视剧最知名的就是张卫健了，是许多人的童年记忆。整部剧集妙趣横生、起伏跌宕，最喜欢里面的方世玉和苗翠花，两个人更像是一对姐弟，亲密无间。当然也有不少揪心的地方，那就是小小和方世玉之间的感情，还好最后小小没有出家，要不然真像《少年张三丰》一样那么遗憾了",@"在演艺圈哪一个演员比较合适呢？", nil];
    
    self.label.text = dataArray[[self getRandomNumber:0 with:5]];
    
    [self.tableView.tableHeaderView layoutIfNeeded];
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.headView.height);
}

- (NSUInteger)getRandomNumber:(NSUInteger)from with:(NSUInteger)to{//包括两边边界
    
    NSUInteger res =  from + (arc4random() % (to - from + 1));
    return res;
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
