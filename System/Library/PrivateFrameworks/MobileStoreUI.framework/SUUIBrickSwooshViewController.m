@interface SUUIBrickSwooshViewController
- ($1AB5FA073B851C12C2339EC22442E995)_brickSwooshMetrics;
- (CGRect)frameForItemAtIndex:(int64_t)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)bricks;
- (SUUIBrickSwooshViewController)initWithSwoosh:(id)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathsForVisibleItems;
- (id)popImageViewForItemAtIndex:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)deselectAllItems;
- (void)loadView;
- (void)setBricks:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)unhideImages;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIBrickSwooshViewController

- (SUUIBrickSwooshViewController)initWithSwoosh:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIBrickSwooshViewController;
  v5 = [(SUUIBrickSwooshViewController *)&v12 init];
  if (v5)
  {
    v6 = [v4 bricks];
    uint64_t v7 = [v6 copy];
    bricks = v5->_bricks;
    v5->_bricks = (NSArray *)v7;

    v5->_showBrickTitles = [v4 showsBrickTitles];
    uint64_t v9 = [v4 title];
    swooshTitle = v5->_swooshTitle;
    v5->_swooshTitle = (NSString *)v9;
  }
  return v5;
}

- (void)dealloc
{
  [(UICollectionView *)self->_collectionView setDataSource:0];
  [(UICollectionView *)self->_collectionView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIBrickSwooshViewController;
  [(SUUIBrickSwooshViewController *)&v3 dealloc];
}

- (void)deselectAllItems
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++) animated:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (CGRect)frameForItemAtIndex:(int64_t)a3
{
  collectionView = self->_collectionView;
  uint64_t v4 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  uint64_t v5 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v4];

  [v5 bounds];
  objc_msgSend(v5, "convertRect:toView:", 0);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)indexPathsForVisibleItems
{
  return [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
}

- (id)popImageViewForItemAtIndex:(int64_t)a3
{
  collectionView = self->_collectionView;
  double v6 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  double v7 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v6];

  if (v7)
  {
    double v8 = [v7 itemImageView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    id v17 = objc_alloc(MEMORY[0x263F82828]);
    v18 = [v7 itemImage];
    v19 = (void *)[v17 initWithImage:v18];

    v20 = [(SUUIBrickSwooshViewController *)self view];
    objc_msgSend(v20, "convertRect:fromView:", v7, v10, v12, v14, v16);
    objc_msgSend(v19, "setFrame:");

    hiddenImageIndexSet = self->_hiddenImageIndexSet;
    if (!hiddenImageIndexSet)
    {
      v22 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
      v23 = self->_hiddenImageIndexSet;
      self->_hiddenImageIndexSet = v22;

      hiddenImageIndexSet = self->_hiddenImageIndexSet;
    }
    [(NSMutableIndexSet *)hiddenImageIndexSet addIndex:a3];
    [v7 setItemImageHidden:1];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)setBricks:(id)a3
{
  if (self->_bricks != a3)
  {
    uint64_t v4 = (NSArray *)[a3 copy];
    bricks = self->_bricks;
    self->_bricks = v4;

    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView reloadData];
  }
}

- (void)setClientContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIBrickSwooshViewController;
  [(SUUISwooshViewController *)&v7 setClientContext:a3];
  [(SUUIBrickSwooshViewController *)self _brickSwooshMetrics];
  self->_metrics.cellHeight = v4;
  self->_metrics.cellWidth = v5;
  self->_metrics.interItemSpacing = v6;
}

- (void)setColorScheme:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUISwooshViewController *)self colorScheme];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIBrickSwooshViewController;
    [(SUUISwooshViewController *)&v6 setColorScheme:v4];
    [(SUUISwooshView *)self->_swooshView setColoringWithColorScheme:v4];
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  self->_delegateWantsWillDisplay = objc_opt_respondsToSelector() & 1;
  v5.receiver = self;
  v5.super_class = (Class)SUUIBrickSwooshViewController;
  [(SUUISwooshViewController *)&v5 setDelegate:v4];
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  collectionView = self->_collectionView;
  objc_super v6 = (void *)MEMORY[0x263F088C8];
  id v7 = a3;
  double v8 = [v6 indexPathForItem:a4 inSection:0];
  id v9 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v8];

  [v9 setItemImage:v7];
}

- (void)unhideImages
{
  hiddenImageIndexSet = self->_hiddenImageIndexSet;
  if (hiddenImageIndexSet)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __45__SUUIBrickSwooshViewController_unhideImages__block_invoke;
    v5[3] = &unk_265400FC8;
    v5[4] = self;
    [(NSMutableIndexSet *)hiddenImageIndexSet enumerateIndexesWithOptions:0 usingBlock:v5];
    id v4 = self->_hiddenImageIndexSet;
    self->_hiddenImageIndexSet = 0;
  }
}

void __45__SUUIBrickSwooshViewController_unhideImages__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  objc_super v3 = [MEMORY[0x263F088C8] indexPathForRow:a2 inSection:0];
  id v4 = [v2 cellForItemAtIndexPath:v3];

  [v4 setItemImageHidden:0];
}

- (void)loadView
{
  if (!self->_swooshView)
  {
    objc_super v3 = objc_alloc_init(SUUISwooshView);
    swooshView = self->_swooshView;
    self->_swooshView = v3;

    objc_super v5 = self->_swooshView;
    objc_super v6 = [(SUUISwooshViewController *)self colorScheme];
    [(SUUISwooshView *)v5 setColoringWithColorScheme:v6];

    [(SUUISwooshView *)self->_swooshView setTitle:self->_swooshTitle];
    [(SUUISwooshView *)self->_swooshView contentInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(SUUISwooshView *)self->_swooshView collectionViewInsets];
    swooshTitle = self->_swooshTitle;
    if (swooshTitle) {
      double v15 = v13;
    }
    else {
      double v15 = 19.0;
    }
    double v16 = 0.0;
    if (swooshTitle) {
      double v16 = v8;
    }
    -[SUUISwooshView setContentInsets:](self->_swooshView, "setContentInsets:", v16, v10, 0.0, v12);
    -[SUUISwooshView setCollectionViewInsets:](self->_swooshView, "setCollectionViewInsets:", v15, -v10, 19.0, -v12);
  }
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    if (self->_showBrickTitles) {
      double cellHeight = self->_metrics.cellHeight + 29.0;
    }
    else {
      double cellHeight = self->_metrics.cellHeight;
    }
    v19 = objc_alloc_init(SUUISwooshCollectionViewLayout);
    [(UICollectionViewFlowLayout *)v19 setMinimumInteritemSpacing:self->_metrics.interItemSpacing];
    [(UICollectionViewFlowLayout *)v19 setMinimumLineSpacing:self->_metrics.interItemSpacing];
    [(UICollectionViewFlowLayout *)v19 setScrollDirection:1];
    [(SUUISwooshCollectionViewLayout *)v19 setSnapsToItemBoundaries:1];
    v20 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x263F82528]), "initWithFrame:collectionViewLayout:", v19, 0.0, 0.0, 0.0, cellHeight);
    v21 = self->_collectionView;
    self->_collectionView = v20;

    [(UICollectionView *)self->_collectionView setPrefetchingEnabled:0];
    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"a"];
    [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
    v22 = self->_collectionView;
    v23 = [(SUUISwooshView *)self->_swooshView backgroundColor];
    [(UICollectionView *)v22 setBackgroundColor:v23];

    [(UICollectionView *)self->_collectionView setDataSource:self];
    v24 = self->_collectionView;
    +[SUUISwooshCollectionViewLayout snapToBoundariesDecelerationRate];
    [(UICollectionView *)v24 setDecelerationRate:v25];
    [(UICollectionView *)self->_collectionView setDelegate:self];
    [(UICollectionView *)self->_collectionView setScrollsToTop:0];
    [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];

    collectionView = self->_collectionView;
  }
  [(SUUISwooshView *)self->_swooshView setCollectionView:collectionView];
  [(SUUISwooshView *)self->_swooshView sizeToFit];
  v26 = self->_swooshView;
  [(SUUIBrickSwooshViewController *)self setView:v26];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)SUUIBrickSwooshViewController;
  [(SUUIBrickSwooshViewController *)&v13 viewWillAppear:1];
  id v4 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) animated:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"a" forIndexPath:v6];
  long long v9 = [v7 backgroundColor];

  [v8 setBackgroundColor:v9];
  long long v10 = [(SUUISwooshViewController *)self colorScheme];
  [v8 setColoringWithColorScheme:v10];

  long long v11 = [(SUUISwooshViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v12 = objc_msgSend(v11, "swoosh:imageForCellAtIndex:", self, objc_msgSend(v6, "item"));
  }
  else
  {
    long long v12 = 0;
  }
  [v8 setItemImage:v12];
  objc_super v13 = -[NSArray objectAtIndex:](self->_bricks, "objectAtIndex:", [v6 item]);
  double v14 = [v13 link];
  char v15 = [v14 isActionable];

  if (v15)
  {
    if (self->_showBrickTitles)
    {
      [v8 setAccessibilityLabel:0];
      double v16 = [v13 accessibilityLabel];
      [v8 setTitle:v16];
    }
    else
    {
      id v17 = [v13 accessibilityLabel];
      [v8 setAccessibilityLabel:v17];

      [v8 setTitle:0];
    }
    v18 = [(SUUISwooshViewController *)self clientContext];
    [v8 setClientContext:v18];

    v19 = [v13 countdown];
    [v8 setCountdown:v19];

    [v8 setItemImageHidden:0];
  }
  else
  {
    [v8 setCountdown:0];
    [v8 setAccessibilityLabel:0];
    [v8 setItemImageHidden:1];
    [v8 setTitle:0];
  }
  if (self->_delegateWantsWillDisplay) {
    objc_msgSend(v11, "swoosh:willDisplayCellAtIndex:", self, objc_msgSend(v6, "item"));
  }

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_bricks count];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(SUUISwooshViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "swoosh:didSelectCellAtIndex:", self, objc_msgSend(v6, "item"));
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = *MEMORY[0x263F834E8];
  double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v7 = 15.0;
  double v8 = 15.0;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double cellHeight = self->_metrics.cellHeight;
  double cellWidth = self->_metrics.cellWidth;
  if (self->_showBrickTitles) {
    double cellHeight = cellHeight + 29.0;
  }
  result.height = cellHeight;
  result.width = cellWidth;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_brickSwooshMetrics
{
  v2 = [(SUUISwooshViewController *)self clientContext];
  uint64_t v3 = SUUIUserInterfaceIdiom(v2);

  if (v3 == 1)
  {
    double v4 = 30.0;
    double v5 = 103.0;
    double v6 = 210.0;
  }
  else
  {
    double v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 bounds];
    double v9 = v8;

    double v4 = 15.0;
    if (v9 <= 375.0)
    {
      long long v10 = [MEMORY[0x263F82B60] mainScreen];
      [v10 bounds];
      double v12 = v11;

      double v6 = dbl_2568A1260[v12 > 320.0];
      double v5 = 78.0;
      if (v12 > 320.0) {
        double v5 = 100.0;
      }
    }
    else
    {
      double v5 = 86.0;
      double v6 = 175.0;
    }
  }
  double v13 = v4;
  result.var2 = v13;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (NSArray)bricks
{
  return self->_bricks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshView, 0);
  objc_storeStrong((id *)&self->_swooshTitle, 0);
  objc_storeStrong((id *)&self->_hiddenImageIndexSet, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_bricks, 0);
}

@end