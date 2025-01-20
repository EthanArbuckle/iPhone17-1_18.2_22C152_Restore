@interface THWWebView
- (BOOL)finishedLoadingContent;
- (BOOL)shouldEnableScrolling;
- (NSSet)filteredOutURLSchemes;
- (NSURLRequest)request;
- (PFDURLRequestScope)requestScope;
- (THPageAffordanceHosting)canvasPageAffordanceHost;
- (THWWebView)initWithfilteredOutURLSchemes:(id)a3;
- (THWWebView)initWithfilteredOutURLSchemes:(id)a3 requestScope:(id)a4;
- (THWWebViewDelegate)webViewDelegate;
- (WKWebView)webView;
- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)stringByEvaluatingJavaScriptFromString:(id)a3;
- (void)_attemptURLLoad;
- (void)_createConfigurationWithfilteredOutURLSchemes:(id)a3 requestScope:(id)a4 completion:(id)a5;
- (void)_createContentBlockingRulesWithfilteredOutURLSchemes:(id)a3 toRuleListStore:(id)a4 completion:(id)a5;
- (void)_createWebViewWithContentBlockers:(id)a3 requestScope:(id)a4 completion:(id)a5;
- (void)disableScrolling;
- (void)hide;
- (void)loadRequest:(id)a3;
- (void)loadURL:(id)a3;
- (void)setCanvasPageAffordanceHost:(id)a3;
- (void)setFilteredOutURLSchemes:(id)a3;
- (void)setFinishedLoadingContent:(BOOL)a3;
- (void)setFrame:(CGRect)a3 naturalSize:(CGSize)a4;
- (void)setFrame:(CGRect)a3 naturalSize:(CGSize)a4 completion:(id)a5;
- (void)setRequest:(id)a3;
- (void)setRequestScope:(id)a3;
- (void)setShouldEnableScrolling:(BOOL)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewDelegate:(id)a3;
- (void)showAnimated:(BOOL)a3 duration:(double)a4 completion:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation THWWebView

- (THWWebView)initWithfilteredOutURLSchemes:(id)a3 requestScope:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)THWWebView;
  v7 = -[THWWebView initWithFrame:](&v14, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_shouldEnableScrolling = 1;
    objc_storeStrong((id *)&v7->_requestScope, a4);
    id v9 = [(NSSet *)v8->_filteredOutURLSchemes copy];
    requestScope = v8->_requestScope;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_6621C;
    v12[3] = &unk_457DF0;
    v13 = v8;
    [(THWWebView *)v13 _createWebViewWithContentBlockers:v9 requestScope:requestScope completion:v12];
  }
  return v8;
}

- (THWWebView)initWithfilteredOutURLSchemes:(id)a3
{
  return 0;
}

- (void)loadURL:(id)a3
{
  id v4 = +[NSURLRequest requestWithURL:a3];
  [(THWWebView *)self loadRequest:v4];
}

- (void)loadRequest:(id)a3
{
  id v4 = [a3 mutableCopy];
  [v4 setAttribution:1];
  [(THWWebView *)self setRequest:v4];
}

- (void)setFrame:(CGRect)a3 naturalSize:(CGSize)a4
{
}

- (void)setFrame:(CGRect)a3 naturalSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a5;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  CGFloat v22 = height;
  v25.size.CGFloat height = height;
  CGRect v26 = CGRectIntegral(v25);
  double v11 = v26.size.width;
  double v12 = v26.size.height;
  double v13 = CGRectZero.origin.y;
  v29.size.CGFloat width = CGRectZero.size.width;
  v29.size.CGFloat height = CGRectZero.size.height;
  v29.origin.CGFloat x = CGRectZero.origin.x;
  v29.origin.CGFloat y = v13;
  CGFloat v14 = 1.0;
  if (CGRectEqualToRect(v26, v29))
  {
    double v15 = a4.width;
    double v16 = a4.height;
  }
  else
  {
    double v15 = a4.width;
    double v16 = a4.height;
    if (a4.width != CGSizeZero.width || a4.height != CGSizeZero.height)
    {
      double v18 = THScaleNeededToFitSizeInSize(a4.width, a4.height, v11, v12);
      double v15 = a4.width;
      double v16 = a4.height;
      CGFloat v14 = v18;
    }
  }
  -[THWWebView setBounds:](self, "setBounds:", CGRectZero.origin.x, v13, v15, v16);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = v22;
  double MidX = CGRectGetMidX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = v22;
  -[THWWebView setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v28));
  CGAffineTransformMakeScale(&v24, v14, v14);
  CGAffineTransform v23 = v24;
  [(THWWebView *)self setTransform:&v23];
  v20 = (void (**)(void))objc_retainBlock(v10);

  if (v20) {
    v20[2](v20);
  }
}

- (void)hide
{
  [(THWWebView *)self setAlpha:0.0];
  id v3 = [(THWWebView *)self webView];
  [v3 setAlpha:0.0];
}

- (void)showAnimated:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  id v7 = a5;
  v8 = [(THWWebView *)self layer];
  [v8 setShouldRasterize:1];

  TSUScreenScale();
  double v10 = v9;
  double v11 = [(THWWebView *)self layer];
  [v11 setRasterizationScale:v10];

  double v12 = [(THWWebView *)self webView];
  double v13 = [v12 layer];
  [v13 setShouldRasterize:1];

  TSUScreenScale();
  double v15 = v14;
  double v16 = [(THWWebView *)self webView];
  v17 = [v16 layer];
  [v17 setRasterizationScale:v15];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_66764;
  v21[3] = &unk_456D40;
  v21[4] = self;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_667C4;
  v19[3] = &unk_457E18;
  v19[4] = self;
  id v20 = v7;
  id v18 = v7;
  +[UIView animateWithDuration:v21 animations:v19 completion:a4];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)THWWebView;
  v8 = -[THWWebView hitTest:withEvent:](&v18, "hitTest:withEvent:", v7, x, y);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewDelegate);
  if (WeakRetained)
  {
    double v10 = WeakRetained;
    id v11 = objc_loadWeakRetained((id *)&self->_webViewDelegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_webViewDelegate);
      unsigned int v14 = [v13 webView:self shouldAcceptHitAtPoint:v8 onView:v7 withEvent:x, y];

      if (v14) {
        double v15 = v8;
      }
      else {
        double v15 = 0;
      }
      id v16 = v15;

      v8 = v16;
    }
  }

  return v8;
}

- (void)disableScrolling
{
}

- (id)stringByEvaluatingJavaScriptFromString:(id)a3
{
  id v4 = a3;
  v5 = [(THWWebView *)self webView];
  [v5 evaluateJavaScript:v4 completionHandler:&stru_457E58];

  return @"0";
}

- (void)setShouldEnableScrolling:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldEnableScrolling = a3;
  id v5 = [(THWWebView *)self webView];
  id v4 = [v5 scrollView];
  [v4 setScrollEnabled:v3];
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);

  [(THWWebView *)self _attemptURLLoad];
}

- (void)setWebView:(id)a3
{
  id v4 = (WKWebView *)a3;
  webView = self->_webView;
  if (webView)
  {
    id v6 = [(WKWebView *)webView superview];

    if (v6) {
      [(WKWebView *)self->_webView removeFromSuperview];
    }
  }
  id v7 = self->_webView;
  self->_webView = v4;
  v19 = v4;

  [(WKWebView *)self->_webView setNavigationDelegate:self];
  [(WKWebView *)self->_webView setUIDelegate:self];
  [(THWWebView *)self addSubview:self->_webView];
  [(WKWebView *)self->_webView setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [(WKWebView *)self->_webView leadingAnchor];
  id v20 = [(THWWebView *)self leadingAnchor];
  objc_super v18 = [v21 constraintEqualToAnchor:v20];
  v22[0] = v18;
  v17 = [(WKWebView *)self->_webView trailingAnchor];
  v8 = [(THWWebView *)self trailingAnchor];
  double v9 = [v17 constraintEqualToAnchor:v8];
  v22[1] = v9;
  double v10 = [(WKWebView *)self->_webView topAnchor];
  id v11 = [(THWWebView *)self topAnchor];
  char v12 = [v10 constraintEqualToAnchor:v11];
  v22[2] = v12;
  id v13 = [(WKWebView *)self->_webView bottomAnchor];
  unsigned int v14 = [(THWWebView *)self bottomAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  v22[3] = v15;
  id v16 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v16];

  [(THWWebView *)self _attemptURLLoad];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewDelegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [v7 navigationType];
    if ((unint64_t)v11 >= 5) {
      uint64_t v12 = 5;
    }
    else {
      uint64_t v12 = (uint64_t)v11;
    }
    id v13 = objc_loadWeakRetained((id *)&self->_webViewDelegate);
    unsigned int v14 = [v7 request];
    double v15 = [v14 URL];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_66EB8;
    v17[3] = &unk_456DB8;
    v17[4] = self;
    unsigned int v16 = [v13 webView:self shouldStartLoadWithURL:v15 navigationType:v12 deferredResponseHandler:v17];

    v8[2](v8, v16);
  }
  else
  {
    v8[2](v8, 1);
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  p_webViewDelegate = &self->_webViewDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_webViewDelegate);
    [v8 webViewDidFinishLoad:self];
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_webViewDelegate);
    [v8 webView:self didFailLoadWithError:v9];
  }
}

- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6
{
  return &__NSArray0__struct;
}

- (void)_attemptURLLoad
{
  uint64_t v3 = [(THWWebView *)self webView];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(THWWebView *)self request];

    if (v5)
    {
      id v8 = [(THWWebView *)self webView];
      id v6 = [(THWWebView *)self request];
      id v7 = [v8 loadRequest:v6];
    }
  }
}

- (void)_createWebViewWithContentBlockers:(id)a3 requestScope:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_67170;
  v8[3] = &unk_457E80;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(THWWebView *)v9 _createConfigurationWithfilteredOutURLSchemes:a3 requestScope:a4 completion:v8];
}

- (void)_createContentBlockingRulesWithfilteredOutURLSchemes:(id)a3 toRuleListStore:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_67520;
  v23[3] = &unk_457EA8;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v10;
  [v9 enumerateObjectsUsingBlock:v23];

  if ([v10 count])
  {
    id v22 = 0;
    id v11 = +[NSJSONSerialization dataWithJSONObject:v10 options:4 error:&v22];
    id v12 = v22;
    if (v12)
    {
      id v13 = +[TSUAssertionHandler currentHandler];
      unsigned int v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebView _createContentBlockingRulesWithfilteredOutURLSchemes:toRuleListStore:completion:]");
      double v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebView.m"];
      [v13 handleFailureInFunction:v14 file:v15 lineNumber:378 description:@"expected nil value for '%s'", "jsonError"];
    }
    if (!v11)
    {
      unsigned int v16 = +[TSUAssertionHandler currentHandler];
      v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebView _createContentBlockingRulesWithfilteredOutURLSchemes:toRuleListStore:completion:]");
      objc_super v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebView.m"];
      [v16 handleFailureInFunction:v17 file:v18 lineNumber:379 description:@"invalid nil value for '%s'", "contentRuleListData"];
    }
    id v19 = [objc_alloc((Class)NSString) initWithData:v11 encoding:4];
    if (!v7)
    {
      id v7 = +[WKContentRuleListStore defaultStore];
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_67620;
    v20[3] = &unk_457ED0;
    id v21 = v8;
    [v7 compileContentRuleListForIdentifier:@"filteredOutURLSchemes" encodedContentRuleList:v19 completionHandler:v20];
  }
  else if (v8)
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (void)_createConfigurationWithfilteredOutURLSchemes:(id)a3 requestScope:(id)a4 completion:(id)a5
{
  id v40 = a3;
  id v7 = a4;
  id v35 = a5;
  id v8 = objc_opt_new();
  [v8 setMediaTypesRequiringUserActionForPlayback:0];
  [v8 setAllowsInlineMediaPlayback:1];
  [v8 setAllowsPictureInPictureMediaPlayback:0];
  id v9 = objc_alloc_init((Class)WKWebpagePreferences);
  [v9 _setMouseEventPolicy:1];
  v37 = v9;
  [v8 setDefaultWebpagePreferences:v9];
  id v10 = objc_opt_new();
  [v10 _setDeveloperExtrasEnabled:[BCDevice isInternalInstall]];
  [v10 _setDiagnosticLoggingEnabled:0];
  [v10 _setLogsPageMessagesToSystemConsoleEnabled:0];
  [v10 _setLargeImageAsyncDecodingEnabled:0];
  [v8 setPreferences:v10];
  v39 = v7;
  id v11 = [[PFDUrlSchemeHandler alloc] initWithRequestScope:v7];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v12 = [(PFDUrlSchemeHandler *)v11 supportedSchemes];
  id v13 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v46;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        [v8 setURLSchemeHandler:v11 forURLScheme:*(void *)(*((void *)&v45 + 1) + 8 * i)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v14);
  }

  v17 = [v8 userContentController];
  objc_super v18 = THBundle();
  id v19 = [v18 pathForResource:@"AppleWidgetController" ofType:@"js"];

  if (![v19 length])
  {
    id v20 = +[TSUAssertionHandler currentHandler];
    id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebView _createConfigurationWithfilteredOutURLSchemes:requestScope:completion:]");
    id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebView.m"];
    [v20 handleFailureInFunction:v21 file:v22 lineNumber:443 description:@"Could not find AppleWidgetController.js!"];
  }
  if (objc_msgSend(v19, "length", v35))
  {
    CGAffineTransform v23 = +[NSData dataWithContentsOfFile:v19];
    if (![v23 length])
    {
      id v24 = +[TSUAssertionHandler currentHandler];
      CGRect v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebView _createConfigurationWithfilteredOutURLSchemes:requestScope:completion:]");
      CGRect v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebView.m"];
      [v24 handleFailureInFunction:v25 file:v26 lineNumber:446 description:@"Could not load AppleWidgetController.js!"];
    }
    if ([v23 length])
    {
      id v27 = objc_alloc((Class)WKUserScript);
      id v28 = [objc_alloc((Class)NSString) initWithData:v23 encoding:4];
      id v29 = [v27 initWithSource:v28 injectionTime:0 forMainFrameOnly:1];

      [v17 addUserScript:v29];
    }
  }
  id v30 = [objc_alloc((Class)_WKUserStyleSheet) initWithSource:@"@media (inverted-colors) {   img:not(picture>img), picture { filter: invert(0); }   video { filter: invert(0) !important; }} forMainFrameOnly:];
          0);
  [v17 _addUserStyleSheet:v30];
  v31 = +[WKContentRuleListStore defaultStore];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_67BDC;
  v41[3] = &unk_457EF8;
  id v43 = v8;
  id v44 = v36;
  id v42 = v17;
  id v32 = v8;
  id v33 = v36;
  id v34 = v17;
  [(THWWebView *)self _createContentBlockingRulesWithfilteredOutURLSchemes:v40 toRuleListStore:v31 completion:v41];
}

- (THPageAffordanceHosting)canvasPageAffordanceHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasPageAffordanceHost);

  return (THPageAffordanceHosting *)WeakRetained;
}

- (void)setCanvasPageAffordanceHost:(id)a3
{
}

- (THWWebViewDelegate)webViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewDelegate);

  return (THWWebViewDelegate *)WeakRetained;
}

- (void)setWebViewDelegate:(id)a3
{
}

- (NSSet)filteredOutURLSchemes
{
  return self->_filteredOutURLSchemes;
}

- (void)setFilteredOutURLSchemes:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (BOOL)finishedLoadingContent
{
  return self->_finishedLoadingContent;
}

- (void)setFinishedLoadingContent:(BOOL)a3
{
  self->_finishedLoadingContent = a3;
}

- (BOOL)shouldEnableScrolling
{
  return self->_shouldEnableScrolling;
}

- (PFDURLRequestScope)requestScope
{
  return self->_requestScope;
}

- (void)setRequestScope:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestScope, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_filteredOutURLSchemes, 0);
  objc_destroyWeak((id *)&self->_webViewDelegate);

  objc_destroyWeak((id *)&self->_canvasPageAffordanceHost);
}

@end