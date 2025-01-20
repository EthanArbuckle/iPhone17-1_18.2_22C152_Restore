@interface CRLFindReplaceController
+ (id)escapeFindQuery:(id)a3;
+ (id)unescapeFindQuery:(id)a3;
+ (void)_recursiveSearchWithSearchTarget:(id)a3 forString:(id)a4 options:(unint64_t)a5 dispatchGroup:(id)a6 hitBlock:(id)a7 completionBlock:(id)a8;
- (BOOL)isReplacingAll;
- (BOOL)isReplacingText;
- (BOOL)respondsToSearch;
- (BOOL)returnFirstVisibleResultIfPossible;
- (BOOL)searchCriteriaIsValid;
- (BOOL)searchHighlightsEnabled;
- (BOOL)shouldSetSelectionPathToFindResult;
- (CRLFindReplaceController)initWithEditingCoordinator:(id)a3 delegate:(id)a4;
- (CRLFindReplaceController)initWithEditingCoordinator:(id)a3 delegate:(id)a4 modelSearchesRunSynchronously:(BOOL)a5;
- (NSMapTable)visibleResults;
- (NSString)searchString;
- (_NSRange)highlightsRange;
- (id)getNextSearchFromCurrentSearchable;
- (id)replaceSearchReference:(id)a3 withString:(id)a4 shouldSetSelectionForCommitPath:(BOOL)a5;
- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4;
- (int64_t)lastFindPasteboardChangeCount;
- (unint64_t)nextRootSearchTargetFromIndex:(unint64_t)a3 inDirection:(unint64_t)a4;
- (unint64_t)replaceAllOccurrencesOfString:(id)a3 withString:(id)a4;
- (unint64_t)searchOptions;
- (void)asyncPerformSearchWithSearchTarget:(id)a3 resultsArray:(id)a4 completionBlock:(id)a5;
- (void)asyncSearchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4 completionBlock:(id)a5;
- (void)clearCurrentSelectionPath;
- (void)continueSearch;
- (void)endSearchSession;
- (void)findNextResultInDirection:(unint64_t)a3;
- (void)findNextResultInDirection:(unint64_t)a3 shouldPulse:(BOOL)a4;
- (void)invalidateSearchHighlights;
- (void)invalidateSearchResults;
- (void)locateSearchReference:(id)a3;
- (void)locateSearchReference:(id)a3 nearestPoint:(CGPoint)a4;
- (void)p_handleVisibleResults:(id)a3;
- (void)performSearchWithSearchTarget:(id)a3 resultsArray:(id)a4;
- (void)pulseSearchResult:(id)a3 autohiding:(BOOL)a4;
- (void)replaceWithString:(id)a3 findAgain:(BOOL)a4;
- (void)searchReferencesToHighlightInVisibleRootObjectRange:(_NSRange)a3 completionBlock:(id)a4;
- (void)setHighlightsRange:(_NSRange)a3;
- (void)setIsReplacingAll:(BOOL)a3;
- (void)setIsReplacingText:(BOOL)a3;
- (void)setLastFindPasteboardChangeCount:(int64_t)a3;
- (void)setReturnFirstVisibleResultIfPossible:(BOOL)a3;
- (void)setSearchHighlightsEnabled:(BOOL)a3;
- (void)setSearchOptions:(unint64_t)a3;
- (void)setSearchString:(id)a3;
- (void)setSelectionPathToSearchReference:(id)a3 flags:(unint64_t)a4;
- (void)setShouldSetSelectionPathToFindResult:(BOOL)a3;
- (void)setVisibleResults:(id)a3;
- (void)updateHighlights;
- (void)willScrollToReference:(id)a3;
@end

@implementation CRLFindReplaceController

- (CRLFindReplaceController)initWithEditingCoordinator:(id)a3 delegate:(id)a4
{
  return [(CRLFindReplaceController *)self initWithEditingCoordinator:a3 delegate:a4 modelSearchesRunSynchronously:0];
}

- (CRLFindReplaceController)initWithEditingCoordinator:(id)a3 delegate:(id)a4 modelSearchesRunSynchronously:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLFindReplaceController;
  v9 = [(CRLModelSearchController *)&v16 initWithEditingCoordinator:v8 delegate:a4 modelSearchesRunSynchronously:v5];
  if (v9)
  {
    uint64_t v10 = +[NSMapTable mapTableWithKeyOptions:517 valueOptions:0];
    visibleResults = v9->_visibleResults;
    v9->_visibleResults = (NSMapTable *)v10;

    v9->_searchOptions = 16;
    v12 = +[NSUserDefaults standardUserDefaults];
    if (([v12 BOOLForKey:@"FindReplaceMatchCaseKey"] & 1) == 0) {
      v9->_searchOptions |= 1uLL;
    }
    if ([v12 BOOLForKey:@"FindReplaceWholeWordsKey"]) {
      v9->_searchOptions |= 8uLL;
    }
    v13 = [v8 changeNotifier];
    [v13 addObserver:v9 forChangeSourceOfClass:objc_opt_class()];

    v14 = [v8 changeNotifier];
    [v14 addObserver:v9 forChangeSourceOfClass:objc_opt_class()];
  }
  return v9;
}

- (void)setSearchString:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_searchString] & 1) == 0)
  {
    [(CRLFindReplaceController *)self willChangeValueForKey:@"searchString"];
    objc_storeStrong((id *)&self->_searchString, a3);
    [(CRLFindReplaceController *)self didChangeValueForKey:@"searchString"];
    if (![v7 length])
    {
      [(CRLFindReplaceController *)self clearCurrentSelectionPath];
      [(CRLFindReplaceController *)self pulseSearchResult:0 autohiding:0];
    }
    [(CRLFindReplaceController *)self invalidateSearchResults];
    BOOL v5 = +[NSUUID UUID];
    searchSessionUUID = self->_searchSessionUUID;
    self->_searchSessionUUID = v5;
  }
}

- (void)setSearchOptions:(unint64_t)a3
{
  if (self->_searchOptions != a3)
  {
    self->_searchOptions = a3;
    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 setBool:(a3 & 1) == 0 forKey:@"FindReplaceMatchCaseKey"];
    [v5 setBool:(a3 >> 3) & 1 forKey:@"FindReplaceWholeWordsKey"];
    [(CRLFindReplaceController *)self invalidateSearchResults];
  }
}

- (id)replaceSearchReference:(id)a3 withString:(id)a4 shouldSetSelectionForCommitPath:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 commandForReplacingWithString:v9 options:[self searchOptions]];
  if (v10)
  {
    v11 = [v8 searchReferenceForReplacingWithString:v9 options:[self searchOptions]];
    id v12 = [v11 rootIndex];
    if (v12 != [v8 rootIndex])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F15C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A3F74();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F15E8);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceSearchReference:withString:shouldSetSelectionForCommitPath:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:136 isFatal:0 description:"Expect root indexes to be migrated to the new searchReference."];
    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v8 commandSelectionBehaviorForCommand:v10],
          (objc_super v16 = (CRLCommandSelectionBehavior *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v17 = [CRLCommandSelectionBehavior alloc];
      v18 = [v8 selectionPath];
      v19 = [v8 selectionPath];
      objc_super v16 = [(CRLCommandSelectionBehavior *)v17 initWithForwardSelectionPath:v18 reverseSelectionPath:v19 selectionFlags:132];
    }
    if (!a5) {
      [(CRLCommandSelectionBehavior *)v16 setCommitSelectionPath:0];
    }
    v20 = [(CRLModelSearchController *)self editingCoordinator];
    v21 = [v20 commandController];

    [v21 openGroup];
    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"Replace" value:0 table:@"UndoStrings"];
    [v21 setCurrentGroupActionString:v23];

    [v21 enqueueCommand:v10];
    [v21 closeGroupWithSelectionBehavior:v16];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)replaceAllOccurrencesOfString:(id)a3 withString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CRLFindReplaceController *)self setIsReplacingAll:1];
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_24:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1648);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A3FFC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1668);
    }
    v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v27);
    }
    v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceAllOccurrencesOfString:withString:]");
    v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 168, 0, "invalid nil value for '%{public}s'", "replaceString");

    [v6 length];
    goto LABEL_33;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F1608);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A4124();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F1628);
  }
  v24 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v24);
  }
  v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceAllOccurrencesOfString:withString:]");
  v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 167, 0, "invalid nil value for '%{public}s'", "findString");

  if (!v7) {
    goto LABEL_24;
  }
LABEL_3:
  if (![v6 length])
  {
LABEL_33:
    unint64_t v23 = 0;
    goto LABEL_34;
  }
  id v8 = [(CRLModelSearchController *)self findReplaceDelegate];
  id v9 = [v8 interactiveCanvasControllerForFindController:self];

  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1688);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A4090();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F16A8);
    }
    uint64_t v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceAllOccurrencesOfString:withString:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 171, 0, "invalid nil value for '%{public}s'", "interactiveCanvasController");
  }
  [v9 endEditing];
  v13 = [(CRLModelSearchController *)self editingCoordinator];
  v14 = [v13 followCoordinator];
  [v14 endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:1];

  v15 = [v9 canvasEditor];
  objc_super v16 = [v15 selectionPathWithInfos:0];

  v17 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v16 reverseSelectionPath:v16 selectionFlags:4096];
  v18 = [CRLFindReplaceAllHelper alloc];
  v19 = [(CRLModelSearchController *)self editingCoordinator];
  v20 = [(CRLFindReplaceAllHelper *)v18 initWithEditingCoordinator:v19 findString:v6 replaceString:v7 options:[(CRLFindReplaceController *)self searchOptions]];

  v21 = [(CRLModelSearchController *)self findReplaceDelegate];
  v22 = [v21 modelEnumeratorForSearchWithFlags:1];
  [(CRLFindReplaceAllHelper *)v20 replaceAllWithSelectionBehavior:v17 modelEnumerator:v22];

  unint64_t v23 = [(CRLFindReplaceAllHelper *)v20 countOfItemsReplaced];
LABEL_34:
  [(CRLFindReplaceController *)self invalidateSearchResults];
  [(CRLFindReplaceController *)self setIsReplacingAll:0];

  return v23;
}

- (BOOL)searchCriteriaIsValid
{
  v2 = [(CRLFindReplaceController *)self searchString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)respondsToSearch
{
  BOOL v3 = [(CRLModelSearchController *)self currentSearchable];
  char v4 = objc_opt_respondsToSelector();

  id v5 = [(CRLModelSearchController *)self currentSearchable];
  char v6 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0 && (v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F16C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A41B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F16E8);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController respondsToSearch]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:203 isFatal:0 description:"Every searchable should respond to atleast a string search or an annotation search"];
  }
  return v4 & 1;
}

- (id)getNextSearchFromCurrentSearchable
{
  BOOL v3 = [(CRLModelSearchController *)self currentSearchable];
  char v4 = [(CRLFindReplaceController *)self searchString];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10036B2D8;
  v7[3] = &unk_1014F1710;
  v7[4] = self;
  id v5 = [v3 searchForString:v4 options:[self searchOptions] searchCanvasDelegate:0 onHit:v7];

  return v5;
}

- (void)continueSearch
{
  id v4 = [(CRLModelSearchController *)self currentSearchable];
  BOOL v3 = [(CRLModelSearchController *)self currentSearch];
  [v4 continueSearch:v3];
}

+ (void)_recursiveSearchWithSearchTarget:(id)a3 forString:(id)a4 options:(unint64_t)a5 dispatchGroup:(id)a6 hitBlock:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  objc_super v16 = a6;
  id v17 = a7;
  id v18 = a8;
  [a1 assertSearchTargetImplementsProperMethods:v14];
  if (objc_opt_respondsToSelector())
  {
    if (v16) {
      dispatch_group_enter(v16);
    }
    [v14 layoutSearchForString:v15 options:a5 hitBlock:v17 completionBlock:v18];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = v14;
    v19 = [v14 childSearchTargets];
    id v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        unint64_t v23 = 0;
        do
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          [a1 _recursiveSearchWithSearchTarget:*(void *)(*((void *)&v25 + 1) + 8 * (void)v23) forString:v15 options:a5 dispatchGroup:v16 hitBlock:v17 completionBlock:v18];
          unint64_t v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v21);
    }

    id v14 = v24;
  }
}

- (void)searchReferencesToHighlightInVisibleRootObjectRange:(_NSRange)a3 completionBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = +[NSMapTable mapTableWithKeyOptions:517 valueOptions:0];
  id v9 = [(CRLFindReplaceController *)self searchString];
  id v10 = [v9 length];

  if (v10)
  {
    dispatch_group_t v11 = dispatch_group_create();
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = sub_10036B7C8;
    v21[4] = sub_10036B7D8;
    uint64_t v22 = self->_searchSessionUUID;
    if (location < location + length)
    {
      do
      {
        id v12 = [(CRLModelSearchController *)self findReplaceDelegate];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10036B7E0;
        v17[3] = &unk_1014F1760;
        v17[4] = self;
        id v18 = v11;
        id v20 = v21;
        id v19 = v8;
        [v12 withRootSearchTargetAtIndex:location executeBlock:v17];

        ++location;
        --length;
      }
      while (length);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10036BA2C;
    block[3] = &unk_1014D8170;
    id v15 = v7;
    id v14 = v8;
    objc_super v16 = v21;
    dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v21, 8);
  }
  else
  {
    (*((void (**)(id, void *, NSUUID *))v7 + 2))(v7, v8, self->_searchSessionUUID);
  }
}

- (void)performSearchWithSearchTarget:(id)a3 resultsArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_10036B7C8;
  v15[4] = sub_10036B7D8;
  objc_super v16 = self->_searchSessionUUID;
  id v8 = objc_opt_class();
  id v9 = [(CRLFindReplaceController *)self searchString];
  unint64_t v10 = [(CRLFindReplaceController *)self searchOptions];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10036BBCC;
  v12[3] = &unk_1014F1738;
  id v14 = v15;
  v12[4] = self;
  id v11 = v7;
  id v13 = v11;
  [v8 _recursiveSearchWithSearchTarget:v6 forString:v9 options:v10 dispatchGroup:0 hitBlock:v12 completionBlock:0];

  _Block_object_dispose(v15, 8);
}

- (void)asyncPerformSearchWithSearchTarget:(id)a3 resultsArray:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_10036B7C8;
  v29[4] = sub_10036B7D8;
  v30 = self->_searchSessionUUID;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_10036B7C8;
  v27[4] = sub_10036B7D8;
  id v28 = +[NSMapTable mapTableWithKeyOptions:517 valueOptions:0];
  dispatch_group_t v11 = dispatch_group_create();
  id v12 = objc_opt_class();
  id v13 = [(CRLFindReplaceController *)self searchString];
  unint64_t v14 = [(CRLFindReplaceController *)self searchOptions];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10036C0EC;
  v23[3] = &unk_1014F1808;
  v23[4] = self;
  long long v25 = v29;
  long long v26 = v27;
  id v15 = v9;
  id v24 = v15;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10036C410;
  v21[3] = &unk_1014CBBB0;
  objc_super v16 = v11;
  uint64_t v22 = v16;
  [v12 _recursiveSearchWithSearchTarget:v8 forString:v13 options:v14 dispatchGroup:v16 hitBlock:v23 completionBlock:v21];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10036C418;
  v18[3] = &unk_1014F1830;
  id v19 = v10;
  id v20 = v27;
  v18[4] = self;
  id v17 = v10;
  dispatch_group_notify(v16, (dispatch_queue_t)&_dispatch_main_q, v18);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
}

- (unint64_t)nextRootSearchTargetFromIndex:(unint64_t)a3 inDirection:(unint64_t)a4
{
  id v7 = [(CRLModelSearchController *)self findReplaceDelegate];
  id v8 = [(CRLFindReplaceController *)self searchString];
  id v9 = [v7 nextRootSearchTargetIndexFromIndex:a3 forString:v8 options:[self searchOptions] inDirection:a4];

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [(CRLModelSearchController *)self findReplaceDelegate];
    dispatch_group_t v11 = [(CRLFindReplaceController *)self searchString];
    id v9 = [v10 nextRootSearchTargetIndexFromIndex:0x7FFFFFFFFFFFFFFFLL forString:v11 options:[self searchOptions] inDirection:a4];

    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F1850);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A4350();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F1870);
      }
      id v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController nextRootSearchTargetFromIndex:inDirection:]");
      unint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:348 isFatal:0 description:"Could not find next root search target. Defaulting to 0."];

      return 0;
    }
  }
  return (unint64_t)v9;
}

- (void)pulseSearchResult:(id)a3 autohiding:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  [v16 setPulseHighlight:1];
  [v16 setAutohideHighlight:v4];
  id v6 = [(CRLModelSearchController *)self findReplaceDelegate];
  id v7 = (objc_class *)objc_opt_class();
  id v13 = sub_100246E2C(v16, v7, 1, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLSearchReference);
  [v6 setPrimarySearchReference:v13 forFindReplaceController:self];

  unsigned int v14 = [(CRLFindReplaceController *)self shouldSetSelectionPathToFindResult];
  id v15 = v16;
  if (v16 && v14)
  {
    [(CRLFindReplaceController *)self setSelectionPathToSearchReference:v16 flags:128];
    id v15 = v16;
  }
}

- (void)invalidateSearchResults
{
  [(CRLFindReplaceController *)self resetCollaborativeTimer];
  BOOL v3 = [(CRLModelSearchController *)self findReplaceDelegate];
  BOOL v4 = [v3 interactiveCanvasControllerForFindController:self];
  [v4 layoutInvalidated];

  v5.receiver = self;
  v5.super_class = (Class)CRLFindReplaceController;
  [(CRLModelSearchController *)&v5 invalidateSearchResults];
  [(CRLFindReplaceController *)self invalidateSearchHighlights];
  [(CRLFindReplaceController *)self pulseSearchResult:0 autohiding:0];
}

- (void)invalidateSearchHighlights
{
  -[CRLFindReplaceController setHighlightsRange:](self, "setHighlightsRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  id v7 = +[NSMapTable mapTableWithKeyOptions:517 valueOptions:0];
  -[CRLFindReplaceController setVisibleResults:](self, "setVisibleResults:");
  BOOL v3 = [(CRLModelSearchController *)self findReplaceDelegate];
  [v3 setSearchReferencesToHighlight:0 forFindReplaceController:self];

  if ([(CRLFindReplaceController *)self isReplacingText]
    || [(CRLFindReplaceController *)self isReplacingAll])
  {
    [(CRLFindReplaceController *)self p_handleVisibleResults:v7];
  }
  BOOL v4 = [(CRLModelSearchController *)self findReplaceDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRLModelSearchController *)self findReplaceDelegate];
    [v6 didHideSearchHighlights];
  }
}

- (void)setSearchHighlightsEnabled:(BOOL)a3
{
  if (self->_searchHighlightsEnabled != a3) {
    self->_searchHighlightsEnabled = a3;
  }
}

- (void)updateHighlights
{
  if ([(CRLFindReplaceController *)self searchHighlightsEnabled])
  {
    BOOL v3 = [(CRLModelSearchController *)self findReplaceDelegate];
    id v4 = [v3 visibleRootIndexRange];
    uint64_t v6 = v5;

    if (v4 != [(CRLFindReplaceController *)self highlightsRange] || v6 != v7)
    {
      -[CRLFindReplaceController setHighlightsRange:](self, "setHighlightsRange:", v4, v6);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10036CAAC;
      v8[3] = &unk_1014F1898;
      v8[4] = self;
      -[CRLFindReplaceController searchReferencesToHighlightInVisibleRootObjectRange:completionBlock:](self, "searchReferencesToHighlightInVisibleRootObjectRange:completionBlock:", v4, v6, v8);
    }
  }
}

- (void)p_handleVisibleResults:(id)a3
{
  id v11 = a3;
  [(CRLFindReplaceController *)self setVisibleResults:v11];
  id v4 = [(CRLModelSearchController *)self findReplaceDelegate];
  uint64_t v5 = [v4 interactiveCanvasControllerForFindController:self];

  id v6 = [v11 count];
  if (v6)
  {
    uint64_t v7 = [(CRLModelSearchController *)self findReplaceDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(CRLModelSearchController *)self findReplaceDelegate];
      [v9 willShowSearchHighlights];
    }
  }
  else
  {
    [(CRLFindReplaceController *)self clearCurrentSelectionPath];
  }
  [v5 setShowGrayOverlay:v6 != 0];
  uint64_t v10 = [(CRLModelSearchController *)self findReplaceDelegate];
  [v10 setSearchReferencesToHighlight:v11 forFindReplaceController:self];
}

- (void)findNextResultInDirection:(unint64_t)a3
{
}

- (void)findNextResultInDirection:(unint64_t)a3 shouldPulse:(BOOL)a4
{
  [(CRLFindReplaceController *)self resetCollaborativeTimer];
  uint64_t v7 = [(CRLModelSearchController *)self primaryFindResultSearchReference];

  if (!v7)
  {
    char v8 = [(CRLModelSearchController *)self startingPointSearchReference];

    if (v8)
    {
      uint64_t v9 = [(CRLModelSearchController *)self startingPointSearchReference];
      uint64_t v10 = [v9 searchReferenceStart];
      [(CRLModelSearchController *)self setStartingPointSearchReference:v10];

      id v11 = [(CRLModelSearchController *)self startingPointSearchReference];
      [v9 searchReferencePoint];
      -[CRLFindReplaceController locateSearchReference:nearestPoint:](self, "locateSearchReference:nearestPoint:", v11);
    }
    else
    {
      uint64_t v12 = [(CRLModelSearchController *)self findReplaceDelegate];
      uint64_t v9 = [v12 interactiveCanvasControllerForFindController:self];

      id v13 = [v9 editorController];
      id v11 = [v13 textInputEditor];

      if (objc_opt_respondsToSelector())
      {
        unsigned int v14 = [v11 editingSearchReference];
        [(CRLModelSearchController *)self setStartingPointSearchReference:v14];
      }
    }

    id v15 = [(CRLModelSearchController *)self startingPointSearchReference];

    if (v15)
    {
      id v16 = [(CRLModelSearchController *)self findReplaceDelegate];
      id v17 = [v16 interactiveCanvasControllerForFindController:self];

      id v18 = [(CRLModelSearchController *)self startingPointSearchReference];
      [v17 scrollSearchReferenceToVisible:v18 scrollOptions:128];
    }
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_10036B7C8;
  v37 = sub_10036B7D8;
  id v38 = 0;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v20 = 0;
  if ([(CRLFindReplaceController *)self searchHighlightsEnabled])
  {
    id v21 = [(CRLModelSearchController *)self findReplaceDelegate];
    id v22 = [v21 visibleRootIndexRange];
    uint64_t v24 = v23;

    if (v22 == (id)0x7FFFFFFFFFFFFFFFLL && v24 == 0)
    {
      [(CRLModelSearchController *)self setStartingPointSearchReference:0];
      [(CRLFindReplaceController *)self invalidateSearchResults];
      goto LABEL_21;
    }
    uint64_t v19 = (uint64_t)v22;
    uint64_t v20 = v24;
  }
  long long v26 = [(CRLModelSearchController *)self primaryFindResultSearchReference];
  if (!v26)
  {
    if (![(CRLFindReplaceController *)self returnFirstVisibleResultIfPossible]) {
      goto LABEL_18;
    }
    long long v27 = [(CRLModelSearchController *)self findReplaceDelegate];
    long long v26 = [v27 interactiveCanvasControllerForFindController:self];

    [v26 visibleUnscaledRect];
    uint64_t v28 = -[CRLModelSearchController firstVisibleResultInRect:](self, "firstVisibleResultInRect:");
    v29 = (void *)v34[5];
    v34[5] = v28;

    [(CRLFindReplaceController *)self setReturnFirstVisibleResultIfPossible:0];
  }

LABEL_18:
  if (!v34[5])
  {
    v30 = [(CRLModelSearchController *)self startingPointSearchReference];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10036CFBC;
    v31[3] = &unk_1014F18C0;
    BOOL v32 = a4;
    v31[4] = self;
    v31[5] = &v33;
    v31[6] = v19;
    v31[7] = v20;
    [(CRLFindReplaceController *)self asyncSearchReferenceAfterReference:v30 inDirection:a3 completionBlock:v31];
  }
LABEL_21:
  _Block_object_dispose(&v33, 8);
}

- (void)willScrollToReference:(id)a3
{
  id v5 = a3;
  id v4 = [(CRLModelSearchController *)self findReplaceDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 willScrollToReference:v5];
  }
}

- (void)replaceWithString:(id)a3 findAgain:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CRLFindReplaceController *)self resetCollaborativeTimer];
  if (v6)
  {
    [(CRLFindReplaceController *)self setIsReplacingText:1];
    uint64_t v7 = [(CRLModelSearchController *)self primaryFindResultSearchReference];
    char v8 = [(CRLModelSearchController *)self findReplaceDelegate];
    uint64_t v9 = [v8 interactiveCanvasControllerForFindController:self];

    if (!v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F1920);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A446C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F1940);
      }
      uint64_t v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v10);
      }
      id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceWithString:findAgain:]");
      uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 554, 0, "invalid nil value for '%{public}s'", "interactiveCanvasController");
    }
    id v13 = [(CRLModelSearchController *)self editingCoordinator];
    unsigned int v14 = [v13 followCoordinator];
    [v14 endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:1];

    id v15 = [(CRLFindReplaceController *)self replaceSearchReference:v7 withString:v6 shouldSetSelectionForCommitPath:1];
    [(CRLFindReplaceController *)self clearCurrentSelectionPath];
    [(CRLFindReplaceController *)self invalidateSearchResults];
    [v9 layoutIfNeeded];
    id v16 = [v15 searchReferenceEnd];
    [(CRLModelSearchController *)self setStartingPointSearchReference:v16];

    id v17 = [(CRLModelSearchController *)self startingPointSearchReference];
    [v7 searchReferencePoint];
    -[CRLFindReplaceController locateSearchReference:nearestPoint:](self, "locateSearchReference:nearestPoint:", v17);

    id v18 = [(CRLModelSearchController *)self findReplaceDelegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      uint64_t v20 = [(CRLModelSearchController *)self findReplaceDelegate];
      uint64_t v21 = (uint64_t)[v20 scrollOptionsForFindReplace];

      if (v4) {
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v21 = 8;
      if (v4) {
        goto LABEL_28;
      }
    }
    if ([(CRLFindReplaceController *)self shouldSetSelectionPathToFindResult])
    {
      uint64_t v23 = [(CRLModelSearchController *)self startingPointSearchReference];
      unsigned int v24 = [v23 isSelectable];

      if (v24)
      {
        long long v25 = [(CRLModelSearchController *)self findReplaceDelegate];
        long long v26 = [(CRLModelSearchController *)self startingPointSearchReference];
        long long v27 = [v26 selectionPath];
        [v25 setSelectionPath:v27 withFlags:6];

LABEL_29:
        [(CRLModelSearchController *)self setPrimaryFindResultSearchReference:0];
        [(CRLFindReplaceController *)self invalidateSearchHighlights];
        [(CRLFindReplaceController *)self setIsReplacingText:0];
        if (v4) {
          [(CRLFindReplaceController *)self findNextResultInDirection:0];
        }

        goto LABEL_32;
      }
    }
LABEL_28:
    [v9 scrollSearchReferenceToVisible:v15 scrollOptions:v21];
    goto LABEL_29;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F18E0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A43D8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F1900);
  }
  id v22 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v22);
  }
  uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceWithString:findAgain:]");
  uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v9, 547, 0, "invalid nil value for '%{public}s'", "replaceString");
LABEL_32:
}

- (void)endSearchSession
{
  [(CRLFindReplaceController *)self invalidateSearchResults];
  [(CRLFindReplaceController *)self invalidateSearchHighlights];
  BOOL v3 = [(CRLModelSearchController *)self primaryFindResultSearchReference];

  if (v3)
  {
    BOOL v4 = [(CRLModelSearchController *)self primaryFindResultSearchReference];
    [(CRLFindReplaceController *)self setSelectionPathToSearchReference:v4 flags:0];
  }
  id v5 = [(CRLModelSearchController *)self findReplaceDelegate];
  id v6 = [v5 interactiveCanvasControllerForFindController:self];

  [v6 setShowGrayOverlay:0];
  [(CRLFindReplaceController *)self setSearchHighlightsEnabled:0];
  [(CRLFindReplaceController *)self pulseSearchResult:0 autohiding:0];
}

- (void)locateSearchReference:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLModelSearchController *)self findReplaceDelegate];
  id v6 = [v5 interactiveCanvasControllerForFindController:self];

  uint64_t v7 = [v4 selectionPath];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10036D9B0;
  v9[3] = &unk_1014D6E80;
  id v10 = v4;
  id v8 = v4;
  [v6 withLayoutForSelectionPath:v7 performBlock:v9];
}

- (void)locateSearchReference:(id)a3 nearestPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = sub_1002469D0(v8, v7);
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 storage];

    if (v11)
    {
      uint64_t v12 = [(CRLModelSearchController *)self findReplaceDelegate];
      id v13 = [v12 interactiveCanvasControllerForFindController:self];

      unsigned int v14 = [v10 storage];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10036DB58;
      v15[3] = &unk_1014D6E80;
      id v16 = v7;
      [v13 withLayoutNearestPoint:v14 forStorage:v15 performBlock:^() {
    x;
    y;
}];
    }
  }
  else
  {
    [(CRLFindReplaceController *)self locateSearchReference:v7];
  }
}

- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    [v6 searchReferencePoint];
    if (v9 == CGPointZero.x && v8 == CGPointZero.y) {
      [(CRLFindReplaceController *)self locateSearchReference:v7];
    }
    id v11 = [(CRLModelSearchController *)self findReplaceDelegate];
    uint64_t v12 = [v11 interactiveCanvasControllerForFindController:self];

    [v12 scrollSearchReferenceToVisible:v7 scrollOptions:128];
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLFindReplaceController;
  id v13 = [(CRLModelSearchController *)&v15 searchReferenceAfterReference:v7 inDirection:a4];

  return v13;
}

- (void)asyncSearchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    [v8 searchReferencePoint];
    if (v11 == CGPointZero.x && v10 == CGPointZero.y) {
      [(CRLFindReplaceController *)self locateSearchReference:v8];
    }
    id v13 = [(CRLModelSearchController *)self findReplaceDelegate];
    unsigned int v14 = [v13 interactiveCanvasControllerForFindController:self];

    [v14 scrollSearchReferenceToVisible:v8 scrollOptions:128];
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLFindReplaceController;
  [(CRLModelSearchController *)&v15 asyncSearchReferenceAfterReference:v8 inDirection:a4 completionBlock:v9];
}

- (void)setSelectionPathToSearchReference:(id)a3 flags:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    objc_super v15 = v6;
    unsigned int v8 = [v6 isSelectable];
    id v7 = v15;
    if (v8)
    {
      [(CRLFindReplaceController *)self clearCurrentSelectionPath];
      id v9 = [(CRLModelSearchController *)self findReplaceDelegate];
      char v10 = objc_opt_respondsToSelector();

      double v11 = [(CRLModelSearchController *)self findReplaceDelegate];
      uint64_t v12 = v11;
      if (v10)
      {
        id v13 = [v15 selectionPath];
        [v12 setSelectionPath:v13 withFlags:a4];
      }
      else
      {
        unsigned int v14 = [v11 interactiveCanvasControllerForFindController:self];

        id v13 = [v15 selectionPath];
        [v14 setSelectionPath:v13 withSelectionFlags:a4];
        uint64_t v12 = v14;
      }

      id v7 = v15;
    }
  }
}

- (void)clearCurrentSelectionPath
{
  BOOL v3 = [(CRLModelSearchController *)self findReplaceDelegate];
  id v6 = [v3 interactiveCanvasControllerForFindController:self];

  id v4 = [v6 selectionModelTranslator];
  id v5 = [v4 selectionPathForInfos:0];

  [v6 setSelectionPath:v5 withSelectionFlags:128];
}

+ (id)unescapeFindQuery:(id)a3
{
  id v3 = a3;
  if (!qword_1016A97F0)
  {
    qword_1016A97F0 = (uint64_t)&off_10155CEC0;

    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%C%C%C%C%C%C" 9, 10, 5, 12, 8232, 92];
    id v5 = (void *)qword_1016A97F8;
    qword_1016A97F8 = (uint64_t)v4;
  }
  if ([v3 length])
  {
    id v6 = +[NSMutableString stringWithString:v3];
    id v7 = (char *)[(id)qword_1016A97F0 count];
    if (v7)
    {
      unsigned int v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        char v10 = [(id)qword_1016A97F0 objectAtIndexedSubscript:i];
        double v11 = [(id)qword_1016A97F8 substringWithRange:i, 1];
        id v12 = [(__CFString *)v6 crl_range];
        -[__CFString replaceOccurrencesOfString:withString:options:range:](v6, "replaceOccurrencesOfString:withString:options:range:", v10, v11, 0, v12, v13);
      }
    }
  }
  else
  {
    id v6 = &stru_101538650;
  }

  return v6;
}

+ (id)escapeFindQuery:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = +[NSMutableString stringWithString:v3];
    id v5 = [(__CFString *)v4 length];
    if (v5)
    {
      unint64_t v6 = (unint64_t)v5;
      unint64_t v7 = 0;
      while (2)
      {
        unsigned int v8 = [(__CFString *)v4 characterAtIndex:v7];
        uint64_t v9 = 1;
        char v10 = @"\\t";
        switch(v8)
        {
          case 5u:
            char v10 = @"\\p";
            goto LABEL_12;
          case 6u:
          case 7u:
          case 8u:
          case 0xBu:
            goto LABEL_13;
          case 9u:
            goto LABEL_12;
          case 0xAu:
            char v10 = @"\\n";
            goto LABEL_12;
          case 0xCu:
            char v10 = @"\\c";
            goto LABEL_12;
          default:
            if (v8 == 92)
            {
              char v10 = @"\\\\"";
            }
            else
            {
              if (v8 != 8232) {
                goto LABEL_13;
              }
              char v10 = @"\\i";
            }
LABEL_12:
            -[__CFString replaceCharactersInRange:withString:](v4, "replaceCharactersInRange:withString:", v7, 1, v10);
            uint64_t v9 = (uint64_t)[(__CFString *)v10 length];
            unint64_t v6 = v6 + v9 - 1;
LABEL_13:
            v7 += v9;
            if (v7 >= v6) {
              break;
            }
            continue;
        }
        break;
      }
    }
  }
  else
  {
    id v4 = &stru_101538650;
  }

  return v4;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (unint64_t)searchOptions
{
  return self->_searchOptions;
}

- (BOOL)isReplacingText
{
  return self->_isReplacingText;
}

- (void)setIsReplacingText:(BOOL)a3
{
  self->_isReplacingText = a3;
}

- (BOOL)shouldSetSelectionPathToFindResult
{
  return self->_shouldSetSelectionPathToFindResult;
}

- (void)setShouldSetSelectionPathToFindResult:(BOOL)a3
{
  self->_shouldSetSelectionPathToFindResult = a3;
}

- (_NSRange)highlightsRange
{
  p_highlightsRange = &self->_highlightsRange;
  NSUInteger location = self->_highlightsRange.location;
  NSUInteger length = p_highlightsRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setHighlightsRange:(_NSRange)a3
{
  self->_highlightsRange = a3;
}

- (BOOL)searchHighlightsEnabled
{
  return self->_searchHighlightsEnabled;
}

- (BOOL)returnFirstVisibleResultIfPossible
{
  return self->_returnFirstVisibleResultIfPossible;
}

- (void)setReturnFirstVisibleResultIfPossible:(BOOL)a3
{
  self->_returnFirstVisibleResultIfPossible = a3;
}

- (int64_t)lastFindPasteboardChangeCount
{
  return self->_lastFindPasteboardChangeCount;
}

- (void)setLastFindPasteboardChangeCount:(int64_t)a3
{
  self->_lastFindPasteboardChangeCount = a3;
}

- (BOOL)isReplacingAll
{
  return self->_isReplacingAll;
}

- (void)setIsReplacingAll:(BOOL)a3
{
  self->_isReplacingAll = a3;
}

- (NSMapTable)visibleResults
{
  return self->_visibleResults;
}

- (void)setVisibleResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleResults, 0);
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_storeStrong((id *)&self->_searchSessionUUID, 0);
}

@end