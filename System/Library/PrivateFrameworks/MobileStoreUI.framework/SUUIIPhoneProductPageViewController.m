@interface SUUIIPhoneProductPageViewController
- (BOOL)_isIncompatibleItem;
- (BOOL)askPermission;
- (CGPoint)topContentOffset;
- (NSString)bannerText;
- (NSURL)URL;
- (SUUIIPhoneProductPageDelegate)delegate;
- (SUUIIPhoneProductPageViewController)initWithItem:(id)a3;
- (SUUIIPhoneProductPageViewController)initWithItemIdentifier:(int64_t)a3;
- (SUUIIPhoneProductPageViewController)initWithProductPage:(id)a3;
- (SUUIIPhoneProductPageViewController)initWithURL:(id)a3;
- (SUUIIPhoneProductPageViewController)initWithURLRequest:(id)a3;
- (SUUIItem)item;
- (SUUIProductPage)productPage;
- (id)_detailsViewController;
- (id)_headerViewController;
- (id)_initSUUIIPhoneProductPageViewController;
- (id)_loadingViewController;
- (id)_relatedPlaceholderViewController;
- (id)_relatedViewController;
- (id)_reviewsViewController;
- (id)_viewControllerForSectionIndex:(unint64_t)a3;
- (id)activeMetricsController;
- (id)contentScrollView;
- (id)metricsControllerForProductPageHeader:(id)a3;
- (void)_animateAddToWishlist;
- (void)_hideBanner;
- (void)_invalidateChildViewControllers;
- (void)_metricsEnterEventNotification:(id)a3;
- (void)_presentHTMLProductPage;
- (void)_reloadChildViewControllers;
- (void)_setContentInsetsForChildViewController:(id)a3;
- (void)_setHeaderPositionForChildViewController:(id)a3;
- (void)_setMetricsController:(id)a3;
- (void)_setProductPage:(id)a3 error:(id)a4;
- (void)_setSectionIndexWithFragment:(int64_t)a3;
- (void)_shareButtonAction:(id)a3;
- (void)_showActivityViewController;
- (void)_showBanner;
- (void)_showError:(id)a3;
- (void)askPermissionBannerDidSelect:(id)a3;
- (void)configureMetricsWithPageEvent:(id)a3;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)loadView;
- (void)networkErrorViewControllerInvalidated:(id)a3;
- (void)productPageChildOpenItem:(id)a3;
- (void)productPageChildOpenURL:(id)a3 viewControllerBlock:(id)a4;
- (void)productPageChildViewControllerDidScroll:(id)a3;
- (void)productPageHeaderView:(id)a3 didReloadItemOffer:(id)a4;
- (void)productPageHeaderView:(id)a3 didSelectSectionIndex:(int64_t)a4;
- (void)productPageHeaderView:(id)a3 didSelectURL:(id)a4;
- (void)productViewControllerDidFinish:(id)a3;
- (void)reloadData;
- (void)setAskPermission:(BOOL)a3;
- (void)setBannerText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIIPhoneProductPageViewController

- (id)_initSUUIIPhoneProductPageViewController
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIIPhoneProductPageViewController;
  v2 = [(SUUIIPhoneProductPageViewController *)&v8 init];
  p_isa = (id *)&v2->super.super.super.super.isa;
  if (v2)
  {
    v2->_sectionIndex = 0;
    id v4 = objc_alloc_init(MEMORY[0x263F08A48]);
    id v5 = p_isa[146];
    p_isa[146] = v4;

    [p_isa[146] setMaxConcurrentOperationCount:6];
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:p_isa selector:sel__metricsEnterEventNotification_ name:@"SUUIMetricsDidRecordEnterEventNotification" object:0];
  }
  return p_isa;
}

- (SUUIIPhoneProductPageViewController)initWithItem:(id)a3
{
  id v5 = a3;
  v6 = [(SUUIIPhoneProductPageViewController *)self _initSUUIIPhoneProductPageViewController];
  v7 = v6;
  if (v6)
  {
    objc_super v8 = v6 + 140;
    objc_storeStrong(v6 + 140, a3);
    v7[144] = (id)[*v8 itemIdentifier];
    v9 = [v5 productPageURLString];
    if (v9)
    {
      v10 = (void *)MEMORY[0x263EFC630];
      v11 = [NSURL URLWithString:v9];
      uint64_t v12 = [v10 requestWithURL:v11];
      id v13 = v7[152];
      v7[152] = (id)v12;
    }
    uint64_t v14 = [*v8 itemKind];
    if (v14 != 5 && !SUUIItemKindIsSoftwareKind(v14))
    {
      v17 = objc_alloc_init(SUUIDismissingProductViewController);
      v18 = [v7[152] URL];
      [(SKStoreProductViewController *)v17 loadProductWithURL:v18 completionBlock:0];

      v19 = [MEMORY[0x263F82438] sharedApplication];
      v20 = [v19 keyWindow];
      v21 = [v20 rootViewController];
      [v21 presentViewController:v17 animated:1 completion:0];

      v15 = 0;
      goto LABEL_8;
    }
  }
  v15 = v7;
LABEL_8:

  return v15;
}

- (SUUIIPhoneProductPageViewController)initWithItemIdentifier:(int64_t)a3
{
  result = [(SUUIIPhoneProductPageViewController *)self _initSUUIIPhoneProductPageViewController];
  if (result) {
    result->_lookupItemIdentifier = a3;
  }
  return result;
}

- (SUUIIPhoneProductPageViewController)initWithProductPage:(id)a3
{
  id v5 = a3;
  v6 = [v5 item];
  v7 = [(SUUIIPhoneProductPageViewController *)self initWithItem:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_productPage, a3);
    -[SUUIIPhoneProductPageViewController _setSectionIndexWithFragment:](v7, "_setSectionIndexWithFragment:", [v5 defaultPageFragment]);
  }

  return v7;
}

- (SUUIIPhoneProductPageViewController)initWithURL:(id)a3
{
  id v4 = [MEMORY[0x263EFC630] requestWithURL:a3];
  id v5 = [(SUUIIPhoneProductPageViewController *)self initWithURLRequest:v4];

  return v5;
}

- (SUUIIPhoneProductPageViewController)initWithURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIIPhoneProductPageViewController *)self _initSUUIIPhoneProductPageViewController];
  if (v5)
  {
    v6 = [v4 URL];
    [(SUUIIPhoneProductPageViewController *)v5 _setSectionIndexWithFragment:SUUIProductPageFragmentWithURL(v6)];

    uint64_t v7 = [v4 copy];
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v7;
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUUIMetricsDidRecordEnterEventNotification" object:0];
  [(SUUIProductPageDetailsViewController *)self->_detailsViewController setDelegate:0];
  [(SUUINetworkErrorViewController *)self->_errorViewController setDelegate:0];
  [(SUUIIncompatibleAppViewController *)self->_incompatibleViewController setDelegate:0];
  [(SUUIProductPagePlaceholderViewController *)self->_relatedPlaceholderViewController setDelegate:0];
  [(SUUIProductPagePlaceholderViewController *)self->_loadingViewController setDelegate:0];
  [(SUUISwooshArrayViewController *)self->_relatedViewController setDelegate:0];
  [(SUUIProductPageReviewsViewController *)self->_reviewsViewController setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIIPhoneProductPageViewController;
  [(SUUIViewController *)&v4 dealloc];
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

- (void)setBannerText:(id)a3
{
  p_bannerText = &self->_bannerText;
  v6 = (NSString *)a3;
  if (*p_bannerText != v6)
  {
    objc_storeStrong((id *)&self->_bannerText, a3);
    if (*p_bannerText) {
      [(SUUIIPhoneProductPageViewController *)self _showBanner];
    }
  }
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
    v6 = [(SUUIViewController *)self clientContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__SUUIIPhoneProductPageViewController_configureMetricsWithPageEvent___block_invoke;
    v7[3] = &unk_265402C68;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [v6 getDefaultMetricsControllerWithCompletionBlock:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __69__SUUIIPhoneProductPageViewController_configureMetricsWithPageEvent___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _setMetricsController:v6];

  id v5 = [*(id *)(a1 + 32) pageURL];
  [v6 setPageURL:v5];

  [v6 recordEvent:*(void *)(a1 + 32)];
}

- (NSURL)URL
{
  return [(NSURLRequest *)self->_urlRequest URL];
}

- (void)reloadData
{
  v3 = [(SUUIViewController *)self clientContext];
  objc_initWeak(&location, self);
  if (!self->_metricsController)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke;
    v10[3] = &unk_265402C90;
    objc_copyWeak(&v11, &location);
    [v3 getDefaultMetricsControllerWithCompletionBlock:v10];
    objc_destroyWeak(&v11);
  }
  if (!self->_productPage && !self->_loadOperation)
  {
    if (self->_urlRequest)
    {
      id v4 = [[SUUILoadProductPageOperation alloc] initWithProductPageURLRequest:self->_urlRequest clientContext:v3];
    }
    else
    {
      if (!self->_lookupItemIdentifier) {
        goto LABEL_10;
      }
      id v4 = [[SUUILoadProductPageOperation alloc] initWithItemIdentifier:self->_lookupItemIdentifier clientContext:v3];
    }
    loadOperation = self->_loadOperation;
    self->_loadOperation = v4;

LABEL_10:
    id v6 = self->_loadOperation;
    if (v6)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke_2;
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

void __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setMetricsController:v3];
}

void __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke_3;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setProductPage:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (id)contentScrollView
{
  return 0;
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  metricsController = self->_metricsController;
  id v6 = SUUIMetricsWindowOrientationForInterfaceOrientation([(SUUIIPhoneProductPageViewController *)self interfaceOrientation]);
  [(SUUIMetricsController *)metricsController setWindowOrientation:v6];

  v7.receiver = self;
  v7.super_class = (Class)SUUIIPhoneProductPageViewController;
  [(SUUIIPhoneProductPageViewController *)&v7 didRotateFromInterfaceOrientation:a3];
}

- (void)loadView
{
  id v10 = objc_alloc_init(SUUIIPhoneProductPageView);
  -[SUUIIPhoneProductPageViewController setView:](self, "setView:");
  [(SUUIViewController *)self showDefaultNavigationItems];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:9 target:self action:sel__shareButtonAction_];
  objc_msgSend(v3, "setImageInsets:", -3.0, 0.0, 3.0, 0.0);
  id v4 = [(SUUIIPhoneProductPageViewController *)self navigationItem];
  id v5 = [v4 rightBarButtonItems];
  id v6 = (void *)[v5 mutableCopy];
  objc_super v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
  }
  id v9 = v8;

  [v9 addObject:v3];
  [v4 setRightBarButtonItems:v9];
}

- (void)viewDidLayoutSubviews
{
  if (!self->_childViewController)
  {
    [(SUUIIPhoneProductPageViewController *)self _reloadChildViewControllers];
    [(SUUIProductPageHeaderViewController *)self->_headerViewController reloadData];
  }
  v3.receiver = self;
  v3.super_class = (Class)SUUIIPhoneProductPageViewController;
  [(SUUIIPhoneProductPageViewController *)&v3 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      id v6 = [MEMORY[0x263EFF910] date];
      [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v6];

      [(SUUIMetricsController *)self->_metricsController recordEvent:self->_lastPageEvent];
    }
  }
  [(SUUIIPhoneProductPageViewController *)self reloadData];
  v7.receiver = self;
  v7.super_class = (Class)SUUIIPhoneProductPageViewController;
  [(SUUIViewController *)&v7 viewWillAppear:v3];
}

- (id)activeMetricsController
{
  return self->_metricsController;
}

- (void)networkErrorViewControllerInvalidated:(id)a3
{
  id v4 = a3;
  errorViewController = self->_errorViewController;
  if (errorViewController)
  {
    id v8 = v4;
    if (errorViewController == (SUUINetworkErrorViewController *)self->_childViewController)
    {
      self->_childViewController = 0;

      errorViewController = self->_errorViewController;
    }
    [(SUUINetworkErrorViewController *)errorViewController setDelegate:0];
    id v6 = [(SUUINetworkErrorViewController *)self->_errorViewController view];
    [v6 removeFromSuperview];

    [(SUUINetworkErrorViewController *)self->_errorViewController removeFromParentViewController];
    objc_super v7 = self->_errorViewController;
    self->_errorViewController = 0;

    [(SUUIIPhoneProductPageViewController *)self _reloadChildViewControllers];
    errorViewController = (SUUINetworkErrorViewController *)[(SUUIIPhoneProductPageViewController *)self reloadData];
    id v4 = v8;
  }
  MEMORY[0x270F9A758](errorViewController, v4);
}

- (id)metricsControllerForProductPageHeader:(id)a3
{
  return self->_metricsController;
}

- (void)productPageHeaderView:(id)a3 didReloadItemOffer:(id)a4
{
  id v17 = a3;
  uint64_t v5 = [v17 isViewLoaded];
  id v6 = v17;
  if (v5)
  {
    objc_super v7 = [v17 view];
    [v7 sizeToFit];

    id v8 = [(SUUIProductPageChildViewController *)self->_childViewController scrollView];
    id v9 = v8;
    if (v8)
    {
      [v8 contentOffset];
      double v11 = v10;
      double v13 = v12;
      [v9 contentInset];
      double v15 = v14;
      [(SUUIIPhoneProductPageViewController *)self _setContentInsetsForChildViewController:self->_childViewController];
      [(SUUIIPhoneProductPageViewController *)self _setHeaderPositionForChildViewController:self->_childViewController];
      [v9 contentInset];
      objc_msgSend(v9, "setContentOffset:", v11, v13 + v15 - v16);
    }

    id v6 = v17;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)productPageHeaderView:(id)a3 didSelectSectionIndex:(int64_t)a4
{
  if (self->_sectionIndex != a4)
  {
    self->_sectionIndex = a4;
    [(SUUIIPhoneProductPageViewController *)self _reloadChildViewControllers];
  }
}

- (void)productPageHeaderView:(id)a3 didSelectURL:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__SUUIIPhoneProductPageViewController_productPageHeaderView_didSelectURL___block_invoke;
  v7[3] = &unk_265402CE0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(SUUIIPhoneProductPageViewController *)self productPageChildOpenURL:v6 viewControllerBlock:v7];
}

SUUIStorePageViewController *__74__SUUIIPhoneProductPageViewController_productPageHeaderView_didSelectURL___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SUUIStorePageViewController);
  BOOL v3 = [*(id *)(a1 + 32) clientContext];
  [(SUUIStorePageViewController *)v2 setClientContext:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 1184) item];
  id v5 = [v4 artistName];
  [(SUUIStorePageViewController *)v2 setTitle:v5];

  [(SUUIStorePageViewController *)v2 loadURL:*(void *)(a1 + 40) withCompletionBlock:0];
  return v2;
}

- (void)askPermissionBannerDidSelect:(id)a3
{
  id v4 = a3;
  if (!self->_bannerText)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = SUUIAskPermissionFramework();
    id v6 = SUUIWeakLinkedClassForString(&cfstr_Prrequestqueue.isa, v5);
    objc_super v7 = (void *)SUUIAskPermissionFramework();
    id v8 = *(id *)SUUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v7);
    id v9 = [v6 _requestQueueForIdentifier:v8];
    int64_t v10 = [(SUUIItem *)self->_item itemIdentifier];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__SUUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke;
    v11[3] = &unk_265403980;
    objc_copyWeak(&v12, &location);
    [v9 _attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:v10 completionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __68__SUUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__SUUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke_2;
  v3[3] = &unk_265403610;
  char v5 = a3;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
}

void __68__SUUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _hideBanner];
  }
}

- (void)productPageChildOpenItem:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (id v6 = objc_loadWeakRetained((id *)&self->_delegate),
        int v7 = [v6 iPhoneProductPage:self shouldOpenItem:v11],
        v6,
        v7))
  {
    id v8 = [[SUUIIPhoneProductPageViewController alloc] initWithItem:v11];
    id v9 = [(SUUIViewController *)self clientContext];
    [(SUUIViewController *)v8 setClientContext:v9];

    int64_t v10 = [(SUUIIPhoneProductPageViewController *)self navigationController];
    [v10 pushViewController:v8 animated:1];
  }
}

- (void)productPageChildOpenURL:(id)a3 viewControllerBlock:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0
    || (id v9 = objc_loadWeakRetained((id *)&self->_delegate),
        int v10 = [v9 iPhoneProductPage:self shouldOpenURL:v14],
        v9,
        v10))
  {
    if (v6 && (v6[2](v6), (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v12 = (void *)v11;
      double v13 = [(SUUIIPhoneProductPageViewController *)self navigationController];
      [v13 pushViewController:v12 animated:1];
    }
    else
    {
      SUUIMetricsOpenURL(v14);
    }
  }
}

- (void)productPageChildViewControllerDidScroll:(id)a3
{
  if (self->_childViewController == a3) {
    -[SUUIIPhoneProductPageViewController _setHeaderPositionForChildViewController:](self, "_setHeaderPositionForChildViewController:");
  }
}

- (CGPoint)topContentOffset
{
  v2 = self;
  [(SUUIMessageBanner *)self->_banner frame];
  double v4 = v3;
  char v5 = [v2 clientContext];
  int v6 = SUUIUserInterfaceIdiom(v5) != 1;
  int v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  int v9 = (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (v6 == v9)
  {
    double v10 = 0.0;
  }
  else
  {
    v2 = [v2 navigationController];
    int v7 = [v2 navigationBar];
    [v7 frame];
  }
  int v11 = v6 ^ v9;
  double v12 = v4 + v10;
  double v13 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v15 = v12 + 0.0;
    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  double v16 = [MEMORY[0x263F82438] sharedApplication];
  [v16 statusBarFrame];
  double v17 = 20.0;
  if (v18 == 0.0) {
    double v17 = 0.0;
  }
  double v15 = v12 + v17;

  if (v11)
  {
LABEL_10:
  }
LABEL_11:

  double v19 = 0.0;
  double v20 = -49.0 - v15;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)productViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [v4 setDelegate:0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__SUUIIPhoneProductPageViewController_productViewControllerDidFinish___block_invoke;
  v5[3] = &unk_265401538;
  objc_copyWeak(&v6, &location);
  [v4 dismissViewControllerAnimated:1 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __70__SUUIIPhoneProductPageViewController_productViewControllerDidFinish___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained navigationController];
  id v4 = [v3 topViewController];
  id v5 = objc_loadWeakRetained(v1);

  id v6 = objc_loadWeakRetained(v1);
  id v9 = v6;
  if (v4 == v5)
  {
    int v7 = [v6 navigationController];
    id v8 = (id)[v7 popViewControllerAnimated:1];
  }
  else
  {
    [v6 dismissViewControllerAnimated:1 completion:0];
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
      int v7 = self->_lastPageEvent;
      [(SUUIMetricsController *)metricsController recordEvent:v7];
    }
  }
}

- (void)_shareButtonAction:(id)a3
{
  if (self->_productPage)
  {
    self->_wantsActivityViewController = 0;
    [(SUUIIPhoneProductPageViewController *)self _showActivityViewController];
  }
  else
  {
    self->_wantsActivityViewController = 1;
  }
}

- (void)_animateAddToWishlist
{
  id v8 = [(SUUIProductPageHeaderViewController *)self->_headerViewController iconImage];
  double v3 = [(SUUIIPhoneProductPageViewController *)self navigationController];
  id v4 = [v3 navigationBar];

  id v5 = [SUUIAddToWishlistAnimation alloc];
  id v6 = [(SUUIViewController *)self _wishlistButtonItem];
  int v7 = [(SUUIAddToWishlistAnimation *)v5 initWithImage:v8 buttonItem:v6 navigationBar:v4];

  [(SUUIAddToWishlistAnimation *)v7 animateWithCompletionBlock:0];
}

- (id)_detailsViewController
{
  detailsViewController = self->_detailsViewController;
  if (!detailsViewController)
  {
    if (self->_productPage)
    {
      id v4 = [[SUUIProductPageDetailsViewController alloc] initWithProductPage:self->_productPage];
      id v5 = self->_detailsViewController;
      self->_detailsViewController = v4;

      id v6 = self->_detailsViewController;
      int v7 = [(SUUIViewController *)self clientContext];
      [(SUUIProductPageDetailsViewController *)v6 setClientContext:v7];

      [(SUUIProductPageDetailsViewController *)self->_detailsViewController setDelegate:self];
      [(SUUIProductPageDetailsViewController *)self->_detailsViewController setOperationQueue:self->_operationQueue];
      [(SUUIProductPageDetailsViewController *)self->_detailsViewController setAskPermission:self->_askPermission];
      detailsViewController = self->_detailsViewController;
    }
    else
    {
      detailsViewController = 0;
    }
  }
  return detailsViewController;
}

- (id)_reviewsViewController
{
  reviewsViewController = self->_reviewsViewController;
  if (!reviewsViewController)
  {
    if (self->_productPage)
    {
      id v4 = [[SUUIProductPageReviewsViewController alloc] initWithProductPage:self->_productPage];
      id v5 = self->_reviewsViewController;
      self->_reviewsViewController = v4;

      id v6 = self->_reviewsViewController;
      int v7 = [(SUUIViewController *)self clientContext];
      [(SUUIProductPageReviewsViewController *)v6 setClientContext:v7];

      [(SUUIProductPageReviewsViewController *)self->_reviewsViewController setDelegate:self];
      [(SUUIProductPageReviewsViewController *)self->_reviewsViewController setAskPermission:self->_askPermission];
      reviewsViewController = self->_reviewsViewController;
    }
    else
    {
      reviewsViewController = 0;
    }
  }
  return reviewsViewController;
}

- (id)_relatedViewController
{
  double v3 = [(SUUIProductPage *)self->_productPage relatedContentSwooshes];
  id v4 = v3;
  if (!self->_relatedViewController && [v3 count])
  {
    id v5 = [[SUUISwooshArrayViewController alloc] initWithSwooshComponents:v4];
    relatedViewController = self->_relatedViewController;
    self->_relatedViewController = v5;

    int v7 = self->_relatedViewController;
    id v8 = [(SUUIProductPage *)self->_productPage uber];
    id v9 = [v8 colorScheme];
    [(SUUISwooshArrayViewController *)v7 setColorScheme:v9];

    double v10 = self->_relatedViewController;
    int v11 = [(SUUIViewController *)self clientContext];
    [(SUUISwooshArrayViewController *)v10 setClientContext:v11];

    [(SUUISwooshArrayViewController *)self->_relatedViewController setDelegate:self];
    [(SUUISwooshArrayViewController *)self->_relatedViewController setOperationQueue:self->_operationQueue];
    [(SUUISwooshArrayViewController *)self->_relatedViewController setMetricsController:self->_metricsController];
    [(SUUISwooshArrayViewController *)self->_relatedViewController setAskPermission:self->_askPermission];
  }
  double v12 = self->_relatedViewController;

  return v12;
}

- (void)_showBanner
{
  if (self->_banner) {
    return;
  }
  id v25 = [(SUUIIPhoneProductPageViewController *)self view];
  [(SUUIMessageBanner *)self->_banner frame];
  double v4 = v3;
  id v5 = [(SUUIViewController *)self clientContext];
  int v6 = SUUIUserInterfaceIdiom(v5) != 1;
  int v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  int v9 = (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (v6 == v9)
  {
    double v10 = 0.0;
  }
  else
  {
    int v7 = [(SUUIIPhoneProductPageViewController *)self navigationController];
    uint64_t v8 = [v7 navigationBar];
    [(id)v8 frame];
  }
  int v11 = v6 ^ v9;
  double v12 = v4 + v10;
  double v13 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [v25 setBannerOffset:v12 + 0.0];
    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
    double v15 = [MEMORY[0x263F82438] sharedApplication];
    [v15 statusBarFrame];
    double v16 = 20.0;
    if (v17 == 0.0) {
      double v16 = 0.0;
    }
    [v25 setBannerOffset:v12 + v16];

    if (!v11) {
      goto LABEL_12;
    }
  }

LABEL_12:
  double v18 = objc_alloc_init(SUUIMessageBanner);
  banner = self->_banner;
  self->_banner = v18;

  [(SUUIMessageBanner *)self->_banner setDelegate:self];
  double v20 = self->_banner;
  if (self->_bannerText)
  {
    -[SUUIMessageBanner setMessage:](self->_banner, "setMessage:");
  }
  else
  {
    v21 = [(SUUIViewController *)self clientContext];
    v22 = [(SUUIIPhoneProductPageViewController *)self view];
    v23 = [v22 tintColor];
    v24 = SUUIMessageBannerAttributedString(v21, v23);
    [(SUUIMessageBanner *)v20 setAttributedMessage:v24];
  }
  [v25 setBannerView:self->_banner];
  [v25 layoutSubviews];
  [(SUUIIPhoneProductPageViewController *)self _setContentInsetsForChildViewController:self->_childViewController];
  [(SUUIIPhoneProductPageViewController *)self _setHeaderPositionForChildViewController:self->_childViewController];
}

- (void)_hideBanner
{
  if (self->_banner)
  {
    double v3 = [(SUUIIPhoneProductPageViewController *)self view];
    [v3 setBannerView:0];

    double v4 = [(SUUIIPhoneProductPageViewController *)self view];
    [v4 layoutSubviews];

    [(SUUIMessageBanner *)self->_banner setDelegate:0];
    banner = self->_banner;
    self->_banner = 0;

    [(SUUIIPhoneProductPageViewController *)self _setContentInsetsForChildViewController:self->_childViewController];
    childViewController = self->_childViewController;
    [(SUUIIPhoneProductPageViewController *)self _setHeaderPositionForChildViewController:childViewController];
  }
}

- (id)_relatedPlaceholderViewController
{
  double v3 = [(SUUIProductPage *)self->_productPage relatedContentSwooshes];
  double v4 = v3;
  if (!self->_relatedPlaceholderViewController && ![v3 count])
  {
    id v5 = [[SUUIProductPagePlaceholderViewController alloc] initWithStyle:0];
    relatedPlaceholderViewController = self->_relatedPlaceholderViewController;
    self->_relatedPlaceholderViewController = v5;

    int v7 = self->_relatedPlaceholderViewController;
    uint64_t v8 = [(SUUIProductPage *)self->_productPage uber];
    int v9 = [v8 colorScheme];
    [(SUUIProductPagePlaceholderViewController *)v7 setColorScheme:v9];

    double v10 = self->_relatedPlaceholderViewController;
    int v11 = [(SUUIViewController *)self clientContext];
    [(SUUIProductPagePlaceholderViewController *)v10 setClientContext:v11];

    [(SUUIProductPagePlaceholderViewController *)self->_relatedPlaceholderViewController setDelegate:self];
  }
  double v12 = self->_relatedPlaceholderViewController;

  return v12;
}

- (id)_loadingViewController
{
  loadingViewController = self->_loadingViewController;
  if (!loadingViewController)
  {
    double v4 = [[SUUIProductPagePlaceholderViewController alloc] initWithStyle:1];
    id v5 = self->_loadingViewController;
    self->_loadingViewController = v4;

    int v6 = self->_loadingViewController;
    int v7 = [(SUUIProductPage *)self->_productPage uber];
    uint64_t v8 = [v7 colorScheme];
    [(SUUIProductPagePlaceholderViewController *)v6 setColorScheme:v8];

    int v9 = self->_loadingViewController;
    double v10 = [(SUUIViewController *)self clientContext];
    [(SUUIProductPagePlaceholderViewController *)v9 setClientContext:v10];

    [(SUUIProductPagePlaceholderViewController *)self->_loadingViewController setDelegate:self];
    loadingViewController = self->_loadingViewController;
  }
  return loadingViewController;
}

- (id)_headerViewController
{
  headerViewController = self->_headerViewController;
  if (!headerViewController)
  {
    if (self->_item)
    {
      double v4 = [[SUUIProductPageHeaderViewController alloc] initWithItem:self->_item];
      id v5 = self->_headerViewController;
      self->_headerViewController = v4;

      int v6 = self->_headerViewController;
      int v7 = [(SUUIViewController *)self clientContext];
      [(SUUIProductPageHeaderViewController *)v6 setClientContext:v7];

      [(SUUIProductPageHeaderViewController *)self->_headerViewController setDelegate:self];
      [(SUUIProductPageHeaderViewController *)self->_headerViewController setOperationQueue:self->_operationQueue];
      [(SUUIProductPageHeaderViewController *)self->_headerViewController setProductPage:self->_productPage];
      [(SUUIProductPageHeaderViewController *)self->_headerViewController setSelectedSectionIndex:self->_sectionIndex];
      [(SUUIProductPageHeaderViewController *)self->_headerViewController setAskPermission:self->_askPermission];
      headerViewController = self->_headerViewController;
    }
    else
    {
      headerViewController = 0;
    }
  }
  return headerViewController;
}

- (void)_invalidateChildViewControllers
{
  if ([(SUUIIPhoneProductPageViewController *)self isViewLoaded])
  {
    double v3 = [(SUUIIPhoneProductPageViewController *)self view];
    [v3 setView:0];
  }
  childViewController = self->_childViewController;
  self->_childViewController = 0;

  [(SUUIProductPageDetailsViewController *)self->_detailsViewController setDelegate:0];
  [(SUUIProductPageDetailsViewController *)self->_detailsViewController removeFromParentViewController];
  detailsViewController = self->_detailsViewController;
  self->_detailsViewController = 0;

  [(SUUIIncompatibleAppViewController *)self->_incompatibleViewController setDelegate:0];
  [(SUUIIncompatibleAppViewController *)self->_incompatibleViewController removeFromParentViewController];
  incompatibleViewController = self->_incompatibleViewController;
  self->_incompatibleViewController = 0;

  [(SUUIProductPagePlaceholderViewController *)self->_loadingViewController setDelegate:0];
  [(SUUIProductPagePlaceholderViewController *)self->_loadingViewController removeFromParentViewController];
  loadingViewController = self->_loadingViewController;
  self->_loadingViewController = 0;

  [(SUUIProductPagePlaceholderViewController *)self->_relatedPlaceholderViewController setDelegate:0];
  [(SUUIProductPagePlaceholderViewController *)self->_relatedPlaceholderViewController removeFromParentViewController];
  relatedPlaceholderViewController = self->_relatedPlaceholderViewController;
  self->_relatedPlaceholderViewController = 0;

  [(SUUISwooshArrayViewController *)self->_relatedViewController setDelegate:0];
  [(SUUISwooshArrayViewController *)self->_relatedViewController removeFromParentViewController];
  relatedViewController = self->_relatedViewController;
  self->_relatedViewController = 0;

  [(SUUIProductPageReviewsViewController *)self->_reviewsViewController setDelegate:0];
  [(SUUIProductPageReviewsViewController *)self->_reviewsViewController removeFromParentViewController];
  reviewsViewController = self->_reviewsViewController;
  self->_reviewsViewController = 0;
}

- (BOOL)_isIncompatibleItem
{
  double v3 = [(SUUIProductPage *)self->_productPage item];
  if ((v3 || (double v3 = self->_item) != 0)
    && (char v4 = [(SUUIItem *)v3 deviceFamilies], (v4 & 6) == 0))
  {
    char v6 = v4;
    int v7 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    BOOL v5 = (v6 & 1) == 0 || (v8 & 0xFFFFFFFFFFFFFFFBLL) != 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  if ([(SUUIItem *)v3 itemKind] == 5) {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_presentHTMLProductPage
{
  id v4 = objc_alloc_init(MEMORY[0x263F17FC8]);
  double v3 = [(NSURLRequest *)self->_urlRequest URL];
  [v4 loadProductWithURL:v3 completionBlock:0];

  [v4 setDelegate:self];
  [(SUUIIPhoneProductPageViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_reloadChildViewControllers
{
  v193 = [(SUUIIPhoneProductPageViewController *)self _viewControllerForSectionIndex:self->_sectionIndex];
  uint64_t v3 = [(SUUIIPhoneProductPageViewController *)self isViewLoaded];
  id v4 = v193;
  if (v3)
  {
    p_childViewController = &self->_childViewController;
    if ((SUUIIncompatibleAppViewController *)self->_childViewController != v193)
    {
      char v6 = [(SUUIIPhoneProductPageViewController *)self navigationItem];
      item = [(SUUIProductPage *)self->_productPage item];
      uint64_t v8 = item;
      if (!item) {
        item = self->_item;
      }
      int v9 = [item title];
      [v6 setBackButtonTitle:v9];

      double v10 = [(SUUIIPhoneProductPageViewController *)self view];
      int v11 = [(SUUIIPhoneProductPageViewController *)self _headerViewController];
      v192 = *p_childViewController;
      [(SUUIProductPageChildViewController *)v192 setHeaderViewController:0];
      [v10 setView:0];
      [(SUUIProductPageChildViewController *)v192 removeFromParentViewController];
      objc_storeStrong((id *)&self->_childViewController, v193);
      [(SUUIIPhoneProductPageViewController *)self addChildViewController:*p_childViewController];
      double v12 = [(SUUIProductPageChildViewController *)*p_childViewController view];
      [v10 setView:v12];

      [(SUUIProductPageChildViewController *)*p_childViewController setHeaderViewController:v11];
      [(SUUIIPhoneProductPageViewController *)self _setHeaderPositionForChildViewController:*p_childViewController];
      [(SUUIMessageBanner *)self->_banner frame];
      double v14 = v13;
      double v15 = [(SUUIViewController *)self clientContext];
      int v16 = SUUIUserInterfaceIdiom(v15) != 1;
      double v17 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v18 = [v17 userInterfaceIdiom];

      int v19 = (v18 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      v190 = v11;
      if (v16 == v19)
      {
        double v20 = 0.0;
      }
      else
      {
        uint64_t v18 = [(SUUIIPhoneProductPageViewController *)self navigationController];
        int v11 = [(id)v18 navigationBar];
        [v11 frame];
      }
      double v21 = v14 + v20;
      v22 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v23 = [v22 userInterfaceIdiom];

      unint64_t v24 = v23 & 0xFFFFFFFFFFFFFFFBLL;
      if (v24 == 1
        || ([MEMORY[0x263F82438] sharedApplication],
            v22 = objc_claimAutoreleasedReturnValue(),
            [v22 statusBarFrame],
            v25 == 0.0))
      {
        double v26 = 0.0;
      }
      else
      {
        double v26 = 20.0;
      }
      int v27 = v16 ^ v19;
      double v28 = v21 + v26;
      [(SUUIMessageBanner *)self->_banner frame];
      [v10 setBannerOffset:v28 - v29];
      if (v24 != 1) {

      }
      if (v27)
      {
      }
      v191 = v10;
      if (v192)
      {
        v30 = [(SUUIProductPageChildViewController *)v192 scrollView];
        [v30 contentOffset];
        double v32 = v31;
        double v34 = v33;
      }
      else
      {
        [(SUUIMessageBanner *)self->_banner frame];
        double v36 = v35;
        v30 = [(SUUIViewController *)self clientContext];
        int v37 = SUUIUserInterfaceIdiom(v30) != 1;
        v38 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v39 = [v38 userInterfaceIdiom];

        int v40 = (v39 & 0xFFFFFFFFFFFFFFFBLL) == 1;
        if (v37 == v40)
        {
          double v41 = 0.0;
        }
        else
        {
          uint64_t v39 = [(SUUIIPhoneProductPageViewController *)self navigationController];
          int v11 = [(id)v39 navigationBar];
          [v11 frame];
        }
        double v42 = v36 + v41;
        v43 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v44 = [v43 userInterfaceIdiom];

        unint64_t v45 = v44 & 0xFFFFFFFFFFFFFFFBLL;
        if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1
          || ([MEMORY[0x263F82438] sharedApplication],
              uint64_t v44 = objc_claimAutoreleasedReturnValue(),
              [(id)v44 statusBarFrame],
              v46 == 0.0))
        {
          double v47 = 0.0;
        }
        else
        {
          double v47 = 20.0;
        }
        v48 = (double *)MEMORY[0x263F00148];
        int v49 = v37 ^ v40;
        double v50 = -(v42 + v47);
        v51 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
        [v51 frame];
        double v53 = v50 - v52;

        if (v45 != 1) {
        double v32 = *v48;
        }
        double v34 = v53 + -49.0;
        p_childViewController = &self->_childViewController;
        if (v49)
        {
        }
      }

      [(SUUIMessageBanner *)self->_banner frame];
      double v55 = v54;
      v56 = [(SUUIViewController *)self clientContext];
      int v57 = SUUIUserInterfaceIdiom(v56) != 1;
      v58 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v59 = [v58 userInterfaceIdiom];

      int v60 = (v59 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      double v61 = 0.0;
      double v62 = 0.0;
      if (v57 != v60)
      {
        uint64_t v59 = [(SUUIIPhoneProductPageViewController *)self navigationController];
        int v11 = [(id)v59 navigationBar];
        [v11 frame];
      }
      int v63 = v57 ^ v60;
      double v64 = v55 + v62;
      v65 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v66 = [v65 userInterfaceIdiom];

      if ((v66 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        v67 = [MEMORY[0x263F82438] sharedApplication];
        [v67 statusBarFrame];
        if (v68 == 0.0) {
          double v61 = 0.0;
        }
        else {
          double v61 = 20.0;
        }
      }
      double v69 = -49.0 - (v64 + v61);
      if (v63)
      {
      }
      if (v34 > v69)
      {
        [(SUUIMessageBanner *)self->_banner frame];
        double v71 = v70;
        v72 = [(SUUIViewController *)self clientContext];
        int v73 = SUUIUserInterfaceIdiom(v72) != 1;
        v74 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v75 = [v74 userInterfaceIdiom];

        int v76 = (v75 & 0xFFFFFFFFFFFFFFFBLL) == 1;
        double v77 = 0.0;
        double v78 = 0.0;
        if (v73 != v76)
        {
          uint64_t v75 = [(SUUIIPhoneProductPageViewController *)self navigationController];
          int v11 = [(id)v75 navigationBar];
          [v11 frame];
        }
        int v79 = v73 ^ v76;
        double v80 = v71 + v78;
        v81 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v82 = [v81 userInterfaceIdiom];

        if ((v82 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          v83 = [MEMORY[0x263F82438] sharedApplication];
          [v83 statusBarFrame];
          if (v84 == 0.0) {
            double v77 = 0.0;
          }
          else {
            double v77 = 20.0;
          }
        }
        double v85 = v80 + v77;
        if (v79)
        {
        }
        double v34 = -49.0 - v85;
      }
      [(SUUIMessageBanner *)self->_banner frame];
      double v87 = v86;
      v88 = [(SUUIViewController *)self clientContext];
      int v89 = SUUIUserInterfaceIdiom(v88) != 1;
      v90 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v91 = [v90 userInterfaceIdiom];

      int v184 = (v91 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      int v185 = v89;
      double v188 = v34;
      if (v89 == v184)
      {
        double v93 = 0.0;
      }
      else
      {
        v179 = [(SUUIIPhoneProductPageViewController *)self navigationController];
        v178 = [v179 navigationBar];
        [v178 frame];
        double v93 = v92;
      }
      v94 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v95 = [v94 userInterfaceIdiom];

      unint64_t v183 = v95 & 0xFFFFFFFFFFFFFFFBLL;
      if ((v95 & 0xFFFFFFFFFFFFFFFBLL) == 1
        || ([MEMORY[0x263F82438] sharedApplication],
            v177 = objc_claimAutoreleasedReturnValue(),
            [v177 statusBarFrame],
            v96 == 0.0))
      {
        double v97 = 0.0;
      }
      else
      {
        double v97 = 20.0;
      }
      v182 = SUUIViewControllerGetAncestorTabBarController(self);
      v180 = [v182 tabBar];
      [v180 frame];
      double v99 = v98;
      v100 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
      [v100 frame];
      double v102 = v101;
      v103 = [(SUUIProductPageChildViewController *)*p_childViewController scrollView];
      [v103 contentSize];
      double v181 = v104;
      v105 = [MEMORY[0x263F82B60] mainScreen];
      [v105 bounds];
      double v186 = v106;
      [(SUUIMessageBanner *)self->_banner frame];
      double v108 = v107;
      v109 = [(SUUIViewController *)self clientContext];
      int v110 = SUUIUserInterfaceIdiom(v109) != 1;
      v111 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v112 = [v111 userInterfaceIdiom];

      int v113 = (v112 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      double v189 = v32;
      v187 = v88;
      if (v110 == v113)
      {
        double v115 = 0.0;
      }
      else
      {
        v176 = [(SUUIIPhoneProductPageViewController *)self navigationController];
        v175 = [v176 navigationBar];
        [v175 frame];
        double v115 = v114;
      }
      v116 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v117 = [v116 userInterfaceIdiom];

      unint64_t v118 = v117 & 0xFFFFFFFFFFFFFFFBLL;
      if ((v117 & 0xFFFFFFFFFFFFFFFBLL) == 1
        || ([MEMORY[0x263F82438] sharedApplication],
            v116 = objc_claimAutoreleasedReturnValue(),
            [v116 statusBarFrame],
            v119 == 0.0))
      {
        double v120 = 0.0;
      }
      else
      {
        double v120 = 20.0;
      }
      double v121 = v87 + v93;
      int v122 = v110 ^ v113;
      v123 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
      [v123 frame];
      double v125 = v124;

      if (v118 != 1) {
      double v126 = v121 + v97;
      }
      if (v122)
      {
      }
      double v127 = v126 + v99;

      if (v183 != 1) {
      double v128 = v127 + v102;
      }
      double v129 = v108 + v115;
      if (v185 != v184)
      {
      }
      double v130 = v129 + v120;

      [(SUUIMessageBanner *)self->_banner frame];
      double v132 = v131;
      v133 = [(SUUIViewController *)self clientContext];
      int v134 = SUUIUserInterfaceIdiom(v133) != 1;
      v135 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v136 = [v135 userInterfaceIdiom];

      int v137 = (v136 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      double v138 = 0.0;
      double v139 = 0.0;
      if (v134 != v137)
      {
        uint64_t v136 = [(SUUIIPhoneProductPageViewController *)self navigationController];
        v100 = [(id)v136 navigationBar];
        [v100 frame];
      }
      double v140 = v130 + v125;
      double v141 = v132 + v139;
      v142 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v143 = [v142 userInterfaceIdiom];

      unint64_t v144 = v143 & 0xFFFFFFFFFFFFFFFBLL;
      if ((v143 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        v142 = [MEMORY[0x263F82438] sharedApplication];
        [v142 statusBarFrame];
        if (v145 == 0.0) {
          double v138 = 0.0;
        }
        else {
          double v138 = 20.0;
        }
      }
      double v146 = v128 + v181 + 49.0 - v186;
      double v147 = v140 + 49.0;
      int v148 = v134 ^ v137;
      v149 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
      [v149 frame];
      double v151 = -(v141 + v138) - v150;

      if (v144 != 1) {
      double v152 = v146 - v147;
      }
      v153 = v191;
      if (v148)
      {
      }
      if (v152 < v151 + -49.0)
      {
        [(SUUIMessageBanner *)self->_banner frame];
        double v155 = v154;
        v156 = [(SUUIViewController *)self clientContext];
        int v157 = SUUIUserInterfaceIdiom(v156) != 1;
        v158 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v159 = [v158 userInterfaceIdiom];

        int v160 = (v159 & 0xFFFFFFFFFFFFFFFBLL) == 1;
        double v161 = 0.0;
        double v162 = 0.0;
        if (v157 != v160)
        {
          uint64_t v159 = [(SUUIIPhoneProductPageViewController *)self navigationController];
          v100 = [(id)v159 navigationBar];
          [v100 frame];
        }
        double v163 = v155 + v162;
        v164 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v165 = [v164 userInterfaceIdiom];

        unint64_t v166 = v165 & 0xFFFFFFFFFFFFFFFBLL;
        if ((v165 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          v164 = [MEMORY[0x263F82438] sharedApplication];
          [v164 statusBarFrame];
          if (v167 == 0.0) {
            double v161 = 0.0;
          }
          else {
            double v161 = 20.0;
          }
        }
        int v168 = v157 ^ v160;
        double v169 = -(v163 + v161);
        v170 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
        [v170 frame];
        double v172 = v171;

        if (v166 != 1) {
        double v173 = v169 - v172;
        }
        v153 = v191;
        if (v168)
        {
        }
        double v152 = v173 + -49.0;
      }
      if (v188 <= v152) {
        double v152 = v188;
      }
      v174 = [(SUUIProductPageChildViewController *)self->_childViewController scrollView];
      objc_msgSend(v174, "setContentOffset:", v189, v152);

      [v153 animateYPosition:v188 - v152];
      if (v193 == self->_incompatibleViewController) {
        [(SUUIIncompatibleAppViewController *)v193 reloadData];
      }

      id v4 = v193;
    }
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (void)_setContentInsetsForChildViewController:(id)a3
{
  id v4 = [a3 scrollView];
  if (v4)
  {
    id v50 = v4;
    BOOL v5 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
    [v5 frame];
    double v7 = v6;
    [(SUUIMessageBanner *)self->_banner frame];
    double v9 = v8;
    double v10 = [(SUUIViewController *)self clientContext];
    int v11 = SUUIUserInterfaceIdiom(v10) != 1;
    double v12 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    int v14 = (v13 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    double v15 = 0.0;
    double v16 = 0.0;
    if (v11 != v14)
    {
      uint64_t v13 = [(SUUIIPhoneProductPageViewController *)self navigationController];
      int v49 = [(id)v13 navigationBar];
      [v49 frame];
    }
    double v17 = v7 + 49.0;
    double v18 = v9 + v16;
    int v19 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    unint64_t v21 = v20 & 0xFFFFFFFFFFFFFFFBLL;
    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      int v19 = [MEMORY[0x263F82438] sharedApplication];
      [v19 statusBarFrame];
      if (v22 == 0.0) {
        double v15 = 0.0;
      }
      else {
        double v15 = 20.0;
      }
    }
    int v23 = v11 ^ v14;
    unint64_t v24 = SUUIViewControllerGetAncestorTabBarController(self);
    double v25 = [v24 tabBar];
    [v25 frame];
    objc_msgSend(v50, "setContentInset:", v17 + v18 + v15, 0.0, v26, 0.0);

    if (v21 != 1) {
    if (v23)
    }
    {
    }
    [(SUUIMessageBanner *)self->_banner frame];
    double v28 = v27;
    double v29 = [(SUUIViewController *)self clientContext];
    int v30 = SUUIUserInterfaceIdiom(v29) != 1;
    double v31 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v32 = [v31 userInterfaceIdiom];

    int v33 = (v32 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    double v34 = 0.0;
    double v35 = 0.0;
    if (v30 != v33)
    {
      double v31 = [(SUUIIPhoneProductPageViewController *)self navigationController];
      uint64_t v32 = [v31 navigationBar];
      [(id)v32 frame];
    }
    double v36 = v28 + v35;
    int v37 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v38 = [v37 userInterfaceIdiom];

    unint64_t v39 = v38 & 0xFFFFFFFFFFFFFFFBLL;
    if ((v38 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      int v37 = [MEMORY[0x263F82438] sharedApplication];
      [v37 statusBarFrame];
      if (v40 == 0.0) {
        double v34 = 0.0;
      }
      else {
        double v34 = 20.0;
      }
    }
    int v41 = v30 ^ v33;
    double v42 = SUUIViewControllerGetAncestorTabBarController(self);
    v43 = [v42 tabBar];
    [v43 frame];
    objc_msgSend(v50, "setScrollIndicatorInsets:", v36 + v34, 0.0, v44, 0.0);

    if (v39 != 1) {
    if (v41)
    }
    {
    }
    unint64_t v45 = [(SUUIProductPage *)self->_productPage uber];
    double v46 = [v45 colorScheme];
    double v47 = [v46 backgroundColor];
    if (v47)
    {
      SUUIScrollViewSetTopBackgroundColor(v50, v47);
    }
    else
    {
      v48 = [MEMORY[0x263F825C8] whiteColor];
      SUUIScrollViewSetTopBackgroundColor(v50, v48);
    }
    SUUIScrollViewLayoutTopBackgroundColorForProductPage(v50, 0.0);
    id v4 = v50;
  }
}

- (void)_setHeaderPositionForChildViewController:(id)a3
{
  id v24 = [a3 scrollView];
  [v24 contentOffset];
  double v5 = v4;
  double v6 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
  double v7 = [(SUUIProductPageHeaderViewController *)self->_headerViewController floatingView];
  [v24 contentInset];
  double v9 = v8;
  double v10 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
  [v10 frame];
  double v12 = v9 - v11 + -49.0;

  [v7 frame];
  objc_msgSend(v7, "setFrame:");
  [v6 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  int v19 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
  [v19 frame];
  double v21 = -(v20 + 49.0);

  objc_msgSend(v6, "setFrame:", v14, v21, v16, v18);
  double v22 = 0.0;
  double v23 = 0.0;
  if (v5 > -(v12 + 49.0)) {
    double v23 = (v5 + 49.0 + v12) / 49.0;
  }
  if (v23 < 1.0) {
    double v22 = 1.0 - v23;
  }
  [v7 setBackdropAlpha:v22];
}

- (void)_setMetricsController:(id)a3
{
  id v5 = a3;
  p_metricsController = &self->_metricsController;
  if (!self->_metricsController)
  {
    id v23 = v5;
    double v7 = [(SUUIProductPage *)self->_productPage metricsConfiguration];
    objc_storeStrong((id *)&self->_metricsController, a3);
    [(SUUIMetricsController *)*p_metricsController setPageConfiguration:v7];
    double v8 = *p_metricsController;
    double v9 = [(SUUIProductPage *)self->_productPage pageURL];
    double v10 = [v9 absoluteString];
    [(SUUIMetricsController *)v8 setPageURL:v10];

    double v11 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v12 = [v11 statusBarOrientation];

    double v13 = *p_metricsController;
    double v14 = SUUIMetricsWindowOrientationForInterfaceOrientation(v12);
    [(SUUIMetricsController *)v13 setWindowOrientation:v14];

    double v15 = [(SUUIViewController *)self clientContext];
    double v16 = *p_metricsController;
    double v17 = [v15 clientInterface];
    double v18 = [v17 clientIdentifier];
    [(SUUIMetricsController *)v16 setApplicationIdentifier:v18];

    int v19 = *p_metricsController;
    double v20 = [v15 metricsPageContextForViewController:self];
    [(SUUIMetricsController *)v19 setPageContext:v20];

    [(SUUISwooshArrayViewController *)self->_relatedViewController setMetricsController:*p_metricsController];
    double v21 = *p_metricsController;
    double v22 = [v7 pingURLs];
    [(SUUIMetricsController *)v21 pingURLs:v22 withClientContext:v15];

    id v5 = v23;
  }
}

- (void)_setProductPage:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [(SUUILoadProductPageOperation *)self->_loadOperation metricsPageEvent];
  [(SUUILoadProductPageOperation *)self->_loadOperation setOutputBlock:0];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  double v11 = [v7 ITMLData];

  if (v11)
  {
    uint64_t v12 = [(SUUIViewController *)self clientContext];
    double v13 = [v7 ITMLData];
    double v14 = [v7 ITMLResponse];
    [v12 sendOnPageResponseWithDocument:0 data:v13 URLResponse:v14 performanceMetrics:0];
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    p_productPage = &self->_productPage;
    objc_storeStrong((id *)&self->_productPage, a3);
    uint64_t v12 = [(SUUIProductPage *)self->_productPage metricsConfiguration];
    [(SUUIMetricsController *)self->_metricsController setPageConfiguration:v12];
    metricsController = self->_metricsController;
    double v17 = [(SUUIProductPage *)self->_productPage pageURL];
    double v18 = [v17 absoluteString];
    [(SUUIMetricsController *)metricsController setPageURL:v18];

    if (!self->_item)
    {
      int v19 = [(SUUIProductPage *)*p_productPage item];
      item = self->_item;
      self->_item = v19;
    }
    [(SUUIProductPageHeaderViewController *)self->_headerViewController setProductPage:*p_productPage];
    if ([(SUUIProductPageHeaderViewController *)self->_headerViewController isViewLoaded])
    {
      double v21 = [(SUUIProductPageHeaderViewController *)self->_headerViewController view];
      [v21 sizeToFit];
    }
    [(SUUIIPhoneProductPageViewController *)self _invalidateChildViewControllers];
    [(SUUIIPhoneProductPageViewController *)self _reloadChildViewControllers];
    [(SUUIProductPageHeaderViewController *)self->_headerViewController reloadData];
    dispatch_time_t v22 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SUUIIPhoneProductPageViewController__setProductPage_error___block_invoke;
    block[3] = &unk_265400980;
    void block[4] = self;
    dispatch_after(v22, MEMORY[0x263EF83A0], block);
    if (v9)
    {
      id v23 = [MEMORY[0x263EFF910] date];
      [v23 timeIntervalSince1970];
      objc_msgSend(v9, "setPageRenderTime:");

      [(SUUIMetricsController *)self->_metricsController recordEvent:v9];
      objc_storeStrong((id *)&self->_lastPageEvent, v9);
    }
    if (self->_wantsActivityViewController) {
      [(SUUIIPhoneProductPageViewController *)self _showActivityViewController];
    }
    id v24 = self->_metricsController;
    double v25 = [v12 pingURLs];
    double v26 = [(SUUIViewController *)self clientContext];
    [(SUUIMetricsController *)v24 pingURLs:v25 withClientContext:v26];
  }
LABEL_14:
  if (v8)
  {
    double v27 = [v8 domain];
    if ([v27 isEqualToString:@"SUUIErrorDomain"])
    {
      uint64_t v28 = [v8 code];

      if (v28 == 1)
      {
        [(SUUIIPhoneProductPageViewController *)self _presentHTMLProductPage];
        goto LABEL_20;
      }
    }
    else
    {
    }
    [(SUUIIPhoneProductPageViewController *)self _showError:v8];
  }
LABEL_20:
}

void __61__SUUIIPhoneProductPageViewController__setProductPage_error___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _reviewsViewController];
  [v1 reloadData];
}

- (void)_setSectionIndexWithFragment:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    self->_sectionIndex = a3;
  }
}

- (void)_showError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_errorViewController)
  {
    id v12 = v4;
    id v4 = (id)+[SUUINetworkErrorViewController canDisplayError:v4];
    id v5 = v12;
    if (v4)
    {
      [(SUUIProductPageChildViewController *)self->_childViewController setHeaderViewController:0];
      [(SUUIProductPageChildViewController *)self->_childViewController removeFromParentViewController];
      double v6 = [[SUUINetworkErrorViewController alloc] initWithError:v12];
      errorViewController = self->_errorViewController;
      self->_errorViewController = v6;

      id v8 = self->_errorViewController;
      double v9 = [(SUUIViewController *)self clientContext];
      [(SUUINetworkErrorViewController *)v8 setClientContext:v9];

      [(SUUINetworkErrorViewController *)self->_errorViewController setDelegate:self];
      objc_storeStrong((id *)&self->_childViewController, self->_errorViewController);
      [(SUUIIPhoneProductPageViewController *)self addChildViewController:self->_childViewController];
      double v10 = [(SUUIIPhoneProductPageViewController *)self view];
      double v11 = [(SUUINetworkErrorViewController *)self->_errorViewController view];
      [v11 setAutoresizingMask:18];
      [v10 bounds];
      objc_msgSend(v11, "setFrame:");
      [v10 addSubview:v11];

      id v5 = v12;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_showActivityViewController
{
  uint64_t v3 = [SUUIProductPageActivityViewController alloc];
  id v4 = [(SUUIProductPage *)self->_productPage item];
  id v5 = [(SUUIViewController *)self clientContext];
  double v6 = [(SUUIProductPageActivityViewController *)v3 initWithProductPageItem:v4 clientContext:v5];

  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  double v9 = __66__SUUIIPhoneProductPageViewController__showActivityViewController__block_invoke;
  double v10 = &unk_265402E28;
  objc_copyWeak(&v11, &location);
  [(SUUIProductPageActivityViewController *)v6 setCompletionWithItemsHandler:&v7];
  -[SUUIIPhoneProductPageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0, v7, v8, v9, v10);
  self->_wantsActivityViewController = 0;
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __66__SUUIIPhoneProductPageViewController__showActivityViewController__block_invoke(uint64_t a1, void *a2, int a3)
{
  if (a3 && [a2 isEqualToString:0x270506330])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _animateAddToWishlist];
  }
}

- (id)_viewControllerForSectionIndex:(unint64_t)a3
{
  if (!self->_item) {
    goto LABEL_11;
  }
  if ([(SUUIIPhoneProductPageViewController *)self _isIncompatibleItem])
  {
    incompatibleViewController = self->_incompatibleViewController;
    if (!incompatibleViewController)
    {
      double v6 = [SUUIIncompatibleAppViewController alloc];
      uint64_t v7 = [(SUUIProductPage *)self->_productPage item];
      uint64_t v8 = [(SUUIIncompatibleAppViewController *)v6 initWithIncompatibleItem:v7];
      double v9 = self->_incompatibleViewController;
      self->_incompatibleViewController = v8;

      double v10 = self->_incompatibleViewController;
      id v11 = [(SUUIViewController *)self clientContext];
      [(SUUIViewController *)v10 setClientContext:v11];

      [(SUUIIncompatibleAppViewController *)self->_incompatibleViewController setDelegate:self];
      [(SUUIIncompatibleAppViewController *)self->_incompatibleViewController setOperationQueue:self->_operationQueue];
      incompatibleViewController = self->_incompatibleViewController;
    }
    id v12 = incompatibleViewController;
    goto LABEL_18;
  }
  productPage = self->_productPage;
  if (!productPage)
  {
    id v12 = [(SUUIIPhoneProductPageViewController *)self _loadingViewController];
    goto LABEL_18;
  }
  if (a3 == 2)
  {
    double v15 = [(SUUIProductPage *)productPage relatedContentSwooshes];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      double v17 = [(SUUIIPhoneProductPageViewController *)self _relatedViewController];
      if ([v17 isSkLoaded])
      {
        id v14 = v17;
      }
      else
      {
        id v14 = [(SUUIIPhoneProductPageViewController *)self _loadingViewController];
        [v17 loadMissingItemData];
      }

      goto LABEL_19;
    }
    id v12 = [(SUUIIPhoneProductPageViewController *)self _relatedPlaceholderViewController];
    goto LABEL_18;
  }
  if (a3 == 1)
  {
    id v12 = [(SUUIIPhoneProductPageViewController *)self _reviewsViewController];
    goto LABEL_18;
  }
  if (a3)
  {
LABEL_11:
    id v14 = 0;
    goto LABEL_19;
  }
  id v12 = [(SUUIIPhoneProductPageViewController *)self _detailsViewController];
LABEL_18:
  id v14 = v12;
LABEL_19:
  return v14;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (NSString)bannerText
{
  return self->_bannerText;
}

- (SUUIIPhoneProductPageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIIPhoneProductPageDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_relatedPlaceholderViewController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_lastPageEvent, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_incompatibleViewController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_errorViewController, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_bannerText, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end