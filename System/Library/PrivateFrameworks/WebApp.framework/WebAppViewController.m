@interface WebAppViewController
- (BOOL)wasLaunchedForWebPush;
- (UIWebClip)webClip;
- (WebAppViewController)initWithWebClip:(id)a3;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)childViewControllerForWhitePointAdaptivityStyle;
- (void)_cancelHideSnapshotTimer;
- (void)_connectToService;
- (void)_removeRemoteView;
- (void)_setUpContentViewController:(id)a3;
- (void)dealloc;
- (void)hideLoadingView;
- (void)notificationActivated:(id)a3;
- (void)openURLWithCustomSchemeIfNeeded;
- (void)processWebPushWithIdentifier:(id)a3;
- (void)setWasLaunchedForWebPush:(BOOL)a3;
- (void)timeLimitForLoadCompletionExpired;
- (void)viewDidAppear:(BOOL)a3;
- (void)webAppViewController:(id)a3 didChangeLoadingState:(BOOL)a4;
- (void)webAppViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4;
@end

@implementation WebAppViewController

- (WebAppViewController)initWithWebClip:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WebAppViewController;
  v6 = [(WebAppViewController *)&v17 initWithNibName:0 bundle:0];
  v6->_orientation = [(id)*MEMORY[0x263F1D020] interfaceOrientation];
  objc_storeStrong((id *)&v6->_webClip, a3);
  v7 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v8 = [(WebAppViewController *)v6 view];
  [v8 setBackgroundColor:v7];

  v9 = [(UIWebClip *)v6->_webClip pageURL];
  if (objc_msgSend(v9, "safari_hasCustomScheme"))
  {
    char v10 = objc_msgSend(v9, "safari_isDataURL");
    v6->_hasCustomScheme = v10 ^ 1;
    if ((v10 & 1) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
    v6->_hasCustomScheme = 0;
  }
  v11 = [[LoadingViewController alloc] initWithWebClip:v5 orientation:v6->_orientation];
  loadingViewController = v6->_loadingViewController;
  v6->_loadingViewController = v11;

  uint64_t v13 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:v6 target:sel_timeLimitForLoadCompletionExpired selector:0 userInfo:0 repeats:10.0];
  hideSnapshotTimer = v6->_hideSnapshotTimer;
  v6->_hideSnapshotTimer = (NSTimer *)v13;

  v15 = [MEMORY[0x263F1C408] sharedApplication];
  [v15 setNetworkActivityIndicatorVisible:1];

  [(WebAppViewController *)v6 _connectToService];
LABEL_6:

  return v6;
}

- (void)dealloc
{
  [(WebAppViewController *)self _cancelHideSnapshotTimer];
  v3.receiver = self;
  v3.super_class = (Class)WebAppViewController;
  [(WebAppViewController *)&v3 dealloc];
}

- (void)_connectToService
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelViewServiceRequest invoke];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__WebAppViewController__connectToService__block_invoke;
  v6[3] = &unk_264EA49D8;
  v6[4] = self;
  v4 = [MEMORY[0x263F169B8] requestViewControllerWithConnectionHandler:v6];
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;
}

void __41__WebAppViewController__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _setUpContentViewController:v5];
    [*(id *)(*(void *)(a1 + 32) + 1024) finishWithResult:v5];
  }
  else
  {
    v7 = viewServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __41__WebAppViewController__connectToService__block_invoke_cold_1(v6, v7);
    }

    [*(id *)(a1 + 32) webAppViewController:0 viewServiceDidTerminateWithError:0];
  }
}

- (void)_removeRemoteView
{
  id v3 = [(_SFWebAppViewController *)self->_contentViewController view];
  [v3 removeFromSuperview];

  [(_SFWebAppViewController *)self->_contentViewController removeFromParentViewController];
  contentViewController = self->_contentViewController;
  self->_contentViewController = 0;
}

- (void)_setUpContentViewController:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_contentViewController, a3);
  id v5 = [v10 view];
  id v6 = [(WebAppViewController *)self view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  [v10 setDelegate:self];
  if (!self->_wasLaunchedForWebPush)
  {
    v7 = [(WebAppViewController *)self webClip];
    v8 = [v7 identifier];
    [v10 loadWebAppWithIdentifier:v8];
  }
  [(WebAppViewController *)self addChildViewController:v10];
  v9 = [(WebAppViewController *)self view];
  [v9 addSubview:v5];

  [v10 didMoveToParentViewController:self];
  [(WebAppViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(WebAppViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  [(WebAppViewController *)self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
  [(WebAppViewController *)self setNeedsWhitePointAdaptivityStyleUpdate];
}

- (void)_cancelHideSnapshotTimer
{
  hideSnapshotTimer = self->_hideSnapshotTimer;
  if (hideSnapshotTimer)
  {
    [(NSTimer *)hideSnapshotTimer invalidate];
    v4 = self->_hideSnapshotTimer;
    self->_hideSnapshotTimer = 0;
  }
}

- (void)timeLimitForLoadCompletionExpired
{
  [(WebAppViewController *)self _cancelHideSnapshotTimer];

  [(WebAppViewController *)self hideLoadingView];
}

- (void)hideLoadingView
{
  if (self->_loadingViewController)
  {
    id v3 = [(WebAppViewController *)self presentedViewController];
    loadingViewController = self->_loadingViewController;

    if (v3 == loadingViewController) {
      [(WebAppViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
  id v5 = self->_loadingViewController;
  self->_loadingViewController = 0;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_contentViewController;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_contentViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_contentViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_contentViewController;
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_contentViewController;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WebAppViewController;
  [(WebAppViewController *)&v4 viewDidAppear:a3];
  if (!*(_WORD *)&self->_hasShownLoadingViewController)
  {
    self->_hasShownLoadingViewController = 1;
    [(WebAppViewController *)self presentViewController:self->_loadingViewController animated:0 completion:0];
  }
}

- (void)openURLWithCustomSchemeIfNeeded
{
  if (self->_hasCustomScheme)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F018D8]);
    id v3 = [NSURL URLWithString:&stru_26F143188];
    [v6 setReferrerURL:v3];

    objc_super v4 = [MEMORY[0x263F01880] defaultWorkspace];
    id v5 = [(UIWebClip *)self->_webClip pageURL];
    [v4 openURL:v5 configuration:v6 completionHandler:0];
  }
}

- (void)processWebPushWithIdentifier:(id)a3
{
  id v4 = a3;
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    [(_SFWebAppViewController *)contentViewController processWebPushForWebAppWithIdentifier:v4];
  }
  else
  {
    connectionPromiseForPush = self->_connectionPromiseForPush;
    if (!connectionPromiseForPush)
    {
      v7 = (CPSPromise *)objc_alloc_init((Class)getCPSPromiseClass());
      v8 = self->_connectionPromiseForPush;
      self->_connectionPromiseForPush = v7;

      connectionPromiseForPush = self->_connectionPromiseForPush;
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__WebAppViewController_processWebPushWithIdentifier___block_invoke;
    v9[3] = &unk_264EA4A00;
    id v10 = v4;
    [(CPSPromise *)connectionPromiseForPush addCompletionBlock:v9];
  }
}

uint64_t __53__WebAppViewController_processWebPushWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 processWebPushForWebAppWithIdentifier:*(void *)(a1 + 32)];
}

- (void)notificationActivated:(id)a3
{
  id v4 = a3;
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    [(_SFWebAppViewController *)contentViewController handlePushNotificationActivation:v4];
  }
  else
  {
    connectionPromiseForPush = self->_connectionPromiseForPush;
    if (!connectionPromiseForPush)
    {
      v7 = (CPSPromise *)objc_alloc_init((Class)getCPSPromiseClass());
      v8 = self->_connectionPromiseForPush;
      self->_connectionPromiseForPush = v7;

      connectionPromiseForPush = self->_connectionPromiseForPush;
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__WebAppViewController_notificationActivated___block_invoke;
    v9[3] = &unk_264EA4A00;
    id v10 = v4;
    [(CPSPromise *)connectionPromiseForPush addCompletionBlock:v9];
  }
}

uint64_t __46__WebAppViewController_notificationActivated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handlePushNotificationActivation:*(void *)(a1 + 32)];
}

- (void)webAppViewController:(id)a3 didChangeLoadingState:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setNetworkActivityIndicatorVisible:v4];
}

- (void)webAppViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  [(WebAppViewController *)self _removeRemoteView];
  if (!self->_loadingViewController)
  {
    v8 = [[LoadingViewController alloc] initWithWebClip:self->_webClip orientation:self->_orientation];
    loadingViewController = self->_loadingViewController;
    self->_loadingViewController = v8;

    [(WebAppViewController *)self presentViewController:self->_loadingViewController animated:0 completion:0];
  }
  dispatch_time_t v10 = dispatch_time(0, 1500000000);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__WebAppViewController_webAppViewController_viewServiceDidTerminateWithError___block_invoke;
  v11[3] = &unk_264EA4A28;
  objc_copyWeak(&v12, &location);
  dispatch_after(v10, MEMORY[0x263EF83A0], v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __78__WebAppViewController_webAppViewController_viewServiceDidTerminateWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectToService];
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (BOOL)wasLaunchedForWebPush
{
  return self->_wasLaunchedForWebPush;
}

- (void)setWasLaunchedForWebPush:(BOOL)a3
{
  self->_wasLaunchedForWebPush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_connectionPromiseForPush, 0);
  objc_storeStrong((id *)&self->_hideSnapshotTimer, 0);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

void __41__WebAppViewController__connectToService__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(a1, "safari_privacyPreservingDescription");
  int v4 = 138543362;
  id v5 = v3;
  _os_log_fault_impl(&dword_23D520000, a2, OS_LOG_TYPE_FAULT, "failed to connect to SafariViewService for Web.app: %{public}@; trying again…",
    (uint8_t *)&v4,
    0xCu);
}

@end