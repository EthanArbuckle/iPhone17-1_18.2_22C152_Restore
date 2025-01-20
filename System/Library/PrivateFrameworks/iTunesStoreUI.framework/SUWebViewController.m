@interface SUWebViewController
- (ACAccount)account;
- (BOOL)shouldSignRequests;
- (BOOL)viewIsReady;
- (CGRect)documentBounds;
- (CGSize)minimumViewSize;
- (ISURLRequestPerformance)_performanceMetrics;
- (NSDictionary)tidHeaders;
- (SSAuthenticationContext)authenticationContext;
- (SUMescalSession)_mescalSession;
- (SUWebView)webView;
- (id)_defaultBackgroundColor;
- (id)_placeholderBackgroundView;
- (id)copyArchivableContext;
- (id)copyDefaultScriptProperties;
- (id)copyObjectForScriptFromPoolWithClass:(Class)a3;
- (id)copyScriptProperties;
- (id)displayedURL;
- (id)navigationItemForScriptInterface;
- (id)newRotationController;
- (id)newScriptInterface;
- (id)storePageProtocol;
- (int64_t)style;
- (void)_addPlaceholderBackgroundView;
- (void)_applySavedScrollOffsetIfPossible;
- (void)_applyScriptProperties:(id)a3;
- (void)_finishLoadWithResult:(BOOL)a3 error:(id)a4;
- (void)_getURLRequestForOperation:(id)a3 block:(id)a4;
- (void)_loadURLRequest:(id)a3;
- (void)_loadWithURLOperation:(id)a3 completionBlock:(id)a4;
- (void)_prepareToLoadURL:(id)a3;
- (void)_reloadBackgroundViewPropertiesWithScriptProperties:(id)a3;
- (void)_reloadObjectPool;
- (void)_reloadPlaceholderBackgroundView;
- (void)_reloadUI;
- (void)_removePlaceholderBackgroundView;
- (void)_requestWebScriptReloadWithContext:(id)a3;
- (void)_sendOrientationWillChangeToInterfaceOrientation:(int64_t)a3;
- (void)_setExistingNavigationItem:(id)a3;
- (void)_setLastKnownOrientation:(int64_t)a3;
- (void)_setMescalSession:(id)a3;
- (void)_setPerformanceMetrics:(id)a3;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)dealloc;
- (void)invalidate;
- (void)keyboardDidHideWithInfo:(id)a3;
- (void)keyboardWillShowWithInfo:(id)a3;
- (void)loadView;
- (void)parentViewControllerHierarchyDidChange;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)reloadWithStorePage:(id)a3 forURL:(id)a4;
- (void)setAccount:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setScriptProperties:(id)a3;
- (void)setShouldSignRequests:(BOOL)a3;
- (void)setStorePageProtocol:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTidHeaders:(id)a3;
- (void)setViewIsReady:(BOOL)a3;
- (void)storePageCleanupBeforeTearDown;
- (void)storePageProtocolDidChange;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)webViewManager:(id)a3 didFailLoadWithError:(id)a4;
- (void)webViewManager:(id)a3 didReceivePrimaryResponse:(id)a4;
- (void)webViewManager:(id)a3 didReceiveTitle:(id)a4;
- (void)webViewManager:(id)a3 didRejectInvalidRequest:(id)a4;
- (void)webViewManager:(id)a3 webDocumentViewDidSetFrame:(CGRect)a4;
- (void)webViewManager:(id)a3 willInjectScriptInterface:(id)a4;
- (void)webViewManagerDidFinishLoad:(id)a3;
- (void)webViewManagerDidStartLoad:(id)a3;
@end

@implementation SUWebViewController

- (void)dealloc
{
  [(SUWebViewManager *)self->_webViewManager disconnectFromWebView];
  [(SUWebViewManager *)self->_webViewManager setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v3 dealloc];
}

- (id)newScriptInterface
{
  id result = [(SUClientInterface *)[(SUViewController *)self clientInterface] _newScriptInterface];
  if (!result)
  {
    return +[SUClientDispatch newScriptInterface];
  }
  return result;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_super v3 = a3;
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSMutableAuthenticationContext *)[v3 mutableCopy];
    int64_t v6 = [(SUWebViewController *)self style];
    objc_super v3 = self->_authenticationContext;
    if (v6 == 1)
    {
      [(SSMutableAuthenticationContext *)self->_authenticationContext setShouldFollowAccountButtons:1];
      objc_super v3 = self->_authenticationContext;
    }
  }
  webViewManager = self->_webViewManager;

  [(SUWebViewManager *)webViewManager setAuthenticationContext:v3];
}

- (SUWebView)webView
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  _UIApplicationLoadWebKit();
  if (self->_webViewManager) {
    goto LABEL_15;
  }
  objc_super v3 = self->_authenticationContext;
  if (!v3)
  {
    account = self->_account;
    v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (account)
    {
      if (v7)
      {
        int v19 = 138412290;
        uint64_t v20 = objc_opt_class();
        LODWORD(v18) = 12;
        uint64_t v8 = _os_log_send_and_compose_impl();
        if (v8)
        {
          v9 = (void *)v8;
          objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v19, v18);
          free(v9);
          SSFileLog();
        }
      }
      objc_super v3 = (SSMutableAuthenticationContext *)[objc_alloc(MEMORY[0x263F7B0E0]) initWithBackingAccount:self->_account];
      if (!v3) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v7)
      {
        int v19 = 138412290;
        uint64_t v20 = objc_opt_class();
        LODWORD(v18) = 12;
        v17 = &v19;
        uint64_t v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          v15 = (void *)v14;
          uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v19, v18);
          free(v15);
          v17 = (int *)v16;
          SSFileLog();
        }
      }
      objc_super v3 = (SSMutableAuthenticationContext *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore", v17), "activeAccount");
      self->_account = (ACAccount *)(id)[(SSMutableAuthenticationContext *)v3 backingAccount];
      if (!v3) {
        goto LABEL_14;
      }
    }
    objc_super v3 = (SSMutableAuthenticationContext *)[objc_alloc(MEMORY[0x263F7B120]) initWithAccount:v3];
  }
LABEL_14:
  v10 = [[SUWebViewManager alloc] initWithClientInterface:[(SUViewController *)self clientInterface]];
  self->_webViewManager = v10;
  [(SUWebViewManager *)v10 setAccount:self->_account];
  [(SUWebViewManager *)self->_webViewManager setAuthenticationContext:v3];
  [(SUWebViewManager *)self->_webViewManager setDelegate:self];
  [(SUWebViewManager *)self->_webViewManager setInitialRequestPerformance:self->_performanceMetrics];
  [(SUWebViewManager *)self->_webViewManager setShouldSignRequests:self->_shouldSignRequests];
  [(SUWebViewManager *)self->_webViewManager setTidHeaders:[(SUWebViewController *)self tidHeaders]];
  [(SUWebViewManager *)self->_webViewManager connectToWebView:self->_webView];

LABEL_15:
  id result = self->_webView;
  if (!result)
  {
    id v12 = [(SUWebViewController *)self copyScriptProperties];
    v13 = -[SUWebView initWithFrame:]([SUWebView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 1.0);
    self->_webView = v13;
    [(SUWebViewManager *)self->_webViewManager connectToWebView:v13];
    -[SUWebView setBackgroundColor:](self->_webView, "setBackgroundColor:", [MEMORY[0x263F1C550] systemBackgroundColor]);
    [(SUWebViewController *)self _applyScriptProperties:v12];

    return self->_webView;
  }
  return result;
}

- (void)applicationDidEnterBackground
{
  [[(SUWebViewController *)self webView] setHidden:1];
  [(SUWebViewManager *)self->_webViewManager dispatchEvent:0 forName:@"diddisappear"];
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v3 applicationDidEnterBackground];
}

- (void)applicationWillEnterForeground
{
  [[(SUWebViewController *)self webView] setHidden:0];
  [(SUWebViewManager *)self->_webViewManager dispatchEvent:0 forName:@"didreappear"];
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v3 applicationWillEnterForeground];
}

- (id)copyArchivableContext
{
  v8.receiver = self;
  v8.super_class = (Class)SUWebViewController;
  id v3 = [(SUViewController *)&v8 copyArchivableContext];
  if (![(SUViewController *)self shouldExcludeFromNavigationHistory])
  {
    v4 = (void *)[(SUWebView *)self->_webView scrollView];
    if (v4)
    {
      v5 = (void *)MEMORY[0x263F08D40];
      [v4 contentOffset];
      id v6 = (id)objc_msgSend(v5, "valueWithCGPoint:");
LABEL_6:
      [v3 setValue:v6 forMetadataKey:@"offset"];
      return v3;
    }
    if ([(SUViewController *)self _restoredContext])
    {
      id v6 = [(SUViewControllerContext *)[(SUViewController *)self _restoredContext] valueForMetadataKey:@"offset"];
      goto LABEL_6;
    }
  }
  return v3;
}

- (id)copyDefaultScriptProperties
{
  v8.receiver = self;
  v8.super_class = (Class)SUWebViewController;
  id v2 = [(SUViewController *)&v8 copyDefaultScriptProperties];
  [v2 setDoubleTapEnabled:0];
  [v2 setFlashesScrollIndicators:1];
  [v2 setInputViewObeysDOMFocus:0];
  [v2 setScrollingDisabled:0];
  [v2 setShouldShowFormAccessory:1];
  id v3 = (void *)[MEMORY[0x263F89540] sharedCache];
  v4 = objc_msgSend((id)objc_msgSend(v3, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0)), "valueForKey:", @"p2-client-options");
  objc_opt_class();
  v5 = 0;
  if (objc_opt_isKindOfClass()) {
    v5 = (void *)[v4 objectForKey:@"load-progressively"];
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = [v5 BOOLValue];
  }
  else {
    uint64_t v6 = 1;
  }
  [v2 setShouldLoadProgressively:v6];
  return v2;
}

- (id)copyScriptProperties
{
  v8.receiver = self;
  v8.super_class = (Class)SUWebViewController;
  id v3 = [(SUViewController *)&v8 copyScriptProperties];
  webView = self->_webView;
  if (webView)
  {
    objc_msgSend(v3, "setBackgroundColor:", -[SUWebView backgroundColor](webView, "backgroundColor"));
    objc_msgSend(v3, "setAlwaysDispatchesScrollEvents:", -[SUWebView _alwaysDispatchesScrollEvents](self->_webView, "_alwaysDispatchesScrollEvents"));
    v5 = (void *)[(SUWebView *)self->_webView _browserView];
    objc_msgSend(v3, "setDoubleTapEnabled:", objc_msgSend(v5, "isDoubleTapEnabled"));
    objc_msgSend(v3, "setInputViewObeysDOMFocus:", objc_msgSend(v5, "inputViewObeysDOMFocus"));
    objc_msgSend(v3, "setScrollingDisabled:", -[SUWebView isScrollingEnabled](self->_webView, "isScrollingEnabled") ^ 1);
    objc_msgSend(v3, "setShouldShowFormAccessory:", objc_msgSend(v5, "isAccessoryEnabled"));
    uint64_t v6 = (void *)[(SUWebView *)self->_webView scrollView];
    [v3 setScrollContentInsets:SUUIScrollViewGetDefaultContentInset(v6)];
    objc_msgSend(v3, "setShowsBackgroundShadow:", objc_msgSend(v6, "_showsBackgroundShadow"));
    objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", objc_msgSend(v6, "showsHorizontalScrollIndicator"));
    objc_msgSend(v3, "setShowsVerticalScrollIndicator:", objc_msgSend(v6, "showsVerticalScrollIndicator"));
  }
  return v3;
}

- (id)copyObjectForScriptFromPoolWithClass:(Class)a3
{
  id v4 = [(SUObjectPool *)self->_objectPool copyPoppedObjectForClass:a3];
  if ([(SUWebView *)self->_webView isLoading]
    && [v4 conformsToProtocol:&unk_26DC29798])
  {
    [v4 setDeferringInterfaceUpdates:1];
  }
  return v4;
}

- (id)displayedURL
{
  displayedURL = self->_displayedURL;
  if (displayedURL)
  {
    id v3 = displayedURL;
    return v3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUWebViewController;
    return [(UIViewController *)&v5 displayedURL];
  }
}

- (CGRect)documentBounds
{
  id v2 = (void *)[(SUWebView *)self->_webView _browserView];
  if (v2)
  {
    [v2 documentBounds];
  }
  else
  {
    double v3 = *MEMORY[0x263F001A0];
    double v4 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)invalidate
{
  if (![(SUViewController *)self isVisible]) {
    self->_hasEverAppeared = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v3 invalidate];
}

- (void)keyboardDidHideWithInfo:(id)a3
{
  -[SUWebView _updateScrollerViewForInputView:](self->_webView, "_updateScrollerViewForInputView:");
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  [(UIViewController *)&v5 keyboardDidHideWithInfo:a3];
}

- (void)keyboardWillShowWithInfo:(id)a3
{
  -[SUWebView _updateScrollerViewForInputView:](self->_webView, "_updateScrollerViewForInputView:");
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  [(UIViewController *)&v5 keyboardWillShowWithInfo:a3];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v3 setAutoresizingMask:18];
  [(SUWebViewController *)self setView:v3];
}

- (CGSize)minimumViewSize
{
  if (self->_webView)
  {
    objc_msgSend((id)-[SUWebView _browserView](self->_webView, "_browserView"), "documentBounds");
    double v3 = v2;
    double v5 = v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SUWebViewController;
    [(UIViewController *)&v6 minimumViewSize];
  }
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)navigationItemForScriptInterface
{
  delayedNavigationItem = self->_delayedNavigationItem;
  if (delayedNavigationItem)
  {
    uint64_t v4 = [(SUDelayedNavigationItem *)delayedNavigationItem wrappedNavigationItem];
    double v5 = [(SUViewController *)self navigationItem];
    id result = self->_delayedNavigationItem;
    if ((SUNavigationItem *)v4 == v5)
    {
      if (result) {
        return result;
      }
    }
    else
    {

      self->_delayedNavigationItem = 0;
    }
  }
  int v7 = [[SUDelayedNavigationItem alloc] initWithNavigationItem:[(SUViewController *)self navigationItem]];
  self->_delayedNavigationItem = v7;
  [(SUDelayedNavigationItem *)v7 setShouldDelayChanges:self->_objectPool != 0];
  return self->_delayedNavigationItem;
}

- (void)parentViewControllerHierarchyDidChange
{
  if ([(SUWebViewController *)self _placeholderBackgroundView]) {
    [(SUWebViewController *)self _reloadPlaceholderBackgroundView];
  }
  -[SUWebViewManager setScriptWindowContext:](self->_webViewManager, "setScriptWindowContext:", objc_msgSend((id)-[SUWebViewController parentViewController](self, "parentViewController"), "scriptWindowContext"));
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  [(UIViewController *)&v3 parentViewControllerHierarchyDidChange];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  for (i = (void *)[(SUWebViewController *)self parentViewController];
        i;
        i = (void *)[i parentViewController])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
  }
  if ([i bridgedNavigation])
  {
    v10 = (void *)[i parentViewController];
    [v10 presentViewController:a3 animated:v6 completion:0];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SUWebViewController;
    [(SUWebViewController *)&v11 presentViewController:a3 animated:v6 completion:a5];
  }
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  [(SUWebViewController *)self _prepareToLoadURL:a4];
  int v7 = [(SUWebViewController *)self webView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v31 = 138543362;
      uint64_t v32 = objc_opt_class();
      LODWORD(v30) = 12;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        id v12 = (void *)v11;
        objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v31, v30);
        free(v12);
        SSFileLog();
      }
    }
    [(SUWebView *)v7 loadData:a3 MIMEType:@"text/html" textEncodingName:CFStringConvertEncodingToIANACharSetName(0x8000100u) baseURL:a4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v14 = [v13 shouldLog];
      if ([v13 shouldLogToDisk]) {
        int v15 = v14 | 2;
      }
      else {
        int v15 = v14;
      }
      if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v15 &= 2u;
      }
      if (v15)
      {
        int v31 = 138543362;
        uint64_t v32 = objc_opt_class();
        LODWORD(v30) = 12;
        v29 = &v31;
        uint64_t v16 = _os_log_send_and_compose_impl();
        if (v16)
        {
          v17 = (void *)v16;
          uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v31, v30);
          free(v17);
          v29 = (int *)v18;
          SSFileLog();
        }
      }
      -[SUWebView loadHTMLString:baseURL:](v7, "loadHTMLString:baseURL:", a3, a4, v29);
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v20 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v21 = [v20 shouldLog];
      if ([v20 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v22 &= 2u;
      }
      if (isKindOfClass)
      {
        if (v22)
        {
          int v31 = 138543362;
          uint64_t v32 = objc_opt_class();
          LODWORD(v30) = 12;
          v29 = &v31;
          uint64_t v23 = _os_log_send_and_compose_impl();
          if (v23)
          {
            v24 = (void *)v23;
            uint64_t v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v31, v30);
            free(v24);
            v29 = (int *)v25;
            SSFileLog();
          }
        }
        -[SUWebView loadArchive:](v7, "loadArchive:", a3, v29);
      }
      else
      {
        if (v22)
        {
          int v31 = 138543362;
          uint64_t v32 = objc_opt_class();
          LODWORD(v30) = 12;
          v29 = &v31;
          uint64_t v26 = _os_log_send_and_compose_impl();
          if (v26)
          {
            v27 = (void *)v26;
            uint64_t v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v31, v30);
            free(v27);
            v29 = (int *)v28;
            SSFileLog();
          }
        }
        [(SUWebViewController *)self _reloadUI];
        [(SUWebViewController *)self setViewIsReady:1];
      }
    }
  }
}

- (void)_setExistingNavigationItem:(id)a3
{
  -[SUDelayedNavigationItem setWrappedNavigationItem:](self->_delayedNavigationItem, "setWrappedNavigationItem:");
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v5 _setExistingNavigationItem:a3];
}

- (void)setScriptProperties:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  -[SUViewController setScriptProperties:](&v5, sel_setScriptProperties_);
  [(SUWebViewController *)self _applyScriptProperties:a3];
}

- (void)setStorePageProtocol:(id)a3
{
  storePageProtocol = self->_storePageProtocol;
  if (storePageProtocol != a3)
  {

    self->_storePageProtocol = (SUStorePageProtocol *)a3;
    [(SUWebViewController *)self storePageProtocolDidChange];
  }
}

- (id)storePageProtocol
{
  id result = self->_storePageProtocol;
  if (!result)
  {
    id result = objc_alloc_init(SUStorePageProtocol);
    self->_storePageProtocol = (SUStorePageProtocol *)result;
  }
  return result;
}

- (void)setShouldSignRequests:(BOOL)a3
{
  self->_shouldSignRequests = a3;
  -[SUWebViewManager setShouldSignRequests:](self->_webViewManager, "setShouldSignRequests:");
}

- (void)storePageCleanupBeforeTearDown
{
  [(SUWebViewManager *)self->_webViewManager disconnectFromWebView];
  [(SUWebViewManager *)self->_webViewManager setDelegate:0];

  self->_webViewManager = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  [(UIViewController *)&v3 storePageCleanupBeforeTearDown];
}

- (void)storePageProtocolDidChange
{
  if ([(SUWebViewController *)self isViewLoaded]
    && ([(SUWebView *)self->_webView isLoading] & 1) == 0)
  {
    [(SUWebViewController *)self _reloadUI];
  }
  v3.receiver = self;
  v3.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v3 storePageProtocolDidChange];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_hasEverAppeared) {
    [(SUWebViewManager *)self->_webViewManager dispatchEvent:0 forName:@"didreappear"];
  }
  self->_hasEverAppeared = 1;
  id v5 = [(SUWebViewController *)self copyScriptProperties];
  [(SUWebViewController *)self _applyScriptProperties:v5];
  if (([(SUWebView *)self->_webView isLoading] & 1) == 0
    && [(SUWebView *)self->_webView request]
    && [v5 flashesScrollIndicators])
  {
    objc_msgSend((id)-[SUWebView _scrollView](self->_webView, "_scrollView"), "flashScrollIndicators");
  }

  v6.receiver = self;
  v6.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v6 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUWebViewManager *)self->_webViewManager dispatchEvent:0 forName:@"diddisappear"];
  objc_msgSend((id)-[SUWebView _scrollView](self->_webView, "_scrollView"), "setScrollsToTop:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_hasEverAppeared)
  {
    int64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarOrientation");
    if ([(SUWebViewController *)self viewIsReady] && self->_lastKnownOrientation != v5)
    {
      [(SUWebView *)self->_webView beginSynchronousLayout];
      [(SUWebViewController *)self _sendOrientationWillChangeToInterfaceOrientation:v5];
      [(SUWebView *)self->_webView endSynchronousLayout];
      objc_msgSend((id)-[SUWebView _browserView](self->_webView, "_browserView"), "sendOrientationEventForOrientation:", v5);
    }
    self->_lastKnownOrientation = v5;
    [(SUWebViewManager *)self->_webViewManager dispatchEvent:0 forName:@"willreappear"];
  }
  v6.receiver = self;
  v6.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v6 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUWebViewManager *)self->_webViewManager dispatchEvent:0 forName:@"willdisappear"];
  self->_lastKnownOrientation = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarOrientation");
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewController;
  [(SUViewController *)&v5 viewWillDisappear:v3];
}

- (id)newRotationController
{
  BOOL v3 = [SUWebViewRotationController alloc];

  return [(SURotationController *)v3 initWithViewController:self];
}

- (void)webViewManager:(id)a3 didReceiveTitle:(id)a4
{
}

- (void)webViewManager:(id)a3 didFailLoadWithError:(id)a4
{
  if (objc_msgSend(a4, "code", a3) != -999)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUWebViewControllerDidFailLoad", self);
    [(SUWebViewController *)self _finishLoadWithResult:0 error:a4];
  }
}

- (void)webViewManager:(id)a3 didReceivePrimaryResponse:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!self->_mescalSession) {
    goto LABEL_20;
  }
  objc_msgSend(a4, "allHeaderFields", a3);
  objc_super v6 = (void *)ISDictionaryValueForCaseInsensitiveString();
  if (![v6 length]) {
    goto LABEL_20;
  }
  int v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v6 options:0];
  uint64_t v25 = 0;
  BOOL v8 = [(SUMescalSession *)self->_mescalSession verifyPrimeSignature:v7 error:&v25];
  int v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  id v12 = [v9 OSLogObject];
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [a4 URL];
      int v26 = 138412546;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      LODWORD(v24) = 22;
      uint64_t v23 = &v26;
      goto LABEL_17;
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      int v16 = v11;
    }
    else {
      int v16 = v11 & 2;
    }
    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      int v26 = 138412546;
      uint64_t v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v25;
      LODWORD(v24) = 22;
      uint64_t v23 = &v26;
LABEL_17:
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();
      if (v18)
      {
        uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v26, v24);
        free(v18);
        uint64_t v23 = (int *)v19;
        SSFileLog();
      }
    }
  }

LABEL_20:
  uint64_t v20 = objc_msgSend(a4, "URL", a3, v23);
  displayedURL = self->_displayedURL;
  if (displayedURL != (NSURL *)v20)
  {
    int v22 = (void *)v20;

    self->_displayedURL = (NSURL *)[v22 copy];
  }
}

- (void)webViewManager:(id)a3 didRejectInvalidRequest:(id)a4
{
  if (self->_loadBlock)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SUErrorDomain" code:1 userInfo:0];
    -[SUWebViewController _finishLoadWithResult:error:](self, "_finishLoadWithResult:error:", 0);
  }
  else
  {
    id v5 = (id)[objc_alloc(MEMORY[0x263F7B368]) initWithURLRequest:a4];
    -[UIViewController reloadWithURLRequestProperties:](self, "reloadWithURLRequestProperties:");
  }
}

- (void)webViewManager:(id)a3 willInjectScriptInterface:(id)a4
{
  uint64_t v5 = objc_msgSend((id)-[SUWebViewController parentViewController](self, "parentViewController", a3), "scriptWindowContext");

  [a4 setScriptWindowContext:v5];
}

- (void)webViewManagerDidFinishLoad:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[(SUWebView *)self->_webView _browserView];
  WebThreadLock();
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "webView"), "mainFrame"), "dataSource"), "response");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)([v5 statusCode] - 400) <= 0x257) {
    [(UIViewController *)self handleStoreFailureWithError:SSError()];
  }
  [(SUDelayedNavigationItem *)self->_delayedNavigationItem commitDelayedChanges];
  [(SUDelayedNavigationItem *)self->_delayedNavigationItem setShouldDelayChanges:0];
  objc_super v6 = [(SUObjectPool *)self->_objectPool vendedObjects];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v41 count:16];
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
        int v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&unk_26DC29798]) {
          [v11 setDeferringInterfaceUpdates:0];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v8);
  }

  self->_objectPool = 0;
  [(SUWebViewController *)self _reloadUI];
  [(SUWebViewController *)self _removePlaceholderBackgroundView];
  id v12 = self;
  [(SUWebViewController *)self setViewIsReady:1];
  [(SUWebViewController *)self _applySavedScrollOffsetIfPossible];
  id v13 = [(SUWebViewController *)self copyScriptProperties];
  if ([v13 flashesScrollIndicators]) {
    objc_msgSend((id)-[SUWebView _scrollView](self->_webView, "_scrollView"), "flashScrollIndicators");
  }

  uint64_t v28 = 0;
  if ([(SUWebView *)self->_webView getStatusBarStyle:&v28])
  {
    if (v28)
    {
      uint64_t v14 = (void *)[MEMORY[0x263F1C408] sharedApplication];
      [v14 setStatusBarStyle:v28];
    }
    else
    {
      SUSetStatusBarStyleWithBarStyle([(SUViewController *)self ITunesStoreUIBarStyle], 0);
    }
  }
  if (self->_performanceMetrics)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    -[ISURLRequestPerformance setRenderFinishTime:](self->_performanceMetrics, "setRenderFinishTime:");
    int v16 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      uint64_t v19 = objc_opt_class();
      [(ISURLRequestPerformance *)self->_performanceMetrics renderEndInterval];
      uint64_t v21 = v20;
      uint64_t v22 = objc_msgSend((id)-[ISURLRequestPerformance URLResponse](self->_performanceMetrics, "URLResponse"), "URL");
      int v33 = 138413058;
      uint64_t v34 = v19;
      __int16 v35 = 2048;
      CFAbsoluteTime v36 = Current;
      __int16 v37 = 2048;
      uint64_t v38 = v21;
      __int16 v39 = 2112;
      uint64_t v40 = v22;
      LODWORD(v27) = 42;
      int v26 = &v33;
      uint64_t v23 = _os_log_send_and_compose_impl();
      if (v23)
      {
        uint64_t v24 = (void *)v23;
        uint64_t v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v33, v27);
        free(v24);
        int v26 = (int *)v25;
        SSFileLog();
      }
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v26), "postNotificationName:object:", @"SUWebViewControllerDidFinishLoad", self);
  [(SUWebViewController *)self _finishLoadWithResult:1 error:0];
}

- (void)webViewManagerDidStartLoad:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(SUDelayedNavigationItem *)self->_delayedNavigationItem setShouldDelayChanges:1];
  if (self->_performanceMetrics)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_msgSend((id)-[ISURLRequestPerformance URLResponse](self->_performanceMetrics, "URLResponse"), "URL");
      int v15 = 138412802;
      uint64_t v16 = v8;
      __int16 v17 = 2048;
      double v18 = Current;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      LODWORD(v14) = 32;
      id v13 = &v15;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        int v11 = (void *)v10;
        uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v15, v14);
        free(v11);
        id v13 = (int *)v12;
        SSFileLog();
      }
    }
    -[ISURLRequestPerformance setRenderBeginTime:](self->_performanceMetrics, "setRenderBeginTime:", Current, v13);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUWebViewControllerDidStartLoad", self);
}

- (void)webViewManager:(id)a3 webDocumentViewDidSetFrame:(CGRect)a4
{
  [(SUWebViewController *)self _applySavedScrollOffsetIfPossible];
  uint64_t v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v5 postNotificationName:@"SUViewControllerDocumentBoundsDidChangeNotification" object:self];
}

- (void)_loadWithURLOperation:(id)a3 completionBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id loadBlock = self->_loadBlock;
  if (loadBlock != a4)
  {

    self->_id loadBlock = (id)[a4 copy];
  }
  uint64_t v8 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
  uint64_t v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v18 = 138543362;
    uint64_t v19 = objc_opt_class();
    LODWORD(v16) = 12;
    int v15 = &v18;
    uint64_t v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      id v13 = (void *)v12;
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v18, v16);
      free(v13);
      int v15 = (int *)v14;
      SSFileLog();
    }
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__SUWebViewController__loadWithURLOperation_completionBlock___block_invoke;
  v17[3] = &unk_2648129D8;
  v17[4] = self;
  v17[5] = v8;
  -[SUWebViewController _getURLRequestForOperation:block:](self, "_getURLRequestForOperation:block:", a3, v17, v15);
}

uint64_t __61__SUWebViewController__loadWithURLOperation_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v13 = 138543618;
    uint64_t v14 = objc_opt_class();
    __int16 v15 = 2112;
    uint64_t v16 = a2;
    LODWORD(v12) = 22;
    int v11 = &v13;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v13, v12);
      free(v8);
      int v11 = (int *)v9;
      SSFileLog();
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "object", v11), "_loadURLRequest:", a2);
}

- (void)_requestWebScriptReloadWithContext:(id)a3
{
}

- (void)_setPerformanceMetrics:(id)a3
{
  performanceMetrics = self->_performanceMetrics;
  if (performanceMetrics != a3)
  {

    self->_performanceMetrics = (ISURLRequestPerformance *)a3;
    webViewManager = self->_webViewManager;
    [(SUWebViewManager *)webViewManager setInitialRequestPerformance:a3];
  }
}

- (void)_addPlaceholderBackgroundView
{
  BOOL v3 = (void *)[[(SUWebViewController *)self webView] _browserView];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
  [v3 setOpaque:0];
  [v3 setNeedsDisplay];
  if (![(SUWebViewController *)self _placeholderBackgroundView])
  {
    [(SUWebViewController *)self _reloadPlaceholderBackgroundView];
  }
}

- (void)_applySavedScrollOffsetIfPossible
{
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  id v5 = [(SUViewControllerContext *)[(SUViewController *)self _restoredContext] valueForMetadataKey:@"offset"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 CGPointValue];
  }
  else
  {
    objc_opt_class();
    double v8 = v4;
    double v9 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    CGPoint v10 = CGPointFromString((NSString *)v5);
    CGFloat y = v10.y;
    CGFloat x = v10.x;
  }
  double v9 = x;
  double v8 = y;
LABEL_6:
  if (v9 != v3 || v8 != v4)
  {
    uint64_t v12 = (void *)[(SUWebView *)self->_webView scrollView];
    if (v12)
    {
      int v13 = v12;
      [v12 contentOffset];
      if (v14 < 0.00000011920929)
      {
        [v13 contentSize];
        if (v8 > 0.0)
        {
          double v16 = v15;
          [v13 frame];
          if (v8 <= v16 - v17)
          {
            objc_msgSend(v13, "setContentOffset:", v9, v8);
            [(SUViewController *)self resetRestoredContext];
          }
        }
      }
    }
  }
}

- (void)_applyScriptProperties:(id)a3
{
  if (a3)
  {
    webView = self->_webView;
    if (webView)
    {
      int v6 = (void *)[(SUWebView *)webView _scrollView];
      objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", objc_msgSend(a3, "showsHorizontalScrollIndicator"));
      objc_msgSend(v6, "setShowsVerticalScrollIndicator:", objc_msgSend(a3, "showsVerticalScrollIndicator"));
      [a3 scrollContentInsets];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      if (_UIApplicationUsesLegacyUI()) {
        SUUIScrollViewSetDefaultContentInset(v6, v8, v10, v12, v14);
      }
      -[SUWebView _setAlwaysDispatchesScrollEvents:](self->_webView, "_setAlwaysDispatchesScrollEvents:", [a3 alwaysDispatchesScrollEvents]);
      uint64_t v15 = [a3 showsBackgroundShadow];
      double v16 = (void *)[a3 topExtensionColor];
      if (v16)
      {
        double v17 = v16;
        if (!SUGradientColorIsPatternColor(v16, 0))
        {
          [v6 setTopExtensionViewColor:0];
          [(SUWebView *)self->_webView setShowsTopBackgroundShadow:v15];
          [(SUWebView *)self->_webView setTopBackgroundColor:v17];
          uint64_t v15 = 0;
          goto LABEL_11;
        }
        int v18 = v6;
        uint64_t v19 = v17;
      }
      else
      {
        int v18 = v6;
        uint64_t v19 = 0;
      }
      [v18 setTopExtensionViewColor:v19];
      [(SUWebView *)self->_webView setTopBackgroundColor:0];
LABEL_11:
      [v6 _setShowsBackgroundShadow:v15];
      uint64_t v20 = (void *)[(SUWebView *)self->_webView _browserView];
      objc_msgSend(v20, "setAccessoryEnabled:", objc_msgSend(a3, "shouldShowFormAccessory"));
      objc_msgSend(v20, "setDoubleTapEnabled:", objc_msgSend(a3, "isDoubleTapEnabled"));
      objc_msgSend(v20, "setInputViewObeysDOMFocus:", objc_msgSend(a3, "inputViewObeysDOMFocus"));
      -[SUWebView setScrollingEnabled:](self->_webView, "setScrollingEnabled:", [a3 isScrollingDisabled] ^ 1);
    }
  }

  [(SUWebViewController *)self _reloadBackgroundViewPropertiesWithScriptProperties:a3];
}

- (id)_defaultBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] systemBackgroundColor];
}

- (void)_finishLoadWithResult:(BOOL)a3 error:(id)a4
{
  id loadBlock = self->_loadBlock;
  if (loadBlock)
  {
    BOOL v6 = a3;
    double v9 = (void (**)(id, BOOL, id))loadBlock;
    double v8 = self;

    self->_id loadBlock = 0;
    v9[2](v9, v6, a4);
  }
}

- (void)_getURLRequestForOperation:(id)a3 block:(id)a4
{
  double v7 = (void *)[a3 requestProperties];
  uint64_t v8 = objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", objc_msgSend(v7, "URLBagType"));
  double v9 = (void *)[objc_alloc(MEMORY[0x263F894B0]) initWithBagContext:v8];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__SUWebViewController__getURLRequestForOperation_block___block_invoke;
  v10[3] = &unk_264812A28;
  v10[4] = v9;
  v10[5] = self;
  v10[6] = v7;
  v10[7] = a3;
  v10[8] = v8;
  v10[9] = a4;
  [v9 setCompletionBlock:v10];
  [(SUViewController *)self enqueueOperation:v9 cancelOnDealloc:0];
}

uint64_t __56__SUWebViewController__getURLRequestForOperation_block___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) success] & 1) == 0)
  {
    id v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v7 &= 2u;
    }
    if (!v7) {
      goto LABEL_40;
    }
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [*(id *)(a1 + 32) error];
    int v50 = 138543618;
    uint64_t v51 = v8;
    __int16 v52 = 2112;
    uint64_t v53 = v9;
    LODWORD(v47) = 22;
    goto LABEL_13;
  }
  double v2 = (void *)[*(id *)(a1 + 48) URL];
  double v3 = *(void **)(a1 + 48);
  if (v2)
  {
    if ([v3 URLBagType] == 3
      && (objc_msgSend((id)objc_msgSend(v2, "host"), "isEqualToString:", @"localhost") & 1) != 0)
    {
      int v4 = 1;
    }
    else if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "URLBag"), "urlIsTrusted:", v2))
    {
      int v4 = objc_msgSend((id)objc_msgSend(v2, "scheme"), "hasPrefix:", @"https");
    }
    else
    {
      int v4 = 0;
    }
    uint64_t v14 = [MEMORY[0x263F28030] createBagForSubProfile];
    uint64_t v49 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F28030], "verifyTrustedURL:bag:", v2, v14), "resultWithError:", &v49))
    {
      if (v4)
      {
LABEL_52:
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 56), "newRequestWithURL:", v2, v46);
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v15 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v16 = [v15 shouldLog];
      if ([v15 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v17 &= 2u;
      }
      if (v17)
      {
        uint64_t v18 = objc_opt_class();
        int v50 = 138543362;
        uint64_t v51 = v18;
        LODWORD(v47) = 12;
        v46 = &v50;
        uint64_t v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          uint64_t v20 = (void *)v19;
          uint64_t v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v50, v47);
          free(v20);
          v46 = (int *)v21;
          SSFileLog();
        }
      }
    }
    uint64_t v22 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", v46);
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v24 &= 2u;
    }
    if (!v24) {
      goto LABEL_40;
    }
    uint64_t v25 = objc_opt_class();
    int v50 = 138543618;
    uint64_t v51 = v25;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v2;
    LODWORD(v47) = 22;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      int v26 = (void *)v10;
      objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v50, v47);
      free(v26);
      goto LABEL_39;
    }
    goto LABEL_53;
  }
  uint64_t v12 = [v3 URLBagURLBlock];
  if (v12)
  {
    uint64_t v13 = (*(uint64_t (**)(uint64_t, void))(v12 + 16))(v12, *(void *)(a1 + 64));
    goto LABEL_43;
  }
  uint64_t v27 = [*(id *)(a1 + 48) URLBagKey];
  if (v27)
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "URLBag"), "urlForKey:", v27);
LABEL_43:
    double v2 = (void *)v13;
    if (v13)
    {
      uint64_t v28 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v29 = [v28 shouldLog];
      if ([v28 shouldLogToDisk]) {
        int v30 = v29 | 2;
      }
      else {
        int v30 = v29;
      }
      if (!os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v30 &= 2u;
      }
      if (v30)
      {
        int v50 = 138543618;
        uint64_t v51 = objc_opt_class();
        __int16 v52 = 2112;
        uint64_t v53 = (uint64_t)v2;
        LODWORD(v47) = 22;
        v46 = &v50;
        uint64_t v31 = _os_log_send_and_compose_impl();
        if (v31)
        {
          long long v32 = (void *)v31;
          uint64_t v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v50, v47);
          free(v32);
          v46 = (int *)v33;
          SSFileLog();
        }
      }
      goto LABEL_52;
    }
    goto LABEL_62;
  }
  CFAbsoluteTime v36 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v37 = [v36 shouldLog];
  if ([v36 shouldLogToDisk]) {
    int v38 = v37 | 2;
  }
  else {
    int v38 = v37;
  }
  if (!os_log_type_enabled((os_log_t)[v36 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v38 &= 2u;
  }
  if (v38)
  {
    int v50 = 138543618;
    uint64_t v51 = objc_opt_class();
    __int16 v52 = 2114;
    uint64_t v53 = 0;
    LODWORD(v47) = 22;
    v46 = &v50;
    uint64_t v39 = _os_log_send_and_compose_impl();
    if (v39)
    {
      uint64_t v40 = (void *)v39;
      uint64_t v41 = objc_msgSend(NSString, "stringWithCString:encoding:", v39, 4, &v50, v47);
      free(v40);
      v46 = (int *)v41;
      SSFileLog();
    }
  }
LABEL_62:
  uint64_t v42 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", v46);
  int v43 = [v42 shouldLog];
  if ([v42 shouldLogToDisk]) {
    int v44 = v43 | 2;
  }
  else {
    int v44 = v43;
  }
  if (!os_log_type_enabled((os_log_t)[v42 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v44 &= 2u;
  }
  if (!v44) {
    goto LABEL_40;
  }
  uint64_t v45 = objc_opt_class();
  int v50 = 138543362;
  uint64_t v51 = v45;
  LODWORD(v47) = 12;
LABEL_13:
  uint64_t v10 = _os_log_send_and_compose_impl();
  if (v10)
  {
    double v11 = (void *)v10;
    objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v50, v47);
    free(v11);
LABEL_39:
    SSFileLog();
LABEL_40:
    uint64_t v10 = 0;
  }
LABEL_53:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUWebViewController__getURLRequestForOperation_block___block_invoke_156;
  block[3] = &unk_264812A00;
  uint64_t v34 = *(void *)(a1 + 72);
  block[4] = v10;
  block[5] = v34;
  dispatch_async(MEMORY[0x263EF83A0], block);
  return [*(id *)(a1 + 32) setCompletionBlock:0];
}

void __56__SUWebViewController__getURLRequestForOperation_block___block_invoke_156(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  double v2 = *(void **)(a1 + 32);
}

- (void)_loadURLRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v14 = 138543874;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2048;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      __int16 v18 = 2112;
      uint64_t v19 = [a3 URL];
      LODWORD(v13) = 32;
      uint64_t v12 = &v14;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v14, v13);
        free(v9);
        uint64_t v12 = (int *)v10;
        SSFileLog();
      }
    }
    -[SUWebViewController _prepareToLoadURL:](self, "_prepareToLoadURL:", objc_msgSend(a3, "URL", v12));
    [[(SUWebViewController *)self webView] loadRequest:a3];
  }
  else
  {
    uint64_t v11 = SSError();
    [(SUWebViewController *)self _finishLoadWithResult:0 error:v11];
  }
}

- (id)_placeholderBackgroundView
{
  double v2 = (void *)[(SUWebView *)self->_webView _scrollView];

  return (id)[v2 viewWithTag:1886151271];
}

- (void)_prepareToLoadURL:(id)a3
{
  id v5 = [(SUWebViewController *)self webView];
  objc_msgSend((id)-[SUWebView _browserView](v5, "_browserView"), "sendOrientationEventForOrientation:", -[SUViewController interfaceOrientation](self, "interfaceOrientation"));
  int v6 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  objc_msgSend((id)-[SUWebViewController view](self, "view"), "bounds");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [(SUWebViewController *)self copyScriptProperties];
  if (![v15 shouldLoadProgressively]
    || [v6 launchedToTest] && (objc_msgSend(v6, "shouldRecordExtendedLaunchTime") & 1) != 0)
  {
    [(SUWebViewController *)self _removePlaceholderBackgroundView];
    [(SUWebView *)v5 removeFromSuperview];
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    double v14 = 1.0;
  }
  else
  {
    [(SUWebViewController *)self _addPlaceholderBackgroundView];
    objc_msgSend((id)-[SUWebViewController view](self, "view"), "addSubview:", v5);
    uint64_t v17 = 1;
    uint64_t v16 = 18;
  }
  [(SUWebView *)v5 setAutoresizingMask:v16];
  [(SUWebViewController *)self setViewIsReady:v17];
  -[SUWebView setFrame:](v5, "setFrame:", v8, v10, v12, v14);

  self->_url = (NSURL *)a3;
  self->_displayedURL = self->_url;

  [(SUWebViewController *)self _reloadObjectPool];
}

- (void)_reloadBackgroundViewPropertiesWithScriptProperties:(id)a3
{
  if ([(SUWebViewController *)self isViewLoaded])
  {
    uint64_t v5 = [a3 usesBlurredBackground]
       ? [MEMORY[0x263F1C550] clearColor]
       : [a3 backgroundColor];
    int v6 = (void *)v5;
    if (v5)
    {
      double v7 = (void *)[(SUWebViewController *)self view];
      [v7 setBackgroundColor:v6];
      [v6 alphaComponent];
      [v7 setOpaque:v8 == 1.0];
      [(SUWebView *)self->_webView setBackgroundColor:v6];
      webView = self->_webView;
      [v6 alphaComponent];
      [(SUWebView *)webView setOpaque:v10 == 1.0];
    }
  }
}

- (void)_reloadObjectPool
{
  if ([(SUViewController *)self navigationController])
  {

    double v3 = objc_alloc_init(SUObjectPool);
    self->_objectPool = v3;
    uint64_t v4 = objc_opt_class();
    [(SUObjectPool *)v3 addObjectsOfClass:v4 count:2 forClass:objc_opt_class()];
    objectPool = self->_objectPool;
    uint64_t v6 = objc_opt_class();
    [(SUObjectPool *)objectPool addObjectsOfClass:v6 count:1 forClass:objc_opt_class()];
    double v7 = self->_objectPool;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    [(SUObjectPool *)v7 addObjectsOfClass:v8 count:1 forClass:v9];
  }
}

- (void)_reloadPlaceholderBackgroundView
{
  objc_msgSend(-[SUWebViewController _placeholderBackgroundView](self, "_placeholderBackgroundView"), "removeFromSuperview");
  id v8 = (id)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
  objc_msgSend(v8, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  [(SUWebViewController *)self addChildViewController:v8];
  id v3 = [(SUWebViewController *)self copyScriptProperties];
  if ([v3 placeholderBackgroundGradient])
  {
    uint64_t v4 = [v3 placeholderBackgroundGradient];
  }
  else
  {
    uint64_t v4 = objc_msgSend(-[UIViewController section](self, "section"), "backgroundGradient");
    uint64_t v5 = v8;
    if (!v4) {
      goto LABEL_5;
    }
  }
  [v8 setBackgroundGradient:v4];
  uint64_t v5 = v8;
LABEL_5:
  [v5 setScriptProperties:v3];

  uint64_t v6 = (void *)[[(SUWebViewController *)self webView] _scrollView];
  id v7 = (id)[v8 view];
  [v8 setView:0];
  [v6 bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setTag:1886151271];
  [v6 insertSubview:v7 atIndex:0];

  [(SUWebViewController *)self removeChildViewController:v8];
}

- (void)_reloadUI
{
  id v3 = (void *)[(SUWebViewController *)self view];
  uint64_t v4 = [(SUWebViewController *)self webView];
  [(SUWebView *)v4 setAutoresizingMask:18];
  [v3 bounds];
  -[SUWebView setFrame:](v4, "setFrame:");
  [v3 addSubview:v4];
  uint64_t v5 = [(SUWebView *)v4 title];
  if ([(NSString *)v5 length]) {
    [(SUViewController *)self setTitle:v5 changeTabBarItem:0];
  }
  id v6 = [(SUWebViewController *)self copyScriptProperties];
  [(SUWebViewController *)self _applyScriptProperties:v6];
}

- (void)_removePlaceholderBackgroundView
{
  uint64_t v3 = objc_msgSend((id)-[SUWebView _scrollView](self->_webView, "_scrollView"), "viewWithTag:", 1886151271);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[(SUWebView *)self->_webView _browserView];
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "systemBackgroundColor"));
    objc_msgSend(v5, "setOpaque:", -[SUWebView isOpaque](self->_webView, "isOpaque"));
    [v5 setNeedsDisplay];
    [v4 removeFromSuperview];
  }
}

- (void)_sendOrientationWillChangeToInterfaceOrientation:(int64_t)a3
{
  uint64_t v4 = 90;
  uint64_t v5 = -90;
  uint64_t v6 = 180;
  if (a3 != 2) {
    uint64_t v6 = 0;
  }
  if (a3 != 4) {
    uint64_t v5 = v6;
  }
  if (a3 != 3) {
    uint64_t v4 = v5;
  }
  if (a3 == 1) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v4;
  }
  uint64_t v8 = [NSNumber numberWithInteger:v7];
  id v10 = (id)objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v8, @"orientation", 0);
  uint64_t v9 = [[SUScriptDictionary alloc] initWithDictionary:v10];
  [(SUWebViewManager *)self->_webViewManager dispatchEvent:v9 forName:@"orientationwillchange" synchronously:1];
}

- (void)_setLastKnownOrientation:(int64_t)a3
{
  self->_lastKnownOrientation = a3;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (SUMescalSession)_mescalSession
{
  return self->_mescalSession;
}

- (void)_setMescalSession:(id)a3
{
}

- (ISURLRequestPerformance)_performanceMetrics
{
  return self->_performanceMetrics;
}

- (BOOL)shouldSignRequests
{
  return self->_shouldSignRequests;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)viewIsReady
{
  return self->_viewIsReady;
}

- (void)setViewIsReady:(BOOL)a3
{
  self->_viewIsReadCGFloat y = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
}

@end