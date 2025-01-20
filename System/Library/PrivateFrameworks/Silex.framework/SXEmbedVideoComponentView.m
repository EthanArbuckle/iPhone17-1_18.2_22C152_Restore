@interface SXEmbedVideoComponentView
+ (id)sharedConfiguration;
- (BOOL)allowHierarchyRemoval;
- (BOOL)isPresentingFullscreen;
- (BOOL)shouldAllowRequestToURL:(id)a3;
- (BOOL)webViewIsLoaded;
- (CGRect)transitionContentFrame;
- (SWCrashRetryThrottler)webCrashRetryThrottler;
- (SXComponentActionHandler)actionHandler;
- (SXEmbedVideoComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 actionHandler:(id)a10 websiteDataStore:(id)a11 proxyAuthenticationHandler:(id)a12;
- (SXProxyAuthenticationHandler)proxyAuthenticationHandler;
- (SXSceneStateMonitor)sceneStateMonitor;
- (SXWebContentLoadEvent)loadEvent;
- (UIActivityIndicatorView)activityIndicator;
- (WKWebView)webView;
- (WKWebsiteDataStore)dataStore;
- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6;
- (unint64_t)analyticsMediaType;
- (unint64_t)analyticsVideoType;
- (void)_webViewWebProcessDidCrash:(id)a3;
- (void)discardContents;
- (void)handleError:(id)a3;
- (void)initializeWebViewWithURL:(id)a3;
- (void)layoutSubviews;
- (void)presentComponentWithChanges:(id)a3;
- (void)renderContents;
- (void)reportLoadEventWithError:(id)a3;
- (void)setIsPresentingFullscreen:(BOOL)a3;
- (void)setLoadEvent:(id)a3;
- (void)setWebCrashRetryThrottler:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewIsLoaded:(BOOL)a3;
- (void)updateWebViewToWidth:(double)a3;
- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)webViewEnteredFullscreen:(id)a3;
- (void)webViewExitedFullscreen:(id)a3;
@end

@implementation SXEmbedVideoComponentView

- (SXEmbedVideoComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 actionHandler:(id)a10 websiteDataStore:(id)a11 proxyAuthenticationHandler:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v37 = a9;
  id v35 = a10;
  id v34 = a11;
  v32 = v17;
  id v33 = a12;
  v42.receiver = self;
  v42.super_class = (Class)SXEmbedVideoComponentView;
  v22 = [(SXMediaComponentView *)&v42 initWithDOMObjectProvider:v16 viewport:v17 presentationDelegate:v18 componentStyleRendererFactory:v19 analyticsReporting:v20 appStateMonitor:v21];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_actionHandler, a10);
    objc_storeStrong((id *)&v23->_dataStore, a11);
    objc_storeStrong((id *)&v23->_proxyAuthenticationHandler, a12);
    objc_storeStrong((id *)&v23->_sceneStateMonitor, a9);
    uint64_t v24 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    activityIndicator = v23->_activityIndicator;
    v23->_activityIndicator = (UIActivityIndicatorView *)v24;

    v26 = [(SXComponentView *)v23 contentView];
    [v26 addSubview:v23->_activityIndicator];

    v27 = [(SXComponentView *)v23 viewport];
    [v27 addViewportChangeListener:v23 forOptions:8];

    v28 = (SWCrashRetryThrottler *)objc_alloc_init(MEMORY[0x263F6C6D0]);
    webCrashRetryThrottler = v23->_webCrashRetryThrottler;
    v23->_webCrashRetryThrottler = v28;

    objc_initWeak(&location, v23);
    sceneStateMonitor = v23->_sceneStateMonitor;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __226__SXEmbedVideoComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_sceneStateMonitor_actionHandler_websiteDataStore_proxyAuthenticationHandler___block_invoke;
    v39[3] = &unk_264651108;
    objc_copyWeak(&v40, &location);
    [(SXSceneStateMonitor *)sceneStateMonitor performOnSceneDidDisconnect:v39];
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v23;
}

void __226__SXEmbedVideoComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_sceneStateMonitor_actionHandler_websiteDataStore_proxyAuthenticationHandler___block_invoke(uint64_t a1)
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

- (void)presentComponentWithChanges:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXEmbedVideoComponentView;
  [(SXComponentView *)&v5 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  if ([(SXEmbedVideoComponentView *)self webViewIsLoaded])
  {
    v4 = [(SXEmbedVideoComponentView *)self webView];
    [v4 frame];
    [(SXEmbedVideoComponentView *)self updateWebViewToWidth:CGRectGetWidth(v6)];
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SXEmbedVideoComponentView;
  [(SXEmbedVideoComponentView *)&v7 layoutSubviews];
  id v3 = [(SXEmbedVideoComponentView *)self activityIndicator];
  v4 = [(SXComponentView *)self contentView];
  [v4 bounds];
  double MidX = CGRectGetMidX(v8);
  CGRect v6 = [(SXComponentView *)self contentView];
  [v6 bounds];
  objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v9));
}

- (void)renderContents
{
  v6.receiver = self;
  v6.super_class = (Class)SXEmbedVideoComponentView;
  [(SXComponentView *)&v6 renderContents];
  if (![(SXEmbedVideoComponentView *)self webViewIsLoaded])
  {
    id v3 = [(SXEmbedVideoComponentView *)self activityIndicator];
    [v3 startAnimating];

    v4 = [(SXComponentView *)self component];
    objc_super v5 = [v4 URL];
    [(SXEmbedVideoComponentView *)self initializeWebViewWithURL:v5];
  }
}

- (void)discardContents
{
  v4.receiver = self;
  v4.super_class = (Class)SXEmbedVideoComponentView;
  [(SXComponentView *)&v4 discardContents];
  if (![(SXEmbedVideoComponentView *)self isPresentingFullscreen])
  {
    id v3 = [(SXEmbedVideoComponentView *)self webView];
    [v3 removeFromSuperview];

    [(SXEmbedVideoComponentView *)self setWebView:0];
    [(SXEmbedVideoComponentView *)self setWebViewIsLoaded:0];
  }
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  if (![a3 appearState])
  {
    id v5 = [(SXEmbedVideoComponentView *)self webView];
    [v5 pauseAllMediaPlaybackWithCompletionHandler:0];
  }
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1) {
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_93);
  }
  v2 = (void *)sharedConfiguration_configuration;
  return v2;
}

void __48__SXEmbedVideoComponentView_sharedConfiguration__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F1FA60]);
  v1 = (void *)sharedConfiguration_configuration;
  sharedConfiguration_configuration = (uint64_t)v0;

  [(id)sharedConfiguration_configuration setAllowsInlineMediaPlayback:1];
  [(id)sharedConfiguration_configuration setMediaTypesRequiringUserActionForPlayback:-1];
  [(id)sharedConfiguration_configuration setAllowsAirPlayForMediaPlayback:0];
  [(id)sharedConfiguration_configuration setAllowsPictureInPictureMediaPlayback:0];
  v2 = (void *)sharedConfiguration_configuration;
  id v3 = objc_alloc_init(MEMORY[0x263F1FA38]);
  [v2 setUserContentController:v3];

  objc_super v4 = (void *)sharedConfiguration_configuration;
  id v5 = [MEMORY[0x263F1FA28] embedProcessPool];
  [v4 setProcessPool:v5];

  [(id)sharedConfiguration_configuration _setWaitsForPaintAfterViewDidMoveToWindow:0];
  id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1FA40]), "initWithSource:injectionTime:forMainFrameOnly:", @"document.body.style.webkitUserSelect = 'none';",
              1,
              0);
  objc_super v6 = [(id)sharedConfiguration_configuration userContentController];
  [v6 addUserScript:v10];

  id v7 = objc_alloc_init(MEMORY[0x263F1FA20]);
  [v7 _setShouldAllowUserInstalledFonts:0];
  [v7 setTextInteractionEnabled:0];
  CGRect v8 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 == 1) {
    [v7 _setFullScreenEnabled:1];
  }
  [(id)sharedConfiguration_configuration setPreferences:v7];
}

- (void)initializeWebViewWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SXEmbedVideoComponentView *)self webView];

  if (!v5)
  {
    objc_super v6 = [(id)objc_opt_class() sharedConfiguration];
    id v7 = [(SXEmbedVideoComponentView *)self dataStore];
    [v6 setWebsiteDataStore:v7];

    id v8 = objc_alloc(MEMORY[0x263F1FA58]);
    uint64_t v9 = [(SXComponentView *)self contentView];
    [v9 bounds];
    id v10 = (WKWebView *)objc_msgSend(v8, "initWithFrame:configuration:", v6);
    webView = self->_webView;
    self->_webView = v10;

    v12 = [(SXEmbedVideoComponentView *)self webView];
    v13 = [v12 scrollView];
    [v13 setScrollsToTop:0];

    v14 = [(SXEmbedVideoComponentView *)self webView];
    v15 = [v14 scrollView];
    [v15 setContentInsetAdjustmentBehavior:2];

    id v16 = [(SXEmbedVideoComponentView *)self webView];
    id v17 = [v16 scrollView];
    [v17 setScrollEnabled:0];

    id v18 = [(SXEmbedVideoComponentView *)self webView];
    id v19 = [v18 scrollView];
    [v19 setBounces:0];

    id v20 = [(SXEmbedVideoComponentView *)self webView];
    [v20 setAutoresizingMask:18];

    id v21 = [(SXEmbedVideoComponentView *)self webView];
    [v21 setNavigationDelegate:self];

    v22 = [(SXEmbedVideoComponentView *)self webView];
    [v22 setUIDelegate:self];

    v23 = [(SXEmbedVideoComponentView *)self webView];
    [v23 _setFullscreenDelegate:self];

    uint64_t v24 = [(SXEmbedVideoComponentView *)self webView];
    [v24 setHidden:1];

    v25 = [(SXEmbedVideoComponentView *)self webView];
    [v25 setAlpha:0.0];

    v26 = [(SXComponentView *)self contentView];
    v27 = [(SXEmbedVideoComponentView *)self webView];
    [v26 addSubview:v27];
  }
  v28 = [[SXWebContentLoadEvent alloc] initWithURL:v4];
  [(SXEmbedVideoComponentView *)self setLoadEvent:v28];

  v29 = NSString;
  v30 = [v4 scheme];
  v31 = [v4 host];
  id v46 = [v29 stringWithFormat:@"%@://%@", v30, v31];

  v32 = [NSURL URLWithString:v46];
  id v33 = [MEMORY[0x263EFC5E8] requestWithURL:v32];
  [v33 setAttribution:1];
  id v34 = NSString;
  [(SXComponentView *)self contentFrame];
  uint64_t v36 = v35;
  [(SXComponentView *)self contentFrame];
  uint64_t v38 = v37;
  [(SXComponentView *)self contentFrame];
  uint64_t v40 = v39;
  v41 = [v4 absoluteString];

  objc_msgSend(v34, "stringWithFormat:", @"<style>* {padding: 0; margin: 0}</style></style><meta name='viewport' content='width=%f, user-scalable=no, initial-scale=1, max-scale=1'><iframe width='%f' height='%f' src='%@' frameborder='0' allowfullscreen></iframe>",
    v36,
    v38,
    v40,
  objc_super v42 = v41);

  v43 = [(SXEmbedVideoComponentView *)self webView];
  id v44 = (id)[v43 loadSimulatedRequest:v33 responseHTMLString:v42];

  [(SXEmbedVideoComponentView *)self setWebViewIsLoaded:1];
  [(SXMediaComponentView *)self setIsDisplayingMedia:1];
  v45 = [(SXEmbedVideoComponentView *)self webView];
  [v45 frame];
  [(SXEmbedVideoComponentView *)self updateWebViewToWidth:CGRectGetWidth(v48)];
}

- (void)updateWebViewToWidth:(double)a3
{
  id v4 = NSString;
  [(SXComponentView *)self contentFrame];
  uint64_t v6 = (int)v5;
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v4, "stringWithFormat:", @"var iframe = document.getElementsByTagName('iframe')[0]; iframe.style.width = '%dpx'; iframe.style.height = '%dpx';",
    v6,
    (int)v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [(SXEmbedVideoComponentView *)self webView];
  [v8 evaluateJavaScript:v9 completionHandler:0];
}

- (CGRect)transitionContentFrame
{
  id v3 = [(SXEmbedVideoComponentView *)self webView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SXEmbedVideoComponentView *)self superview];
  -[SXEmbedVideoComponentView convertRect:toView:](self, "convertRect:toView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)handleError:(id)a3
{
  id v12 = a3;
  id v4 = objc_alloc(MEMORY[0x263F1C768]);
  [(SXEmbedVideoComponentView *)self bounds];
  CGFloat v5 = CGRectGetWidth(v14) + -20.0;
  [(SXEmbedVideoComponentView *)self bounds];
  double v6 = objc_msgSend(v4, "initWithFrame:", 10.0, 10.0, v5, CGRectGetHeight(v15) + -20.0);
  [v6 setNumberOfLines:0];
  [v6 setTextAlignment:1];
  double v7 = SXBundle();
  double v8 = [v7 localizedStringForKey:@"Couldn’t Load Content" value:&stru_26D5311C0 table:0];
  [v6 setText:v8];

  [(SXEmbedVideoComponentView *)self addSubview:v6];
  double v9 = [(SXEmbedVideoComponentView *)self activityIndicator];
  [v9 stopAnimating];

  double v10 = [(SXEmbedVideoComponentView *)self webView];
  [v10 removeFromSuperview];

  [(SXEmbedVideoComponentView *)self setWebView:0];
  if (v12)
  {
    [(SXEmbedVideoComponentView *)self reportLoadEventWithError:v12];
  }
  else
  {
    double v11 = [MEMORY[0x263F087E8] unknownError];
    [(SXEmbedVideoComponentView *)self reportLoadEventWithError:v11];
  }
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v7 = a5;
  double v8 = [SXLinkAction alloc];
  double v9 = [v7 request];

  double v10 = [v9 URL];
  double v11 = [(SXLinkAction *)v8 initWithURL:v10];

  id v12 = [(SXEmbedVideoComponentView *)self actionHandler];
  double v13 = [(SXEmbedVideoComponentView *)self webView];
  [v13 frame];
  objc_msgSend(v12, "handleAction:sourceView:sourceRect:invocationType:", v11, self, 0);

  return 0;
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  id v4 = a3;
  id v5 = [(SXEmbedVideoComponentView *)self webView];

  if (v5 == v4)
  {
    double v6 = [(SXEmbedVideoComponentView *)self webCrashRetryThrottler];
    int v7 = [v6 shouldReloadAfterWebProcessCrash];

    if (v7)
    {
      id v9 = [(SXComponentView *)self component];
      double v8 = [v9 URL];
      [(SXEmbedVideoComponentView *)self initializeWebViewWithURL:v8];
    }
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__SXEmbedVideoComponentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v12[3] = &unk_264654320;
  id v9 = v7;
  id v13 = v9;
  CGRect v14 = self;
  id v10 = v8;
  id v15 = v10;
  double v11 = (void (**)(void))MEMORY[0x223CA5030](v12);
  if ([MEMORY[0x263F08B88] isMainThread]) {
    v11[2](v11);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __85__SXEmbedVideoComponentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) navigationType])
  {
LABEL_6:
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v9();
    return;
  }
  v2 = [*(id *)(a1 + 32) request];
  id v3 = [v2 URL];
  id v4 = [v3 absoluteString];
  if ([v4 isEqualToString:@"about:blank"])
  {
LABEL_5:

    goto LABEL_6;
  }
  id v5 = [*(id *)(a1 + 32) targetFrame];
  double v6 = [v5 request];
  id v7 = [v6 URL];
  id v8 = [v7 absoluteString];
  if ([v8 isEqualToString:@"about:blank"])
  {

    goto LABEL_5;
  }
  id v18 = *(id *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) request];
  double v11 = [v10 URL];
  LODWORD(v18) = [v18 shouldAllowRequestToURL:v11];

  if (!v18) {
    goto LABEL_6;
  }
  id v12 = [SXLinkAction alloc];
  id v13 = [*(id *)(a1 + 32) request];
  CGRect v14 = [v13 URL];
  double v19 = [(SXLinkAction *)v12 initWithURL:v14];

  id v15 = [*(id *)(a1 + 40) actionHandler];
  double v16 = [*(id *)(a1 + 40) contentView];
  double v17 = [*(id *)(a1 + 40) webView];
  [v17 frame];
  objc_msgSend(v15, "handleAction:sourceView:sourceRect:invocationType:", v19, v16, 0);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
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
    double v6 = [v3 scheme];
    char v5 = [v6 isEqualToString:@"https"];
  }
  id v7 = [v3 absoluteString];
  char v8 = [v7 isEqualToString:@"about:blank"];

  return v5 | v8;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__SXEmbedVideoComponentView_webView_didFinishNavigation___block_invoke;
  v5[3] = &unk_2646511F8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x263F1CB60], "animateWithDuration:animations:", v5, a4, 0.15);
  [(SXEmbedVideoComponentView *)self reportLoadEventWithError:0];
}

void __57__SXEmbedVideoComponentView_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) webView];
  [v2 setHidden:0];

  id v3 = [*(id *)(a1 + 32) webView];
  [v3 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) activityIndicator];
  [v4 stopAnimating];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  if (a5) {
    -[SXEmbedVideoComponentView handleError:](self, "handleError:", a5, a4);
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  if (a5) {
    -[SXEmbedVideoComponentView handleError:](self, "handleError:", a5, a4);
  }
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SXEmbedVideoComponentView *)self proxyAuthenticationHandler];
  [v9 handleAuthenticationChallenge:v8 completion:v7];
}

- (unint64_t)analyticsMediaType
{
  return 2;
}

- (unint64_t)analyticsVideoType
{
  return 2;
}

- (BOOL)allowHierarchyRemoval
{
  v5.receiver = self;
  v5.super_class = (Class)SXEmbedVideoComponentView;
  unsigned __int8 v3 = [(SXComponentView *)&v5 allowHierarchyRemoval];
  return v3 & ~[(SXEmbedVideoComponentView *)self isPresentingFullscreen];
}

- (void)webViewEnteredFullscreen:(id)a3
{
  [(SXEmbedVideoComponentView *)self setIsPresentingFullscreen:1];
  id v4 = [(SXComponentView *)self presentationDelegate];
  [v4 willReturnToFullscreenForComponent:self];
}

- (void)webViewExitedFullscreen:(id)a3
{
  [(SXEmbedVideoComponentView *)self setIsPresentingFullscreen:0];
  id v4 = [(SXComponentView *)self presentationDelegate];
  [v4 willDismissFullscreenCanvasForComponent:self];
}

- (void)reportLoadEventWithError:(id)a3
{
  id v9 = a3;
  id v4 = [(SXEmbedVideoComponentView *)self loadEvent];

  if (v4)
  {
    objc_super v5 = [(SXEmbedVideoComponentView *)self loadEvent];
    [v5 setError:v9];

    double v6 = [(SXEmbedVideoComponentView *)self loadEvent];
    [v6 determineEndDate];

    id v7 = [(SXMediaComponentView *)self analyticsReporting];
    id v8 = [(SXEmbedVideoComponentView *)self loadEvent];
    [v7 reportEvent:v8];

    [(SXEmbedVideoComponentView *)self setLoadEvent:0];
  }
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
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

- (BOOL)webViewIsLoaded
{
  return self->_webViewIsLoaded;
}

- (void)setWebViewIsLoaded:(BOOL)a3
{
  self->_webViewIsLoaded = a3;
}

- (BOOL)isPresentingFullscreen
{
  return self->_isPresentingFullscreen;
}

- (void)setIsPresentingFullscreen:(BOOL)a3
{
  self->_isPresentingFullscreen = a3;
}

- (WKWebsiteDataStore)dataStore
{
  return self->_dataStore;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (SXProxyAuthenticationHandler)proxyAuthenticationHandler
{
  return self->_proxyAuthenticationHandler;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
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
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_proxyAuthenticationHandler, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_webCrashRetryThrottler, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
}

@end