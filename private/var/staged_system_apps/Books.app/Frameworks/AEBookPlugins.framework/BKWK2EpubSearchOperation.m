@interface BKWK2EpubSearchOperation
- (BKWK2LoaderContentInfoRequest)configureRequest;
- (BKWK2WebViewLoader)loader;
- (BOOL)_doSearch;
- (BOOL)_indexTextContent:(id)a3;
- (BOOL)_loadWebView;
- (BOOL)_startFindPerformIndexing:(BOOL)a3;
- (BOOL)_waitForFindSemaphore;
- (BOOL)_waitForLoadSemaphore;
- (BOOL)contentProcessDidTerminate;
- (BOOL)requiresMainThread;
- (BOOL)successfulLoad;
- (NSArray)physicalPageMap;
- (NSURL)baseURL;
- (NSURL)url;
- (OS_dispatch_semaphore)findSemaphore;
- (OS_dispatch_semaphore)loadSemaphore;
- (id)webView;
- (unint64_t)_semaphoreWaitTime;
- (void)_addResultsWithPhysicalPageHrefs:(id)a3 selectedRangeResult:(id)a4;
- (void)_configureWebView;
- (void)_didFinishConfiguringWebView;
- (void)_loadWebView:(id)a3 bookSnapshot:(id)a4 paginationOptions:(id)a5 stylesheetSet:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 isConfigured:(BOOL)a9;
- (void)_loadWebViewFromMainThread;
- (void)_postSearch:(id)a3;
- (void)_startFind;
- (void)_startFindPerformIndexingFromMainThread:(BOOL)a3;
- (void)_startWebKitFind;
- (void)_webView:(id)a3 didCountMatches:(unint64_t)a4 forString:(id)a5;
- (void)_webView:(id)a3 didFailToFindString:(id)a4;
- (void)_webView:(id)a3 didFindMatches:(unint64_t)a4 forString:(id)a5 withMatchIndex:(int64_t)a6;
- (void)cancel;
- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5;
- (void)navigationHandlerWebContentLoadFailed:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setConfigureRequest:(id)a3;
- (void)setContentProcessDidTerminate:(BOOL)a3;
- (void)setFindSemaphore:(id)a3;
- (void)setLoadSemaphore:(id)a3;
- (void)setLoader:(id)a3;
- (void)setPhysicalPageMap:(id)a3;
- (void)setSuccessfulLoad:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation BKWK2EpubSearchOperation

- (BOOL)requiresMainThread
{
  return 0;
}

- (id)webView
{
  v2 = [(BKWK2EpubSearchOperation *)self loader];
  v3 = [v2 webView];

  return v3;
}

- (BOOL)_loadWebView
{
  v3 = _AESearchLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_doSearch loading web view", (uint8_t *)buf, 2u);
  }

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  [(BKWK2EpubSearchOperation *)self setLoadSemaphore:v4];

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E65BC;
  block[3] = &unk_1DC8D8;
  objc_copyWeak(&v8, buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  BOOL v5 = [(BKWK2EpubSearchOperation *)self _waitForLoadSemaphore];
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
  return v5;
}

- (void)_loadWebViewFromMainThread
{
  if ([(BKWK2EpubSearchOperation *)self isCancelled]) {
    return;
  }
  v46 = [(BKSearchOperation *)self searchBook];
  v3 = +[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:v46 ordinal:[(BKSearchOperation *)self ordinal]];
  dispatch_semaphore_t v4 = [v3 url];
  [(BKWK2EpubSearchOperation *)self setUrl:v4];

  BOOL v5 = [(BKSearchOperation *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    if ([v3 isFixedLayout])
    {
      [v3 fixedLayoutSize];
      v45 = +[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v3, 0);
      v12 = [v3 bookLanguage];
      v10 = +[BEContentCleanupJSOptions fixedLayoutOptionsWithLanguage:v12];

      v13 = +[ContentViewStyleManager getPictureBookUserStyleSheetWithLegacyBook:](ContentViewStyleManager, "getPictureBookUserStyleSheetWithLegacyBook:", [v46 shouldDisableOptimizeSpeed] ^ 1);
      id v14 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
      v57 = v13;
      v15 = +[NSArray arrayWithObjects:&v57 count:1];
      id v11 = [v14 initWithAllFrameStylesheets:v15];
    }
    else
    {
      v16 = [(BKSearchOperation *)self delegate];
      v17 = [v16 configuration];

      [v17 contentLayoutSize];
      v45 = +[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v3, v17);
      v10 = +[BEContentCleanupJSOptions cleanupJSOptionsForBookInfoSnapshot:v3 withConfiguration:v17];
      [v17 contentLayoutSize];
      [v17 gutterWidth];
      v18 = objc_alloc_init(ContentViewStyleManagerBookInfo);
      -[ContentViewStyleManagerBookInfo setRespectImageSizeClassIsPrefix:](v18, "setRespectImageSizeClassIsPrefix:", [v3 respectImageSizeClassIsPrefix]);
      v19 = [v3 respectImageSizeClass];
      [(ContentViewStyleManagerBookInfo *)v18 setRespectImageSizeClass:v19];

      v20 = [v3 bookLanguage];
      [(ContentViewStyleManagerBookInfo *)v18 setLanguage:v20];

      [v17 contentLayoutSize];
      v21 = +[ContentViewStyleManager getInlineStyleSheetForConfiguration:bookInfo:contentLayoutSize:webkit2:](ContentViewStyleManager, "getInlineStyleSheetForConfiguration:bookInfo:contentLayoutSize:webkit2:", v17, v18, 1);
      id v22 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
      CFStringRef v56 = @"html { width: auto !important; height: auto !important; } body { overflow: hidden; } video { max-height: 95% !important; } div { max-width: 100%; }";
      v23 = +[NSArray arrayWithObjects:&v56 count:1];
      if (v21)
      {
        v55 = v21;
        v24 = +[NSArray arrayWithObjects:&v55 count:1];
        id v11 = [v22 initWithMainframeOnlyStylesheets:v23 allFrameStylesheets:v24];
      }
      else
      {
        id v11 = [v22 initWithMainframeOnlyStylesheets:v23 allFrameStylesheets:&__NSArray0__struct];
      }
    }
    goto LABEL_12;
  }
  v6 = [(BKSearchOperation *)self delegate];
  v7 = [v6 searchConfiguration];

  if (!v7) {
    goto LABEL_6;
  }
  id v8 = [(BKSearchOperation *)self delegate];
  v9 = [v8 searchConfiguration];

  v45 = [v9 paginationOptions];
  v10 = [v9 cleanupOptions];
  id v11 = [v9 stylesheetSet];
  [v9 contentLayoutSize];

LABEL_12:
  v25 = +[BECFIUtilitiesJSOptions cfiUtilitiesJSOptionsForBookInfoSnapshot:v3 ordinal:[(BKSearchOperation *)self ordinal]];
  unsigned int v26 = [v3 isFixedLayout];
  uint64_t v27 = 4;
  if (!v26) {
    uint64_t v27 = 1;
  }
  uint64_t v44 = v27;
  objc_initWeak(&location, self);
  v28 = [(BKSearchOperation *)self delegate];
  CGRectMakeWithSize();
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v37 = [v3 cacheItem];
  v38 = [v46 styleManager];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_E6C14;
  v47[3] = &unk_1DDA58;
  objc_copyWeak(&v53, &location);
  id v39 = v3;
  id v48 = v39;
  id v40 = v45;
  id v49 = v40;
  id v41 = v11;
  id v50 = v41;
  id v42 = v10;
  id v51 = v42;
  id v43 = v25;
  id v52 = v43;
  [v28 provideWebView:v37 protocolCacheItem:v40 paginationOptions:v42 cleanupOptions:v43 cfiOptions:v41 stylesheetSet:v38 styleManager:v30 contentSupportMode:v32 completion:v34];

  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);
}

- (void)_loadWebView:(id)a3 bookSnapshot:(id)a4 paginationOptions:(id)a5 stylesheetSet:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 isConfigured:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (([(BKWK2EpubSearchOperation *)self isCancelled] & 1) == 0)
  {
    v21 = [v15 be_navigationHandler];
    [v21 setDelegate:self];

    [v15 _setFindDelegate:self];
    [v15 setAutoresizingMask:18];
    [v15 setOpaque:0];
    [v17 fontSize];
    [v15 _setTextZoomFactor:];
    id v22 = [[BKWK2WebViewLoader alloc] initWithPaginationOptions:v17 ordinal:[(BKSearchOperation *)self ordinal]];
    [(BKWK2EpubSearchOperation *)self setLoader:v22];

    v23 = [(BKWK2EpubSearchOperation *)self loader];
    [v23 setWebView:v15];

    if (a9)
    {
      [(BKWK2EpubSearchOperation *)self setConfigureRequest:0];
    }
    else
    {
      objc_initWeak(&location, self);
      int64_t v24 = [(BKSearchOperation *)self ordinal];
      double v32 = _NSConcreteStackBlock;
      uint64_t v33 = 3221225472;
      double v34 = sub_E6F60;
      double v35 = &unk_1DDA80;
      objc_copyWeak(&v36, &location);
      v25 = +[BKWK2LoaderContentInfoRequest contentInfoRequestWithPaginationOptions:v17 cleanupOptions:v19 cfiOptions:v20 ordinal:v24 stylesheetSet:v18 completion:&v32];
      -[BKWK2EpubSearchOperation setConfigureRequest:](self, "setConfigureRequest:", v25, v32, v33, v34, v35);

      unsigned int v26 = [(BKWK2EpubSearchOperation *)self configureRequest];
      [v26 setRestoreFrame:0];

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
    id v27 = objc_alloc((Class)NSURLRequest);
    v28 = [v16 url];
    id v29 = [v27 initWithURL:v28];

    double v30 = [(BKWK2EpubSearchOperation *)self webView];
    id v31 = [v30 loadRequest:v29];
  }
}

- (void)_configureWebView
{
  if (([(BKWK2EpubSearchOperation *)self isCancelled] & 1) == 0)
  {
    id v4 = [(BKWK2EpubSearchOperation *)self configureRequest];
    if (v4)
    {
      [(BKWK2EpubSearchOperation *)self setConfigureRequest:0];
      v3 = [(BKWK2EpubSearchOperation *)self loader];
      [v3 enqueueContentInfoRequest:v4];
    }
    else
    {
      [(BKWK2EpubSearchOperation *)self _didFinishConfiguringWebView];
    }
  }
}

- (BOOL)_waitForLoadSemaphore
{
  if ([(BKWK2EpubSearchOperation *)self isCancelled]) {
    return 0;
  }
  v3 = _AESearchLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v11 = (int)self;
    __int16 v12 = 1024;
    unsigned int v13 = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "START _waitForLoadSemaphore %x for ordinal: %d", buf, 0xEu);
  }

  id v4 = [(BKWK2EpubSearchOperation *)self loadSemaphore];
  intptr_t v5 = dispatch_semaphore_wait(v4, [(BKWK2EpubSearchOperation *)self _semaphoreWaitTime]);

  v6 = _AESearchLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(BKSearchOperation *)self ordinal];
    *(_DWORD *)buf = 67109376;
    int v11 = (int)self;
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "FINISH _waitForLoadSemaphore %x for ordinal: %d", buf, 0xEu);
  }

  if (v5 < 1) {
    return 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E7200;
  block[3] = &unk_1DAB88;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (unint64_t)_semaphoreWaitTime
{
  return dispatch_time(0, 10000000000);
}

- (void)cancel
{
  v3 = _AESearchLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v10 = (int)self;
    __int16 v11 = 1024;
    unsigned int v12 = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "cancel %x for ordinal: %d", buf, 0xEu);
  }

  v8.receiver = self;
  v8.super_class = (Class)BKWK2EpubSearchOperation;
  [(BKSearchOperation *)&v8 cancel];
  id v4 = [(BKWK2EpubSearchOperation *)self loadSemaphore];

  if (v4)
  {
    intptr_t v5 = [(BKWK2EpubSearchOperation *)self loadSemaphore];
    dispatch_semaphore_signal(v5);
  }
  v6 = [(BKWK2EpubSearchOperation *)self findSemaphore];

  if (v6)
  {
    unsigned int v7 = [(BKWK2EpubSearchOperation *)self findSemaphore];
    dispatch_semaphore_signal(v7);
  }
}

- (void)_postSearch:(id)a3
{
  id v4 = a3;
  intptr_t v5 = [(BKWK2EpubSearchOperation *)self webView];
  v6 = [v5 be_navigationHandler];

  unsigned int v7 = [v6 delegate];

  if (v7 == self) {
    [v6 setDelegate:0];
  }
  [(BKWK2EpubSearchOperation *)self setLoader:0];
  v8.receiver = self;
  v8.super_class = (Class)BKWK2EpubSearchOperation;
  [(BKSearchOperation *)&v8 _postSearch:v4];
}

- (BOOL)_startFindPerformIndexing:(BOOL)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  [(BKWK2EpubSearchOperation *)self setFindSemaphore:v5];

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E75F4;
  block[3] = &unk_1DDAA8;
  objc_copyWeak(&v9, &location);
  BOOL v10 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  BOOL v6 = [(BKWK2EpubSearchOperation *)self _waitForFindSemaphore];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_startFindPerformIndexingFromMainThread:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(BKWK2EpubSearchOperation *)self isCancelled] & 1) == 0)
  {
    if (v3)
    {
      dispatch_semaphore_t v5 = _AESearchLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v10 = [(BKSearchOperation *)self ordinal];
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_doSearch index does not contain text unit for ordinal %lu", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      BOOL v6 = [(BKWK2EpubSearchOperation *)self webView];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E77FC;
      v7[3] = &unk_1DDAD0;
      objc_copyWeak(&v8, (id *)buf);
      [v6 _getContentsAsStringWithCompletionHandler:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(BKWK2EpubSearchOperation *)self _startFind];
    }
  }
}

- (BOOL)_indexTextContent:(id)a3
{
  id v4 = a3;
  if ([(BKWK2EpubSearchOperation *)self isCancelled])
  {
    char v5 = 0;
  }
  else if ([v4 length])
  {
    BOOL v6 = _AESearchLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v19 = [(BKSearchOperation *)self ordinal];
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "_doSearch indexing textContent for ordinal %lu", buf, 0xCu);
    }

    unsigned int v7 = [(BKWK2EpubSearchOperation *)self baseURL];
    id v8 = [v7 absoluteString];
    id v9 = [v8 lastPathComponent];
    int64_t v10 = +[BKTextIndex bookIndexWithName:v9];

    if (v10)
    {
      char v5 = 1;
      [v10 indexTextUnit:v4 withOrdinal:[self ordinal] indexSynchronously:1];
      __int16 v11 = [(BKSearchOperation *)self searchString];
      unsigned int v12 = [v10 queryForString:v11 maxOrdinal:-1];

      if (v12)
      {
        char v17 = 0;
        unsigned __int8 v13 = [v12 isCandidateOrdinal:[self ordinal] isMissing:&v17];
        char v5 = v17 ? 1 : v13;
        if ((v5 & 1) == 0)
        {
          id v14 = _AESearchLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v15 = [(BKSearchOperation *)self ordinal];
            *(_DWORD *)buf = 134217984;
            int64_t v19 = v15;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "_doSearch contains a hit for ordinal %lu", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)_waitForFindSemaphore
{
  if ([(BKWK2EpubSearchOperation *)self isCancelled]) {
    return 0;
  }
  BOOL v3 = _AESearchLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v11 = (int)self;
    __int16 v12 = 1024;
    unsigned int v13 = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "START _waitForFindSemaphore %x for ordinal: %d", buf, 0xEu);
  }

  id v4 = [(BKWK2EpubSearchOperation *)self findSemaphore];
  intptr_t v5 = dispatch_semaphore_wait(v4, [(BKWK2EpubSearchOperation *)self _semaphoreWaitTime]);

  BOOL v6 = _AESearchLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(BKSearchOperation *)self ordinal];
    *(_DWORD *)buf = 67109376;
    int v11 = (int)self;
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "FINISH _waitForFindSemaphore %x for ordinal: %d", buf, 0xEu);
  }

  if (v5 < 1) {
    return 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E7C8C;
  block[3] = &unk_1DAB88;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (void)_startFind
{
  if (([(BKWK2EpubSearchOperation *)self isCancelled] & 1) == 0)
  {
    BOOL v3 = [(BKSearchOperation *)self lastSavedSearchResult];

    if (v3)
    {
      objc_opt_class();
      id v4 = [(BKSearchOperation *)self lastSavedSearchResult];
      intptr_t v5 = BUDynamicCast();

      objc_opt_class();
      BOOL v6 = [v5 location];
      unsigned int v7 = BUDynamicCast();

      if (v7)
      {
        id v8 = _AESearchLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [v7 cfiString];
          *(_DWORD *)buf = 138412290;
          id v16 = v9;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Resuming previous search at location: %@", buf, 0xCu);
        }
        int64_t v10 = [v7 cfiString];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_cfi_utilities.setSelectedRange('%@');",
        int v11 = v10);

        objc_initWeak((id *)buf, self);
        __int16 v12 = [(BKWK2EpubSearchOperation *)self webView];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_E8028;
        v13[3] = &unk_1DB660;
        objc_copyWeak(&v14, (id *)buf);
        [v12 evaluateJavaScript:v11 completionHandler:v13];

        objc_destroyWeak(&v14);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      [(BKWK2EpubSearchOperation *)self _startWebKitFind];
    }
  }
}

- (void)_startWebKitFind
{
  if (([(BKWK2EpubSearchOperation *)self isCancelled] & 1) == 0)
  {
    id v4 = [(BKWK2EpubSearchOperation *)self webView];
    BOOL v3 = [(BKSearchOperation *)self searchString];
    [v4 _findString:v3 options:513 maxCount:1000];
  }
}

- (BOOL)_doSearch
{
  BOOL v3 = _AESearchLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v27 = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_doSearch for ordinal %lu", buf, 0xCu);
  }

  id v4 = [(BKWK2EpubSearchOperation *)self baseURL];
  intptr_t v5 = [v4 absoluteString];
  BOOL v6 = [v5 lastPathComponent];
  unsigned int v7 = +[BKTextIndex bookIndexWithName:v6];

  unsigned int v8 = [v7 containsTextUnitWithOrdinal:[self ordinal]];
  unsigned int v9 = v8;
  if (!v7 || !v8)
  {
LABEL_15:
    int64_t v19 = [(BKWK2EpubSearchOperation *)self webView];

    if (v19)
    {
      id v20 = _AESearchLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v21 = [(BKSearchOperation *)self startSearchFromIndex];
        *(_DWORD *)buf = 134217984;
        int64_t v27 = v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "_doSearch already have a web view.  Continuing search from index %lu", buf, 0xCu);
      }
    }
    else if ([(BKWK2EpubSearchOperation *)self _loadWebView])
    {
      BOOL v16 = 1;
      self->super._isDone = 1;
      goto LABEL_26;
    }
    if ([(BKWK2EpubSearchOperation *)self contentProcessDidTerminate]
      || ![(BKWK2EpubSearchOperation *)self successfulLoad]
      || [(BKWK2EpubSearchOperation *)self isCancelled])
    {
      self->super._isDone = 1;
    }
    else
    {
      if (v7) {
        uint64_t v23 = v9 ^ 1;
      }
      else {
        uint64_t v23 = 0;
      }
      unsigned __int8 v24 = [(BKWK2EpubSearchOperation *)self _startFindPerformIndexing:v23];
      BOOL v16 = 1;
      self->super._isDone = 1;
      if (v24) {
        goto LABEL_26;
      }
    }
    BOOL v16 = [(BKWK2EpubSearchOperation *)self contentProcessDidTerminate];
    goto LABEL_26;
  }
  int64_t v10 = _AESearchLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v11 = [(BKSearchOperation *)self ordinal];
    *(_DWORD *)buf = 134217984;
    int64_t v27 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "_doSearch index contains text unit for ordinal %lu", buf, 0xCu);
  }

  __int16 v12 = [(BKSearchOperation *)self searchString];
  unsigned int v13 = [v7 queryForString:v12 maxOrdinal:-1];

  char v25 = 0;
  if ((objc_msgSend(v13, "isCandidateOrdinal:isMissing:", -[BKSearchOperation ordinal](self, "ordinal"), &v25) & 1) != 0|| v25)
  {
    char v17 = _AESearchLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v18 = [(BKSearchOperation *)self ordinal];
      *(_DWORD *)buf = 134217984;
      int64_t v27 = v18;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "_doSearch index query does not contain search string for ordinal %lu", buf, 0xCu);
    }

    goto LABEL_15;
  }
  self->super._isDone = 1;
  id v14 = _AESearchLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v15 = [(BKSearchOperation *)self ordinal];
    *(_DWORD *)buf = 134217984;
    int64_t v27 = v15;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "_doSearch index query contains search string.  Search done for ordinal %lu", buf, 0xCu);
  }

  BOOL v16 = 0;
LABEL_26:

  return v16;
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(BKWK2EpubSearchOperation *)self url];
  unsigned int v7 = [v5 be_isEquivalentToURL:v6 ignoringFragment:1];

  unsigned int v8 = _AESearchLog();
  unsigned int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      int64_t v11 = [(BKSearchOperation *)self ordinal];
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "didFinishLoadOfURL for ordinal %lu", (uint8_t *)&v10, 0xCu);
    }

    [(BKWK2EpubSearchOperation *)self _configureWebView];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      int64_t v11 = (int64_t)v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "loaded non main url - didFinishLoadOfURL: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_didFinishConfiguringWebView
{
  BOOL v3 = _AESearchLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_didFinishConfiguringWebView for ordinal %d", (uint8_t *)v5, 8u);
  }

  [(BKWK2EpubSearchOperation *)self setSuccessfulLoad:1];
  id v4 = [(BKWK2EpubSearchOperation *)self loadSemaphore];
  dispatch_semaphore_signal(v4);
}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  id v6 = a4;
  unsigned int v7 = [(BKWK2EpubSearchOperation *)self url];
  unsigned int v8 = [v6 be_isEquivalentToURL:v7 ignoringFragment:1];

  unsigned int v9 = _AESearchLog();
  int v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "failedToLoadURL: %@", (uint8_t *)&v11, 0xCu);
    }

    [(BKWK2EpubSearchOperation *)self setSuccessfulLoad:0];
    int v10 = [(BKWK2EpubSearchOperation *)self loadSemaphore];
    dispatch_semaphore_signal(v10);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "loaded non main url - failedToLoadURL: %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)navigationHandlerWebContentLoadFailed:(id)a3
{
  id v4 = _AESearchLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "navigationHandlerWebContentLoadFailed for ordinal %lu", (uint8_t *)&v7, 0xCu);
  }

  [(BKWK2EpubSearchOperation *)self setContentProcessDidTerminate:1];
  id v5 = [(BKWK2EpubSearchOperation *)self loadSemaphore];
  dispatch_semaphore_signal(v5);

  id v6 = [(BKWK2EpubSearchOperation *)self findSemaphore];
  dispatch_semaphore_signal(v6);
}

- (void)_webView:(id)a3 didCountMatches:(unint64_t)a4 forString:(id)a5
{
  id v7 = a5;
  int64_t v8 = _AESearchLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218498;
    unint64_t v10 = a4;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2048;
    int64_t v14 = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "didCountMatches: %lu forString:%@ for ordinal %lu", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_webView:(id)a3 didFindMatches:(unint64_t)a4 forString:(id)a5 withMatchIndex:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  if ([(BKWK2EpubSearchOperation *)self isCancelled]) {
    goto LABEL_14;
  }
  id v12 = _AESearchLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v24 = a4;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2048;
    int64_t v28 = a6;
    __int16 v29 = 2048;
    int64_t v30 = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "didFindMatches: %lu forString:%@ withMatchIndex: %lu for ordinal %lu", buf, 0x2Au);
  }

  if ([(BKSearchOperation *)self startSearchFromIndex] <= a6)
  {
    int64_t v14 = [(BKSearchOperation *)self searchBook];
    if ([v14 hasPhysicalPages])
    {
      int64_t v15 = [(BKWK2EpubSearchOperation *)self physicalPageMap];
      BOOL v16 = [v15 count] == 0;

      if (v16)
      {
        char v17 = 0;
        goto LABEL_13;
      }
      int64_t v14 = [(BKWK2EpubSearchOperation *)self physicalPageMap];
      char v17 = [v14 valueForKey:@"href"];
    }
    else
    {
      char v17 = 0;
    }

LABEL_13:
    int64_t v18 = +[BECFIUtilitiesJS getSelectedRangeScript:v17];
    objc_initWeak((id *)buf, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_E8D30;
    v20[3] = &unk_1DDAF8;
    objc_copyWeak(&v22, (id *)buf);
    id v19 = v17;
    id v21 = v19;
    [v10 evaluateJavaScript:v18 completionHandler:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);

    goto LABEL_14;
  }
  __int16 v13 = _AESearchLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v24 = a6;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Skipping previously found result index %lu.", buf, 0xCu);
  }

  [(BKWK2EpubSearchOperation *)self _startWebKitFind];
LABEL_14:
}

- (void)_addResultsWithPhysicalPageHrefs:(id)a3 selectedRangeResult:(id)a4
{
  id v51 = a3;
  id v6 = a4;
  id v7 = _AESearchLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "getSelectedRange result: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v6)
  {
    id v8 = +[NSNull null];
    BOOL v9 = v8 == v6;

    if (!v9)
    {
      id v10 = sub_E9408(v6);
      id v11 = +[BKSearchResult mutableSearchResult];
      id v12 = [(BKSearchOperation *)self searchString];
      [v11 setSearchString:v12];

      [v11 setOrdinal:[self ordinal]];
      id v50 = [v10 objectForKey:@"contextText"];
      if (v50)
      {
        __int16 v13 = sub_E9408(v50);
        objc_opt_class();
        int64_t v14 = [v13 objectForKey:@"context"];
        int64_t v15 = BUDynamicCast();
        [v11 setText:v15];

        objc_opt_class();
        BOOL v16 = [v13 objectForKey:@"offset"];
        char v17 = BUDynamicCast();
        id v18 = [v17 integerValue];

        id v19 = [(BKSearchOperation *)self searchString];
        [v11 setSearchStringRange:v18, [v19 length]];
      }
      objc_opt_class();
      id v20 = [v10 objectForKey:@"rects"];
      id v49 = BUDynamicCast();

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v55 = 0x3032000000;
      CFStringRef v56 = sub_E9478;
      v57 = sub_E9488;
      id v58 = (id)objc_opt_new();
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_E9490;
      v53[3] = &unk_1DDB20;
      v53[4] = &buf;
      [v49 enumerateObjectsUsingBlock:v53];
      id v21 = [(BKSearchOperation *)self searchBook];
      if ([v21 isFixedLayout])
      {
      }
      else
      {
        BOOL v22 = [*(id *)(*((void *)&buf + 1) + 40) count] == 0;

        if (!v22)
        {
          uint64_t v23 = [*(id *)(*((void *)&buf + 1) + 40) firstObject];
          [v23 rectValue];
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;

          double v32 = [(BKWK2EpubSearchOperation *)self loader];
          id v33 = [v32 pageOffsetRangeForRect:v25, v27, v29, v31];

          [v11 setPageOffset:v33];
        }
      }
      double v34 = [v10 objectForKey:@"cfi"];
      id v52 = 0;
      double v35 = [[BKEpubCFILocation alloc] initWithCFI:v34 error:&v52];
      id v36 = v52;
      [v11 setLocation:v35];

      uint64_t v37 = *(void *)(*((void *)&buf + 1) + 40);
      v38 = [v11 location];
      [v38 setSelectionRects:v37];

      if ([v51 count])
      {
        id v39 = [v10 objectForKey:@"physicalPageHref"];
        if ([v39 length])
        {
          id v40 = [v51 indexOfObject:v39];
          if (v40 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v41 = [(BKWK2EpubSearchOperation *)self physicalPageMap];
            BOOL v42 = v40 < [v41 count];

            if (v42)
            {
              id v43 = [(BKWK2EpubSearchOperation *)self physicalPageMap];
              uint64_t v44 = [v43 objectAtIndexedSubscript:v40];

              v45 = [v44 valueForKey:@"name"];
              [v11 setPageTitle:v45];
            }
          }
        }
      }
      [(NSMutableArray *)self->super._results addObject:v11];
      [(BKSearchOperation *)self setStartSearchFromIndex:[(NSMutableArray *)self->super._results count]];
      objc_opt_class();
      v46 = BUDynamicCast();
      [(BKSearchOperation *)self setLastSavedSearchResult:v46];

      _Block_object_dispose(&buf, 8);
    }
  }
  if ((unint64_t)[(NSMutableArray *)self->super._results count] < 0x64)
  {
    [(BKWK2EpubSearchOperation *)self _startWebKitFind];
  }
  else
  {
    v47 = _AESearchLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "Found more than the max search results.  Stop for this operation.", (uint8_t *)&buf, 2u);
    }

    id v48 = [(BKWK2EpubSearchOperation *)self findSemaphore];
    dispatch_semaphore_signal(v48);
  }
}

- (void)_webView:(id)a3 didFailToFindString:(id)a4
{
  id v5 = a4;
  id v6 = _AESearchLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2048;
    int64_t v11 = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "didFailToFindString: %@ for ordinal %lu", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(BKWK2EpubSearchOperation *)self findSemaphore];
  dispatch_semaphore_signal(v7);
}

- (NSArray)physicalPageMap
{
  return self->_physicalPageMap;
}

- (void)setPhysicalPageMap:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (BKWK2WebViewLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BKWK2LoaderContentInfoRequest)configureRequest
{
  return self->_configureRequest;
}

- (void)setConfigureRequest:(id)a3
{
}

- (OS_dispatch_semaphore)loadSemaphore
{
  return self->_loadSemaphore;
}

- (void)setLoadSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)findSemaphore
{
  return self->_findSemaphore;
}

- (void)setFindSemaphore:(id)a3
{
}

- (BOOL)successfulLoad
{
  return self->_successfulLoad;
}

- (void)setSuccessfulLoad:(BOOL)a3
{
  self->_successfulLoad = a3;
}

- (BOOL)contentProcessDidTerminate
{
  return self->_contentProcessDidTerminate;
}

- (void)setContentProcessDidTerminate:(BOOL)a3
{
  self->_contentProcessDidTerminate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findSemaphore, 0);
  objc_storeStrong((id *)&self->_loadSemaphore, 0);
  objc_storeStrong((id *)&self->_configureRequest, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_physicalPageMap, 0);
}

@end