@interface TSDKnobDragGestureRecognizer
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)p_hitRepIsValid:(id)a3;
- (BOOL)readyToEndOperation;
- (CGPoint)autoscrollPoint;
- (CGPoint)p_pointInUnscaledCanvas;
- (TSDAutoscroll)autoscroll;
- (TSDInteractiveCanvasController)icc;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (TSDKnobDragGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (double)unscaledStartAutoscrollThreshold;
- (id)tracker;
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
- (void)setAutoscrollPoint:(CGPoint)a3;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateAfterAutoscroll:(id)a3;
@end

@implementation TSDKnobDragGestureRecognizer

- (TSDKnobDragGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSDKnobDragGestureRecognizer;
  v4 = [(TSDKnobDragGestureRecognizer *)&v8 initWithTarget:0 action:0];
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer initWithInteractiveCanvasController:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"), 55, @"invalid nil value for '%s'", "icc");
    }
    v4->mICC = (TSDInteractiveCanvasController *)a3;
    v4->mCVC = (TSDiOSCanvasViewController *)objc_msgSend((id)objc_msgSend(a3, "layerHost"), "asiOSCVC");
  }
  return v4;
}

- (void)dealloc
{
  [(TSDKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
  v3.receiver = self;
  v3.super_class = (Class)TSDKnobDragGestureRecognizer;
  [(TSDKnobDragGestureRecognizer *)&v3 dealloc];
}

- (void)setState:(int64_t)a3
{
  [(TSDKnobDragGestureRecognizer *)self state];
  v5.receiver = self;
  v5.super_class = (Class)TSDKnobDragGestureRecognizer;
  [(TSDKnobDragGestureRecognizer *)&v5 setState:a3];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)TSDKnobDragGestureRecognizer;
  [(TSDKnobDragGestureRecognizer *)&v3 reset];
  [(TSDKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];

  self->mTouch = 0;
  self->mSecondTouch = 0;
  self->mKnobToTouchOffset = (CGPoint)*MEMORY[0x263F00148];

  self->mLastHitRep = 0;
  self->mTouchesMoved = 0;
  self->mKnobTouchHasMoved = 0;
  self->mDelayHasElapsed = 0;

  self->mTracker = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (![(TSDKnobDragGestureRecognizer *)self state]
    && [(TSDInteractiveCanvasController *)self->mICC currentlyScrolling]
    || [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] isInOperation]&& ![(TSDKnobDragGestureRecognizer *)self state])
  {
    [(TSDKnobDragGestureRecognizer *)self setState:5];
  }
  else
  {
    v58.receiver = self;
    v58.super_class = (Class)TSDKnobDragGestureRecognizer;
    [(TSDKnobDragGestureRecognizer *)&v58 touchesBegan:a3 withEvent:a4];
    self->mTouchesMoved = 0;

    self->mLastHitRep = 0;
    [(UITouch *)self->mTouch locationInView:[(UITouch *)self->mTouch window]];
    self->mOriginalPointInWindow.double x = v7;
    self->mOriginalPointInWindow.double y = v8;
    if ([(TSDKnobDragGestureRecognizer *)self state])
    {
      if ([(TSDKnobDragGestureRecognizer *)self state] != 1) {
        [(TSDKnobDragGestureRecognizer *)self state];
      }
      return;
    }
    if ([a3 count] != 1) {
      goto LABEL_24;
    }
    if (self->mTouch) {
      goto LABEL_24;
    }
    v9 = (UITouch *)(id)[a3 anyObject];
    self->mTouch = v9;
    if ([(UITouch *)v9 tapCount] != 1) {
      goto LABEL_24;
    }
    [(TSDKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
    double v11 = v10;
    id v57 = 0;
    id v12 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->mICC, "hitKnobAtPoint:returningRep:", &v57);
    if (!v12 || (id v13 = v12, [v12 type] == 3))
    {
      id v57 = (id)objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->mICC, "layerHost"), "asiOSCVC"), "hitRepWithTouch:", self->mTouch), "repForDragging");
      if (v57)
      {
        [(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] registerTrackerManipulator:self];
        self->mSecondTouch = self->mTouch;

        self->mTouch = 0;
        return;
      }
      goto LABEL_24;
    }
    self->mLastHitRep = (TSDRep *)v57;

    v14 = (TSDKnobTracker *)[v57 newTrackerForKnob:v13];
    self->mTracker = v14;
    v15 = [(TSDKnobTracker *)v14 knob];
    if (!self->mTracker)
    {
      v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"), 143, @"invalid nil value for '%s'", "mTracker");
    }
    id v18 = v57;
    [(TSDKnob *)v15 position];
    objc_msgSend(v18, "convertNaturalPointToUnscaledCanvas:");
    double v20 = v19;
    double v22 = v21;
    p_mKnobToTouchOffset = &self->mKnobToTouchOffset;
    if ([(TSDKnobTracker *)self->mTracker shouldUseKnobOffset])
    {
      double x = TSDSubtractPoints(v20, v22, v11);
      p_mKnobToTouchOffset->double x = x;
      self->mKnobToTouchOffset.double y = y;
    }
    else
    {
      CGPoint *p_mKnobToTouchOffset = *(CGPoint *)MEMORY[0x263F00148];
      double x = p_mKnobToTouchOffset->x;
      double y = self->mKnobToTouchOffset.y;
    }
    -[TSDKnobTracker i_setKnobOffset:](self->mTracker, "i_setKnobOffset:", x, y);
    if (self->mSecondTouch)
    {
LABEL_24:
      [(TSDKnobDragGestureRecognizer *)self setState:5];
      return;
    }
    [(TSDKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
    [(TSDKnobTracker *)self->mTracker setCurrentPosition:TSDAddPoints(v26, v27, p_mKnobToTouchOffset->x)];
    [(TSDKnobDragGestureRecognizer *)self addTarget:[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] action:sel_handleGestureRecognizer_];
    [(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] registerTrackerManipulator:self];
    switch([[(TSDKnobTracker *)self->mTracker knob] dragType])
    {
      case 0:
        [(TSDKnobTracker *)self->mTracker delay];
        if (v28 != 0.0) {
          goto LABEL_34;
        }
        uint64_t v29 = [MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v30 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]"];
        uint64_t v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"];
        v32 = (void *)v29;
        uint64_t v33 = v30;
        uint64_t v34 = 192;
        break;
      case 1:
        [(TSDKnobTracker *)self->mTracker delay];
        if (v38 != 0.0) {
          goto LABEL_34;
        }
        uint64_t v39 = [MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v40 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]"];
        uint64_t v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"];
        v32 = (void *)v39;
        uint64_t v33 = v40;
        uint64_t v34 = 199;
        break;
      case 2:
        [(TSDKnobDragGestureRecognizer *)self setState:1];
        [(TSDKnobTracker *)self->mTracker delay];
        if (v41 != 0.0)
        {
          v42 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v43 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]"];
          uint64_t v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"];
          [(TSDKnobTracker *)self->mTracker delay];
          objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, v44, 207, @"requesting a delay of %f", v45);
        }
        if ([(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] takeControlWithTrackerManipulator:self])
        {
          if ([(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] isInPossibleDynamicOperation])
          {
            [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] stopTransformingReps:[(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] currentlyTransformingReps]];
          }
          [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] beginOperation];
          v46 = [(TSDInteractiveCanvasController *)self->mICC dynamicOperationController];
          -[TSDDynamicOperationController startTransformingReps:](v46, "startTransformingReps:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[TSDKnobTracker rep](self->mTracker, "rep")));
        }
        return;
      case 3:
        [(TSDKnobTracker *)self->mTracker delay];
        if (v47 != 0.0)
        {
          v48 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v49 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]"];
          uint64_t v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"];
          [(TSDKnobTracker *)self->mTracker delay];
          objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, v50, 225, @"requesting a delay of %f", v51);
        }
        return;
      case 4:
        [(TSDKnobTracker *)self->mTracker delay];
        if (v35 != 0.0) {
          goto LABEL_34;
        }
        uint64_t v36 = [MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v37 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]"];
        uint64_t v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"];
        v32 = (void *)v36;
        uint64_t v33 = v37;
        uint64_t v34 = 232;
        break;
      case 5:
        [(TSDKnobTracker *)self->mTracker delay];
        if (v52 != 0.0)
        {
          v53 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v54 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]"];
          uint64_t v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"];
          [(TSDKnobTracker *)self->mTracker delay];
          objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, v55, 239, @"requesting a delay of %f", v56);
        }
        return;
      default:
        return;
    }
    [v32 handleFailureInFunction:v33 file:v31 lineNumber:v34 description:@"requesting a delay of 0"];
LABEL_34:
    [(TSDKnobTracker *)self->mTracker delay];
    -[TSDKnobDragGestureRecognizer p_requestDelayedKnobTracking:](self, "p_requestDelayedKnobTracking:");
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  self->mTouchesMoved = 1;
  self->mKnobTouchHasMoved = 1;
  if (!self->mDelayHasElapsed && [[(TSDKnobTracker *)self->mTracker knob] dragType] == 4)
  {
    [(UITouch *)self->mTouch locationInView:[(UITouch *)self->mTouch window]];
    if (TSDDistance(self->mOriginalPointInWindow.x, self->mOriginalPointInWindow.y, v7, v8) >= 14.0)
    {
      [(TSDKnobDragGestureRecognizer *)self setState:5];
      [(TSDKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)TSDKnobDragGestureRecognizer;
  [(TSDKnobDragGestureRecognizer *)&v14 touchesMoved:a3 withEvent:a4];
  if ([a3 containsObject:self->mTouch])
  {
    if ([(TSDKnobDragGestureRecognizer *)self state])
    {
      if ([(TSDKnobDragGestureRecognizer *)self state] == 1)
      {
        v9 = self;
        uint64_t v10 = 2;
LABEL_16:
        [(TSDKnobDragGestureRecognizer *)v9 setState:v10];
      }
    }
    else
    {
      if ([[(TSDKnobTracker *)self->mTracker knob] dragType] == 3
        || [[(TSDKnobTracker *)self->mTracker knob] dragType] == 1
        || [[(TSDKnobTracker *)self->mTracker knob] dragType] == 5)
      {
        [(TSDKnobDragGestureRecognizer *)self setState:1];
        [(TSDKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
      }
      else
      {
        if ([[(TSDKnobTracker *)self->mTracker knob] dragType] || !self->mDelayHasElapsed) {
          goto LABEL_17;
        }
        [(TSDKnobDragGestureRecognizer *)self setState:1];
      }
      if (![(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] takeControlWithTrackerManipulator:self])
      {
        v9 = self;
        uint64_t v10 = 5;
        goto LABEL_16;
      }
      [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] beginOperation];
      double v11 = [(TSDInteractiveCanvasController *)self->mICC dynamicOperationController];
      -[TSDDynamicOperationController startTransformingReps:](v11, "startTransformingReps:", [MEMORY[0x263EFFA08] setWithObject:self->mLastHitRep]);
    }
LABEL_17:
    [(TSDKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
    [(TSDKnobTracker *)self->mTracker setCurrentPosition:TSDAddPoints(v12, v13, self->mKnobToTouchOffset.x)];
  }
  if ([(TSDKnobDragGestureRecognizer *)self state] == 2)
  {
    if ([(TSDKnobTracker *)self->mTracker wantsAutoscroll])
    {
      [(TSDKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
      +[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self);
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)TSDKnobDragGestureRecognizer;
  [(TSDKnobDragGestureRecognizer *)&v12 touchesEnded:a3 withEvent:a4];
  if ([a3 containsObject:self->mTouch])
  {
    if ([(TSDKnobDragGestureRecognizer *)self state]
      || [[(TSDKnobTracker *)self->mTracker knob] dragType]
      && [[(TSDKnobTracker *)self->mTracker knob] dragType] != 3)
    {
      if ([(TSDKnobDragGestureRecognizer *)self state]
        || self->mDelayHasElapsed
        || [[(TSDKnobTracker *)self->mTracker knob] dragType] != 4
        && [[(TSDKnobTracker *)self->mTracker knob] dragType]
        && [[(TSDKnobTracker *)self->mTracker knob] dragType] != 1)
      {
        if ([(TSDKnobDragGestureRecognizer *)self state]
          || [[(TSDKnobTracker *)self->mTracker knob] dragType] != 5)
        {
          [(TSDKnobDragGestureRecognizer *)self setState:3];
          [(TSDKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
          [(TSDKnobTracker *)self->mTracker setCurrentPosition:TSDAddPoints(v9, v10, self->mKnobToTouchOffset.x)];
          [(TSDKnobTracker *)self->mTracker setDragEnding:1];
          [(TSDAutoscroll *)self->mAutoscroll invalidate];
        }
        else
        {
          [(TSDKnobDragGestureRecognizer *)self setState:3];
          [(TSDKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
          [(TSDKnobTracker *)self->mTracker setCurrentPosition:TSDAddPoints(v6, v7, self->mKnobToTouchOffset.x)];
          [(TSDKnobTracker *)self->mTracker setDragEnding:1];
          if ([(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] takeControlWithTrackerManipulator:self])
          {
            [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] beginOperation];
            double v8 = [(TSDInteractiveCanvasController *)self->mICC dynamicOperationController];
            -[TSDDynamicOperationController startTransformingReps:](v8, "startTransformingReps:", [MEMORY[0x263EFFA08] setWithObject:self->mLastHitRep]);
          }
        }
      }
      else
      {
        [(TSDKnobDragGestureRecognizer *)self setState:5];
        [(TSDKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
      }
    }
    else
    {
      [(TSDKnobDragGestureRecognizer *)self setState:5];
    }
  }
  if (self->mSecondTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mSecondTouch = 0;
  }
  if (!self->mTouchesMoved)
  {
    mLastHitRep = self->mLastHitRep;
    if (mLastHitRep)
    {
      if ([(TSDRep *)mLastHitRep isSelected]
        && [(TSDKnobTracker *)self->mTracker allowHUDToDisplay]
        && [(TSDKnobDragGestureRecognizer *)self state] == 3)
      {
        [(TSDiOSCanvasViewController *)self->mCVC performSelector:sel_toggleEditMenuForCurrentSelection withObject:0 afterDelay:0.0];

        self->mLastHitRep = 0;
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(TSDKnobDragGestureRecognizer *)self p_cancelDelayedKnobTracking];
  v9.receiver = self;
  v9.super_class = (Class)TSDKnobDragGestureRecognizer;
  [(TSDKnobDragGestureRecognizer *)&v9 touchesCancelled:a3 withEvent:a4];
  if ([a3 containsObject:self->mTouch])
  {
    if (![(TSDKnobDragGestureRecognizer *)self state])
    {
      double v7 = self;
      uint64_t v8 = 5;
      goto LABEL_9;
    }
    if ([(TSDKnobDragGestureRecognizer *)self state] == 1
      || [(TSDKnobDragGestureRecognizer *)self state] == 2)
    {
      double v7 = self;
      uint64_t v8 = 4;
LABEL_9:
      [(TSDKnobDragGestureRecognizer *)v7 setState:v8];
    }
  }
  else if ([a3 containsObject:self->mSecondTouch])
  {

    self->mSecondTouch = 0;
  }

  self->mLastHitRep = 0;
}

- (void)cancelBecauseOfRotation
{
  if (self->mTracker) {
    [(TSDKnobDragGestureRecognizer *)self setState:5];
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (id)tracker
{
  return self->mTracker;
}

- (BOOL)readyToEndOperation
{
  return [(TSDKnobDragGestureRecognizer *)self state] == 3;
}

- (void)operationDidEnd
{
  if (self->mTracker)
  {
    if ((TSDKnobDragGestureRecognizer *)[(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM] == self&& !self->mTouchesMoved)
    {
      mLastHitRep = self->mLastHitRep;
      if (mLastHitRep)
      {
        if ([(TSDRep *)mLastHitRep isSelected]
          && [(TSDKnobTracker *)self->mTracker allowHUDToDisplay])
        {
          [(TSDiOSCanvasViewController *)self->mCVC performSelector:sel_toggleEditMenuForCurrentSelection withObject:0 afterDelay:0.0];
        }
      }
    }
    [(TSDKnobDragGestureRecognizer *)self removeTarget:[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] action:sel_handleGestureRecognizer_];

    self->mTracker = 0;
  }
  mSecondTouch = self->mSecondTouch;
  if (mSecondTouch)
  {
    if (!self->mTouch)
    {

      self->mSecondTouch = 0;
    }
  }
}

- (void)p_cancelDelayedKnobTracking
{
}

- (void)p_requestDelayedKnobTracking:(double)a3
{
  self->mDelayHasElapsed = 0;
  [(TSDKnobDragGestureRecognizer *)self performSelector:sel_p_triggerDelayedKnobTracking_ withObject:0 afterDelay:a3];
}

- (void)p_triggerDelayedKnobTracking:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  self->mDelayHasElapsed = 1;
  if ([(TSDKnobDragGestureRecognizer *)self state])
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]"];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"];
    [(TSDKnobDragGestureRecognizer *)self state];
    [v4 handleFailureInFunction:v5, v6, 511, @"delay fired when knob GR in state %@", NSStringFromUIGestureRecognizerState() file lineNumber description];
  }
  else
  {
    unsigned int v7 = [[(TSDKnobTracker *)self->mTracker knob] dragType];
    if (v7 <= 5)
    {
      if (((1 << v7) & 0x2C) != 0)
      {
        uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v9 = [NSString stringWithUTF8String:"-[TSDKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"), 520, @"shouldn't have delayed knob tracking!");
      }
      else if (((1 << v7) & 0x12) != 0 || self->mKnobTouchHasMoved)
      {
        [(TSDKnobDragGestureRecognizer *)self setState:1];
      }
    }
    if ([(TSDKnobDragGestureRecognizer *)self state] == 1
      && [(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] takeControlWithTrackerManipulator:self])
    {
      if ([(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] isInPossibleDynamicOperation])
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        double v10 = [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] currentlyTransformingReps];
        uint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v16 + 1) + 8 * i) showKnobsDuringManipulation:0];
            }
            uint64_t v12 = [(NSSet *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v12);
        }
        [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] stopTransformingReps:[(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] currentlyTransformingReps]];
      }
      [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self->mICC dynamicOperationController] beginOperation];
      v15 = [(TSDInteractiveCanvasController *)self->mICC dynamicOperationController];
      -[TSDDynamicOperationController startTransformingReps:](v15, "startTransformingReps:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[TSDKnobTracker rep](self->mTracker, "rep")));
    }
  }
}

- (TSDInteractiveCanvasController)icc
{
  return self->mICC;
}

- (void)updateAfterAutoscroll:(id)a3
{
  [(TSDKnobDragGestureRecognizer *)self p_pointInUnscaledCanvas];
  [(TSDKnobTracker *)self->mTracker setCurrentPosition:TSDAddPoints(v5, v6, self->mKnobToTouchOffset.x)];
  [(TSDKnobTracker *)self->mTracker updateAfterAutoscroll:a3];

  [(TSDKnobDragGestureRecognizer *)self setState:2];
}

- (void)autoscrollWillNotStart
{
}

- (double)unscaledStartAutoscrollThreshold
{
  [(TSDKnobTracker *)self->mTracker unscaledStartAutoscrollThreshold];
  return result;
}

- (int)allowedAutoscrollDirections
{
  return [(TSDKnobTracker *)self->mTracker allowedAutoscrollDirections];
}

- (BOOL)p_hitRepIsValid:(id)a3
{
  if (!a3) {
    return 0;
  }
  [a3 boundsForStandardKnobs];
  return v4 > 1.0 && v3 > 1.0;
}

- (CGPoint)p_pointInUnscaledCanvas
{
  mICC = self->mICC;
  [(UITouch *)self->mTouch locationInView:[(TSDInteractiveCanvasController *)mICC canvasView]];

  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mICC, "convertBoundsToUnscaledPoint:");
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (TSDAutoscroll)autoscroll
{
  return self->mAutoscroll;
}

- (void)setAutoscroll:(id)a3
{
}

- (CGPoint)autoscrollPoint
{
  double x = self->mAutoscrollPoint.x;
  double y = self->mAutoscrollPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAutoscrollPoint:(CGPoint)a3
{
  self->mAutoscrollPoint = a3;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->mICC;
}

@end