@interface _UIRotaryGestureRecognizer
- (BOOL)_effectiveCanBeginFromRest;
- (BOOL)_effectiveMustBeginFromRest;
- (BOOL)_invalidateRestingTouchBeginTimerIfNecessary;
- (BOOL)_isPoint:(CGPoint)a3 inRangeOfCenter:(double)a4;
- (BOOL)_isTouchFarEnoughFromCenterToActivateRestingTouch:(CGPoint)a3;
- (BOOL)_isTouchInRangeOfInitialTouchForRestingTouchActivation:(CGPoint)a3;
- (BOOL)isActivelyTouching;
- (_UIRotaryGestureRecognizer)initWithCoder:(id)a3;
- (_UIRotaryGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)_applyDeadbandToValue:(double)result;
- (double)_applyDistanceWeightToValue:(double)a3;
- (double)_applyScaleFactor:(double)a3 toValue:(double)a4 fromAngle:(double)a5 toAngle:(double)a6;
- (double)_calculateAngleForTouchLocation:(CGPoint)a3;
- (double)_calculateCurrentWheelPosition;
- (double)_calculateRadialDistance:(CGPoint)a3;
- (double)_calculateWheelPositionForTouchLocation:(CGPoint)a3;
- (double)_deadzoneRangeForCurrentTouchLocation;
- (double)_deltaForEventInfos:(id)a3;
- (double)_directionalMovementClassificationDistanceThreshold;
- (double)_movementClassificationAngleThresholdNumerator;
- (double)_restingTouchRangeForCurrentTouchLocation;
- (double)_velocityForEventInfos:(id)a3;
- (double)accumulatedDistance;
- (double)delta;
- (double)position;
- (double)velocity;
- (int64_t)_regionForTouchLocation:(CGPoint)a3;
- (int64_t)_regionForWheelPosition:(double)a3;
- (int64_t)beganMode;
- (int64_t)startRegion;
- (void)_activateRestingTouchRecoveryTimer;
- (void)_attemptToClassifyWithPreviousLocation:(CGPoint)a3 newLocation:(CGPoint)a4;
- (void)_attemptToStartFromRestingTouch:(id)a3;
- (void)_endGestureFromRestingTouchRecovery:(id)a3;
- (void)_enterRecoveryWindowOrEndGestureWithState:(int64_t)a3;
- (void)_invalidateRestingTouchRecoveryTimerIfNecessary;
- (void)_notifyDelegateBeganClassifyingMovementIfNecessary;
- (void)_notifyDelegateFailedClassifyingMovement;
- (void)_notifyDelegateRestTimerCancelledIfNecessary:(BOOL)a3;
- (void)_notifyDelegateUpdatedClassifyingMovement;
- (void)_processEvent:(id)a3;
- (void)_resetDeadband;
- (void)reset;
- (void)setAccumulatedDistance:(double)a3;
- (void)setBeganMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDelta:(double)a3;
- (void)setIsActivelyTouching:(BOOL)a3;
- (void)setStartRegion:(int64_t)a3;
- (void)setVelocity:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIRotaryGestureRecognizer

- (_UIRotaryGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIRotaryGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4) {
    [(UIGestureRecognizer *)v4 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
  }
  return v5;
}

- (_UIRotaryGestureRecognizer)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIRotaryGestureRecognizer;
  v3 = [(UIGestureRecognizer *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(UIGestureRecognizer *)v3 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
  }
  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  p_touchBeganPoint = &self->_touchBeganPoint;
  objc_msgSend(a4, "_digitizerLocation", a3);
  p_touchBeganPoint->x = v7;
  p_touchBeganPoint->y = v8;
  [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchRecoveryTimerIfNecessary];
  [a4 _digitizerLocation];
  self->_digitizerLocation.x = v9;
  self->_digitizerLocation.y = v10;
  [(_UIRotaryGestureRecognizer *)self _calculateCurrentWheelPosition];
  self->_currentWheelPosition = v11;
  -[_UIRotaryGestureRecognizer setStartRegion:](self, "setStartRegion:", -[_UIRotaryGestureRecognizer _regionForWheelPosition:](self, "_regionForWheelPosition:"));
  if (-[_UIRotaryGestureRecognizer _isTouchFarEnoughFromCenterToActivateRestingTouch:](self, "_isTouchFarEnoughFromCenterToActivateRestingTouch:", p_touchBeganPoint->x, p_touchBeganPoint->y)&& [(_UIRotaryGestureRecognizer *)self _effectiveCanBeginFromRest])
  {
    [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchBeginTimerIfNecessary];
    if ((*(unsigned char *)&self->_rotaryGestureRecognizerFlags & 4) != 0)
    {
      v12 = [(UIGestureRecognizer *)self delegate];
      [v12 rotaryGestureRecognizerStartedRestTimer:self];
    }
    v13 = (void *)MEMORY[0x1E4F1CB00];
    int v14 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RestingTouchDuration, @"B519_RestingTouchDuration");
    double v15 = *(double *)&qword_1E8FD51E8;
    if (v14) {
      double v15 = 0.2;
    }
    v16 = [v13 timerWithTimeInterval:self target:sel__attemptToStartFromRestingTouch_ selector:0 userInfo:0 repeats:v15];
    restingTouchBeginTimer = self->_restingTouchBeginTimer;
    self->_restingTouchBeginTimer = v16;

    v18 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v18 addTimer:self->_restingTouchBeginTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
  else if ([(_UIRotaryGestureRecognizer *)self _effectiveMustBeginFromRest])
  {
    [(UIGestureRecognizer *)self setState:5];
  }
  if ([(UIGestureRecognizer *)self state] != UIGestureRecognizerStateFailed)
  {
    [(_UIRotaryGestureRecognizer *)self _processEvent:a4];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_msgSend(a4, "_digitizerLocation", a3);
  if (-[_UIRotaryGestureRecognizer _isTouchInRangeOfInitialTouchForRestingTouchActivation:](self, "_isTouchInRangeOfInitialTouchForRestingTouchActivation:"))
  {
LABEL_4:
    [(_UIRotaryGestureRecognizer *)self _processEvent:a4];
    return;
  }
  if ([(UIGestureRecognizer *)self state]
    || !self->_restingTouchBeginTimer
    || ![(_UIRotaryGestureRecognizer *)self _effectiveMustBeginFromRest])
  {
    [(_UIRotaryGestureRecognizer *)self _notifyDelegateRestTimerCancelledIfNecessary:[(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchBeginTimerIfNecessary]];
    goto LABEL_4;
  }
  [(UIGestureRecognizer *)self setState:5];
  BOOL v6 = [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchBeginTimerIfNecessary];
  [(_UIRotaryGestureRecognizer *)self _notifyDelegateRestTimerCancelledIfNecessary:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  BOOL v5 = [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchBeginTimerIfNecessary];
  [(_UIRotaryGestureRecognizer *)self setIsActivelyTouching:0];
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan
    || [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateChanged)
  {
    [(_UIRotaryGestureRecognizer *)self _enterRecoveryWindowOrEndGestureWithState:3];
  }
  else
  {
    [(UIGestureRecognizer *)self setState:5];
    [(_UIRotaryGestureRecognizer *)self _notifyDelegateRestTimerCancelledIfNecessary:v5];
    [(_UIRotaryGestureRecognizer *)self _notifyDelegateFailedClassifyingMovement];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  BOOL v5 = [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchBeginTimerIfNecessary];
  [(_UIRotaryGestureRecognizer *)self setIsActivelyTouching:0];
  if ([(UIGestureRecognizer *)self state])
  {
    [(_UIRotaryGestureRecognizer *)self _enterRecoveryWindowOrEndGestureWithState:4];
  }
  else
  {
    [(UIGestureRecognizer *)self setState:5];
    [(_UIRotaryGestureRecognizer *)self _notifyDelegateRestTimerCancelledIfNecessary:v5];
    [(_UIRotaryGestureRecognizer *)self _notifyDelegateFailedClassifyingMovement];
  }
}

- (void)reset
{
  [(_UIRotaryGestureRecognizer *)self setDelta:0.0];
  [(_UIRotaryGestureRecognizer *)self setVelocity:0.0];
  [(_UIRotaryGestureRecognizer *)self setAccumulatedDistance:0.0];
  [(_UIRotaryGestureRecognizer *)self setStartRegion:0];
  [(_UIRotaryGestureRecognizer *)self setBeganMode:0];
  [(_UIRotaryGestureRecognizer *)self setIsActivelyTouching:0];
  self->_currentWheelPosition = 0.0;
  self->_startWheelPosition = 0.0;
  self->_movementClassification = 0;
  recentRotaryEvents = self->_recentRotaryEvents;
  self->_recentRotaryEvents = 0;

  delegateMustBeginFromRestValue = self->_delegateMustBeginFromRestValue;
  self->_delegateMustBeginFromRestValue = 0;

  CGPoint v5 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_touchBeganPoint = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_digitizerLocation = v5;
  self->_hasNotifiedDelegateBeganClassifyingMovement = 0;
  [(_UIRotaryGestureRecognizer *)self _resetDeadband];
  [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchBeginTimerIfNecessary];
  [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchRecoveryTimerIfNecessary];
  v6.receiver = self;
  v6.super_class = (Class)_UIRotaryGestureRecognizer;
  [(UIGestureRecognizer *)&v6 reset];
}

- (void)_enterRecoveryWindowOrEndGestureWithState:(int64_t)a3
{
  int v5 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RestingTouchRecoveryWindow, @"B519_RestingTouchRecoveryWindow");
  double v6 = *(double *)&qword_1E8FD51F8;
  if (v5) {
    double v6 = 0.2;
  }
  if (v6 == 0.0)
  {
    [(UIGestureRecognizer *)self setState:a3];
  }
  else
  {
    [(_UIRotaryGestureRecognizer *)self setDelta:0.0];
    [(_UIRotaryGestureRecognizer *)self setVelocity:0.0];
    [(UIGestureRecognizer *)self setState:2];
    [(_UIRotaryGestureRecognizer *)self _activateRestingTouchRecoveryTimer];
  }
}

- (BOOL)_isTouchFarEnoughFromCenterToActivateRestingTouch:(CGPoint)a3
{
  [(_UIRotaryGestureRecognizer *)self _restingTouchRangeForCurrentTouchLocation];
  return !-[_UIRotaryGestureRecognizer _isPoint:inRangeOfCenter:](self, "_isPoint:inRangeOfCenter:", self->_touchBeganPoint.x, self->_touchBeganPoint.y, v4);
}

- (BOOL)_isTouchInRangeOfInitialTouchForRestingTouchActivation:(CGPoint)a3
{
  double v3 = sqrt((a3.x - self->_touchBeganPoint.x) * (a3.x - self->_touchBeganPoint.x)+ (a3.y - self->_touchBeganPoint.y) * (a3.y - self->_touchBeganPoint.y));
  int v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RestingTouchMovementAllowance, @"B519_RestingTouchMovementAllowance");
  double v5 = *(double *)&qword_1E8FD5208;
  if (v4) {
    double v5 = 0.05;
  }
  return v3 <= v5;
}

- (void)_activateRestingTouchRecoveryTimer
{
  [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchRecoveryTimerIfNecessary];
  double v3 = (void *)MEMORY[0x1E4F1CB00];
  int v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RestingTouchRecoveryWindow, @"B519_RestingTouchRecoveryWindow");
  double v5 = *(double *)&qword_1E8FD51F8;
  if (v4) {
    double v5 = 0.2;
  }
  double v6 = [v3 timerWithTimeInterval:self target:sel__endGestureFromRestingTouchRecovery_ selector:0 userInfo:0 repeats:v5];
  restingTouchRecoveryTimer = self->_restingTouchRecoveryTimer;
  self->_restingTouchRecoveryTimer = v6;

  id v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v8 addTimer:self->_restingTouchRecoveryTimer forMode:*MEMORY[0x1E4F1C4B0]];
}

- (void)_endGestureFromRestingTouchRecovery:(id)a3
{
  [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchRecoveryTimerIfNecessary];
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan
    || [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateChanged)
  {
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (BOOL)_invalidateRestingTouchBeginTimerIfNecessary
{
  restingTouchBeginTimer = self->_restingTouchBeginTimer;
  if (restingTouchBeginTimer)
  {
    [(NSTimer *)self->_restingTouchBeginTimer invalidate];
    int v4 = self->_restingTouchBeginTimer;
    self->_restingTouchBeginTimer = 0;
  }
  return restingTouchBeginTimer != 0;
}

- (void)_invalidateRestingTouchRecoveryTimerIfNecessary
{
  restingTouchRecoveryTimer = self->_restingTouchRecoveryTimer;
  if (restingTouchRecoveryTimer)
  {
    [(NSTimer *)restingTouchRecoveryTimer invalidate];
    int v4 = self->_restingTouchRecoveryTimer;
    self->_restingTouchRecoveryTimer = 0;
  }
}

- (void)_attemptToStartFromRestingTouch:(id)a3
{
  [(_UIRotaryGestureRecognizer *)self _invalidateRestingTouchBeginTimerIfNecessary];
  if (-[_UIRotaryGestureRecognizer _isTouchInRangeOfInitialTouchForRestingTouchActivation:](self, "_isTouchInRangeOfInitialTouchForRestingTouchActivation:", self->_digitizerLocation.x, self->_digitizerLocation.y))
  {
    if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
    {
      [(_UIRotaryGestureRecognizer *)self _calculateCurrentWheelPosition];
      self->_currentWheelPosition = v4;
      -[_UIRotaryGestureRecognizer setStartRegion:](self, "setStartRegion:", -[_UIRotaryGestureRecognizer _regionForWheelPosition:](self, "_regionForWheelPosition:"));
      if ([(_UIRotaryGestureRecognizer *)self _effectiveCanBeginFromRest])
      {
        [(_UIRotaryGestureRecognizer *)self setBeganMode:1];
        if ([(_UIRotaryGestureRecognizer *)self _effectiveMustBeginFromRest])
        {
          self->_touchBeganPoint = self->_digitizerLocation;
          self->_movementClassification = 0;
        }
        [(_UIRotaryGestureRecognizer *)self _notifyDelegateBeganClassifyingMovementIfNecessary];
      }
    }
  }
}

- (BOOL)_effectiveCanBeginFromRest
{
  if ((*(unsigned char *)&self->_rotaryGestureRecognizerFlags & 1) == 0) {
    return 1;
  }
  double v3 = self;
  double v4 = [(UIGestureRecognizer *)self delegate];
  LOBYTE(v3) = [v4 rotaryGestureRecognizerCanBeginFromRest:v3];

  return (char)v3;
}

- (int64_t)_regionForTouchLocation:(CGPoint)a3
{
  -[_UIRotaryGestureRecognizer _calculateWheelPositionForTouchLocation:](self, "_calculateWheelPositionForTouchLocation:", a3.x, a3.y);
  return -[_UIRotaryGestureRecognizer _regionForWheelPosition:](self, "_regionForWheelPosition:");
}

- (int64_t)_regionForWheelPosition:(double)a3
{
  if (a3 >= 0.0 && a3 <= 0.125) {
    return 1;
  }
  if (a3 >= 0.875 && a3 <= 1.0) {
    return 1;
  }
  if (a3 > 0.125 && a3 < 0.375) {
    return 4;
  }
  if (a3 >= 0.375 && a3 <= 0.625) {
    return 2;
  }
  if (a3 >= 0.875 || a3 <= 0.625) {
    return 0;
  }
  else {
    return 3;
  }
}

- (double)_calculateCurrentWheelPosition
{
  -[_UIRotaryGestureRecognizer _calculateWheelPositionForTouchLocation:](self, "_calculateWheelPositionForTouchLocation:", self->_digitizerLocation.x, self->_digitizerLocation.y);
  return result;
}

- (double)_calculateWheelPositionForTouchLocation:(CGPoint)a3
{
  -[_UIRotaryGestureRecognizer _calculateAngleForTouchLocation:](self, "_calculateAngleForTouchLocation:", a3.x, a3.y);
  return v3 / 360.0;
}

- (void)_processEvent:(id)a3
{
  p_digitizerLocation = &self->_digitizerLocation;
  double x = self->_digitizerLocation.x;
  double y = self->_digitizerLocation.y;
  [a3 _digitizerLocation];
  p_digitizerLocation->double x = v8;
  p_digitizerLocation->double y = v9;
  if ([(_UIRotaryGestureRecognizer *)self _effectiveMustBeginFromRest]
    && [(_UIRotaryGestureRecognizer *)self beganMode] != 1)
  {
    return;
  }
  int64_t movementClassification = self->_movementClassification;
  UIGestureRecognizerState v11 = [(UIGestureRecognizer *)self state];
  if (!(v11 | movementClassification)) {
    -[_UIRotaryGestureRecognizer _attemptToClassifyWithPreviousLocation:newLocation:](self, "_attemptToClassifyWithPreviousLocation:newLocation:", x, y, p_digitizerLocation->x, p_digitizerLocation->y);
  }
  int64_t v12 = self->_movementClassification;
  if (v12 == 1)
  {
    [(UIGestureRecognizer *)self setState:5];
    [(_UIRotaryGestureRecognizer *)self _notifyDelegateFailedClassifyingMovement];
  }
  else
  {
    if (v12 == 2)
    {
      if (!self->_recentRotaryEvents)
      {
        v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        recentRotaryEvents = self->_recentRotaryEvents;
        self->_recentRotaryEvents = v13;
      }
      [(_UIRotaryGestureRecognizer *)self _deadzoneRangeForCurrentTouchLocation];
      BOOL v16 = -[_UIRotaryGestureRecognizer _isPoint:inRangeOfCenter:](self, "_isPoint:inRangeOfCenter:", p_digitizerLocation->x, p_digitizerLocation->y, v15);
      double currentWheelPosition = self->_currentWheelPosition;
      [(_UIRotaryGestureRecognizer *)self _calculateCurrentWheelPosition];
      self->_double currentWheelPosition = v18;
      if (movementClassification)
      {
        if ([(_UIRotaryGestureRecognizer *)self isActivelyTouching])
        {
          double v19 = self->_currentWheelPosition;
          char v20 = currentWheelPosition == v19 || v16;
          if (v20)
          {
            if (!v16) {
              [(NSMutableArray *)self->_recentRotaryEvents removeAllObjects];
            }
            [(_UIRotaryGestureRecognizer *)self setDelta:0.0];
            [(_UIRotaryGestureRecognizer *)self setVelocity:0.0];
            [(UIGestureRecognizer *)self setState:2];
            return;
          }
          double v33 = v19 - currentWheelPosition;
          double v34 = vabdd_f64(v19, currentWheelPosition);
          double v35 = v33 + 1.0;
          if (v33 > 0.0) {
            double v35 = v33 + -1.0;
          }
          if (v34 > 0.5) {
            double v36 = v35;
          }
          else {
            double v36 = v33;
          }
          [a3 timestamp];
          uint64_t v38 = v37;
          double v39 = (double)(unint64_t)[(NSMutableArray *)self->_recentRotaryEvents count];
          int v40 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RotaryVelocityFilterSamples, @"B519_RotaryVelocityFilterSamples");
          double v41 = *(double *)&qword_1E8FD5228;
          if (v40) {
            double v41 = 5.0;
          }
          if (v41 < v39) {
            [(NSMutableArray *)self->_recentRotaryEvents removeObjectAtIndex:0];
          }
          v42 = self->_recentRotaryEvents;
          v47[0] = v38;
          *(double *)&v47[1] = v36;
          v43 = [MEMORY[0x1E4F29238] valueWithBytes:v47 objCType:"{UIRotaryEventInfo=dd}"];
          [(NSMutableArray *)v42 addObject:v43];

          [(_UIRotaryGestureRecognizer *)self _deltaForEventInfos:self->_recentRotaryEvents];
          -[_UIRotaryGestureRecognizer _applyDistanceWeightToValue:](self, "_applyDistanceWeightToValue:");
          -[_UIRotaryGestureRecognizer _applyDeadbandToValue:](self, "_applyDeadbandToValue:");
          double v45 = v44;
          [(_UIRotaryGestureRecognizer *)self accumulatedDistance];
          [(_UIRotaryGestureRecognizer *)self setAccumulatedDistance:v45 + v46];
          [(_UIRotaryGestureRecognizer *)self setDelta:v45];
          [(_UIRotaryGestureRecognizer *)self _velocityForEventInfos:self->_recentRotaryEvents];
          -[_UIRotaryGestureRecognizer _applyDistanceWeightToValue:](self, "_applyDistanceWeightToValue:");
        }
        else
        {
          [a3 timestamp];
          uint64_t v29 = v28;
          [(NSMutableArray *)self->_recentRotaryEvents removeAllObjects];
          v30 = self->_recentRotaryEvents;
          v48[0] = v29;
          v48[1] = 0;
          v31 = [MEMORY[0x1E4F29238] valueWithBytes:v48 objCType:"{UIRotaryEventInfo=dd}"];
          [(NSMutableArray *)v30 addObject:v31];

          [(_UIRotaryGestureRecognizer *)self setDelta:0.0];
          [(_UIRotaryGestureRecognizer *)self setIsActivelyTouching:1];
          double v32 = 0.0;
        }
        [(_UIRotaryGestureRecognizer *)self setVelocity:v32];
        v26 = self;
        uint64_t v27 = 2;
      }
      else
      {
        [a3 timestamp];
        uint64_t v23 = v22;
        [(NSMutableArray *)self->_recentRotaryEvents removeAllObjects];
        v24 = self->_recentRotaryEvents;
        v49[0] = v23;
        v49[1] = 0;
        v25 = [MEMORY[0x1E4F29238] valueWithBytes:v49 objCType:"{UIRotaryEventInfo=dd}"];
        [(NSMutableArray *)v24 addObject:v25];

        [(_UIRotaryGestureRecognizer *)self setAccumulatedDistance:0.0];
        [(_UIRotaryGestureRecognizer *)self setDelta:0.0];
        [(_UIRotaryGestureRecognizer *)self setStartRegion:[(_UIRotaryGestureRecognizer *)self _regionForWheelPosition:self->_currentWheelPosition]];
        [(_UIRotaryGestureRecognizer *)self setIsActivelyTouching:1];
        if (![(_UIRotaryGestureRecognizer *)self beganMode]) {
          [(_UIRotaryGestureRecognizer *)self setBeganMode:2];
        }
        self->_startWheelPosition = self->_currentWheelPosition;
        [(_UIRotaryGestureRecognizer *)self _resetDeadband];
        v26 = self;
        uint64_t v27 = 1;
      }
      [(UIGestureRecognizer *)v26 setState:v27];
      return;
    }
    if (v11 == UIGestureRecognizerStatePossible)
    {
      [(_UIRotaryGestureRecognizer *)self _calculateCurrentWheelPosition];
      self->_double currentWheelPosition = v21;
      [(_UIRotaryGestureRecognizer *)self setAccumulatedDistance:0.0];
      [(_UIRotaryGestureRecognizer *)self setDelta:0.0];
      [(_UIRotaryGestureRecognizer *)self setStartRegion:[(_UIRotaryGestureRecognizer *)self _regionForWheelPosition:self->_currentWheelPosition]];
      [(_UIRotaryGestureRecognizer *)self setIsActivelyTouching:1];
      if (!self->_restingTouchBeginTimer)
      {
        if (self->_hasNotifiedDelegateBeganClassifyingMovement)
        {
          [(_UIRotaryGestureRecognizer *)self _notifyDelegateUpdatedClassifyingMovement];
        }
        else
        {
          [(_UIRotaryGestureRecognizer *)self _notifyDelegateBeganClassifyingMovementIfNecessary];
        }
      }
    }
  }
}

- (void)_notifyDelegateRestTimerCancelledIfNecessary:(BOOL)a3
{
  if (self->_movementClassification != 2 && a3 && (*(unsigned char *)&self->_rotaryGestureRecognizerFlags & 8) != 0)
  {
    id v6 = [(UIGestureRecognizer *)self delegate];
    [v6 rotaryGestureRecognizerCancelledRestTimer:self];
  }
}

- (void)_notifyDelegateBeganClassifyingMovementIfNecessary
{
  if (!self->_hasNotifiedDelegateBeganClassifyingMovement
    && (*(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0x10) != 0)
  {
    self->_hasNotifiedDelegateBeganClassifyingMovement = 1;
    id v3 = [(UIGestureRecognizer *)self delegate];
    [v3 rotaryGestureRecognizerBeganClassifyingMovement:self];
  }
}

- (void)_notifyDelegateUpdatedClassifyingMovement
{
  if (self->_hasNotifiedDelegateBeganClassifyingMovement
    && (*(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0x20) != 0)
  {
    id v3 = [(UIGestureRecognizer *)self delegate];
    [v3 rotaryGestureRecognizerUpdatedClassifyingMovement:self];
  }
}

- (void)_notifyDelegateFailedClassifyingMovement
{
  if (self->_hasNotifiedDelegateBeganClassifyingMovement
    && (*(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0x40) != 0)
  {
    id v3 = [(UIGestureRecognizer *)self delegate];
    [v3 rotaryGestureRecognizerFailedClassifyingMovement:self];
  }
}

- (BOOL)_effectiveMustBeginFromRest
{
  if (self->_restingTouchRecoveryTimer) {
    goto LABEL_2;
  }
  delegateMustBeginFromRestValue = self->_delegateMustBeginFromRestValue;
  if (!delegateMustBeginFromRestValue)
  {
    if ((*(unsigned char *)&self->_rotaryGestureRecognizerFlags & 2) != 0)
    {
      id v6 = [(UIGestureRecognizer *)self delegate];
      uint64_t v2 = [v6 rotaryGestureRecognizerMustBeginFromRest:self];

      CGFloat v7 = [NSNumber numberWithBool:v2];
      CGFloat v8 = self->_delegateMustBeginFromRestValue;
      self->_delegateMustBeginFromRestValue = v7;

      return v2;
    }
LABEL_2:
    LOBYTE(v2) = 0;
    return v2;
  }
  return [(NSNumber *)delegateMustBeginFromRestValue BOOLValue];
}

- (void)_attemptToClassifyWithPreviousLocation:(CGPoint)a3 newLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[_UIRotaryGestureRecognizer _calculateRadialDistance:](self, "_calculateRadialDistance:", a4.x, a4.y);
  double v8 = v7;
  int64_t v9 = -[_UIRotaryGestureRecognizer _regionForTouchLocation:](self, "_regionForTouchLocation:", x, y);
  -[_UIRotaryGestureRecognizer _calculateAngleForTouchLocation:](self, "_calculateAngleForTouchLocation:", x, y);
  if (!self->_movementClassification)
  {
    double v11 = v10;
    -[_UIRotaryGestureRecognizer _calculateRadialDistance:](self, "_calculateRadialDistance:", self->_touchBeganPoint.x, self->_touchBeganPoint.y);
    double v13 = v12;
    -[_UIRotaryGestureRecognizer _calculateAngleForTouchLocation:](self, "_calculateAngleForTouchLocation:", self->_touchBeganPoint.x, self->_touchBeganPoint.y);
    if (v11 <= 270.0 || v14 >= 90.0)
    {
      if (v14 > 270.0 && v11 < 90.0) {
        double v15 = v11 - v14 + 360.0;
      }
      else {
        double v15 = v11 - v14;
      }
    }
    else
    {
      double v15 = -(v14 - v11 + 360.0);
    }
    [(_UIRotaryGestureRecognizer *)self _movementClassificationAngleThresholdNumerator];
    double v18 = v17;
    [(_UIRotaryGestureRecognizer *)self _directionalMovementClassificationDistanceThreshold];
    double v20 = v19;
    if ([(_UIRotaryGestureRecognizer *)self startRegion] == 1)
    {
      int v21 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2574B8, @"B519_DistanceFromCenterTopQuadrantThreshold");
      uint64_t v22 = qword_1EB2574C0;
      BOOL v23 = v21 == 0;
      double v24 = 0.2;
    }
    else
    {
      int v25 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2574C8, @"B519_DistanceFromCenterThreshold");
      uint64_t v22 = qword_1EB2574D0;
      BOOL v23 = v25 == 0;
      double v24 = 0.23;
    }
    if (v23) {
      double v26 = *(double *)&v22;
    }
    else {
      double v26 = v24;
    }
    if (v9 == 1)
    {
      int v27 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2574B8, @"B519_DistanceFromCenterTopQuadrantThreshold");
      uint64_t v28 = qword_1EB2574C0;
      BOOL v29 = v27 == 0;
      double v30 = 0.2;
    }
    else
    {
      int v31 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2574C8, @"B519_DistanceFromCenterThreshold");
      uint64_t v28 = qword_1EB2574D0;
      BOOL v29 = v31 == 0;
      double v30 = 0.23;
    }
    if (v29) {
      double v32 = *(double *)&v28;
    }
    else {
      double v32 = v30;
    }
    if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2574D8, @"B519_DistanceFromCenterMinimumThreshold"))double v33 = 0.18; {
    else
    }
      double v33 = *(double *)&qword_1EB2574E0;
    int64_t v34 = 1;
    if (v13 < v26) {
      goto LABEL_41;
    }
    double v35 = vabdd_f64(v8, v13);
    double v36 = fmax(fmin(v35 / v20, 1.0), 0.0);
    if (v8 < (1.0 - v36) * v32 + v36 * v33) {
      goto LABEL_41;
    }
    double v37 = fabs(v15);
    double v38 = fmax(fmin(v18 / v8, 179.0), 1.0);
    if (v37 > v38 && v35 > v20)
    {
      int64_t v34 = 2;
      if (v37 / v38 <= v35 / v20) {
        int64_t v34 = 1;
      }
LABEL_41:
      self->_int64_t movementClassification = v34;
      return;
    }
    int64_t v34 = 2;
    if (v37 > v38)
    {
      BOOL v40 = 0;
    }
    else
    {
      int64_t v34 = 1;
      BOOL v40 = v35 <= v20;
    }
    if (!v40) {
      goto LABEL_41;
    }
  }
}

- (double)_velocityForEventInfos:(id)a3
{
  unint64_t v4 = [a3 count];
  int v5 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RotaryVelocityFilterSamples, @"B519_RotaryVelocityFilterSamples");
  double v6 = 0.0;
  if (v4 >= 2)
  {
    double v7 = *(double *)&qword_1E8FD5228;
    if (v5) {
      double v7 = 5.0;
    }
    double v8 = fmax(v7, 1.0);
    if (v4 >= (unint64_t)v8) {
      unint64_t v9 = (unint64_t)v8;
    }
    else {
      unint64_t v9 = v4;
    }
    if (v4 <= (unint64_t)v8) {
      unint64_t v10 = 1;
    }
    else {
      unint64_t v10 = v4 - v9;
    }
    if (v10 <= v4 - 1)
    {
      double v11 = (double)v9;
      do
      {
        double v12 = objc_msgSend(a3, "objectAtIndex:", v10 - 1, 0, 0, 0, 0);
        [v12 getValue:&v16];

        double v13 = [a3 objectAtIndex:v10];
        [v13 getValue:v15];

        double v6 = v6 + v15[1] / fmax(v15[0] - v16, 0.0151515152) / v11;
        ++v10;
      }
      while (v4 != v10);
    }
  }
  return v6;
}

- (double)_applyDeadbandToValue:(double)result
{
  double rotaryDeadBand = self->_rotaryDeadBand;
  if (rotaryDeadBand > 0.0)
  {
    double v4 = fabs(result);
    double v5 = rotaryDeadBand - v4;
    double v6 = 0.0;
    if (v5 <= 0.0)
    {
      double v6 = result / v4 * fabs(v5);
      double v5 = 0.0;
    }
    self->_double rotaryDeadBand = v5;
    return v6;
  }
  return result;
}

- (double)_deltaForEventInfos:(id)a3
{
  unint64_t v4 = [a3 count];
  int v5 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RotaryVelocityFilterSamples, @"B519_RotaryVelocityFilterSamples");
  double v6 = 0.0;
  if (v4)
  {
    double v7 = *(double *)&qword_1E8FD5228;
    if (v5) {
      double v7 = 5.0;
    }
    unint64_t v8 = (unint64_t)fmax(v7, 1.0);
    if (v4 < v8) {
      unint64_t v8 = v4;
    }
    if (v4 - v8 <= v4 - 1)
    {
      double v9 = (double)v8;
      uint64_t v10 = -(uint64_t)v8;
      do
      {
        double v15 = 0.0;
        double v11 = objc_msgSend(a3, "objectAtIndex:", v4 + v10, 0);
        [v11 getValue:&v14];

        double v6 = v6 + v15 / v9;
      }
      while (!__CFADD__(v10++, 1));
    }
  }
  return v6;
}

- (double)_applyDistanceWeightToValue:(double)a3
{
  __asm { FMOV            V2.2D, #0.5 }
  float64x2_t v8 = vsubq_f64(_Q2, (float64x2_t)self->_digitizerLocation);
  double v9 = sqrt(vaddvq_f64(vmulq_f64(v8, v8))) * a3;
  int v10 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_DeweightedDistanceFromCenterFactor, @"B519_DeweightedDistanceFromCenterFactor");
  double v11 = 1.0 / *(double *)&qword_1E8FD5238;
  if (v10) {
    double v11 = 2.5;
  }
  return v11 * v9;
}

- (double)_applyScaleFactor:(double)a3 toValue:(double)a4 fromAngle:(double)a5 toAngle:(double)a6
{
  -[_UIRotaryGestureRecognizer _calculateAngleForTouchLocation:](self, "_calculateAngleForTouchLocation:", self->_digitizerLocation.x, self->_digitizerLocation.y);
  BOOL v11 = v10 >= a6 || v10 <= a5;
  double v12 = 1.0;
  if (!v11) {
    double v12 = a3;
  }
  return v12 * a4;
}

- (double)_deadzoneRangeForCurrentTouchLocation
{
  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257458, @"B519_RestingTouchMinimumDistanceFromCenterTopTouchFactor"))double v3 = 0.8333; {
  else
  }
    double v3 = *(double *)&qword_1EB257460;
  int v4 = _UIInternalPreferenceUsesDefault_1((int *)algn_1EB257468, @"B519_RotaryCenterDeadzone");
  double v5 = 0.2;
  if (!v4) {
    double v5 = *(double *)&qword_1EB257470;
  }
  [(_UIRotaryGestureRecognizer *)self _applyScaleFactor:v3 toValue:v5 fromAngle:45.0 toAngle:135.0];
  return result;
}

- (double)_restingTouchRangeForCurrentTouchLocation
{
  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257458, @"B519_RestingTouchMinimumDistanceFromCenterTopTouchFactor"))double v3 = 0.8333; {
  else
  }
    double v3 = *(double *)&qword_1EB257460;
  int v4 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_11_0, @"B519_RestingTouchMinimumDistanceFromCenter");
  double v5 = 0.3;
  if (!v4) {
    double v5 = *(double *)&qword_1EB257450;
  }
  [(_UIRotaryGestureRecognizer *)self _applyScaleFactor:v3 toValue:v5 fromAngle:45.0 toAngle:135.0];
  return result;
}

- (BOOL)_isPoint:(CGPoint)a3 inRangeOfCenter:(double)a4
{
  return sqrt((0.5 - a3.x) * (0.5 - a3.x) + (0.5 - a3.y) * (0.5 - a3.y)) < a4;
}

- (double)_calculateRadialDistance:(CGPoint)a3
{
  return fmax(sqrt((0.5 - a3.x) * (0.5 - a3.x) + (0.5 - a3.y) * (0.5 - a3.y)), 0.000001);
}

- (double)_calculateAngleForTouchLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[_UIRotaryGestureRecognizer _calculateRadialDistance:](self, "_calculateRadialDistance:");
  *(float *)&double v5 = (x + -0.5) / v5;
  double v6 = acosf(*(float *)&v5) * 57.2957795;
  if (y > 0.5) {
    double v6 = 360.0 - v6;
  }
  double v7 = 360.0 - v6 + 90.0;
  return fmod(v7, 360.0);
}

- (void)_resetDeadband
{
  int v3 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RotaryDeadbandSize, @"B519_RotaryDeadbandSize");
  double v4 = *(double *)&qword_1E8FD5218;
  if (v3) {
    double v4 = 0.0;
  }
  self->_double rotaryDeadBand = v4;
}

- (double)_directionalMovementClassificationDistanceThreshold
{
  if ([(_UIRotaryGestureRecognizer *)self beganMode] == 1)
  {
    int v2 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257498, @"B519_RestDirectionalMovementClassificationDistanceThreshold");
    double result = *(double *)&qword_1EB2574A0;
    BOOL v4 = v2 == 0;
    double v5 = 0.1;
  }
  else
  {
    int v6 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257478, @"B519_StrictDirectionalMovementClassificationDistanceThreshold");
    double result = *(double *)&qword_1EB257480;
    BOOL v4 = v6 == 0;
    double v5 = 0.15;
  }
  if (!v4) {
    return v5;
  }
  return result;
}

- (double)_movementClassificationAngleThresholdNumerator
{
  if ([(_UIRotaryGestureRecognizer *)self beganMode] == 1)
  {
    int v2 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2574A8, @"B519_RestMovementClassificationAngleThresholdNumerator");
    double result = *(double *)&qword_1EB2574B0;
    BOOL v4 = v2 == 0;
    double v5 = 6.0;
  }
  else
  {
    int v6 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257488, @"B519_StrictMovementClassificationAngleThresholdNumerator");
    double result = *(double *)&qword_1EB257490;
    BOOL v4 = v6 == 0;
    double v5 = 15.0;
  }
  if (!v4) {
    return v5;
  }
  return result;
}

- (double)position
{
  return self->_currentWheelPosition;
}

- (void)setDelegate:(id)a3
{
  id v5 = [(UIGestureRecognizer *)self delegate];
  if (v5 != a3 || !a3 && (*(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0x80000000) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIRotaryGestureRecognizer;
    [(UIGestureRecognizer *)&v12 setDelegate:a3];
    *(unsigned char *)&self->_rotaryGestureRecognizerFlags = *(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0x7F | ((a3 != 0) << 7);
    *(unsigned char *)&self->_rotaryGestureRecognizerFlags = *(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_rotaryGestureRecognizerFlags = *(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_rotaryGestureRecognizerFlags = *(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0xFB | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_rotaryGestureRecognizerFlags = *(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0xF7 | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 16;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_rotaryGestureRecognizerFlags = *(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0xEF | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 32;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_rotaryGestureRecognizerFlags = *(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0xDF | v10;
    if (objc_opt_respondsToSelector()) {
      char v11 = 64;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)&self->_rotaryGestureRecognizerFlags = *(unsigned char *)&self->_rotaryGestureRecognizerFlags & 0xBF | v11;
  }
}

- (double)accumulatedDistance
{
  return self->_accumulatedDistance;
}

- (void)setAccumulatedDistance:(double)a3
{
  self->_accumulatedDistance = a3;
}

- (double)delta
{
  return self->_delta;
}

- (void)setDelta:(double)a3
{
  self->_delta = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocitdouble y = a3;
}

- (BOOL)isActivelyTouching
{
  return self->_isActivelyTouching;
}

- (void)setIsActivelyTouching:(BOOL)a3
{
  self->_isActivelyTouching = a3;
}

- (int64_t)startRegion
{
  return self->_startRegion;
}

- (void)setStartRegion:(int64_t)a3
{
  self->_startRegion = a3;
}

- (int64_t)beganMode
{
  return self->_beganMode;
}

- (void)setBeganMode:(int64_t)a3
{
  self->_beganMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restingTouchRecoveryTimer, 0);
  objc_storeStrong((id *)&self->_restingTouchBeginTimer, 0);
  objc_storeStrong((id *)&self->_delegateMustBeginFromRestValue, 0);
  objc_storeStrong((id *)&self->_recentRotaryEvents, 0);
}

@end