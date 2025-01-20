@interface CRLDynamicOperationController
- (BOOL)isInOperation;
- (BOOL)isInPossibleDynamicOperation;
- (BOOL)isOperationDynamic;
- (CRLDynamicOperationController)initWithInteractiveCanvasController:(id)a3;
- (NSSet)allTransformedReps;
- (NSSet)currentlyTransformingReps;
- (void)beginOperation;
- (void)beginPossibleDynamicOperation;
- (void)cancelOperation;
- (void)endOperation;
- (void)handleGestureRecognizer:(id)a3;
- (void)handleTrackerManipulator:(id)a3;
- (void)invalidateGuides;
- (void)p_beginDynamicOperationForReps:(id)a3;
- (void)p_cleanupOperation;
- (void)p_controllingTMDidResetInOperation:(id)a3;
- (void)p_resetGuidesForCleanup:(BOOL)a3;
- (void)startTransformingReps:(id)a3;
- (void)stopTransformingReps:(id)a3;
@end

@implementation CRLDynamicOperationController

- (CRLDynamicOperationController)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLDynamicOperationController;
  v5 = [(CRLDynamicOperationController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v6->_resetGuides = 1;
  }

  return v6;
}

- (void)beginPossibleDynamicOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  unsigned int v4 = [WeakRetained isInDynamicOperation];

  if (v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5848);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ABB38();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5868);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginPossibleDynamicOperation]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:74 isFatal:0 description:"begin possible op with ICC in dynamic operation"];
  }
  if (self->_possibleDynamicOperation || self->_reps || self->_allTransformedReps)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5888);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ABAB0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F58A8);
    }
    objc_super v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginPossibleDynamicOperation]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:75 isFatal:0 description:"beginning possible operation without ending previous operation"];
  }
  v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  reps = self->_reps;
  self->_reps = v11;

  self->_possibleDynamicOperation = 1;
  *(_WORD *)&self->_resetGuides = 257;
}

- (void)beginOperation
{
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  unsigned int v5 = [WeakRetained isInDynamicOperation];

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F58C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ABCD0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F58E8);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginOperation]");
    objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:90 isFatal:0 description:"begin op with ICC in dynamic operation"];
  }
  if (!self->_possibleDynamicOperation && (self->_reps || self->_allTransformedReps))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5908);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ABC48();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5928);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginOperation]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:91 isFatal:0 description:"beginning operation without ending previous operation"];
  }
  id v12 = objc_loadWeakRetained((id *)p_icc);
  v13 = [v12 tmCoordinator];
  v14 = [v13 controllingTM];

  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5948);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ABBC0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5968);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginOperation]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:92 isFatal:0 description:"No controlling TM when beginning operation"];
  }
  id v18 = objc_loadWeakRetained((id *)p_icc);
  v19 = [v18 tmCoordinator];
  v20 = [v19 controllingTM];
  v21 = [v20 tracker];

  if (objc_opt_respondsToSelector()) {
    [v21 traceIfDesiredForBeginOperation];
  }
  self->_supportsAlignmentGuides = [v21 supportsAlignmentGuides];
  self->_operationIsDynamic = [v21 operationShouldBeDynamic];
  if (self->_possibleDynamicOperation)
  {
    self->_possibleDynamicOperation = 0;
    v22 = +[NSMutableSet setWithSet:self->_reps];
    allTransformedReps = self->_allTransformedReps;
    self->_allTransformedReps = v22;

    if (!self->_operationIsDynamic) {
      goto LABEL_41;
    }
    v24 = +[NSSet setWithSet:self->_reps];
    [(CRLDynamicOperationController *)self p_beginDynamicOperationForReps:v24];
  }
  else
  {
    v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    reps = self->_reps;
    self->_reps = v25;

    v27 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v28 = self->_allTransformedReps;
    self->_allTransformedReps = v27;

    self->_resetGuides = 1;
  }
  if (self->_operationIsDynamic)
  {
    id v29 = objc_loadWeakRetained((id *)p_icc);
    [v29 beginDynamicOperation];
  }
LABEL_41:
  v30 = +[NSNotificationCenter defaultCenter];
  [v30 addObserver:self selector:"p_controllingTMDidResetInOperation:" name:@"CRLCanvasControllingGRDidResetNotification" object:0];
}

- (void)p_beginDynamicOperationForReps:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v6 = [WeakRetained tmCoordinator];
  v7 = [v6 controllingTM];
  objc_super v8 = [v7 tracker];

  v22[0] = @"CRLDynamicOperationControllerDynamicOperationTrackerKey";
  v22[1] = @"CRLDynamicOperationControllerDynamicOperationRepsKey";
  v23[0] = v8;
  v23[1] = v4;
  v9 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"CRLDynamicOperationControllerWillStartDynamicOperationNotification" object:self userInfo:v9];

  if (objc_opt_respondsToSelector()) {
    [v8 willBeginDynamicOperationForReps:v4];
  }
  if (objc_opt_respondsToSelector()) {
    id v11 = [v8 isEnqueueingCommandsInRealTime];
  }
  else {
    id v11 = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) dynamicOperationDidBeginWithRealTimeCommands:v11 v17];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)endOperation
{
  v2 = self;
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  unsigned int v5 = [WeakRetained tmCoordinator];
  v6 = [v5 controllingTM];
  v7 = [v6 tracker];

  if (v2->_operationIsDynamic)
  {
    id v8 = objc_loadWeakRetained((id *)p_icc);
    [v8 willEndDynamicOperation];

    CFStringRef v70 = @"CRLDynamicOperationControllerDynamicOperationTrackerKey";
    v71 = v7;
    v9 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"CRLDynamicOperationControllerDidEndDynamicOperationNotification" object:v2 userInfo:v9];
  }
  id v11 = objc_loadWeakRetained((id *)p_icc);
  id v12 = [v11 tmCoordinator];
  [v12 operationWillEnd];

  if ([(CRLDynamicOperationController *)v2 isInOperation])
  {
    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 removeObserver:v2 name:@"CRLCanvasControllingGRDidResetNotification" object:0];

    if (objc_opt_respondsToSelector()) {
      [v7 traceIfDesiredForEndOperation];
    }
    if ([(CRLDynamicOperationController *)v2 isOperationDynamic]) {
      unsigned int v14 = [v7 shouldOpenCommandGroupToCommitChangesForReps:v2->_allTransformedReps];
    }
    else {
      unsigned int v14 = 0;
    }
    id v15 = objc_loadWeakRetained((id *)p_icc);
    v56 = [v15 commandController];

    if (v14)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ([v7 selectionBehaviorForReps:v2->_allTransformedReps],
            (v16 = (CRLCanvasCommandSelectionBehavior *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        long long v17 = [CRLCanvasCommandSelectionBehavior alloc];
        id v18 = objc_loadWeakRetained((id *)p_icc);
        long long v19 = [v18 canvasEditor];
        id v20 = objc_loadWeakRetained((id *)p_icc);
        v21 = [v20 editorController];
        v22 = [v21 selectionPath];
        v16 = [(CRLCanvasCommandSelectionBehavior *)v17 initWithCanvasEditor:v19 type:2 selectionPath:v22 selectionFlags:0 commitSelectionFlags:0 forwardSelectionFlags:4 reverseSelectionFlags:4];
      }
      [v56 openGroupWithSelectionBehavior:v16];
    }
    if (v7)
    {
      [v7 commitChangesForReps:v2->_allTransformedReps];
      if (!v14)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5988);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010ABDE0();
      }
      v54 = p_icc;
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F59A8);
      }
      unsigned int v52 = v14;
      v30 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v30);
      }
      v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController endOperation]");
      v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v31 file:v32 lineNumber:205 isFatal:0 description:"tracker controller should not commit dynamic changes"];

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v53 = v2;
      obj = v2->_allTransformedReps;
      id v33 = [(NSMutableSet *)obj countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v58;
        do
        {
          v36 = 0;
          do
          {
            if (*(void *)v58 != v35) {
              objc_enumerationMutation(obj);
            }
            v37 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v36);
            v38 = [v37 layout];
            v39 = [v38 pureGeometry];

            v40 = [v37 layout];
            v41 = [v40 computeInfoGeometryFromPureLayoutGeometry:v39];

            v42 = [v37 infoForTransforming];
            uint64_t v43 = objc_opt_class();
            v44 = sub_1002469D0(v43, v42);
            if (v44)
            {
              v45 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v44 geometry:v41];
              [v56 enqueueCommand:v45];
            }
            else
            {
              unsigned int v46 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014F59C8);
              }
              v47 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                unsigned int v62 = v46;
                __int16 v63 = 2082;
                v64 = "-[CRLDynamicOperationController endOperation]";
                __int16 v65 = 2082;
                v66 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m";
                __int16 v67 = 1024;
                int v68 = 213;
                _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d to run a command to resize an info, the info must be a board item", buf, 0x22u);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014F59E8);
              }
              v48 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                v50 = v48;
                v51 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = 67109378;
                unsigned int v62 = v46;
                __int16 v63 = 2114;
                v64 = v51;
                _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController endOperation]");
              v45 = (_TtC8Freeform25CRLCommandSetInfoGeometry *)objc_claimAutoreleasedReturnValue();
              v49 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v49, 213, 0, "to run a command to resize an info, the info must be a board item");
            }
            v36 = (char *)v36 + 1;
          }
          while (v34 != v36);
          id v34 = [(NSMutableSet *)obj countByEnumeratingWithState:&v57 objects:v69 count:16];
        }
        while (v34);
      }

      p_icc = v54;
      v7 = 0;
      v2 = v53;
      if (!v52) {
        goto LABEL_17;
      }
    }
    id v23 = objc_loadWeakRetained((id *)p_icc);
    v24 = [v23 commandController];
    [v24 closeGroup];

    goto LABEL_17;
  }
LABEL_18:
  [(CRLDynamicOperationController *)v2 p_cleanupOperation];
  id v25 = objc_loadWeakRetained((id *)p_icc);
  unsigned int v26 = [v25 isInDynamicOperation];

  if (v26)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5A08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ABD58();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5A28);
    }
    v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v27);
    }
    v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController endOperation]");
    id v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:229 isFatal:0 description:"ending op with ICC still in dynamic operation"];
  }
}

- (BOOL)isInOperation
{
  return self->_reps && self->_allTransformedReps && !self->_possibleDynamicOperation;
}

- (BOOL)isInPossibleDynamicOperation
{
  return self->_possibleDynamicOperation;
}

- (BOOL)isOperationDynamic
{
  return self->_operationIsDynamic;
}

- (void)cancelOperation
{
  if (![(CRLDynamicOperationController *)self isInOperation])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5A48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ABE68();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5A68);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController cancelOperation]");
    unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:250 isFatal:0 description:"cancelling when not in operation"];
  }
  [(CRLDynamicOperationController *)self p_cleanupOperation];
}

- (void)p_cleanupOperation
{
  if (self->_operationIsDynamic)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v3 = self->_allTransformedReps;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) dynamicOperationDidEnd:v13];
        }
        id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    [WeakRetained endDynamicOperation];
  }
  -[CRLDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 1, (void)v13);
  id v9 = objc_loadWeakRetained((id *)&self->_icc);
  v10 = [v9 tmCoordinator];
  [v10 operationDidEnd];

  self->_possibleDynamicOperation = 0;
  reps = self->_reps;
  self->_reps = 0;

  allTransformedReps = self->_allTransformedReps;
  self->_allTransformedReps = 0;

  self->_operationIsDynamic = 0;
}

- (void)startTransformingReps:(id)a3
{
  id v4 = a3;
  if (![(CRLDynamicOperationController *)self isInOperation] && !self->_possibleDynamicOperation)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5A88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ABEF0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5AA8);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController startTransformingReps:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:280 isFatal:0 description:"cannot begin transforming reps until we are in a transform"];
  }
  id v8 = +[NSMutableSet set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_reps, "containsObject:", v14, (void)v19) & 1) == 0) {
          [(NSMutableSet *)self->_reps addObject:v14];
        }
        if (!self->_possibleDynamicOperation
          && ([(NSMutableSet *)self->_allTransformedReps containsObject:v14] & 1) == 0)
        {
          if (self->_operationIsDynamic) {
            [v8 addObject:v14];
          }
          [(NSMutableSet *)self->_allTransformedReps addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    [(CRLDynamicOperationController *)self p_beginDynamicOperationForReps:v8];
  }
  -[CRLDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 0, (void)v19);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  long long v16 = [WeakRetained tmCoordinator];
  long long v17 = [v16 controllingTM];
  id v18 = [v17 tracker];

  if (objc_opt_respondsToSelector()) {
    [v18 didChangeCurrentlyTransformingReps];
  }
}

- (void)stopTransformingReps:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [(NSMutableSet *)self->_reps minusSet:v4];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v9) layout:(void)v15];
          [v10 pauseDynamicTransformation];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [(CRLDynamicOperationController *)self p_resetGuidesForCleanup:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    uint64_t v12 = [WeakRetained tmCoordinator];
    long long v13 = [v12 controllingTM];
    uint64_t v14 = [v13 tracker];

    if (objc_opt_respondsToSelector()) {
      [v14 didChangeCurrentlyTransformingReps];
    }
  }
}

- (void)handleGestureRecognizer:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v6 = [WeakRetained tmCoordinator];
  id v7 = [v6 controllingTM];

  if (v7 == v4)
  {
    if (![(CRLDynamicOperationController *)self isInOperation])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5AC8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AC03C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5AE8);
      }
      uint64_t v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController handleGestureRecognizer:]");
      id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      +[CRLAssertionHandler handleFailureInFunction:v9, v10, 340, 0, "tracker is handling GR %@ when not in a transform", v12 file lineNumber isFatal description];
    }
    long long v13 = [v4 tracker];
    unsigned int v14 = [v13 operationShouldBeDynamic];
    int operationIsDynamic = self->_operationIsDynamic;

    if (operationIsDynamic != v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5B08);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010ABF78();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5B28);
      }
      long long v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v16);
      }
      long long v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController handleGestureRecognizer:]");
      long long v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
      long long v19 = [v4 tracker];
      +[CRLAssertionHandler handleFailureInFunction:v17, v18, 346, 0, "Controlling TM has different dynamic operation expectations than current operation (%@)", v19 file lineNumber isFatal description];
    }
    if (self->_resetGuides) {
      [(CRLDynamicOperationController *)self p_resetGuidesForCleanup:0];
    }
    long long v20 = (char *)[v4 state];
    if ((unint64_t)(v20 - 1) >= 2)
    {
      if (v20 == (char *)3)
      {
        long long v22 = [v4 tracker];
        [v22 changeDynamicLayoutsForReps:self->_reps];

        [(CRLDynamicOperationController *)self endOperation];
      }
    }
    else
    {
      long long v21 = [v4 tracker];
      [v21 changeDynamicLayoutsForReps:self->_reps];
    }
  }
}

- (void)p_controllingTMDidResetInOperation:(id)a3
{
  id v4 = [a3 object];
  if (![(CRLDynamicOperationController *)self isInOperation])
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5B48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AC108((uint64_t)v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5B68);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController p_controllingTMDidResetInOperation:]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7, v8, 377, 0, "controlling GR reset in an operation, but we aren't in an operation! %@", v4 file lineNumber isFatal description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v10 = [WeakRetained tmCoordinator];
  id v11 = [v10 controllingTM];

  if (v4 == v11) {
    [(CRLDynamicOperationController *)self endOperation];
  }
}

- (void)handleTrackerManipulator:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v6 = [WeakRetained tmCoordinator];
  id v7 = [v6 controllingTM];

  if (v7 == v4)
  {
    if (![(CRLDynamicOperationController *)self isInOperation])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5B88);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AC278();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5BA8);
      }
      uint64_t v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController handleTrackerManipulator:]");
      id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      +[CRLAssertionHandler handleFailureInFunction:v9, v10, 393, 0, "tracker is handling TM %@ when not in a transform", v12 file lineNumber isFatal description];
    }
    long long v13 = [v4 tracker];
    unsigned int v14 = [v13 operationShouldBeDynamic];
    int operationIsDynamic = self->_operationIsDynamic;

    if (operationIsDynamic != v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5BC8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AC1AC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5BE8);
      }
      long long v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v16);
      }
      long long v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController handleTrackerManipulator:]");
      long long v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"];
      long long v19 = (objc_class *)objc_opt_class();
      long long v20 = NSStringFromClass(v19);
      +[CRLAssertionHandler handleFailureInFunction:v17, v18, 399, 0, "Controlling TM %@ has different dynamic operation expectations than current operation", v20 file lineNumber isFatal description];
    }
    if (self->_resetGuides) {
      [(CRLDynamicOperationController *)self p_resetGuidesForCleanup:0];
    }
    long long v21 = [v4 tracker];
    [v21 changeDynamicLayoutsForReps:self->_reps];

    if ([v4 readyToEndOperation]) {
      [(CRLDynamicOperationController *)self endOperation];
    }
  }
}

- (void)invalidateGuides
{
  self->_resetGuides = 1;
}

- (void)p_resetGuidesForCleanup:(BOOL)a3
{
  if (self->_supportsAlignmentGuides)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    id v6 = [WeakRetained guideController];
    [v6 endAlignmentOperation];
  }
  id v7 = objc_loadWeakRetained((id *)&self->_icc);
  uint64_t v8 = [v7 tmCoordinator];
  id v9 = [v8 controllingTM];
  id v39 = [v9 tracker];

  if ([v39 supportsAlignmentGuides])
  {
    id v10 = [(NSMutableSet *)self->_reps count];
    self->_supportsAlignmentGuides = v10 != 0;
    if (v10 && !a3)
    {
      id v11 = self->_reps;
      id v12 = objc_loadWeakRetained((id *)&self->_icc);
      long long v13 = [v12 tmCoordinator];
      unsigned int v14 = [v13 controllingTM];
      long long v15 = [v14 tracker];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = objc_loadWeakRetained((id *)&self->_icc);
        long long v18 = [v17 tmCoordinator];
        long long v19 = [v18 controllingTM];
        long long v20 = [v19 tracker];
        uint64_t v21 = [v20 repsForGuidesWhenManipulatingReps:self->_reps];

        id v11 = (NSMutableSet *)v21;
      }
      if (objc_opt_respondsToSelector())
      {
        id v22 = objc_loadWeakRetained((id *)&self->_icc);
        id v23 = [v22 tmCoordinator];
        v24 = [v23 controllingTM];
        id v25 = [v24 tracker];
        id v26 = [v25 suppressesCenterGuides];
      }
      else
      {
        id v26 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        id v27 = objc_loadWeakRetained((id *)&self->_icc);
        v28 = [v27 tmCoordinator];
        id v29 = [v28 controllingTM];
        v30 = [v29 tracker];
        id v31 = [v30 suppressesSpacingGuides];
      }
      else
      {
        id v31 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        id v32 = objc_loadWeakRetained((id *)&self->_icc);
        id v33 = [v32 tmCoordinator];
        id v34 = [v33 controllingTM];
        uint64_t v35 = [v34 tracker];
        id v36 = [v35 suppressesSizingGuides];
      }
      else
      {
        id v36 = 0;
      }
      id v37 = objc_loadWeakRetained((id *)&self->_icc);
      v38 = [v37 guideController];
      [v38 beginAlignmentOperationForReps:v11 preventCenterGuides:v26 preventSpacingGuides:v31 preventSizingGuides:v36];
    }
  }
  else
  {
    self->_supportsAlignmentGuides = 0;
  }
  self->_resetGuides = 0;
}

- (NSSet)currentlyTransformingReps
{
  return &self->_reps->super;
}

- (NSSet)allTransformedReps
{
  return &self->_allTransformedReps->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTransformedReps, 0);
  objc_storeStrong((id *)&self->_reps, 0);

  objc_destroyWeak((id *)&self->_icc);
}

@end