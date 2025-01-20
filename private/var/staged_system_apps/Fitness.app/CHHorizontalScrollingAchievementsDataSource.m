@interface CHHorizontalScrollingAchievementsDataSource
- (AAUIBadgeImageFactory)imageFactory;
- (ACHAchievementLocalizationProvider)locProvider;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CHHorizontalScrollingAchievementsDataSource)init;
- (CHHorizontalScrollingAchievementsDataSource)initWithCollectionView:(id)a3 achievements:(id)a4 imageFactory:(id)a5 locProvider:(id)a6;
- (NSArray)achievements;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)edgeInsets;
- (id)achievementSelectedBlock;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setAchievementSelectedBlock:(id)a3;
- (void)setAchievements:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setImageFactory:(id)a3;
- (void)setLocProvider:(id)a3;
@end

@implementation CHHorizontalScrollingAchievementsDataSource

- (CHHorizontalScrollingAchievementsDataSource)initWithCollectionView:(id)a3 achievements:(id)a4 imageFactory:(id)a5 locProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CHHorizontalScrollingAchievementsDataSource;
  v15 = [(CHHorizontalScrollingAchievementsDataSource *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_achievements, a4);
    objc_storeStrong((id *)&v16->_locProvider, a6);
    objc_storeStrong((id *)&v16->_imageFactory, a5);
    long long v17 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v16->_edgeInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v16->_edgeInsets.bottom = v17;
    objc_storeStrong((id *)&v16->_collectionView, a3);
    [(UICollectionView *)v16->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CHAchievementCollectionViewCellReuseIdentifier"];
    [(UICollectionView *)v16->_collectionView setDataSource:v16];
    [(UICollectionView *)v16->_collectionView setDelegate:v16];
  }

  return v16;
}

- (CHHorizontalScrollingAchievementsDataSource)init
{
  return 0;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
  id v4 = [(CHHorizontalScrollingAchievementsDataSource *)self collectionView];
  v3 = [v4 collectionViewLayout];
  [v3 invalidateLayout];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(CHHorizontalScrollingAchievementsDataSource *)self achievements];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"CHAchievementCollectionViewCellReuseIdentifier" forIndexPath:v6];
  [v7 frame];
  double v10 = v9;

  [v8 setImageDimension:v10];
  id v11 = [(CHHorizontalScrollingAchievementsDataSource *)self imageFactory];
  [v8 setImageFactory:v11];

  id v12 = [(CHHorizontalScrollingAchievementsDataSource *)self achievements];
  id v13 = [v6 item];

  id v14 = [v12 objectAtIndexedSubscript:v13];
  [v8 setAchievement:v14];

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [a3 frame];
  double v6 = v5;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [(CHHorizontalScrollingAchievementsDataSource *)self edgeInsets];
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = [(CHHorizontalScrollingAchievementsDataSource *)self achievementSelectedBlock];

  if (v7)
  {
    double v8 = [v11 cellForItemAtIndexPath:v6];
    double v9 = [(CHHorizontalScrollingAchievementsDataSource *)self achievementSelectedBlock];
    double v10 = -[NSArray objectAtIndexedSubscript:](self->_achievements, "objectAtIndexedSubscript:", [v6 item]);
    ((void (**)(void, void *, void *))v9)[2](v9, v10, v8);
  }
  [v11 deselectItemAtIndexPath:v6 animated:1];
}

- (id)achievementSelectedBlock
{
  return self->_achievementSelectedBlock;
}

- (void)setAchievementSelectedBlock:(id)a3
{
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSArray)achievements
{
  return self->_achievements;
}

- (void)setAchievements:(id)a3
{
}

- (ACHAchievementLocalizationProvider)locProvider
{
  return self->_locProvider;
}

- (void)setLocProvider:(id)a3
{
}

- (AAUIBadgeImageFactory)imageFactory
{
  return self->_imageFactory;
}

- (void)setImageFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_locProvider, 0);
  objc_storeStrong((id *)&self->_achievements, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong(&self->_achievementSelectedBlock, 0);
}

@end