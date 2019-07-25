//
//  AYRCollectionViewController.m
//  自适应高度HeaderView
//
//  Created by 佳运 on 2019/5/6.
//  Copyright © 2019 佳运. All rights reserved.
//

#import "AYRCollectionViewController.h"
#import "AYRHeaderView.h"
#import "AYRModel.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define random(r, g, b, a)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

NSString *const kindHeaderValue = @"KindHeaderValue";
NSString *const kindCellValue = @"KindCellValue";

@interface AYRCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic, strong) AYRHeaderView *headerView;
@end

@implementation AYRCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self configData];
    // Do any additional setup after loading the view.
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(100, 100);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        
        CGRect aFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _collectionView = [[UICollectionView alloc]initWithFrame:aFrame collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kindCellValue];
        [_collectionView registerClass:[AYRHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kindHeaderValue];
    }
    return _collectionView;
}


#pragma mark - collectionView HeaderView高度
- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(SCREEN_WIDTH, self.headerView.height);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        self.headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kindHeaderValue forIndexPath:indexPath];
        
        reusableView = self.headerView;
    }
    return reusableView;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kindCellValue forIndexPath:indexPath];
    cell.backgroundColor = randomColor;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *dataArray = [[NSArray alloc]initWithObjects:@"翻拍的《新方世玉》定于2019年2月开拍，总集数40，就是剧情有点随意，五枚师太成了终极幕后黑手，在部分野史上记载，方世玉是死于五枚师太手上，可是在大部分的影视剧作品中，五枚师太都是好人设定，总有点担心这个《新方世玉》会成为雷剧。在此之前，我们还是先看看下面十四个版本方世玉，新版能超越哪一个？",@"傅声前后四次参演方世玉一角，曾是张彻最疼爱的弟子之一，是邵氏的台柱级影星，不仅身手了得，而且为人热情、搞笑。遗憾的是英年早逝，去世时仅29岁。",@"傅声前后四次参演方世玉一角，曾是张彻最疼爱的弟子之一，是邵氏的台柱级影星，不仅身手了得，而且为人热情、搞笑。遗憾的是英年早逝，去世时仅29岁。",@"《新火烧红莲寺》：季天笙",@"电影中最知名的是李连杰版本，那么电视剧最知名的就是张卫健了，是许多人的童年记忆。整部剧集妙趣横生、起伏跌宕，最喜欢里面的方世玉和苗翠花，两个人更像是一对姐弟，亲密无间。当然也有不少揪心的地方，那就是小小和方世玉之间的感情，还好最后小小没有出家，要不然真像《少年张三丰》一样那么遗憾了",@"在演艺圈哪一个演员比较合适呢？", nil];
    
    AYRModel *model = [[AYRModel alloc]init];
    model.title = dataArray[[self getRandomNumber:0 with:5]];
    self.headerView.model = model;
    
    [self.collectionView reloadData];
}

- (AYRHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[AYRHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    }
    return _headerView;
}

- (void)configData{
    NSArray *dataArray = [[NSArray alloc]initWithObjects:@"翻拍的《新方世玉》定于2019年2月开拍，总集数40，就是剧情有点随意，五枚师太成了终极幕后黑手，在部分野史上记载，方世玉是死于五枚师太手上，可是在大部分的影视剧作品中，五枚师太都是好人设定，总有点担心这个《新方世玉》会成为雷剧。在此之前，我们还是先看看下面十四个版本方世玉，新版能超越哪一个？",@"傅声前后四次参演方世玉一角，曾是张彻最疼爱的弟子之一，是邵氏的台柱级影星，不仅身手了得，而且为人热情、搞笑。遗憾的是英年早逝，去世时仅29岁。",@"傅声前后四次参演方世玉一角，曾是张彻最疼爱的弟子之一，是邵氏的台柱级影星，不仅身手了得，而且为人热情、搞笑。遗憾的是英年早逝，去世时仅29岁。",@"《新火烧红莲寺》：季天笙",@"电影中最知名的是李连杰版本，那么电视剧最知名的就是张卫健了，是许多人的童年记忆。整部剧集妙趣横生、起伏跌宕，最喜欢里面的方世玉和苗翠花，两个人更像是一对姐弟，亲密无间。当然也有不少揪心的地方，那就是小小和方世玉之间的感情，还好最后小小没有出家，要不然真像《少年张三丰》一样那么遗憾了",@"在演艺圈哪一个演员比较合适呢？", nil];
    AYRModel *model = [[AYRModel alloc]init];
    model.title = dataArray[[self getRandomNumber:0 with:5]];
    self.headerView.model = model;
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
