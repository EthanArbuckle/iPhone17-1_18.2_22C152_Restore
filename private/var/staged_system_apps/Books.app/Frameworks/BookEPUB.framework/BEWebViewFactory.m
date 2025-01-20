@interface BEWebViewFactory
+ (id)_booksViewWKWebViewConfiguration:(BOOL)a3 protocolCacheItem:(id)a4;
+ (id)_standardProcessPoolForAssetID:(id)a3 withSingleWebProcess:(BOOL)a4 forWebTOC:(BOOL)a5;
+ (id)_standardProcessPoolWithSingleWebProcess:(BOOL)a3 forWebTOC:(BOOL)a4;
+ (id)_standardWKPreferences:(BOOL)a3;
+ (id)_standardWKWebViewConfiguration:(id)a3 cacheItem:(id)a4 usesSingleWebProcess:(BOOL)a5 forWebTOC:(BOOL)a6;
+ (id)_viewConfiguredForBooks:(CGRect)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 stylesheetSet:(id)a9 styleManager:(id)a10 contentSupportMode:(unint64_t)a11;
+ (id)_viewConfiguredForBooks:(CGRect)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 stylesheetSet:(id)a9 styleManager:(id)a10 contentSupportMode:(unint64_t)a11 imageFilterMode:(unint64_t)a12 completion:(id)a13;
+ (id)_viewConfiguredForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 forDisplay:(BOOL)a10;
+ (id)javascriptProvidersWithPaginationOptions:(id)a3 cfiOptions:(id)a4 cleanupOptions:(id)a5 stylesheetSet:(id)a6 externalIframeJS:(id)a7 forDisplay:(BOOL)a8;
+ (id)javascriptProvidersWithPaginationOptions:(id)a3 cfiOptions:(id)a4 cleanupOptions:(id)a5 stylesheetSet:(id)a6 forDisplay:(BOOL)a7;
+ (id)viewConfiguredAsyncForBooks:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 imageFilterMode:(unint64_t)a8 stylesheetSet:(id)a9 styleManager:(id)a10 completion:(id)a11;
+ (id)viewConfiguredForBooks:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9;
+ (id)viewConfiguredForCoverContent:(CGRect)a3 bookID:(id)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cfiOptions:(id)a7;
+ (id)viewConfiguredForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9;
+ (id)viewConfiguredForPictureBooks:(CGRect)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 stylesheetSet:(id)a9;
+ (id)viewConfiguredForPreview:(CGRect)a3 enableDeveloperExtras:(BOOL)a4 bookID:(id)a5 imageFilterMode:(unint64_t)a6 protocolCacheItem:(id)a7 cleanupOptions:(id)a8 stylesheetSet:(id)a9;
+ (id)viewConfiguredForThemePreview;
+ (id)viewConfiguredForTocParse:(CGRect)a3 assetID:(id)a4 cleanupOptions:(id)a5;
+ (id)viewConfiguredForWebTOC:(CGRect)a3;
+ (id)viewCreatedForBooksAtSize:(CGSize)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 imageFilterMode:(unint64_t)a9;
+ (id)viewCreatedForBooksAtSize:(CGSize)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 imageFilterMode:(unint64_t)a9 lineGuideEnabled:(BOOL)a10;
+ (void)_addJavascript:(id)a3 userContentController:(id)a4;
+ (void)_applyMetaViewportOverridesToWebView:(id)a3 fixedLayoutSize:(CGSize)a4;
+ (void)_configureNavigationForCoalescingLoadEvents:(id)a3 userContentController:(id)a4;
+ (void)_modifyScrollViewBehaviors:(id)a3;
+ (void)_setupContentBlockingRulesforWebView:(id)a3 rule:(unint64_t)a4;
+ (void)_viewConfiguredForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 forDisplay:(BOOL)a10 completion:(id)a11;
+ (void)configureExistingWebView:(id)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 styleManager:(id)a7 completion:(id)a8;
+ (void)updateFixedLayoutWebView:(id)a3 fixedLayoutSize:(CGSize)a4;
+ (void)updateThemePreviewWebView:(id)a3 styleManager:(id)a4 stylesheetSet:(id)a5 fontFamily:(id)a6;
+ (void)viewConfiguredAsyncForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 completion:(id)a10;
+ (void)viewConfiguredForSearch:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 contentSupportMode:(unint64_t)a10 completion:(id)a11;
@end

@implementation BEWebViewFactory

+ (id)_standardProcessPoolWithSingleWebProcess:(BOOL)a3 forWebTOC:(BOOL)a4
{
  BOOL v5 = a3;
  id v6 = objc_alloc_init((Class)_WKProcessPoolConfiguration);
  if (!a4)
  {
    v7 = +[NSBundle mainBundle];
    v8 = [v7 builtInPlugInsURL];
    v9 = [v8 URLByAppendingPathComponent:@"BookEPUBWebProcessPlugin.bundle"];

    [v6 setInjectedBundleURL:v9];
  }
  [v6 setUsesSingleWebProcess:v5];
  [v6 setShouldThrowExceptionForGlobalConstantRedeclaration:0];
  [v6 setProcessSwapsOnNavigation:0];
  id v10 = [objc_alloc((Class)WKProcessPool) _initWithConfiguration:v6];

  return v10;
}

+ (id)_standardProcessPoolForAssetID:(id)a3 withSingleWebProcess:(BOOL)a4 forWebTOC:(BOOL)a5
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_15C90;
  v24 = sub_15CA0;
  id v25 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_15CA8;
  v14 = &unk_3C08A0;
  v16 = &v20;
  id v8 = a3;
  id v15 = v8;
  id v17 = a1;
  BOOL v18 = a4;
  BOOL v19 = a5;
  v9 = v12;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_409B50);
  v13((uint64_t)v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_409B50);

  id v10 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v10;
}

+ (id)_standardWKPreferences:(BOOL)a3
{
  +[UIView be_enableWKContentViewOverrides];
  +[UILongPressGestureRecognizer be_enableUIVariableDelayLoupeGestureOverrides];
  id v4 = objc_alloc_init((Class)WKPreferences);
  [v4 _setDeveloperExtrasEnabled:BEShouldEnableDeveloperExtrasSettings(a3)];
  [v4 setJavaScriptCanOpenWindowsAutomatically:0];
  [v4 _setOfflineApplicationCacheIsEnabled:0];
  [v4 _setLargeImageAsyncDecodingEnabled:0];
  [v4 _setAnimatedImageAsyncDecodingEnabled:0];
  [v4 _setShouldSuppressKeyboardInputDuringProvisionalNavigation:1];
  [v4 _setTextAutosizingEnabled:0];
  [v4 _setJavaScriptCanAccessClipboard:0];
  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = +[WKPreferences _internalDebugFeatures];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 key];
        if ([v12 isEqualToString:@"SelectionFlippingEnabled"])
        {
          unsigned __int8 v13 = [v4 _isEnabledForInternalDebugFeature:v11];

          if ((v13 & 1) == 0)
          {
            [v4 _setEnabled:1 forInternalDebugFeature:v11];
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
LABEL_12:

  if ([v5 BOOLForKey:BKDisableAccleratedWebRendering[0]]) {
    [v4 _setAcceleratedDrawingEnabled:0];
  }
  if ([v5 BOOLForKey:BKWebDrawBorders]) {
    [v4 _setCompositingBordersVisible:1];
  }

  return v4;
}

+ (id)_standardWKWebViewConfiguration:(id)a3 cacheItem:(id)a4 usesSingleWebProcess:(BOOL)a5 forWebTOC:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init((Class)WKWebpagePreferences);
  [v12 setPreferredContentMode:1];
  id v13 = objc_alloc_init((Class)WKWebViewConfiguration);
  v14 = +[WKWebsiteDataStore defaultDataStore];
  [v13 setWebsiteDataStore:v14];

  [v13 setDefaultWebpagePreferences:v12];
  long long v15 = [v11 bookID];
  if (v7)
  {
    long long v16 = [v11 bookID];
    uint64_t v17 = +[NSString stringWithFormat:@"%@_single_process", v16];

    long long v15 = (void *)v17;
  }
  long long v18 = [a1 _standardProcessPoolForAssetID:v15 withSingleWebProcess:v7 forWebTOC:v6];
  [v13 setProcessPool:v18];

  [v13 setPreferences:v10];
  [v13 setAllowsAirPlayForMediaPlayback:0];
  BOOL v19 = +[NSBundle mainBundle];
  uint64_t v20 = [v19 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  [v13 setApplicationNameForUserAgent:v20];

  [v13 _setAllowsMetaRefresh:0];
  [v13 _setApplePayEnabled:0];
  [v13 setMediaTypesRequiringUserActionForPlayback:-1];
  [v13 _setMediaDataLoadsAutomatically:0];
  [v13 setSuppressesIncrementalRendering:1];
  [v13 setDataDetectorTypes:0];
  [v13 setAllowsPictureInPictureMediaPlayback:0];
  [v13 _setDragLiftDelay:2];
  v21 = +[BEURLSchemeHandler schemeHandlerForCacheItem:v11];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v22 = [v21 supportedSchemes];
  id v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        [v13 setURLSchemeHandler:v21 forURLScheme:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      id v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v24);
  }

  return v13;
}

+ (void)_addJavascript:(id)a3 userContentController:(id)a4
{
  id v19 = a3;
  id v22 = a4;
  v21 = +[WKContentWorld pageWorld];
  BOOL v5 = BEURLIncludePatternsForBooks();
  uint64_t v6 = 0;
  do
  {
    uint64_t v20 = v6;
    uint64_t v7 = qword_32AB80[2 * v6];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v19;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = v20 & 0x7FFFFFFFFFFFFFFDLL;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (v11 == 1)
          {
            long long v15 = [v14 mainFrameOnlyJavascript:v7];
            [v14 mainFrameJavascriptURL:v7];
          }
          else
          {
            long long v15 = [v14 anyFrameJavascript:v7];
            [v14 anyFrameJavascriptURL:v7];
          long long v16 = };
          if ([v15 length])
          {
            LOBYTE(v18) = 0;
            id v17 = [objc_alloc((Class)WKUserScript) _initWithSource:v15 injectionTime:v7 forMainFrameOnly:v11 == 1 includeMatchPatternStrings:v5 excludeMatchPatternStrings:&__NSArray0__struct associatedURL:v16 contentWorld:v21 deferRunningUntilNotification:v18];
            [v22 addUserScript:v17];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    uint64_t v6 = v20 + 1;
  }
  while (v20 != 3);
}

+ (void)_setupContentBlockingRulesforWebView:(id)a3 rule:(unint64_t)a4
{
  id v5 = a3;
  [v5 be_suspendLoading];
  uint64_t v6 = +[BEContentBlockingRules sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_165B4;
  v8[3] = &unk_3C08C8;
  id v9 = v5;
  id v7 = v5;
  [v6 applyContentBlockingRule:a4 toWebView:v7 completion:v8];
}

+ (void)_applyMetaViewportOverridesToWebView:(id)a3 fixedLayoutSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  objc_opt_class();
  uint64_t v6 = BUDynamicCast();
  id v7 = v6;
  if (v6)
  {
    [v6 be_applyMetaViewportOverridesForFixedLayoutSize:width, height];
  }
  else
  {
    id v8 = [v9 be_viewportArguments];
    [v9 _overrideViewportWithArguments:v8];
  }
}

+ (void)updateFixedLayoutWebView:(id)a3 fixedLayoutSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v11 be_fixedLayoutSize];
    if (width != v8 || height != v7)
    {
      v13.double width = width;
      v13.double height = height;
      id v10 = NSStringFromSize(v13);
      NSLog(@"{IMRenderingCache} Updating webView fixed layout size to %@", v10);

      [v11 be_applyMetaViewportOverridesForFixedLayoutSize:width height];
    }
  }
}

+ (void)_modifyScrollViewBehaviors:(id)a3
{
  id v3 = [a3 scrollView];
  [v3 be_configureForBooks];
}

+ (id)_booksViewWKWebViewConfiguration:(BOOL)a3 protocolCacheItem:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [a1 _standardWKPreferences:v4];
  double v8 = [a1 _standardWKWebViewConfiguration:v7 cacheItem:v6 usesSingleWebProcess:0 forWebTOC:0];

  [v8 setMediaTypesRequiringUserActionForPlayback:0];
  [v8 _setInvisibleAutoplayNotPermitted:0];
  [v8 _setInlineMediaPlaybackRequiresPlaysInlineAttribute:0];
  [v8 setAllowsInlineMediaPlayback:1];

  return v8;
}

+ (id)_viewConfiguredForBooks:(CGRect)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 stylesheetSet:(id)a9 styleManager:(id)a10 contentSupportMode:(unint64_t)a11 imageFilterMode:(unint64_t)a12 completion:(id)a13
{
  double height = a4.height;
  double width = a4.width;
  double v21 = a3.size.height;
  double v22 = a3.size.width;
  id v23 = a13;
  id v24 = a10;
  id v25 = a6;
  id v26 = a5;
  v27 = +[BEWebViewFactory viewCreatedForBooksAtSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:imageFilterMode:](BEWebViewFactory, "viewCreatedForBooksAtSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:imageFilterMode:", v26, v25, a7, a8, a9, a12, v22, v21);
  +[BEWebViewFactory configureExistingWebView:fixedLayoutSize:protocolCacheItem:paginationOptions:styleManager:completion:](BEWebViewFactory, "configureExistingWebView:fixedLayoutSize:protocolCacheItem:paginationOptions:styleManager:completion:", v27, v26, v25, v24, v23, width, height);

  return v27;
}

+ (id)viewCreatedForBooksAtSize:(CGSize)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 imageFilterMode:(unint64_t)a9
{
  LOBYTE(v10) = 0;
  return [a1 viewCreatedForBooksAtSize:a4 protocolCacheItem:a5 paginationOptions:a6 cleanupOptions:a7 cfiOptions:a8 stylesheetSet:a3.width height:a3.height lineGuideEnabled:v10];
}

+ (id)viewCreatedForBooksAtSize:(CGSize)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 imageFilterMode:(unint64_t)a9 lineGuideEnabled:(BOOL)a10
{
  double height = a3.height;
  double width = a3.width;
  id v18 = a5;
  id v53 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a4;
  uint64_t v56 = sub_16E0C(v18);
  id v54 = a1;
  double v22 = [a1 _booksViewWKWebViewConfiguration:[v18 developerExtrasEnabled] protocolCacheItem:v21];

  if (![v18 mode]) {
    [v22 _setDrawsBackground:0];
  }
  v47 = objc_alloc_init(BEExternalIframeJS);
  BOOL v23 = [v18 mode] == &dword_4;
  v51 = objc_alloc_init(BEBooksObjectJS);
  v57[0] = v51;
  v50 = [[BEContentLayoutInfo alloc] initWithOptions:v18];
  v57[1] = v50;
  v49 = -[BEReadingSystemJS initWithPaginationMode:]([BEReadingSystemJS alloc], "initWithPaginationMode:", [v18 mode]);
  v57[2] = v49;
  v48 = objc_alloc_init(BEImageFilteringJS);
  v57[3] = v48;
  v46 = objc_alloc_init(BETextFieldDisablingJS);
  v57[4] = v46;
  id v24 = [BECFIUtilitiesJS alloc];
  [v18 gapBetweenPages];
  id v25 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v24, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v19, v23);
  v57[5] = v25;
  v52 = v22;
  id v26 = [BEContentSupportJS alloc];
  v27 = [v53 documentAttributes];
  unint64_t v55 = a9;
  long long v28 = [(BEContentSupportJS *)v26 initWithMode:v56 forDisplay:1 attributes:v27 imageFilterMode:a9 lineGuideEnabled:a10];
  v57[6] = v28;
  long long v29 = [BEContentCleanupJS alloc];
  [v18 pageLength];
  double v31 = v30;
  [v18 gapBetweenPages];
  v33 = [(BEContentCleanupJS *)v29 initWithOptions:v20 pageLength:v31 gapBetweenPages:v32];

  v57[7] = v33;
  v57[8] = v47;
  v34 = objc_alloc_init(BEReadAloudJS);
  v57[9] = v34;
  v35 = objc_alloc_init(BETriggerJS);
  v57[10] = v35;
  v36 = +[NSArray arrayWithObjects:v57 count:11];

  v37 = [v52 userContentController];
  [v54 _addJavascript:v36 userContentController:v37];
  [v53 applyToUserContentController:v37];

  v38 = [[BENavigationHandler alloc] initWithMode:0];
  v39 = [v19 assetId];

  [(BENavigationHandler *)v38 setBookID:v39];
  [(BENavigationHandler *)v38 setExternalIframeJS:v47];
  v40 = objc_alloc_init(BEUIHandler);
  v41 = (objc_class *)objc_opt_class();
  if (v56 == 4) {
    v41 = (objc_class *)objc_opt_class();
  }
  id v42 = [[v41 alloc] initWithFrame:v52 configuration:0.0, 0.0, width, height];
  v43 = +[NSUUID UUID];
  v44 = [v43 UUIDString];
  [v42 setBe_identifier:v44];

  [v42 setAutoresizingMask:18];
  [v42 setBe_navigationHandler:v38];
  [v42 setBe_userContentController:v37];
  [v42 setNavigationDelegate:v38];
  [v42 setBe_imageFilterMode:v55];
  [v42 setBe_uiHandler:v40];
  [v42 setUIDelegate:v40];
  [v42 _setObservedRenderingProgressEvents:256];

  return v42;
}

+ (void)configureExistingWebView:(id)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 styleManager:(id)a7 completion:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a7;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_16FB8;
  v24[3] = &unk_3C08F0;
  id v25 = v15;
  id v26 = v17;
  id v28 = v18;
  id v29 = a1;
  CGFloat v30 = width;
  CGFloat v31 = height;
  uint64_t v32 = sub_16E0C(v17);
  id v27 = v16;
  id v20 = v18;
  id v21 = v16;
  id v22 = v17;
  id v23 = v15;
  [v23 be_configureFontWithStyleManager:v19 completion:v24];
}

+ (void)_viewConfiguredForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 forDisplay:(BOOL)a10 completion:(id)a11
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v21 = a4;
  id v22 = a5;
  id v23 = a7;
  id v43 = a11;
  id v45 = a9;
  id v24 = a8;
  id v25 = a6;
  v46 = [a1 _standardWKPreferences:[v22 developerExtrasEnabled]];
  id v26 = [a1 _standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:];
  id v27 = [v26 userContentController];
  [v24 applyToUserContentController:v27];
  id v28 = objc_alloc_init(BEExternalIframeJS);
  id v29 = [a1 javascriptProvidersWithPaginationOptions:v22 cfiOptions:v23 cleanupOptions:v25 stylesheetSet:v24 externalIframeJS:v28 forDisplay:a10];

  id v30 = [v29 mutableCopy];
  v44 = v30;
  [a1 _addJavascript:v30 userContentController:v27];
  CGFloat v31 = [[BENavigationHandler alloc] initWithMode:0];
  if (v23)
  {
    uint64_t v32 = [v23 assetId];
    [(BENavigationHandler *)v31 setBookID:v32];
  }
  [(BENavigationHandler *)v31 setExternalIframeJS:v28];
  v33 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v26, x, y, width, height);
  v34 = +[NSUUID UUID];
  [v34 UUIDString];
  v35 = id v42 = v23;
  [(BEWKWebView *)v33 setBe_identifier:v35];

  [(BEWKWebView *)v33 setAutoresizingMask:18];
  [(BEWKWebView *)v33 setBe_navigationHandler:v31];
  [(BEWKWebView *)v33 setNavigationDelegate:v31];
  [(BEWKWebView *)v33 setAccessibilityElementsHidden:1];
  [(BEWKWebView *)v33 setUserInteractionEnabled:0];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_17478;
  v47[3] = &unk_3C0918;
  v48 = v33;
  id v49 = v22;
  id v50 = v21;
  v51 = v31;
  id v52 = v27;
  id v53 = v43;
  id v54 = a1;
  id v36 = v43;
  id v37 = v27;
  v38 = v31;
  id v39 = v21;
  id v40 = v22;
  v41 = v33;
  [(BEWKWebView *)v41 be_configureFontWithStyleManager:v45 completion:v47];
}

+ (id)viewConfiguredAsyncForBooks:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 imageFilterMode:(unint64_t)a8 stylesheetSet:(id)a9 styleManager:(id)a10 completion:(id)a11
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v22 = a11;
  id v23 = a10;
  id v24 = a9;
  id v25 = a7;
  id v26 = a6;
  id v27 = a5;
  id v28 = a4;
  id v29 = [a1 _viewConfiguredForBooks:v28 fixedLayoutSize:v27 protocolCacheItem:v26 paginationOptions:v25 cleanupOptions:v24 cfiOptions:v23 stylesheetSet:x styleManager:y width:width height:height cleanupOptions:CGSizeZero.width cleanupOptions:CGSizeZero.height sub_16E0C:v27 a8:v22];

  return v29;
}

+ (void)viewConfiguredAsyncForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 completion:(id)a10
{
  LOBYTE(v10) = 0;
  [a1 _viewConfiguredForPagination:a4 protocolCacheItem:a5 paginationOptions:a6 cleanupOptions:a7 cfiOptions:a8 stylesheetSet:a9 styleManager:a10 forDisplay:a3.origin.x a3.origin.y a3.size.width a3.size.height v10 a10];
}

+ (void)viewConfiguredForSearch:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 contentSupportMode:(unint64_t)a10 completion:(id)a11
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v56 = a4;
  id v21 = a5;
  id v57 = a11;
  id v58 = a9;
  id v50 = a8;
  id v52 = a7;
  id v22 = a6;
  id v54 = a1;
  v59 = [a1 _standardWKPreferences:0];
  unint64_t v55 = [a1 _standardWKWebViewConfiguration:v59 cacheItem:v56 usesSingleWebProcess:1 forWebTOC:0];
  id v53 = [v55 userContentController];
  v51 = objc_alloc_init(BEExternalIframeJS);
  BOOL v23 = [v21 mode] == &dword_4;
  id v24 = objc_alloc_init(BEBooksObjectJS);
  v68[0] = v24;
  id v25 = objc_alloc_init(BEImageFilteringJS);
  v68[1] = v25;
  id v26 = [[BEContentLayoutInfo alloc] initWithOptions:v21];
  v68[2] = v26;
  id v27 = [BECFIUtilitiesJS alloc];
  [v21 gapBetweenPages];
  id v28 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v27, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v52, v23);
  v68[3] = v28;
  id v29 = [BEContentSupportJS alloc];
  id v30 = [v50 documentAttributes];
  CGFloat v31 = [(BEContentSupportJS *)v29 initWithMode:a10 forDisplay:0 attributes:v30 imageFilterMode:0 lineGuideEnabled:0];
  v68[4] = v31;
  uint64_t v32 = [BEContentCleanupJS alloc];
  [v21 pageLength];
  double v34 = v33;
  [v21 gapBetweenPages];
  id v36 = [(BEContentCleanupJS *)v32 initWithOptions:v22 pageLength:v34 gapBetweenPages:v35];

  v68[5] = v36;
  v68[6] = v51;
  uint64_t v37 = +[NSArray arrayWithObjects:v68 count:7];

  v38 = (void *)v37;
  [v54 _addJavascript:v37 userContentController:v53];
  [v50 applyToUserContentController:v53];

  id v39 = [[BENavigationHandler alloc] initWithMode:0];
  id v40 = [v52 assetId];

  [(BENavigationHandler *)v39 setBookID:v40];
  [(BENavigationHandler *)v39 setExternalIframeJS:v51];
  v41 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v55, x, y, width, height);
  id v42 = +[NSUUID UUID];
  id v43 = [v42 UUIDString];
  [(BEWKWebView *)v41 setBe_identifier:v43];

  [(BEWKWebView *)v41 setAutoresizingMask:18];
  [(BEWKWebView *)v41 setBe_navigationHandler:v39];
  [(BEWKWebView *)v41 setNavigationDelegate:v39];
  [(BEWKWebView *)v41 setUserInteractionEnabled:0];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_17B40;
  v60[3] = &unk_3C0918;
  v61 = v41;
  id v62 = v21;
  id v67 = v54;
  id v63 = v56;
  v64 = v39;
  id v65 = v53;
  id v66 = v57;
  id v44 = v57;
  id v45 = v53;
  v46 = v39;
  id v47 = v56;
  id v48 = v21;
  id v49 = v41;
  [(BEWKWebView *)v49 be_configureFontWithStyleManager:v58 completion:v60];
}

+ (id)_viewConfiguredForBooks:(CGRect)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 stylesheetSet:(id)a9 styleManager:(id)a10 contentSupportMode:(unint64_t)a11
{
  double height = a4.height;
  double width = a4.width;
  double v18 = a3.size.height;
  double v19 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v23 = a5;
  id v24 = a6;
  id v65 = a10;
  id v25 = a9;
  id v26 = a8;
  id v27 = a7;
  id v66 = v23;
  id v28 = [a1 _booksViewWKWebViewConfiguration:[v24 developerExtrasEnabled] protocolCacheItem:v23];
  if (![v24 mode]) {
    [v28 _setDrawsBackground:0];
  }
  id v67 = objc_alloc_init(BEExternalIframeJS);
  BOOL v29 = [v24 mode] == &dword_4;
  id v63 = objc_alloc_init(BEBooksObjectJS);
  v69[0] = v63;
  id v62 = [[BEContentLayoutInfo alloc] initWithOptions:v24];
  v69[1] = v62;
  v61 = -[BEReadingSystemJS initWithPaginationMode:]([BEReadingSystemJS alloc], "initWithPaginationMode:", [v24 mode]);
  v69[2] = v61;
  v59 = objc_alloc_init(BEImageFilteringJS);
  v69[3] = v59;
  id v58 = objc_alloc_init(BETextFieldDisablingJS);
  v69[4] = v58;
  v68 = v28;
  id v30 = [BECFIUtilitiesJS alloc];
  [v24 gapBetweenPages];
  CGFloat v31 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v30, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v26, v29);
  v69[5] = v31;
  uint64_t v32 = [BEContentSupportJS alloc];
  double v33 = v25;
  [v25 documentAttributes];
  double v34 = v60 = v26;
  double v35 = [(BEContentSupportJS *)v32 initWithMode:a11 forDisplay:1 attributes:v34 imageFilterMode:0 lineGuideEnabled:0];
  v69[6] = v35;
  id v36 = [BEContentCleanupJS alloc];
  [v24 pageLength];
  double v38 = v37;
  [v24 gapBetweenPages];
  id v40 = [(BEContentCleanupJS *)v36 initWithOptions:v27 pageLength:v38 gapBetweenPages:v39];

  v69[7] = v40;
  v69[8] = v67;
  v41 = objc_alloc_init(BEReadAloudJS);
  v69[9] = v41;
  id v42 = objc_alloc_init(BETriggerJS);
  v69[10] = v42;
  uint64_t v43 = +[NSArray arrayWithObjects:v69 count:11];

  id v44 = [v68 userContentController];
  v64 = (void *)v43;
  [a1 _addJavascript:v43 userContentController:v44];
  [v33 applyToUserContentController:v44];

  id v45 = [[BENavigationHandler alloc] initWithMode:0];
  v46 = [v60 assetId];

  [(BENavigationHandler *)v45 setBookID:v46];
  [(BENavigationHandler *)v45 setExternalIframeJS:v67];
  id v47 = objc_alloc_init(BEUIHandler);
  id v48 = (objc_class *)objc_opt_class();
  if (a11 == 4) {
    id v48 = (objc_class *)objc_opt_class();
  }
  id v49 = [[v48 alloc] initWithFrame:v68 configuration:x, y, v19, v18];
  id v50 = +[NSUUID UUID];
  v51 = [v50 UUIDString];
  [v49 setBe_identifier:v51];

  [v49 setAutoresizingMask:18];
  [v49 setBe_navigationHandler:v45];
  [v49 setNavigationDelegate:v45];
  [v49 setBe_uiHandler:v47];
  [v49 setUIDelegate:v47];
  [v49 _setObservedRenderingProgressEvents:256];
  if (v65) {
    [v49 be_configureFontWithStyleManager:v65 completion:&stru_3C0958];
  }
  [v49 setBe_isHorizontalScroll:[v24 isHorizontalScroll]];
  id v52 = [v66 sinfInfo];
  id v53 = [v52 allKeys];
  id v54 = [v53 count];

  if (v54) {
    [v49 be_containsProtectedContent];
  }
  [v49 be_enableAX];
  [v24 applyToWebView:v49];
  [a1 _setupContentBlockingRulesforWebView:v49 rule:[v66 contentBlockingRule]];
  [a1 _applyMetaViewportOverridesToWebView:v49 fixedLayoutSize:CGSizeMake(width, height)];
  if (a11 == 4)
  {
    unint64_t v55 = [v49 configuration];
    id v56 = [v55 defaultWebpagePreferences];
    [v56 _setMouseEventPolicy:1];
  }
  [a1 _modifyScrollViewBehaviors:v49];
  [a1 _configureNavigationForCoalescingLoadEvents:v45 userContentController:v44];

  return v49;
}

+ (id)viewConfiguredForBooks:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = [a1 _viewConfiguredForBooks:v24 fixedLayoutSize:v23 protocolCacheItem:v22 paginationOptions:v21 cleanupOptions:v20 cfiOptions:v19 stylesheetSet:x styleManager:y contentSupportMode:width, height, CGSizeZero.width, CGSizeZero.height, sub_16E0C(v23)];

  return v25;
}

+ (id)viewConfiguredForPictureBooks:(CGRect)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 stylesheetSet:(id)a9
{
  double height = a4.height;
  double width = a4.width;
  double v15 = a3.size.height;
  double v16 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = [a1 _viewConfiguredForBooks:v24 fixedLayoutSize:v23 protocolCacheItem:v22 paginationOptions:v21 cleanupOptions:v20 cfiOptions:0 stylesheetSet:x styleManager:y contentSupportMode:width height:sub_16E0C(v23)];

  return v25;
}

+ (id)viewConfiguredForCoverContent:(CGRect)a3 bookID:(id)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cfiOptions:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a7;
  id v16 = a6;
  id v39 = a5;
  id v38 = a4;
  id v40 = [a1 _standardWKPreferences:[v16 developerExtrasEnabled]];
  double v37 = [a1 _standardWKWebViewConfiguration:v40 cacheItem:v39 usesSingleWebProcess:1 forWebTOC:0];
  BOOL v17 = [v16 mode] == &dword_4;
  double v18 = objc_alloc_init(BEBooksObjectJS);
  v41[0] = v18;
  id v19 = [[BEContentLayoutInfo alloc] initWithOptions:v16];
  v41[1] = v19;
  id v20 = -[BEReadingSystemJS initWithPaginationMode:]([BEReadingSystemJS alloc], "initWithPaginationMode:", [v16 mode]);
  v41[2] = v20;
  id v21 = objc_alloc_init(BEImageFilteringJS);
  v41[3] = v21;
  id v22 = objc_alloc_init(BETextFieldDisablingJS);
  v41[4] = v22;
  id v23 = [BECFIUtilitiesJS alloc];
  [v16 gapBetweenPages];
  id v24 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v23, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v15, v17);

  v41[5] = v24;
  id v25 = [BEContentSupportJS alloc];
  uint64_t v26 = sub_16E0C(v16);

  id v27 = [(BEContentSupportJS *)v25 initWithMode:v26 forDisplay:1 imageFilterMode:0 lineGuideEnabled:0];
  v41[6] = v27;
  id v28 = +[NSArray arrayWithObjects:v41 count:7];

  BOOL v29 = [v37 userContentController];
  [a1 _addJavascript:v28 userContentController:v29];

  id v30 = [[BENavigationHandler alloc] initWithMode:3];
  [(BENavigationHandler *)v30 setBookID:v38];

  CGFloat v31 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v37, x, y, width, height);
  uint64_t v32 = +[NSUUID UUID];
  double v33 = [v32 UUIDString];
  [(BEWKWebView *)v31 setBe_identifier:v33];

  [(BEWKWebView *)v31 setAutoresizingMask:18];
  [(BEWKWebView *)v31 setBe_navigationHandler:v30];
  [(BEWKWebView *)v31 setNavigationDelegate:v30];
  [(BEWKWebView *)v31 setUserInteractionEnabled:0];
  [(BEWKWebView *)v31 be_enableAX];
  id v34 = [v39 contentBlockingRule];

  [a1 _setupContentBlockingRulesforWebView:v31 rule:v34];
  [a1 _applyMetaViewportOverridesToWebView:v31 fixedLayoutSize:CGSizeZero.width, CGSizeZero.height];
  [a1 _modifyScrollViewBehaviors:v31];
  double v35 = [v37 userContentController];
  [a1 _configureNavigationForCoalescingLoadEvents:v30 userContentController:v35];

  return v31;
}

+ (id)viewConfiguredForPreview:(CGRect)a3 enableDeveloperExtras:(BOOL)a4 bookID:(id)a5 imageFilterMode:(unint64_t)a6 protocolCacheItem:(id)a7 cleanupOptions:(id)a8 stylesheetSet:(id)a9
{
  BOOL v13 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v42 = a9;
  id v19 = a8;
  id v44 = a7;
  id v43 = a5;
  id v45 = [a1 _standardWKPreferences:v13];
  id v40 = [a1 _standardWKWebViewConfiguration:v45 cacheItem:v44 usesSingleWebProcess:0 forWebTOC:0];
  [v40 setSuppressesIncrementalRendering:0];
  [v40 setIgnoresViewportScaleLimits:1];
  id v39 = objc_alloc_init(BEExternalIframeJS);
  id v20 = objc_alloc_init(BEBooksObjectJS);
  v46[0] = v20;
  id v21 = [BEContentLayoutInfo alloc];
  id v22 = objc_opt_new();
  id v23 = [(BEContentLayoutInfo *)v21 initWithOptions:v22];
  v46[1] = v23;
  id v24 = [[BEReadingSystemJS alloc] initWithPaginationMode:0];
  v46[2] = v24;
  id v25 = objc_alloc_init(BEImageFilteringJS);
  v46[3] = v25;
  uint64_t v26 = objc_alloc_init(BETextFieldDisablingJS);
  v46[4] = v26;
  id v27 = [[BEContentSupportJS alloc] initWithMode:5 forDisplay:1 attributes:&__NSDictionary0__struct imageFilterMode:a6 lineGuideEnabled:0];
  v46[5] = v27;
  id v28 = [[BEContentCleanupJS alloc] initWithOptions:v19 pageLength:0.0 gapBetweenPages:0.0];

  v46[6] = v28;
  v46[7] = v39;
  BOOL v29 = objc_alloc_init(BETriggerJS);
  v46[8] = v29;
  id v30 = +[NSArray arrayWithObjects:v46 count:9];

  CGFloat v31 = [v40 userContentController];
  [a1 _addJavascript:v30 userContentController:v31];
  [v42 applyToUserContentController:v31];

  uint64_t v32 = [[BENavigationHandler alloc] initWithMode:3];
  [(BENavigationHandler *)v32 setBookID:v43];

  [(BENavigationHandler *)v32 setExternalIframeJS:v39];
  double v33 = objc_alloc_init(BEUIHandler);
  id v34 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v40, x, y, width, height);
  double v35 = +[NSUUID UUID];
  id v36 = [v35 UUIDString];
  [(BEWKWebView *)v34 setBe_identifier:v36];

  [(BEWKWebView *)v34 setAutoresizingMask:18];
  [(BEWKWebView *)v34 setBe_navigationHandler:v32];
  [(BEWKWebView *)v34 setNavigationDelegate:v32];
  [(BEWKWebView *)v34 setBe_uiHandler:v33];
  [(BEWKWebView *)v34 setUIDelegate:v33];
  [(BEWKWebView *)v34 _setObservedRenderingProgressEvents:64];
  [(BEWKWebView *)v34 be_enableAX];
  id v37 = [v44 contentBlockingRule];

  [a1 _setupContentBlockingRulesforWebView:v34 rule:v37];
  [a1 _configureNavigationForCoalescingLoadEvents:v32 userContentController:v31];

  return v34;
}

+ (id)viewConfiguredForWebTOC:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [a1 _standardWKPreferences:0];
  id v9 = [a1 _standardWKWebViewConfiguration:v8 cacheItem:0 usesSingleWebProcess:1 forWebTOC:1];
  uint64_t v10 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v9, x, y, width, height);
  id v11 = +[NSUUID UUID];
  uint64_t v12 = [v11 UUIDString];
  [(BEWKWebView *)v10 setBe_identifier:v12];

  [(BEWKWebView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BEWKWebView *)v10 setAutoresizingMask:0];
  [(BEWKWebView *)v10 be_enableAX];
  [a1 _setupContentBlockingRulesforWebView:v10 rule:1];
  [a1 _applyMetaViewportOverridesToWebView:v10 fixedLayoutSize:CGSizeZero.width, CGSizeZero.height];

  return v10;
}

+ (id)viewConfiguredForThemePreview
{
  id v3 = [a1 _standardWKPreferences:0];
  BOOL v4 = [a1 _standardWKWebViewConfiguration:v3 cacheItem:0 usesSingleWebProcess:0 forWebTOC:0];
  [v4 _setDrawsBackground:0];
  id v5 = -[BEThemePreviewWKWebView initWithFrame:configuration:]([BEThemePreviewWKWebView alloc], "initWithFrame:configuration:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v5;
}

+ (void)updateThemePreviewWebView:(id)a3 styleManager:(id)a4 stylesheetSet:(id)a5 fontFamily:(id)a6
{
  id v14 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  objc_opt_class();
  uint64_t v12 = BUDynamicCast();
  BOOL v13 = v12;
  if (v12)
  {
    [v12 be_registerFontFamilyForStyleManager:v9 fontFamily:v11];
    [v10 applyToWebView:v14];
  }
}

+ (id)javascriptProvidersWithPaginationOptions:(id)a3 cfiOptions:(id)a4 cleanupOptions:(id)a5 stylesheetSet:(id)a6 forDisplay:(BOOL)a7
{
  return [a1 javascriptProvidersWithPaginationOptions:a3 cfiOptions:a4 cleanupOptions:a5 stylesheetSet:a6 externalIframeJS:0 forDisplay:a7];
}

+ (id)javascriptProvidersWithPaginationOptions:(id)a3 cfiOptions:(id)a4 cleanupOptions:(id)a5 stylesheetSet:(id)a6 externalIframeJS:(id)a7 forDisplay:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  BOOL v17 = (BEExternalIframeJS *)a7;
  if (!v17) {
    BOOL v17 = objc_alloc_init(BEExternalIframeJS);
  }
  id v34 = v17;
  BOOL v18 = [v13 mode] == &dword_4;
  id v36 = objc_alloc_init(BEBooksObjectJS);
  v37[0] = v36;
  double v35 = [[BEContentLayoutInfo alloc] initWithOptions:v13];
  v37[1] = v35;
  double v33 = objc_alloc_init(BEImageFilteringJS);
  v37[2] = v33;
  uint64_t v32 = -[BEReadingSystemJS initWithPaginationMode:]([BEReadingSystemJS alloc], "initWithPaginationMode:", [v13 mode]);
  v37[3] = v32;
  id v19 = [BECFIUtilitiesJS alloc];
  [v13 gapBetweenPages];
  id v20 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v19, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v14, v18);
  v37[4] = v20;
  id v21 = [BEContentSupportJS alloc];
  uint64_t v22 = sub_16E0C(v13);
  id v23 = [v16 documentAttributes];
  id v24 = [(BEContentSupportJS *)v21 initWithMode:v22 forDisplay:v8 attributes:v23 imageFilterMode:0 lineGuideEnabled:0];
  v37[5] = v24;
  id v25 = [BEContentCleanupJS alloc];
  [v13 pageLength];
  double v27 = v26;
  [v13 gapBetweenPages];
  BOOL v29 = [(BEContentCleanupJS *)v25 initWithOptions:v15 pageLength:v27 gapBetweenPages:v28];
  v37[6] = v29;
  v37[7] = v34;
  id v30 = +[NSArray arrayWithObjects:v37 count:8];

  return v30;
}

+ (id)viewConfiguredForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9
{
  LOBYTE(v10) = 0;
  return [a1 _viewConfiguredForPagination:a4 protocolCacheItem:a5 paginationOptions:a6 cleanupOptions:a7 cfiOptions:a8 stylesheetSet:a9 styleManager:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v10];
}

+ (id)_viewConfiguredForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 forDisplay:(BOOL)a10
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v20 = a4;
  id v21 = a5;
  id v22 = a7;
  id v38 = a9;
  id v23 = a8;
  id v24 = a6;
  id v37 = [a1 _standardWKPreferences:[v21 developerExtrasEnabled]];
  id v39 = v20;
  id v25 = [a1 _standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:];
  double v26 = [v25 userContentController];
  [v23 applyToUserContentController:v26];
  double v27 = objc_alloc_init(BEExternalIframeJS);
  double v28 = [a1 javascriptProvidersWithPaginationOptions:v21 cfiOptions:v22 cleanupOptions:v24 stylesheetSet:v23 externalIframeJS:v27 forDisplay:a10];

  id v29 = [v28 mutableCopy];
  id v36 = v29;
  [a1 _addJavascript:v29 userContentController:v26];
  id v30 = [[BENavigationHandler alloc] initWithMode:0];
  if (v22)
  {
    CGFloat v31 = [v22 assetId];
    [(BENavigationHandler *)v30 setBookID:v31];
  }
  [(BENavigationHandler *)v30 setExternalIframeJS:v27];
  uint64_t v32 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v25, x, y, width, height);
  double v33 = +[NSUUID UUID];
  id v34 = [v33 UUIDString];
  [(BEWKWebView *)v32 setBe_identifier:v34];

  [(BEWKWebView *)v32 setAutoresizingMask:18];
  [(BEWKWebView *)v32 setBe_navigationHandler:v30];
  [(BEWKWebView *)v32 setNavigationDelegate:v30];
  [(BEWKWebView *)v32 setAccessibilityElementsHidden:1];
  [(BEWKWebView *)v32 setUserInteractionEnabled:0];
  if (v38) {
    [(BEWKWebView *)v32 be_configureFontWithStyleManager:v38 completion:&stru_3C0978];
  }
  -[BEWKWebView setBe_isHorizontalScroll:](v32, "setBe_isHorizontalScroll:", [v21 isHorizontalScroll]);
  [v21 applyToWebView:v32];
  [a1 _setupContentBlockingRulesforWebView:v32 rule:[v39 contentBlockingRule]];
  [a1 _applyMetaViewportOverridesToWebView:v32 fixedLayoutSize:CGSizeZero.width, CGSizeZero.height];
  [a1 _modifyScrollViewBehaviors:v32];
  [a1 _configureNavigationForCoalescingLoadEvents:v30 userContentController:v26];

  return v32;
}

+ (id)viewConfiguredForTocParse:(CGRect)a3 assetID:(id)a4 cleanupOptions:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  id v12 = a4;
  id v30 = [a1 _standardWKPreferences:0];
  [v30 _setLoadsImagesAutomatically:0];
  id v13 = [a1 _standardWKWebViewConfiguration:v30 cacheItem:0 usesSingleWebProcess:1 forWebTOC:0];
  id v14 = [v13 userContentController];
  id v15 = objc_alloc_init(BEExternalIframeJS);
  id v16 = [BECFIUtilitiesJS alloc];
  BOOL v17 = objc_opt_new();
  id v29 = [(BECFIUtilitiesJS *)v16 initWithOptions:v17 gapBetweenPages:0 paginatedTopToBottom:0.0];

  BOOL v18 = objc_alloc_init(BEBooksObjectJS);
  v31[0] = v18;
  id v19 = [BEContentLayoutInfo alloc];
  id v20 = objc_opt_new();
  id v21 = [(BEContentLayoutInfo *)v19 initWithOptions:v20];
  v31[1] = v21;
  v31[2] = v29;
  id v22 = [[BEContentCleanupJS alloc] initWithOptions:v11 pageLength:0.0 gapBetweenPages:0.0];

  v31[3] = v22;
  v31[4] = v15;
  id v23 = +[NSArray arrayWithObjects:v31 count:5];

  [a1 _addJavascript:v23 userContentController:v14];
  id v24 = [[BENavigationHandler alloc] initWithMode:0];
  [(BENavigationHandler *)v24 setBookID:v12];

  [(BENavigationHandler *)v24 setExternalIframeJS:v15];
  id v25 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v13, x, y, width, height);
  double v26 = +[NSUUID UUID];
  double v27 = [v26 UUIDString];
  [(BEWKWebView *)v25 setBe_identifier:v27];

  [(BEWKWebView *)v25 setAutoresizingMask:18];
  [(BEWKWebView *)v25 setBe_navigationHandler:v24];
  [(BEWKWebView *)v25 setNavigationDelegate:v24];
  [(BEWKWebView *)v25 setAccessibilityElementsHidden:1];
  [(BEWKWebView *)v25 setUserInteractionEnabled:0];
  [a1 _setupContentBlockingRulesforWebView:v25 rule:1];
  [a1 _configureNavigationForCoalescingLoadEvents:v24 userContentController:v14];

  return v25;
}

+ (void)_configureNavigationForCoalescingLoadEvents:(id)a3 userContentController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setShouldWaitForJavascriptLoadComplete:1];
  BOOL v8 = objc_opt_new();
  uint64_t v10 = v8;
  id v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [a1 _addJavascript:v9 userContentController:v6];

  [v6 removeScriptMessageHandlerForName:@"BENavigationHandlerJSLoadComplete"];
  [v6 be_addScriptMessageHandler:v7 name:@"BENavigationHandlerJSLoadComplete"];
}

@end