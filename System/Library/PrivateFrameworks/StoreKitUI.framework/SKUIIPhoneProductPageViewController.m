@interface SKUIIPhoneProductPageViewController
- (BOOL)_isIncompatibleItem;
- (BOOL)askPermission;
- (CGPoint)topContentOffset;
- (NSString)bannerText;
- (NSURL)URL;
- (SKUIIPhoneProductPageDelegate)delegate;
- (SKUIIPhoneProductPageViewController)initWithItem:(id)a3;
- (SKUIIPhoneProductPageViewController)initWithItemIdentifier:(int64_t)a3;
- (SKUIIPhoneProductPageViewController)initWithProductPage:(id)a3;
- (SKUIIPhoneProductPageViewController)initWithURL:(id)a3;
- (SKUIIPhoneProductPageViewController)initWithURLRequest:(id)a3;
- (SKUIItem)item;
- (SKUIProductPage)productPage;
- (id)_detailsViewController;
- (id)_headerViewController;
- (id)_initSKUIIPhoneProductPageViewController;
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
- (void)_initSKUIIPhoneProductPageViewController;
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

@implementation SKUIIPhoneProductPageViewController

- (id)_initSKUIIPhoneProductPageViewController
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPhoneProductPageViewController _initSKUIIPhoneProductPageViewController]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIIPhoneProductPageViewController;
  v3 = [(SKUIIPhoneProductPageViewController *)&v9 init];
  p_isa = (id *)&v3->super.super.super.super.isa;
  if (v3)
  {
    v3->_sectionIndex = 0;
    id v5 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v6 = p_isa[146];
    p_isa[146] = v5;

    [p_isa[146] setMaxConcurrentOperationCount:6];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:p_isa selector:sel__metricsEnterEventNotification_ name:@"SKUIMetricsDidRecordEnterEventNotification" object:0];
  }
  return p_isa;
}

- (SKUIIPhoneProductPageViewController)initWithItem:(id)a3
{
  id v5 = a3;
  id v6 = [(SKUIIPhoneProductPageViewController *)self _initSKUIIPhoneProductPageViewController];
  v7 = v6;
  if (v6)
  {
    v8 = v6 + 140;
    objc_storeStrong(v6 + 140, a3);
    v7[144] = (id)[*v8 itemIdentifier];
    objc_super v9 = [v5 productPageURLString];
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E4F18DA8];
      v11 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
      uint64_t v12 = [v10 requestWithURL:v11];
      id v13 = v7[152];
      v7[152] = (id)v12;
    }
    uint64_t v14 = [*v8 itemKind];
    if (v14 != 5 && !SKUIItemKindIsSoftwareKind(v14))
    {
      v17 = objc_alloc_init(SKUIDismissingProductViewController);
      v18 = [v7[152] URL];
      [(SKStoreProductViewController *)v17 loadProductWithURL:v18 completionBlock:0];

      v19 = [MEMORY[0x1E4FB1438] sharedApplication];
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

- (SKUIIPhoneProductPageViewController)initWithItemIdentifier:(int64_t)a3
{
  result = [(SKUIIPhoneProductPageViewController *)self _initSKUIIPhoneProductPageViewController];
  if (result) {
    result->_lookupItemIdentifier = a3;
  }
  return result;
}

- (SKUIIPhoneProductPageViewController)initWithProductPage:(id)a3
{
  id v5 = a3;
  id v6 = [v5 item];
  v7 = [(SKUIIPhoneProductPageViewController *)self initWithItem:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_productPage, a3);
    -[SKUIIPhoneProductPageViewController _setSectionIndexWithFragment:](v7, "_setSectionIndexWithFragment:", [v5 defaultPageFragment]);
  }

  return v7;
}

- (SKUIIPhoneProductPageViewController)initWithURL:(id)a3
{
  v4 = [MEMORY[0x1E4F18DA8] requestWithURL:a3];
  id v5 = [(SKUIIPhoneProductPageViewController *)self initWithURLRequest:v4];

  return v5;
}

- (SKUIIPhoneProductPageViewController)initWithURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIIPhoneProductPageViewController *)self _initSKUIIPhoneProductPageViewController];
  if (v5)
  {
    id v6 = [v4 URL];
    [(SKUIIPhoneProductPageViewController *)v5 _setSectionIndexWithFragment:SKUIProductPageFragmentWithURL(v6)];

    uint64_t v7 = [v4 copy];
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v7;
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SKUIMetricsDidRecordEnterEventNotification" object:0];
  [(SKUIProductPageDetailsViewController *)self->_detailsViewController setDelegate:0];
  [(SKUINetworkErrorViewController *)self->_errorViewController setDelegate:0];
  [(SKUIIncompatibleAppViewController *)self->_incompatibleViewController setDelegate:0];
  [(SKUIProductPagePlaceholderViewController *)self->_relatedPlaceholderViewController setDelegate:0];
  [(SKUIProductPagePlaceholderViewController *)self->_loadingViewController setDelegate:0];
  [(SKUISwooshArrayViewController *)self->_relatedViewController setDelegate:0];
  [(SKUIProductPageReviewsViewController *)self->_reviewsViewController setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIIPhoneProductPageViewController;
  [(SKUIViewController *)&v4 dealloc];
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

- (void)setBannerText:(id)a3
{
  p_bannerText = &self->_bannerText;
  id v6 = (NSString *)a3;
  if (*p_bannerText != v6)
  {
    objc_storeStrong((id *)&self->_bannerText, a3);
    if (*p_bannerText) {
      [(SKUIIPhoneProductPageViewController *)self _showBanner];
    }
  }
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
    id v6 = [(SKUIViewController *)self clientContext];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__SKUIIPhoneProductPageViewController_configureMetricsWithPageEvent___block_invoke;
    v7[3] = &unk_1E6428390;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [v6 getDefaultMetricsControllerWithCompletionBlock:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __69__SKUIIPhoneProductPageViewController_configureMetricsWithPageEvent___block_invoke(uint64_t a1, void *a2)
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
  v3 = [(SKUIViewController *)self clientContext];
  objc_initWeak(&location, self);
  if (!self->_metricsController)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__SKUIIPhoneProductPageViewController_reloadData__block_invoke;
    v10[3] = &unk_1E64253A8;
    objc_copyWeak(&v11, &location);
    [v3 getDefaultMetricsControllerWithCompletionBlock:v10];
    objc_destroyWeak(&v11);
  }
  if (!self->_productPage && !self->_loadOperation)
  {
    if (self->_urlRequest)
    {
      id v4 = [[SKUILoadProductPageOperation alloc] initWithProductPageURLRequest:self->_urlRequest clientContext:v3];
    }
    else
    {
      if (!self->_lookupItemIdentifier) {
        goto LABEL_10;
      }
      id v4 = [[SKUILoadProductPageOperation alloc] initWithItemIdentifier:self->_lookupItemIdentifier clientContext:v3];
    }
    loadOperation = self->_loadOperation;
    self->_loadOperation = v4;

LABEL_10:
    id v6 = self->_loadOperation;
    if (v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__SKUIIPhoneProductPageViewController_reloadData__block_invoke_2;
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

void __49__SKUIIPhoneProductPageViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setMetricsController:v3];
}

void __49__SKUIIPhoneProductPageViewController_reloadData__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SKUIIPhoneProductPageViewController_reloadData__block_invoke_3;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __49__SKUIIPhoneProductPageViewController_reloadData__block_invoke_3(uint64_t a1)
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
  id v6 = SKUIMetricsWindowOrientationForInterfaceOrientation([(SKUIIPhoneProductPageViewController *)self interfaceOrientation]);
  [(SKUIMetricsController *)metricsController setWindowOrientation:v6];

  v7.receiver = self;
  v7.super_class = (Class)SKUIIPhoneProductPageViewController;
  [(SKUIIPhoneProductPageViewController *)&v7 didRotateFromInterfaceOrientation:a3];
}

- (void)loadView
{
  id v10 = objc_alloc_init(SKUIIPhoneProductPageView);
  -[SKUIIPhoneProductPageViewController setView:](self, "setView:");
  [(SKUIViewController *)self showDefaultNavigationItems];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel__shareButtonAction_];
  objc_msgSend(v3, "setImageInsets:", -3.0, 0.0, 3.0, 0.0);
  id v4 = [(SKUIIPhoneProductPageViewController *)self navigationItem];
  id v5 = [v4 rightBarButtonItems];
  id v6 = (void *)[v5 mutableCopy];
  objc_super v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
  }
  id v9 = v8;

  [v9 addObject:v3];
  [v4 setRightBarButtonItems:v9];
}

- (void)viewDidLayoutSubviews
{
  if (!self->_childViewController)
  {
    [(SKUIIPhoneProductPageViewController *)self _reloadChildViewControllers];
    [(SKUIProductPageHeaderViewController *)self->_headerViewController reloadData];
  }
  v3.receiver = self;
  v3.super_class = (Class)SKUIIPhoneProductPageViewController;
  [(SKUIIPhoneProductPageViewController *)&v3 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      id v6 = [MEMORY[0x1E4F1C9C8] date];
      [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v6];

      [(SKUIMetricsController *)self->_metricsController recordEvent:self->_lastPageEvent];
    }
  }
  [(SKUIIPhoneProductPageViewController *)self reloadData];
  v7.receiver = self;
  v7.super_class = (Class)SKUIIPhoneProductPageViewController;
  [(SKUIViewController *)&v7 viewWillAppear:v3];
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
    if (errorViewController == (SKUINetworkErrorViewController *)self->_childViewController)
    {
      self->_childViewController = 0;

      errorViewController = self->_errorViewController;
    }
    [(SKUINetworkErrorViewController *)errorViewController setDelegate:0];
    id v6 = [(SKUINetworkErrorViewController *)self->_errorViewController view];
    [v6 removeFromSuperview];

    [(SKUINetworkErrorViewController *)self->_errorViewController removeFromParentViewController];
    objc_super v7 = self->_errorViewController;
    self->_errorViewController = 0;

    [(SKUIIPhoneProductPageViewController *)self _reloadChildViewControllers];
    errorViewController = (SKUINetworkErrorViewController *)[(SKUIIPhoneProductPageViewController *)self reloadData];
    id v4 = v8;
  }

  MEMORY[0x1F41817F8](errorViewController, v4);
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

    id v8 = [(SKUIProductPageChildViewController *)self->_childViewController scrollView];
    id v9 = v8;
    if (v8)
    {
      [v8 contentOffset];
      double v11 = v10;
      double v13 = v12;
      [v9 contentInset];
      double v15 = v14;
      [(SKUIIPhoneProductPageViewController *)self _setContentInsetsForChildViewController:self->_childViewController];
      [(SKUIIPhoneProductPageViewController *)self _setHeaderPositionForChildViewController:self->_childViewController];
      [v9 contentInset];
      objc_msgSend(v9, "setContentOffset:", v11, v13 + v15 - v16);
    }

    id v6 = v17;
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)productPageHeaderView:(id)a3 didSelectSectionIndex:(int64_t)a4
{
  if (self->_sectionIndex != a4)
  {
    self->_sectionIndex = a4;
    [(SKUIIPhoneProductPageViewController *)self _reloadChildViewControllers];
  }
}

- (void)productPageHeaderView:(id)a3 didSelectURL:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SKUIIPhoneProductPageViewController_productPageHeaderView_didSelectURL___block_invoke;
  v7[3] = &unk_1E64283E0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(SKUIIPhoneProductPageViewController *)self productPageChildOpenURL:v6 viewControllerBlock:v7];
}

SKUIStorePageViewController *__74__SKUIIPhoneProductPageViewController_productPageHeaderView_didSelectURL___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SKUIStorePageViewController);
  BOOL v3 = [*(id *)(a1 + 32) clientContext];
  [(SKUIStorePageViewController *)v2 setClientContext:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 1184) item];
  id v5 = [v4 artistName];
  [(SKUIStorePageViewController *)v2 setTitle:v5];

  [(SKUIStorePageViewController *)v2 loadURL:*(void *)(a1 + 40) withCompletionBlock:0];

  return v2;
}

- (void)askPermissionBannerDidSelect:(id)a3
{
  id v4 = a3;
  if (!self->_bannerText)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = SKUIAskPermissionFramework();
    id v6 = SKUIWeakLinkedClassForString(&cfstr_Prrequestqueue.isa, v5);
    objc_super v7 = (void *)SKUIAskPermissionFramework();
    id v8 = *(id *)SKUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v7);
    id v9 = [v6 _requestQueueForIdentifier:v8];
    int64_t v10 = [(SKUIItem *)self->_item itemIdentifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__SKUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke;
    v11[3] = &unk_1E64284F0;
    objc_copyWeak(&v12, &location);
    [v9 _attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:v10 completionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __68__SKUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__SKUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke_2;
  v3[3] = &unk_1E6427D08;
  char v5 = a3;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __68__SKUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke_2(uint64_t a1)
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
    id v8 = [[SKUIIPhoneProductPageViewController alloc] initWithItem:v11];
    id v9 = [(SKUIViewController *)self clientContext];
    [(SKUIViewController *)v8 setClientContext:v9];

    int64_t v10 = [(SKUIIPhoneProductPageViewController *)self navigationController];
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
      double v13 = [(SKUIIPhoneProductPageViewController *)self navigationController];
      [v13 pushViewController:v12 animated:1];
    }
    else
    {
      SKUIMetricsOpenURL(v14);
    }
  }
}

- (void)productPageChildViewControllerDidScroll:(id)a3
{
  if (self->_childViewController == a3) {
    -[SKUIIPhoneProductPageViewController _setHeaderPositionForChildViewController:](self, "_setHeaderPositionForChildViewController:");
  }
}

- (CGPoint)topContentOffset
{
  v2 = self;
  [(SKUIMessageBanner *)self->_banner frame];
  double v4 = v3;
  char v5 = [v2 clientContext];
  int v6 = SKUIUserInterfaceIdiom(v5) != 1;
  int v7 = [MEMORY[0x1E4FB16C8] currentDevice];
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
  double v13 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v15 = v12 + 0.0;
    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  double v16 = [MEMORY[0x1E4FB1438] sharedApplication];
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
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SKUIIPhoneProductPageViewController_productViewControllerDidFinish___block_invoke;
  v5[3] = &unk_1E6422250;
  objc_copyWeak(&v6, &location);
  [v4 dismissViewControllerAnimated:1 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __70__SKUIIPhoneProductPageViewController_productViewControllerDidFinish___block_invoke(uint64_t a1)
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
  if (SKUIViewControllerIsVisible(self))
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      id v5 = [MEMORY[0x1E4F1C9C8] date];
      [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v5];

      metricsController = self->_metricsController;
      int v7 = self->_lastPageEvent;
      [(SKUIMetricsController *)metricsController recordEvent:v7];
    }
  }
}

- (void)_shareButtonAction:(id)a3
{
  if (self->_productPage)
  {
    self->_wantsActivityViewController = 0;
    [(SKUIIPhoneProductPageViewController *)self _showActivityViewController];
  }
  else
  {
    self->_wantsActivityViewController = 1;
  }
}

- (void)_animateAddToWishlist
{
  id v8 = [(SKUIProductPageHeaderViewController *)self->_headerViewController iconImage];
  double v3 = [(SKUIIPhoneProductPageViewController *)self navigationController];
  id v4 = [v3 navigationBar];

  id v5 = [SKUIAddToWishlistAnimation alloc];
  id v6 = [(SKUIViewController *)self _wishlistButtonItem];
  int v7 = [(SKUIAddToWishlistAnimation *)v5 initWithImage:v8 buttonItem:v6 navigationBar:v4];

  [(SKUIAddToWishlistAnimation *)v7 animateWithCompletionBlock:0];
}

- (id)_detailsViewController
{
  detailsViewController = self->_detailsViewController;
  if (!detailsViewController)
  {
    if (self->_productPage)
    {
      id v4 = [[SKUIProductPageDetailsViewController alloc] initWithProductPage:self->_productPage];
      id v5 = self->_detailsViewController;
      self->_detailsViewController = v4;

      id v6 = self->_detailsViewController;
      int v7 = [(SKUIViewController *)self clientContext];
      [(SKUIProductPageDetailsViewController *)v6 setClientContext:v7];

      [(SKUIProductPageDetailsViewController *)self->_detailsViewController setDelegate:self];
      [(SKUIProductPageDetailsViewController *)self->_detailsViewController setOperationQueue:self->_operationQueue];
      [(SKUIProductPageDetailsViewController *)self->_detailsViewController setAskPermission:self->_askPermission];
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
      id v4 = [[SKUIProductPageReviewsViewController alloc] initWithProductPage:self->_productPage];
      id v5 = self->_reviewsViewController;
      self->_reviewsViewController = v4;

      id v6 = self->_reviewsViewController;
      int v7 = [(SKUIViewController *)self clientContext];
      [(SKUIProductPageReviewsViewController *)v6 setClientContext:v7];

      [(SKUIProductPageReviewsViewController *)self->_reviewsViewController setDelegate:self];
      [(SKUIProductPageReviewsViewController *)self->_reviewsViewController setAskPermission:self->_askPermission];
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
  double v3 = [(SKUIProductPage *)self->_productPage relatedContentSwooshes];
  id v4 = v3;
  if (!self->_relatedViewController && [v3 count])
  {
    id v5 = [[SKUISwooshArrayViewController alloc] initWithSwooshComponents:v4];
    relatedViewController = self->_relatedViewController;
    self->_relatedViewController = v5;

    int v7 = self->_relatedViewController;
    id v8 = [(SKUIProductPage *)self->_productPage uber];
    id v9 = [v8 colorScheme];
    [(SKUISwooshArrayViewController *)v7 setColorScheme:v9];

    double v10 = self->_relatedViewController;
    int v11 = [(SKUIViewController *)self clientContext];
    [(SKUISwooshArrayViewController *)v10 setClientContext:v11];

    [(SKUISwooshArrayViewController *)self->_relatedViewController setDelegate:self];
    [(SKUISwooshArrayViewController *)self->_relatedViewController setOperationQueue:self->_operationQueue];
    [(SKUISwooshArrayViewController *)self->_relatedViewController setMetricsController:self->_metricsController];
    [(SKUISwooshArrayViewController *)self->_relatedViewController setAskPermission:self->_askPermission];
  }
  double v12 = self->_relatedViewController;

  return v12;
}

- (void)_showBanner
{
  if (self->_banner) {
    return;
  }
  id v25 = [(SKUIIPhoneProductPageViewController *)self view];
  [(SKUIMessageBanner *)self->_banner frame];
  double v4 = v3;
  id v5 = [(SKUIViewController *)self clientContext];
  int v6 = SKUIUserInterfaceIdiom(v5) != 1;
  int v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  int v9 = (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (v6 == v9)
  {
    double v10 = 0.0;
  }
  else
  {
    int v7 = [(SKUIIPhoneProductPageViewController *)self navigationController];
    uint64_t v8 = [v7 navigationBar];
    [(id)v8 frame];
  }
  int v11 = v6 ^ v9;
  double v12 = v4 + v10;
  double v13 = [MEMORY[0x1E4FB16C8] currentDevice];
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
    double v15 = [MEMORY[0x1E4FB1438] sharedApplication];
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
  double v18 = objc_alloc_init(SKUIMessageBanner);
  banner = self->_banner;
  self->_banner = v18;

  [(SKUIMessageBanner *)self->_banner setDelegate:self];
  double v20 = self->_banner;
  if (self->_bannerText)
  {
    -[SKUIMessageBanner setMessage:](self->_banner, "setMessage:");
  }
  else
  {
    v21 = [(SKUIViewController *)self clientContext];
    v22 = [(SKUIIPhoneProductPageViewController *)self view];
    v23 = [v22 tintColor];
    v24 = SKUIMessageBannerAttributedString(v21, v23);
    [(SKUIMessageBanner *)v20 setAttributedMessage:v24];
  }
  [v25 setBannerView:self->_banner];
  [v25 layoutSubviews];
  [(SKUIIPhoneProductPageViewController *)self _setContentInsetsForChildViewController:self->_childViewController];
  [(SKUIIPhoneProductPageViewController *)self _setHeaderPositionForChildViewController:self->_childViewController];
}

- (void)_hideBanner
{
  if (self->_banner)
  {
    double v3 = [(SKUIIPhoneProductPageViewController *)self view];
    [v3 setBannerView:0];

    double v4 = [(SKUIIPhoneProductPageViewController *)self view];
    [v4 layoutSubviews];

    [(SKUIMessageBanner *)self->_banner setDelegate:0];
    banner = self->_banner;
    self->_banner = 0;

    [(SKUIIPhoneProductPageViewController *)self _setContentInsetsForChildViewController:self->_childViewController];
    childViewController = self->_childViewController;
    [(SKUIIPhoneProductPageViewController *)self _setHeaderPositionForChildViewController:childViewController];
  }
}

- (id)_relatedPlaceholderViewController
{
  double v3 = [(SKUIProductPage *)self->_productPage relatedContentSwooshes];
  double v4 = v3;
  if (!self->_relatedPlaceholderViewController && ![v3 count])
  {
    id v5 = [[SKUIProductPagePlaceholderViewController alloc] initWithStyle:0];
    relatedPlaceholderViewController = self->_relatedPlaceholderViewController;
    self->_relatedPlaceholderViewController = v5;

    int v7 = self->_relatedPlaceholderViewController;
    uint64_t v8 = [(SKUIProductPage *)self->_productPage uber];
    int v9 = [v8 colorScheme];
    [(SKUIProductPagePlaceholderViewController *)v7 setColorScheme:v9];

    double v10 = self->_relatedPlaceholderViewController;
    int v11 = [(SKUIViewController *)self clientContext];
    [(SKUIProductPagePlaceholderViewController *)v10 setClientContext:v11];

    [(SKUIProductPagePlaceholderViewController *)self->_relatedPlaceholderViewController setDelegate:self];
  }
  double v12 = self->_relatedPlaceholderViewController;

  return v12;
}

- (id)_loadingViewController
{
  loadingViewController = self->_loadingViewController;
  if (!loadingViewController)
  {
    double v4 = [[SKUIProductPagePlaceholderViewController alloc] initWithStyle:1];
    id v5 = self->_loadingViewController;
    self->_loadingViewController = v4;

    int v6 = self->_loadingViewController;
    int v7 = [(SKUIProductPage *)self->_productPage uber];
    uint64_t v8 = [v7 colorScheme];
    [(SKUIProductPagePlaceholderViewController *)v6 setColorScheme:v8];

    int v9 = self->_loadingViewController;
    double v10 = [(SKUIViewController *)self clientContext];
    [(SKUIProductPagePlaceholderViewController *)v9 setClientContext:v10];

    [(SKUIProductPagePlaceholderViewController *)self->_loadingViewController setDelegate:self];
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
      double v4 = [[SKUIProductPageHeaderViewController alloc] initWithItem:self->_item];
      id v5 = self->_headerViewController;
      self->_headerViewController = v4;

      int v6 = self->_headerViewController;
      int v7 = [(SKUIViewController *)self clientContext];
      [(SKUIProductPageHeaderViewController *)v6 setClientContext:v7];

      [(SKUIProductPageHeaderViewController *)self->_headerViewController setDelegate:self];
      [(SKUIProductPageHeaderViewController *)self->_headerViewController setOperationQueue:self->_operationQueue];
      [(SKUIProductPageHeaderViewController *)self->_headerViewController setProductPage:self->_productPage];
      [(SKUIProductPageHeaderViewController *)self->_headerViewController setSelectedSectionIndex:self->_sectionIndex];
      [(SKUIProductPageHeaderViewController *)self->_headerViewController setAskPermission:self->_askPermission];
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
  if ([(SKUIIPhoneProductPageViewController *)self isViewLoaded])
  {
    double v3 = [(SKUIIPhoneProductPageViewController *)self view];
    [v3 setView:0];
  }
  childViewController = self->_childViewController;
  self->_childViewController = 0;

  [(SKUIProductPageDetailsViewController *)self->_detailsViewController setDelegate:0];
  [(SKUIProductPageDetailsViewController *)self->_detailsViewController removeFromParentViewController];
  detailsViewController = self->_detailsViewController;
  self->_detailsViewController = 0;

  [(SKUIIncompatibleAppViewController *)self->_incompatibleViewController setDelegate:0];
  [(SKUIIncompatibleAppViewController *)self->_incompatibleViewController removeFromParentViewController];
  incompatibleViewController = self->_incompatibleViewController;
  self->_incompatibleViewController = 0;

  [(SKUIProductPagePlaceholderViewController *)self->_loadingViewController setDelegate:0];
  [(SKUIProductPagePlaceholderViewController *)self->_loadingViewController removeFromParentViewController];
  loadingViewController = self->_loadingViewController;
  self->_loadingViewController = 0;

  [(SKUIProductPagePlaceholderViewController *)self->_relatedPlaceholderViewController setDelegate:0];
  [(SKUIProductPagePlaceholderViewController *)self->_relatedPlaceholderViewController removeFromParentViewController];
  relatedPlaceholderViewController = self->_relatedPlaceholderViewController;
  self->_relatedPlaceholderViewController = 0;

  [(SKUISwooshArrayViewController *)self->_relatedViewController setDelegate:0];
  [(SKUISwooshArrayViewController *)self->_relatedViewController removeFromParentViewController];
  relatedViewController = self->_relatedViewController;
  self->_relatedViewController = 0;

  [(SKUIProductPageReviewsViewController *)self->_reviewsViewController setDelegate:0];
  [(SKUIProductPageReviewsViewController *)self->_reviewsViewController removeFromParentViewController];
  reviewsViewController = self->_reviewsViewController;
  self->_reviewsViewController = 0;
}

- (BOOL)_isIncompatibleItem
{
  double v3 = [(SKUIProductPage *)self->_productPage item];
  if ((v3 || (double v3 = self->_item) != 0)
    && (char v4 = [(SKUIItem *)v3 deviceFamilies], (v4 & 6) == 0))
  {
    char v6 = v4;
    int v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    BOOL v5 = (v6 & 1) == 0 || (v8 & 0xFFFFFFFFFFFFFFFBLL) != 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  if ([(SKUIItem *)v3 itemKind] == 5) {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_presentHTMLProductPage
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F3C310]);
  double v3 = [(NSURLRequest *)self->_urlRequest URL];
  [v4 loadProductWithURL:v3 completionBlock:0];

  [v4 setDelegate:self];
  [(SKUIIPhoneProductPageViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_reloadChildViewControllers
{
  v193 = [(SKUIIPhoneProductPageViewController *)self _viewControllerForSectionIndex:self->_sectionIndex];
  uint64_t v3 = [(SKUIIPhoneProductPageViewController *)self isViewLoaded];
  id v4 = v193;
  if (v3)
  {
    p_childViewController = &self->_childViewController;
    if ((SKUIIncompatibleAppViewController *)self->_childViewController != v193)
    {
      char v6 = [(SKUIIPhoneProductPageViewController *)self navigationItem];
      item = [(SKUIProductPage *)self->_productPage item];
      uint64_t v8 = item;
      if (!item) {
        item = self->_item;
      }
      int v9 = [item title];
      [v6 setBackButtonTitle:v9];

      double v10 = [(SKUIIPhoneProductPageViewController *)self view];
      int v11 = [(SKUIIPhoneProductPageViewController *)self _headerViewController];
      v192 = *p_childViewController;
      [(SKUIProductPageChildViewController *)v192 setHeaderViewController:0];
      [v10 setView:0];
      [(SKUIProductPageChildViewController *)v192 removeFromParentViewController];
      objc_storeStrong((id *)&self->_childViewController, v193);
      [(SKUIIPhoneProductPageViewController *)self addChildViewController:*p_childViewController];
      double v12 = [(SKUIProductPageChildViewController *)*p_childViewController view];
      [v10 setView:v12];

      [(SKUIProductPageChildViewController *)*p_childViewController setHeaderViewController:v11];
      [(SKUIIPhoneProductPageViewController *)self _setHeaderPositionForChildViewController:*p_childViewController];
      [(SKUIMessageBanner *)self->_banner frame];
      double v14 = v13;
      double v15 = [(SKUIViewController *)self clientContext];
      int v16 = SKUIUserInterfaceIdiom(v15) != 1;
      double v17 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v18 = [v17 userInterfaceIdiom];

      int v19 = (v18 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      v190 = v11;
      if (v16 == v19)
      {
        double v20 = 0.0;
      }
      else
      {
        uint64_t v18 = [(SKUIIPhoneProductPageViewController *)self navigationController];
        int v11 = [(id)v18 navigationBar];
        [v11 frame];
      }
      double v21 = v14 + v20;
      v22 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v23 = [v22 userInterfaceIdiom];

      unint64_t v24 = v23 & 0xFFFFFFFFFFFFFFFBLL;
      if (v24 == 1
        || ([MEMORY[0x1E4FB1438] sharedApplication],
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
      [(SKUIMessageBanner *)self->_banner frame];
      [v10 setBannerOffset:v28 - v29];
      if (v24 != 1) {

      }
      if (v27)
      {
      }
      v191 = v10;
      if (v192)
      {
        v30 = [(SKUIProductPageChildViewController *)v192 scrollView];
        [v30 contentOffset];
        double v32 = v31;
        double v34 = v33;
      }
      else
      {
        [(SKUIMessageBanner *)self->_banner frame];
        double v36 = v35;
        v30 = [(SKUIViewController *)self clientContext];
        int v37 = SKUIUserInterfaceIdiom(v30) != 1;
        v38 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v39 = [v38 userInterfaceIdiom];

        int v40 = (v39 & 0xFFFFFFFFFFFFFFFBLL) == 1;
        if (v37 == v40)
        {
          double v41 = 0.0;
        }
        else
        {
          uint64_t v39 = [(SKUIIPhoneProductPageViewController *)self navigationController];
          int v11 = [(id)v39 navigationBar];
          [v11 frame];
        }
        double v42 = v36 + v41;
        v43 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v44 = [v43 userInterfaceIdiom];

        unint64_t v45 = v44 & 0xFFFFFFFFFFFFFFFBLL;
        if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1
          || ([MEMORY[0x1E4FB1438] sharedApplication],
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
        v48 = (double *)MEMORY[0x1E4F1DAD8];
        int v49 = v37 ^ v40;
        double v50 = -(v42 + v47);
        v51 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
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

      [(SKUIMessageBanner *)self->_banner frame];
      double v55 = v54;
      v56 = [(SKUIViewController *)self clientContext];
      int v57 = SKUIUserInterfaceIdiom(v56) != 1;
      v58 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v59 = [v58 userInterfaceIdiom];

      int v60 = (v59 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      double v61 = 0.0;
      double v62 = 0.0;
      if (v57 != v60)
      {
        uint64_t v59 = [(SKUIIPhoneProductPageViewController *)self navigationController];
        int v11 = [(id)v59 navigationBar];
        [v11 frame];
      }
      int v63 = v57 ^ v60;
      double v64 = v55 + v62;
      v65 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v66 = [v65 userInterfaceIdiom];

      if ((v66 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        v67 = [MEMORY[0x1E4FB1438] sharedApplication];
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
        [(SKUIMessageBanner *)self->_banner frame];
        double v71 = v70;
        v72 = [(SKUIViewController *)self clientContext];
        int v73 = SKUIUserInterfaceIdiom(v72) != 1;
        v74 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v75 = [v74 userInterfaceIdiom];

        int v76 = (v75 & 0xFFFFFFFFFFFFFFFBLL) == 1;
        double v77 = 0.0;
        double v78 = 0.0;
        if (v73 != v76)
        {
          uint64_t v75 = [(SKUIIPhoneProductPageViewController *)self navigationController];
          int v11 = [(id)v75 navigationBar];
          [v11 frame];
        }
        int v79 = v73 ^ v76;
        double v80 = v71 + v78;
        v81 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v82 = [v81 userInterfaceIdiom];

        if ((v82 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          v83 = [MEMORY[0x1E4FB1438] sharedApplication];
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
      [(SKUIMessageBanner *)self->_banner frame];
      double v87 = v86;
      v88 = [(SKUIViewController *)self clientContext];
      int v89 = SKUIUserInterfaceIdiom(v88) != 1;
      v90 = [MEMORY[0x1E4FB16C8] currentDevice];
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
        v179 = [(SKUIIPhoneProductPageViewController *)self navigationController];
        v178 = [v179 navigationBar];
        [v178 frame];
        double v93 = v92;
      }
      v94 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v95 = [v94 userInterfaceIdiom];

      unint64_t v183 = v95 & 0xFFFFFFFFFFFFFFFBLL;
      if ((v95 & 0xFFFFFFFFFFFFFFFBLL) == 1
        || ([MEMORY[0x1E4FB1438] sharedApplication],
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
      v182 = SKUIViewControllerGetAncestorTabBarController(self);
      v180 = [v182 tabBar];
      [v180 frame];
      double v99 = v98;
      v100 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
      [v100 frame];
      double v102 = v101;
      v103 = [(SKUIProductPageChildViewController *)*p_childViewController scrollView];
      [v103 contentSize];
      double v181 = v104;
      v105 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v105 bounds];
      double v186 = v106;
      [(SKUIMessageBanner *)self->_banner frame];
      double v108 = v107;
      v109 = [(SKUIViewController *)self clientContext];
      int v110 = SKUIUserInterfaceIdiom(v109) != 1;
      v111 = [MEMORY[0x1E4FB16C8] currentDevice];
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
        v176 = [(SKUIIPhoneProductPageViewController *)self navigationController];
        v175 = [v176 navigationBar];
        [v175 frame];
        double v115 = v114;
      }
      v116 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v117 = [v116 userInterfaceIdiom];

      unint64_t v118 = v117 & 0xFFFFFFFFFFFFFFFBLL;
      if ((v117 & 0xFFFFFFFFFFFFFFFBLL) == 1
        || ([MEMORY[0x1E4FB1438] sharedApplication],
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
      v123 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
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

      [(SKUIMessageBanner *)self->_banner frame];
      double v132 = v131;
      v133 = [(SKUIViewController *)self clientContext];
      int v134 = SKUIUserInterfaceIdiom(v133) != 1;
      v135 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v136 = [v135 userInterfaceIdiom];

      int v137 = (v136 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      double v138 = 0.0;
      double v139 = 0.0;
      if (v134 != v137)
      {
        uint64_t v136 = [(SKUIIPhoneProductPageViewController *)self navigationController];
        v100 = [(id)v136 navigationBar];
        [v100 frame];
      }
      double v140 = v130 + v125;
      double v141 = v132 + v139;
      v142 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v143 = [v142 userInterfaceIdiom];

      unint64_t v144 = v143 & 0xFFFFFFFFFFFFFFFBLL;
      if ((v143 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        v142 = [MEMORY[0x1E4FB1438] sharedApplication];
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
      v149 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
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
        [(SKUIMessageBanner *)self->_banner frame];
        double v155 = v154;
        v156 = [(SKUIViewController *)self clientContext];
        int v157 = SKUIUserInterfaceIdiom(v156) != 1;
        v158 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v159 = [v158 userInterfaceIdiom];

        int v160 = (v159 & 0xFFFFFFFFFFFFFFFBLL) == 1;
        double v161 = 0.0;
        double v162 = 0.0;
        if (v157 != v160)
        {
          uint64_t v159 = [(SKUIIPhoneProductPageViewController *)self navigationController];
          v100 = [(id)v159 navigationBar];
          [v100 frame];
        }
        double v163 = v155 + v162;
        v164 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v165 = [v164 userInterfaceIdiom];

        unint64_t v166 = v165 & 0xFFFFFFFFFFFFFFFBLL;
        if ((v165 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          v164 = [MEMORY[0x1E4FB1438] sharedApplication];
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
        v170 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
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
      v174 = [(SKUIProductPageChildViewController *)self->_childViewController scrollView];
      objc_msgSend(v174, "setContentOffset:", v189, v152);

      [v153 animateYPosition:v188 - v152];
      if (v193 == self->_incompatibleViewController) {
        [(SKUIIncompatibleAppViewController *)v193 reloadData];
      }

      id v4 = v193;
    }
  }

  MEMORY[0x1F41817F8](v3, v4);
}

- (void)_setContentInsetsForChildViewController:(id)a3
{
  id v4 = [a3 scrollView];
  if (v4)
  {
    id v50 = v4;
    BOOL v5 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
    [v5 frame];
    double v7 = v6;
    [(SKUIMessageBanner *)self->_banner frame];
    double v9 = v8;
    double v10 = [(SKUIViewController *)self clientContext];
    int v11 = SKUIUserInterfaceIdiom(v10) != 1;
    double v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    int v14 = (v13 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    double v15 = 0.0;
    double v16 = 0.0;
    if (v11 != v14)
    {
      uint64_t v13 = [(SKUIIPhoneProductPageViewController *)self navigationController];
      int v49 = [(id)v13 navigationBar];
      [v49 frame];
    }
    double v17 = v7 + 49.0;
    double v18 = v9 + v16;
    int v19 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    unint64_t v21 = v20 & 0xFFFFFFFFFFFFFFFBLL;
    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      int v19 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v19 statusBarFrame];
      if (v22 == 0.0) {
        double v15 = 0.0;
      }
      else {
        double v15 = 20.0;
      }
    }
    int v23 = v11 ^ v14;
    unint64_t v24 = SKUIViewControllerGetAncestorTabBarController(self);
    double v25 = [v24 tabBar];
    [v25 frame];
    objc_msgSend(v50, "setContentInset:", v17 + v18 + v15, 0.0, v26, 0.0);

    if (v21 != 1) {
    if (v23)
    }
    {
    }
    [(SKUIMessageBanner *)self->_banner frame];
    double v28 = v27;
    double v29 = [(SKUIViewController *)self clientContext];
    int v30 = SKUIUserInterfaceIdiom(v29) != 1;
    double v31 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v32 = [v31 userInterfaceIdiom];

    int v33 = (v32 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    double v34 = 0.0;
    double v35 = 0.0;
    if (v30 != v33)
    {
      double v31 = [(SKUIIPhoneProductPageViewController *)self navigationController];
      uint64_t v32 = [v31 navigationBar];
      [(id)v32 frame];
    }
    double v36 = v28 + v35;
    int v37 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v38 = [v37 userInterfaceIdiom];

    unint64_t v39 = v38 & 0xFFFFFFFFFFFFFFFBLL;
    if ((v38 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      int v37 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v37 statusBarFrame];
      if (v40 == 0.0) {
        double v34 = 0.0;
      }
      else {
        double v34 = 20.0;
      }
    }
    int v41 = v30 ^ v33;
    double v42 = SKUIViewControllerGetAncestorTabBarController(self);
    v43 = [v42 tabBar];
    [v43 frame];
    objc_msgSend(v50, "setScrollIndicatorInsets:", v36 + v34, 0.0, v44, 0.0);

    if (v39 != 1) {
    if (v41)
    }
    {
    }
    unint64_t v45 = [(SKUIProductPage *)self->_productPage uber];
    double v46 = [v45 colorScheme];
    double v47 = [v46 backgroundColor];
    if (v47)
    {
      SKUIScrollViewSetTopBackgroundColor(v50, v47);
    }
    else
    {
      v48 = [MEMORY[0x1E4FB1618] whiteColor];
      SKUIScrollViewSetTopBackgroundColor(v50, v48);
    }
    SKUIScrollViewLayoutTopBackgroundColorForProductPage(v50, 0.0);
    id v4 = v50;
  }
}

- (void)_setHeaderPositionForChildViewController:(id)a3
{
  id v24 = [a3 scrollView];
  [v24 contentOffset];
  double v5 = v4;
  double v6 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
  double v7 = [(SKUIProductPageHeaderViewController *)self->_headerViewController floatingView];
  [v24 contentInset];
  double v9 = v8;
  double v10 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
  [v10 frame];
  double v12 = v9 - v11 + -49.0;

  [v7 frame];
  objc_msgSend(v7, "setFrame:");
  [v6 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  int v19 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
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
    double v7 = [(SKUIProductPage *)self->_productPage metricsConfiguration];
    objc_storeStrong((id *)&self->_metricsController, a3);
    [(SKUIMetricsController *)*p_metricsController setPageConfiguration:v7];
    double v8 = *p_metricsController;
    double v9 = [(SKUIProductPage *)self->_productPage pageURL];
    double v10 = [v9 absoluteString];
    [(SKUIMetricsController *)v8 setPageURL:v10];

    double v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v12 = [v11 statusBarOrientation];

    double v13 = *p_metricsController;
    double v14 = SKUIMetricsWindowOrientationForInterfaceOrientation(v12);
    [(SKUIMetricsController *)v13 setWindowOrientation:v14];

    double v15 = [(SKUIViewController *)self clientContext];
    double v16 = *p_metricsController;
    double v17 = [v15 clientInterface];
    double v18 = [v17 clientIdentifier];
    [(SKUIMetricsController *)v16 setApplicationIdentifier:v18];

    int v19 = *p_metricsController;
    double v20 = [v15 metricsPageContextForViewController:self];
    [(SKUIMetricsController *)v19 setPageContext:v20];

    [(SKUISwooshArrayViewController *)self->_relatedViewController setMetricsController:*p_metricsController];
    double v21 = *p_metricsController;
    double v22 = [v7 pingURLs];
    [(SKUIMetricsController *)v21 pingURLs:v22 withClientContext:v15];

    id v5 = v23;
  }
}

- (void)_setProductPage:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [(SKUILoadProductPageOperation *)self->_loadOperation metricsPageEvent];
  [(SKUILoadProductPageOperation *)self->_loadOperation setOutputBlock:0];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  double v11 = [v7 ITMLData];

  if (v11)
  {
    uint64_t v12 = [(SKUIViewController *)self clientContext];
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
    uint64_t v12 = [(SKUIProductPage *)self->_productPage metricsConfiguration];
    [(SKUIMetricsController *)self->_metricsController setPageConfiguration:v12];
    metricsController = self->_metricsController;
    double v17 = [(SKUIProductPage *)self->_productPage pageURL];
    double v18 = [v17 absoluteString];
    [(SKUIMetricsController *)metricsController setPageURL:v18];

    if (!self->_item)
    {
      int v19 = [(SKUIProductPage *)*p_productPage item];
      item = self->_item;
      self->_item = v19;
    }
    [(SKUIProductPageHeaderViewController *)self->_headerViewController setProductPage:*p_productPage];
    if ([(SKUIProductPageHeaderViewController *)self->_headerViewController isViewLoaded])
    {
      double v21 = [(SKUIProductPageHeaderViewController *)self->_headerViewController view];
      [v21 sizeToFit];
    }
    [(SKUIIPhoneProductPageViewController *)self _invalidateChildViewControllers];
    [(SKUIIPhoneProductPageViewController *)self _reloadChildViewControllers];
    [(SKUIProductPageHeaderViewController *)self->_headerViewController reloadData];
    dispatch_time_t v22 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SKUIIPhoneProductPageViewController__setProductPage_error___block_invoke;
    block[3] = &unk_1E6422020;
    void block[4] = self;
    dispatch_after(v22, MEMORY[0x1E4F14428], block);
    if (v9)
    {
      id v23 = [MEMORY[0x1E4F1C9C8] date];
      [v23 timeIntervalSince1970];
      objc_msgSend(v9, "setPageRenderTime:");

      [(SKUIMetricsController *)self->_metricsController recordEvent:v9];
      objc_storeStrong((id *)&self->_lastPageEvent, v9);
    }
    if (self->_wantsActivityViewController) {
      [(SKUIIPhoneProductPageViewController *)self _showActivityViewController];
    }
    id v24 = self->_metricsController;
    double v25 = [v12 pingURLs];
    double v26 = [(SKUIViewController *)self clientContext];
    [(SKUIMetricsController *)v24 pingURLs:v25 withClientContext:v26];
  }
LABEL_14:
  if (v8)
  {
    double v27 = [v8 domain];
    if ([v27 isEqualToString:@"SKUIErrorDomain"])
    {
      uint64_t v28 = [v8 code];

      if (v28 == 1)
      {
        [(SKUIIPhoneProductPageViewController *)self _presentHTMLProductPage];
        goto LABEL_20;
      }
    }
    else
    {
    }
    [(SKUIIPhoneProductPageViewController *)self _showError:v8];
  }
LABEL_20:
}

void __61__SKUIIPhoneProductPageViewController__setProductPage_error___block_invoke(uint64_t a1)
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
    id v4 = (id)+[SKUINetworkErrorViewController canDisplayError:v4];
    id v5 = v12;
    if (v4)
    {
      [(SKUIProductPageChildViewController *)self->_childViewController setHeaderViewController:0];
      [(SKUIProductPageChildViewController *)self->_childViewController removeFromParentViewController];
      double v6 = [[SKUINetworkErrorViewController alloc] initWithError:v12];
      errorViewController = self->_errorViewController;
      self->_errorViewController = v6;

      id v8 = self->_errorViewController;
      double v9 = [(SKUIViewController *)self clientContext];
      [(SKUINetworkErrorViewController *)v8 setClientContext:v9];

      [(SKUINetworkErrorViewController *)self->_errorViewController setDelegate:self];
      objc_storeStrong((id *)&self->_childViewController, self->_errorViewController);
      [(SKUIIPhoneProductPageViewController *)self addChildViewController:self->_childViewController];
      double v10 = [(SKUIIPhoneProductPageViewController *)self view];
      double v11 = [(SKUINetworkErrorViewController *)self->_errorViewController view];
      [v11 setAutoresizingMask:18];
      [v10 bounds];
      objc_msgSend(v11, "setFrame:");
      [v10 addSubview:v11];

      id v5 = v12;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_showActivityViewController
{
  uint64_t v3 = [SKUIProductPageActivityViewController alloc];
  id v4 = [(SKUIProductPage *)self->_productPage item];
  id v5 = [(SKUIViewController *)self clientContext];
  double v6 = [(SKUIProductPageActivityViewController *)v3 initWithProductPageItem:v4 clientContext:v5];

  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __66__SKUIIPhoneProductPageViewController__showActivityViewController__block_invoke;
  double v10 = &unk_1E6427660;
  objc_copyWeak(&v11, &location);
  [(SKUIProductPageActivityViewController *)v6 setCompletionWithItemsHandler:&v7];
  -[SKUIIPhoneProductPageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0, v7, v8, v9, v10);
  self->_wantsActivityViewController = 0;
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __66__SKUIIPhoneProductPageViewController__showActivityViewController__block_invoke(uint64_t a1, void *a2, int a3)
{
  if (a3 && [a2 isEqualToString:0x1F1C956A8])
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
  if ([(SKUIIPhoneProductPageViewController *)self _isIncompatibleItem])
  {
    incompatibleViewController = self->_incompatibleViewController;
    if (!incompatibleViewController)
    {
      double v6 = [SKUIIncompatibleAppViewController alloc];
      uint64_t v7 = [(SKUIProductPage *)self->_productPage item];
      uint64_t v8 = [(SKUIIncompatibleAppViewController *)v6 initWithIncompatibleItem:v7];
      double v9 = self->_incompatibleViewController;
      self->_incompatibleViewController = v8;

      double v10 = self->_incompatibleViewController;
      id v11 = [(SKUIViewController *)self clientContext];
      [(SKUIViewController *)v10 setClientContext:v11];

      [(SKUIIncompatibleAppViewController *)self->_incompatibleViewController setDelegate:self];
      [(SKUIIncompatibleAppViewController *)self->_incompatibleViewController setOperationQueue:self->_operationQueue];
      incompatibleViewController = self->_incompatibleViewController;
    }
    id v12 = incompatibleViewController;
    goto LABEL_18;
  }
  productPage = self->_productPage;
  if (!productPage)
  {
    id v12 = [(SKUIIPhoneProductPageViewController *)self _loadingViewController];
    goto LABEL_18;
  }
  if (a3 == 2)
  {
    double v15 = [(SKUIProductPage *)productPage relatedContentSwooshes];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      double v17 = [(SKUIIPhoneProductPageViewController *)self _relatedViewController];
      if ([v17 isSkLoaded])
      {
        id v14 = v17;
      }
      else
      {
        id v14 = [(SKUIIPhoneProductPageViewController *)self _loadingViewController];
        [v17 loadMissingItemData];
      }

      goto LABEL_19;
    }
    id v12 = [(SKUIIPhoneProductPageViewController *)self _relatedPlaceholderViewController];
    goto LABEL_18;
  }
  if (a3 == 1)
  {
    id v12 = [(SKUIIPhoneProductPageViewController *)self _reviewsViewController];
    goto LABEL_18;
  }
  if (a3)
  {
LABEL_11:
    id v14 = 0;
    goto LABEL_19;
  }
  id v12 = [(SKUIIPhoneProductPageViewController *)self _detailsViewController];
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

- (SKUIIPhoneProductPageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIIPhoneProductPageDelegate *)WeakRetained;
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

- (void)_initSKUIIPhoneProductPageViewController
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "-[SKUIIPhoneProductPageViewController _initSKUIIPhoneProductPageViewController]";
}

@end