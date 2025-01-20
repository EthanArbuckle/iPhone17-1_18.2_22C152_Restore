@interface SUUISwooshArrayViewController
- (BOOL)askPermission;
- (BOOL)isSkLoaded;
- (NSArray)swooshComponents;
- (NSOperationQueue)operationQueue;
- (SUUIClientContext)clientContext;
- (SUUIColorScheme)colorScheme;
- (SUUIMetricsController)metricsController;
- (SUUIProductPageChildViewControllerDelegate)delegate;
- (SUUIProductPageHeaderViewController)headerViewController;
- (SUUISwooshArrayViewController)initWithSwooshComponents:(id)a3;
- (UIScrollView)scrollView;
- (id)_artworkLoader;
- (id)_clickEventForSeeAllForViewController:(id)a3;
- (id)_clickEventWithItem:(id)a3;
- (id)_scrollView;
- (id)activeMetricsController;
- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4;
- (void)_addHeaderView;
- (void)_addMissingItemsWithResponse:(id)a3 error:(id)a4;
- (void)_layoutSwooshViews;
- (void)_loadMissingItemsIfNecessary;
- (void)_reloadChildViewControllers;
- (void)dealloc;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAskPermission:(BOOL)a3;
- (void)setClientContext:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setMetricsController:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setSwooshComponents:(id)a3;
- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4;
- (void)swooshDidSelectSeeAll:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUISwooshArrayViewController

- (SUUISwooshArrayViewController)initWithSwooshComponents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUISwooshArrayViewController;
  v5 = [(SUUISwooshArrayViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    swooshComponents = v5->_swooshComponents;
    v5->_swooshComponents = (NSArray *)v6;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_viewControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(UIScrollView *)self->_scrollView setDelegate:0];
  v8.receiver = self;
  v8.super_class = (Class)SUUISwooshArrayViewController;
  [(SUUISwooshArrayViewController *)&v8 dealloc];
}

- (BOOL)isSkLoaded
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v2 = self->_swooshComponents;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v20 + 1) + 8 * i) lockups];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = [*(id *)(*((void *)&v16 + 1) + 8 * j) item];

              if (!v13)
              {

                BOOL v14 = 0;
                goto LABEL_19;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      BOOL v14 = 1;
    }
    while (v4);
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_19:

  return v14;
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    uint64_t v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    uint64_t v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:2];
    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)setClientContext:(id)a3
{
  uint64_t v5 = (SUUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    if (*p_clientContext) {
      [(SUUIClientContext *)*p_clientContext localizedStringForKey:@"PRODUCT_PAGE_RELATED_TAB" inTable:@"ProductPage"];
    }
    else {
    uint64_t v7 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_RELATED_TAB" inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUISwooshArrayViewController *)self setTitle:v7];

    uint64_t v5 = v8;
  }
}

- (void)setColorScheme:(id)a3
{
  uint64_t v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    uint64_t v7 = [(SUUISwooshArrayViewController *)self view];
    id v8 = [(SUUIColorScheme *)*p_colorScheme backgroundColor];
    [v7 setBackgroundColor:v8];

    uint64_t v5 = v9;
  }
}

- (void)setSwooshComponents:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  uint64_t v5 = v4;
  if (self->_swooshComponents != v4)
  {
    id v8 = v4;
    uint64_t v6 = (NSArray *)[(NSArray *)v4 copy];
    swooshComponents = self->_swooshComponents;
    self->_swooshComponents = v6;

    uint64_t v4 = (NSArray *)[(SUUISwooshArrayViewController *)self isViewLoaded];
    uint64_t v5 = v8;
    if (v4)
    {
      uint64_t v4 = (NSArray *)[(SUUISwooshArrayViewController *)self _reloadChildViewControllers];
      uint64_t v5 = v8;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)setAskPermission:(BOOL)a3
{
  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    [(SUUISwooshArrayViewController *)self _reloadChildViewControllers];
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setHeaderViewController:(id)a3
{
  uint64_t v5 = (SUUIProductPageHeaderViewController *)a3;
  p_headerViewController = &self->_headerViewController;
  headerViewController = self->_headerViewController;
  uint64_t v10 = v5;
  if (headerViewController != v5)
  {
    if ([(SUUIProductPageHeaderViewController *)headerViewController isViewLoaded])
    {
      id v8 = [(SUUIProductPageHeaderViewController *)*p_headerViewController view];
      [v8 removeFromSuperview];

      uint64_t v9 = [(SUUIProductPageHeaderViewController *)*p_headerViewController floatingView];
      [v9 removeFromSuperview];
    }
    [(SUUIProductPageHeaderViewController *)*p_headerViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SUUISwooshArrayViewController addChildViewController:](self, "addChildViewController:");
      if ([(SUUISwooshArrayViewController *)self isViewLoaded]) {
        [(SUUISwooshArrayViewController *)self _addHeaderView];
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    uint64_t v5 = obj;
    if (self->_scrollView)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 productPageChildViewControllerDidLoadScrollView:self];

      uint64_t v5 = obj;
    }
  }
}

- (id)activeMetricsController
{
  return self->_metricsController;
}

- (void)loadView
{
  uint64_t v3 = [(SUUISwooshArrayViewController *)self _scrollView];
  [(SUUISwooshArrayViewController *)self setView:v3];

  [(SUUISwooshArrayViewController *)self _reloadChildViewControllers];

  [(SUUISwooshArrayViewController *)self _addHeaderView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUISwooshArrayViewController *)self _loadMissingItemsIfNecessary];
  v5.receiver = self;
  v5.super_class = (Class)SUUISwooshArrayViewController;
  [(SUUISwooshArrayViewController *)&v5 viewWillAppear:v3];
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  id v6 = [a3 lockups];
  id v13 = [v6 objectAtIndex:a4];

  uint64_t v7 = [v13 item];
  if (v7)
  {
    id v8 = [(SUUISwooshArrayViewController *)self _clickEventWithItem:v7];
    if (v8) {
      [(SUUIMetricsController *)self->_metricsController recordEvent:v8];
    }
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)p_delegate);
      [v12 productPageChildOpenItem:v7];
    }
  }
}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMutableArray *)self->_viewControllers indexOfObjectIdenticalTo:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = [(NSMutableArray *)self->_swooshArtworkLoaders objectAtIndex:v7];
  uint64_t v10 = [v6 lockups];
  char v11 = [v10 objectAtIndex:a4];

  id v12 = [v11 item];
  if (!v12)
  {
    id v13 = v9;
    BOOL v14 = 0;
    goto LABEL_7;
  }
  id v8 = [v9 cachedImageForItem:v12];
  if (!v8)
  {
    [v9 loadImageForItem:v12 reason:1];
    id v13 = v9;
    BOOL v14 = v12;
LABEL_7:
    id v8 = [v13 placeholderImageForItem:v14];
  }

LABEL_9:

  return v8;
}

- (void)swooshDidSelectSeeAll:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SUUISwooshArrayViewController *)self _clickEventForSeeAllForViewController:v4];
  if (v5) {
    [(SUUIMetricsController *)self->_metricsController recordEvent:v5];
  }
  id v6 = [v4 seeAllURL];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__SUUISwooshArrayViewController_swooshDidSelectSeeAll___block_invoke;
    v8[3] = &unk_265400740;
    v8[4] = self;
    id v9 = v4;
    id v10 = v6;
    [WeakRetained productPageChildOpenURL:v10 viewControllerBlock:v8];
  }
}

SUUIStorePageViewController *__55__SUUISwooshArrayViewController_swooshDidSelectSeeAll___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SUUIStorePageViewController);
  BOOL v3 = [*(id *)(a1 + 32) clientContext];
  [(SUUIStorePageViewController *)v2 setClientContext:v3];

  id v4 = [*(id *)(a1 + 40) title];
  [(SUUIStorePageViewController *)v2 setTitle:v4];

  [(SUUIStorePageViewController *)v2 loadURL:*(void *)(a1 + 48) withCompletionBlock:0];

  return v2;
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained productPageChildViewControllerDidScroll:self];
}

- (void)_addHeaderView
{
  id v8 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
  [v8 setAutoresizingMask:2];
  [v8 frame];
  double v4 = v3;
  [(UIScrollView *)self->_scrollView bounds];
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  [(UIScrollView *)self->_scrollView _addContentSubview:v8 atBack:0];
  objc_super v5 = [(SUUIProductPageHeaderViewController *)self->_headerViewController floatingView];
  [v5 setAutoresizingMask:2];
  [v5 frame];
  double v7 = v6;
  [(UIScrollView *)self->_scrollView bounds];
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  [(UIScrollView *)self->_scrollView _addContentSubview:v5 atBack:0];
}

- (void)_addMissingItemsWithResponse:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v6 = self->_swooshComponents;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10++), "_updateLockupItemsWithLookupResponse:", v5, (void)v13);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(SUUISwooshArrayViewController *)self _reloadChildViewControllers];
    [(SUUISwooshArrayViewController *)self _layoutSwooshViews];
  }
  -[SSVPlatformRequestOperation setResponseBlock:](self->_platformOperation, "setResponseBlock:", 0, (void)v13);
  platformOperation = self->_platformOperation;
  self->_platformOperation = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained productPageChildViewControllerDidLoad:self];

  [(SUUISwooshArrayViewController *)self _loadMissingItemsIfNecessary];
}

- (id)_artworkLoader
{
  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    double v4 = [[SUUIResourceLoader alloc] initWithClientContext:self->_clientContext];
    id v5 = self->_artworkLoader;
    self->_artworkLoader = v4;

    double v6 = self->_artworkLoader;
    uint64_t v7 = SUUIResourceLoaderGetNameForObject(self);
    [(SUUIResourceLoader *)v6 setName:v7];

    artworkLoader = self->_artworkLoader;
  }

  return artworkLoader;
}

- (id)_clickEventForSeeAllForViewController:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SUUIMetricsController *)self->_metricsController canRecordEventWithType:*MEMORY[0x263F7BB50]])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F7B228]);
    uint64_t v6 = *MEMORY[0x263F7BBA8];
    [v5 setTargetType:*MEMORY[0x263F7BBA8]];
    uint64_t v7 = [(SUUIMetricsController *)self->_metricsController locationWithPosition:[(NSMutableArray *)self->_viewControllers indexOfObjectIdenticalTo:v4] type:@"swoosh" fieldData:0];
    uint64_t v8 = [(SUUIMetricsController *)self->_metricsController locationWithPosition:0 type:v6 fieldData:0];
    uint64_t v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      v15[0] = v8;
      v15[1] = v7;
      char v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
      [v5 setLocationWithEventLocations:v11];
    }
    [v4 seeAllButtonFrame];
    SUUIMetricsSetClickEventPositionWithPoint(v5, v12, v13);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_clickEventWithItem:(id)a3
{
  v42[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SUUIMetricsController *)self->_metricsController canRecordEventWithType:*MEMORY[0x263F7BB50]])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F7B228]);
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__40;
    v32 = __Block_byref_object_dispose__40;
    id v33 = 0;
    viewControllers = self->_viewControllers;
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    long long v22 = __53__SUUISwooshArrayViewController__clickEventWithItem___block_invoke;
    long long v23 = &unk_265405418;
    id v7 = v4;
    id v24 = v7;
    v25 = &v38;
    uint64_t v26 = &v34;
    v27 = &v28;
    [(NSMutableArray *)viewControllers enumerateObjectsUsingBlock:&v20];
    uint64_t v8 = [(SUUIMetricsController *)self->_metricsController locationWithPosition:v35[3] type:@"swoosh" fieldData:0];
    uint64_t v9 = *MEMORY[0x263F7BBB8];
    uint64_t v10 = [(SUUIMetricsController *)self->_metricsController locationWithPosition:v39[3] type:*MEMORY[0x263F7BBB8] fieldData:v7];
    char v11 = (void *)v10;
    if (v8 && v10)
    {
      v42[0] = v10;
      v42[1] = v8;
      double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
      [v5 setLocationWithEventLocations:v12];
    }
    double v13 = NSString;
    uint64_t v14 = [v7 itemIdentifier];
    long long v15 = objc_msgSend(v13, "stringWithFormat:", @"%lld", v14, v20, v21, v22, v23);
    [v5 setTargetIdentifier:v15];

    [v5 setTargetType:v9];
    long long v16 = [v7 productPageURLString];
    [v5 setTargetURL:v16];

    [(id)v29[5] frameForItemAtIndex:v39[3]];
    SUUIMetricsSetClickEventPositionWithPoint(v5, v17, v18);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __53__SUUISwooshArrayViewController__clickEventWithItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v9 = [v8 lockups];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__SUUISwooshArrayViewController__clickEventWithItem___block_invoke_2;
  v11[3] = &unk_2654053F0;
  id v12 = *(id *)(a1 + 32);
  uint64_t v10 = [v9 indexOfObjectPassingTest:v11];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    *a4 = 1;
  }
}

BOOL __53__SUUISwooshArrayViewController__clickEventWithItem___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = [a2 item];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_layoutSwooshViews
{
  double v3 = [(SUUISwooshArrayViewController *)self view];
  [v3 frame];
  double v5 = v4;
  uint64_t v18 = 0;
  long long v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  viewControllers = self->_viewControllers;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__SUUISwooshArrayViewController__layoutSwooshViews__block_invoke;
  v11[3] = &unk_265405440;
  void v11[4] = self;
  double v13 = &v18;
  uint64_t v14 = v7;
  uint64_t v15 = v8;
  double v16 = v4;
  uint64_t v17 = v9;
  id v10 = v3;
  id v12 = v10;
  [(NSMutableArray *)viewControllers enumerateObjectsUsingBlock:v11];
  objc_msgSend(v10, "setContentSize:", v5, v19[3]);

  _Block_object_dispose(&v18, 8);
}

void __51__SUUISwooshArrayViewController__layoutSwooshViews__block_invoke(uint64_t a1, void *a2)
{
  id v14 = [a2 view];
  [v14 setAutoresizingMask:2];
  double v3 = [*(id *)(*(void *)(a1 + 32) + 1000) backgroundColor];
  if (v3)
  {
    [v14 setBackgroundColor:v3];
  }
  else
  {
    double v4 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
    [v14 setBackgroundColor:v4];
  }
  [v14 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v9 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  CGFloat v10 = *(double *)(a1 + 72);
  objc_msgSend(v14, "setFrame:");
  char v11 = *(void **)(a1 + 40);
  id v12 = *(void **)(*(void *)(a1 + 32) + 1016);
  if (v12)
  {
    double v13 = [v12 view];
    [v11 insertSubview:v14 belowSubview:v13];
  }
  else
  {
    [*(id *)(a1 + 40) insertSubview:v14 atIndex:0];
  }
  v16.origin.x = v6;
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v8;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGRectGetMaxY(v16) + 0.0;
}

- (void)_loadMissingItemsIfNecessary
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (!self->_platformOperation)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = self->_swooshComponents;
    uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v36;
      uint64_t v4 = *MEMORY[0x263F7BDD0];
LABEL_4:
      uint64_t v5 = 0;
      while (1)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        CGFloat v6 = [*(id *)(*((void *)&v35 + 1) + 8 * v5) lockups];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v32;
LABEL_9:
          uint64_t v10 = 0;
          while (1)
          {
            if (*(void *)v32 != v9) {
              objc_enumerationMutation(v7);
            }
            char v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
            id v12 = [v11 item];
            BOOL v13 = v12 == 0;

            if (v13)
            {
              id v14 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v11, "itemIdentifier"));
              [v3 addObject:v14];
              BOOL v15 = [v3 count] == v4;

              if (v15) {
                break;
              }
            }
            if (v8 == ++v10)
            {
              uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v8) {
                goto LABEL_9;
              }
              break;
            }
          }
        }

        BOOL v16 = [v3 count] == v4;
        if (v16) {
          break;
        }
        if (++v5 == v27)
        {
          uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v27) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if ([v3 count])
    {
      id v17 = objc_alloc(MEMORY[0x263F7B3B8]);
      uint64_t v18 = [(SUUIClientContext *)self->_clientContext platformContext];
      long long v19 = (SSVPlatformRequestOperation *)[v17 initWithPlatformContext:v18];
      platformOperation = self->_platformOperation;
      self->_platformOperation = v19;

      [(SSVPlatformRequestOperation *)self->_platformOperation setItemIdentifiers:v3];
      [(SSVPlatformRequestOperation *)self->_platformOperation setKeyProfile:*MEMORY[0x263F7B9B0]];
      uint64_t v21 = self->_platformOperation;
      long long v22 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
      [(SSVPlatformRequestOperation *)v21 setStoreFrontSuffix:v22];

      objc_initWeak(&location, self);
      long long v23 = self->_platformOperation;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __61__SUUISwooshArrayViewController__loadMissingItemsIfNecessary__block_invoke;
      v28[3] = &unk_265401588;
      objc_copyWeak(&v29, &location);
      [(SSVPlatformRequestOperation *)v23 setResponseBlock:v28];
      id v24 = [(SUUISwooshArrayViewController *)self operationQueue];
      [v24 addOperation:self->_platformOperation];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
}

void __61__SUUISwooshArrayViewController__loadMissingItemsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SUUISwooshArrayViewController__loadMissingItemsIfNecessary__block_invoke_2;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __61__SUUISwooshArrayViewController__loadMissingItemsIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _addMissingItemsWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_reloadChildViewControllers
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v3 = 1056;
  if (!self->_swooshArtworkLoaders)
  {
    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    swooshArtworkLoaders = self->_swooshArtworkLoaders;
    self->_swooshArtworkLoaders = v4;
  }
  uint64_t v6 = 1072;
  viewControllers = self->_viewControllers;
  if (!viewControllers)
  {
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v9 = self->_viewControllers;
    self->_viewControllers = v8;

    viewControllers = self->_viewControllers;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = viewControllers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        BOOL v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v15 isViewLoaded])
        {
          BOOL v16 = [v15 view];
          [v16 removeFromSuperview];
        }
        [v15 removeFromParentViewController];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v12);
  }

  [(NSMutableArray *)self->_swooshArtworkLoaders removeAllObjects];
  [(NSMutableArray *)self->_viewControllers removeAllObjects];
  if (!self->_askPermission)
  {
    id v17 = [(SUUISwooshArrayViewController *)self _artworkLoader];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v18 = self->_swooshComponents;
    uint64_t v33 = [(NSArray *)v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v33)
    {
      uint64_t v19 = *(void *)v35;
      uint64_t v32 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v18);
          }
          uint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          long long v22 = self->_colorScheme;
          if (!v22)
          {
            long long v22 = objc_alloc_init(SUUIColorScheme);
            long long v23 = [(SUUIColorScheme *)self->_colorScheme backgroundColor];
            if (v23)
            {
              [(SUUIColorScheme *)v22 setBackgroundColor:v23];
            }
            else
            {
              [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
              id v24 = v18;
              v25 = v17;
              uint64_t v26 = v6;
              uint64_t v28 = v27 = v3;
              [(SUUIColorScheme *)v22 setBackgroundColor:v28];

              uint64_t v3 = v27;
              uint64_t v6 = v26;
              id v17 = v25;
              uint64_t v18 = v24;
              uint64_t v19 = v32;
            }
          }
          id v29 = [[SUUILockupSwooshViewController alloc] initWithSwoosh:v21];
          [(SUUILockupSwooshViewController *)v29 setColorScheme:v22];
          [(SUUILockupSwooshViewController *)v29 setClientContext:self->_clientContext];
          [(SUUILockupSwooshViewController *)v29 setDelegate:self];
          uint64_t v30 = [v21 lockups];
          -[SUUILockupSwooshViewController setSeeAllHidden:](v29, "setSeeAllHidden:", (unint64_t)[v30 count] < 4);

          [*(id *)((char *)&self->super.super.super.isa + v6) addObject:v29];
          [(SUUISwooshArrayViewController *)self addChildViewController:v29];
          long long v31 = [[SUUILockupSwooshArtworkLoader alloc] initWithArtworkLoader:v17 swoosh:v29];
          [*(id *)((char *)&self->super.super.super.isa + v3) addObject:v31];
        }
        uint64_t v33 = [(NSArray *)v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v33);
    }
  }
  [(SUUISwooshArrayViewController *)self _layoutSwooshViews];
}

- (id)_scrollView
{
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    uint64_t v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F82B88]);
    id v5 = self->_scrollView;
    self->_scrollView = v4;

    [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
    [(UIScrollView *)self->_scrollView setAutoresizesSubviews:1];
    uint64_t v6 = self->_scrollView;
    id v7 = [(SUUIColorScheme *)self->_colorScheme backgroundColor];
    if (v7)
    {
      [(UIScrollView *)v6 setBackgroundColor:v7];
    }
    else
    {
      id v8 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
      [(UIScrollView *)v6 setBackgroundColor:v8];
    }
    [(UIScrollView *)self->_scrollView setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained productPageChildViewControllerDidLoadScrollView:self];

    scrollView = self->_scrollView;
  }

  return scrollView;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SUUIProductPageChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUUIProductPageChildViewControllerDelegate *)WeakRetained;
}

- (SUUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (SUUIMetricsController)metricsController
{
  return self->_metricsController;
}

- (void)setMetricsController:(id)a3
{
}

- (void)setOperationQueue:(id)a3
{
}

- (NSArray)swooshComponents
{
  return self->_swooshComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_swooshComponents, 0);
  objc_storeStrong((id *)&self->_swooshArtworkLoaders, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_platformOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end