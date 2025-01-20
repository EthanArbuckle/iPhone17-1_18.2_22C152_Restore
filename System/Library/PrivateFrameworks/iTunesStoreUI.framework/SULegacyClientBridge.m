@interface SULegacyClientBridge
- (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)enterAccountFlowWithViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)performActionForDialog:(id)a3 button:(id)a4;
- (BOOL)presentOverlayBackgroundViewController:(id)a3;
- (SUClientInterface)clientInterface;
- (SULegacyClientBridge)initWithClientInterface:(id)a3;
- (SUOverlayBackgroundViewController)overlayBackgroundViewController;
- (UITabBarController)rootViewController;
- (id)_previewOverlayViewController;
- (void)_removePreviewOverlayViewController;
- (void)_showPreviewOverlayAnimated:(BOOL)a3;
- (void)composeEmailWithSubject:(id)a3 body:(id)a4;
- (void)dealloc;
- (void)dismissOverlayBackgroundViewController;
- (void)hidePreviewOverlayAnimated:(BOOL)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)scriptOverlayBackgroundDidDismiss:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)showPreviewOverlayAnimated:(BOOL)a3;
@end

@implementation SULegacyClientBridge

- (SULegacyClientBridge)initWithClientInterface:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SULegacyClientBridge;
  v6 = [(SULegacyClientBridge *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientInterface, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SUOverlayBackgroundViewController *)self->_overlayBackgroundViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SULegacyClientBridge;
  [(SULegacyClientBridge *)&v3 dealloc];
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  [v8 setKeyboardVisible:1];
  [v8 setMailComposeDelegate:self];
  [v8 setSubject:v7];

  [v8 setMessageBody:v6 isHTML:1];
  [(UITabBarController *)self->_rootViewController presentViewController:v8 animated:1 completion:0];
}

- (BOOL)composeReviewWithViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__SULegacyClientBridge_composeReviewWithViewController_animated___block_invoke;
  v8[3] = &unk_264814BF0;
  objc_copyWeak(&v10, &location);
  id v6 = v5;
  id v9 = v6;
  [v6 prepareWithCompletionBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return 1;
}

void __65__SULegacyClientBridge_composeReviewWithViewController_animated___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_super v3 = [WeakRetained rootViewController];
    [v3 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
  }
}

- (void)dismissOverlayBackgroundViewController
{
}

- (BOOL)enterAccountFlowWithViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[SUNavigationController alloc] initWithRootViewController:v6];
  id v8 = [v6 clientInterface];

  [(SUNavigationController *)v7 setClientInterface:v8];
  [(SUNavigationController *)v7 setNavigationBarHidden:1];
  [(SUNavigationController *)v7 setModalPresentationStyle:2];
  [(UITabBarController *)self->_rootViewController presentViewController:v7 animated:v4 completion:0];

  return 1;
}

- (void)hidePreviewOverlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1)
  {
    previewOverlayViewController = self->_previewOverlayViewController;
    rootViewController = self->_rootViewController;
    [(SUPreviewOverlayViewController *)previewOverlayViewController hideInViewController:rootViewController animated:v3 completionBlock:0];
  }
  else
  {
    id v9 = [(UITabBarController *)self->_rootViewController selectedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = self->_previewOverlayViewController;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __51__SULegacyClientBridge_hidePreviewOverlayAnimated___block_invoke;
      v11[3] = &unk_2648123D0;
      v11[4] = self;
      [(SUPreviewOverlayViewController *)v10 hideInNavigationController:v9 animated:v3 completionBlock:v11];
    }
    else
    {
      [(SULegacyClientBridge *)self _removePreviewOverlayViewController];
    }
  }
}

uint64_t __51__SULegacyClientBridge_hidePreviewOverlayAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePreviewOverlayViewController];
}

- (BOOL)performActionForDialog:(id)a3 button:(id)a4
{
  return 0;
}

- (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  id v5 = a3;
  if (self->_overlayBackgroundViewController || !self->_rootViewController)
  {
    BOOL v6 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_overlayBackgroundViewController, a3);
    [(SUOverlayBackgroundViewController *)self->_overlayBackgroundViewController setDelegate:self];
    [(UITabBarController *)self->_rootViewController addChildViewController:self->_overlayBackgroundViewController];
    id v7 = [(UITabBarController *)self->_rootViewController view];
    id v8 = [(SUOverlayBackgroundViewController *)self->_overlayBackgroundViewController view];
    [v7 bounds];
    objc_msgSend(v8, "setFrame:");
    [v7 addSubview:v8];

    BOOL v6 = 1;
  }

  return v6;
}

- (void)showPreviewOverlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SULegacyClientBridge *)self _previewOverlayViewController];
  if (![v5 isViewLoaded]
    || ([v5 view],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        [v6 window],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    if ([v5 isContentLoaded])
    {
      [(SULegacyClientBridge *)self _showPreviewOverlayAnimated:v3];
    }
    else if (([v5 isSkLoading] & 1) == 0)
    {
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __51__SULegacyClientBridge_showPreviewOverlayAnimated___block_invoke;
      v8[3] = &unk_264814C18;
      objc_copyWeak(&v9, &location);
      BOOL v10 = v3;
      [v5 loadWithCompletionBlock:v8];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __51__SULegacyClientBridge_showPreviewOverlayAnimated___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _showPreviewOverlayAnimated:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v5 = a3;
  [v5 setDelegate:0];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)scriptOverlayBackgroundDidDismiss:(id)a3
{
  if ([(SUOverlayBackgroundViewController *)self->_overlayBackgroundViewController isViewLoaded])
  {
    BOOL v4 = [(SUOverlayBackgroundViewController *)self->_overlayBackgroundViewController view];
    [v4 removeFromSuperview];
  }
  [(SUOverlayBackgroundViewController *)self->_overlayBackgroundViewController removeFromParentViewController];
  [(SUOverlayBackgroundViewController *)self->_overlayBackgroundViewController setDelegate:0];
  overlayBackgroundViewController = self->_overlayBackgroundViewController;
  self->_overlayBackgroundViewController = 0;
}

- (id)_previewOverlayViewController
{
  previewOverlayViewController = self->_previewOverlayViewController;
  if (!previewOverlayViewController)
  {
    BOOL v4 = objc_alloc_init(SUPreviewOverlayViewController);
    id v5 = self->_previewOverlayViewController;
    self->_previewOverlayViewController = v4;

    BOOL v6 = self->_previewOverlayViewController;
    id v7 = [(SULegacyClientBridge *)self clientInterface];
    [(SUViewController *)v6 setClientInterface:v7];

    previewOverlayViewController = self->_previewOverlayViewController;
  }

  return previewOverlayViewController;
}

- (void)_removePreviewOverlayViewController
{
  if ([(SUPreviewOverlayViewController *)self->_previewOverlayViewController isViewLoaded])
  {
    BOOL v3 = [(SUPreviewOverlayViewController *)self->_previewOverlayViewController view];
    [v3 removeFromSuperview];
  }
  previewOverlayViewController = self->_previewOverlayViewController;
  if (previewOverlayViewController)
  {
    [(SUPreviewOverlayViewController *)previewOverlayViewController removeFromParentViewController];
  }
}

- (void)_showPreviewOverlayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SULegacyClientBridge *)self _previewOverlayViewController];
  BOOL v6 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 1)
  {
    [v5 showInViewController:self->_rootViewController animated:v3 completionBlock:0];
  }
  else
  {
    id v8 = [(UITabBarController *)self->_rootViewController selectedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __52__SULegacyClientBridge__showPreviewOverlayAnimated___block_invoke;
      v9[3] = &unk_264812290;
      id v10 = v5;
      v11 = self;
      [v10 showInNavigationController:v8 animated:v3 completionBlock:v9];
    }
  }
}

void __52__SULegacyClientBridge__showPreviewOverlayAnimated___block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) view];
  [v12 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(*(void *)(a1 + 40) + 32) view];
  v11 = [v12 superview];
  objc_msgSend(v10, "convertRect:fromView:", v11, v3, v5, v7, v9);
  objc_msgSend(v12, "setFrame:");

  [v10 addSubview:v12];
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (SUOverlayBackgroundViewController)overlayBackgroundViewController
{
  return self->_overlayBackgroundViewController;
}

- (UITabBarController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_previewOverlayViewController, 0);
  objc_storeStrong((id *)&self->_overlayBackgroundViewController, 0);

  objc_storeStrong((id *)&self->_clientInterface, 0);
}

@end