@interface WebBundleManager
- (NSString)entryPointString;
- (WKProcessPool)pool;
- (WKWebView)webView;
- (WebBundleManager)initWithConfiguration:(id)a3 delegate:(id)a4;
- (id)_newConfiguredWebView;
- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4;
- (void)_cancelPageLoadTimerIfNeeded;
- (void)_pageLoadFailureOccurred;
- (void)_startPageLoadTimer;
- (void)cancelLoadRequest;
- (void)dealloc;
- (void)didLoadPageWithSuccess:(BOOL)a3;
- (void)loadRequest;
- (void)setEntryPointString:(id)a3;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation WebBundleManager

- (WKProcessPool)pool
{
  pool = self->_pool;
  if (!pool)
  {
    id v4 = objc_alloc_init((Class)_WKProcessPoolConfiguration);
    [v4 setUsesSingleWebProcess:1];
    v5 = (WKProcessPool *)[objc_alloc((Class)WKProcessPool) _initWithConfiguration:v4];
    v6 = self->_pool;
    self->_pool = v5;

    pool = self->_pool;
  }

  return pool;
}

- (WebBundleManager)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WebBundleManager;
  v9 = [(WebBundleManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_webBundleConfiguration, a3);
    v11 = [(WebBundleManager *)v10 _newConfiguredWebView];
    webView = v10->_webView;
    v10->_webView = v11;
  }
  return v10;
}

- (void)loadRequest
{
  v3 = [(WebBundleManager *)self entryPointString];
  webBundleConfiguration = self->_webBundleConfiguration;
  if (v3)
  {
    v5 = [(WebBundleConfiguration *)webBundleConfiguration entryPointUrlBase];
    v6 = [(WebBundleManager *)self entryPointString];
    id v10 = [v5 URLByAppendingPathComponent:v6];
  }
  else
  {
    id v10 = [(WebBundleConfiguration *)webBundleConfiguration entryPointUrl];
  }

  id v7 = [(WebBundleManager *)self webView];
  id v8 = [objc_alloc((Class)NSURLRequest) initWithURL:v10];
  id v9 = [v7 loadRequest:v8];
}

- (void)cancelLoadRequest
{
  [(WebBundleManager *)self _cancelPageLoadTimerIfNeeded];
  id v3 = [(WebBundleManager *)self webView];
  [v3 stopLoading];
}

- (void)didLoadPageWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_1000B8184();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = @"NO";
    if (v3) {
      v6 = @"YES";
    }
    id v7 = v6;
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Did load page with success: %@", (uint8_t *)&v8, 0xCu);
  }
  if (v3) {
    [(WebBundleManager *)self _cancelPageLoadTimerIfNeeded];
  }
  else {
    [(WebBundleManager *)self _pageLoadFailureOccurred];
  }
}

- (void)dealloc
{
  BOOL v3 = [(WKWebViewConfiguration *)self->_webViewConfiguration userContentController];
  id v4 = [(WebBundleConfiguration *)self->_webBundleConfiguration messageHandlerName];
  v5 = +[WKContentWorld pageWorld];
  [v3 removeScriptMessageHandlerForName:v4 contentWorld:v5];

  v6.receiver = self;
  v6.super_class = (Class)WebBundleManager;
  [(WebBundleManager *)&v6 dealloc];
}

- (id)_newConfiguredWebView
{
  BOOL v3 = [WebBundleSchemaHandler alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = [(WebBundleSchemaHandler *)v3 initWithDelegate:WeakRetained configuration:self->_webBundleConfiguration];

  objc_super v6 = [WebBundleScriptMessageHandlerWithReply alloc];
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  int v8 = [(WebBundleScriptMessageHandlerWithReply *)v6 initWithDelegate:v7];

  id v9 = (WKWebViewConfiguration *)objc_alloc_init((Class)WKWebViewConfiguration);
  id v10 = [(WebBundleConfiguration *)self->_webBundleConfiguration urlScheme];
  [(WKWebViewConfiguration *)v9 setURLSchemeHandler:v5 forURLScheme:v10];

  v11 = [(WebBundleManager *)self pool];
  [(WKWebViewConfiguration *)v9 setProcessPool:v11];

  id v12 = objc_alloc_init((Class)WKUserContentController);
  [(WKWebViewConfiguration *)v9 setUserContentController:v12];

  v13 = [(WKWebViewConfiguration *)v9 userContentController];
  objc_super v14 = +[WKContentWorld pageWorld];
  v15 = [(WebBundleConfiguration *)self->_webBundleConfiguration messageHandlerName];
  [v13 addScriptMessageHandlerWithReply:v8 contentWorld:v14 name:v15];

  webViewConfiguration = self->_webViewConfiguration;
  self->_webViewConfiguration = v9;
  v17 = v9;

  v18 = -[NoKeyboardAccessoryWebView initWithFrame:configuration:]([NoKeyboardAccessoryWebView alloc], "initWithFrame:configuration:", v17, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(NoKeyboardAccessoryWebView *)v18 _setInputDelegate:self];
  [(NoKeyboardAccessoryWebView *)v18 setNavigationDelegate:self];
  v19 = [(NoKeyboardAccessoryWebView *)v18 scrollView];
  [v19 setScrollsToTop:0];

  v20 = [(NoKeyboardAccessoryWebView *)v18 scrollView];
  [v20 setMaximumZoomScale:1.0];

  v21 = [(NoKeyboardAccessoryWebView *)v18 scrollView];
  [v21 setMinimumZoomScale:1.0];

  [(NoKeyboardAccessoryWebView *)v18 setOpaque:0];
  v22 = [(NoKeyboardAccessoryWebView *)v18 scrollView];
  [v22 setZoomEnabled:0];

  return v18;
}

- (void)_startPageLoadTimer
{
  [(WebBundleManager *)self _cancelPageLoadTimerIfNeeded];
  BOOL v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_pageLoadFailureOccurred" selector:0 userInfo:0 repeats:3.0];
  pageLoadTimer = self->_pageLoadTimer;
  self->_pageLoadTimer = v3;
}

- (void)_cancelPageLoadTimerIfNeeded
{
  pageLoadTimer = self->_pageLoadTimer;
  if (pageLoadTimer)
  {
    [(NSTimer *)pageLoadTimer invalidate];
    id v4 = self->_pageLoadTimer;
    self->_pageLoadTimer = 0;
  }
}

- (void)_pageLoadFailureOccurred
{
  [(WebBundleManager *)self _cancelPageLoadTimerIfNeeded];
  BOOL v3 = sub_1000B8184();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int v4 = [(WebBundleConfiguration *)self->_webBundleConfiguration temporarilyUseOnDeviceDirectory];
    v5 = @"YES";
    if (v4) {
      v5 = @"NO";
    }
    objc_super v6 = v5;
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Page load failure occurred, reloading: %@", (uint8_t *)&v11, 0xCu);
  }
  if ([(WebBundleConfiguration *)self->_webBundleConfiguration temporarilyUseOnDeviceDirectory])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v8 = [(WebBundleManager *)self webView];
    [WeakRetained webView:v8 didFinishLoadingWithError:0];
  }
  else
  {
    [(WebBundleConfiguration *)self->_webBundleConfiguration setTemporarilyUseOnDeviceDirectory:1];
    id v9 = [(WebBundleManager *)self webView];
    [v9 stopLoading];

    id WeakRetained = [(WebBundleManager *)self webView];
    id v10 = [WeakRetained reloadFromOrigin];
  }
}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  return [a4 type] != (id)16;
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  objc_storeStrong((id *)&self->_currentNavigation, a4);

  [(WebBundleManager *)self _startPageLoadTimer];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  if (self->_currentNavigation == a4)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained webViewDidFinishNavigation:v5];
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  if (self->_currentNavigation == a4) {
    [(WebBundleManager *)self _pageLoadFailureOccurred];
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  if (self->_currentNavigation == a4) {
    [(WebBundleManager *)self _pageLoadFailureOccurred];
  }
}

- (WKWebView)webView
{
  return self->_webView;
}

- (NSString)entryPointString
{
  return self->_entryPointString;
}

- (void)setEntryPointString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPointString, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_pageLoadTimer, 0);
  objc_storeStrong((id *)&self->_currentNavigation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webViewConfiguration, 0);

  objc_storeStrong((id *)&self->_webBundleConfiguration, 0);
}

@end