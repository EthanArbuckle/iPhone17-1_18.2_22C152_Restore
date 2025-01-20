@interface RemoteUIWebViewController
- (BOOL)scalesPageToFit;
- (NSString)dismissButtonAlignment;
- (NSString)dismissButtonLabel;
- (RUIStyle)style;
- (RemoteUIWebViewControllerDelegate)delegate;
- (UIToolbar)toolbar;
- (WKWebView)webView;
- (id)_spinnerManagerIdentifier;
- (id)navigationBar;
- (id)navigationItem;
- (id)scriptForJSBridge;
- (id)scriptForScalesPageToFit;
- (void)_dismissWithPayload:(id)a3;
- (void)_startActivityIndicator;
- (void)_stopActivityIndicator;
- (void)dealloc;
- (void)donePressed:(id)a3;
- (void)loadURL:(id)a3;
- (void)loadURL:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDismissButtonAlignment:(id)a3;
- (void)setDismissButtonLabel:(id)a3;
- (void)setScalesPageToFit:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation RemoteUIWebViewController

- (void)viewDidLoad
{
  v58[1] = *MEMORY[0x263EF8340];
  v57.receiver = self;
  v57.super_class = (Class)RemoteUIWebViewController;
  [(RemoteUIWebViewController *)&v57 viewDidLoad];
  if (!self->_webView)
  {
    v3 = objc_opt_new();
    v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 || self->_scalesPageToFit)
    {
      v6 = [(RemoteUIWebViewController *)self scriptForScalesPageToFit];
      [v3 addUserScript:v6];
    }
    v7 = [(RemoteUIWebViewController *)self scriptForJSBridge];
    [v3 addUserScript:v7];

    [v3 addScriptMessageHandler:self name:@"dismissWebView"];
    [v3 addScriptMessageHandler:self name:@"startActivityIndicator"];
    [v3 addScriptMessageHandler:self name:@"stopActivityIndicator"];
    [v3 addScriptMessageHandler:self name:@"log"];
    [v3 addScriptMessageHandler:self name:@"error"];
    v8 = objc_opt_new();
    [v8 setUserContentController:v3];
    +[RUIPlatform assertWebkitAllowed];
    id v9 = objc_alloc(MEMORY[0x263F1FA58]);
    v10 = (WKWebView *)objc_msgSend(v9, "initWithFrame:configuration:", v8, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    webView = self->_webView;
    self->_webView = v10;

    [(WKWebView *)self->_webView setNavigationDelegate:self];
    [(WKWebView *)self->_webView setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(RemoteUIWebViewController *)self view];
    [v12 addSubview:self->_webView];

    v13 = (UINavigationBar *)objc_alloc_init(MEMORY[0x263F829A0]);
    navigationBar = self->_navigationBar;
    self->_navigationBar = v13;

    [(UINavigationBar *)self->_navigationBar setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(RemoteUIWebViewController *)self view];
    [v15 addSubview:self->_navigationBar];

    v16 = [(UINavigationBar *)self->_navigationBar topAnchor];
    v17 = [(RemoteUIWebViewController *)self view];
    v18 = [v17 topAnchor];
    v19 = [v16 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    v20 = [(UINavigationBar *)self->_navigationBar leftAnchor];
    v21 = [(RemoteUIWebViewController *)self view];
    v22 = [v21 leftAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    v24 = [(UINavigationBar *)self->_navigationBar rightAnchor];
    v25 = [(RemoteUIWebViewController *)self view];
    v26 = [v25 rightAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v27 setActive:1];

    v28 = [(RemoteUIWebViewController *)self view];
    v29 = [v28 topAnchor];

    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __40__RemoteUIWebViewController_viewDidLoad__block_invoke;
    v56[3] = &unk_2642112D8;
    v56[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v56];
    v30 = [(WKWebView *)self->_webView topAnchor];
    v31 = [v30 constraintEqualToAnchor:v29];
    [v31 setActive:1];

    v32 = [(WKWebView *)self->_webView leftAnchor];
    v33 = [(RemoteUIWebViewController *)self view];
    v34 = [v33 leftAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(WKWebView *)self->_webView rightAnchor];
    v37 = [(RemoteUIWebViewController *)self view];
    v38 = [v37 rightAnchor];
    v39 = [v36 constraintEqualToAnchor:v38];
    [v39 setActive:1];

    v40 = [(WKWebView *)self->_webView bottomAnchor];
    v41 = [(RemoteUIWebViewController *)self view];
    v42 = [v41 bottomAnchor];
    v43 = [v40 constraintEqualToAnchor:v42];
    [v43 setActive:1];

    v44 = [(RemoteUIWebViewController *)self dismissButtonLabel];

    id v45 = objc_alloc(MEMORY[0x263F824A8]);
    v46 = v45;
    if (v44)
    {
      v47 = [(RemoteUIWebViewController *)self dismissButtonLabel];
      v48 = (void *)[v46 initWithTitle:v47 style:0 target:self action:sel_donePressed_];
    }
    else
    {
      v48 = (void *)[v45 initWithBarButtonSystemItem:0 target:self action:sel_donePressed_];
    }
    v49 = (UINavigationItem *)objc_alloc_init(MEMORY[0x263F829C8]);
    navigationItem = self->_navigationItem;
    self->_navigationItem = v49;

    v51 = [(RemoteUIWebViewController *)self dismissButtonAlignment];
    int v52 = [v51 isEqualToString:@"leading"];

    v53 = self->_navigationItem;
    if (v52) {
      [(UINavigationItem *)v53 setLeftBarButtonItem:v48];
    }
    else {
      [(UINavigationItem *)v53 setRightBarButtonItem:v48];
    }
    v54 = self->_navigationBar;
    v58[0] = self->_navigationItem;
    v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:1];
    [(UINavigationBar *)v54 setItems:v55];

    [(RUIStyle *)self->_style applyToNavigationBar:self->_navigationBar];
  }
}

uint64_t __40__RemoteUIWebViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  double v2 = RemoteUIPreferredContentSize();
  v3 = *(void **)(a1 + 32);
  return [v3 setPreferredContentSize:v2];
}

- (id)navigationItem
{
  return self->_navigationItem;
}

- (void)_startActivityIndicator
{
  id v5 = +[RUINavBarSpinnerManager sharedSpinnerManager];
  v3 = [(RemoteUIWebViewController *)self navigationItem];
  v4 = [(RemoteUIWebViewController *)self _spinnerManagerIdentifier];
  [v5 startAnimatingInNavItem:v3 title:0 forIdentifier:v4 hideBackButton:0 hideLeftItems:0];
}

- (void)_stopActivityIndicator
{
  id v4 = +[RUINavBarSpinnerManager sharedSpinnerManager];
  v3 = [(RemoteUIWebViewController *)self _spinnerManagerIdentifier];
  [v4 stopAnimatingForIdentifier:v3];
}

- (id)_spinnerManagerIdentifier
{
  double v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)scriptForJSBridge
{
  double v2 = (void *)[@"var remoteUIBridge = {};" mutableCopy];
  objc_msgSend(v2, "appendFormat:", @"remoteUIBridge.%1$@ = function(payload) {         webkit.messageHandlers.%1$@.postMessage(payload);     };",
    @"dismissWebView");
  objc_msgSend(v2, "appendFormat:", @"remoteUIBridge.%1$@ = function() {         webkit.messageHandlers.%1$@.postMessage(null);     };",
    @"startActivityIndicator");
  objc_msgSend(v2, "appendFormat:", @"remoteUIBridge.%1$@ = function() {         webkit.messageHandlers.%1$@.postMessage(null);     };",
    @"stopActivityIndicator");
  objc_msgSend(v2, "appendFormat:", @"remoteUIBridge.%1$@ = function(message) {         webkit.messageHandlers.%1$@.postMessage(message);     };",
    @"log");
  [v2 appendString:@"window.onerror = function(message) {         webkit.messageHandlers.error.postMessage(message);     };"];
  v3 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v2 injectionTime:0 forMainFrameOnly:0];

  return v3;
}

- (id)scriptForScalesPageToFit
{
  double v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1FA40]), "initWithSource:injectionTime:forMainFrameOnly:", @"var meta = document.createElement('meta');     meta.name = 'viewport';     meta.content = 'width=device-width';     var head = document.getElementsByTagName('head')[0];    head.appendChild(meta);",
                 1,
                 0);
  return v2;
}

- (id)navigationBar
{
  navigationBar = self->_navigationBar;
  if (!navigationBar)
  {
    [(RemoteUIWebViewController *)self loadView];
    navigationBar = self->_navigationBar;
  }
  return navigationBar;
}

- (WKWebView)webView
{
  webView = self->_webView;
  if (!webView)
  {
    [(RemoteUIWebViewController *)self loadView];
    webView = self->_webView;
  }
  return webView;
}

- (void)dealloc
{
  [(WKWebView *)self->_webView setNavigationDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)RemoteUIWebViewController;
  [(RemoteUIWebViewController *)&v3 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)RemoteUIWebViewController;
  [(RemoteUIWebViewController *)&v4 viewDidLayoutSubviews];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__RemoteUIWebViewController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_2642112D8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__RemoteUIWebViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1000) frame];
  objc_super v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "setAdditionalSafeAreaInsets:", v2, 0.0, 0.0, 0.0);
}

- (void)_dismissWithPayload:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  id v7 = objc_loadWeakRetained((id *)p_delegate);
  id v8 = v7;
  if (v6) {
    [v7 remoteUIWebViewController:self dismissWithPayload:0];
  }
  else {
    [v7 remoteUIWebViewControllerDonePressed:self];
  }
}

- (void)donePressed:(id)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(RemoteUIWebViewController *)self isBeingDismissed];
  v9.receiver = self;
  v9.super_class = (Class)RemoteUIWebViewController;
  [(RemoteUIWebViewController *)&v9 viewDidDisappear:v3];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 remoteUIWebViewControllerDidDismiss:self];
    }
  }
}

- (void)loadURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  char v7 = (void *)[a4 copy];
  id loadCompletion = self->_loadCompletion;
  self->_id loadCompletion = v7;

  id v10 = [MEMORY[0x263F089E0] requestWithURL:v6];

  [v10 setTimeoutInterval:30.0];
  id v9 = [(WKWebView *)self->_webView loadRequest:v10];
}

- (void)loadURL:(id)a3
{
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id loadCompletion = (void (**)(id, uint64_t, void, id))self->_loadCompletion;
  if (loadCompletion)
  {
    loadCompletion[2](loadCompletion, 1, 0, a4);
    id v6 = self->_loadCompletion;
    self->_id loadCompletion = 0;
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a5;
  if (_isInternalInstall())
  {
    char v7 = _RUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_2144F2000, v7, OS_LOG_TYPE_DEFAULT, "WebView load failed with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  id loadCompletion = (void (**)(id, void, id))self->_loadCompletion;
  if (loadCompletion)
  {
    loadCompletion[2](loadCompletion, 0, v6);
    id v9 = self->_loadCompletion;
    self->_id loadCompletion = 0;
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a5;
  if (_isInternalInstall())
  {
    char v7 = _RUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_2144F2000, v7, OS_LOG_TYPE_DEFAULT, "WebView load failed with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  id loadCompletion = (void (**)(id, void, id))self->_loadCompletion;
  if (loadCompletion)
  {
    loadCompletion[2](loadCompletion, 0, v6);
    id v9 = self->_loadCompletion;
    self->_id loadCompletion = 0;
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (_isInternalInstall())
  {
    id v6 = _RUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = [v5 name];
      int v22 = 138543362;
      v23 = v7;
      _os_log_impl(&dword_2144F2000, v6, OS_LOG_TYPE_DEFAULT, "didReceiveScriptMessage: %{public}@", (uint8_t *)&v22, 0xCu);
    }
  }
  id v8 = [v5 name];
  int v9 = [v8 isEqualToString:@"dismissWebView"];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v11 = [v5 body];
    [WeakRetained remoteUIWebViewController:self dismissWithPayload:v11];
  }
  else
  {
    uint64_t v12 = [v5 name];
    int v13 = [v12 isEqualToString:@"startActivityIndicator"];

    if (v13)
    {
      [(RemoteUIWebViewController *)self _startActivityIndicator];
    }
    else
    {
      v14 = [v5 name];
      int v15 = [v14 isEqualToString:@"stopActivityIndicator"];

      if (!v15)
      {
        v16 = [v5 name];
        int v17 = [v16 isEqualToString:@"log"];

        if (v17)
        {
          if (!_isInternalInstall()) {
            goto LABEL_19;
          }
          v18 = _RUILoggingFacility();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = [v5 body];
            int v22 = 138412290;
            v23 = v19;
            _os_log_impl(&dword_2144F2000, v18, OS_LOG_TYPE_DEFAULT, "remoteUIBridge.log: %@", (uint8_t *)&v22, 0xCu);
          }
        }
        else
        {
          v20 = [v5 name];
          int v21 = [v20 isEqualToString:@"error"];

          if (!v21) {
            goto LABEL_19;
          }
          v18 = _RUILoggingFacility();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[RemoteUIWebViewController userContentController:didReceiveScriptMessage:](v5, v18);
          }
        }

        goto LABEL_19;
      }
      [(RemoteUIWebViewController *)self _stopActivityIndicator];
    }
  }
LABEL_19:
}

- (RemoteUIWebViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RemoteUIWebViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (BOOL)scalesPageToFit
{
  return self->_scalesPageToFit;
}

- (void)setScalesPageToFit:(BOOL)a3
{
  self->_scalesPageToFit = a3;
}

- (RUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (NSString)dismissButtonAlignment
{
  return self->_dismissButtonAlignment;
}

- (void)setDismissButtonAlignment:(id)a3
{
}

- (NSString)dismissButtonLabel
{
  return self->_dismissButtonLabel;
}

- (void)setDismissButtonLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButtonLabel, 0);
  objc_storeStrong((id *)&self->_dismissButtonAlignment, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong(&self->_loadCompletion, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)userContentController:(void *)a1 didReceiveScriptMessage:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 body];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_2144F2000, a2, OS_LOG_TYPE_ERROR, "JS error from webview: %@", (uint8_t *)&v4, 0xCu);
}

@end