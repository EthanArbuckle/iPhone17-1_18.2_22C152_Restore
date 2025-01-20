@interface CRLRotorSearchController
+ (id)childTargetsForSearchTarget:(id)a3;
+ (id)searchTargetSearchSelectors;
+ (void)recursiveSearchWithSearchTarget:(id)a3 inFlowMode:(BOOL)a4 withHitBlock:(id)a5;
- (BOOL)shouldChangeSelectionPath;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLRotorSearchController)initWithInteractiveCanvasController:(id)a3;
- (id)searchReferenceAfterReference:(id)a3 inRotorDirection:(int64_t)a4;
- (void)_addObservers;
- (void)locateSearchReference:(id)a3;
- (void)performSearchWithSearchTarget:(id)a3 resultsArray:(id)a4;
- (void)setInteractiveCanvasController:(id)a3;
@end

@implementation CRLRotorSearchController

- (CRLRotorSearchController)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v5 = [v4 delegate];
  v12 = sub_100246AC8(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLFindReplaceDelegate);

  v13 = [v4 editingCoordinator];
  v16.receiver = self;
  v16.super_class = (Class)CRLRotorSearchController;
  v14 = [(CRLModelSearchController *)&v16 initWithEditingCoordinator:v13 delegate:v12 modelSearchesRunSynchronously:1];

  if (v14)
  {
    [(CRLRotorSearchController *)v14 setInteractiveCanvasController:v4];
    [(CRLModelSearchController *)v14 invalidateSearchResults];
  }

  return v14;
}

+ (void)recursiveSearchWithSearchTarget:(id)a3 inFlowMode:(BOOL)a4 withHitBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [a1 searchTargetSearchSelectors];
    if (v10)
    {
      uint64_t v11 = v10;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v28;
        do
        {
          v15 = 0;
          do
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)v15) pointerValue];
            if (v16)
            {
              id v17 = v16;
              if (objc_opt_respondsToSelector()) {
                ((void (*)(id, id, id))[v8 methodForSelector:v17])(v8, v17, v9);
              }
            }
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v13);
      }
      v18 = [a1 childTargetsForSearchTarget:v8];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          v22 = 0;
          do
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v18);
            }
            [a1 recursiveSearchWithSearchTarget:*(void *)(*((void *)&v23 + 1) + 8 * (void)v22) inFlowMode:v6 withHitBlock:v9];
            v22 = (char *)v22 + 1;
          }
          while (v20 != v22);
          id v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v20);
      }
    }
  }
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_storeWeak((id *)&self->_interactiveCanvasController, a3);

  [(CRLRotorSearchController *)self _addObservers];
}

+ (id)childTargetsForSearchTarget:(id)a3
{
  return [a3 childSearchTargets];
}

+ (id)searchTargetSearchSelectors
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF488);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    uint64_t v21 = "+[CRLRotorSearchController searchTargetSearchSelectors]";
    __int16 v22 = 2082;
    long long v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLRotorSearchController.m";
    __int16 v24 = 1024;
    int v25 = 63;
    __int16 v26 = 2114;
    long long v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF4A8);
  }
  uint64_t v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLRotorSearchController searchTargetSearchSelectors]");
  uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLRotorSearchController.m"];
  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 63, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "+[CRLRotorSearchController searchTargetSearchSelectors]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (BOOL)shouldChangeSelectionPath
{
  return 1;
}

- (void)performSearchWithSearchTarget:(id)a3 resultsArray:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004BAB44;
  v9[3] = &unk_1014F1710;
  id v10 = v5;
  id v8 = v5;
  [v7 recursiveSearchWithSearchTarget:v6 inFlowMode:0 withHitBlock:v9];
}

- (void)locateSearchReference:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLRotorSearchController *)self interactiveCanvasController];
  id v6 = [v4 selectionPath];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004BAC1C;
  v8[3] = &unk_1014D6E80;
  id v9 = v4;
  id v7 = v4;
  [v5 forLayoutNearestVisibleRectForInfosForSelectionPath:v6 performBlock:v8];
}

- (id)searchReferenceAfterReference:(id)a3 inRotorDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    [v6 searchReferencePoint];
    if (v9 == CGPointZero.x && v8 == CGPointZero.y) {
      [(CRLRotorSearchController *)self locateSearchReference:v7];
    }
  }
  uint64_t v11 = [(CRLModelSearchController *)self searchReferenceAfterReference:v7 inDirection:a4 == 0];

  return v11;
}

- (void)_addObservers
{
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  id v5 = [WeakRetained changeNotifier];
  id v6 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  id v7 = [v6 board];
  double v8 = [v7 rootContainer];
  [v5 addObserver:self forChangeSource:v8];

  id v12 = +[NSNotificationCenter defaultCenter];
  double v9 = +[NSNotification CRLCommandControllerHistoryStateDidChange];
  id v10 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  uint64_t v11 = [v10 commandController];
  [v12 addObserver:self selector:"_commandHistoryChanged:" name:v9 object:v11];
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end