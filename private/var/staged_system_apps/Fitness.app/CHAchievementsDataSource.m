@interface CHAchievementsDataSource
- (AAUIAchievementsDataProvider)dataProvider;
- (AAUIBadgeImageFactory)badgeImageFactory;
- (ACHAchievementLocalizationProvider)locProvider;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CHAchievementsDataSource)initWithDataProvider:(id)a3 collectionView:(id)a4 recentAndRelevantCollectionView:(id)a5 recentAndRelevantDataSource:(id)a6 localizationProvider:(id)a7 badgeImageFactory:(id)a8;
- (CHAchievementsRecentAndRelevantDataSource)recentAndRelevantDataSource;
- (NSMutableDictionary)cellSizeForIndexPath;
- (UICollectionView)collectionView;
- (UICollectionView)recentAndRelevantCollectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)mainSectionCellWidth;
- (double)mainSectionHorizontalInset;
- (id)achievementTappedHandler;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)siblingIndexPathsForIndexPath:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)nCellsPerRow;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)achievementsDataProviderDidUpdate:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)setAchievementTappedHandler:(id)a3;
- (void)setBadgeImageFactory:(id)a3;
- (void)setCellSizeForIndexPath:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setLocProvider:(id)a3;
- (void)setMainSectionCellWidth:(double)a3;
- (void)setNCellsPerRow:(int64_t)a3;
- (void)setRecentAndRelevantCollectionView:(id)a3;
- (void)setRecentAndRelevantDataSource:(id)a3;
- (void)textSizeDidChange:(id)a3;
@end

@implementation CHAchievementsDataSource

- (CHAchievementsDataSource)initWithDataProvider:(id)a3 collectionView:(id)a4 recentAndRelevantCollectionView:(id)a5 recentAndRelevantDataSource:(id)a6 localizationProvider:(id)a7 badgeImageFactory:(id)a8
{
  id v39 = a3;
  id v38 = a4;
  id v37 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v40.receiver = self;
  v40.super_class = (Class)CHAchievementsDataSource;
  v18 = [(CHAchievementsDataSource *)&v40 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_locProvider, a7);
    objc_storeStrong((id *)&v19->_dataProvider, a3);
    [(AAUIAchievementsDataProvider *)v19->_dataProvider addMainSectionObserver:v19];
    objc_storeStrong((id *)&v19->_badgeImageFactory, a8);
    objc_storeStrong((id *)&v19->_recentAndRelevantDataSource, a6);
    objc_storeStrong((id *)&v19->_collectionView, a4);
    [(UICollectionView *)v19->_collectionView setDelegate:v19];
    [(UICollectionView *)v19->_collectionView setDataSource:v19];
    collectionView = v19->_collectionView;
    uint64_t v21 = objc_opt_class();
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    [(UICollectionView *)collectionView registerClass:v21 forCellWithReuseIdentifier:v23];

    v24 = v19->_collectionView;
    uint64_t v25 = objc_opt_class();
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    [(UICollectionView *)v24 registerClass:v25 forCellWithReuseIdentifier:v27];

    v28 = v19->_collectionView;
    uint64_t v29 = objc_opt_class();
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    [(UICollectionView *)v28 registerClass:v29 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v31];

    v32 = [(UICollectionView *)v19->_collectionView collectionViewLayout];
    [v32 setMinimumLineSpacing:13.0];
    v33 = +[NSNotificationCenter defaultCenter];
    [v33 addObserver:v19 selector:"textSizeDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    objc_storeStrong((id *)&v19->_recentAndRelevantCollectionView, a5);
    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cellSizeForIndexPath = v19->_cellSizeForIndexPath;
    v19->_cellSizeForIndexPath = v34;

    [(CHAchievementsDataSource *)v19 textSizeDidChange:0];
  }

  return v19;
}

- (double)mainSectionHorizontalInset
{
  [(CHAchievementsDataSource *)self nCellsPerRow];
  [(CHAchievementsDataSource *)self mainSectionCellWidth];
  [(CHAchievementsDataSource *)self mainSectionCellPadding];
  v3 = +[UIScreen mainScreen];
  [v3 bounds];

  v4 = [(CHAchievementsDataSource *)self collectionView];
  UICeilToViewScale();
  double v6 = v5;

  return v6;
}

- (void)textSizeDidChange:(id)a3
{
  v4 = +[UIApplication sharedApplication];
  double v5 = [v4 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v5)) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 3;
  }
  [(CHAchievementsDataSource *)self setNCellsPerRow:v6];

  v7 = +[UIScreen mainScreen];
  [v7 bounds];

  [(CHAchievementsDataSource *)self nCellsPerRow];
  v8 = [(CHAchievementsDataSource *)self collectionView];
  UIRoundToViewScale();
  double v10 = v9;

  [(CHAchievementsDataSource *)self setMainSectionCellWidth:v10];
  v11 = [(CHAchievementsDataSource *)self cellSizeForIndexPath];
  [v11 removeAllObjects];

  id v12 = [(CHAchievementsDataSource *)self collectionView];
  [v12 reloadData];
}

- (void)dealloc
{
  [(AAUIAchievementsDataProvider *)self->_dataProvider removeMainSectionObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementsDataSource;
  [(CHAchievementsDataSource *)&v3 dealloc];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section])
  {
    v8 = [(CHAchievementsDataSource *)self dataProvider];
    double v9 = [v8 achievementAtIndexPath:v6];

    double v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    id v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v6];

    [(CHAchievementsDataSource *)self mainSectionCellWidth];
    [v12 setPreferredWidth:];
    v13 = [(CHAchievementsDataSource *)self badgeImageFactory];
    v14 = [(CHAchievementsDataSource *)self locProvider];
    [v12 configureWithAchievement:v9 badgeImageFactory:v13 locProvider:v14];
  }
  else
  {
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v12 = [v7 dequeueReusableCellWithReuseIdentifier:v16 forIndexPath:v6];

    double v9 = [(CHAchievementsDataSource *)self recentAndRelevantCollectionView];
    [v12 setCollectionView:v9];
  }

  return v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  objc_super v3 = [(CHAchievementsDataSource *)self dataProvider];
  id v4 = [v3 numberOfSections];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v5 = [(CHAchievementsDataSource *)self dataProvider];
  id v6 = [v5 numberOfItemsInSection:a4];

  return (int64_t)v6;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5
    && [(CHAchievementsDataSource *)self collectionView:v8 numberOfItemsInSection:a5])
  {
    [(CHAchievementsDataSource *)self mainSectionHorizontalInset];
    CGFloat left = v10;
    CGFloat bottom = 12.0;
    CGFloat top = 0.0;
    CGFloat right = v10;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }

  double v15 = top;
  double v16 = left;
  double v17 = bottom;
  double v18 = right;
  result.CGFloat right = v18;
  result.CGFloat bottom = v17;
  result.CGFloat left = v16;
  result.CGFloat top = v15;
  return result;
}

- (id)siblingIndexPathsForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CHAchievementsDataSource *)self nCellsPerRow];
  uint64_t v6 = (uint64_t)[v4 item] % v5;
  if (v5 == 3)
  {
    if (v6 == 1)
    {
      id v7 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)[v4 item] - 1, objc_msgSend(v4, "section"));
      v18[0] = v7;
      id v8 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)[v4 item] + 1, objc_msgSend(v4, "section"));
      v18[1] = v8;
      id v9 = v18;
    }
    else if (v6)
    {
      id v7 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)[v4 item] - 2, objc_msgSend(v4, "section"));
      v17[0] = v7;
      id v8 = [NSIndexPath indexPathForItem:inSection:];
      v17[1] = v8;
      id v9 = v17;
    }
    else
    {
      id v7 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)[v4 item] + 1, objc_msgSend(v4, "section"));
      v19[0] = v7;
      id v8 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)[v4 item] + 2, objc_msgSend(v4, "section"));
      v19[1] = v8;
      id v9 = v19;
    }
    v13 = +[NSArray arrayWithObjects:v9 count:2];
  }
  else
  {
    double v10 = (char *)[v4 item];
    id v11 = [v4 section];
    if (v6)
    {
      id v7 = +[NSIndexPath indexPathForItem:v10 - 1 inSection:v11];
      double v15 = v7;
      id v12 = &v15;
    }
    else
    {
      id v7 = +[NSIndexPath indexPathForItem:v10 + 1 inSection:v11];
      double v16 = v7;
      id v12 = &v16;
    }
    v13 = +[NSArray arrayWithObjects:v12 count:1];
  }

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 section])
  {
    id v9 = [(CHAchievementsDataSource *)self cellSizeForIndexPath];
    double v10 = [v9 objectForKeyedSubscript:v8];

    if (v10)
    {
      [v10 CGSizeValue];
      CGFloat Width = v11;
      double v14 = v13;
    }
    else
    {
      id v46 = v7;
      double v17 = [(CHAchievementsDataSource *)self siblingIndexPathsForIndexPath:v8];
      double v18 = [(CHAchievementsDataSource *)self dataProvider];
      uint64_t v19 = [v18 achievementAtIndexPath:v8];

      [(CHAchievementsDataSource *)self mainSectionCellWidth];
      double v21 = v20;
      v22 = [(CHAchievementsDataSource *)self locProvider];
      v45 = (void *)v19;
      +[CHAchievementsCellContentView cellHeightForAchievement:v19 preferredWidth:0 appliesLargeCellInsets:v22 locProvider:v21];
      double v14 = v23;

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v24 = v17;
      id v25 = [v24 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v48;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v48 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            id v30 = [v29 item];
            v31 = [(CHAchievementsDataSource *)self dataProvider];
            id v32 = [v31 numberOfItemsInSection:[v8 section]];

            if ((uint64_t)v30 < (uint64_t)v32)
            {
              v33 = [(CHAchievementsDataSource *)self dataProvider];
              v34 = [v33 achievementAtIndexPath:v29];

              [(CHAchievementsDataSource *)self mainSectionCellWidth];
              double v36 = v35;
              id v37 = [(CHAchievementsDataSource *)self locProvider];
              +[CHAchievementsCellContentView cellHeightForAchievement:v34 preferredWidth:0 appliesLargeCellInsets:v37 locProvider:v36];
              double v39 = v38;

              if (v14 < v39) {
                double v14 = v39;
              }
            }
          }
          id v26 = [v24 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v26);
      }

      [(CHAchievementsDataSource *)self mainSectionCellWidth];
      CGFloat Width = v40;
      v41 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:");
      v42 = [(CHAchievementsDataSource *)self cellSizeForIndexPath];
      [v42 setObject:v41 forKeyedSubscript:v8];

      double v10 = 0;
      id v7 = v46;
    }
  }
  else
  {
    [v7 frame];
    CGFloat Width = CGRectGetWidth(v53);
    double v15 = [(CHAchievementsDataSource *)self recentAndRelevantDataSource];
    [v15 preferredCollectionViewHeight];
    double v14 = v16;
  }
  double v43 = Width;
  double v44 = v14;
  result.height = v44;
  result.width = v43;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5
    && [(CHAchievementsDataSource *)self collectionView:v8 numberOfItemsInSection:a5] >= 1)
  {
    double v10 = [(CHAchievementsDataSource *)self dataProvider];
    double v11 = [v10 headerStringForSection:a5 isRecentAndRelevant:0];

    +[CHAchievementsSectionHeaderView preferredSizeForSectionName:v11];
    CGFloat width = v12;
    CGFloat height = v14;
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  if (UICollectionElementKindSectionHeader == v9)
  {
    double v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    id v11 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v13 forIndexPath:v10];

    double v14 = [(CHAchievementsDataSource *)self dataProvider];
    double v15 = [v14 headerStringForSection:[v10 section] isRecentAndRelevant:0];
    [v11 configureWithSectionName:v15];
  }
  else
  {
    id v11 = objc_alloc_init((Class)UICollectionReusableView);
  }

  return v11;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return [a4 section] != 0;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v21 = a4;
  id v6 = a3;
  [v6 deselectItemAtIndexPath:v21 animated:1];
  id v7 = [v6 cellForItemAtIndexPath:v21];

  id v8 = [(CHAchievementsDataSource *)self achievementTappedHandler];

  if (v8)
  {
    id v9 = [(CHAchievementsDataSource *)self achievementTappedHandler];
    id v10 = [(CHAchievementsDataSource *)self dataProvider];
    id v11 = [v10 achievementAtIndexPath:v21];
    [v7 badgeRect];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = [v7 contentView];
    ((void (**)(void, void *, void *, void *, double, double, double, double))v9)[2](v9, v11, v20, v7, v13, v15, v17, v19);
  }
}

- (void)achievementsDataProviderDidUpdate:(id)a3
{
  id v4 = [(CHAchievementsDataSource *)self cellSizeForIndexPath];
  [v4 removeAllObjects];

  id v5 = [(CHAchievementsDataSource *)self collectionView];
  [v5 reloadData];
}

- (id)achievementTappedHandler
{
  return self->_achievementTappedHandler;
}

- (void)setAchievementTappedHandler:(id)a3
{
}

- (AAUIAchievementsDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (AAUIBadgeImageFactory)badgeImageFactory
{
  return self->_badgeImageFactory;
}

- (void)setBadgeImageFactory:(id)a3
{
}

- (ACHAchievementLocalizationProvider)locProvider
{
  return self->_locProvider;
}

- (void)setLocProvider:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)recentAndRelevantCollectionView
{
  return self->_recentAndRelevantCollectionView;
}

- (void)setRecentAndRelevantCollectionView:(id)a3
{
}

- (CHAchievementsRecentAndRelevantDataSource)recentAndRelevantDataSource
{
  return self->_recentAndRelevantDataSource;
}

- (void)setRecentAndRelevantDataSource:(id)a3
{
}

- (int64_t)nCellsPerRow
{
  return self->_nCellsPerRow;
}

- (void)setNCellsPerRow:(int64_t)a3
{
  self->_nCellsPerRow = a3;
}

- (double)mainSectionCellWidth
{
  return self->_mainSectionCellWidth;
}

- (void)setMainSectionCellWidth:(double)a3
{
  self->_mainSectionCellCGFloat Width = a3;
}

- (NSMutableDictionary)cellSizeForIndexPath
{
  return self->_cellSizeForIndexPath;
}

- (void)setCellSizeForIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellSizeForIndexPath, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantDataSource, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_locProvider, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);

  objc_storeStrong(&self->_achievementTappedHandler, 0);
}

@end