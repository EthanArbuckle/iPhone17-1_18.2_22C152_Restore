@interface CRLiOSFreehandDrawingGestureRecognizer
- ($D9ACD5A945031E604089763E4FBE0988)p_canvasTouchPointFromTouch:(id)a3;
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)p_isStateDone;
- (BOOL)p_selectTargetFreehandInfoForDrawing:(id)a3;
- (BOOL)p_tapShouldAvoidDrawing;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (CRLiOSFreehandDrawingGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (unint64_t)inputType;
- (void)operationDidEnd;
- (void)p_addCoalescedAndPredictedTouchesToTrackerForTouch:(id)a3 fromEvent:(id)a4 fromTouchesEnded:(BOOL)a5;
- (void)p_beginDrawingModeWithoutDrawingWithTouch:(id)a3;
- (void)p_beginDynamicDrawing;
- (void)p_cancelOrFailAndCleanUpChanges;
- (void)p_canvasWillScrollOrZoom:(id)a3;
- (void)p_clearTimerIfNeeded;
- (void)p_closeCVCDelegatePresentedViewControllerIfNeeded;
- (void)p_endSuccessfullyWithEvent:(id)a3;
- (void)p_endWithSuccess;
- (void)p_hideEditMenuIfNeeded;
- (void)reset;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesEstimatedPropertiesUpdated:(id)a3;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CRLiOSFreehandDrawingGestureRecognizer

- (CRLiOSFreehandDrawingGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  v5 = [(CRLiOSFreehandDrawingGestureRecognizer *)&v14 initWithTarget:0 action:0];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EDE28);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109E7C8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EDE48);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingGestureRecognizer initWithInteractiveCanvasController:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingGestureRecognizer.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 94, 0, "invalid nil value for '%{public}s'", "icc");
    }
    objc_storeWeak((id *)&v5->_icc, v4);
    v5->_startingScaledPoint = (CGPoint)xmmword_101175160;
    v9 = +[NSNotificationCenter defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_icc);
    [v9 addObserver:v5 selector:"p_canvasWillScrollOrZoom:" name:@"CRLCanvasWillScrollNotification" object:WeakRetained];

    v11 = +[NSNotificationCenter defaultCenter];
    id v12 = objc_loadWeakRetained((id *)&v5->_icc);
    [v11 addObserver:v5 selector:"p_canvasWillScrollOrZoom:" name:@"CRLCanvasWillZoomNotification" object:v12];
  }
  return v5;
}

- (void)setState:(int64_t)a3
{
  if ([(CRLiOSFreehandDrawingGestureRecognizer *)self state] != (id)a3)
  {
    if (qword_101719CC0 != -1) {
      dispatch_once(&qword_101719CC0, &stru_1014EDE68);
    }
    v5 = off_10166D808;
    if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
      sub_10109E878(v5, a3);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  [(CRLiOSFreehandDrawingGestureRecognizer *)&v10 setState:a3];
  if (a3 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v7 = [WeakRetained layerHost];
    v8 = [v7 canvasView];
    v9 = [v8 enclosingScrollView];
    [v9 setScrollEnabled:0];

    self->_didDisableScrolling = 1;
  }
}

- (BOOL)p_selectTargetFreehandInfoForDrawing:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 locked] & 1) == 0)
  {
    p_icc = &self->_icc;
    id WeakRetained = objc_loadWeakRetained((id *)p_icc);
    v9 = [WeakRetained canvasEditor];
    objc_super v10 = [v9 selectionPathWithInfo:v5];

    id v11 = objc_loadWeakRetained((id *)p_icc);
    id v12 = [v11 editorController];
    [v12 setSelectionPath:v10];

    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v92.receiver = self;
  v92.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  id v63 = a4;
  -[CRLiOSFreehandDrawingGestureRecognizer touchesBegan:withEvent:](&v92, "touchesBegan:withEvent:", v6);
  if (![(CRLiOSFreehandDrawingGestureRecognizer *)self state])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    unsigned int v8 = [WeakRetained currentlyScrolling];

    if (v8)
    {
      if (qword_101719CC0 != -1) {
        dispatch_once(&qword_101719CC0, &stru_1014EDE88);
      }
      if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
        sub_101094C28();
      }
      [(CRLiOSFreehandDrawingGestureRecognizer *)self p_cancelOrFailAndCleanUpChanges];
      goto LABEL_114;
    }
  }
  v9 = [v6 anyObject];
  id v10 = [v9 type];

  if (v10 == (id)3)
  {
    unint64_t v11 = (unint64_t)[(CRLiOSFreehandDrawingGestureRecognizer *)self modifierFlags] & 0x40000;
    if (v11 | (unint64_t)[(CRLiOSFreehandDrawingGestureRecognizer *)self buttonMask] & 2)
    {
      [(CRLiOSFreehandDrawingGestureRecognizer *)self p_cancelOrFailAndCleanUpChanges];
      if (qword_101719CC0 != -1) {
        dispatch_once(&qword_101719CC0, &stru_1014EDEA8);
      }
      if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
        sub_10109EAC4();
      }
      goto LABEL_114;
    }
  }
  location = (id *)&self->_icc;
  id v12 = objc_loadWeakRetained((id *)&self->_icc);
  v13 = [v12 freehandDrawingToolkit];

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v62 = v6;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v88 objects:v99 count:16];
  if (!v15) {
    goto LABEL_100;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v89;
  v67 = v13;
  uint64_t v64 = *(void *)v89;
  id v65 = v14;
  while (2)
  {
    v18 = 0;
    id v66 = v16;
    do
    {
      if (*(void *)v89 != v17) {
        objc_enumerationMutation(v14);
      }
      p_trackingTouch = &self->_trackingTouch;
      if (self->_trackingTouch)
      {
        if (qword_101719CC0 != -1) {
          dispatch_once(&qword_101719CC0, &stru_1014EE050);
        }
        if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
          sub_10109EA94(&v69, v70);
        }
        if (![(CRLiOSFreehandDrawingGestureRecognizer *)self state])
        {
          [(CRLiOSFreehandDrawingGestureRecognizer *)self p_cancelOrFailAndCleanUpChanges];
          goto LABEL_100;
        }
        goto LABEL_95;
      }
      v20 = *(void **)(*((void *)&v88 + 1) + 8 * (void)v18);
      id v21 = objc_loadWeakRetained(location);
      unsigned int v22 = [v21 isInDynamicOperation];

      if (v22)
      {
        if (qword_101719CC0 != -1) {
          dispatch_once(&qword_101719CC0, &stru_1014EDEC8);
        }
        id v6 = v62;
        if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
          sub_10109E910();
        }
        [(CRLiOSFreehandDrawingGestureRecognizer *)self setState:5];
        goto LABEL_112;
      }
      [(CRLiOSFreehandDrawingGestureRecognizer *)self p_canvasTouchPointFromTouch:v20];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      double v28 = v27;
      double v30 = v29;
      BOOL v31 = sub_10036FEA4((BOOL)[v20 type]);
      id v32 = [v13 freehandDrawingBehaviorForTouchType:[v20 type] atUnscaledPoint:v28, v30];
      id v33 = v32;
      if (v32 == (id)2)
      {
        if ([v13 isInDrawingMode])
        {
          unsigned int v34 = [(CRLiOSFreehandDrawingGestureRecognizer *)self p_selectTargetFreehandInfoForDrawing:0];
          goto LABEL_29;
        }
      }
      else if (v32 == (id)3)
      {
        unsigned int v34 = 1;
        goto LABEL_29;
      }
      unsigned int v34 = 0;
LABEL_29:
      if (qword_101719CC0 != -1) {
        dispatch_once(&qword_101719CC0, &stru_1014EDEE8);
      }
      v35 = off_10166D808;
      if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG))
      {
        v58 = v35;
        id v59 = [v20 type];
        *(_DWORD *)buf = 134218496;
        id v94 = v59;
        __int16 v95 = 2048;
        id v96 = v33;
        __int16 v97 = 1024;
        unsigned int v98 = v34;
        _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "first touch began of type %zi with drawing behavior %zi. allowedToBegin? %i", buf, 0x1Cu);

        if (!v34) {
          goto LABEL_39;
        }
      }
      else if (!v34)
      {
        goto LABEL_39;
      }
      if (![v13 isInDrawingMode]
        || !objc_msgSend(v13, "currentToolAllowsDragForTouchType:atUnscaledPoint:", objc_msgSend(v20, "type"), v28, v30))
      {
        int v36 = 1;
        goto LABEL_41;
      }
      if (qword_101719CC0 != -1) {
        dispatch_once(&qword_101719CC0, &stru_1014EDF08);
      }
      if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
        sub_10109EA64(&v86, v87);
      }
LABEL_39:
      int v36 = 0;
LABEL_41:
      if ([v20 type] == (id)2)
      {
        BOOL v37 = 1;
      }
      else
      {
        id v38 = objc_loadWeakRetained(location);
        v39 = [v38 layerHost];
        v40 = [v39 asiOSCVC];

        v41 = [v40 pencilMediator];
        v42 = v41;
        BOOL v37 = v41
           && ([v41 prefersPencilOnlyDrawing] & 1) == 0
           && [v20 type] != (id)2;
      }
      if ((v36 & v37) == 1)
      {
        id v43 = objc_loadWeakRetained(location);
        v44 = [v43 hitKnobAtPoint:v31 inputType:0 returningRep:v28];

        unsigned int v45 = [v44 worksWithStylus];
        if ([v67 isLassoSelectionForMixedTypeEnabledInDrawingMode])
        {
          uint64_t v46 = objc_opt_class();
          v47 = sub_1002469D0(v46, v44);
          if (v47) {
            unsigned int v45 = 1;
          }
        }
        if (!v44 || !v45)
        {

LABEL_67:
          v48 = +[CRLiOSKeyboardMonitor sharedKeyboardMonitor];
          [v48 onScreenHeight];
          if (v49 > 10.0 && [v48 isLocalKeyboard])
          {
            v13 = v67;
            if (qword_101719CC0 != -1) {
              dispatch_once(&qword_101719CC0, &stru_1014EDF48);
            }
            if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
              sub_10109E9A4(&v82, v83);
            }
            [(CRLiOSFreehandDrawingGestureRecognizer *)self p_beginDrawingModeWithoutDrawingWithTouch:v20];
            [(CRLiOSFreehandDrawingGestureRecognizer *)self setState:3];
            id v16 = v66;
          }
          else
          {
            objc_storeStrong((id *)p_trackingTouch, v20);
            self->_startingScaledPoint.x = v24;
            self->_startingScaledPoint.y = v26;
            v13 = v67;
            if (!self->_tracker)
            {
              v50 = [CRLFreehandDrawingTracker alloc];
              id v51 = objc_loadWeakRetained(location);
              v52 = [(CRLFreehandDrawingTracker *)v50 initWithInteractiveCanvasController:v51];
              tracker = self->_tracker;
              self->_tracker = v52;
            }
            [(CRLiOSFreehandDrawingGestureRecognizer *)self p_addCoalescedAndPredictedTouchesToTrackerForTouch:*p_trackingTouch fromEvent:v63 fromTouchesEnded:0];
            id v16 = v66;
            if ((id)[(UITouch *)*p_trackingTouch type] == (id)2)
            {
              if (![(CRLiOSFreehandDrawingGestureRecognizer *)self p_tapShouldAvoidDrawing])
              {
                if (qword_101719CC0 != -1) {
                  dispatch_once(&qword_101719CC0, &stru_1014EDF68);
                }
                if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
                  sub_10109EA04(&v80, v81);
                }
                [(CRLiOSFreehandDrawingGestureRecognizer *)self setState:1];
                [(CRLiOSFreehandDrawingGestureRecognizer *)self p_beginDynamicDrawing];
                goto LABEL_94;
              }
              if (qword_101719CC0 != -1) {
                dispatch_once(&qword_101719CC0, &stru_1014EDF88);
              }
              if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
                sub_10109E9D4(&v78, v79);
              }
              [(CRLiOSFreehandDrawingGestureRecognizer *)self setState:1];
              v77[0] = _NSConcreteStackBlock;
              v77[1] = 3221225472;
              v77[2] = sub_10031EF48;
              v77[3] = &unk_1014D3968;
              v77[4] = self;
              double v54 = 0.25;
              v55 = v77;
            }
            else
            {
              if (qword_101719CC0 != -1) {
                dispatch_once(&qword_101719CC0, &stru_1014EDFC8);
              }
              if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
                sub_10109EA34(&v75, v76);
              }
              [(CRLiOSFreehandDrawingGestureRecognizer *)self p_beginDynamicDrawing];
              v73[0] = _NSConcreteStackBlock;
              v73[1] = 3221225472;
              v73[2] = sub_10031F084;
              v73[3] = &unk_1014EE010;
              v73[4] = self;
              char v74 = 1;
              double v54 = 0.25;
              v55 = v73;
            }
            v56 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v55 block:v54];
            beginDelayTimer = self->_beginDelayTimer;
            self->_beginDelayTimer = v56;
          }
LABEL_94:

          uint64_t v17 = v64;
          id v14 = v65;
          goto LABEL_95;
        }
        if (qword_101719CC0 != -1) {
          dispatch_once(&qword_101719CC0, &stru_1014EDF28);
        }
        if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
          sub_10109E974(&v84, v85);
        }
      }
      else if (v36)
      {
        goto LABEL_67;
      }
      uint64_t v17 = v64;
      id v14 = v65;
      if (qword_101719CC0 != -1) {
        dispatch_once(&qword_101719CC0, &stru_1014EE030);
      }
      id v16 = v66;
      v13 = v67;
      if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
        sub_10109E944(&v71, v72);
      }
      [(CRLiOSFreehandDrawingGestureRecognizer *)self setState:5];
LABEL_95:
      v18 = (char *)v18 + 1;
    }
    while (v16 != v18);
    id v60 = [v14 countByEnumeratingWithState:&v88 objects:v99 count:16];
    id v16 = v60;
    if (v60) {
      continue;
    }
    break;
  }
LABEL_100:

  id v6 = v62;
  if (![(CRLiOSFreehandDrawingGestureRecognizer *)self state] && self->_didBeginDynamicDrawing)
  {
    id v14 = objc_loadWeakRetained(location);
    v61 = [v14 dynamicOperationController];
    [v61 handleTrackerManipulator:self];

LABEL_112:
  }

LABEL_114:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  [(CRLiOSFreehandDrawingGestureRecognizer *)&v27 touchesMoved:v6 withEvent:v7];
  if (self->_trackingTouch
    && objc_msgSend(v6, "containsObject:")
    && ![(CRLiOSFreehandDrawingGestureRecognizer *)self p_isStateDone])
  {
    [(CRLiOSFreehandDrawingGestureRecognizer *)self p_canvasTouchPointFromTouch:self->_trackingTouch];
    double v9 = v8;
    double v11 = v10;
    double v12 = sub_1000653B4(v8, v10, self->_startingScaledPoint.x, self->_startingScaledPoint.y);
    if ((id)[(UITouch *)self->_trackingTouch type] == (id)2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
      id v14 = [WeakRetained freehandDrawingToolkit];
      [v14 keepPencilShadowVisible];
    }
    [(CRLiOSFreehandDrawingGestureRecognizer *)self p_addCoalescedAndPredictedTouchesToTrackerForTouch:self->_trackingTouch fromEvent:v7 fromTouchesEnded:0];
    BOOL v15 = 0;
    if ((id)[(UITouch *)self->_trackingTouch type] == (id)2) {
      BOOL v15 = ([(CRLiOSFreehandDrawingGestureRecognizer *)self state] == (id)1
    }
          || [(CRLiOSFreehandDrawingGestureRecognizer *)self state] == (id)2)
         && v12 > 20.0
         && !self->_didBeginDynamicDrawing;
    if ((id)[(UITouch *)self->_trackingTouch type] == (id)2)
    {
      BOOL v17 = 0;
    }
    else
    {
      id v18 = [(CRLiOSFreehandDrawingGestureRecognizer *)self state];
      BOOL v17 = v12 > 163.0 && v18 == 0;
    }
    if (v15 || v17)
    {
      [(CRLiOSFreehandDrawingGestureRecognizer *)self p_clearTimerIfNeeded];
      id v20 = objc_loadWeakRetained((id *)&self->_icc);
      id v21 = [v20 tmCoordinator];
      unsigned int v22 = [v21 controllingTM];

      if (!v22 || v22 == self)
      {
        if (qword_101719CC0 != -1) {
          dispatch_once(&qword_101719CC0, &stru_1014EE070);
        }
        double v23 = off_10166D808;
        if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG))
        {
          double v26 = sub_1000653B4(self->_startingScaledPoint.x, self->_startingScaledPoint.y, v9, v11);
          *(_DWORD *)buf = 134217984;
          double v29 = v26;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "beginning due to enough movement (%f)", buf, 0xCu);
        }
        if (![(CRLiOSFreehandDrawingGestureRecognizer *)self state]) {
          [(CRLiOSFreehandDrawingGestureRecognizer *)self setState:1];
        }
        if (!self->_didBeginDynamicDrawing) {
          [(CRLiOSFreehandDrawingGestureRecognizer *)self p_beginDynamicDrawing];
        }
      }
      else
      {
        [(CRLiOSFreehandDrawingGestureRecognizer *)self p_cancelOrFailAndCleanUpChanges];
      }
    }
    if (![(CRLiOSFreehandDrawingGestureRecognizer *)self state] && self->_didBeginDynamicDrawing)
    {
      id v24 = objc_loadWeakRetained((id *)&self->_icc);
      double v25 = [v24 dynamicOperationController];
      [v25 handleTrackerManipulator:self];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  [(CRLiOSFreehandDrawingGestureRecognizer *)&v8 touchesEnded:v6 withEvent:v7];
  if (self->_trackingTouch
    && objc_msgSend(v6, "containsObject:")
    && ![(CRLiOSFreehandDrawingGestureRecognizer *)self p_isStateDone])
  {
    [(CRLiOSFreehandDrawingGestureRecognizer *)self p_endSuccessfullyWithEvent:v7];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  [(CRLiOSFreehandDrawingGestureRecognizer *)&v7 touchesCancelled:v6 withEvent:a4];
  if (self->_trackingTouch
    && objc_msgSend(v6, "containsObject:")
    && ![(CRLiOSFreehandDrawingGestureRecognizer *)self p_isStateDone])
  {
    [(CRLiOSFreehandDrawingGestureRecognizer *)self p_cancelOrFailAndCleanUpChanges];
  }
}

- (void)touchesEstimatedPropertiesUpdated:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  [(CRLiOSFreehandDrawingGestureRecognizer *)&v8 touchesEstimatedPropertiesUpdated:v4];
  if (self->_trackingTouch
    && objc_msgSend(v4, "containsObject:")
    && ![(CRLiOSFreehandDrawingGestureRecognizer *)self p_isStateDone])
  {
    [(CRLiOSFreehandDrawingGestureRecognizer *)self p_canvasTouchPointFromTouch:self->_trackingTouch];
    objc_super v7 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:]([CRLFreehandDrawingToolInputPoint alloc], "initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:", self->_trackingTouch, self->_lastActiveInputProperties, 0, 0, v5, v6);
    [(CRLFreehandDrawingTracker *)self->_tracker estimatedPropertiesUpdatedOnInputPoint:v7];
  }
}

- (void)reset
{
  if (qword_101719CC0 != -1) {
    dispatch_once(&qword_101719CC0, &stru_1014EE090);
  }
  if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
    sub_10109EB94();
  }
  [(CRLiOSFreehandDrawingGestureRecognizer *)self p_clearTimerIfNeeded];
  if (self->_didDisableScrolling)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    id v4 = [WeakRetained layerHost];
    double v5 = [v4 canvasView];
    double v6 = [v5 enclosingScrollView];
    [v6 setScrollEnabled:1];

    self->_didDisableScrolling = 0;
  }
  tracker = self->_tracker;
  self->_tracker = 0;

  trackingTouch = self->_trackingTouch;
  self->_trackingTouch = 0;

  self->_lastActiveInputProperties = 0;
  self->_startingScaledPoint = (CGPoint)xmmword_101175160;
  self->_didBeginDynamicDrawing = 0;
}

- (unint64_t)inputType
{
  unint64_t result = (unint64_t)self->_trackingTouch;
  if (result)
  {
    if ([(id)result type] == (id)2) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_tracker;
}

- (void)operationDidEnd
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v3 = [WeakRetained dynamicOperationController];
  [(CRLiOSFreehandDrawingGestureRecognizer *)self removeTarget:v3 action:"handleGestureRecognizer:"];
}

- (BOOL)p_isStateDone
{
  return (char *)[(CRLiOSFreehandDrawingGestureRecognizer *)self state] - 3 < (char *)3;
}

- (void)p_endWithSuccess
{
}

- (void)p_endSuccessfullyWithEvent:(id)a3
{
  id v4 = a3;
  if (qword_101719CC0 != -1) {
    dispatch_once(&qword_101719CC0, &stru_1014EE0B0);
  }
  if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
    sub_10109EC30();
  }
  if ((id)[(UITouch *)self->_trackingTouch type] != (id)2
    && ![(CRLiOSFreehandDrawingGestureRecognizer *)self state]
    && ![(CRLiOSFreehandDrawingGestureRecognizer *)self p_tapShouldAvoidDrawing])
  {
    if (qword_101719CC0 != -1) {
      dispatch_once(&qword_101719CC0, &stru_1014EE0D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
      sub_10109EBFC();
    }
    [(CRLiOSFreehandDrawingGestureRecognizer *)self setState:1];
    if (!self->_didBeginDynamicDrawing) {
      [(CRLiOSFreehandDrawingGestureRecognizer *)self p_beginDynamicDrawing];
    }
  }
  if ((id)[(UITouch *)self->_trackingTouch type] == (id)2
    && ([(CRLiOSFreehandDrawingGestureRecognizer *)self state] == (id)1
     || [(CRLiOSFreehandDrawingGestureRecognizer *)self state] == (id)2)
    && !self->_didBeginDynamicDrawing)
  {
    if (qword_101719CC0 != -1) {
      dispatch_once(&qword_101719CC0, &stru_1014EE0F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
      sub_10109EBC8();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    double v6 = [WeakRetained freehandDrawingToolkit];
    unsigned __int8 v7 = [v6 isInDrawingMode];

    if ((v7 & 1) == 0) {
      [(CRLiOSFreehandDrawingGestureRecognizer *)self p_beginDrawingModeWithoutDrawingWithTouch:self->_trackingTouch];
    }
  }
  if (v4) {
    [(CRLiOSFreehandDrawingGestureRecognizer *)self p_addCoalescedAndPredictedTouchesToTrackerForTouch:self->_trackingTouch fromEvent:v4 fromTouchesEnded:1];
  }
  [(CRLiOSFreehandDrawingGestureRecognizer *)self p_clearTimerIfNeeded];
  [(CRLFreehandDrawingTracker *)self->_tracker finishWithSuccess:1];
  [(CRLiOSFreehandDrawingGestureRecognizer *)self p_hideEditMenuIfNeeded];
  [(CRLiOSFreehandDrawingGestureRecognizer *)self p_closeCVCDelegatePresentedViewControllerIfNeeded];
  [(CRLiOSFreehandDrawingGestureRecognizer *)self setState:3];
}

- (void)p_cancelOrFailAndCleanUpChanges
{
  if (qword_101719CC0 != -1) {
    dispatch_once(&qword_101719CC0, &stru_1014EE110);
  }
  if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
    sub_10109ECF8();
  }
  v3 = (char *)[(CRLiOSFreehandDrawingGestureRecognizer *)self state];
  if ((unint64_t)(v3 - 3) < 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE130);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109EC64();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE150);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    unsigned __int8 v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingGestureRecognizer p_cancelOrFailAndCleanUpChanges]");
    objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:617 isFatal:0 description:"Cannot cancel/fail a GR that has already ended."];
  }
  else
  {
    if ((unint64_t)(v3 - 1) >= 2)
    {
      if (v3) {
        goto LABEL_20;
      }
      id v4 = self;
      uint64_t v5 = 5;
    }
    else
    {
      id v4 = self;
      uint64_t v5 = 4;
    }
    [(CRLiOSFreehandDrawingGestureRecognizer *)v4 setState:v5];
  }
LABEL_20:
  [(CRLiOSFreehandDrawingGestureRecognizer *)self p_clearTimerIfNeeded];
  tracker = self->_tracker;
  if (tracker) {
    [(CRLFreehandDrawingTracker *)tracker finishWithSuccess:0];
  }
  if (self->_didBeginDynamicDrawing)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    double v11 = [WeakRetained dynamicOperationController];
    [v11 handleTrackerManipulator:self];
  }
}

- (BOOL)p_tapShouldAvoidDrawing
{
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v4 = [WeakRetained layerHost];
  uint64_t v5 = [v4 asUIKitHost];

  if (([v5 contextMenuMightBeDisplayed] & 1) != 0
    || ([v5 documentChromeHasPresentedViewController] & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_icc);
    objc_super v8 = [v7 freehandDrawingToolkit];
    unsigned int v6 = [v8 isInDrawingMode] ^ 1;
  }
  return v6;
}

- (void)p_beginDynamicDrawing
{
  if (qword_101719CC0 != -1) {
    dispatch_once(&qword_101719CC0, &stru_1014EE170);
  }
  if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
    sub_10109EDC0();
  }
  self->_didBeginDynamicDrawing = 1;
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  uint64_t v5 = [WeakRetained dynamicOperationController];
  unsigned int v6 = [v5 isInPossibleDynamicOperation];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_icc);
    objc_super v8 = [v7 dynamicOperationController];
    [v8 endOperation];
  }
  id v9 = objc_loadWeakRetained((id *)&self->_icc);
  double v10 = [v9 dynamicOperationController];
  unsigned int v11 = [v10 isInOperation];

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_icc);
    v13 = [v12 dynamicOperationController];
    [v13 cancelOperation];
  }
  id v14 = objc_loadWeakRetained((id *)&self->_icc);
  [v14 endEditing];

  [(CRLiOSFreehandDrawingGestureRecognizer *)self p_hideEditMenuIfNeeded];
  id v15 = objc_loadWeakRetained((id *)&self->_icc);
  id v16 = [v15 dynamicOperationController];
  [(CRLiOSFreehandDrawingGestureRecognizer *)self addTarget:v16 action:"handleGestureRecognizer:"];

  id v17 = objc_loadWeakRetained((id *)&self->_icc);
  id v18 = [v17 tmCoordinator];
  [v18 registerTrackerManipulator:self];

  id v19 = objc_loadWeakRetained((id *)&self->_icc);
  id v20 = [v19 tmCoordinator];
  unsigned __int8 v21 = [v20 takeControlWithTrackerManipulator:self];

  if ((v21 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE190);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109ED2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE1B0);
    }
    unsigned int v22 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v22);
    }
    double v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingGestureRecognizer p_beginDynamicDrawing]");
    id v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:676 isFatal:0 description:"Freehand drawing GR did not successfully take control"];
  }
  id v25 = objc_loadWeakRetained((id *)p_icc);
  double v26 = [v25 dynamicOperationController];
  [v26 beginOperation];
}

- (void)p_beginDrawingModeWithoutDrawingWithTouch:(id)a3
{
  id v4 = a3;
  if (qword_101719CC0 != -1) {
    dispatch_once(&qword_101719CC0, &stru_1014EE1D0);
  }
  if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
    sub_10109EDF4();
  }
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v7 = [WeakRetained freehandDrawingToolkit];

  [(CRLiOSFreehandDrawingGestureRecognizer *)self p_canvasTouchPointFromTouch:v4];
  double v9 = v8;
  double v11 = v10;
  id v12 = [v7 freehandDrawingBehaviorForTouchType:[v4 type] atUnscaledPoint:v8 v10];
  [v7 beginDrawingModeIfNeededForTouchType:[v4 type]];
  if (v12 == (id)2)
  {
    id v13 = objc_loadWeakRetained((id *)p_icc);
    id v14 = [v13 hitRep:v9, v11];

    uint64_t v15 = [v14 info];
    if (v15)
    {
      id v16 = (void *)v15;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v17 = [v16 parentInfo];

        id v16 = (void *)v17;
        if (!v17) {
          goto LABEL_12;
        }
      }
      id v18 = objc_loadWeakRetained((id *)p_icc);
      id v19 = [v18 canvasEditor];
      id v20 = (objc_class *)objc_opt_class();
      double v26 = sub_100246E2C(v16, v20, 1, v21, v22, v23, v24, v25, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
      objc_super v27 = [v19 selectionPathWithInfo:v26];

      id v28 = objc_loadWeakRetained((id *)p_icc);
      [v28 setSelectionPath:v27 withSelectionFlags:0];
    }
LABEL_12:
  }
}

- (void)p_clearTimerIfNeeded
{
  beginDelayTimer = self->_beginDelayTimer;
  if (beginDelayTimer)
  {
    [(NSTimer *)beginDelayTimer invalidate];
    id v4 = self->_beginDelayTimer;
    self->_beginDelayTimer = 0;
  }
}

- (void)p_hideEditMenuIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v3 = [WeakRetained layerHost];
  id v4 = [v3 asUIKitHost];

  if ([v4 contextMenuMightBeDisplayed])
  {
    [v4 hideEditMenu];
    [v4 setContextMenuMightBeDisplayed:1];
  }
}

- (void)p_closeCVCDelegatePresentedViewControllerIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v3 = [WeakRetained layerHost];
  id v4 = [v3 asUIKitHost];

  if ([v4 documentChromeHasPresentedViewController]) {
    [v4 dismissDocumentChromePresentedViewController];
  }
}

- (void)p_addCoalescedAndPredictedTouchesToTrackerForTouch:(id)a3 fromEvent:(id)a4 fromTouchesEnded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_super v27 = v8;
  id obj = [v9 coalescedTouchesForTouch:v8];
  id v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        [(CRLiOSFreehandDrawingGestureRecognizer *)self p_canvasTouchPointFromTouch:v14];
        uint64_t v17 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:event:isPredicted:wasAddedByTouchesEnded:]([CRLFreehandDrawingToolInputPoint alloc], "initWithUnscaledPoint:touch:event:isPredicted:wasAddedByTouchesEnded:", v14, v9, 0, v5, v15, v16);
        [(CRLFreehandDrawingTracker *)self->_tracker addPoint:v17];
        self->_lastActiveInputProperties = [(CRLFreehandDrawingToolInputPoint *)v17 activeInputProperties];
      }
      id v11 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = [v9 predictedTouchesForTouch:v8];
  id v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
        [(CRLiOSFreehandDrawingGestureRecognizer *)self p_canvasTouchPointFromTouch:v23];
        double v26 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:event:isPredicted:wasAddedByTouchesEnded:]([CRLFreehandDrawingToolInputPoint alloc], "initWithUnscaledPoint:touch:event:isPredicted:wasAddedByTouchesEnded:", v23, v9, 1, v5, v24, v25);
        [(CRLFreehandDrawingTracker *)self->_tracker addPoint:v26];
      }
      id v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v20);
  }
}

- ($D9ACD5A945031E604089763E4FBE0988)p_canvasTouchPointFromTouch:(id)a3
{
  p_icc = &self->_icc;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_icc);
  unsigned int v6 = [WeakRetained canvasView];
  [v4 preciseLocationInView:v6];
  double v8 = v7;
  double v10 = v9;

  id v11 = objc_loadWeakRetained((id *)p_icc);
  [v11 convertBoundsToUnscaledPoint:v8];
  double v13 = v12;
  double v15 = v14;

  double v16 = v8;
  double v17 = v10;
  double v18 = v13;
  double v19 = v15;
  result.var1.y = v19;
  result.var1.x = v18;
  result.var0.y = v17;
  result.var0.x = v16;
  return result;
}

- (void)p_canvasWillScrollOrZoom:(id)a3
{
  id v4 = a3;
  if (self->_trackingTouch && ![(CRLiOSFreehandDrawingGestureRecognizer *)self p_isStateDone])
  {
    if (qword_101719CC0 != -1) {
      dispatch_once(&qword_101719CC0, &stru_1014EE1F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166D808, OS_LOG_TYPE_DEBUG)) {
      sub_10109EE28();
    }
    [(CRLiOSFreehandDrawingGestureRecognizer *)self p_cancelOrFailAndCleanUpChanges];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginDelayTimer, 0);
  objc_storeStrong((id *)&self->_trackingTouch, 0);
  objc_storeStrong((id *)&self->_tracker, 0);

  objc_destroyWeak((id *)&self->_icc);
}

@end