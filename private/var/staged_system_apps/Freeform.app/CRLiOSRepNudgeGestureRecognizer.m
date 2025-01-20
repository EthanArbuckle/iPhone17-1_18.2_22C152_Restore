@interface CRLiOSRepNudgeGestureRecognizer
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)readyToEndOperation;
- (CGRect)p_affectedRepsRect:(id)a3;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (CRLiOSRepNudgeGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (id)p_ICC;
- (void)cancelBecauseOfRotation;
- (void)operationDidEnd;
- (void)reset;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CRLiOSRepNudgeGestureRecognizer

- (CRLiOSRepNudgeGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  v5 = [(CRLiOSRepNudgeGestureRecognizer *)&v12 initWithTarget:0 action:0];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2878);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101073454();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2898);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer initWithInteractiveCanvasController:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 69, 0, "invalid nil value for '%{public}s'", "icc");
    }
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    allTouchesDown = v5->_allTouchesDown;
    v5->_allTouchesDown = v9;
  }
  return v5;
}

- (void)reset
{
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  [(CRLiOSRepNudgeGestureRecognizer *)&v10 reset];
  if (qword_101719A60 != -1) {
    dispatch_once(&qword_101719A60, &stru_1014D28B8);
  }
  v3 = off_10166B250;
  if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
    sub_1010734FC(v3, v4, v5);
  }
  self->_didNudge = 0;
  anchorTouch = self->_anchorTouch;
  self->_anchorTouch = 0;

  swipeTouch = self->_swipeTouch;
  self->_swipeTouch = 0;

  dragTracker = self->_dragTracker;
  self->_dragTracker = 0;

  [(NSMutableSet *)self->_allTouchesDown removeAllObjects];
  self->_numSwipeTouches = 0;
  CGPoint v9 = CGPointZero;
  self->_anchorTouchStartLocationInWindow = CGPointZero;
  self->_swipeTouchStartLocationInCanvas = v9;
}

- (void)setState:(int64_t)a3
{
  if ([(CRLiOSRepNudgeGestureRecognizer *)self state] != (id)a3)
  {
    if (qword_101719A60 != -1) {
      dispatch_once(&qword_101719A60, &stru_1014D28D8);
    }
    uint64_t v5 = off_10166B250;
    if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
      sub_101073538(v5, a3);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  [(CRLiOSRepNudgeGestureRecognizer *)&v6 setState:a3];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v86.receiver = self;
  v86.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  [(CRLiOSRepNudgeGestureRecognizer *)&v86 touchesBegan:v6 withEvent:a4];
  v77 = [(CRLiOSRepNudgeGestureRecognizer *)self p_ICC];
  v7 = [v77 layerHost];
  v76 = [v7 asiOSCVC];

  if (-[CRLiOSRepNudgeGestureRecognizer state](self, "state") || ![v77 currentlyScrolling])
  {
    v11 = &OBJC_IVAR___CRLiOSCanvasDragInteractionDelegate__dragItemsToCanvasDragItems;
    if (![(NSMutableSet *)self->_allTouchesDown count])
    {
      if (self->_anchorTouch)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D2918);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101073874();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D2938);
        }
        objc_super v12 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v12);
        }
        v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]");
        v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"];
        +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:113 isFatal:0 description:"anchor touch not null when first touch comes down"];
      }
      v15 = [v77 tmCoordinator];
      [v15 registerTrackerManipulator:self];
    }
    if ([(NSMutableSet *)self->_allTouchesDown count] == (id)1)
    {
      p_anchorTouch = &self->_anchorTouch;
      if (!self->_anchorTouch)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D2958);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010737CC();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D2978);
        }
        v17 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v17);
        }
        v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]");
        v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 119, 0, "invalid nil value for '%{public}s'", "_anchorTouch");
      }
      v20 = [(NSMutableSet *)self->_allTouchesDown anyObject];
      if (v20 != *p_anchorTouch)
      {
        if (qword_101719A60 != -1) {
          dispatch_once(&qword_101719A60, &stru_1014D2998);
        }
        v21 = off_10166B250;
        if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
          sub_101073790(v21, v22, v23);
        }
        unint64_t v24 = self->_numSwipeTouches - 1;
        self->_numSwipeTouches = v24;
        if (v24)
        {
          int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          id v26 = v6;
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D29B8);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010736D8((uint64_t)&self->_numSwipeTouches, v25);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D29D8);
          }
          v27 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v27);
          }
          v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]");
          v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 124, 0, "non-zero (%lu) swipe touches when there should be zero", self->_numSwipeTouches);

          id v6 = v26;
          v11 = &OBJC_IVAR___CRLiOSCanvasDragInteractionDelegate__dragItemsToCanvasDragItems;
        }
        swipeTouch = self->_swipeTouch;
        self->_swipeTouch = 0;

        objc_storeStrong((id *)p_anchorTouch, v20);
        [(UITouch *)*p_anchorTouch timestamp];
        self->_anchorTouchStartTimestamp = v31;
        v32 = *p_anchorTouch;
        v33 = [(UITouch *)v32 window];
        [(UITouch *)v32 locationInView:v33];
        self->_anchorTouchStartLocationInWindow.x = v34;
        self->_anchorTouchStartLocationInWindow.y = v35;
      }
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v73 = v6;
    id v36 = v6;
    id v37 = [v36 countByEnumeratingWithState:&v82 objects:v97 count:16];
    if (!v37)
    {
LABEL_95:

      [(NSMutableSet *)self->_allTouchesDown unionSet:v36];
      id v6 = v73;
      goto LABEL_96;
    }
    id v38 = v37;
    uint64_t v39 = *(void *)v83;
    id v75 = v36;
LABEL_50:
    uint64_t v40 = 0;
    while (1)
    {
      if (*(void *)v83 != v39) {
        objc_enumerationMutation(v36);
      }
      id v41 = *(id *)(*((void *)&v82 + 1) + 8 * v40);
      v42 = (id *)((char *)&self->super.super.isa + v11[321]);
      if (v41 == *v42) {
        goto LABEL_93;
      }
      if (*v42) {
        break;
      }
      if ([*(id *)(*((void *)&v82 + 1) + 8 * v40) tapCount] == (id)1)
      {
        v44 = [v76 hitRepWithTouch:v41];
        v45 = [v44 repForDragging];

        if (!v45) {
          goto LABEL_74;
        }
        if (self->_swipeTouch)
        {
          unsigned int v46 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D29F8);
          }
          v47 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v90 = v46;
            __int16 v91 = 2082;
            v92 = "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]";
            __int16 v93 = 2082;
            v94 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m";
            __int16 v95 = 1024;
            int v96 = 143;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d swipe touch not null when setting anchor touch", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D2A18);
          }
          v48 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            log = v48;
            v72 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v90 = v46;
            __int16 v91 = 2114;
            v92 = v72;
            _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v49 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]");
          v50 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"];
          +[CRLAssertionHandler handleFailureInFunction:v49 file:v50 lineNumber:143 isFatal:0 description:"swipe touch not null when setting anchor touch"];

          v11 = &OBJC_IVAR___CRLiOSCanvasDragInteractionDelegate__dragItemsToCanvasDragItems;
        }
        objc_storeStrong(v42, v41);
        [*v42 timestamp];
        self->_anchorTouchStartTimestamp = v51;
        id v52 = *v42;
        v53 = [*v42 window];
        [v52 locationInView:v53];
        self->_anchorTouchStartLocationInWindow.x = v54;
        self->_anchorTouchStartLocationInWindow.y = v55;

        id v56 = *v42;
        v57 = [v77 canvasView];
        [v56 locationInView:v57];
        [v77 convertBoundsToUnscaledPoint:];
        id v60 = [v45 dragTypeAtCanvasPoint:[*v42 type] forTouchType:v58, v59];

        id v36 = v75;
        if (!v60) {
LABEL_74:
        }
          [(CRLiOSRepNudgeGestureRecognizer *)self setState:5];
        goto LABEL_92;
      }
      [(CRLiOSRepNudgeGestureRecognizer *)self setState:5];
LABEL_93:
      if (v38 == (id)++v40)
      {
        id v38 = [v36 countByEnumeratingWithState:&v82 objects:v97 count:16];
        if (!v38) {
          goto LABEL_95;
        }
        goto LABEL_50;
      }
    }
    if (self->_swipeTouch)
    {
      if (qword_101719A60 != -1) {
        dispatch_once(&qword_101719A60, &stru_1014D2A78);
      }
      v43 = off_10166B250;
      if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
        sub_101073684(v87, (uint64_t)self, &v88, v43);
      }
      ++self->_numSwipeTouches;
      goto LABEL_93;
    }
    v61 = [v76 hitRepWithTouch:*(void *)(*((void *)&v82 + 1) + 8 * v40)];
    v45 = [v61 repForDragging];

    v62 = [v76 hitRepWithTouch:*v42];
    v63 = [v62 repForDragging];

    v64 = [v77 dynamicOperationController];
    if (![v64 isInOperation] && v45 && v45 == v63)
    {
      unsigned __int8 v65 = [v45 demandsExclusiveSelection];

      if ((v65 & 1) == 0)
      {
        v11 = &OBJC_IVAR___CRLiOSCanvasDragInteractionDelegate__dragItemsToCanvasDragItems;
        if (qword_101719A60 != -1) {
          dispatch_once(&qword_101719A60, &stru_1014D2A58);
        }
        id v36 = v75;
        v66 = off_10166B250;
        if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
          sub_10107364C(&v78, v79, v66);
        }
        [(CRLiOSRepNudgeGestureRecognizer *)self setState:5];
LABEL_91:

LABEL_92:
        goto LABEL_93;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_swipeTouch, v41);
    if (qword_101719A60 != -1) {
      dispatch_once(&qword_101719A60, &stru_1014D2A38);
    }
    v67 = off_10166B250;
    if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
      sub_101073614(&v80, v81, v67);
    }
    self->_numSwipeTouches = 1;
    v68 = self->_swipeTouch;
    v69 = [v77 canvasView];
    [(UITouch *)v68 locationInView:v69];
    [v77 convertBoundsToUnscaledPoint:];
    self->_swipeTouchStartLocationInCanvas.x = v70;
    self->_swipeTouchStartLocationInCanvas.y = v71;

    v11 = &OBJC_IVAR___CRLiOSCanvasDragInteractionDelegate__dragItemsToCanvasDragItems;
    id v36 = v75;
    goto LABEL_91;
  }
  if (qword_101719A60 != -1) {
    dispatch_once(&qword_101719A60, &stru_1014D28F8);
  }
  v8 = off_10166B250;
  if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
    sub_1010735D8(v8, v9, v10);
  }
  [(CRLiOSRepNudgeGestureRecognizer *)self setState:5];
LABEL_96:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  id v6 = a3;
  [(CRLiOSRepNudgeGestureRecognizer *)&v20 touchesMoved:v6 withEvent:a4];
  LODWORD(a4) = [v6 containsObject:self->_anchorTouch];

  if (a4)
  {
    if (self->_swipeTouch)
    {
      anchorTouch = self->_anchorTouch;
      v8 = [(UITouch *)anchorTouch window];
      [(UITouch *)anchorTouch locationInView:v8];
      double v11 = sub_1000653B4(self->_anchorTouchStartLocationInWindow.x, self->_anchorTouchStartLocationInWindow.y, v9, v10);
      [(UITouch *)self->_anchorTouch timestamp];
      double v14 = sub_10028D29C(0, v13, v12 - self->_anchorTouchStartTimestamp);

      if (v11 >= v14)
      {
        swipeTouch = self->_swipeTouch;
        self->_swipeTouch = 0;

        v16 = [(CRLiOSRepNudgeGestureRecognizer *)self p_ICC];
        v17 = [v16 layerHost];
        v18 = [v17 asiOSCVC];

        v19 = [v18 repDragGestureRecognizer];
        if ([v19 state] == (id)5) {
          [(CRLiOSRepNudgeGestureRecognizer *)self setState:5];
        }
      }
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v65.receiver = self;
  v65.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  [(CRLiOSRepNudgeGestureRecognizer *)&v65 touchesEnded:v6 withEvent:a4];
  if (qword_101719A60 != -1) {
    dispatch_once(&qword_101719A60, &stru_1014D2A98);
  }
  v7 = off_10166B250;
  if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
    sub_101073A4C((uint64_t)self, v7, v8);
  }
  double v9 = [(CRLiOSRepNudgeGestureRecognizer *)self p_ICC];
  double v10 = [v9 layerHost];
  double v59 = [v10 asiOSCVC];

  id v60 = [v9 dynamicOperationController];
  if (([v6 containsObject:self->_anchorTouch] & 1) == 0)
  {
    swipeTouch = self->_swipeTouch;
    if (swipeTouch)
    {
      double v12 = [v9 canvasView];
      [(UITouch *)swipeTouch locationInView:v12];
      [v9 convertBoundsToUnscaledPoint:];
      double v14 = v13;
      double v16 = v15;

      if (sub_1000653B4(self->_swipeTouchStartLocationInCanvas.x, self->_swipeTouchStartLocationInCanvas.y, v14, v16) >= 14.0)
      {
        if (self->_didNudge) {
          goto LABEL_12;
        }
        self->_didNudge = 1;
        v17 = [v59 repDragGestureRecognizer];
        if ((objc_msgSend(v17, "i_beginGestureExternally") & 1) == 0)
        {
          [(CRLiOSRepNudgeGestureRecognizer *)self setState:5];
          self->_didNudge = 0;
        }

        if (self->_didNudge)
        {
LABEL_12:
          v18 = [v9 tmCoordinator];
          unsigned int v19 = [v18 takeControlWithTrackerManipulator:self];

          if (v19)
          {
            if ([(CRLiOSRepNudgeGestureRecognizer *)self state])
            {
              [(CRLiOSRepNudgeGestureRecognizer *)self setState:2];
            }
            else
            {
              [(CRLiOSRepNudgeGestureRecognizer *)self addTarget:v60 action:"handleGestureRecognizer:"];
              [(CRLiOSRepNudgeGestureRecognizer *)self setState:1];
              if (([v60 isInOperation] & 1) == 0)
              {
                +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014D2AB8);
                }
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                  sub_1010739B8();
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014D2AD8);
                }
                objc_super v20 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                  sub_10106590C(v20);
                }
                v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesEnded:withEvent:]");
                uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"];
                +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:238 isFatal:0 description:"not in dynamic operation for nudge"];
              }
            }
            unint64_t numSwipeTouches = self->_numSwipeTouches;
            if (numSwipeTouches <= 1) {
              uint64_t v24 = 1;
            }
            else {
              uint64_t v24 = 10 * numSwipeTouches - 10;
            }
            double v25 = sub_100064680(v14, v16, self->_swipeTouchStartLocationInCanvas.x);
            double v26 = fabs(v25);
            double v28 = fabs(v27);
            uint64_t v29 = -v24;
            if (v27 <= 0.0) {
              uint64_t v30 = -v24;
            }
            else {
              uint64_t v30 = v24;
            }
            if (v25 > 0.0) {
              uint64_t v29 = v24;
            }
            if (v26 > v28) {
              double v31 = (double)v29;
            }
            else {
              double v31 = 0.0;
            }
            if (v26 > v28) {
              double v32 = 0.0;
            }
            else {
              double v32 = (double)v30;
            }
            v33 = [v60 currentlyTransformingReps];
            [(CRLiOSRepNudgeGestureRecognizer *)self p_affectedRepsRect:v33];
            double v35 = v34;

            double v36 = v35 - (double)(int)v35;
            if (v36 > 0.5) {
              double v36 = v36 + -1.0;
            }
            if (v31 == 0.0) {
              double v37 = 0.0;
            }
            else {
              double v37 = v36;
            }
            double v38 = sub_100064680(v31, v32, v37);
            double v40 = v39;
            uint64_t v41 = objc_opt_class();
            v42 = [(CRLiOSRepNudgeGestureRecognizer *)self tracker];
            v43 = sub_1002469D0(v41, v42);

            [v43 addUnscaledDragDelta:0 roundDeltaToViewScale:v38, v40];
            if (qword_101719A60 != -1) {
              dispatch_once(&qword_101719A60, &stru_1014D2AF8);
            }
            v44 = off_10166B250;
            if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
              sub_101073908(v44, v38, v40);
            }
            anchorTouch = self->_anchorTouch;
            unsigned int v46 = [v9 canvasView];
            [(UITouch *)anchorTouch locationInView:v46];
            [v43 setLogicalDragPoint:];

            [v43 setShouldSnapToGuides:0];
            [v43 setShouldShowGuides:1];
          }
        }
      }
      v47 = self->_swipeTouch;
      self->_swipeTouch = 0;
    }
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v48 = v6;
  id v49 = [v48 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v62;
    do
    {
      id v52 = 0;
      do
      {
        if (*(void *)v62 != v51) {
          objc_enumerationMutation(v48);
        }
        if (*(UITouch **)(*((void *)&v61 + 1) + 8 * (void)v52) != self->_anchorTouch)
        {
          --self->_numSwipeTouches;
          if (qword_101719A60 != -1) {
            dispatch_once(&qword_101719A60, &stru_1014D2B18);
          }
          v53 = off_10166B250;
          if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v54 = self->_numSwipeTouches;
            *(_DWORD *)buf = 134217984;
            unint64_t v67 = v54;
            _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "removing swipe touch (%lu)", buf, 0xCu);
          }
        }
        id v52 = (char *)v52 + 1;
      }
      while (v50 != v52);
      id v50 = [v48 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v50);
  }

  [(NSMutableSet *)self->_allTouchesDown minusSet:v48];
  if (![(NSMutableSet *)self->_allTouchesDown count])
  {
    CGFloat v55 = [v9 tmCoordinator];
    [v55 unregisterTrackerManipulator:self];

    if (self->_didNudge) {
      uint64_t v56 = 3;
    }
    else {
      uint64_t v56 = 5;
    }
    [(CRLiOSRepNudgeGestureRecognizer *)self setState:v56];
    v57 = self->_anchorTouch;
    self->_anchorTouch = 0;

    double v58 = self->_swipeTouch;
    self->_swipeTouch = 0;
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  [(CRLiOSRepNudgeGestureRecognizer *)&v22 touchesEnded:v6 withEvent:a4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(UITouch **)(*((void *)&v18 + 1) + 8 * i);
        if (v12 == self->_anchorTouch)
        {
          self->_anchorTouch = 0;
        }
        else
        {
          --self->_numSwipeTouches;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v9);
  }

  -[NSMutableSet minusSet:](self->_allTouchesDown, "minusSet:", v7, (void)v18);
  if (![(NSMutableSet *)self->_allTouchesDown count])
  {
    double v13 = [(CRLiOSRepNudgeGestureRecognizer *)self p_ICC];
    double v14 = [v13 tmCoordinator];
    [v14 unregisterTrackerManipulator:self];

    if (self->_didNudge) {
      uint64_t v15 = 4;
    }
    else {
      uint64_t v15 = 5;
    }
    [(CRLiOSRepNudgeGestureRecognizer *)self setState:v15];
    anchorTouch = self->_anchorTouch;
    self->_anchorTouch = 0;

    swipeTouch = self->_swipeTouch;
    self->_swipeTouch = 0;
  }
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_3;
  }
  uint64_t v5 = [v4 view];
  id v6 = [(CRLiOSRepNudgeGestureRecognizer *)self p_ICC];
  id v7 = [v6 canvasView];
  id v8 = [v7 enclosingScrollView];

  if (v5 == v8)
  {
    BOOL v9 = 0;
  }
  else
  {
LABEL_3:
    v11.receiver = self;
    v11.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
    BOOL v9 = [(CRLiOSRepNudgeGestureRecognizer *)&v11 canBePreventedByGestureRecognizer:v4];
  }

  return v9;
}

- (void)cancelBecauseOfRotation
{
  if (self->_anchorTouch) {
    [(CRLiOSRepNudgeGestureRecognizer *)self setState:5];
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  v3 = [(CRLiOSRepNudgeGestureRecognizer *)self p_ICC];
  id v4 = [v3 layerHost];
  uint64_t v5 = [v4 asiOSCVC];

  dragTracker = self->_dragTracker;
  if (!dragTracker)
  {
    id v7 = [v5 repDragGestureRecognizer];
    id v8 = [v7 repDragTracker];
    BOOL v9 = self->_dragTracker;
    self->_dragTracker = v8;

    dragTracker = self->_dragTracker;
  }
  uint64_t v10 = dragTracker;

  return v10;
}

- (BOOL)readyToEndOperation
{
  return [(CRLiOSRepNudgeGestureRecognizer *)self state] == (id)3;
}

- (void)operationDidEnd
{
  if (qword_101719A60 != -1) {
    dispatch_once(&qword_101719A60, &stru_1014D2B38);
  }
  v3 = off_10166B250;
  if (os_log_type_enabled((os_log_t)off_10166B250, OS_LOG_TYPE_DEBUG)) {
    sub_101073AC8(v3, self);
  }
  if (![(CRLiOSRepNudgeGestureRecognizer *)self state]
    || [(CRLiOSRepNudgeGestureRecognizer *)self state] == (id)1
    || [(CRLiOSRepNudgeGestureRecognizer *)self state] == (id)2)
  {
    [(CRLiOSRepNudgeGestureRecognizer *)self setState:3];
  }
  id v4 = [(CRLiOSRepNudgeGestureRecognizer *)self p_ICC];
  uint64_t v5 = [v4 dynamicOperationController];
  [(CRLiOSRepNudgeGestureRecognizer *)self removeTarget:v5 action:"handleGestureRecognizer:"];
}

- (id)p_ICC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return WeakRetained;
}

- (CGRect)p_affectedRepsRect:(id)a3
{
  id v3 = a3;
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = [v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v3);
        }
        double v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        double v13 = [v12 layout:*(_OWORD *)&v32.a, *(_OWORD *)&v32.c, *(_OWORD *)&v32.tx];
        [v13 alignmentFrame];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        objc_super v22 = [v12 layout];
        uint64_t v23 = [v22 parent];
        uint64_t v24 = v23;
        if (v23) {
          [v23 transformInRoot];
        }
        else {
          memset(&v32, 0, sizeof(v32));
        }
        v38.origin.double x = v15;
        v38.origin.double y = v17;
        v38.size.double width = v19;
        v38.size.double height = v21;
        CGRect v39 = CGRectApplyAffineTransform(v38, &v32);
        double x = sub_100064F28(x, y, width, height, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
        double y = v25;
        double width = v26;
        double height = v27;
      }
      id v9 = [v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }

  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragTracker, 0);
  objc_storeStrong((id *)&self->_allTouchesDown, 0);
  objc_storeStrong((id *)&self->_swipeTouch, 0);
  objc_storeStrong((id *)&self->_anchorTouch, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end