@interface COSLegalMessagePane
- (BOOL)adjustTextDirection;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5;
- (COSLegalMessagePane)init;
- (UIWebView)webView;
- (id)markupString;
- (id)title;
- (void)loadView;
- (void)setTitle:(id)a3;
- (void)setWebView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation COSLegalMessagePane

- (COSLegalMessagePane)init
{
  v30.receiver = self;
  v30.super_class = (Class)COSLegalMessagePane;
  v2 = [(COSLegalMessagePane *)&v30 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(COSLegalMessagePane *)v2 markupString];
    v5 = [objc_alloc((Class)UIWebView) _initWithFrame:enableReachability:0, 0.0, 0.0, 10.0, 10.0];
    webView = v3->_webView;
    v3->_webView = v5;

    [(UIWebView *)v3->_webView setOpaque:0];
    v7 = v3->_webView;
    v8 = BPSBackgroundColor();
    [(UIWebView *)v7 setBackgroundColor:v8];

    [(UIWebView *)v3->_webView setAutoresizingMask:18];
    [(UIWebView *)v3->_webView setDelegate:v3];
    [(UIWebView *)v3->_webView setDataDetectorTypes:0];
    [(UIWebView *)v3->_webView _setDrawsCheckeredPattern:0];
    v9 = [(UIWebView *)v3->_webView scrollView];
    [v9 setIndicatorStyle:2];
    [v9 setDecelerationRate:UIScrollViewDecelerationRateNormal];
    v10 = [(UIWebView *)v3->_webView _browserView];
    [v10 setDoubleTapEnabled:0];
    [v10 setTilesOpaque:0];
    [v10 setLoadsSynchronously:1];
    [v10 setDetectsPhoneNumbers:0];
    v11 = objc_opt_new();
    v12 = BPSBridgeTintColor();
    v13 = [v12 styleString];
    [v11 appendFormat:@"a:link {color: %@;}\n", v13];

    [v11 appendString:@"body {font: 12px HelveticaNeue, sans-serif;}\n"];
    if ([(COSLegalMessagePane *)v3 adjustTextDirection])
    {
      v14 = +[UIApplication sharedApplication];
      id v15 = [v14 userInterfaceLayoutDirection];

      if (v15 == (id)1) {
        [v11 appendString:@"body {direction: rtl !important; }\n"];
      }
    }
    [v10 setUserStyleSheet:v11];
    [(UIWebView *)v3->_webView loadHTMLString:v4 baseURL:0];
    v16 = v3->_webView;
    v17 = BPSBackgroundColor();
    v18 = [v17 styleString];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"document.body.style.backgroundColor='%@';",
    v19 = v18);
    id v20 = [(UIWebView *)v16 stringByEvaluatingJavaScriptFromString:v19];

    v21 = v3->_webView;
    v22 = BPSTextColor();
    v23 = [v22 styleString];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"document.body.style.color='%@';",
    v24 = v23);
    id v25 = [(UIWebView *)v21 stringByEvaluatingJavaScriptFromString:v24];

    v26 = v3->_webView;
    v27 = sub_100032A18();
    id v28 = [(UIWebView *)v26 stringByEvaluatingJavaScriptFromString:v27];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(COSLegalMessagePane *)self navigationItem];
  [v5 setTitle:v4];
}

- (id)title
{
}

- (BOOL)adjustTextDirection
{
  return 0;
}

- (id)markupString
{
  return 0;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)COSLegalMessagePane;
  [(COSLegalMessagePane *)&v4 loadView];
  v3 = [(COSLegalMessagePane *)self view];
  [v3 addSubview:self->_webView];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)COSLegalMessagePane;
  [(COSLegalMessagePane *)&v4 viewDidLoad];
  v3 = [(COSLegalMessagePane *)self title];
  [(COSLegalMessagePane *)self setTitle:v3];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)COSLegalMessagePane;
  [(COSLegalMessagePane *)&v5 viewWillLayoutSubviews];
  webView = self->_webView;
  objc_super v4 = [(COSLegalMessagePane *)self view];
  [v4 bounds];
  -[UIWebView setFrame:](webView, "setFrame:");
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSLegalMessagePane;
  [(COSLegalMessagePane *)&v5 viewDidAppear:a3];
  objc_super v4 = [(UIWebView *)self->_webView _scrollView];
  [v4 flashScrollIndicators];
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  if (!a5)
  {
    v6 = (void *)UIApp;
    v7 = [a4 URL:a3];
    [v6 openURL:v7 withCompletionHandler:0];
  }
  return a5 != 0;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end