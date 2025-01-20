@interface SUWebViewManager
+ (id)defaultLocalStoragePath;
- (ACAccount)account;
- (BOOL)_presentModalAlertWithMessage:(id)a3 includingCancelButton:(BOOL)a4 configurationHandler:(id)a5;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldSignRequests;
- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5;
- (ISURLRequestPerformance)initialRequestPerformance;
- (NSDictionary)tidHeaders;
- (SSAuthenticationContext)authenticationContext;
- (SUScriptWindowContext)scriptWindowContext;
- (SUWebViewManager)init;
- (SUWebViewManager)initWithClientInterface:(id)a3;
- (SUWebViewManagerDelegate)delegate;
- (UIWebView)webView;
- (id)DOMElementForScriptInterface:(id)a3 element:(id)a4;
- (id)_delegate;
- (id)_locateStorePageViewController;
- (id)_userIdentifier;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)originalFrameLoadDelegate;
- (id)originalPolicyDelegate;
- (id)originalResourceLoadDelegate;
- (id)originalUIDelegate;
- (id)parentViewControllerForScriptInterface:(id)a3;
- (id)performanceMetricsForScriptInterface:(id)a3;
- (id)uiWebView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5;
- (id)uiWebView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5;
- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7;
- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6;
- (void)_beginUsingNetwork;
- (void)_cancelUsingNetwork;
- (void)_endUsingNetwork;
- (void)_enumerateScriptInterfacesWithBlock:(id)a3;
- (void)_requestWebScriptReloadWithContext:(id)a3;
- (void)connectToWebView:(id)a3;
- (void)dealloc;
- (void)disconnectFromWebView;
- (void)dispatchEvent:(id)a3 forName:(id)a4;
- (void)dispatchEvent:(id)a3 forName:(id)a4 synchronously:(BOOL)a5;
- (void)forwardInvocation:(id)a3;
- (void)scriptInterface:(id)a3 requireCellularForResourceWithURL:(id)a4;
- (void)setAccount:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialRequestPerformance:(id)a3;
- (void)setOriginalFrameLoadDelegate:(id)a3;
- (void)setOriginalPolicyDelegate:(id)a3;
- (void)setOriginalResourceLoadDelegate:(id)a3;
- (void)setOriginalUIDelegate:(id)a3;
- (void)setScriptWindowContext:(id)a3;
- (void)setShouldSignRequests:(BOOL)a3;
- (void)setTidHeaders:(id)a3;
- (void)uiWebView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)uiWebView:(id)a3 resource:(id)a4 didFailLoadingWithError:(id)a5 fromDataSource:(id)a6;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4;
- (void)webView:(id)a3 didFirstLayoutInFrame:(id)a4;
- (void)webView:(id)a3 didParseSource:(id)a4 fromURL:(id)a5 sourceId:(int64_t)a6 forWebFrame:(id)a7;
- (void)webView:(id)a3 didReceiveTitle:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4;
- (void)webView:(id)a3 documentViewDidSetFrame:(CGRect)a4;
- (void)webView:(id)a3 exceptionWasRaised:(id)a4 sourceId:(int64_t)a5 line:(int)a6 forWebFrame:(id)a7;
- (void)webView:(id)a3 failedToParseSource:(id)a4 baseLineNumber:(unint64_t)a5 fromURL:(id)a6 withError:(id)a7 forWebFrame:(id)a8;
- (void)webView:(id)a3 resource:(id)a4 didReceiveResponse:(id)a5 fromDataSource:(id)a6;
- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5;
- (void)webViewDidFinishLoad:(id)a3;
- (void)webViewDidStartLoad:(id)a3;
@end

@implementation SUWebViewManager

- (SUWebViewManager)init
{
  return [(SUWebViewManager *)self initWithClientInterface:0];
}

- (SUWebViewManager)initWithClientInterface:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUWebViewManager;
  v4 = [(SUWebViewManager *)&v9 init];
  if (v4)
  {
    v4->_clientInterface = (SUClientInterface *)a3;
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    v4->_webFramesPendingInitialRequest = CFSetCreateMutable(0, 0, 0);
    v5 = (void *)[MEMORY[0x263F89540] sharedCache];
    v6 = objc_msgSend((id)objc_msgSend(v5, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0)), "valueForKey:", @"p2-client-options");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 objectForKey:@"suppress-cookie-hosts"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v4->_suppressCookiesHosts = (NSSet *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v7];
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  [(SUWebViewManager *)self _cancelUsingNetwork];
  scriptInterfaces = self->_scriptInterfaces;
  if (scriptInterfaces)
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, scriptInterfaces);
    value = 0;
    key = 0;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
    {
      [value setDelegate:0];
      [value tearDownUserInterface];
    }
    NSEndMapTableEnumeration(&enumerator);
    NSFreeMapTable(self->_scriptInterfaces);
  }
  webFramesPendingInitialRequest = self->_webFramesPendingInitialRequest;
  if (webFramesPendingInitialRequest) {
    CFRelease(webFramesPendingInitialRequest);
  }

  v5.receiver = self;
  v5.super_class = (Class)SUWebViewManager;
  [(SUWebViewManager *)&v5 dealloc];
}

+ (id)defaultLocalStoragePath
{
  if (!defaultLocalStoragePath_sLocalStoragePath)
  {
    v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    if ([(NSArray *)v3 count])
    {
      v4 = objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "stringByAppendingPathComponent:", @"com.apple.iTunesStore"), "stringByAppendingPathComponent:", @"LocalStorage");
      if ([MEMORY[0x263F08850] ensureDirectoryExists:v4]) {
        defaultLocalStoragePath_sLocalStoragePath = v4;
      }
    }
  }
  return (id)defaultLocalStoragePath_sLocalStoragePath;
}

- (void)connectToWebView:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_webView != a3)
  {
    [(SUWebViewManager *)self disconnectFromWebView];
    self->_webView = (UIWebView *)a3;
    [a3 setDelegate:self];
    if (self->_webView)
    {
      BOOL v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1;
      v6 = (void *)[(UIWebView *)self->_webView _scrollView];
      [v6 setDecelerationRate:0.998];
      [v6 _setShowsBackgroundShadow:v5];
      uint64_t v7 = (void *)[(UIWebView *)self->_webView _browserView];
      objc_msgSend(v7, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, *MEMORY[0x263F1D7D8], *MEMORY[0x263F1D7D0]);
      [v7 setAllowsDataDetectorsSheet:0];
      [v7 setAllowsImageSheet:0];
      [v7 setAllowsLinkSheet:0];
      [v7 setAllowsUserScaling:0 forDocumentTypes:0xFFFFFFLL];
      [v7 setDoubleTapEnabled:0];
      [v7 setInputViewObeysDOMFocus:0];
      v8 = (void *)[v7 webView];
      objc_super v9 = [(SUClientInterface *)self->_clientInterface userAgent];
      if (!v9) {
        objc_super v9 = (NSString *)[MEMORY[0x263F89550] copyUserAgent];
      }
      [v8 setCustomUserAgent:v9];

      v10 = (void *)[objc_alloc(MEMORY[0x263F1FA80]) initWithIdentifier:@"iTunesStorePreferences"];
      [v10 setCacheModel:2];
      [v10 setJavaScriptEnabled:1];
      [v10 setOfflineWebApplicationCacheEnabled:1];
      v11 = [(SUClientInterface *)self->_clientInterface localStoragePath];
      if (v11) {
        [v10 _setLocalStorageDatabasePath:v11];
      }
      if (CFPreferencesGetAppBooleanValue(@"DebugJavaScript", (CFStringRef)*MEMORY[0x263F895A0], 0))
      {
        v12 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        int v13 = [v12 shouldLog];
        if ([v12 shouldLogToDisk]) {
          int v14 = v13 | 2;
        }
        else {
          int v14 = v13;
        }
        if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEBUG)) {
          v14 &= 2u;
        }
        if (v14)
        {
          int v20 = 138412290;
          uint64_t v21 = objc_opt_class();
          LODWORD(v19) = 12;
          v18 = &v20;
          uint64_t v15 = _os_log_send_and_compose_impl();
          if (v15)
          {
            v16 = (void *)v15;
            uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v20, v19);
            free(v16);
            v18 = (int *)v17;
            SSFileLog();
          }
        }
        objc_msgSend(v8, "setScriptDebugDelegate:", self, v18);
      }
      [v8 setPreferences:v10];

      [(UIWebView *)self->_webView setDataDetectorTypes:0];
      [(UIWebView *)self->_webView setScalesPageToFit:0];
      [(UIWebView *)self->_webView _setWebSelectionEnabled:0];
      [(UIWebView *)self->_webView _setDrawInWebThread:1];
      [(UIWebView *)self->_webView _setDrawsCheckeredPattern:0];
      [(UIWebView *)self->_webView setMediaPlaybackRequiresUserAction:0];
      if ((SUWebViewManager *)[v8 frameLoadDelegate] != self) {
        -[SUWebViewManager setOriginalFrameLoadDelegate:](self, "setOriginalFrameLoadDelegate:", [v8 frameLoadDelegate]);
      }
      if ((SUWebViewManager *)[v8 policyDelegate] != self) {
        -[SUWebViewManager setOriginalPolicyDelegate:](self, "setOriginalPolicyDelegate:", [v8 policyDelegate]);
      }
      if ((SUWebViewManager *)[v8 resourceLoadDelegate] != self) {
        -[SUWebViewManager setOriginalResourceLoadDelegate:](self, "setOriginalResourceLoadDelegate:", [v8 resourceLoadDelegate]);
      }
      if ((SUWebViewManager *)[v8 UIDelegate] != self) {
        -[SUWebViewManager setOriginalUIDelegate:](self, "setOriginalUIDelegate:", [v8 UIDelegate]);
      }
      [v8 setFrameLoadDelegate:self];
      [v8 setPolicyDelegate:self];
      [v8 setResourceLoadDelegate:self];
      [v8 setUIDelegate:self];
    }
  }
}

- (void)disconnectFromWebView
{
  WebThreadLock();
  v3 = objc_msgSend((id)-[UIWebView _browserView](self->_webView, "_browserView"), "webView");
  if ((SUWebViewManager *)[v3 frameLoadDelegate] == self) {
    [v3 setFrameLoadDelegate:0];
  }
  if ((SUWebViewManager *)[v3 policyDelegate] == self) {
    [v3 setPolicyDelegate:0];
  }
  if ((SUWebViewManager *)[v3 resourceLoadDelegate] == self) {
    [v3 setResourceLoadDelegate:0];
  }
  if ((SUWebViewManager *)[v3 scriptDebugDelegate] == self) {
    [v3 setScriptDebugDelegate:0];
  }
  if ((SUWebViewManager *)[v3 UIDelegate] == self) {
    [v3 setUIDelegate:0];
  }
  [(UIWebView *)self->_webView setDelegate:0];
  self->_webView = 0;
}

- (void)dispatchEvent:(id)a3 forName:(id)a4
{
}

- (void)dispatchEvent:(id)a3 forName:(id)a4 synchronously:(BOOL)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__SUWebViewManager_dispatchEvent_forName_synchronously___block_invoke;
  v5[3] = &unk_264813F28;
  v5[4] = a3;
  v5[5] = a4;
  BOOL v6 = a5;
  [(SUWebViewManager *)self _enumerateScriptInterfacesWithBlock:v5];
}

uint64_t __56__SUWebViewManager_dispatchEvent_forName_synchronously___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dispatchEvent:*(void *)(a1 + 32) forName:*(void *)(a1 + 40) synchronously:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setAuthenticationContext:(id)a3
{
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSAuthenticationContext *)[a3 copy];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__SUWebViewManager_setAuthenticationContext___block_invoke;
    v6[3] = &unk_264813F50;
    v6[4] = a3;
    [(SUWebViewManager *)self _enumerateScriptInterfacesWithBlock:v6];
  }
}

uint64_t __45__SUWebViewManager_setAuthenticationContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAuthenticationContext:*(void *)(a1 + 32)];
}

- (void)setScriptWindowContext:(id)a3
{
  if (self->_scriptWindowContext != a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      self->_scriptWindowContext = (SUScriptWindowContext *)a3;
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __43__SUWebViewManager_setScriptWindowContext___block_invoke;
      v5[3] = &unk_264813F50;
      v5[4] = a3;
      [(SUWebViewManager *)self _enumerateScriptInterfacesWithBlock:v5];
    }
  }
}

uint64_t __43__SUWebViewManager_setScriptWindowContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setScriptWindowContext:*(void *)(a1 + 32)];
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v5 = (const char *)[a3 selector];
  if (objc_opt_respondsToSelector())
  {
    id originalFrameLoadDelegate = self->_originalFrameLoadDelegate;
LABEL_9:
    [a3 invokeWithTarget:originalFrameLoadDelegate];
    return;
  }
  if (objc_opt_respondsToSelector())
  {
    id originalFrameLoadDelegate = self->_originalPolicyDelegate;
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    id originalFrameLoadDelegate = self->_originalResourceLoadDelegate;
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    id originalFrameLoadDelegate = self->_originalUIDelegate;
    goto LABEL_9;
  }
  uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v13 = 138412546;
    uint64_t v14 = objc_opt_class();
    __int16 v15 = 2112;
    v16 = NSStringFromSelector(v5);
    LODWORD(v12) = 22;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v13, v12);
      free(v11);
      SSFileLog();
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUWebViewManager;
  id result = -[SUWebViewManager methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    id result = (id)[self->_originalFrameLoadDelegate methodSignatureForSelector:a3];
    if (!result)
    {
      id result = (id)[self->_originalResourceLoadDelegate methodSignatureForSelector:a3];
      if (!result)
      {
        id result = (id)[self->_originalPolicyDelegate methodSignatureForSelector:a3];
        if (!result) {
          return (id)[self->_originalUIDelegate methodSignatureForSelector:a3];
        }
      }
    }
  }
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUWebViewManager;
  if (-[SUWebViewManager respondsToSelector:](&v5, sel_respondsToSelector_)
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)DOMElementForScriptInterface:(id)a3 element:(id)a4
{
  objc_super v5 = [[SUDOMElement alloc] initWithDOMElement:a4];
  [(SUDOMElement *)v5 setWebView:self->_webView];

  return v5;
}

- (id)parentViewControllerForScriptInterface:(id)a3
{
  id v4 = [(SUWebViewManager *)self _delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (id)[v4 viewControllerForWebViewManager:self];
}

- (id)performanceMetricsForScriptInterface:(id)a3
{
  WebThreadLock();
  if (objc_msgSend((id)objc_msgSend(a3, "webFrame"), "parentFrame")) {
    return 0;
  }
  objc_super v6 = self->_initialRequestPerformance;

  return v6;
}

- (void)scriptInterface:(id)a3 requireCellularForResourceWithURL:(id)a4
{
  [(NSLock *)self->_lock lock];
  requireCellularURLs = self->_requireCellularURLs;
  if (!requireCellularURLs)
  {
    requireCellularURLs = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    self->_requireCellularURLs = requireCellularURLs;
  }
  [(NSMutableSet *)requireCellularURLs addObject:a4];
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)webView:(id)a3 documentViewDidSetFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = [(SUWebViewManager *)self _delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v9, "webViewManager:webDocumentViewDidSetFrame:", self, x, y, width, height);
  }
}

- (id)uiWebView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5
{
  return objc_getAssociatedObject(a4, "com.apple.iTunesStoreUI.SUWebViewManager.connectionProperties");
}

- (void)uiWebView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a4, "rangeOfString:options:", @"html", 1, a5, a6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [(SUWebViewManager *)self _delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v13 = [v12 shouldLog];
      if ([v12 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v14 &= 2u;
      }
      if (v14)
      {
        int v21 = 138412802;
        uint64_t v22 = objc_opt_class();
        __int16 v23 = 2112;
        id v24 = a4;
        __int16 v25 = 2112;
        uint64_t v26 = [a5 URL];
        LODWORD(v20) = 32;
        uint64_t v19 = &v21;
        uint64_t v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v21, v20);
          free(v16);
          uint64_t v19 = (int *)v17;
          SSFileLog();
        }
      }
      v18 = self;
      [v11 webViewManager:self didRejectInvalidRequest:a5];
    }
    objc_msgSend(a7, "ignore", v19);
  }
  else
  {
    [a7 use];
  }
}

- (id)uiWebView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5
{
  int v8 = (const void *)objc_msgSend(a5, "webFrame", a3);
  if (!CFSetContainsValue(self->_webFramesPendingInitialRequest, v8)
    || !objc_msgSend((id)objc_msgSend(a4, "URL"), "isEqual:", objc_msgSend((id)objc_msgSend(a5, "initialRequest"), "URL"))|| (id v9 = @"1", CFSetRemoveValue(self->_webFramesPendingInitialRequest, v8), !v9))
  {
    id v9 = (__CFString *)objc_alloc_init(MEMORY[0x263F8C6D0]);
  }
  [(NSLock *)self->_lock lock];
  int v10 = -[NSMutableSet containsObject:](self->_requireCellularURLs, "containsObject:", [a4 URL]);
  [(NSLock *)self->_lock unlock];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v12 = ISWeakLinkedStringConstantForString();
    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v13 setObject:v12 forKey:*MEMORY[0x263EFC770]];
    [v11 setObject:v13 forKey:*MEMORY[0x263EFC888]];

    objc_setAssociatedObject(v9, "com.apple.iTunesStoreUI.SUWebViewManager.connectionProperties", v11, (void *)0x301);
  }

  return v9;
}

- (void)uiWebView:(id)a3 resource:(id)a4 didFailLoadingWithError:(id)a5 fromDataSource:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3, a4, a5, a6);
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
    int v17 = 138543874;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2112;
    id v20 = a4;
    __int16 v21 = 2112;
    id v22 = a5;
    LODWORD(v16) = 32;
    uint64_t v15 = &v17;
    uint64_t v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      id v13 = (void *)v12;
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v17, v16);
      free(v13);
      uint64_t v15 = (int *)v14;
      SSFileLog();
    }
  }
  [(SUWebViewManager *)self _endUsingNetwork];
}

- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  if (!a6) {
    [(SUWebViewManager *)self _beginUsingNetwork];
  }
  uint64_t v12 = objc_msgSend(a5, "mutableCopy", a3);
  id v13 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_INFO)) {
    v15 &= 2u;
  }
  if (v15)
  {
    int v85 = 138543618;
    uint64_t v86 = objc_opt_class();
    __int16 v87 = 2112;
    id v88 = a5;
    LODWORD(v77) = 22;
    v74 = &v85;
    uint64_t v16 = _os_log_send_and_compose_impl();
    if (v16)
    {
      int v17 = (void *)v16;
      uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v85, v77);
      free(v17);
      v74 = (int *)v18;
      SSFileLog();
    }
  }
  if (a4 == @"1")
  {
    [(NSLock *)self->_lock lock];
    __int16 v19 = self->_pendingWebScriptReloadContext;

    self->_pendingWebScriptReloadContext = 0;
    [(NSLock *)self->_lock unlock];
    if (v19
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "initialRequest"), "URL"), "isEqual:", -[SUWebScriptReloadContext URL](v19, "URL")))
    {
      uint64_t v39 = [(SUWebScriptReloadContext *)v19 referringUserAgent];
      if (v39) {
        [v12 setValue:v39 forHTTPHeaderField:@"ref-user-agent"];
      }
      uint64_t v40 = [(NSURL *)[(SUWebScriptReloadContext *)v19 referrerURL] absoluteString];
      if (v40) {
        [v12 setValue:v40 forHTTPHeaderField:@"referer"];
      }
    }
  }
  else
  {
    __int16 v19 = 0;
  }

  [v12 setHTTPShouldHandleCookies:0];
  id v20 = (void *)[v12 URL];
  __int16 v21 = v20;
  suppressCookiesHosts = self->_suppressCookiesHosts;
  if (!suppressCookiesHosts
    || !-[NSSet containsObject:](suppressCookiesHosts, "containsObject:", [v20 host]))
  {
    uint64_t v23 = (void *)[(SSAuthenticationContext *)[(SUWebViewManager *)self authenticationContext] requiredUniqueIdentifier];
    [MEMORY[0x263F89528] addITunesStoreHeadersToRequest:v12 withAccountIdentifier:v23];
    if (v23 && [v23 unsignedLongLongValue])
    {
      uint64_t v24 = [v23 stringValue];
      [v12 setValue:v24 forHTTPHeaderField:*MEMORY[0x263F7B7C0]];
    }
    id v25 = [(SUWebViewManager *)self _userIdentifier];
    uint64_t v26 = (void *)[MEMORY[0x263F7B380] sharedStorage];
    uint64_t v27 = v26;
    if (a6) {
      [v26 setCookiesForHTTPResponse:a6 userIdentifier:v25];
    }
    v28 = (void *)[v27 cookieHeadersForURL:v21 userIdentifier:v25];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v80 objects:v84 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v81 != v31) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend(v12, "setValue:forHTTPHeaderField:", objc_msgSend(v28, "objectForKey:", *(void *)(*((void *)&v80 + 1) + 8 * i)), *(void *)(*((void *)&v80 + 1) + 8 * i));
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v80 objects:v84 count:16];
      }
      while (v30);
    }
    if ([(SUWebViewManager *)self shouldSignRequests])
    {
      id v33 = objc_alloc_init(getAKAppleIDServerResourceLoadDelegateClass());
      [v33 setShouldSendAbsintheHeader:1];
      [v33 signRequest:v12];
    }
  }
  v34 = [(SUWebViewManager *)self account];
  if (v34)
  {
    v35 = v34;
    v79 = 0;
    id v36 = objc_alloc_init(MEMORY[0x263EFB210]);
    v37 = (void *)[v36 credentialForAccount:v35 serviceID:*MEMORY[0x263F26D50] error:&v79];

    if (v37)
    {
      uint64_t v38 = [v37 token];
      if (v38)
      {
        [v12 setValue:v38 forHTTPHeaderField:*MEMORY[0x263F7B7C8]];
        goto LABEL_62;
      }
      v49 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v50 = [v49 shouldLog];
      if ([v49 shouldLogToDisk]) {
        int v51 = v50 | 2;
      }
      else {
        int v51 = v50;
      }
      if (!os_log_type_enabled((os_log_t)[v49 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v51 &= 2u;
      }
      if (v51)
      {
        uint64_t v52 = objc_opt_class();
        int v85 = 138543362;
        uint64_t v86 = v52;
        LODWORD(v77) = 12;
        v75 = &v85;
LABEL_60:
        uint64_t v53 = _os_log_send_and_compose_impl();
        if (v53)
        {
          v54 = (void *)v53;
          uint64_t v55 = objc_msgSend(NSString, "stringWithCString:encoding:", v53, 4, &v85, v77);
          free(v54);
          v75 = (int *)v55;
          SSFileLog();
        }
      }
    }
    else
    {
      v45 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v46 = [v45 shouldLog];
      if ([v45 shouldLogToDisk]) {
        int v47 = v46 | 2;
      }
      else {
        int v47 = v46;
      }
      if (!os_log_type_enabled((os_log_t)[v45 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v47 &= 2u;
      }
      if (v47)
      {
        uint64_t v48 = objc_opt_class();
        int v85 = 138543618;
        uint64_t v86 = v48;
        __int16 v87 = 2114;
        id v88 = v79;
        LODWORD(v77) = 22;
        v75 = &v85;
        goto LABEL_60;
      }
    }
LABEL_62:
    uint64_t v56 = objc_msgSend(MEMORY[0x263F25820], "clientInfoHeader", v75);
    if (v56)
    {
      [v12 setValue:v56 forHTTPHeaderField:*MEMORY[0x263F7B7E8]];
    }
    else
    {
      v58 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v59 = [v58 shouldLog];
      if ([v58 shouldLogToDisk]) {
        int v60 = v59 | 2;
      }
      else {
        int v60 = v59;
      }
      if (!os_log_type_enabled((os_log_t)[v58 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v60 &= 2u;
      }
      if (v60)
      {
        uint64_t v61 = objc_opt_class();
        int v85 = 138543362;
        uint64_t v86 = v61;
        LODWORD(v77) = 12;
        v76 = &v85;
        uint64_t v62 = _os_log_send_and_compose_impl();
        if (v62)
        {
          v63 = (void *)v62;
          uint64_t v64 = objc_msgSend(NSString, "stringWithCString:encoding:", v62, 4, &v85, v77);
          free(v63);
          v76 = (int *)v64;
          SSFileLog();
        }
      }
    }
    uint64_t v57 = [(ACAccount *)v35 aa_altDSID];
    if (v57)
    {
      [v12 setValue:v57 forHTTPHeaderField:*MEMORY[0x263F7B790]];
      goto LABEL_83;
    }
    v65 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v66 = [v65 shouldLog];
    if ([v65 shouldLogToDisk]) {
      int v67 = v66 | 2;
    }
    else {
      int v67 = v66;
    }
    if (!os_log_type_enabled((os_log_t)[v65 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v67 &= 2u;
    }
    if (v67)
    {
      uint64_t v68 = objc_opt_class();
      int v85 = 138543362;
      uint64_t v86 = v68;
      LODWORD(v77) = 12;
      v75 = &v85;
LABEL_81:
      uint64_t v69 = _os_log_send_and_compose_impl();
      if (v69)
      {
        v70 = (void *)v69;
        uint64_t v71 = objc_msgSend(NSString, "stringWithCString:encoding:", v69, 4, &v85, v77);
        free(v70);
        v75 = (int *)v71;
        SSFileLog();
      }
      goto LABEL_83;
    }
    goto LABEL_83;
  }
  v41 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v42 = [v41 shouldLog];
  if ([v41 shouldLogToDisk]) {
    int v43 = v42 | 2;
  }
  else {
    int v43 = v42;
  }
  if (!os_log_type_enabled((os_log_t)[v41 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v43 &= 2u;
  }
  if (v43)
  {
    uint64_t v44 = objc_opt_class();
    int v85 = 138543362;
    uint64_t v86 = v44;
    LODWORD(v77) = 12;
    v75 = &v85;
    goto LABEL_81;
  }
LABEL_83:
  if ([(SUWebViewManager *)self tidHeaders])
  {
    v72 = [(SUWebViewManager *)self tidHeaders];
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __94__SUWebViewManager_webThreadWebView_resource_willSendRequest_redirectResponse_fromDataSource___block_invoke;
    v78[3] = &unk_264813F78;
    v78[4] = v12;
    [(NSDictionary *)v72 enumerateKeysAndObjectsUsingBlock:v78];
  }
  return v12;
}

uint64_t __94__SUWebViewManager_webThreadWebView_resource_willSendRequest_redirectResponse_fromDataSource___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return [*(id *)(result + 32) setValue:a3 forHTTPHeaderField:a2];
    }
  }
  return result;
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v6 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3);
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v16 = 138543618;
    uint64_t v17 = objc_opt_class();
    __int16 v18 = 2112;
    id v19 = a4;
    LODWORD(v15) = 22;
    int v14 = &v16;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (void *)v9;
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v16, v15);
      free(v10);
      int v14 = (int *)v11;
      SSFileLog();
    }
  }
  id v12 = [(SUWebViewManager *)self _delegate];
  if (objc_opt_respondsToSelector())
  {
    id v13 = self;
    [v12 webViewManager:self didFailLoadWithError:a4];
  }
  [(SUWebViewManager *)self _cancelUsingNetwork];
}

- (void)webViewDidFinishLoad:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
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
    int v15 = 138543362;
    uint64_t v16 = objc_opt_class();
    LODWORD(v14) = 12;
    id v13 = &v15;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v15, v14);
      free(v9);
      id v13 = (int *)v10;
      SSFileLog();
    }
  }
  id v11 = [(SUWebViewManager *)self _delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = self;
    [v11 webViewManagerDidFinishLoad:self];
  }
  if (!self->_initialLoadReported && ([a3 isLoading] & 1) == 0)
  {
    [(SUClientInterface *)self->_clientInterface delegate];
    if (objc_opt_respondsToSelector())
    {
      [(SUClientInterfaceDelegate *)[(SUClientInterface *)self->_clientInterface delegate] clientInterfaceDidFinishLoading:self->_clientInterface];
      self->_initialLoadReported = 1;
    }
  }
  [(SUWebViewManager *)self _cancelUsingNetwork];
}

- (void)webViewDidStartLoad:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3);
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
    int v14 = 138543362;
    uint64_t v15 = objc_opt_class();
    LODWORD(v13) = 12;
    id v12 = &v14;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v14, v13);
      free(v8);
      id v12 = (int *)v9;
      SSFileLog();
    }
  }
  id v10 = [(SUWebViewManager *)self _delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = self;
    [v10 webViewManagerDidStartLoad:self];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  id v10 = [(SUWebViewManager *)self _locateStorePageViewController];
  if (!v10 || ([v10 decidePolicyForWebNavigationAction:a4 request:a5 decisionListener:a7] & 1) == 0)
  {
    [a7 use];
  }
}

- (void)webView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5
{
  id v9 = [(SUWebViewManager *)self _delegate];
  scriptInterfaces = self->_scriptInterfaces;
  if (scriptInterfaces)
  {
    id v11 = NSMapGet(scriptInterfaces, a5);
    [v11 setDelegate:0];
    [v11 tearDownUserInterface];
    NSMapRemove(self->_scriptInterfaces, a5);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v12 = (SUScriptInterface *)[v9 newScriptInterfaceForWebViewManager:self]) == 0)
  {
    id v12 = [(SUClientInterface *)self->_clientInterface _newScriptInterface];
    if (!v12)
    {
      id v12 = +[SUClientDispatch newScriptInterface];
      if (!v12) {
        id v12 = objc_alloc_init(SUScriptInterface);
      }
    }
  }
  [(SUScriptInterface *)v12 setAuthenticationContext:[(SUWebViewManager *)self authenticationContext]];
  [(SUScriptInterface *)v12 setClientInterface:self->_clientInterface];
  [(SUScriptInterface *)v12 setDelegate:self];
  [(SUScriptInterface *)v12 setWebFrame:a5];
  uint64_t v13 = self->_scriptInterfaces;
  if (!v13)
  {
    long long v14 = *(_OWORD *)(MEMORY[0x263F08408] + 16);
    *(_OWORD *)&keyCallBacks.hash = *MEMORY[0x263F08408];
    *(_OWORD *)&keyCallBacks.retain = v14;
    *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)(MEMORY[0x263F08408] + 32);
    NSMapTableValueCallBacks v15 = *(NSMapTableValueCallBacks *)*(void *)&MEMORY[0x263F08420];
    uint64_t v13 = NSCreateMapTable(&keyCallBacks, &v15, 0);
    self->_scriptInterfaces = v13;
  }
  NSMapInsert(v13, a5, v12);
  if (objc_opt_respondsToSelector()) {
    [v9 webViewManager:self willInjectScriptInterface:v12];
  }
  [a4 setValue:v12 forKey:@"iTunes"];

  if (objc_opt_respondsToSelector()) {
    [self->_originalFrameLoadDelegate webView:a3 didClearWindowObject:a4 forFrame:a5];
  }
}

- (void)webView:(id)a3 didFirstLayoutInFrame:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector()) {
    [self->_originalFrameLoadDelegate webView:a3 didFirstLayoutInFrame:a4];
  }
  uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v13 = 138412802;
    uint64_t v14 = objc_opt_class();
    __int16 v15 = 2048;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    __int16 v17 = 2112;
    uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "dataSource"), "initialRequest"), "URL");
    LODWORD(v12) = 32;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      id v11 = (void *)v10;
      objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v13, v12);
      free(v11);
      SSFileLog();
    }
  }
}

- (void)webView:(id)a3 didReceiveTitle:(id)a4 forFrame:(id)a5
{
  if ((id)objc_msgSend((id)objc_msgSend(a5, "webView", a3), "mainFrame") == a5)
  {
    id v7 = [(SUWebViewManager *)self _delegate];
    if (objc_opt_respondsToSelector())
    {
      int v8 = self;
      [v7 webViewManager:self didReceiveTitle:a4];
    }
  }
}

- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  if (objc_opt_respondsToSelector()) {
    [self->_originalFrameLoadDelegate webView:a3 didStartProvisionalLoadForFrame:a4];
  }
  if ((id)[a3 mainFrame] == a4 && self->_scriptInterfaces)
  {
    [(SUWebViewManager *)self _enumerateScriptInterfacesWithBlock:&__block_literal_global_10];
    NSFreeMapTable(self->_scriptInterfaces);
    self->_scriptInterfaces = 0;
  }
  webFramesPendingInitialRequest = self->_webFramesPendingInitialRequest;

  CFSetAddValue(webFramesPendingInitialRequest, a4);
}

uint64_t __60__SUWebViewManager_webView_didStartProvisionalLoadForFrame___block_invoke(uint64_t a1, void *a2)
{
  [a2 setDelegate:0];

  return [a2 tearDownUserInterface];
}

- (void)webView:(id)a3 resource:(id)a4 didReceiveResponse:(id)a5 fromDataSource:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector()) {
    [self->_originalResourceLoadDelegate webView:a3 resource:a4 didReceiveResponse:a5 fromDataSource:a6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = (void *)[a5 URL];
    if ((objc_msgSend((id)objc_msgSend(v11, "scheme"), "isEqualToString:", @"data") & 1) == 0)
    {
      uint64_t v12 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v13 = [v12 shouldLog];
      if ([v12 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v14 &= 2u;
      }
      if (v14)
      {
        int v21 = 138412802;
        uint64_t v22 = objc_opt_class();
        __int16 v23 = 2048;
        uint64_t v24 = [a5 statusCode];
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        LODWORD(v20) = 32;
        uint64_t v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v21, v20);
          free(v16);
          SSFileLog();
        }
      }
    }
    if (a4 == @"1")
    {
      id v17 = [(SUWebViewManager *)self _userIdentifier];
      objc_msgSend(MEMORY[0x263F89528], "handleITunesStoreResponseHeaders:request:withAccountIdentifier:shouldRetry:", a5, objc_msgSend(a6, "request"), v17, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B380], "sharedStorage"), "setCookiesForHTTPResponse:userIdentifier:", a5, v17);
      id v18 = [(SUWebViewManager *)self _delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v19 = self;
        [v18 webViewManager:self didReceivePrimaryResponse:a5];
      }
    }
  }
}

- (void)webView:(id)a3 didParseSource:(id)a4 fromURL:(id)a5 sourceId:(int64_t)a6 forWebFrame:(id)a7
{
  if (a5) {
    NSLog(&cfstr_JavascriptDidP.isa, a2, a3, a4, a5, a6, a7, a6, a5);
  }
}

- (void)webView:(id)a3 failedToParseSource:(id)a4 baseLineNumber:(unint64_t)a5 fromURL:(id)a6 withError:(id)a7 forWebFrame:(id)a8
{
}

- (void)webView:(id)a3 exceptionWasRaised:(id)a4 sourceId:(int64_t)a5 line:(int)a6 forWebFrame:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v10 = objc_msgSend(a4, "exception", a3);
  uint64_t v11 = [v10 valueForKey:@"name"];
  uint64_t v12 = [v10 valueForKey:@"message"];
  uint64_t v13 = 0;
  if (v11 && v12) {
    uint64_t v13 = [NSString stringWithFormat:@"%@: %@", v11, v12];
  }
  NSLog(&cfstr_JavascriptExce.isa, v13, [a4 functionName], a5, v7);
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
}

- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  return [(SUWebViewManager *)self _presentModalAlertWithMessage:a4 includingCancelButton:1 configurationHandler:0];
}

- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__36;
  uint64_t v13 = __Block_byref_object_dispose__36;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__SUWebViewManager_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke;
  v8[3] = &unk_264813FE8;
  v8[4] = a5;
  v8[5] = &v9;
  if (-[SUWebViewManager _presentModalAlertWithMessage:includingCancelButton:configurationHandler:](self, "_presentModalAlertWithMessage:includingCancelButton:configurationHandler:", a4, 1, v8, a6))
  {
    id v6 = (id)[(id)v10[5] text];
  }
  else
  {
    id v6 = 0;
  }

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __95__SUWebViewManager_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __95__SUWebViewManager_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke_2;
  v3[3] = &unk_264813FC0;
  long long v4 = *(_OWORD *)(a1 + 32);
  return [a2 addTextFieldWithConfigurationHandler:v3];
}

uint64_t __95__SUWebViewManager_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v4 setText:v3];
}

- (void)_requestWebScriptReloadWithContext:(id)a3
{
  id v6 = (SUWebScriptReloadContext *)[a3 copy];
  [(NSLock *)self->_lock lock];
  pendingWebScriptReloadContext = self->_pendingWebScriptReloadContext;
  if (pendingWebScriptReloadContext != v6)
  {

    self->_pendingWebScriptReloadContext = v6;
  }
  [(NSLock *)self->_lock unlock];
  id v5 = [(SUWebScriptReloadContext *)v6 _copyScriptDictionaryRepresentation];
  [(SUWebViewManager *)self dispatchEvent:v5 forName:@"reloadrequested"];
}

- (id)_locateStorePageViewController
{
  id v3 = [(SUWebViewManager *)self _delegate];
  if (objc_opt_respondsToSelector())
  {
    for (uint64_t i = [v3 viewControllerForWebViewManager:self]; ; uint64_t i = objc_msgSend(v5, "parentViewController"))
    {
      id v5 = (void *)i;
      if (!i) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v5;
  }
  else {
    return 0;
  }
}

- (void)_beginUsingNetwork
{
  [(NSLock *)self->_lock lock];
  ++self->_usingNetworkCount;
  [(NSLock *)self->_lock unlock];
  id v3 = (void *)[MEMORY[0x263F894C0] sharedInstance];

  [v3 beginUsingNetwork];
}

- (void)_cancelUsingNetwork
{
  [(NSLock *)self->_lock lock];
  int64_t usingNetworkCount = self->_usingNetworkCount;
  self->_int64_t usingNetworkCount = 0;
  [(NSLock *)self->_lock unlock];
  uint64_t v4 = [MEMORY[0x263F894C0] sharedInstance];
  if (usingNetworkCount >= 1)
  {
    id v5 = (void *)v4;
    unint64_t v6 = usingNetworkCount + 1;
    do
    {
      [v5 endUsingNetwork];
      --v6;
    }
    while (v6 > 1);
  }
}

- (id)_delegate
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUWebViewManager.m", 847, @"Not main thread");
  }
  return self->_delegate;
}

- (void)_endUsingNetwork
{
  [(NSLock *)self->_lock lock];
  int64_t usingNetworkCount = self->_usingNetworkCount;
  BOOL v4 = usingNetworkCount < 1;
  int64_t v5 = usingNetworkCount - 1;
  if (v4)
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
  else
  {
    self->_int64_t usingNetworkCount = v5;
    [(NSLock *)self->_lock unlock];
    unint64_t v6 = (void *)[MEMORY[0x263F894C0] sharedInstance];
    [v6 endUsingNetwork];
  }
}

- (void)_enumerateScriptInterfacesWithBlock:(id)a3
{
  scriptInterfaces = self->_scriptInterfaces;
  if (scriptInterfaces)
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, scriptInterfaces);
    value = 0;
    kedouble y = 0;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
      (*((void (**)(id, void *))a3 + 2))(a3, value);
    NSEndMapTableEnumeration(&enumerator);
  }
}

- (BOOL)_presentModalAlertWithMessage:(id)a3 includingCancelButton:(BOOL)a4 configurationHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  int v8 = (void *)[MEMORY[0x263F1C3F8] alertControllerWithTitle:a3 message:0 preferredStyle:1];
  if (a5) {
    (*((void (**)(id, void *))a5 + 2))(a5, v8);
  }
  if (v6)
  {
    uint64_t v9 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"CANCEL", &stru_26DB8C5F8, 0);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke_2;
    v19[3] = &unk_264814010;
    v19[4] = &__block_literal_global_127;
    objc_msgSend(v8, "addAction:", objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v19));
  }
  uint64_t v11 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"OK", &stru_26DB8C5F8, 0);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke_3;
  v18[3] = &unk_264814038;
  v18[4] = &__block_literal_global_127;
  v18[5] = &v20;
  objc_msgSend(v8, "addAction:", objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v18));
  id v13 = [(SUWebViewManager *)self _delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = (void *)[v13 viewControllerForWebViewManager:self];
    uint64_t v15 = v14;
    if (v14)
    {
      [v14 presentViewController:v8 animated:1 completion:0];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "runModal:", objc_msgSend(v15, "view"));
    }
  }
  char v16 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v16;
}

uint64_t __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke()
{
  v0 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  return [v0 stopModal];
}

uint64_t __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__SUWebViewManager__presentModalAlertWithMessage_includingCancelButton_configurationHandler___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_userIdentifier
{
  v2 = (void *)[(SSAuthenticationContext *)[(SUWebViewManager *)self authenticationContext] requiredUniqueIdentifier];
  if (v2)
  {
    id v3 = v2;
    if ([v2 unsignedLongLongValue]) {
      return v3;
    }
  }
  int64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "activeAccount");

  return (id)[v5 uniqueIdentifier];
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (SUWebViewManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUWebViewManagerDelegate *)a3;
}

- (ISURLRequestPerformance)initialRequestPerformance
{
  return self->_initialRequestPerformance;
}

- (void)setInitialRequestPerformance:(id)a3
{
}

- (id)originalFrameLoadDelegate
{
  return self->_originalFrameLoadDelegate;
}

- (void)setOriginalFrameLoadDelegate:(id)a3
{
}

- (id)originalPolicyDelegate
{
  return self->_originalPolicyDelegate;
}

- (void)setOriginalPolicyDelegate:(id)a3
{
}

- (id)originalResourceLoadDelegate
{
  return self->_originalResourceLoadDelegate;
}

- (void)setOriginalResourceLoadDelegate:(id)a3
{
}

- (id)originalUIDelegate
{
  return self->_originalUIDelegate;
}

- (void)setOriginalUIDelegate:(id)a3
{
}

- (SUScriptWindowContext)scriptWindowContext
{
  return self->_scriptWindowContext;
}

- (BOOL)shouldSignRequests
{
  return self->_shouldSignRequests;
}

- (void)setShouldSignRequests:(BOOL)a3
{
  self->_shouldSignRequests = a3;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
}

@end