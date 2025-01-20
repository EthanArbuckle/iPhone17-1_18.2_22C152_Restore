@interface SXEmbedComponentView
- (BOOL)allowHierarchyRemoval;
- (BOOL)failedLoading;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasLoadedEmbedData;
- (BOOL)hasRegisteredScriptMessageHandlers;
- (BOOL)shouldAllowRequestToURL:(id)a3;
- (BOOL)shouldLayoutWebView;
- (BOOL)shouldShowWebView;
- (BOOL)usingElementFullscreen;
- (CGSize)currentLayoutSize;
- (CGSize)currentViewportSize;
- (CGSize)currentlyLayoutingForSize;
- (NSMutableSet)expectedMessages;
- (NSString)HTML;
- (NSString)userScript;
- (SWCrashRetryThrottler)webCrashRetryThrottler;
- (SWReachabilityProvider)reachabilityProvider;
- (SXAnalyticsReporting)analyticsReporting;
- (SXComponentActionHandler)actionHandler;
- (SXEmbedComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 reachabilityProvider:(id)a7 embedDataProvider:(id)a8 actionHandler:(id)a9 layoutInvalidator:(id)a10 websiteDataStore:(id)a11 relatedWebViewCache:(id)a12 proxyAuthenticationHandler:(id)a13 sceneStateMonitor:(id)a14 analyticsReporting:(id)a15;
- (SXEmbedDataProvider)embedDataProvider;
- (SXEmbedResource)embedResource;
- (SXEmbedType)embedConfiguration;
- (SXLayoutInvalidator)layoutInvalidator;
- (SXProxyAuthenticationHandler)proxyAuthenticationHandler;
- (SXRelatedWebViewCache)relatedWebViewCache;
- (SXSceneStateMonitor)sceneStateMonitor;
- (SXWebContentLoadEvent)loadEvent;
- (TFMultiDelegate)scriptMessageHandler;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)errorLabel;
- (WKNavigation)initialNavigation;
- (WKWebView)webView;
- (WKWebView)webViewPresentingInFullscreen;
- (WKWebsiteDataStore)dataStore;
- (double)initialScale;
- (id)HTMLByEnclosingHTML:(id)a3 withHTML:(id)a4;
- (id)enclosingHTML;
- (id)unableToLoadMessage;
- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6;
- (unint64_t)userActionMediaTypes;
- (void)_webViewDidEnterElementFullscreen:(id)a3;
- (void)_webViewDidExitElementFullscreen:(id)a3;
- (void)_webViewDidExitFullscreen:(id)a3;
- (void)_webViewWebProcessDidCrash:(id)a3;
- (void)addScriptMessageHandlers;
- (void)dealloc;
- (void)discardContents;
- (void)displayEmbedIfNeeded;
- (void)finalizeLayoutForSize:(CGSize)a3;
- (void)handleError:(id)a3;
- (void)layoutWebViewForSize:(CGSize)a3;
- (void)loadComponent:(id)a3;
- (void)loadEmbedData;
- (void)loadEmbedIfNeeded;
- (void)loadWebView;
- (void)loadWebViewIfNeeded;
- (void)presentComponentWithChanges:(id)a3;
- (void)prewarmWebView;
- (void)reloadEmbed;
- (void)removeScriptMessageHandlers;
- (void)renderContents;
- (void)reportLoadEventWithError:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setActivityIndicator:(id)a3;
- (void)setCurrentLayoutSize:(CGSize)a3;
- (void)setCurrentViewportSize:(CGSize)a3;
- (void)setCurrentlyLayoutingForSize:(CGSize)a3;
- (void)setEmbedConfiguration:(id)a3;
- (void)setEmbedResource:(id)a3;
- (void)setErrorLabel:(id)a3;
- (void)setExpectedMessages:(id)a3;
- (void)setFailedLoading:(BOOL)a3;
- (void)setHTML:(id)a3;
- (void)setHasRegisteredScriptMessageHandlers:(BOOL)a3;
- (void)setInitialNavigation:(id)a3;
- (void)setLoadEvent:(id)a3;
- (void)setUserScript:(id)a3;
- (void)setUsingElementFullscreen:(BOOL)a3;
- (void)setWebCrashRetryThrottler:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewPresentingInFullscreen:(id)a3;
- (void)showActivityIndicator:(BOOL)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)webViewEnteredFullscreen:(id)a3;
- (void)webViewExitedFullscreen:(id)a3;
- (void)willPresentComponentWithChanges:(id)a3;
@end

@implementation SXEmbedComponentView

- (SXEmbedComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 reachabilityProvider:(id)a7 embedDataProvider:(id)a8 actionHandler:(id)a9 layoutInvalidator:(id)a10 websiteDataStore:(id)a11 relatedWebViewCache:(id)a12 proxyAuthenticationHandler:(id)a13 sceneStateMonitor:(id)a14 analyticsReporting:(id)a15
{
  id v20 = a3;
  id v44 = a4;
  id v21 = a5;
  id v22 = a6;
  id v43 = a7;
  id v42 = a8;
  id v41 = a9;
  id v40 = a10;
  id v39 = a11;
  id v38 = a12;
  id v37 = a13;
  id v36 = a14;
  id v35 = a15;
  v49.receiver = self;
  v49.super_class = (Class)SXEmbedComponentView;
  v23 = [(SXComponentView *)&v49 initWithDOMObjectProvider:v20 viewport:v44 presentationDelegate:v21 componentStyleRendererFactory:v22];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_reachabilityProvider, a7);
    objc_storeStrong((id *)&v24->_embedDataProvider, a8);
    objc_storeStrong((id *)&v24->_actionHandler, a9);
    objc_storeStrong((id *)&v24->_layoutInvalidator, a10);
    uint64_t v25 = [objc_alloc(MEMORY[0x263F7D0C8]) initWithDelegate:v24 delegateProtocol:&unk_26D60DD28];
    scriptMessageHandler = v24->_scriptMessageHandler;
    v24->_scriptMessageHandler = (TFMultiDelegate *)v25;

    objc_storeStrong((id *)&v24->_dataStore, a11);
    objc_storeStrong((id *)&v24->_relatedWebViewCache, a12);
    objc_storeStrong((id *)&v24->_proxyAuthenticationHandler, a13);
    objc_storeStrong((id *)&v24->_sceneStateMonitor, a14);
    objc_storeStrong((id *)&v24->_analyticsReporting, a15);
    v27 = [(SXComponentView *)v24 viewport];
    [v27 addViewportChangeListener:v24 forOptions:8];

    uint64_t v28 = [MEMORY[0x263EFF9C0] set];
    expectedMessages = v24->_expectedMessages;
    v24->_expectedMessages = (NSMutableSet *)v28;

    v30 = (SWCrashRetryThrottler *)objc_alloc_init(MEMORY[0x263F6C6D0]);
    webCrashRetryThrottler = v24->_webCrashRetryThrottler;
    v24->_webCrashRetryThrottler = v30;

    v32 = [(SXComponentView *)v24 contentView];
    [v32 setClipsToBounds:1];

    objc_initWeak(&location, v24);
    sceneStateMonitor = v24->_sceneStateMonitor;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __282__SXEmbedComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_reachabilityProvider_embedDataProvider_actionHandler_layoutInvalidator_websiteDataStore_relatedWebViewCache_proxyAuthenticationHandler_sceneStateMonitor_analyticsReporting___block_invoke;
    v46[3] = &unk_264651108;
    objc_copyWeak(&v47, &location);
    [(SXSceneStateMonitor *)sceneStateMonitor performOnSceneDidDisconnect:v46];
    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }

  return v24;
}

void __282__SXEmbedComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_reachabilityProvider_embedDataProvider_actionHandler_layoutInvalidator_websiteDataStore_relatedWebViewCache_proxyAuthenticationHandler_sceneStateMonitor_analyticsReporting___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained webView];
    [v2 pauseAllMediaPlaybackWithCompletionHandler:0];

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(SXEmbedComponentView *)self removeScriptMessageHandlers];
  v3.receiver = self;
  v3.super_class = (Class)SXEmbedComponentView;
  [(SXComponentView *)&v3 dealloc];
}

- (void)loadComponent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXEmbedComponentView;
  [(SXComponentView *)&v6 loadComponent:a3];
  v4 = [(SXComponentView *)self viewport];
  uint64_t v5 = [v4 appearState];

  if (v5 == 2) {
    [(SXEmbedComponentView *)self prewarmWebView];
  }
}

- (void)renderContents
{
  v3.receiver = self;
  v3.super_class = (Class)SXEmbedComponentView;
  [(SXComponentView *)&v3 renderContents];
  [(SXEmbedComponentView *)self loadEmbedIfNeeded];
}

- (void)discardContents
{
  v6.receiver = self;
  v6.super_class = (Class)SXEmbedComponentView;
  [(SXComponentView *)&v6 discardContents];
  objc_super v3 = [(SXEmbedComponentView *)self webView];
  v4 = [(SXEmbedComponentView *)self webViewPresentingInFullscreen];

  if (v3 != v4)
  {
    uint64_t v5 = [(SXEmbedComponentView *)self webView];
    [v5 removeFromSuperview];
  }
}

- (void)willPresentComponentWithChanges:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXEmbedComponentView;
  [(SXComponentView *)&v5 willPresentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  if ([(SXEmbedComponentView *)self shouldLayoutWebView])
  {
    v4 = [(SXEmbedComponentView *)self webView];
    [v4 setAlpha:0.0];

    [(SXEmbedComponentView *)self discardContents];
  }
}

- (void)presentComponentWithChanges:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SXEmbedComponentView;
  [(SXComponentView *)&v4 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  [(SXEmbedComponentView *)self loadEmbedIfNeeded];
}

- (void)loadEmbedIfNeeded
{
  if (![(SXEmbedComponentView *)self hasLoadedEmbedData]) {
    [(SXEmbedComponentView *)self loadEmbedData];
  }
  [(SXEmbedComponentView *)self displayEmbedIfNeeded];
}

- (void)loadEmbedData
{
  id v3 = a1;
  objc_super v4 = [a2 component];
  objc_super v5 = [v4 identifier];
  OUTLINED_FUNCTION_0_0(&dword_222AC5000, v6, v7, "Failed to load embed, network unavailable, component-identifier=%{public}@", v8, v9, v10, v11, 2u);
}

- (void)displayEmbedIfNeeded
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  [(SXEmbedComponentView *)self loadWebViewIfNeeded];
  if ([(SXEmbedComponentView *)self shouldLayoutWebView])
  {
    id v3 = [SXWebContentLoadEvent alloc];
    objc_super v4 = [(SXEmbedComponentView *)self embedResource];
    objc_super v5 = [v4 URL];
    uint64_t v6 = [(SXWebContentLoadEvent *)v3 initWithURL:v5];
    [(SXEmbedComponentView *)self setLoadEvent:v6];

    [(SXComponentView *)self contentFrame];
    double v8 = v7;
    uint64_t v9 = [(SXEmbedComponentView *)self embedConfiguration];
    [v9 maximumWidth];
    double v11 = v10;

    if (v8 >= v11) {
      double v8 = v11;
    }
    [(SXComponentView *)self contentFrame];
    double Height = CGRectGetHeight(v40);
    v13 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v39.width = v8;
      v39.height = Height;
      v15 = NSStringFromCGSize(v39);
      v16 = [(SXComponentView *)self component];
      v17 = [v16 identifier];
      *(_DWORD *)buf = 138543618;
      id v35 = v15;
      __int16 v36 = 2114;
      id v37 = v17;
      _os_log_impl(&dword_222AC5000, v14, OS_LOG_TYPE_DEFAULT, "Starting layout for embed with size: %{public}@, component-identifier=%{public}@", buf, 0x16u);
    }
    -[SXEmbedComponentView layoutWebViewForSize:](self, "layoutWebViewForSize:", v8, Height);
    [(SXEmbedComponentView *)self showActivityIndicator:1];
    [(SXEmbedComponentView *)self reloadEmbed];
  }
  else if ([(SXEmbedComponentView *)self shouldShowWebView])
  {
    v18 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      id v20 = [(SXComponentView *)self component];
      id v21 = [v20 identifier];
      *(_DWORD *)buf = 138543362;
      id v35 = v21;
      _os_log_impl(&dword_222AC5000, v19, OS_LOG_TYPE_DEFAULT, "Display embed, component-identifier=%{public}@", buf, 0xCu);
    }
    [(SXEmbedComponentView *)self showActivityIndicator:0];
    id v22 = [(SXEmbedComponentView *)self webView];
    [v22 bounds];
    -[SXEmbedComponentView layoutWebViewForSize:](self, "layoutWebViewForSize:", v23, v24);

    uint64_t v25 = [(SXEmbedComponentView *)self webView];
    [v25 alpha];
    double v27 = v26;

    if (v27 == 0.0)
    {
      if ([(SXComponentView *)self visibilityState] == 1)
      {
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __44__SXEmbedComponentView_displayEmbedIfNeeded__block_invoke;
        v33[3] = &unk_2646511F8;
        v33[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:2 delay:v33 options:0 animations:0.2 completion:0.0];
      }
      else
      {
        v32 = [(SXEmbedComponentView *)self webView];
        [v32 setAlpha:1.0];
      }
    }
    else
    {
      uint64_t v28 = [(SXEmbedComponentView *)self webView];
      v29 = [v28 superview];

      if (!v29)
      {
        v30 = [(SXComponentView *)self contentView];
        v31 = [(SXEmbedComponentView *)self webView];
        [v30 addSubview:v31];
      }
    }
  }
}

void __44__SXEmbedComponentView_displayEmbedIfNeeded__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) webView];
  [v1 setAlpha:1.0];
}

- (void)prewarmWebView
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(SXEmbedComponentView *)self webView];
  if (v3)
  {
  }
  else if (![(SXEmbedComponentView *)self failedLoading])
  {
    objc_super v4 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v5 = v4;
      uint64_t v6 = [(SXComponentView *)self component];
      double v7 = [v6 identifier];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_222AC5000, v5, OS_LOG_TYPE_DEFAULT, "Prewarming web view, component-identifier=%{public}@", (uint8_t *)&v8, 0xCu);
    }
    [(SXEmbedComponentView *)self loadWebView];
  }
}

- (void)loadWebViewIfNeeded
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SXEmbedComponentView *)self webView];
  uint64_t v4 = v3;
  if (v3 || (uint64_t v3 = [(SXComponentView *)self hasRenderedContents], v4 = 0, !v3))
  {
    MEMORY[0x270F9A758](v3, v4);
  }
  else if (![(SXEmbedComponentView *)self failedLoading])
  {
    objc_super v5 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      double v7 = [(SXComponentView *)self component];
      int v8 = [v7 identifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_222AC5000, v6, OS_LOG_TYPE_DEFAULT, "Setting up web view, component-identifier=%{public}@", buf, 0xCu);
    }
    [(SXEmbedComponentView *)self loadWebView];
  }
}

- (void)loadWebView
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    objc_super v5 = [(SXComponentView *)self component];
    uint64_t v6 = [v5 identifier];
    int v56 = 138543362;
    v57 = v6;
    _os_log_impl(&dword_222AC5000, v4, OS_LOG_TYPE_DEFAULT, "Setting up web view, component-identifier=%{public}@", (uint8_t *)&v56, 0xCu);
  }
  double v7 = [(SXEmbedComponentView *)self errorLabel];
  [v7 removeFromSuperview];

  id v8 = objc_alloc_init(MEMORY[0x263F1FA38]);
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1FA40]), "initWithSource:injectionTime:forMainFrameOnly:", @"document.body.style.webkitUserSelect = 'none';",
                 1,
                 0);
  [v8 addUserScript:v9];
  id v10 = objc_alloc_init(MEMORY[0x263F1FA60]);
  objc_msgSend(v10, "setMediaTypesRequiringUserActionForPlayback:", -[SXEmbedComponentView userActionMediaTypes](self, "userActionMediaTypes"));
  [v10 setAllowsAirPlayForMediaPlayback:0];
  [v10 setAllowsPictureInPictureMediaPlayback:0];
  [v10 _setWaitsForPaintAfterViewDidMoveToWindow:0];
  uint64_t v11 = [(SXEmbedComponentView *)self dataStore];
  [v10 setWebsiteDataStore:v11];

  v12 = [(SXEmbedComponentView *)self relatedWebViewCache];
  v13 = [(SXEmbedComponentView *)self embedConfiguration];
  v14 = [v13 baseURL];
  v15 = [v12 relatedWebViewForBaseURL:v14];

  [v10 _setRelatedWebView:v15];
  v16 = [MEMORY[0x263F1FA28] embedProcessPool];
  [v10 setProcessPool:v16];

  id v17 = objc_alloc_init(MEMORY[0x263F1FA20]);
  [v17 setJavaScriptCanOpenWindowsAutomatically:1];
  v18 = [(SXEmbedComponentView *)self traitCollection];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if (v19 == 1) {
    [v17 _setFullScreenEnabled:1];
  }
  [v17 _setShouldAllowUserInstalledFonts:0];
  [v10 setPreferences:v17];
  [v10 setUserContentController:v8];
  [(SXComponentView *)self contentFrame];
  double v21 = v20;
  id v22 = [(SXEmbedComponentView *)self embedConfiguration];
  [v22 maximumWidth];
  double v24 = v23;

  if (v21 >= v24) {
    double v21 = v24;
  }
  uint64_t v25 = [(SXComponentView *)self contentView];
  [v25 bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v32 = objc_msgSend(objc_alloc(MEMORY[0x263F1FA58]), "initWithFrame:configuration:", v10, v27, v29, v21, v31);
  [(SXEmbedComponentView *)self setWebView:v32];

  v33 = [(SXEmbedComponentView *)self webView];
  v34 = [v33 scrollView];
  [v34 setScrollsToTop:0];

  id v35 = [(SXEmbedComponentView *)self webView];
  __int16 v36 = [v35 scrollView];
  [v36 setContentInsetAdjustmentBehavior:2];

  id v37 = [(SXEmbedComponentView *)self webView];
  uint64_t v38 = [v37 scrollView];
  [v38 setScrollEnabled:0];

  CGSize v39 = [(SXEmbedComponentView *)self webView];
  CGRect v40 = [v39 scrollView];
  [v40 setDelegate:self];

  id v41 = [(SXEmbedComponentView *)self webView];
  [v41 _setFullscreenDelegate:self];

  id v42 = [(SXEmbedComponentView *)self webView];
  id v43 = [v42 scrollView];
  [v43 setAlwaysBounceVertical:0];

  id v44 = [(SXEmbedComponentView *)self webView];
  v45 = [v44 scrollView];
  [v45 setAlwaysBounceHorizontal:0];

  v46 = [(SXEmbedComponentView *)self webView];
  id v47 = [MEMORY[0x263F1C550] clearColor];
  [v46 setBackgroundColor:v47];

  v48 = [(SXEmbedComponentView *)self webView];
  [v48 setOpaque:0];

  objc_super v49 = [(SXEmbedComponentView *)self webView];
  [v49 setNavigationDelegate:self];

  v50 = [(SXEmbedComponentView *)self webView];
  [v50 setUIDelegate:self];

  v51 = [(SXEmbedComponentView *)self webView];
  [v51 setAlpha:0.0];

  v52 = [(SXEmbedComponentView *)self relatedWebViewCache];
  v53 = [(SXEmbedComponentView *)self webView];
  v54 = [(SXEmbedComponentView *)self embedConfiguration];
  v55 = [v54 baseURL];
  [v52 storeRelatedWebView:v53 baseURL:v55];
}

- (void)reloadEmbed
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ([(SXEmbedComponentView *)self hasLoadedEmbedData])
  {
    uint64_t v3 = [(SXEmbedComponentView *)self webView];

    if (v3)
    {
      uint64_t v4 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v5 = v4;
        uint64_t v6 = [(SXComponentView *)self component];
        double v7 = [v6 identifier];
        int v37 = 138543362;
        uint64_t v38 = v7;
        _os_log_impl(&dword_222AC5000, v5, OS_LOG_TYPE_DEFAULT, "Start loading embed, component-identifier=%{public}@", (uint8_t *)&v37, 0xCu);
      }
      id v8 = [(SXEmbedComponentView *)self webViewPresentingInFullscreen];

      if (v8)
      {
        uint64_t v9 = (void *)SXEmbedLog;
        if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = v9;
          uint64_t v11 = [(SXComponentView *)self component];
          v12 = [v11 identifier];
          int v37 = 138543362;
          uint64_t v38 = v12;
          _os_log_impl(&dword_222AC5000, v10, OS_LOG_TYPE_DEFAULT, "Web view in fullscreen, keeping it alive, component-identifier=%{public}@", (uint8_t *)&v37, 0xCu);
        }
        [(SXEmbedComponentView *)self removeScriptMessageHandlers];
        [(SXEmbedComponentView *)self setWebView:0];
        [(SXEmbedComponentView *)self loadWebViewIfNeeded];
      }
      [(SXComponentView *)self contentFrame];
      -[SXEmbedComponentView setCurrentlyLayoutingForSize:](self, "setCurrentlyLayoutingForSize:", v13, v14);
      [(SXEmbedComponentView *)self addScriptMessageHandlers];
      v15 = (void *)MEMORY[0x263EFC5E8];
      v16 = [NSURL URLWithString:@"about:blank"];
      id v17 = [v15 requestWithURL:v16];

      [v17 setAttribution:1];
      v18 = [(SXEmbedComponentView *)self webView];
      id v19 = (id)[v18 loadSimulatedRequest:v17 responseHTMLString:&stru_26D5311C0];

      double v20 = [(SXEmbedComponentView *)self layoutInvalidator];
      double v21 = [(SXComponentView *)self component];
      [v20 mightInvalidateComponent:v21];

      id v22 = [(SXEmbedComponentView *)self webView];
      [v22 setAlpha:0.0];

      double v23 = [(SXEmbedComponentView *)self embedConfiguration];
      double v24 = [v23 baseURL];

      id v25 = objc_alloc(MEMORY[0x263F1FA40]);
      double v26 = [(SXEmbedComponentView *)self userScript];
      double v27 = (void *)[v25 initWithSource:v26 injectionTime:1 forMainFrameOnly:0];

      double v28 = [(SXEmbedComponentView *)self webView];
      double v29 = [v28 configuration];
      double v30 = [v29 userContentController];
      [v30 addUserScript:v27];

      double v31 = [MEMORY[0x263EFC5E8] requestWithURL:v24];
      [v31 setAttribution:1];
      v32 = [(SXEmbedComponentView *)self HTML];
      v33 = [(SXEmbedComponentView *)self enclosingHTML];
      v34 = [(SXEmbedComponentView *)self HTMLByEnclosingHTML:v32 withHTML:v33];

      id v35 = [(SXEmbedComponentView *)self webView];
      __int16 v36 = [v35 loadSimulatedRequest:v31 responseHTMLString:v34];
      [(SXEmbedComponentView *)self setInitialNavigation:v36];
    }
  }
}

- (void)layoutWebViewForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(SXEmbedComponentView *)self webView];
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, width, height);

  id v10 = [(SXEmbedComponentView *)self webView];
  double v7 = [(SXComponentView *)self contentView];
  [v7 bounds];
  double MidX = CGRectGetMidX(v12);
  uint64_t v9 = [(SXComponentView *)self contentView];
  [v9 bounds];
  objc_msgSend(v10, "setCenter:", MidX, CGRectGetMidY(v13));
}

- (void)finalizeLayoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = v6;
    v22.double width = width;
    v22.double height = height;
    id v8 = NSStringFromCGSize(v22);
    uint64_t v9 = [(SXComponentView *)self component];
    id v10 = [v9 identifier];
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2114;
    double v20 = v10;
    _os_log_impl(&dword_222AC5000, v7, OS_LOG_TYPE_DEFAULT, "Finalizing layout with size: %{public}@, component-identifier=%{public}@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v11 = [(SXEmbedComponentView *)self layoutInvalidator];
  CGRect v12 = [(SXComponentView *)self component];
  [(SXEmbedComponentView *)self bounds];
  id v13 = (id)objc_msgSend(v11, "invalidateComponent:suggestedSize:", v12, CGRectGetWidth(v23), height);

  -[SXEmbedComponentView setCurrentlyLayoutingForSize:](self, "setCurrentlyLayoutingForSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  -[SXEmbedComponentView setCurrentLayoutSize:](self, "setCurrentLayoutSize:", width, height);
  double v14 = [(SXComponentView *)self viewport];
  [v14 bounds];
  -[SXEmbedComponentView setCurrentViewportSize:](self, "setCurrentViewportSize:", v15, v16);

  -[SXEmbedComponentView layoutWebViewForSize:](self, "layoutWebViewForSize:", width, height);
  [(SXEmbedComponentView *)self reportLoadEventWithError:0];
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 appearState])
  {
    if ([v6 appearState] == 2) {
      [(SXEmbedComponentView *)self prewarmWebView];
    }
  }
  else
  {
    objc_super v5 = [(SXEmbedComponentView *)self webView];
    [v5 pauseAllMediaPlaybackWithCompletionHandler:0];
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  *(void *)&v91[13] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 name];
  int v7 = [v6 isEqualToString:@"ANFExpect"];

  if (v7)
  {
    id v8 = [v5 body];

    if (v8)
    {
      uint64_t v9 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        uint64_t v11 = [v5 body];
        CGRect v12 = [(SXComponentView *)self component];
        id v13 = [v12 identifier];
        int v88 = 138543618;
        v89 = v11;
        __int16 v90 = 2114;
        *(void *)v91 = v13;
        _os_log_impl(&dword_222AC5000, v10, OS_LOG_TYPE_DEFAULT, "Expect message received: %{public}@, component-identifier=%{public}@", (uint8_t *)&v88, 0x16u);
      }
      double v14 = [(SXEmbedComponentView *)self expectedMessages];
      double v15 = [v5 body];
      [v14 addObject:v15];
    }
    goto LABEL_53;
  }
  double v16 = [v5 name];
  int v17 = [v16 isEqualToString:@"ANFDone"];

  if (!v17)
  {
    uint64_t v38 = [v5 name];
    int v39 = [v38 isEqualToString:@"ANFUpdate"];

    if (v39)
    {
      CGRect v40 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = v40;
        id v42 = [v5 body];
        id v43 = [(SXComponentView *)self component];
        id v44 = [v43 identifier];
        int v88 = 138543618;
        v89 = v42;
        __int16 v90 = 2114;
        *(void *)v91 = v44;
        _os_log_impl(&dword_222AC5000, v41, OS_LOG_TYPE_DEFAULT, "Update message received: %{public}@, component-identifier=%{public}@", (uint8_t *)&v88, 0x16u);
      }
      v45 = [v5 body];
      v46 = [v45 objectForKey:@"height"];

      if (v46)
      {
        [v46 floatValue];
        if (v47 != 0.0)
        {
          double v48 = v47;
          [(SXComponentView *)self contentFrame];
          double v50 = v49;
          v51 = [(SXEmbedComponentView *)self embedConfiguration];
          [v51 maximumWidth];
          double v53 = v52;

          if (v50 >= v53) {
            double v50 = v53;
          }
          [(SXEmbedComponentView *)self initialScale];
          double v55 = ceil(v54 * v48);
          [(SXEmbedComponentView *)self currentLayoutSize];
          if (v50 != v57 || v55 != v56) {
            -[SXEmbedComponentView finalizeLayoutForSize:](self, "finalizeLayoutForSize:", v50, v55);
          }
        }
      }
    }
    else
    {
      uint64_t v58 = [v5 name];
      int v59 = [v58 isEqualToString:@"ANFFailed"];

      if (!v59) {
        goto LABEL_53;
      }
      v60 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        v61 = v60;
        v62 = [v5 body];
        v63 = [(SXComponentView *)self component];
        v64 = [v63 identifier];
        int v88 = 138543618;
        v89 = v62;
        __int16 v90 = 2114;
        *(void *)v91 = v64;
        _os_log_impl(&dword_222AC5000, v61, OS_LOG_TYPE_DEFAULT, "Failed message received: %{public}@, component-identifier=%{public}@", (uint8_t *)&v88, 0x16u);
      }
      v46 = [MEMORY[0x263F087E8] unknownError];
      [(SXEmbedComponentView *)self handleError:v46];
    }

    goto LABEL_53;
  }
  v18 = [v5 body];

  if (v18)
  {
    __int16 v19 = (void *)SXEmbedLog;
    if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = v19;
      uint64_t v21 = [v5 body];
      CGSize v22 = [(SXEmbedComponentView *)self expectedMessages];
      CGRect v23 = [v5 body];
      int v24 = [v22 containsObject:v23];
      id v25 = [(SXComponentView *)self component];
      double v26 = [v25 identifier];
      int v88 = 138543874;
      v89 = v21;
      __int16 v90 = 1024;
      *(_DWORD *)v91 = v24;
      v91[2] = 2114;
      *(void *)&v91[3] = v26;
      _os_log_impl(&dword_222AC5000, v20, OS_LOG_TYPE_DEFAULT, "Done message received: %{public}@, expected=%d, component-identifier=%{public}@", (uint8_t *)&v88, 0x1Cu);
    }
    double v27 = [v5 body];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    double v29 = [v5 body];
    double v30 = v29;
    if (isKindOfClass)
    {
      double v31 = [v29 objectForKey:@"key"];

      if (v31)
      {
        v32 = [(SXEmbedComponentView *)self expectedMessages];
        int v33 = [v32 containsObject:v31];

        if (v33)
        {
          v34 = [v5 body];
          id v35 = [v34 objectForKey:@"height"];

          if (v35)
          {
            [v35 floatValue];
            double v37 = v36;
          }
          else
          {
            double v37 = 1.79769313e308;
          }
          v68 = [(SXEmbedComponentView *)self expectedMessages];
          [v68 removeObject:v31];

LABEL_39:
          int v33 = 1;
          goto LABEL_40;
        }
      }
      else
      {
        int v33 = 0;
      }
      double v37 = 1.79769313e308;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v65 = [(SXEmbedComponentView *)self expectedMessages];
        v66 = [v5 body];
        int v67 = [v65 containsObject:v66];

        if (!v67)
        {
          int v33 = 1;
          double v37 = 1.79769313e308;
LABEL_41:
          v69 = [(SXEmbedComponentView *)self expectedMessages];
          uint64_t v70 = [v69 count];

          if (v33 && !v70)
          {
            v71 = (void *)SXEmbedLog;
            if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
            {
              v72 = v71;
              v73 = [(SXComponentView *)self component];
              v74 = [v73 identifier];
              int v88 = 138543362;
              v89 = v74;
              _os_log_impl(&dword_222AC5000, v72, OS_LOG_TYPE_DEFAULT, "No more messages expected, finalizing layout, component-identifier=%{public}@", (uint8_t *)&v88, 0xCu);
            }
            if (v37 == 1.79769313e308)
            {
              v75 = [(SXEmbedComponentView *)self webView];
              v76 = [v75 scrollView];
              [v76 contentSize];
              double v37 = v77;
            }
            v78 = [v5 body];
            v79 = [v78 objectForKey:@"width"];
            [v79 floatValue];
            float v81 = v80;

            if (v81 == 0.0)
            {
              [(SXComponentView *)self contentFrame];
              double v83 = v82;
              v84 = [(SXEmbedComponentView *)self embedConfiguration];
              [v84 maximumWidth];
              double v86 = v85;

              if (v83 >= v86) {
                double v83 = v86;
              }
            }
            else
            {
              double v83 = v81;
            }
            [(SXEmbedComponentView *)self initialScale];
            -[SXEmbedComponentView finalizeLayoutForSize:](self, "finalizeLayoutForSize:", v83, ceil(v37 * v87));
            [(SXEmbedComponentView *)self reportLoadEventWithError:0];
          }
          goto LABEL_53;
        }
        double v31 = [(SXEmbedComponentView *)self expectedMessages];
        id v35 = [v5 body];
        [v31 removeObject:v35];
        double v37 = 1.79769313e308;
        goto LABEL_39;
      }
      int v33 = 1;
      double v37 = 1.79769313e308;
      double v31 = v30;
    }
LABEL_40:

    goto LABEL_41;
  }
LABEL_53:
}

- (void)handleError:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v7 = [(SXComponentView *)self component];
    id v8 = [v7 identifier];
    int v23 = 138543618;
    id v24 = v4;
    __int16 v25 = 2114;
    double v26 = v8;
    _os_log_impl(&dword_222AC5000, v6, OS_LOG_TYPE_DEFAULT, "Received error while attempting to load embed: %{public}@, component-identifier=%{public}@", (uint8_t *)&v23, 0x16u);
  }
  uint64_t v9 = [(SXEmbedComponentView *)self layoutInvalidator];
  id v10 = [(SXComponentView *)self component];
  [v9 cancelPendingInvalidationForComponent:v10];

  [(SXEmbedComponentView *)self setFailedLoading:1];
  [(SXEmbedComponentView *)self showActivityIndicator:0];
  id v11 = objc_alloc(MEMORY[0x263F1C768]);
  CGRect v12 = [(SXComponentView *)self contentView];
  [v12 bounds];
  double Width = CGRectGetWidth(v28);
  double v14 = [(SXComponentView *)self contentView];
  [v14 bounds];
  double v15 = objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v29));
  [(SXEmbedComponentView *)self setErrorLabel:v15];

  double v16 = [(SXEmbedComponentView *)self errorLabel];
  [v16 setNumberOfLines:0];

  int v17 = [(SXEmbedComponentView *)self errorLabel];
  [v17 setTextAlignment:1];

  v18 = [(SXEmbedComponentView *)self errorLabel];
  __int16 v19 = [(SXEmbedComponentView *)self unableToLoadMessage];
  [v18 setText:v19];

  double v20 = [(SXComponentView *)self contentView];
  uint64_t v21 = [(SXEmbedComponentView *)self errorLabel];
  [v20 addSubview:v21];

  [(SXEmbedComponentView *)self removeScriptMessageHandlers];
  CGSize v22 = [(SXEmbedComponentView *)self webView];
  [v22 removeFromSuperview];

  [(SXEmbedComponentView *)self setWebView:0];
  [(SXEmbedComponentView *)self reportLoadEventWithError:v4];
}

- (id)unableToLoadMessage
{
  v2 = SXBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"Couldn’t Load Content" value:&stru_26D5311C0 table:0];

  return v3;
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = v14;
    double v16 = [v12 request];
    int v17 = [v16 URL];
    v18 = [(SXComponentView *)self component];
    __int16 v19 = [v18 identifier];
    int v31 = 138543618;
    v32 = v17;
    __int16 v33 = 2114;
    v34 = v19;
    _os_log_impl(&dword_222AC5000, v15, OS_LOG_TYPE_DEFAULT, "Navigating to URL %{public}@ in reponse to new window for component-identifier=%{public}@", (uint8_t *)&v31, 0x16u);
  }
  double v20 = [v12 request];
  uint64_t v21 = [v20 URL];
  CGSize v22 = [v21 absoluteString];
  char v23 = [v22 isEqualToString:@"about:blank"];

  if ((v23 & 1) == 0)
  {
    id v24 = [SXLinkAction alloc];
    __int16 v25 = [v12 request];
    double v26 = [v25 URL];
    uint64_t v27 = [(SXLinkAction *)v24 initWithURL:v26];

    CGRect v28 = [(SXEmbedComponentView *)self actionHandler];
    CGRect v29 = [(SXEmbedComponentView *)self webView];
    [v29 frame];
    objc_msgSend(v28, "handleAction:sourceView:sourceRect:invocationType:", v27, self, 0);
  }
  return 0;
}

- (void)_webViewDidExitFullscreen:(id)a3
{
  id v4 = a3;
  if (![(SXEmbedComponentView *)self usingElementFullscreen]) {
    [(SXEmbedComponentView *)self webViewExitedFullscreen:v4];
  }
}

- (void)_webViewDidEnterElementFullscreen:(id)a3
{
  [(SXEmbedComponentView *)self webViewEnteredFullscreen:a3];
  [(SXEmbedComponentView *)self setUsingElementFullscreen:1];
}

- (void)_webViewDidExitElementFullscreen:(id)a3
{
  [(SXEmbedComponentView *)self webViewExitedFullscreen:a3];
  [(SXEmbedComponentView *)self setUsingElementFullscreen:0];
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v7 = [(SXComponentView *)self component];
    id v8 = [v7 identifier];
    int v16 = 138543362;
    int v17 = v8;
    _os_log_impl(&dword_222AC5000, v6, OS_LOG_TYPE_DEFAULT, "Web view crashed, attempting reload, component-identifier=%{public}@", (uint8_t *)&v16, 0xCu);
  }
  id v9 = [(SXEmbedComponentView *)self webView];

  if (v9 == v4)
  {
    [(SXEmbedComponentView *)self showActivityIndicator:1];
    id v10 = [(SXEmbedComponentView *)self webCrashRetryThrottler];
    int v11 = [v10 shouldReloadAfterWebProcessCrash];

    if (v11)
    {
      [(SXEmbedComponentView *)self removeScriptMessageHandlers];
      [(SXEmbedComponentView *)self reloadEmbed];
    }
    else
    {
      id v12 = (void *)SXEmbedLog;
      if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        double v14 = [(SXComponentView *)self component];
        double v15 = [v14 identifier];
        int v16 = 138543362;
        int v17 = v15;
        _os_log_impl(&dword_222AC5000, v13, OS_LOG_TYPE_DEFAULT, "Stopped reloading after crash, threshold reached, component-identifier=%{public}@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9 && [v9 code] != -999 && objc_msgSend(v10, "code") != -1002) {
    [(SXEmbedComponentView *)self handleError:v10];
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9 && [v9 code] != -999 && objc_msgSend(v10, "code") != -1002) {
    [(SXEmbedComponentView *)self handleError:v10];
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5 = a4;
  id v6 = [(SXEmbedComponentView *)self initialNavigation];

  if (v6 == v5)
  {
    int v7 = [(SXComponentView *)self contentView];
    id v8 = [(SXEmbedComponentView *)self webView];
    [v7 addSubview:v8];

    [(SXEmbedComponentView *)self setInitialNavigation:0];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  int v17 = __80__SXEmbedComponentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  uint64_t v18 = &unk_2646536A8;
  id v11 = v9;
  id v19 = v11;
  double v20 = self;
  id v12 = v8;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  double v14 = (void (**)(void))MEMORY[0x223CA5030](&v15);
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v15, v16, v17, v18)) {
    v14[2](v14);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
}

void __80__SXEmbedComponentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) targetFrame];
  if (![v2 isMainFrame]) {
    goto LABEL_6;
  }
  uint64_t v3 = [*(id *)(a1 + 32) request];
  id v4 = [v3 URL];
  id v5 = [v4 absoluteString];
  if ([v5 isEqualToString:@"about:blank"])
  {
LABEL_5:

LABEL_6:
LABEL_7:
    id v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v10();
    return;
  }
  id v6 = [*(id *)(a1 + 32) targetFrame];
  int v7 = [v6 request];
  id v8 = [v7 URL];
  id v9 = [v8 absoluteString];
  if ([v9 isEqualToString:@"about:blank"])
  {

    goto LABEL_5;
  }
  uint64_t v35 = [*(id *)(a1 + 32) targetFrame];
  v34 = [v35 request];
  id v11 = [v34 URL];
  if (v11)
  {
    id v33 = v11;
    id v12 = *(void **)(a1 + 40);
    v32 = [*(id *)(a1 + 32) request];
    int v31 = [v32 URL];
    if (objc_msgSend(v12, "shouldAllowRequestToURL:"))
    {
      id v13 = [*(id *)(a1 + 48) superview];
      if (v13)
      {
        double v14 = v13;
        [*(id *)(a1 + 48) alpha];
        id v13 = v14;
        BOOL v16 = v15 > 0.0;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }

    id v11 = v33;
  }
  else
  {
    BOOL v16 = 0;
  }

  if (!v16) {
    goto LABEL_7;
  }
  int v17 = (void *)SXEmbedLog;
  if (os_log_type_enabled((os_log_t)SXEmbedLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void **)(a1 + 32);
    id v19 = v17;
    double v20 = [v18 request];
    id v21 = [v20 URL];
    id v22 = [*(id *)(a1 + 40) component];
    char v23 = [v22 identifier];
    *(_DWORD *)buf = 138543618;
    double v37 = v21;
    __int16 v38 = 2114;
    int v39 = v23;
    _os_log_impl(&dword_222AC5000, v19, OS_LOG_TYPE_DEFAULT, "Navigating to URL %{public}@ in response to navigation action for component-identifier=%{public}@", buf, 0x16u);
  }
  id v24 = [SXLinkAction alloc];
  __int16 v25 = [*(id *)(a1 + 32) request];
  double v26 = [v25 URL];
  uint64_t v27 = [(SXLinkAction *)v24 initWithURL:v26];

  CGRect v28 = [*(id *)(a1 + 40) actionHandler];
  CGRect v29 = [*(id *)(a1 + 40) contentView];
  double v30 = [*(id *)(a1 + 40) webView];
  [v30 frame];
  objc_msgSend(v28, "handleAction:sourceView:sourceRect:invocationType:", v27, v29, 0);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SXEmbedComponentView *)self proxyAuthenticationHandler];
  [v9 handleAuthenticationChallenge:v8 completion:v7];
}

- (BOOL)shouldAllowRequestToURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  if ([v4 isEqualToString:@"http"])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 scheme];
    char v5 = [v6 isEqualToString:@"https"];
  }
  id v7 = [v3 absoluteString];
  char v8 = [v7 isEqualToString:@"about:blank"];

  return v5 | v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v4 = [a3 pinchGestureRecognizer];
  [v4 setEnabled:0];
}

- (id)enclosingHTML
{
  id v3 = [(SXEmbedComponentView *)self embedConfiguration];
  id v4 = [v3 enclosingHTML];

  if ([v4 containsString:@"{initial_scale}"])
  {
    [(SXEmbedComponentView *)self initialScale];
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%f", v5);
    uint64_t v7 = [v4 stringByReplacingOccurrencesOfString:@"{initial_scale}" withString:v6];

    id v4 = (void *)v7;
  }
  return v4;
}

- (id)HTMLByEnclosingHTML:(id)a3 withHTML:(id)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", a4, a3);
}

- (double)initialScale
{
  [(SXComponentView *)self contentFrame];
  double Width = CGRectGetWidth(v9);
  id v4 = [(SXEmbedComponentView *)self embedConfiguration];
  [v4 minimumWidth];
  double v6 = v5;

  if (v6 >= 1.0) {
    double v7 = v6;
  }
  else {
    double v7 = 1.0;
  }
  return fmin(Width / v7, 1.0);
}

- (SXEmbedType)embedConfiguration
{
  embedConfiguration = self->_embedConfiguration;
  if (!embedConfiguration)
  {
    id v4 = [(SXEmbedComponentView *)self embedDataProvider];
    double v5 = [(SXComponentView *)self component];
    double v6 = [v5 embedType];
    double v7 = [v4 embedForType:v6];
    char v8 = self->_embedConfiguration;
    self->_embedConfiguration = v7;

    embedConfiguration = self->_embedConfiguration;
  }
  return embedConfiguration;
}

- (BOOL)shouldLayoutWebView
{
  [(SXEmbedComponentView *)self currentLayoutSize];
  double v4 = v3;
  [(SXComponentView *)self contentFrame];
  if (v4 == v5) {
    return 0;
  }
  double v6 = [(SXEmbedComponentView *)self webView];
  if (v6)
  {
    double v7 = [(SXEmbedComponentView *)self HTML];
    if (v7 && [(SXComponentView *)self hasRenderedContents])
    {
      [(SXEmbedComponentView *)self currentlyLayoutingForSize];
      double v9 = v8;
      double v11 = v10;
      [(SXComponentView *)self contentFrame];
      BOOL v14 = v11 != v13 || v9 != v12;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)shouldShowWebView
{
  [(SXEmbedComponentView *)self currentLayoutSize];
  double v4 = v3;
  [(SXComponentView *)self contentFrame];
  if (v4 == v5)
  {
    double v6 = [(SXEmbedComponentView *)self webView];
    if (v6) {
      BOOL v7 = ![(SXEmbedComponentView *)self failedLoading];
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)hasLoadedEmbedData
{
  double v3 = [(SXEmbedComponentView *)self HTML];
  if (v3)
  {
    double v4 = [(SXEmbedComponentView *)self userScript];
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = [(SXEmbedComponentView *)self failedLoading];
    }
  }
  else
  {
    BOOL v5 = [(SXEmbedComponentView *)self failedLoading];
  }

  return v5;
}

- (void)showActivityIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SXEmbedComponentView *)self activityIndicator];

  if (v3)
  {
    if (!v5)
    {
      double v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
      activityIndicator = self->_activityIndicator;
      self->_activityIndicator = v6;

      [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
      double v8 = [(SXComponentView *)self contentView];
      [v8 addSubview:self->_activityIndicator];
    }
    double v9 = [(SXEmbedComponentView *)self activityIndicator];
    double v10 = [(SXComponentView *)self contentView];
    [v10 bounds];
    double MidX = CGRectGetMidX(v15);
    double v12 = [(SXComponentView *)self contentView];
    [v12 bounds];
    objc_msgSend(v9, "setCenter:", MidX, CGRectGetMidY(v16));

    id v13 = [(SXEmbedComponentView *)self activityIndicator];
    [v13 startAnimating];
  }
  else
  {
    if (!v5) {
      return;
    }
    id v13 = [(SXEmbedComponentView *)self activityIndicator];
    [v13 stopAnimating];
  }
}

- (SXEmbedResource)embedResource
{
  embedResource = self->_embedResource;
  if (!embedResource)
  {
    double v4 = [(SXComponentView *)self DOMObjectProvider];
    BOOL v5 = [(SXComponentView *)self component];
    double v6 = [v5 resourceIdentifier];
    BOOL v7 = [v4 resourceForIdentifier:v6];
    double v8 = self->_embedResource;
    self->_embedResource = v7;

    embedResource = self->_embedResource;
  }
  return embedResource;
}

- (unint64_t)userActionMediaTypes
{
  v2 = [(SXEmbedComponentView *)self embedConfiguration];
  uint64_t v3 = [v2 autoPlayMedia];

  if ((unint64_t)(v3 + 1) > 3) {
    return -1;
  }
  else {
    return qword_222BEF5C0[v3 + 1];
  }
}

- (void)addScriptMessageHandlers
{
  if (![(SXEmbedComponentView *)self hasRegisteredScriptMessageHandlers])
  {
    uint64_t v3 = [(SXEmbedComponentView *)self webView];
    double v4 = [v3 configuration];
    id v9 = [v4 userContentController];

    BOOL v5 = [(SXEmbedComponentView *)self scriptMessageHandler];
    [v9 addScriptMessageHandler:v5 name:@"ANFExpect"];

    double v6 = [(SXEmbedComponentView *)self scriptMessageHandler];
    [v9 addScriptMessageHandler:v6 name:@"ANFDone"];

    BOOL v7 = [(SXEmbedComponentView *)self scriptMessageHandler];
    [v9 addScriptMessageHandler:v7 name:@"ANFUpdate"];

    double v8 = [(SXEmbedComponentView *)self scriptMessageHandler];
    [v9 addScriptMessageHandler:v8 name:@"ANFFailed"];

    [(SXEmbedComponentView *)self setHasRegisteredScriptMessageHandlers:1];
  }
}

- (void)removeScriptMessageHandlers
{
  if ([(SXEmbedComponentView *)self hasRegisteredScriptMessageHandlers])
  {
    uint64_t v3 = [(SXEmbedComponentView *)self webView];
    double v4 = [v3 configuration];
    id v5 = [v4 userContentController];

    [v5 removeScriptMessageHandlerForName:@"ANFExpect"];
    [v5 removeScriptMessageHandlerForName:@"ANFDone"];
    [v5 removeScriptMessageHandlerForName:@"ANFUpdate"];
    [v5 removeScriptMessageHandlerForName:@"ANFFailed"];
    [(SXEmbedComponentView *)self setHasRegisteredScriptMessageHandlers:0];
  }
}

- (BOOL)allowHierarchyRemoval
{
  v6.receiver = self;
  v6.super_class = (Class)SXEmbedComponentView;
  BOOL v3 = [(SXComponentView *)&v6 allowHierarchyRemoval];
  double v4 = [(SXEmbedComponentView *)self webViewPresentingInFullscreen];

  return !v4 && v3;
}

- (void)webViewEnteredFullscreen:(id)a3
{
  [(SXEmbedComponentView *)self setWebViewPresentingInFullscreen:a3];
  [(SXEmbedComponentView *)self setWebView:0];
  id v4 = [(SXComponentView *)self presentationDelegate];
  [v4 willReturnToFullscreenForComponent:self];
}

- (void)webViewExitedFullscreen:(id)a3
{
  id v4 = [(SXEmbedComponentView *)self webView];

  id v5 = [(SXEmbedComponentView *)self webViewPresentingInFullscreen];
  objc_super v6 = v5;
  if (v4) {
    [v5 removeFromSuperview];
  }
  else {
    [(SXEmbedComponentView *)self setWebView:v5];
  }

  [(SXEmbedComponentView *)self setWebViewPresentingInFullscreen:0];
  id v7 = [(SXComponentView *)self presentationDelegate];
  [v7 willDismissFullscreenCanvasForComponent:self];
}

- (void)reportLoadEventWithError:(id)a3
{
  id v9 = a3;
  id v4 = [(SXEmbedComponentView *)self loadEvent];

  if (v4)
  {
    id v5 = [(SXEmbedComponentView *)self loadEvent];
    [v5 setError:v9];

    objc_super v6 = [(SXEmbedComponentView *)self loadEvent];
    [v6 determineEndDate];

    id v7 = [(SXEmbedComponentView *)self analyticsReporting];
    double v8 = [(SXEmbedComponentView *)self loadEvent];
    [v7 reportEvent:v8];

    [(SXEmbedComponentView *)self setLoadEvent:0];
  }
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXEmbedDataProvider)embedDataProvider
{
  return self->_embedDataProvider;
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXLayoutInvalidator)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (void)setEmbedConfiguration:(id)a3
{
}

- (void)setEmbedResource:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (SWCrashRetryThrottler)webCrashRetryThrottler
{
  return self->_webCrashRetryThrottler;
}

- (void)setWebCrashRetryThrottler:(id)a3
{
}

- (WKWebView)webViewPresentingInFullscreen
{
  return self->_webViewPresentingInFullscreen;
}

- (void)setWebViewPresentingInFullscreen:(id)a3
{
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
}

- (NSString)HTML
{
  return self->_HTML;
}

- (void)setHTML:(id)a3
{
}

- (NSString)userScript
{
  return self->_userScript;
}

- (void)setUserScript:(id)a3
{
}

- (NSMutableSet)expectedMessages
{
  return self->_expectedMessages;
}

- (void)setExpectedMessages:(id)a3
{
}

- (BOOL)failedLoading
{
  return self->_failedLoading;
}

- (void)setFailedLoading:(BOOL)a3
{
  self->_failedLoading = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (CGSize)currentlyLayoutingForSize
{
  double width = self->_currentlyLayoutingForSize.width;
  double height = self->_currentlyLayoutingForSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentlyLayoutingForSize:(CGSize)a3
{
  self->_currentlyLayoutingForSize = a3;
}

- (CGSize)currentLayoutSize
{
  double width = self->_currentLayoutSize.width;
  double height = self->_currentLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentLayoutSize:(CGSize)a3
{
  self->_currentLayoutSize = a3;
}

- (CGSize)currentViewportSize
{
  double width = self->_currentViewportSize.width;
  double height = self->_currentViewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentViewportSize:(CGSize)a3
{
  self->_currentViewportSize = a3;
}

- (WKNavigation)initialNavigation
{
  return self->_initialNavigation;
}

- (void)setInitialNavigation:(id)a3
{
}

- (BOOL)hasRegisteredScriptMessageHandlers
{
  return self->_hasRegisteredScriptMessageHandlers;
}

- (void)setHasRegisteredScriptMessageHandlers:(BOOL)a3
{
  self->_hasRegisteredScriptMessageHandlers = a3;
}

- (TFMultiDelegate)scriptMessageHandler
{
  return self->_scriptMessageHandler;
}

- (WKWebsiteDataStore)dataStore
{
  return self->_dataStore;
}

- (SXRelatedWebViewCache)relatedWebViewCache
{
  return self->_relatedWebViewCache;
}

- (SXProxyAuthenticationHandler)proxyAuthenticationHandler
{
  return self->_proxyAuthenticationHandler;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (SXAnalyticsReporting)analyticsReporting
{
  return self->_analyticsReporting;
}

- (BOOL)usingElementFullscreen
{
  return self->_usingElementFullscreen;
}

- (void)setUsingElementFullscreen:(BOOL)a3
{
  self->_usingElementFullscreen = a3;
}

- (SXWebContentLoadEvent)loadEvent
{
  return self->_loadEvent;
}

- (void)setLoadEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadEvent, 0);
  objc_storeStrong((id *)&self->_analyticsReporting, 0);
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_proxyAuthenticationHandler, 0);
  objc_storeStrong((id *)&self->_relatedWebViewCache, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_scriptMessageHandler, 0);
  objc_storeStrong((id *)&self->_initialNavigation, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_expectedMessages, 0);
  objc_storeStrong((id *)&self->_userScript, 0);
  objc_storeStrong((id *)&self->_HTML, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_webViewPresentingInFullscreen, 0);
  objc_storeStrong((id *)&self->_webCrashRetryThrottler, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_embedResource, 0);
  objc_storeStrong((id *)&self->_embedConfiguration, 0);
  objc_storeStrong((id *)&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_embedDataProvider, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
}

@end