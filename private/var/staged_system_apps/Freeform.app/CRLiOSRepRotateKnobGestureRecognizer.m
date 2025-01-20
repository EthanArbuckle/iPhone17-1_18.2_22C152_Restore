@interface CRLiOSRepRotateKnobGestureRecognizer
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)p_shouldRotateAroundOppositeKnob;
- (BOOL)readyToEndOperation;
- (CGPoint)p_rotationCenterInNaturalSpace;
- (CGPoint)p_rotationCenterInParentSpace;
- (CGPoint)p_rotationCenterInUnscaledSpace;
- (CRLCanvasKnob)knob;
- (CRLCanvasRep)rep;
- (CRLCanvasRepRotateTracking)tracker;
- (CRLiOSRepRotateKnobGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (double)p_angleInRadiansForPoint:(CGPoint)a3;
- (unint64_t)p_standardKnobTagBeingDragged;
- (void)operationDidEnd;
- (void)p_updateTrackerStateAtUnscaledPoint:(CGPoint)a3;
- (void)reset;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setKnob:(id)a3;
- (void)setRep:(id)a3;
- (void)setTracker:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CRLiOSRepRotateKnobGestureRecognizer

- (CRLiOSRepRotateKnobGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  v5 = [(CRLiOSRepRotateKnobGestureRecognizer *)&v9 initWithTarget:0 action:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v8.receiver = v6;
    v8.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
    [(CRLiOSRepRotateKnobGestureRecognizer *)&v8 setAllowedTouchTypes:&off_10155C380];
  }

  return v6;
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  [(CRLiOSRepRotateKnobGestureRecognizer *)&v4 reset];
  [(CRLiOSRepRotateKnobGestureRecognizer *)self setTracker:0];
  [(CRLiOSRepRotateKnobGestureRecognizer *)self setRep:0];
  [(CRLiOSRepRotateKnobGestureRecognizer *)self setKnob:0];
  self->_rotatingAroundOppositeKnob = 0;
  self->_lastAngleInRadians = 0.0;
  CGPoint v3 = CGPointZero;
  self->_unscaledRotationCenter = CGPointZero;
  self->_knobToTouchUnscaledOffset = v3;
  self->_repCenterInNaturalSpace = v3;
  self->_oppositeKnobPositionInNaturalSpace = (CGPoint)xmmword_101175160;
}

- (void)setAllowedTouchTypes:(id)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE978);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101085A20();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE998);
  }
  CGPoint v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v3);
  }
  objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateKnobGestureRecognizer setAllowedTouchTypes:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateKnobGestureRecognizer.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:78 isFatal:0 description:"Should not be trying to customize the touch types for this gesture!"];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE9B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101085B30();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE9D8);
    }
    objc_super v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    objc_super v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateKnobGestureRecognizer touchesBegan:withEvent:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateKnobGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:83 isFatal:0 description:"Only expect a single touch in this logic."];
  }
  if ([(CRLiOSRepRotateKnobGestureRecognizer *)self state])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE9F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101085AA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEA18);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateKnobGestureRecognizer touchesBegan:withEvent:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateKnobGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:84 isFatal:0 description:"Only expect a touch to begin when we are possible."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v15 = [WeakRetained dynamicOperationController];
  v16 = [WeakRetained tmCoordinator];
  if (([(CRLiOSRepRotateKnobGestureRecognizer *)self state]
     || ![WeakRetained currentlyScrolling])
    && (v67.receiver = self,
        v67.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer,
        [(CRLiOSRepRotateKnobGestureRecognizer *)&v67 touchesBegan:v6 withEvent:v7],
        ([(CRLiOSRepRotateKnobGestureRecognizer *)self modifierFlags] & 0x100000) != 0))
  {
    v17 = [v6 anyObject];
    v18 = [WeakRetained canvasView];
    [v17 locationInView:v18];
    [WeakRetained convertBoundsToUnscaledPoint:];
    double v20 = v19;
    double v22 = v21;

    id v66 = 0;
    v23 = objc_msgSend(WeakRetained, "hitKnobAtPoint:inputType:returningRep:", sub_10036FEA4((BOOL)objc_msgSend(v17, "type")), &v66, v20, v22);
    id v24 = v66;
    if (v23
      && (sub_1002893CC((char)[v23 tag]) & 0x3DE) != 0
      && ([v24 layout],
          v65 = v24,
          v25 = objc_claimAutoreleasedReturnValue(),
          unsigned int v26 = [v25 supportsRotation],
          v25,
          id v24 = v65,
          v26))
    {
      v62 = v17;
      [(CRLiOSRepRotateKnobGestureRecognizer *)self setRep:v65];
      [(CRLiOSRepRotateKnobGestureRecognizer *)self setKnob:v23];
      [(CRLiOSRepRotateKnobGestureRecognizer *)self setState:1];
      [v65 centerForRotation];
      self->_repCenterInNaturalSpace.x = v27;
      self->_repCenterInNaturalSpace.y = v28;
      uint64_t v29 = sub_1002895C8([(CRLiOSRepRotateKnobGestureRecognizer *)self p_standardKnobTagBeingDragged]);
      v30 = [(CRLiOSRepRotateKnobGestureRecognizer *)self rep];
      uint64_t v31 = v29;
      v32 = [v30 knobForTag:v29];

      v64 = v32;
      if (v32)
      {
        [v32 position];
        self->_oppositeKnobPositionInNaturalSpace.x = v33;
        self->_oppositeKnobPositionInNaturalSpace.y = v34;
      }
      else if ((unint64_t)(v31 - 1) <= 8)
      {
        uint64_t v35 = v31;
        v36 = [CRLCanvasKnob alloc];
        v37 = [(CRLiOSRepRotateKnobGestureRecognizer *)self rep];
        v61 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v36, "initWithType:position:radius:tag:onRep:", 0, v35, v37, CGPointZero.x, CGPointZero.y, 15.0);

        v38 = [(CRLiOSRepRotateKnobGestureRecognizer *)self rep];
        v39 = [(CRLiOSRepRotateKnobGestureRecognizer *)self rep];
        [v39 trackingBoundsForStandardKnobs];
        [v38 positionOfStandardKnob:v61];
        self->_oppositeKnobPositionInNaturalSpace.x = v40;
        self->_oppositeKnobPositionInNaturalSpace.y = v41;
      }
      v42 = [v65 interactiveCanvasController];
      v43 = [v42 customRotateTrackerForCurrentSelection];
      [(CRLiOSRepRotateKnobGestureRecognizer *)self setTracker:v43];

      v44 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];

      v17 = v62;
      if (!v44)
      {
        v45 = [[CRLCanvasRepRotateTracker alloc] initWithRep:v65];
        [(CRLiOSRepRotateKnobGestureRecognizer *)self setTracker:v45];
      }
      uint64_t v46 = objc_opt_class();
      v47 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
      v48 = sub_1002469D0(v46, v47);

      if (v48)
      {
        [v48 setShouldRespectScaledHUDPosition:1];
        [v48 setShouldShowGuides:0];
      }
      v63 = v48;
      [(CRLiOSRepRotateKnobGestureRecognizer *)self addTarget:v15 action:"handleGestureRecognizer:"];
      [v16 registerTrackerManipulator:self];
      id v24 = v65;
      if ([v16 takeControlWithTrackerManipulator:self])
      {
        if ([v15 isInPossibleDynamicOperation])
        {
          v49 = [v15 currentlyTransformingReps];
          [v15 stopTransformingReps:v49];
        }
        [v15 beginOperation];
        v50 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
        v51 = [v50 repsBeingRotated];
        [v15 startTransformingReps:v51];

        id v24 = v65;
      }
      [v23 position];
      [v24 convertNaturalPointToUnscaledCanvas:];
      self->_knobToTouchUnscaledOffset.x = sub_100064680(v52, v53, v20);
      self->_knobToTouchUnscaledOffset.y = v54;
      self->_rotatingAroundOppositeKnob = [(CRLiOSRepRotateKnobGestureRecognizer *)self p_shouldRotateAroundOppositeKnob];
      [(CRLiOSRepRotateKnobGestureRecognizer *)self p_rotationCenterInUnscaledSpace];
      double v56 = v55;
      double v58 = v57;
      self->_unscaledRotationCenter.x = v55;
      self->_unscaledRotationCenter.y = v57;
      v59 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
      [v59 setUnscaledCenterForRotation:v56, v58];

      -[CRLiOSRepRotateKnobGestureRecognizer p_angleInRadiansForPoint:](self, "p_angleInRadiansForPoint:", v20, v22);
      self->_lastAngleInRadians = v60;
      -[CRLiOSRepRotateKnobGestureRecognizer p_updateTrackerStateAtUnscaledPoint:](self, "p_updateTrackerStateAtUnscaledPoint:", v20, v22);
    }
    else
    {
      [(CRLiOSRepRotateKnobGestureRecognizer *)self setState:5];
    }
  }
  else
  {
    [(CRLiOSRepRotateKnobGestureRecognizer *)self setState:5];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  id v6 = a3;
  [(CRLiOSRepRotateKnobGestureRecognizer *)&v14 touchesMoved:v6 withEvent:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_super v8 = [v6 anyObject];

  objc_super v9 = [WeakRetained canvasView];
  [v8 locationInView:v9];
  [WeakRetained convertBoundsToUnscaledPoint:];
  double v11 = v10;
  double v13 = v12;

  -[CRLiOSRepRotateKnobGestureRecognizer p_updateTrackerStateAtUnscaledPoint:](self, "p_updateTrackerStateAtUnscaledPoint:", v11, v13);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  [(CRLiOSRepRotateKnobGestureRecognizer *)&v9 touchesEnded:a3 withEvent:a4];
  if ([(CRLiOSRepRotateKnobGestureRecognizer *)self state])
  {
    uint64_t v5 = 3;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEA38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101085BB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEA58);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateKnobGestureRecognizer touchesEnded:withEvent:]");
    objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateKnobGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:184 isFatal:0 description:"Should have made a decision before touchesEnded"];

    uint64_t v5 = 5;
  }
  [(CRLiOSRepRotateKnobGestureRecognizer *)self setState:v5];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  [(CRLiOSRepRotateKnobGestureRecognizer *)&v6 touchesCancelled:a3 withEvent:a4];
  unint64_t v5 = (unint64_t)[(CRLiOSRepRotateKnobGestureRecognizer *)self state];
  if (v5 <= 5) {
    [(CRLiOSRepRotateKnobGestureRecognizer *)self setState:qword_101176358[v5]];
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasRepRotateTracking)tracker
{
  return self->_tracker;
}

- (BOOL)readyToEndOperation
{
  return [(CRLiOSRepRotateKnobGestureRecognizer *)self state] == (id)3;
}

- (void)operationDidEnd
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  id v5 = [WeakRetained dynamicOperationController];

  if (self->_tracker)
  {
    [(CRLiOSRepRotateKnobGestureRecognizer *)self removeTarget:v5 action:"handleGestureRecognizer:"];
    tracker = self->_tracker;
    self->_tracker = 0;
  }
}

- (void)p_updateTrackerStateAtUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (((unint64_t)[(CRLiOSRepRotateKnobGestureRecognizer *)self modifierFlags] & 0x20000) != 0) {
    double v6 = 22.5;
  }
  else {
    double v6 = 0.0;
  }
  id v7 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
  [v7 setSnapThreshold:v6];

  -[CRLiOSRepRotateKnobGestureRecognizer p_angleInRadiansForPoint:](self, "p_angleInRadiansForPoint:", x, y);
  double v9 = v8;
  double v10 = v8 - self->_lastAngleInRadians;
  double v11 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
  [v11 addRotateDelta:v10];

  self->_lastAngleInRadians = v9;
  BOOL v12 = [(CRLiOSRepRotateKnobGestureRecognizer *)self p_shouldRotateAroundOppositeKnob];
  if (self->_rotatingAroundOppositeKnob != v12)
  {
    self->_rotatingAroundOppositeKnob = v12;
    double v13 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
    [v13 currentTotalAngleOfRotationInRadians];
    double v15 = v14;

    v16 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
    [v16 addRotateDelta:-v15];

    [(CRLiOSRepRotateKnobGestureRecognizer *)self p_rotationCenterInUnscaledSpace];
    double v18 = v17;
    double v20 = v19;
    self->_unscaledRotationCenter.double x = v17;
    self->_unscaledRotationCenter.double y = v19;
    double v21 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
    [v21 setUnscaledCenterForRotation:v18, v20];

    -[CRLiOSRepRotateKnobGestureRecognizer p_angleInRadiansForPoint:](self, "p_angleInRadiansForPoint:", x, y);
    double v23 = v22;
    uint64_t v24 = [(CRLiOSRepRotateKnobGestureRecognizer *)self p_standardKnobTagBeingDragged];
    v25 = [(CRLiOSRepRotateKnobGestureRecognizer *)self rep];
    [v25 boundsForStandardKnobs];
    *(double *)&long long v30 = sub_100289A18(v24, v26, v27, v28, v29);
    long long v45 = v31;
    long long v46 = v30;

    v32 = [(CRLiOSRepRotateKnobGestureRecognizer *)self rep];
    CGFloat v33 = [v32 layout];
    CGFloat v34 = v33;
    if (v33)
    {
      [v33 originalTransformInRoot:v45, v46];
      float64x2_t v35 = v48;
      float64x2_t v36 = v49;
      float64x2_t v37 = v50;
    }
    else
    {
      float64x2_t v37 = 0uLL;
      float64x2_t v35 = 0uLL;
      float64x2_t v36 = 0uLL;
    }
    float64x2_t v47 = vaddq_f64(v37, vmlaq_n_f64(vmulq_n_f64(v36, *(double *)&v45), v35, *(double *)&v46));

    [(CRLiOSRepRotateKnobGestureRecognizer *)self p_angleInRadiansForPoint:*(_OWORD *)&v47];
    double v39 = v23 - v38;
    CGFloat v40 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
    [v40 addRotateDelta:v39];

    self->_lastAngleInRadians = v23;
  }
  uint64_t v41 = objc_opt_class();
  v42 = [(CRLiOSRepRotateKnobGestureRecognizer *)self tracker];
  v43 = sub_1002469D0(v41, v42);

  if (v43)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    [WeakRetained convertUnscaledToBoundsPoint:x, y];
    [v43 setScaledHUDPosition:];
  }
}

- (double)p_angleInRadiansForPoint:(CGPoint)a3
{
  long double v3 = sub_100064680(a3.x, a3.y, self->_unscaledRotationCenter.x);

  return sub_1000662B0(v3, v4);
}

- (BOOL)p_shouldRotateAroundOppositeKnob
{
  unsigned int v3 = [(CRLiOSRepRotateKnobGestureRecognizer *)self modifierFlags];
  return !sub_100065BF8(self->_oppositeKnobPositionInNaturalSpace.x, self->_oppositeKnobPositionInNaturalSpace.y) & (v3 >> 19);
}

- (CGPoint)p_rotationCenterInUnscaledSpace
{
  [(CRLiOSRepRotateKnobGestureRecognizer *)self p_rotationCenterInNaturalSpace];
  double v13 = v4;
  double v14 = v3;
  id v5 = [(CRLiOSRepRotateKnobGestureRecognizer *)self rep];
  double v6 = [v5 layout];
  id v7 = v6;
  if (v6)
  {
    [v6 originalTransformInRoot];
    float64x2_t v8 = v16;
    float64x2_t v9 = v17;
    float64x2_t v10 = v18;
  }
  else
  {
    float64x2_t v10 = 0uLL;
    float64x2_t v8 = 0uLL;
    float64x2_t v9 = 0uLL;
  }
  float64x2_t v15 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v13), v8, v14));

  double v12 = v15.f64[1];
  double v11 = v15.f64[0];
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)p_rotationCenterInParentSpace
{
  double v3 = [(CRLiOSRepRotateKnobGestureRecognizer *)self rep];
  double v4 = [v3 layout];
  id v5 = [v4 originalGeometry];

  [(CRLiOSRepRotateKnobGestureRecognizer *)self p_rotationCenterInNaturalSpace];
  if (v5)
  {
    double v13 = v7;
    double v14 = v6;
    [v5 transform];
    double v7 = v13;
    double v6 = v14;
    float64x2_t v9 = v16;
    float64x2_t v8 = v17;
    float64x2_t v10 = v18;
  }
  else
  {
    float64x2_t v10 = 0uLL;
    float64x2_t v9 = 0uLL;
    float64x2_t v8 = 0uLL;
  }
  float64x2_t v15 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v8, v7), v9, v6));

  double v12 = v15.f64[1];
  double v11 = v15.f64[0];
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)p_rotationCenterInNaturalSpace
{
  if (self->_rotatingAroundOppositeKnob) {
    v2 = &OBJC_IVAR___CRLiOSRepRotateKnobGestureRecognizer__oppositeKnobPositionInNaturalSpace;
  }
  else {
    v2 = &OBJC_IVAR___CRLiOSRepRotateKnobGestureRecognizer__repCenterInNaturalSpace;
  }
  double v3 = (double *)((char *)self + *v2);
  double v4 = *v3;
  double v5 = v3[1];
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (unint64_t)p_standardKnobTagBeingDragged
{
  v2 = [(CRLiOSRepRotateKnobGestureRecognizer *)self knob];
  id v3 = [v2 tag];

  return (unint64_t)v3;
}

- (CRLCanvasKnob)knob
{
  return self->_knob;
}

- (void)setKnob:(id)a3
{
}

- (CRLCanvasRep)rep
{
  return self->_rep;
}

- (void)setRep:(id)a3
{
}

- (void)setTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_rep, 0);
  objc_storeStrong((id *)&self->_knob, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end