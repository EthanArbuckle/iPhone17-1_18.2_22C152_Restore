@interface NDOAppleCareWebViewController
- (BOOL)initialLoadCompleted;
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (NDOAppleCareWebViewController)initWithWarranty:(id)a3 serialNumber:(id)a4;
- (NDOAppleCareWebViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 params:(id)a5;
- (NDOAppleCareWebViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 params:(id)a5 source:(id)a6;
- (NDOAppleCareWebViewPresenterProtocol)presenter;
- (NDOWarranty)warranty;
- (NSString)params;
- (NSString)serialNumber;
- (NSString)source;
- (UIActivityIndicatorView)spinner;
- (UINavigationBar)headerView;
- (UINavigationItem)webViewNavigationItem;
- (WKWebView)webview;
- (int)retriesRemaining;
- (unint64_t)supportedInterfaceOrientations;
- (void)cancelTapped:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)loadWebview:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setHeaderView:(id)a3;
- (void)setInitialLoadCompleted:(BOOL)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setParams:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setRetriesRemaining:(int)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSource:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setWarranty:(id)a3;
- (void)setWebViewNavigationItem:(id)a3;
- (void)setWebview:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
@end

@implementation NDOAppleCareWebViewController

- (NDOAppleCareWebViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 params:(id)a5
{
  return [(NDOAppleCareWebViewController *)self initWithWarranty:a3 serialNumber:a4 params:a5 source:@"UNKNOWN"];
}

- (NDOAppleCareWebViewController)initWithWarranty:(id)a3 serialNumber:(id)a4 params:(id)a5 source:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17.receiver = self;
  v17.super_class = (Class)NDOAppleCareWebViewController;
  v15 = [(NDOAppleCareWebViewController *)&v17 initWithNibName:@"NDOAppleCareWebView" bundle:v14];

  if (v15)
  {
    [(NDOAppleCareWebViewController *)v15 setWarranty:v10];
    [(NDOAppleCareWebViewController *)v15 setSerialNumber:v11];
    [(NDOAppleCareWebViewController *)v15 setParams:v12];
    [(NDOAppleCareWebViewController *)v15 setSource:v13];
  }

  return v15;
}

- (NDOAppleCareWebViewController)initWithWarranty:(id)a3 serialNumber:(id)a4
{
  return [(NDOAppleCareWebViewController *)self initWithWarranty:a3 serialNumber:a4 params:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  if ([v2 userInterfaceIdiom] == 6)
  {

    return 30;
  }
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1) {
    return 30;
  }
  return 2;
}

- (void)dealloc
{
  v3 = [(NDOAppleCareWebViewController *)self webview];
  [v3 removeObserver:self forKeyPath:@"loading"];

  v4.receiver = self;
  v4.super_class = (Class)NDOAppleCareWebViewController;
  [(NDOAppleCareWebViewController *)&v4 dealloc];
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)NDOAppleCareWebViewController;
  [(NDOAppleCareWebViewController *)&v8 loadView];
  v3 = [(NDOAppleCareWebViewController *)self navigationController];

  if (v3)
  {
    objc_super v4 = [(NDOAppleCareWebViewController *)self headerView];
    [v4 setHidden:1];

    v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelTapped_];
    v6 = [(NDOAppleCareWebViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];

    v7 = [(NDOAppleCareWebViewController *)self navigationItem];
    [v7 setHidesBackButton:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NDOAppleCareWebViewController;
  [(NDOAppleCareWebViewController *)&v8 viewWillAppear:a3];
  objc_super v4 = [(NDOAppleCareWebViewController *)self navigationController];

  if (v4)
  {
    v5 = [(NDOAppleCareWebViewController *)self navigationController];
    [v5 setNavigationBarHidden:0];

    v6 = [(NDOAppleCareWebViewController *)self navigationItem];
    id v7 = objc_alloc_init(MEMORY[0x263F829A8]);
    [v7 configureWithTransparentBackground];
    [v6 setScrollEdgeAppearance:v7];
    [v6 setStandardAppearance:v7];
    [v6 setCompactAppearance:v7];
  }
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)NDOAppleCareWebViewController;
  [(NDOAppleCareWebViewController *)&v16 viewDidLoad];
  [(NDOAppleCareWebViewController *)self setRetriesRemaining:2];
  v3 = [(NDOAppleCareWebViewController *)self webview];
  [v3 setNavigationDelegate:self];

  [(NDOAppleCareWebViewController *)self loadWebview:0];
  [(NDOAppleCareWebViewController *)self setIsLoading:1];
  objc_super v4 = [(NDOAppleCareWebViewController *)self webview];
  [v4 addObserver:self forKeyPath:@"loading" options:1 context:0];

  v5 = [(NDOAppleCareWebViewController *)self navigationController];

  if (!v5)
  {
    v6 = [(NDOAppleCareWebViewController *)self headerView];
    [v6 setBarStyle:0];

    id v7 = (void *)[objc_alloc(MEMORY[0x263F829C8]) initWithTitle:&stru_26EB85580];
    [(NDOAppleCareWebViewController *)self setWebViewNavigationItem:v7];

    id v8 = objc_alloc(MEMORY[0x263F824A8]);
    v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
    id v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_26EB85580 table:@"Localizable"];
    id v11 = (void *)[v8 initWithTitle:v10 style:0 target:self action:sel_cancelTapped_];

    id v12 = [(NDOAppleCareWebViewController *)self webViewNavigationItem];
    [v12 setRightBarButtonItem:v11];

    id v13 = [(NDOAppleCareWebViewController *)self headerView];
    v14 = [(NDOAppleCareWebViewController *)self webViewNavigationItem];
    [v13 pushNavigationItem:v14 animated:0];

    v15 = [(NDOAppleCareWebViewController *)self headerView];
    [v15 setDelegate:self];
  }
}

- (void)loadWebview:(BOOL)a3
{
  v5 = dispatch_get_global_queue(25, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__NDOAppleCareWebViewController_loadWebview___block_invoke;
  v6[3] = &unk_264D496B8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __45__NDOAppleCareWebViewController_loadWebview___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  v2 = [*(id *)(a1 + 32) warranty];
  uint64_t v3 = [v2 agsURL];
  objc_super v4 = (void *)v3;
  v5 = @"https://agreements.apple.com/acsales";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v50 = v5;

  v6 = (void *)CFPreferencesCopyAppValue(@"WebFlowURL", @"com.apple.NewDeviceOutreach");
  if (v6)
  {
    BOOL v7 = _NDOLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v6;
      _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "Using override URL: %@", buf, 0xCu);
    }

    id v8 = v46;
    id v9 = v6;
    id v10 = v8[5];
    v8[5] = (uint64_t)v9;
  }
  else
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    id v12 = objc_opt_new();
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __45__NDOAppleCareWebViewController_loadWebview___block_invoke_44;
    v42[3] = &unk_264D49668;
    v44 = &v45;
    id v10 = v11;
    v43 = v10;
    [v12 webURLOverride:v42];

    dispatch_semaphore_wait(v10, 0);
  }

  id v13 = [MEMORY[0x263F08BA0] componentsWithString:v46[5]];
  v14 = (void *)MEMORY[0x263F08BD0];
  v15 = [*(id *)(a1 + 32) warranty];
  objc_super v16 = [v15 acOfferIdentifier];
  v39 = [v14 queryItemWithName:@"cid" value:v16];

  objc_super v17 = [MEMORY[0x263F08BD0] queryItemWithName:@"callerId" value:@"NewDeviceOutreach"];
  v51[0] = v39;
  v51[1] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
  [v13 setQueryItems:v18];

  v19 = [*(id *)(a1 + 32) params];

  if (v19)
  {
    v20 = NSString;
    v21 = [v13 URL];
    v22 = [v21 absoluteString];
    v23 = [*(id *)(a1 + 32) params];
    v24 = [v20 stringWithFormat:@"%@&%@", v22, v23];

    v25 = [NSURL URLWithString:v24];

    if (v25)
    {
LABEL_10:
      v26 = _NDOLogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v25;
        _os_log_impl(&dword_238845000, v26, OS_LOG_TYPE_DEFAULT, "Begining web flow with URL: %@", buf, 0xCu);
      }

      v27 = [MEMORY[0x263F089E0] requestWithURL:v25];
      [v27 setTimeoutInterval:30.0];
      v28 = objc_opt_new();
      v29 = [v28 defaultDevice];
      v30 = [v29 serialNumber];

      objc_msgSend(v27, "ndo_addBasicHeadersWithBundleID:", 0);
      objc_msgSend(v27, "ndo_signWithAccountHeaders:avoidUI:", *(unsigned __int8 *)(a1 + 40), 0);
      v31 = [*(id *)(a1 + 32) warranty];
      v32 = [v31 acOfferIdentifier];
      v33 = [*(id *)(a1 + 32) serialNumber];
      objc_msgSend(v27, "ndo_addOASHeadersWithOfferID:serialNumber:primarySerialNumber:", v32, v33, v30);

      v34 = [&unk_26EB89E50 stringValue];
      [v27 setValue:v34 forHTTPHeaderField:@"oceanVersion"];

      if (*(unsigned char *)(a1 + 40))
      {
        v35 = _NDOLogSystem();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = [v27 headerDescription];
          *(_DWORD *)buf = 138412290;
          v53 = v36;
          _os_log_impl(&dword_238845000, v35, OS_LOG_TYPE_DEFAULT, "Retrying request: %@", buf, 0xCu);
        }
      }
      else
      {
        v35 = _NDOLogSystem();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v37 = [v27 headerDescription];
          *(_DWORD *)buf = 138412290;
          v53 = v37;
          _os_log_impl(&dword_238845000, v35, OS_LOG_TYPE_DEFAULT, "Starting request: %@", buf, 0xCu);
        }
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__NDOAppleCareWebViewController_loadWebview___block_invoke_68;
      block[3] = &unk_264D49690;
      block[4] = *(void *)(a1 + 32);
      id v41 = v27;
      id v38 = v27;
      dispatch_async(MEMORY[0x263EF83A0], block);

      goto LABEL_21;
    }
  }
  else
  {
    v25 = [v13 URL];
    if (v25) {
      goto LABEL_10;
    }
  }
  v30 = _NDOLogSystem();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    __45__NDOAppleCareWebViewController_loadWebview___block_invoke_cold_1((uint64_t)v13, v30);
  }
LABEL_21:

  _Block_object_dispose(&v45, 8);
}

void __45__NDOAppleCareWebViewController_loadWebview___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_238845000, v5, OS_LOG_TYPE_DEFAULT, "Using override URL: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __45__NDOAppleCareWebViewController_loadWebview___block_invoke_68(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) webview];
  id v2 = (id)[v3 loadRequest:*(void *)(a1 + 40)];
}

- (void)setIsLoading:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(NDOAppleCareWebViewController *)self spinner];
    [v4 startAnimating];

    v5 = [(NDOAppleCareWebViewController *)self webview];
    id v8 = v5;
    uint64_t v6 = 1;
  }
  else
  {
    if (![(NDOAppleCareWebViewController *)self initialLoadCompleted]) {
      return;
    }
    id v7 = [(NDOAppleCareWebViewController *)self spinner];
    [v7 stopAnimating];

    v5 = [(NDOAppleCareWebViewController *)self webview];
    id v8 = v5;
    uint64_t v6 = 0;
  }
  [v5 setHidden:v6];
}

- (void)cancelTapped:(id)a3
{
  id v3 = [(NDOAppleCareWebViewController *)self presenter];
  [v3 webviewFinishedWithCompletion:0];
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  v5 = [(NDOAppleCareWebViewController *)self webview];
  int v6 = [v5 canGoBack];

  if (v6)
  {
    id v7 = [(NDOAppleCareWebViewController *)self webview];
    id v8 = (id)[v7 goBack];
  }
  else
  {
    [(NDOAppleCareWebViewController *)self dismissViewControllerAnimated:0 completion:0];
  }
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"loading"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = [(NDOAppleCareWebViewController *)self webview];
    -[NDOAppleCareWebViewController setIsLoading:](self, "setIsLoading:", [v13 isLoading]);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NDOAppleCareWebViewController;
    [(NDOAppleCareWebViewController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void (**)(id, void))a5;
  id v9 = [v7 request];
  id v10 = [v9 URL];

  id v11 = [v10 scheme];
  int v12 = [v11 isEqualToString:@"close"];

  if (v12)
  {
    id v13 = _NDOLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      v28 = @"close";
      _os_log_impl(&dword_238845000, v13, OS_LOG_TYPE_DEFAULT, "Caught redirection to url of scheme '%@', close", (uint8_t *)&v27, 0xCu);
    }

    v8[2](v8, 0);
    objc_super v14 = [(NDOAppleCareWebViewController *)self presenter];
    [v14 webviewFinishedWithCompletion:2];
LABEL_18:

    goto LABEL_19;
  }
  v15 = [v10 scheme];
  int v16 = [v15 isEqualToString:@"ready"];

  if (v16)
  {
    objc_super v17 = _NDOLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      v28 = @"ready";
      _os_log_impl(&dword_238845000, v17, OS_LOG_TYPE_DEFAULT, "Caught redirection to url of scheme '%@', stop animating spinner and show webview", (uint8_t *)&v27, 0xCu);
    }

    v8[2](v8, 0);
    [(NDOAppleCareWebViewController *)self setInitialLoadCompleted:1];
    [(NDOAppleCareWebViewController *)self setIsLoading:0];
  }
  else
  {
    v18 = [v10 scheme];
    int v19 = [v18 isEqualToString:@"complete"];

    if (v19)
    {
      v20 = _NDOLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412290;
        v28 = @"complete";
        _os_log_impl(&dword_238845000, v20, OS_LOG_TYPE_DEFAULT, "Caught redirection to url of scheme '%@', hide buttons", (uint8_t *)&v27, 0xCu);
      }

      v8[2](v8, 0);
      v21 = [(NDOAppleCareWebViewController *)self webViewNavigationItem];

      if (v21)
      {
        v22 = [(NDOAppleCareWebViewController *)self webViewNavigationItem];
        [v22 setHidesBackButton:1];

        [(NDOAppleCareWebViewController *)self webViewNavigationItem];
      }
      else
      {
        v24 = [(NDOAppleCareWebViewController *)self navigationItem];
        [v24 setHidesBackButton:1];

        [(NDOAppleCareWebViewController *)self navigationItem];
      objc_super v14 = };
      [v14 setRightBarButtonItem:0 animated:0];
      goto LABEL_18;
    }
    v23 = [v7 targetFrame];

    if (v23)
    {
      v8[2](v8, 1);
    }
    else
    {
      v25 = _NDOLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_238845000, v25, OS_LOG_TYPE_DEFAULT, "Attempting to open to url to blank frame, open in safari", (uint8_t *)&v27, 2u);
      }

      v26 = (void *)[objc_alloc(MEMORY[0x263F16980]) initWithURL:v10];
      [(NDOAppleCareWebViewController *)self presentViewController:v26 animated:1 completion:&__block_literal_global_0];
      v8[2](v8, 0);
    }
  }
LABEL_19:
}

void __89__NDOAppleCareWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke()
{
  v0 = _NDOLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_238845000, v0, OS_LOG_TYPE_DEFAULT, "Return from safari", v1, 2u);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  *(void *)&v16[5] = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, uint64_t))a5;
  id v8 = [a4 response];
  uint64_t v9 = [v8 statusCode];

  if (v9 != 401)
  {
    if (v9 == 200)
    {
      id v10 = _NDOLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        id v11 = "successfully loaded webpage";
        int v12 = v10;
        uint32_t v13 = 2;
LABEL_11:
        _os_log_impl(&dword_238845000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);
      }
    }
    else
    {
      id v10 = _NDOLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134217984;
        *(void *)int v16 = v9;
        id v11 = "Failed to load webpage with status: %ld";
        int v12 = v10;
        uint32_t v13 = 12;
        goto LABEL_11;
      }
    }
LABEL_14:

    v7[2](v7, 1);
    goto LABEL_15;
  }
  if ([(NDOAppleCareWebViewController *)self retriesRemaining] < 1)
  {
    id v10 = _NDOLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NDOAppleCareWebViewController webView:decidePolicyForNavigationResponse:decisionHandler:](v10);
    }
    goto LABEL_14;
  }
  [(NDOAppleCareWebViewController *)self setRetriesRemaining:[(NDOAppleCareWebViewController *)self retriesRemaining] - 1];
  objc_super v14 = _NDOLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 67109376;
    v16[0] = 2 - [(NDOAppleCareWebViewController *)self retriesRemaining];
    LOWORD(v16[1]) = 1024;
    *(_DWORD *)((char *)&v16[1] + 2) = 2;
    _os_log_impl(&dword_238845000, v14, OS_LOG_TYPE_DEFAULT, "Retrying webview load attempt (%d/%d)", (uint8_t *)&v15, 0xEu);
  }

  v7[2](v7, 0);
  [(NDOAppleCareWebViewController *)self loadWebview:1];
LABEL_15:
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a5;
  id v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "Failed to load webpage with error: %@", buf, 0xCu);
  }

  id v8 = (void *)MEMORY[0x263F82418];
  uint64_t v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  id v10 = [v9 localizedStringForKey:@"WEBVIEW_FAIL_ALERT_MESSAGE" value:&stru_26EB85580 table:@"Localizable"];
  id v11 = [v8 alertControllerWithTitle:0 message:v10 preferredStyle:1];

  int v12 = (void *)MEMORY[0x263F82400];
  uint32_t v13 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  objc_super v14 = [v13 localizedStringForKey:@"OK" value:&stru_26EB85580 table:@"Localizable"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__NDOAppleCareWebViewController_webView_didFailProvisionalNavigation_withError___block_invoke;
  v16[3] = &unk_264D495A8;
  v16[4] = self;
  int v15 = [v12 actionWithTitle:v14 style:0 handler:v16];
  [v11 addAction:v15];

  [(NDOAppleCareWebViewController *)self presentViewController:v11 animated:1 completion:0];
}

void __80__NDOAppleCareWebViewController_webView_didFailProvisionalNavigation_withError___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presenter];
  [v1 webviewFinishedWithCompletion:0];
}

- (NDOAppleCareWebViewPresenterProtocol)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (NDOAppleCareWebViewPresenterProtocol *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (NDOWarranty)warranty
{
  return (NDOWarranty *)objc_getProperty(self, a2, 992, 1);
}

- (void)setWarranty:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)params
{
  return (NSString *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setParams:(id)a3
{
}

- (WKWebView)webview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webview);
  return (WKWebView *)WeakRetained;
}

- (void)setWebview:(id)a3
{
}

- (UINavigationBar)headerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
  return (UINavigationBar *)WeakRetained;
}

- (void)setHeaderView:(id)a3
{
}

- (UINavigationItem)webViewNavigationItem
{
  return (UINavigationItem *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setWebViewNavigationItem:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinner);
  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setSpinner:(id)a3
{
}

- (BOOL)initialLoadCompleted
{
  return self->_initialLoadCompleted;
}

- (void)setInitialLoadCompleted:(BOOL)a3
{
  self->_initialLoadCompleted = a3;
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setSource:(id)a3
{
}

- (int)retriesRemaining
{
  return self->_retriesRemaining;
}

- (void)setRetriesRemaining:(int)a3
{
  self->_retriesRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_destroyWeak((id *)&self->_spinner);
  objc_storeStrong((id *)&self->_webViewNavigationItem, 0);
  objc_destroyWeak((id *)&self->_headerView);
  objc_destroyWeak((id *)&self->_webview);
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

void __45__NDOAppleCareWebViewController_loadWebview___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238845000, a2, OS_LOG_TYPE_ERROR, "Failed to instatiate web flow from: %@", (uint8_t *)&v2, 0xCu);
}

- (void)webView:(os_log_t)log decidePolicyForNavigationResponse:decisionHandler:.cold.1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 2;
  _os_log_error_impl(&dword_238845000, log, OS_LOG_TYPE_ERROR, "Failed to load webpage after %d retries", (uint8_t *)v1, 8u);
}

@end