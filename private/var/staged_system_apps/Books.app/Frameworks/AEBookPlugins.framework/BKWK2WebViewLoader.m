@interface BKWK2WebViewLoader
- (BEWebViewFactoryPaginationOptions)paginationOptions;
- (BKEpubCFILocation)currentFirstVisbleCFILocation;
- (BKEpubCFILocation)currentLastVisbleCFILocation;
- (BKEpubCFILocation)currentSelectionCFI;
- (BKEpubCFILocation)currentVisbleCFILocation;
- (BKWK2LoaderContentInfoRequest)currentInfoRequest;
- (BKWK2LoaderContentInfoRequest)pendingInfoRequest;
- (BKWK2WebViewLoader)initWithPaginationOptions:(id)a3 ordinal:(unint64_t)a4;
- (BKWK2WebViewLoaderDelegate)delegate;
- (BOOL)calculatingPageLocations;
- (BOOL)currentSelectionContainsAnchor;
- (BOOL)currentlyUpdatingPaginationInformation;
- (BOOL)isVerticalDocument;
- (BOOL)listeningForCFIUpdates;
- (BOOL)pageTextDirectionIsRTL;
- (BOOL)textDirectionDetermined;
- (BOOL)webViewLoaded;
- (CGRect)contentRectForVisibleContent;
- (CGRect)contentRectForVisiblePage;
- (CGRect)desiredWebViewFrame;
- (CGRect)rectForPageOffset:(unint64_t)a3;
- (CGSize)contentSize;
- (NSDictionary)anchorFrames;
- (NSDictionary)anchorLocations;
- (NSDictionary)mediaFrames;
- (NSDictionary)mediaLocations;
- (NSString)currentTextSelection;
- (NSString)textContent;
- (NSString)tocIdCssRules;
- (NSURL)url;
- (WKWebView)webView;
- (_NSRange)_uncheckedPageOffsetRangeForRect:(CGRect)a3;
- (_NSRange)pageOffsetRangeForRect:(CGRect)a3;
- (id)_pageOffsetsForFrames:(id)a3;
- (id)anchorFrameForAnchor:(id)a3;
- (id)locationForAnchor:(id)a3;
- (id)locationForPageOffset:(unint64_t)a3;
- (id)locationForPageOffset:(unint64_t)a3 contentOffset:(CGPoint)a4;
- (int64_t)_scrollPageCountFromCurrentPageSize;
- (unint64_t)_pageOffsetForXOffset:(double)a3;
- (unint64_t)contentInfo;
- (unint64_t)ordinal;
- (unint64_t)pageCount;
- (unint64_t)pageOffsetForAnchor:(id)a3;
- (unint64_t)pageOffsetForLocation:(id)a3;
- (unint64_t)retryCount;
- (void)_postLoadComplete:(id)a3;
- (void)_sendNextInfoRequest;
- (void)_updateContentInformationWithRequest:(id)a3;
- (void)cancelCurrentRequest;
- (void)clearPaginationResults;
- (void)clientRectForEpubLocation:(id)a3 completion:(id)a4;
- (void)clientRectsForLocation:(id)a3 completion:(id)a4;
- (void)clientRectsForLocations:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)enqueueContentInfoRequest:(id)a3;
- (void)generatePaginationDataCompletion:(id)a3;
- (void)pageOffsetRangeForLocation:(id)a3 completion:(id)a4;
- (void)parseTOCIdCssRulesForMap:(id)a3 completion:(id)a4;
- (void)registerForVisibleCFIUpdates;
- (void)setAnchorFrames:(id)a3;
- (void)setAnchorLocations:(id)a3;
- (void)setCalculatingPageLocations:(BOOL)a3;
- (void)setContentInfo:(unint64_t)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setCurrentFirstVisbleCFILocation:(id)a3;
- (void)setCurrentInfoRequest:(id)a3;
- (void)setCurrentLastVisbleCFILocation:(id)a3;
- (void)setCurrentSelectionCFI:(id)a3;
- (void)setCurrentSelectionContainsAnchor:(BOOL)a3;
- (void)setCurrentTextSelection:(id)a3;
- (void)setCurrentVisbleCFILocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredWebViewFrame:(CGRect)a3;
- (void)setIsVerticalDocument:(BOOL)a3;
- (void)setListeningForCFIUpdates:(BOOL)a3;
- (void)setMediaFrames:(id)a3;
- (void)setMediaLocations:(id)a3;
- (void)setOrdinal:(unint64_t)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPageTextDirectionIsRTL:(BOOL)a3;
- (void)setPageTextDirectionIsRTL:(BOOL)a3 isVerticalDocument:(BOOL)a4;
- (void)setPaginationOptions:(id)a3;
- (void)setPendingInfoRequest:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setTextContent:(id)a3;
- (void)setTextDirectionDetermined:(BOOL)a3;
- (void)setTocIdCssRules:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewLoaded:(BOOL)a3;
- (void)unregisterForVisibleCFIUpdates;
- (void)updateAnchorInformation:(id)a3;
- (void)updateMediaFrames:(id)a3;
- (void)updatePaginationOptions:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation BKWK2WebViewLoader

- (BKWK2WebViewLoader)initWithPaginationOptions:(id)a3 ordinal:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKWK2WebViewLoader;
  v8 = [(BKWK2WebViewLoader *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_paginationOptions, a3);
    v9->_ordinal = a4;
    tocIdCssRules = v9->_tocIdCssRules;
    v9->_tocIdCssRules = (NSString *)&stru_1DF0D8;

    v9->_pageCount = 0x7FFFFFFFFFFFFFFFLL;
    v9->_contentInfo = 501;
  }

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BKWK2WebViewLoader;
  [(BKWK2WebViewLoader *)&v2 dealloc];
}

- (void)setWebView:(id)a3
{
  v5 = (WKWebView *)a3;
  if (self->_webView != v5)
  {
    if ([(BKWK2WebViewLoader *)self calculatingPageLocations])
    {
      v6 = _AEWKLoaderLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Setting webView while it is calculating page locations -- this should not happen", buf, 2u);
      }
    }
    [(BKWK2WebViewLoader *)self unregisterForVisibleCFIUpdates];
    id v7 = [(WKWebView *)v5 configuration];
    v8 = [v7 userContentController];

    [v8 removeScriptMessageHandlerForName:@"cfiUpdate"];
    [v8 removeScriptMessageHandlerForName:@"selectionChange"];
    objc_storeStrong((id *)&self->_webView, a3);
    [(BKWK2WebViewLoader *)self desiredWebViewFrame];
    v33.origin.x = CGRectZero.origin.x;
    v33.origin.y = CGRectZero.origin.y;
    v33.size.width = CGRectZero.size.width;
    v33.size.height = CGRectZero.size.height;
    BOOL v9 = CGRectEqualToRect(v31, v33);
    [(WKWebView *)v5 frame];
    CGFloat v14 = v10;
    CGFloat v15 = v11;
    CGFloat v16 = v12;
    CGFloat v17 = v13;
    if (v9)
    {
      -[BKWK2WebViewLoader setDesiredWebViewFrame:](self, "setDesiredWebViewFrame:", v10, v11, v12, v13);
    }
    else
    {
      [(BKWK2WebViewLoader *)self desiredWebViewFrame];
      v34.origin.x = v18;
      v34.origin.y = v19;
      v34.size.width = v20;
      v34.size.height = v21;
      v32.origin.x = v14;
      v32.origin.y = v15;
      v32.size.width = v16;
      v32.size.height = v17;
      if (!CGRectEqualToRect(v32, v34))
      {
        v22 = _AEWKLoaderLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          unint64_t v23 = [(BKWK2WebViewLoader *)self ordinal];
          *(_DWORD *)buf = 134217984;
          unint64_t v30 = v23;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "wkWebView frame mismatch ordinal:%lu", buf, 0xCu);
        }

        [(BKWK2WebViewLoader *)self desiredWebViewFrame];
        -[WKWebView setFrame:](self->_webView, "setFrame:");
      }
    }
    [(BKWK2WebViewLoader *)self registerForVisibleCFIUpdates];
    v24 = [(WKWebView *)self->_webView configuration];
    v25 = [v24 userContentController];

    [v25 be_addScriptMessageHandler:self name:@"selectionChange"];
    objc_initWeak((id *)buf, self);
    v26 = [(WKWebView *)self->_webView be_navigationHandler];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_6C588;
    v27[3] = &unk_1DC528;
    objc_copyWeak(&v28, (id *)buf);
    [v26 performAfterLoadCompleteOrFailure:v27];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)registerForVisibleCFIUpdates
{
  v3 = [(WKWebView *)self->_webView configuration];
  if (v3)
  {
    BOOL listeningForCFIUpdates = self->_listeningForCFIUpdates;

    if (!listeningForCFIUpdates)
    {
      self->_BOOL listeningForCFIUpdates = 1;
      id v6 = [(WKWebView *)self->_webView configuration];
      v5 = [v6 userContentController];
      [v5 be_addScriptMessageHandler:self name:@"cfiUpdate"];
    }
  }
}

- (void)unregisterForVisibleCFIUpdates
{
  self->_BOOL listeningForCFIUpdates = 0;
  id v3 = [(WKWebView *)self->_webView configuration];
  objc_super v2 = [v3 userContentController];
  [v2 removeScriptMessageHandlerForName:@"cfiUpdate"];
}

- (void)_postLoadComplete:(id)a3
{
  id v4 = a3;
  [(BKWK2WebViewLoader *)self setWebViewLoaded:1];
  [(BKWK2WebViewLoader *)self setPageCount:[(WKWebView *)self->_webView _pageCount]];
  v5 = _AEWKLoaderLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BKWK2WebViewLoader *)self webView];
    unint64_t v7 = [(BKWK2WebViewLoader *)self ordinal];
    unint64_t pageCount = self->_pageCount;
    *(_DWORD *)buf = 138413058;
    CGFloat v15 = self;
    __int16 v16 = 2112;
    CGFloat v17 = v6;
    __int16 v18 = 2048;
    unint64_t v19 = v7;
    __int16 v20 = 2048;
    unint64_t v21 = pageCount;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Loader %@ webView %@ didFinishLoadOfURL for ordinal %lu captured pageCount:%lu", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  webView = self->_webView;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6CA28;
  v11[3] = &unk_1DC590;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v4;
  id v12 = v10;
  [(WKWebView *)webView be_evaluateJavaScript:&stru_1DC568 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)setDesiredWebViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(BKWK2WebViewLoader *)self desiredWebViewFrame];
  v22.origin.double x = v8;
  v22.origin.double y = v9;
  v22.size.double width = v10;
  v22.size.double height = v11;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (!CGRectEqualToRect(v20, v22))
  {
    self->_desiredWebViewFrame.origin.double x = x;
    self->_desiredWebViewFrame.origin.double y = y;
    self->_desiredWebViewFrame.size.double width = width;
    self->_desiredWebViewFrame.size.double height = height;
    id v12 = _AEWKLoaderLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = [(BKWK2WebViewLoader *)self ordinal];
      v21.origin.double x = x;
      v21.origin.double y = y;
      v21.size.double width = width;
      v21.size.double height = height;
      CGFloat v14 = NSStringFromCGRect(v21);
      int v16 = 134218242;
      unint64_t v17 = v13;
      __int16 v18 = 2112;
      unint64_t v19 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "setDesiredWebViewFrame setting webView frame ordinal: %ld to:%@", (uint8_t *)&v16, 0x16u);
    }
    CGFloat v15 = [(BKWK2WebViewLoader *)self webView];
    [v15 setFrame:CGRectMake(x, y, width, height)];
  }
}

- (void)updatePaginationOptions:(id)a3
{
  id v4 = a3;
  v5 = [(BKWK2WebViewLoader *)self paginationOptions];
  unsigned __int8 v6 = [v5 isEqual:v4];

  unint64_t v7 = _AEWKLoaderLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v12 = [(BKWK2WebViewLoader *)self ordinal];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "updatePaginationOptions equal pagination options for ordinal %lu", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v12 = [(BKWK2WebViewLoader *)self ordinal];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "updatePaginationOptions for ordinal %lu", buf, 0xCu);
    }

    [(BKWK2WebViewLoader *)self setPaginationOptions:v4];
    [(BKWK2WebViewLoader *)self setPageCount:0x7FFFFFFFFFFFFFFFLL];
    [(BKWK2WebViewLoader *)self clearPaginationResults];
    [(BKWK2WebViewLoader *)self webView];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_6CFE0;
    v9[3] = &unk_1DBF08;
    v9[4] = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v7 = v10;
    [v7 _doAfterNextStablePresentationUpdate:v9];
  }
}

- (void)setPageTextDirectionIsRTL:(BOOL)a3 isVerticalDocument:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(BKWK2WebViewLoader *)self setTextDirectionDetermined:1];
  [(BKWK2WebViewLoader *)self setPageTextDirectionIsRTL:v5];

  [(BKWK2WebViewLoader *)self setIsVerticalDocument:v4];
}

- (void)clearPaginationResults
{
  id v3 = _AEWKLoaderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = [(BKWK2WebViewLoader *)self ordinal];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "clearPaginationResults for ordinal %lu", (uint8_t *)&v5, 0xCu);
  }

  anchorLocations = self->_anchorLocations;
  self->_anchorLocations = 0;
}

- (unint64_t)pageCount
{
  id v3 = [(BKWK2WebViewLoader *)self webView];

  if (!v3) {
    return self->_pageCount;
  }
  BOOL v4 = [(BKWK2WebViewLoader *)self webView];
  id v5 = [v4 _pageCount];

  unint64_t v6 = [(BKWK2WebViewLoader *)self webView];
  id v7 = [v6 _paginationMode];

  if (!v7) {
    id v5 = [(BKWK2WebViewLoader *)self _scrollPageCountFromCurrentPageSize];
  }
  if (self->_pageCount == 0x7FFFFFFFFFFFFFFFLL && [(BKWK2WebViewLoader *)self webViewLoaded])
  {
    BOOL v8 = _AEWKLoaderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218240;
      unint64_t v19 = [(BKWK2WebViewLoader *)self ordinal];
      __int16 v20 = 2048;
      id v21 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Unknown page count. Ordinal: %lu capturing pageCount: %lu", (uint8_t *)&v18, 0x16u);
    }

    self->_unint64_t pageCount = (unint64_t)v5;
  }
  if (![(BKWK2WebViewLoader *)self webViewLoaded])
  {
    CGFloat v9 = _AEWKLoaderLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(BKWK2WebViewLoader *)self webView];
      CGFloat v11 = [v10 URL];
      unint64_t v12 = +[NSNumber numberWithUnsignedInteger:[(BKWK2WebViewLoader *)self ordinal]];
      int v18 = 138412546;
      unint64_t v19 = (unint64_t)v11;
      __int16 v20 = 2112;
      id v21 = v12;
    }
  }
  if (v5 != self->_pageCount)
  {
    unint64_t v13 = _AEWKLoaderLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = [(BKWK2WebViewLoader *)self ordinal];
      CGFloat v15 = [(BKWK2WebViewLoader *)self webView];
      unint64_t pageCount = self->_pageCount;
      int v18 = 134349826;
      unint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v15;
      __int16 v22 = 2050;
      id v23 = v5;
      __int16 v24 = 2050;
      unint64_t v25 = pageCount;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Loader Asking PageCount for ordinal %{public}lu webView %@ webViewPageCount:%{public}lu captured pageCount:%{public}lu", (uint8_t *)&v18, 0x2Au);
    }
    self->_unint64_t pageCount = (unint64_t)v5;
  }
  return (unint64_t)v5;
}

- (void)parseTOCIdCssRulesForMap:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  BOOL v8 = [(BKWK2WebViewLoader *)self webView];

  BOOL v9 = v8 == 0;
  id v10 = _AEWKLoaderLog();
  CGFloat v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v12 = [(BKWK2WebViewLoader *)self url];
      *(_DWORD *)buf = 138412290;
      unint64_t v22 = (unint64_t)v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Loader parseTOCIdCssRules %@", buf, 0xCu);
    }
    if ([v6 count])
    {
      id v20 = 0;
      unint64_t v13 = +[NSJSONSerialization dataWithJSONObject:v6 options:1 error:&v20];
      id v14 = v20;
      if (!v14)
      {
        if (v13)
        {
          id v14 = [objc_alloc((Class)NSString) initWithData:v13 encoding:4];
          if (v14)
          {
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_content_cleanup.tocIdCssRules(%@);",
            CGFloat v15 = v14);
            objc_initWeak((id *)buf, self);
            int v16 = [(BKWK2WebViewLoader *)self webView];
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_6D760;
            v17[3] = &unk_1DC5B8;
            objc_copyWeak(&v19, (id *)buf);
            v17[4] = self;
            int v18 = v7;
            [v16 evaluateJavaScript:v15 completionHandler:v17];

            objc_destroyWeak(&v19);
            objc_destroyWeak((id *)buf);

            id v14 = 0;
LABEL_14:

            goto LABEL_15;
          }
        }
      }
    }
    else
    {
      unint64_t v13 = 0;
      id v14 = 0;
    }
    v7[2](v7);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v22 = [(BKWK2WebViewLoader *)self ordinal];
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Attempting to parseTOCIdCssRulesForMap with no web view ordinal: %lu", buf, 0xCu);
  }

  v7[2](v7);
LABEL_15:
}

- (void)_updateContentInformationWithRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BKWK2WebViewLoader *)self currentInfoRequest];

    BOOL v6 = v5 == 0;
    id v7 = _AEWKLoaderLog();
    BOOL v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [(BKWK2WebViewLoader *)self webView];
        *(_DWORD *)buf = 138412802;
        v43 = self;
        __int16 v44 = 2112;
        id v45 = v16;
        __int16 v46 = 2112;
        id v47 = v4;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "loader: %@ webview: %@ processing request: %@", buf, 0x20u);
      }
      [(BKWK2WebViewLoader *)self setCurrentInfoRequest:v4];
      unint64_t v17 = [(BKWK2WebViewLoader *)self webView];
      int v18 = [v4 stylesheetSet];
      [v18 applyToWebView:v17];
      [v4 fontSize];
      [v17 _setTextZoomFactor:];
      id v19 = [v4 paginationOptions];
      [v19 applyToWebView:v17];
      [(BKWK2WebViewLoader *)self updatePaginationOptions:v19];
      id v20 = +[BEContentLayoutInfo updateScriptWithOptions:v19];
      id v21 = [v4 cfiOptions];
      [v19 gapBetweenPages];
      id v23 = +[BECFIUtilitiesJS updateScriptWithOptions:gapBetweenPages:paginatedTopToBottom:](BECFIUtilitiesJS, "updateScriptWithOptions:gapBetweenPages:paginatedTopToBottom:", v21, [v19 mode] == &dword_4, v22);

      __int16 v24 = [v4 cleanupOptions];
      [v19 pageLength];
      double v26 = v25;
      [v19 gapBetweenPages];
      id v28 = +[BEContentCleanupJS updateScriptWithOptions:v24 pageLength:v26 gapBetweenPages:v27];

      objc_initWeak((id *)buf, self);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_6DD74;
      v36[3] = &unk_1DC5E0;
      id v29 = v20;
      id v37 = v29;
      id v30 = v23;
      id v38 = v30;
      id v31 = v28;
      id v39 = v31;
      v40 = self;
      id v32 = v4;
      id v41 = v32;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_6DED4;
      v33[3] = &unk_1DC608;
      objc_copyWeak(&v35, (id *)buf);
      v33[4] = self;
      id v34 = v32;
      [v17 be_evaluateJavaScript:v36 completion:v33];

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        BOOL v9 = [(BKWK2WebViewLoader *)self currentInfoRequest];
        *(_DWORD *)buf = 138412546;
        v43 = v9;
        __int16 v44 = 2112;
        id v45 = v4;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Currently handling request %@ when received request %@", buf, 0x16u);
      }
      id v10 = [(BKWK2WebViewLoader *)self pendingInfoRequest];

      if (v10)
      {
        CGFloat v11 = _AEWKLoaderLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v12 = [(BKWK2WebViewLoader *)self pendingInfoRequest];
          *(_DWORD *)buf = 138412802;
          v43 = self;
          __int16 v44 = 2112;
          id v45 = v12;
          __int16 v46 = 2112;
          id v47 = v4;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "loader: %@ enqueueContentInfoRequest replacing pendingRequest: %@ with request %@", buf, 0x20u);
        }
        unint64_t v13 = [(BKWK2WebViewLoader *)self pendingInfoRequest];
        id v14 = [v13 completion];

        if (v14)
        {
          CGFloat v15 = [(BKWK2WebViewLoader *)self pendingInfoRequest];
          ((void (**)(void, void *, void))v14)[2](v14, v15, 0);
        }
      }
      [(BKWK2WebViewLoader *)self setPendingInfoRequest:v4];
    }
  }
}

- (void)generatePaginationDataCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKWK2WebViewLoader *)self currentInfoRequest];
  [v5 setState:1];

  BOOL v6 = _AEWKLoaderLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(BKWK2WebViewLoader *)self webView];
    *(_DWORD *)buf = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    int v16 = v7;
    __int16 v17 = 2048;
    unint64_t v18 = [(BKWK2WebViewLoader *)self ordinal];
    __int16 v19 = 2048;
    unint64_t v20 = [(BKWK2WebViewLoader *)self pageCount];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Loader: %@ webView: %@ generatePaginationData for ordinal %lu using pageCount:%lu", buf, 0x2Au);
  }
  anchorLocations = self->_anchorLocations;
  self->_anchorLocations = 0;

  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_6E324;
  v10[3] = &unk_1DBFC8;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v4;
  id v11 = v9;
  [(BKWK2WebViewLoader *)self updateAnchorInformation:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)updateAnchorInformation:(id)a3
{
  id v4 = a3;
  id v5 = [(BKWK2WebViewLoader *)self currentInfoRequest];
  [v5 setState:3];

  BOOL v6 = [(BKWK2WebViewLoader *)self webView];
  if (v6
    && ([(BKWK2WebViewLoader *)self currentInfoRequest],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isRequestValid],
        v7,
        (v8 & 1) != 0))
  {
    objc_initWeak(location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_6E608;
    v15[3] = &unk_1DC630;
    objc_copyWeak(&v16, location);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_6E730;
    v12[3] = &unk_1DC590;
    objc_copyWeak(&v14, location);
    id v13 = v4;
    [v6 be_evaluateJavaScript:v15 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  else
  {
    id v9 = _AEWKLoaderLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)[(BKWK2WebViewLoader *)self ordinal];
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "No webview when trying to get anchor locations for ordinal:%lu !", (uint8_t *)location, 0xCu);
    }

    id v10 = objc_retainBlock(v4);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
}

- (void)updateMediaFrames:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(BKWK2WebViewLoader *)self webView];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_6EA44;
  v10[3] = &unk_1DC630;
  objc_copyWeak(&v11, &location);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6EB04;
  v7[3] = &unk_1DC590;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 be_evaluateJavaScript:v10 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)pageOffsetRangeForLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    id v8 = BUDynamicCast();
    objc_opt_class();
    id v9 = BUDynamicCast();
    if (v8)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_6F0F0;
      v32[3] = &unk_1DC658;
      v32[4] = self;
      id v33 = v8;
      id v34 = v7;
      [(BKWK2WebViewLoader *)self clientRectsForLocation:v33 completion:v32];

      id v10 = v33;
LABEL_4:

LABEL_26:
      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [v6 pageOffset];
      id v14 = _AEWKLoaderLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        unint64_t v36 = (unint64_t)v13;
        __int16 v37 = 2112;
        unint64_t v38 = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Determined pageOffset: %lu for page location: %@", buf, 0x16u);
      }

      id v15 = objc_retainBlock(v7);
      id v16 = v15;
      if (v15) {
        (*((void (**)(id, id, uint64_t))v15 + 2))(v15, v13, 1);
      }
LABEL_25:

      goto LABEL_26;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v6;
      __int16 v17 = [v16 anchor];
      if ([v17 length]) {
        unint64_t v18 = [(BKWK2WebViewLoader *)self pageOffsetForAnchor:v17];
      }
      else {
        unint64_t v18 = 0;
      }
      __int16 v19 = _AEWKLoaderLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        unint64_t v36 = v18;
        __int16 v37 = 2112;
        unint64_t v38 = (unint64_t)v16;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Determined pageOffset: %lu for anchor location: %@", buf, 0x16u);
      }

      id v20 = objc_retainBlock(v7);
      id v21 = v20;
      if (v20) {
        (*((void (**)(id, unint64_t, uint64_t))v20 + 2))(v20, v18, 1);
      }

      goto LABEL_25;
    }
    if (v9)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_6F298;
      v29[3] = &unk_1DC680;
      v29[4] = self;
      id v30 = v9;
      id v31 = v7;
      [(BKWK2WebViewLoader *)self clientRectForEpubLocation:v30 completion:v29];

      id v10 = v30;
      goto LABEL_4;
    }
    if ([v6 isMemberOfClass:objc_opt_class()])
    {
      double v22 = (void (**)(void))objc_retainBlock(v7);
      id v23 = v22;
      if (!v22)
      {
LABEL_36:

        goto LABEL_26;
      }
      __int16 v24 = v22[2];
    }
    else
    {
      double v25 = _AEWKLoaderLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        double v26 = (objc_class *)objc_opt_class();
        double v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138412546;
        unint64_t v36 = (unint64_t)v27;
        __int16 v37 = 2048;
        unint64_t v38 = [(BKWK2WebViewLoader *)self ordinal];
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "pageOffsetRangeForLocation unsupported location type (%@) for ordinal:%lu", buf, 0x16u);
      }
      id v28 = (void (**)(void))objc_retainBlock(v7);
      id v23 = v28;
      if (!v28) {
        goto LABEL_36;
      }
      __int16 v24 = v28[2];
    }
    v24();
    goto LABEL_36;
  }
  id v11 = _AEWKLoaderLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v36 = [(BKWK2WebViewLoader *)self ordinal];
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "pageOffsetRangeForLocation missing location for ordinal:%lu", buf, 0xCu);
  }

  id v12 = objc_retainBlock(v7);
  id v8 = v12;
  if (v12) {
    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 0x7FFFFFFFFFFFFFFFLL, 0);
  }
LABEL_27:
}

- (void)clientRectsForLocations:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v25 = a4;
  id v6 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  id v8 = (char *)[v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        id v11 = BUDynamicCast();
        id v12 = v11;
        if (v11)
        {
          id v13 = [v11 cfiString];
          [v6 addObject:v13];
        }
        else
        {
          id v13 = _AEWKLoaderLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v14 = (objc_class *)objc_opt_class();
            id v15 = NSStringFromClass(v14);
            *(_DWORD *)buf = 138412290;
            id v37 = v15;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "We should not get any type other than a BKEpubCFILocation here but we got a %@", buf, 0xCu);
          }
        }
      }
      id v8 = (char *)[v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v8);
  }

  id v29 = 0;
  id v16 = +[NSJSONSerialization dataWithJSONObject:v6 options:0 error:&v29];
  id v17 = v29;
  if (![v16 length] || v17)
  {
    if (!v17)
    {
      id v20 = [(id)objc_opt_class() description];
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      CFStringRef v35 = @"no JSON data";
      id v21 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      id v17 = +[NSError errorWithDomain:v20 code:1 userInfo:v21];
    }
    double v22 = _AEWKLoaderLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v17;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Failed to get JSON Data from cfi strings - %@", buf, 0xCu);
    }

    id v23 = objc_retainBlock(v25);
    unint64_t v18 = v23;
    if (v23) {
      (*((void (**)(id, void, id))v23 + 2))(v23, 0, v17);
    }
  }
  else
  {
    id v17 = [objc_alloc((Class)NSString) initWithData:v16 encoding:4];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_cfi_utilities.getClientRects(%@);",
    unint64_t v18 = v17);
    objc_initWeak((id *)buf, self);
    __int16 v19 = [(BKWK2WebViewLoader *)self webView];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_6F87C;
    v26[3] = &unk_1DC5B8;
    objc_copyWeak(&v28, (id *)buf);
    v26[4] = self;
    id v27 = v25;
    [v19 evaluateJavaScript:v18 completionHandler:v26];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)clientRectsForLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = v6;
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6FBE0;
  v11[3] = &unk_1DC6A8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(BKWK2WebViewLoader *)self clientRectsForLocations:v8 completion:v11];
}

- (void)clientRectForEpubLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 jsonObject];
  id v9 = (void *)v8;
  if (v8)
  {
    CFStringRef v24 = @"_id";
    uint64_t v25 = v8;
    id v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v11 = +[BECFIUtilitiesJS upgradeAnnotationsScript:v10];

    id v12 = [(BKWK2WebViewLoader *)self webView];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_6FF40;
    v19[3] = &unk_1DC6D0;
    id v20 = v6;
    id v21 = self;
    id v22 = v7;
    [v12 evaluateJavaScript:v11 completionHandler:v19];

    id v13 = v20;
  }
  else
  {
    id v14 = _AEAnnotationLocationLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Failed to get json object from location: %@", buf, 0xCu);
    }

    id v11 = +[NSString stringWithFormat:@"Failed to get json object from location: %@", v6];
    NSErrorUserInfoKey v26 = NSDebugDescriptionErrorKey;
    id v27 = v11;
    id v15 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v13 = +[NSError errorWithDomain:@"BookEPUBError" code:4 userInfo:v15];

    id v16 = (void (**)(id, void *, void *))objc_retainBlock(v7);
    if (v16)
    {
      CGSize size = CGRectZero.size;
      v23[0] = CGRectZero.origin;
      v23[1] = size;
      unint64_t v18 = +[NSValue valueWithBytes:v23 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v16[2](v16, v18, v13);
    }
  }
}

- (BOOL)pageTextDirectionIsRTL
{
  if (![(BKWK2WebViewLoader *)self textDirectionDetermined])
  {
    id v3 = _AEWKLoaderLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Attempting to use pageTextDirectionIsRTL before it has been determined.", v5, 2u);
    }
  }
  return self->_pageTextDirectionIsRTL;
}

- (BOOL)isVerticalDocument
{
  if (![(BKWK2WebViewLoader *)self textDirectionDetermined])
  {
    id v3 = _AEWKLoaderLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Attempting to use isVerticalDocument before it has been determined.", v5, 2u);
    }
  }
  return self->_isVerticalDocument;
}

- (void)cancelCurrentRequest
{
  id v2 = [(BKWK2WebViewLoader *)self currentInfoRequest];
  [v2 invalidateRequest];
}

- (void)enqueueContentInfoRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(BKWK2WebViewLoader *)self pendingInfoRequest];

  if (v5)
  {
    id v6 = _AEWKLoaderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(BKWK2WebViewLoader *)self pendingInfoRequest];
      int v11 = 138412802;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "loader: %@ enqueueContentInfoRequest replacing pendingRequest: %@ with request %@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v8 = [(BKWK2WebViewLoader *)self pendingInfoRequest];
    id v9 = [v8 completion];

    if (v9)
    {
      id v10 = [(BKWK2WebViewLoader *)self pendingInfoRequest];
      ((void (**)(void, void *, void))v9)[2](v9, v10, 0);
    }
  }
  [(BKWK2WebViewLoader *)self setPendingInfoRequest:v4];
  [(BKWK2WebViewLoader *)self _sendNextInfoRequest];
}

- (void)_sendNextInfoRequest
{
  id v3 = [(BKWK2WebViewLoader *)self currentInfoRequest];

  if (!v3)
  {
    id v4 = [(BKWK2WebViewLoader *)self pendingInfoRequest];
    if (v4)
    {
      [(BKWK2WebViewLoader *)self setPendingInfoRequest:0];
      [(BKWK2WebViewLoader *)self _updateContentInformationWithRequest:v4];
    }
  }
}

- (int64_t)_scrollPageCountFromCurrentPageSize
{
  id v3 = [(BKWK2WebViewLoader *)self paginationOptions];
  [v3 scrollPageLength];
  double v5 = v4;

  if (v5 <= 1.0) {
    return 1;
  }
  id v6 = [(BKWK2WebViewLoader *)self webView];
  id v7 = [v6 be_estimatedContentSizeValue];

  if (!v7
    || (([v7 CGSizeValue], CGSizeZero.width == v9) ? (BOOL v10 = CGSizeZero.height == v8) : (BOOL v10 = 0), v10))
  {
    id v16 = [(BKWK2WebViewLoader *)self webView];
    id v17 = [v16 scrollView];
    [v17 contentSize];
    double v12 = v18;
    double v14 = v19;
  }
  else
  {
    [v7 CGSizeValue];
    double v12 = v11;
    double v14 = v13;
  }
  id v20 = [(BKWK2WebViewLoader *)self paginationOptions];
  if (![v20 isHorizontalScroll]) {
    double v12 = v14;
  }

  return vcvtmd_s64_f64(v12 / v5) + 1;
}

- (id)_pageOffsetsForFrames:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_706C8;
  v10[3] = &unk_1DC6F8;
  void v10[4] = self;
  unint64_t v12 = [(BKWK2WebViewLoader *)self ordinal];
  id v6 = v5;
  id v11 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (unint64_t)_pageOffsetForXOffset:(double)a3
{
  id v5 = [(BKWK2WebViewLoader *)self paginationOptions];

  if (!v5)
  {
    id v6 = _AEWKLoaderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v34 = 138412290;
      CFStringRef v35 = self;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Invalid Pagination Options in Loader %@ when trying to determine pageOffsetForXOffset", (uint8_t *)&v34, 0xCu);
    }
  }
  if ([(BKWK2WebViewLoader *)self pageCount] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = _AEWKLoaderLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v34 = 138412290;
      CFStringRef v35 = self;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Page count not initialied in Loader %@ when trying to determine pageOffsetForXOffset", (uint8_t *)&v34, 0xCu);
    }
  }
  id v8 = [(BKWK2WebViewLoader *)self paginationOptions];
  double v9 = [(BKWK2WebViewLoader *)self paginationOptions];
  id v10 = [v9 mode];

  if (v10)
  {
    [v8 pageLength];
    double v12 = v11;
    [v8 gapBetweenPages];
    double v14 = v12 + v13;
  }
  else
  {
    [v8 scrollPageLength];
    double v14 = v15;
  }
  if (v14 <= 0.0) {
    goto LABEL_25;
  }
  id v16 = [(BKWK2WebViewLoader *)self paginationOptions];
  id v17 = (char *)[v16 mode];

  if (v17 == (unsigned char *)&dword_0 + 2)
  {
    unint64_t v18 = vcvtmd_u64_f64(fmax(a3, 0.0) / v14);
    goto LABEL_31;
  }
  if (([v8 isHorizontalScroll] & 1) == 0
    && [v8 mode] != (char *)&dword_0 + 3)
  {
    id v28 = _AEWKLoaderLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "We don't handle calculating the page offset for this document.", (uint8_t *)&v34, 2u);
    }

LABEL_25:
    unint64_t v18 = 0;
    goto LABEL_31;
  }
  if ([(BKWK2WebViewLoader *)self pageTextDirectionIsRTL])
  {
    double v19 = [(BKWK2WebViewLoader *)self webView];
    [v19 frame];
    double Width = CGRectGetWidth(v40);
    [v8 pageLength];
    double v22 = v21 + v21;

    if (Width > v22)
    {
      id v23 = _AEBookPluginsRTLLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v24 = [(BKWK2WebViewLoader *)self webView];
        uint64_t v25 = +[NSNumber numberWithDouble:a3];
        a3 = a3 - v14;
        NSErrorUserInfoKey v26 = +[NSNumber numberWithDouble:a3];
        int v34 = 134218498;
        CFStringRef v35 = v24;
        __int16 v36 = 2112;
        id v37 = v25;
        __int16 v38 = 2112;
        id v39 = v26;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "[#RTL] WebView: %p is possibly 2up. Changing xOffset from %@ to %@ to get page Offset", (uint8_t *)&v34, 0x20u);
      }
      else
      {
        a3 = a3 - v14;
      }
    }
    double v27 = ceil(-a3 / v14);
    double v29 = floor(a3 / v14);
    if (a3 > 0.0) {
      double v27 = v29;
    }
  }
  else
  {
    double v27 = fabs(floor(a3 / v14));
  }
  unint64_t v18 = (unint64_t)v27;
LABEL_31:
  unint64_t v30 = [(BKWK2WebViewLoader *)self pageCount];
  if (v18 < v30 || (uint64_t)v30 < 1) {
    unint64_t v32 = v18;
  }
  else {
    unint64_t v32 = v30 - 1;
  }

  return v32;
}

- (_NSRange)pageOffsetRangeForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(BKWK2WebViewLoader *)self paginationOptions];

  if (!v8)
  {
    double v9 = _AEWKLoaderLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      double v14 = self;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Invalid pagination options in loader %@", (uint8_t *)&v13, 0xCu);
    }
  }
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  if (CGRectIsNull(v16))
  {
    id v10 = _AEWKLoaderLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      double v14 = self;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Invalid rect when getting pageOffsetForRect in loader %@", (uint8_t *)&v13, 0xCu);
    }

    NSUInteger v11 = 0;
    NSUInteger v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger v12 = (NSUInteger)-[BKWK2WebViewLoader _uncheckedPageOffsetRangeForRect:](self, "_uncheckedPageOffsetRangeForRect:", x, y, width, height);
  }
  result.length = v11;
  result.id location = v12;
  return result;
}

- (_NSRange)_uncheckedPageOffsetRangeForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = [(BKWK2WebViewLoader *)self paginationOptions];
  if ([v8 mode])
  {
  }
  else
  {
    double v9 = [(BKWK2WebViewLoader *)self paginationOptions];
    unsigned int v10 = [v9 isHorizontalScroll];

    if (!v10)
    {
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v33);
      if (MinY <= 3.40282347e38) {
        double v22 = MinY;
      }
      else {
        double v22 = 3.40282347e38;
      }
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.CGFloat width = width;
      v34.size.CGFloat height = height;
      double v23 = fmax(CGRectGetMaxY(v34), -3.40282347e38);
      if (v22 > v23)
      {
        double v14 = _AEWKLoaderLog();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        __int16 v28 = 0;
        double v15 = (uint8_t *)&v28;
        goto LABEL_10;
      }
      CFStringRef v24 = [(BKWK2WebViewLoader *)self paginationOptions];
      [v24 contentLayoutSize];
      double v26 = v25;

      unint64_t v19 = vcvtmd_u64_f64(v22 / v26);
      unint64_t v27 = vcvtmd_u64_f64(v23 / v26);
      if (v19 >= v27) {
        NSUInteger v17 = v27;
      }
      else {
        NSUInteger v17 = v19;
      }
      if (v19 <= v27) {
        unint64_t v19 = v27;
      }
LABEL_16:
      NSUInteger v16 = v19 - v17 + 1;
      goto LABEL_29;
    }
  }
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v31);
  if (MinX <= 3.40282347e38) {
    double v12 = MinX;
  }
  else {
    double v12 = 3.40282347e38;
  }
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v13 = fmax(CGRectGetMaxX(v32), -3.40282347e38);
  if (v12 <= v13)
  {
    unint64_t v18 = [(BKWK2WebViewLoader *)self _pageOffsetForXOffset:v12];
    NSUInteger v17 = [(BKWK2WebViewLoader *)self _pageOffsetForXOffset:v13];
    unint64_t v19 = v17;
    BOOL v20 = v18 > v17;
    if (v18 < v17) {
      NSUInteger v17 = v18;
    }
    if (v20) {
      unint64_t v19 = v18;
    }
    goto LABEL_16;
  }
  double v14 = _AEWKLoaderLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    double v15 = buf;
LABEL_10:
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Bogus rect checking _uncheckedPageOffsetRangeForRect", v15, 2u);
  }
LABEL_11:

  NSUInteger v16 = 0;
  NSUInteger v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_29:
  result.length = v16;
  result.id location = v17;
  return result;
}

- (unint64_t)pageOffsetForLocation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();
  id v6 = v5;
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v7 = (unint64_t)[v4 pageOffset];
      id v8 = _AEWKLoaderLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218242;
        unint64_t v13 = v7;
        __int16 v14 = 2112;
        uint64_t v15 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Determined Page Offset %lu for page location %@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ([v4 isMemberOfClass:objc_opt_class()]) {
          unint64_t v7 = 0;
        }
        else {
          unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
        }
        goto LABEL_21;
      }
      id v8 = [v4 anchor];
      if (v8) {
        unint64_t v7 = [(BKWK2WebViewLoader *)self pageOffsetForAnchor:v8];
      }
      else {
        unint64_t v7 = 0;
      }
      unsigned int v10 = _AEWKLoaderLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218242;
        unint64_t v13 = v7;
        __int16 v14 = 2112;
        uint64_t v15 = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Determined Page Offset %lu for anchor location %@", (uint8_t *)&v12, 0x16u);
      }
    }
    goto LABEL_21;
  }
  if ([v5 isPageLocation])
  {
    unint64_t v7 = (unint64_t)[v6 pageOffset];
  }
  else
  {
    double v9 = _AEWKLoaderLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "CFI Location is not a pageLocation - unable to get pageOffset for this location", (uint8_t *)&v12, 2u);
    }

    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_21:

  return v7;
}

- (id)locationForPageOffset:(unint64_t)a3
{
  return -[BKWK2WebViewLoader locationForPageOffset:contentOffset:](self, "locationForPageOffset:contentOffset:", a3, CGPointZero.x, CGPointZero.y);
}

- (id)locationForPageOffset:(unint64_t)a3 contentOffset:(CGPoint)a4
{
  id v5 = +[BKEpubCFILocation unknownLocation];
  id v6 = [(BKWK2WebViewLoader *)self currentFirstVisbleCFILocation];

  if (v6)
  {
    uint64_t v7 = [(BKWK2WebViewLoader *)self currentFirstVisbleCFILocation];

    id v5 = (void *)v7;
  }

  return v5;
}

- (id)locationForAnchor:(id)a3
{
  id v4 = a3;
  id v5 = [(BKWK2WebViewLoader *)self anchorLocations];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)anchorFrameForAnchor:(id)a3
{
  id v4 = a3;
  id v5 = [(BKWK2WebViewLoader *)self anchorFrames];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (unint64_t)pageOffsetForAnchor:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    id v5 = _AEWKLoaderLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134217984;
      unint64_t v12 = [(BKWK2WebViewLoader *)self ordinal];
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Request to find page offset from an empty anchor ordinal:%lu", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_12;
  }
  id v5 = [(BKWK2WebViewLoader *)self locationForAnchor:v4];
  id v6 = _AEWKLoaderLog();
  uint64_t v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412546;
      unint64_t v12 = (unint64_t)v4;
      __int16 v13 = 2048;
      unint64_t v14 = [(BKWK2WebViewLoader *)self ordinal];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Unknown location for anchor %@ ordinal:%lu", (uint8_t *)&v11, 0x16u);
    }

LABEL_12:
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    unint64_t v12 = (unint64_t)v5;
    __int16 v13 = 2112;
    unint64_t v14 = (unint64_t)v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Found location %@ for anchor %@", (uint8_t *)&v11, 0x16u);
  }

  if ([v5 pageOffset] == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v8 = [(BKWK2WebViewLoader *)self pageOffsetForLocation:v5];
  }
  else {
    id v8 = [v5 pageOffset];
  }
  unint64_t v9 = (unint64_t)v8;
LABEL_15:

  return v9;
}

- (CGRect)rectForPageOffset:(unint64_t)a3
{
  if ([(BKWK2WebViewLoader *)self pageCount] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(BKWK2WebViewLoader *)self paginationOptions];
    [v6 contentLayoutSize];
    double v8 = v7;
    double height = v9;

    int v11 = _AEWKLoaderLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v43 = 134217984;
      unint64_t v44 = [(BKWK2WebViewLoader *)self ordinal];
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "rectForPageOffset invalid page count ordinal: %lu", (uint8_t *)&v43, 0xCu);
    }

    double y = 0.0;
    goto LABEL_5;
  }
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [(BKWK2WebViewLoader *)self paginationOptions];
    [v15 contentLayoutSize];
    double v8 = v16;
    double height = v17;

    unint64_t v18 = [(BKWK2WebViewLoader *)self paginationOptions];
    id v19 = [v18 mode];

    BOOL v20 = [(BKWK2WebViewLoader *)self paginationOptions];
    if ([v20 mode] == (char *)&dword_0 + 3)
    {
      unsigned __int8 v21 = 1;
    }
    else
    {
      id v3 = [(BKWK2WebViewLoader *)self paginationOptions];
      unsigned __int8 v21 = [v3 isHorizontalScroll];
    }
    double v22 = [(BKWK2WebViewLoader *)self paginationOptions];
    double v23 = (int *)[v22 mode];
    if (v23 == &dword_4
      || ([(BKWK2WebViewLoader *)self paginationOptions],
          id v3 = objc_claimAutoreleasedReturnValue(),
          ![v3 mode]))
    {
      double v25 = [(BKWK2WebViewLoader *)self paginationOptions];
      char v24 = [v25 isHorizontalScroll] ^ 1;

      if (v23 == &dword_4) {
        goto LABEL_18;
      }
    }
    else
    {
      char v24 = 0;
    }

LABEL_18:
    if (v19)
    {
      __int16 v28 = [(BKWK2WebViewLoader *)self paginationOptions];
      [v28 gapBetweenPages];
      double v30 = v29;

      if (a3) {
        goto LABEL_20;
      }
    }
    else
    {
      double v30 = 0.0;
      if (a3)
      {
LABEL_20:
        double v26 = v30 * 0.5;
        double v27 = (double)(a3 - 1);
        if (v24)
        {
          double y = v26 + height + v26 + v27 * (height + v30);
          double x = 0.0;
          if ((v21 & 1) == 0) {
            goto LABEL_34;
          }
          goto LABEL_26;
        }
        double v31 = v8 + v30;
        if ((v21 & 1) == 0)
        {
          double x = v26 + v8 + v26 + v27 * v31;
LABEL_33:
          double y = 0.0;
          goto LABEL_34;
        }
LABEL_30:
        double v32 = (double)a3;
        CGRect v33 = [(BKWK2WebViewLoader *)self webView];
        [v33 frame];
        double Width = CGRectGetWidth(v45);
        CFStringRef v35 = [(BKWK2WebViewLoader *)self paginationOptions];
        [v35 pageLength];
        double v37 = v36 + v36;

        double v38 = -0.0;
        if (Width > v37) {
          double v38 = v31;
        }
        double x = v38 - v31 * v32;
        goto LABEL_33;
      }
    }
    double y = 0.0;
    if ((v21 & 1) == 0)
    {
LABEL_5:
      double x = 0.0;
      goto LABEL_34;
    }
    if (v24)
    {
LABEL_26:
      double x = -0.0;
      goto LABEL_34;
    }
    double v31 = v8 + v30;
    goto LABEL_30;
  }
  unint64_t v14 = _AEWKLoaderLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v43 = 134217984;
    unint64_t v44 = [(BKWK2WebViewLoader *)self ordinal];
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "rectForPageOffset invalid pageOffset request in ordinal: %lu", (uint8_t *)&v43, 0xCu);
  }
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double v8 = CGRectNull.size.width;
  double height = CGRectNull.size.height;

LABEL_34:
  double v39 = x;
  double v40 = y;
  double v41 = v8;
  double v42 = height;
  result.size.double height = v42;
  result.size.CGFloat width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (CGRect)contentRectForVisibleContent
{
  id v3 = [(BKWK2WebViewLoader *)self webView];
  [(BKWK2WebViewLoader *)self contentRectForVisiblePage];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  unint64_t v12 = [v3 window];
  if (v12)
  {
    [v3 bounds];
    [v12 convertRect:v3 fromView:];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [v12 bounds];
    v41.origin.double x = v21;
    v41.origin.double y = v22;
    v41.size.double width = v23;
    v41.size.double height = v24;
    v38.origin.double x = v14;
    v38.origin.double y = v16;
    v38.size.double width = v18;
    v38.size.double height = v20;
    CGRect v39 = CGRectIntersection(v38, v41);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
    double v29 = [v3 be_contentView];
    [v12 convertRect:v29 toView:x, y, width, height];
    double v5 = v30;
    double v7 = v31;
    double v9 = v32;
    double v11 = v33;
  }
  double v34 = v5;
  double v35 = v7;
  double v36 = v9;
  double v37 = v11;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (CGRect)contentRectForVisiblePage
{
  id v2 = [(BKWK2WebViewLoader *)self webView];
  id v3 = [v2 be_contentView];
  [v2 bounds];
  [v3 convertRect:v2 fromView:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5 = a4;
  double v6 = [v5 name];
  unsigned int v7 = [v6 isEqualToString:@"cfiUpdate"];

  if (v7)
  {
    objc_opt_class();
    double v8 = [v5 body];
    double v9 = BUDynamicCast();

    objc_opt_class();
    double v10 = [v9 objectForKeyedSubscript:@"visibleCFIs"];
    double v11 = BUDynamicCast();

    objc_opt_class();
    double v12 = [v11 objectForKeyedSubscript:@"start"];
    double v13 = BUDynamicCast();

    objc_opt_class();
    double v14 = [v11 objectForKeyedSubscript:@"end"];
    BUDynamicCast();
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    v48 = v11;
    if (!v11 || !v13 || !v15)
    {
      CGFloat v16 = _AEWKLoaderLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        double v17 = [v5 name];
        CGFloat v18 = [v5 body];
        *(_DWORD *)buf = 138412546;
        v54 = v17;
        __int16 v55 = 2112;
        id v56 = v18;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Failed to get cfi string from message %@ %@", buf, 0x16u);
      }
    }
    double v19 = _AECaptureLocationLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v20 = +[NSNumber numberWithUnsignedInteger:[(BKWK2WebViewLoader *)self ordinal]];
      *(_DWORD *)buf = 138412802;
      v54 = v20;
      __int16 v55 = 2112;
      id v56 = v13;
      __int16 v57 = 2112;
      id v58 = v15;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "ordinal: %@ BKWK2WebViewLoaderCFIUpdateJSMessage received start: %@  end: %@ ", buf, 0x20u);
    }
    if (v13)
    {
      id v52 = 0;
      CGFloat v21 = +[BKEpubCFILocation locationForCFI:v13 error:&v52];
      id v22 = v52;
    }
    else
    {
      CGFloat v21 = 0;
      id v22 = 0;
    }
    v49 = v9;
    if (v15)
    {
      id v51 = 0;
      double v35 = +[BKEpubCFILocation locationForCFI:v15 error:&v51];
      id v36 = v51;

      id v22 = v36;
    }
    else
    {
      double v35 = 0;
    }
    double v37 = [v35 cfi];
    CGRect v38 = [v21 cfi];
    id v39 = [v37 compare:v38];

    if (v39 == (id)-1) {
      double v40 = v21;
    }
    else {
      double v40 = v35;
    }
    if (v39 == (id)-1) {
      CGFloat v21 = v35;
    }
    if (v21 && v40)
    {
      id v41 = [v21 unionWithCFI:v40];
    }
    else if (v21)
    {
      id v41 = v21;
    }
    else
    {
      id v41 = v40;
    }
    double v42 = v41;
    int v43 = _AECaptureLocationLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v44 = +[NSNumber numberWithUnsignedInteger:[(BKWK2WebViewLoader *)self ordinal]];
      *(_DWORD *)buf = 138412546;
      v54 = v44;
      __int16 v55 = 2112;
      id v56 = v21;
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "ordinal: %@ BKWK2WebViewLoaderCFIUpdateJSMessage capturing startLocation location: %@ ", buf, 0x16u);
    }
    [(BKWK2WebViewLoader *)self setCurrentFirstVisbleCFILocation:v21];
    [(BKWK2WebViewLoader *)self setCurrentLastVisbleCFILocation:v40];
    [(BKWK2WebViewLoader *)self setCurrentVisbleCFILocation:v42];
    CGRect v45 = [(BKWK2WebViewLoader *)self delegate];
    if (v45 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      __int16 v46 = [(BKWK2WebViewLoader *)self currentVisbleCFILocation];
      [v45 webViewLoader:self didUpdateCurrentVisibleCFILocation:v46];
    }
    __int16 v28 = v48;
    double v26 = v49;
    goto LABEL_43;
  }
  CGFloat v23 = [v5 name];
  unsigned int v24 = [v23 isEqualToString:@"selectionChange"];

  if (v24)
  {
    objc_opt_class();
    double v25 = [v5 body];
    double v26 = BUDynamicCast();

    if (!v26)
    {
LABEL_44:

      goto LABEL_45;
    }
    objc_opt_class();
    double v27 = [v26 objectForKeyedSubscript:@"cfi"];
    double v13 = BUDynamicCast();

    if ([v13 length])
    {
      id v50 = 0;
      __int16 v28 = +[BKEpubCFILocation locationForCFI:v13 error:&v50];
      id v15 = v50;
      if (v15)
      {
        double v29 = _AEWKLoaderLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          double v30 = [v5 name];
          *(_DWORD *)buf = 138412546;
          v54 = v30;
          __int16 v55 = 2112;
          id v56 = v15;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "Failed to get cfi string from message %@ %@", buf, 0x16u);
        }
      }
      if (v28)
      {
        [(BKWK2WebViewLoader *)self setCurrentSelectionCFI:v28];
        objc_opt_class();
        uint64_t v31 = [v26 objectForKeyedSubscript:@"containsAnchor"];
        double v32 = BUDynamicCast();
        -[BKWK2WebViewLoader setCurrentSelectionContainsAnchor:](self, "setCurrentSelectionContainsAnchor:", [v32 BOOLValue]);

        double v33 = [(BKWK2WebViewLoader *)self delegate];
        LOBYTE(v31) = objc_opt_respondsToSelector();

        if (v31)
        {
          double v34 = [(BKWK2WebViewLoader *)self delegate];
          [v34 webViewLoader:self didChangeSelection:v28];
        }
      }
    }
    else
    {
      __int16 v28 = 0;
      id v15 = 0;
    }
    objc_opt_class();
    id v47 = [v26 objectForKeyedSubscript:@"selectionText"];
    BUDynamicCast();
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v22) {
      [(BKWK2WebViewLoader *)self setCurrentTextSelection:v22];
    }
LABEL_43:

    goto LABEL_44;
  }
LABEL_45:
}

- (WKWebView)webView
{
  return self->_webView;
}

- (unint64_t)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(unint64_t)a3
{
  self->_ordinal = a3;
}

- (CGRect)desiredWebViewFrame
{
  double x = self->_desiredWebViewFrame.origin.x;
  double y = self->_desiredWebViewFrame.origin.y;
  double width = self->_desiredWebViewFrame.size.width;
  double height = self->_desiredWebViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BKWK2WebViewLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKWK2WebViewLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BKEpubCFILocation)currentFirstVisbleCFILocation
{
  return self->_currentFirstVisbleCFILocation;
}

- (void)setCurrentFirstVisbleCFILocation:(id)a3
{
}

- (BKEpubCFILocation)currentLastVisbleCFILocation
{
  return self->_currentLastVisbleCFILocation;
}

- (void)setCurrentLastVisbleCFILocation:(id)a3
{
}

- (BKEpubCFILocation)currentVisbleCFILocation
{
  return self->_currentVisbleCFILocation;
}

- (void)setCurrentVisbleCFILocation:(id)a3
{
}

- (BKEpubCFILocation)currentSelectionCFI
{
  return self->_currentSelectionCFI;
}

- (void)setCurrentSelectionCFI:(id)a3
{
}

- (NSString)currentTextSelection
{
  return self->_currentTextSelection;
}

- (void)setCurrentTextSelection:(id)a3
{
}

- (BOOL)currentSelectionContainsAnchor
{
  return self->_currentSelectionContainsAnchor;
}

- (void)setCurrentSelectionContainsAnchor:(BOOL)a3
{
  self->_currentSelectionContainsAnchor = a3;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_unint64_t pageCount = a3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (NSString)tocIdCssRules
{
  return self->_tocIdCssRules;
}

- (void)setTocIdCssRules:(id)a3
{
}

- (void)setPageTextDirectionIsRTL:(BOOL)a3
{
  self->_pageTextDirectionIsRTL = a3;
}

- (void)setIsVerticalDocument:(BOOL)a3
{
  self->_isVerticalDocument = a3;
}

- (NSDictionary)anchorLocations
{
  return self->_anchorLocations;
}

- (void)setAnchorLocations:(id)a3
{
}

- (NSDictionary)anchorFrames
{
  return self->_anchorFrames;
}

- (void)setAnchorFrames:(id)a3
{
}

- (NSDictionary)mediaLocations
{
  return self->_mediaLocations;
}

- (void)setMediaLocations:(id)a3
{
}

- (NSDictionary)mediaFrames
{
  return self->_mediaFrames;
}

- (void)setMediaFrames:(id)a3
{
}

- (BOOL)currentlyUpdatingPaginationInformation
{
  return self->_currentlyUpdatingPaginationInformation;
}

- (BKWK2LoaderContentInfoRequest)currentInfoRequest
{
  return self->_currentInfoRequest;
}

- (void)setCurrentInfoRequest:(id)a3
{
}

- (BKWK2LoaderContentInfoRequest)pendingInfoRequest
{
  return self->_pendingInfoRequest;
}

- (void)setPendingInfoRequest:(id)a3
{
}

- (unint64_t)contentInfo
{
  return self->_contentInfo;
}

- (void)setContentInfo:(unint64_t)a3
{
  self->_contentInfo = a3;
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BEWebViewFactoryPaginationOptions)paginationOptions
{
  return self->_paginationOptions;
}

- (void)setPaginationOptions:(id)a3
{
}

- (BOOL)textDirectionDetermined
{
  return self->_textDirectionDetermined;
}

- (void)setTextDirectionDetermined:(BOOL)a3
{
  self->_textDirectionDetermined = a3;
}

- (BOOL)calculatingPageLocations
{
  return self->_calculatingPageLocations;
}

- (void)setCalculatingPageLocations:(BOOL)a3
{
  self->_calculatingPageLocations = a3;
}

- (BOOL)webViewLoaded
{
  return self->_webViewLoaded;
}

- (void)setWebViewLoaded:(BOOL)a3
{
  self->_webViewLoaded = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)listeningForCFIUpdates
{
  return self->_listeningForCFIUpdates;
}

- (void)setListeningForCFIUpdates:(BOOL)a3
{
  self->_BOOL listeningForCFIUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paginationOptions, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_pendingInfoRequest, 0);
  objc_storeStrong((id *)&self->_currentInfoRequest, 0);
  objc_storeStrong((id *)&self->_mediaFrames, 0);
  objc_storeStrong((id *)&self->_mediaLocations, 0);
  objc_storeStrong((id *)&self->_anchorFrames, 0);
  objc_storeStrong((id *)&self->_anchorLocations, 0);
  objc_storeStrong((id *)&self->_tocIdCssRules, 0);
  objc_storeStrong((id *)&self->_currentTextSelection, 0);
  objc_storeStrong((id *)&self->_currentSelectionCFI, 0);
  objc_storeStrong((id *)&self->_currentVisbleCFILocation, 0);
  objc_storeStrong((id *)&self->_currentLastVisbleCFILocation, 0);
  objc_storeStrong((id *)&self->_currentFirstVisbleCFILocation, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end