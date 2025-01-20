@interface JSAApplication
+ (id)purchaseEventFieldsWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 topic:(id)a6;
+ (void)appendPageHistory:(id)a3 completion:(id)a4;
+ (void)didBecomeActive;
+ (void)didEnterBackground;
+ (void)didFinishLaunchingWithMetrics:(BOOL)a3;
+ (void)getODPTopGenre:(id)a3;
+ (void)openAccountSummaryPage;
+ (void)openAchievementSheet:(id)a3;
+ (void)openNotificationSettingsPage;
+ (void)openProductPagesWithIds:(id)a3 contentTypes:(id)a4 focusedIndex:(unint64_t)a5 options:(id)a6;
+ (void)openURL:(id)a3 referrerURL:(id)a4 referrerApplicationName:(id)a5 options:(id)a6;
+ (void)openWriteReviewPageWithURL:(id)a3 options:(id)a4;
+ (void)openYearInReview;
+ (void)recordNativeEvent:(id)a3;
+ (void)recordNativeEvent:(id)a3 additionalInfo:(id)a4;
+ (void)searchForTerm:(id)a3;
+ (void)willEnterForeground;
+ (void)willResignActive;
+ (void)willTerminate;
- (JSAApplication)init;
- (JSValue)onUnhandledPromiseRejection;
- (NSDate)lastScriptCacheDate;
- (NSString)identifier;
- (NSString)version;
- (void)dealloc;
- (void)downloadAndCacheScript:(id)a3;
- (void)openExternalURL:(id)a3;
- (void)reloadWithNewCache:(id)a3;
- (void)reloadWithNewCacheIfAvailable:(id)a3;
- (void)setOnUnhandledPromiseRejection:(id)a3;
@end

@implementation JSAApplication

- (JSAApplication)init
{
  v14.receiver = self;
  v14.super_class = (Class)JSAApplication;
  v2 = [(JSAApplication *)&v14 init];
  if (v2)
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 infoDictionary];

    if (v4)
    {
      objc_opt_class();
      v5 = [v4 objectForKeyedSubscript:kCFBundleIdentifierKey];
      uint64_t v6 = BUDynamicCast();
      v7 = (void *)v6;
      if (v6) {
        v8 = (__CFString *)v6;
      }
      else {
        v8 = &stru_B6668;
      }
      objc_storeStrong((id *)&v2->_identifier, v8);

      objc_opt_class();
      v9 = [v4 objectForKeyedSubscript:_kCFBundleShortVersionStringKey];
      uint64_t v10 = BUDynamicCast();
      v11 = (void *)v10;
      if (v10) {
        v12 = (__CFString *)v10;
      }
      else {
        v12 = &stru_B6668;
      }
      objc_storeStrong((id *)&v2->_version, v12);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(JSManagedValue *)self->_onUnhandledPromiseRejection value];
  v4 = [v3 context];
  v5 = [v4 virtualMachine];
  [v5 removeManagedReference:self->_onUnhandledPromiseRejection withOwner:self];

  v6.receiver = self;
  v6.super_class = (Class)JSAApplication;
  [(JSAApplication *)&v6 dealloc];
}

- (NSDate)lastScriptCacheDate
{
  v2 = +[JSABridge sharedInstance];
  v3 = [v2 lastScriptCacheDate];

  return (NSDate *)v3;
}

- (JSValue)onUnhandledPromiseRejection
{
  return [(JSManagedValue *)self->_onUnhandledPromiseRejection value];
}

- (void)setOnUnhandledPromiseRejection:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)objc_super v14 = 136446210;
    *(void *)&v14[4] = "-[JSAApplication setOnUnhandledPromiseRejection:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", v14, 0xCu);
  }

  objc_super v6 = [v4 context];
  v7 = (const OpaqueJSContext *)[v6 JSGlobalContextRef];
  *(void *)objc_super v14 = 0;
  JSValueToObject(v7, (JSValueRef)[v4 JSValueRef], (JSValueRef *)v14);
  if (*(void *)v14)
  {
    onUnhandledPromiseRejection = +[JSValue valueWithJSValueRef:*(void *)v14 inContext:v6];
    v9 = JSALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_85B84((uint64_t)onUnhandledPromiseRejection, v9);
    }
  }
  else
  {
    JSGlobalContextSetUnhandledRejectionCallback();
    if (!*(void *)v14)
    {
      uint64_t v10 = [(JSManagedValue *)self->_onUnhandledPromiseRejection value];
      v11 = [v10 context];
      v12 = [v11 virtualMachine];
      [v12 removeManagedReference:self->_onUnhandledPromiseRejection withOwner:self];

      v13 = +[JSManagedValue managedValueWithValue:v4 andOwner:self];
      onUnhandledPromiseRejection = self->_onUnhandledPromiseRejection;
      self->_onUnhandledPromiseRejection = v13;
      goto LABEL_10;
    }
    onUnhandledPromiseRejection = +[JSValue valueWithJSValueRef:*(void *)v14 inContext:v6];
    v9 = JSALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_85B0C((uint64_t)onUnhandledPromiseRejection, v9);
    }
  }

LABEL_10:
}

- (void)openExternalURL:(id)a3
{
  id v3 = a3;
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v19 = "-[JSAApplication openExternalURL:]";
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s url=%@", buf, 0x16u);
  }

  if (v3)
  {
    v5 = +[NSURL URLWithString:v3];
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "jsa_isSafeExternalURL"))
  {
    uint64_t v12 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    uint64_t v13 = FBSOpenApplicationOptionKeyUnlockDevice;
    v15 = &__kCFBooleanTrue;
    v16 = &__kCFBooleanTrue;
    uint64_t v14 = FBSOpenApplicationOptionKeyLaunchOrigin;
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v17 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v12 count:3];

    v9 = +[LSApplicationWorkspace defaultWorkspace];
    [v9 openSensitiveURL:v5 withOptions:v8];

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v10 = +[UIApplication jsa_sharedApplicationIfNotExtension];
  unsigned int v11 = [v10 canOpenURL:v5];

  if (v11)
  {
    v8 = +[UIApplication jsa_sharedApplicationIfNotExtension];
    [v8 jsa_openExternalURL:v5 options:&__NSDictionary0__struct completionHandler:0];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)downloadAndCacheScript:(id)a3
{
  id v3 = a3;
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = "-[JSAApplication downloadAndCacheScript:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v5 = +[JSABridge sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_27920;
  v7[3] = &unk_B33A0;
  id v8 = v3;
  id v6 = v3;
  [v5 checkForUpgradeWithCompletion:v7];
}

- (void)reloadWithNewCacheIfAvailable:(id)a3
{
  id v3 = a3;
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[JSAApplication reloadWithNewCacheIfAvailable:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_27BB8;
  block[3] = &unk_B2000;
  id v7 = v3;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)reloadWithNewCache:(id)a3
{
  id v3 = a3;
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[JSAApplication reloadWithNewCache:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_27FC8;
  block[3] = &unk_B2000;
  id v7 = v3;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (void)didFinishLaunchingWithMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = BUIsRunningTests();
  if (v4) {
    id v5 = &__NSDictionary0__struct;
  }
  else {
    id v5 = 0;
  }
  if ((v4 & 1) != 0
    || !v3
    || (+[JSAMetricsAppLaunchEvent markLaunchEndTime],
        +[JSAMetricsAppLaunchEvent consumePendingLaunchEvent](JSAMetricsAppLaunchEvent, "consumePendingLaunchEvent"), id v6 = objc_claimAutoreleasedReturnValue(), [v6 metricsDictionary], v5 = objc_claimAutoreleasedReturnValue(), v6, v5))
  {
    id v7 = +[JSABridge sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_28370;
    v9[3] = &unk_B2738;
    id v10 = v5;
    id v8 = v5;
    [v7 enqueueBlockForInitialLaunch:v9 file:@"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/JSApp/JSApp/API/Application/JSAApplication.m" line:189];
  }
  else
  {
    id v8 = JSALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v12 = "+[JSAApplication didFinishLaunchingWithMetrics:]";
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s iBooks probably just loaded a new version of javascript", buf, 0xCu);
    }
  }
}

+ (void)willEnterForeground
{
}

+ (void)didBecomeActive
{
}

+ (void)willResignActive
{
}

+ (void)didEnterBackground
{
}

+ (void)willTerminate
{
  id v6 = +[JSABridge sharedInstance];
  BOOL v3 = [v6 environment];
  int v4 = [v3 context];
  id v5 = sub_28510((uint64_t)a1, @"onTerminate", &__NSArray0__struct, v4);
}

+ (void)openProductPagesWithIds:(id)a3 contentTypes:(id)a4 focusedIndex:(unint64_t)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = JSALog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v10 componentsJoinedByString:@","];
    v15 = +[NSNumber numberWithUnsignedInteger:a5];
    *(_DWORD *)buf = 136446978;
    v29 = "+[JSAApplication openProductPagesWithIds:contentTypes:focusedIndex:options:]";
    __int16 v30 = 2112;
    v31 = v14;
    __int16 v32 = 2112;
    v33 = v15;
    __int16 v34 = 2112;
    id v35 = v12;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}s ids=[%@], focusedIndex=%@, options=%@", buf, 0x2Au);
  }
  if ([v10 count])
  {
    if ([v11 count])
    {
      id v16 = [v10 count];
      if (v16 == [v11 count])
      {
        v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
        id v21 = _NSConcreteStackBlock;
        uint64_t v22 = 3221225472;
        v23 = sub_28B24;
        v24 = &unk_B33C8;
        v25 = v17;
        id v26 = v11;
        [v10 enumerateObjectsUsingBlock:&v21];
        v27[0] = v17;
        v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5, v21, v22, v23, v24, v25);
        v27[1] = v18;
        v19 = +[NSArray arrayWithObjects:v27 count:2];
        __int16 v20 = sub_28BF4((uint64_t)a1, v19, v12);

        sub_285E0((uint64_t)a1, @"openProductPagesWithInfo", v20, 0);
      }
    }
  }
}

+ (void)openWriteReviewPageWithURL:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v14 = "+[JSAApplication openWriteReviewPageWithURL:options:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s url=%@, options=%@", buf, 0x20u);
  }

  v9 = [v6 absoluteString];
  if ([v9 length])
  {
    id v12 = v9;
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
    id v11 = sub_28BF4((uint64_t)a1, v10, v7);

    sub_285E0((uint64_t)a1, @"openWriteReviewPageWithURL", v11, 0);
  }
}

+ (void)openAccountSummaryPage
{
  BOOL v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "+[JSAApplication openAccountSummaryPage]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  sub_285E0((uint64_t)a1, @"openAccountSummaryPage", 0, 0);
}

+ (void)openNotificationSettingsPage
{
  BOOL v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "+[JSAApplication openNotificationSettingsPage]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  sub_285E0((uint64_t)a1, @"openNotificationSettingsPage", 0, 0);
}

+ (void)openAchievementSheet:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 objectForKeyedSubscript:@"achievementKind"];
  BUDynamicCast();
  id v6 = (char *)objc_claimAutoreleasedReturnValue();

  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Opening achievement sheet for achievementKind %@", buf, 0xCu);
  }

  if (v6)
  {
    id v10 = v6;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
    v9 = sub_28BF4((uint64_t)a1, v8, v4);

    sub_285E0((uint64_t)a1, @"openAchievementSheet", v9, 0);
  }
  else
  {
    v9 = JSALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v12 = "+[JSAApplication openAchievementSheet:]";
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s Ignoring achievement notification without achievementKind", buf, 0xCu);
    }
  }
}

+ (void)openYearInReview
{
  v2 = JSALog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    id v6 = "+[JSAApplication openYearInReview]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  BOOL v3 = objc_opt_new();
  [v3 setScheme:@"https"];
  [v3 setHost:@"books.apple.com"];
  [v3 setPath:@"/year-in-review"];
  id v4 = [v3 URL];
  if (v4) {
    +[JSAApplication openURL:v4 referrerURL:0 referrerApplicationName:0 options:0];
  }
}

+ (void)openURL:(id)a3 referrerURL:(id)a4 referrerApplicationName:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = JSALog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136447234;
    __int16 v20 = "+[JSAApplication openURL:referrerURL:referrerApplicationName:options:]";
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}s url=%@, referrer=%@, referrerApplicationName=%@, options=%@", (uint8_t *)&v19, 0x34u);
  }

  __int16 v15 = +[NSMutableArray array];
  id v16 = [v10 absoluteString];
  [v15 addObject:v16];

  if (v11)
  {
    [v15 addObject:v11];
    if (v12) {
      goto LABEL_5;
    }
LABEL_9:
    id v18 = +[NSNull null];
    [v15 addObject:v18];

    if (!v13) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  __int16 v17 = +[NSNull null];
  [v15 addObject:v17];

  if (!v12) {
    goto LABEL_9;
  }
LABEL_5:
  [v15 addObject:v12];
  if (v13) {
LABEL_6:
  }
    [v15 addObject:v13];
LABEL_7:
  sub_285E0((uint64_t)a1, @"openURL", v15, 0);
}

+ (void)searchForTerm:(id)a3
{
  id v3 = a3;
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v12 = "+[JSAApplication searchForTerm:]";
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s term=%@", buf, 0x16u);
  }

  int v5 = objc_opt_new();
  [v5 setHost:&stru_B6668];
  [v5 setScheme:@"itms-bookss"];
  id v6 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"action" value:@"search"];
  id v7 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"term" value:v3, v6];
  v10[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v10 count:2];
  [v5 setQueryItems:v8];

  v9 = [v5 URL];
  if (v9) {
    +[JSAApplication openURL:v9 referrerURL:0 referrerApplicationName:0 options:0];
  }
}

+ (void)recordNativeEvent:(id)a3
{
}

+ (void)recordNativeEvent:(id)a3 additionalInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = v6;
  id v8 = v7;
  if (!v7)
  {
    id v8 = +[NSNull null];
  }
  v10[1] = v8;
  v9 = +[NSArray arrayWithObjects:v10 count:2];
  sub_285E0((uint64_t)a1, @"onRecordNativeEvent", v9, 0);

  if (!v7) {
}
  }

+ (id)purchaseEventFieldsWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 topic:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_2989C;
  __int16 v32 = sub_298AC;
  id v33 = 0;
  id v14 = +[JSABridge sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_298B4;
  v21[3] = &unk_B33F0;
  id v27 = a1;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  id v18 = v13;
  id v25 = v18;
  id v26 = &v28;
  [v14 enqueueBlockPrefersSync:v21 file:@"JSAApplication.m" line:344];

  id v19 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v19;
}

+ (void)getODPTopGenre:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_29B2C;
  v5[3] = &unk_B3418;
  id v6 = a3;
  id v4 = v6;
  sub_285E0((uint64_t)a1, @"getTopGenreFromODPRanker", &__NSArray0__struct, v5);
}

+ (void)appendPageHistory:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v12 = a3;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v12 count:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_29CD0;
  v10[3] = &unk_B3418;
  id v11 = v6;
  id v9 = v6;
  sub_285E0((uint64_t)a1, @"appendPageHistory", v8, v10);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_onUnhandledPromiseRejection, 0);
}

@end