@interface HODiscoverWebViewController
- (BOOL)hasConnectedToNetwork;
- (HODiscoverConnectionIssueOverlayView)connectionIssueOverlayView;
- (HODiscoverWebViewController)initWithLocalizationDictionary:(id)a3;
- (HODiscoverWebViewController)initWithURLString:(id)a3;
- (NSDate)applicationBackgroundedDate;
- (NSString)urlString;
- (NSTimer)webViewActivityIndicatorDelayTimer;
- (OS_dispatch_queue)networkPathMonitorDispatchQueue;
- (OS_nw_path_monitor)networkPathMonitor;
- (UIActivityIndicatorView)webViewActivityIndicator;
- (UIView)contentView;
- (WKWebView)webView;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)viewForZoomingInScrollView:(id)a3;
- (unint64_t)currentConnectionIssueState;
- (void)_addConnectionIssueOverlayViewConstraints;
- (void)_addConstraintsForWebViewActivityIndicator;
- (void)_addContentViewConstraints;
- (void)_addWebViewConstraints;
- (void)_commonInitializer:(id)a3;
- (void)_startWebViewActivityIndicator;
- (void)_stopWebViewActivityIndicator;
- (void)_updateNavigationBarAppearenceFromOffset;
- (void)_updateNetworkConnectionState:(unint64_t)a3;
- (void)applicationWentIntoBackground:(id)a3;
- (void)connectionIssueOverlayRetryButtonPressed;
- (void)contentSizeDidChange:(id)a3;
- (void)dealloc;
- (void)exitToAppleStoreAppOrSafariWithURL:(id)a3;
- (void)presentModalDiscoverWebViewControllerWithURLString:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)pushNewDiscoverWebViewControllerWithURLString:(id)a3;
- (void)reloadWebView:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setApplicationBackgroundedDate:(id)a3;
- (void)setConnectionIssueOverlayView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentConnectionIssueState:(unint64_t)a3;
- (void)setHasConnectedToNetwork:(BOOL)a3;
- (void)setNetworkPathMonitor:(id)a3;
- (void)setNetworkPathMonitorDispatchQueue:(id)a3;
- (void)setUrlString:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewActivityIndicator:(id)a3;
- (void)setWebViewActivityIndicatorDelayTimer:(id)a3;
- (void)setupWebViewAndActivityIndicator;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)webViewNavigationStateUpdated:(id)a3 navigationState:(unint64_t)a4;
@end

@implementation HODiscoverWebViewController

- (HODiscoverWebViewController)initWithLocalizationDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HODiscoverWebViewController;
  v5 = [(HODiscoverWebViewController *)&v9 init];
  if (v5)
  {
    v6 = +[HODiscoverWebViewManager sharedInstance];
    v7 = [v6 getURLStringFromLocaleDictionary:v4];

    [(HODiscoverWebViewController *)v5 _commonInitializer:v7];
  }

  return v5;
}

- (void)_commonInitializer:(id)a3
{
  [(HODiscoverWebViewController *)self setUrlString:a3];
  [(HODiscoverWebViewController *)self setHasConnectedToNetwork:1];
  id v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(HODiscoverWebViewController *)self setContentView:v4];

  v5 = +[UIColor colorNamed:@"background-color-discover"];
  v6 = [(HODiscoverWebViewController *)self contentView];
  [v6 setBackgroundColor:v5];

  v7 = [(HODiscoverWebViewController *)self contentView];
  [v7 setClipsToBounds:1];

  v8 = [(HODiscoverWebViewController *)self contentView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = sub_10000ED08();
  [(HODiscoverWebViewController *)self setNetworkPathMonitorDispatchQueue:v9];

  nw_path_monitor_t v10 = nw_path_monitor_create();
  [(HODiscoverWebViewController *)self setNetworkPathMonitor:v10];

  v11 = [(HODiscoverWebViewController *)self networkPathMonitor];
  v12 = [(HODiscoverWebViewController *)self networkPathMonitorDispatchQueue];
  nw_path_monitor_set_queue(v11, v12);

  v13 = [(HODiscoverWebViewController *)self networkPathMonitor];
  update_handler[0] = _NSConcreteStackBlock;
  update_handler[1] = 3221225472;
  update_handler[2] = sub_10001F168;
  update_handler[3] = &unk_1000C2470;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v13, update_handler);
}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setUrlString:(id)a3
{
}

- (void)setNetworkPathMonitorDispatchQueue:(id)a3
{
}

- (void)setNetworkPathMonitor:(id)a3
{
}

- (void)setHasConnectedToNetwork:(BOOL)a3
{
  self->_hasConnectedToNetwork = a3;
}

- (void)setContentView:(id)a3
{
}

- (OS_dispatch_queue)networkPathMonitorDispatchQueue
{
  return self->_networkPathMonitorDispatchQueue;
}

- (HODiscoverWebViewController)initWithURLString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HODiscoverWebViewController;
  v5 = [(HODiscoverWebViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HODiscoverWebViewController *)v5 _commonInitializer:v4];
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HODiscoverWebViewController;
  [(HODiscoverWebViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)HODiscoverWebViewController;
  [(HODiscoverWebViewController *)&v26 viewDidLoad];
  v3 = [(HODiscoverWebViewController *)self view];
  objc_super v4 = [(HODiscoverWebViewController *)self contentView];
  [v3 addSubview:v4];

  [(HODiscoverWebViewController *)self _addContentViewConstraints];
  v5 = +[NSBundle mainBundle];
  v6 = @"HOTabDiscoverTitle";
  v7 = [v5 localizedStringForKey:@"HOTabDiscoverTitle" value:@"_" table:@"HOLocalizable"];

  if ([@"_" isEqualToString:v7])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    objc_super v8 = sub_1000217F0();
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
        v14 = +[NSBundle mainBundle];
        v15 = [v14 localizedStringForKey:@"HOTabDiscoverTitle" value:@"HOTabDiscoverTitle" table:v13];

        if (![(__CFString *)v15 isEqualToString:@"HOTabDiscoverTitle"]) {
          break;
        }

        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
          if (v10) {
            goto LABEL_4;
          }
          v15 = @"_";
          break;
        }
      }
      v6 = @"HOTabDiscoverTitle";
    }
    else
    {
      v15 = @"_";
    }

    v7 = v15;
  }
  if ([@"_" isEqualToString:v7]) {
    NSLog(@"Sensitive key '%@' not found!", @"HOTabDiscoverTitle");
  }
  else {
    v6 = v7;
  }

  [(HODiscoverWebViewController *)self setTitle:v6];
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    v16 = [(HODiscoverWebViewController *)self navigationController];
    v17 = [v16 navigationBar];
    [v17 setPrefersLargeTitles:0];

    NSAttributedStringKey v31 = NSForegroundColorAttributeName;
    v18 = +[UIColor labelColor];
    v32 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v20 = [(HODiscoverWebViewController *)self navigationController];
    v21 = [v20 navigationBar];
    [v21 setTitleTextAttributes:v19];

    v22 = [(HODiscoverWebViewController *)self navigationController];
    [v22 setModalPresentationStyle:0];
  }
  v23 = [(HODiscoverWebViewController *)self networkPathMonitor];
  nw_path_monitor_start(v23);

  [(HODiscoverWebViewController *)self _updateNetworkConnectionState:0];
  if (+[HFUtilities isAMac])
  {
    v24 = [(HODiscoverWebViewController *)self navigationController];
    v25 = [v24 navigationBar];
    [v25 setHidden:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v26.receiver = self;
  v26.super_class = (Class)HODiscoverWebViewController;
  [(HODiscoverWebViewController *)&v26 viewWillAppear:a3];
  [(HODiscoverWebViewController *)self setupWebViewAndActivityIndicator];
  objc_super v4 = +[HODiscoverWebViewManager sharedInstance];
  v5 = [(HODiscoverWebViewController *)self webView];
  id v6 = [v4 getWebViewNavigationStateForWebView:v5];

  v7 = [(HODiscoverWebViewController *)self webView];
  [(HODiscoverWebViewController *)self webViewNavigationStateUpdated:v7 navigationState:v6];

  objc_super v8 = [(HODiscoverWebViewController *)self applicationBackgroundedDate];
  [v8 timeIntervalSinceNow];
  double v10 = fabs(v9);
  uint64_t v11 = +[HODiscoverWebViewManager sharedInstance];
  [v11 cacheRefreshTimeInterval];
  double v13 = v12;

  v14 = +[HODiscoverWebViewManager sharedInstance];
  unsigned int v15 = [v14 allowForcedCacheReload];

  if (v10 > v13 || v15)
  {
    v16 = +[HODiscoverWebViewManager sharedInstance];
    [v16 reloadWebViews];
  }
  if (v6 == (id)2)
  {
    v17 = +[HODiscoverWebViewManager sharedInstance];
    [v17 reloadWebViews];
  }
  v18 = +[HODiscoverWebViewManager sharedInstance];
  [v18 setDelegate:self];

  if (_os_feature_enabled_impl())
  {
    if (_os_feature_enabled_impl())
    {
      v19 = [(HODiscoverWebViewController *)self navigationController];
      v20 = [v19 navigationBar];
      [v20 setPrefersLargeTitles:0];

      NSAttributedStringKey v27 = NSForegroundColorAttributeName;
      v21 = +[UIColor labelColor];
      long long v28 = v21;
      v22 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v23 = [(HODiscoverWebViewController *)self navigationController];
      v24 = [v23 navigationBar];
      [v24 setTitleTextAttributes:v22];

      v25 = [(HODiscoverWebViewController *)self navigationController];
      [v25 setModalPresentationStyle:0];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HODiscoverWebViewController;
  [(HODiscoverWebViewController *)&v5 viewWillDisappear:a3];
  if (+[HFUtilities isAMac])
  {
    objc_super v4 = +[NSDate date];
    [(HODiscoverWebViewController *)self setApplicationBackgroundedDate:v4];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HODiscoverWebViewController;
  [(HODiscoverWebViewController *)&v3 viewDidLayoutSubviews];
  [(HODiscoverWebViewController *)self _updateNavigationBarAppearenceFromOffset];
}

- (void)setupWebViewAndActivityIndicator
{
  uint64_t v3 = [(HODiscoverWebViewController *)self webView];
  if (!v3) {
    goto LABEL_3;
  }
  objc_super v4 = (void *)v3;
  objc_super v5 = [(HODiscoverWebViewController *)self contentView];
  id v6 = [v5 subviews];
  v7 = [(HODiscoverWebViewController *)self webView];
  unsigned __int8 v8 = [v6 containsObject:v7];

  if ((v8 & 1) == 0)
  {
LABEL_3:
    double v9 = [(HODiscoverWebViewController *)self webView];

    if (!v9)
    {
      double v10 = +[HODiscoverWebViewManager sharedInstance];
      uint64_t v11 = [(HODiscoverWebViewController *)self urlString];
      double v12 = [v10 webViewForURLString:v11];
      [(HODiscoverWebViewController *)self setWebView:v12];

      double v13 = [(HODiscoverWebViewController *)self webView];
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

      v14 = [(HODiscoverWebViewController *)self webView];
      [v14 setOpaque:0];

      unsigned int v15 = [(HODiscoverWebViewController *)self webView];
      [v15 setClipsToBounds:1];

      v16 = [(HODiscoverWebViewController *)self webView];
      v17 = [v16 configuration];
      [v17 setAllowsInlineMediaPlayback:1];

      v18 = [(HODiscoverWebViewController *)self webView];
      v19 = [v18 configuration];
      [v19 setMediaTypesRequiringUserActionForPlayback:1];

      v20 = [(HODiscoverWebViewController *)self webView];
      [v20 setAllowsLinkPreview:0];

      v21 = +[NSDate date];
      [(HODiscoverWebViewController *)self setApplicationBackgroundedDate:v21];
    }
    v22 = [(HODiscoverWebViewController *)self view];
    v23 = [v22 subviews];
    v24 = [(HODiscoverWebViewController *)self webView];
    unsigned __int8 v25 = [v23 containsObject:v24];

    if ((v25 & 1) == 0)
    {
      objc_super v26 = [[HODiscoverWebKitContentController alloc] initWithDelegate:self];
      NSAttributedStringKey v27 = [(HODiscoverWebViewController *)self webView];
      long long v28 = [v27 configuration];
      long long v29 = [v28 userContentController];
      [v29 removeScriptMessageHandlerForName:off_1000DC498];

      long long v30 = [(HODiscoverWebViewController *)self webView];
      NSAttributedStringKey v31 = [v30 configuration];
      v32 = [v31 userContentController];
      [v32 addScriptMessageHandler:v26 name:off_1000DC498];

      v33 = [(HODiscoverWebViewController *)self webView];
      v34 = [v33 configuration];
      v35 = [v34 userContentController];
      [v35 removeScriptMessageHandlerForName:off_1000DC4A0];

      v36 = [(HODiscoverWebViewController *)self webView];
      v37 = [v36 configuration];
      v38 = [v37 userContentController];
      [v38 addScriptMessageHandler:v26 name:off_1000DC4A0];

      v39 = [(HODiscoverWebViewController *)self webView];
      [v39 setUIDelegate:self];

      v40 = [(HODiscoverWebViewController *)self webView];
      v41 = [v40 scrollView];
      [v41 setDelegate:self];

      v42 = [(HODiscoverWebViewController *)self contentView];
      v43 = [(HODiscoverWebViewController *)self webView];
      [v42 addSubview:v43];

      v44 = [(HODiscoverWebViewController *)self contentView];
      v45 = [(HODiscoverWebViewController *)self webView];
      [v44 sendSubviewToBack:v45];

      [(HODiscoverWebViewController *)self _addWebViewConstraints];
      v46 = +[NSNotificationCenter defaultCenter];
      [v46 addObserver:self selector:"reloadWebView:" name:UIApplicationWillEnterForegroundNotification object:0];

      v47 = +[NSNotificationCenter defaultCenter];
      [v47 addObserver:self selector:"applicationWentIntoBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

      v48 = +[NSNotificationCenter defaultCenter];
      [v48 addObserver:self selector:"contentSizeDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
    }
    v49 = [(HODiscoverWebViewController *)self webViewActivityIndicator];

    if (!v49)
    {
      id v50 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
      [(HODiscoverWebViewController *)self setWebViewActivityIndicator:v50];

      v51 = [(HODiscoverWebViewController *)self webViewActivityIndicator];
      [v51 setHidesWhenStopped:1];

      v52 = [(HODiscoverWebViewController *)self webViewActivityIndicator];
      [v52 setTranslatesAutoresizingMaskIntoConstraints:0];

      v53 = [(HODiscoverWebViewController *)self contentView];
      v54 = [(HODiscoverWebViewController *)self webViewActivityIndicator];
      [v53 addSubview:v54];

      [(HODiscoverWebViewController *)self _addConstraintsForWebViewActivityIndicator];
    }
  }
}

- (void)_addContentViewConstraints
{
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    v19 = [(HODiscoverWebViewController *)self contentView];
    v18 = [v19 leadingAnchor];
    long long v30 = [(HODiscoverWebViewController *)self view];
    long long v29 = [v30 safeAreaLayoutGuide];
    long long v28 = [v29 leadingAnchor];
    NSAttributedStringKey v27 = [v18 constraintEqualToAnchor:];
    v32[0] = v27;
    objc_super v26 = [(HODiscoverWebViewController *)self contentView];
    uint64_t v3 = [v26 trailingAnchor];
    v24 = [(HODiscoverWebViewController *)self view];
    v23 = [v24 safeAreaLayoutGuide];
    [v23 trailingAnchor];
    v22 = unsigned __int8 v25 = v3;
    v21 = [v3 constraintEqualToAnchor:];
    v32[1] = v21;
    v20 = [(HODiscoverWebViewController *)self contentView];
    objc_super v4 = [v20 topAnchor];
    objc_super v5 = [(HODiscoverWebViewController *)self view];
    id v6 = [v5 topAnchor];
    v7 = [v4 constraintEqualToAnchor:v6];
    v32[2] = v7;
    unsigned __int8 v8 = [(HODiscoverWebViewController *)self contentView];
    double v9 = [v8 bottomAnchor];
    double v10 = [(HODiscoverWebViewController *)self view];
    uint64_t v11 = [v10 bottomAnchor];
    double v12 = [v9 constraintEqualToAnchor:v11];
    v32[3] = v12;
    double v13 = +[NSArray arrayWithObjects:v32 count:4];
    +[NSLayoutConstraint activateConstraints:v13];

    v14 = v18;
    unsigned int v15 = v19;
  }
  else
  {
    unsigned int v15 = [(HODiscoverWebViewController *)self contentView];
    v14 = [v15 leadingAnchor];
    long long v30 = [(HODiscoverWebViewController *)self view];
    long long v29 = [v30 leadingAnchor];
    long long v28 = [v14 constraintEqualToAnchor:];
    v31[0] = v28;
    NSAttributedStringKey v27 = [(HODiscoverWebViewController *)self contentView];
    v16 = [v27 trailingAnchor];
    unsigned __int8 v25 = [(HODiscoverWebViewController *)self view];
    [v25 trailingAnchor];
    v24 = objc_super v26 = v16;
    v23 = [v16 constraintEqualToAnchor:];
    v31[1] = v23;
    v22 = [(HODiscoverWebViewController *)self contentView];
    v17 = [v22 topAnchor];
    v20 = [(HODiscoverWebViewController *)self view];
    objc_super v4 = [v20 topAnchor];
    v21 = v17;
    objc_super v5 = [v17 constraintEqualToAnchor:v4];
    v31[2] = v5;
    id v6 = [(HODiscoverWebViewController *)self contentView];
    v7 = [v6 bottomAnchor];
    unsigned __int8 v8 = [(HODiscoverWebViewController *)self view];
    double v9 = [v8 bottomAnchor];
    double v10 = [v7 constraintEqualToAnchor:v9];
    v31[3] = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:v31 count:4];
    +[NSLayoutConstraint activateConstraints:v11];
  }
}

- (void)_addWebViewConstraints
{
  uint64_t v3 = +[UIApplication sharedApplication];
  objc_super v4 = [v3 windows];
  objc_super v5 = [v4 firstObject];
  id v6 = [v5 windowScene];
  v7 = [v6 statusBarManager];
  [v7 statusBarFrame];
  double v9 = v8;

  long long v30 = [(HODiscoverWebViewController *)self webView];
  long long v28 = [v30 leadingAnchor];
  long long v29 = [(HODiscoverWebViewController *)self contentView];
  NSAttributedStringKey v27 = [v29 leadingAnchor];
  objc_super v26 = [v28 constraintEqualToAnchor:v27];
  v31[0] = v26;
  unsigned __int8 v25 = [(HODiscoverWebViewController *)self webView];
  v23 = [v25 trailingAnchor];
  v24 = [(HODiscoverWebViewController *)self contentView];
  v22 = [v24 trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v31[1] = v21;
  v20 = [(HODiscoverWebViewController *)self webView];
  double v10 = [v20 topAnchor];
  uint64_t v11 = [(HODiscoverWebViewController *)self contentView];
  double v12 = [v11 topAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12 constant:v9];
  v31[2] = v13;
  v14 = [(HODiscoverWebViewController *)self webView];
  unsigned int v15 = [v14 bottomAnchor];
  v16 = [(HODiscoverWebViewController *)self contentView];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v31[3] = v18;
  v19 = +[NSArray arrayWithObjects:v31 count:4];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)_addConnectionIssueOverlayViewConstraints
{
  v23 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
  v21 = [v23 leadingAnchor];
  v22 = [(HODiscoverWebViewController *)self contentView];
  v20 = [v22 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  v18 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
  v16 = [v18 trailingAnchor];
  v17 = [(HODiscoverWebViewController *)self contentView];
  unsigned int v15 = [v17 trailingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  double v13 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
  uint64_t v3 = [v13 topAnchor];
  objc_super v4 = [(HODiscoverWebViewController *)self contentView];
  objc_super v5 = [v4 topAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  v7 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
  double v8 = [v7 bottomAnchor];
  double v9 = [(HODiscoverWebViewController *)self contentView];
  double v10 = [v9 bottomAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  double v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_addConstraintsForWebViewActivityIndicator
{
  double v13 = [(HODiscoverWebViewController *)self webViewActivityIndicator];
  uint64_t v3 = [v13 centerXAnchor];
  objc_super v4 = [(HODiscoverWebViewController *)self contentView];
  objc_super v5 = [v4 centerXAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v14[0] = v6;
  v7 = [(HODiscoverWebViewController *)self webViewActivityIndicator];
  double v8 = [v7 centerYAnchor];
  double v9 = [(HODiscoverWebViewController *)self contentView];
  double v10 = [v9 centerYAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10];
  v14[1] = v11;
  double v12 = +[NSArray arrayWithObjects:v14 count:2];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_updateNetworkConnectionState:(unint64_t)a3
{
  objc_super v5 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];

  if (v5)
  {
    if ([(HODiscoverWebViewController *)self currentConnectionIssueState] == a3) {
      return;
    }
  }
  else
  {
    id v6 = -[HODiscoverConnectionIssueOverlayView initWithFrame:withDelegate:]([HODiscoverConnectionIssueOverlayView alloc], "initWithFrame:withDelegate:", self, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(HODiscoverWebViewController *)self setConnectionIssueOverlayView:v6];

    v7 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v8 = [(HODiscoverWebViewController *)self contentView];
    double v9 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
    [v8 addSubview:v9];

    [(HODiscoverWebViewController *)self _addConnectionIssueOverlayViewConstraints];
  }
  switch(a3)
  {
    case 2uLL:
      v14 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
      [v14 setConnectionIssueType:2];

      unsigned int v15 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
      [v15 setHidden:0];

      double v13 = [(HODiscoverWebViewController *)self webView];
      uint64_t v11 = 1;
      [v13 setHidden:1];
      goto LABEL_12;
    case 1uLL:
      v16 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
      [v16 setConnectionIssueType:1];

      v17 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
      [v17 setHidden:0];

      double v13 = [(HODiscoverWebViewController *)self webView];
      [v13 setHidden:1];
      uint64_t v11 = 0;
      goto LABEL_12;
    case 0uLL:
      double v10 = [(HODiscoverWebViewController *)self connectionIssueOverlayView];
      uint64_t v11 = 1;
      [v10 setHidden:1];

      double v12 = [(HODiscoverWebViewController *)self webView];
      [v12 setHidden:0];

      if ([(HODiscoverWebViewController *)self hasConnectedToNetwork])
      {
LABEL_13:
        [(HODiscoverWebViewController *)self setHasConnectedToNetwork:v11];
        break;
      }
      double v13 = +[HODiscoverWebViewManager sharedInstance];
      [v13 reloadWebViews];
LABEL_12:

      goto LABEL_13;
  }

  [(HODiscoverWebViewController *)self setCurrentConnectionIssueState:a3];
}

- (void)_updateNavigationBarAppearenceFromOffset
{
  uint64_t v3 = [(HODiscoverWebViewController *)self webView];
  objc_super v4 = [v3 scrollView];
  [v4 contentOffset];
  double v6 = v5 / 20.0;

  if (v6 <= 1.0)
  {
    double v12 = [(HODiscoverWebViewController *)self navigationController];
    double v13 = [v12 navigationBar];
    v14 = v13;
    if (v6 >= 0.0)
    {
      [v13 _setTitleOpacity:v6];

      id v15 = [(HODiscoverWebViewController *)self navigationController];
      double v9 = [v15 navigationBar];
      double v10 = v9;
      double v11 = v6;
    }
    else
    {
      [v13 _setTitleOpacity:0.0];

      id v15 = [(HODiscoverWebViewController *)self navigationController];
      double v9 = [v15 navigationBar];
      double v10 = v9;
      double v11 = 0.0;
    }
  }
  else
  {
    v7 = [(HODiscoverWebViewController *)self navigationController];
    double v8 = [v7 navigationBar];
    [v8 _setTitleOpacity:1.0];

    id v15 = [(HODiscoverWebViewController *)self navigationController];
    double v9 = [v15 navigationBar];
    double v10 = v9;
    double v11 = 1.0;
  }
  [v9 _setBackgroundOpacity:v11];
}

- (void)_startWebViewActivityIndicator
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020ED8;
  v4[3] = &unk_1000C2498;
  v4[4] = self;
  uint64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v4 block:1.5];
  [(HODiscoverWebViewController *)self setWebViewActivityIndicatorDelayTimer:v3];
}

- (void)_stopWebViewActivityIndicator
{
  uint64_t v3 = [(HODiscoverWebViewController *)self webViewActivityIndicatorDelayTimer];

  if (v3)
  {
    objc_super v4 = [(HODiscoverWebViewController *)self webViewActivityIndicatorDelayTimer];
    [v4 invalidate];
  }
  [(HODiscoverWebViewController *)self setWebViewActivityIndicatorDelayTimer:0];
  id v5 = [(HODiscoverWebViewController *)self webViewActivityIndicator];
  [v5 stopAnimating];
}

- (void)reloadWebView:(id)a3
{
  uint64_t v3 = [(HODiscoverWebViewController *)self applicationBackgroundedDate];
  [v3 timeIntervalSinceNow];
  double v5 = fabs(v4);
  double v6 = +[HODiscoverWebViewManager sharedInstance];
  [v6 cacheRefreshTimeInterval];
  if (v5 > v7)
  {
  }
  else
  {
    double v8 = +[HODiscoverWebViewManager sharedInstance];
    unsigned int v9 = [v8 allowForcedCacheReload];

    if (!v9) {
      return;
    }
  }
  id v10 = +[HODiscoverWebViewManager sharedInstance];
  [v10 reloadWebViews];
}

- (void)applicationWentIntoBackground:(id)a3
{
  id v4 = +[NSDate date];
  [(HODiscoverWebViewController *)self setApplicationBackgroundedDate:v4];
}

- (void)contentSizeDidChange:(id)a3
{
  id v9 = [(HODiscoverWebViewController *)self applicationBackgroundedDate];
  [v9 timeIntervalSinceNow];
  double v4 = fabs(v3);
  double v5 = +[HODiscoverWebViewManager sharedInstance];
  [v5 cacheRefreshTimeInterval];
  if (v4 > v6)
  {
  }
  else
  {
    double v7 = +[HODiscoverWebViewManager sharedInstance];
    unsigned __int8 v8 = [v7 allowForcedCacheReload];

    if (v8) {
      return;
    }
    id v9 = +[HODiscoverWebViewManager sharedInstance];
    [v9 reloadWebViews];
  }
}

- (void)pushNewDiscoverWebViewControllerWithURLString:(id)a3
{
  id v4 = a3;
  double v6 = [[HODiscoverModalWebViewController alloc] initWithURLString:v4];

  double v5 = [(HODiscoverWebViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)presentModalDiscoverWebViewControllerWithURLString:(id)a3
{
  id v4 = a3;
  double v7 = [[HODiscoverModalWebViewController alloc] initWithURLString:v4];

  if (+[HFUtilities isAnIPad])
  {
    double v5 = [(HODiscoverModalWebViewController *)v7 presentationController];
    [v5 setDelegate:self];

    [(HODiscoverModalWebViewController *)v7 setTransitioningDelegate:self];
  }
  double v6 = [(HODiscoverWebViewController *)self navigationController];
  [v6 presentViewController:v7 animated:1 completion:0];
}

- (void)exitToAppleStoreAppOrSafariWithURL:(id)a3
{
  id v5 = a3;
  double v3 = +[HFOpenURLRouter sharedInstance];
  id v4 = [v3 openURL:v5];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  [v4 setContentOffset:0.0];

  [(HODiscoverWebViewController *)self _updateNavigationBarAppearenceFromOffset];
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v6 = [(HODiscoverWebViewController *)self webView];
  id v4 = [v6 scrollView];
  id v5 = [v4 pinchGestureRecognizer];
  [v5 setEnabled:0];
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return 0;
}

- (void)webViewNavigationStateUpdated:(id)a3 navigationState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(HODiscoverWebViewController *)self webView];

  if (v7 == v6)
  {
    if (a4 == 2)
    {
      [(HODiscoverWebViewController *)self _stopWebViewActivityIndicator];
      uint64_t v8 = 2;
    }
    else
    {
      if (a4 == 1)
      {
        [(HODiscoverWebViewController *)self _stopWebViewActivityIndicator];
      }
      else
      {
        if (a4) {
          return;
        }
        [(HODiscoverWebViewController *)self _startWebViewActivityIndicator];
      }
      uint64_t v8 = 0;
    }
    [(HODiscoverWebViewController *)self _updateNetworkConnectionState:v8];
  }
}

- (void)connectionIssueOverlayRetryButtonPressed
{
  id v2 = +[HODiscoverWebViewManager sharedInstance];
  [v2 reloadWebViews];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[HODiscoverModalPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (NSDate)applicationBackgroundedDate
{
  return self->_applicationBackgroundedDate;
}

- (void)setApplicationBackgroundedDate:(id)a3
{
}

- (UIActivityIndicatorView)webViewActivityIndicator
{
  return self->_webViewActivityIndicator;
}

- (void)setWebViewActivityIndicator:(id)a3
{
}

- (NSTimer)webViewActivityIndicatorDelayTimer
{
  return self->_webViewActivityIndicatorDelayTimer;
}

- (void)setWebViewActivityIndicatorDelayTimer:(id)a3
{
}

- (BOOL)hasConnectedToNetwork
{
  return self->_hasConnectedToNetwork;
}

- (HODiscoverConnectionIssueOverlayView)connectionIssueOverlayView
{
  return self->_connectionIssueOverlayView;
}

- (void)setConnectionIssueOverlayView:(id)a3
{
}

- (unint64_t)currentConnectionIssueState
{
  return self->_currentConnectionIssueState;
}

- (void)setCurrentConnectionIssueState:(unint64_t)a3
{
  self->_currentConnectionIssueState = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_networkPathMonitorDispatchQueue, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_connectionIssueOverlayView, 0);
  objc_storeStrong((id *)&self->_webViewActivityIndicatorDelayTimer, 0);
  objc_storeStrong((id *)&self->_webViewActivityIndicator, 0);

  objc_storeStrong((id *)&self->_applicationBackgroundedDate, 0);
}

@end