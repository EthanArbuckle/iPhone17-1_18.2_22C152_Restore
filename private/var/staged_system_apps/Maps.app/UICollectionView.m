@interface UICollectionView
- (BOOL)_maps_shouldShowTopHairline;
- (CGRect)_maps_rectForHeaderInSection:(int64_t)a3;
- (CGRect)_maps_rectForRowAtIndexPath:(id)a3;
- (CGSize)_maps_contentSize;
- (int64_t)_maps_indexOfFirstNonEmptySection;
- (void)_maps_commitUpdates;
- (void)_maps_reloadDataWithoutFocus;
- (void)_maps_scrollContentToOriginalPosition;
@end

@implementation UICollectionView

- (void)_maps_scrollContentToOriginalPosition
{
}

- (void)_maps_reloadDataWithoutFocus
{
  unsigned __int8 v3 = [(UICollectionView *)self remembersLastFocusedIndexPath];
  [(UICollectionView *)self setRemembersLastFocusedIndexPath:0];
  [(UICollectionView *)self reloadData];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003E8640;
  v4[3] = &unk_1012E6300;
  v4[4] = self;
  unsigned __int8 v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (CGSize)_maps_contentSize
{
  v2 = [(UICollectionView *)self collectionViewLayout];
  [v2 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)_maps_rectForHeaderInSection:(int64_t)a3
{
  double v4 = [(UICollectionView *)self collectionViewLayout];
  double v5 = +[NSIndexPath indexPathForItem:0 inSection:a3];
  double v6 = [v4 layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:v5];

  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_maps_rectForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(UICollectionView *)self collectionViewLayout];
  double v6 = [v5 layoutAttributesForItemAtIndexPath:v4];

  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_maps_commitUpdates
{
}

- (int64_t)_maps_indexOfFirstNonEmptySection
{
  double v3 = [(UICollectionView *)self dataSource];

  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = [(UICollectionView *)self dataSource];
  objc_opt_class();
  objc_opt_isKindOfClass();

  double v5 = [(UICollectionView *)self dataSource];
  double v6 = [v5 snapshot];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v7 = [v6 sectionIdentifiers];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ((uint64_t)[v6 numberOfItemsInSection:v12] > 0)
        {
          int64_t v13 = (int64_t)[v6 indexOfSectionIdentifier:v12];
          goto LABEL_12;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v13;
}

- (BOOL)_maps_shouldShowTopHairline
{
  uint64_t v3 = [(UICollectionView *)self dataSource];
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  [(UICollectionView *)self contentOffset];
  double v6 = v5;
  double v8 = v7;
  double y = CGPointZero.y;

  if (v6 == CGPointZero.x && v8 == y) {
    return 0;
  }
  int64_t v11 = [(UICollectionView *)self _maps_indexOfFirstNonEmptySection];
  uint64_t v12 = [(UICollectionView *)self dataSource];
  int64_t v13 = [v12 snapshot];
  id v14 = [v13 numberOfSections];
  BOOL v15 = 0;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < (uint64_t)v14)
  {
    long long v16 = +[NSIndexPath indexPathForRow:0 inSection:v11];
    long long v17 = [(UICollectionView *)self supplementaryViewForElementKind:UICollectionElementKindSectionHeader atIndexPath:v16];

    [v17 frame];
    if (v21 == 0.0)
    {
      BOOL v15 = 1;
    }
    else
    {
      CGFloat v22 = v18;
      CGFloat v23 = v19;
      CGFloat v24 = v20;
      CGFloat v25 = v21;
      [(UICollectionView *)self contentOffset];
      UIRoundToViewScale();
      double v27 = v26;
      v30.origin.x = v22;
      v30.origin.double y = v23;
      v30.size.width = v24;
      v30.size.height = v25;
      CGRectGetMaxY(v30);
      UIRoundToViewScale();
      BOOL v15 = v27 >= v28;
    }
  }
  return v15;
}

@end