@interface SUUIProductPageOverlayController
- (NSArray)URLs;
- (SUUIClientContext)clientContext;
- (SUUIProductPageOverlayController)initWithParentViewController:(id)a3;
- (SUUIProductPageOverlayDelegate)delegate;
- (UIView)view;
- (UIViewController)parentViewController;
- (int64_t)numberOfVisibleOverlays;
- (void)_backstopViewAction:(id)a3;
- (void)_finishDismissAndNotifyDelegate:(BOOL)a3 withViewController:(id)a4;
- (void)_removeOverlayViewController;
- (void)_showOverlayViewController;
- (void)_showWithInitialViewController:(id)a3;
- (void)dealloc;
- (void)iPadProductPage:(id)a3 openItem:(id)a4;
- (void)iPadProductPage:(id)a3 openURL:(id)a4 viewControllerBlock:(id)a5;
- (void)iPadProductPageCannotOpen:(id)a3;
- (void)productViewControllerDidFinish:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showWithInitialItem:(id)a3;
- (void)showWithInitialItemIdentifier:(int64_t)a3;
- (void)showWithInitialProductPage:(id)a3 metricsPageEvent:(id)a4;
- (void)showWithInitialURL:(id)a3;
- (void)showWithInitialURLRequest:(id)a3;
- (void)showWithInitialURLs:(id)a3;
@end

@implementation SUUIProductPageOverlayController

- (SUUIProductPageOverlayController)initWithParentViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIProductPageOverlayController;
  v5 = [(SUUIProductPageOverlayController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_parentViewController, v4);
  }

  return v6;
}

- (void)dealloc
{
  if (self->_overlayViewController) {
    [(SUUIProductPageOverlayController *)self _removeOverlayViewController];
  }
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageOverlayController;
  [(SUUIProductPageOverlayController *)&v3 dealloc];
}

- (int64_t)numberOfVisibleOverlays
{
  v2 = [(SUUIOverlayContainerViewController *)self->_overlayViewController viewControllers];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)showWithInitialItem:(id)a3
{
  id v4 = (SUUIItem *)a3;
  v6 = [[SUUIIPadProductPageViewController alloc] initWithItem:v4];
  initialItem = self->_initialItem;
  self->_initialItem = v4;

  [(SUUIProductPageOverlayController *)self _showWithInitialViewController:v6];
}

- (void)showWithInitialItemIdentifier:(int64_t)a3
{
  id v4 = [[SUUIIPadProductPageViewController alloc] initWithItemIdentifier:a3];
  [(SUUIProductPageOverlayController *)self _showWithInitialViewController:v4];
}

- (void)showWithInitialProductPage:(id)a3 metricsPageEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [[SUUIIPadProductPageViewController alloc] initWithProductPage:v7];

  objc_super v8 = [(SUUIProductPageOverlayController *)self clientContext];
  [(SUUIIPadProductPageViewController *)v9 setClientContext:v8];

  [(SUUIIPadProductPageViewController *)v9 configureMetricsWithPageEvent:v6];
  [(SUUIProductPageOverlayController *)self _showWithInitialViewController:v9];
}

- (void)showWithInitialURL:(id)a3
{
  id v4 = a3;
  v5 = [[SUUIIPadProductPageViewController alloc] initWithURL:v4];

  [(SUUIProductPageOverlayController *)self _showWithInitialViewController:v5];
}

- (void)showWithInitialURLRequest:(id)a3
{
  id v4 = a3;
  v5 = [[SUUIIPadProductPageViewController alloc] initWithURLRequest:v4];

  [(SUUIProductPageOverlayController *)self _showWithInitialViewController:v5];
}

- (void)showWithInitialURLs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SUUIProductPageOverlayController *)self _showOverlayViewController];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        v12 = [SUUIIPadProductPageViewController alloc];
        v13 = -[SUUIIPadProductPageViewController initWithURL:](v12, "initWithURL:", v11, (void)v15);
        v14 = [(SUUIProductPageOverlayController *)self clientContext];
        [(SUUIIPadProductPageViewController *)v13 setClientContext:v14];

        [(SUUIIPadProductPageViewController *)v13 setDelegate:self];
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(SUUIOverlayContainerViewController *)self->_overlayViewController showViewControllers:v5];
}

- (NSArray)URLs
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(SUUIOverlayContainerViewController *)self->_overlayViewController viewControllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) URL];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (UIView)view
{
  return (UIView *)[(SUUIOverlayContainerViewController *)self->_overlayViewController view];
}

- (void)iPadProductPage:(id)a3 openItem:(id)a4
{
  id v5 = a4;
  uint64_t v7 = [[SUUIIPadProductPageViewController alloc] initWithItem:v5];

  uint64_t v6 = [(SUUIProductPageOverlayController *)self clientContext];
  [(SUUIIPadProductPageViewController *)v7 setClientContext:v6];

  [(SUUIIPadProductPageViewController *)v7 setDelegate:self];
  [(SUUIOverlayContainerViewController *)self->_overlayViewController showViewController:v7 withCompletionBlock:0];
}

- (void)iPadProductPage:(id)a3 openURL:(id)a4 viewControllerBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = v10;
  if (v10 && ((*((void (**)(id))v10 + 2))(v10), (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v13 = (void *)v12;
    clientContext = self->_clientContext;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    uint64_t v16 = [(SUUIClientContext *)clientContext metricsPageContextForViewController:WeakRetained];

    [(SUUIClientContext *)self->_clientContext setMetricsPageContext:v16 forViewController:v13];
    if (self->_initialItem
      && (id v17 = objc_loadWeakRetained((id *)&self->_delegate),
          char v18 = objc_opt_respondsToSelector(),
          v17,
          (v18 & 1) != 0)
      && (id v19 = objc_loadWeakRetained((id *)&self->_delegate),
          [v19 productPageOverlay:self flipSourceViewToDismissItem:self->_initialItem],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          v19,
          v20))
    {
      v21 = objc_alloc_init(SUUIOverlayFlipTransition);
      [(SUUIOverlayFlipTransition *)v21 setFlipSourceView:v20];
      overlayViewController = self->_overlayViewController;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __80__SUUIProductPageOverlayController_iPadProductPage_openURL_viewControllerBlock___block_invoke_2;
      v26[3] = &unk_265400890;
      v26[4] = self;
      id v27 = v13;
      id v23 = v13;
      [(SUUIOverlayContainerViewController *)overlayViewController dismissWithFlipTransition:v21 completionBlock:v26];
    }
    else
    {
      v24 = self->_overlayViewController;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __80__SUUIProductPageOverlayController_iPadProductPage_openURL_viewControllerBlock___block_invoke;
      v28[3] = &unk_265400890;
      v28[4] = self;
      id v29 = v13;
      id v25 = v13;
      [(SUUIOverlayContainerViewController *)v24 dismissWithFadeTransitionCompletionBlock:v28];
    }
  }
  else if (v9)
  {
    SUUIMetricsOpenURL(v9);
  }
}

uint64_t __80__SUUIProductPageOverlayController_iPadProductPage_openURL_viewControllerBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishDismissAndNotifyDelegate:1 withViewController:*(void *)(a1 + 40)];
}

uint64_t __80__SUUIProductPageOverlayController_iPadProductPage_openURL_viewControllerBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishDismissAndNotifyDelegate:1 withViewController:*(void *)(a1 + 40)];
}

- (void)iPadProductPageCannotOpen:(id)a3
{
  id v8 = [a3 URL];
  [(SUUIProductPageOverlayController *)self _finishDismissAndNotifyDelegate:0 withViewController:0];
  id v4 = objc_alloc_init(MEMORY[0x263F17FC8]);
  [v4 loadProductWithURL:v8 completionBlock:0];
  [v4 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  uint64_t v6 = [WeakRetained navigationController];
  uint64_t v7 = [v6 topViewController];

  [v7 presentViewController:v4 animated:1 completion:0];
}

- (void)_backstopViewAction:(id)a3
{
  id v4 = a3;
  if (self->_initialItem
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v6 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v6 & 1) != 0)
    && (id v7 = objc_loadWeakRetained((id *)&self->_delegate),
        [v7 productPageOverlay:self flipSourceViewToDismissItem:self->_initialItem],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    id v9 = objc_alloc_init(SUUIOverlayFlipTransition);
    [(SUUIOverlayFlipTransition *)v9 setFlipSourceView:v8];
    overlayViewController = self->_overlayViewController;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__SUUIProductPageOverlayController__backstopViewAction___block_invoke_2;
    v12[3] = &unk_265400980;
    v12[4] = self;
    [(SUUIOverlayContainerViewController *)overlayViewController dismissWithFlipTransition:v9 completionBlock:v12];
  }
  else
  {
    long long v11 = self->_overlayViewController;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __56__SUUIProductPageOverlayController__backstopViewAction___block_invoke;
    v13[3] = &unk_265400980;
    v13[4] = self;
    [(SUUIOverlayContainerViewController *)v11 dismissWithFadeTransitionCompletionBlock:v13];
  }
}

uint64_t __56__SUUIProductPageOverlayController__backstopViewAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishDismissAndNotifyDelegate:1 withViewController:0];
}

uint64_t __56__SUUIProductPageOverlayController__backstopViewAction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishDismissAndNotifyDelegate:1 withViewController:0];
}

- (void)productViewControllerDidFinish:(id)a3
{
  [a3 dismissViewControllerAnimated:1 completion:0];
  [(SUUIProductPageOverlayController *)self _finishDismissAndNotifyDelegate:1 withViewController:0];
}

- (void)_finishDismissAndNotifyDelegate:(BOOL)a3 withViewController:(id)a4
{
  BOOL v4 = a3;
  id v19 = a4;
  if ([(SUUIOverlayContainerViewController *)self->_overlayViewController isViewLoaded])
  {
    char v6 = [(SUUIOverlayContainerViewController *)self->_overlayViewController view];
    [v6 removeFromSuperview];
  }
  id v7 = [(SUUIOverlayContainerViewController *)self->_overlayViewController viewControllers];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_17];

  id v8 = [(SUUIOverlayContainerViewController *)self->_overlayViewController backstopControl];
  [v8 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(SUUIOverlayContainerViewController *)self->_overlayViewController removeFromParentViewController];
  overlayViewController = self->_overlayViewController;
  self->_overlayViewController = 0;

  initialItem = self->_initialItem;
  self->_initialItem = 0;

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = v13;
    if (v12)
    {
      [v13 productPageOverlayDidDismiss:self toPresentViewController:v19];
      goto LABEL_10;
    }
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 productPageOverlayDidDismiss:self];
    }
  }
  id v17 = v19;
  if (!v19) {
    goto LABEL_11;
  }
  id v14 = objc_loadWeakRetained((id *)&self->_parentViewController);
  char v18 = [v14 navigationController];
  [v18 pushViewController:v19 animated:1];

LABEL_10:
  id v17 = v19;
LABEL_11:
}

uint64_t __87__SUUIProductPageOverlayController__finishDismissAndNotifyDelegate_withViewController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

- (void)_removeOverlayViewController
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t v3 = [(SUUIOverlayContainerViewController *)self->_overlayViewController viewControllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v7++) setDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  if ([(SUUIOverlayContainerViewController *)self->_overlayViewController isViewLoaded])
  {
    id v8 = [(SUUIOverlayContainerViewController *)self->_overlayViewController backstopControl];
    [v8 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

    id v9 = [(SUUIOverlayContainerViewController *)self->_overlayViewController view];
    [v9 removeFromSuperview];
  }
  [(SUUIOverlayContainerViewController *)self->_overlayViewController removeFromParentViewController];
  overlayViewController = self->_overlayViewController;
  self->_overlayViewController = 0;
}

- (void)_showOverlayViewController
{
  p_parentViewController = &self->_parentViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  SUUIViewControllerGetAncestorTabBarController(WeakRetained);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_overlayViewController)
  {
    uint64_t v5 = objc_alloc_init(SUUIOverlayContainerViewController);
    overlayViewController = self->_overlayViewController;
    self->_overlayViewController = v5;

    [v21 addChildViewController:self->_overlayViewController];
    uint64_t v7 = [(SUUIOverlayContainerViewController *)self->_overlayViewController backstopControl];
    [v7 addTarget:self action:sel__backstopViewAction_ forControlEvents:64];

    clientContext = self->_clientContext;
    id v9 = objc_loadWeakRetained((id *)p_parentViewController);
    id v10 = [(SUUIClientContext *)clientContext metricsPageContextForViewController:v9];

    [(SUUIClientContext *)self->_clientContext setMetricsPageContext:v10 forViewController:self->_overlayViewController];
  }
  long long v11 = [v21 view];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [(SUUIOverlayContainerViewController *)self->_overlayViewController view];
  [v20 setAutoresizingMask:18];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
  [v11 addSubview:v20];
}

- (void)_showWithInitialViewController:(id)a3
{
  uint64_t v4 = (SUUIOverlayFlipTransition *)a3;
  uint64_t v5 = [(SUUIProductPageOverlayController *)self clientContext];
  [(SUUIOverlayFlipTransition *)v4 setClientContext:v5];

  [(SUUIOverlayFlipTransition *)v4 setDelegate:self];
  [(SUUIProductPageOverlayController *)self _showOverlayViewController];
  if (self->_initialItem
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v7 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v7 & 1) != 0)
    && (id v8 = objc_loadWeakRetained((id *)&self->_delegate),
        [v8 productPageOverlay:self flipSourceViewToPresentItem:self->_initialItem],
        id v9 = (SUUIOverlayFlipTransition *)objc_claimAutoreleasedReturnValue(),
        v8,
        v9))
  {
    id v10 = objc_alloc_init(SUUIOverlayFlipTransition);
    [(SUUIOverlayFlipTransition *)v10 setFlipSourceView:v9];
    overlayViewController = self->_overlayViewController;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __67__SUUIProductPageOverlayController__showWithInitialViewController___block_invoke_2;
    v14[3] = &unk_265400980;
    double v15 = v4;
    double v12 = v4;
    [(SUUIOverlayContainerViewController *)overlayViewController showViewController:v12 withFlipTransition:v10 completionBlock:v14];
  }
  else
  {
    double v13 = self->_overlayViewController;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__SUUIProductPageOverlayController__showWithInitialViewController___block_invoke;
    v16[3] = &unk_265400980;
    double v17 = v4;
    id v9 = v4;
    [(SUUIOverlayContainerViewController *)v13 showViewController:v9 withCompletionBlock:v16];
    id v10 = v17;
  }
}

uint64_t __67__SUUIProductPageOverlayController__showWithInitialViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

uint64_t __67__SUUIProductPageOverlayController__showWithInitialViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIProductPageOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIProductPageOverlayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_storeStrong((id *)&self->_initialItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end