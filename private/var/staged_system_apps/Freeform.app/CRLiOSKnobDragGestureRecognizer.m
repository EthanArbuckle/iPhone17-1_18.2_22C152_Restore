@interface CRLiOSKnobDragGestureRecognizer
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)p_hitRepIsValid:(id)a3;
- (BOOL)readyToEndOperation;
- (CGPoint)p_pointInUnscaledCanvas;
- (CRLCanvasAutoscroll)autoscroll;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (CRLInteractiveCanvasController)icc;
- (CRLiOSKnobDragGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (double)unscaledStartAutoscrollThreshold;
- (id)knobValidatorBlock;
- (int)allowedAutoscrollDirections;
- (void)autoscrollWillNotStart;
- (void)cancelBecauseOfRotation;
- (void)dealloc;
- (void)operationDidEnd;
- (void)p_cancelDelayedKnobTracking;
- (void)p_requestDelayedKnobTracking:(double)a3;
- (void)p_triggerDelayedKnobTracking:(id)a3;
- (void)reset;
- (void)setAutoscroll:(id)a3;
- (void)setKnobValidatorBlock:(id)a3;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateAfterAutoscroll:(id)a3;
@end

@implementation CRLiOSKnobDragGestureRecognizer

- (CRLiOSKnobDragGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  v5 = [(CRLiOSKnobDragGestureRecognizer *)&v8 initWithTarget:0 action:0];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(CRLiOSKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  [(CRLiOSKnobDragGestureRecognizer *)&v3 dealloc];
}

- (void)setState:(int64_t)a3
{
  [(CRLiOSKnobDragGestureRecognizer *)self state];
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  [(CRLiOSKnobDragGestureRecognizer *)&v5 setState:a3];
}

- (void)reset
{
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  [(CRLiOSKnobDragGestureRecognizer *)&v7 reset];
  [(CRLiOSKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
  touch = self->_touch;
  self->_touch = 0;

  secondTouch = self->_secondTouch;
  self->_secondTouch = 0;

  self->_knobToTouchOffset = CGPointZero;
  self->_originalPointInWindow = (CGPoint)xmmword_101175150;
  lastHitRep = self->_lastHitRep;
  self->_lastHitRep = 0;

  self->_touchesMoved = 0;
  self->_knobTouchHasMoved = 0;
  self->_delayHasElapsed = 0;
  tracker = self->_tracker;
  self->_tracker = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CRLiOSKnobDragGestureRecognizer *)self icc];
  v9 = [v8 layerHost];
  v10 = [v9 asUIKitHost];

  v11 = [v8 dynamicOperationController];
  v12 = [v8 tmCoordinator];
  if (!-[CRLiOSKnobDragGestureRecognizer state](self, "state") && [v8 currentlyScrolling]
    || (([v11 isInOperation] & 1) != 0
     || [v8 isInDynamicOperation])
    && ![(CRLiOSKnobDragGestureRecognizer *)self state])
  {
    goto LABEL_24;
  }
  v118.receiver = self;
  v118.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  [(CRLiOSKnobDragGestureRecognizer *)&v118 touchesBegan:v6 withEvent:v7];
  self->_touchesMoved = 0;
  lastHitRep = self->_lastHitRep;
  self->_lastHitRep = 0;

  if (![(CRLiOSKnobDragGestureRecognizer *)self state])
  {
    if ([v6 count] == (id)1)
    {
      v116 = v12;
      v22 = [v7 allTouches];
      if ([v22 count] == (id)1)
      {
        touch = self->_touch;

        v12 = v116;
        if (!touch)
        {
          v112 = v10;
          v24 = [v6 anyObject];
          v25 = self->_touch;
          self->_touch = v24;

          v26 = self->_touch;
          v27 = [(UITouch *)v26 window];
          [(UITouch *)v26 locationInView:v27];
          self->_originalPointInWindow.double x = v28;
          self->_originalPointInWindow.double y = v29;

          BOOL v30 = sub_10036FEA4([(UITouch *)self->_touch type]);
          [(CRLiOSKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
          double v32 = v31;
          id v117 = 0;
          v33 = [v8 hitKnobAtPoint:v30 inputType:&v117];
          id obj = v117;
          id v34 = v117;
          v113 = v33;
          if (v33
            && [(UITouch *)self->_touch tapCount] >= 2
            && ![v33 worksWithMultipleTaps])
          {
            v10 = v112;
LABEL_73:
            v12 = v116;
            goto LABEL_74;
          }
          BOOL v108 = v30;
          v111 = v34;
          v10 = v112;
          if ((id)[(UITouch *)self->_touch type] == (id)3)
          {
            unsigned int v35 = [(CRLiOSKnobDragGestureRecognizer *)self modifierFlags];
            unsigned int v36 = [(CRLiOSKnobDragGestureRecognizer *)self modifierFlags];
            unsigned __int8 v37 = [(CRLiOSKnobDragGestureRecognizer *)self buttonMask];
            if ((v35 & 0x100000) != 0)
            {
              if ((sub_1002893CC((char)[v113 tag]) & 0x3DE) != 0)
              {
                v40 = [v111 layout];
                unsigned __int8 v41 = [v40 supportsRotation];

                if (v41) {
                  goto LABEL_64;
                }
              }
            }
            else if (*(void *)&v36 & 0x40000 | v37 & 2)
            {
LABEL_64:
              v12 = v116;
              id v34 = v111;
              goto LABEL_74;
            }
          }
          unsigned __int8 v42 = [v112 shouldSelectAndScrollWithApplePencil];
          if (!v113 || (v42 & 1) != 0)
          {
            v12 = v116;
            id v34 = v111;
            if (!v113) {
              goto LABEL_74;
            }
          }
          else
          {
            v12 = v116;
            id v34 = v111;
            if ((id)[(UITouch *)self->_touch type] == (id)2)
            {
              v43 = [v8 freehandDrawingToolkit];
              unsigned __int8 v44 = [v43 isLassoSelectionForMixedTypeEnabledInDrawingMode];

              v12 = v116;
              if (([v113 worksWithStylus] & 1) == 0 && (v44 & 1) == 0) {
                goto LABEL_74;
              }
            }
          }
          knobValidatorBlock = (uint64_t (**)(id, void *, id))self->_knobValidatorBlock;
          if (knobValidatorBlock && (knobValidatorBlock[2](knobValidatorBlock, v113, v34) & 1) == 0)
          {
            if ([(CRLiOSKnobDragGestureRecognizer *)self state])
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E3DC0);
              }
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_10108EA04();
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E3DE0);
              }
              v61 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_10106590C(v61);
              }
              v62 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]");
              v63 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
              +[CRLAssertionHandler handleFailureInFunction:v62 file:v63 lineNumber:184 isFatal:0 description:"Our knob validator block expects to stop knob recognition before we have begun"];

              v10 = v112;
              goto LABEL_64;
            }
          }
          else if ([v113 type] != (id)2)
          {
            objc_storeStrong((id *)&self->_lastHitRep, obj);
            v46 = (CRLCanvasKnobTracker *)[v34 newTrackerForKnob:v113];
            p_tracker = &self->_tracker;
            tracker = self->_tracker;
            self->_tracker = v46;

            v49 = [(CRLCanvasKnobTracker *)self->_tracker knob];

            v50 = self->_tracker;
            obja = (id *)&self->_tracker;
            if (!v50)
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E3E00);
              }
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_10108E958();
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E3E20);
              }
              v51 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_10106590C(v51);
              }
              v52 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]");
              v53 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v52, v53, 197, 0, "invalid nil value for '%{public}s'", "_tracker");

              id v34 = v111;
              v50 = (CRLCanvasKnobTracker *)*obja;
              v10 = v112;
              p_tracker = &self->_tracker;
            }
            [(CRLCanvasKnobTracker *)v50 setInputType:v108];
            [v49 position];
            [v34 convertNaturalPointToUnscaledCanvas];
            double v55 = v54;
            double v57 = v56;
            p_knobToTouchOffset = &self->_knobToTouchOffset;
            v107 = v49;
            if ([(CRLCanvasKnobTracker *)*p_tracker shouldUseKnobOffset])
            {
              double x = sub_100064680(v55, v57, v32);
              p_knobToTouchOffset->double x = x;
              self->_knobToTouchOffset.double y = y;
            }
            else
            {
              CGPoint *p_knobToTouchOffset = CGPointZero;
              double x = p_knobToTouchOffset->x;
              double y = self->_knobToTouchOffset.y;
            }
            -[CRLCanvasKnobTracker i_setKnobOffset:](*p_tracker, "i_setKnobOffset:", x, y);
            if (!self->_secondTouch || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              [(CRLiOSKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
              [(CRLCanvasKnobTracker *)*p_tracker setCurrentPosition:sub_100064698(v64, v65, p_knobToTouchOffset->x)];
              [(CRLiOSKnobDragGestureRecognizer *)self addTarget:v11 action:"handleGestureRecognizer:"];
              [v116 registerTrackerManipulator:self];
              uint64_t v66 = objc_opt_class();
              v67 = sub_1002469D0(v66, *p_tracker);
              if (v67 && self->_secondTouch)
              {
                v68 = [v10 hitRepWithTouch:];
                v69 = [v68 repForSelecting];

                if ([(CRLiOSKnobDragGestureRecognizer *)self p_hitRepIsValid:v69])
                {
                  [v67 setRepToMatch:v69];
                  v70 = v67;
                  uint64_t v71 = 0;
                }
                else
                {
                  [v67 setRepToMatch:0];
                  v70 = v67;
                  uint64_t v71 = 1;
                }
                [v70 setShouldResizeFromCenter:v71];
                secondTouch = self->_secondTouch;
                v74 = [v8 canvasView];
                [(UITouch *)secondTouch locationInView:v74];
                [v67 setSecondaryHUDPoint:];

                id v34 = v111;
              }
              v114 = v67;
              v75 = &self->_tracker;
              v76 = [*obja knob];
              id v77 = [v76 dragType];

              v12 = v116;
              switch((unint64_t)v77)
              {
                case 0uLL:
                  [*obja delay];
                  if (v78 != 0.0) {
                    goto LABEL_134;
                  }
                  +[CRLAssertionHandler _atomicIncrementAssertCount];
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3E40);
                  }
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10108E580();
                  }
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3E60);
                  }
                  v79 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10106590C(v79);
                  }
                  v80 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]");
                  v81 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
                  v82 = v80;
                  v83 = v81;
                  uint64_t v84 = 241;
                  goto LABEL_133;
                case 1uLL:
                  [*obja delay];
                  if (v85 != 0.0) {
                    goto LABEL_134;
                  }
                  +[CRLAssertionHandler _atomicIncrementAssertCount];
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3E80);
                  }
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10108E608();
                  }
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3EA0);
                  }
                  v86 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10106590C(v86);
                  }
                  v80 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]");
                  v81 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
                  v82 = v80;
                  v83 = v81;
                  uint64_t v84 = 247;
                  goto LABEL_133;
                case 2uLL:
                  [(CRLiOSKnobDragGestureRecognizer *)self setState:1];
                  [*obja delay];
                  if (v87 != 0.0)
                  {
                    +[CRLAssertionHandler _atomicIncrementAssertCount];
                    if (qword_101719A70 != -1) {
                      dispatch_once(&qword_101719A70, &stru_1014E3EC0);
                    }
                    v88 = off_10166B4A0;
                    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                      sub_10108E690(obja, v88);
                    }
                    if (qword_101719A70 != -1) {
                      dispatch_once(&qword_101719A70, &stru_1014E3EE0);
                    }
                    v89 = off_10166B4A0;
                    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                      sub_10106590C(v89);
                    }
                    v90 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]");
                    v91 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
                    v75 = &self->_tracker;
                    [*obja delay];
                    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v90, v91, 254, 0, "requesting a delay of %f", v92);

                    id v34 = v111;
                    v10 = v112;
                    v12 = v116;
                  }
                  if ([v12 takeControlWithTrackerManipulator:self])
                  {
                    if ([v11 isInPossibleDynamicOperation])
                    {
                      v93 = [v11 currentlyTransformingReps];
                      [v11 stopTransformingReps:v93];
                    }
                    [v11 beginOperation];
                    v94 = [(CRLCanvasKnobTracker *)*v75 repsToTransform];
                    [v11 startTransformingReps:v94];
                  }
                  break;
                case 3uLL:
                  [*obja delay];
                  if (v95 == 0.0) {
                    break;
                  }
                  +[CRLAssertionHandler _atomicIncrementAssertCount];
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3F00);
                  }
                  v96 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10108E750(obja, v96);
                  }
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3F20);
                  }
                  v97 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10106590C(v97);
                  }
                  v98 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]");
                  v99 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
                  [*obja delay];
                  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v98, v99, 275, 0, "requesting a delay of %f", v100);
                  goto LABEL_145;
                case 4uLL:
                  [*obja delay];
                  if (v101 != 0.0) {
                    goto LABEL_134;
                  }
                  +[CRLAssertionHandler _atomicIncrementAssertCount];
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3F40);
                  }
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10108E810();
                  }
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3F60);
                  }
                  v102 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10106590C(v102);
                  }
                  v80 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]");
                  v81 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
                  v82 = v80;
                  v83 = v81;
                  uint64_t v84 = 281;
LABEL_133:
                  +[CRLAssertionHandler handleFailureInFunction:v82 file:v83 lineNumber:v84 isFatal:0 description:"requesting a delay of 0"];

                  id v34 = v111;
                  v10 = v112;
                  v12 = v116;
                  v75 = &self->_tracker;
LABEL_134:
                  [(CRLCanvasKnobTracker *)*v75 delay];
                  -[CRLiOSKnobDragGestureRecognizer p_requestDelayedKnobTracking:](self, "p_requestDelayedKnobTracking:");
                  break;
                case 5uLL:
                  [*obja delay];
                  if (v103 == 0.0) {
                    break;
                  }
                  +[CRLAssertionHandler _atomicIncrementAssertCount];
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3F80);
                  }
                  v104 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10108E898(obja, v104);
                  }
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E3FA0);
                  }
                  v105 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                    sub_10106590C(v105);
                  }
                  v98 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer touchesBegan:withEvent:]");
                  v99 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
                  [*obja delay];
                  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v98, v99, 287, 0, "requesting a delay of %f", v106);
LABEL_145:

                  id v34 = v111;
                  v10 = v112;
                  v12 = v116;
                  break;
                default:
                  break;
              }

              v72 = v107;
              goto LABEL_75;
            }
            v113 = v49;
            goto LABEL_73;
          }
LABEL_74:
          [(CRLiOSKnobDragGestureRecognizer *)self setState:5];
          v72 = v113;
LABEL_75:

          goto LABEL_28;
        }
      }
      else
      {

        v12 = v116;
      }
    }
LABEL_24:
    [(CRLiOSKnobDragGestureRecognizer *)self setState:5];
    goto LABEL_28;
  }
  if ([(CRLiOSKnobDragGestureRecognizer *)self state] == (id)1
    || [(CRLiOSKnobDragGestureRecognizer *)self state] == (id)2)
  {
    uint64_t v14 = objc_opt_class();
    v15 = sub_1002469D0(v14, self->_tracker);
    if (v15 && !self->_secondTouch)
    {
      v115 = v12;
      v16 = [v6 anyObject];
      v17 = self->_secondTouch;
      self->_secondTouch = v16;

      v18 = [v10 hitRepWithTouch:self->_secondTouch];
      v19 = [v18 repForSelecting];

      if ([(CRLiOSKnobDragGestureRecognizer *)self p_hitRepIsValid:v19])
      {
        [v15 setRepToMatch:v19];
        v20 = v15;
        uint64_t v21 = 0;
      }
      else
      {
        [v15 setRepToMatch:0];
        v20 = v15;
        uint64_t v21 = 1;
      }
      [v20 setShouldResizeFromCenter:v21];
      v38 = self->_secondTouch;
      v39 = [v8 canvasView];
      [(UITouch *)v38 locationInView:v39];
      [v15 setSecondaryHUDPoint:];

      v12 = v115;
    }
  }
LABEL_28:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v61 = a3;
  id v6 = a4;
  id v7 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
  if (self->_touchesMoved) {
    goto LABEL_5;
  }
  UITouchType v8 = [(UITouch *)self->_touch type];
  v9 = (double *)&unk_101178BB8;
  if (v8 != UITouchTypePencil) {
    v9 = (double *)&unk_101178BC0;
  }
  double v10 = *v9;
  [(UITouch *)self->_touch locationInView:0];
  if (sub_1000653B4(v11, v12, self->_originalPointInWindow.x, self->_originalPointInWindow.y) >= v10)
  {
LABEL_5:
    v13 = [(CRLiOSKnobDragGestureRecognizer *)self icc];
    uint64_t v14 = [v13 layerHost];
    v15 = [v14 asUIKitHost];

    v16 = [v13 dynamicOperationController];
    v60 = [v13 tmCoordinator];
    self->_touchesMoved = 1;
    self->_knobTouchHasMoved = 1;
    v17 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
    if (!self->_delayHasElapsed)
    {
      v18 = [(CRLCanvasKnobTracker *)self->_tracker knob];
      if ([v18 dragType] == (id)4)
      {
        v19 = v15;
        id v20 = v6;
        touch = self->_touch;
        v22 = [(UITouch *)touch window];
        v23 = touch;
        id v6 = v20;
        v15 = v19;
        [(UITouch *)v23 locationInView:v22];
        v17 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
        double v26 = sub_1000653B4(self->_originalPointInWindow.x, self->_originalPointInWindow.y, v24, v25);

        id v7 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
        if (v26 >= 14.0)
        {
          [(CRLiOSKnobDragGestureRecognizer *)self setState:5];
          [(CRLiOSKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
        }
      }
      else
      {
      }
    }
    v62.receiver = self;
    v62.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
    id v59 = v6;
    [(CRLiOSKnobDragGestureRecognizer *)&v62 touchesMoved:v61 withEvent:v6];
    if (![v61 containsObject:*(Class *)((char *)&self->super.super.isa + v7[402])]) {
      goto LABEL_24;
    }
    if ([(CRLiOSKnobDragGestureRecognizer *)self state])
    {
      if ([(CRLiOSKnobDragGestureRecognizer *)self state] == (id)1)
      {
        v27 = self;
        uint64_t v28 = 2;
LABEL_22:
        [(CRLiOSKnobDragGestureRecognizer *)v27 setState:v28];
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    CGFloat v29 = v16;
    uint64_t v30 = v17[410];
    double v31 = [*(id *)((char *)&self->super.super.isa + v30) knob];
    if ([v31 dragType] != (id)3)
    {
      double v32 = [*(id *)((char *)&self->super.super.isa + v30) knob];
      if ([v32 dragType] != (id)1)
      {
        v53 = [*(id *)((char *)&self->super.super.isa + v30) knob];
        id v54 = [v53 dragType];

        BOOL v55 = v54 == (id)5;
        v17 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
        if (!v55)
        {
          double v56 = [*(id *)((char *)&self->super.super.isa + v30) knob];
          id v57 = [v56 dragType];

          v16 = v29;
          if (v57 || !self->_delayHasElapsed) {
            goto LABEL_23;
          }
          [(CRLiOSKnobDragGestureRecognizer *)self setState:1];
          goto LABEL_19;
        }
LABEL_18:
        [(CRLiOSKnobDragGestureRecognizer *)self setState:1];
        [(CRLiOSKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
        v16 = v29;
LABEL_19:
        if (![v60 takeControlWithTrackerManipulator:self])
        {
          v27 = self;
          uint64_t v28 = 5;
          goto LABEL_22;
        }
        [v16 beginOperation];
        v33 = +[NSSet setWithObject:self->_lastHitRep];
        [v16 startTransformingReps:v33];

LABEL_23:
        [(CRLiOSKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
        [*(id *)((char *)&self->super.super.isa + v17[410]) setCurrentPosition:sub_100064698(v34, v35, self->_knobToTouchOffset.x)];
LABEL_24:
        unsigned int v36 = [(CRLiOSKnobDragGestureRecognizer *)self modifierFlags];
        uint64_t v37 = objc_opt_class();
        uint64_t v38 = v17[410];
        v39 = sub_1002469D0(v37, *(void **)((char *)&self->super.super.isa + v38));
        if (v39)
        {
          v40 = v16;
          secondTouch = self->_secondTouch;
          if (secondTouch)
          {
            if ([v61 containsObject:self->_secondTouch])
            {
              v58 = v15;
              unsigned __int8 v42 = [v15 hitRepWithTouch:self->_secondTouch];
              v43 = [v42 repForSelecting];

              if ([(CRLiOSKnobDragGestureRecognizer *)self p_hitRepIsValid:v43])
              {
                unsigned __int8 v44 = [v39 repToMatch];

                if (v44 != v43) {
                  [v39 setRepToMatch:v43];
                }
              }
              v45 = self->_secondTouch;
              v46 = [v13 canvasView];
              [(UITouch *)v45 locationInView:v46];
              [v39 setSecondaryHUDPoint:];

              v15 = v58;
            }
          }
          else
          {
            [v39 setShouldResizeFromCenter:(((unint64_t)-[CRLiOSKnobDragGestureRecognizer modifierFlags](self, "modifierFlags") >> 19) & 1)];
            [v39 setPreserveAspectRatio:(((unint64_t)-[CRLiOSKnobDragGestureRecognizer modifierFlags](self, "modifierFlags") >> 17) & 1)];
          }
          [v39 setSuppressSecondaryHUD:secondTouch == 0];
          [v39 setSnapToGuides:(*(void *)&v36 & 0x100000) == 0];
          v16 = v40;
        }
        uint64_t v47 = objc_opt_class();
        v48 = sub_1002469D0(v47, *(void **)((char *)&self->super.super.isa + v38));
        v49 = v48;
        if (v48)
        {
          [v48 setShouldSnapToMagnets:(*(void *)&v36 & 0x100000) == 0];
          [v49 setSnapEnabled:(*(void *)&v36 & 0x100000) == 0];
        }
        uint64_t v50 = objc_opt_class();
        v51 = sub_1002469D0(v50, *(void **)((char *)&self->super.super.isa + v38));
        v52 = v51;
        if (v51) {
          [v51 setSnapEnabled:(*(void *)&v36 & 0x100000) == 0];
        }
        if ([(CRLiOSKnobDragGestureRecognizer *)self state] == (id)2
          && [*(id *)((char *)&self->super.super.isa + v38) wantsAutoscroll])
        {
          [(CRLiOSKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
          +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self);
        }

        id v6 = v59;
        goto LABEL_41;
      }
    }
    goto LABEL_18;
  }
LABEL_41:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  UITouchType v8 = [(CRLiOSKnobDragGestureRecognizer *)self icc];
  v9 = [v8 layerHost];
  double v10 = [v9 asUIKitHost];
  double v11 = (objc_class *)objc_opt_class();
  v17 = sub_100246E2C(v10, v11, 1, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLUIKitInteractionHost);

  v18 = [v8 dynamicOperationController];
  v19 = [v8 tmCoordinator];
  v39.receiver = self;
  v39.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  [(CRLiOSKnobDragGestureRecognizer *)&v39 touchesEnded:v6 withEvent:v7];

  if (![v6 containsObject:self->_touch]) {
    goto LABEL_22;
  }
  if (![(CRLiOSKnobDragGestureRecognizer *)self state])
  {
    v27 = [(CRLCanvasKnobTracker *)self->_tracker knob];
    if ([v27 dragType])
    {
      uint64_t v28 = [(CRLCanvasKnobTracker *)self->_tracker knob];
      id v29 = [v28 dragType];

      if (v29 != (id)3) {
        goto LABEL_3;
      }
    }
    else
    {
    }
    [(CRLiOSKnobDragGestureRecognizer *)self setState:5];
    goto LABEL_22;
  }
LABEL_3:
  if (![(CRLiOSKnobDragGestureRecognizer *)self state] && !self->_delayHasElapsed)
  {
    uint64_t v30 = [(CRLCanvasKnobTracker *)self->_tracker knob];
    if ([v30 dragType] != (id)4)
    {
      double v31 = [(CRLCanvasKnobTracker *)self->_tracker knob];
      if ([v31 dragType])
      {
        double v32 = [(CRLCanvasKnobTracker *)self->_tracker knob];
        id v33 = [v32 dragType];

        if (v33 != (id)1) {
          goto LABEL_5;
        }
LABEL_21:
        [(CRLiOSKnobDragGestureRecognizer *)self setState:5];
        [(CRLiOSKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
        goto LABEL_22;
      }
    }
    goto LABEL_21;
  }
LABEL_5:
  if ([(CRLiOSKnobDragGestureRecognizer *)self state]
    || ([(CRLCanvasKnobTracker *)self->_tracker knob],
        id v20 = objc_claimAutoreleasedReturnValue(),
        id v21 = [v20 dragType],
        v20,
        v21 != (id)5))
  {
    [(CRLiOSKnobDragGestureRecognizer *)self setState:3];
    [(CRLiOSKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
    [(CRLCanvasKnobTracker *)self->_tracker setCurrentPosition:sub_100064698(v25, v26, self->_knobToTouchOffset.x)];
    [(CRLCanvasKnobTracker *)self->_tracker setDragEnding:1];
    [(CRLCanvasAutoscroll *)self->_autoscroll invalidate];
  }
  else
  {
    [(CRLiOSKnobDragGestureRecognizer *)self setState:3];
    [(CRLiOSKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
    [(CRLCanvasKnobTracker *)self->_tracker setCurrentPosition:sub_100064698(v22, v23, self->_knobToTouchOffset.x)];
    [(CRLCanvasKnobTracker *)self->_tracker setDragEnding:1];
    if ([v19 takeControlWithTrackerManipulator:self])
    {
      [v18 beginOperation];
      double v24 = +[NSSet setWithObject:self->_lastHitRep];
      [v18 startTransformingReps:v24];
    }
  }
LABEL_22:
  if (self->_secondTouch && objc_msgSend(v6, "containsObject:"))
  {
    secondTouch = self->_secondTouch;
    self->_secondTouch = 0;

    uint64_t v35 = objc_opt_class();
    unsigned int v36 = sub_1002469D0(v35, self->_tracker);
    [v36 setRepToMatch:0];
    [v36 setShouldResizeFromCenter:0];
  }
  if (!self->_touchesMoved)
  {
    lastHitRep = self->_lastHitRep;
    if (lastHitRep)
    {
      if ([(CRLCanvasRep *)lastHitRep isSelected]
        && [(CRLCanvasKnobTracker *)self->_tracker allowHUDToDisplay]
        && [(CRLiOSKnobDragGestureRecognizer *)self state] == (id)3)
      {
        [v17 performSelector:"toggleDefaultEditUIForCurrentSelection" withObject:0 afterDelay:0.0];
        uint64_t v38 = self->_lastHitRep;
        self->_lastHitRep = 0;
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CRLiOSKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSKnobDragGestureRecognizer;
  [(CRLiOSKnobDragGestureRecognizer *)&v14 touchesCancelled:v6 withEvent:v7];

  if ([v6 containsObject:self->_touch])
  {
    if (![(CRLiOSKnobDragGestureRecognizer *)self state])
    {
      UITouchType v8 = self;
      uint64_t v9 = 5;
      goto LABEL_9;
    }
    if ([(CRLiOSKnobDragGestureRecognizer *)self state] == (id)1
      || [(CRLiOSKnobDragGestureRecognizer *)self state] == (id)2)
    {
      UITouchType v8 = self;
      uint64_t v9 = 4;
LABEL_9:
      [(CRLiOSKnobDragGestureRecognizer *)v8 setState:v9];
    }
  }
  else if ([v6 containsObject:self->_secondTouch])
  {
    secondTouch = self->_secondTouch;
    self->_secondTouch = 0;

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = sub_1002469D0(v11, self->_tracker);
    [v12 setRepToMatch:0];
    [v12 setShouldResizeFromCenter:0];
  }
  lastHitRep = self->_lastHitRep;
  self->_lastHitRep = 0;
}

- (void)cancelBecauseOfRotation
{
  if (self->_tracker) {
    [(CRLiOSKnobDragGestureRecognizer *)self setState:5];
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_tracker;
}

- (BOOL)readyToEndOperation
{
  return [(CRLiOSKnobDragGestureRecognizer *)self state] == (id)3;
}

- (void)operationDidEnd
{
  id v20 = [(CRLiOSKnobDragGestureRecognizer *)self icc];
  objc_super v3 = [v20 layerHost];
  id v4 = [v3 asUIKitHost];
  objc_super v5 = (objc_class *)objc_opt_class();
  uint64_t v11 = sub_100246E2C(v4, v5, 1, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLUIKitInteractionHost);

  uint64_t v12 = [v20 dynamicOperationController];
  uint64_t v13 = [v20 tmCoordinator];
  objc_super v14 = v13;
  if (self->_tracker)
  {
    uint64_t v15 = [v13 controllingTM];
    if (v15 == self
      && !self->_touchesMoved
      && (lastHitRep = self->_lastHitRep) != 0
      && [(CRLCanvasRep *)lastHitRep isSelected])
    {
      unsigned int v19 = [(CRLCanvasKnobTracker *)self->_tracker allowHUDToDisplay];

      if (v19) {
        [v11 performSelector:"toggleDefaultEditUIForCurrentSelection" withObject:0 afterDelay:0.0];
      }
    }
    else
    {
    }
    [(CRLiOSKnobDragGestureRecognizer *)self removeTarget:v12 action:"handleGestureRecognizer:"];
    tracker = self->_tracker;
    self->_tracker = 0;

    [(CRLiOSKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
  }
  secondTouch = self->_secondTouch;
  if (secondTouch && !self->_touch)
  {
    self->_secondTouch = 0;
  }
}

- (void)p_cancelDelayedKnobTracking
{
}

- (void)p_requestDelayedKnobTracking:(double)a3
{
  self->_delayHasElapsed = 0;
  [(CRLiOSKnobDragGestureRecognizer *)self performSelector:"p_triggerDelayedKnobTracking:" withObject:0 afterDelay:a3];
}

- (void)p_triggerDelayedKnobTracking:(id)a3
{
  id v4 = [(CRLiOSKnobDragGestureRecognizer *)self icc];
  objc_super v5 = [v4 dynamicOperationController];
  uint64_t v6 = [v4 tmCoordinator];
  self->_delayHasElapsed = 1;
  if ([(CRLiOSKnobDragGestureRecognizer *)self state])
  {
    if ([(CRLiOSKnobDragGestureRecognizer *)self state] != (id)5)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3FC0);
      }
      uint64_t v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108EB9C(v7);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3FE0);
      }
      uint64_t v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]");
      uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
      uint64_t v11 = sub_100380B10((unint64_t)[(CRLiOSKnobDragGestureRecognizer *)self state]);
      +[CRLAssertionHandler handleFailureInFunction:v9, v10, 590, 0, "delay fired when knob GR in state %@", v11 file lineNumber isFatal description];

LABEL_48:
    }
  }
  else
  {
    tracker = self->_tracker;
    if (!tracker)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E4000);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108EA8C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E4020);
      }
      v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v18);
      }
      uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]");
      uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
      +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:595 isFatal:0 description:"Delayed knob tracking timer fired when we have no tracker!"];
      goto LABEL_48;
    }
    uint64_t v13 = [(CRLCanvasKnobTracker *)tracker knob];
    unint64_t v14 = (unint64_t)[v13 dragType];

    if (v14 <= 5)
    {
      if (((1 << v14) & 0x2C) != 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E4040);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10108EB14();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E4060);
        }
        uint64_t v15 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v15);
        }
        uint64_t v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]");
        v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSKnobDragGestureRecognizer.m"];
        +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:603 isFatal:0 description:"shouldn't have delayed knob tracking!"];
      }
      else if (((1 << v14) & 0x12) != 0 || self->_knobTouchHasMoved)
      {
        [(CRLiOSKnobDragGestureRecognizer *)self setState:1];
      }
    }
    if ([(CRLiOSKnobDragGestureRecognizer *)self state] == (id)1
      && [v6 takeControlWithTrackerManipulator:self])
    {
      if ([v5 isInPossibleDynamicOperation])
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        unsigned int v19 = [v5 currentlyTransformingReps];
        id v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v26;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v26 != v22) {
                objc_enumerationMutation(v19);
              }
              [*(id *)(*((void *)&v25 + 1) + 8 * i) setShowKnobsDuringManipulation:0];
            }
            id v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v21);
        }

        double v24 = [v5 currentlyTransformingReps];
        [v5 stopTransformingReps:v24];
      }
      [v5 beginOperation];
      uint64_t v9 = [(CRLCanvasKnobTracker *)self->_tracker rep];
      uint64_t v10 = +[NSSet setWithObject:v9];
      [v5 startTransformingReps:v10];
      goto LABEL_48;
    }
  }
}

- (CRLInteractiveCanvasController)icc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void)updateAfterAutoscroll:(id)a3
{
  id v4 = a3;
  [(CRLiOSKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
  [(CRLCanvasKnobTracker *)self->_tracker setCurrentPosition:sub_100064698(v5, v6, self->_knobToTouchOffset.x)];
  [(CRLCanvasKnobTracker *)self->_tracker updateAfterAutoscroll:v4];

  [(CRLiOSKnobDragGestureRecognizer *)self setState:2];
}

- (void)autoscrollWillNotStart
{
}

- (double)unscaledStartAutoscrollThreshold
{
  [(CRLCanvasKnobTracker *)self->_tracker unscaledStartAutoscrollThreshold];
  return result;
}

- (int)allowedAutoscrollDirections
{
  return [(CRLCanvasKnobTracker *)self->_tracker allowedAutoscrollDirections];
}

- (BOOL)p_hitRepIsValid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = sub_1002469D0(v5, self->_tracker);
  uint64_t v7 = v6;
  if (!v4 || ([v6 rep], id v8 = (id)objc_claimAutoreleasedReturnValue(), v8, v8 == v4))
  {
    BOOL v11 = 0;
  }
  else
  {
    [v4 boundsForStandardKnobs];
    BOOL v11 = v10 > 1.0 && v9 > 1.0;
  }

  return v11;
}

- (CGPoint)p_pointInUnscaledCanvas
{
  objc_super v3 = [(CRLiOSKnobDragGestureRecognizer *)self icc];
  touch = self->_touch;
  uint64_t v5 = [v3 canvasView];
  [(UITouch *)touch locationInView:v5];
  [v3 convertBoundsToUnscaledPoint:];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
}

- (id)knobValidatorBlock
{
  return self->_knobValidatorBlock;
}

- (void)setKnobValidatorBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_knobValidatorBlock, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_lastHitRep, 0);
  objc_storeStrong((id *)&self->_secondTouch, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_touch, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end