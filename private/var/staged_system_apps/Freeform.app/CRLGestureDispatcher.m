@interface CRLGestureDispatcher
- (BOOL)gestureActionShouldBegin:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)p_allowTextGestureTouch:(id)a3;
- (BOOL)runningTargetHandleGesture;
- (CRLGestureDispatcher)initWithInteractiveCanvasController:(id)a3;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLNoCopyDictionary)priorityMap;
- (NSMutableArray)gesturesInFlight;
- (NSMutableArray)simultaneitySets;
- (NSMutableArray)targetsInFlight;
- (NSMutableSet)firedGestures;
- (id)p_getGestureTarget:(id)a3;
- (void)allowSimultaneousRecognitionByRecognizerSet:(id)a3;
- (void)allowSimultaneousRecognitionByRecognizers:(id)a3;
- (void)gestureRemovedFromView:(id)a3;
- (void)handleGesture:(id)a3;
- (void)handleGesture:(id)a3 withTarget:(id)a4;
- (void)p_gestureNoLongerInFlight:(id)a3;
- (void)prioritizeRecognizer:(id)a3 overRecognizer:(id)a4;
- (void)setFiredGestures:(id)a3;
- (void)setGesturesInFlight:(id)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setPriorityMap:(id)a3;
- (void)setRunningTargetHandleGesture:(BOOL)a3;
- (void)setSimultaneitySets:(id)a3;
- (void)setTargetsInFlight:(id)a3;
- (void)teardown;
@end

@implementation CRLGestureDispatcher

- (CRLGestureDispatcher)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLGestureDispatcher;
  v5 = [(CRLGestureDispatcher *)&v12 init];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EEDA8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109FE9C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EEDC8);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGestureDispatcher initWithInteractiveCanvasController:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLGestureDispatcher.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 161, 0, "invalid nil value for '%{public}s'", "icc");
    }
    [(CRLGestureDispatcher *)v5 setInteractiveCanvasController:v4];
    uint64_t v9 = +[NSMutableSet set];
    firedGestures = v5->_firedGestures;
    v5->_firedGestures = (NSMutableSet *)v9;
  }
  return v5;
}

- (void)teardown
{
  [(NSMutableSet *)self->_firedGestures removeAllObjects];
  [(NSMutableArray *)self->_targetsInFlight removeAllObjects];
  gesturesInFlight = self->_gesturesInFlight;

  [(NSMutableArray *)gesturesInFlight removeAllObjects];
}

- (void)handleGesture:(id)a3
{
  id v4 = a3;
  v5 = [v4 cachedGestureTarget];
  if (v5)
  {
    targetsInFlight = self->_targetsInFlight;
    if (!targetsInFlight)
    {
      v7 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
      v8 = self->_targetsInFlight;
      self->_targetsInFlight = v7;

      targetsInFlight = self->_targetsInFlight;
    }
    if (([(NSMutableArray *)targetsInFlight containsObject:v5] & 1) == 0)
    {
      [v5 gestureSequenceWillBegin];
      [(NSMutableArray *)self->_targetsInFlight insertObject:v5 atIndex:0];
      if ([(NSMutableArray *)self->_targetsInFlight count] == (id)1)
      {
        uint64_t v9 = [(CRLGestureDispatcher *)self interactiveCanvasController];
        v10 = [v9 editingCoordinator];
        [v10 suspendCollaborationWithReason:@"CRLTextGesturesInFlight"];
      }
    }
    v11 = [(CRLGestureDispatcher *)self firedGestures];
    [v11 addObject:v4];

    self->_runningTargetHandleGesture = 1;
    [v5 handleGesture:v4];
    self->_runningTargetHandleGesture = 0;
    if ([v4 isDone]) {
      [v4 setTargetRep:0];
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EEDE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109FF4C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EEE08);
    }
    objc_super v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGestureDispatcher handleGesture:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLGestureDispatcher.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 184, 0, "gestureTarget should not be nil, shouldReceiveTouch should have failed this gesture");
  }
}

- (void)handleGesture:(id)a3 withTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_runningTargetHandleGesture)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EEE28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109FFE0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EEE48);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGestureDispatcher handleGesture:withTarget:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLGestureDispatcher.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:221 isFatal:0 description:"handleGesture:withTarget: can only be called from a target's handleGesture: method"];
  }
  [v6 setCachedGestureTarget:v7];
  [(CRLGestureDispatcher *)self handleGesture:v6];
}

- (void)allowSimultaneousRecognitionByRecognizers:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet setWithObject:v4];
  v13 = (id *)&v15;
  id v6 = v14;
  if (v6)
  {
    id v7 = v6;
    do
    {
      [v5 addObject:v7];
      v8 = v13++;
      id v9 = *v8;

      id v7 = v9;
    }
    while (v9);
  }
  simultaneitySets = self->_simultaneitySets;
  if (!simultaneitySets)
  {
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v12 = self->_simultaneitySets;
    self->_simultaneitySets = v11;

    simultaneitySets = self->_simultaneitySets;
  }
  [(NSMutableArray *)simultaneitySets addObject:v5];
}

- (void)allowSimultaneousRecognitionByRecognizerSet:(id)a3
{
  id v4 = a3;
  simultaneitySets = self->_simultaneitySets;
  id v9 = v4;
  if (!simultaneitySets)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_simultaneitySets;
    self->_simultaneitySets = v6;

    id v4 = v9;
    simultaneitySets = self->_simultaneitySets;
  }
  id v8 = [v4 copy];
  [(NSMutableArray *)simultaneitySets addObject:v8];
}

- (void)prioritizeRecognizer:(id)a3 overRecognizer:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  priorityMap = self->_priorityMap;
  if (!priorityMap)
  {
    id v8 = objc_alloc_init(CRLNoCopyDictionary);
    id v9 = self->_priorityMap;
    self->_priorityMap = v8;

    priorityMap = self->_priorityMap;
  }
  v10 = [(CRLNoCopyDictionary *)priorityMap objectForKey:v6];
  if (v10)
  {
    v11 = v10;
    objc_super v12 = [v10 setByAddingObject:v13];
  }
  else
  {
    objc_super v12 = +[NSSet setWithObject:v13];
  }
  [(CRLNoCopyDictionary *)self->_priorityMap setObject:v12 forUncopiedKey:v6];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  unsigned __int8 v6 = [WeakRetained currentlyScrolling];

  if ((v6 & 1) != 0
    || ([(CRLGestureDispatcher *)self p_getGestureTarget:v4],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = [v4 gestureKind];

    if (v9 == @"CRLWPUndefinedGestureKind")
    {
      v11 = [(CRLGestureDispatcher *)self interactiveCanvasController];
      objc_super v12 = [v11 layerHost];
      id v13 = [v12 asUIKitHost];

      v20 = sub_100246AC8(v13, 1, v14, v15, v16, v17, v18, v19, (uint64_t)&OBJC_PROTOCOL___UIGestureRecognizerDelegate);
      if (v20)
      {
        v21 = v20;
        unsigned int v10 = [v20 gestureRecognizerShouldBegin:v4];

        id v8 = 0;
        if (!v10) {
          goto LABEL_33;
        }
        goto LABEL_8;
      }
    }
    id v8 = 0;
    LOBYTE(v10) = 0;
    goto LABEL_33;
  }
  id v8 = (void *)v7;
  [v4 setCachedGestureTarget:v7];
LABEL_8:
  priorityMap = self->_priorityMap;
  if (priorityMap)
  {
    v23 = [(CRLNoCopyDictionary *)priorityMap objectForKey:v4];
    v24 = v23;
    if (v23)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v25 = v23;
      id v26 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v26)
      {
        id v33 = v26;
        v42 = v24;
        uint64_t v34 = *(void *)v44;
        while (2)
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v44 != v34) {
              objc_enumerationMutation(v25);
            }
            v36 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v37 = sub_100246AC8(v4, 1, v27, v28, v29, v30, v31, v32, (uint64_t)&OBJC_PROTOCOL___CRLGesture);
            BOOL v38 = [v36 state] == (id)5 && [v37 inputType] == (id)2;
            id v39 = [v36 state];

            if (v39) {
              BOOL v40 = !v38;
            }
            else {
              BOOL v40 = 0;
            }
            if (v40)
            {
              LOBYTE(v10) = 0;
              goto LABEL_28;
            }
          }
          id v33 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v33) {
            continue;
          }
          break;
        }
        LOBYTE(v10) = 1;
LABEL_28:
        v24 = v42;
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }
LABEL_33:

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = sub_100246AC8(v6, 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLGesture);
  objc_msgSend(v14, "setInputType:", sub_10036FEA4((BOOL)objc_msgSend(v7, "type")));
  BOOL v15 = [v14 inputType] != (id)2;
  uint64_t v16 = [(CRLGestureDispatcher *)self interactiveCanvasController];
  uint64_t v17 = [v16 textInputResponder];
  [v17 setIgnorePencilInputSource:v15];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  uint64_t v19 = [WeakRetained layerHost];
  v20 = [v19 asUIKitHost];

  id v21 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v22 = [v21 canvasView];
  [v7 locationInView:v22];
  double v24 = v23;
  double v26 = v25;

  if (objc_msgSend(v20, "shouldIgnoreTextGesture:atPoint:", v14, v24, v26))
  {
    BOOL v27 = 0;
    goto LABEL_19;
  }
  uint64_t v28 = [v6 gestureKind];
  if (v28 == @"CRLWPUndefinedGestureKind") {
    goto LABEL_9;
  }
  v35 = v28;
  v36 = [v6 gestureKind];
  if (v36 != @"CRLWPImmediateSingleTap")
  {

    goto LABEL_7;
  }
  id v37 = [v14 inputType];

  if (!v37)
  {
LABEL_9:
    id v39 = sub_100246AC8(v20, 1, v29, v30, v31, v32, v33, v34, (uint64_t)&OBJC_PROTOCOL___UIGestureRecognizerDelegate);
    BOOL v40 = v39;
    if (v39) {
      unsigned int v38 = [v39 gestureRecognizer:v6 shouldReceiveTouch:v7];
    }
    else {
      unsigned int v38 = 0;
    }

LABEL_13:
    BOOL v27 = v38 != 0;
    if (!v38) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
LABEL_7:
  if (![(CRLGestureDispatcher *)self p_allowTextGestureTouch:v7])
  {
    unsigned int v38 = [v20 allowTouchOutsideCanvasViewAtPoint:v6 forGesture:v24];
    goto LABEL_13;
  }
LABEL_14:
  gesturesInFlight = self->_gesturesInFlight;
  if (gesturesInFlight)
  {
    if ([(NSMutableArray *)gesturesInFlight indexOfObjectIdenticalTo:v6] == (id)0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_gesturesInFlight addObject:v6];
    }
    BOOL v27 = 1;
  }
  else
  {
    v42 = [objc_alloc((Class)NSMutableArray) initWithObjects:v6, 0];
    long long v43 = self->_gesturesInFlight;
    self->_gesturesInFlight = v42;

    long long v44 = [(CRLGestureDispatcher *)self firedGestures];
    [v44 removeAllObjects];

    long long v45 = +[NSNotificationCenter defaultCenter];
    CFStringRef v49 = @"CRLTextGesturesICC";
    id v46 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    id v50 = v46;
    BOOL v27 = 1;
    v47 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    [v45 postNotificationName:@"CRLTextGesturesWillBeginNotification" object:self userInfo:v47];
  }
LABEL_19:

  return v27;
}

- (BOOL)p_allowTextGestureTouch:(id)a3
{
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  id v6 = [WeakRetained canvasView];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  id v11 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  uint64_t v12 = [v11 layerHost];
  uint64_t v13 = [v12 asUIKitHost];

  if (objc_msgSend(v13, "touchHitsCanvasViewAtPoint:", v8, v10))
  {
    unsigned __int8 v14 = 1;
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    uint64_t v16 = [v15 layerHost];
    uint64_t v17 = [v16 asiOSCVC];

    uint64_t v18 = [v17 delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v19 = [v18 currentDocumentMode];
      unsigned __int8 v14 = [v19 shouldAllowTextGesturesInRestrictedGestureMode];
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  simultaneitySets = self->_simultaneitySets;
  if (simultaneitySets)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v9 = simultaneitySets;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "containsObject:", v6, (void)v15)
            && ([v13 containsObject:v7] & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_14;
          }
        }
        id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (id)p_getGestureTarget:(id)a3
{
  id v4 = a3;
  v5 = [(CRLGestureDispatcher *)self interactiveCanvasController];
  id v6 = [v5 editorController];
  id v7 = [v6 textInputEditor];

  unsigned __int8 v14 = sub_100246AC8(v7, 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLGestureTarget);
  id v21 = sub_100246AC8(v5, 1, v15, v16, v17, v18, v19, v20, (uint64_t)&OBJC_PROTOCOL___CRLGestureTarget);
  if (v14 && (v22 = [v14 canHandleGesture:v4], double v23 = v14, (v22 & 1) != 0)
    || v21 && (v24 = [v21 canHandleGesture:v4], double v23 = v21, v24))
  {
    id v25 = v23;
  }
  else
  {
    id v25 = 0;
  }
  id v26 = v25;

  return v26;
}

- (BOOL)gestureActionShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = [(CRLGestureDispatcher *)self p_getGestureTarget:v4];
  if (v5)
  {
    [v4 setCachedGestureTarget:v5];
    unsigned __int8 v6 = 1;
  }
  else
  {
    id v7 = [v4 gestureKind];

    if (v7 == @"CRLWPUndefinedGestureKind")
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      uint64_t v9 = [WeakRetained layerHost];
      uint64_t v10 = [v9 asUIKitHost];
      uint64_t v17 = sub_100246AC8(v10, 1, v11, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);

      if (objc_opt_respondsToSelector()) {
        unsigned __int8 v6 = [v17 gestureActionShouldBegin:v4];
      }
      else {
        unsigned __int8 v6 = 0;
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (void)gestureRemovedFromView:(id)a3
{
  id v8 = a3;
  gesturesInFlight = self->_gesturesInFlight;
  if (gesturesInFlight)
  {
    uint64_t v5 = objc_opt_class();
    unsigned __int8 v6 = sub_1002469D0(v5, v8);
    id v7 = [(NSMutableArray *)gesturesInFlight indexOfObjectIdenticalTo:v6];

    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL) {
      [(CRLGestureDispatcher *)self p_gestureNoLongerInFlight:v8];
    }
  }
}

- (void)p_gestureNoLongerInFlight:(id)a3
{
  id v4 = a3;
  gesturesInFlight = self->_gesturesInFlight;
  uint64_t v6 = objc_opt_class();
  id v7 = sub_1002469D0(v6, v4);
  [(NSMutableArray *)gesturesInFlight removeObjectIdenticalTo:v7];

  if (![(NSMutableArray *)self->_gesturesInFlight count])
  {
    if ([(NSMutableArray *)self->_targetsInFlight count])
    {
      id v8 = [(CRLGestureDispatcher *)self interactiveCanvasController];
      uint64_t v9 = [v8 editingCoordinator];
      [v9 resumeCollaborationWithReason:@"CRLTextGesturesInFlight"];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v10 = self->_targetsInFlight;
      id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v33;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v32 + 1) + 8 * (void)v14) gestureSequenceDidEnd];
            uint64_t v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
        }
        while (v12);
      }

      [(NSMutableArray *)self->_targetsInFlight removeAllObjects];
    }
    uint64_t v15 = +[NSMutableSet set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v16 = [(CRLGestureDispatcher *)self firedGestures];
    id v17 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)v20) gestureKind];
          [v15 addObject:v21];

          uint64_t v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v18);
    }

    unsigned __int8 v22 = +[NSNotificationCenter defaultCenter];
    v36[0] = @"CRLTextGesturesICC";
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v37[0] = WeakRetained;
    v37[1] = v15;
    v36[1] = @"CRLTextGesturesDidEndNotificationFiredGestureKindsKey";
    v36[2] = @"CRLTextGesturesDidEndNotificationFiredGesturesKey";
    unsigned int v24 = [(CRLGestureDispatcher *)self firedGestures];
    v36[3] = @"CRLTextGesturesTerminated";
    v37[2] = v24;
    v37[3] = v4;
    id v25 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
    [v22 postNotificationName:@"CRLTextGesturesDidEndNotification" object:self userInfo:v25];

    id v26 = [(CRLGestureDispatcher *)self firedGestures];
    [v26 removeAllObjects];

    BOOL v27 = self->_gesturesInFlight;
    self->_gesturesInFlight = 0;
  }
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (CRLNoCopyDictionary)priorityMap
{
  return self->_priorityMap;
}

- (void)setPriorityMap:(id)a3
{
}

- (BOOL)runningTargetHandleGesture
{
  return self->_runningTargetHandleGesture;
}

- (void)setRunningTargetHandleGesture:(BOOL)a3
{
  self->_runningTargetHandleGesture = a3;
}

- (NSMutableSet)firedGestures
{
  return self->_firedGestures;
}

- (void)setFiredGestures:(id)a3
{
}

- (NSMutableArray)simultaneitySets
{
  return self->_simultaneitySets;
}

- (void)setSimultaneitySets:(id)a3
{
}

- (NSMutableArray)gesturesInFlight
{
  return self->_gesturesInFlight;
}

- (void)setGesturesInFlight:(id)a3
{
}

- (NSMutableArray)targetsInFlight
{
  return self->_targetsInFlight;
}

- (void)setTargetsInFlight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetsInFlight, 0);
  objc_storeStrong((id *)&self->_gesturesInFlight, 0);
  objc_storeStrong((id *)&self->_simultaneitySets, 0);
  objc_storeStrong((id *)&self->_firedGestures, 0);
  objc_storeStrong((id *)&self->_priorityMap, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end