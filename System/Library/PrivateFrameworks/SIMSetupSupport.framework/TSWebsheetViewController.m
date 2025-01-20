@interface TSWebsheetViewController
- (BOOL)_currentLanguageIsRTL;
- (BOOL)_isHexadecimalString:(id)a3;
- (BOOL)_isProfilePendingRelease:(id)a3;
- (BOOL)_shouldIgnoreWebviewError:(id)a3;
- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3;
- (BOOL)formAutoFillControllerShouldDisableAutoFill:(id)a3;
- (TSEntitlementJSHandlerDelegate)callbackDelegate;
- (TSSIMSetupFlowDelegate)delegate;
- (id)_processPool;
- (id)_webViewConfigurationWithProcessPool:(id)a3;
- (id)formAutoFillControllerURLForFormAutoFill:(id)a3;
- (id)initForRemotePlan:(BOOL)a3 carrierName:(id)a4 skipUIDismissal:(BOOL)a5;
- (id)initForRemotePlan:(BOOL)a3 carrierName:(id)a4 viewController:(id)a5;
- (int64_t)dismissCause;
- (void)_doneButtonTapped;
- (void)_handlePlanPurchaseWithMessageBody:(id)a3;
- (void)_handleTransferWithMessageBody:(id)a3;
- (void)_showCancelButton:(BOOL)a3;
- (void)_showVerifyingIndicator:(BOOL)a3;
- (void)_transferESimInstallationStarted;
- (void)_webView:(id)a3 accessoryViewCustomButtonTappedInFormInputSession:(id)a4;
- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5;
- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4;
- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4;
- (void)_webView:(id)a3 willStartInputSession:(id)a4;
- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6;
- (void)loadRequest:(id)a3 completion:(id)a4;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)sendRequest:(id)a3;
- (void)setCallbackDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissCause:(int64_t)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation TSWebsheetViewController

- (id)initForRemotePlan:(BOOL)a3 carrierName:(id)a4 skipUIDismissal:(BOOL)a5
{
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TSWebsheetViewController;
  v10 = [(TSWebsheetViewController *)&v28 init];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F1FA58]);
    v12 = [(TSWebsheetViewController *)v10 _processPool];
    v13 = [(TSWebsheetViewController *)v10 _webViewConfigurationWithProcessPool:v12];
    double v14 = *MEMORY[0x263F001A8];
    double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v18 = objc_msgSend(v11, "initWithFrame:configuration:", v13, *MEMORY[0x263F001A8], v15, v16, v17);
    webView = v10->_webView;
    v10->_webView = (WKWebView *)v18;

    [(WKWebView *)v10->_webView setNavigationDelegate:v10];
    [(WKWebView *)v10->_webView setUIDelegate:v10];
    [(WKWebView *)v10->_webView _setInputDelegate:v10];
    [(WKWebView *)v10->_webView setAutoresizingMask:18];
    v20 = [(WKWebView *)v10->_webView scrollView];
    [v20 setDelegate:v10];

    [(WKWebView *)v10->_webView setAutoresizesSubviews:1];
    if (!a3)
    {
      v21 = -[TSCellularSetupLoadingView initWithFrame:]([TSCellularSetupLoadingView alloc], "initWithFrame:", v14, v15, v16, v17);
      loadingView = v10->_loadingView;
      v10->_loadingView = v21;

      [(WKWebView *)v10->_webView addSubview:v10->_loadingView];
    }
    uint64_t v23 = [objc_alloc(MEMORY[0x263F16998]) initWithWebView:v10->_webView delegate:v10];
    autoFillController = v10->_autoFillController;
    v10->_autoFillController = (_SFFormAutoFillController *)v23;

    [(TSWebsheetViewController *)v10 setModalInPresentation:1];
    uint64_t v25 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v10 action:sel__doneButtonTapped];
    cancelButton = v10->_cancelButton;
    v10->_cancelButton = (UIBarButtonItem *)v25;

    v10->_dismissCause = 2;
    v10->_didReceivePurchaseCallback = 0;
    v10->_didViewAppear = 0;
    v10->_isRemotePlan = a3;
    objc_storeStrong((id *)&v10->_currentTitle, a4);
    v10->_skipUIDismissal = a5;
  }

  return v10;
}

- (id)initForRemotePlan:(BOOL)a3 carrierName:(id)a4 viewController:(id)a5
{
  BOOL v7 = a3;
  id v9 = a5;
  v10 = [(TSWebsheetViewController *)self initForRemotePlan:v7 carrierName:a4 skipUIDismissal:0];
  id v11 = v10;
  if (v10) {
    objc_storeStrong(v10 + 128, a5);
  }

  return v11;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)TSWebsheetViewController;
  [(TSWebsheetViewController *)&v3 loadView];
  [(TSWebsheetViewController *)self setView:self->_webView];
  if (!self->_isRemotePlan) {
    [(WKWebView *)self->_webView bringSubviewToFront:self->_loadingView];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TSWebsheetViewController;
  [(TSWebsheetViewController *)&v14 viewWillAppear:a3];
  v4 = [(WKWebView *)self->_webView scrollView];
  v5 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [v4 setBackgroundColor:v5];

  [(TSWebsheetViewController *)self _showCancelButton:1];
  v6 = [(TSWebsheetViewController *)self navigationController];
  BOOL v7 = [v6 navigationBar];
  v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v7 setBackgroundColor:v8];

  if (self->_isRemotePlan)
  {
    id v9 = [(TSWebsheetViewController *)self navigationItem];
    [v9 setHidesBackButton:1];
    v10 = [(TSWebsheetViewController *)self navigationItem];
    [v10 setTitle:self->_currentTitle];
  }
  else
  {
    if (+[TSUtilities isPad])
    {
      id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"Cellular Data Account" value:&stru_26DBE8E78 table:@"Localizable"];
      [(TSWebsheetViewController *)self setTitle:v12];
    }
    loadingView = self->_loadingView;
    [(WKWebView *)self->_webView bounds];
    -[TSCellularSetupLoadingView setFrame:](loadingView, "setFrame:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWebsheetViewController;
  [(TSWebsheetViewController *)&v4 viewDidAppear:a3];
  self->_didViewAppear = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWebsheetViewController;
  [(TSWebsheetViewController *)&v6 viewDidDisappear:a3];
  [(WKWebView *)self->_webView setUIDelegate:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wkUserContentController);
  [WeakRetained removeAllScriptMessageHandlers];

  if ([(TSWebsheetViewController *)self isMovingFromParentViewController])
  {
    [(TSWebsheetViewController *)self setDismissCause:0];
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 viewControllerDidComplete:self];
  }
}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(TSWebsheetViewController *)self sendRequest:a3];
  BOOL v7 = (void *)MEMORY[0x22A683B20](v6);

  id requestLoadedCompletion = self->_requestLoadedCompletion;
  self->_id requestLoadedCompletion = v7;
}

- (void)sendRequest:(id)a3
{
  if (a3)
  {
    id v4 = -[WKWebView loadRequest:](self->_webView, "loadRequest:");
  }
  else
  {
    [(TSWebsheetViewController *)self setDismissCause:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained viewControllerDidComplete:self];
  }
}

- (BOOL)_shouldIgnoreWebviewError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  if (objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x263F86258]) && v4 == 102)
  {
    BOOL v5 = 1;
  }
  else if (objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x263F08570]))
  {
    BOOL v5 = v4 == -999 || v4 == -1012;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  self->_didFinishDocumentLoad = 0;
  self->_didFirstLayout = 0;
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  BOOL v7 = _TSLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[TSWebsheetViewController webView:didFailProvisionalNavigation:withError:]();
  }

  if (!self->_isRemotePlan
    || ![(TSWebsheetViewController *)self _shouldIgnoreWebviewError:v6])
  {
    [(TSWebsheetViewController *)self setDismissCause:1];
    id requestLoadedCompletion = (void (**)(id, void))self->_requestLoadedCompletion;
    if (requestLoadedCompletion)
    {
      requestLoadedCompletion[2](requestLoadedCompletion, 0);
      id WeakRetained = self->_requestLoadedCompletion;
      self->_id requestLoadedCompletion = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained viewControllerDidComplete:self];
    }
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_isRemotePlan)
  {
    viewController = self->_viewController;
    if (viewController)
    {
      id v9 = viewController;
      if (([(UIViewController *)v9 isProcessCanceled] & 1) != 0 || self->_dismissCause == 1)
      {
        v10 = _TSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315138;
          double v16 = "-[TSWebsheetViewController webView:didFinishNavigation:]";
          _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "Process Got Cancel or Come Back with error in Loading Page @%s", (uint8_t *)&v15, 0xCu);
        }
      }
      else
      {
        id v11 = _TSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315138;
          double v16 = "-[TSWebsheetViewController webView:didFinishNavigation:]";
          _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "Start Load the view @%s", (uint8_t *)&v15, 0xCu);
        }

        v10 = [(UIViewController *)self->_viewController navigationController];
        [v10 pushViewController:self animated:1];
      }

      v12 = self->_viewController;
      self->_viewController = 0;
    }
  }
  else
  {
    [(TSCellularSetupLoadingView *)self->_loadingView removeFromSuperview];
  }
  id requestLoadedCompletion = (void (**)(id, uint64_t))self->_requestLoadedCompletion;
  if (requestLoadedCompletion)
  {
    requestLoadedCompletion[2](requestLoadedCompletion, 1);
    id v14 = self->_requestLoadedCompletion;
    self->_id requestLoadedCompletion = 0;
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v6 = (void (**)(id, uint64_t))a5;
  id v7 = (void *)MEMORY[0x263F82438];
  id v8 = a4;
  id v9 = [v7 sharedApplication];
  v10 = [v8 request];

  id v11 = [v10 URL];

  v12 = _TSLogDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[TSWebsheetViewController webView:decidePolicyForNavigationAction:decisionHandler:]();
  }

  v13 = [v11 scheme];
  int v14 = [v13 isEqualToString:@"tel"];

  if (v14 && [v9 canOpenURL:v11])
  {
    [v9 openURL:v11 options:MEMORY[0x263EFFA78] completionHandler:&__block_literal_global_12];
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  v6[2](v6, v15);
}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  self->_didFinishDocumentLoad = 1;
  [(_SFFormAutoFillController *)self->_autoFillController prefillFormsSoonIfNeeded];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  id v7 = _TSLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[TSWebsheetViewController webView:didFailNavigation:withError:]();
  }

  if (!self->_isRemotePlan
    || ![(TSWebsheetViewController *)self _shouldIgnoreWebviewError:v6])
  {
    [(TSWebsheetViewController *)self setDismissCause:1];
    id requestLoadedCompletion = (void (**)(id, void))self->_requestLoadedCompletion;
    if (requestLoadedCompletion)
    {
      requestLoadedCompletion[2](requestLoadedCompletion, 0);
      id WeakRetained = self->_requestLoadedCompletion;
      self->_id requestLoadedCompletion = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained viewControllerDidComplete:self];
    }
  }
}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_isRemotePlan)
  {
    viewController = self->_viewController;
    if (viewController)
    {
      id v8 = viewController;
      if ([(UIViewController *)v8 isProcessCanceled])
      {
        id v9 = _TSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315138;
          v12 = "-[TSWebsheetViewController _webView:renderingProgressDidChange:]";
          _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "Cancel Request set PurchaseFlow to NO then return @%s", (uint8_t *)&v11, 0xCu);
        }

        v10 = self->_viewController;
        self->_viewController = 0;

        goto LABEL_10;
      }
    }
  }
  if (v4)
  {
    self->_didFirstLayout = 1;
    [(_SFFormAutoFillController *)self->_autoFillController prefillFormsSoonIfNeeded];
  }
LABEL_10:
}

- (void)_webView:(id)a3 willStartInputSession:(id)a4
{
}

- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6
{
}

- (void)_webView:(id)a3 accessoryViewCustomButtonTappedInFormInputSession:(id)a4
{
}

- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5
{
}

- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3
{
  return self->_didFinishDocumentLoad && self->_didFirstLayout;
}

- (BOOL)formAutoFillControllerShouldDisableAutoFill:(id)a3
{
  return 0;
}

- (id)formAutoFillControllerURLForFormAutoFill:(id)a3
{
  return [(WKWebView *)self->_webView URL];
}

- (void)_transferESimInstallationStarted
{
  if (!+[TSUtilities isPad])
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"transfer.websheet.install.started" object:0 userInfo:0];
  }
  [(TSWebsheetViewController *)self setDismissCause:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startTimer:1];
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 name];
    id v8 = [v5 body];
    int v37 = 138412802;
    v38 = v7;
    __int16 v39 = 2112;
    v40 = v8;
    __int16 v41 = 2080;
    v42 = "-[TSWebsheetViewController userContentController:didReceiveScriptMessage:]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "js callback: %@ - %@ @%s", (uint8_t *)&v37, 0x20u);
  }
  id v9 = [v5 name];
  if (![v9 isEqualToString:@"dataPlanAccountUpdatedWithIccid"])
  {
    v10 = [v5 name];
    int v11 = [v10 isEqualToString:@"dataPlanAccountUpdatedWithInfo"];

    if (v11) {
      goto LABEL_6;
    }
    uint64_t v13 = [v5 name];
    int v14 = [v13 isEqualToString:@"dataPlanTransferAccountUpdatedWithInfo"];

    if (v14)
    {
      v12 = [v5 body];
      [(TSWebsheetViewController *)self _handleTransferWithMessageBody:v12];
      goto LABEL_7;
    }
    uint64_t v15 = [v5 name];
    int v16 = [v15 isEqualToString:@"showCancelButtonSelected"];

    if (v16)
    {
      id WeakRetained = _TSLogDomain();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315138;
        v38 = "-[TSWebsheetViewController userContentController:didReceiveScriptMessage:]";
        uint64_t v18 = "No longer supported @%s";
LABEL_22:
        _os_log_impl(&dword_227A17000, WeakRetained, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v37, 0xCu);
      }
    }
    else
    {
      v19 = [v5 name];
      int v20 = [v19 isEqualToString:@"hideCancelButtonSelected"];

      if (v20)
      {
        id WeakRetained = _TSLogDomain();
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 136315138;
          v38 = "-[TSWebsheetViewController userContentController:didReceiveScriptMessage:]";
          uint64_t v18 = "No longer supported @%s";
          goto LABEL_22;
        }
      }
      else
      {
        v21 = [v5 name];
        int v22 = [v21 isEqualToString:@"doneSelected"];

        if (v22)
        {
          [(TSWebsheetViewController *)self _doneButtonTapped];
          goto LABEL_8;
        }
        uint64_t v23 = [v5 name];
        int v24 = [v23 isEqualToString:@"dataPlanAccountUpdated"];

        if (!v24)
        {
          uint64_t v25 = [v5 name];
          int v26 = [v25 isEqualToString:@"showVerifyingIndicator"];

          if (v26)
          {
            v27 = self;
            uint64_t v28 = 1;
          }
          else
          {
            v29 = [v5 name];
            int v30 = [v29 isEqualToString:@"hideVerifyingIndicator"];

            if (!v30)
            {
              v31 = [v5 name];
              int v32 = [v31 isEqualToString:@"dismissKeyboard"];

              if (v32)
              {
                id WeakRetained = [(TSWebsheetViewController *)self navigationController];
                [WeakRetained _endPinningInputViews];
              }
              else
              {
                v33 = [v5 name];
                int v34 = [v33 isEqualToString:@"dataPlanAccountCancelled"];

                if (v34)
                {
                  id WeakRetained = objc_loadWeakRetained((id *)&self->_callbackDelegate);
                  [WeakRetained accountCancelled];
                }
                else
                {
                  v35 = [v5 name];
                  int v36 = [v35 isEqualToString:@"dataPlanPendingRelease"];

                  if (!v36) {
                    goto LABEL_8;
                  }
                  id WeakRetained = objc_loadWeakRetained((id *)&self->_callbackDelegate);
                  [WeakRetained accountPendingRelease];
                }
              }
              goto LABEL_23;
            }
            v27 = self;
            uint64_t v28 = 0;
          }
          [(TSWebsheetViewController *)v27 _showVerifyingIndicator:v28];
          goto LABEL_8;
        }
        id WeakRetained = _TSLogDomain();
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 136315138;
          v38 = "-[TSWebsheetViewController userContentController:didReceiveScriptMessage:]";
          uint64_t v18 = "No longer handled @%s";
          goto LABEL_22;
        }
      }
    }
LABEL_23:

    goto LABEL_8;
  }

LABEL_6:
  v12 = [v5 body];
  [(TSWebsheetViewController *)self _handlePlanPurchaseWithMessageBody:v12];
LABEL_7:

  [(TSWebsheetViewController *)self _transferESimInstallationStarted];
LABEL_8:
}

- (id)_processPool
{
  id v2 = objc_alloc_init(MEMORY[0x263F1FAB0]);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v4 = [v3 builtInPlugInsURL];
  id v5 = [v4 URLByAppendingPathComponent:@"SafariServices.wkbundle"];
  [v2 setInjectedBundleURL:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F1FA28]) _initWithConfiguration:v2];
  return v6;
}

- (id)_webViewConfigurationWithProcessPool:(id)a3
{
  char v4 = (objc_class *)MEMORY[0x263F1FAC8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initNonPersistentConfiguration];
  [v6 setSuppressesConnectionTerminationOnSystemChange:1];
  [v6 setSourceApplicationSecondaryIdentifier:@"com.apple.CommCenter.CellularPlanProvisioning"];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F1FA68]) _initWithConfiguration:v6];
  id v8 = [v7 httpCookieStore];
  [v8 _setCookieAcceptPolicy:2 completionHandler:&__block_literal_global_96];

  id v9 = objc_alloc_init(MEMORY[0x263F1FA60]);
  [v9 setDataDetectorTypes:0];
  [v9 setProcessPool:v5];

  [v9 setWebsiteDataStore:v7];
  if (+[TSUtilities isPad])
  {
    v10 = [v9 defaultWebpagePreferences];
    [v10 setPreferredContentMode:1];

    [v9 _setApplePayEnabled:1];
  }
  int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 pathForResource:@"MessageCallbackHandler" ofType:@"js"];

  id v19 = 0;
  uint64_t v13 = [NSString stringWithContentsOfFile:v12 encoding:4 error:&v19];
  id v14 = v19;
  if (v14)
  {
    uint64_t v15 = _TSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[TSWebsheetViewController _webViewConfigurationWithProcessPool:]();
    }
  }
  if ([v13 length])
  {
    id v16 = objc_alloc_init(MEMORY[0x263F1FA38]);
    if (v13)
    {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v13 injectionTime:0 forMainFrameOnly:1];
      [v16 addUserScript:v17];
    }
    [v16 addScriptMessageHandler:self name:@"dataPlanAccountUpdatedWithIccid"];
    [v16 addScriptMessageHandler:self name:@"showCancelButtonSelected"];
    [v16 addScriptMessageHandler:self name:@"hideCancelButtonSelected"];
    [v16 addScriptMessageHandler:self name:@"dataPlanAccountUpdated"];
    [v16 addScriptMessageHandler:self name:@"doneSelected"];
    [v16 addScriptMessageHandler:self name:@"showVerifyingIndicator"];
    [v16 addScriptMessageHandler:self name:@"hideVerifyingIndicator"];
    [v16 addScriptMessageHandler:self name:@"dismissKeyboard"];
    [v16 addScriptMessageHandler:self name:@"dataPlanAccountUpdatedWithInfo"];
    [v16 addScriptMessageHandler:self name:@"dataPlanTransferAccountUpdatedWithInfo"];
    [v16 addScriptMessageHandler:self name:@"dataPlanAccountCancelled"];
    [v16 addScriptMessageHandler:self name:@"dataPlanPendingRelease"];
    [v9 setUserContentController:v16];
    objc_storeWeak((id *)&self->_wkUserContentController, v16);
  }
  return v9;
}

- (void)_doneButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidComplete:self];

  if (!self->_skipUIDismissal)
  {
    [(TSWebsheetViewController *)self dismissViewControllerWithTransition:7 completion:0];
  }
}

- (void)_showCancelButton:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[TSUtilities isPad];
  id v6 = [(TSWebsheetViewController *)self navigationItem];
  id v9 = v6;
  if (v5)
  {
    if (v3) {
      cancelButton = self->_cancelButton;
    }
    else {
      cancelButton = 0;
    }
    [v6 setRightBarButtonItem:cancelButton animated:1];
  }
  else
  {
    if (v3) {
      id v8 = self->_cancelButton;
    }
    else {
      id v8 = 0;
    }
    [v6 setLeftBarButtonItem:v8 animated:1];
  }
}

- (void)_showVerifyingIndicator:(BOOL)a3
{
  if (a3)
  {
    char v4 = [(TSWebsheetViewController *)self title];
    currentTitle = self->_currentTitle;
    self->_currentTitle = v4;

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"Verifying" value:&stru_26DBE8E78 table:@"Localizable"];
    [(TSWebsheetViewController *)self setTitle:v7];

    id v11 = +[TSNavigationBarSpinnerManager sharedManager];
    id v8 = [(TSWebsheetViewController *)self navigationController];
    id v9 = [v8 navigationItem];
    v10 = [(id)objc_opt_class() description];
    [v11 startSpinnerInNavigationItem:v9 withIdentifier:v10];
  }
  else
  {
    [(TSWebsheetViewController *)self setTitle:self->_currentTitle];
    id v11 = +[TSNavigationBarSpinnerManager sharedManager];
    id v8 = [(id)objc_opt_class() description];
    [v11 stopSpinnerForIdentifier:v8];
  }
}

- (void)_handlePlanPurchaseWithMessageBody:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_didReceivePurchaseCallback)
  {
    id v6 = _TSLogDomain();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_56:

      goto LABEL_57;
    }
    int v36 = 136315138;
    int v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
    id v7 = "Received 2nd purchase callback - skipping @%s";
LABEL_4:
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v36, 0xCu);
    goto LABEL_56;
  }
  self->_didReceivePurchaseCallback = 1;
  if (!v4)
  {
    id v6 = _TSLogDomain();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    int v36 = 136315138;
    int v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
    id v7 = "Invalid message @%s";
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if ([(TSWebsheetViewController *)self _isHexadecimalString:v6])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_callbackDelegate);
      [WeakRetained didPurchasePlanSuccessfullyWithEid:0 imei:0 meid:0 iccid:v6 alternateSDMP:0 state:0];
LABEL_55:

      goto LABEL_56;
    }
    id WeakRetained = _TSLogDomain();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_55;
    }
    int v36 = 138412546;
    int v37 = (const char *)v6;
    __int16 v38 = 2080;
    __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
    id v11 = "Invalid ICCID: %@ @%s";
    v12 = WeakRetained;
    uint32_t v13 = 22;
LABEL_18:
    _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v36, v13);
    goto LABEL_55;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v5;
    id v6 = v9;
    if (self->_isRemotePlan)
    {
      id WeakRetained = [v9 objectForKeyedSubscript:@"state"];
      if (WeakRetained
        && [(TSWebsheetViewController *)self _isProfilePendingRelease:WeakRetained])
      {
        v10 = objc_loadWeakRetained((id *)&self->_callbackDelegate);
        [v10 accountPendingRelease];
LABEL_49:

        goto LABEL_55;
      }
    }
    else
    {
      id WeakRetained = 0;
    }
    id v14 = WeakRetained;
    id WeakRetained = [v6 objectForKeyedSubscript:@"eid"];

    BOOL v15 = WeakRetained != 0;
    if (WeakRetained
      && (!isValidNSString(WeakRetained)
       || [WeakRetained length] != 32
       || ![(TSWebsheetViewController *)self _isHexadecimalString:WeakRetained]))
    {
      v10 = _TSLogDomain();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      int v36 = 138412546;
      int v37 = (const char *)WeakRetained;
      __int16 v38 = 2080;
      __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
      int v24 = "Invalid EID: %@ @%s";
      goto LABEL_48;
    }
    id v16 = [v6 objectForKeyedSubscript:@"imei"];

    if (v16)
    {
      if (!isValidNSString(v16)
        || [v16 length] != 15 && objc_msgSend(v16, "length") != 16
        || ![(TSWebsheetViewController *)self _isHexadecimalString:v16])
      {
        uint64_t v25 = _TSLogDomain();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_54;
        }
        int v36 = 138412546;
        int v37 = v16;
        __int16 v38 = 2080;
        __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        int v26 = "Invalid IMEI: %@ @%s";
        goto LABEL_52;
      }
      BOOL v15 = 1;
    }
    id WeakRetained = [v6 objectForKeyedSubscript:@"meid"];

    if (WeakRetained)
    {
      if (!isValidNSString(WeakRetained)
        || [WeakRetained length] != 14 && [WeakRetained length] != 15
        || ![(TSWebsheetViewController *)self _isHexadecimalString:WeakRetained])
      {
        v10 = _TSLogDomain();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_49;
        }
        int v36 = 138412546;
        int v37 = (const char *)WeakRetained;
        __int16 v38 = 2080;
        __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        int v24 = "Invalid MEID: %@ @%s";
        goto LABEL_48;
      }
      BOOL v15 = 1;
    }
    id v16 = [v6 objectForKeyedSubscript:@"iccid"];

    if (!v16)
    {
      v29 = _TSLogDomain();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 136315138;
        int v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        _os_log_impl(&dword_227A17000, v29, OS_LOG_TYPE_DEFAULT, "Missing ICCID @%s", (uint8_t *)&v36, 0xCu);
      }

      int v30 = [v6 objectForKeyedSubscript:@"mcc"];
      if (v30)
      {
        id WeakRetained = v30;
        if (!isValidNSString(v30)
          || [WeakRetained length] != 3
          || ![(TSWebsheetViewController *)self _isHexadecimalString:WeakRetained])
        {
          v10 = _TSLogDomain();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_49;
          }
          int v36 = 138412546;
          int v37 = (const char *)WeakRetained;
          __int16 v38 = 2080;
          __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
          int v24 = "Invalid mcc: %@ @%s";
          goto LABEL_48;
        }
        id v16 = [v6 objectForKeyedSubscript:@"mnc"];

        if (v16)
        {
          if (isValidNSString(v16)
            && ([v16 length] == 2 || objc_msgSend(v16, "length") == 3)
            && [(TSWebsheetViewController *)self _isHexadecimalString:v16])
          {
            id WeakRetained = [v6 objectForKeyedSubscript:@"gid1"];

            if (WeakRetained
              && (!isValidNSString(WeakRetained)
               || [WeakRetained length] != 3
               || ![(TSWebsheetViewController *)self _isHexadecimalString:WeakRetained]))
            {
              v10 = _TSLogDomain();
              if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_49;
              }
              int v36 = 138412546;
              int v37 = (const char *)WeakRetained;
              __int16 v38 = 2080;
              __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
              int v24 = "Invalid gid1: %@ @%s";
              goto LABEL_48;
            }
            id v16 = [v6 objectForKeyedSubscript:@"gid2"];

            if (!v16
              || isValidNSString(v16)
              && [v16 length] == 3
              && [(TSWebsheetViewController *)self _isHexadecimalString:v16])
            {
              uint64_t v25 = objc_loadWeakRetained((id *)&self->_callbackDelegate);
              v31 = [v6 objectForKeyedSubscript:@"mcc"];
              int v32 = [v6 objectForKeyedSubscript:@"mnc"];
              v33 = [v6 objectForKeyedSubscript:@"gid1"];
              int v34 = [v6 objectForKeyedSubscript:@"gid2"];
              v35 = [v6 objectForKeyedSubscript:@"state"];
              [v25 didPurchasePlanSuccessfullyWithCarrier:v31 mnc:v32 gid1:v33 gid2:v34 state:v35];

              goto LABEL_54;
            }
            uint64_t v25 = _TSLogDomain();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_54;
            }
            int v36 = 138412546;
            int v37 = v16;
            __int16 v38 = 2080;
            __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
            int v26 = "Invalid gid2: %@ @%s";
          }
          else
          {
            uint64_t v25 = _TSLogDomain();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_54;
            }
            int v36 = 138412546;
            int v37 = v16;
            __int16 v38 = 2080;
            __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
            int v26 = "Invalid mnc: %@ @%s";
          }
          goto LABEL_52;
        }
        id WeakRetained = _TSLogDomain();
        if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_55;
        }
        int v36 = 136315138;
        int v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        id v11 = "Missing mnc @%s";
      }
      else
      {
        id WeakRetained = _TSLogDomain();
        if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_55;
        }
        int v36 = 136315138;
        int v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        id v11 = "Missing mcc @%s";
      }
      v12 = WeakRetained;
      uint32_t v13 = 12;
      goto LABEL_18;
    }
    if (isValidNSString(v16)
      && ([v16 length] == 19 || objc_msgSend(v16, "length") == 20)
      && [(TSWebsheetViewController *)self _isHexadecimalString:v16])
    {
      if (v15)
      {
        id WeakRetained = [v6 objectForKeyedSubscript:@"alternateSmdpFqdn"];

        if (!WeakRetained
          || isValidNSString(WeakRetained)
          && ([NSURL URLWithString:WeakRetained],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              v17,
              v17))
        {
          v10 = objc_loadWeakRetained((id *)&self->_callbackDelegate);
          uint64_t v18 = [v6 objectForKeyedSubscript:@"eid"];
          id v19 = [v6 objectForKeyedSubscript:@"imei"];
          int v20 = [v6 objectForKeyedSubscript:@"meid"];
          v21 = [v6 objectForKeyedSubscript:@"iccid"];
          int v22 = [v6 objectForKeyedSubscript:@"alternateSmdpFqdn"];
          uint64_t v23 = [v6 objectForKeyedSubscript:@"state"];
          [v10 didPurchasePlanSuccessfullyWithEid:v18 imei:v19 meid:v20 iccid:v21 alternateSDMP:v22 state:v23];

          goto LABEL_49;
        }
        v10 = _TSLogDomain();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_49;
        }
        int v36 = 138412546;
        int v37 = (const char *)WeakRetained;
        __int16 v38 = 2080;
        __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        int v24 = "Invalid alternateSmdpFqdn: %@ @%s";
LABEL_48:
        _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v36, 0x16u);
        goto LABEL_49;
      }
      uint64_t v25 = _TSLogDomain();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 136315138;
        int v37 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
        int v26 = "Missing identifier @%s";
        v27 = v25;
        uint32_t v28 = 12;
        goto LABEL_53;
      }
LABEL_54:

      id WeakRetained = v16;
      goto LABEL_55;
    }
    uint64_t v25 = _TSLogDomain();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_54;
    }
    int v36 = 138412546;
    int v37 = v16;
    __int16 v38 = 2080;
    __int16 v39 = "-[TSWebsheetViewController _handlePlanPurchaseWithMessageBody:]";
    int v26 = "Invalid ICCID: %@ @%s";
LABEL_52:
    v27 = v25;
    uint32_t v28 = 22;
LABEL_53:
    _os_log_impl(&dword_227A17000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v36, v28);
    goto LABEL_54;
  }
LABEL_57:
}

- (void)_handleTransferWithMessageBody:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "Invalid message @%s", buf, 0xCu);
    }

LABEL_8:
    BOOL v5 = v4;
    id v7 = [v5 objectForKeyedSubscript:@"eid"];
    id v8 = v7;
    BOOL v9 = v7 != 0;
    if (v7
      && ([v7 length] != 32
       || ![(TSWebsheetViewController *)self _isHexadecimalString:v8]))
    {
      v12 = _TSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = v8;
        __int16 v44 = 2080;
        v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, "Invalid EID: %@ @%s", buf, 0x16u);
      }
      goto LABEL_44;
    }
    v10 = [v5 objectForKeyedSubscript:@"alternateSmdpFqdn"];

    if (v10)
    {
      id v11 = [NSURL URLWithString:v10];

      if (!v11)
      {
        v12 = _TSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v43 = v10;
          __int16 v44 = 2080;
          v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
          _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, "Invalid alternateSmdpFqdn: %@ @%s", buf, 0x16u);
        }
        goto LABEL_43;
      }
    }
    v12 = [v5 objectForKeyedSubscript:@"targetIccids"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (![v12 count])
      {
        BOOL v15 = _TSLogDomain();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_42;
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        int v22 = "Missing target ICCIDs @%s";
        goto LABEL_41;
      }
      uint32_t v13 = [v12 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        BOOL v15 = [v12 objectAtIndexedSubscript:0];
        id v16 = [v15 objectForKeyedSubscript:@"imei"];

        if (v16)
        {
          if ([v16 length] != 15 && objc_msgSend(v16, "length") != 16
            || ![(TSWebsheetViewController *)self _isHexadecimalString:v16])
          {
            uint64_t v23 = _TSLogDomain();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_64;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v43 = v16;
            __int16 v44 = 2080;
            v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
            int v24 = "Invalid IMEI: %@ @%s";
            goto LABEL_60;
          }
          BOOL v9 = 1;
        }
        uint64_t v17 = [v15 objectForKeyedSubscript:@"meid"];

        if (v17)
        {
          if ([v17 length] != 14 && objc_msgSend(v17, "length") != 15
            || ![(TSWebsheetViewController *)self _isHexadecimalString:v17])
          {
            uint64_t v23 = _TSLogDomain();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v43 = v17;
              __int16 v44 = 2080;
              v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
              uint64_t v25 = "Invalid MEID: %@ @%s";
              int v26 = v23;
              uint32_t v27 = 22;
LABEL_56:
              _os_log_impl(&dword_227A17000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
            }
LABEL_57:
            id v16 = v17;
            goto LABEL_64;
          }
          BOOL v9 = 1;
        }
        id v16 = [v15 objectForKeyedSubscript:@"iccid"];

        if (!v16)
        {
          uint64_t v23 = _TSLogDomain();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
            _os_log_impl(&dword_227A17000, v23, OS_LOG_TYPE_DEFAULT, "ICCID missing @%s", buf, 0xCu);
          }
          id v16 = 0;
          goto LABEL_64;
        }
        if (([v16 length] == 19 || objc_msgSend(v16, "length") == 20)
          && [(TSWebsheetViewController *)self _isHexadecimalString:v16])
        {
          uint64_t v17 = [v15 objectForKeyedSubscript:@"src-iccid"];

          if (v17)
          {
            if (([v17 length] == 19 || objc_msgSend(v17, "length") == 20)
              && [(TSWebsheetViewController *)self _isHexadecimalString:v17])
            {
LABEL_69:
              if (v9)
              {
                id v16 = [v15 objectForKeyedSubscript:@"state"];

                if (!v16 || (unint64_t)[v16 length] < 0x33)
                {
                  p_callbackDelegate = &self->_callbackDelegate;
                  id WeakRetained = objc_loadWeakRetained((id *)p_callbackDelegate);

                  if (WeakRetained)
                  {
                    uint64_t v23 = objc_loadWeakRetained((id *)p_callbackDelegate);
                    __int16 v41 = [v5 objectForKeyedSubscript:@"eid"];
                    uint64_t v40 = [v15 objectForKeyedSubscript:@"imei"];
                    __int16 v39 = [v15 objectForKeyedSubscript:@"meid"];
                    int v30 = [v15 objectForKeyedSubscript:@"iccid"];
                    v31 = [v15 objectForKeyedSubscript:@"src-iccid"];
                    int v32 = [v5 objectForKeyedSubscript:@"alternateSmdpFqdn"];
                    v33 = [v15 objectForKeyedSubscript:@"state"];
                    [v23 didTransferPlanSuccessfullyWithEid:v41 imei:v40 meid:v39 iccid:v30 srcIccid:v31 alternateSDMP:v32 state:v33];
                  }
                  else
                  {
                    int v34 = _TSLogDomain();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      uint64_t v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
                      _os_log_impl(&dword_227A17000, v34, OS_LOG_TYPE_DEFAULT, "ERROR: invalid delegate for transfer plan. invoke TSCellularPlanManagerCache directly @%s", buf, 0xCu);
                    }

                    uint64_t v23 = +[TSCellularPlanManagerCache sharedInstance];
                    __int16 v41 = [v5 objectForKeyedSubscript:@"eid"];
                    v35 = [v15 objectForKeyedSubscript:@"iccid"];
                    int v36 = [v15 objectForKeyedSubscript:@"src-iccid"];
                    int v37 = [v5 objectForKeyedSubscript:@"alternateSmdpFqdn"];
                    __int16 v38 = [v15 objectForKeyedSubscript:@"state"];
                    [v23 didTransferPlanForEid:v41 iccid:v35 srcIccid:v36 smdpURL:v37 state:v38];
                  }
                  goto LABEL_64;
                }
                uint64_t v23 = _TSLogDomain();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v43 = v16;
                  __int16 v44 = 2080;
                  v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
                  int v24 = "Invalid state: %@ @%s";
                  goto LABEL_60;
                }
LABEL_64:

                v10 = v16;
                goto LABEL_42;
              }
              uint64_t v23 = _TSLogDomain();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
                uint64_t v25 = "No identifier found @%s";
                int v26 = v23;
                uint32_t v27 = 12;
                goto LABEL_56;
              }
              goto LABEL_57;
            }
            uint64_t v18 = _TSLogDomain();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v43 = v17;
              __int16 v44 = 2080;
              v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
              id v19 = "Invalid source ICCID: %@ @%s";
              int v20 = v18;
              uint32_t v21 = 22;
LABEL_67:
              _os_log_impl(&dword_227A17000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
            }
          }
          else
          {
            uint64_t v18 = _TSLogDomain();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
              id v19 = "source ICCID missing @%s";
              int v20 = v18;
              uint32_t v21 = 12;
              goto LABEL_67;
            }
          }

          goto LABEL_69;
        }
        uint64_t v23 = _TSLogDomain();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_64;
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = v16;
        __int16 v44 = 2080;
        v45 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        int v24 = "Invalid ICCID: %@ @%s";
LABEL_60:
        _os_log_impl(&dword_227A17000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
        goto LABEL_64;
      }
      BOOL v15 = _TSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        int v22 = "Invalid target device information @%s";
        goto LABEL_41;
      }
    }
    else
    {
      BOOL v15 = _TSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
        int v22 = "Invalid target ICCIDs @%s";
LABEL_41:
        _os_log_impl(&dword_227A17000, v15, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      }
    }
LABEL_42:

LABEL_43:
    id v8 = v10;
LABEL_44:

    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  BOOL v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v43 = "-[TSWebsheetViewController _handleTransferWithMessageBody:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "Invalid body type @%s", buf, 0xCu);
  }
LABEL_45:
}

- (BOOL)_currentLanguageIsRTL
{
  id v2 = [MEMORY[0x263EFF960] preferredLanguages];
  if ([v2 count])
  {
    BOOL v3 = (void *)MEMORY[0x263EFF960];
    id v4 = [v2 firstObject];
    uint64_t v5 = [v3 characterDirectionForLanguage:v4];

    BOOL v6 = v5 == 2;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isHexadecimalString:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  uint64_t v5 = [v3 characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
  BOOL v6 = [v5 invertedSet];

  uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];
  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_isProfilePendingRelease:(id)a3
{
  return [a3 isEqualToString:@"pending-profile-release"];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  if (!self->_didViewAppear)
  {
    id v6 = v4;
    [v4 contentOffset];
    id v4 = v6;
    if (v5 > 0.0)
    {
      objc_msgSend(v6, "setContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      id v4 = v6;
    }
  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TSEntitlementJSHandlerDelegate)callbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callbackDelegate);
  return (TSEntitlementJSHandlerDelegate *)WeakRetained;
}

- (void)setCallbackDelegate:(id)a3
{
}

- (int64_t)dismissCause
{
  return self->_dismissCause;
}

- (void)setDismissCause:(int64_t)a3
{
  self->_dismissCause = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_callbackDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_requestLoadedCompletion, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_currentTitle, 0);
  objc_destroyWeak((id *)&self->_wkUserContentController);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_autoFillController, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

- (void)webView:didFailProvisionalNavigation:withError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Error: %@ @%s", v2, v3, v4, v5, v6);
}

- (void)webView:decidePolicyForNavigationAction:decisionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[TSWebsheetViewController webView:decidePolicyForNavigationAction:decisionHandler:]";
  _os_log_debug_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEBUG, "[Db] %@ @%s", v1, 0x16u);
}

- (void)webView:didFailNavigation:withError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Error: %@ @%s", v2, v3, v4, v5, v6);
}

- (void)_webViewConfigurationWithProcessPool:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]error loading js file: %@ @%s", v2, v3, v4, v5, v6);
}

@end