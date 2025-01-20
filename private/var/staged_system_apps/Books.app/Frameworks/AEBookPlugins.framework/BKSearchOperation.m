@interface BKSearchOperation
- (AEBookInfo)searchBook;
- (BKSearchOperation)init;
- (BKSearchOperationDelegate)delegate;
- (BOOL)_doSearch;
- (BOOL)havePartialResults;
- (BOOL)isDone;
- (BOOL)isPastLimit;
- (BOOL)requiresMainThread;
- (NSArray)results;
- (NSObject)lastSavedSearchResult;
- (NSString)searchString;
- (NSURL)bookURL;
- (double)timeOut;
- (float)desiredSleepTime;
- (int64_t)ordinal;
- (unint64_t)startSearchFromIndex;
- (void)_postSearch:(id)a3;
- (void)_search;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setBookURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHavePartialResults:(BOOL)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setLastSavedSearchResult:(id)a3;
- (void)setOrdinal:(int64_t)a3;
- (void)setSearchBook:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setStartSearchFromIndex:(unint64_t)a3;
- (void)setTimeOut:(double)a3;
@end

@implementation BKSearchOperation

- (BKSearchOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKSearchOperation;
  v2 = [(BKSearchOperation *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:100];
    results = v2->_results;
    v2->_results = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(BKSearchOperation *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)BKSearchOperation;
  [(BKSearchOperation *)&v3 dealloc];
}

- (void)setSearchBook:(id)a3
{
  id obj = a3;
  v4 = [obj url];
  [(BKSearchOperation *)self setBookURL:v4];

  objc_storeWeak((id *)&self->_book, obj);
}

- (BOOL)_doSearch
{
  return 1;
}

- (void)setOrdinal:(int64_t)a3
{
  self->_ordinal = a3;
}

- (BOOL)isPastLimit
{
  return (unint64_t)[(NSMutableArray *)self->_results count] > 0x63;
}

- (void)_postSearch:(id)a3
{
  if ([a3 BOOLValue])
  {
    id v5 = [(BKSearchOperation *)self delegate];
    [v5 searchDidTimeOut:self];
LABEL_14:

    return;
  }
  if ([(BKSearchOperation *)self isCancelled])
  {
    id v5 = [(BKSearchOperation *)self delegate];
    [v5 searchWasCancelled:self];
    goto LABEL_14;
  }
  if (self->_isDone && [(BKSearchOperation *)self isPastLimit])
  {
    id v5 = [(BKSearchOperation *)self delegate];
    [v5 searchLimitHit:self];
    goto LABEL_14;
  }
  if (![(BKSearchOperation *)self havePartialResults])
  {
    if (!self->_isDone) {
      return;
    }
    id v5 = [(BKSearchOperation *)self delegate];
    [v5 searchDidFinish:self];
    goto LABEL_14;
  }
  v4 = [(BKSearchOperation *)self delegate];
  [v4 searchHasPartialResults:self];

  [(NSMutableArray *)self->_results removeAllObjects];

  [(BKSearchOperation *)self setHavePartialResults:0];
}

- (void)_search
{
  v4 = +[NSNumber numberWithBool:[(BKSearchOperation *)self _doSearch]];
  if ([(BKSearchOperation *)self requiresMainThread]) {
    [(BKSearchOperation *)self _postSearch:v4];
  }
  else {
    [(BKSearchOperation *)self performSelectorOnMainThread:"_postSearch:" withObject:v4 waitUntilDone:1];
  }
}

- (float)desiredSleepTime
{
  return 0.0;
}

- (BOOL)requiresMainThread
{
  return 1;
}

- (void)main
{
  objc_super v3 = _AESearchLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109376;
    int v11 = (int)self;
    __int16 v12 = 1024;
    unsigned int v13 = [(BKSearchOperation *)self ordinal];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "START main %x for ordinal: %d", (uint8_t *)&v10, 0xEu);
  }

  [(BKSearchOperation *)self desiredSleepTime];
  float v5 = v4;
  unsigned int v6 = [(BKSearchOperation *)self requiresMainThread];
  if (!self->_isDone)
  {
    unsigned int v7 = v6;
    do
    {
      if ([(BKSearchOperation *)self isCancelled]) {
        break;
      }
      if (v7) {
        [(BKSearchOperation *)self performSelectorOnMainThread:"_search" withObject:0 waitUntilDone:1];
      }
      else {
        [(BKSearchOperation *)self _search];
      }
      if (v5 > 0.0) {
        +[NSThread sleepForTimeInterval:v5];
      }
    }
    while (!self->_isDone);
  }
  v8 = _AESearchLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(BKSearchOperation *)self ordinal];
    int v10 = 67109376;
    int v11 = (int)self;
    __int16 v12 = 1024;
    unsigned int v13 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "FINISH main %x for ordinal: %d", (uint8_t *)&v10, 0xEu);
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)BKSearchOperation;
  [(BKSearchOperation *)&v4 cancel];
  if (!self->_isDone)
  {
    objc_super v3 = [(BKSearchOperation *)self delegate];
    [v3 searchWasCancelled:self];
  }
  [(BKSearchOperation *)self setDelegate:0];
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (AEBookInfo)searchBook
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_book);

  return (AEBookInfo *)WeakRetained;
}

- (NSURL)bookURL
{
  return self->_bookURL;
}

- (void)setBookURL:(id)a3
{
}

- (int64_t)ordinal
{
  return self->_ordinal;
}

- (NSArray)results
{
  return &self->_results->super;
}

- (double)timeOut
{
  return self->_timeOut;
}

- (void)setTimeOut:(double)a3
{
  self->_timeOut = a3;
}

- (BKSearchOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKSearchOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)startSearchFromIndex
{
  return self->_startSearchFromIndex;
}

- (void)setStartSearchFromIndex:(unint64_t)a3
{
  self->_startSearchFromIndex = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (BOOL)havePartialResults
{
  return self->_havePartialResults;
}

- (void)setHavePartialResults:(BOOL)a3
{
  self->_havePartialResults = a3;
}

- (NSObject)lastSavedSearchResult
{
  return self->_lastSavedSearchResult;
}

- (void)setLastSavedSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSavedSearchResult, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_bookURL, 0);
  objc_destroyWeak((id *)&self->_book);
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end