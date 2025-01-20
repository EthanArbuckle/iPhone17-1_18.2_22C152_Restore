@interface COSSoftwareUpdateReleaseNotesDetail
- (COSSoftwareUpdateReleaseNotesDetail)init;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSSoftwareUpdateReleaseNotesDetail

- (COSSoftwareUpdateReleaseNotesDetail)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSSoftwareUpdateReleaseNotesDetail;
  v2 = [(COSSoftwareUpdateReleaseNotesDetail *)&v6 init];
  if (v2)
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 localizedStringForKey:@"ABOUT_THIS_UPDATE" value:&stru_100249230 table:@"Software Update"];
    [(COSSoftwareUpdateReleaseNotesDetail *)v2 setTitle:v4];
  }
  return v2;
}

- (void)loadView
{
  id v12 = [objc_alloc((Class)UIWebView) _initWithFrame:0.0 enableReachability:0.0];
  [v12 setOpaque:0];
  v3 = BPSBackgroundColor();
  [v12 setBackgroundColor:v3];

  v4 = [v12 _scrollView];
  [v4 setIndicatorStyle:2];

  v5 = [v12 _scrollView];
  [v5 _setShowsBackgroundShadow:0];

  objc_super v6 = [v12 _browserView];
  [v6 setDoubleTapEnabled:0];
  [v6 setLoadsSynchronously:1];
  v7 = [v6 webView];
  v8 = [v7 preferences];
  [v8 _setMinimumZoomFontSize:0.0];

  v9 = BPSBridgeTintColor();
  v10 = [v9 styleString];
  v11 = +[NSString stringWithFormat:@"a:link {color: %@;}\n", v10];

  [v6 setUserStyleSheet:v11];
  [v12 setDelegate:self];
  [(COSSoftwareUpdateReleaseNotesDetail *)self setView:v12];
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)COSSoftwareUpdateReleaseNotesDetail;
  [(COSSoftwareUpdateReleaseNotesDetail *)&v16 viewWillAppear:a3];
  v4 = [(COSSoftwareUpdateReleaseNotesDetail *)self view];
  v5 = [v4 scrollView];
  [v5 setDecelerationRate:UIScrollViewDecelerationRateNormal];

  id v6 = [v4 stringByEvaluatingJavaScriptFromString:@"document.body.style.webkitUserSelect='none';"];
  v7 = BPSBackgroundColor();
  [v4 setBackgroundColor:v7];

  v8 = BPSBackgroundColor();
  v9 = [v8 styleString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"document.body.style.backgroundColor='%@';",
  v10 = v9);
  id v11 = [v4 stringByEvaluatingJavaScriptFromString:v10];

  id v12 = BPSTextColor();
  v13 = [v12 styleString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"document.body.style.color='%@';",
  v14 = v13);
  id v15 = [v4 stringByEvaluatingJavaScriptFromString:v14];
}

@end