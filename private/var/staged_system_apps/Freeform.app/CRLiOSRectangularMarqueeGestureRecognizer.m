@interface CRLiOSRectangularMarqueeGestureRecognizer
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)p_isCanvasCurrentlyInQuickSelectMode;
- (BOOL)p_shouldInvertOriginalSelectionForModifierFlags:(int64_t)a3;
- (BOOL)readyToEndOperation;
- (CRLCanvasAutoscroll)autoscroll;
- (CRLInteractiveCanvasController)icc;
- (CRLRectangularMarqueeTracker)marqueeTracker;
- (CRLiOSRectangularMarqueeGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (void)operationDidEnd;
- (void)p_setModifierFlags;
- (void)p_updateTrackerWithUnscaledPoint:(CGPoint)a3;
- (void)reset;
- (void)setAutoscroll:(id)a3;
- (void)setMarqueeTracker:(id)a3;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateAfterAutoscroll:(id)a3;
@end

@implementation CRLiOSRectangularMarqueeGestureRecognizer

- (CRLiOSRectangularMarqueeGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v5 = [v4 dynamicOperationController];
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  v6 = [(CRLiOSRectangularMarqueeGestureRecognizer *)&v9 initWithTarget:v5 action:"handleTrackerManipulator:"];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_interactiveCanvasController, v4);
  }

  return v7;
}

- (void)setState:(int64_t)a3
{
  id v5 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self state];
  if (a3 == 1 && v5 != (id)1)
  {
    v6 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self icc];
    v7 = [v6 dynamicOperationController];

    v8 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self icc];
    objc_super v9 = [v8 tmCoordinator];

    [v9 registerTrackerManipulator:self];
    [v9 takeControlWithTrackerManipulator:self];
    [v7 beginOperation];
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  [(CRLiOSRectangularMarqueeGestureRecognizer *)&v10 setState:a3];
}

- (void)reset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  id v4 = [WeakRetained tmCoordinator];

  id v5 = [v4 controllingTM];

  if (v5 == self) {
    [v4 relinquishTrackerManipulatorControl:self];
  }
  [v4 unregisterTrackerManipulator:self];
  trackingTouch = self->_trackingTouch;
  self->_trackingTouch = 0;

  [(CRLCanvasAutoscroll *)self->_autoscroll invalidate];
  autoscroll = self->_autoscroll;
  self->_autoscroll = 0;

  marqueeTracker = self->_marqueeTracker;
  self->_marqueeTracker = 0;

  self->_initialScaledTouchLocation = (CGPoint)xmmword_101175150;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  [(CRLiOSRectangularMarqueeGestureRecognizer *)&v9 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_super v9 = [WeakRetained layerHost];
  objc_super v10 = [v9 asUIKitHost];

  p_trackingTouch = &self->_trackingTouch;
  if (!self->_trackingTouch)
  {
    [(CRLiOSRectangularMarqueeGestureRecognizer *)self setMinimumPressDuration:0.5];
    [(CRLiOSRectangularMarqueeGestureRecognizer *)self setAllowableMovement:10.0];
    if ([(CRLiOSRectangularMarqueeGestureRecognizer *)self p_isCanvasCurrentlyInQuickSelectMode])
    {
      [(CRLiOSRectangularMarqueeGestureRecognizer *)self setMinimumPressDuration:0.02];
      [(CRLiOSRectangularMarqueeGestureRecognizer *)self setAllowableMovement:1.79769313e308];
    }
    if ([v6 count] == (id)1)
    {
      v12 = [v6 anyObject];
      if ([v12 type] == (id)3)
      {
        [(CRLiOSRectangularMarqueeGestureRecognizer *)self setMinimumPressDuration:0.0];
        if (([(CRLiOSRectangularMarqueeGestureRecognizer *)self buttonMask] & 2) != 0
          || ([(CRLiOSRectangularMarqueeGestureRecognizer *)self modifierFlags] & 0x40000) != 0)
        {
          [(CRLiOSRectangularMarqueeGestureRecognizer *)self setState:5];
        }
      }
    }
  }
  if (![(CRLiOSRectangularMarqueeGestureRecognizer *)self state])
  {
    v13 = [v6 anyObject];
    v14 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self view];
    [v13 locationInView:v14];
    double v16 = v15;
    double v18 = v17;

    v19 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self icc];
    [v19 convertBoundsToUnscaledPoint:v16, v18];
    double v21 = v20;
    double v23 = v22;

    if ((unint64_t)[v6 count] > 1
      || (unint64_t)[v13 tapCount] > 1
      || *p_trackingTouch
      || objc_msgSend(v10, "disallowRectangularMarqueeOperationAtUnscaledPoint:", v21, v23))
    {
      [(CRLiOSRectangularMarqueeGestureRecognizer *)self setState:5];
    }
    else
    {
      objc_storeStrong((id *)&self->_trackingTouch, v13);
      BOOL v24 = sub_10036FEA4([(UITouch *)*p_trackingTouch type]);
      v25 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self icc];
      v26 = [v25 hitKnobAtPoint:v24 inputType:0 returningRep:v21 v23];

      if (v26)
      {
        [(CRLiOSRectangularMarqueeGestureRecognizer *)self setState:5];
      }
      else
      {
        v27 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self icc];
        v28 = [v27 hitRep:v21, v23];

        if (v28
          && ((objc_msgSend(v28, "shouldPreventMarqueeInitiationAtPoint:withTouchType:", -[UITouch type](*p_trackingTouch, "type"), v21, v23) & 1) != 0|| (objc_msgSend(v28, "repForDragging"), v29 = objc_claimAutoreleasedReturnValue(), unsigned int v30 = objc_msgSend(v29, "shouldPreventMarqueeInitiationAtPoint:withTouchType:", -[UITouch type](*p_trackingTouch, "type"), v21, v23), v29, v30)))
        {
          [(CRLiOSRectangularMarqueeGestureRecognizer *)self setState:5];
        }
        else
        {
          v31 = [CRLRectangularMarqueeTracker alloc];
          v32 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self icc];
          v33 = [(CRLRectangularMarqueeTracker *)v31 initWithInteractiveCanvasController:v32];
          marqueeTracker = self->_marqueeTracker;
          self->_marqueeTracker = v33;

          v35 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self marqueeTracker];
          [v35 setStartingUnscaledPoint:v21, v23];

          self->_initialScaledTouchLocation.x = v16;
          self->_initialScaledTouchLocation.y = v18;
          [(CRLiOSRectangularMarqueeGestureRecognizer *)self minimumPressDuration];
          [(CRLRectangularMarqueeTracker *)self->_marqueeTracker setShouldSuppressAnimationWhenMarqueeBegins:v36 < 0.1];
          if ((id)[(UITouch *)*p_trackingTouch type] == (id)3) {
            uint64_t v37 = 1;
          }
          else {
            uint64_t v37 = (uint64_t)[v10 isCurrentlyInQuickSelectMode];
          }
          [(CRLRectangularMarqueeTracker *)self->_marqueeTracker setShouldSuppressContextMenu:v37];
          [(CRLRectangularMarqueeTracker *)self->_marqueeTracker setShouldSuppressRestoringOriginalSelectionIfNothingSelected:v37];
          [(CRLiOSRectangularMarqueeGestureRecognizer *)self p_setModifierFlags];
        }
      }
    }
  }
  v38.receiver = self;
  v38.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  [(CRLiOSRectangularMarqueeGestureRecognizer *)&v38 touchesBegan:v6 withEvent:v7];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  id v6 = a3;
  [(CRLiOSRectangularMarqueeGestureRecognizer *)&v18 touchesMoved:v6 withEvent:a4];
  LODWORD(a4) = [v6 containsObject:self->_trackingTouch];

  if (a4)
  {
    trackingTouch = self->_trackingTouch;
    v8 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self view];
    [(UITouch *)trackingTouch locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    v13 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self icc];
    [v13 convertBoundsToUnscaledPoint:v10, v12];
    double v15 = v14;
    double v17 = v16;

    if (sub_1000653B4(v10, v12, self->_initialScaledTouchLocation.x, self->_initialScaledTouchLocation.y) > 14.0) {
      [(CRLRectangularMarqueeTracker *)self->_marqueeTracker setShouldSuppressRestoringOriginalSelectionIfNothingSelected:1];
    }
    -[CRLiOSRectangularMarqueeGestureRecognizer p_updateTrackerWithUnscaledPoint:](self, "p_updateTrackerWithUnscaledPoint:", v15, v17);
    +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v15, v17);
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  id v6 = [WeakRetained layerHost];
  id v7 = [v6 asUIKitHost];

  v12.receiver = self;
  v12.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  if ([(CRLiOSRectangularMarqueeGestureRecognizer *)&v12 canPreventGestureRecognizer:v4])
  {
    [(CRLiOSRectangularMarqueeGestureRecognizer *)self minimumPressDuration];
    if (v8 <= 0.02)
    {
      id v10 = [v7 doubleTapGestureRecognizer];
      BOOL v9 = v10 != v4;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return a3 == 0;
}

- (BOOL)readyToEndOperation
{
  return [(CRLiOSRectangularMarqueeGestureRecognizer *)self state] == (id)3
      || [(CRLiOSRectangularMarqueeGestureRecognizer *)self state] == (id)4;
}

- (void)operationDidEnd
{
  [(CRLCanvasAutoscroll *)self->_autoscroll invalidate];
  trackingTouch = self->_trackingTouch;
  self->_trackingTouch = 0;
}

- (void)updateAfterAutoscroll:(id)a3
{
  trackingTouch = self->_trackingTouch;
  id v5 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self view];
  [(UITouch *)trackingTouch locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self icc];
  [v10 convertBoundsToUnscaledPoint:v7, v9];
  double v12 = v11;
  double v14 = v13;

  -[CRLiOSRectangularMarqueeGestureRecognizer p_updateTrackerWithUnscaledPoint:](self, "p_updateTrackerWithUnscaledPoint:", v12, v14);

  [(CRLiOSRectangularMarqueeGestureRecognizer *)self setState:2];
}

- (void)p_setModifierFlags
{
  unint64_t v3 = ((unint64_t)[(CRLiOSRectangularMarqueeGestureRecognizer *)self modifierFlags] >> 19) & 1;
  id v4 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self marqueeTracker];
  [v4 setShouldCenterResizeMarqueeRect:v3];

  BOOL v5 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self p_shouldInvertOriginalSelectionForModifierFlags:[(CRLiOSRectangularMarqueeGestureRecognizer *)self modifierFlags]];
  id v6 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self marqueeTracker];
  [v6 setShouldInvertOriginalSelection:v5];
}

- (BOOL)p_shouldInvertOriginalSelectionForModifierFlags:(int64_t)a3
{
  return ((a3 & 0x120000) != 0) ^ [(CRLiOSRectangularMarqueeGestureRecognizer *)self p_isCanvasCurrentlyInQuickSelectMode];
}

- (void)p_updateTrackerWithUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLiOSRectangularMarqueeGestureRecognizer *)self p_setModifierFlags];
  id v6 = [(CRLiOSRectangularMarqueeGestureRecognizer *)self marqueeTracker];
  [v6 setCurrentUnscaledDragPoint:x, y];
}

- (BOOL)p_isCanvasCurrentlyInQuickSelectMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  unint64_t v3 = [WeakRetained layerHost];
  id v4 = [v3 asUIKitHost];
  unsigned __int8 v5 = [v4 isCurrentlyInQuickSelectMode];

  return v5;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
}

- (CRLInteractiveCanvasController)icc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (CRLRectangularMarqueeTracker)marqueeTracker
{
  return self->_marqueeTracker;
}

- (void)setMarqueeTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marqueeTracker, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_trackingTouch, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end