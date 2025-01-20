@interface CRLModelSearchController
+ (BOOL)p_searchReference:(id)a3 comparedWithSearchReference:(id)a4 inDirection:(unint64_t)a5 before:(BOOL)a6;
+ (BOOL)searchReference:(id)a3 isAfterSearchReference:(id)a4 inDirection:(unint64_t)a5;
+ (BOOL)searchReference:(id)a3 isBeforeSearchReference:(id)a4 inDirection:(unint64_t)a5;
+ (int64_t)compareSearchReference:(id)a3 toSearchReference:(id)a4;
+ (void)assertSearchTargetImplementsProperMethods:(id)a3;
- (BOOL)_nextSearchTargetWithMatchInDirection:(unint64_t)a3;
- (BOOL)modelSearchesRunSynchronously;
- (BOOL)respondsToSearch;
- (BOOL)searchCriteriaIsValid;
- (CRLFindReplaceDelegate)findReplaceDelegate;
- (CRLModelSearchController)init;
- (CRLModelSearchController)initWithEditingCoordinator:(id)a3 delegate:(id)a4 modelSearchesRunSynchronously:(BOOL)a5;
- (CRLSearch)currentSearch;
- (CRLSearchReference)primaryFindResultSearchReference;
- (CRLSearchReference)startingPointSearchReference;
- (CRLSearchable)currentSearchable;
- (NSEnumerator)currentModelEnumerator;
- (NSMutableArray)layoutSearchResults;
- (NSMutableDictionary)layoutSearchCountForRootIndexMap;
- (_NSRange)currentRootSearchTargetRange;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (_TtC8Freeform8CRLBoard)board;
- (double)currentSearchStartTime;
- (id)_firstResultInDirection:(unint64_t)a3;
- (id)_lastResultInDirection:(unint64_t)a3;
- (id)firstVisibleResultInRect:(CGRect)a3;
- (id)getNextSearchFromCurrentSearchable;
- (id)modelEnumeratorForUserSearch;
- (id)p_searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4;
- (id)progressBlock;
- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4;
- (unint64_t)_layoutSearchResultsIndexAtOrAfterSearchReference:(id)a3 inDirection:(unint64_t)a4 isOrdredSame:(BOOL *)a5;
- (unint64_t)_layoutSearchResultsIndexAtOrBeforeSearchReference:(id)a3 inDirection:(unint64_t)a4 isOrdredSame:(BOOL *)a5;
- (unint64_t)_layoutSearchResultsIndexNearestToSearchReference:(id)a3 inDirection:(unint64_t)a4 isOrdredSame:(BOOL *)a5;
- (unint64_t)_resultCountInRootObjectRange:(_NSRange)a3;
- (unint64_t)currentSearchResultsCount;
- (unint64_t)findResultIndex;
- (unint64_t)indexOfVisibleSearchReference:(id)a3;
- (unint64_t)layoutSearchResultsIndexOfSearchReference:(id)a3;
- (unint64_t)nextRootSearchTargetFromIndex:(unint64_t)a3 inDirection:(unint64_t)a4;
- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6;
- (unint64_t)searchResultsCount;
- (void)_buildLayoutSearchResultsForRootSearchTargetsInRange:(_NSRange)a3 resultsArray:(id)a4;
- (void)asyncBuildSearchResultsIfNecessaryWithCompletionBlock:(id)a3;
- (void)asyncPerformSearchWithSearchTarget:(id)a3 resultsArray:(id)a4 completionBlock:(id)a5;
- (void)asyncSearchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4 completionBlock:(id)a5;
- (void)buildSearchResultsIfNecessary;
- (void)buildVisibleSearchResultsIfNecessary;
- (void)continueCountingHits;
- (void)continueSearch;
- (void)invalidateSearchResults;
- (void)invalidateSearchResultsCountPerRootIndexForRange:(_NSRange)a3;
- (void)p_asyncBuildLayoutSearchResultsForRootSearchTargetsInRange:(_NSRange)a3 resultsArray:(id)a4 completionBlock:(id)a5;
- (void)performSearchWithSearchTarget:(id)a3 resultsArray:(id)a4;
- (void)setCurrentModelEnumerator:(id)a3;
- (void)setCurrentRootSearchTargetRange:(_NSRange)a3;
- (void)setCurrentSearch:(id)a3;
- (void)setCurrentSearchResultsCount:(unint64_t)a3;
- (void)setCurrentSearchStartTime:(double)a3;
- (void)setCurrentSearchable:(id)a3;
- (void)setEditingCoordinator:(id)a3;
- (void)setLayoutSearchCountForRootIndexMap:(id)a3;
- (void)setLayoutSearchResults:(id)a3;
- (void)setModelSearchesRunSynchronously:(BOOL)a3;
- (void)setPrimaryFindResultSearchReference:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setSearchProgressBlock:(id)a3;
- (void)setStartingPointSearchReference:(id)a3;
- (void)sortLayoutSearchResultsArray:(id)a3;
- (void)startCountingHits;
- (void)stopCountingHits;
@end

@implementation CRLModelSearchController

- (void)setEditingCoordinator:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingCoordinator);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_editingCoordinator, obj);
    [(CRLModelSearchController *)self stopCountingHits];
    v5 = obj;
  }
}

- (CRLModelSearchController)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC618);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLModelSearchController init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    __int16 v17 = 1024;
    int v18 = 81;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC638);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:81 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLModelSearchController init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLModelSearchController)initWithEditingCoordinator:(id)a3 delegate:(id)a4 modelSearchesRunSynchronously:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CRLModelSearchController;
  id v10 = [(CRLModelSearchController *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_editingCoordinator, v8);
    uint64_t v12 = +[NSMutableArray array];
    layoutSearchResults = v11->_layoutSearchResults;
    v11->_layoutSearchResults = (NSMutableArray *)v12;

    uint64_t v14 = +[NSMutableDictionary dictionary];
    layoutSearchCountForRootIndexMap = v11->_layoutSearchCountForRootIndexMap;
    v11->_layoutSearchCountForRootIndexMap = (NSMutableDictionary *)v14;

    objc_storeWeak((id *)&v11->_findReplaceDelegate, v9);
    v11->_modelSearchesRunSynchronously = a5;
  }

  return v11;
}

- (void)setSearchProgressBlock:(id)a3
{
  id v6 = a3;
  id v4 = [(CRLModelSearchController *)self progressBlock];

  if (v4 != v6)
  {
    [(CRLModelSearchController *)self stopCountingHits];
    [(CRLModelSearchController *)self setProgressBlock:v6];
    v5 = [(CRLModelSearchController *)self progressBlock];

    if (v5) {
      [(CRLModelSearchController *)self startCountingHits];
    }
  }
}

- (unint64_t)searchResultsCount
{
  v3 = [(CRLModelSearchController *)self layoutSearchResults];
  id v4 = [v3 count];

  unint64_t result = [(CRLModelSearchController *)self currentSearchResultsCount];
  if ((unint64_t)v4 > result) {
    return (unint64_t)v4;
  }
  return result;
}

- (_TtC8Freeform8CRLBoard)board
{
  unsigned int v2 = [(CRLModelSearchController *)self editingCoordinator];
  v3 = [v2 mainBoard];

  return (_TtC8Freeform8CRLBoard *)v3;
}

- (BOOL)searchCriteriaIsValid
{
  return 1;
}

- (BOOL)respondsToSearch
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC658);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    v21 = "-[CRLModelSearchController respondsToSearch]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    __int16 v24 = 1024;
    int v25 = 122;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC678);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController respondsToSearch]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  __int16 v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 122, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  __int16 v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLModelSearchController respondsToSearch]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (id)getNextSearchFromCurrentSearchable
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC698);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    v21 = "-[CRLModelSearchController getNextSearchFromCurrentSearchable]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    __int16 v24 = 1024;
    int v25 = 127;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC6B8);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController getNextSearchFromCurrentSearchable]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  __int16 v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 127, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  __int16 v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLModelSearchController getNextSearchFromCurrentSearchable]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)continueSearch
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC6D8);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    v21 = "-[CRLModelSearchController continueSearch]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    __int16 v24 = 1024;
    int v25 = 132;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC6F8);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController continueSearch]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  __int16 v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 132, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  __int16 v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLModelSearchController continueSearch]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)continueCountingHits
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC718);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C638();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC738);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController continueCountingHits]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:138 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  unsigned int v6 = [(CRLModelSearchController *)self modelSearchesRunSynchronously];
  uint64_t v7 = [(CRLModelSearchController *)self currentModelEnumerator];
  if (v7)
  {
    id v8 = (void *)v7;
    unsigned int v9 = [(CRLModelSearchController *)self searchCriteriaIsValid];

    if (v9)
    {
      while (1)
      {
        id v10 = [(CRLModelSearchController *)self currentSearchable];

        if (v10)
        {
          BOOL v11 = 0;
        }
        else
        {
          uint64_t v12 = [(CRLModelSearchController *)self currentModelEnumerator];
          __int16 v13 = [v12 nextObject];

          BOOL v11 = v13 == 0;
          if (v13)
          {
            __int16 v20 = sub_100246AC8(v13, 1, v14, v15, v16, v17, v18, v19, (uint64_t)&OBJC_PROTOCOL___CRLSearchable);
            [(CRLModelSearchController *)self setCurrentSearchable:v20];

            [(CRLModelSearchController *)self currentSearchable];
          }
        }
        v21 = [(CRLModelSearchController *)self currentSearchable];

        if (v21)
        {
          __int16 v22 = [(CRLModelSearchController *)self currentSearch];

          if (v22)
          {
            [(CRLModelSearchController *)self continueSearch];
          }
          else if ([(CRLModelSearchController *)self respondsToSearch])
          {
            v23 = [(CRLModelSearchController *)self getNextSearchFromCurrentSearchable];
            [(CRLModelSearchController *)self setCurrentSearch:v23];
          }
          uint64_t v24 = [(CRLModelSearchController *)self currentSearch];
          if (v24)
          {
            int v25 = (void *)v24;
            __int16 v26 = [(CRLModelSearchController *)self currentSearch];
            unsigned int v27 = [v26 isComplete];

            if (v27) {
              [(CRLModelSearchController *)self setCurrentSearch:0];
            }
          }
          v28 = [(CRLModelSearchController *)self currentSearch];

          if (!v28) {
            [(CRLModelSearchController *)self setCurrentSearchable:0];
          }
        }
        v29 = [(CRLModelSearchController *)self progressBlock];
        if (v29)
        {

          if (v11 | v6 ^ 1)
          {
            v30 = [(CRLModelSearchController *)self progressBlock];
            v30[2](v30, [(CRLModelSearchController *)self currentSearchResultsCount], v11);
          }
        }
        if (v11) {
          break;
        }
        if ((v6 & 1) == 0)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1002FDDD0;
          block[3] = &unk_1014CBBB0;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          return;
        }
      }
      [(CRLModelSearchController *)self setCurrentModelEnumerator:0];
    }
  }
}

- (void)stopCountingHits
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC758);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C6C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC778);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController stopCountingHits]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:192 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLModelSearchController *)self setCurrentSearchResultsCount:0];
  [(CRLModelSearchController *)self setCurrentModelEnumerator:0];
  [(CRLModelSearchController *)self setCurrentSearch:0];
}

- (id)modelEnumeratorForUserSearch
{
  unsigned int v2 = [(CRLModelSearchController *)self board];
  v3 = [v2 modelEnumeratorWithFlags:1];

  return v3;
}

- (void)startCountingHits
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC798);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C748();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC7B8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController startCountingHits]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:204 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLModelSearchController *)self setCurrentSearchable:0];
  unsigned int v6 = [(CRLModelSearchController *)self findReplaceDelegate];
  uint64_t v7 = [v6 modelEnumeratorForSearchWithFlags:1];
  [(CRLModelSearchController *)self setCurrentModelEnumerator:v7];

  [(CRLModelSearchController *)self setCurrentSearchResultsCount:0];
  [(CRLModelSearchController *)self setCurrentSearchStartTime:CFAbsoluteTimeGetCurrent()];
  id v8 = [(CRLModelSearchController *)self currentModelEnumerator];

  if (v8)
  {
    if ([(CRLModelSearchController *)self modelSearchesRunSynchronously])
    {
      [(CRLModelSearchController *)self continueCountingHits];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002FE2E4;
      block[3] = &unk_1014CBBB0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

+ (void)assertSearchTargetImplementsProperMethods:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    && (objc_opt_respondsToSelector() & 1) == 0
    && (objc_opt_respondsToSelector() & 1) == 0
    && (objc_opt_respondsToSelector() & 1) == 0
    && (objc_opt_respondsToSelector() & 1) == 0)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC7D8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C7D0((uint64_t)v3, v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC7F8);
    }
    unsigned int v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLModelSearchController assertSearchTargetImplementsProperMethods:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7, v8, 229, 0, "Search target %@ does not respond to one of the necessary protocol methods.", v3 file lineNumber isFatal description];
  }
}

- (void)invalidateSearchResults
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC818);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C88C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC838);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    int v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController invalidateSearchResults]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:233 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  unsigned int v6 = [(CRLModelSearchController *)self layoutSearchResults];
  [v6 removeAllObjects];

  -[CRLModelSearchController setCurrentRootSearchTargetRange:](self, "setCurrentRootSearchTargetRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  [(CRLModelSearchController *)self setPrimaryFindResultSearchReference:0];
  [(CRLModelSearchController *)self stopCountingHits];
  uint64_t v7 = [(CRLModelSearchController *)self progressBlock];
  if (v7)
  {
    id v8 = (void *)v7;
    unsigned int v9 = [(CRLModelSearchController *)self searchCriteriaIsValid];

    if (v9) {
      [(CRLModelSearchController *)self startCountingHits];
    }
  }
}

- (void)invalidateSearchResultsCountPerRootIndexForRange:(_NSRange)a3
{
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL || a3.length != 0)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [(CRLModelSearchController *)self layoutSearchCountForRootIndexMap];
    id v8 = [v7 allKeys];

    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          signed int v14 = [v13 intValue];
          if (v14 >= location && v14 - location < length)
          {
            uint64_t v16 = [(CRLModelSearchController *)self layoutSearchCountForRootIndexMap];
            [v16 removeObjectForKey:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (unint64_t)findResultIndex
{
  id v3 = [(CRLModelSearchController *)self primaryFindResultSearchReference];
  unint64_t v4 = [(CRLModelSearchController *)self indexOfVisibleSearchReference:v3];

  return v4;
}

- (void)performSearchWithSearchTarget:(id)a3 resultsArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC858);
  }
  id v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v9 = v8;
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 67110146;
    unsigned int v24 = v7;
    __int16 v25 = 2082;
    __int16 v26 = "-[CRLModelSearchController performSearchWithSearchTarget:resultsArray:]";
    __int16 v27 = 2082;
    v28 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    __int16 v29 = 1024;
    int v30 = 263;
    __int16 v31 = 2114;
    v32 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC878);
  }
  uint64_t v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = v12;
    signed int v14 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v24 = v7;
    __int16 v25 = 2114;
    __int16 v26 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController performSearchWithSearchTarget:resultsArray:]");
  uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
  long long v17 = (objc_class *)objc_opt_class();
  long long v18 = NSStringFromClass(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 263, 0, "Abstract method not overridden by %{public}@", v18);

  long long v19 = (objc_class *)objc_opt_class();
  long long v20 = NSStringFromClass(v19);
  v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v20, "-[CRLModelSearchController performSearchWithSearchTarget:resultsArray:]");
  id v22 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v21 userInfo:0];

  objc_exception_throw(v22);
}

- (void)asyncPerformSearchWithSearchTarget:(id)a3 resultsArray:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC898);
  }
  uint64_t v11 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = v11;
    __int16 v13 = (objc_class *)objc_opt_class();
    signed int v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 67110146;
    unsigned int v27 = v10;
    __int16 v28 = 2082;
    __int16 v29 = "-[CRLModelSearchController asyncPerformSearchWithSearchTarget:resultsArray:completionBlock:]";
    __int16 v30 = 2082;
    __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    __int16 v32 = 1024;
    int v33 = 267;
    __int16 v34 = 2114;
    v35 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC8B8);
  }
  uint64_t v15 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = v15;
    long long v17 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v27 = v10;
    __int16 v28 = 2114;
    __int16 v29 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  long long v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController asyncPerformSearchWithSearchTarget:resultsArray:completionBlock:]");
  long long v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
  long long v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 267, 0, "Abstract method not overridden by %{public}@", v21);

  id v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  unsigned int v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v23, "-[CRLModelSearchController asyncPerformSearchWithSearchTarget:resultsArray:completionBlock:]");
  id v25 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v24 userInfo:0];

  objc_exception_throw(v25);
}

- (void)sortLayoutSearchResultsArray:(id)a3
{
}

- (unint64_t)_layoutSearchResultsIndexAtOrBeforeSearchReference:(id)a3 inDirection:(unint64_t)a4 isOrdredSame:(BOOL *)a5
{
  id v8 = a3;
  id v9 = [(CRLModelSearchController *)self layoutSearchResults];
  unsigned int v10 = (char *)[v9 count];

  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v10 - 1;
    while (1)
    {
      unint64_t v13 = (unint64_t)(a4 ? v12 : v11);
      signed int v14 = [(CRLModelSearchController *)self layoutSearchResults];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v13];

      id v16 = [(id)objc_opt_class() compareSearchReference:v8 toSearchReference:v15];
      if (!v16) {
        break;
      }
      if (!a4 && v16 == (id)1 || a4 == 1 && v16 == (id)-1)
      {
        if (!a5) {
          goto LABEL_18;
        }
        BOOL v17 = 0;
        goto LABEL_17;
      }

      ++v11;
      if (--v12 == (char *)-1) {
        goto LABEL_12;
      }
    }
    if (!a5) {
      goto LABEL_18;
    }
    BOOL v17 = 1;
LABEL_17:
    *a5 = v17;
LABEL_18:
  }
  else
  {
LABEL_12:
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (unint64_t)_layoutSearchResultsIndexAtOrAfterSearchReference:(id)a3 inDirection:(unint64_t)a4 isOrdredSame:(BOOL *)a5
{
  id v8 = a3;
  id v9 = [(CRLModelSearchController *)self layoutSearchResults];
  unsigned int v10 = (char *)[v9 count];

  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v10 - 1;
    while (1)
    {
      unint64_t v13 = (unint64_t)(a4 ? v12 : v11);
      signed int v14 = [(CRLModelSearchController *)self layoutSearchResults];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v13];

      id v16 = [(id)objc_opt_class() compareSearchReference:v8 toSearchReference:v15];
      if (!v16) {
        break;
      }
      if (!a4 && v16 == (id)-1 || a4 == 1 && v16 == (id)1)
      {
        if (!a5) {
          goto LABEL_18;
        }
        BOOL v17 = 0;
        goto LABEL_17;
      }

      ++v11;
      if (--v12 == (char *)-1) {
        goto LABEL_12;
      }
    }
    if (!a5) {
      goto LABEL_18;
    }
    BOOL v17 = 1;
LABEL_17:
    *a5 = v17;
LABEL_18:
  }
  else
  {
LABEL_12:
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (void)_buildLayoutSearchResultsForRootSearchTargetsInRange:(_NSRange)a3 resultsArray:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = (char *)a3.location;
  id v7 = a4;
  if (location != [(CRLModelSearchController *)self currentRootSearchTargetRange]
    || length != v8)
  {
    -[CRLModelSearchController setCurrentRootSearchTargetRange:](self, "setCurrentRootSearchTargetRange:", location, length);
    id v9 = objc_alloc_init((Class)NSMutableSet);
    __int16 v34 = &location[length];
    if (location < &location[length])
    {
      *(void *)&long long v10 = 67109378;
      long long v33 = v10;
      do
      {
        if (location == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EC8F8);
          }
          uint64_t v12 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v43 = v11;
            __int16 v44 = 2082;
            v45 = "-[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:]";
            __int16 v46 = 2082;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
            __int16 v48 = 1024;
            int v49 = 352;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Got an invalid root index while searching", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EC918);
          }
          unint64_t v13 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            __int16 v30 = v13;
            __int16 v31 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = v33;
            unsigned int v43 = v11;
            __int16 v44 = 2114;
            v45 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          signed int v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:]", v33);
          uint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:352 isFatal:0 description:"Got an invalid root index while searching"];
        }
        id v16 = +[NSMutableArray array];
        BOOL v17 = [(CRLModelSearchController *)self findReplaceDelegate];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1002FF750;
        v39[3] = &unk_1014EC940;
        v39[4] = self;
        id v18 = v16;
        id v40 = v18;
        [v17 withRootSearchTargetAtIndex:location executeBlock:v39];

        long long v19 = [v9 count];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v20 = v18;
        id v21 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v36;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v36 != v23) {
                objc_enumerationMutation(v20);
              }
              id v25 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              [v25 setRootIndex:location];
              [v9 addObject:v25];
            }
            id v22 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
          }
          while (v22);
        }

        __int16 v26 = [v9 count];
        unsigned int v27 = +[NSNumber numberWithUnsignedInteger:location];
        __int16 v28 = +[NSNumber numberWithUnsignedInteger:v26 - v19];
        __int16 v29 = [(CRLModelSearchController *)self layoutSearchCountForRootIndexMap];
        [v29 setObject:v28 forKey:v27];

        ++location;
      }
      while (location != v34);
    }
    [v7 removeAllObjects];
    __int16 v32 = [v9 allObjects];
    [v7 addObjectsFromArray:v32];

    [(CRLModelSearchController *)self sortLayoutSearchResultsArray:v7];
  }
}

- (void)p_asyncBuildLayoutSearchResultsForRootSearchTargetsInRange:(_NSRange)a3 resultsArray:(id)a4 completionBlock:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = (char *)a3.location;
  id v9 = a4;
  long long v10 = (void (**)(void))a5;
  if (location == [(CRLModelSearchController *)self currentRootSearchTargetRange]
    && length == v11)
  {
    v10[2](v10);
  }
  else
  {
    -[CRLModelSearchController setCurrentRootSearchTargetRange:](self, "setCurrentRootSearchTargetRange:", location, length);
    id v12 = objc_alloc_init((Class)NSMutableSet);
    if (location < &location[length])
    {
      *(void *)&long long v13 = 67109378;
      long long v24 = v13;
      do
      {
        if (location == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EC960);
          }
          uint64_t v15 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v32 = v14;
            __int16 v33 = 2082;
            __int16 v34 = "-[CRLModelSearchController p_asyncBuildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:completionBlock:]";
            __int16 v35 = 2082;
            long long v36 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
            __int16 v37 = 1024;
            int v38 = 386;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Got an invalid root index while searching", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EC980);
          }
          id v16 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            id v22 = v16;
            uint64_t v23 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = v24;
            unsigned int v32 = v14;
            __int16 v33 = 2114;
            __int16 v34 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          BOOL v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController p_asyncBuildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:completionBlock:]", v24);
          id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:386 isFatal:0 description:"Got an invalid root index while searching"];
        }
        long long v19 = +[NSMutableArray array];
        id v20 = [(CRLModelSearchController *)self findReplaceDelegate];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1002FFBA8;
        v25[3] = &unk_1014EC9D0;
        v25[4] = self;
        id v26 = v19;
        id v27 = v12;
        __int16 v30 = location;
        id v28 = v9;
        __int16 v29 = v10;
        id v21 = v19;
        [v20 withRootSearchTargetAtIndex:location executeBlock:v25];

        ++location;
        --length;
      }
      while (length);
    }
  }
}

- (unint64_t)nextRootSearchTargetFromIndex:(unint64_t)a3 inDirection:(unint64_t)a4
{
  id v7 = [(CRLModelSearchController *)self findReplaceDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CRLModelSearchController *)self findReplaceDelegate];
    id v10 = [v9 nextRootSearchTargetIndexFromIndex:a3 forString:0 options:1 inDirection:a4];
  }
  else
  {
    id v10 = [(CRLModelSearchController *)self nextRootSearchTargetIndexFromIndex:a3 forString:0 options:1 inDirection:a4];
  }
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [(CRLModelSearchController *)self findReplaceDelegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      long long v13 = [(CRLModelSearchController *)self findReplaceDelegate];
      id v10 = [v13 nextRootSearchTargetIndexFromIndex:0x7FFFFFFFFFFFFFFFLL forString:0 options:1 inDirection:a4];
    }
    else
    {
      id v10 = [(CRLModelSearchController *)self nextRootSearchTargetIndexFromIndex:0x7FFFFFFFFFFFFFFFLL forString:0 options:1 inDirection:a4];
    }
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EC9F0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109C914();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECA10);
      }
      unsigned int v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController nextRootSearchTargetFromIndex:inDirection:]");
      id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:435 isFatal:0 description:"Could not find next root search target. Defaulting to 0."];

      return 0;
    }
  }
  return (unint64_t)v10;
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  id v9 = a4;
  if (a6 == 1)
  {
    if (a3)
    {
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v10 = [(CRLModelSearchController *)self findReplaceDelegate];
        a3 = (unint64_t)[v10 rootSearchTargetCountThroughIndex:0x7FFFFFFFFFFFFFFFLL] - 1;
      }
      else
      {
        --a3;
      }
    }
    else
    {
      a3 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if (!a6)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a3 = 0;
    }
    else
    {
      uint64_t v11 = [(CRLModelSearchController *)self findReplaceDelegate];
      char v12 = (char *)[v11 rootSearchTargetCountThroughIndex:a3] - 1;

      if ((unint64_t)v12 > a3) {
        ++a3;
      }
      else {
        a3 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }

  return a3;
}

- (unint64_t)_layoutSearchResultsIndexNearestToSearchReference:(id)a3 inDirection:(unint64_t)a4 isOrdredSame:(BOOL *)a5
{
  id v8 = a3;
  id v9 = [(CRLModelSearchController *)self currentRootSearchTargetRange];
  uint64_t v11 = v10;
  [v8 searchReferencePoint];
  double v13 = v12;
  double v15 = v14;
  id v16 = (char *)[(CRLModelSearchController *)self currentRootSearchTargetRange];
  uint64_t v18 = v17 - 1;
  if (a4) {
    uint64_t v18 = 0;
  }
  long long v19 = &v16[v18];
  BOOL v21 = v13 >= INFINITY || v15 >= INFINITY || v19 == (char *)0x7FFFFFFFFFFFFFFFLL;
  unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v21)
  {
    uint64_t v43 = v11;
    id v44 = v9;
    uint64_t v23 = +[NSMutableIndexSet indexSetWithIndex:v19];
    for (char i = 0; ; i |= v39)
    {
      id v26 = (char *)[(CRLModelSearchController *)self currentRootSearchTargetRange];
      uint64_t v27 = a4 ? 0 : v25 - 1;
      unint64_t v28 = (i & 1) != 0
          ? [(CRLModelSearchController *)self _layoutSearchResultsIndexAtOrBeforeSearchReference:v8 inDirection:a4 isOrdredSame:a5]: [(CRLModelSearchController *)self _layoutSearchResultsIndexAtOrAfterSearchReference:v8 inDirection:a4 isOrdredSame:a5];
      unint64_t v22 = v28;
      if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (!-[CRLModelSearchController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4)|| (id v29 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange"), (objc_msgSend(v23, "containsIndexesInRange:", v29, v30) & 1) != 0))
      {
        v41 = [(CRLModelSearchController *)self layoutSearchResults];
        -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v44, v43, v41);

        break;
      }
      __int16 v31 = &v26[v27];
      id v32 = [(CRLModelSearchController *)self currentRootSearchTargetRange];
      [v23 addIndexesInRange:v32, v33];
      __int16 v34 = (char *)[(CRLModelSearchController *)self currentRootSearchTargetRange];
      uint64_t v36 = v35 - 1;
      if (a4) {
        uint64_t v36 = 0;
      }
      __int16 v37 = &v34[v36];
      BOOL v38 = v37 > v31;
      BOOL v39 = v37 < v31;
      char v40 = v38;
      if (a4) {
        BOOL v39 = v40;
      }
    }
  }
  return v22;
}

- (BOOL)_nextSearchTargetWithMatchInDirection:(unint64_t)a3
{
  if ([(CRLModelSearchController *)self currentRootSearchTargetRange] == (id)0x7FFFFFFFFFFFFFFFLL
    && v5 == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECA30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C99C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECA50);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController _nextSearchTargetWithMatchInDirection:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:530 isFatal:0 description:"must have a valid search target at this point"];
  }
  uint64_t v10 = (char *)[(CRLModelSearchController *)self currentRootSearchTargetRange];
  uint64_t v12 = v11 - 1;
  if (a3) {
    uint64_t v12 = 0;
  }
  if (&v10[v12] == (char *)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  double v14 = +[NSMutableIndexSet indexSetWithIndex:](NSMutableIndexSet, "indexSetWithIndex:");
  *(void *)&long long v15 = 67109378;
  long long v41 = v15;
  while (1)
  {
    id v16 = (char *)[(CRLModelSearchController *)self currentRootSearchTargetRange];
    uint64_t v18 = v17 - 1;
    if (a3) {
      uint64_t v18 = 0;
    }
    unint64_t v19 = [(CRLModelSearchController *)self nextRootSearchTargetFromIndex:&v16[v18] inDirection:a3];
    id v20 = [(CRLModelSearchController *)self currentRootSearchTargetRange];
    if (v19 < (unint64_t)v20 || v19 - (unint64_t)v20 >= v21)
    {
      uint64_t v23 = [(CRLModelSearchController *)self layoutSearchResults];
      -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v19, 1, v23);
    }
    id v24 = [(CRLModelSearchController *)self currentRootSearchTargetRange];
    if (v19 < (unint64_t)v24 || v19 - (unint64_t)v24 >= v25)
    {
      unsigned int v27 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECA70);
      }
      unint64_t v28 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        unsigned int v43 = v27;
        __int16 v44 = 2082;
        v45 = "-[CRLModelSearchController _nextSearchTargetWithMatchInDirection:]";
        __int16 v46 = 2082;
        v47 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
        __int16 v48 = 1024;
        int v49 = 545;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d rebulding cache must update current index", buf, 0x22u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECA90);
      }
      id v29 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        BOOL v38 = v29;
        BOOL v39 = +[CRLAssertionHandler packedBacktraceString];
        *(_DWORD *)buf = v41;
        unsigned int v43 = v27;
        __int16 v44 = 2114;
        v45 = v39;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
      }
      uint64_t v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController _nextSearchTargetWithMatchInDirection:]");
      __int16 v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:545 isFatal:0 description:"rebulding cache must update current index"];
    }
    id v32 = [(CRLModelSearchController *)self layoutSearchResults];
    id v33 = [v32 count];
    BOOL v13 = v33 != 0;

    if (v33) {
      break;
    }
    id v34 = [(CRLModelSearchController *)self currentRootSearchTargetRange];
    if (objc_msgSend(v14, "containsIndexesInRange:", v34, v35)) {
      break;
    }
    id v36 = [(CRLModelSearchController *)self currentRootSearchTargetRange];
    [v14 addIndexesInRange:v36, v37];
  }

  return v13;
}

- (id)_firstResultInDirection:(unint64_t)a3
{
  uint64_t v5 = [(CRLModelSearchController *)self layoutSearchResults];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(CRLModelSearchController *)self layoutSearchResults];
    id v8 = v7;
    if (a3) {
      [v7 lastObject];
    }
    else {
    id v9 = [v7 objectAtIndex:0];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_lastResultInDirection:(unint64_t)a3
{
  uint64_t v5 = [(CRLModelSearchController *)self layoutSearchResults];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(CRLModelSearchController *)self layoutSearchResults];
    id v8 = v7;
    if (a3) {
      [v7 objectAtIndex:0];
    }
    else {
    id v9 = [v7 lastObject];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)buildSearchResultsIfNecessary
{
  if ([(CRLModelSearchController *)self currentRootSearchTargetRange] == (id)0x7FFFFFFFFFFFFFFFLL
    && v3 == 0)
  {
    id v9 = [(CRLModelSearchController *)self findReplaceDelegate];
    id v5 = [v9 visibleRootIndexRange];
    uint64_t v7 = v6;
    id v8 = [(CRLModelSearchController *)self layoutSearchResults];
    -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v5, v7, v8);
  }
}

- (void)asyncBuildSearchResultsIfNecessaryWithCompletionBlock:(id)a3
{
  uint64_t v11 = (void (**)(void))a3;
  if ([(CRLModelSearchController *)self currentRootSearchTargetRange] == (id)0x7FFFFFFFFFFFFFFFLL
    && v4 == 0)
  {
    uint64_t v6 = [(CRLModelSearchController *)self findReplaceDelegate];
    id v7 = [v6 visibleRootIndexRange];
    uint64_t v9 = v8;
    uint64_t v10 = [(CRLModelSearchController *)self layoutSearchResults];
    -[CRLModelSearchController p_asyncBuildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:completionBlock:](self, "p_asyncBuildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:completionBlock:", v7, v9, v10, v11);
  }
  else
  {
    v11[2]();
  }
}

- (void)buildVisibleSearchResultsIfNecessary
{
  id v3 = [(CRLModelSearchController *)self currentRootSearchTargetRange];
  uint64_t v5 = v4;
  uint64_t v6 = [(CRLModelSearchController *)self findReplaceDelegate];
  id v7 = [v6 visibleRootIndexRange];
  uint64_t v9 = v8;

  if (v3 != v7 || v5 != v9)
  {
    id v14 = [(CRLModelSearchController *)self findReplaceDelegate];
    id v10 = [v14 visibleRootIndexRange];
    uint64_t v12 = v11;
    BOOL v13 = [(CRLModelSearchController *)self layoutSearchResults];
    -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v10, v12, v13);
  }
}

- (id)firstVisibleResultInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100300E64;
  unint64_t v19 = sub_100300E74;
  id v20 = 0;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v9 = [(CRLModelSearchController *)self findReplaceDelegate];
  id v10 = [v9 visibleRootIndexRange];
  -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v10, v11, v8);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100300E7C;
  v14[3] = &unk_1014ECAB8;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  *(CGFloat *)&v14[7] = width;
  *(CGFloat *)&v14[8] = height;
  v14[4] = &v15;
  [v8 enumerateObjectsUsingBlock:v14];
  id v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v12;
}

- (unint64_t)indexOfVisibleSearchReference:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CRLModelSearchController *)self layoutSearchResults];
    id v6 = [v5 indexOfObject:v4];

    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = (char *)-[CRLModelSearchController _resultCountInRootObjectRange:](self, "_resultCountInRootObjectRange:", 0, [(CRLModelSearchController *)self currentRootSearchTargetRange])+ (void)v6+ 1;
      goto LABEL_14;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECAD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109CA24();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECAF8);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController indexOfVisibleSearchReference:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:623 isFatal:0 description:"Could not find searchReference in current root search target range"];
  }
  id v10 = 0;
LABEL_14:

  return (unint64_t)v10;
}

- (unint64_t)_resultCountInRootObjectRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(CRLModelSearchController *)self currentRootSearchTargetRange];
  uint64_t v24 = v7;
  id v25 = v6;
  id v26 = objc_alloc_init((Class)NSMutableArray);
  if (location >= location + length)
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = 0;
    uint64_t v9 = &off_1014C1000;
    do
    {
      id v10 = [(__objc2_class *)v9[90] numberWithUnsignedInteger:location];
      uint64_t v11 = [(CRLModelSearchController *)self layoutSearchCountForRootIndexMap];
      id v12 = [v11 objectForKey:v10];

      if (!v12) {
        -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", location, 1, v26);
      }
      BOOL v13 = [(CRLModelSearchController *)self layoutSearchCountForRootIndexMap];
      id v14 = [v13 objectForKey:v10];

      if (v14)
      {
        v8 += (int)[v14 intValue];
      }
      else
      {
        unsigned int v15 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ECB18);
        }
        id v16 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110146;
          unsigned int v28 = v15;
          __int16 v29 = 2082;
          uint64_t v30 = "-[CRLModelSearchController _resultCountInRootObjectRange:]";
          __int16 v31 = 2082;
          id v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
          __int16 v33 = 1024;
          int v34 = 649;
          __int16 v35 = 2082;
          id v36 = "rootCount";
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ECB38);
        }
        uint64_t v17 = v9;
        uint64_t v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          unint64_t v21 = v18;
          unint64_t v22 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          unsigned int v28 = v15;
          __int16 v29 = 2114;
          uint64_t v30 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        unint64_t v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController _resultCountInRootObjectRange:]");
        id v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 649, 0, "invalid nil value for '%{public}s'", "rootCount");

        uint64_t v9 = v17;
      }

      ++location;
      --length;
    }
    while (length);
  }
  -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v25, v24, v26);

  return v8;
}

- (unint64_t)layoutSearchResultsIndexOfSearchReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLModelSearchController *)self layoutSearchResults];
  id v6 = [v5 indexOfObject:v4];

  return (unint64_t)v6;
}

- (id)p_searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v38 = 0;
  BOOL v39 = &v38;
  uint64_t v40 = 0x3032000000;
  long long v41 = sub_100300E64;
  v42 = sub_100300E74;
  id v43 = 0;
  if (!v6)
  {
    BOOL v13 = [(CRLModelSearchController *)self layoutSearchResults];
    id v14 = [v13 count];

    if (!v14) {
      [(CRLModelSearchController *)self _nextSearchTargetWithMatchInDirection:a4];
    }
    uint64_t v12 = [(CRLModelSearchController *)self _firstResultInDirection:a4];
    goto LABEL_17;
  }
  char v37 = 0;
  unint64_t v7 = [(CRLModelSearchController *)self layoutSearchResultsIndexOfSearchReference:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  unint64_t v7 = [(CRLModelSearchController *)self _layoutSearchResultsIndexNearestToSearchReference:v6 inDirection:a4 isOrdredSame:&v37];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v37)
    {
      id v25 = [(CRLModelSearchController *)self layoutSearchResults];
      uint64_t v26 = [v25 objectAtIndex:v7];
      unsigned int v27 = (void *)v39[5];
      void v39[5] = v26;

      goto LABEL_28;
    }
LABEL_12:
    if (a4)
    {
      unsigned int v15 = 0;
    }
    else
    {
      id v16 = [(CRLModelSearchController *)self layoutSearchResults];
      unsigned int v15 = (char *)[v16 count] - 1;
    }
    if ((char *)v7 != v15)
    {
      uint64_t v18 = [(CRLModelSearchController *)self layoutSearchResults];
      unint64_t v19 = v18;
      if (a4) {
        unint64_t v20 = v7 - 1;
      }
      else {
        unint64_t v20 = v7 + 1;
      }
      uint64_t v21 = [v18 objectAtIndex:v20];
      unint64_t v22 = (void *)v39[5];
      void v39[5] = v21;

      goto LABEL_28;
    }
    goto LABEL_16;
  }
  unint64_t v8 = [(CRLModelSearchController *)self layoutSearchResults];
  id v9 = [v8 count];

  if (!v9) {
    [(CRLModelSearchController *)self _nextSearchTargetWithMatchInDirection:a4];
  }
  id v10 = objc_opt_class();
  uint64_t v11 = [(CRLModelSearchController *)self _firstResultInDirection:a4];
  LODWORD(v10) = [v10 searchReference:v6 isBeforeSearchReference:v11 inDirection:a4];

  if (v10)
  {
    uint64_t v12 = [(CRLModelSearchController *)self _firstResultInDirection:a4];
LABEL_17:
    uint64_t v17 = (void *)v39[5];
    void v39[5] = v12;

    goto LABEL_28;
  }
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = [(CRLModelSearchController *)self _lastResultInDirection:a4];
  LODWORD(v23) = [v23 searchReference:v6 isAfterSearchReference:v24 inDirection:a4];

  if (v23)
  {
LABEL_16:
    [(CRLModelSearchController *)self _nextSearchTargetWithMatchInDirection:a4];
    uint64_t v12 = [(CRLModelSearchController *)self _firstResultInDirection:a4];
    goto LABEL_17;
  }
  unsigned int v28 = [(CRLModelSearchController *)self layoutSearchResults];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100301978;
  v33[3] = &unk_1014ECB60;
  v33[4] = self;
  id v34 = v6;
  __int16 v35 = &v38;
  unint64_t v36 = a4;
  [v28 enumerateObjectsWithOptions:2 * (a4 != 0) usingBlock:v33];

  if (!v39[5])
  {
    [(CRLModelSearchController *)self _nextSearchTargetWithMatchInDirection:a4];
    uint64_t v29 = [(CRLModelSearchController *)self _firstResultInDirection:a4];
    uint64_t v30 = (void *)v39[5];
    void v39[5] = v29;
  }
LABEL_28:
  id v31 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v31;
}

- (void)asyncSearchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4 completionBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100301AC8;
  v9[3] = &unk_1014ECB88;
  id v10 = self;
  id v11 = a3;
  id v12 = a5;
  unint64_t v13 = a4;
  id v7 = v12;
  id v8 = v11;
  [(CRLModelSearchController *)v10 asyncBuildSearchResultsIfNecessaryWithCompletionBlock:v9];
}

- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4
{
  id v6 = a3;
  [(CRLModelSearchController *)self buildSearchResultsIfNecessary];
  id v7 = [(CRLModelSearchController *)self p_searchReferenceAfterReference:v6 inDirection:a4];

  return v7;
}

+ (BOOL)p_searchReference:(id)a3 comparedWithSearchReference:(id)a4 inDirection:(unint64_t)a5 before:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = [a1 compareSearchReference:a3 toSearchReference:a4];
  uint64_t v9 = -1;
  if (!v6) {
    uint64_t v9 = 1;
  }
  uint64_t v10 = 1;
  if (!v6) {
    uint64_t v10 = -1;
  }
  if (a5) {
    uint64_t v9 = v10;
  }
  return v8 == (id)v9;
}

+ (BOOL)searchReference:(id)a3 isBeforeSearchReference:(id)a4 inDirection:(unint64_t)a5
{
  return _objc_msgSend(a1, "p_searchReference:comparedWithSearchReference:inDirection:before:", a3, a4, a5, 1);
}

+ (BOOL)searchReference:(id)a3 isAfterSearchReference:(id)a4 inDirection:(unint64_t)a5
{
  return [a1 p_searchReference:a3 comparedWithSearchReference:a4 inDirection:a5 before:0];
}

+ (int64_t)compareSearchReference:(id)a3 toSearchReference:(id)a4
{
  return sub_1002FC99C(a3, a4);
}

- (CRLFindReplaceDelegate)findReplaceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findReplaceDelegate);

  return (CRLFindReplaceDelegate *)WeakRetained;
}

- (BOOL)modelSearchesRunSynchronously
{
  return self->_modelSearchesRunSynchronously;
}

- (void)setModelSearchesRunSynchronously:(BOOL)a3
{
  self->_modelSearchesRunSynchronouslCGFloat y = a3;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingCoordinator);

  return (_TtC8Freeform21CRLEditingCoordinator *)WeakRetained;
}

- (CRLSearchReference)startingPointSearchReference
{
  return self->_startingPointSearchReference;
}

- (void)setStartingPointSearchReference:(id)a3
{
}

- (CRLSearchReference)primaryFindResultSearchReference
{
  return self->_primaryFindResultSearchReference;
}

- (void)setPrimaryFindResultSearchReference:(id)a3
{
}

- (NSEnumerator)currentModelEnumerator
{
  return self->_currentModelEnumerator;
}

- (void)setCurrentModelEnumerator:(id)a3
{
}

- (CRLSearchable)currentSearchable
{
  return self->_currentSearchable;
}

- (void)setCurrentSearchable:(id)a3
{
  self->_currentSearchable = (CRLSearchable *)a3;
}

- (CRLSearch)currentSearch
{
  return self->_currentSearch;
}

- (void)setCurrentSearch:(id)a3
{
}

- (double)currentSearchStartTime
{
  return self->_currentSearchStartTime;
}

- (void)setCurrentSearchStartTime:(double)a3
{
  self->_currentSearchStartTime = a3;
}

- (unint64_t)currentSearchResultsCount
{
  return self->_currentSearchResultsCount;
}

- (void)setCurrentSearchResultsCount:(unint64_t)a3
{
  self->_currentSearchResultsCount = a3;
}

- (_NSRange)currentRootSearchTargetRange
{
  NSUInteger length = self->_currentRootSearchTargetRange.length;
  NSUInteger location = self->_currentRootSearchTargetRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCurrentRootSearchTargetRange:(_NSRange)a3
{
  self->_currentRootSearchTargetRange = a3;
}

- (NSMutableArray)layoutSearchResults
{
  return self->_layoutSearchResults;
}

- (void)setLayoutSearchResults:(id)a3
{
}

- (NSMutableDictionary)layoutSearchCountForRootIndexMap
{
  return self->_layoutSearchCountForRootIndexMap;
}

- (void)setLayoutSearchCountForRootIndexMap:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_layoutSearchCountForRootIndexMap, 0);
  objc_storeStrong((id *)&self->_layoutSearchResults, 0);
  objc_storeStrong((id *)&self->_currentSearch, 0);
  objc_storeStrong((id *)&self->_currentModelEnumerator, 0);
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, 0);
  objc_storeStrong((id *)&self->_startingPointSearchReference, 0);
  objc_destroyWeak((id *)&self->_editingCoordinator);

  objc_destroyWeak((id *)&self->_findReplaceDelegate);
}

@end