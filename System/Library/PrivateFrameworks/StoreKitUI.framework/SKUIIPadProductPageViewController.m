@interface SKUIIPadProductPageViewController
- (BOOL)_isIncompatibleItem;
- (BOOL)askPermission;
- (CGPoint)topContentOffset;
- (NSString)bannerText;
- (NSURL)URL;
- (SKUIClientContext)clientContext;
- (SKUIIPadProductPageDelegate)delegate;
- (SKUIIPadProductPageViewController)initWithItem:(id)a3;
- (SKUIIPadProductPageViewController)initWithItemIdentifier:(int64_t)a3;
- (SKUIIPadProductPageViewController)initWithProductPage:(id)a3;
- (SKUIIPadProductPageViewController)initWithURL:(id)a3;
- (SKUIIPadProductPageViewController)initWithURLRequest:(id)a3;
- (SKUIItem)item;
- (SKUIProductPage)productPage;
- (id)_detailsViewController;
- (id)_initSKUIIPadProductPageViewController;
- (id)_placeholderViewController;
- (id)_relatedViewController;
- (id)_reviewsViewController;
- (id)_viewControllerForSectionIndex:(int64_t)a3;
- (id)activeMetricsController;
- (id)metricsControllerForProductPageHeader:(id)a3;
- (void)_initSKUIIPadProductPageViewController;
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

@implementation SKUIIPadProductPageViewController

- (id)_initSKUIIPadProductPageViewController
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPadProductPageViewController _initSKUIIPadProductPageViewController]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIIPadProductPageViewController;
  v3 = [(SKUIIPadProductPageViewController *)&v8 init];
  if (v3)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v3->_operationQueue;
    v3->_operationQueue = v4;

    [(NSOperationQueue *)v3->_operationQueue setMaxConcurrentOperationCount:4];
    v3->_defaultSelectedSectionIndex = 0;
    v3->_selectedSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__metricsEnterEventNotification_ name:@"SKUIMetricsDidRecordEnterEventNotification" object:0];
  }
  return v3;
}

- (SKUIIPadProductPageViewController)initWithItem:(id)a3
{
  id v5 = a3;
  v6 = [(SKUIIPadProductPageViewController *)self _initSKUIIPadProductPageViewController];
  v7 = (SKUIIPadProductPageViewController *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 131, a3);
    v7->_lookupItemIdentifier = [v5 itemIdentifier];
    objc_super v8 = [v5 productPageURLString];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F18DA8]);
      v10 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
      uint64_t v11 = [v9 initWithURL:v10];
      urlRequest = v7->_urlRequest;
      v7->_urlRequest = (NSURLRequest *)v11;
    }
  }

  return v7;
}

- (SKUIIPadProductPageViewController)initWithItemIdentifier:(int64_t)a3
{
  result = [(SKUIIPadProductPageViewController *)self _initSKUIIPadProductPageViewController];
  if (result) {
    result->_lookupItemIdentifier = a3;
  }
  return result;
}

- (SKUIIPadProductPageViewController)initWithProductPage:(id)a3
{
  id v5 = a3;
  v6 = [v5 item];
  v7 = [(SKUIIPadProductPageViewController *)self initWithItem:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_productPage, a3);
    [(SKUIIPadProductPageViewController *)v7 _setDefaultSectionIndexWithFragment:[(SKUIProductPage *)v7->_productPage defaultPageFragment]];
  }

  return v7;
}

- (SKUIIPadProductPageViewController)initWithURL:(id)a3
{
  v4 = [MEMORY[0x1E4F18DA8] requestWithURL:a3];
  id v5 = [(SKUIIPadProductPageViewController *)self initWithURLRequest:v4];

  return v5;
}

- (SKUIIPadProductPageViewController)initWithURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIIPadProductPageViewController *)self _initSKUIIPadProductPageViewController];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v6;

    objc_super v8 = [v4 URL];
    [(SKUIIPadProductPageViewController *)v5 _setDefaultSectionIndexWithFragment:SKUIProductPageFragmentWithURL(v8)];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SKUIMetricsDidRecordEnterEventNotification" object:0];
  [(SKUIProductPageHeaderViewController *)self->_headerViewController setDelegate:0];
  [(SKUINetworkErrorViewController *)self->_networkErrorViewController setDelegate:0];
  [(SKUISwooshArrayViewController *)self->_relatedViewController setDelegate:0];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];

  v4.receiver = self;
  v4.super_class = (Class)SKUIIPadProductPageViewController;
  [(SKUIIPadProductPageViewController *)&v4 dealloc];
}

- (void)configureMetricsWithPageEvent:(id)a3
{
  id v4 = a3;
  metricsController = self->_metricsController;
  if (metricsController)
  {
    [(SKUIMetricsController *)metricsController recordEvent:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [(SKUIIPadProductPageViewController *)self clientContext];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__SKUIIPadProductPageViewController_configureMetricsWithPageEvent___block_invoke;
    v7[3] = &unk_1E6428390;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [v6 getDefaultMetricsControllerWithCompletionBlock:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __67__SKUIIPadProductPageViewController_configureMetricsWithPageEvent___block_invoke(uint64_t a1, void *a2)
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
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__SKUIIPadProductPageViewController_reloadData__block_invoke;
    v10[3] = &unk_1E64253A8;
    objc_copyWeak(&v11, &location);
    [(SKUIClientContext *)clientContext getDefaultMetricsControllerWithCompletionBlock:v10];
    objc_destroyWeak(&v11);
  }
  if (!self->_productPage && !self->_loadOperation)
  {
    if (self->_urlRequest)
    {
      id v4 = [[SKUILoadProductPageOperation alloc] initWithProductPageURLRequest:self->_urlRequest clientContext:self->_clientContext];
    }
    else
    {
      if (!self->_lookupItemIdentifier) {
        goto LABEL_10;
      }
      id v4 = [[SKUILoadProductPageOperation alloc] initWithItemIdentifier:self->_lookupItemIdentifier clientContext:self->_clientContext];
    }
    loadOperation = self->_loadOperation;
    self->_loadOperation = v4;

LABEL_10:
    id v6 = self->_loadOperation;
    if (v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __47__SKUIIPadProductPageViewController_reloadData__block_invoke_2;
      v8[3] = &unk_1E64283B8;
      objc_copyWeak(&v9, &location);
      [(SKUILoadProductPageOperation *)v6 setOutputBlock:v8];
      [(NSOperationQueue *)self->_operationQueue addOperation:self->_loadOperation];
      lastPageEvent = self->_lastPageEvent;
      self->_lastPageEvent = 0;

      objc_destroyWeak(&v9);
    }
  }
  objc_destroyWeak(&location);
}

void __47__SKUIIPadProductPageViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setMetricsController:v3];
}

void __47__SKUIIPadProductPageViewController_reloadData__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SKUIIPadProductPageViewController_reloadData__block_invoke_3;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __47__SKUIIPadProductPageViewController_reloadData__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setProductPage:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)setAskPermission:(BOOL)a3
{
  if (self->_askPermission != a3)
  {
    self->_BOOL askPermission = a3;
    -[SKUIProductPageDetailsViewController setAskPermission:](self->_detailsViewController, "setAskPermission:");
    [(SKUIProductPageReviewsViewController *)self->_reviewsViewController setAskPermission:self->_askPermission];
    [(SKUISwooshArrayViewController *)self->_relatedViewController setAskPermission:self->_askPermission];
    headerViewController = self->_headerViewController;
    BOOL askPermission = self->_askPermission;
    [(SKUIProductPageHeaderViewController *)headerViewController setAskPermission:askPermission];
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
      [(SKUIIPadProductPageViewController *)self _showBanner];
    }
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  metricsController = self->_metricsController;
  id v6 = SKUIMetricsWindowOrientationForInterfaceOrientation([(SKUIIPadProductPageViewController *)self interfaceOrientation]);
  [(SKUIMetricsController *)metricsController setWindowOrientation:v6];

  v7.receiver = self;
  v7.super_class = (Class)SKUIIPadProductPageViewController;
  [(SKUIIPadProductPageViewController *)&v7 didRotateFromInterfaceOrientation:a3];
}

- (void)loadView
{
  overlayView = self->_overlayView;
  if (!overlayView)
  {
    id v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 630.0, 630.0);
    id v5 = self->_overlayView;
    self->_overlayView = v4;

    id v6 = self->_overlayView;
    objc_super v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v6 setBackgroundColor:v7];

    overlayView = self->_overlayView;
  }

  [(SKUIIPadProductPageViewController *)self setView:overlayView];
}

- (void)viewDidLayoutSubviews
{
  if (self->_productPage && self->_selectedSectionIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SKUIIPadProductPageViewController *)self _selectSectionIndex:self->_defaultSelectedSectionIndex];
    id v3 = [(SKUIIPadProductPageViewController *)self _reviewsViewController];
    [v3 reloadData];
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIIPadProductPageViewController;
  [(SKUIIPadProductPageViewController *)&v4 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  item = self->_item;
  if (item && !SKUIItemKindIsSoftwareKind([(SKUIItem *)item itemKind]))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SKUIIPadProductPageViewController_viewWillAppear___block_invoke;
    block[3] = &unk_1E6422020;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      objc_super v7 = [MEMORY[0x1E4F1C9C8] date];
      [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v7];

      [(SKUIMetricsController *)self->_metricsController recordEvent:self->_lastPageEvent];
    }
  }
  [(SKUIIPadProductPageViewController *)self reloadData];
  [(SKUIIPadProductPageViewController *)self _reloadHeaderViewController];
  [(SKUIProductPageHeaderViewController *)self->_headerViewController reloadData];
  v8.receiver = self;
  v8.super_class = (Class)SKUIIPadProductPageViewController;
  [(SKUIIPadProductPageViewController *)&v8 viewWillAppear:v3];
}

uint64_t __52__SKUIIPadProductPageViewController_viewWillAppear___block_invoke(uint64_t a1)
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

    [(SKUINetworkErrorViewController *)self->_networkErrorViewController removeFromParentViewController];
    [(SKUINetworkErrorViewController *)self->_networkErrorViewController setDelegate:0];
    objc_super v7 = self->_networkErrorViewController;
    self->_networkErrorViewController = 0;

    networkErrorViewController = (void *)SKUIViewControllerIsVisible(self);
    id v4 = v8;
    if (networkErrorViewController)
    {
      self->_selectedSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
      networkErrorViewController = (void *)[(SKUIIPadProductPageViewController *)self reloadData];
      id v4 = v8;
    }
  }

  MEMORY[0x1F41817F8](networkErrorViewController, v4);
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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SKUIIPadProductPageViewController_productPageHeaderView_didSelectURL___block_invoke;
  v7[3] = &unk_1E64283E0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(SKUIIPadProductPageViewController *)self productPageChildOpenURL:v6 viewControllerBlock:v7];
}

SKUIStorePageViewController *__72__SKUIIPadProductPageViewController_productPageHeaderView_didSelectURL___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SKUIStorePageViewController);
  BOOL v3 = [*(id *)(a1 + 32) clientContext];
  [(SKUIStorePageViewController *)v2 setClientContext:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 1128) item];
  id v5 = [v4 artistName];
  [(SKUIStorePageViewController *)v2 setTitle:v5];

  [(SKUIStorePageViewController *)v2 loadURL:*(void *)(a1 + 40) withCompletionBlock:0];

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
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)askPermissionBannerDidSelect:(id)a3
{
  if (!self->_bannerText)
  {
    uint64_t v4 = SKUIAskPermissionFramework();
    id v5 = SKUIWeakLinkedClassForString(&cfstr_Prrequestqueue.isa, v4);
    id v6 = (void *)SKUIAskPermissionFramework();
    id v7 = *(id *)SKUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v6);
    id v9 = [v5 _requestQueueForIdentifier:v7];
    int64_t v8 = [(SKUIItem *)self->_item itemIdentifier];

    [v9 _attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:v8 completionHandler:0];
  }
}

- (void)_metricsEnterEventNotification:(id)a3
{
  if (SKUIViewControllerIsVisible(self))
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      id v5 = [MEMORY[0x1E4F1C9C8] date];
      [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v5];

      metricsController = self->_metricsController;
      id v7 = self->_lastPageEvent;
      [(SKUIMetricsController *)metricsController recordEvent:v7];
    }
  }
}

- (id)_detailsViewController
{
  detailsViewController = self->_detailsViewController;
  if (!detailsViewController)
  {
    uint64_t v4 = [[SKUIProductPageDetailsViewController alloc] initWithProductPage:self->_productPage];
    id v5 = self->_detailsViewController;
    self->_detailsViewController = v4;

    id v6 = self->_detailsViewController;
    id v7 = [(SKUIIPadProductPageViewController *)self clientContext];
    [(SKUIProductPageDetailsViewController *)v6 setClientContext:v7];

    [(SKUIProductPageDetailsViewController *)self->_detailsViewController setDelegate:self];
    [(SKUIProductPageDetailsViewController *)self->_detailsViewController setOperationQueue:self->_operationQueue];
    [(SKUIProductPageDetailsViewController *)self->_detailsViewController setAskPermission:self->_askPermission];
    detailsViewController = self->_detailsViewController;
  }

  return detailsViewController;
}

- (BOOL)_isIncompatibleItem
{
  double v3 = [(SKUIProductPage *)self->_productPage item];
  item = v3;
  if (!v3) {
    item = self->_item;
  }
  id v5 = item;

  uint64_t v6 = [(SKUIItem *)v5 itemKind];
  return v6 == 5;
}

- (id)_placeholderViewController
{
  placeholderViewController = self->_placeholderViewController;
  if (!placeholderViewController)
  {
    uint64_t v4 = objc_alloc_init(SKUIProductPagePlaceholderViewController);
    id v5 = self->_placeholderViewController;
    self->_placeholderViewController = v4;

    uint64_t v6 = self->_placeholderViewController;
    id v7 = [(SKUIProductPage *)self->_productPage uber];
    int64_t v8 = [v7 colorScheme];
    [(SKUIProductPagePlaceholderViewController *)v6 setColorScheme:v8];

    [(SKUIProductPagePlaceholderViewController *)self->_placeholderViewController setClientContext:self->_clientContext];
    placeholderViewController = self->_placeholderViewController;
  }

  return placeholderViewController;
}

- (id)_relatedViewController
{
  relatedViewController = self->_relatedViewController;
  if (!relatedViewController)
  {
    uint64_t v4 = [SKUISwooshArrayViewController alloc];
    id v5 = [(SKUIProductPage *)self->_productPage relatedContentSwooshes];
    uint64_t v6 = [(SKUISwooshArrayViewController *)v4 initWithSwooshComponents:v5];
    id v7 = self->_relatedViewController;
    self->_relatedViewController = v6;

    [(SKUISwooshArrayViewController *)self->_relatedViewController setClientContext:self->_clientContext];
    int64_t v8 = self->_relatedViewController;
    id v9 = [(SKUIProductPage *)self->_productPage uber];
    id v10 = [v9 colorScheme];
    [(SKUISwooshArrayViewController *)v8 setColorScheme:v10];

    [(SKUISwooshArrayViewController *)self->_relatedViewController setDelegate:self];
    [(SKUISwooshArrayViewController *)self->_relatedViewController setOperationQueue:self->_operationQueue];
    [(SKUISwooshArrayViewController *)self->_relatedViewController setMetricsController:self->_metricsController];
    [(SKUISwooshArrayViewController *)self->_relatedViewController setAskPermission:self->_askPermission];
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
    v15 = [[SKUIProductPageHeaderViewController alloc] initWithItem:self->_item];
    v16 = self->_headerViewController;
    self->_headerViewController = v15;

    v17 = self->_headerViewController;
    v18 = [(SKUIIPadProductPageViewController *)self clientContext];
    [(SKUIProductPageHeaderViewController *)v17 setClientContext:v18];

    [(SKUIProductPageHeaderViewController *)self->_headerViewController setDelegate:self];
    [(SKUIProductPageHeaderViewController *)self->_headerViewController setOperationQueue:self->_operationQueue];
    [(SKUIProductPageHeaderViewController *)self->_headerViewController setProductPage:self->_productPage];
    [(SKUIProductPageHeaderViewController *)self->_headerViewController setSelectedSectionIndex:self->_defaultSelectedSectionIndex];
    [(SKUIProductPageHeaderViewController *)self->_headerViewController setAskPermission:self->_askPermission];
    [(SKUIIPadProductPageViewController *)self addChildViewController:self->_headerViewController];
    headerViewController = self->_headerViewController;
    if (headerViewController)
    {
LABEL_2:
      id v19 = [(SKUIProductPageHeaderViewController *)headerViewController view];
      [v19 frame];
      double v5 = v4;
      double v7 = v6;
      [(SKUIMessageBanner *)self->_banner frame];
      CGFloat v9 = v8;
      objc_msgSend(v19, "setFrame:", v5, v8, 630.0, v7);
      [(UIView *)self->_overlayView addSubview:v19];
      id v10 = [(SKUIProductPageHeaderViewController *)self->_headerViewController floatingView];
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
    double v4 = [[SKUIProductPageReviewsViewController alloc] initWithProductPage:self->_productPage];
    double v5 = self->_reviewsViewController;
    self->_reviewsViewController = v4;

    [(SKUIProductPageReviewsViewController *)self->_reviewsViewController setClientContext:self->_clientContext];
    [(SKUIProductPageReviewsViewController *)self->_reviewsViewController setAskPermission:self->_askPermission];
    reviewsViewController = self->_reviewsViewController;
  }

  return reviewsViewController;
}

- (void)_selectSectionIndex:(int64_t)a3
{
  if (self->_selectedSectionIndex != a3)
  {
    -[SKUIIPadProductPageViewController _viewControllerForSectionIndex:](self, "_viewControllerForSectionIndex:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if ([v7 isViewLoaded])
    {
      double v5 = [v7 view];
      [v5 removeFromSuperview];
    }
    [v7 removeFromParentViewController];
    self->_selectedSectionIndex = a3;
    double v6 = [(SKUIIPadProductPageViewController *)self _viewControllerForSectionIndex:a3];
    if (v6)
    {
      [(SKUIIPadProductPageViewController *)self addChildViewController:v6];
      [(SKUIIPadProductPageViewController *)self _showViewController:v6];
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
    id v7 = [(SKUIProductPage *)self->_productPage metricsConfiguration];
    objc_storeStrong((id *)&self->_metricsController, a3);
    id v8 = *p_metricsController;
    CGFloat v9 = [(SKUIClientContext *)self->_clientContext clientInterface];
    id v10 = [v9 clientIdentifier];
    [v8 setApplicationIdentifier:v10];

    [*p_metricsController setPageConfiguration:v7];
    id v11 = *p_metricsController;
    double v12 = [(SKUIClientContext *)self->_clientContext metricsPageContextForViewController:self];
    [v11 setPageContext:v12];

    id v13 = *p_metricsController;
    double v14 = [(SKUIProductPage *)self->_productPage pageURL];
    v15 = [v14 absoluteString];
    [v13 setPageURL:v15];

    id v16 = *p_metricsController;
    v17 = [MEMORY[0x1E4FB1438] sharedApplication];
    v18 = SKUIMetricsWindowOrientationForInterfaceOrientation([v17 statusBarOrientation]);
    [v16 setWindowOrientation:v18];

    [(SKUISwooshArrayViewController *)self->_relatedViewController setMetricsController:*p_metricsController];
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
    CGFloat v9 = [(SKUIIPadProductPageViewController *)self clientContext];
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
    CGFloat v9 = [(SKUIProductPage *)self->_productPage metricsConfiguration];
    [(SKUIMetricsController *)self->_metricsController setPageConfiguration:v9];
    metricsController = self->_metricsController;
    double v14 = [(SKUIProductPage *)self->_productPage pageURL];
    v15 = [v14 absoluteString];
    [(SKUIMetricsController *)metricsController setPageURL:v15];

    if (!self->_item)
    {
      id v16 = [v26 item];
      item = self->_item;
      self->_item = v16;

      [(SKUIIPadProductPageViewController *)self _reloadHeaderViewController];
    }
    [(SKUIProductPageHeaderViewController *)self->_headerViewController setProductPage:*p_productPage];
    if (self->_selectedSectionIndex == 0x7FFFFFFFFFFFFFFFLL) {
      [(SKUIIPadProductPageViewController *)self _selectSectionIndex:self->_defaultSelectedSectionIndex];
    }
    v18 = [(SKUIProductPage *)*p_productPage uber];
    id v10 = [v18 colorScheme];

    [(SKUIProductPagePlaceholderViewController *)self->_placeholderViewController setColorScheme:v10];
    [(SKUISwooshArrayViewController *)self->_relatedViewController setColorScheme:v10];
    id v19 = [(SKUIIPadProductPageViewController *)self _reviewsViewController];
    [v19 reloadData];

    [(SKUIProductPageHeaderViewController *)self->_headerViewController reloadData];
    id v11 = [(SKUILoadProductPageOperation *)self->_loadOperation metricsPageEvent];
    if (v11)
    {
      v20 = [MEMORY[0x1E4F1C9C8] date];
      [v20 timeIntervalSince1970];
      objc_msgSend(v11, "setPageRenderTime:");

      [(SKUIMetricsController *)self->_metricsController recordEvent:v11];
      objc_storeStrong((id *)&self->_lastPageEvent, v11);
    }
    id v21 = self->_metricsController;
    v22 = [v9 pingURLs];
    [(SKUIMetricsController *)v21 pingURLs:v22 withClientContext:self->_clientContext];
  }
LABEL_12:
  if (!v7) {
    goto LABEL_18;
  }
  v23 = [v7 domain];
  if ([v23 isEqualToString:@"SKUIErrorDomain"])
  {
    uint64_t v24 = [v7 code];

    if (v24 == 1)
    {
      [(SKUIIPadProductPageViewController *)self _sendCannotOpen];
      goto LABEL_18;
    }
  }
  else
  {
  }
  [(SKUIIPadProductPageViewController *)self _showError:v7];
LABEL_18:
  [(SKUILoadProductPageOperation *)self->_loadOperation setOutputBlock:0];
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
    uint64_t v4 = +[SKUINetworkErrorViewController canDisplayError:v4];
    uint64_t v5 = v8;
    if (v4)
    {
      id v6 = [[SKUINetworkErrorViewController alloc] initWithError:v8];
      networkErrorViewController = self->_networkErrorViewController;
      self->_networkErrorViewController = v6;

      [(SKUINetworkErrorViewController *)self->_networkErrorViewController setClientContext:self->_clientContext];
      [(SKUINetworkErrorViewController *)self->_networkErrorViewController setDelegate:self];
      [(SKUIIPadProductPageViewController *)self addChildViewController:self->_networkErrorViewController];
      uint64_t v4 = [(SKUIIPadProductPageViewController *)self _showViewController:self->_networkErrorViewController];
      uint64_t v5 = v8;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_showIncompatibleView
{
  incompatibleViewController = self->_incompatibleViewController;
  if (!incompatibleViewController)
  {
    uint64_t v4 = [SKUIIncompatibleAppViewController alloc];
    uint64_t v5 = [(SKUIProductPage *)self->_productPage item];
    id v6 = [(SKUIIncompatibleAppViewController *)v4 initWithIncompatibleItem:v5];
    id v7 = self->_incompatibleViewController;
    self->_incompatibleViewController = v6;

    [(SKUIViewController *)self->_incompatibleViewController setClientContext:self->_clientContext];
    [(SKUIIncompatibleAppViewController *)self->_incompatibleViewController setOperationQueue:self->_operationQueue];
    [(SKUIIPadProductPageViewController *)self addChildViewController:self->_incompatibleViewController];
    uint64_t v8 = [(SKUIIncompatibleAppViewController *)self->_incompatibleViewController view];
    [v8 setAutoresizingMask:18];
    [(UIView *)self->_overlayView bounds];
    objc_msgSend(v8, "setFrame:");
    [(UIView *)self->_overlayView addSubview:v8];

    incompatibleViewController = self->_incompatibleViewController;
  }
  overlayView = self->_overlayView;
  id v10 = [(SKUIIncompatibleAppViewController *)incompatibleViewController view];
  [(UIView *)overlayView bringSubviewToFront:v10];
}

- (void)_showBanner
{
  if (!self->_banner)
  {
    double v3 = objc_alloc_init(SKUIMessageBanner);
    banner = self->_banner;
    self->_banner = v3;

    [(SKUIMessageBanner *)self->_banner setDelegate:self];
    uint64_t v5 = self->_banner;
    if (self->_bannerText)
    {
      -[SKUIMessageBanner setMessage:](self->_banner, "setMessage:");
    }
    else
    {
      id v6 = [(SKUIIPadProductPageViewController *)self clientContext];
      id v7 = [(SKUIIPadProductPageViewController *)self view];
      uint64_t v8 = [v7 tintColor];
      CGFloat v9 = SKUIMessageBannerAttributedString(v6, v8);
      [(SKUIMessageBanner *)v5 setAttributedMessage:v9];
    }
    id v10 = [(SKUIIPadProductPageViewController *)self view];
    [v10 addSubview:self->_banner];

    id v11 = [(SKUIIPadProductPageViewController *)self view];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;

    -[SKUIMessageBanner sizeThatFits:](self->_banner, "sizeThatFits:", 630.0, 630.0);
    -[SKUIMessageBanner setFrame:](self->_banner, "setFrame:", v13, v15, v16, v17);
    id v18 = [(SKUIIPadProductPageViewController *)self _viewControllerForSectionIndex:self->_selectedSectionIndex];
    [(SKUIIPadProductPageViewController *)self _showViewController:v18];
  }
}

- (void)_showViewController:(id)a3
{
  id v4 = a3;
  [(SKUIIPadProductPageViewController *)self _reloadHeaderViewController];
  id v7 = [v4 view];

  [(SKUIMessageBanner *)self->_banner frame];
  uint64_t v5 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
  [v5 frame];
  id v6 = [(SKUIProductPageHeaderViewController *)self->_headerViewController floatingView];
  [v6 frame];

  [(UIView *)self->_overlayView bounds];
  objc_msgSend(v7, "setFrame:");
  [(UIView *)self->_overlayView insertSubview:v7 atIndex:0];
  if ([(SKUIIPadProductPageViewController *)self _isIncompatibleItem]) {
    [(SKUIIPadProductPageViewController *)self _showIncompatibleView];
  }
}

- (id)_viewControllerForSectionIndex:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v5 = [(SKUIProductPage *)self->_productPage relatedContentSwooshes];
    uint64_t v6 = [v5 count];

    if (v6) {
      [(SKUIIPadProductPageViewController *)self _relatedViewController];
    }
    else {
    id v4 = [(SKUIIPadProductPageViewController *)self _placeholderViewController];
    }
  }
  else if (a3 == 1)
  {
    id v4 = [(SKUIIPadProductPageViewController *)self _reviewsViewController];
  }
  else if (a3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(SKUIIPadProductPageViewController *)self _detailsViewController];
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

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIIPadProductPageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIIPadProductPageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUIItem)item
{
  return self->_item;
}

- (SKUIProductPage)productPage
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

- (void)_initSKUIIPadProductPageViewController
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIPadProductPageViewController _initSKUIIPadProductPageViewController]";
}

@end