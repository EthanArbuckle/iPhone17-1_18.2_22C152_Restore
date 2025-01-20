@interface SKUIViewController
- (BOOL)showingError;
- (NSOperationQueue)operationQueue;
- (SKUIClientContext)clientContext;
- (SKUIIPadSearchController)IPadSearchController;
- (SKUIViewController)initWithTabBarItem:(id)a3;
- (UIBarButtonItem)_wishlistButtonItem;
- (id)_defaultLeftBarButtonItems;
- (id)_defaultRightBarButtonItemsIsCompact:(BOOL)a3;
- (id)_getIPadSearchController;
- (unint64_t)supportedInterfaceOrientations;
- (void)_presentWishlistFromPopover:(id)a3;
- (void)_presentWishlistFromSheet;
- (void)_reloadForOrientation:(int64_t)a3;
- (void)_setWishlistButtonHidden:(BOOL)a3;
- (void)_showDialogWithError:(id)a3;
- (void)_wishlistAction:(id)a3;
- (void)_wishlistPopoverDidDismiss;
- (void)dealloc;
- (void)forceOrientationBackToSupportedOrientation;
- (void)networkErrorViewControllerInvalidated:(id)a3;
- (void)productPageOverlayDidDismiss:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)showDefaultNavigationItems;
- (void)showDefaultNavigationItemsForSize:(CGSize)a3;
- (void)showDefaultNavigationItemsIsCompact:(BOOL)a3;
- (void)showError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)wishlist:(id)a3 didSelectItem:(id)a4 atIndexPath:(id)a5;
@end

@implementation SKUIViewController

- (SKUIViewController)initWithTabBarItem:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIViewController initWithTabBarItem:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIViewController;
  v5 = [(SKUIViewController *)&v9 init];
  if (v5)
  {
    v6 = [v4 underlyingTabBarItem];
    [(SKUIViewController *)v5 setTabBarItem:v6];
    v7 = [v6 _internalTitle];
    [(SKUIViewController *)v5 setTitle:v7];
  }
  return v5;
}

- (void)dealloc
{
  [(SKUINetworkErrorViewController *)self->_networkErrorViewController setDelegate:0];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  [(UIBarButtonItem *)self->_wishlistButtonItem setTarget:0];
  [(SKUIPopoverObserver *)self->_wishlistPopoverObserver setTarget:0 selector:0];
  [(SKUIWishlistViewController *)self->_wishlistViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIViewController;
  [(SKUIViewController *)&v3 dealloc];
}

- (SKUIIPadSearchController)IPadSearchController
{
  objc_super v3 = (void *)SKUIUserInterfaceIdiom(self->_clientContext);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    v5 = [v4 keyWindow];
    [v5 bounds];
    if (v6 <= SKUICompactThreshold())
    {
    }
    else
    {
      BOOL v7 = [(SKUIClientContext *)self->_clientContext shouldForceTransientSearchControllerBahavior];

      if (!v7)
      {
        objc_super v3 = [(SKUIViewController *)self _getIPadSearchController];
        goto LABEL_7;
      }
    }
    objc_super v3 = 0;
  }
LABEL_7:

  return (SKUIIPadSearchController *)v3;
}

- (id)_getIPadSearchController
{
  searchController = self->_searchController;
  if (!searchController)
  {
    id v4 = [[SKUIIPadSearchController alloc] initWithParentViewController:self];
    v5 = self->_searchController;
    self->_searchController = v4;

    double v6 = self->_searchController;
    BOOL v7 = [(SKUIViewController *)self clientContext];
    [(SKUIIPadSearchController *)v6 setClientContext:v7];

    searchController = self->_searchController;
  }

  return searchController;
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:2];
    double v6 = self->_operationQueue;
    BOOL v7 = [NSString stringWithFormat:@"com.apple.StoreKitUI.%@.%p", objc_opt_class(), self];
    [(NSOperationQueue *)v6 setName:v7];

    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)setClientContext:(id)a3
{
  v5 = (SKUIClientContext *)a3;
  if (self->_clientContext != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    [(SKUIIPadSearchController *)self->_searchController setClientContext:self->_clientContext];
    v5 = v6;
  }
}

- (void)showDefaultNavigationItems
{
  objc_super v3 = [(SKUIViewController *)self navigationItem];
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  v5 = [v4 keyWindow];
  [v5 bounds];
  BOOL v7 = [(SKUIViewController *)self _defaultRightBarButtonItemsIsCompact:v6 <= SKUICompactThreshold()];
  [v3 setRightBarButtonItems:v7];

  id v9 = [(SKUIViewController *)self navigationItem];
  v8 = [(SKUIViewController *)self _defaultLeftBarButtonItems];
  [v9 setLeftBarButtonItems:v8];
}

- (void)showDefaultNavigationItemsForSize:(CGSize)a3
{
  double width = a3.width;
  v5 = [(SKUIViewController *)self navigationItem];
  double v6 = [(SKUIViewController *)self _defaultLeftBarButtonItems];
  [v5 setLeftBarButtonItems:v6];

  id v8 = [(SKUIViewController *)self navigationItem];
  BOOL v7 = [(SKUIViewController *)self _defaultRightBarButtonItemsIsCompact:width <= SKUICompactThreshold()];
  [v8 setRightBarButtonItems:v7];
}

- (void)showDefaultNavigationItemsIsCompact:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SKUIViewController *)self navigationItem];
  double v6 = [(SKUIViewController *)self _defaultLeftBarButtonItems];
  [v5 setLeftBarButtonItems:v6];

  id v8 = [(SKUIViewController *)self navigationItem];
  BOOL v7 = [(SKUIViewController *)self _defaultRightBarButtonItemsIsCompact:v3];
  [v8 setRightBarButtonItems:v7];
}

- (void)showError:(id)a3
{
  id v10 = a3;
  if (+[SKUINetworkErrorViewController canDisplayError:](SKUINetworkErrorViewController, "canDisplayError:"))
  {
    if (!self->_networkErrorViewController)
    {
      id v4 = [[SKUINetworkErrorViewController alloc] initWithError:v10];
      networkErrorViewController = self->_networkErrorViewController;
      self->_networkErrorViewController = v4;

      double v6 = self->_networkErrorViewController;
      BOOL v7 = [(SKUIViewController *)self clientContext];
      [(SKUINetworkErrorViewController *)v6 setClientContext:v7];

      [(SKUINetworkErrorViewController *)self->_networkErrorViewController setDelegate:self];
      [(SKUIViewController *)self addChildViewController:self->_networkErrorViewController];
      id v8 = [(SKUIViewController *)self view];
      id v9 = [(SKUINetworkErrorViewController *)self->_networkErrorViewController view];
      [v9 setAutoresizingMask:18];
      [v8 bounds];
      objc_msgSend(v9, "setFrame:");
      [v8 addSubview:v9];
    }
  }
  else
  {
    NSLog(&cfstr_LoadFailure.isa, v10);
    if (SKUIViewControllerIsVisible(self)) {
      [(SKUIViewController *)self _showDialogWithError:v10];
    }
  }
}

- (BOOL)showingError
{
  return self->_networkErrorViewController != 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1) {
    return 30;
  }
  if (SKUIAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIViewController;
  [(SKUIViewController *)&v4 viewWillAppear:a3];
  [(SKUIViewController *)self _reloadForOrientation:[(SKUIViewController *)self interfaceOrientation]];
  [(SKUIIPadSearchController *)self->_searchController reloadSearchField];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIViewController;
  -[SKUIViewController willAnimateRotationToInterfaceOrientation:duration:](&v6, sel_willAnimateRotationToInterfaceOrientation_duration_, a4);
  [(SKUIViewController *)self _reloadForOrientation:a3];
}

- (void)forceOrientationBackToSupportedOrientation
{
  id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ((unint64_t)([v7 statusBarOrientation] - 3) <= 1
    && ([(SKUIViewController *)self supportedInterfaceOrientations] & 0x18) == 0)
  {
    if (![(SKUIViewController *)self isViewLoaded]
      || ([(SKUIViewController *)self view],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          [v3 window],
          objc_super v4 = objc_claimAutoreleasedReturnValue(),
          v3,
          !v4))
    {
      v5 = [(SKUIViewController *)self presentedViewController];
      objc_super v6 = [v5 view];
      objc_super v4 = [v6 window];

      if (!v4)
      {
        objc_super v4 = [MEMORY[0x1E4FB1F48] keyWindow];
      }
    }
    [v4 _setRotatableViewOrientation:1 duration:1 force:0.0];
  }
}

- (void)networkErrorViewControllerInvalidated:(id)a3
{
  id v4 = a3;
  networkErrorViewController = self->_networkErrorViewController;
  if (networkErrorViewController)
  {
    id v8 = v4;
    [networkErrorViewController setDelegate:0];
    objc_super v6 = [(SKUINetworkErrorViewController *)self->_networkErrorViewController view];
    [v6 removeFromSuperview];

    [(SKUINetworkErrorViewController *)self->_networkErrorViewController removeFromParentViewController];
    id v7 = self->_networkErrorViewController;
    self->_networkErrorViewController = 0;

    networkErrorViewController = (void *)SKUIViewControllerIsVisible(self);
    id v4 = v8;
    if (networkErrorViewController)
    {
      networkErrorViewController = (void *)[(SKUIViewController *)self reloadData];
      id v4 = v8;
    }
  }

  MEMORY[0x1F41817F8](networkErrorViewController, v4);
}

- (void)_wishlistPopoverDidDismiss
{
  [(SKUIPopoverObserver *)self->_wishlistPopoverObserver setTarget:0 selector:0];
  wishlistPopoverObserver = self->_wishlistPopoverObserver;
  self->_wishlistPopoverObserver = 0;

  [(SKUIWishlistViewController *)self->_wishlistViewController setDelegate:0];
  wishlistViewController = self->_wishlistViewController;
  self->_wishlistViewController = 0;
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  [(SKUIProductPageOverlayController *)self->_productPageOverlayController setDelegate:0];
  productPageOverlayController = self->_productPageOverlayController;
  self->_productPageOverlayController = 0;
}

- (void)wishlist:(id)a3 didSelectItem:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  if (![v9 userInterfaceIdiom])
  {

    goto LABEL_7;
  }
  id v10 = [MEMORY[0x1E4FB1438] sharedApplication];
  v11 = [v10 keyWindow];
  [v11 bounds];
  double v13 = v12;
  double v14 = SKUICompactThreshold();

  if (v13 <= v14)
  {
LABEL_7:
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __57__SKUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke;
    v28[3] = &unk_1E6421FF8;
    v23 = &v29;
    v28[4] = self;
    id v29 = v8;
    id v25 = v8;
    [v7 dismissViewControllerAnimated:1 completion:v28];
    goto LABEL_8;
  }
  [(SKUIPopoverObserver *)self->_wishlistPopoverObserver setTarget:0 selector:0];
  [(SKUIPopoverObserver *)self->_wishlistPopoverObserver dismissPopoverAnimated:1];
  wishlistPopoverObserver = self->_wishlistPopoverObserver;
  self->_wishlistPopoverObserver = 0;

  [(SKUIWishlistViewController *)self->_wishlistViewController setDelegate:0];
  wishlistViewController = self->_wishlistViewController;
  self->_wishlistViewController = 0;

  if (!self->_productPageOverlayController)
  {
    v17 = [[SKUIProductPageOverlayController alloc] initWithParentViewController:self];
    productPageOverlayController = self->_productPageOverlayController;
    self->_productPageOverlayController = v17;

    v19 = self->_productPageOverlayController;
    v20 = [(SKUIViewController *)self clientContext];
    [(SKUIProductPageOverlayController *)v19 setClientContext:v20];

    [(SKUIProductPageOverlayController *)self->_productPageOverlayController setDelegate:self];
  }
  UIAnimationDragCoefficient();
  dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v21 * 0.35 * 1000000000.0));
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __57__SKUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_4;
  v26[3] = &unk_1E6421FF8;
  v23 = &v27;
  v26[4] = self;
  id v27 = v8;
  id v24 = v8;
  dispatch_after(v22, MEMORY[0x1E4F14428], v26);
LABEL_8:
}

void __57__SKUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clientContext];
  BOOL v3 = [*(id *)(a1 + 40) lookupDictionary];
  id v4 = SKUIXEventSidepackDictionary((uint64_t)v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SKUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_2;
  v6[3] = &unk_1E64254B8;
  id v7 = *(id *)(a1 + 40);
  id v8 = v2;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v2;
  [v5 sendOnXEventWithDictionary:v4 completionBlock:v6];
}

void __57__SKUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SKUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_3;
    block[3] = &unk_1E64225B0;
    id v6 = *(id *)(a1 + 32);
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v7 = v3;
    uint64_t v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __57__SKUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_3(uint64_t a1)
{
  id v3 = [[SKUIIPhoneProductPageViewController alloc] initWithItem:*(void *)(a1 + 32)];
  [(SKUIViewController *)v3 setClientContext:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 48) navigationController];
  [v2 pushViewController:v3 animated:1];
}

uint64_t __57__SKUIViewController_wishlist_didSelectItem_atIndexPath___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1000) showWithInitialItem:*(void *)(a1 + 40)];
}

- (void)_setWishlistButtonHidden:(BOOL)a3
{
  self->_wishlistButtonHidden = a3;
}

- (void)_wishlistAction:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  if (![v4 userInterfaceIdiom])
  {

    goto LABEL_7;
  }
  id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v6 = [v5 keyWindow];
  [v6 bounds];
  double v8 = v7;
  double v9 = SKUICompactThreshold();

  if (v8 <= v9)
  {
LABEL_7:
    [(SKUIViewController *)self _presentWishlistFromSheet];
    goto LABEL_8;
  }
  wishlistPopoverObserver = self->_wishlistPopoverObserver;
  if (wishlistPopoverObserver)
  {
    [(SKUIPopoverObserver *)wishlistPopoverObserver setTarget:0 selector:0];
    [(SKUIPopoverObserver *)self->_wishlistPopoverObserver dismissPopoverAnimated:1];
    v11 = self->_wishlistPopoverObserver;
    self->_wishlistPopoverObserver = 0;

    [(SKUIWishlistViewController *)self->_wishlistViewController setDelegate:0];
    wishlistViewController = self->_wishlistViewController;
    self->_wishlistViewController = 0;
  }
  [(SKUIViewController *)self _presentWishlistFromPopover:v13];
LABEL_8:
}

- (void)_presentWishlistFromSheet
{
  id v5 = [(SKUIViewController *)self clientContext];
  id v3 = objc_alloc_init(SKUIWishlistViewController);
  [(SKUIWishlistViewController *)v3 setClientContext:v5];
  [(SKUIWishlistViewController *)v3 setDelegate:self];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];
  [v4 setModalPresentationStyle:2];
  [(SKUIViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_presentWishlistFromPopover:(id)a3
{
  id v4 = a3;
  id v11 = [(SKUIViewController *)self clientContext];
  id v5 = objc_alloc_init(SKUIWishlistViewController);
  wishlistViewController = self->_wishlistViewController;
  self->_wishlistViewController = v5;

  [(SKUIWishlistViewController *)self->_wishlistViewController setClientContext:v11];
  [(SKUIWishlistViewController *)self->_wishlistViewController setDelegate:self];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_wishlistViewController];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1AF8]) initWithContentViewController:v7];
  objc_msgSend(v8, "setPopoverContentSize:", 320.0, 416.0);
  [v8 presentPopoverFromBarButtonItem:v4 permittedArrowDirections:1 animated:1];

  double v9 = [[SKUIPopoverObserver alloc] initWithPopoverController:v8];
  wishlistPopoverObserver = self->_wishlistPopoverObserver;
  self->_wishlistPopoverObserver = v9;

  [(SKUIPopoverObserver *)self->_wishlistPopoverObserver setTarget:self selector:sel__wishlistPopoverDidDismiss];
}

- (void)_showDialogWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIViewController *)self clientContext];
  id v6 = [v5 localizedAlertWithError:v4];

  [v6 show];
}

- (void)_reloadForOrientation:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [(SKUIViewController *)self navigationItem];
  id v5 = [v4 rightBarButtonItems];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "customView", (void)v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 sizeToFit];
          [v11 frame];
          objc_msgSend(v11, "setFrame:");
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  double v12 = [(SKUIViewController *)self navigationItem];
  [v12 setRightBarButtonItems:0];

  id v13 = [(SKUIViewController *)self navigationItem];
  [v13 setRightBarButtonItems:v6];
}

- (id)_defaultLeftBarButtonItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(SKUIViewController *)self clientContext];
  id v5 = [v4 additionalLeftBarButtonItemForViewController:self];

  if (v5) {
    [v3 addObject:v5];
  }

  return v3;
}

- (id)_defaultRightBarButtonItemsIsCompact:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(SKUIViewController *)self clientContext];
  uint64_t v7 = [v6 additionalRightBarButtonItemForViewController:self];

  if (v7) {
    [v5 addObject:v7];
  }
  uint64_t v8 = [(SKUIViewController *)self IPadSearchController];
  uint64_t v9 = (void *)[v8 newSearchFieldBarItem];

  if (!v9 && !v3)
  {
    if (SKUIUserInterfaceIdiom(self->_clientContext) != 1)
    {
      uint64_t v9 = 0;
      goto LABEL_12;
    }
    id v10 = [(SKUIViewController *)self _getIPadSearchController];
    uint64_t v9 = (void *)[v10 newSearchFieldBarItem];
  }
  if (v9)
  {
    id v11 = [(SKUIViewController *)self clientContext];
    int v12 = [v11 storeViewController:self shouldDisplayDefaultDarButton:0];

    if (v12)
    {
      if (!v3) {
        [v5 addObject:v9];
      }
    }
  }
LABEL_12:
  if (!self->_wishlistButtonHidden)
  {
    id v13 = [(SKUIViewController *)self clientContext];
    int v14 = [v13 storeViewController:self shouldDisplayDefaultDarButton:1];

    if (v14)
    {
      wishlistButtonItem = self->_wishlistButtonItem;
      if (!wishlistButtonItem)
      {
        long long v16 = [(SKUIViewController *)self clientContext];
        long long v17 = +[SKUIWishlistViewController wishlistBarButtonItemWithClientContext:v16];
        v18 = self->_wishlistButtonItem;
        self->_wishlistButtonItem = v17;

        [(UIBarButtonItem *)self->_wishlistButtonItem setAction:sel__wishlistAction_];
        [(UIBarButtonItem *)self->_wishlistButtonItem setTarget:self];
        wishlistButtonItem = self->_wishlistButtonItem;
      }
      [v5 addObject:wishlistButtonItem];
    }
  }

  return v5;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setOperationQueue:(id)a3
{
}

- (UIBarButtonItem)_wishlistButtonItem
{
  return self->_wishlistButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wishlistViewController, 0);
  objc_storeStrong((id *)&self->_wishlistPopoverObserver, 0);
  objc_storeStrong((id *)&self->_wishlistButtonItem, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_productPageOverlayController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_networkErrorViewController, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithTabBarItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIViewController initWithTabBarItem:]";
}

@end