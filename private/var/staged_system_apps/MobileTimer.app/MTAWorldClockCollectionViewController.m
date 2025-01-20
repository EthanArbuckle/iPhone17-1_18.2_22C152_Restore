@interface MTAWorldClockCollectionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MTAWorldClockCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (MTAWorldClockCollectionViewDelegate)delegate;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)cellHeight;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)deleteCell:(id)a3;
- (void)handleContentSizeChange;
- (void)handleScrollEnd;
- (void)removeCityAtIndexPath:(id)a3;
- (void)saveLastIndexPath;
- (void)scrollToPageContainingIndexPath:(id)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)updateCollectionViewLayout;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MTAWorldClockCollectionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTAWorldClockCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockCollectionViewController;
  result = [(MTAWorldClockCollectionViewController *)&v4 initWithCollectionViewLayout:a3];
  if (result) {
    result->_cellHeight = -1.0;
  }
  return result;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)MTAWorldClockCollectionViewController;
  [(MTAWorldClockCollectionViewController *)&v8 viewDidLoad];
  v3 = [(MTAWorldClockCollectionViewController *)self collectionView];
  [v3 setPagingEnabled:0];

  objc_super v4 = [(MTAWorldClockCollectionViewController *)self collectionView];
  [v4 setShowsVerticalScrollIndicator:0];

  v5 = [(MTAWorldClockCollectionViewController *)self collectionView];
  [v5 setShowsHorizontalScrollIndicator:0];

  v6 = [(MTAWorldClockCollectionViewController *)self collectionView];
  [v6 setIndicatorStyle:2];

  v7 = [(MTAWorldClockCollectionViewController *)self collectionView];
  [v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"WorldClockCollectionCellTileReuseIdentifier"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockCollectionViewController;
  [(MTAWorldClockCollectionViewController *)&v4 viewDidAppear:a3];
  [(MTAWorldClockCollectionViewController *)self setInstallsStandardGestureForInteractiveMovement:1];
}

- (void)handleContentSizeChange
{
  self->_cellHeight = -1.0;
  [(MTAWorldClockCollectionViewController *)self updateCollectionViewLayout];
  id v3 = [(MTAWorldClockCollectionViewController *)self collectionViewLayout];
  [v3 invalidateLayout];
}

- (void)updateCollectionViewLayout
{
  id v3 = +[UIDevice currentDevice];
  objc_super v4 = (char *)[v3 orientation] - 3;

  v5 = +[UIApplication sharedApplication];
  category = [v5 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(category);
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(category, UIContentSizeCategoryAccessibilityLarge);
  uint64_t v8 = 2;
  if (!IsAccessibilityCategory) {
    uint64_t v8 = 3;
  }
  if (v7 == NSOrderedDescending) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = v8;
  }
  if (IsAccessibilityCategory)
  {
    v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v10 _scaledValueForValue:150.0];
    double v12 = v11;
  }
  else
  {
    double v12 = 225.0;
  }
  if ((unint64_t)v4 >= 2)
  {
    float v16 = (float)v9;
  }
  else
  {
    v13 = [(MTAWorldClockCollectionViewController *)self view];
    [v13 bounds];
    float v15 = v14 / v12;
    float v16 = floorf(v15);
  }
  v17 = [(MTAWorldClockCollectionViewController *)self collectionViewLayout];
  [v17 setColumnsPerPage:(unint64_t)v16];
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTAWorldClockCollectionViewController;
  -[MTAWorldClockCollectionViewController setEditing:](&v15, "setEditing:");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(MTAWorldClockCollectionViewController *)self collectionView];
  v6 = [v5 visibleCells];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setEditing:v3 animated:1];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)scrollToPageContainingIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MTAWorldClockCollectionViewController *)self collectionView];
  [v7 scrollToItemAtIndexPath:v6 atScrollPosition:0 animated:v4];
}

- (double)cellHeight
{
  double result = self->_cellHeight;
  if (result < 0.0)
  {
    +[MTAWorldClockCollectionCell preferredHeight];
    self->_cellHeight = result;
  }
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  BOOL v4 = +[WorldClockManager sharedManager];
  v5 = [v4 cities];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dequeueReusableCellWithReuseIdentifier:@"WorldClockCollectionCellTileReuseIdentifier" forIndexPath:v5];
  id v7 = +[WorldClockManager sharedManager];
  id v8 = [v7 cities];
  id v9 = [v5 row];

  v10 = [v8 objectAtIndex:v9];
  [v6 setCity:v10];

  long long v11 = [v6 city];
  long long v12 = [v11 name];
  [v6 setAccessibilityIdentifier:v12];

  long long v13 = [v6 contentView];
  [v13 _setCornerRadius:15.0];

  [v6 start];

  return v6;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = [a4 row];
  id v9 = [v7 row];
  id v10 = +[WorldClockManager sharedManager];
  [v10 moveCityFromIndex:v8 toIndex:v9];
  [(MTAWorldClockCollectionViewController *)self scrollToPageContainingIndexPath:v7 animated:1];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  [v6 start];
  [v6 setDelegate:self];
  [v6 setEditing:[self isEditing]];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 stop];
  [v5 setDelegate:0];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = [(MTAWorldClockCollectionViewController *)self view];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  BOOL v14 = v9 == CGSizeZero.width && v11 == height;
  if (v14 || ![v6 columnsPerPage])
  {
    v18 = MTLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      v23 = self;
      __int16 v24 = 2048;
      id v25 = [v6 columnsPerPage];
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Either collectionViewSize or columnsPerPage: %lu is 0", (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    double v15 = (double)((unint64_t)[v6 columnsPerPage] - 1) * 15.0 + 30.0;
    if ([v6 scrollDirection] == (id)1)
    {
      [v6 columnsPerPage];
      [v6 columnsPerPage];
      float v16 = [(MTAWorldClockCollectionViewController *)self collectionView];
      UIFloorToViewScale();
      double width = v17;
    }
    else
    {
      double width = (v9 - v15) / (double)(unint64_t)[v6 columnsPerPage];
    }
    [(MTAWorldClockCollectionViewController *)self cellHeight];
    double height = v19;
  }

  double v20 = width;
  double v21 = height;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 15.0;
  double v7 = 0.0;
  double v8 = 15.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 1.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 15.0;
}

- (void)deleteCell:(id)a3
{
  id v4 = a3;
  double v5 = [(MTAWorldClockCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  [(MTAWorldClockCollectionViewController *)self removeCityAtIndexPath:v6];
}

- (void)removeCityAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = +[WorldClockManager sharedManager];
  id v6 = [v5 cities];
  double v7 = [v6 objectAtIndexedSubscript:[v4 row]];

  [v5 removeCityAtIndex:[v4 row]];
  [v5 saveCities];
  double v8 = [(MTAWorldClockCollectionViewController *)self collectionView];
  id v12 = v4;
  double v9 = +[NSArray arrayWithObjects:&v12 count:1];
  [v8 deleteItemsAtIndexPaths:v9];

  double v10 = [(MTAWorldClockCollectionViewController *)self delegate];
  double v11 = [(MTAWorldClockCollectionViewController *)self collectionView];
  [v10 collectionView:v11 didRemoveCity:v7];

  +[MTAnalytics incrementEventCount:kMTCAWorldClockRemoves];
}

- (void)handleScrollEnd
{
  [(MTAWorldClockCollectionViewController *)self saveLastIndexPath];
  BOOL v3 = [(MTAWorldClockCollectionViewController *)self collectionViewLayout];
  id v4 = [v3 scrollDirection];

  if (v4)
  {
    id v9 = [(MTAWorldClockCollectionViewController *)self collectionView];
    [v9 contentOffset];
    [v9 frame];
    double v5 = [(MTAWorldClockCollectionViewController *)self view];
    unsigned int v6 = [v5 mtui_isRTL];

    if (v6)
    {
      double v7 = +[WorldClockManager sharedManager];
      double v8 = [v7 cities];
      [v8 count];
    }
  }
}

- (void)saveLastIndexPath
{
  BOOL v3 = [(MTAWorldClockCollectionViewController *)self collectionView];
  id v4 = [v3 visibleCells];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002FA7C;
  v13[3] = &unk_1000A1BF8;
  v13[4] = self;
  double v5 = [v4 na_map:v13];

  unsigned int v6 = +[NSSortDescriptor sortDescriptorWithKey:@"row" ascending:1];
  BOOL v14 = v6;
  double v7 = +[NSArray arrayWithObjects:&v14 count:1];
  double v8 = [v5 sortedArrayUsingDescriptors:v7];
  id v9 = [v8 lastObject];

  double v10 = +[MTAStateStore shared];
  double v11 = +[MTAStateStoreEvent eventWithType:4 indexPath:v9];
  [v10 pushEvent:v11];

  id v12 = +[MTAStateStore shared];
  [v12 synchronize];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(MTAWorldClockCollectionViewController *)self handleScrollEnd];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"DidPageWorldClock_PPT" object:0];
}

- (MTAWorldClockCollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTAWorldClockCollectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end