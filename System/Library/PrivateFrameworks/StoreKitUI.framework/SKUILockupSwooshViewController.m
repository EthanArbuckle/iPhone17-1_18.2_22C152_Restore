@interface SKUILockupSwooshViewController
+ (int64_t)_swooshTypeForLockups:(id)a3;
- ($0F9D46A54E891E2DFD6B960C8B4302D3)_lockupSwooshMetrics;
- (BOOL)isSeeAllHidden;
- (CGRect)frameForItemAtIndex:(int64_t)a3;
- (CGRect)seeAllButtonFrame;
- (CGSize)_maximumCellSizeForImageSize:(CGSize)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)items;
- (NSArray)lockups;
- (NSURL)seeAllURL;
- (SKUIItemArtworkContext)artworkContext;
- (SKUILockupSwooshViewController)initWithItemList:(id)a3;
- (SKUILockupSwooshViewController)initWithSwoosh:(id)a3;
- (SKUIVideoImageDataConsumer)videoImageConsumer;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)_newArtworkContextForSwooshType:(int64_t)a3;
- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SKUILockupStyle *)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathsForVisibleItems;
- (id)popImageViewForItemAtIndex:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)swooshType;
- (void)_reloadSizes;
- (void)_seeAllAction:(id)a3;
- (void)_setExpectedImageSize:(CGSize)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)deselectAllItems;
- (void)loadView;
- (void)setClientContext:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)setLockups:(id)a3;
- (void)setSeeAllHidden:(BOOL)a3;
- (void)setSwooshType:(int64_t)a3;
- (void)setVideoThumbnail:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)unhideImages;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKUILockupSwooshViewController

- (SKUILockupSwooshViewController)initWithItemList:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupSwooshViewController initWithItemList:]();
  }
  v33.receiver = self;
  v33.super_class = (Class)SKUILockupSwooshViewController;
  v5 = [(SKUILockupSwooshViewController *)&v33 init];
  v6 = v5;
  if (v5)
  {
    p_defaultLockupStyle = &v5->_defaultLockupStyle;
    SKUILockupStyleDefault((uint64_t)&v31);
    long long v8 = v31;
    v6->_defaultLockupStyle.unint64_t visibleFields = visibleFields;
    *(_OWORD *)&p_defaultLockupStyle->artworkSize = v8;
    uint64_t v9 = [v4 seeAllTitle];
    seeAllTitle = v6->_seeAllTitle;
    v6->_seeAllTitle = (NSString *)v9;

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = [v4 items];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * v16);
          long long v18 = *(_OWORD *)&p_defaultLockupStyle->artworkSize;
          unint64_t visibleFields = v6->_defaultLockupStyle.visibleFields;
          long long v31 = v18;
          id v19 = [(SKUILockupSwooshViewController *)v6 _newLockupComponentWithItem:v17 defaultStyle:&v31];
          [v11 addObject:v19];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v14);
    }
    uint64_t v20 = [v11 copy];
    lockups = v6->_lockups;
    v6->_lockups = (NSArray *)v20;

    v22 = [v4 seeAllURLString];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v22];
      seeAllURL = v6->_seeAllURL;
      v6->_seeAllURL = (NSURL *)v23;
    }
    v6->_swooshType = [(id)objc_opt_class() _swooshTypeForLockups:v6->_lockups];
    v25 = [v4 title];
    [(SKUILockupSwooshViewController *)v6 setTitle:v25];
  }
  return v6;
}

- (SKUILockupSwooshViewController)initWithSwoosh:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupSwooshViewController initWithSwoosh:]();
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUILockupSwooshViewController;
  v5 = [(SKUILockupSwooshViewController *)&v28 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = [v4 lockups];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v13 = [v12 item];
          if (v13) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }
    uint64_t v14 = [v6 copy];
    uint64_t v15 = (void *)*((void *)v5 + 134);
    *((void *)v5 + 134) = v14;

    if (v4)
    {
      [v4 lockupStyle];
    }
    else
    {
      long long v22 = 0uLL;
      uint64_t v23 = 0;
    }
    *((void *)v5 + 129) = v23;
    *(_OWORD *)(v5 + 1016) = v22;
    *((void *)v5 + 154) = [v4 seeAllStyle];
    uint64_t v16 = [v4 seeAllTitle];
    uint64_t v17 = (void *)*((void *)v5 + 155);
    *((void *)v5 + 155) = v16;

    uint64_t v18 = [v4 seeAllURL];
    id v19 = (void *)*((void *)v5 + 156);
    *((void *)v5 + 156) = v18;

    *((void *)v5 + 158) = [(id)objc_opt_class() _swooshTypeForLockups:*((void *)v5 + 134)];
    uint64_t v20 = [v4 title];
    [v5 setTitle:v20];
  }
  return (SKUILockupSwooshViewController *)v5;
}

- (void)dealloc
{
  [(UICollectionView *)self->_collectionView setDataSource:0];
  [(UICollectionView *)self->_collectionView setDelegate:0];
  v3 = [(SKUISwooshView *)self->_swooshView chevronTitleControl];
  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  id v4 = [(SKUISwooshView *)self->_swooshView seeAllControl];
  [v4 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v5.receiver = self;
  v5.super_class = (Class)SKUILockupSwooshViewController;
  [(SKUILockupSwooshViewController *)&v5 dealloc];
}

- (NSArray)items
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_lockups;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "item", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (CGRect)seeAllButtonFrame
{
  int64_t seeAllStyle = self->_seeAllStyle;
  if (seeAllStyle == 1)
  {
    uint64_t v3 = [(SKUISwooshView *)self->_swooshView chevronTitleControl];
  }
  else
  {
    if (seeAllStyle)
    {
      id v4 = 0;
      goto LABEL_7;
    }
    uint64_t v3 = [(SKUISwooshView *)self->_swooshView seeAllControl];
  }
  id v4 = (void *)v3;
LABEL_7:
  [v4 bounds];
  objc_msgSend(v4, "convertRect:toView:", 0);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setLockups:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__35;
  long long v27 = __Block_byref_object_dispose__35;
  id v28 = 0;
  if ([(NSArray *)self->_lockups count])
  {
    v30[3] = 0;
    uint64_t v5 = [(NSArray *)self->_lockups objectAtIndex:0];
    double v6 = (void *)v24[5];
    v24[5] = v5;
  }
  [(UICollectionView *)self->_collectionView numberOfItemsInSection:0];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__SKUILockupSwooshViewController_setLockups___block_invoke;
  v17[3] = &unk_1E6426890;
  v21 = &v23;
  id v9 = v8;
  id v18 = v9;
  id v10 = v7;
  long long v22 = &v29;
  id v19 = v10;
  uint64_t v20 = self;
  [v4 enumerateObjectsUsingBlock:v17];
  double v11 = (NSArray *)[v9 copy];
  lockups = self->_lockups;
  self->_lockups = v11;

  if ([v10 count])
  {
    double width = self->_maxCellSize.width;
    double height = self->_maxCellSize.height;
    self->_swooshType = [(id)objc_opt_class() _swooshTypeForLockups:self->_lockups];
    [(SKUILockupSwooshViewController *)self _reloadSizes];
    collectionView = self->_collectionView;
    if (collectionView)
    {
      if (width == self->_maxCellSize.width && height == self->_maxCellSize.height)
      {
        p_didInitialReload = &self->_didInitialReload;
        if (self->_didInitialReload)
        {
          [(UICollectionView *)collectionView insertItemsAtIndexPaths:v10];
          goto LABEL_11;
        }
      }
      else
      {
        [(UICollectionView *)collectionView frame];
        -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
        [(SKUISwooshView *)self->_swooshView sizeToFit];
        p_didInitialReload = &self->_didInitialReload;
      }
      BOOL *p_didInitialReload = 1;
      [(UICollectionView *)self->_collectionView reloadData];
    }
  }
LABEL_11:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

void __45__SKUILockupSwooshViewController_setLockups___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 item];
  if (v3)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v4 && (uint64_t v5 = [v4 itemIdentifier], v5 == objc_msgSend(v11, "itemIdentifier")))
    {
      unint64_t v6 = ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      unint64_t v7 = [*(id *)(*(void *)(a1 + 48) + 1072) count];
      if (v6 >= v7)
      {
        id v8 = 0;
      }
      else
      {
        id v8 = [*(id *)(*(void *)(a1 + 48) + 1072) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v8);
      if (v6 >= v7) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) count];
      id v10 = *(void **)(a1 + 40);
      id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:0];
      [v10 addObject:v8];
    }

LABEL_8:
    [*(id *)(a1 + 32) addObject:v11];
  }
}

- (void)setSeeAllHidden:(BOOL)a3
{
  if (self->_seeAllHidden != a3)
  {
    BOOL v3 = a3;
    self->_seeAllHidden = a3;
    int64_t seeAllStyle = self->_seeAllStyle;
    if (seeAllStyle == 1)
    {
      BOOL v5 = !a3 && self->_seeAllURL != 0;
      swooshView = self->_swooshView;
      [(SKUISwooshView *)swooshView setShowsChevronForTitle:v5];
    }
    else if (!seeAllStyle)
    {
      id v7 = [(SKUISwooshView *)self->_swooshView seeAllControl];
      [v7 setHidden:v3];
    }
  }
}

- (SKUIVideoImageDataConsumer)videoImageConsumer
{
  videoImageConsumer = self->_videoImageConsumer;
  if (!videoImageConsumer)
  {
    id v4 = objc_alloc_init(SKUIVideoImageDataConsumer);
    BOOL v5 = self->_videoImageConsumer;
    self->_videoImageConsumer = v4;

    [(SKUIVideoImageDataConsumer *)self->_videoImageConsumer setAllowedOrientations:2];
    -[SKUIVideoImageDataConsumer setLandscapeSize:](self->_videoImageConsumer, "setLandscapeSize:", self->_metrics.videoThumbnailSize.width, self->_metrics.videoThumbnailSize.height);
    unint64_t v6 = [(SKUISwooshViewController *)self colorScheme];
    id v7 = self->_videoImageConsumer;
    id v8 = [v6 backgroundColor];
    [(SKUIVideoImageDataConsumer *)v7 setBackgroundColor:v8];

    [(SKUIVideoImageDataConsumer *)self->_videoImageConsumer setColorScheme:v6];
    videoImageConsumer = self->_videoImageConsumer;
  }

  return videoImageConsumer;
}

- (void)deselectAllItems
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
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
  uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
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
  result.size.double height = v17;
  result.size.double width = v16;
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
  double v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  double v7 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v6];

  if (v7)
  {
    double v8 = [v7 layout];
    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v10 = [v8 iconImage];
    double v11 = (void *)[v9 initWithImage:v10];

    double v12 = [v8 iconImageView];
    double v13 = [(SKUILockupSwooshViewController *)self view];
    [v12 frame];
    objc_msgSend(v13, "convertRect:fromView:", v7);
    objc_msgSend(v11, "setFrame:");

    hiddenIconIndexSet = self->_hiddenIconIndexSet;
    if (!hiddenIconIndexSet)
    {
      double v15 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
      double v16 = self->_hiddenIconIndexSet;
      self->_hiddenIconIndexSet = v15;

      hiddenIconIndexSet = self->_hiddenIconIndexSet;
    }
    [(NSMutableIndexSet *)hiddenIconIndexSet addIndex:a3];
    [v8 setIconImageHidden:1];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (void)setClientContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUILockupSwooshViewController;
  [(SKUISwooshViewController *)&v5 setClientContext:a3];
  [(SKUILockupSwooshViewController *)self _lockupSwooshMetrics];
  self->_metrics = v4;
  [(SKUILockupSwooshViewController *)self _reloadSizes];
}

- (void)setColorScheme:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUISwooshViewController *)self colorScheme];

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)SKUILockupSwooshViewController;
    [(SKUISwooshViewController *)&v8 setColorScheme:v4];
    [(SKUIItemArtworkContext *)self->_artworkContext setColorScheme:v4];
    [(SKUISwooshView *)self->_swooshView setColoringWithColorScheme:v4];
    videoImageConsumer = self->_videoImageConsumer;
    double v7 = [v4 backgroundColor];
    [(SKUIVideoImageDataConsumer *)videoImageConsumer setBackgroundColor:v7];

    [(SKUIVideoImageDataConsumer *)self->_videoImageConsumer setColorScheme:v4];
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  self->_delegateWantsWillDisplay = objc_opt_respondsToSelector() & 1;
  v5.receiver = self;
  v5.super_class = (Class)SKUILockupSwooshViewController;
  [(SKUISwooshViewController *)&v5 setDelegate:v4];
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  collectionView = self->_collectionView;
  double v6 = (void *)MEMORY[0x1E4F28D58];
  id v7 = a3;
  objc_super v8 = [v6 indexPathForItem:a4 inSection:0];
  id v10 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v8];

  id v9 = [v10 layout];
  [v9 setIconImage:v7];
}

- (void)setVideoThumbnail:(id)a3 forItemAtIndex:(int64_t)a4
{
  collectionView = self->_collectionView;
  double v6 = (void *)MEMORY[0x1E4F28D58];
  id v7 = a3;
  objc_super v8 = [v6 indexPathForItem:a4 inSection:0];
  id v10 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v8];

  id v9 = [v10 layout];
  [v9 setVideoThumbnailImage:v7];
}

- (void)unhideImages
{
  hiddenIconIndexSet = self->_hiddenIconIndexSet;
  if (hiddenIconIndexSet)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__SKUILockupSwooshViewController_unhideImages__block_invoke;
    v5[3] = &unk_1E6426698;
    v5[4] = self;
    [(NSMutableIndexSet *)hiddenIconIndexSet enumerateIndexesWithOptions:0 usingBlock:v5];
    id v4 = self->_hiddenIconIndexSet;
    self->_hiddenIconIndexSet = 0;
  }
}

void __46__SKUILockupSwooshViewController_unhideImages__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  BOOL v3 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:0];
  id v5 = [v2 cellForItemAtIndexPath:v3];

  id v4 = [v5 layout];
  [v4 setIconImageHidden:0];
}

- (void)loadView
{
  if (!self->_swooshView)
  {
    BOOL v3 = objc_alloc_init(SKUISwooshView);
    swooshView = self->_swooshView;
    self->_swooshView = v3;

    int64_t seeAllStyle = self->_seeAllStyle;
    if (seeAllStyle == 1)
    {
      objc_super v8 = [(SKUISwooshView *)self->_swooshView chevronTitleControl];
      [v8 addTarget:self action:sel__seeAllAction_ forControlEvents:64];

      BOOL v9 = !self->_seeAllHidden && self->_seeAllURL != 0;
      [(SKUISwooshView *)self->_swooshView setShowsChevronForTitle:v9];
    }
    else if (!seeAllStyle)
    {
      double v6 = [(SKUISwooshView *)self->_swooshView seeAllControl];
      [v6 addTarget:self action:sel__seeAllAction_ forControlEvents:64];

      id v7 = [(SKUISwooshView *)self->_swooshView seeAllControl];
      [v7 setHidden:self->_seeAllHidden];
    }
    id v10 = self->_swooshView;
    double v11 = [(SKUISwooshViewController *)self colorScheme];
    [(SKUISwooshView *)v10 setColoringWithColorScheme:v11];

    [(SKUISwooshView *)self->_swooshView contentInsets];
    -[SKUISwooshView setCollectionViewInsets:](self->_swooshView, "setCollectionViewInsets:", -5.0, -v12, 2.0, -v13);
  }
  if (self->_seeAllStyle || !self->_seeAllURL)
  {
    double v14 = 0;
  }
  else
  {
    seeAllTitle = self->_seeAllTitle;
    if (seeAllTitle)
    {
      double v14 = seeAllTitle;
    }
    else
    {
      id v28 = [(SKUISwooshViewController *)self clientContext];
      uint64_t v29 = v28;
      if (v28) {
        [v28 localizedStringForKey:@"SWOOSH_SEE_ALL_TITLE"];
      }
      else {
      uint64_t v31 = +[SKUIClientContext localizedStringForKey:@"SWOOSH_SEE_ALL_TITLE" inBundles:0];
      }

      double v14 = v31;
    }
  }
  uint64_t v30 = v14;
  [(SKUISwooshView *)self->_swooshView setSeeAllTitle:v14];
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    double v16 = objc_alloc_init(SKUISwooshCollectionViewLayout);
    double v17 = [(SKUISwooshView *)self->_swooshView backgroundColor];
    [(SKUISwooshCollectionViewLayout *)v16 setBackgroundColor:v17];

    [(SKUISwooshCollectionViewLayout *)v16 setSnapsToItemBoundaries:1];
    if ((self->_defaultLockupStyle.visibleFields & 0x400) != 0)
    {
      p_interItemSpacingVideoLockup = &self->_metrics.interItemSpacingVideoLockup;
    }
    else if (self->_swooshType == 2)
    {
      p_interItemSpacingVideoLockup = &self->_metrics.interItemSpacingNewsstand;
    }
    else
    {
      p_interItemSpacingVideoLockup = &self->_metrics.interItemSpacingMixed;
    }
    [(UICollectionViewFlowLayout *)v16 setMinimumInteritemSpacing:*p_interItemSpacingVideoLockup];
    [(UICollectionViewFlowLayout *)v16 setMinimumLineSpacing:*p_interItemSpacingVideoLockup];
    uint64_t v20 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v16, 0.0, 0.0, 0.0, self->_maxCellSize.height);
    v21 = self->_collectionView;
    self->_collectionView = v20;

    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"0"];
    [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
    long long v22 = self->_collectionView;
    uint64_t v23 = [(SKUISwooshView *)self->_swooshView backgroundColor];
    [(UICollectionView *)v22 setBackgroundColor:v23];

    [(UICollectionView *)self->_collectionView setDataSource:self];
    long long v24 = self->_collectionView;
    +[SKUISwooshCollectionViewLayout snapToBoundariesDecelerationRate];
    [(UICollectionView *)v24 setDecelerationRate:v25];
    [(UICollectionView *)self->_collectionView setDelegate:self];
    [(UICollectionView *)self->_collectionView setScrollsToTop:0];
    [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)self->_collectionView setPrefetchingEnabled:0];

    collectionView = self->_collectionView;
  }
  [(SKUISwooshView *)self->_swooshView setCollectionView:collectionView];
  long long v26 = self->_swooshView;
  long long v27 = [(SKUILockupSwooshViewController *)self title];
  [(SKUISwooshView *)v26 setTitle:v27];

  [(SKUISwooshView *)self->_swooshView sizeToFit];
  [(SKUILockupSwooshViewController *)self setView:self->_swooshView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_didInitialReload)
  {
    self->_didInitialReload = 1;
    [(UICollectionView *)self->_collectionView reloadData];
  }
  id v5 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:*(void *)(*((void *)&v11 + 1) + 8 * i) animated:v3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUILockupSwooshViewController;
  [(SKUILockupSwooshViewController *)&v10 viewWillAppear:v3];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"0" forIndexPath:v6];
  uint64_t v8 = [(SKUISwooshViewController *)self clientContext];
  BOOL v9 = [v7 layout];
  [v9 setClientContext:v8];
  uint64_t v10 = [v6 item];

  long long v11 = [(NSArray *)self->_lockups objectAtIndex:v10];
  long long v12 = [v11 item];
  [v7 configureForItem:v12 clientContext:v8];

  long long v13 = [(SKUISwooshViewController *)self colorScheme];
  [v9 setColoringWithColorScheme:v13];

  objc_msgSend(v9, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", v10));
  objc_msgSend(v9, "setMaxImageSize:", self->_maxImageSize.width, self->_maxImageSize.height);
  objc_msgSend(v9, "setVideoSize:", self->_metrics.videoThumbnailSize.width, self->_metrics.videoThumbnailSize.height);
  if (v11)
  {
    [v11 lockupStyle];
    uint64_t v14 = v24;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  [v9 setVisibleFields:v14];
  double v15 = [(SKUISwooshViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = [v15 swoosh:self imageForCellAtIndex:v10];
  }
  else
  {
    uint64_t v16 = 0;
  }
  [v9 setIconImage:v16];
  if (v11)
  {
    [v11 lockupStyle];
    if (v21 & 0x400) != 0 && (objc_opt_respondsToSelector())
    {
      double v17 = [v15 swoosh:self videoThumbnailForCellAtIndex:v10];
    }
    else
    {
      double v17 = 0;
    }
  }
  else
  {
    double v17 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
  }
  objc_msgSend(v9, "setVideoThumbnailImage:", v17, v19, v20, v21, v22, v23, v24);
  if (self->_delegateWantsWillDisplay) {
    [v15 swoosh:self willDisplayCellAtIndex:v10];
  }

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_lockups count];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v5 = [(SKUISwooshViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "swoosh:didSelectCellAtIndex:", self, objc_msgSend(v6, "item"));
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  if ((self->_defaultLockupStyle.visibleFields & 0x400) != 0) {
    double horizontalPadding = self->_metrics.horizontalPadding;
  }
  else {
    double horizontalPadding = self->_metrics.horizontalPadding
  }
                      - floor((self->_maxCellSize.width - self->_maxImageSize.width) * 0.5);
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = horizontalPadding;
  result.right = v8;
  result.bottom = v7;
  result.left = horizontalPadding;
  result.top = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  double v7 = objc_alloc_init(SKUILockupSwooshCollectionViewCell);
  double v8 = [(SKUILockupSwooshCollectionViewCell *)v7 layout];
  lockups = self->_lockups;
  uint64_t v10 = [v6 item];

  long long v11 = [(NSArray *)lockups objectAtIndex:v10];
  objc_msgSend(v8, "setMaxImageSize:", self->_maxImageSize.width, self->_maxImageSize.height);
  objc_msgSend(v8, "setVideoSize:", self->_metrics.videoThumbnailSize.width, self->_metrics.videoThumbnailSize.height);
  if (v11)
  {
    [v11 lockupStyle];
    uint64_t v12 = v24;
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v8 setVisibleFields:v12];
  artworkContext = self->_artworkContext;
  uint64_t v14 = [v11 item];
  [(SKUIItemArtworkContext *)artworkContext imageSizeForItem:v14];
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v8, "cellSizeForImageOfSize:", v16, v18);
  double v20 = v19;
  CGFloat height = self->_maxCellSize.height;

  double v22 = v20;
  double v23 = height;
  result.CGFloat height = v23;
  result.double width = v22;
  return result;
}

- (void)_seeAllAction:(id)a3
{
  id v4 = [(SKUISwooshViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 swooshDidSelectSeeAll:self];
  }
}

- (void)_setExpectedImageSize:(CGSize)a3
{
  self->_expectedImageSize = a3;
  [(SKUILockupSwooshViewController *)self _reloadSizes];
}

- (CGSize)_maximumCellSizeForImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v8 = self->_metrics.videoThumbnailSize.width;
  double v9 = self->_metrics.videoThumbnailSize.height;
  uint64_t v10 = objc_alloc_init(SKUILockupSwooshCollectionViewCell);
  long long v11 = [(SKUILockupSwooshCollectionViewCell *)v10 layout];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v12 = self->_lockups;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  double v14 = v7;
  double v15 = v6;
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v30;
    double v14 = v7;
    double v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v12);
        }
        double v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "setVideoSize:", v8, v9);
        if (v19)
        {
          [v19 lockupStyle];
          uint64_t v20 = v28;
        }
        else
        {
          uint64_t v20 = 0;
          uint64_t v28 = 0;
        }
        [v11 setVisibleFields:v20];
        objc_msgSend(v11, "cellSizeForImageOfSize:", width, height);
        if (v22 >= v14) {
          double v14 = v22;
        }
        if (v21 >= v15) {
          double v15 = v21;
        }
      }
      uint64_t v16 = [(NSArray *)v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }

  if (v15 == v6 && v14 == v7)
  {
    objc_msgSend(v11, "setVideoSize:", v8, v9);
    [v11 setVisibleFields:self->_defaultLockupStyle.visibleFields];
    objc_msgSend(v11, "cellSizeForImageOfSize:", width, height);
    double v15 = v24;
    double v14 = v25;
  }

  double v26 = v15;
  double v27 = v14;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (id)_newArtworkContextForSwooshType:(int64_t)a3
{
  id v5 = objc_alloc_init(SKUIItemArtworkContext);
  double v6 = [(SKUISwooshViewController *)self colorScheme];
  [(SKUIItemArtworkContext *)v5 setColorScheme:v6];

  p_metrics = &self->_metrics;
  if ((self->_defaultLockupStyle.visibleFields & 0x400) != 0)
  {
    p_videoLockupIconSize = &self->_metrics.videoLockupIconSize;
    double width = self->_metrics.videoLockupIconSize.width;
    p_double height = &p_videoLockupIconSize->height;
    uint64_t v13 = +[SKUIProductImageDataConsumer consumerWithSize:](SKUIProductImageDataConsumer, "consumerWithSize:", width, p_videoLockupIconSize->height);
    [(SKUIItemArtworkContext *)v5 setGeneralConsumer:v13];

    double v14 = +[SKUIStyledImageDataConsumer appIconConsumerWithSize:](SKUIStyledImageDataConsumer, "appIconConsumerWithSize:", p_videoLockupIconSize->width, p_videoLockupIconSize->height);
    [(SKUIItemArtworkContext *)v5 setIconConsumer:v14];
  }
  else
  {
    double v8 = +[SKUIProductImageDataConsumer consumerWithSize:](SKUIProductImageDataConsumer, "consumerWithSize:", self->_metrics.newsstandSize.width, self->_metrics.newsstandSize.height);
    [(SKUIItemArtworkContext *)v5 setGeneralConsumer:v8];

    double v9 = +[SKUIStyledImageDataConsumer appIconConsumerWithSize:](SKUIStyledImageDataConsumer, "appIconConsumerWithSize:", p_metrics->iconSize.width, p_metrics->iconSize.height);
    [(SKUIItemArtworkContext *)v5 setIconConsumer:v9];

    if (a3) {
      p_double height = &p_metrics->newsstandSwooshSize.height;
    }
    else {
      p_double height = &p_metrics->newsstandSize.height;
    }
    if (a3) {
      p_videoLockupIconSize = &p_metrics->newsstandSwooshSize;
    }
    else {
      p_videoLockupIconSize = &p_metrics->newsstandSize;
    }
  }
  double v15 = +[SKUIStyledImageDataConsumer productImageConsumerWithSize:](SKUIStyledImageDataConsumer, "productImageConsumerWithSize:", p_videoLockupIconSize->width, *p_height);
  [(SKUIItemArtworkContext *)v5 setNewsstandConsumer:v15];

  return v5;
}

- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SKUILockupStyle *)a4
{
  id v5 = a3;
  if ([v5 itemKind] == 17) {
    a4->unint64_t visibleFields = 150;
  }
  double v6 = [SKUILockupComponent alloc];
  long long v9 = *(_OWORD *)&a4->artworkSize;
  unint64_t visibleFields = a4->visibleFields;
  double v7 = [(SKUILockupComponent *)v6 initWithItem:v5 style:&v9];

  return v7;
}

- (void)_reloadSizes
{
  BOOL v3 = [(SKUILockupSwooshViewController *)self _newArtworkContextForSwooshType:self->_swooshType];
  artworkContext = self->_artworkContext;
  self->_artworkContext = v3;

  if ([(NSArray *)self->_lockups count]
    || (self->_expectedImageSize.width == *MEMORY[0x1E4F1DB30]
      ? (BOOL v5 = self->_expectedImageSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      : (BOOL v5 = 0),
        v5))
  {
    [(SKUIItemArtworkContext *)self->_artworkContext largestImageSizeForLockups:self->_lockups];
    self->_maxImageSize.double width = width;
    self->_maxImageSize.double height = v7;
  }
  else
  {
    self->_maxImageSize = self->_expectedImageSize;
    double width = self->_maxImageSize.width;
  }
  -[SKUILockupSwooshViewController _maximumCellSizeForImageSize:](self, "_maximumCellSizeForImageSize:", width, self->_maxImageSize.height);
  self->_maxCellSize.double width = v8;
  self->_maxCellSize.double height = v9;
}

+ (int64_t)_swooshTypeForLockups:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned __int8 v6 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) item];
        char v11 = [v10 isNewsstandApp];

        v6 |= v11 ^ 1;
        v7 |= v11;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
    if (v7) {
      int64_t v12 = 2;
    }
    else {
      int64_t v12 = 1;
    }
    if ((v7 & 1 & v6) != 0) {
      int64_t v12 = 0;
    }
  }
  else
  {
    int64_t v12 = 1;
  }

  return v12;
}

- ($0F9D46A54E891E2DFD6B960C8B4302D3)_lockupSwooshMetrics
{
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  retstr->var3 = 0u;
  retstr->var4 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0 = 0u;
  uint64_t v4 = [(SKUISwooshViewController *)self clientContext];
  uint64_t v5 = SKUIUserInterfaceIdiom(v4);

  if (v5 == 1)
  {
    retstr->var0 = (CGSize)vdupq_n_s64(0x4056800000000000uLL);
    retstr->var1 = (CGSize)xmmword_1C1CCBB70;
    retstr->var2 = (CGSize)xmmword_1C1CCBBA0;
    retstr->var3 = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
    retstr->var4 = (CGSize)xmmword_1C1CCBBB0;
    *(_OWORD *)&retstr->var5 = xmmword_1C1CCBBC0;
    __asm { FMOV            V0.2D, #30.0 }
    *(_OWORD *)&retstr->var7 = _Q0;
  }
  else
  {
    int64_t v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 bounds];
    double v14 = v13;

    if (v14 <= 375.0)
    {
      long long v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v16 bounds];
      double v18 = v17;

      if (v18 <= 320.0)
      {
        retstr->var0 = (CGSize)vdupq_n_s64(0x4052000000000000uLL);
        retstr->var1 = (CGSize)xmmword_1C1CCBB10;
        retstr->var2 = (CGSize)xmmword_1C1CCBB20;
        retstr->var3 = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
        CGSize v15 = (CGSize)xmmword_1C1CCBB30;
      }
      else
      {
        retstr->var0 = (CGSize)vdupq_n_s64(0x4057C00000000000uLL);
        retstr->var1 = (CGSize)xmmword_1C1CCBB40;
        retstr->var2 = (CGSize)xmmword_1C1CCBB50;
        retstr->var3 = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
        CGSize v15 = (CGSize)xmmword_1C1CCBB60;
      }
    }
    else
    {
      retstr->var0 = (CGSize)vdupq_n_s64(0x4054000000000000uLL);
      retstr->var1 = (CGSize)xmmword_1C1CCBB70;
      retstr->var2 = (CGSize)xmmword_1C1CCBB80;
      retstr->var3 = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
      CGSize v15 = (CGSize)xmmword_1C1CCBB90;
    }
    __asm { FMOV            V1.2D, #15.0 }
    retstr->var4 = v15;
    *(_OWORD *)&retstr->var5 = _Q1;
    *(_OWORD *)&retstr->var7 = _Q1;
  }
  return result;
}

- (SKUIItemArtworkContext)artworkContext
{
  return self->_artworkContext;
}

- (NSArray)lockups
{
  return self->_lockups;
}

- (int64_t)swooshType
{
  return self->_swooshType;
}

- (void)setSwooshType:(int64_t)a3
{
  self->_swooshType = a3;
}

- (BOOL)isSeeAllHidden
{
  return self->_seeAllHidden;
}

- (NSURL)seeAllURL
{
  return self->_seeAllURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoImageConsumer, 0);
  objc_storeStrong((id *)&self->_swooshView, 0);
  objc_storeStrong((id *)&self->_seeAllURL, 0);
  objc_storeStrong((id *)&self->_seeAllTitle, 0);
  objc_storeStrong((id *)&self->_lockups, 0);
  objc_storeStrong((id *)&self->_hiddenIconIndexSet, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_artworkContext, 0);
}

- (void)initWithItemList:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILockupSwooshViewController initWithItemList:]";
}

- (void)initWithSwoosh:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILockupSwooshViewController initWithSwoosh:]";
}

@end