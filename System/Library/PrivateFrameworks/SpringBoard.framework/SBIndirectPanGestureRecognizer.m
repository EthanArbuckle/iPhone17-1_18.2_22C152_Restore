@interface SBIndirectPanGestureRecognizer
- (BOOL)_hasTranslationReachedThreshold:(double)a3 withTranslation:(CGPoint)a4 forEdge:(unint64_t)a5;
- (BOOL)_isPointOnRoundedCorner:(CGPoint)a3 corner:(unint64_t)a4 radius:(double)a5 inView:(id)a6;
- (BOOL)_isPointerOnTopScreenCorner:(CGPoint)a3 radius:(double)a4;
- (BOOL)_shouldReceiveEvent:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)_wantsWatchdogEnabled;
- (BOOL)avoidActivatingForExternallyOwnedEdges;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)gesturePassedThroughScreenCenterRegion;
- (BOOL)pausedUntilTouchedUpOrMovedAwayFromEdge;
- (BOOL)pointerHiddenBeforeCurrentTouch;
- (BOOL)shouldActivateWithThreshold;
- (BOOL)shouldCancelAfterMovingAwayFromEdge;
- (BOOL)shouldInvertXAxis;
- (BOOL)shouldInvertYAxis;
- (BOOL)shouldRequireGestureToStartAtEdge;
- (BSAbsoluteMachTimer)watchdogTimer;
- (BSAuditHistory)auditHistory;
- (BSInvalidatable)logCaptureHandle;
- (CGPoint)_centerOfCircleForRoundedCorner:(unint64_t)a3 radius:(double)a4 inView:(id)a5;
- (CGPoint)_convertPoint:(CGPoint)a3 fromView:(id)a4 toView:(id)a5;
- (CGPoint)_pointerModelLocation;
- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3;
- (CGPoint)lastKnownPoint;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)origin;
- (CGPoint)translationInView:(id)a3;
- (CGPoint)translationWithinHysteresisRange;
- (CGPoint)velocityInView:(id)a3;
- (NSString)debugDescription;
- (NSTimer)mouseIdleTimer;
- (NSTimer)trackpadIdleTimer;
- (NSValue)gestureStartLocation;
- (SBIndirectPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 edges:(unint64_t)a5;
- (SBIndirectPanGestureRecognizerOrientationProviding)orientationProvider;
- (SBTouchHistory)touchHistory;
- (UIEvent)currentHoverEvent;
- (UITouch)currentTouch;
- (double)_watchdogTimeoutInSeconds;
- (double)activationRecognitionDistance;
- (double)averageTouchPathAngleOverTimeDuration:(double)a3;
- (double)hysteresisForInputType:(unint64_t)a3;
- (double)lastKnownMouseEventTimestamp;
- (double)lastKnownTrackpadEventTimestamp;
- (double)lastMouseActivationTimestamp;
- (double)mouseEnteredNearEdgeRegionTimestamp;
- (double)mouseHysteresis;
- (double)peakSpeed;
- (double)trackpadHysteresis;
- (id)containerView;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)translationAdjustmentBlock;
- (int64_t)_effectiveOrientation;
- (int64_t)pointerVisibilityState;
- (unint64_t)_axisForEdge:(unint64_t)a3;
- (unint64_t)_edgeForPointerModelLocation:(CGPoint)a3 inView:(id)a4 inset:(double)a5;
- (unint64_t)activatedEdge;
- (unint64_t)activatingEdge;
- (unint64_t)currentInputType;
- (unint64_t)edges;
- (unint64_t)endReason;
- (void)_hoverCancelled:(id)a3 withEvent:(id)a4;
- (void)_hoverEntered:(id)a3 withEvent:(id)a4;
- (void)_hoverExited:(id)a3 withEvent:(id)a4;
- (void)_hoverMoved:(id)a3 withEvent:(id)a4;
- (void)_mouseIdleTimerElapsed;
- (void)_mouseIdleTimerFired:(id)a3;
- (void)_resetTranslationState;
- (void)_resetWatchdogIfNecessary;
- (void)_setUpIdleTimersIfNeededForEvent:(id)a3;
- (void)_startWatchdogTimerIfNecessary;
- (void)_trackpadIdleTimerElapsed;
- (void)_trackpadIdleTimerFired:(id)a3;
- (void)_updateTranslationWithPointerEventAttributes:(id)a3 activeEdge:(unint64_t)a4;
- (void)_watchdogFired;
- (void)dealloc;
- (void)pointerClientControllerPointerVisibilityStateDidChange:(id)a3;
- (void)reset;
- (void)setActivatedEdge:(unint64_t)a3;
- (void)setActivatingEdge:(unint64_t)a3;
- (void)setActivationRecognitionDistance:(double)a3;
- (void)setAuditHistory:(id)a3;
- (void)setAvoidActivatingForExternallyOwnedEdges:(BOOL)a3;
- (void)setCurrentHoverEvent:(id)a3;
- (void)setCurrentTouch:(id)a3;
- (void)setEdges:(unint64_t)a3;
- (void)setGesturePassedThroughScreenCenterRegion:(BOOL)a3;
- (void)setGestureStartLocation:(id)a3;
- (void)setHysteresis:(double)a3 forInputType:(unint64_t)a4;
- (void)setLastKnownMouseEventTimestamp:(double)a3;
- (void)setLastKnownPoint:(CGPoint)a3;
- (void)setLastKnownTrackpadEventTimestamp:(double)a3;
- (void)setLastMouseActivationTimestamp:(double)a3;
- (void)setLogCaptureHandle:(id)a3;
- (void)setMouseEnteredNearEdgeRegionTimestamp:(double)a3;
- (void)setMouseHysteresis:(double)a3;
- (void)setMouseIdleTimer:(id)a3;
- (void)setOrientationProvider:(id)a3;
- (void)setOrigin:(CGPoint)a3;
- (void)setPausedUntilTouchedUpOrMovedAwayFromEdge:(BOOL)a3;
- (void)setPointerHiddenBeforeCurrentTouch:(BOOL)a3;
- (void)setPointerVisibilityState:(int64_t)a3;
- (void)setShouldActivateWithThreshold:(BOOL)a3;
- (void)setShouldCancelAfterMovingAwayFromEdge:(BOOL)a3;
- (void)setShouldInvertXAxis:(BOOL)a3;
- (void)setShouldInvertYAxis:(BOOL)a3;
- (void)setShouldRequireGestureToStartAtEdge:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setTouchHistory:(id)a3;
- (void)setTrackpadHysteresis:(double)a3;
- (void)setTrackpadIdleTimer:(id)a3;
- (void)setTranslationAdjustmentBlock:(id)a3;
- (void)setTranslationWithinHysteresisRange:(CGPoint)a3;
- (void)setWatchdogTimer:(id)a3;
- (void)trackpadDidTouchUpWithEvent:(id)a3;
- (void)updateTouchHistoryWithTouches:(id)a3;
@end

@implementation SBIndirectPanGestureRecognizer

- (SBIndirectPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 edges:(unint64_t)a5
{
  v5 = self;
  if (a5)
  {
    v25.receiver = self;
    v25.super_class = (Class)SBIndirectPanGestureRecognizer;
    v7 = [(SBIndirectPanGestureRecognizer *)&v25 initWithTarget:a3 action:a4];
    v8 = v7;
    if (v7)
    {
      v7->_edges = a5;
      v7->_avoidActivatingForExternallyOwnedEdges = 1;
      v7->_shouldCancelAfterMovingAwayFromEdge = 1;
      v7->_shouldInvertXAxis = 0;
      v7->_shouldInvertYAxis = 0;
      v7->_pausedUntilTouchedUpOrMovedAwayFromEdge = 0;
      id translationAdjustmentBlock = v7->_translationAdjustmentBlock;
      v7->_id translationAdjustmentBlock = 0;

      v8->_shouldActivateWithThreshold = 1;
      v8->_activationRecognitionDistance = 80.0;
      v8->_endReason = 0;
      v8->_currentInputType = 2;
      CGPoint v10 = (CGPoint)*MEMORY[0x1E4F1DAD8];
      v8->_origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
      v8->_lastKnownPoint = v10;
      v8->_activatedEdge = 0;
      mouseIdleTimer = v8->_mouseIdleTimer;
      v8->_mouseIdleTimer = 0;

      BSContinuousMachTimeNow();
      v8->_lastKnownMouseEventTimestamp = v12;
      trackpadIdleTimer = v8->_trackpadIdleTimer;
      v8->_trackpadIdleTimer = 0;

      BSContinuousMachTimeNow();
      v8->_lastKnownTrackpadEventTimestamp = v14;
      objc_storeWeak((id *)&v8->_currentHoverEvent, 0);
      objc_storeWeak((id *)&v8->_currentTouch, 0);
      v15 = objc_alloc_init(SBTouchHistory);
      touchHistory = v8->_touchHistory;
      v8->_touchHistory = v15;

      v8->_shouldRequireGestureToStartAtEdge = 0;
      v8->_trackpadHysteresis = 0.0;
      v8->_mouseHysteresis = 0.0;
      gestureStartLocation = v8->_gestureStartLocation;
      v8->_gestureStartLocation = 0;

      v8->_mouseEnteredNearEdgeRegionTimestamp = -1.79769313e308;
      v8->_gesturePassedThroughScreenCenterRegion = 0;
      v8->_lastMouseActivationTimestamp = -1.79769313e308;
      [(SBIndirectPanGestureRecognizer *)v8 setAllowedTouchTypes:&unk_1F33483C0];
      v18 = (PSPointerClientController *)objc_alloc_init(MEMORY[0x1E4F92130]);
      pointerClientController = v8->_pointerClientController;
      v8->_pointerClientController = v18;

      [(PSPointerClientController *)v8->_pointerClientController setDelegate:v8];
      v8->_pointerHiddenBeforeCurrentTouch = 0;
    }
    v5 = v8;
    v20 = v5;
  }
  else
  {
    v22 = SBLogSystemGesture();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:](v22);
    }

    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, v5, @"SBIndirectPanGestureRecognizer.m", 120, @"Invalid parameter not satisfying: %@", @"edges != UIRectEdgeNone" object file lineNumber description];

    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_watchdogTimer invalidate];
  [(BSInvalidatable *)self->_logCaptureHandle invalidate];
  [(PSPointerClientController *)self->_pointerClientController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBIndirectPanGestureRecognizer;
  [(SBIndirectPanGestureRecognizer *)&v3 dealloc];
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)setState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIndirectPanGestureRecognizer;
  -[SBIndirectPanGestureRecognizer setState:](&v5, sel_setState_);
  if ((unint64_t)(a3 - 1) <= 4) {
    [(SBIndirectPanGestureRecognizer *)self _resetWatchdogIfNecessary];
  }
}

- (void)reset
{
  _SBIndirectGestureLog(self, @"Resetting gesture");
  v3.receiver = self;
  v3.super_class = (Class)SBIndirectPanGestureRecognizer;
  [(SBIndirectPanGestureRecognizer *)&v3 reset];
  [(SBIndirectPanGestureRecognizer *)self _resetWatchdogIfNecessary];
  [(SBIndirectPanGestureRecognizer *)self _resetTranslationState];
}

- (void)_resetTranslationState
{
  self->_endReason = 0;
  [(NSTimer *)self->_mouseIdleTimer invalidate];
  mouseIdleTimer = self->_mouseIdleTimer;
  self->_mouseIdleTimer = 0;

  CGPoint v7 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_lastKnownPoint = v7;
  BSContinuousMachTimeNow();
  self->_lastKnownMouseEventTimestamp = v4;
  [(NSTimer *)self->_trackpadIdleTimer invalidate];
  trackpadIdleTimer = self->_trackpadIdleTimer;
  self->_trackpadIdleTimer = 0;

  BSContinuousMachTimeNow();
  self->_lastKnownTrackpadEventTimestamp = v6;
  self->_activatedEdge = 0;
  self->_currentInputType = 2;
  self->_translationWithinHysteresisRange = v7;
  [(SBTouchHistory *)self->_touchHistory reset];
  objc_storeWeak((id *)&self->_currentHoverEvent, 0);
  objc_storeWeak((id *)&self->_currentTouch, 0);
}

- (BOOL)_shouldReceiveEvent:(id)a3
{
  return [a3 type] == 11;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  objc_super v5 = [(SBIndirectPanGestureRecognizer *)self containerView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);
  id v7 = objc_loadWeakRetained((id *)&self->_currentHoverEvent);
  if (v7) {
    BOOL v8 = WeakRetained == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || v5
    && ([(SBIndirectPanGestureRecognizer *)self _pointerModelLocation],
        (self->_edges & -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v5)) != 0))
  {
    [(SBIndirectPanGestureRecognizer *)self _startWatchdogTimerIfNecessary];
    [(BSAuditHistory *)self->_auditHistory addItemWithFormat:@"ShouldReceiveEvent"];
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_hoverEntered:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  [(BSAuditHistory *)self->_auditHistory addItemWithFormat:@"hoverEntered:withEvent:"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHoverEvent);
  if (!WeakRetained)
  {
    if ([v12 count] == 1)
    {
      [(SBIndirectPanGestureRecognizer *)self _resetTranslationState];
      id WeakRetained = v6;
      objc_storeWeak((id *)&self->_currentHoverEvent, WeakRetained);
      BOOL v8 = [v12 anyObject];
      objc_storeWeak((id *)&self->_currentTouch, v8);
    }
    else
    {
      id WeakRetained = 0;
    }
  }
  BOOL v9 = [WeakRetained allTouches];
  [(SBIndirectPanGestureRecognizer *)self updateTouchHistoryWithTouches:v9];

  if (!self->_gestureStartLocation)
  {
    [(SBIndirectPanGestureRecognizer *)self _pointerModelLocation];
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:");
    CGPoint v10 = (NSValue *)objc_claimAutoreleasedReturnValue();
    gestureStartLocation = self->_gestureStartLocation;
    self->_gestureStartLocation = v10;
  }
  [(SBIndirectPanGestureRecognizer *)self _setUpIdleTimersIfNeededForEvent:v6];
}

- (void)_hoverMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);
  id v7 = objc_loadWeakRetained((id *)&self->_currentHoverEvent);
  BOOL v8 = v7;
  if (WeakRetained) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    CGPoint v10 = @"NOT ";
    if (WeakRetained) {
      v11 = @"NOT ";
    }
    else {
      v11 = &stru_1F3084718;
    }
    if (!v7) {
      CGPoint v10 = &stru_1F3084718;
    }
    [(BSAuditHistory *)self->_auditHistory addItemWithFormat:@"hoverMoved:withEvent: - currentTouch is %@nil - currentHoverEvent is %@nil", v11, v10];
  }
  if ([WeakRetained phase] == 6)
  {
    id v12 = [v8 allTouches];
    [(SBIndirectPanGestureRecognizer *)self updateTouchHistoryWithTouches:v12];

    [(SBIndirectPanGestureRecognizer *)self _pointerModelLocation];
    double v14 = v13;
    double v16 = v15;
    v17 = [(SBIndirectPanGestureRecognizer *)self containerView];
    if ((self->_edges & -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v17, v14, v16, 30.0)) != 0|| (self->_edges & -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v17, v14, v16, 100.0)) != 0)
    {
      if (self->_mouseEnteredNearEdgeRegionTimestamp == -1.79769313e308)
      {
        BSContinuousMachTimeNow();
        self->_mouseEnteredNearEdgeRegionTimestamp = v18;
      }
    }
    else
    {
      self->_mouseEnteredNearEdgeRegionTimestamp = -1.79769313e308;
      self->_gesturePassedThroughScreenCenterRegion = 1;
    }
    unint64_t v58 = -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v17, v14, v16, 1.0);
    unint64_t v59 = self->_edges & v58;
    if (v59 && self->_avoidActivatingForExternallyOwnedEdges)
    {
      v19 = v17;
      v20 = +[SBWorkspace mainWorkspace];
      v21 = [v20 universalControlServer];
      uint64_t v22 = [v21 externalProcessActiveOnScreenEdges];

      if ((v58 & ~v22) != 0)
      {
        int v23 = 0;
      }
      else
      {
        [(BSAuditHistory *)self->_auditHistory addItemWithFormat:@"hoverMoved:withEvent: - externally controlled edges: %lu contains current edge: %lu", v22, v58];
        int v23 = 1;
      }
      v17 = v19;
    }
    else
    {
      int v23 = 0;
    }
    [v5 _hidEvent];
    v24 = (void *)SBPointerHIDSubEventFromEvent();
    if (!v24 || (BKSHIDEventGetPointerAttributes(), (objc_super v25 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      [(BSAuditHistory *)self->_auditHistory addItemWithFormat:@"hoverMoved:withEvent: - bailing because pointer attributes is nil"];
      v28 = SBLogSystemGesture();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[SBIndirectPanGestureRecognizer _hoverMoved:withEvent:](v24, v28);
      }

      v26 = 0;
      goto LABEL_79;
    }
    v26 = v25;
    v55 = v17;
    unsigned int v57 = SBPointerEventIsTrackpadEvent(v25);
    if (v57)
    {
      self->_currentInputType = 0;
      unsigned int v27 = SBPointerEventRepresentsTrackpadTouchUp(v26);
    }
    else
    {
      unsigned int v27 = 0;
      self->_currentInputType = 1;
    }
    id v56 = v5;
    BSContinuousMachTimeNow();
    if (self->_pausedUntilTouchedUpOrMovedAwayFromEdge)
    {
      char v30 = v59 ? v27 : 1;
      if ((v30 & 1) != 0 || v29 - self->_lastKnownMouseEventTimestamp >= 0.15) {
        self->_pausedUntilTouchedUpOrMovedAwayFromEdge = 0;
      }
    }
    BOOL v31 = !SBPointerEventHasMovementOnAxis(v26, 3);
    if (((v57 | v31) & 1) == 0)
    {
      BSContinuousMachTimeNow();
      self->_lastKnownMouseEventTimestamp = v32;
    }
    if (v57)
    {
      [(SBIndirectPanGestureRecognizer *)self _setUpIdleTimersIfNeededForEvent:v56];
      if (!v59
        && self->_shouldRequireGestureToStartAtEdge
        && !self->_gesturePassedThroughScreenCenterRegion
        && (self->_edges & -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v55, v14, v16, 100.0)) == 0)
      {
        self->_gesturePassedThroughScreenCenterRegion = 1;
      }
    }
    if ([(SBIndirectPanGestureRecognizer *)self state])
    {
      if ([(SBIndirectPanGestureRecognizer *)self state] == 1)
      {
        if (v59) {
          char v33 = v27;
        }
        else {
          char v33 = 1;
        }
        id v5 = v56;
        if (v33)
        {
          unint64_t v34 = (v27 & 1) != 0 || self->_pausedUntilTouchedUpOrMovedAwayFromEdge;
          self->_endReason = v34;
          _SBIndirectGestureLog(self, @"Pointer either moved away from active edge, or got touch up. Moving from Began to Ended");
LABEL_76:
          v37 = self;
          uint64_t v38 = 3;
LABEL_77:
          [(SBIndirectPanGestureRecognizer *)v37 setState:v38];
          goto LABEL_78;
        }
        [(SBIndirectPanGestureRecognizer *)self _updateTranslationWithPointerEventAttributes:v26 activeEdge:v58];
        [v8 allTouches];
        v40 = v39 = v26;
        [(SBIndirectPanGestureRecognizer *)self updateTouchHistoryWithTouches:v40];

        v41 = [(SBIndirectPanGestureRecognizer *)self containerView];
        v42 = [v41 _fbsDisplayConfiguration];
        v43 = [v42 hardwareIdentifier];

        v26 = v39;
        BKSHIDServicesCancelTouchesOnDisplay();
        _SBIndirectGestureLog(self, @"Pointer is on active edge; moving from state Began to Changed.");
        [(SBIndirectPanGestureRecognizer *)self setState:2];
      }
      else
      {
        id v5 = v56;
        if ([(SBIndirectPanGestureRecognizer *)self state] == 2)
        {
          if (!v27)
          {
            if (v59 || !self->_shouldCancelAfterMovingAwayFromEdge)
            {
              [(SBIndirectPanGestureRecognizer *)self setState:2];
              [(SBIndirectPanGestureRecognizer *)self _updateTranslationWithPointerEventAttributes:v26 activeEdge:v58];
              v44 = [v8 allTouches];
              [(SBIndirectPanGestureRecognizer *)self updateTouchHistoryWithTouches:v44];

              if (self->_shouldActivateWithThreshold) {
                char v45 = v57;
              }
              else {
                char v45 = 1;
              }
              if ((v45 & 1) == 0)
              {
                v17 = v55;
                [(SBIndirectPanGestureRecognizer *)self translationInView:v55];
                if (-[SBIndirectPanGestureRecognizer _hasTranslationReachedThreshold:withTranslation:forEdge:](self, "_hasTranslationReachedThreshold:withTranslation:forEdge:", v58, self->_activationRecognitionDistance, v46, v47))
                {
                  _SBIndirectGestureLog(self, @"Moving to state Ended because the mouse threshold was reached");
                  self->_endReason = 3;
                  BSContinuousMachTimeNow();
                  self->_lastMouseActivationTimestamp = v48;
                  [(SBIndirectPanGestureRecognizer *)self setState:3];
                  [(SBIndirectPanGestureRecognizer *)self setPausedUntilTouchedUpOrMovedAwayFromEdge:1];
                }
                goto LABEL_79;
              }
              goto LABEL_78;
            }
            _SBIndirectGestureLog(self, @"Moving to state Cancelled; pointer moved away from active edge");
            self->_endReason = 2;
            v37 = self;
            uint64_t v38 = 4;
            goto LABEL_77;
          }
          _SBIndirectGestureLog(self, @"Moving to state Ended due to touch-up event");
          self->_endReason = 1;
          goto LABEL_76;
        }
      }
LABEL_78:
      v17 = v55;
LABEL_79:

      goto LABEL_80;
    }
    if (v59) {
      char v35 = v27;
    }
    else {
      char v35 = 1;
    }
    if (v35)
    {
      id v5 = v56;
      if ((v27 | v57 ^ 1) == 1)
      {
        if (v27) {
          v36 = @"Moving from Possible to Failed because of a touch-up";
        }
        else {
          v36 = @"Moving from Possible to Failed because we're not on the correct edge";
        }
        _SBIndirectGestureLog(self, v36);
        v37 = self;
        uint64_t v38 = 5;
        goto LABEL_77;
      }
      [(BSAuditHistory *)self->_auditHistory addItemWithFormat:@"hoverMoved:withEvent: - not moving to began/failed because isPointerOnActiveEdge: %d isTouchUp: %d isMouseEvent: %d", v59 != 0, 0, 0];
      goto LABEL_78;
    }
    if (((v23 | v31) & 1) != 0 || self->_pausedUntilTouchedUpOrMovedAwayFromEdge)
    {
      _SBIndirectGestureLog(self, @"Pointer event has a zero offset, moving to Failed");
      [(SBIndirectPanGestureRecognizer *)self setState:5];
      id v5 = v56;
      goto LABEL_78;
    }
    self->_origin.x = v14;
    self->_origin.y = v16;
    self->_lastKnownPoint.x = v14;
    self->_lastKnownPoint.y = v16;
    [(SBIndirectPanGestureRecognizer *)self _updateTranslationWithPointerEventAttributes:v26 activeEdge:v58];
    v49 = [v8 allTouches];
    [(SBIndirectPanGestureRecognizer *)self updateTouchHistoryWithTouches:v49];

    v17 = v55;
    id v5 = v56;
    if (v55)
    {
      if (self->_shouldRequireGestureToStartAtEdge)
      {
        if (v57)
        {
          [(NSValue *)self->_gestureStartLocation pointValue];
          unint64_t v50 = -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v55);
          if (self->_pointerHiddenBeforeCurrentTouch)
          {
            v51 = v26;
            v52 = @"Pointer was hidden";
LABEL_107:
            objc_msgSend(NSString, "stringWithFormat:", @"Moving to state Failed; shouldBegin is NO. Reason: %@",
            v54 = v52);
            _SBIndirectGestureLog(self, v54);
            [(SBIndirectPanGestureRecognizer *)self setState:5];

            v26 = v51;
            goto LABEL_79;
          }
          if (v50 != v58)
          {
            v51 = v26;
            v52 = @"Trackpad gesture did not start near the edge.";
            goto LABEL_107;
          }
          if (self->_gesturePassedThroughScreenCenterRegion)
          {
            v51 = v26;
            v52 = @"Trackpad gesture started near the edge, but left the region before coming back.";
            goto LABEL_107;
          }
        }
        else
        {
          if (self->_mouseEnteredNearEdgeRegionTimestamp == -1.79769313e308
            || (BSContinuousMachTimeNow(), v53 - self->_mouseEnteredNearEdgeRegionTimestamp <= 0.25))
          {
            v51 = v26;
            if (self->_pointerHiddenBeforeCurrentTouch) {
              v52 = @"Pointer was hidden";
            }
            else {
              v52 = @"Mouse pointer has not spent enough time on the edge to be considered a second pan.";
            }
            goto LABEL_107;
          }
          self->_pointerHiddenBeforeCurrentTouch = 0;
        }
      }
      self->_activatedEdge = v58;
      _SBIndirectGestureLog(self, @"Moving to state Began");
      [(SBIndirectPanGestureRecognizer *)self setState:1];
      goto LABEL_79;
    }
    v51 = v26;
    v52 = @"System gesture view is nil";
    goto LABEL_107;
  }
  -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", @"hoverMoved:withEvent: - bailing because current touch is: %@ with phase: %ld", WeakRetained, [WeakRetained phase]);
LABEL_80:
}

- (void)_hoverExited:(id)a3 withEvent:(id)a4
{
  [(SBIndirectPanGestureRecognizer *)self _resetTranslationState];
  if ([(SBIndirectPanGestureRecognizer *)self state] == 1)
  {
    uint64_t v5 = 3;
  }
  else if ([(SBIndirectPanGestureRecognizer *)self state] == 2)
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 5;
  }
  [(SBIndirectPanGestureRecognizer *)self setState:v5];
}

- (void)_hoverCancelled:(id)a3 withEvent:(id)a4
{
  [(SBIndirectPanGestureRecognizer *)self _resetTranslationState];
  if ([(SBIndirectPanGestureRecognizer *)self state] == 1)
  {
    uint64_t v5 = 4;
  }
  else if ([(SBIndirectPanGestureRecognizer *)self state] == 2)
  {
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = 5;
  }
  [(SBIndirectPanGestureRecognizer *)self setState:v5];
}

- (void)pointerClientControllerPointerVisibilityStateDidChange:(id)a3
{
  uint64_t v4 = [a3 pointerVisibilityState];
  int64_t v5 = v4;
  if (self->_pointerVisibilityState) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v4 == 1;
  }
  if (v6)
  {
    self->_pointerHiddenBeforeCurrentTouch = 1;
    self->_mouseEnteredNearEdgeRegionTimestamp = -1.79769313e308;
    self->_gesturePassedThroughScreenCenterRegion = 1;
    uint64_t v7 = [(SBIndirectPanGestureRecognizer *)self state];
    if ((unint64_t)(v7 - 1) >= 2)
    {
      if (v7) {
        goto LABEL_11;
      }
      BOOL v8 = @"Pointer was hidden: moving from Possible to Failed";
      uint64_t v9 = 5;
    }
    else
    {
      self->_endReason = 6;
      BOOL v8 = @"Pointer was hidden: moving from Began or Changed to Cancelled";
      uint64_t v9 = 4;
    }
    _SBIndirectGestureLog(self, v8);
    [(SBIndirectPanGestureRecognizer *)self setState:v9];
  }
LABEL_11:
  self->_pointerVisibilityState = v5;
  CGPoint v10 = @"Visible";
  if (!v5) {
    CGPoint v10 = @"Hidden";
  }
  id v11 = [NSString stringWithFormat:@"Pointer visibility state changed to %@", v10];
  _SBIndirectGestureLog(self, v11);
}

- (void)_setUpIdleTimersIfNeededForEvent:(id)a3
{
  id v4 = a3;
  [v4 _hidEvent];
  if (SBPointerHIDSubEventFromEvent())
  {
    int64_t v5 = BKSHIDEventGetPointerAttributes();
  }
  else
  {
    int64_t v5 = 0;
  }
  if (SBPointerEventIsTrackpadEvent(v5))
  {
    if (!self->_trackpadIdleTimer)
    {
      _SBIndirectGestureLog(self, @"Creating a new trackpad idle timer.");
      objc_initWeak(&location, self);
      BOOL v6 = (void *)MEMORY[0x1E4F1CB00];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __67__SBIndirectPanGestureRecognizer__setUpIdleTimersIfNeededForEvent___block_invoke_2;
      v14[3] = &unk_1E6AF61A0;
      uint64_t v7 = &v15;
      objc_copyWeak(&v15, &location);
      BOOL v8 = [v6 timerWithTimeInterval:1 repeats:v14 block:0.1];
      trackpadIdleTimer = self->_trackpadIdleTimer;
      self->_trackpadIdleTimer = v8;

      CGPoint v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v10 addTimer:self->_trackpadIdleTimer forMode:*MEMORY[0x1E4F1C4B0]];
LABEL_9:

      objc_destroyWeak(v7);
      objc_destroyWeak(&location);
    }
  }
  else if (!self->_mouseIdleTimer)
  {
    _SBIndirectGestureLog(self, @"Creating a new mouse idle timer.");
    objc_initWeak(&location, self);
    id v11 = (void *)MEMORY[0x1E4F1CB00];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__SBIndirectPanGestureRecognizer__setUpIdleTimersIfNeededForEvent___block_invoke;
    v16[3] = &unk_1E6AF61A0;
    uint64_t v7 = &v17;
    objc_copyWeak(&v17, &location);
    id v12 = [v11 timerWithTimeInterval:1 repeats:v16 block:0.1];
    mouseIdleTimer = self->_mouseIdleTimer;
    self->_mouseIdleTimer = v12;

    CGPoint v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v10 addTimer:self->_mouseIdleTimer forMode:*MEMORY[0x1E4F1C4B0]];
    goto LABEL_9;
  }
}

void __67__SBIndirectPanGestureRecognizer__setUpIdleTimersIfNeededForEvent___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _mouseIdleTimerFired:v3];
}

void __67__SBIndirectPanGestureRecognizer__setUpIdleTimersIfNeededForEvent___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _trackpadIdleTimerFired:v3];
}

- (void)_mouseIdleTimerFired:(id)a3
{
  BSContinuousMachTimeNow();
  double v5 = v4 - self->_lastKnownMouseEventTimestamp;
  BOOL v6 = [(SBIndirectPanGestureRecognizer *)self containerView];
  [(SBIndirectPanGestureRecognizer *)self velocityInView:v6];
  long double v8 = v7;
  long double v10 = v9;

  double v11 = fabs(hypot(v8, v10));
  if (v5 >= 0.15 && v11 < 50.0)
  {
    [(SBIndirectPanGestureRecognizer *)self _mouseIdleTimerElapsed];
  }
  else
  {
    [(BSAuditHistory *)self->_auditHistory addItemWithFormat:@"Not firing mouse idle timer because timeSinceLastMouseEvent: %f, magnitude: %f", *(void *)&v5, *(void *)&v11];
  }
}

- (void)_mouseIdleTimerElapsed
{
  _SBIndirectGestureLog(self, @"Mouse idle timer has elapsed");
  uint64_t v3 = [(SBIndirectPanGestureRecognizer *)self state];
  if ((unint64_t)(v3 - 1) < 2)
  {
    uint64_t v4 = 4;
    self->_endReason = 4;
    double v5 = @"Mouse idle timer: moving from Began or Changed to Cancelled";
LABEL_5:
    _SBIndirectGestureLog(self, v5);
    [(SBIndirectPanGestureRecognizer *)self setState:v4];
    goto LABEL_6;
  }
  if (!v3)
  {
    double v5 = @"Mouse idle timer: moving from Possible to Failed";
    uint64_t v4 = 5;
    goto LABEL_5;
  }
LABEL_6:
  _SBIndirectGestureLog(self, @"Invalidating the mouse idle timer");
  [(NSTimer *)self->_mouseIdleTimer invalidate];
  mouseIdleTimer = self->_mouseIdleTimer;
  self->_mouseIdleTimer = 0;

  self->_gesturePassedThroughScreenCenterRegion = 0;
  self->_pointerHiddenBeforeCurrentTouch = 0;
}

- (void)_trackpadIdleTimerFired:(id)a3
{
  BSContinuousMachTimeNow();
  double v5 = v4 - self->_lastKnownTrackpadEventTimestamp;
  if (v5 >= 0.15)
  {
    [(SBIndirectPanGestureRecognizer *)self _trackpadIdleTimerElapsed];
  }
  else
  {
    [(BSAuditHistory *)self->_auditHistory addItemWithFormat:@"Not firing trackpad idle timer because timeSinceLastTrackpadEvent: %f", *(void *)&v5];
  }
}

- (void)_trackpadIdleTimerElapsed
{
  _SBIndirectGestureLog(self, @"Trackpad idle timer has elapsed");
  uint64_t v3 = [(SBIndirectPanGestureRecognizer *)self state];
  if ((unint64_t)(v3 - 1) < 2)
  {
    self->_endReason = 5;
    double v4 = @"Trackpad idle timer: moving from Began or Changed to Cancelled";
    uint64_t v5 = 4;
LABEL_5:
    _SBIndirectGestureLog(self, v4);
    [(SBIndirectPanGestureRecognizer *)self setState:v5];
    goto LABEL_6;
  }
  if (!v3)
  {
    double v4 = @"Trackpad idle timer: moving from Possible to Failed";
    uint64_t v5 = 5;
    goto LABEL_5;
  }
LABEL_6:
  _SBIndirectGestureLog(self, @"Invalidating the trackpad idle timer");
  [(NSTimer *)self->_trackpadIdleTimer invalidate];
  trackpadIdleTimer = self->_trackpadIdleTimer;
  self->_trackpadIdleTimer = 0;

  self->_gesturePassedThroughScreenCenterRegion = 0;
  self->_pointerHiddenBeforeCurrentTouch = 0;
}

- (void)trackpadDidTouchUpWithEvent:(id)a3
{
  _SBIndirectGestureLog(self, @"Touch-up from the lifecycle monitor: Setting _gestureStartLocation to nil");
  self->_pausedUntilTouchedUpOrMovedAwayFromEdge = 0;
  gestureStartLocation = self->_gestureStartLocation;
  self->_gestureStartLocation = 0;

  self->_gesturePassedThroughScreenCenterRegion = 0;
  self->_pointerHiddenBeforeCurrentTouch = 0;
}

- (void)_startWatchdogTimerIfNecessary
{
  if (!self->_watchdogTimer)
  {
    if ([(SBIndirectPanGestureRecognizer *)self _wantsWatchdogEnabled])
    {
      id v3 = objc_alloc(MEMORY[0x1E4F4F660]);
      double v4 = NSString;
      uint64_t v5 = [(SBIndirectPanGestureRecognizer *)self name];
      BOOL v6 = [v4 stringWithFormat:@"Watchdog - %@", v5];
      double v7 = (BSAbsoluteMachTimer *)[v3 initWithIdentifier:v6];
      watchdogTimer = self->_watchdogTimer;
      self->_watchdogTimer = v7;

      objc_initWeak(&location, self);
      double v9 = self->_watchdogTimer;
      [(SBIndirectPanGestureRecognizer *)self _watchdogTimeoutInSeconds];
      double v11 = v10;
      uint64_t v12 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __64__SBIndirectPanGestureRecognizer__startWatchdogTimerIfNecessary__block_invoke;
      v22[3] = &unk_1E6AF5838;
      objc_copyWeak(&v23, &location);
      [(BSAbsoluteMachTimer *)v9 scheduleWithFireInterval:v12 leewayInterval:v22 queue:v11 handler:0.0];

      double v14 = (BSAuditHistory *)objc_alloc_init(MEMORY[0x1E4F4F698]);
      auditHistory = self->_auditHistory;
      self->_auditHistory = v14;

      double v16 = NSString;
      id v17 = [(SBIndirectPanGestureRecognizer *)self name];
      double v18 = [v16 stringWithFormat:@"SpringBoard - SBIndirectPanGestureRecognizer - %p - %@", self, v17];
      objc_copyWeak(&v21, &location);
      BSLogAddStateCaptureBlockWithTitle();
      v19 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      logCaptureHandle = self->_logCaptureHandle;
      self->_logCaptureHandle = v19;

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

void __64__SBIndirectPanGestureRecognizer__startWatchdogTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _watchdogFired];
}

__CFString *__64__SBIndirectPanGestureRecognizer__startWatchdogTimerIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained debugDescription];
  }
  else
  {
    id v3 = &stru_1F3084718;
  }

  return v3;
}

- (void)_resetWatchdogIfNecessary
{
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    [(BSAbsoluteMachTimer *)watchdogTimer invalidate];
    double v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;

    auditHistory = self->_auditHistory;
    self->_auditHistory = 0;

    [(BSInvalidatable *)self->_logCaptureHandle invalidate];
    logCaptureHandle = self->_logCaptureHandle;
    self->_logCaptureHandle = 0;
  }
}

- (void)_watchdogFired
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [a1 name];
  double v7 = objc_msgSend(a1, "sb_stringForState");
  long double v8 = [a2 descriptionWithMultilinePrefix:0];
  OUTLINED_FUNCTION_0_20();
  uint64_t v12 = v7;
  __int16 v13 = v9;
  uint64_t v14 = v10;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "SBIndirectPanGestureRecognizer (%@, %@) – watchdog fired!! - %@", v11, 0x20u);
}

- (BOOL)_wantsWatchdogEnabled
{
  id v3 = [(SBIndirectPanGestureRecognizer *)self name];
  if ([v3 isEqualToString:@"indirectPresentCoverSheetGestureRecognizer"])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(SBIndirectPanGestureRecognizer *)self name];
    char v4 = [v5 isEqualToString:@"indirectPresentControlCenterGestureRecognizer"];
  }
  return v4;
}

- (double)_watchdogTimeoutInSeconds
{
  return 2.0;
}

- (CGPoint)locationInView:(id)a3
{
  p_origin = &self->_origin;
  id v5 = a3;
  BOOL v6 = [(SBIndirectPanGestureRecognizer *)self containerView];
  -[SBIndirectPanGestureRecognizer _convertPoint:fromView:toView:](self, "_convertPoint:fromView:toView:", v6, v5, p_origin->x, p_origin->y);
  double v8 = v7;
  double v10 = v9;

  [(SBIndirectPanGestureRecognizer *)self translationInView:v5];
  double v12 = v11;
  double v14 = v13;

  double v15 = v8 + v12;
  double v16 = v10 + v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  p_origin = &self->_origin;
  id v5 = a3;
  BOOL v6 = [(SBIndirectPanGestureRecognizer *)self containerView];
  -[SBIndirectPanGestureRecognizer _convertPoint:fromView:toView:](self, "_convertPoint:fromView:toView:", v6, v5, p_origin->x, p_origin->y);
  double v8 = v7;
  double v10 = v9;

  double v11 = [(SBIndirectPanGestureRecognizer *)self containerView];
  -[SBIndirectPanGestureRecognizer _convertPoint:fromView:toView:](self, "_convertPoint:fromView:toView:", v11, v5, self->_lastKnownPoint.x, self->_lastKnownPoint.y);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13 - v8;
  double v17 = v15 - v10;
  if (self->_shouldInvertXAxis) {
    double v16 = -(v13 - v8);
  }
  if (self->_shouldInvertYAxis) {
    double v17 = -v17;
  }
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromView:(id)a4 toView:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a5;
  objc_msgSend(a4, "convertPoint:toView:", 0, x, y);
  objc_msgSend(v8, "convertPoint:fromView:", 0);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (id)containerView
{
  id v3 = [(SBIndirectPanGestureRecognizer *)self delegate];
  char v4 = [v3 viewForSystemGestureRecognizer:self];

  return v4;
}

- (void)setHysteresis:(double)a3 forInputType:(unint64_t)a4
{
  if (a3 >= 0.0)
  {
    if (a4 == 1)
    {
      uint64_t v5 = 440;
    }
    else
    {
      if (a4) {
        return;
      }
      uint64_t v5 = 432;
    }
    *(double *)((char *)&self->super.super.isa + v5) = a3;
  }
  else
  {
    char v4 = SBLogSystemGesture();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v4);
    }
  }
}

- (double)hysteresisForInputType:(unint64_t)a3
{
  if (a3)
  {
    double result = 0.0;
    if (a3 != 1) {
      return result;
    }
    char v4 = &OBJC_IVAR___SBIndirectPanGestureRecognizer__mouseHysteresis;
  }
  else
  {
    char v4 = &OBJC_IVAR___SBIndirectPanGestureRecognizer__trackpadHysteresis;
  }
  return *(double *)((char *)&self->super.super.isa + *v4);
}

- (void)_updateTranslationWithPointerEventAttributes:(id)a3 activeEdge:(unint64_t)a4
{
  if (!a3) {
    return;
  }
  id v7 = a3;
  unsigned int v8 = SBPointerEventIsTrackpadEvent(v7);
  BSContinuousMachTimeNow();
  double v10 = &OBJC_IVAR___SBIndirectPanGestureRecognizer__lastKnownMouseEventTimestamp;
  if (v8) {
    double v10 = &OBJC_IVAR___SBIndirectPanGestureRecognizer__lastKnownTrackpadEventTimestamp;
  }
  *(Class *)((char *)&self->super.super.isa + *v10) = v9;
  double v11 = [(SBIndirectPanGestureRecognizer *)self containerView];
  id v41 = [v11 _screen];

  double v12 = SBPointerEventAcceleratedRelativePositionForOrientation(v7, [(SBIndirectPanGestureRecognizer *)self _effectiveOrientation], v41);
  double v14 = v13;

  double v15 = v12 * 0.3;
  double v16 = v14 * 0.3;
  if (self->_translationAdjustmentBlock && [(SBIndirectPanGestureRecognizer *)self state] >= 1)
  {
    double v17 = [(SBIndirectPanGestureRecognizer *)self containerView];
    [(SBIndirectPanGestureRecognizer *)self translationInView:v17];
    double v19 = v18;
    double v21 = v20;

    uint64_t v22 = [(SBIndirectPanGestureRecognizer *)self containerView];
    [(SBIndirectPanGestureRecognizer *)self locationInView:v22];
    double v24 = v23;
    double v26 = v25;

    double v15 = (*((double (**)(double, double, double, double, double, double))self->_translationAdjustmentBlock
           + 2))(v15, v16, v19, v21, v24, v26);
    double v16 = v27;
  }
  unint64_t v28 = [(SBIndirectPanGestureRecognizer *)self _axisForEdge:a4];
  if (v28 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    BOOL v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"SBIndirectPanGestureRecognizer.m" lineNumber:895 description:@"Received an invalid active edge."];

    [(SBIndirectPanGestureRecognizer *)self hysteresisForInputType:self->_currentInputType];
    goto LABEL_12;
  }
  [(SBIndirectPanGestureRecognizer *)self hysteresisForInputType:self->_currentInputType];
  if (v28 != 2)
  {
LABEL_12:
    p_translationWithinHysteresisRange = &self->_translationWithinHysteresisRange;
    goto LABEL_13;
  }
  p_translationWithinHysteresisRange = (CGPoint *)&self->_translationWithinHysteresisRange.y;
LABEL_13:
  if (v29 <= 0.0 || fabs(p_translationWithinHysteresisRange->x) > v29)
  {
    self->_lastKnownPoint.double x = v15 + self->_lastKnownPoint.x;
    p_double y = (CGPoint *)&self->_lastKnownPoint.y;
LABEL_16:
    p_y->double x = v16 + p_y->x;
    goto LABEL_17;
  }
  double v33 = v15 + self->_translationWithinHysteresisRange.x;
  double v34 = v16 + self->_translationWithinHysteresisRange.y;
  self->_translationWithinHysteresisRange.double x = v33;
  self->_translationWithinHysteresisRange.double y = v34;
  if (v28 == 2)
  {
    double v35 = fabs(v34);
    double v36 = fabs(v29);
    if (v35 <= v36) {
      goto LABEL_17;
    }
    double v37 = v35 - v36;
    if (v16 >= 0.0) {
      double v16 = v37;
    }
    else {
      double v16 = -v37;
    }
    p_double y = (CGPoint *)&self->_lastKnownPoint.y;
    goto LABEL_16;
  }
  if (v28 == 1)
  {
    double v38 = fabs(v33);
    double v39 = fabs(v29);
    if (v38 > v39)
    {
      double v40 = v38 - v39;
      if (v15 >= 0.0) {
        double v16 = v40;
      }
      else {
        double v16 = -v40;
      }
      p_double y = &self->_lastKnownPoint;
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (CGPoint)_pointerModelLocation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);
  id v4 = objc_loadWeakRetained((id *)&self->_orientationProvider);
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 indirectPanEffectiveInterfaceOrientation];
    double v6 = _SBOrientedPointerLocation(self, WeakRetained);
    double v8 = v7;
  }
  else
  {
    double v9 = [(SBIndirectPanGestureRecognizer *)self containerView];
    _UISystemGestureLocationForTouchInView();
    double v6 = v10;
    double v8 = v11;
  }
  double v12 = v6;
  double v13 = v8;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (int64_t)_effectiveOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_orientationProvider);
  id v3 = WeakRetained;
  if (WeakRetained) {
    uint64_t v4 = [WeakRetained indirectPanEffectiveInterfaceOrientation];
  }
  else {
    uint64_t v4 = [(id)SBApp activeInterfaceOrientation];
  }
  int64_t v5 = v4;

  return v5;
}

- (void)updateTouchHistoryWithTouches:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        double v10 = [(SBIndirectPanGestureRecognizer *)self containerView];
        [(SBIndirectPanGestureRecognizer *)self locationInView:v10];
        double v12 = v11;
        double v14 = v13;

        touchHistordouble y = self->_touchHistory;
        [v9 timestamp];
        -[SBTouchHistory updateWithLocation:timestamp:](touchHistory, "updateWithLocation:timestamp:", v12, v14, v16);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:a3];
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  [(SBTouchHistory *)self->_touchHistory averageTouchPathAngleOverTimeDuration:a3];
  return result;
}

- (double)peakSpeed
{
  [(SBTouchHistory *)self->_touchHistory peakSpeed];
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  -[SBIndirectPanGestureRecognizer averageTouchVelocityOverTimeDuration:](self, "averageTouchVelocityOverTimeDuration:", a3, 0.0416666667);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)[(SBIndirectPanGestureRecognizer *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(SBIndirectPanGestureRecognizer *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBIndirectPanGestureRecognizer *)self succinctDescriptionBuilder];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__SBIndirectPanGestureRecognizer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v19[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v20 = v6;
  double v21 = self;
  [v6 appendBodySectionWithName:@"configuration" multilinePrefix:v4 block:v19];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __72__SBIndirectPanGestureRecognizer_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  double v16 = &unk_1E6AF5290;
  long long v17 = self;
  id v7 = v6;
  id v18 = v7;
  [v7 appendBodySectionWithName:@"state" multilinePrefix:v4 block:&v13];

  auditHistordouble y = self->_auditHistory;
  if (auditHistory)
  {
    double v9 = [(BSAuditHistory *)auditHistory items];
    [v7 appendArraySection:v9 withName:@"AuditHistory" skipIfEmpty:0];
  }
  double v10 = v18;
  id v11 = v7;

  return v11;
}

void __72__SBIndirectPanGestureRecognizer_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 296) withName:@"edges"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 286) withName:@"shouldRequireGestureToStartAtEdge"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 282) withName:@"shouldInvertXAxis"];
  id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 283) withName:@"shouldInvertYAxis"];
  id v6 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 344));
  id v7 = (id)[v6 appendObject:WeakRetained withName:@"orientationProvider" skipIfNil:1];
}

void __72__SBIndirectPanGestureRecognizer_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 368));
  id v2 = *(void **)(a1 + 40);
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 360));
  id v4 = (id)[v2 appendObject:v3 withName:@"currentHoverEvent"];

  id v5 = (id)[*(id *)(a1 + 40) appendPointer:WeakRetained withName:@"currentTouch"];
  if (WeakRetained) {
    id v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", objc_msgSend(WeakRetained, "phase"), @"currentTouch.phase");
  }
  id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendPoint:withName:", @"lastKnownPoint", *(double *)(*(void *)(a1 + 32) + 504), *(double *)(*(void *)(a1 + 32) + 512));
  id v8 = (id)[*(id *)(a1 + 40) appendTimeInterval:@"lastKnownMouseEventTimestamp" withName:1 decomposeUnits:*(double *)(*(void *)(a1 + 32) + 376)];
  id v9 = (id)[*(id *)(a1 + 40) appendTimeInterval:@"lastKnownTrackpadEventTimestamp" withName:1 decomposeUnits:*(double *)(*(void *)(a1 + 32) + 392)];
  double v10 = *(void **)(*(void *)(a1 + 32) + 456);
  if (v10)
  {
    [v10 timeRemaining];
    BOOL v12 = v11 == 0.0;
  }
  else
  {
    BOOL v12 = 0;
  }
  id v13 = (id)[*(id *)(a1 + 40) appendBool:v12 withName:@"watchdogFired" ifEqualTo:1];
}

- (id)succinctDescription
{
  id v2 = [(SBIndirectPanGestureRecognizer *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(SBIndirectPanGestureRecognizer *)self name];
  [v3 appendString:v4 withName:@"name"];

  id v5 = [(UIGestureRecognizer *)self sb_stringForState];
  [v3 appendString:v5 withName:@"state"];

  return v3;
}

- (unint64_t)_edgeForPointerModelLocation:(CGPoint)a3 inView:(id)a4 inset:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  [a4 frame];
  if (y >= v10 - a5) {
    return 4;
  }
  if (y <= a5) {
    return 1;
  }
  if (x <= a5) {
    return 2;
  }
  if (x >= v9 - a5) {
    return 8;
  }
  return -[SBIndirectPanGestureRecognizer _isPointerOnTopScreenCorner:radius:](self, "_isPointerOnTopScreenCorner:radius:", x, y, SBScreenDisplayCornerRadius());
}

- (BOOL)_hasTranslationReachedThreshold:(double)a3 withTranslation:(CGPoint)a4 forEdge:(unint64_t)a5
{
  BOOL result = 0;
  switch(a5)
  {
    case 1uLL:
      BOOL shouldInvertYAxis = self->_shouldInvertYAxis;
      BOOL v8 = a4.y >= a3;
      BOOL v9 = a4.y > -a3;
      goto LABEL_4;
    case 2uLL:
      BOOL shouldInvertYAxis = self->_shouldInvertXAxis;
      BOOL v8 = a4.x >= a3;
      BOOL v9 = a4.x > -a3;
LABEL_4:
      BOOL v10 = !v9;
      goto LABEL_12;
    case 4uLL:
      BOOL shouldInvertYAxis = self->_shouldInvertYAxis;
      BOOL v8 = a4.y <= -a3;
      BOOL v11 = a4.y < a3;
      goto LABEL_9;
    case 8uLL:
      BOOL shouldInvertYAxis = self->_shouldInvertXAxis;
      BOOL v8 = a4.x <= -a3;
      BOOL v11 = a4.x < a3;
LABEL_9:
      BOOL v10 = !v11;
LABEL_12:
      if (shouldInvertYAxis) {
        BOOL result = v8;
      }
      else {
        BOOL result = v10;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_axisForEdge:(unint64_t)a3
{
  unint64_t result = 1;
  if ((uint64_t)a3 <= 3)
  {
    if (!a3) {
      return 0;
    }
    if (a3 != 1) {
      return result;
    }
    return 2;
  }
  if (a3 == 15) {
    return 3;
  }
  if (a3 == 4) {
    return 2;
  }
  return result;
}

- (BOOL)_isPointerOnTopScreenCorner:(CGPoint)a3 radius:(double)a4
{
  if (a4 != 0.0)
  {
    double y = a3.y;
    double x = a3.x;
    BOOL v9 = [(SBIndirectPanGestureRecognizer *)self containerView];
    [v9 bounds];
    double Width = CGRectGetWidth(v14);
    if (x > a4 || y > a4)
    {
      if (x < Width - a4 || y > a4)
      {
        BOOL v4 = 0;
LABEL_13:

        return v4;
      }
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v11 = 1;
    }
    BOOL v4 = -[SBIndirectPanGestureRecognizer _isPointOnRoundedCorner:corner:radius:inView:](self, "_isPointOnRoundedCorner:corner:radius:inView:", v11, v9, x, y, a4);
    goto LABEL_13;
  }
  return 0;
}

- (BOOL)_isPointOnRoundedCorner:(CGPoint)a3 corner:(unint64_t)a4 radius:(double)a5 inView:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  [(SBIndirectPanGestureRecognizer *)self _centerOfCircleForRoundedCorner:a4 radius:a6 inView:a5];
  return vabdd_f64(hypot(x - v9, y - v10), a5) <= 4.0;
}

- (CGPoint)_centerOfCircleForRoundedCorner:(unint64_t)a3 radius:(double)a4 inView:(id)a5
{
  [a5 bounds];
  CGFloat v11 = v7;
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  double v15 = a4;
  switch(a3)
  {
    case 1uLL:
      break;
    case 2uLL:
      double v15 = CGRectGetWidth(*(CGRect *)&v7) - a4;
      break;
    case 4uLL:
      double Height = CGRectGetHeight(*(CGRect *)&v7);
      double v15 = a4;
      goto LABEL_6;
    case 8uLL:
      double v15 = CGRectGetWidth(*(CGRect *)&v7) - a4;
      v20.origin.double x = v11;
      v20.origin.double y = v12;
      v20.size.width = v13;
      v20.size.height = v14;
      double Height = CGRectGetHeight(v20);
LABEL_6:
      a4 = Height - a4;
      break;
    default:
      double v15 = *MEMORY[0x1E4F1DAD8];
      a4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      break;
  }
  double v17 = v15;
  double v18 = a4;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (BOOL)avoidActivatingForExternallyOwnedEdges
{
  return self->_avoidActivatingForExternallyOwnedEdges;
}

- (void)setAvoidActivatingForExternallyOwnedEdges:(BOOL)a3
{
  self->_avoidActivatingForExternallyOwnedEdges = a3;
}

- (unint64_t)edges
{
  return self->_edges;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (unint64_t)activatedEdge
{
  return self->_activatedEdge;
}

- (void)setActivatedEdge:(unint64_t)a3
{
  self->_activatedEdge = a3;
}

- (BOOL)shouldCancelAfterMovingAwayFromEdge
{
  return self->_shouldCancelAfterMovingAwayFromEdge;
}

- (void)setShouldCancelAfterMovingAwayFromEdge:(BOOL)a3
{
  self->_shouldCancelAfterMovingAwayFromEdge = a3;
}

- (BOOL)shouldInvertXAxis
{
  return self->_shouldInvertXAxis;
}

- (void)setShouldInvertXAxis:(BOOL)a3
{
  self->_shouldInvertXAxis = a3;
}

- (BOOL)shouldInvertYAxis
{
  return self->_shouldInvertYAxis;
}

- (void)setShouldInvertYAxis:(BOOL)a3
{
  self->_BOOL shouldInvertYAxis = a3;
}

- (BOOL)pausedUntilTouchedUpOrMovedAwayFromEdge
{
  return self->_pausedUntilTouchedUpOrMovedAwayFromEdge;
}

- (void)setPausedUntilTouchedUpOrMovedAwayFromEdge:(BOOL)a3
{
  self->_pausedUntilTouchedUpOrMovedAwayFromEdge = a3;
}

- (id)translationAdjustmentBlock
{
  return self->_translationAdjustmentBlock;
}

- (void)setTranslationAdjustmentBlock:(id)a3
{
}

- (BOOL)shouldActivateWithThreshold
{
  return self->_shouldActivateWithThreshold;
}

- (void)setShouldActivateWithThreshold:(BOOL)a3
{
  self->_shouldActivateWithThreshold = a3;
}

- (double)activationRecognitionDistance
{
  return self->_activationRecognitionDistance;
}

- (void)setActivationRecognitionDistance:(double)a3
{
  self->_activationRecognitionDistance = a3;
}

- (BOOL)shouldRequireGestureToStartAtEdge
{
  return self->_shouldRequireGestureToStartAtEdge;
}

- (void)setShouldRequireGestureToStartAtEdge:(BOOL)a3
{
  self->_shouldRequireGestureToStartAtEdge = a3;
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (unint64_t)currentInputType
{
  return self->_currentInputType;
}

- (SBIndirectPanGestureRecognizerOrientationProviding)orientationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_orientationProvider);
  return (SBIndirectPanGestureRecognizerOrientationProviding *)WeakRetained;
}

- (void)setOrientationProvider:(id)a3
{
}

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (CGPoint)lastKnownPoint
{
  double x = self->_lastKnownPoint.x;
  double y = self->_lastKnownPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastKnownPoint:(CGPoint)a3
{
  self->_lastKnownPoint = a3;
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
}

- (UIEvent)currentHoverEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHoverEvent);
  return (UIEvent *)WeakRetained;
}

- (void)setCurrentHoverEvent:(id)a3
{
}

- (UITouch)currentTouch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);
  return (UITouch *)WeakRetained;
}

- (void)setCurrentTouch:(id)a3
{
}

- (double)lastKnownMouseEventTimestamp
{
  return self->_lastKnownMouseEventTimestamp;
}

- (void)setLastKnownMouseEventTimestamp:(double)a3
{
  self->_lastKnownMouseEventTimestamp = a3;
}

- (NSTimer)mouseIdleTimer
{
  return self->_mouseIdleTimer;
}

- (void)setMouseIdleTimer:(id)a3
{
}

- (double)lastKnownTrackpadEventTimestamp
{
  return self->_lastKnownTrackpadEventTimestamp;
}

- (void)setLastKnownTrackpadEventTimestamp:(double)a3
{
  self->_lastKnownTrackpadEventTimestamp = a3;
}

- (NSTimer)trackpadIdleTimer
{
  return self->_trackpadIdleTimer;
}

- (void)setTrackpadIdleTimer:(id)a3
{
}

- (NSValue)gestureStartLocation
{
  return self->_gestureStartLocation;
}

- (void)setGestureStartLocation:(id)a3
{
}

- (double)mouseEnteredNearEdgeRegionTimestamp
{
  return self->_mouseEnteredNearEdgeRegionTimestamp;
}

- (void)setMouseEnteredNearEdgeRegionTimestamp:(double)a3
{
  self->_mouseEnteredNearEdgeRegionTimestamp = a3;
}

- (BOOL)gesturePassedThroughScreenCenterRegion
{
  return self->_gesturePassedThroughScreenCenterRegion;
}

- (void)setGesturePassedThroughScreenCenterRegion:(BOOL)a3
{
  self->_gesturePassedThroughScreenCenterRegion = a3;
}

- (double)lastMouseActivationTimestamp
{
  return self->_lastMouseActivationTimestamp;
}

- (void)setLastMouseActivationTimestamp:(double)a3
{
  self->_lastMouseActivationTimestamp = a3;
}

- (double)trackpadHysteresis
{
  return self->_trackpadHysteresis;
}

- (void)setTrackpadHysteresis:(double)a3
{
  self->_trackpadHysteresis = a3;
}

- (double)mouseHysteresis
{
  return self->_mouseHysteresis;
}

- (void)setMouseHysteresis:(double)a3
{
  self->_mouseHysteresis = a3;
}

- (CGPoint)translationWithinHysteresisRange
{
  double x = self->_translationWithinHysteresisRange.x;
  double y = self->_translationWithinHysteresisRange.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslationWithinHysteresisRange:(CGPoint)a3
{
  self->_translationWithinHysteresisRange = a3;
}

- (unint64_t)activatingEdge
{
  return self->_activatingEdge;
}

- (void)setActivatingEdge:(unint64_t)a3
{
  self->_activatingEdge = a3;
}

- (BSAbsoluteMachTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void)setWatchdogTimer:(id)a3
{
}

- (BSAuditHistory)auditHistory
{
  return self->_auditHistory;
}

- (void)setAuditHistory:(id)a3
{
}

- (BSInvalidatable)logCaptureHandle
{
  return self->_logCaptureHandle;
}

- (void)setLogCaptureHandle:(id)a3
{
}

- (int64_t)pointerVisibilityState
{
  return self->_pointerVisibilityState;
}

- (void)setPointerVisibilityState:(int64_t)a3
{
  self->_pointerVisibilityState = a3;
}

- (BOOL)pointerHiddenBeforeCurrentTouch
{
  return self->_pointerHiddenBeforeCurrentTouch;
}

- (void)setPointerHiddenBeforeCurrentTouch:(BOOL)a3
{
  self->_pointerHiddenBeforeCurrentTouch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCaptureHandle, 0);
  objc_storeStrong((id *)&self->_auditHistory, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_gestureStartLocation, 0);
  objc_storeStrong((id *)&self->_trackpadIdleTimer, 0);
  objc_storeStrong((id *)&self->_mouseIdleTimer, 0);
  objc_destroyWeak((id *)&self->_currentTouch);
  objc_destroyWeak((id *)&self->_currentHoverEvent);
  objc_storeStrong((id *)&self->_touchHistory, 0);
  objc_destroyWeak((id *)&self->_orientationProvider);
  objc_storeStrong(&self->_translationAdjustmentBlock, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
}

- (void)initWithTarget:(os_log_t)log action:edges:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  id v2 = "-[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]";
}

- (void)_hoverMoved:(void *)a1 withEvent:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 description];
  int v4 = 136315138;
  uint64_t v5 = [v3 UTF8String];
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Indirect pan gesture received hoverMoved with no pointerAttributes! HIDEvent: %s", (uint8_t *)&v4, 0xCu);
}

- (void)setHysteresis:(os_log_t)log forInputType:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBIndirectGestureRecognizer hysteresis must be greater than or equal to 0.", v1, 2u);
}

@end