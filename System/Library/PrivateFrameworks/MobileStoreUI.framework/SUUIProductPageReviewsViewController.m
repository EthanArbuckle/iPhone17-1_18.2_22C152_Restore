@interface SUUIProductPageReviewsViewController
- (BOOL)_shouldShowLoadMoreCell;
- (BOOL)askPermission;
- (NSOperationQueue)operationQueue;
- (SUUIClientContext)clientContext;
- (SUUIFacebookLikeStatus)facebookLikeStatus;
- (SUUIProductPage)productPage;
- (SUUIProductPageChildViewControllerDelegate)delegate;
- (SUUIProductPageHeaderViewController)headerViewController;
- (SUUIProductPageReviewsViewController)initWithProductPage:(id)a3;
- (UIScrollView)scrollView;
- (double)_defaultPageWidth;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_bottomBorderColorForScheme:(id)a3;
- (id)_histogramViewController;
- (id)_loadMoreCellForTableView:(id)a3 indexPath:(id)a4;
- (id)_reviewsHeaderView;
- (id)_tableView;
- (id)_textBoxCellForTableView:(id)a3 indexPath:(id)a4;
- (id)_textLayoutRequestWithText:(id)a3;
- (id)_urlStringWithPageNumber:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addHeaderView;
- (void)_addReviewsFromResponse:(id)a3 error:(id)a4;
- (void)_appSupportAction:(id)a3;
- (void)_loadNextPageIfNecessaryForOffset:(CGPoint)a3;
- (void)_reloadData;
- (void)_resetPersonalStarRating;
- (void)_setReviewListWithResponse:(id)a3 error:(id)a4;
- (void)_sortSelectionAction:(id)a3;
- (void)_starRatingAction:(id)a3;
- (void)_versionSelectionAction:(id)a3;
- (void)_writeAReviewAction:(id)a3;
- (void)dealloc;
- (void)layoutCacheDidFinishBatch:(id)a3;
- (void)loadView;
- (void)reloadData;
- (void)reviewComposeViewControllerDidFinish:(id)a3;
- (void)reviewsFacebookViewControllerDidChange:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAskPermission:(BOOL)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFacebookLikeStatus:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIProductPageReviewsViewController

- (SUUIProductPageReviewsViewController)initWithProductPage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIProductPageReviewsViewController;
  v6 = [(SUUIProductPageReviewsViewController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_isPad = SUUIUserInterfaceIdiom(v6->_clientContext) == 1;
    objc_storeStrong((id *)&v7->_productPage, a3);
    v7->_sortOrder = 1;
  }

  return v7;
}

- (void)dealloc
{
  [(SKComposeReviewViewController *)self->_composeViewController setDelegate:0];
  v3 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController appSupportButton];
  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v4 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController segmentedControl];
  [v4 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  id v5 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController starRatingControl];
  [v5 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v6 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController writeAReviewButton];
  [v6 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v7 = [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView appSupportButton];
  [v7 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v8 = [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView writeAReviewButton];
  [v8 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v9.receiver = self;
  v9.super_class = (Class)SUUIProductPageReviewsViewController;
  [(SUUIProductPageReviewsViewController *)&v9 dealloc];
}

- (SUUIFacebookLikeStatus)facebookLikeStatus
{
  return [(SUUIReviewsFacebookViewController *)self->_facebookViewController facebookLikeStatus];
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    id v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)reloadData
{
  v3 = [(SUUIProductPageReviewsViewController *)self _urlStringWithPageNumber:0];
  if (v3 && !self->_reviewList)
  {
    loadOperation = self->_loadOperation;

    if (!loadOperation)
    {
      [(SUUIProductPageReviewsViewController *)self _reloadData];
    }
  }
  else
  {
  }
}

- (void)setFacebookLikeStatus:(id)a3
{
  id v18 = a3;
  id v4 = [(SUUIReviewsFacebookViewController *)self->_facebookViewController facebookLikeStatus];

  if (v4 != v18)
  {
    facebookViewController = self->_facebookViewController;
    if (v18)
    {
      if (!facebookViewController)
      {
        v7 = objc_alloc_init(SUUIReviewsFacebookViewController);
        v8 = self->_facebookViewController;
        self->_facebookViewController = v7;

        [(SUUIReviewsFacebookViewController *)self->_facebookViewController setClientContext:self->_clientContext];
        [(SUUIReviewsFacebookViewController *)self->_facebookViewController setDelegate:self];
        objc_super v9 = [(SUUIReviewsFacebookViewController *)self->_facebookViewController view];
        v10 = [(SUUIProductPage *)self->_productPage uber];
        v11 = [v10 colorScheme];
        [v9 setColorScheme:v11];

        [(SUUIProductPageReviewsViewController *)self addChildViewController:self->_facebookViewController];
        facebookViewController = self->_facebookViewController;
      }
      -[SUUIReviewsFacebookViewController setFacebookLikeStatus:](facebookViewController, "setFacebookLikeStatus:");
      v12 = [(SUUIReviewsFacebookViewController *)self->_facebookViewController view];
      [v12 setAutoresizingMask:2];
      v13 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
      [v12 setBackgroundColor:v13];

      [(SUUIProductPageReviewsViewController *)self _defaultPageWidth];
      objc_msgSend(v12, "sizeThatFits:");
      objc_msgSend(v12, "setFrame:", 0.0, 0.0, v14, v15);
    }
    else
    {
      if (!facebookViewController)
      {
LABEL_9:
        tableView = self->_tableView;
        v17 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
        [(SUUIProductPageTableView *)tableView reloadSections:v17 withRowAnimation:100];

        goto LABEL_10;
      }
      [(SUUIReviewsFacebookViewController *)facebookViewController removeFromParentViewController];
      v12 = self->_facebookViewController;
      self->_facebookViewController = 0;
    }

    goto LABEL_9;
  }
LABEL_10:
  MEMORY[0x270F9A790](v5);
}

- (void)setClientContext:(id)a3
{
  uint64_t v5 = (SUUIClientContext *)a3;
  p_clientContext = (void **)&self->_clientContext;
  if (self->_clientContext != v5)
  {
    double v14 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    self->_isPad = SUUIUserInterfaceIdiom(*p_clientContext) == 1;
    if (*p_clientContext) {
      [*p_clientContext localizedStringForKey:@"PRODUCT_PAGE_REVIEWS_TAB" inTable:@"ProductPage"];
    }
    else {
    v7 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_REVIEWS_TAB" inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUIProductPageReviewsViewController *)self setTitle:v7];

    v8 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController writeAReviewButton];
    objc_super v9 = [*p_clientContext clientInterface];
    v10 = [v9 clientIdentifier];
    [v8 setEnabled:v10 == 0];

    v11 = [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView writeAReviewButton];
    v12 = [*p_clientContext clientInterface];
    v13 = [v12 clientIdentifier];
    [v11 setEnabled:v13 == 0];

    uint64_t v5 = v14;
  }
}

- (void)setAskPermission:(BOOL)a3
{
  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    id v4 = [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView appSupportButton];
    [v4 setEnabled:!self->_askPermission];
  }
}

- (void)loadView
{
  id v3 = [(SUUIProductPageReviewsViewController *)self _tableView];
  [(SUUIProductPageReviewsViewController *)self setView:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIProductPageTableView *)self->_tableView contentOffset];
  -[SUUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPageReviewsViewController;
  [(SUUIProductPageReviewsViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIProductPageReviewsViewController *)self reloadData];
  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPageReviewsViewController;
  [(SUUIProductPageReviewsViewController *)&v5 viewWillAppear:v3];
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void)setHeaderViewController:(id)a3
{
  p_headerViewController = &self->_headerViewController;
  v7 = (SUUIProductPageHeaderViewController *)a3;
  if (*p_headerViewController != v7)
  {
    [(SUUIProductPageTableView *)self->_tableView setProductPageHeaderView:0];
    v6 = [(SUUIProductPageHeaderViewController *)*p_headerViewController view];
    [v6 removeFromSuperview];

    [(SUUIProductPageHeaderViewController *)*p_headerViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SUUIProductPageReviewsViewController addChildViewController:](self, "addChildViewController:");
      if ([(SUUIProductPageReviewsViewController *)self isViewLoaded]) {
        [(SUUIProductPageReviewsViewController *)self _addHeaderView];
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_super v5 = obj;
    if (self->_tableView)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 productPageChildViewControllerDidLoadScrollView:self];

      objc_super v5 = obj;
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained productPageChildViewControllerDidScroll:self];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
}

- (void)reviewsFacebookViewControllerDidChange:(id)a3
{
  [(SUUIProductPageTableView *)self->_tableView beginUpdates];
  tableView = self->_tableView;
  [(SUUIProductPageTableView *)tableView endUpdates];
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  [(SUUIProductPageTableView *)self->_tableView reloadData];
  [(SUUIProductPageTableView *)self->_tableView contentOffset];
  -[SUUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
}

- (void)reviewComposeViewControllerDidFinish:(id)a3
{
  if (self->_composeViewController == a3)
  {
    [a3 setDelegate:0];
    [(SKComposeReviewViewController *)self->_composeViewController dismissViewControllerAnimated:1 completion:0];
    composeViewController = self->_composeViewController;
    self->_composeViewController = 0;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == 3)
  {
    uint64_t v9 = [(SUUIProductPageReviewsViewController *)self _loadMoreCellForTableView:v6 indexPath:v7];
    goto LABEL_5;
  }
  if (v8 == 2)
  {
    uint64_t v9 = [(SUUIProductPageReviewsViewController *)self _textBoxCellForTableView:v6 indexPath:v7];
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    uint64_t v8 = [(SUUIReviewList *)self->_reviewList reviews];
    int64_t v7 = [v8 count];
  }
  else if (a4 == 3)
  {
    int64_t v7 = [(SUUIProductPageReviewsViewController *)self _shouldShowLoadMoreCell];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  if ([a5 section] == 3) {
    [v6 stopAnimating];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  expandedIndexSet = self->_expandedIndexSet;
  if (!expandedIndexSet)
  {
    int64_t v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    uint64_t v8 = self->_expandedIndexSet;
    self->_expandedIndexSet = v7;

    expandedIndexSet = self->_expandedIndexSet;
  }
  -[NSMutableIndexSet addIndex:](expandedIndexSet, "addIndex:", [v5 row]);
  tableView = self->_tableView;
  v11[0] = v5;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [(SUUIProductPageTableView *)tableView reloadRowsAtIndexPaths:v10 withRowAnimation:100];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    v10 = [(SUUIProductPageReviewsViewController *)self _reviewsHeaderView];
    uint64_t v9 = v10;
    if (v10)
    {
      [v10 frame];
      double v7 = v11;
    }
    else
    {
      double v7 = 0.0;
    }
    goto LABEL_12;
  }
  double v7 = 0.0;
  if (a4 == 1)
  {
    if (self->_reviewList)
    {
      v12 = [(SUUIProductPageReviewsViewController *)self _histogramViewController];
      uint64_t v9 = [v12 view];

      goto LABEL_10;
    }
  }
  else if (!a4)
  {
    facebookViewController = self->_facebookViewController;
    if (facebookViewController)
    {
      uint64_t v9 = [(SUUIReviewsFacebookViewController *)facebookViewController view];
LABEL_10:
      [(SUUIProductPageReviewsViewController *)self _defaultPageWidth];
      objc_msgSend(v9, "sizeThatFits:");
      double v7 = v13;
LABEL_12:
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] == 2)
  {
    uint64_t v6 = [v5 row];
    double v7 = [(SUUILayoutCache *)self->_layoutCache layoutForIndex:v6];
    uint64_t v8 = v7;
    if (v7)
    {
      if ([v7 requiresTruncation]
        && ([(NSMutableIndexSet *)self->_expandedIndexSet containsIndex:v6] & 1) == 0)
      {
        [v8 truncatedSize];
      }
      else
      {
        [v8 textSize];
      }
      if (self->_isPad) {
        double v11 = (double *)&kSUUITextBoxLayoutMarginTopIPad;
      }
      else {
        double v11 = (double *)&kSUUITextBoxLayoutMarginTopIPhone;
      }
      double v12 = *v11;
      double v13 = (double *)&kSUUITextBoxLayoutTitleHeightIPad;
      if (!self->_isPad) {
        double v13 = (double *)&kSUUITextBoxLayoutTitleHeightIPhone;
      }
      double v14 = v12 + *v13;
      double v15 = (double *)&kSUUITextBoxLayoutTextRatingBottomPaddingIPad;
      if (!self->_isPad) {
        double v15 = (double *)&kSUUITextBoxLayoutTextRatingBottomPaddingIPhone;
      }
      double v16 = v14 + *v15 + 14.0 + 5.0;
      v17 = (double *)&kSUUITextBoxLayoutMarginBottomIPad;
      if (!self->_isPad) {
        v17 = (double *)&kSUUITextBoxLayoutMarginBottomIPhone;
      }
      double v10 = v9 + v16 + *v17;
    }
    else
    {
      double v10 = 100.0;
    }
  }
  else
  {
    double v10 = 100.0;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v6 = [(SUUIProductPage *)self->_productPage uber];
  double v7 = [v6 colorScheme];
  uint64_t v8 = [v7 backgroundColor];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
  }
  double v11 = v10;

  switch(a4)
  {
    case 2:
      uint64_t v12 = [(SUUIProductPageReviewsViewController *)self _reviewsHeaderView];
      goto LABEL_9;
    case 1:
      if (self->_reviewList)
      {
        double v14 = [(SUUIProductPageReviewsViewController *)self _histogramViewController];
        double v13 = [v14 view];

        goto LABEL_13;
      }
      break;
    case 0:
      uint64_t v12 = [(SUUIReviewsFacebookViewController *)self->_facebookViewController view];
LABEL_9:
      double v13 = (void *)v12;
      goto LABEL_13;
  }
  double v13 = 0;
LABEL_13:
  [v13 setBackgroundColor:v11];

  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  productPage = self->_productPage;
  id v10 = a5;
  double v11 = [(SUUIProductPage *)productPage uber];
  uint64_t v12 = [v11 colorScheme];
  double v13 = [v12 backgroundColor];
  if (v13)
  {
    [v8 setBackgroundColor:v13];
  }
  else
  {
    double v14 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
    [v8 setBackgroundColor:v14];
  }
  uint64_t v15 = [v10 section];

  if (v15 == 3)
  {
    [v8 startAnimating];
    [v16 contentOffset];
    -[SUUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
  }
}

- (void)_appSupportAction:(id)a3
{
  BOOL v3 = [(SUUIProductPage *)self->_productPage item];
  id v6 = [v3 supportURLString];

  id v4 = v6;
  if (v6)
  {
    id v5 = [NSURL URLWithString:v6];
    SUUIMetricsOpenURL(v5);

    id v4 = v6;
  }
}

- (void)_sortSelectionAction:(id)a3
{
  int64_t sortOrder = self->_sortOrder;
  unint64_t v5 = [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView selectedSortIndex];
  if (v5 <= 3) {
    int64_t sortOrder = qword_2568A0B48[v5];
  }
  if (self->_sortOrder != sortOrder)
  {
    self->_int64_t sortOrder = sortOrder;
    [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
    [(SSVLoadURLOperation *)self->_loadOperation cancel];
    loadOperation = self->_loadOperation;
    self->_loadOperation = 0;

    [(SUUIProductPageReviewsViewController *)self _reloadData];
  }
}

- (void)_starRatingAction:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController personalStarRating];
  if (!self->_starRatingQueue)
  {
    id v6 = [SUUIStarRatingQueue alloc];
    clientContext = self->_clientContext;
    id v8 = [(SUUIProductPage *)self->_productPage reviewConfiguration];
    double v9 = [(SUUIStarRatingQueue *)v6 initWithClientContext:clientContext reviewConfiguration:v8];
    starRatingQueue = self->_starRatingQueue;
    self->_starRatingQueue = v9;

    double v11 = self->_starRatingQueue;
    uint64_t v12 = [(SUUIProductPageReviewsViewController *)self view];
    double v13 = [v12 window];
    [(SUUIStarRatingQueue *)v11 setWindow:v13];
  }
  objc_initWeak(&location, self);
  double v14 = NSString;
  uint64_t v15 = [(SUUIProductPage *)self->_productPage item];
  id v16 = objc_msgSend(v14, "stringWithFormat:", @"%lld", objc_msgSend(v15, "itemIdentifier"));

  v17 = self->_starRatingQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__SUUIProductPageReviewsViewController__starRatingAction___block_invoke;
  v18[3] = &unk_265401890;
  objc_copyWeak(&v19, &location);
  [(SUUIStarRatingQueue *)v17 setRating:v5 forItemID:v16 completionBlock:v18];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __58__SUUIProductPageReviewsViewController__starRatingAction___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SUUIProductPageReviewsViewController__starRatingAction___block_invoke_2;
    block[3] = &unk_265401538;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v3);
  }
}

void __58__SUUIProductPageReviewsViewController__starRatingAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetPersonalStarRating];
}

- (void)_versionSelectionAction:(id)a3
{
  BOOL v4 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController selectedSegmentIndex] == 1;
  if (self->_showAllVersions != v4)
  {
    self->_showAllVersions = v4;
    [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
    [(SSVLoadURLOperation *)self->_loadOperation cancel];
    loadOperation = self->_loadOperation;
    self->_loadOperation = 0;

    [(SUUIProductPageReviewsViewController *)self _reloadData];
  }
}

- (void)_writeAReviewAction:(id)a3
{
  id v4 = a3;
  if (!self->_composeViewController)
  {
    id v5 = objc_alloc(MEMORY[0x263F17FA0]);
    id v6 = [(SUUIReviewList *)self->_reviewList writeReviewURL];
    double v7 = (void *)[v5 initWithCompositionURL:v6];

    [v7 setDelegate:self];
    objc_storeStrong((id *)&self->_composeViewController, v7);
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__SUUIProductPageReviewsViewController__writeAReviewAction___block_invoke;
    v9[3] = &unk_265400F08;
    objc_copyWeak(&v11, &location);
    id v8 = v7;
    id v10 = v8;
    [v8 prepareWithCompletionBlock:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __60__SUUIProductPageReviewsViewController__writeAReviewAction___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
  }
}

- (void)_addHeaderView
{
  id v8 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
  [v8 setAutoresizingMask:2];
  [v8 frame];
  double v4 = v3;
  [(SUUIProductPageTableView *)self->_tableView bounds];
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  [(SUUIProductPageTableView *)self->_tableView _addContentSubview:v8 atBack:0];
  id v5 = [(SUUIProductPageHeaderViewController *)self->_headerViewController floatingView];
  [v5 setAutoresizingMask:2];
  [v5 frame];
  double v7 = v6;
  [(SUUIProductPageTableView *)self->_tableView bounds];
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  [(SUUIProductPageTableView *)self->_tableView setProductPageHeaderView:v5];
}

- (void)_addReviewsFromResponse:(id)a3 error:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = [[SUUIReviewList alloc] initWithReviewListDictionary:v5];
    id v8 = [(SUUIReviewList *)v7 reviews];
    uint64_t v9 = [v8 count];
    if (v9 > 0)
    {
      uint64_t v28 = v9;
      v31 = v7;
      id v32 = v5;
      id v10 = [(SUUIReviewList *)self->_reviewList reviews];
      uint64_t v11 = [v10 count];

      BOOL v29 = [(SUUIProductPageReviewsViewController *)self _shouldShowLoadMoreCell];
      [(SUUIReviewList *)self->_reviewList addReviews:v8];
      ++self->_loadedPageCount;
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v30 = v8;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v34 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = [*(id *)(*((void *)&v33 + 1) + 8 * i) body];
            id v19 = (void *)v18;
            if (v18) {
              v20 = (__CFString *)v18;
            }
            else {
              v20 = &stru_2704F8130;
            }
            v21 = [(SUUIProductPageReviewsViewController *)self _textLayoutRequestWithText:v20];
            [v12 addObject:v21];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v15);
      }

      [(SUUILayoutCache *)self->_layoutCache populateCacheWithLayoutRequests:v12];
      [(SUUIProductPageTableView *)self->_tableView beginUpdates];
      id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v23 = v11 + v28;
      do
      {
        v24 = [MEMORY[0x263F088C8] indexPathForRow:v11 inSection:2];
        [v22 addObject:v24];

        ++v11;
      }
      while (v11 < v23);
      [(SUUIProductPageTableView *)self->_tableView insertRowsAtIndexPaths:v22 withRowAnimation:5];
      if (v29 && ![(SUUIProductPageReviewsViewController *)self _shouldShowLoadMoreCell])
      {
        tableView = self->_tableView;
        v26 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:3];
        v37 = v26;
        v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
        [(SUUIProductPageTableView *)tableView deleteRowsAtIndexPaths:v27 withRowAnimation:5];
      }
      [(SUUIProductPageTableView *)self->_tableView endUpdates];

      double v7 = v31;
      id v5 = v32;
      id v8 = v30;
    }
    [(SUUIProductPageTableView *)self->_tableView contentOffset];
    -[SUUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
  }
}

- (id)_bottomBorderColorForScheme:(id)a3
{
  double v3 = [a3 primaryTextColor];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  }
  double v6 = v5;

  return v6;
}

- (double)_defaultPageWidth
{
  if (self->_isPad) {
    return 630.0;
  }
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1) {
    return 320.0;
  }
  id v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 bounds];
  double v2 = v6;

  return v2;
}

- (id)_histogramViewController
{
  v31[2] = *MEMORY[0x263EF8340];
  histogramViewController = self->_histogramViewController;
  if (!histogramViewController)
  {
    uint64_t v4 = objc_alloc_init(SUUIReviewsHistogramViewController);
    id v5 = self->_histogramViewController;
    self->_histogramViewController = v4;

    [(SUUIReviewsHistogramViewController *)self->_histogramViewController setClientContext:self->_clientContext];
    [(SUUIReviewsHistogramViewController *)self->_histogramViewController setReviewList:self->_reviewList];
    double v6 = [(SUUIProductPage *)self->_productPage item];
    uint64_t v7 = [v6 itemKind];

    if (v7 != 17)
    {
      clientContext = self->_clientContext;
      if (clientContext)
      {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"REVIEWS_CURRENT_VERSION" inTable:@"ProductPage"];
      }
      else
      {
        id v9 = 0;
        +[SUUIClientContext localizedStringForKey:@"REVIEWS_CURRENT_VERSION" inBundles:0 inTable:@"ProductPage"];
      id v10 = };

      uint64_t v11 = self->_clientContext;
      if (v11)
      {
        [(SUUIClientContext *)v11 localizedStringForKey:@"REVIEWS_ALL_VERSIONS" inTable:@"ProductPage"];
      }
      else
      {
        id v12 = 0;
        +[SUUIClientContext localizedStringForKey:@"REVIEWS_ALL_VERSIONS" inBundles:0 inTable:@"ProductPage"];
      id v13 = };

      uint64_t v14 = self->_histogramViewController;
      v31[0] = v10;
      v31[1] = v13;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
      [(SUUIReviewsHistogramViewController *)v14 setSegmentedControlTitles:v15];

      [(SUUIReviewsHistogramViewController *)self->_histogramViewController setSelectedSegmentIndex:self->_showAllVersions];
      uint64_t v16 = self->_histogramViewController;
      if (self->_showAllVersions)
      {
        [(SUUIReviewsHistogramViewController *)self->_histogramViewController setVersionString:0];
      }
      else
      {
        v17 = [(SUUIProductPage *)self->_productPage item];
        uint64_t v18 = [v17 versionString];
        [(SUUIReviewsHistogramViewController *)v16 setVersionString:v18];
      }
    }
    id v19 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController view];
    [v19 setAutoresizingMask:2];
    v20 = [(SUUIProductPage *)self->_productPage uber];
    v21 = [v20 colorScheme];
    [v19 setColorScheme:v21];

    id v22 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController appSupportButton];
    [v22 addTarget:self action:sel__appSupportAction_ forControlEvents:64];

    uint64_t v23 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController segmentedControl];
    [v23 addTarget:self action:sel__versionSelectionAction_ forControlEvents:4096];

    v24 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController starRatingControl];
    [v24 addTarget:self action:sel__starRatingAction_ forControlEvents:4096];

    v25 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController writeAReviewButton];
    [v25 addTarget:self action:sel__writeAReviewAction_ forControlEvents:64];

    v26 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController appSupportButton];
    [v26 setEnabled:!self->_askPermission];

    v27 = [(SUUIReviewsHistogramViewController *)self->_histogramViewController writeAReviewButton];
    uint64_t v28 = [(SUUIClientContext *)self->_clientContext clientInterface];
    BOOL v29 = [v28 clientIdentifier];
    [v27 setEnabled:v29 == 0];

    [(SUUIProductPageReviewsViewController *)self addChildViewController:self->_histogramViewController];
    histogramViewController = self->_histogramViewController;
  }
  return histogramViewController;
}

- (id)_loadMoreCellForTableView:(id)a3 indexPath:(id)a4
{
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"1", a4);
  uint64_t v4 = (SUUILoadMoreCell *)objc_claimAutoreleasedReturnValue();
  if (!v4) {
    uint64_t v4 = [[SUUILoadMoreCell alloc] initWithStyle:0 reuseIdentifier:@"1"];
  }
  return v4;
}

- (void)_loadNextPageIfNecessaryForOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(SUUIProductPageReviewsViewController *)self isViewLoaded])
  {
    id v27 = [(SUUIProductPageReviewsViewController *)self view];
    if ([v27 isHidden])
    {
    }
    else
    {
      double v6 = [v27 window];

      if (v6)
      {
        if (!self->_loadOperation)
        {
          int64_t loadedPageCount = self->_loadedPageCount;
          if (loadedPageCount >= 1
            && loadedPageCount < [(SUUIReviewList *)self->_reviewList numberOfPages])
          {
            [(SUUIProductPageTableView *)self->_tableView contentInset];
            id v9 = -[SUUIProductPageTableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:", x, y + v8);
            if (v9)
            {
              id v10 = [(SUUIReviewList *)self->_reviewList reviews];
              uint64_t v11 = [v10 count];

              uint64_t v12 = [v9 row];
              if (v11 > v12 && v11 - v12 <= 10)
              {
                uint64_t v14 = [(SUUIProductPageReviewsViewController *)self _urlStringWithPageNumber:self->_loadedPageCount + 1];
                id v15 = objc_alloc(MEMORY[0x263F7B3A0]);
                uint64_t v16 = [NSURL URLWithString:v14];
                v17 = (SSVLoadURLOperation *)[v15 initWithURL:v16];
                loadOperation = self->_loadOperation;
                self->_loadOperation = v17;

                id v19 = self->_loadOperation;
                v20 = +[SSVURLDataConsumer consumer];
                [(SSVLoadURLOperation *)v19 setDataConsumer:v20];

                [(SSVLoadURLOperation *)self->_loadOperation setQueuePriority:-4];
                v21 = self->_loadOperation;
                id v22 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
                [(SSVLoadURLOperation *)v21 setStoreFrontSuffix:v22];

                uint64_t v23 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
                v24 = self->_loadOperation;
                v28[0] = MEMORY[0x263EF8330];
                v28[1] = 3221225472;
                v28[2] = __74__SUUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke;
                v28[3] = &unk_2654018B8;
                id v29 = v23;
                id v25 = v23;
                [(SSVLoadURLOperation *)v24 setOutputBlock:v28];
                v26 = [(SUUIProductPageReviewsViewController *)self operationQueue];
                [v26 addOperation:self->_loadOperation];
              }
            }
          }
        }
      }
    }
  }
}

void __74__SUUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__SUUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke_2;
  block[3] = &unk_265400958;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__SUUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  [v2 _addReviewsFromResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_reloadData
{
  double v3 = [(SUUIProductPageReviewsViewController *)self _urlStringWithPageNumber:0];
  id v4 = objc_alloc(MEMORY[0x263F7B3A0]);
  id v5 = [NSURL URLWithString:v3];
  id v6 = (SSVLoadURLOperation *)[v4 initWithURL:v5];
  loadOperation = self->_loadOperation;
  self->_loadOperation = v6;

  id v8 = self->_loadOperation;
  id v9 = +[SSVURLDataConsumer consumer];
  [(SSVLoadURLOperation *)v8 setDataConsumer:v9];

  id v10 = self->_loadOperation;
  id v11 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
  [(SSVLoadURLOperation *)v10 setStoreFrontSuffix:v11];

  id v12 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
  id v13 = self->_loadOperation;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__SUUIProductPageReviewsViewController__reloadData__block_invoke;
  v16[3] = &unk_2654018B8;
  id v17 = v12;
  id v14 = v12;
  [(SSVLoadURLOperation *)v13 setOutputBlock:v16];
  id v15 = [(SUUIProductPageReviewsViewController *)self operationQueue];
  [v15 addOperation:self->_loadOperation];
}

void __51__SUUIProductPageReviewsViewController__reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUUIProductPageReviewsViewController__reloadData__block_invoke_2;
  block[3] = &unk_265400958;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__SUUIProductPageReviewsViewController__reloadData__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  [v2 _setReviewListWithResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_resetPersonalStarRating
{
}

- (id)_reviewsHeaderView
{
  v30[4] = *MEMORY[0x263EF8340];
  reviewsHeaderView = self->_reviewsHeaderView;
  if (!reviewsHeaderView)
  {
    if (self->_isPad)
    {
      id v4 = [[SUUIIPadCustomerReviewsHeaderView alloc] initWithClientContext:self->_clientContext];
      id v5 = self->_reviewsHeaderView;
      self->_reviewsHeaderView = v4;

      id v6 = self->_reviewsHeaderView;
      id v7 = [(SUUIProductPage *)self->_productPage uber];
      id v8 = [v7 colorScheme];
      [(SUUIIPadCustomerReviewsHeaderView *)v6 setColorScheme:v8];

      [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView addTarget:self action:sel__sortSelectionAction_ forControlEvents:4096];
      [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView setAutoresizingMask:2];
      clientContext = self->_clientContext;
      if (clientContext)
      {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"REVIEWS_SORT_MOST_CRITICAL" inTable:@"ProductPage"];
      }
      else
      {
        id v10 = 0;
        +[SUUIClientContext localizedStringForKey:@"REVIEWS_SORT_MOST_CRITICAL" inBundles:0 inTable:@"ProductPage"];
      id v11 = };

      id v12 = self->_clientContext;
      if (v12)
      {
        [(SUUIClientContext *)v12 localizedStringForKey:@"REVIEWS_SORT_MOST_FAVORABLE" inTable:@"ProductPage"];
      }
      else
      {
        id v13 = 0;
        +[SUUIClientContext localizedStringForKey:@"REVIEWS_SORT_MOST_FAVORABLE" inBundles:0 inTable:@"ProductPage"];
      id v14 = };

      id v15 = self->_clientContext;
      if (v15)
      {
        [(SUUIClientContext *)v15 localizedStringForKey:@"REVIEWS_SORT_MOST_RECENT" inTable:@"ProductPage"];
      }
      else
      {
        id v16 = 0;
        +[SUUIClientContext localizedStringForKey:@"REVIEWS_SORT_MOST_RECENT" inBundles:0 inTable:@"ProductPage"];
      id v17 = };

      uint64_t v18 = self->_clientContext;
      if (v18)
      {
        [(SUUIClientContext *)v18 localizedStringForKey:@"REVIEWS_SORT_MOST_HELPFUL" inTable:@"ProductPage"];
      }
      else
      {
        id v19 = 0;
        +[SUUIClientContext localizedStringForKey:@"REVIEWS_SORT_MOST_HELPFUL" inBundles:0 inTable:@"ProductPage"];
      v20 = };

      v21 = self->_reviewsHeaderView;
      v30[0] = v20;
      v30[1] = v17;
      v30[2] = v14;
      v30[3] = v11;
      id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
      [(SUUIIPadCustomerReviewsHeaderView *)v21 setSortTitles:v22];

      [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView sizeToFit];
      uint64_t v23 = [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView appSupportButton];
      [v23 addTarget:self action:sel__appSupportAction_ forControlEvents:64];

      v24 = [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView writeAReviewButton];
      [v24 addTarget:self action:sel__writeAReviewAction_ forControlEvents:64];

      id v25 = [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView appSupportButton];
      [v25 setEnabled:!self->_askPermission];

      v26 = [(SUUIIPadCustomerReviewsHeaderView *)self->_reviewsHeaderView writeAReviewButton];
      id v27 = [(SUUIClientContext *)self->_clientContext clientInterface];
      uint64_t v28 = [v27 clientIdentifier];
      [v26 setEnabled:v28 == 0];

      reviewsHeaderView = self->_reviewsHeaderView;
    }
    else
    {
      reviewsHeaderView = 0;
    }
  }
  return reviewsHeaderView;
}

- (void)_setReviewListWithResponse:(id)a3 error:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v5;
    id v7 = [[SUUIReviewList alloc] initWithReviewListDictionary:v5];
    reviewList = self->_reviewList;
    self->_reviewList = v7;

    self->_int64_t loadedPageCount = 1;
    [(SUUILayoutCache *)self->_layoutCache setDelegate:0];
    layoutCache = self->_layoutCache;
    self->_layoutCache = 0;

    id v10 = objc_alloc_init(SUUILayoutCache);
    id v11 = self->_layoutCache;
    self->_layoutCache = v10;

    [(SUUILayoutCache *)self->_layoutCache setDelegate:self];
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = [(SUUIReviewList *)self->_reviewList reviews];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) body];
          id v19 = (void *)v18;
          if (v18) {
            v20 = (__CFString *)v18;
          }
          else {
            v20 = &stru_2704F8130;
          }
          v21 = [(SUUIProductPageReviewsViewController *)self _textLayoutRequestWithText:v20];
          [v12 addObject:v21];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    [(SUUILayoutCache *)self->_layoutCache populateCacheWithLayoutRequests:v12];
    [(SUUIReviewsHistogramViewController *)self->_histogramViewController setReviewList:self->_reviewList];
    histogramViewController = self->_histogramViewController;
    if (self->_showAllVersions)
    {
      [(SUUIReviewsHistogramViewController *)self->_histogramViewController setVersionString:0];
    }
    else
    {
      uint64_t v23 = [(SUUIProductPage *)self->_productPage item];
      v24 = [v23 versionString];
      [(SUUIReviewsHistogramViewController *)histogramViewController setVersionString:v24];
    }
    [(SUUIProductPageTableView *)self->_tableView reloadData];

    id v5 = v25;
  }
}

- (BOOL)_shouldShowLoadMoreCell
{
  int64_t loadedPageCount = self->_loadedPageCount;
  return !loadedPageCount || loadedPageCount < [(SUUIReviewList *)self->_reviewList numberOfPages];
}

- (id)_tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    id v4 = objc_alloc_init(SUUIProductPageTableView);
    id v5 = self->_tableView;
    self->_tableView = v4;

    id v6 = self->_tableView;
    id v7 = [(SUUIProductPage *)self->_productPage uber];
    id v8 = [v7 colorScheme];
    id v9 = [v8 backgroundColor];
    if (v9)
    {
      [(SUUIProductPageTableView *)v6 setBackgroundColor:v9];
    }
    else
    {
      id v10 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
      [(SUUIProductPageTableView *)v6 setBackgroundColor:v10];
    }
    [(SUUIProductPageTableView *)self->_tableView setDataSource:self];
    [(SUUIProductPageTableView *)self->_tableView setDelegate:self];
    [(SUUIProductPageTableView *)self->_tableView _setHeaderAndFooterViewsFloat:0];
    [(SUUIProductPageTableView *)self->_tableView setSeparatorStyle:0];
    if (self->_headerViewController) {
      [(SUUIProductPageReviewsViewController *)self _addHeaderView];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained productPageChildViewControllerDidLoadScrollView:self];

    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_textBoxCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"0"];
  if (v7)
  {
    id v8 = v7;
    id v9 = [(SUUITextBoxTableViewCell *)v7 textBoxView];
  }
  else
  {
    id v8 = [[SUUITextBoxTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"0"];
    [(SUUITextBoxTableViewCell *)v8 setSelectionStyle:0];
    id v10 = [(SUUIProductPage *)self->_productPage uber];
    id v11 = [v10 colorScheme];

    id v12 = [(SUUIProductPageReviewsViewController *)self _bottomBorderColorForScheme:v11];
    [(SUUITableViewCell *)v8 setBottomBorderColor:v12];

    id v9 = [(SUUITextBoxTableViewCell *)v8 textBoxView];
    [v9 setColorScheme:v11];
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"MORE_BUTTON"];
    }
    else {
    uint64_t v14 = +[SUUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
    }
    [v9 setMoreButtonTitle:v14];
  }
  uint64_t v15 = [v6 row];

  uint64_t v16 = [(SUUILayoutCache *)self->_layoutCache layoutForIndex:v15];
  if (v16)
  {
    id v17 = [(SUUIReviewList *)self->_reviewList reviews];
    uint64_t v18 = [v17 objectAtIndex:v15];

    objc_msgSend(v9, "setFixedWidthTextFrame:", objc_msgSend(v16, "textFrame"));
    if ([(NSMutableIndexSet *)self->_expandedIndexSet containsIndex:v15]) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 5;
    }
    [v9 setNumberOfVisibleLines:v19];
    [v18 rating];
    [v9 setRating:(float)(v20 / 5.0)];
    v21 = [v18 formattedBylineWithClientContext:self->_clientContext];
    [v9 setRatingText:v21];

    id v22 = NSString;
    uint64_t v23 = v15 + 1;
    v24 = [v18 title];
    id v25 = [v22 stringWithFormat:@"%ld. %@", v23, v24];
    [v9 setTitle:v25];
  }
  else
  {
    [v9 reset];
  }

  return v8;
}

- (id)_textLayoutRequestWithText:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SUUITextLayoutRequest);
  [(SUUITextLayoutRequest *)v5 setNumberOfLines:5];
  [(SUUITextLayoutRequest *)v5 setText:v4];

  [(SUUIProductPageReviewsViewController *)self _defaultPageWidth];
  [(SUUITextLayoutRequest *)v5 setWidth:v6 + -30.0];
  return v5;
}

- (id)_urlStringWithPageNumber:(int64_t)a3
{
  id v5 = [(SUUIProductPage *)self->_productPage reviewConfiguration];
  double v6 = v5;
  if (v5)
  {
    if (self->_showAllVersions) {
      [v5 allVersionsURLString];
    }
    else {
    id v10 = [v5 currentVersionURLString];
    }
    uint64_t v13 = [v6 pageNumberQueryParameter];
    id v12 = (__CFString *)v13;
    if (a3)
    {
      if (v13)
      {
LABEL_12:
        [v10 stringByAppendingFormat:@"&sort-key=%ld&%@=%ld", self->_sortOrder, v12, a3];
        goto LABEL_14;
      }
LABEL_11:
      id v12 = @"page-number";
      goto LABEL_12;
    }
  }
  else
  {
    id v7 = [(SUUIProductPage *)self->_productPage item];
    BOOL showAllVersions = self->_showAllVersions;
    id v9 = [v7 reviewsURLString];
    id v10 = v9;
    if (!showAllVersions)
    {
      uint64_t v11 = [v9 stringByAppendingString:@"&appVersion=current"];

      id v10 = (void *)v11;
    }

    if (a3) {
      goto LABEL_11;
    }
    id v12 = 0;
  }
  objc_msgSend(v10, "stringByAppendingFormat:", @"&sort-key=%ld", self->_sortOrder, v16, v17);
  uint64_t v14 = LABEL_14:;

  return v14;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
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

- (SUUIProductPage)productPage
{
  return self->_productPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_starRatingQueue, 0);
  objc_storeStrong((id *)&self->_reviewsHeaderView, 0);
  objc_storeStrong((id *)&self->_reviewList, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
  objc_storeStrong((id *)&self->_histogramViewController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_facebookViewController, 0);
  objc_storeStrong((id *)&self->_expandedIndexSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end