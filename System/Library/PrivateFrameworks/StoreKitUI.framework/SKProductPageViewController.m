@interface SKProductPageViewController
+ (id)_defaultClientIdentifier;
+ (id)_defaultClientInterface;
+ (void)_validateURL:(id)a3 withURLBag:(id)a4 completionBlock:(id)a5;
+ (void)getCanLoadWithURL:(id)a3 completionBlock:(id)a4;
- (BOOL)askToBuy;
- (BOOL)iPhoneProductPage:(id)a3 shouldOpenItem:(id)a4;
- (BOOL)iPhoneProductPage:(id)a3 shouldOpenURL:(id)a4;
- (BOOL)isPreview;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)showsRightBarButton;
- (BOOL)showsStoreButton;
- (NSDictionary)scriptContextDictionary;
- (NSString)additionalPurchaseParameters;
- (NSString)affiliateIdentifier;
- (NSString)cancelButtonTitle;
- (NSString)promptString;
- (NSString)rightBarButtonTitle;
- (NSURL)mainDocumentURL;
- (SKProductPageViewController)initWithProductPageStyle:(int64_t)a3;
- (SKProductPageViewController)initWithTabBarItem:(id)a3;
- (SKProductPageViewControllerDelegate)delegate;
- (id)_initSKProductPageViewController;
- (id)_newRequestPropertiesWithRequest:(id)a3;
- (id)_previewOverlay;
- (id)cancelButtonTitle:(id)a3;
- (id)scriptInterfaceForClientInterface:(id)a3;
- (int64_t)URLBagType;
- (int64_t)productPageStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applicationWillEnterForeground;
- (void)_failWithError:(id)a3;
- (void)_gotoStoreButtonAction:(id)a3;
- (void)_initSKProductPageViewController;
- (void)_loadClientContextWithCompletionBlock:(id)a3;
- (void)_loadProductWithRequest:(id)a3;
- (void)_loadRequestForProductParameters;
- (void)_purchaseFailedNotification:(id)a3;
- (void)_purchaseFinishedNotification:(id)a3;
- (void)_reloadGotoStoreButton;
- (void)_reloadViews;
- (void)_rightBarButtonAction:(id)a3;
- (void)_sendDidFailLoadWithError:(id)a3;
- (void)_sendDidFinishWithResult:(int64_t)a3;
- (void)_setClientContext:(id)a3;
- (void)_setResponse:(id)a3 forProperties:(id)a4 error:(id)a5;
- (void)_setShowsCancelButton:(BOOL)a3;
- (void)_showPageWithRequest:(id)a3 animated:(BOOL)a4;
- (void)_showPreviewOverlayAnimated:(BOOL)a3;
- (void)_showProductPage:(id)a3 pageEvent:(id)a4;
- (void)bannerView:(id)a3 didFailWithError:(id)a4;
- (void)bannerViewDidClose:(id)a3;
- (void)clientInterface:(id)a3 exitStoreWithReason:(int64_t)a4;
- (void)clientInterface:(id)a3 hidePreviewOverlayAnimated:(BOOL)a4;
- (void)clientInterface:(id)a3 presentDialog:(id)a4;
- (void)clientInterface:(id)a3 setStatusBarHidden:(BOOL)a4 withAnimation:(int64_t)a5;
- (void)clientInterface:(id)a3 setStatusBarStyle:(int64_t)a4 animated:(BOOL)a5;
- (void)clientInterface:(id)a3 showPreviewOverlayAnimated:(BOOL)a4;
- (void)clientInterface:(id)a3 willDismissViewController:(id)a4;
- (void)clientInterface:(id)a3 willPresentViewController:(id)a4;
- (void)dealloc;
- (void)iPadProductPage:(id)a3 openItem:(id)a4;
- (void)iPadProductPage:(id)a3 openURL:(id)a4 viewControllerBlock:(id)a5;
- (void)itemStateCenter:(id)a3 didFinishPurchases:(id)a4;
- (void)itemStateCenter:(id)a3 didFinishSoftwarePurchases:(id)a4;
- (void)loadProductWithParameters:(id)a3;
- (void)loadProductWithRequest:(id)a3;
- (void)loadView;
- (void)loadWithProductPage:(id)a3;
- (void)loadWithStorePageRequest:(id)a3;
- (void)purchaseManager:(id)a3 didFinishPurchaseRequest:(id)a4 withError:(id)a5;
- (void)purchaseManager:(id)a3 willAddPurchases:(id)a4;
- (void)setAdditionalPurchaseParameters:(id)a3;
- (void)setAffiliateIdentifier:(id)a3;
- (void)setAskToBuy:(BOOL)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMainDocumentURL:(id)a3;
- (void)setPreview:(BOOL)a3;
- (void)setProductPageStyle:(int64_t)a3;
- (void)setPromptString:(id)a3;
- (void)setRightBarButtonTitle:(id)a3;
- (void)setScriptContextDictionary:(id)a3;
- (void)setShowsRightBarButton:(BOOL)a3;
- (void)setShowsStoreButton:(BOOL)a3;
- (void)setURLBagType:(int64_t)a3;
- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SKProductPageViewController

- (id)_initSKProductPageViewController
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKProductPageViewController _initSKProductPageViewController]();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKProductPageViewController;
  v3 = [(SUViewController *)&v20 init];
  v4 = v3;
  if (v3)
  {
    if (v3->_style == 1)
    {
      v5 = objc_alloc_init(SKUIBannerViewController);
      bannerViewController = v4->_bannerViewController;
      v4->_bannerViewController = v5;

      [(SKUIBannerViewController *)v4->_bannerViewController setDelegate:v4];
      [(SKProductPageViewController *)v4 addChildViewController:v4->_bannerViewController];
    }
    else
    {
      v7 = [(id)objc_opt_class() _defaultClientInterface];
      id v8 = objc_alloc_init(MEMORY[0x1E4FB88D0]);
      [v8 setLeftItemsSupplementBackButton:1];
      [(SUViewController *)v4 _setExistingNavigationItem:v8];
      v4->_showsStoreButton = 1;
      v4->_preview = 0;
      v9 = [(SUViewController *)[SKUIITunesStoreUIPageViewController alloc] initWithSection:0];
      storePageViewController = v4->_storePageViewController;
      v4->_storePageViewController = v9;

      id v11 = [(SUStorePageViewController *)v4->_storePageViewController copyScriptProperties];
      if (v4->_style == 1) {
        [MEMORY[0x1E4FB1618] clearColor];
      }
      else {
      v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.921568627 alpha:1.0];
      }
      [v11 setBackgroundColor:v12];

      [(SUStorePageViewController *)v4->_storePageViewController setScriptProperties:v11];
      [(SUStorePageViewController *)v4->_storePageViewController setCanMoveToOverlay:0];
      [(SUViewController *)v4->_storePageViewController _setExistingNavigationItem:v8];
      [(SUStorePageViewController *)v4->_storePageViewController setLoadsWhenHidden:1];
      [(SUStorePageViewController *)v4->_storePageViewController _setReloadsWhenCacheExpired:0];
      [(SKUIITunesStoreUIPageViewController *)v4->_storePageViewController setProductPageViewController:v4];
      [(SKProductPageViewController *)v4 addChildViewController:v4->_storePageViewController];
      [(SKProductPageViewController *)v4 setClientInterface:v7];
      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 addObserver:v4 selector:sel__purchaseFailedNotification_ name:*MEMORY[0x1E4FB8930] object:0];
      [v13 addObserver:v4 selector:sel__purchaseFinishedNotification_ name:*MEMORY[0x1E4FB8938] object:0];
      uint64_t v14 = +[SKUIItemStateCenter defaultCenter];
      itemStateCenter = v4->_itemStateCenter;
      v4->_itemStateCenter = (SKUIItemStateCenter *)v14;

      [(SKUIItemStateCenter *)v4->_itemStateCenter addObserver:v4];
      int64_t style = v4->_style;
      if (style)
      {
        uint64_t v17 = 0;
        if (style != 3) {
          uint64_t v17 = 15;
        }
      }
      else
      {
        v18 = [MEMORY[0x1E4FB16C8] currentDevice];
        if ([v18 userInterfaceIdiom] == 1) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = 15;
        }
      }
      [(SKProductPageViewController *)v4 setEdgesForExtendedLayout:v17];
    }
  }
  return v4;
}

- (SKProductPageViewController)initWithProductPageStyle:(int64_t)a3
{
  self->_int64_t style = a3;
  return (SKProductPageViewController *)[(SKProductPageViewController *)self _initSKProductPageViewController];
}

- (SKProductPageViewController)initWithTabBarItem:(id)a3
{
  v3 = [(SKProductPageViewController *)self _initSKProductPageViewController];
  v4 = v3;
  if (v3) {
    [(SKProductPageViewController *)v3 _setShowsCancelButton:1];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB8930] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB8938] object:0];
  [(SKUIItemStateCenter *)self->_itemStateCenter removeObserver:self];
  [(SKUIITunesStoreUIPageViewController *)self->_storePageViewController setProductPageViewController:0];
  [(SKUIITunesStoreUIPageViewController *)self->_storePageViewController removeFromParentViewController];
  v4 = [(SUViewController *)self clientInterface];
  [v4 setDelegate:0];

  [(SKUIBannerViewController *)self->_bannerViewController setDelegate:0];
  [(SKUIIPadProductPageViewController *)self->_ipadProductPageViewController setDelegate:0];
  [(SKUIIPhoneProductPageViewController *)self->_iphoneProductPageViewController setDelegate:0];
  [(SUPurchaseManager *)self->_purchaseManager setDelegate:0];
  [(SUPreviewOverlayViewController *)self->_previewOverlay removeFromParentViewController];
  v5 = [(SUBarButtonItem *)self->_gotoStoreButtonItem target];

  if (v5 == self) {
    [(SUBarButtonItem *)self->_gotoStoreButtonItem setTarget:0];
  }
  v6 = [(SUBarButtonItem *)self->_rightBarButtonItem target];

  if (v6 == self) {
    [(SUBarButtonItem *)self->_rightBarButtonItem setTarget:0];
  }

  v7.receiver = self;
  v7.super_class = (Class)SKProductPageViewController;
  [(SUViewController *)&v7 dealloc];
}

+ (void)getCanLoadWithURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F74230] sharedConnection];
  char v9 = [v8 isOnDeviceAppInstallationAllowed];

  if (v9)
  {
    v10 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
    id v11 = [MEMORY[0x1E4FB8860] sharedCache];
    v12 = [v11 URLBagForContext:v10];

    if (v12)
    {
      [a1 _validateURL:v6 withURLBag:v12 completionBlock:v7];
    }
    else
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4FB8818]) initWithBagContext:v10];
      objc_initWeak(&location, v13);
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __65__SKProductPageViewController_getCanLoadWithURL_completionBlock___block_invoke;
      v18 = &unk_1E6421FD0;
      objc_copyWeak(v22, &location);
      v22[1] = a1;
      id v19 = v6;
      id v20 = v10;
      id v21 = v7;
      [v13 setCompletionBlock:&v15];
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB8838], "mainQueue", v15, v16, v17, v18);
      [v14 addOperation:v13];

      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __65__SKProductPageViewController_getCanLoadWithURL_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v3 = [WeakRetained success];

  v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v3)
  {
    id v10 = [MEMORY[0x1E4FB8860] sharedCache];
    id v6 = [v10 URLBagForContext:*(void *)(a1 + 40)];
    [v4 _validateURL:v5 withURLBag:v6 completionBlock:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = *(void **)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 32);
    [v8 _validateURL:v9 withURLBag:0 completionBlock:v7];
  }
}

- (void)loadProductWithParameters:(id)a3
{
  if (self->_productParameters != a3)
  {
    v4 = (NSDictionary *)[a3 copy];
    productParameters = self->_productParameters;
    self->_productParameters = v4;

    [(SKProductPageViewController *)self _loadRequestForProductParameters];
  }
}

- (void)loadProductWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
  id v6 = [MEMORY[0x1E4FB8860] sharedCache];
  uint64_t v7 = [v6 URLBagForContext:v5];

  if (v7)
  {
    [(SKProductPageViewController *)self _loadProductWithRequest:v4];
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB8818]) initWithBagContext:v5];
    uint64_t v9 = [MEMORY[0x1E4FA8390] weakReferenceWithObject:self];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __54__SKProductPageViewController_loadProductWithRequest___block_invoke;
    uint64_t v15 = &unk_1E6421FF8;
    id v16 = v9;
    id v17 = v4;
    id v10 = v9;
    [v8 setCompletionBlock:&v12];
    id v11 = objc_msgSend(MEMORY[0x1E4FB8838], "mainQueue", v12, v13, v14, v15);
    [v11 addOperation:v8];
  }
}

void __54__SKProductPageViewController_loadProductWithRequest___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__SKProductPageViewController_loadProductWithRequest___block_invoke_2;
  v2[3] = &unk_1E6421FF8;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __54__SKProductPageViewController_loadProductWithRequest___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  [v2 _loadProductWithRequest:*(void *)(a1 + 40)];
}

- (NSDictionary)scriptContextDictionary
{
  id v2 = [(SUStorePageViewController *)self->_storePageViewController copyScriptProperties];
  id v3 = [v2 contextDictionary];

  return (NSDictionary *)v3;
}

- (void)setAdditionalPurchaseParameters:(id)a3
{
  if (self->_additionalPurchaseParameters != a3)
  {
    id v4 = (NSString *)[a3 copy];
    additionalPurchaseParameters = self->_additionalPurchaseParameters;
    self->_additionalPurchaseParameters = v4;

    clientContext = self->_clientContext;
    uint64_t v7 = self->_additionalPurchaseParameters;
    [(SKUIClientContext *)clientContext _setAdditionalPurchaseParameters:v7];
  }
}

- (void)setAffiliateIdentifier:(id)a3
{
  if (self->_affiliateIdentifier != a3)
  {
    id v4 = (NSString *)[a3 copy];
    affiliateIdentifier = self->_affiliateIdentifier;
    self->_affiliateIdentifier = v4;

    clientContext = self->_clientContext;
    uint64_t v7 = self->_affiliateIdentifier;
    [(SKUIClientContext *)clientContext _setPurchaseAffiliateIdentifier:v7];
  }
}

- (void)setAskToBuy:(BOOL)a3
{
  if (self->_askToBuy != a3)
  {
    self->_askToBuy = a3;
    -[SKUIIPhoneProductPageViewController setAskPermission:](self->_iphoneProductPageViewController, "setAskPermission:");
    [(SKUIIPadProductPageViewController *)self->_ipadProductPageViewController setAskPermission:self->_askToBuy];
    id v4 = [(SUViewController *)self clientInterface];
    [v4 setInAskToBuyApprovalFlow:self->_askToBuy];
  }
}

- (void)setPromptString:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_promptString = &self->_promptString;
  if (self->_promptString != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_promptString, a3);
    [(SKUIIPhoneProductPageViewController *)self->_iphoneProductPageViewController setBannerText:*p_promptString];
    [(SKUIIPadProductPageViewController *)self->_ipadProductPageViewController setBannerText:*p_promptString];
    uint64_t v7 = [(SUViewController *)self clientInterface];
    [v7 setAskToBuyApprovalPrompt:*p_promptString];

    uint64_t v5 = v8;
  }
}

- (void)setProductPageStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_int64_t style = a3;
    if (a3)
    {
      if (a3 == 3) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = 15;
      }
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v5 userInterfaceIdiom] == 1) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = 15;
      }
    }
    [(SKProductPageViewController *)self setEdgesForExtendedLayout:v4];
  }
}

- (void)setScriptContextDictionary:(id)a3
{
  storePageViewController = self->_storePageViewController;
  id v5 = a3;
  id v6 = [(SUStorePageViewController *)storePageViewController copyScriptProperties];
  [v6 setContextDictionary:v5];
  [(SKUIBannerViewController *)self->_bannerViewController setScriptContextDictionary:v5];

  [(SUStorePageViewController *)self->_storePageViewController setScriptProperties:v6];
}

- (void)setURLBagType:(int64_t)a3
{
  self->_urlBagType = a3;
  -[SKUIClientContext _setPurchaseURLBagType:](self->_clientContext, "_setPurchaseURLBagType:");
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (id)cancelButtonTitle:(id)a3
{
  return [(SKUIITunesStoreUIPageViewController *)self->_storePageViewController cancelButtonTitle];
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  if (a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 productPageDidFinishLoad:self];
    }
    [(SKProductPageViewController *)self _reloadGotoStoreButton];
  }
  else
  {
    [(SKProductPageViewController *)self _failWithError:0];
  }
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.88 alpha:1.0];
  [v4 setBackgroundColor:v3];

  [(SKProductPageViewController *)self setView:v4];
  [(SKProductPageViewController *)self _reloadViews];
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  if (SKUIAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  return a3 == 1 || v5 != 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKProductPageViewController;
  [(SUViewController *)&v4 viewDidAppear:a3];
  [(SUStorePageViewController *)self->_storePageViewController _setReloadsWhenCacheExpired:1];
}

- (void)setClientInterface:(id)a3
{
  id v4 = a3;
  id v5 = [(SUViewController *)self clientInterface];
  char v6 = v5;
  if (v5 != v4)
  {
    [v5 setDelegate:0];
    if (!self->_purchaseManager)
    {
      id v7 = (SUPurchaseManager *)objc_alloc_init(MEMORY[0x1E4FB88E8]);
      purchaseManager = self->_purchaseManager;
      self->_purchaseManager = v7;

      [(SUPurchaseManager *)self->_purchaseManager setDelegate:self];
    }
    [v4 setDelegate:self];
    [v4 setPurchaseManager:self->_purchaseManager];
    [v4 setInAskToBuyApprovalFlow:self->_askToBuy];
    [v4 setAskToBuyApprovalPrompt:self->_promptString];
    [(SUViewController *)self->_storePageViewController setClientInterface:v4];
  }
  v9.receiver = self;
  v9.super_class = (Class)SKProductPageViewController;
  [(SUViewController *)&v9 setClientInterface:v4];
}

- (void)bannerView:(id)a3 didFailWithError:(id)a4
{
}

- (void)bannerViewDidClose:(id)a3
{
}

- (BOOL)iPhoneProductPage:(id)a3 shouldOpenItem:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v5 = a4;
  id v6 = [v4 alloc];
  id v7 = [v5 productPageURLString];

  id v8 = (void *)[v6 initWithString:v7];
  uint64_t v9 = UIITunesStoreResolvedURLForHTTPURL();
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v8;
  }
  id v12 = v11;

  uint64_t v13 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v13 openURL:v12 options:MEMORY[0x1E4F1CC08] completionHandler:0];

  return 0;
}

- (BOOL)iPhoneProductPage:(id)a3 shouldOpenURL:(id)a4
{
  id v4 = a4;
  uint64_t v5 = UIITunesStoreResolvedURLForHTTPURL();
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  uint64_t v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v9 openURL:v8 options:MEMORY[0x1E4F1CC08] completionHandler:0];

  return 0;
}

- (void)iPadProductPage:(id)a3 openItem:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v5 = a4;
  id v6 = [v4 alloc];
  id v7 = [v5 productPageURLString];

  id v8 = (void *)[v6 initWithString:v7];
  uint64_t v9 = UIITunesStoreResolvedURLForHTTPURL();
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v8;
  }
  id v12 = v11;

  id v13 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v13 openURL:v12 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)iPadProductPage:(id)a3 openURL:(id)a4 viewControllerBlock:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v7) {
    goto LABEL_2;
  }
  uint64_t v14 = [v16 item];
  uint64_t v15 = [v14 productPageURLString];

  if (v15)
  {
    id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v15];

    if (v7)
    {
LABEL_2:
      uint64_t v9 = UIITunesStoreResolvedURLForHTTPURL();
      id v10 = (void *)v9;
      if (v9) {
        id v11 = (void *)v9;
      }
      else {
        id v11 = v7;
      }
      id v12 = v11;

      id v13 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v13 openURL:v12 options:MEMORY[0x1E4F1CC08] completionHandler:0];
    }
  }
}

- (void)clientInterface:(id)a3 exitStoreWithReason:(int64_t)a4
{
  if ((unint64_t)(a4 - 3) >= 3) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = a4 - 2;
  }
  [(SKProductPageViewController *)self _sendDidFinishWithResult:v4];
}

- (void)clientInterface:(id)a3 hidePreviewOverlayAnimated:(BOOL)a4
{
  if (self->_previewOverlay)
  {
    BOOL v4 = a4;
    id v6 = [(SUViewController *)self navigationController];
    previewOverlay = self->_previewOverlay;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__SKProductPageViewController_clientInterface_hidePreviewOverlayAnimated___block_invoke;
    v8[3] = &unk_1E6422020;
    v8[4] = self;
    [(SUPreviewOverlayViewController *)previewOverlay hideInNavigationController:v6 animated:v4 completionBlock:v8];
  }
}

void __74__SKProductPageViewController_clientInterface_hidePreviewOverlayAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1232) removeFromParentViewController];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1232) view];
  [v2 removeFromSuperview];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x1E4FB8928] object:*(void *)(*(void *)(a1 + 32) + 1232)];
}

- (void)clientInterface:(id)a3 presentDialog:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 productPage:self presentAlertForDialog:v5];
  }
  else
  {
    dialogManager = self->_dialogManager;
    if (!dialogManager)
    {
      id v10 = (SUDialogManager *)objc_alloc_init(MEMORY[0x1E4FB88A8]);
      id v11 = self->_dialogManager;
      self->_dialogManager = v10;

      dialogManager = self->_dialogManager;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__SKProductPageViewController_clientInterface_presentDialog___block_invoke;
    v12[3] = &unk_1E6422048;
    id v13 = v5;
    uint64_t v14 = self;
    [(SUDialogManager *)dialogManager presentDialog:v13 withCompletionBlock:v12];
  }
}

void __61__SKProductPageViewController_clientInterface_presentDialog___block_invoke(uint64_t a1, unint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) buttons];
  if ((a2 & 0x8000000000000000) == 0)
  {
    id v7 = v4;
    BOOL v5 = [v4 count] > a2;
    BOOL v4 = v7;
    if (v5)
    {
      id v6 = [v7 objectAtIndex:a2];
      if ([v6 actionType] == 5) {
        [*(id *)(a1 + 40) _sendDidFinishWithResult:0];
      }

      BOOL v4 = v7;
    }
  }
}

- (void)clientInterface:(id)a3 setStatusBarHidden:(BOOL)a4 withAnimation:(int64_t)a5
{
  BOOL v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 productPage:self setStatusBarHidden:v6 withAnimation:a5];
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v11 setStatusBarHidden:v6 withAnimation:a5];
  }
}

- (void)clientInterface:(id)a3 setStatusBarStyle:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 productPage:self setStatusBarStyle:a4 animated:v5];
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v11 setStatusBarStyle:a4 animated:v5];
  }
}

- (void)clientInterface:(id)a3 showPreviewOverlayAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(SKProductPageViewController *)self _previewOverlay];
  if ([v6 isContentLoaded])
  {
    [(SKProductPageViewController *)self _showPreviewOverlayAnimated:v4];
  }
  else
  {
    id v7 = [(id)objc_opt_class() defaultRequestProperties];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__SKProductPageViewController_clientInterface_showPreviewOverlayAnimated___block_invoke;
    v8[3] = &unk_1E6422070;
    v8[4] = self;
    BOOL v9 = v4;
    [v6 loadWithRequestProperties:v7 completionBlock:v8];
  }
}

uint64_t __74__SKProductPageViewController_clientInterface_showPreviewOverlayAnimated___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _showPreviewOverlayAnimated:*(unsigned __int8 *)(result + 40)];
  }
  return result;
}

- (void)clientInterface:(id)a3 willDismissViewController:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 productPage:self willDismissViewController:v8];
  }
}

- (void)clientInterface:(id)a3 willPresentViewController:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 productPage:self willPresentViewController:v8];
  }
}

- (id)scriptInterfaceForClientInterface:(id)a3
{
  BOOL v4 = objc_alloc_init(SKScriptInterface);
  [(SKScriptInterface *)v4 setParentProductPageViewController:self];

  return v4;
}

- (void)purchaseManager:(id)a3 didFinishPurchaseRequest:(id)a4 withError:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  uint64_t v14 = [v11 OSLogObject];
  uint64_t v15 = v14;
  if (!v10)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      v13 &= 2u;
    }
    if (v13)
    {
      *(_DWORD *)v24 = 138412290;
      *(void *)&v24[4] = objc_opt_class();
      id v21 = *(id *)&v24[4];
      LODWORD(v23) = 12;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_19:

        [(SKProductPageViewController *)self _sendDidFinishWithResult:4];
        goto LABEL_20;
      }
      uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, v24, v23, *(void *)v24, *(void *)&v24[8]);
      free(v22);
      SSFileLog();
    }

    goto LABEL_19;
  }
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (v13)
  {
    *(_DWORD *)v24 = 138412546;
    *(void *)&v24[4] = objc_opt_class();
    *(_WORD *)&v24[12] = 2112;
    *(void *)&v24[14] = v10;
    id v16 = *(id *)&v24[4];
    LODWORD(v23) = 22;
    id v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_11;
    }
    uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, v24, v23, *(_OWORD *)v24, *(void *)&v24[16], v25);
    free(v17);
    SSFileLog();
  }

LABEL_11:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    [v20 productPage:self purchaseBatchFailedWithError:v10];
  }
LABEL_20:
}

- (void)purchaseManager:(id)a3 willAddPurchases:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(NSString *)self->_additionalPurchaseParameters length])
          {
            int v12 = [v11 buyParameters];
            if (v12)
            {
              int v13 = [NSString stringWithFormat:@"%@&%@", v12, self->_additionalPurchaseParameters];
              [v11 setBuyParameters:v13];
            }
          }
          if (self->_affiliateIdentifier) {
            objc_msgSend(v11, "setAffiliateIdentifier:");
          }
          if (self->_urlBagType)
          {
            uint64_t v14 = [v11 requestProperties];
            id v15 = (id)[v14 mutableCopy];

            if (!v15) {
              id v15 = objc_alloc_init(MEMORY[0x1E4FA8268]);
            }
            [v15 setURLBagType:self->_urlBagType];
            [v11 setRequestProperties:v15];
          }
          [v28 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v8);
  }

  id v16 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v17 = [v16 shouldLog];
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  char v19 = [v16 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    int v20 = v18;
  }
  else {
    int v20 = v18 & 2;
  }
  if (v20)
  {
    id v21 = objc_opt_class();
    int v33 = 138412546;
    v34 = v21;
    __int16 v35 = 2112;
    id v36 = v28;
    id v22 = v21;
    LODWORD(v27) = 22;
    uint64_t v23 = (void *)_os_log_send_and_compose_impl();

    if (!v23) {
      goto LABEL_30;
    }
    char v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v33, v27);
    free(v23);
    SSFileLog();
  }

LABEL_30:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    id v26 = objc_loadWeakRetained((id *)&self->_delegate);
    [v26 productPage:self willMakePurchases:v28];
  }
}

- (void)itemStateCenter:(id)a3 didFinishPurchases:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
      id v11 = [v10 error];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    int v12 = [v10 error];

    if (!v12) {
      goto LABEL_22;
    }
    int v13 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v17 = objc_opt_class();
      int v35 = 138412546;
      id v36 = v17;
      __int16 v37 = 2112;
      uint64_t v38 = v12;
      id v18 = v17;
      LODWORD(v30) = 22;
      char v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19) {
        goto LABEL_20;
      }
      id v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v35, v30, (void)v31);
      free(v19);
      SSFileLog();
    }

LABEL_20:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 productPage:self purchaseBatchFailedWithError:v12];
    }
    goto LABEL_32;
  }
LABEL_9:

LABEL_22:
  uint64_t v23 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v24 = [v23 shouldLog];
  if ([v23 shouldLogToDisk]) {
    int v25 = v24 | 2;
  }
  else {
    int v25 = v24;
  }
  id v26 = [v23 OSLogObject];
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    v25 &= 2u;
  }
  if (!v25) {
    goto LABEL_30;
  }
  uint64_t v27 = objc_opt_class();
  int v35 = 138412290;
  id v36 = v27;
  id v28 = v27;
  LODWORD(v30) = 12;
  long long v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    id v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v35, v30, (void)v31);
    free(v29);
    SSFileLog();
LABEL_30:
  }
  [(SKProductPageViewController *)self _sendDidFinishWithResult:4];
  int v12 = 0;
LABEL_32:
}

- (void)itemStateCenter:(id)a3 didFinishSoftwarePurchases:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
      id v11 = [v10 error];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    int v12 = [v10 error];

    if (!v12) {
      goto LABEL_22;
    }
    int v13 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v17 = objc_opt_class();
      int v35 = 138412546;
      id v36 = v17;
      __int16 v37 = 2112;
      uint64_t v38 = v12;
      id v18 = v17;
      LODWORD(v30) = 22;
      char v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19) {
        goto LABEL_20;
      }
      id v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v35, v30, (void)v31);
      free(v19);
      SSFileLog();
    }

LABEL_20:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 productPage:self purchaseBatchFailedWithError:v12];
    }
    goto LABEL_32;
  }
LABEL_9:

LABEL_22:
  uint64_t v23 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v24 = [v23 shouldLog];
  if ([v23 shouldLogToDisk]) {
    int v25 = v24 | 2;
  }
  else {
    int v25 = v24;
  }
  id v26 = [v23 OSLogObject];
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    v25 &= 2u;
  }
  if (!v25) {
    goto LABEL_30;
  }
  uint64_t v27 = objc_opt_class();
  int v35 = 138412290;
  id v36 = v27;
  id v28 = v27;
  LODWORD(v30) = 12;
  long long v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    id v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v35, v30, (void)v31);
    free(v29);
    SSFileLog();
LABEL_30:
  }
  [(SKProductPageViewController *)self _sendDidFinishWithResult:4];
  int v12 = 0;
LABEL_32:
}

- (void)_gotoStoreButtonAction:(id)a3
{
  id v8 = a3;
  nativeURL = self->_nativeURL;
  if (nativeURL)
  {
    id v5 = nativeURL;
  }
  else
  {
    id v5 = [(SUStorePageViewController *)self->_storePageViewController displayedURL];
    if (!v5) {
      goto LABEL_5;
    }
  }
  uint64_t v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v7 = UIITunesStoreResolvedURLForHTTPURL();
  [v6 openURL:v7];

LABEL_5:
  [(SKProductPageViewController *)self _sendDidFinishWithResult:3];
}

- (void)_rightBarButtonAction:(id)a3
{
}

- (void)_purchaseFailedNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  uint64_t v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4FB8940]];

  id v8 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  id v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    v10 &= 2u;
  }
  if (v10)
  {
    *(_DWORD *)id v18 = 138412802;
    *(void *)&v18[4] = objc_opt_class();
    *(_WORD *)&v18[12] = 2112;
    *(void *)&v18[14] = v5;
    *(_WORD *)&v18[22] = 2112;
    char v19 = v7;
    id v12 = *(id *)&v18[4];
    LODWORD(v17) = 32;
    int v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_10;
    }
    id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v18, v17, *(_OWORD *)v18, *(void *)&v18[16], v19);
    free(v13);
    SSFileLog();
  }

LABEL_10:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 productPage:self didFinishPurchase:v5 withError:v7];
  }
}

- (void)_purchaseFinishedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  id v5 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (v7)
  {
    *(_DWORD *)char v15 = 138412546;
    *(void *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2112;
    *(void *)&v15[14] = v4;
    id v9 = *(id *)&v15[4];
    LODWORD(v14) = 22;
    int v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_10;
    }
    id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16]);
    free(v10);
    SSFileLog();
  }

LABEL_10:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 productPage:self didFinishPurchase:v4 withError:0];
  }
}

- (void)_applicationWillEnterForeground
{
  lastPageEvent = self->_lastPageEvent;
  if (lastPageEvent)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v4];

    int64_t style = self->_style;
    if (style == 3
      || !style
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          int v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 userInterfaceIdiom],
          v6,
          v7 == 1))
    {
      id v8 = &OBJC_IVAR___SKProductPageViewController__ipadProductPageViewController;
    }
    else
    {
      id v8 = &OBJC_IVAR___SKProductPageViewController__iphoneProductPageViewController;
    }
    id v9 = *(Class *)((char *)&self->super.super.super.super.isa + *v8);
    int v10 = self->_lastPageEvent;
    [v9 configureMetricsWithPageEvent:v10];
  }
}

- (void)loadWithProductPage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SKProductPageViewController_loadWithProductPage___block_invoke;
  v6[3] = &unk_1E6422098;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(SKProductPageViewController *)self _loadClientContextWithCompletionBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __51__SKProductPageViewController_loadWithProductPage___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = WeakRetained;
  if (a2) {
    [WeakRetained _showProductPage:*(void *)(a1 + 32) pageEvent:0];
  }
  else {
    [WeakRetained _sendDidFailLoadWithError:v7];
  }
}

- (void)loadWithStorePageRequest:(id)a3
{
  id v8 = a3;
  -[SKProductPageViewController setProductPageStyle:](self, "setProductPageStyle:", [v8 productPageStyle]);
  uint64_t v4 = [v8 productURL];
  if (v4)
  {
    id v5 = (void *)v4;
    int v6 = [MEMORY[0x1E4F18DA8] requestWithURL:v4];
    [(SKProductPageViewController *)self loadProductWithRequest:v6];
  }
  else
  {
    uint64_t v7 = [v8 productParameters];
    if (!v7) {
      goto LABEL_6;
    }
    id v5 = (void *)v7;
    [(SKProductPageViewController *)self loadProductWithParameters:v7];
  }

LABEL_6:
}

+ (id)_defaultClientInterface
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB88A0]);
  uint64_t v4 = [a1 _defaultClientIdentifier];
  [v3 setClientIdentifier:v4];

  id v5 = objc_alloc_init(SKUIViewControllerFactory);
  [v3 setViewControllerFactory:v5];

  return v3;
}

- (void)_sendDidFinishWithResult:(int64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 productPage:self didFinishWithResult:a3];
  }
}

- (void)_setClientContext:(id)a3
{
  id v5 = (SKUIClientContext *)a3;
  if (self->_clientContext != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    [(SKUIClientContext *)self->_clientContext setMetricsPageContext:@"Sheet" forViewController:self];
    id v5 = v6;
  }
}

- (void)_setShowsCancelButton:(BOOL)a3
{
}

- (void)_showPageWithRequest:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  id v8 = (SKProductPageViewController *)objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = v8;
  if (v7)
  {
    [(SKProductPageViewController *)v8 productPage:self presentProductPageWithRequest:v13 animated:v4];
  }
  else
  {
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_6;
    }
    id v9 = objc_alloc_init(SKProductPageViewController);
    id v11 = [(SUViewController *)self clientInterface];
    [(SKProductPageViewController *)v9 setClientInterface:v11];

    [(SKProductPageViewController *)v9 loadWithStorePageRequest:v13];
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 productPage:self presentProductPage:v9 animated:v4];
  }
LABEL_6:
}

+ (id)_defaultClientIdentifier
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.ios.StoreKitUIService"]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3;
  }
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = @"ThirdParty";
  }
  int v6 = v5;

  return v6;
}

+ (void)_validateURL:(id)a3 withURLBag:(id)a4 completionBlock:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void))a5;
  id v9 = [a4 valueForKey:@"ix-store-sheet"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v10 = [v9 objectForKey:@"host-patterns"];
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v21 = 0;
LABEL_35:

        goto LABEL_36;
      }
      id v11 = [v7 host];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v30 = v10;
        long long v32 = v9;
        id v29 = v7;
        uint64_t v15 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v39 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:*(void *)(*((void *)&v38 + 1) + 8 * i) options:1 error:0];
            uint64_t v18 = objc_msgSend(v17, "rangeOfFirstMatchInString:options:range:", v11, 0, 0, objc_msgSend(v11, "length"));

            if (v18 != 0x7FFFFFFFFFFFFFFFLL)
            {

              id v7 = v29;
              char v10 = v30;
              id v9 = v32;
              goto LABEL_16;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
          if (v14) {
            continue;
          }
          break;
        }
        int v19 = 0;
        int v20 = 0;
        id v7 = v29;
        char v10 = v30;
        id v9 = v32;
      }
      else
      {
        int v19 = 0;
        int v20 = 0;
      }
      goto LABEL_33;
    }
LABEL_16:
    id v11 = [v9 objectForKey:@"path-patterns"];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v7 path];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v11 = v11;
        uint64_t v22 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          long long v31 = v10;
          long long v33 = v9;
          id v24 = v7;
          uint64_t v25 = *(void *)v35;
LABEL_20:
          uint64_t v26 = 0;
          while (1)
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(v11);
            }
            int v20 = 1;
            uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:*(void *)(*((void *)&v34 + 1) + 8 * v26) options:1 error:0];
            uint64_t v28 = objc_msgSend(v27, "rangeOfFirstMatchInString:options:range:", v12, 0, 0, objc_msgSend(v12, "length"));

            if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            if (v23 == ++v26)
            {
              uint64_t v23 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
              if (v23) {
                goto LABEL_20;
              }
              int v20 = 0;
              break;
            }
          }
          id v7 = v24;
          char v10 = v31;
          id v9 = v33;
        }
        else
        {
          int v20 = 0;
        }

        int v19 = 1;
LABEL_33:

        goto LABEL_34;
      }
      int v20 = 0;
      int v19 = 1;
    }
    else
    {
      int v19 = 1;
      int v20 = 1;
    }
LABEL_34:

    uint64_t v21 = v19 & v20;
    goto LABEL_35;
  }
  uint64_t v21 = 0;
LABEL_36:
  v8[2](v8, v21);
}

- (void)_failWithError:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F3C348];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_1F1C879E8 table:0];
    v11[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v4 = [v5 errorWithDomain:v6 code:5 userInfo:v9];
  }
  [(SUStorePageViewController *)self->_storePageViewController setSkLoading:0];
  [(SKProductPageViewController *)self _sendDidFailLoadWithError:v4];
}

- (void)_loadClientContextWithCompletionBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SUViewController *)self clientInterface];
  uint64_t v6 = [v5 clientIdentifier];

  if (!v6)
  {
    uint64_t v6 = [(id)objc_opt_class() _defaultClientIdentifier];
  }
  if (!self->_clientContext)
  {
    id v7 = +[SKUIClientContext defaultContext];
    clientContext = self->_clientContext;
    self->_clientContext = v7;

    id v9 = [(SKUIClientContext *)self->_clientContext clientInterface];
    [v9 setClientIdentifier:v6];

    [(SKUIClientContext *)self->_clientContext setMetricsPageContext:@"Sheet" forViewController:self];
    [(SKUIClientContext *)self->_clientContext _setAdditionalPurchaseParameters:self->_additionalPurchaseParameters];
    [(SKUIClientContext *)self->_clientContext _setPurchaseAffiliateIdentifier:self->_affiliateIdentifier];
    [(SKUIClientContext *)self->_clientContext _setPurchaseURLBagType:self->_urlBagType];
    if (!self->_clientContext)
    {
      uint64_t v10 = objc_alloc_init(SKUIReloadConfigurationOperation);
      objc_initWeak(&location, self);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __69__SKProductPageViewController__loadClientContextWithCompletionBlock___block_invoke;
      v21[3] = &unk_1E64220E8;
      objc_copyWeak(&v25, &location);
      id v22 = v6;
      uint64_t v23 = self;
      id v24 = v4;
      [(SKUIReloadConfigurationOperation *)v10 setOutputBlock:v21];
      id v11 = [MEMORY[0x1E4FA81D8] sharedConfig];
      int v12 = [v11 shouldLog];
      int v13 = [v11 shouldLogToDisk];
      uint64_t v14 = [v11 OSLogObject];
      uint64_t v15 = v14;
      if (v13) {
        v12 |= 2u;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        v12 &= 2u;
      }
      if (v12)
      {
        uint64_t v16 = objc_opt_class();
        int v27 = 138412290;
        uint64_t v28 = v16;
        id v17 = v16;
        LODWORD(v20) = 12;
        uint64_t v18 = (void *)_os_log_send_and_compose_impl();

        if (!v18)
        {
LABEL_15:

          id v19 = objc_alloc_init(MEMORY[0x1E4F28F08]);
          [v19 addOperation:v10];

          objc_destroyWeak(&v25);
          objc_destroyWeak(&location);

          goto LABEL_6;
        }
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v27, v20);
        free(v18);
        SSFileLog();
      }

      goto LABEL_15;
    }
  }
  (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
LABEL_6:
}

void __69__SKProductPageViewController__loadClientContextWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SKProductPageViewController__loadClientContextWithCompletionBlock___block_invoke_2;
  v12[3] = &unk_1E64220C0;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  id v13 = v5;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v6;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  objc_destroyWeak(&v18);
}

void __69__SKProductPageViewController__loadClientContextWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v2 = [[SKUIClientContext alloc] initWithConfigurationDictionary:*(void *)(a1 + 32)];
    id v3 = [(SKUIClientContext *)v2 clientInterface];
    [v3 setClientIdentifier:*(void *)(a1 + 40)];

    [(SKUIClientContext *)v2 setMetricsPageContext:@"Sheet" forViewController:*(void *)(a1 + 48)];
    [(SKUIClientContext *)v2 _setAdditionalPurchaseParameters:*(void *)(*(void *)(a1 + 48) + 1120)];
    [(SKUIClientContext *)v2 _setPurchaseAffiliateIdentifier:*(void *)(*(void *)(a1 + 48) + 1128)];
    [(SKUIClientContext *)v2 _setPurchaseURLBagType:*(void *)(*(void *)(a1 + 48) + 1296)];
    id v4 = (void *)WeakRetained[144];
    WeakRetained[144] = v2;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_loadProductWithRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SKProductPageViewController__loadProductWithRequest___block_invoke;
  v6[3] = &unk_1E6422098;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(SKProductPageViewController *)self _loadClientContextWithCompletionBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __55__SKProductPageViewController__loadProductWithRequest___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)[WeakRetained _newRequestPropertiesWithRequest:*(void *)(a1 + 32)];

  if (a2)
  {
    id v9 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    int v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v15 = objc_opt_class();
      id v16 = *(void **)(a1 + 32);
      id v17 = v15;
      [v16 URL];
      int v26 = 138412546;
      int v27 = v15;
      __int16 v28 = 2112;
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 22;
      id v18 = (void *)_os_log_send_and_compose_impl();

      if (v18)
      {
        id v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v26, v22);
        free(v18);
        SSFileLog();
      }
    }
    else
    {
    }
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4FA8308]) initWithRequestProperties:v8];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__SKProductPageViewController__loadProductWithRequest___block_invoke_106;
    v23[3] = &unk_1E6422138;
    objc_copyWeak(&v25, v6);
    id v24 = v8;
    [v21 startWithConnectionResponseBlock:v23];

    objc_destroyWeak(&v25);
  }
  else
  {
    id v20 = objc_loadWeakRetained((id *)(a1 + 40));
    [v20 _setResponse:0 forProperties:v8 error:v5];
  }
}

void __55__SKProductPageViewController__loadProductWithRequest___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SKProductPageViewController__loadProductWithRequest___block_invoke_2;
  v9[3] = &unk_1E6422110;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __55__SKProductPageViewController__loadProductWithRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _setResponse:*(void *)(a1 + 32) forProperties:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_loadRequestForProductParameters
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if ([(NSDictionary *)self->_productParameters count])
  {
    if (self->_bannerViewController)
    {
      objc_initWeak((id *)location, self);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke;
      v33[3] = &unk_1E6422098;
      objc_copyWeak(&v34, (id *)location);
      v33[4] = self;
      [(SKProductPageViewController *)self _loadClientContextWithCompletionBlock:v33];
      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v3 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
      id v4 = [MEMORY[0x1E4FB8860] sharedCache];
      id v5 = [v4 URLBagForContext:v3];

      if (v5)
      {
        id v6 = [v5 valueForKey:@"ix-store-sheet"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([(SKProductPageViewController *)self productPageStyle] == 1
           && ([v6 objectForKey:@"banner-lookup-url"],
               (id v7 = objc_claimAutoreleasedReturnValue()) != 0)
           || ([v6 objectForKey:@"lookup-url"],
               (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
          && (id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7], v7, v8))
        {
          id v9 = [MEMORY[0x1E4FA81D8] sharedConfig];
          int v10 = [v9 shouldLog];
          if ([v9 shouldLogToDisk]) {
            int v11 = v10 | 2;
          }
          else {
            int v11 = v10;
          }
          id v12 = [v9 OSLogObject];
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            v11 &= 2u;
          }
          if (v11)
          {
            *(_DWORD *)id location = 138412546;
            *(void *)&location[4] = objc_opt_class();
            __int16 v36 = 2112;
            long long v37 = v8;
            id v13 = *(id *)&location[4];
            LODWORD(v28) = 22;
            id v14 = (void *)_os_log_send_and_compose_impl();

            if (v14)
            {
              uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, location, v28);
              free(v14);
              SSFileLog();
            }
          }
          else
          {
          }
          id v25 = [MEMORY[0x1E4F18DA8] requestWithURL:v8];
          [(SKProductPageViewController *)self loadProductWithRequest:v25];
        }
        else
        {
          id v16 = [MEMORY[0x1E4FA81D8] sharedConfig];
          int v17 = [v16 shouldLog];
          if ([v16 shouldLogToDisk]) {
            int v18 = v17 | 2;
          }
          else {
            int v18 = v17;
          }
          id v19 = [v16 OSLogObject];
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            v18 &= 2u;
          }
          if (v18)
          {
            *(_DWORD *)id location = 138412290;
            *(void *)&location[4] = objc_opt_class();
            id v20 = *(id *)&location[4];
            LODWORD(v28) = 12;
            uint64_t v21 = (void *)_os_log_send_and_compose_impl();

            if (v21)
            {
              uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, location, v28);
              free(v21);
              SSFileLog();
            }
          }
          else
          {
          }
          id v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v38 = *MEMORY[0x1E4F28568];
          id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          id v25 = [v8 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_1F1C879E8 table:0];
          v39[0] = v25;
          int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
          int v27 = [v24 errorWithDomain:*MEMORY[0x1E4F3C348] code:5 userInfo:v26];
          [(SKProductPageViewController *)self _failWithError:v27];
        }
      }
      else
      {
        id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB8818]) initWithBagContext:v3];
        objc_initWeak((id *)location, v6);
        objc_initWeak(&from, self);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke_114;
        v29[3] = &unk_1E6422188;
        objc_copyWeak(&v30, (id *)location);
        objc_copyWeak(&v31, &from);
        [v6 setCompletionBlock:v29];
        [(SUStorePageViewController *)self->_storePageViewController setSkLoading:1];
        uint64_t v23 = [MEMORY[0x1E4FB8838] mainQueue];
        [v23 addOperation:v6];

        objc_destroyWeak(&v31);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&from);
        objc_destroyWeak((id *)location);
      }
    }
  }
}

void __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v10 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (a2)
  {
    if (WeakRetained)
    {
      [WeakRetained[143] setClientContext:*(void *)(*(void *)(a1 + 32) + 1152)];
      id v7 = v6[143];
      id v8 = v6[155];
      id v9 = [*(id *)(a1 + 32) mainDocumentURL];
      [v7 loadWithProductParameters:v8 mainDocumentURL:v9];
    }
  }
  else
  {
    [WeakRetained _sendDidFailLoadWithError:v10];
  }
}

void __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke_114(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke_2;
  v4[3] = &unk_1E6422160;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v6);
}

void __63__SKProductPageViewController__loadRequestForProductParameters__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) success])
  {
    id v2 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    id v5 = [v2 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      v4 &= 2u;
    }
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      id v7 = objc_opt_class();
      id v8 = *(void **)(a1 + 32);
      id v9 = v7;
      [v8 error];
      int v22 = 138412546;
      uint64_t v23 = v7;
      __int16 v24 = 2112;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = 22;
      id v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_14:

        id v11 = objc_loadWeakRetained((id *)(a1 + 40));
        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *MEMORY[0x1E4F3C348];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v15 = [v14 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_1F1C879E8 table:0];
        uint64_t v21 = v15;
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        int v17 = [v12 errorWithDomain:v13 code:5 userInfo:v16];
        [v11 _failWithError:v17];

        return;
      }
      id v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v18);
      free(v10);
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v19 = objc_loadWeakRetained((id *)(a1 + 40));
  [v19 _loadRequestForProductParameters];
}

- (id)_newRequestPropertiesWithRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4FA8268]) initWithURLRequest:v17];
  [v16 setITunesStoreRequest:1];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_productParameters;
  uint64_t v4 = [(NSDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v9 = [(NSDictionary *)self->_productParameters objectForKey:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 stringValue];

          id v9 = (void *)v10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v18 setObject:v9 forKey:v8];
        }
      }
      uint64_t v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  [v16 setRequestParameters:v18];
  unint64_t v11 = self->_style - 1;
  if (v11 >= 3)
  {
    uint64_t v13 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];

    if (v14 == 1) {
      id v12 = @"iPad";
    }
    else {
      id v12 = @"iPhone";
    }
  }
  else
  {
    id v12 = off_1E64221A8[v11];
  }
  [v16 setValue:v12 forRequestParameter:@"style"];

  return v16;
}

- (id)_previewOverlay
{
  previewOverlay = self->_previewOverlay;
  if (!previewOverlay)
  {
    uint64_t v4 = (SUPreviewOverlayViewController *)objc_alloc_init(MEMORY[0x1E4FB88E0]);
    uint64_t v5 = self->_previewOverlay;
    self->_previewOverlay = v4;

    uint64_t v6 = self->_previewOverlay;
    id v7 = [(SUViewController *)self clientInterface];
    [(SUPreviewOverlayViewController *)v6 setClientInterface:v7];

    previewOverlay = self->_previewOverlay;
  }

  return previewOverlay;
}

- (void)_reloadGotoStoreButton
{
  nativeURL = self->_nativeURL;
  if (nativeURL)
  {
    uint64_t v4 = nativeURL;
  }
  else
  {
    uint64_t v4 = [(SUStorePageViewController *)self->_storePageViewController displayedURL];
    if (!v4)
    {
      id v30 = 0;
      char v7 = 0;
      goto LABEL_9;
    }
  }
  id v30 = v4;
  uint64_t v5 = UIITunesStoreResolvedURLForHTTPURL();
  uint64_t v6 = [v5 scheme];
  if (([v6 isEqualToString:@"http"] & 1) != 0
    || ([v6 isEqualToString:@"https"] & 1) != 0)
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    char v7 = [v8 canOpenURL:v5];
  }
LABEL_9:
  rightBarButtonItem = self->_rightBarButtonItem;
  if (!rightBarButtonItem) {
    rightBarButtonItem = self->_gotoStoreButtonItem;
  }
  uint64_t v10 = rightBarButtonItem;
  if ((v7 & 1) != 0 && self->_showsStoreButton)
  {
    gotoStoreButtonItem = self->_gotoStoreButtonItem;
    if (!gotoStoreButtonItem)
    {
      id v12 = (SUBarButtonItem *)objc_alloc_init(MEMORY[0x1E4FB8898]);
      uint64_t v13 = self->_gotoStoreButtonItem;
      self->_gotoStoreButtonItem = v12;

      [(SUBarButtonItem *)self->_gotoStoreButtonItem setAction:sel__gotoStoreButtonAction_];
      [(SUBarButtonItem *)self->_gotoStoreButtonItem setTarget:self];
      uint64_t v14 = self->_gotoStoreButtonItem;
      uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v16 = [v15 localizedStringForKey:@"GOTO_STORE_BUTTON" value:&stru_1F1C879E8 table:0];
      [(SUBarButtonItem *)v14 setTitle:v16];

      gotoStoreButtonItem = self->_gotoStoreButtonItem;
    }
    id v17 = gotoStoreButtonItem;
  }
  else
  {
    id v18 = [(SUBarButtonItem *)self->_gotoStoreButtonItem target];

    if (v18 == self) {
      [(SUBarButtonItem *)self->_gotoStoreButtonItem setTarget:0];
    }
    id v19 = self->_gotoStoreButtonItem;
    self->_gotoStoreButtonItem = 0;

    id v17 = 0;
  }
  long long v20 = self->_rightBarButtonItem;
  if (self->_showsRightBarButton)
  {
    if (!v20)
    {
      long long v21 = (SUBarButtonItem *)objc_alloc_init(MEMORY[0x1E4FB8898]);
      long long v22 = self->_rightBarButtonItem;
      self->_rightBarButtonItem = v21;

      [(SUBarButtonItem *)self->_rightBarButtonItem setAction:sel__rightBarButtonAction_];
      [(SUBarButtonItem *)self->_rightBarButtonItem setTarget:self];
      [(SUBarButtonItem *)self->_rightBarButtonItem setTitle:self->_rightBarButtonTitle];
      long long v20 = self->_rightBarButtonItem;
    }
    long long v23 = v20;
    __int16 v24 = v17;
    id v17 = v23;
  }
  else
  {
    uint64_t v25 = [(SUBarButtonItem *)v20 target];

    if (v25 == self) {
      [(SUBarButtonItem *)self->_rightBarButtonItem setTarget:0];
    }
    __int16 v24 = self->_rightBarButtonItem;
    self->_rightBarButtonItem = 0;
  }

  uint64_t v26 = [(SUViewController *)self navigationItem];
  int v27 = [v26 rightBarButtonItems];
  id v28 = (id)[v27 mutableCopy];

  if (v10 != v17 || ([v28 containsObject:v10] & 1) == 0)
  {
    if (!v28 && v17) {
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    if (v28 && (uint64_t v29 = [v28 indexOfObjectIdenticalTo:v10], v29 != 0x7FFFFFFFFFFFFFFFLL))
    {
      if (v17) {
        [v28 replaceObjectAtIndex:v29 withObject:v17];
      }
      else {
        [v28 removeObjectAtIndex:v29];
      }
    }
    else if (v17)
    {
      [v28 addObject:v17];
    }
    [(SKUIITunesStoreUIPageViewController *)self->_storePageViewController resetNavigationItem:v26];
    [v26 setRightBarButtonItems:v28];
  }
}

- (void)_reloadViews
{
  if (![(SKProductPageViewController *)self isViewLoaded]) {
    return;
  }
  bannerViewController = self->_bannerViewController;
  if (!bannerViewController)
  {
    if (self->_ipadProductPageViewController)
    {
      uint64_t v4 = [(SKUIITunesStoreUIPageViewController *)self->_storePageViewController view];
      [v4 removeFromSuperview];

      uint64_t v5 = [(SKUIIPhoneProductPageViewController *)self->_iphoneProductPageViewController view];
      [v5 removeFromSuperview];

      bannerViewController = self->_ipadProductPageViewController;
    }
    else
    {
      storePageViewController = self->_storePageViewController;
      if (self->_iphoneProductPageViewController)
      {
        uint64_t v10 = [(SKUIITunesStoreUIPageViewController *)storePageViewController view];
        [v10 removeFromSuperview];

        unint64_t v11 = [(SKUIIPadProductPageViewController *)self->_ipadProductPageViewController view];
        [v11 removeFromSuperview];

        id v15 = [(SKUIIPhoneProductPageViewController *)self->_iphoneProductPageViewController view];
        [(SKUIViewController *)self->_iphoneProductPageViewController _setWishlistButtonHidden:1];
        [(SKUIViewController *)self->_iphoneProductPageViewController showDefaultNavigationItems];
        [(SKProductPageViewController *)self _reloadGotoStoreButton];
        uint64_t v6 = v15;
        if (!v15) {
          return;
        }
        goto LABEL_6;
      }
      if (!storePageViewController) {
        return;
      }
      id v12 = [0 view];
      [v12 removeFromSuperview];

      uint64_t v13 = [(SKUIIPadProductPageViewController *)self->_ipadProductPageViewController view];
      [v13 removeFromSuperview];

      bannerViewController = self->_storePageViewController;
    }
  }
  uint64_t v6 = [bannerViewController view];
  if (!v6) {
    return;
  }
LABEL_6:
  id v14 = v6;
  [v6 setAutoresizingMask:18];
  char v7 = [(SKProductPageViewController *)self view];
  [v7 bounds];
  objc_msgSend(v14, "setFrame:");

  uint64_t v8 = [(SKProductPageViewController *)self view];
  [v8 addSubview:v14];
}

- (void)_setResponse:(id)a3 forProperties:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  nativeURL = self->_nativeURL;
  self->_nativeURL = 0;

  lastPageEvent = self->_lastPageEvent;
  self->_lastPageEvent = 0;

  uint64_t v13 = [v8 bodyData];
  if (v13)
  {
    id v14 = +[SSVURLDataConsumer consumer];
    id v26 = v10;
    id v15 = [v14 objectForData:v13 response:0 error:&v26];
    id v16 = v26;

    if (v15)
    {
      id v17 = [v8 URL];
      [v15 setPageURL:v17];

      id v18 = [v8 metricsPageEvent];
      [(SKProductPageViewController *)self _showProductPage:v15 pageEvent:v18];

      id v19 = [v8 metricsPageEvent];
      long long v20 = self->_lastPageEvent;
      self->_lastPageEvent = v19;
    }
    else
    {
      id v21 = (id)[(SKProductPageViewController *)self view];
      long long v22 = [v8 MIMEType];
      int v23 = [v22 isEqualToString:@"text/html"];

      storePageViewController = self->_storePageViewController;
      if (v23)
      {
        uint64_t v25 = [v9 URL];
        [(SUStorePageViewController *)storePageViewController reloadWithStorePage:v13 ofType:1 forURL:v25];
      }
      else
      {
        [(SUStorePageViewController *)self->_storePageViewController reloadWithURLRequestProperties:v9];
      }
      [(SKProductPageViewController *)self _reloadGotoStoreButton];
    }

    id v10 = v16;
  }
  else
  {
    [(SKProductPageViewController *)self _sendDidFailLoadWithError:v10];
  }
}

- (void)_sendDidFailLoadWithError:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 productPage:self didFailLoadWithError:v7];
  }
}

- (void)_showPreviewOverlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(SKProductPageViewController *)self _previewOverlay];
  id v6 = [(SUViewController *)self navigationController];
  [v6 addChildViewController:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SKProductPageViewController__showPreviewOverlayAnimated___block_invoke;
  v8[3] = &unk_1E6422020;
  id v9 = v5;
  id v7 = v5;
  [v7 showInNavigationController:v6 animated:v3 completionBlock:v8];
}

void __59__SKProductPageViewController__showPreviewOverlayAnimated___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x1E4FB8928] object:*(void *)(a1 + 32)];
}

- (void)_showProductPage:(id)a3 pageEvent:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = [v6 item];
  id v10 = [v9 productPageURLString];
  unint64_t v11 = [v8 URLWithString:v10];
  nativeURL = self->_nativeURL;
  self->_nativeURL = v11;

  int64_t style = self->_style;
  if (style == 3
    || !style
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 userInterfaceIdiom],
        v14,
        v15 == 1))
  {
    [(SKUIClientContext *)self->_clientContext setUserInterfaceIdiomOverride:1];
    uint64_t v16 = 1192;
    [(SKUIIPadProductPageViewController *)self->_ipadProductPageViewController removeFromParentViewController];
    id v17 = SKUIIPadProductPageViewController;
  }
  else
  {
    [(SKUIClientContext *)self->_clientContext setUserInterfaceIdiomOverride:0];
    uint64_t v16 = 1200;
    [(SKUIIPhoneProductPageViewController *)self->_iphoneProductPageViewController removeFromParentViewController];
    id v17 = SKUIIPhoneProductPageViewController;
  }
  id v18 = (objc_class *)[[v17 alloc] initWithProductPage:v6];
  id v19 = *(Class *)((char *)&self->super.super.super.super.isa + v16);
  *(Class *)((char *)&self->super.super.super.super.isa + v16) = v18;

  long long v20 = *(Class *)((char *)&self->super.super.super.super.isa + v16);
  id v21 = [(SUViewController *)self navigationItem];
  [v20 _setExistingNavigationItem:v21];

  [*(id *)((char *)&self->super.super.super.super.isa + v16) setClientContext:self->_clientContext];
  [*(id *)((char *)&self->super.super.super.super.isa + v16) setDelegate:self];
  [*(id *)((char *)&self->super.super.super.super.isa + v16) configureMetricsWithPageEvent:v7];
  [*(id *)((char *)&self->super.super.super.super.isa + v16) setAskPermission:self->_askToBuy];
  if (self->_askToBuy) {
    promptString = self->_promptString;
  }
  else {
    promptString = 0;
  }
  [*(id *)((char *)&self->super.super.super.super.isa + v16) setBannerText:promptString];
  if (!*(Class *)((char *)&self->super.super.super.super.isa + v16))
  {
    [(SKProductPageViewController *)self _reloadViews];
    [(SKProductPageViewController *)self _reloadGotoStoreButton];
    id v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F3C348];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    uint64_t v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v28 = [v25 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_1F1C879E8 table:0];
    v32[0] = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v30 = [v26 errorWithDomain:v27 code:5 userInfo:v29];
    [(SKProductPageViewController *)self _sendDidFailLoadWithError:v30];

    goto LABEL_13;
  }
  -[SKProductPageViewController addChildViewController:](self, "addChildViewController:");
  [(SKProductPageViewController *)self _reloadViews];
  [(SKProductPageViewController *)self _reloadGotoStoreButton];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    uint64_t v25 = objc_loadWeakRetained((id *)&self->_delegate);
    [v25 productPageDidFinishLoad:self];
LABEL_13:
  }
}

- (NSString)additionalPurchaseParameters
{
  return self->_additionalPurchaseParameters;
}

- (NSString)affiliateIdentifier
{
  return self->_affiliateIdentifier;
}

- (SKProductPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKProductPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)productPageStyle
{
  return self->_style;
}

- (NSString)promptString
{
  return self->_promptString;
}

- (NSString)rightBarButtonTitle
{
  return self->_rightBarButtonTitle;
}

- (void)setRightBarButtonTitle:(id)a3
{
}

- (BOOL)isPreview
{
  return self->_preview;
}

- (void)setPreview:(BOOL)a3
{
  self->_preview = a3;
}

- (BOOL)showsRightBarButton
{
  return self->_showsRightBarButton;
}

- (void)setShowsRightBarButton:(BOOL)a3
{
  self->_showsRightBarButton = a3;
}

- (BOOL)showsStoreButton
{
  return self->_showsStoreButton;
}

- (void)setShowsStoreButton:(BOOL)a3
{
  self->_showsStoreButton = a3;
}

- (int64_t)URLBagType
{
  return self->_urlBagType;
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (NSURL)mainDocumentURL
{
  return self->_mainDocumentURL;
}

- (void)setMainDocumentURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_storePageViewController, 0);
  objc_storeStrong((id *)&self->_promptString, 0);
  objc_storeStrong((id *)&self->_rightBarButtonTitle, 0);
  objc_storeStrong((id *)&self->_purchaseManager, 0);
  objc_storeStrong((id *)&self->_productParameters, 0);
  objc_storeStrong((id *)&self->_previewOverlay, 0);
  objc_storeStrong((id *)&self->_nativeURL, 0);
  objc_storeStrong((id *)&self->_lastPageEvent, 0);
  objc_storeStrong((id *)&self->_itemStateCenter, 0);
  objc_storeStrong((id *)&self->_iphoneProductPageViewController, 0);
  objc_storeStrong((id *)&self->_ipadProductPageViewController, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_gotoStoreButtonItem, 0);
  objc_storeStrong((id *)&self->_dialogManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bannerViewController, 0);
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);

  objc_storeStrong((id *)&self->_additionalPurchaseParameters, 0);
}

- (void)_initSKProductPageViewController
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKProductPageViewController _initSKProductPageViewController]";
}

@end