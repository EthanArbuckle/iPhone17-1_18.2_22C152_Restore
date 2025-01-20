@interface SUUIIPadProductPageViewController
- (BOOL)_isIncompatibleItem;
- (BOOL)askPermission;
- (CGPoint)topContentOffset;
- (NSString)bannerText;
- (NSURL)URL;
- (SUUIClientContext)clientContext;
- (SUUIIPadProductPageDelegate)delegate;
- (SUUIIPadProductPageViewController)initWithItem:(id)a3;
- (SUUIIPadProductPageViewController)initWithItemIdentifier:(int64_t)a3;
- (SUUIIPadProductPageViewController)initWithProductPage:(id)a3;
- (SUUIIPadProductPageViewController)initWithURL:(id)a3;
- (SUUIIPadProductPageViewController)initWithURLRequest:(id)a3;
- (SUUIItem)item;
- (SUUIProductPage)productPage;
- (id)_detailsViewController;
- (id)_initSUUIIPadProductPageViewController;
- (id)_placeholderViewController;
- (id)_relatedViewController;
- (id)_reviewsViewController;
- (id)_viewControllerForSectionIndex:(int64_t)a3;
- (id)activeMetricsController;
- (id)metricsControllerForProductPageHeader:(id)a3;
- (void)_metricsEnterEventNotification:(id)a3;
- (void)_reloadHeaderViewController;
- (void)_selectSectionIndex:(int64_t)a3;
- (void)_sendCannotOpen;
- (void)_setDefaultSectionIndexWithFragment:(int64_t)a3;
- (void)_setMetricsController:(id)a3;
- (void)_setProductPage:(id)a3 error:(id)a4;
- (void)_showBanner;
- (void)_showError:(id)a3;
- (void)_showIncompatibleView;
- (void)_showViewController:(id)a3;
- (void)askPermissionBannerDidSelect:(id)a3;
- (void)configureMetricsWithPageEvent:(id)a3;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)loadView;
- (void)networkErrorViewControllerInvalidated:(id)a3;
- (void)productPageChildOpenItem:(id)a3;
- (void)productPageChildOpenURL:(id)a3 viewControllerBlock:(id)a4;
- (void)productPageHeaderView:(id)a3 didSelectSectionIndex:(int64_t)a4;
- (void)productPageHeaderView:(id)a3 didSelectURL:(id)a4;
- (void)reloadData;
- (void)setAskPermission:(BOOL)a3;
- (void)setBannerText:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIIPadProductPageViewController

- (id)_initSUUIIPadProductPageViewController
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIIPadProductPageViewController;
  v2 = [(SUUIIPadProductPageViewController *)&v7 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:4];
    v2->_defaultSelectedSectionIndex = 0;
    v2->_selectedSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__metricsEnterEventNotification_ name:@"SUUIMetricsDidRecordEnterEventNotification" object:0];
  }
  return v2;
}

- (SUUIIPadProductPageViewController)initWithItem:(id)a3
{
  id v5 = a3;
  v6 = [(SUUIIPadProductPageViewController *)self _initSUUIIPadProductPageViewController];
  objc_super v7 = (SUUIIPadProductPageViewController *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 131, a3);
    v7->_lookupItemIdentifier = [v5 itemIdentifier];
    v8 = [v5 productPageURLString];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x263EFC630]);
      v10 = [NSURL URLWithString:v8];
      uint64_t v11 = [v9 initWithURL:v10];
      urlRequest = v7->_urlRequest;
      v7->_urlRequest = (NSURLRequest *)v11;
    }
  }

  return v7;
}

- (SUUIIPadProductPageViewController)initWithItemIdentifier:(int64_t)a3
{
  result = [(SUUIIPadProductPageViewController *)self _initSUUIIPadProductPageViewController];
  if (result) {
    result->_lookupItemIdentifier = a3;
  }
  return result;
}

- (SUUIIPadProductPageViewController)initWithProductPage:(id)a3
{
  id v5 = a3;
  v6 = [v5 item];
  objc_super v7 = [(SUUIIPadProductPageViewController *)self initWithItem:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_productPage, a3);
    [(SUUIIPadProductPageViewController *)v7 _setDefaultSectionIndexWithFragment:[(SUUIProductPage *)v7->_productPage defaultPageFragment]];
  }

  return v7;
}

- (SUUIIPadProductPageViewController)initWithURL:(id)a3
{
  v4 = [MEMORY[0x263EFC630] requestWithURL:a3];
  id v5 = [(SUUIIPadProductPageViewController *)self initWithURLRequest:v4];

  return v5;
}

- (SUUIIPadProductPageViewController)initWithURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIIPadProductPageViewController *)self _initSUUIIPadProductPageViewController];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v6;

    v8 = [v4 URL];
    [(SUUIIPadProductPageViewController *)v5 _setDefaultSectionIndexWithFragment:SUUIProductPageFragmentWithURL(v8)];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUUIMetricsDidRecordEnterEventNotification" object:0];
  [(SUUIProductPageHeaderViewController *)self->_headerViewController setDelegate:0];
  [(SUUINetworkErrorViewController *)self->_networkErrorViewController setDelegate:0];
  [(SUUISwooshArrayViewController *)self->_relatedViewController setDelegate:0];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];

  v4.receiver = self;
  v4.super_class = (Class)SUUIIPadProductPageViewController;
  [(SUUIIPadProductPageViewController *)&v4 dealloc];
}

- (void)configureMetricsWithPageEvent:(id)a3
{
  id v4 = a3;
  metricsController = self->_metricsController;
  if (metricsController)
  {
    [(SUUIMetricsController *)metricsController recordEvent:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [(SUUIIPadProductPageViewController *)self clientContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__SUUIIPadProductPageViewController_configureMetricsWithPageEvent___block_invoke;
    v7[3] = &unk_265402C68;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [v6 getDefaultMetricsControllerWithCompletionBlock:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __67__SUUIIPadProductPageViewController_configureMetricsWithPageEvent___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _setMetricsController:v6];

  id v5 = [*(id *)(a1 + 32) pageURL];
  [v6 setPageURL:v5];

  [v6 recordEvent:*(void *)(a1 + 32)];
}

- (void)reloadData
{
  objc_initWeak(&location, self);
  if (!self->_metricsController)
  {
    clientContext = self->_clientContext;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__SUUIIPadProductPageViewController_reloadData__block_invoke;
    v10[3] = &unk_265402C90;
    objc_copyWeak(&v11, &location);
    [(SUUIClientContext *)clientContext getDefaultMetricsControllerWithCompletionBlock:v10];
    objc_destroyWeak(&v11);
  }
  if (!self->_productPage && !self->_loadOperation)
  {
    if (self->_urlRequest)
    {
      id v4 = [[SUUILoadProductPageOperation alloc] initWithProductPageURLRequest:self->_urlRequest clientContext:self->_clientContext];
    }
    else
    {
      if (!self->_lookupItemIdentifier) {
        goto LABEL_10;
      }
      id v4 = [[SUUILoadProductPageOperation alloc] initWithItemIdentifier:self->_lookupItemIdentifier clientContext:self->_clientContext];
    }
    loadOperation = self->_loadOperation;
    self->_loadOperation = v4;

LABEL_10:
    id v6 = self->_loadOperation;
    if (v6)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __47__SUUIIPadProductPageViewController_reloadData__block_invoke_2;
      v8[3] = &unk_265402CB8;
      objc_copyWeak(&v9, &location);
      [(SUUILoadProductPageOperation *)v6 setOutputBlock:v8];
      [(NSOperationQueue *)self->_operationQueue addOperation:self->_loadOperation];
      lastPageEvent = self->_lastPageEvent;
      self->_lastPageEvent = 0;

      objc_destroyWeak(&v9);
    }
  }
  objc_destroyWeak(&location);
}

void __47__SUUIIPadProductPageViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setMetricsController:v3];
}

void __47__SUUIIPadProductPageViewController_reloadData__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUUIIPadProductPageViewController_reloadData__block_invoke_3;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __47__SUUIIPadProductPageViewController_reloadData__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setProductPage:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)setAskPermission:(BOOL)a3
{
  if (self->_askPermission != a3)
  {
    self->_BOOL askPermission = a3;
    -[SUUIProductPageDetailsViewController setAskPermission:](self->_detailsViewController, "setAskPermission:");
    [(SUUIProductPageReviewsViewController *)self->_reviewsViewController setAskPermission:self->_askPermission];
    [(SUUISwooshArrayViewController *)self->_relatedViewController setAskPermission:self->_askPermission];
    headerViewController = self->_headerViewController;
    BOOL askPermission = self->_askPermission;
    [(SUUIProductPageHeaderViewController *)headerViewController setAskPermission:askPermission];
  }
}

- (NSURL)URL
{
  return [(NSURLRequest *)self->_urlRequest URL];
}

- (void)setBannerText:(id)a3
{
  p_bannerText = &self->_bannerText;
  id v6 = (NSString *)a3;
  if (*p_bannerText != v6)
  {
    objc_storeStrong((id *)&self->_bannerText, a3);
    if (*p_bannerText) {
      [(SUUIIPadProductPageViewController *)self _showBanner];
    }
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  metricsController = self->_metricsController;
  id v6 = SUUIMetricsWindowOrientationForInterfaceOrientation([(SUUIIPadProductPageViewController *)self interfaceOrientation]);
  [(SUUIMetricsController *)metricsController setWindowOrientation:v6];

  v7.receiver = self;
  v7.super_class = (Class)SUUIIPadProductPageViewController;
  [(SUUIIPadProductPageViewController *)&v7 didRotateFromInterfaceOrientation:a3];
}

- (void)loadView
{
  overlayView = self->_overlayView;
  if (!overlayView)
  {
    id v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 630.0, 630.0);
    id v5 = self->_overlayView;
    self->_overlayView = v4;

    id v6 = self->_overlayView;
    objc_super v7 = [MEMORY[0x263F825C8] whiteColor];
    [(UIView *)v6 setBackgroundColor:v7];

    overlayView = self->_overlayView;
  }
  [(SUUIIPadProductPageViewController *)self setView:overlayView];
}

- (void)viewDidLayoutSubviews
{
  if (self->_productPage && self->_selectedSectionIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SUUIIPadProductPageViewController *)self _selectSectionIndex:self->_defaultSelectedSectionIndex];
    id v3 = [(SUUIIPadProductPageViewController *)self _reviewsViewController];
    [v3 reloadData];
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIIPadProductPageViewController;
  [(SUUIIPadProductPageViewController *)&v4 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  item = self->_item;
  if (item && !SUUIItemKindIsSoftwareKind([(SUUIItem *)item itemKind]))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__SUUIIPadProductPageViewController_viewWillAppear___block_invoke;
    block[3] = &unk_265400980;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if (self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      objc_super v7 = [MEMORY[0x263EFF910] date];
      [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v7];

      [(SUUIMetricsController *)self->_metricsController recordEvent:self->_lastPageEvent];
    }
  }
  [(SUUIIPadProductPageViewController *)self reloadData];
  [(SUUIIPadProductPageViewController *)self _reloadHeaderViewController];
  [(SUUIProductPageHeaderViewController *)self->_headerViewController reloadData];
  v8.receiver = self;
  v8.super_class = (Class)SUUIIPadProductPageViewController;
  [(SUUIIPadProductPageViewController *)&v8 viewWillAppear:v3];
}

uint64_t __52__SUUIIPadProductPageViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCannotOpen];
}

- (id)activeMetricsController
{
  return self->_metricsController;
}

- (void)networkErrorViewControllerInvalidated:(id)a3
{
  id v4 = a3;
  networkErrorViewController = self->_networkErrorViewController;
  if (networkErrorViewController)
  {
    id v8 = v4;
    id v6 = [networkErrorViewController view];
    [v6 removeFromSuperview];

    [(SUUINetworkErrorViewController *)self->_networkErrorViewController removeFromParentViewController];
    [(SUUINetworkErrorViewController *)self->_networkErrorViewController setDelegate:0];
    objc_super v7 = self->_networkErrorViewController;
    self->_networkErrorViewController = 0;

    networkErrorViewController = (void *)SUUIViewControllerIsVisible(self);
    id v4 = v8;
    if (networkErrorViewController)
    {
      self->_selectedSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
      networkErrorViewController = (void *)[(SUUIIPadProductPageViewController *)self reloadData];
      id v4 = v8;
    }
  }
  MEMORY[0x270F9A758](networkErrorViewController, v4);
}

- (id)metricsControllerForProductPageHeader:(id)a3
{
  return self->_metricsController;
}

- (void)productPageHeaderView:(id)a3 didSelectSectionIndex:(int64_t)a4
{
}

- (void)productPageHeaderView:(id)a3 didSelectURL:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__SUUIIPadProductPageViewController_productPageHeaderView_didSelectURL___block_invoke;
  v7[3] = &unk_265402CE0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(SUUIIPadProductPageViewController *)self productPageChildOpenURL:v6 viewControllerBlock:v7];
}

SUUIStorePageViewController *__72__SUUIIPadProductPageViewController_productPageHeaderView_didSelectURL___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SUUIStorePageViewController);
  BOOL v3 = [*(id *)(a1 + 32) clientContext];
  [(SUUIStorePageViewController *)v2 setClientContext:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 1128) item];
  id v5 = [v4 artistName];
  [(SUUIStorePageViewController *)v2 setTitle:v5];

  [(SUUIStorePageViewController *)v2 loadURL:*(void *)(a1 + 40) withCompletionBlock:0];
  return v2;
}

- (void)productPageChildOpenItem:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 iPadProductPage:self openItem:v7];
  }
}

- (void)productPageChildOpenURL:(id)a3 viewControllerBlock:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 iPadProductPage:self openURL:v10 viewControllerBlock:v6];
  }
}

- (CGPoint)topContentOffset
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)askPermissionBannerDidSelect:(id)a3
{
  if (!self->_bannerText)
  {
    uint64_t v4 = SUUIAskPermissionFramework();
    id v5 = SUUIWeakLinkedClassForString(&cfstr_Prrequestqueue.isa, v4);
    id v6 = (void *)SUUIAskPermissionFramework();
    id v7 = *(id *)SUUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v6);
    id v9 = [v5 _requestQueueForIdentifier:v7];
    int64_t v8 = [(SUUIItem *)self->_item itemIdentifier];

    [v9 _attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:v8 completionHandler:0];
  }
}

- (void)_metricsEnterEventNotification:(id)a3
{
  if (SUUIViewControllerIsVisible(self))
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      id v5 = [MEMORY[0x263EFF910] date];
      [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v5];

      metricsController = self->_metricsController;
      id v7 = self->_lastPageEvent;
      [(SUUIMetricsController *)metricsController recordEvent:v7];
    }
  }
}

- (id)_detailsViewController
{
  detailsViewController = self->_detailsViewController;
  if (!detailsViewController)
  {
    uint64_t v4 = [[SUUIProductPageDetailsViewController alloc] initWithProductPage:self->_productPage];
    id v5 = self->_detailsViewController;
    self->_detailsViewController = v4;

    id v6 = self->_detailsViewController;
    id v7 = [(SUUIIPadProductPageViewController *)self clientContext];
    [(SUUIProductPageDetailsViewController *)v6 setClientContext:v7];

    [(SUUIProductPageDetailsViewController *)self->_detailsViewController setDelegate:self];
    [(SUUIProductPageDetailsViewController *)self->_detailsViewController setOperationQueue:self->_operationQueue];
    [(SUUIProductPageDetailsViewController *)self->_detailsViewController setAskPermission:self->_askPermission];
    detailsViewController = self->_detailsViewController;
  }
  return detailsViewController;
}

- (BOOL)_isIncompatibleItem
{
  double v3 = [(SUUIProductPage *)self->_productPage item];
  item = v3;
  if (!v3) {
    item = self->_item;
  }
  id v5 = item;

  uint64_t v6 = [(SUUIItem *)v5 itemKind];
  return v6 == 5;
}

- (id)_placeholderViewController
{
  placeholderViewController = self->_placeholderViewController;
  if (!placeholderViewController)
  {
    uint64_t v4 = objc_alloc_init(SUUIProductPagePlaceholderViewController);
    id v5 = self->_placeholderViewController;
    self->_placeholderViewController = v4;

    uint64_t v6 = self->_placeholderViewController;
    id v7 = [(SUUIProductPage *)self->_productPage uber];
    int64_t v8 = [v7 colorScheme];
    [(SUUIProductPagePlaceholderViewController *)v6 setColorScheme:v8];

    [(SUUIProductPagePlaceholderViewController *)self->_placeholderViewController setClientContext:self->_clientContext];
    placeholderViewController = self->_placeholderViewController;
  }
  return placeholderViewController;
}

- (id)_relatedViewController
{
  relatedViewController = self->_relatedViewController;
  if (!relatedViewController)
  {
    uint64_t v4 = [SUUISwooshArrayViewController alloc];
    id v5 = [(SUUIProductPage *)self->_productPage relatedContentSwooshes];
    uint64_t v6 = [(SUUISwooshArrayViewController *)v4 initWithSwooshComponents:v5];
    id v7 = self->_relatedViewController;
    self->_relatedViewController = v6;

    [(SUUISwooshArrayViewController *)self->_relatedViewController setClientContext:self->_clientContext];
    int64_t v8 = self->_relatedViewController;
    id v9 = [(SUUIProductPage *)self->_productPage uber];
    id v10 = [v9 colorScheme];
    [(SUUISwooshArrayViewController *)v8 setColorScheme:v10];

    [(SUUISwooshArrayViewController *)self->_relatedViewController setDelegate:self];
    [(SUUISwooshArrayViewController *)self->_relatedViewController setOperationQueue:self->_operationQueue];
    [(SUUISwooshArrayViewController *)self->_relatedViewController setMetricsController:self->_metricsController];
    [(SUUISwooshArrayViewController *)self->_relatedViewController setAskPermission:self->_askPermission];
    relatedViewController = self->_relatedViewController;
  }
  return relatedViewController;
}

- (void)_reloadHeaderViewController
{
  headerViewController = self->_headerViewController;
  if (headerViewController) {
    goto LABEL_2;
  }
  if (self->_item)
  {
    v15 = [[SUUIProductPageHeaderViewController alloc] initWithItem:self->_item];
    v16 = self->_headerViewController;
    self->_headerViewController = v15;

    v17 = self->_headerViewController;
    v18 = [(SUUIIPadProductPageViewController *)self clientContext];
    [(SUUIProductPageHeaderViewController *)v17 setClientContext:v18];

    [(SUUIProductPageHeaderViewController *)self->_headerViewController setDelegate:self];
    [(SUUIProductPageHeaderViewController *)self->_headerViewController setOperationQueue:self->_operationQueue];
    [(SUUIProductPageHeaderViewController *)self->_headerViewController setProductPage:self->_productPage];
    [(SUUIProductPageHeaderViewController *)self->_headerViewController setSelectedSectionIndex:self->_defaultSelectedSectionIndex];
    [(SUUIProductPageHeaderViewController *)self->_headerViewController setAskPermission:self->_askPermission];
    [(SUUIIPadProductPageViewController *)self addChildViewController:self->_headerViewController];
    headerViewController = self->_headerViewController;
    if (headerViewController)
    {
LABEL_2:
      id v19 = [(SUUIProductPageHeaderViewController *)headerViewController view];
      [v19 frame];
      double v5 = v4;
      double v7 = v6;
      [(SUUIMessageBanner *)self->_banner frame];
      CGFloat v9 = v8;
      objc_msgSend(v19, "setFrame:", v5, v8, 630.0, v7);
      [(UIView *)self->_overlayView addSubview:v19];
      id v10 = [(SUUIProductPageHeaderViewController *)self->_headerViewController floatingView];
      [v10 sizeToFit];
      [v10 frame];
      double v12 = v11;
      double v14 = v13;
      v21.origin.x = v5;
      v21.origin.y = v9;
      v21.size.width = 630.0;
      v21.size.height = v7;
      objc_msgSend(v10, "setFrame:", v12, CGRectGetMaxY(v21), 630.0, v14);
      [(UIView *)self->_overlayView addSubview:v10];
    }
  }
}

- (id)_reviewsViewController
{
  reviewsViewController = self->_reviewsViewController;
  if (!reviewsViewController)
  {
    double v4 = [[SUUIProductPageReviewsViewController alloc] initWithProductPage:self->_productPage];
    double v5 = self->_reviewsViewController;
    self->_reviewsViewController = v4;

    [(SUUIProductPageReviewsViewController *)self->_reviewsViewController setClientContext:self->_clientContext];
    [(SUUIProductPageReviewsViewController *)self->_reviewsViewController setAskPermission:self->_askPermission];
    reviewsViewController = self->_reviewsViewController;
  }
  return reviewsViewController;
}

- (void)_selectSectionIndex:(int64_t)a3
{
  if (self->_selectedSectionIndex != a3)
  {
    -[SUUIIPadProductPageViewController _viewControllerForSectionIndex:](self, "_viewControllerForSectionIndex:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if ([v7 isViewLoaded])
    {
      double v5 = [v7 view];
      [v5 removeFromSuperview];
    }
    [v7 removeFromParentViewController];
    self->_selectedSectionIndex = a3;
    double v6 = [(SUUIIPadProductPageViewController *)self _viewControllerForSectionIndex:a3];
    if (v6)
    {
      [(SUUIIPadProductPageViewController *)self addChildViewController:v6];
      [(SUUIIPadProductPageViewController *)self _showViewController:v6];
    }
  }
}

- (void)_sendCannotOpen
{
  if (!self->_didSendCannotOpen)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      self->_didSendCannotOpen = 1;
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      [v6 iPadProductPageCannotOpen:self];
    }
  }
}

- (void)_setDefaultSectionIndexWithFragment:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    self->_defaultSelectedSectionIndex = a3;
  }
}

- (void)_setMetricsController:(id)a3
{
  id v5 = a3;
  p_metricsController = (id *)&self->_metricsController;
  if (!self->_metricsController)
  {
    id v21 = v5;
    id v7 = [(SUUIProductPage *)self->_productPage metricsConfiguration];
    objc_storeStrong((id *)&self->_metricsController, a3);
    id v8 = *p_metricsController;
    CGFloat v9 = [(SUUIClientContext *)self->_clientContext clientInterface];
    id v10 = [v9 clientIdentifier];
    [v8 setApplicationIdentifier:v10];

    [*p_metricsController setPageConfiguration:v7];
    id v11 = *p_metricsController;
    double v12 = [(SUUIClientContext *)self->_clientContext metricsPageContextForViewController:self];
    [v11 setPageContext:v12];

    id v13 = *p_metricsController;
    double v14 = [(SUUIProductPage *)self->_productPage pageURL];
    v15 = [v14 absoluteString];
    [v13 setPageURL:v15];

    id v16 = *p_metricsController;
    v17 = [MEMORY[0x263F82438] sharedApplication];
    v18 = SUUIMetricsWindowOrientationForInterfaceOrientation([v17 statusBarOrientation]);
    [v16 setWindowOrientation:v18];

    [(SUUISwooshArrayViewController *)self->_relatedViewController setMetricsController:*p_metricsController];
    id v19 = *p_metricsController;
    v20 = [v7 pingURLs];
    [v19 pingURLs:v20 withClientContext:self->_clientContext];

    [*p_metricsController recordEvent:self->_lastPageEvent];
    id v5 = v21;
  }
}

- (void)_setProductPage:(id)a3 error:(id)a4
{
  id v26 = a3;
  id v7 = a4;
  id v8 = [v26 ITMLData];

  if (v8)
  {
    CGFloat v9 = [(SUUIIPadProductPageViewController *)self clientContext];
    id v10 = [v26 ITMLData];
    id v11 = [v26 ITMLResponse];
    [v9 sendOnPageResponseWithDocument:0 data:v10 URLResponse:v11 performanceMetrics:0];
  }
  else
  {
    if (!v26) {
      goto LABEL_12;
    }
    p_productPage = &self->_productPage;
    objc_storeStrong((id *)&self->_productPage, a3);
    CGFloat v9 = [(SUUIProductPage *)self->_productPage metricsConfiguration];
    [(SUUIMetricsController *)self->_metricsController setPageConfiguration:v9];
    metricsController = self->_metricsController;
    double v14 = [(SUUIProductPage *)self->_productPage pageURL];
    v15 = [v14 absoluteString];
    [(SUUIMetricsController *)metricsController setPageURL:v15];

    if (!self->_item)
    {
      id v16 = [v26 item];
      item = self->_item;
      self->_item = v16;

      [(SUUIIPadProductPageViewController *)self _reloadHeaderViewController];
    }
    [(SUUIProductPageHeaderViewController *)self->_headerViewController setProductPage:*p_productPage];
    if (self->_selectedSectionIndex == 0x7FFFFFFFFFFFFFFFLL) {
      [(SUUIIPadProductPageViewController *)self _selectSectionIndex:self->_defaultSelectedSectionIndex];
    }
    v18 = [(SUUIProductPage *)*p_productPage uber];
    id v10 = [v18 colorScheme];

    [(SUUIProductPagePlaceholderViewController *)self->_placeholderViewController setColorScheme:v10];
    [(SUUISwooshArrayViewController *)self->_relatedViewController setColorScheme:v10];
    id v19 = [(SUUIIPadProductPageViewController *)self _reviewsViewController];
    [v19 reloadData];

    [(SUUIProductPageHeaderViewController *)self->_headerViewController reloadData];
    id v11 = [(SUUILoadProductPageOperation *)self->_loadOperation metricsPageEvent];
    if (v11)
    {
      v20 = [MEMORY[0x263EFF910] date];
      [v20 timeIntervalSince1970];
      objc_msgSend(v11, "setPageRenderTime:");

      [(SUUIMetricsController *)self->_metricsController recordEvent:v11];
      objc_storeStrong((id *)&self->_lastPageEvent, v11);
    }
    id v21 = self->_metricsController;
    v22 = [v9 pingURLs];
    [(SUUIMetricsController *)v21 pingURLs:v22 withClientContext:self->_clientContext];
  }
LABEL_12:
  if (!v7) {
    goto LABEL_18;
  }
  v23 = [v7 domain];
  if ([v23 isEqualToString:@"SUUIErrorDomain"])
  {
    uint64_t v24 = [v7 code];

    if (v24 == 1)
    {
      [(SUUIIPadProductPageViewController *)self _sendCannotOpen];
      goto LABEL_18;
    }
  }
  else
  {
  }
  [(SUUIIPadProductPageViewController *)self _showError:v7];
LABEL_18:
  [(SUUILoadProductPageOperation *)self->_loadOperation setOutputBlock:0];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;
}

- (void)_showError:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (!self->_networkErrorViewController)
  {
    uint64_t v8 = v4;
    uint64_t v4 = +[SUUINetworkErrorViewController canDisplayError:v4];
    uint64_t v5 = v8;
    if (v4)
    {
      id v6 = [[SUUINetworkErrorViewController alloc] initWithError:v8];
      networkErrorViewController = self->_networkErrorViewController;
      self->_networkErrorViewController = v6;

      [(SUUINetworkErrorViewController *)self->_networkErrorViewController setClientContext:self->_clientContext];
      [(SUUINetworkErrorViewController *)self->_networkErrorViewController setDelegate:self];
      [(SUUIIPadProductPageViewController *)self addChildViewController:self->_networkErrorViewController];
      uint64_t v4 = [(SUUIIPadProductPageViewController *)self _showViewController:self->_networkErrorViewController];
      uint64_t v5 = v8;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_showIncompatibleView
{
  incompatibleViewController = self->_incompatibleViewController;
  if (!incompatibleViewController)
  {
    uint64_t v4 = [SUUIIncompatibleAppViewController alloc];
    uint64_t v5 = [(SUUIProductPage *)self->_productPage item];
    id v6 = [(SUUIIncompatibleAppViewController *)v4 initWithIncompatibleItem:v5];
    id v7 = self->_incompatibleViewController;
    self->_incompatibleViewController = v6;

    [(SUUIViewController *)self->_incompatibleViewController setClientContext:self->_clientContext];
    [(SUUIIncompatibleAppViewController *)self->_incompatibleViewController setOperationQueue:self->_operationQueue];
    [(SUUIIPadProductPageViewController *)self addChildViewController:self->_incompatibleViewController];
    uint64_t v8 = [(SUUIIncompatibleAppViewController *)self->_incompatibleViewController view];
    [v8 setAutoresizingMask:18];
    [(UIView *)self->_overlayView bounds];
    objc_msgSend(v8, "setFrame:");
    [(UIView *)self->_overlayView addSubview:v8];

    incompatibleViewController = self->_incompatibleViewController;
  }
  overlayView = self->_overlayView;
  id v10 = [(SUUIIncompatibleAppViewController *)incompatibleViewController view];
  [(UIView *)overlayView bringSubviewToFront:v10];
}

- (void)_showBanner
{
  if (!self->_banner)
  {
    double v3 = objc_alloc_init(SUUIMessageBanner);
    banner = self->_banner;
    self->_banner = v3;

    [(SUUIMessageBanner *)self->_banner setDelegate:self];
    uint64_t v5 = self->_banner;
    if (self->_bannerText)
    {
      -[SUUIMessageBanner setMessage:](self->_banner, "setMessage:");
    }
    else
    {
      id v6 = [(SUUIIPadProductPageViewController *)self clientContext];
      id v7 = [(SUUIIPadProductPageViewController *)self view];
      uint64_t v8 = [v7 tintColor];
      CGFloat v9 = SUUIMessageBannerAttributedString(v6, v8);
      [(SUUIMessageBanner *)v5 setAttributedMessage:v9];
    }
    id v10 = [(SUUIIPadProductPageViewController *)self view];
    [v10 addSubview:self->_banner];

    id v11 = [(SUUIIPadProductPageViewController *)self view];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;

    -[SUUIMessageBanner sizeThatFits:](self->_banner, "sizeThatFits:", 630.0, 630.0);
    -[SUUIMessageBanner setFrame:](self->_banner, "setFrame:", v13, v15, v16, v17);
    id v18 = [(SUUIIPadProductPageViewController *)self _viewControllerForSectionIndex:self->_selectedSectionIndex];
    [(SUUIIPadProductPageViewController *)self _showViewController:v18];
  }
}

- (void)_showViewController:(id)a3
{
  id v4 = a3;
  [(SUUIIPadProductPageViewController *)self _reloadHeaderViewController];
  id v7 = [v4 view];

  [(SUUIMessageBanner *)self->_banner frame];
  uint64_t v5 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
  [v5 frame];
  id v6 = [(SUUIProductPageHeaderViewController *)self->_headerViewController floatingView];
  [v6 frame];

  [(UIView *)self->_overlayView bounds];
  objc_msgSend(v7, "setFrame:");
  [(UIView *)self->_overlayView insertSubview:v7 atIndex:0];
  if ([(SUUIIPadProductPageViewController *)self _isIncompatibleItem]) {
    [(SUUIIPadProductPageViewController *)self _showIncompatibleView];
  }
}

- (id)_viewControllerForSectionIndex:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v5 = [(SUUIProductPage *)self->_productPage relatedContentSwooshes];
    uint64_t v6 = [v5 count];

    if (v6) {
      [(SUUIIPadProductPageViewController *)self _relatedViewController];
    }
    else {
    id v4 = [(SUUIIPadProductPageViewController *)self _placeholderViewController];
    }
  }
  else if (a3 == 1)
  {
    id v4 = [(SUUIIPadProductPageViewController *)self _reviewsViewController];
  }
  else if (a3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(SUUIIPadProductPageViewController *)self _detailsViewController];
  }
  return v4;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (NSString)bannerText
{
  return self->_bannerText;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIIPadProductPageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIIPadProductPageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SUUIItem)item
{
  return self->_item;
}

- (SUUIProductPage)productPage
{
  return self->_productPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_reviewsViewController, 0);
  objc_storeStrong((id *)&self->_relatedViewController, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_networkErrorViewController, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_lastPageEvent, 0);
  objc_storeStrong((id *)&self->_incompatibleViewController, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bannerText, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end