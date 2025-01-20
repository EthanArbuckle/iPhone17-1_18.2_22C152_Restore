@interface CHAchievementsRecentAndRelevantDataSource
- (AAUIAchievementsDataProvider)dataProvider;
- (AAUIBadgeImageFactory)badgeImageFactory;
- (ACHAchievementLocalizationProvider)localizationProvider;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CHAchievementsRecentAndRelevantDataSource)initWithDataProvider:(id)a3 collectionView:(id)a4 localizationProvider:(id)a5 badgeImageFactory:(id)a6;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)cellWidth;
- (double)collectionView:layout:minimumInteritemSpacingForSectionAtIndex:;
- (double)maxCellHeight;
- (double)preferredCollectionViewHeight;
- (id)achievementTappedHandler;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)achievementsDataProviderDidUpdate:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)fontChanged:(id)a3;
- (void)invalidateMaxCellHeight;
- (void)setAchievementTappedHandler:(id)a3;
- (void)setBadgeImageFactory:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setLocalizationProvider:(id)a3;
- (void)setMaxCellHeight:(double)a3;
- (void)setPreferredCollectionViewHeight:(double)a3;
@end

@implementation CHAchievementsRecentAndRelevantDataSource

- (double)collectionView:layout:minimumInteritemSpacingForSectionAtIndex:
{
  if (qword_10096B428 != -1) {
    dispatch_once(&qword_10096B428, &stru_1008ABB98);
  }
  return *(double *)&qword_10096B420;
}

- (CHAchievementsRecentAndRelevantDataSource)initWithDataProvider:(id)a3 collectionView:(id)a4 localizationProvider:(id)a5 badgeImageFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CHAchievementsRecentAndRelevantDataSource;
  v15 = [(CHAchievementsRecentAndRelevantDataSource *)&v33 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataProvider, a3);
    [(AAUIAchievementsDataProvider *)v16->_dataProvider addRecentAndRelevantSectionObserver:v16];
    objc_storeStrong((id *)&v16->_localizationProvider, a5);
    objc_storeStrong((id *)&v16->_badgeImageFactory, a6);
    objc_storeStrong((id *)&v16->_collectionView, a4);
    [(UICollectionView *)v16->_collectionView setDataSource:v16];
    [(UICollectionView *)v16->_collectionView setDelegate:v16];
    v17 = [(UICollectionView *)v16->_collectionView collectionViewLayout];
    [v17 setScrollDirection:1];
    collectionView = v16->_collectionView;
    id v32 = v11;
    uint64_t v19 = objc_opt_class();
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [(UICollectionView *)collectionView registerClass:v19 forCellWithReuseIdentifier:v21];

    v22 = v16->_collectionView;
    uint64_t v23 = objc_opt_class();
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    [(UICollectionView *)v22 registerClass:v23 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v25];

    v26 = v16->_collectionView;
    uint64_t v27 = objc_opt_class();
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    [(UICollectionView *)v26 registerClass:v27 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v29];

    [(UICollectionView *)v16->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"EMPTY"];
    [(UICollectionView *)v16->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"EMPTY"];
    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v16 selector:"fontChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    id v11 = v32;
    [(CHAchievementsRecentAndRelevantDataSource *)v16 invalidateMaxCellHeight];
  }
  return v16;
}

- (void)fontChanged:(id)a3
{
  [(CHAchievementsRecentAndRelevantDataSource *)self invalidateMaxCellHeight];
  id v5 = [(CHAchievementsRecentAndRelevantDataSource *)self collectionView];
  v4 = [v5 collectionViewLayout];
  [v4 invalidateLayout];
}

- (double)preferredCollectionViewHeight
{
  +[CHAchievementsSectionHeaderView preferredSizeForSectionName:@" "];
  double v4 = v3;
  [(CHAchievementsRecentAndRelevantDataSource *)self maxCellHeight];
  double v6 = v5;
  v7 = +[CHAchievementsSectionHeaderView headerFont];
  [v7 _scaledValueForValue:17.0];
  double v9 = v8;

  return v4 + v6 + v9;
}

- (void)invalidateMaxCellHeight
{
  self->_maxCellHeight = -1.0;
}

- (double)cellWidth
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FD1CC;
  block[3] = &unk_1008ABA78;
  block[4] = self;
  if (qword_10096B478 != -1) {
    dispatch_once(&qword_10096B478, block);
  }
  return *(double *)&qword_10096B470;
}

- (double)maxCellHeight
{
  double maxCellHeight = self->_maxCellHeight;
  if (maxCellHeight < 0.0)
  {
    double v4 = [(CHAchievementsRecentAndRelevantDataSource *)self collectionView];
    uint64_t v5 = [(CHAchievementsRecentAndRelevantDataSource *)self numberOfSectionsInCollectionView:v4];

    if (v5 < 1)
    {
      double maxCellHeight = 0.0;
    }
    else
    {
      int64_t v6 = 0;
      double maxCellHeight = 0.0;
      do
      {
        v7 = [(CHAchievementsRecentAndRelevantDataSource *)self collectionView];
        uint64_t v8 = [(CHAchievementsRecentAndRelevantDataSource *)self collectionView:v7 numberOfItemsInSection:v6];

        if (v8 >= 1)
        {
          int64_t v9 = 0;
          do
          {
            v10 = +[NSIndexPath indexPathForItem:v9 inSection:v6];
            id v11 = [(CHAchievementsRecentAndRelevantDataSource *)self dataProvider];
            id v12 = [v11 recentAndRelevantAchievementAtIndexPath:v10];

            [(CHAchievementsRecentAndRelevantDataSource *)self cellWidth];
            double v14 = v13;
            v15 = [(CHAchievementsRecentAndRelevantDataSource *)self localizationProvider];
            +[CHAchievementsCellContentView cellHeightForAchievement:v12 preferredWidth:1 appliesLargeCellInsets:v15 locProvider:v14];
            double v17 = v16;

            if (maxCellHeight < v17) {
              double maxCellHeight = v17;
            }

            ++v9;
            v18 = [(CHAchievementsRecentAndRelevantDataSource *)self collectionView];
            int64_t v19 = [(CHAchievementsRecentAndRelevantDataSource *)self collectionView:v18 numberOfItemsInSection:v6];
          }
          while (v9 < v19);
        }
        ++v6;
        v20 = [(CHAchievementsRecentAndRelevantDataSource *)self collectionView];
        int64_t v21 = [(CHAchievementsRecentAndRelevantDataSource *)self numberOfSectionsInCollectionView:v20];
      }
      while (v6 < v21);
    }
    self->_double maxCellHeight = maxCellHeight;
  }
  return maxCellHeight;
}

- (void)dealloc
{
  [(AAUIAchievementsDataProvider *)self->_dataProvider removeRecentAndRelevantSectionObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementsRecentAndRelevantDataSource;
  [(CHAchievementsRecentAndRelevantDataSource *)&v3 dealloc];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CHAchievementsRecentAndRelevantDataSource *)self dataProvider];
  int64_t v9 = [v8 recentAndRelevantAchievementAtIndexPath:v6];

  v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  id v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v6];

  [(CHAchievementsRecentAndRelevantDataSource *)self cellWidth];
  [v12 setPreferredWidth:];
  [v12 setAppliesLargeCellInset:1];
  double v13 = [(CHAchievementsRecentAndRelevantDataSource *)self badgeImageFactory];
  double v14 = [(CHAchievementsRecentAndRelevantDataSource *)self localizationProvider];
  [v12 configureWithAchievement:v9 badgeImageFactory:v13 locProvider:v14];

  return v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  objc_super v3 = [(CHAchievementsRecentAndRelevantDataSource *)self dataProvider];
  id v4 = [v3 numberOfRecentAndRelevantSections];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v5 = [(CHAchievementsRecentAndRelevantDataSource *)self dataProvider];
  id v6 = [v5 numberOfItemsInRecentAndRelevantSection:a4];

  return (int64_t)v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [(CHAchievementsRecentAndRelevantDataSource *)self cellWidth];
  double v7 = v6;
  [(CHAchievementsRecentAndRelevantDataSource *)self maxCellHeight];
  double v9 = v8;
  double v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  CGFloat left = 10.0;
  CGFloat top = 0.0;
  if (a5)
  {
    double bottom = 0.0;
    double right = 10.0;
  }
  else
  {
    uint64_t v9 = [(CHAchievementsRecentAndRelevantDataSource *)self collectionView:a3 numberOfItemsInSection:0];
    double right = 29.0;
    double bottom = 0.0;
    if (v9 <= 0)
    {
      CGFloat top = UIEdgeInsetsZero.top;
      CGFloat left = UIEdgeInsetsZero.left;
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
    }
  }
  double v10 = top;
  double v11 = left;
  result.double right = right;
  result.double bottom = bottom;
  result.CGFloat left = v11;
  result.CGFloat top = v10;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  if ([(CHAchievementsRecentAndRelevantDataSource *)self collectionView:a3 numberOfItemsInSection:a5] < 1)
  {
    double width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  else
  {
    double v7 = [(CHAchievementsRecentAndRelevantDataSource *)self dataProvider];
    double v8 = [v7 headerStringForSection:a5 isRecentAndRelevant:1];

    +[CHAchievementsSectionHeaderView preferredSizeForSectionName:v8];
    CGFloat height = v9;

    double width = 1.0;
  }
  double v12 = height;
  result.CGFloat height = v12;
  result.double width = width;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:UICollectionElementKindSectionHeader]
    && -[CHAchievementsRecentAndRelevantDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v8, [v10 section]) >= 1)
  {
    double v11 = (objc_class *)objc_opt_class();
    double v12 = NSStringFromClass(v11);
    double v13 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v12 forIndexPath:v10];

    [v13 setHidesKeyLine:1];
    double v14 = [(CHAchievementsRecentAndRelevantDataSource *)self dataProvider];
    v15 = [v14 headerStringForSection:[v10 section] isRecentAndRelevant:1];
    [v13 configureWithSectionName:v15];

LABEL_13:
    goto LABEL_14;
  }
  if ([v9 isEqualToString:UICollectionElementKindSectionFooter]
    && ![v10 section]
    && -[CHAchievementsRecentAndRelevantDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v8, [v10 section]) >= 1)
  {
    double v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    double v13 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v18 forIndexPath:v10];

    double v14 = +[UIColor separatorColor];
    [v13 setBackgroundColor:v14];
    goto LABEL_13;
  }
  if ([v9 isEqualToString:UICollectionElementKindSectionHeader]
    || [v9 isEqualToString:UICollectionElementKindSectionFooter])
  {
    id v16 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"EMPTY" forIndexPath:v10];
  }
  else
  {
    id v16 = objc_alloc_init((Class)UICollectionReusableView);
  }
  double v13 = v16;
LABEL_14:

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v21 = a4;
  id v6 = a3;
  [v6 deselectItemAtIndexPath:v21 animated:1];
  double v7 = [v6 cellForItemAtIndexPath:v21];

  id v8 = [(CHAchievementsRecentAndRelevantDataSource *)self achievementTappedHandler];

  if (v8)
  {
    id v9 = [(CHAchievementsRecentAndRelevantDataSource *)self achievementTappedHandler];
    id v10 = [(CHAchievementsRecentAndRelevantDataSource *)self dataProvider];
    double v11 = [v10 recentAndRelevantAchievementAtIndexPath:v21];
    [v7 badgeRect];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = [v7 contentView];
    ((void (**)(void, void *, void *, void *, double, double, double, double))v9)[2](v9, v11, v20, v7, v13, v15, v17, v19);
  }
}

- (void)achievementsDataProviderDidUpdate:(id)a3
{
  [(CHAchievementsRecentAndRelevantDataSource *)self invalidateMaxCellHeight];
  id v4 = [(CHAchievementsRecentAndRelevantDataSource *)self collectionView];
  [v4 reloadData];
}

- (id)achievementTappedHandler
{
  return self->_achievementTappedHandler;
}

- (void)setAchievementTappedHandler:(id)a3
{
}

- (void)setPreferredCollectionViewHeight:(double)a3
{
  self->_preferredCollectionViewHeight = a3;
}

- (AAUIAchievementsDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (ACHAchievementLocalizationProvider)localizationProvider
{
  return self->_localizationProvider;
}

- (void)setLocalizationProvider:(id)a3
{
}

- (AAUIBadgeImageFactory)badgeImageFactory
{
  return self->_badgeImageFactory;
}

- (void)setBadgeImageFactory:(id)a3
{
}

- (void)setMaxCellHeight:(double)a3
{
  self->_double maxCellHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_localizationProvider, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);

  objc_storeStrong(&self->_achievementTappedHandler, 0);
}

@end