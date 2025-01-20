@interface CRLiOSRepDragGestureRecognizer
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)allowUndoRedoOperations;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canDrag;
- (BOOL)i_beginGestureExternally;
- (BOOL)p_canBeginDrag;
- (BOOL)p_currentlyTransformingRepsAreDraggable;
- (BOOL)readyToEndOperation;
- (CGPoint)currentPosition;
- (CRLCanvasAutoscroll)autoscroll;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (CRLCanvasRepDragTracker)repDragTracker;
- (CRLInteractiveCanvasController)icc;
- (CRLiOSRepDragGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (CRLiOSRepDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)cancelBecauseOfRotation;
- (void)dealloc;
- (void)didRelinquishControl;
- (void)operationDidEnd;
- (void)p_beginConstraining;
- (void)p_beginGesture;
- (void)p_beginTracking;
- (void)p_cancelDelayedStartTracking;
- (void)p_createDelayCallback;
- (void)p_delayElapsed;
- (void)p_setTrackerPoints;
- (void)reset;
- (void)setAutoscroll:(id)a3;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateAfterAutoscroll:(id)a3;
@end

@implementation CRLiOSRepDragGestureRecognizer

- (CRLiOSRepDragGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  v5 = [(CRLiOSRepDragGestureRecognizer *)&v18 initWithTarget:0 action:0];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E79F0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101094924();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7A10);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer initWithInteractiveCanvasController:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 108, 0, "invalid nil value for '%{public}s'", "icc");
    }
    objc_storeWeak((id *)&v5->mICC, v4);
    v9 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    mOriginalPointsInWindow = v5->mOriginalPointsInWindow;
    v5->mOriginalPointsInWindow = v9;

    v11 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    mOriginalTimestamps = v5->mOriginalTimestamps;
    v5->mOriginalTimestamps = v11;

    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mTouchesDownOnReps = v5->mTouchesDownOnReps;
    v5->mTouchesDownOnReps = v13;

    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mTouchesDownOnCanvas = v5->mTouchesDownOnCanvas;
    v5->mTouchesDownOnCanvas = v15;

    v5->mDragState = 0;
  }

  return v5;
}

- (CRLiOSRepDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v4 = a3;
  unsigned int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E7A30);
  }
  v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v15 = v5;
    __int16 v16 = 2082;
    v17 = "-[CRLiOSRepDragGestureRecognizer initWithTarget:action:]";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m";
    __int16 v20 = 1024;
    int v21 = 122;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E7A50);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v15 = v5;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer initWithTarget:action:]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"];
  +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:122 isFatal:0 description:"Do not call method"];

  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLiOSRepDragGestureRecognizer initWithTarget:action:]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)dealloc
{
  [(CRLiOSRepDragGestureRecognizer *)self p_cancelDelayedStartTracking];
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  [(CRLiOSRepDragGestureRecognizer *)&v3 dealloc];
}

- (void)reset
{
  if (qword_101719CB8 != -1) {
    dispatch_once(&qword_101719CB8, &stru_1014E7A70);
  }
  objc_super v3 = off_10166D380;
  if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
    sub_101094A5C(v3, self);
  }
  v21.receiver = self;
  v21.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  [(CRLiOSRepDragGestureRecognizer *)&v21 reset];
  [(CRLiOSRepDragGestureRecognizer *)self p_cancelDelayedStartTracking];
  mConstrainingTimer = self->mConstrainingTimer;
  if (mConstrainingTimer)
  {
    [(NSTimer *)mConstrainingTimer invalidate];
    unsigned int v5 = self->mConstrainingTimer;
    self->mConstrainingTimer = 0;
  }
  v6 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  v7 = [v6 tmCoordinator];
  v8 = [v7 controllingTM];

  if (v8 == self)
  {
    v9 = [v6 tmCoordinator];
    [v9 relinquishTrackerManipulatorControl:self];
  }
  mTracker = self->mTracker;
  if (mTracker)
  {
    [(CRLCanvasRepDragTracker *)mTracker endPossibleRepDragGesture];
    v11 = [v6 dynamicOperationController];
    [(CRLiOSRepDragGestureRecognizer *)self removeTarget:v11 action:"handleGestureRecognizer:"];

    v12 = [v6 tmCoordinator];
    [v12 unregisterTrackerManipulator:self];

    id v13 = self->mTracker;
    self->mTracker = 0;
  }
  mAutoscroll = self->mAutoscroll;
  if (mAutoscroll) {
    [(CRLCanvasAutoscroll *)mAutoscroll invalidate];
  }
  mTouch = self->mTouch;
  self->mTouch = 0;

  mRep = self->mRep;
  self->mRep = 0;

  self->mPassedDragThreshold = 0;
  self->mDragDelayElapsed = 0;
  self->mTouchDelta = CGPointZero;
  self->mEndedWithNudgeInControl = 0;
  self->mPossibleContentionWithSystemDrag = 0;
  self->mDragState = 0;
  if (self->mShouldCloseCommandGroupWhenOperationCompletes)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7A90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010949D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7AB0);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    __int16 v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer reset]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:170 isFatal:0 description:"Should close group before resetting"];

    __int16 v20 = [v6 commandController];
    [v20 closeGroup];

    self->mShouldCloseCommandGroupWhenOperationCompletes = 0;
  }
  [(NSMutableSet *)self->mTouchesDownOnReps removeAllObjects];
  [(NSMutableSet *)self->mTouchesDownOnCanvas removeAllObjects];
  self->mShouldConstrainDueToAdditionalTouches = 0;
}

- (void)setState:(int64_t)a3
{
  if ([(CRLiOSRepDragGestureRecognizer *)self state] != (id)a3)
  {
    if (qword_101719CB8 != -1) {
      dispatch_once(&qword_101719CB8, &stru_1014E7AD0);
    }
    unsigned int v5 = off_10166D380;
    if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
      sub_101094B7C(a3, v5);
    }
    v6 = [(CRLiOSRepDragGestureRecognizer *)self icc];
    v7 = [v6 tmCoordinator];

    if (a3 == 3)
    {
      v8 = [v7 controllingTM];

      if (v8 != self)
      {
        if (([v7 takeControlWithTrackerManipulator:self] & 1) == 0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E7AF0);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_101094AF4();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E7B10);
          }
          v9 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v9);
          }
          v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer setState:]");
          v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"];
          +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:186 isFatal:0 description:"drag failed to take control!"];
        }
        self->mEndedWithNudgeInControl = 1;
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  [(CRLiOSRepDragGestureRecognizer *)&v12 setState:a3];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v115.receiver = self;
  v115.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  [(CRLiOSRepDragGestureRecognizer *)&v115 touchesBegan:v6 withEvent:a4];
  if (qword_101719CB8 != -1) {
    dispatch_once(&qword_101719CB8, &stru_1014E7B30);
  }
  v7 = off_10166D380;
  if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
    sub_101094CC4(v7, v6);
  }
  v8 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  v9 = [v8 layerHost];
  v10 = [v9 asUIKitHost];

  if (!-[CRLiOSRepDragGestureRecognizer state](self, "state") && [v8 currentlyScrolling])
  {
    if (qword_101719CB8 != -1) {
      dispatch_once(&qword_101719CB8, &stru_1014E7B50);
    }
    if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
      sub_101094C28();
    }
    [(CRLiOSRepDragGestureRecognizer *)self setState:5];
    goto LABEL_106;
  }
  v102 = v10;
  v100 = v8;
  v11 = [v8 tmCoordinator];
  v105 = self;
  [v11 registerTrackerManipulator:self];

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v97 = v6;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v111 objects:v123 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v112;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v112 != v14) {
          objc_enumerationMutation(obj);
        }
        __int16 v16 = *(void **)(*((void *)&v111 + 1) + 8 * i);
        mOriginalPointsInWindow = v105->mOriginalPointsInWindow;
        __int16 v18 = [v16 window];
        [v16 locationInView:v18];
        v19 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
        [(NSMapTable *)mOriginalPointsInWindow setObject:v19 forKey:v16];

        mOriginalTimestamps = v105->mOriginalTimestamps;
        [v16 timestamp];
        objc_super v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(NSMapTable *)mOriginalTimestamps setObject:v21 forKey:v16];
      }
      id v13 = [obj countByEnumeratingWithState:&v111 objects:v123 count:16];
    }
    while (v13);
  }

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obja = obj;
  id v22 = [obja countByEnumeratingWithState:&v107 objects:v122 count:16];
  v24 = v105;
  v8 = v100;
  v10 = v102;
  if (v22)
  {
    id v25 = v22;
    uint64_t v26 = *(void *)v108;
    *(void *)&long long v23 = 67109378;
    long long v95 = v23;
    uint64_t v101 = *(void *)v108;
    do
    {
      v27 = 0;
      id v99 = v25;
      do
      {
        if (*(void *)v108 != v26) {
          objc_enumerationMutation(obja);
        }
        v28 = *(void **)(*((void *)&v107 + 1) + 8 * (void)v27);
        if ([(CRLiOSRepDragGestureRecognizer *)v24 state])
        {
          v29 = [v10 hitRepWithTouch:v28];
          v30 = [v29 repForDragging];

          if (!v30
            || ([v10 multiSelectGestureRecognizer],
                v31 = objc_claimAutoreleasedReturnValue(),
                id v32 = [v31 state],
                v31,
                BOOL v33 = v32 == (id)5,
                v10 = v102,
                v33))
          {
            [(NSMutableSet *)v24->mTouchesDownOnCanvas addObject:v28];
            if (!v24->mConstrainingTimer)
            {
              if ([(NSMutableSet *)v24->mTouchesDownOnReps count] == (id)1)
              {
                mTouch = v105->mTouch;
                v35 = [v8 canvasView];
                [(UITouch *)mTouch locationInView:v35];
                [v8 convertBoundsToUnscaledPoint:];
                v105->mOnlyTouchDownLocation.x = v36;
                v105->mOnlyTouchDownLocation.y = v37;
                v24 = v105;

                v105->mPassedDragThreshold = 0;
              }
              uint64_t v38 = +[NSTimer scheduledTimerWithTimeInterval:v24 target:"p_beginConstraining" selector:0 userInfo:0 repeats:0.2];
              mConstrainingTimer = v24->mConstrainingTimer;
              v24->mConstrainingTimer = (NSTimer *)v38;
            }
          }
          else
          {
            [(NSMutableSet *)v24->mTouchesDownOnReps addObject:v28];
          }
        }
        else
        {
          p_mTouch = (id *)&v24->mTouch;
          if (v24->mTouch)
          {
            v41 = [v10 hitRepWithTouch:v28];
            v42 = [v41 repForDragging];

            if (v42)
            {
              if (v24->mRep == v42)
              {
                [(CRLiOSRepDragGestureRecognizer *)v24 setState:5];

                goto LABEL_91;
              }
              v43 = [v10 multiSelectGestureRecognizer];
              id v44 = [v43 state];

              if (v44 == (id)5)
              {
                [(NSMutableSet *)v24->mTouchesDownOnCanvas addObject:v28];
                v10 = v102;
                if (!v24->mConstrainingTimer)
                {
LABEL_44:
                  if ([(NSMutableSet *)v24->mTouchesDownOnReps count] == (id)1)
                  {
                    id v60 = *p_mTouch;
                    v61 = [v8 canvasView];
                    [v60 locationInView:v61];
                    [v8 convertBoundsToUnscaledPoint:];
                    v105->mOnlyTouchDownLocation.x = v62;
                    v105->mOnlyTouchDownLocation.y = v63;
                    v24 = v105;

                    v105->mPassedDragThreshold = 0;
                  }
                  uint64_t v64 = +[NSTimer scheduledTimerWithTimeInterval:v24 target:"p_beginConstraining" selector:0 userInfo:0 repeats:0.2];
                  v65 = v24->mConstrainingTimer;
                  v24->mConstrainingTimer = (NSTimer *)v64;
                }
              }
              else
              {
                [(NSMutableSet *)v24->mTouchesDownOnReps addObject:v28];
                v24->mPassedDragThreshold = 0;
                v10 = v102;
              }
            }
            else
            {
              [(NSMutableSet *)v24->mTouchesDownOnCanvas addObject:v28];
              if (!v24->mConstrainingTimer) {
                goto LABEL_44;
              }
            }

LABEL_50:
            uint64_t v26 = v101;
            goto LABEL_51;
          }
          objc_storeStrong((id *)&v24->mTouch, v28);
          v45 = v8;
          p_x = &v24->mOnlyTouchDownLocation.x;
          id v47 = *p_mTouch;
          v48 = [v45 canvasView];
          [v47 locationInView:v48];
          [v45 convertBoundsToUnscaledPoint:];
          v24->mOnlyTouchDownLocation.x = v49;
          v24->mOnlyTouchDownLocation.y = v50;

          BOOL v51 = sub_10036FEA4((BOOL)[*p_mTouch type]);
          if ([*p_mTouch tapCount] != (id)1)
          {
            [(CRLiOSRepDragGestureRecognizer *)v24 setState:5];
            v8 = v45;
            goto LABEL_50;
          }
          id v52 = *p_mTouch;
          uint64_t v53 = [v45 canvasView];
          [v52 locationInView:v53];
          [v45 convertBoundsToUnscaledPoint:];
          double v55 = v54;
          double v57 = v56;

          v58 = [v45 freehandDrawingToolkit];
          LOBYTE(v53) = [v58 currentToolAllowsDragForTouchType:[*p_mTouch type] atUnscaledPoint:v55 v57];

          if ((v53 & 1) == 0)
          {
            if (qword_101719CB8 != -1) {
              dispatch_once(&qword_101719CB8, &stru_1014E7B70);
            }
            id v6 = v97;
            v8 = v100;
            v10 = v102;
            if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
              sub_101094C90();
            }
            [(CRLiOSRepDragGestureRecognizer *)v24 setState:5];
            goto LABEL_105;
          }
          BOOL v59 = [*p_mTouch type] == (id)2 || [*p_mTouch type] == (id)3;
          uint64_t v66 = [v100 hitRep:v59 withPrecision:*p_x v24->mOnlyTouchDownLocation.y];
          v67 = (void *)v66;
          if (v59 && !v66)
          {
            v67 = [v100 hitRep:0 withPrecision:*p_x v24->mOnlyTouchDownLocation.y];
          }
          uint64_t v68 = [v67 repForDragging];
          mRep = v24->mRep;
          v24->mRep = (CRLCanvasRep *)v68;

          v70 = v67;
          v71 = [v67 repForSelecting];
          v72 = v24->mRep;

          if (v71 != v72)
          {
            if (qword_101719CB8 != -1) {
              dispatch_once(&qword_101719CB8, &stru_1014E7B90);
            }
            id v6 = v97;
            v8 = v100;
            v10 = v102;
            if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
              sub_101094C5C();
            }
            [(CRLiOSRepDragGestureRecognizer *)v24 setState:5];

LABEL_105:
            goto LABEL_106;
          }
          id v106 = 0;
          v73 = [v100 hitKnobAtPoint:v51 inputType:&v106 returningRep:*p_x v24->mOnlyTouchDownLocation.y];
          id v74 = v106;
          v75 = v24->mRep;
          if (!v75 || v73)
          {
            [(CRLiOSRepDragGestureRecognizer *)v24 setState:5];
            v8 = v100;
            uint64_t v26 = v101;
            v81 = v70;
            id v25 = v99;
          }
          else
          {
            -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](v75, "convertNaturalPointFromUnscaledCanvas:", *p_x, v24->mOnlyTouchDownLocation.y);
            -[CRLCanvasRep hitRepChrome:passingTest:](v75, "hitRepChrome:passingTest:", 0);
            v98 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue();
            v24->mHitRepChrome = v24->mRep == v98;
            [(NSMutableSet *)v24->mTouchesDownOnReps addObject:v28];
            v24->int64_t mDragType = -[CRLCanvasRep dragTypeAtCanvasPoint:forTouchType:](v24->mRep, "dragTypeAtCanvasPoint:forTouchType:", [*p_mTouch type], *p_x, v24->mOnlyTouchDownLocation.y);
            v76 = v24->mRep;
            v8 = v100;
            v77 = [v100 canvasView];
            [v28 locationInView:v77];
            [v100 convertBoundsToUnscaledPoint:];
            v24->mHUDAndGuidesType = -[CRLCanvasRep dragHUDAndGuidesTypeAtCanvasPoint:](v76, "dragHUDAndGuidesTypeAtCanvasPoint:");

            v24->mDragState = 1;
            uint64_t v78 = objc_opt_class();
            v79 = [(CRLCanvasRep *)v24->mRep info];
            v80 = sub_1002469D0(v78, v79);

            v81 = v70;
            id v25 = v99;
            if ([v80 allowedToBeDragAndDropped])
            {
              v82 = [v100 canvasEditor];
              if ([v82 canvasEditorCanCopyWithSender:0])
              {
                unsigned __int8 v83 = +[UIDevice crl_phoneDevice];

                if ((v83 & 1) == 0) {
                  v24->mPossibleContentionWithSystemDrag = 1;
                }
              }
              else
              {
              }
            }
            if (!v24->mHUDAndGuidesType && v24->mDragType)
            {
              unsigned int v84 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E7BB0);
              }
              v85 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v117 = v84;
                *(_WORD *)&v117[4] = 2082;
                *(void *)&v117[6] = "-[CRLiOSRepDragGestureRecognizer touchesBegan:withEvent:]";
                __int16 v118 = 2082;
                v119 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m";
                __int16 v120 = 1024;
                int v121 = 281;
                _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d attempted to not show HUD and guides during a drag", buf, 0x22u);
              }
              unsigned int v86 = v84;
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E7BD0);
              }
              v96 = v80;
              v87 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                v92 = v87;
                v93 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = v95;
                *(_DWORD *)v117 = v86;
                *(_WORD *)&v117[4] = 2114;
                *(void *)&v117[6] = v93;
                _os_log_error_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              v88 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer touchesBegan:withEvent:]");
              v89 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"];
              +[CRLAssertionHandler handleFailureInFunction:v88 file:v89 lineNumber:281 isFatal:0 description:"attempted to not show HUD and guides during a drag"];

              v80 = v96;
            }
            if (qword_101719CB8 != -1) {
              dispatch_once(&qword_101719CB8, &stru_1014E7BF0);
            }
            v90 = off_10166D380;
            if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG))
            {
              int64_t mDragType = v24->mDragType;
              *(_DWORD *)buf = 134217984;
              *(void *)v117 = mDragType;
              _os_log_debug_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEBUG, "drag type %li", buf, 0xCu);
            }
            uint64_t v26 = v101;
            switch(v24->mDragType)
            {
              case 0:
                [(CRLiOSRepDragGestureRecognizer *)v24 setState:5];
                break;
              case 1:
              case 2:
              case 3:
                [(CRLiOSRepDragGestureRecognizer *)v24 p_createDelayCallback];
                break;
              default:
                break;
            }
            if (v24->mHUDAndGuidesType == 1) {
              [(CRLiOSRepDragGestureRecognizer *)v24 p_beginTracking];
            }
          }
          v10 = v102;
        }
LABEL_51:
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v94 = [obja countByEnumeratingWithState:&v107 objects:v122 count:16];
      id v25 = v94;
    }
    while (v94);
  }
LABEL_91:

  id v6 = v97;
  if (v24->mTracker && v24->mTouch && [(CRLiOSRepDragGestureRecognizer *)v24 state] != (id)5) {
    [(CRLiOSRepDragGestureRecognizer *)v24 p_setTrackerPoints];
  }
LABEL_106:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v92.receiver = self;
  v92.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  [(CRLiOSRepDragGestureRecognizer *)&v92 touchesMoved:v6 withEvent:a4];
  v7 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  if ([v6 containsObject:self->mTouch])
  {
    v8 = (char *)[(CRLiOSRepDragGestureRecognizer *)self state];
    if ((unint64_t)(v8 - 1) >= 2)
    {
      if (!v8)
      {
        int64_t mDragType = self->mDragType;
        [(UITouch *)self->mTouch timestamp];
        double v29 = v28;
        v30 = [(NSMapTable *)self->mOriginalTimestamps objectForKey:self->mTouch];
        [v30 doubleValue];
        double v32 = v29 - v31;
        UITouchType v33 = [(UITouch *)self->mTouch type];
        BOOL v36 = v32 < 0.02 && v33 == UITouchTypeDirect || v33 == UITouchTypeIndirectPointer;
        if (mDragType == 3 && v36)
        {
          double v37 = 0.05;
        }
        else
        {
          float v38 = v32;
          double v37 = (fminf(fmaxf(v38, 0.0), 2.0) * 1.25 * 0.5 + 0.25) * 14.0;
        }

        v39 = [(NSMapTable *)self->mOriginalTimestamps objectForKeyedSubscript:self->mTouch];
        [(UITouch *)self->mTouch timestamp];
        double v41 = v40;
        [v39 doubleValue];
        double v43 = v41 - v42;
        if (!self->mPossibleContentionWithSystemDrag || (v43 < 3.0 ? (BOOL v44 = v43 <= 0.7) : (BOOL v44 = 1), v44))
        {
          v45 = [(NSMapTable *)self->mOriginalPointsInWindow objectForKey:self->mTouch];
          [v45 CGPointValue];
          double v47 = v46;
          double v49 = v48;
          mTouch = self->mTouch;
          BOOL v51 = [(UITouch *)mTouch window];
          [(UITouch *)mTouch locationInView:v51];
          self->BOOL mPassedDragThreshold = sub_1000653B4(v47, v49, v52, v53) >= v37;

          if (qword_101719CB8 != -1) {
            dispatch_once(&qword_101719CB8, &stru_1014E7C10);
          }
          double v54 = off_10166D380;
          if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG))
          {
            BOOL mPassedDragThreshold = self->mPassedDragThreshold;
            mOriginalPointsInWindow = self->mOriginalPointsInWindow;
            double v56 = self->mTouch;
            double v57 = v54;
            v58 = [(NSMapTable *)mOriginalPointsInWindow objectForKey:v56];
            [v58 CGPointValue];
            double v60 = v59;
            double v62 = v61;
            CGFloat v63 = self->mTouch;
            uint64_t v64 = [(UITouch *)v63 window];
            [(UITouch *)v63 locationInView:v64];
            double v67 = sub_1000653B4(v60, v62, v65, v66);
            UITouchType v68 = [(UITouch *)self->mTouch type];
            BOOL v71 = v43 < 0.02 && v68 == UITouchTypeDirect || v68 == UITouchTypeIndirectPointer;
            if (mDragType == 3 && v71)
            {
              double v72 = 0.05;
            }
            else
            {
              float v86 = v43;
              double v72 = (fminf(fmaxf(v86, 0.0), 2.0) * 1.25 * 0.5 + 0.25) * 14.0;
            }
            *(_DWORD *)buf = 67109632;
            BOOL v95 = mPassedDragThreshold;
            __int16 v96 = 2048;
            double v97 = v67;
            __int16 v98 = 2048;
            double v99 = v72;
            _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "passed drag threshold: %i (%f >= %f?)", buf, 0x1Cu);
          }
        }
        else
        {
          if (qword_101719CB8 != -1) {
            dispatch_once(&qword_101719CB8, &stru_1014E7C30);
          }
          if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
            sub_101094D4C();
          }
        }

        if ([(CRLiOSRepDragGestureRecognizer *)self p_canBeginDrag])
        {
          if (!self->mDragDelayElapsed) {
            [(CRLiOSRepDragGestureRecognizer *)self p_cancelDelayedStartTracking];
          }
          [(CRLiOSRepDragGestureRecognizer *)self p_beginGesture];
        }
      }
    }
    else if ([(NSMutableSet *)self->mTouchesDownOnReps count] == (id)1)
    {
      if (self->mPassedDragThreshold) {
        goto LABEL_74;
      }
      [(CRLiOSRepDragGestureRecognizer *)self currentPosition];
      double v11 = sub_1000653B4(self->mOnlyTouchDownLocation.x, self->mOnlyTouchDownLocation.y, v9, v10);
      [(UITouch *)self->mTouch timestamp];
      double v13 = v12;
      uint64_t v14 = [(NSMapTable *)self->mOriginalTimestamps objectForKey:self->mTouch];
      [v14 doubleValue];
      double v16 = v13 - v15;
      [(UITouch *)self->mTouch type];
      float v17 = v16;
      self->BOOL mPassedDragThreshold = v11 >= 14.0 * (fminf(fmaxf(v17, 0.0), 2.0) * 1.25 * 0.5 + 0.25);

      if (self->mPassedDragThreshold)
      {
LABEL_74:
        if ([(CRLCanvasRepDragTracker *)self->mTracker didBeginDrag])
        {
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          __int16 v18 = [v7 dynamicOperationController];
          v19 = [v18 currentlyTransformingReps];

          id v20 = [v19 countByEnumeratingWithState:&v88 objects:v93 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v89;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v89 != v22) {
                  objc_enumerationMutation(v19);
                }
                [*(id *)(*((void *)&v88 + 1) + 8 * i) fadeKnobsOut];
              }
              id v21 = [v19 countByEnumeratingWithState:&v88 objects:v93 count:16];
            }
            while (v21);
          }

          v24 = [v7 tmCoordinator];
          [v24 takeControlWithTrackerManipulator:self];

          mConstrainingTimer = self->mConstrainingTimer;
          if (mConstrainingTimer)
          {
            [(NSTimer *)mConstrainingTimer invalidate];
            uint64_t v26 = self->mConstrainingTimer;
            self->mConstrainingTimer = 0;

            [(CRLiOSRepDragGestureRecognizer *)self p_beginConstraining];
          }
        }
      }
      [(CRLiOSRepDragGestureRecognizer *)self setState:2];
      [(CRLiOSRepDragGestureRecognizer *)self currentPosition];
      +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self);
    }
    else
    {
      self->BOOL mPassedDragThreshold = 0;
    }
    v73 = [v7 canvasView];
    if (self->mTracker && self->mPassedDragThreshold)
    {
      [(UITouch *)self->mTouch locationInView:v73];
      double v75 = v74;
      double v77 = v76;
      [(UITouch *)self->mTouch previousLocationInView:v73];
      [v7 convertBoundsToUnscaledPoint:sub_100064680(v75, v77, v78)];
      -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](self->mTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 1);
    }
    else
    {
      [(UITouch *)self->mTouch locationInView:v73];
      double v80 = v79;
      double v82 = v81;
      [(UITouch *)self->mTouch previousLocationInView:v73];
      double v84 = sub_100064680(v80, v82, v83);
      self->mTouchDelta.x = sub_100064698(self->mTouchDelta.x, self->mTouchDelta.y, v84);
      self->mTouchDelta.y = v85;
    }
  }
  if (self->mTracker) {
    [(CRLiOSRepDragGestureRecognizer *)self p_setTrackerPoints];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_101719CB8 != -1) {
    dispatch_once(&qword_101719CB8, &stru_1014E7C50);
  }
  v8 = off_10166D380;
  if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
    sub_101094E18(v8, v6);
  }
  v70.receiver = self;
  v70.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  -[CRLiOSRepDragGestureRecognizer touchesEnded:withEvent:](&v70, "touchesEnded:withEvent:", v6, v7, v7);
  double v57 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v10)
  {
    id v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v67;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        if ([(NSMutableSet *)self->mTouchesDownOnReps containsObject:v15])
        {
          [(NSMutableSet *)self->mTouchesDownOnReps removeObject:v15];
          char v12 = 1;
        }
        else if ([(NSMutableSet *)self->mTouchesDownOnCanvas containsObject:v15])
        {
          [(NSMutableSet *)self->mTouchesDownOnCanvas removeObject:v15];
          if (![(NSMutableSet *)self->mTouchesDownOnCanvas count])
          {
            self->mShouldConstrainDueToAdditionalTouches = 0;
            mConstrainingTimer = self->mConstrainingTimer;
            if (mConstrainingTimer)
            {
              [(NSTimer *)mConstrainingTimer invalidate];
              float v17 = self->mConstrainingTimer;
              self->mConstrainingTimer = 0;
            }
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v11);
  }
  else
  {
    char v12 = 0;
  }

  id v18 = [(NSMutableSet *)self->mTouchesDownOnReps count];
  mTouchesDownOnReps = self->mTouchesDownOnReps;
  if (v18 == (id)1 && (v12 & 1) != 0)
  {
    id v20 = [(NSMutableSet *)mTouchesDownOnReps anyObject];
    mTouch = self->mTouch;
    self->mTouch = v20;

    uint64_t v22 = self->mTouch;
    long long v23 = [v57 canvasView];
    [(UITouch *)v22 locationInView:v23];
    [v57 convertBoundsToUnscaledPoint:];
    self->mOnlyTouchDownLocation.x = v24;
    self->mOnlyTouchDownLocation.y = v25;

    self->BOOL mPassedDragThreshold = 0;
    uint64_t v26 = v56;
  }
  else
  {
    uint64_t v26 = v56;
    if (![(NSMutableSet *)mTouchesDownOnReps count])
    {
      v27 = (char *)[(CRLiOSRepDragGestureRecognizer *)self state];
      if ((unint64_t)(v27 - 1) >= 2)
      {
        if (!v27)
        {
          if (!self->mPassedDragThreshold)
          {
            [(CRLiOSRepDragGestureRecognizer *)self currentPosition];
            double v40 = sub_1000653B4(self->mOnlyTouchDownLocation.x, self->mOnlyTouchDownLocation.y, v38, v39);
            [(UITouch *)self->mTouch timestamp];
            double v42 = v41;
            double v43 = [(NSMapTable *)self->mOriginalTimestamps objectForKey:self->mTouch];
            [v43 doubleValue];
            double v45 = v42 - v44;
            [(UITouch *)self->mTouch type];
            float v46 = v45;
            self->BOOL mPassedDragThreshold = v40 >= 14.0 * (fminf(fmaxf(v46, 0.0), 2.0) * 1.25 * 0.5 + 0.25) * 3.0;
          }
          if ([(CRLiOSRepDragGestureRecognizer *)self p_canBeginDrag])
          {
            [(CRLiOSRepDragGestureRecognizer *)self p_beginGesture];
            double v47 = self;
            uint64_t v48 = 3;
          }
          else
          {
            double v47 = self;
            uint64_t v48 = 5;
          }
          [(CRLiOSRepDragGestureRecognizer *)v47 setState:v48];
        }
      }
      else
      {
        [(CRLiOSRepDragGestureRecognizer *)self setState:3];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        double v28 = [v57 dynamicOperationController];
        double v29 = [v28 currentlyTransformingReps];

        id v30 = [v29 countByEnumeratingWithState:&v62 objects:v72 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v63;
          do
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v63 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
              [v34 fadeKnobsIn];
              [v34 setShowKnobsDuringManipulation:0];
            }
            id v31 = [v29 countByEnumeratingWithState:&v62 objects:v72 count:16];
          }
          while (v31);
        }

        if ((v12 & 1) != 0 && self->mPassedDragThreshold)
        {
          v35 = [v57 canvasEditor];
          char v36 = objc_opt_respondsToSelector();

          if (v36)
          {
            double v37 = [v57 canvasEditor];
            [v37 hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected];
          }
        }
      }
      if (qword_101719CB8 != -1) {
        dispatch_once(&qword_101719CB8, &stru_1014E7C70);
      }
      double v49 = off_10166D380;
      if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
        sub_101094D80(v49, self);
      }
    }
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v50 = v9;
  id v51 = [v50 countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v59;
    do
    {
      for (k = 0; k != v52; k = (char *)k + 1)
      {
        if (*(void *)v59 != v53) {
          objc_enumerationMutation(v50);
        }
        uint64_t v55 = *(void *)(*((void *)&v58 + 1) + 8 * (void)k);
        [(NSMapTable *)self->mOriginalPointsInWindow removeObjectForKey:v55];
        [(NSMapTable *)self->mOriginalTimestamps removeObjectForKey:v55];
      }
      id v52 = [v50 countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v52);
  }

  if (self->mTracker) {
    [(CRLiOSRepDragGestureRecognizer *)self p_setTrackerPoints];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  [(CRLiOSRepDragGestureRecognizer *)&v35 touchesCancelled:v6 withEvent:a4];
  uint64_t v26 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if ([(NSMutableSet *)self->mTouchesDownOnReps containsObject:v12])
        {
          [(NSMutableSet *)self->mTouchesDownOnReps removeObject:v12];
          if ([(NSMutableSet *)self->mTouchesDownOnReps count]) {
            continue;
          }
          uint64_t v13 = (char *)[(CRLiOSRepDragGestureRecognizer *)self state];
          if ((unint64_t)(v13 - 1) < 2)
          {
            uint64_t v14 = self;
            uint64_t v15 = 4;
LABEL_18:
            [(CRLiOSRepDragGestureRecognizer *)v14 setState:v15];
            continue;
          }
          if (v13)
          {
            uint64_t v14 = self;
            uint64_t v15 = 5;
            goto LABEL_18;
          }
          [(CRLiOSRepDragGestureRecognizer *)self setState:5];
          mTracker = self->mTracker;
          if (mTracker)
          {
            [(CRLCanvasRepDragTracker *)mTracker endPossibleRepDragGesture];
            v19 = [v26 dynamicOperationController];
            [(CRLiOSRepDragGestureRecognizer *)self removeTarget:v19 action:"handleGestureRecognizer:"];

            float v17 = self->mTracker;
          }
          else
          {
            float v17 = 0;
          }
          self->mTracker = 0;
          goto LABEL_21;
        }
        if ([(NSMutableSet *)self->mTouchesDownOnCanvas containsObject:v12])
        {
          [(NSMutableSet *)self->mTouchesDownOnCanvas removeObject:v12];
          if (![(NSMutableSet *)self->mTouchesDownOnCanvas count])
          {
            self->mShouldConstrainDueToAdditionalTouches = 0;
            mConstrainingTimer = self->mConstrainingTimer;
            if (mConstrainingTimer)
            {
              [(NSTimer *)mConstrainingTimer invalidate];
              float v17 = self->mConstrainingTimer;
              self->mConstrainingTimer = 0;
LABEL_21:

              continue;
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v9);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v7;
  id v21 = [v20 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v27 + 1) + 8 * (void)j);
        [(NSMapTable *)self->mOriginalPointsInWindow removeObjectForKey:v25];
        [(NSMapTable *)self->mOriginalTimestamps removeObjectForKey:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v22);
  }
}

- (CGPoint)currentPosition
{
  objc_super v3 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  mTouch = self->mTouch;
  unsigned int v5 = [v3 canvasView];
  [(UITouch *)mTouch locationInView:v5];
  [v3 convertBoundsToUnscaledPoint:];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)canDrag
{
  if (!self->mPassedDragThreshold || [(NSMutableSet *)self->mTouchesDownOnReps count] != (id)1) {
    return 0;
  }
  objc_super v3 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  id v4 = [v3 dynamicOperationController];
  unsigned int v5 = [v4 currentlyTransformingReps];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (void)cancelBecauseOfRotation
{
  if (self->mTracker || [(NSMutableSet *)self->mTouchesDownOnReps count])
  {
    [(CRLiOSRepDragGestureRecognizer *)self setState:5];
    id v4 = [(CRLiOSRepDragGestureRecognizer *)self icc];
    objc_super v3 = [v4 tmCoordinator];
    [v3 takeControlWithTrackerManipulator:self];
  }
}

- (void)didRelinquishControl
{
  mConstrainingTimer = self->mConstrainingTimer;
  if (mConstrainingTimer)
  {
    [(NSTimer *)mConstrainingTimer invalidate];
    id v4 = self->mConstrainingTimer;
    self->mConstrainingTimer = 0;
  }
  if ([(NSMutableSet *)self->mTouchesDownOnReps count] == (id)1)
  {
    mTouch = self->mTouch;
    BOOL v6 = [(NSMutableSet *)self->mTouchesDownOnReps anyObject];

    if (mTouch != v6)
    {
      double v7 = [(NSMutableSet *)self->mTouchesDownOnReps anyObject];
      double v8 = self->mTouch;
      self->mTouch = v7;
    }
    id v13 = [(CRLiOSRepDragGestureRecognizer *)self icc];
    double v9 = self->mTouch;
    double v10 = [v13 canvasView];
    [(UITouch *)v9 locationInView:v10];
    [v13 convertBoundsToUnscaledPoint:];
    self->mOnlyTouchDownLocation.x = v11;
    self->mOnlyTouchDownLocation.y = v12;

    self->BOOL mPassedDragThreshold = 0;
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  BOOL v6 = [v5 layerHost];
  double v7 = [v6 asUIKitHost];

  if (!v4) {
    goto LABEL_13;
  }
  double v8 = [v7 multiSelectGestureRecognizer];
  if ([v8 state] == (id)2)
  {
    id v9 = [v7 knobDragGestureRecognizer];

    if (v9 == v4) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v10 = [v7 knobDragGestureRecognizer];
  if (v10 == v4)
  {
    BOOL mHitRepChrome = self->mHitRepChrome;

    if (mHitRepChrome)
    {
LABEL_15:
      BOOL v13 = 0;
      goto LABEL_18;
    }
  }
  else
  {
  }
  if ([(CRLiOSRepDragGestureRecognizer *)self state] == (id)3)
  {
    id v11 = [v7 nudgeGestureRecognizer];

    if (v11 == v4) {
      goto LABEL_15;
    }
  }
  if ([(CRLiOSRepDragGestureRecognizer *)self state] == (id)2)
  {
    id v12 = [v7 nudgeGestureRecognizer];
    if (v12 == v4)
    {
      BOOL v13 = !self->mShouldConstrainDueToAdditionalTouches;
      id v12 = v4;
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
LABEL_13:
    BOOL v13 = 1;
  }
LABEL_18:

  return v13;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->mTracker;
}

- (BOOL)readyToEndOperation
{
  return [(CRLiOSRepDragGestureRecognizer *)self state] == (id)3;
}

- (void)operationDidEnd
{
  mTracker = self->mTracker;
  if (mTracker)
  {
    [(CRLCanvasRepDragTracker *)mTracker endPossibleRepDragGesture];
    id v4 = [(CRLiOSRepDragGestureRecognizer *)self icc];
    unsigned int v5 = [v4 dynamicOperationController];
    [(CRLiOSRepDragGestureRecognizer *)self removeTarget:v5 action:"handleGestureRecognizer:"];

    BOOL v6 = self->mTracker;
    self->mTracker = 0;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v7 = [v4 dynamicOperationController];
    double v8 = [v7 currentlyTransformingReps];

    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v13 fadeKnobsIn];
          [v13 setShowKnobsDuringManipulation:0];
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    if (self->mShouldCloseCommandGroupWhenOperationCompletes)
    {
      uint64_t v14 = [v4 commandController];
      [v14 closeGroup];

      self->mShouldCloseCommandGroupWhenOperationCompletes = 0;
    }
  }
}

- (BOOL)allowUndoRedoOperations
{
  return [(CRLiOSRepDragGestureRecognizer *)self state] == (id)3;
}

- (CRLInteractiveCanvasController)icc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void)updateAfterAutoscroll:(id)a3
{
  if (self->mTouch)
  {
    [a3 lastAutoscrollDelta];
    -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](self->mTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 1);
    [(CRLiOSRepDragGestureRecognizer *)self p_setTrackerPoints];
    [(CRLiOSRepDragGestureRecognizer *)self setState:2];
  }
}

- (BOOL)p_canBeginDrag
{
  objc_super v3 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  unsigned __int8 v4 = [v3 isInDynamicOperation];

  if (v4) {
    goto LABEL_2;
  }
  BOOL v5 = [(CRLiOSRepDragGestureRecognizer *)self p_currentlyTransformingRepsAreDraggable];
  if (!v5) {
    return v5;
  }
  int64_t mDragType = self->mDragType;
  if ((unint64_t)(mDragType - 3) < 2)
  {
    uint64_t v7 = 40;
    goto LABEL_11;
  }
  if (mDragType == 2)
  {
    if (self->mPassedDragThreshold)
    {
LABEL_13:
      LOBYTE(v5) = 1;
      return v5;
    }
    uint64_t v7 = 41;
LABEL_11:
    LOBYTE(v5) = *((unsigned char *)&self->super.super.isa + v7) != 0;
    return v5;
  }
  if (mDragType == 1 && self->mPassedDragThreshold && self->mDragDelayElapsed) {
    goto LABEL_13;
  }
LABEL_2:
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)p_currentlyTransformingRepsAreDraggable
{
  objc_super v3 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  unsigned __int8 v4 = [v3 dynamicOperationController];
  unsigned int v5 = [v4 isInPossibleDynamicOperation];

  if (!v5)
  {
    long long v17 = [v3 infosForCurrentSelectionPath];
    BOOL v8 = [v17 count] != 0;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    [v3 infosForCurrentSelectionPath];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (!v18) {
      goto LABEL_24;
    }
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
LABEL_14:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v26 != v20) {
        objc_enumerationMutation(v10);
      }
      id v22 = [v3 repForInfo:*(void *)(*((void *)&v25 + 1) + 8 * v21)];
      uint64_t v23 = [v22 repForDragging];

      if (v22 != v23) {
        break;
      }
      if (v19 == (id)++v21)
      {
        id v19 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v19) {
          goto LABEL_14;
        }
        goto LABEL_24;
      }
    }
LABEL_21:
    BOOL v8 = 0;
    goto LABEL_24;
  }
  BOOL v6 = [v3 dynamicOperationController];
  uint64_t v7 = [v6 currentlyTransformingReps];
  BOOL v8 = [v7 count] != 0;

  id v9 = [v3 dynamicOperationController];
  id v10 = [v9 currentlyTransformingReps];

  if (![v10 containsObject:self->mRep]) {
    goto LABEL_21;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v10;
  id v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v16 = [v15 repForDragging];

        if (v15 != v16)
        {
          BOOL v8 = 0;
          goto LABEL_23;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_23:

LABEL_24:
  return v8;
}

- (void)p_createDelayCallback
{
  if (((self->mDragType - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    v2 = &qword_101178BD8;
  }
  else {
    v2 = &qword_101178C00;
  }
  [(CRLiOSRepDragGestureRecognizer *)self performSelector:"p_delayElapsed" withObject:0 afterDelay:*(double *)v2];
}

- (void)p_delayElapsed
{
  if ([(CRLiOSRepDragGestureRecognizer *)self state] != (id)5)
  {
    if (qword_101719CB8 != -1) {
      dispatch_once(&qword_101719CB8, &stru_1014E7C90);
    }
    if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
      sub_101094ED4();
    }
    self->mDragDelayElapsed = 1;
    if (self->mPassedDragThreshold && self->mDragType == 1)
    {
      if (qword_101719CB8 != -1) {
        dispatch_once(&qword_101719CB8, &stru_1014E7CB0);
      }
      if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
        sub_101094EA0();
      }
      [(CRLiOSRepDragGestureRecognizer *)self setState:5];
    }
    else if ([(CRLiOSRepDragGestureRecognizer *)self p_canBeginDrag])
    {
      [(CRLiOSRepDragGestureRecognizer *)self p_beginGesture];
    }
    else if (self->mHUDAndGuidesType == 2)
    {
      [(CRLiOSRepDragGestureRecognizer *)self p_beginTracking];
    }
  }
}

- (void)p_cancelDelayedStartTracking
{
}

- (void)p_beginGesture
{
  if (qword_101719CB8 != -1) {
    dispatch_once(&qword_101719CB8, &stru_1014E7CD0);
  }
  if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
    sub_101094F08();
  }
  if (!self->mTracker) {
    [(CRLiOSRepDragGestureRecognizer *)self p_beginTracking];
  }
  if (([(CRLiOSRepDragGestureRecognizer *)self modifierFlags] & 0x80000) != 0
    && [(CRLCanvasRepDragTracker *)self->mTracker insertInfosAndUpdateDragForDuplicatingDragIfAppropriate])
  {
    self->mShouldCloseCommandGroupWhenOperationCompletes = 1;
    objc_super v3 = [(CRLCanvasRepDragTracker *)self->mTracker rep];
    mRep = self->mRep;
    self->mRep = v3;
  }
  [(CRLiOSRepDragGestureRecognizer *)self setState:1];
  self->mDragState = 2;
  unsigned int v5 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  BOOL v6 = [v5 dynamicOperationController];
  if (([v6 isInOperation] & 1) == 0) {
    [v6 beginOperation];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 currentlyTransformingReps];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v12 setShowKnobsDuringManipulation:1];
        [v12 turnKnobsOn];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  mTracker = self->mTracker;
  p_mTouchDelta = &self->mTouchDelta;
  [v5 convertBoundsToUnscaledPoint:p_mTouchDelta->x, p_mTouchDelta->y];
  -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](mTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 1);
  CGPoint *p_mTouchDelta = CGPointZero;
}

- (void)p_beginTracking
{
  if (qword_101719CB8 != -1) {
    dispatch_once(&qword_101719CB8, &stru_1014E7CF0);
  }
  if (os_log_type_enabled((os_log_t)off_10166D380, OS_LOG_TYPE_DEBUG)) {
    sub_101094F3C();
  }
  if (!self->mTracker)
  {
    objc_super v3 = [(CRLiOSRepDragGestureRecognizer *)self icc];
    unsigned __int8 v4 = [v3 layerHost];
    unsigned int v5 = [v4 asUIKitHost];

    BOOL v6 = [v3 dynamicOperationController];
    uint64_t v7 = [v3 tmCoordinator];
    id v8 = [[CRLCanvasRepDragTracker alloc] initWithRep:self->mRep];
    mTracker = self->mTracker;
    self->mTracker = v8;

    [(CRLiOSRepDragGestureRecognizer *)self addTarget:v6 action:"handleGestureRecognizer:"];
    if (self->mHitRepChrome && ([v6 isInOperation] & 1) != 0)
    {
      uint64_t v10 = [v7 controllingTM];
      id v11 = [v5 knobDragGestureRecognizer];

      unsigned int v12 = [v7 takeControlWithTrackerManipulator:self];
      if (v10 == v11 && v12)
      {
        [v7 relinquishTrackerManipulatorControl:self];
        [v7 unregisterTrackerManipulator:self];
        uint64_t v13 = [v6 currentlyTransformingReps];
        uint64_t v14 = +[NSSet setWithSet:v13];

        [v6 cancelOperation];
        [v7 registerTrackerManipulator:self];
        [v7 takeControlWithTrackerManipulator:self];
        [v6 beginPossibleDynamicOperation];
        [v6 startTransformingReps:v14];
      }
    }
    else
    {
      [v7 takeControlWithTrackerManipulator:self];
    }
    if (!self->mTracker) {
      goto LABEL_37;
    }
    [(CRLiOSRepDragGestureRecognizer *)self p_setTrackerPoints];
    if (([v6 isInOperation] & 1) == 0
      && ([v6 isInPossibleDynamicOperation] & 1) == 0)
    {
      long long v27 = v7;
      long long v28 = v5;
      [v6 beginPossibleDynamicOperation];
      long long v15 = +[NSMutableSet set];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v16 = [v3 infosForCurrentSelectionPath];
      id v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = [v3 repForInfo:*(void *)(*((void *)&v29 + 1) + 8 * i)];
            if (v21) {
              [v15 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v18);
      }

      [v6 startTransformingReps:v15];
      uint64_t v7 = v27;
      unsigned int v5 = v28;
    }
    id v22 = self->mTracker;
    [(CRLiOSRepDragGestureRecognizer *)self currentPosition];
    -[CRLCanvasRepDragTracker beginShowingDragUIForInitialDragPoint:](v22, "beginShowingDragUIForInitialDragPoint:");
    if (!self->mShouldConstrainDueToAdditionalTouches)
    {
      if (([(CRLiOSRepDragGestureRecognizer *)self modifierFlags] & 0x20000) == 0)
      {
        [(CRLCanvasRepDragTracker *)self->mTracker setShouldConstrain:0];
        [(CRLCanvasRepDragTracker *)self->mTracker setSnapLevel:0.0];
LABEL_33:
        long long v25 = [v3 canvasView];
        long long v26 = [v25 enclosingScrollView];

        if (v26)
        {
          if ([v26 isScrollEnabled])
          {
            [v26 setScrollEnabled:0];
            [v26 setScrollEnabled:1];
          }
        }

LABEL_37:
        return;
      }
      if (!self->mShouldConstrainDueToAdditionalTouches) {
        goto LABEL_31;
      }
    }
    if ([(NSMutableSet *)self->mTouchesDownOnCanvas count])
    {
      [(CRLCanvasRepDragTracker *)self->mTracker setSnapLevel:(double)(unint64_t)(10 * (void)[(NSMutableSet *)self->mTouchesDownOnCanvas count] - 10)];
      uint64_t v23 = self->mTracker;
      uint64_t v24 = 0;
    }
    else
    {
LABEL_31:
      [(CRLCanvasRepDragTracker *)self->mTracker setSnapLevel:1.0];
      uint64_t v23 = self->mTracker;
      uint64_t v24 = 1;
    }
    [(CRLCanvasRepDragTracker *)v23 setShouldSuppressConstrainingHUD:v24];
    goto LABEL_33;
  }
}

- (BOOL)i_beginGestureExternally
{
  if (self->mRep
    && [(CRLiOSRepDragGestureRecognizer *)self p_currentlyTransformingRepsAreDraggable])
  {
    self->mTouchDelta = CGPointZero;
    [(CRLiOSRepDragGestureRecognizer *)self p_beginGesture];
    [(CRLCanvasRepDragTracker *)self->mTracker p_didBeginDrag];
    return 1;
  }
  else
  {
    [(CRLiOSRepDragGestureRecognizer *)self setState:5];
    return 0;
  }
}

- (void)p_beginConstraining
{
  self->mShouldConstrainDueToAdditionalTouches = 1;
  mConstrainingTimer = self->mConstrainingTimer;
  self->mConstrainingTimer = 0;

  if (self->mTracker) {
    [(CRLiOSRepDragGestureRecognizer *)self p_setTrackerPoints];
  }
  if ([(CRLiOSRepDragGestureRecognizer *)self state])
  {
    [(CRLiOSRepDragGestureRecognizer *)self setState:2];
  }
}

- (void)p_setTrackerPoints
{
  if (!self->mTracker)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7D10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101094F70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7D30);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    unsigned __int8 v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer p_setTrackerPoints]");
    unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1049 isFatal:0 description:"setting tracker points when there is no tracker"];
  }
  BOOL v6 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  mTouch = self->mTouch;
  id v8 = [v6 canvasView];
  [(UITouch *)mTouch locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [v6 tmCoordinator];
  uint64_t v14 = [v13 controllingTM];

  if (v14 == self)
  {
    mTracker = self->mTracker;
    if (self->mPassedDragThreshold)
    {
      long long v16 = self->mTracker;
      double v17 = v10;
      double v18 = v12;
    }
    else
    {
      [v6 convertUnscaledToBoundsPoint:self->mOnlyTouchDownLocation.x, self->mOnlyTouchDownLocation.y];
      long long v16 = mTracker;
    }
    -[CRLCanvasRepDragTracker setLogicalDragPoint:](v16, "setLogicalDragPoint:", v17, v18);
    -[CRLCanvasRepDragTracker setActualDragPoint:](self->mTracker, "setActualDragPoint:", v10, v12);
    if (!self->mEndedWithNudgeInControl) {
      [(CRLCanvasRepDragTracker *)self->mTracker setShouldSnapToGuides:1];
    }
  }
  [(CRLCanvasRepDragTracker *)self->mTracker setShouldSnapToGuides:((unint64_t)[(CRLiOSRepDragGestureRecognizer *)self modifierFlags] & 0x100000) == 0];
  if (self->mShouldConstrainDueToAdditionalTouches)
  {
    [(CRLCanvasRepDragTracker *)self->mTracker setShouldConstrain:1];
  }
  else
  {
    unint64_t v19 = (unint64_t)[(CRLiOSRepDragGestureRecognizer *)self modifierFlags];
    int v20 = v19;
    [(CRLCanvasRepDragTracker *)self->mTracker setShouldConstrain:(v19 >> 17) & 1];
    if ((v20 & 0x20000) == 0)
    {
      [(CRLCanvasRepDragTracker *)self->mTracker setSnapLevel:0.0];
      goto LABEL_25;
    }
  }
  if (self->mShouldConstrainDueToAdditionalTouches && [(NSMutableSet *)self->mTouchesDownOnCanvas count])
  {
    [(CRLCanvasRepDragTracker *)self->mTracker setSnapLevel:(double)(unint64_t)(10 * (void)[(NSMutableSet *)self->mTouchesDownOnCanvas count] - 10)];
    uint64_t v21 = self->mTracker;
    id v22 = [(NSMutableSet *)self->mTouchesDownOnCanvas anyObject];
    uint64_t v23 = [v6 canvasView];
    [v22 locationInView:v23];
    -[CRLCanvasRepDragTracker setConstrainingPoint:](v21, "setConstrainingPoint:");

    uint64_t v24 = self->mTracker;
    uint64_t v25 = 0;
  }
  else
  {
    [(CRLCanvasRepDragTracker *)self->mTracker setSnapLevel:1.0];
    uint64_t v24 = self->mTracker;
    uint64_t v25 = 1;
  }
  [(CRLCanvasRepDragTracker *)v24 setShouldSuppressConstrainingHUD:v25];
LABEL_25:
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_3;
  }
  unsigned int v5 = [v4 view];
  BOOL v6 = [(CRLiOSRepDragGestureRecognizer *)self icc];
  uint64_t v7 = [v6 canvasView];
  id v8 = [v7 enclosingScrollView];

  if (v5 == v8)
  {
    BOOL v9 = 0;
  }
  else
  {
LABEL_3:
    v11.receiver = self;
    v11.super_class = (Class)CRLiOSRepDragGestureRecognizer;
    BOOL v9 = [(CRLiOSRepDragGestureRecognizer *)&v11 canBePreventedByGestureRecognizer:v4];
  }

  return v9;
}

- (CRLCanvasRepDragTracker)repDragTracker
{
  return self->mTracker;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->mAutoscroll;
}

- (void)setAutoscroll:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAutoscroll, 0);
  objc_storeStrong((id *)&self->mConstrainingTimer, 0);
  objc_storeStrong((id *)&self->mTouchesDownOnCanvas, 0);
  objc_storeStrong((id *)&self->mTouchesDownOnReps, 0);
  objc_storeStrong((id *)&self->mOriginalPointsInWindow, 0);
  objc_storeStrong((id *)&self->mOriginalTimestamps, 0);
  objc_storeStrong((id *)&self->mTracker, 0);
  objc_storeStrong((id *)&self->mRep, 0);
  objc_storeStrong((id *)&self->mTouch, 0);

  objc_destroyWeak((id *)&self->mICC);
}

@end