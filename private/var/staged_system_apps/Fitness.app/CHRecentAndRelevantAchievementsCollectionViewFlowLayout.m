@interface CHRecentAndRelevantAchievementsCollectionViewFlowLayout
- (id)_transformAttributes:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
@end

@implementation CHRecentAndRelevantAchievementsCollectionViewFlowLayout

- (id)_transformAttributes:(id)a3
{
  id v4 = [a3 copy];
  v5 = [(CHRecentAndRelevantAchievementsCollectionViewFlowLayout *)self collectionView];
  v6 = [v5 delegate];

  v7 = [(CHRecentAndRelevantAchievementsCollectionViewFlowLayout *)self collectionView];
  v8 = [v7 dataSource];

  v9 = [(CHRecentAndRelevantAchievementsCollectionViewFlowLayout *)self collectionView];
  [v6 collectionView:v9 layout:self referenceSizeForHeaderInSection:0];
  double v11 = v10;
  double height = v12;

  v14 = [(CHRecentAndRelevantAchievementsCollectionViewFlowLayout *)self collectionView];
  v15 = +[NSIndexPath indexPathForItem:0 inSection:0];
  [v6 collectionView:v14 layout:self sizeForItemAtIndexPath:v15];
  double width = v16;

  v18 = [(CHRecentAndRelevantAchievementsCollectionViewFlowLayout *)self collectionView];
  v19 = [v4 indexPath];
  id v20 = [v8 collectionView:v18 numberOfItemsInSection:[v19 section]];

  if (![v4 representedElementCategory])
  {
    [v4 frame];
    double width = v31;
    double y = height;
    double x = v32 - v11;
    double height = v33;
    goto LABEL_14;
  }
  if ([v4 representedElementCategory] == (id)1)
  {
    v21 = [v4 representedElementKind];
    unsigned int v22 = [v21 isEqualToString:UICollectionElementKindSectionHeader];

    if (v22)
    {
      if (v20)
      {
        [v4 frame];
LABEL_14:
        [v4 setFrame:CGRectMake(x, y, width, height)];
        goto LABEL_15;
      }
LABEL_13:
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      goto LABEL_14;
    }
  }
  if ([v4 representedElementCategory] == (id)1)
  {
    v25 = [v4 representedElementKind];
    unsigned int v26 = [v25 isEqualToString:UICollectionElementKindSectionFooter];

    if (v26)
    {
      if (v20)
      {
        [v4 frame];
        double v28 = v27;
        double v30 = v29;
        if (qword_10096B4E8 != -1) {
          dispatch_once(&qword_10096B4E8, &stru_1008AD640);
        }
        double x = v28 - v11;
        double width = *(double *)&qword_10096B4E0;
        double height = v30 + -32.0;
        double y = 16.0;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
LABEL_15:

  return v4;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CHRecentAndRelevantAchievementsCollectionViewFlowLayout;
  id v4 = -[CHRecentAndRelevantAchievementsCollectionViewFlowLayout layoutAttributesForElementsInRect:](&v17, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = -[CHRecentAndRelevantAchievementsCollectionViewFlowLayout _transformAttributes:](self, "_transformAttributes:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CHRecentAndRelevantAchievementsCollectionViewFlowLayout;
  id v4 = [(CHRecentAndRelevantAchievementsCollectionViewFlowLayout *)&v7 layoutAttributesForItemAtIndexPath:a3];
  id v5 = [(CHRecentAndRelevantAchievementsCollectionViewFlowLayout *)self _transformAttributes:v4];

  return v5;
}

@end