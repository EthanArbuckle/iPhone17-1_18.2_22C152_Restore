@interface BKSearchController
- (AEBookInfo)searchBook;
- (BESearchConfiguring)searchConfiguration;
- (BESearchControllerDelegate)delegate;
- (BKFlowingBookLayoutConfiguration)configuration;
- (BKSearchController)init;
- (BOOL)_isDocumentOrdinalSearchable:(int64_t)a3;
- (BOOL)_searchOnCandidateOrdinal:(int64_t)a3;
- (BOOL)contentIsChaptered;
- (BOOL)contentIsPages;
- (BOOL)hasPartialResults;
- (BOOL)isSearching;
- (BOOL)searchWasCompleted;
- (BOOL)wasAborted;
- (ContentStyle)contentStyle;
- (IMPerformSelectorProxy)performSelectorProxy;
- (NSArray)results;
- (NSObject)lastSavedSearchResult;
- (NSString)searchString;
- (WKWebView)webView;
- (id)_newSearchOperationForOrdinal:(int64_t)a3;
- (id)_searchQueue;
- (int64_t)webViewTrackingID;
- (unint64_t)chaptersRemaining;
- (unint64_t)pageCount;
- (unint64_t)pagesRemaining;
- (unint64_t)startSearchIndex;
- (void)_addResultsFromSearch:(id)a3;
- (void)_didFinishCreatingWebView:(id)a3 forTrackingID:(int64_t)a4 completion:(id)a5;
- (void)_resultsChanged;
- (void)_scheduleSearchAfterDelay:(double)a3 reportAnalytics:(BOOL)a4;
- (void)_searchOnOrdinal:(int64_t)a3;
- (void)_startSearchNowWithReportAnalytics:(id)a3;
- (void)_unscheduleSearch;
- (void)beginSearchWithReportAnalytics:(BOOL)a3;
- (void)cancelSearch;
- (void)continueSearch;
- (void)dealloc;
- (void)endSearch;
- (void)loadMore;
- (void)pauseSearch;
- (void)provideWebView:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 contentSupportMode:(unint64_t)a10 completion:(id)a11;
- (void)searchDidFinish:(id)a3;
- (void)searchHasPartialResults:(id)a3;
- (void)searchLimitHit:(id)a3;
- (void)searchWasCancelled:(id)a3;
- (void)setAborted:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentStyle:(id)a3 configuration:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLastSavedSearchResult:(id)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPartialResults:(BOOL)a3;
- (void)setSearchBook:(id)a3;
- (void)setSearchCompleted:(BOOL)a3;
- (void)setSearchConfiguration:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSearching:(BOOL)a3;
- (void)setStartSearchIndex:(unint64_t)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewTrackingID:(int64_t)a3;
@end

@implementation BKSearchController

- (BKSearchController)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKSearchController;
  v2 = [(BKSearchController *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:100];
    results = v2->_results;
    v2->_results = v3;

    v5 = (IMPerformSelectorProxy *)[objc_alloc((Class)IMPerformSelectorProxy) initWithTarget:v2];
    performSelectorProxy = v2->_performSelectorProxy;
    v2->_performSelectorProxy = v5;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(NSOperationQueue *)self->_searchQueue cancelAllOperations];
  searchQueue = self->_searchQueue;
  self->_searchQueue = 0;

  [(IMPerformSelectorProxy *)self->_performSelectorProxy teardown];
  indexQueryResult = self->_indexQueryResult;
  self->_indexQueryResult = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKSearchController;
  [(BKSearchController *)&v6 dealloc];
}

- (id)_searchQueue
{
  searchQueue = self->_searchQueue;
  if (!searchQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5 = self->_searchQueue;
    self->_searchQueue = v4;

    [(NSOperationQueue *)self->_searchQueue setMaxConcurrentOperationCount:1];
    searchQueue = self->_searchQueue;
  }

  return searchQueue;
}

- (void)setSearchString:(id)a3
{
  id v4 = a3;
  v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id obj = [v4 stringByTrimmingCharactersInSet:v5];

  if (([(NSString *)self->_searchString isEqual:obj] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchString, obj);
    [(BKSearchController *)self setAborted:0];
    [(BKSearchController *)self setPartialResults:0];
    [(BKSearchController *)self setSearchCompleted:0];
    [(BKSearchController *)self cancelSearch];
    indexQueryResult = self->_indexQueryResult;
    self->_indexQueryResult = 0;

    if ((unint64_t)[obj length] >= 3) {
      [(BKSearchController *)self _scheduleSearchAfterDelay:1 reportAnalytics:1.0];
    }
  }
}

- (void)setContentStyle:(id)a3 configuration:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v17 isEqual:self->_style];
  if ((v8 & 1) == 0) {
    objc_storeStrong((id *)&self->_style, a3);
  }
  id v9 = [v7 copy];
  v10 = [v9 environment];
  [v10 unfreeze];

  v11 = [(BKSearchController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(BKSearchController *)self delegate];
    v14 = [v13 environmentOverrideViewForSearchController:self];

    if (v14)
    {
      v15 = [v9 environment];
      [v15 setView:v14];
    }
  }
  v16 = [v9 environment];
  [v16 freeze];

  if (![(BKFlowingBookLayoutConfiguration *)self->_configuration isEqual:v9])
  {
    [(BKSearchController *)self setConfiguration:v7];
    goto LABEL_11;
  }
  if ((v8 & 1) == 0) {
LABEL_11:
  }
    [(BKSearchController *)self beginSearchWithReportAnalytics:1];
}

- (void)setSearchBook:(id)a3
{
  v5 = (AEBookInfo *)a3;
  p_book = &self->_book;
  if (self->_book != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_book, a3);
    p_book = (AEBookInfo **)[(BKSearchController *)self setSearchString:0];
    v5 = v7;
  }

  _objc_release_x1(p_book, v5);
}

- (id)_newSearchOperationForOrdinal:(int64_t)a3
{
  v5 = _AESearchLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    int64_t v13 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "-- _newSearchOperationForOrdinal for ordinal: %ld", (uint8_t *)&v12, 0xCu);
  }

  unsigned int v6 = [(AEBookInfo *)self->_book contentType];
  if (v6)
  {
    if (v6 != 2)
    {
      id v8 = 0;
      goto LABEL_9;
    }
    id v7 = &off_1D9C18;
  }
  else
  {
    id v7 = &off_1D9C60;
  }
  id v8 = objc_alloc_init(*v7);
LABEL_9:
  [v8 setDelegate:self];
  id v9 = [(BKSearchController *)self searchString];
  [v8 setSearchString:v9];

  v10 = [(BKSearchController *)self searchBook];
  [v8 setSearchBook:v10];

  [v8 setTimeOut:0.0];
  [v8 setOrdinal:a3];
  return v8;
}

- (BOOL)_searchOnCandidateOrdinal:(int64_t)a3
{
  v5 = _AESearchLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v17 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "-- _searchOnCandidateOrdinal ordinal: %ld", buf, 0xCu);
  }

  if (self->_indexQueryResult)
  {
    unsigned int v6 = _AESearchLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v17 = a3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "-- _searchOnCandidateOrdinal _indexQueryResult available for ordinal: %ld", buf, 0xCu);
    }

    char v15 = 0;
    id v7 = [(BKSearchController *)self searchBook];
    id v8 = [v7 readingDocumentCount];

    if ((uint64_t)v8 > a3)
    {
      *(void *)&long long v9 = 134218498;
      long long v14 = v9;
      while (!-[BKTextIndexQueryResult isCandidateOrdinal:isMissing:](self->_indexQueryResult, "isCandidateOrdinal:isMissing:", a3, &v15, v14)|| ![(BKSearchController *)self _isDocumentOrdinalSearchable:a3])
      {
        v10 = _AESearchLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = +[NSNumber numberWithBool:[(BKSearchController *)self _isDocumentOrdinalSearchable:a3]];
          int v12 = +[NSNumber numberWithBool:[(BKTextIndexQueryResult *)self->_indexQueryResult isCandidateOrdinal:a3 isMissing:&v15]];
          *(_DWORD *)buf = v14;
          int64_t v17 = a3;
          __int16 v18 = 2112;
          v19 = v11;
          __int16 v20 = 2112;
          v21 = v12;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "-- _searchOnCandidateOrdinal skipping ordinal: %ld isDocumentSearchable: %@ isCandidateOrdinal: %@", buf, 0x20u);
        }
        ++a3;
        --self->_chaptersRemaining;
        if (v8 == (id)a3) {
          return 0;
        }
      }
    }
    if (a3 >= (uint64_t)v8) {
      return 0;
    }
  }
  [(BKSearchController *)self _searchOnOrdinal:a3];
  return 1;
}

- (BOOL)_isDocumentOrdinalSearchable:(int64_t)a3
{
  id v4 = [(BKSearchController *)self searchBook];
  if ([v4 contentType]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 linearIndexForOrdinal:a3] != (id)0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)_searchOnOrdinal:(int64_t)a3
{
  char v5 = [(BKSearchController *)self searchBook];
  id v6 = [v5 readingDocumentCount];

  if ((uint64_t)v6 <= a3) {
    return;
  }
  id v17 = [(BKSearchController *)self _newSearchOperationForOrdinal:a3];
  [v17 setStartSearchFromIndex:[self startSearchIndex]];
  id v7 = [(BKSearchController *)self lastSavedSearchResult];
  [v17 setLastSavedSearchResult:v7];

  unsigned int v8 = [(AEBookInfo *)self->_book contentType];
  if (v8 == 2)
  {
    objc_opt_class();
    long long v9 = BUDynamicCast();
    if (v9)
    {
      [v9 setCurrentPageIndex:[self startSearchIndex]];
      objc_opt_class();
      v11 = [(BKSearchController *)self lastSavedSearchResult];
      long long v14 = BUDynamicCast();
      [v9 setLastSavedSearchResult:v14];
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v8)
  {
    objc_opt_class();
    long long v9 = BUDynamicCast();
    if (v9)
    {
      v10 = [(BKSearchController *)self searchBook];
      v11 = [v10 documentWithOrdinal:a3];

      int v12 = [(BKSearchController *)self searchBook];
      int64_t v13 = [v12 physicalPageMapForDocument:v11];
      [v9 setPhysicalPageMap:v13];

      long long v14 = [(BKSearchController *)self searchBook];
      char v15 = [v14 baseURL];
      [v9 setBaseURL:v15];

LABEL_9:
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
  v16 = [(BKSearchController *)self _searchQueue];
  [v16 addOperation:v17];
}

- (BOOL)contentIsPages
{
  return [(AEBookInfo *)self->_book contentType] == 2;
}

- (BOOL)contentIsChaptered
{
  return [(AEBookInfo *)self->_book contentType] == 0;
}

- (unint64_t)pagesRemaining
{
  return self->_pagesRemaining;
}

- (unint64_t)chaptersRemaining
{
  return self->_chaptersRemaining;
}

- (void)beginSearchWithReportAnalytics:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKSearchController *)self cancelSearch];
  char v5 = _AESearchLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "beginSearchWithReportAnalytics - schedule search after 0", v6, 2u);
  }

  [(BKSearchController *)self _scheduleSearchAfterDelay:v3 reportAnalytics:0.0];
}

- (void)_unscheduleSearch
{
  BOOL v3 = [(BKSearchController *)self performSelectorProxy];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v3 selector:"_startSearchNowWithReportAnalytics:" object:&__kCFBooleanTrue];

  id v4 = [(BKSearchController *)self performSelectorProxy];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v4 selector:"_startSearchNowWithReportAnalytics:" object:&__kCFBooleanFalse];
}

- (void)_scheduleSearchAfterDelay:(double)a3 reportAnalytics:(BOOL)a4
{
  BOOL v4 = a4;
  [(BKSearchController *)self _unscheduleSearch];
  id v8 = [(BKSearchController *)self performSelectorProxy];
  id v7 = +[NSNumber numberWithBool:v4];
  [v8 performSelector:"_startSearchNowWithReportAnalytics:" withObject:v7 afterDelay:a3];
}

- (void)_startSearchNowWithReportAnalytics:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self->_searchString length] && ![(BKSearchController *)self isSearching])
  {
    [(BKSearchController *)self cancelSearch];
    char v5 = [(BKFlowingBookLayoutConfiguration *)self->_configuration environment];
    [v5 unfreeze];

    id v6 = [(BKSearchController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(BKSearchController *)self delegate];
      long long v9 = [v8 environmentOverrideViewForSearchController:self];

      if (v9)
      {
        v10 = [(BKFlowingBookLayoutConfiguration *)self->_configuration environment];
        [v10 setView:v9];
      }
    }
    v11 = [(BKFlowingBookLayoutConfiguration *)self->_configuration environment];
    [v11 freeze];

    if (!self->_indexQueryResult)
    {
      int v12 = [(AEBookInfo *)self->_book baseURL];
      int64_t v13 = [v12 absoluteString];
      long long v14 = [v13 lastPathComponent];
      char v15 = +[BKTextIndex bookIndexWithName:v14];

      searchString = self->_searchString;
      id v17 = [(BKSearchController *)self searchBook];
      [v15 queryForString:searchString maxOrdinal:[v17 readingDocumentCount]];
      __int16 v18 = (BKTextIndexQueryResult *)objc_claimAutoreleasedReturnValue();
      indexQueryResult = self->_indexQueryResult;
      self->_indexQueryResult = v18;

      if (!self->_indexQueryResult)
      {
        [(BKSearchController *)self endSearch];

        goto LABEL_15;
      }
    }
    self->_maxSearchResults = 100;
    [(BKSearchController *)self setStartSearchIndex:0];
    [(BKSearchController *)self setLastSavedSearchResult:0];
    __int16 v20 = [(BKSearchController *)self searchBook];
    self->_unint64_t chaptersRemaining = (unint64_t)[v20 readingDocumentCount];

    v21 = _AESearchLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t chaptersRemaining = self->_chaptersRemaining;
      int v24 = 134217984;
      unint64_t v25 = chaptersRemaining;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "-- _startSearchNowWithReportAnalytics _chaptersRemaining: %ld", (uint8_t *)&v24, 0xCu);
    }

    if ([(BKSearchController *)self contentIsPages]) {
      self->_pagesRemaining = [(BKSearchController *)self pageCount];
    }
    [(BKSearchController *)self setSearching:1];
    v23 = [(BKSearchController *)self delegate];
    [v23 searchControllerWillBeginSearching:self reportAnalytics:[v4 BOOLValue]];

    [(BKSearchController *)self setAborted:0];
    [(BKSearchController *)self setPartialResults:0];
    [(BKSearchController *)self setSearchCompleted:0];
    [(BKSearchController *)self _searchOnCandidateOrdinal:0];
  }
LABEL_15:
}

- (void)cancelSearch
{
  unsigned int v3 = [(BKSearchController *)self isSearching];
  [(BKSearchController *)self _unscheduleSearch];
  [(BKSearchController *)self setSearching:0];
  [(BKSearchController *)self setPartialResults:0];
  [(BKSearchController *)self setStartSearchIndex:0];
  [(BKSearchController *)self setLastSavedSearchResult:0];
  [(BKSearchController *)self setSearchCompleted:0];
  id v4 = [(BKSearchController *)self _searchQueue];
  [v4 cancelAllOperations];

  [(BKSearchController *)self setWebView:0];
  [(BKSearchController *)self setWebViewTrackingID:(char *)[(BKSearchController *)self webViewTrackingID] + 1];
  if ([(NSMutableArray *)self->_results count])
  {
    [(NSMutableArray *)self->_results removeAllObjects];
    [(BKSearchController *)self _resultsChanged];
  }
  else if (!v3)
  {
    goto LABEL_5;
  }
  char v5 = [(BKSearchController *)self delegate];
  [v5 searchControllerDidFinishSearching:self];

LABEL_5:
  indexQueryResult = self->_indexQueryResult;
  self->_indexQueryResult = 0;
}

- (void)pauseSearch
{
  if ([(BKSearchController *)self isSearching])
  {
    [(BKSearchController *)self setSearching:0];
    [(BKSearchController *)self setPartialResults:1];
    unsigned int v3 = [(BKSearchController *)self delegate];
    [v3 searchControllerResultsChanged:self];

    id v4 = [(BKSearchController *)self delegate];
    [v4 searchControllerDidFinishSearching:self];

    char v5 = [(AEBookInfo *)self->_book baseURL];
    id v6 = [v5 absoluteString];
    char v7 = [v6 lastPathComponent];
    id v8 = +[BKTextIndex bookIndexWithName:v7];

    [v8 save];
  }
}

- (void)continueSearch
{
  if (![(BKSearchController *)self isSearching])
  {
    unsigned int v3 = [(BKSearchController *)self searchString];
    id v4 = [v3 length];

    if (v4)
    {
      char v5 = [(BKSearchController *)self delegate];
      [v5 searchControllerWillBeginSearching:self reportAnalytics:1];

      [(BKSearchController *)self setAborted:0];
      [(BKSearchController *)self setPartialResults:0];
      [(BKSearchController *)self setSearchCompleted:0];
      [(BKSearchController *)self setSearching:1];
      id v6 = [(BKSearchController *)self searchBook];
      char v7 = (char *)[v6 readingDocumentCount];

      if (![(BKSearchController *)self _searchOnCandidateOrdinal:&v7[-self->_chaptersRemaining]])
      {
        [(BKSearchController *)self endSearch];
      }
    }
  }
}

- (void)endSearch
{
  [(BKSearchController *)self setSearching:0];
  [(BKSearchController *)self setSearchCompleted:1];
  unsigned int v3 = [(BKSearchController *)self _searchQueue];
  [v3 cancelAllOperations];

  [(BKSearchController *)self setWebView:0];
  [(BKSearchController *)self setWebViewTrackingID:(char *)[(BKSearchController *)self webViewTrackingID] + 1];
  id v4 = [(BKSearchController *)self delegate];
  [v4 searchControllerResultsChanged:self];

  char v5 = [(BKSearchController *)self delegate];
  [v5 searchControllerDidFinishSearching:self];

  id v6 = [(AEBookInfo *)self->_book baseURL];
  char v7 = [v6 absoluteString];
  id v8 = [v7 lastPathComponent];
  id v9 = +[BKTextIndex bookIndexWithName:v8];

  [v9 save];
}

- (void)loadMore
{
  if (![(BKSearchController *)self isSearching])
  {
    unsigned int v3 = [(BKSearchController *)self searchString];
    id v4 = [v3 length];

    if (v4)
    {
      self->_maxSearchResults += 100;
      [(BKSearchController *)self continueSearch];
    }
  }
}

- (void)_addResultsFromSearch:(id)a3
{
  id v8 = a3;
  id v4 = [v8 results];
  id v5 = [v4 count];

  if (v5)
  {
    results = self->_results;
    char v7 = [v8 results];
    [(NSMutableArray *)results addObjectsFromArray:v7];

    [(BKSearchController *)self _resultsChanged];
  }
}

- (void)_resultsChanged
{
  id v3 = [(BKSearchController *)self delegate];
  [v3 searchControllerResultsChanged:self];
}

- (void)provideWebView:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 contentSupportMode:(unint64_t)a10 completion:(id)a11
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v34 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a11;
  v27 = [(BKSearchController *)self webView];

  if (v27)
  {
    v28 = _AESearchLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [(BKSearchController *)self webView];
      *(_DWORD *)buf = 138412290;
      v39 = v29;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Reusing web view %@", buf, 0xCu);
    }
    v30 = (void (**)(id, void *, void))objc_retainBlock(v26);
    if (v30)
    {
      v31 = [(BKSearchController *)self webView];
      v30[2](v30, v31, 0);
    }
  }
  else
  {
    [(BKSearchController *)self setWebViewTrackingID:(char *)[(BKSearchController *)self webViewTrackingID] + 1];
    v32 = [(BKSearchController *)self webViewTrackingID];
    v33 = _AESearchLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v32;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Creating web view for tracking ID: %d", buf, 8u);
    }

    objc_initWeak((id *)buf, self);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_92EF0;
    v35[3] = &unk_1DCDC8;
    objc_copyWeak(v37, (id *)buf);
    v37[1] = v32;
    id v36 = v26;
    +[BEWebViewFactory viewConfiguredForSearch:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:contentSupportMode:completion:](BEWebViewFactory, "viewConfiguredForSearch:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:contentSupportMode:completion:", v34, v21, v22, v23, v24, v25, x, y, width, height, a10, v35);

    objc_destroyWeak(v37);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_didFinishCreatingWebView:(id)a3 forTrackingID:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = _AESearchLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109120;
    int v15 = a4;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Finished creating web view for tracking ID: %d", (uint8_t *)&v14, 8u);
  }

  if ([(BKSearchController *)self webViewTrackingID] == a4)
  {
    [(BKSearchController *)self setWebView:v8];
  }
  else
  {
    v11 = _AESearchLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [(BKSearchController *)self webViewTrackingID];
      int v14 = 67109376;
      int v15 = a4;
      __int16 v16 = 1024;
      unsigned int v17 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Ignoring web view for old tracking ID: %d (currently: %d)", (uint8_t *)&v14, 0xEu);
    }
  }
  int64_t v13 = (void (**)(id, id, uint64_t))objc_retainBlock(v9);

  if (v13) {
    v13[2](v13, v8, 1);
  }
}

- (void)searchWasCancelled:(id)a3
{
}

- (void)searchLimitHit:(id)a3
{
  id v8 = a3;
  id v4 = [(BKSearchController *)self delegate];
  [v4 searchControllerFinishedSearchingChapter:self];

  [(BKSearchController *)self _addResultsFromSearch:v8];
  unsigned __int8 v5 = [(BKSearchController *)self contentIsPages];
  id v6 = (char *)[v8 startSearchFromIndex];
  if ((v5 & 1) == 0) {
    id v6 = &v6[[(BKSearchController *)self startSearchIndex]];
  }
  [(BKSearchController *)self setStartSearchIndex:v6];
  char v7 = [v8 lastSavedSearchResult];
  [(BKSearchController *)self setLastSavedSearchResult:v7];

  [(BKSearchController *)self pauseSearch];
}

- (void)searchHasPartialResults:(id)a3
{
  id v9 = a3;
  unsigned int v4 = [(BKSearchController *)self contentIsPages];
  id v5 = v9;
  if (v4)
  {
    objc_opt_class();
    id v6 = BUDynamicCast();
    id v7 = [v6 remainingPages];
    if (self->_pagesRemaining != v7)
    {
      self->_pagesRemaining = (unint64_t)v7;
      id v8 = [(BKSearchController *)self delegate];
      [v8 searchControllerFinishedSearchingChapter:self];
    }
    id v5 = v9;
  }
  [(BKSearchController *)self _addResultsFromSearch:v5];
  if ((unint64_t)[(NSMutableArray *)self->_results count] >= self->_maxSearchResults) {
    [(BKSearchController *)self pauseSearch];
  }
}

- (void)searchDidFinish:(id)a3
{
  id v4 = a3;
  --self->_chaptersRemaining;
  id v5 = _AESearchLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 ordinal];
    unint64_t chaptersRemaining = self->_chaptersRemaining;
    *(_DWORD *)buf = 134218240;
    id v21 = v6;
    __int16 v22 = 2048;
    unint64_t v23 = chaptersRemaining;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "-- searchDidFinishfor ordinal: %ld  chaptersRemaining: %ld", buf, 0x16u);
  }

  id v8 = [(BKSearchController *)self delegate];
  [v8 searchControllerFinishedSearchingChapter:self];

  [(BKSearchController *)self _addResultsFromSearch:v4];
  [(BKSearchController *)self setStartSearchIndex:0];
  [(BKSearchController *)self setLastSavedSearchResult:0];
  if ((unint64_t)[(NSMutableArray *)self->_results count] < self->_maxSearchResults
    && [(BKSearchController *)self isSearching])
  {
    -[BKSearchController _searchOnCandidateOrdinal:](self, "_searchOnCandidateOrdinal:", (char *)[v4 ordinal] + 1);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [(BKSearchController *)self _searchQueue];
    v10 = [v9 operations];

    id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      while (2)
      {
        int v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          if (![*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) isDone])
          {

            goto LABEL_15;
          }
          int v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    [(BKSearchController *)self endSearch];
  }
  else
  {
    [(BKSearchController *)self pauseSearch];
  }
LABEL_15:
}

- (IMPerformSelectorProxy)performSelectorProxy
{
  return self->_performSelectorProxy;
}

- (BESearchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BESearchControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (AEBookInfo)searchBook
{
  return self->_book;
}

- (ContentStyle)contentStyle
{
  return self->_style;
}

- (NSArray)results
{
  return &self->_results->super;
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (void)setSearching:(BOOL)a3
{
  self->_searching = a3;
}

- (BOOL)wasAborted
{
  return self->_aborted;
}

- (void)setAborted:(BOOL)a3
{
  self->_aborted = a3;
}

- (BOOL)hasPartialResults
{
  return self->_partialResults;
}

- (void)setPartialResults:(BOOL)a3
{
  self->_partialResults = a3;
}

- (BOOL)searchWasCompleted
{
  return self->_searchCompleted;
}

- (void)setSearchCompleted:(BOOL)a3
{
  self->_searchCompleted = a3;
}

- (unint64_t)startSearchIndex
{
  return self->_startSearchIndex;
}

- (void)setStartSearchIndex:(unint64_t)a3
{
  self->_startSearchIndedouble x = a3;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (BKFlowingBookLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BESearchConfiguring)searchConfiguration
{
  return self->_searchConfiguration;
}

- (void)setSearchConfiguration:(id)a3
{
}

- (NSObject)lastSavedSearchResult
{
  return self->_lastSavedSearchResult;
}

- (void)setLastSavedSearchResult:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (int64_t)webViewTrackingID
{
  return self->_webViewTrackingID;
}

- (void)setWebViewTrackingID:(int64_t)a3
{
  self->_webViewTrackingID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_lastSavedSearchResult, 0);
  objc_storeStrong((id *)&self->_searchConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_performSelectorProxy, 0);
  objc_storeStrong((id *)&self->_indexQueryResult, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_book, 0);
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end