@interface HODiscoverWebViewManager
+ (id)sharedInstance;
- (BOOL)allowForcedCacheReload;
- (BOOL)doesURLContainPath:(id)a3 urlResponseString:(id)a4;
- (HODiscoverWebViewManager)init;
- (HODiscoverWebViewManagerWebViewNavigationDelegate)delegate;
- (NSMutableDictionary)webViewCache;
- (NSString)userAgent;
- (double)cacheRefreshTimeInterval;
- (id)createWebViewForURL:(id)a3 dependentWebViewURLString:(id)a4;
- (id)getDeviceName;
- (id)getURLRequestForURL:(id)a3;
- (id)getURLStringFromLocaleDictionary:(id)a3;
- (id)getUserAgent;
- (id)getWebViewURLKeyFromCache:(id)a3;
- (id)webViewForURLString:(id)a3;
- (id)webViewForURLString:(id)a3 dependentWebViewURLString:(id)a4;
- (unint64_t)getWebViewNavigationStateForWebView:(id)a3;
- (void)failedWebViewNavigation:(id)a3 navigation:(id)a4 withError:(id)a5;
- (void)populateWebViewCache:(id)a3;
- (void)preload:(id)a3;
- (void)reloadWebViews;
- (void)setAllowForcedCacheReload:(BOOL)a3;
- (void)setCacheRefreshTimeInterval:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setWebViewCache:(id)a3;
- (void)updateWebViewRefreshIntervalFromServerResponse:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation HODiscoverWebViewManager

- (HODiscoverWebViewManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)HODiscoverWebViewManager;
  v2 = [(HODiscoverWebViewManager *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    [(HODiscoverWebViewManager *)v2 setWebViewCache:v3];

    [(HODiscoverWebViewManager *)v2 setAllowForcedCacheReload:0];
    [(HODiscoverWebViewManager *)v2 setCacheRefreshTimeInterval:15.0];
  }
  return v2;
}

- (id)getURLStringFromLocaleDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"region"];
  objc_super v5 = [v3 objectForKeyedSubscript:@"storefront"];

  v6 = +[NSString stringWithFormat:@"https://asa.commerce.apple.com/home/%@/%@/landing", v4, v5];

  if (+[HFUtilities isAMac])
  {
    v7 = +[NSBundle mainBundle];
    v8 = [v7 bundleIdentifier];

    v9 = (void *)CFPreferencesCopyAppValue(@"HOStoreForceStagingURL", v8);
    if ([v9 BOOLValue]) {
      CFPropertyListRef v10 = CFPreferencesCopyAppValue(@"HOStoreStagingURLValue", v8);
    }
    else {
      CFPropertyListRef v10 = v6;
    }
    v12 = (void *)v10;
  }
  else
  {
    if (HFForceStoreToUseStagingURL())
    {
      HFStoreStagingURLString();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = v6;
    }
    v12 = v11;
  }

  return v12;
}

- (void)setWebViewCache:(id)a3
{
}

- (void)setCacheRefreshTimeInterval:(double)a3
{
  self->_cacheRefreshTimeInterval = a3;
}

- (void)setAllowForcedCacheReload:(BOOL)a3
{
  self->_allowForcedCacheReload = a3;
}

+ (id)sharedInstance
{
  if (qword_1000DE920 != -1) {
    dispatch_once(&qword_1000DE920, &stru_1000C3CB8);
  }
  v2 = (void *)qword_1000DE918;

  return v2;
}

- (void)populateWebViewCache:(id)a3
{
  id v8 = a3;
  v4 = [(HODiscoverWebViewManager *)self webViewCache];
  id v5 = [v4 count];

  if (!v5)
  {
    v6 = [(HODiscoverWebViewManager *)self getURLStringFromLocaleDictionary:v8];
    id v7 = [(HODiscoverWebViewManager *)self webViewForURLString:v6];
  }
}

- (id)webViewForURLString:(id)a3
{
  return [(HODiscoverWebViewManager *)self webViewForURLString:a3 dependentWebViewURLString:0];
}

- (id)webViewForURLString:(id)a3 dependentWebViewURLString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HODiscoverWebViewManager *)self webViewCache];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    CFPropertyListRef v10 = +[NSURL URLWithString:v6];
    id v11 = [(HODiscoverWebViewManager *)self createWebViewForURL:v10 dependentWebViewURLString:v7];
    v12 = +[HODiscoverWebViewCacheValue valueWithWebView:v11];
    v13 = [(HODiscoverWebViewManager *)self webViewCache];
    [v13 setObject:v12 forKeyedSubscript:v6];

    v14 = [(HODiscoverWebViewManager *)self webViewCache];
    v15 = [v14 objectForKeyedSubscript:v6];
    v16 = [v15 webView];
    [v16 setNavigationDelegate:self];

    v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315394;
      v23 = "-[HODiscoverWebViewManager webViewForURLString:dependentWebViewURLString:]";
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "(%s) Discover webView created with url:[%@]", (uint8_t *)&v22, 0x16u);
    }
  }
  v18 = [(HODiscoverWebViewManager *)self webViewCache];
  v19 = [v18 objectForKeyedSubscript:v6];
  v20 = [v19 webView];

  return v20;
}

- (void)preload:(id)a3
{
  id v14 = a3;
  if ([v14 count])
  {
    uint64_t v4 = 0;
    id v5 = 0;
    id v6 = 0;
    id v7 = v14;
    do
    {
      id v8 = v6;
      id v6 = [v7 objectAtIndexedSubscript:v4];

      if (v4)
      {
        uint64_t v9 = [v14 objectAtIndexedSubscript:v4 - 1];

        id v5 = (void *)v9;
      }
      CFPropertyListRef v10 = [(HODiscoverWebViewManager *)self webViewForURLString:v6 dependentWebViewURLString:v5];
      id v11 = [(HODiscoverWebViewManager *)self webViewCache];
      v12 = [v11 objectForKeyedSubscript:v6];
      [v12 setWebView:v10];

      BOOL v13 = ++v4 >= (unint64_t)[v14 count];
      id v7 = v14;
    }
    while (!v13);
  }
}

- (id)createWebViewForURL:(id)a3 dependentWebViewURLString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)WKWebViewConfiguration);
  [v8 setAllowsInlineMediaPlayback:1];
  [v8 setMediaTypesRequiringUserActionForPlayback:1];
  [v8 _setCanShowWhileLocked:0];
  uint64_t v9 = objc_alloc_init(HODiscoverWebViewMessageHandler);
  CFPropertyListRef v10 = [v8 userContentController];
  [v10 addScriptMessageHandler:v9 name:@"preload"];

  if (v6)
  {
    id v11 = [(HODiscoverWebViewManager *)self webViewCache];
    v12 = [v11 objectForKeyedSubscript:v6];
    BOOL v13 = [v12 webView];

    if (v13)
    {
      id v14 = [v13 configuration];
      v15 = [v14 processPool];
      [v8 setProcessPool:v15];

      [v8 _setRelatedWebView:v13];
    }
  }
  id v16 = objc_alloc((Class)WKWebView);
  v17 = +[UIScreen mainScreen];
  [v17 bounds];
  id v18 = [v16 initWithFrame:v8 configuration:];

  v19 = [(HODiscoverWebViewManager *)self getUserAgent];
  [v18 setCustomUserAgent:v19];

  [v18 setAllowsLinkPreview:0];
  v20 = [(HODiscoverWebViewManager *)self getURLRequestForURL:v7];

  id v21 = [v18 loadRequest:v20];

  return v18;
}

- (id)getUserAgent
{
  id v3 = [(HODiscoverWebViewManager *)self userAgent];

  if (v3)
  {
    uint64_t v4 = [(HODiscoverWebViewManager *)self userAgent];
  }
  else
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 infoDictionary];

    id v7 = [v6 objectForKey:@"CFBundleDisplayName"];
    id v8 = [v6 objectForKey:@"CFBundleShortVersionString"];
    if (+[HFUtilities isAMac])
    {
      long long v18 = 0uLL;
      uint64_t v9 = +[NSProcessInfo processInfo];
      CFPropertyListRef v10 = v9;
      if (v9) {
        [v9 operatingSystemVersion];
      }
      else {
        long long v18 = 0uLL;
      }

      id v12 = [@"macOS" copy];
      id v14 = +[NSString stringWithFormat:@"%ld.%ld.%ld", v18, 0];
    }
    else
    {
      id v11 = +[UIDevice currentDevice];
      id v12 = [v11 systemName];

      BOOL v13 = +[UIDevice currentDevice];
      id v14 = [v13 systemVersion];
    }
    v15 = [(HODiscoverWebViewManager *)self getDeviceName];
    id v16 = +[NSString stringWithFormat:@"%@/%@ %@/%@ model/%@", v7, v8, v12, v14, v15];
    [(HODiscoverWebViewManager *)self setUserAgent:v16];

    uint64_t v4 = [(HODiscoverWebViewManager *)self userAgent];
  }

  return v4;
}

- (void)reloadWebViews
{
  id v3 = [(HODiscoverWebViewManager *)self webViewCache];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003F63C;
  v4[3] = &unk_1000C3CE0;
  v4[4] = self;
  [v3 na_each:v4];
}

- (id)getURLRequestForURL:(id)a3
{
  id v3 = +[NSURLRequest requestWithURL:a3 cachePolicy:0 timeoutInterval:10.0];
  id v4 = [v3 mutableCopy];
  id v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];
  id v7 = [@"x-request-id" copy];
  [v4 addValue:v6 forHTTPHeaderField:v7];

  if (+[HFUtilities isInternalInstall])
  {
    id v8 = [@"qLNV8QsuL3e6ebtuBB8nT8GZse9N/aQ3lYTD2gDtPsU=" copy];
    id v9 = [@"x-hov-cbp" copy];
    [v4 addValue:v8 forHTTPHeaderField:v9];
  }
  id v10 = [v4 copy];

  return v10;
}

- (id)getDeviceName
{
  memset(&v4, 0, 512);
  uname(&v4);
  v2 = +[NSString stringWithCString:v4.machine encoding:4];

  return v2;
}

- (unint64_t)getWebViewNavigationStateForWebView:(id)a3
{
  id v4 = a3;
  id v5 = [(HODiscoverWebViewManager *)self webViewCache];
  id v6 = [v4 URL];
  id v7 = [v6 absoluteString];
  id v8 = [v5 objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [(HODiscoverWebViewManager *)self webViewCache];
    id v12 = [(HODiscoverWebViewManager *)self getWebViewURLKeyFromCache:v4];
    id v10 = [v11 objectForKeyedSubscript:v12];
  }
  id v13 = [v10 navigationState];

  return (unint64_t)v13;
}

- (id)getWebViewURLKeyFromCache:(id)a3
{
  id v4 = a3;
  id v5 = [(HODiscoverWebViewManager *)self webViewCache];
  id v6 = [v4 URL];
  id v7 = [v6 absoluteString];
  id v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v4 URL];
    id v10 = [v9 absoluteString];
  }
  else
  {
    id v9 = [(HODiscoverWebViewManager *)self webViewCache];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003FB98;
    v12[3] = &unk_1000C3D08;
    id v13 = v4;
    id v10 = [v9 na_firstKeyPassingTest:v12];
  }

  return v10;
}

- (void)updateWebViewRefreshIntervalFromServerResponse:(id)a3
{
  id v4 = a3;
  id v5 = [@"\\/landing" copy];
  id v6 = [v4 URL];
  id v7 = [v6 absoluteString];
  unsigned int v8 = [(HODiscoverWebViewManager *)self doesURLContainPath:v5 urlResponseString:v7];

  if (v8)
  {
    id v9 = [@"x-hov-ti" copy];
    id v10 = [v4 valueForHTTPHeaderField:v9];

    id v11 = objc_alloc_init((Class)NSNumberFormatter);
    [v11 setNumberStyle:1];
    id v12 = [v11 numberFromString:v10];
    id v13 = v12;
    if (v12) {
      [v12 doubleValue];
    }
    else {
      double v14 = 15.0;
    }
    [(HODiscoverWebViewManager *)self setCacheRefreshTimeInterval:v14];
    v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      [(HODiscoverWebViewManager *)self cacheRefreshTimeInterval];
      int v17 = 136315650;
      long long v18 = "-[HODiscoverWebViewManager updateWebViewRefreshIntervalFromServerResponse:]";
      __int16 v19 = 2112;
      v20 = v10;
      __int16 v21 = 2048;
      uint64_t v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "(%s) Discover Tab refresh interval HTTP header value:[%@], cacheRefreshTimeInterval value:[%lf]", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)failedWebViewNavigation:(id)a3 navigation:(id)a4 withError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [(HODiscoverWebViewManager *)self setAllowForcedCacheReload:0];
  id v9 = [(HODiscoverWebViewManager *)self getWebViewURLKeyFromCache:v7];
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v17 = [v7 URL];
    long long v18 = [v17 absoluteString];
    int v19 = 136315906;
    v20 = "-[HODiscoverWebViewManager failedWebViewNavigation:navigation:withError:]";
    __int16 v21 = 2112;
    uint64_t v22 = v18;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    v26 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "(%s) error occurred during Discover webView Navigation to url:[%@] with error: %@, from requested URL:[%@]", (uint8_t *)&v19, 0x2Au);
  }
  id v11 = [(HODiscoverWebViewManager *)self webViewCache];
  id v12 = [v11 objectForKeyedSubscript:v9];
  [v12 setNavigationState:2];

  id v13 = [(HODiscoverWebViewManager *)self delegate];

  if (v13)
  {
    double v14 = [(HODiscoverWebViewManager *)self delegate];
    v15 = [(HODiscoverWebViewManager *)self webViewCache];
    uint64_t v16 = [v15 objectForKeyedSubscript:v9];
    [v14 webViewNavigationStateUpdated:v7 navigationState:[v16 navigationState]];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v35 = a3;
  id v8 = (void (**)(id, uint64_t))a5;
  id v9 = a4;
  id v10 = [v35 URL];
  id v11 = [v10 absoluteString];

  id v12 = [(HODiscoverWebViewManager *)self webViewCache];
  id v13 = [v12 objectForKeyedSubscript:v11];

  objc_opt_class();
  double v14 = [v9 response];

  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  [(HODiscoverWebViewManager *)self updateWebViewRefreshIntervalFromServerResponse:v16];
  if (v13)
  {
    if ((char *)[v16 statusCode] - 400 > (char *)0xC7)
    {
      id v28 = [@"\\/covers.html" copy];
      v29 = [v35 URL];
      v30 = [v29 absoluteString];
      unsigned int v31 = [(HODiscoverWebViewManager *)self doesURLContainPath:v28 urlResponseString:v30];

      [(HODiscoverWebViewManager *)self setAllowForcedCacheReload:v31 != 0];
      [v13 setNavigationState:1];
      v8[2](v8, 1);
    }
    else
    {
      [(HODiscoverWebViewManager *)self setAllowForcedCacheReload:0];
      [v13 setNavigationState:2];
      v8[2](v8, 0);
    }
    int v17 = v11;
  }
  else
  {
    int v17 = [(HODiscoverWebViewManager *)self getWebViewURLKeyFromCache:v35];

    long long v18 = [(HODiscoverWebViewManager *)self webViewCache];
    id v13 = [v18 objectForKeyedSubscript:v17];

    if (+[HFUtilities isInternalInstall]) {
      goto LABEL_9;
    }
    v34 = [v13 webView];
    int v19 = [v34 URL];
    v20 = [v19 host];
    __int16 v21 = [v35 URL];
    uint64_t v22 = [v21 host];
    unsigned int v23 = [v20 isEqualToString:v22];

    if (v23)
    {
LABEL_9:
      id v24 = [@"\\/covers.html" copy];
      __int16 v25 = [v35 URL];
      v26 = [v25 absoluteString];
      BOOL v27 = [(HODiscoverWebViewManager *)self doesURLContainPath:v24 urlResponseString:v26];

      [(HODiscoverWebViewManager *)self setAllowForcedCacheReload:v27];
      [v13 setNavigationState:1];
      v8[2](v8, 1);
    }
    else
    {
      [(HODiscoverWebViewManager *)self setAllowForcedCacheReload:0];
      [v13 setNavigationState:2];
      v8[2](v8, 0);
    }
  }
  v32 = [(HODiscoverWebViewManager *)self delegate];

  if (v32)
  {
    v33 = [(HODiscoverWebViewManager *)self delegate];
    [v33 webViewNavigationStateUpdated:v35 navigationState:[v13 navigationState]];
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v12 = a3;
  id v5 = -[HODiscoverWebViewManager getWebViewURLKeyFromCache:](self, "getWebViewURLKeyFromCache:");
  id v6 = [(HODiscoverWebViewManager *)self webViewCache];
  id v7 = [v6 objectForKeyedSubscript:v5];
  [v7 setNavigationState:1];

  id v8 = [(HODiscoverWebViewManager *)self delegate];

  if (v8)
  {
    id v9 = [(HODiscoverWebViewManager *)self delegate];
    id v10 = [(HODiscoverWebViewManager *)self webViewCache];
    id v11 = [v10 objectForKeyedSubscript:v5];
    [v9 webViewNavigationStateUpdated:v12 navigationState:[v11 navigationState]];
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v12 = a3;
  id v5 = [(HODiscoverWebViewManager *)self getWebViewURLKeyFromCache:v12];
  if ([v12 isLoading])
  {
    id v6 = [(HODiscoverWebViewManager *)self webViewCache];
    id v7 = [v6 objectForKeyedSubscript:v5];
    [v7 setNavigationState:0];
  }
  id v8 = [(HODiscoverWebViewManager *)self delegate];

  if (v8)
  {
    id v9 = [(HODiscoverWebViewManager *)self delegate];
    id v10 = [(HODiscoverWebViewManager *)self webViewCache];
    id v11 = [v10 objectForKeyedSubscript:v5];
    [v9 webViewNavigationStateUpdated:v12 navigationState:[v11 navigationState]];
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
}

- (BOOL)doesURLContainPath:(id)a3 urlResponseString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 length];
    id v15 = 0;
    id v9 = +[NSRegularExpression regularExpressionWithPattern:v5 options:0 error:&v15];
    id v10 = v15;
    id v11 = [v9 firstMatchInString:v7 options:0 range:0];
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      int v17 = "-[HODiscoverWebViewManager doesURLContainPath:urlResponseString:]";
      __int16 v18 = 2112;
      int v19 = v7;
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 1024;
      BOOL v23 = v11 != 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%s) Did Discover webview response came from url:[%@] with pathPattern:[%@] - [%d]", buf, 0x26u);
    }

    BOOL v13 = v11 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (HODiscoverWebViewManagerWebViewNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HODiscoverWebViewManagerWebViewNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowForcedCacheReload
{
  return self->_allowForcedCacheReload;
}

- (double)cacheRefreshTimeInterval
{
  return self->_cacheRefreshTimeInterval;
}

- (NSMutableDictionary)webViewCache
{
  return self->_webViewCache;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_webViewCache, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end