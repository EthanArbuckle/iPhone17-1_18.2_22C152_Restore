@interface WFChooseFromListDialogViewController
- (BOOL)shouldInstallBannerDimmingLayer;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (NSCache)imageCache;
- (NSMutableArray)selectedItems;
- (NSMutableDictionary)cachedAggregateHeightsByWidth;
- (UITableView)tableView;
- (WFChooseFromListDialogCell)prototypeCell;
- (WFChooseFromListDialogViewController)initWithRequest:(id)a3;
- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureCell:(id)a3 forIndexPath:(id)a4;
- (void)dealloc;
- (void)finishWithSelectedItems;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)platterView:(id)a3 didUpdateContentVerticalOffset:(double)a4;
- (void)setAppearanceProvider:(id)a3;
- (void)setCachedAggregateHeightsByWidth:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setPrototypeCell:(id)a3;
- (void)setSelectedItems:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCellSeparatorInsets;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFChooseFromListDialogViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAggregateHeightsByWidth, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_prototypeCell, 0);
  objc_storeStrong((id *)&self->_selectedItems, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

- (void)setCachedAggregateHeightsByWidth:(id)a3
{
}

- (NSMutableDictionary)cachedAggregateHeightsByWidth
{
  return self->_cachedAggregateHeightsByWidth;
}

- (void)setImageCache:(id)a3
{
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setPrototypeCell:(id)a3
{
}

- (WFChooseFromListDialogCell)prototypeCell
{
  return self->_prototypeCell;
}

- (void)setSelectedItems:(id)a3
{
}

- (NSMutableArray)selectedItems
{
  return self->_selectedItems;
}

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (BOOL)shouldInstallBannerDimmingLayer
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WFChooseFromListDialogContentSizeContext == a6)
  {
    uint64_t v11 = *MEMORY[0x263F081C8];
    id v12 = a5;
    v13 = [v12 objectForKey:v11];
    [v13 CGSizeValue];
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    v18 = [v12 objectForKey:*MEMORY[0x263F081B8]];

    [v18 CGSizeValue];
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v29.origin.CGFloat x = 0.0;
    v29.origin.CGFloat y = 0.0;
    v29.size.CGFloat width = v15;
    v29.size.CGFloat height = v17;
    CGRect v30 = CGRectIntegral(v29);
    CGFloat x = v30.origin.x;
    CGFloat y = v30.origin.y;
    CGFloat width = v30.size.width;
    CGFloat height = v30.size.height;
    v30.origin.CGFloat x = 0.0;
    v30.origin.CGFloat y = 0.0;
    v30.size.CGFloat width = v20;
    v30.size.CGFloat height = v22;
    CGRect v32 = CGRectIntegral(v30);
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    if (!CGRectEqualToRect(v31, v32))
    {
      [(WFCompactPlatterViewController *)self invalidateContentSize];
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)WFChooseFromListDialogViewController;
    id v10 = a5;
    [(WFChooseFromListDialogViewController *)&v27 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (void)setAppearanceProvider:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFChooseFromListDialogViewController;
  id v4 = a3;
  [(WFCompactPlatterViewController *)&v6 setAppearanceProvider:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(v4, "configureChooseFromListDialogViewController:", WeakRetained, v6.receiver, v6.super_class);
}

- (void)platterView:(id)a3 didUpdateContentVerticalOffset:(double)a4
{
  double v4 = -a4;
  id v5 = [(WFChooseFromListDialogViewController *)self tableView];
  objc_msgSend(v5, "setContentOffset:", 0.0, v4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = [v15 cellForRowAtIndexPath:v6];
  v8 = [v7 listItem];
  v9 = [(WFCompactDialogViewController *)self request];
  char v10 = [v9 allowsMultipleSelection];

  uint64_t v11 = [(WFChooseFromListDialogViewController *)self selectedItems];
  id v12 = v11;
  if (v10)
  {
    int v13 = [v11 containsObject:v8];

    if (v13)
    {
      [v7 setChecked:0];
      double v14 = [(WFChooseFromListDialogViewController *)self selectedItems];
      [v14 removeObject:v8];
    }
    else
    {
      [v7 setChecked:1];
      double v14 = [(WFChooseFromListDialogViewController *)self selectedItems];
      [v14 addObject:v8];
    }

    [v15 deselectRowAtIndexPath:v6 animated:1];
    [v15 beginUpdates];
    [v15 endUpdates];
  }
  else
  {
    [v11 addObject:v8];

    [(WFChooseFromListDialogViewController *)self finishWithSelectedItems];
  }
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFCompactDialogViewController *)self request];
  v9 = [v8 items];
  uint64_t v10 = [v6 row];

  id v18 = [v9 objectAtIndexedSubscript:v10];

  [v7 setViewController:self];
  uint64_t v11 = [(WFChooseFromListDialogViewController *)self imageCache];
  [v7 setImageCache:v11];

  id v12 = [(WFChooseFromListDialogViewController *)self selectedItems];
  objc_msgSend(v7, "setChecked:", objc_msgSend(v12, "containsObject:", v18));

  int v13 = [(WFCompactDialogViewController *)self request];
  double v14 = [v13 displayConfiguration];
  [v7 setDisplayConfiguration:v14];

  [v7 setListItem:v18];
  id v15 = [(WFCompactPlatterViewController *)self platterView];
  double v16 = [v15 visualStylingProviderForCategory:2];

  [v7 setFillVisualStylingProvider:v16];
  CGFloat v17 = [(WFCompactPlatterViewController *)self appearanceProvider];
  [v17 configureChooseFromListDialogCell:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [(WFChooseFromListDialogViewController *)self configureCell:v10 forIndexPath:v6];
  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(WFCompactDialogViewController *)self request];
  id v5 = [v4 items];
  int64_t v6 = [v5 count];

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFChooseFromListDialogViewController;
  [(WFChooseFromListDialogViewController *)&v4 viewDidAppear:a3];
  [(WFChooseFromListDialogViewController *)self updateCellSeparatorInsets];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFChooseFromListDialogViewController;
  [(WFChooseFromListDialogViewController *)&v4 viewWillAppear:a3];
  [(WFChooseFromListDialogViewController *)self updateCellSeparatorInsets];
}

- (void)updateCellSeparatorInsets
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [(WFChooseFromListDialogViewController *)self tableView];
  objc_super v4 = [v3 indexPathsForVisibleRows];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "row", (void)v24);
        id v12 = [(WFChooseFromListDialogViewController *)self tableView];
        uint64_t v13 = objc_msgSend(v12, "numberOfRowsInSection:", objc_msgSend(v10, "section"));

        double v14 = [(WFChooseFromListDialogViewController *)self tableView];
        id v15 = [v14 cellForRowAtIndexPath:v10];

        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            double v16 = v15;
          }
          else {
            double v16 = 0;
          }
        }
        else
        {
          double v16 = 0;
        }
        uint64_t v17 = v11 + 1;
        id v18 = v16;

        if (v17 >= v13)
        {
          int v22 = 0;
        }
        else
        {
          double v19 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", v17, objc_msgSend(v10, "section"));
          CGFloat v20 = [(WFChooseFromListDialogViewController *)self tableView];
          double v21 = [v20 cellForRowAtIndexPath:v19];

          if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
            int v22 = [v21 prefersSeparatorInsetForImage];
          }
          else {
            int v22 = 0;
          }
        }
        if ((v22 & [v18 prefersSeparatorInsetForImage]) != 0) {
          double v23 = 66.0;
        }
        else {
          double v23 = 24.0;
        }
        objc_msgSend(v18, "setSeparatorInset:", 0.0, v23, 0.0, 0.0);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  uint64_t v7 = [(WFChooseFromListDialogViewController *)self tableView];

  if (v7)
  {
    uint64_t v8 = [(WFChooseFromListDialogViewController *)self cachedAggregateHeightsByWidth];
    v9 = [NSNumber numberWithDouble:a3];
    uint64_t v10 = [v8 objectForKey:v9];

    if (v10)
    {
      uint64_t v11 = [(WFChooseFromListDialogViewController *)self cachedAggregateHeightsByWidth];
      id v12 = [NSNumber numberWithDouble:a3];
      uint64_t v13 = [v11 objectForKey:v12];

      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          double v14 = v13;
        }
        else {
          double v14 = 0;
        }
      }
      else
      {
        double v14 = 0;
      }
      CGFloat v20 = v14;

      [(WFChooseFromListDialogCell *)v20 doubleValue];
      double v16 = v26;
    }
    else
    {
      uint64_t v17 = self->_prototypeCell;
      if (!v17)
      {
        uint64_t v17 = [[WFChooseFromListDialogCell alloc] initWithStyle:0 reuseIdentifier:0];
        objc_storeStrong((id *)&self->_prototypeCell, v17);
      }
      uint64_t v36 = 0;
      v37 = (double *)&v36;
      uint64_t v38 = 0x2020000000;
      uint64_t v39 = 0;
      id v18 = [(WFCompactDialogViewController *)self request];
      double v19 = [v18 items];
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      CGRect v30 = __87__WFChooseFromListDialogViewController_contentHeightForWidth_withMaximumVisibleHeight___block_invoke;
      CGRect v31 = &unk_2649CAAE8;
      CGRect v32 = self;
      CGFloat v20 = v17;
      v33 = v20;
      v34 = &v36;
      double v35 = a3;
      [v19 enumerateObjectsUsingBlock:&v28];

      double v21 = [(WFChooseFromListDialogViewController *)self tableView];
      [v21 contentInset];
      v37[3] = v22 + v37[3];

      double v23 = [(WFChooseFromListDialogViewController *)self cachedAggregateHeightsByWidth];
      long long v24 = [NSNumber numberWithDouble:v37[3]];
      long long v25 = [NSNumber numberWithDouble:a3];
      [v23 setObject:v24 forKey:v25];

      double v16 = v37[3];
      _Block_object_dispose(&v36, 8);
    }
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)WFChooseFromListDialogViewController;
    [(WFCompactPlatterViewController *)&v40 contentHeightForWidth:a3 withMaximumVisibleHeight:a4];
    return v15;
  }
  return v16;
}

double __87__WFChooseFromListDialogViewController_contentHeightForWidth_withMaximumVisibleHeight___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:0];
  [v4 configureCell:v5 forIndexPath:v6];

  objc_msgSend(*(id *)(a1 + 40), "systemLayoutSizeFittingSize:", *(double *)(a1 + 56), *(double *)(MEMORY[0x263F83810] + 8));
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = v8 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

- (void)finishWithSelectedItems
{
  id v3 = objc_alloc(MEMORY[0x263F85198]);
  id v5 = [(WFChooseFromListDialogViewController *)self selectedItems];
  objc_super v4 = (void *)[v3 initWithItems:v5 cancelled:0];
  [(WFCompactDialogViewController *)self finishWithResponse:v4];
}

- (void)loadView
{
  v50[4] = *MEMORY[0x263EF8340];
  v49.receiver = self;
  v49.super_class = (Class)WFChooseFromListDialogViewController;
  [(WFCompactDialogViewController *)&v49 loadView];
  id v3 = [(WFCompactPlatterViewController *)self scrollView];
  [v3 setDelaysContentTouches:1];

  v43 = [(WFCompactDialogViewController *)self request];
  v42 = [(WFCompactPlatterViewController *)self platterView];
  objc_msgSend(v42, "setInsetsContent:", objc_msgSend(MEMORY[0x263EFFA40], "universalPreviewsEnabled"));
  objc_super v4 = [v43 message];
  [v42 setSecondaryText:v4];

  v41 = objc_opt_new();
  id v5 = [v43 cancelButton];

  if (v5)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [v43 cancelButton];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __48__WFChooseFromListDialogViewController_loadView__block_invoke;
    v46[3] = &unk_2649CBEF8;
    objc_copyWeak(&v47, &location);
    uint64_t v7 = +[WFCompactDialogAction actionForButton:v6 handler:v46];
    [v41 addObject:v7];

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
  if (([v43 allowsMultipleSelection] & 1) != 0
    || ([v43 items],
        double v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = [v8 count] == 0,
        v8,
        v9))
  {
    objc_initWeak(&location, self);
    uint64_t v10 = [v43 doneButton];

    if (v10)
    {
      uint64_t v11 = [v43 doneButton];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __48__WFChooseFromListDialogViewController_loadView__block_invoke_2;
      v44[3] = &unk_2649CBEF8;
      objc_copyWeak(&v45, &location);
      id v12 = +[WFCompactDialogAction actionForButton:v11 handler:v44];
      [v41 addObject:v12];

      objc_destroyWeak(&v45);
    }
    objc_destroyWeak(&location);
  }
  [(WFCompactDialogViewController *)self configureActionGroupWithActions:v41];
  uint64_t v13 = [v43 items];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    [v42 setContentClippingDelegate:self];
    id v15 = objc_alloc(MEMORY[0x263F82C78]);
    double v16 = objc_msgSend(v15, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v16 setDataSource:self];
    [v16 setDelegate:self];
    uint64_t v17 = [MEMORY[0x263F825C8] clearColor];
    [v16 setBackgroundColor:v17];

    [v16 setAlwaysBounceVertical:0];
    [v16 setScrollEnabled:0];
    [v16 setSeparatorInsetReference:0];
    id v18 = [MEMORY[0x263F824D8] effectWithStyle:1200];
    double v19 = [MEMORY[0x263F82DF0] effectForBlurEffect:v18 style:7];
    [v16 setSeparatorEffect:v19];

    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v20 = objc_opt_class();
    double v21 = (objc_class *)objc_opt_class();
    double v22 = NSStringFromClass(v21);
    [v16 registerClass:v20 forCellReuseIdentifier:v22];

    objc_storeWeak((id *)&self->_tableView, v16);
    id v23 = v16;
    [v23 _setOverrideVibrancyTrait:1];
    [v23 addObserver:self forKeyPath:@"contentSize" options:3 context:WFChooseFromListDialogContentSizeContext];
    id v24 = v23;
  }
  else
  {
    id v18 = objc_alloc_init(MEMORY[0x263F828E0]);
    long long v25 = [v43 emptyStateMessage];
    [v18 setText:v25];

    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v18 setNumberOfLines:0];
    [v18 setAdjustsFontForContentSizeCategory:1];
    double v26 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [v18 setFont:v26];

    id v24 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v24 addSubview:v18];
    v34 = (void *)MEMORY[0x263F08938];
    id v23 = [v18 leadingAnchor];
    objc_super v40 = [v24 leadingAnchor];
    uint64_t v39 = [v23 constraintEqualToAnchor:v40 constant:16.0];
    v50[0] = v39;
    uint64_t v38 = [v18 trailingAnchor];
    v37 = [v24 trailingAnchor];
    uint64_t v36 = [v38 constraintEqualToAnchor:v37 constant:-16.0];
    v50[1] = v36;
    double v35 = [v18 topAnchor];
    long long v27 = [v24 topAnchor];
    uint64_t v28 = [v35 constraintEqualToAnchor:v27 constant:10.0];
    v50[2] = v28;
    uint64_t v29 = [v18 bottomAnchor];
    CGRect v30 = [v24 bottomAnchor];
    CGRect v31 = [v29 constraintEqualToAnchor:v30 constant:-10.0];
    v50[3] = v31;
    CGRect v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:4];
    [v34 activateConstraints:v32];
  }
  id v33 = objc_alloc_init(MEMORY[0x263F82E10]);
  [v33 setView:v24];
  [(WFCompactPlatterViewController *)self setContentViewController:v33];
}

void __48__WFChooseFromListDialogViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_alloc(MEMORY[0x263F85198]);
  v2 = (void *)[v1 initWithItems:MEMORY[0x263EFFA68] cancelled:1];
  [WeakRetained finishWithResponse:v2];
}

void __48__WFChooseFromListDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishWithSelectedItems];
}

- (void)dealloc
{
  id v3 = [(WFChooseFromListDialogViewController *)self tableView];
  [v3 removeObserver:self forKeyPath:@"contentSize" context:WFChooseFromListDialogContentSizeContext];

  v4.receiver = self;
  v4.super_class = (Class)WFChooseFromListDialogViewController;
  [(WFChooseFromListDialogViewController *)&v4 dealloc];
}

- (WFChooseFromListDialogViewController)initWithRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFChooseFromListDialogViewController;
  id v5 = [(WFCompactDialogViewController *)&v24 initWithRequest:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    selectedItems = v5->_selectedItems;
    v5->_selectedItems = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    imageCache = v5->_imageCache;
    v5->_imageCache = (NSCache *)v8;

    uint64_t v10 = objc_opt_new();
    cachedAggregateHeightsByWidth = v5->_cachedAggregateHeightsByWidth;
    v5->_cachedAggregateHeightsByWidth = (NSMutableDictionary *)v10;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = objc_msgSend(v4, "items", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v17 selected]) {
            [(NSMutableArray *)v5->_selectedItems addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }

    id v18 = v5;
  }

  return v5;
}

@end