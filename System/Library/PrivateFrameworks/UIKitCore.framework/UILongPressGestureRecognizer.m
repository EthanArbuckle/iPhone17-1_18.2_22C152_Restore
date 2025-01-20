@interface UILongPressGestureRecognizer
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsDynamicTouchesList;
- (BOOL)_impulseQuietEnough;
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_prefersNotToBePreventedByCompetingLongPressGestureRecognizers;
- (BOOL)_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers;
- (BOOL)_requiresQuietImpulse;
- (BOOL)_shouldAlwaysEnableMultitouchTimerAtTouchesBegin;
- (BOOL)_shouldFailInResponseToPresses:(id)a3 withEvent:(id)a4;
- (BOOL)_shouldReceivePress:(id)a3;
- (BOOL)_touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer:(id)a3;
- (BOOL)activeTouchesExceedAllowableSeparation;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)cancelPastAllowableMovement;
- (BOOL)tapIsPossibleForTapRecognizer:(id)a3;
- (CGFloat)allowableMovement;
- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)result;
- (CGPoint)_centroidInView:(id)a3;
- (CGPoint)_centroidScreen;
- (CGPoint)_convertVelocitySample:(id)a3 fromSceneReferenceCoordinatesToView:(id)a4;
- (CGPoint)_locationOfTouches:(id)a3;
- (CGPoint)_shiftPanLocationToNewSceneReferenceLocation:(CGPoint)a3;
- (CGPoint)_startPointInView:(id)a3;
- (CGPoint)_translationInView:(id)a3;
- (CGPoint)centroid;
- (CGPoint)lastSceneReferenceLocation;
- (CGPoint)lastUnadjustedSceneReferenceLocation;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4;
- (CGPoint)startPoint;
- (CGPoint)velocityInView:(id)a3;
- (NSArray)touches;
- (NSTimeInterval)minimumPressDuration;
- (NSUInteger)numberOfTapsRequired;
- (NSUInteger)numberOfTouchesRequired;
- (UILongPressGestureRecognizer)initWithCoder:(id)a3;
- (UILongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UIOffset)_offsetInViewFromSceneReferenceLocation:(CGPoint)a3 toSceneReferenceLocation:(CGPoint)a4;
- (double)_allowableElapsedTimeForAllRequiredTouches;
- (double)_allowableSeparation;
- (double)_allowableTouchTimeSeparation;
- (double)_touchSloppinessFactor;
- (double)delay;
- (double)lastTouchTime;
- (int64_t)_buttonType;
- (int64_t)_finalStateForRecognition;
- (int64_t)buttonMaskRequired;
- (unint64_t)numberOfTouches;
- (void)_appendSubclassDescription:(id)a3;
- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 physicalTouch:(id)a5;
- (void)_changeTouchesListTo:(id)a3;
- (void)_clearEnoughTimeElapsedTimer;
- (void)_incorporateTouchForceMessageIntoImpulseQuietness:(id)a3;
- (void)_interactionsEndedWithValidTouches:(BOOL)a3;
- (void)_resetGestureRecognizer;
- (void)_resetImpulseQuietness;
- (void)_resetVelocitySamples;
- (void)_setAllowableElapsedTimeForAllRequiredTouches:(double)a3;
- (void)_setAllowableSeparation:(double)a3;
- (void)_setAllowableTouchTimeSeparation:(double)a3;
- (void)_setAllowsDynamicTouchesList:(BOOL)a3;
- (void)_setButtonType:(int64_t)a3;
- (void)_setRequiresQuietImpulse:(BOOL)a3;
- (void)_setShouldAlwaysEnableMultitouchTimerAtTouchesBegin:(BOOL)a3;
- (void)_setTranslation:(CGPoint)a3 inView:(id)a4;
- (void)_startEnoughTimeElapsedTimer;
- (void)_startMultitouchTimer;
- (void)_startTapFinishedTimer;
- (void)clearAllTimers;
- (void)clearAllTimersAndStartEnoughTimeElapsedTimer;
- (void)encodeWithCoder:(id)a3;
- (void)enoughTimeElapsed:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAllowableMovement:(CGFloat)allowableMovement;
- (void)setButtonMaskRequired:(int64_t)a3;
- (void)setCancelPastAllowableMovement:(BOOL)a3;
- (void)setDelay:(double)a3;
- (void)setLastSceneReferenceLocation:(CGPoint)a3;
- (void)setLastTouchTime:(double)a3;
- (void)setLastUnadjustedSceneReferenceLocation:(CGPoint)a3;
- (void)setMinimumPressDuration:(NSTimeInterval)minimumPressDuration;
- (void)setNumberOfTapsRequired:(NSUInteger)numberOfTapsRequired;
- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired;
- (void)setTouches:(id)a3;
- (void)setView:(id)a3;
- (void)set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:(BOOL)a3;
- (void)set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:(BOOL)a3;
- (void)tapRecognizerFailedToRecognizeTap:(id)a3;
- (void)tapRecognizerRecognizedTap:(id)a3;
- (void)tooMuchElapsed:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UILongPressGestureRecognizer

- (void)setView:(id)a3
{
  if (!a3) {
    [(UILongPressGestureRecognizer *)self clearAllTimers];
  }
  v5.receiver = self;
  v5.super_class = (Class)UILongPressGestureRecognizer;
  [(UIGestureRecognizer *)&v5 setView:a3];
}

- (void)_startMultitouchTimer
{
  [(UILongPressGestureRecognizer *)self clearAllTimers];
  v3 = [UIDelayedAction alloc];
  v4 = [(UIDelayedAction *)v3 initWithTarget:self action:sel_tooMuchElapsed_ userInfo:0 delay:*MEMORY[0x1E4F1C4B0] mode:self->_allowableElapsedTimeForAllRequiredTouches];
  multitouchTimer = self->_multitouchTimer;
  self->_multitouchTimer = v4;
}

- (void)setAllowableMovement:(CGFloat)allowableMovement
{
  self->_allowableMovement = allowableMovement;
}

- (void)setMinimumPressDuration:(NSTimeInterval)minimumPressDuration
{
  self->_minimumPressDuration = minimumPressDuration;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 1;
}

- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired
{
  self->_numberOfTouchesRequired = numberOfTouchesRequired;
}

- (NSUInteger)numberOfTapsRequired
{
  return [(UITapRecognizer *)self->_imp numberOfTapsRequired];
}

- (BOOL)_prefersNotToBePreventedByCompetingLongPressGestureRecognizers
{
  return self->__prefersNotToBePreventedByCompetingLongPressGestureRecognizers;
}

- (UILongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UILongPressGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v10 initWithTarget:a3 action:a4];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_numberOfTouchesRequired = 1;
    v4->_minimumPressDuration = 0.5;
    v4->_allowableMovement = 10.0;
    *((unsigned char *)v4 + 432) |= 4u;
    v4->_allowableElapsedTimeForAllRequiredTouches = 0.0;
    v6 = objc_alloc_init(UITapRecognizer);
    imp = v5->_imp;
    v5->_imp = v6;

    [(UITapRecognizer *)v5->_imp setDelegate:v5];
    [(UITapRecognizer *)v5->_imp setNumberOfTapsRequired:0];
    v8 = v5;
  }

  return v5;
}

- (void)set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:(BOOL)a3
{
  self->__prefersNotToBePreventedByCompetingLongPressGestureRecognizers = a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(UILongPressGestureRecognizer *)self _buttonType] != -1)
  {
LABEL_2:
    [(UIGestureRecognizer *)self setState:5];
    return;
  }
  int64_t v7 = [(UILongPressGestureRecognizer *)self buttonMaskRequired];
  id v8 = a4;
  if ([v8 _buttonMask])
  {
    uint64_t v9 = [v8 _buttonMask] & v7;

    if (!v9) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  if ((*((unsigned char *)self + 432) & 4) == 0)
  {
    imp = self->_imp;
    [(UITapRecognizer *)imp touchesBegan:a3 withEvent:v8];
    return;
  }
  if (self->_tooMuchTimeElapsed) {
    [(UILongPressGestureRecognizer *)self clearAllTimers];
  }
  if (![(NSMutableSet *)self->_activeTouches count])
  {
    [(UILongPressGestureRecognizer *)self _locationOfTouches:a3];
    self->_lastSceneReferenceLocation.x = v11;
    self->_lastSceneReferenceLocation.y = v12;
    self->_lastUnadjustedSceneReferenceLocation = self->_lastSceneReferenceLocation;
    [v8 timestamp];
    self->_lastTouchTime = v13;
  }
  if ([a3 count])
  {
    if (!self->_activeTouches)
    {
      v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      activeTouches = self->_activeTouches;
      self->_activeTouches = v14;
    }
    if ((unint64_t)(self->super._state - 1) <= 2)
    {
      if ([(UILongPressGestureRecognizer *)self _allowsDynamicTouchesList])
      {
        [(NSMutableSet *)self->_activeTouches unionSet:a3];
        id v26 = [(NSMutableSet *)self->_activeTouches allObjects];
        -[UILongPressGestureRecognizer _changeTouchesListTo:](self, "_changeTouchesListTo:");
LABEL_23:

        return;
      }
      if ((unint64_t)(self->super._state - 1) <= 2)
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v16 = a3;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              [(UIGestureRecognizer *)self ignoreTouch:*(void *)(*((void *)&v27 + 1) + 8 * i) forEvent:v8];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v18);
        }

        return;
      }
    }
    [(NSMutableSet *)self->_activeTouches unionSet:a3];
    if (*((unsigned char *)self + 432)) {
      return;
    }
    [(UILongPressGestureRecognizer *)self _allowableSeparation];
    if (v21 == 1.79769313e308
      || ![(UILongPressGestureRecognizer *)self activeTouchesExceedAllowableSeparation])
    {
      if ([(UILongPressGestureRecognizer *)self numberOfTouchesRequired] >= 2
        && [(NSMutableSet *)self->_activeTouches count] < self->_numberOfTouchesRequired
        && self->_allowableElapsedTimeForAllRequiredTouches > 0.0)
      {
        [(UILongPressGestureRecognizer *)self _startMultitouchTimer];
        return;
      }
      uint64_t v22 = [(NSMutableSet *)self->_activeTouches count];
      v23 = self->_activeTouches;
      if (v22 == self->_numberOfTouchesRequired)
      {
        id v26 = [(NSMutableSet *)v23 allObjects];
        -[UILongPressGestureRecognizer setTouches:](self, "setTouches:");
        [(UILongPressGestureRecognizer *)self _centroidScreen];
        self->_startPointScreen.x = v24;
        self->_startPointScreen.y = v25;
        [(UILongPressGestureRecognizer *)self clearAllTimersAndStartEnoughTimeElapsedTimer];
        if (-[UIGestureRecognizer _inForceCapableEnvironment](self)) {
          self->_requiresQuietImpulseForCurrentTouchSequence = [(UILongPressGestureRecognizer *)self _touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer:v26];
        }
        goto LABEL_23;
      }
      if ([(NSMutableSet *)v23 count] <= self->_numberOfTouchesRequired) {
        return;
      }
      *((unsigned char *)self + 432) |= 2u;
    }
    [(UILongPressGestureRecognizer *)self clearAllTimers];
    goto LABEL_2;
  }
}

- (NSUInteger)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (int64_t)buttonMaskRequired
{
  return [(UITapRecognizer *)self->_imp buttonMaskRequired];
}

- (double)_allowableSeparation
{
  [(UITapRecognizer *)self->_imp allowableSeparation];
  return result;
}

- (CGPoint)_centroidScreen
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(UILongPressGestureRecognizer *)self touches];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v14 + 1) + 8 * v7) window];

        if (!v8)
        {
          CGFloat x = self->_lastCentroidScreen.x;
          CGFloat y = self->_lastCentroidScreen.y;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v3 = [(UILongPressGestureRecognizer *)self touches];
  CGFloat x = _CentroidOfTouches(v3, 0);
  CGFloat y = v10;
LABEL_11:

  double v12 = x;
  double v13 = y;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(UILongPressGestureRecognizer *)self _buttonType] == -1)
  {
    if (self) {
      self->_requiresQuietImpulseForCurrentTouchSequence = 0;
    }
    uint64_t v7 = [(UILongPressGestureRecognizer *)self touches];
    self->_lastCentroidScreen.CGFloat x = _CentroidOfTouches(v7, 0);
    self->_lastCentroidScreen.CGFloat y = v8;

    if ((*((unsigned char *)self + 432) & 4) != 0)
    {
      [(UILongPressGestureRecognizer *)self _locationOfTouches:a3];
      double v11 = v10;
      double v13 = v12;
      [a4 timestamp];
      double v15 = v14;
      long long v16 = [a3 anyObject];
      -[UILongPressGestureRecognizer _centroidMovedTo:atTime:physicalTouch:](self, "_centroidMovedTo:atTime:physicalTouch:", v16, v11, v13, v15);

      if (![a3 count]) {
        return;
      }
      [(NSMutableSet *)self->_activeTouches minusSet:a3];
      if ([(UILongPressGestureRecognizer *)self _allowsDynamicTouchesList]
        && [(NSMutableSet *)self->_activeTouches count])
      {
        if (![(UILongPressGestureRecognizer *)self _allowsDynamicTouchesList]) {
          return;
        }
        id v19 = [(NSMutableSet *)self->_activeTouches allObjects];
        [(UILongPressGestureRecognizer *)self _changeTouchesListTo:v19];
      }
      else
      {
        long long v17 = (void *)MEMORY[0x1E4F1CAD0];
        id v19 = [(UILongPressGestureRecognizer *)self touches];
        uint64_t v18 = [v17 setWithArray:v19];
        -[UILongPressGestureRecognizer _interactionsEndedWithValidTouches:](self, "_interactionsEndedWithValidTouches:", [v18 intersectsSet:a3]);
      }
    }
    else
    {
      imp = self->_imp;
      [(UITapRecognizer *)imp touchesEnded:a3 withEvent:a4];
    }
  }
}

- (NSArray)touches
{
  return self->_touches;
}

- (CGPoint)_locationOfTouches:(id)a3
{
  v3 = [a3 anyObject];
  uint64_t v4 = [v3 window];
  [v3 locationInView:0];
  objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (int64_t)_buttonType
{
  v2 = [(UIGestureRecognizer *)self allowedPressTypes];
  if ([v2 count])
  {
    v3 = [v2 firstObject];
    int64_t v4 = [v3 integerValue];
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 physicalTouch:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UILongPressGestureRecognizer *)self _adjustSceneReferenceLocation:a5];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double lastTouchTime = self->_lastTouchTime;
  double v14 = self->_previousVelocitySample;
  objc_storeStrong((id *)&self->_previousVelocitySample, self->_velocitySample);
  double v15 = v14;
  if (!v14) {
    double v15 = objc_opt_new();
  }
  objc_storeStrong((id *)&self->_velocitySample, v15);
  long long v16 = v15;
  if (!v14) {

  }
  *(CGPoint *)(v16 + 8) = self->_lastSceneReferenceLocation;
  *((CGFloat *)v16 + 3) = v10;
  *((CGFloat *)v16 + 4) = v12;
  *((double *)v16 + 5) = a4 - lastTouchTime;

  self->_lastUnadjustedSceneReferenceLocation.CGFloat x = x;
  self->_lastUnadjustedSceneReferenceLocation.CGFloat y = y;
  self->_lastSceneReferenceLocation.CGFloat x = v10;
  self->_lastSceneReferenceLocation.CGFloat y = v12;
  self->_double lastTouchTime = a4;
}

- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)result
{
  if (self->_lastSceneReferenceLocation.x != self->_lastUnadjustedSceneReferenceLocation.x
    || self->_lastSceneReferenceLocation.y != self->_lastUnadjustedSceneReferenceLocation.y)
  {
    -[UILongPressGestureRecognizer _shiftPanLocationToNewSceneReferenceLocation:](self, "_shiftPanLocationToNewSceneReferenceLocation:", result.x, result.y);
  }
  return result;
}

- (BOOL)_allowsDynamicTouchesList
{
  return (*((unsigned __int8 *)self + 432) >> 4) & 1;
}

- (void)clearAllTimersAndStartEnoughTimeElapsedTimer
{
  [(UILongPressGestureRecognizer *)self clearAllTimers];
  [(UILongPressGestureRecognizer *)self _startEnoughTimeElapsedTimer];
}

- (void)_interactionsEndedWithValidTouches:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)self + 432) |= 1u;
  [(UILongPressGestureRecognizer *)self clearAllTimers];
  if ((unint64_t)(self->super._state - 1) > 2 || !v3) {
    int64_t v6 = 5;
  }
  else {
    int64_t v6 = [(UILongPressGestureRecognizer *)self _finalStateForRecognition];
  }
  [(UIGestureRecognizer *)self setState:v6];
}

- (void)_resetGestureRecognizer
{
  [(UITapRecognizer *)self->_imp _reset];
  if ((unint64_t)(self->super._state - 1) <= 2) {
    [(UIGestureRecognizer *)self state];
  }
  [(UILongPressGestureRecognizer *)self clearAllTimers];
  *((unsigned char *)self + 432) &= ~1u;
  *((unsigned char *)self + 432) &= ~2u;
  *((unsigned char *)self + 432) = *((unsigned char *)self + 432) & 0xFB | (4
                                                          * ([(UITapRecognizer *)self->_imp numberOfTapsRequired] == 0));
  [(NSMutableSet *)self->_activeTouches removeAllObjects];
  [(UILongPressGestureRecognizer *)self setTouches:0];
  self->_lastCentroidScreen = (CGPoint)*MEMORY[0x1E4F1DAD8];
  [(UILongPressGestureRecognizer *)self _resetVelocitySamples];
  self->_requiresQuietImpulseForCurrentTouchSequence = 0;
  v3.receiver = self;
  v3.super_class = (Class)UILongPressGestureRecognizer;
  [(UIGestureRecognizer *)&v3 _resetGestureRecognizer];
}

- (void)clearAllTimers
{
  [(UILongPressGestureRecognizer *)self _clearEnoughTimeElapsedTimer];
  tooMuchTimeElapsed = self->_tooMuchTimeElapsed;
  if (tooMuchTimeElapsed)
  {
    [(UIDelayedAction *)tooMuchTimeElapsed cancel];
    int64_t v4 = self->_tooMuchTimeElapsed;
    self->_tooMuchTimeElapsed = 0;
  }
  multitouchTimer = self->_multitouchTimer;
  if (multitouchTimer)
  {
    [(UIDelayedAction *)multitouchTimer cancel];
    int64_t v6 = self->_multitouchTimer;
    self->_multitouchTimer = 0;
  }
}

- (void)_clearEnoughTimeElapsedTimer
{
  enoughTimeElapsed = self->_enoughTimeElapsed;
  if (enoughTimeElapsed)
  {
    [(UIHeldAction *)enoughTimeElapsed cancel];
    int64_t v4 = self->_enoughTimeElapsed;
    self->_enoughTimeElapsed = 0;

    touchForceObservation = self->_touchForceObservation;
    self->_touchForceObservation = 0;

    [(UILongPressGestureRecognizer *)self _resetImpulseQuietness];
  }
}

- (void)setTouches:(id)a3
{
}

- (void)_resetVelocitySamples
{
  velocitySample = self->_velocitySample;
  self->_velocitySample = 0;

  previousVelocitySample = self->_previousVelocitySample;
  self->_previousVelocitySample = 0;
}

- (void)_startEnoughTimeElapsedTimer
{
  [(UILongPressGestureRecognizer *)self minimumPressDuration];
  if (v3 <= 0.0)
  {
    [(UILongPressGestureRecognizer *)self enoughTimeElapsed:0];
  }
  else
  {
    int64_t v4 = [UIHeldAction alloc];
    [(UILongPressGestureRecognizer *)self delay];
    double v5 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v4, "initWithTarget:action:userInfo:delay:mode:", self, sel_enoughTimeElapsed_, 0, *MEMORY[0x1E4F1C4B0]);
    enoughTimeElapsed = self->_enoughTimeElapsed;
    self->_enoughTimeElapsed = v5;
  }
  if (-[UIGestureRecognizer _inForceCapableEnvironment](self))
  {
    objc_initWeak(&location, self);
    double v7 = [(UIGestureRecognizer *)self _touchForceObservable];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__UILongPressGestureRecognizer__startEnoughTimeElapsedTimer__block_invoke;
    v10[3] = &unk_1E52F0FB8;
    objc_copyWeak(&v11, &location);
    double v8 = [v7 addObserverBlock:v10];
    touchForceObservation = self->_touchForceObservation;
    self->_touchForceObservation = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (NSTimeInterval)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (double)delay
{
  return self->_minimumPressDuration;
}

- (void)_resetImpulseQuietness
{
  self->_impulseObservations = 0;
  self->_currentImpulse = 0.0;
  self->_lastForce = 0.0;
  self->_lastForceTimestamp = 0.0;
}

- (void)setButtonMaskRequired:(int64_t)a3
{
  if (a3 <= 0)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UILongPressGestureRecognizer.m" lineNumber:219 description:@"buttonMaskRequired must be greater than 0"];
  }
  imp = self->_imp;
  [(UITapRecognizer *)imp setButtonMaskRequired:a3];
}

- (void)setDelay:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchForceObservation, 0);
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);
  objc_storeStrong((id *)&self->_velocitySample, 0);
  objc_storeStrong((id *)&self->_imp, 0);
  objc_storeStrong((id *)&self->_multitouchTimer, 0);
  objc_storeStrong((id *)&self->_tooMuchTimeElapsed, 0);
  objc_storeStrong((id *)&self->_enoughTimeElapsed, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong((id *)&self->_touches, 0);
}

- (void)set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:(BOOL)a3
{
  self->__prefersToBeExclusiveWithCompetingLongPressGestureRecognizers = a3;
}

- (void)_setRequiresQuietImpulse:(BOOL)a3
{
  self->_requiresQuietImpulse = a3;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if ([(UILongPressGestureRecognizer *)self _buttonType] != -1) {
    return;
  }
  if ((*((unsigned char *)self + 432) & 4) == 0)
  {
    imp = self->_imp;
    [(UITapRecognizer *)imp touchesMoved:a3 withEvent:a4];
    return;
  }
  [(UILongPressGestureRecognizer *)self _locationOfTouches:a3];
  double v9 = v8;
  double v11 = v10;
  [a4 timestamp];
  double v13 = v12;
  double v14 = [a3 anyObject];
  -[UILongPressGestureRecognizer _centroidMovedTo:atTime:physicalTouch:](self, "_centroidMovedTo:atTime:physicalTouch:", v14, v9, v11, v13);

  if ((unint64_t)(self->super._state - 1) <= 2
    && [(NSMutableSet *)self->_activeTouches intersectsSet:a3])
  {
    if ((*((unsigned char *)self + 432) & 8) == 0) {
      return;
    }
    [(UILongPressGestureRecognizer *)self _centroidScreen];
    if (sqrt((self->_startPointScreen.x - v15) * (self->_startPointScreen.x - v15)+ (self->_startPointScreen.y - v16) * (self->_startPointScreen.y - v16)) <= self->_allowableMovement)return; {
    long long v17 = self;
    }
    uint64_t v18 = 4;
  }
  else
  {
    if ([(NSMutableSet *)self->_activeTouches count] != self->_numberOfTouchesRequired) {
      return;
    }
    double allowableMovement = self->_allowableMovement;
    if (allowableMovement < 0.0 || allowableMovement == 1.79769313e308) {
      return;
    }
    [(UILongPressGestureRecognizer *)self _centroidScreen];
    if (sqrt((self->_startPointScreen.x - v21) * (self->_startPointScreen.x - v21)+ (self->_startPointScreen.y - v22) * (self->_startPointScreen.y - v22)) <= self->_allowableMovement)return; {
    [(UILongPressGestureRecognizer *)self clearAllTimers];
    }
    long long v17 = self;
    uint64_t v18 = 5;
  }
  [(UIGestureRecognizer *)v17 setState:v18];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UILongPressGestureRecognizer)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UILongPressGestureRecognizer;
  int64_t v4 = -[UIGestureRecognizer initWithCoder:](&v12, sel_initWithCoder_);
  double v5 = v4;
  if (v4)
  {
    v4->_numberOfTouchesRequired = 1;
    v4->_minimumPressDuration = 0.5;
    v4->_double allowableMovement = 10.0;
    *((unsigned char *)v4 + 432) |= 4u;
    v4->_allowableElapsedTimeForAllRequiredTouches = 0.0;
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UILongPressGestureRecognizer._imp"];
    imp = v5->_imp;
    v5->_imp = (UITapRecognizer *)v6;

    [(UITapRecognizer *)v5->_imp setDelegate:v5];
    if ([a3 containsValueForKey:@"UILongPressGestureRecognizer.numberOfTouchesRequired"])v5->_numberOfTouchesRequired = objc_msgSend(a3, "decodeIntegerForKey:", @"UILongPressGestureRecognizer.numberOfTouchesRequired"); {
    if ([a3 containsValueForKey:@"UILongPressGestureRecognizer.minimumPressDuration"])
    }
    {
      [a3 decodeFloatForKey:@"UILongPressGestureRecognizer.minimumPressDuration"];
      v5->_minimumPressDuration = v8;
    }
    if ([a3 containsValueForKey:@"UILongPressGestureRecognizer.allowableMovement"])
    {
      [a3 decodeFloatForKey:@"UILongPressGestureRecognizer.allowableMovement"];
      v5->_double allowableMovement = v9;
    }
    double v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UILongPressGestureRecognizer;
  -[UIGestureRecognizer encodeWithCoder:](&v8, sel_encodeWithCoder_);
  [a3 encodeObject:self->_imp forKey:@"UILongPressGestureRecognizer._imp"];
  unint64_t numberOfTouchesRequired = self->_numberOfTouchesRequired;
  if (numberOfTouchesRequired != 1) {
    [a3 encodeInteger:numberOfTouchesRequired forKey:@"UILongPressGestureRecognizer.numberOfTouchesRequired"];
  }
  double minimumPressDuration = self->_minimumPressDuration;
  if (minimumPressDuration != 0.5)
  {
    *(float *)&double minimumPressDuration = minimumPressDuration;
    [a3 encodeFloat:@"UILongPressGestureRecognizer.minimumPressDuration" forKey:minimumPressDuration];
  }
  double allowableMovement = self->_allowableMovement;
  if (allowableMovement != 10.0)
  {
    *(float *)&double allowableMovement = allowableMovement;
    [a3 encodeFloat:@"UILongPressGestureRecognizer.allowableMovement" forKey:allowableMovement];
  }
}

- (void)setNumberOfTapsRequired:(NSUInteger)numberOfTapsRequired
{
  *((unsigned char *)self + 432) = *((unsigned char *)self + 432) & 0xFB | (4 * (numberOfTapsRequired == 0));
  -[UITapRecognizer setNumberOfTapsRequired:](self->_imp, "setNumberOfTapsRequired:");
}

- (BOOL)cancelPastAllowableMovement
{
  return (*((unsigned __int8 *)self + 432) >> 3) & 1;
}

- (void)setCancelPastAllowableMovement:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 432) = *((unsigned char *)self + 432) & 0xF7 | v3;
}

- (void)_setAllowsDynamicTouchesList:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 432) = *((unsigned char *)self + 432) & 0xEF | v3;
}

- (void)_setAllowableSeparation:(double)a3
{
}

- (void)_setAllowableTouchTimeSeparation:(double)a3
{
}

- (double)_allowableTouchTimeSeparation
{
  [(UITapRecognizer *)self->_imp allowableTouchTimeSeparation];
  return result;
}

- (void)_setAllowableElapsedTimeForAllRequiredTouches:(double)a3
{
  self->_allowableElapsedTimeForAllRequiredTouches = fmax(a3, 0.0);
}

- (BOOL)activeTouchesExceedAllowableSeparation
{
  double v3 = _BoundingRectForTouches(self->_activeTouches, 0);
  double v5 = v4;
  double v7 = v6;
  [(UILongPressGestureRecognizer *)self _allowableSeparation];
  double v9 = v8;
  [(UILongPressGestureRecognizer *)self _touchSloppinessFactor];
  return v9 * v10 < sqrt(v5 * v5 + v7 * v7);
}

- (void)enoughTimeElapsed:(id)a3
{
  if ((*((unsigned char *)self + 432) & 1) == 0
    && (*((unsigned char *)self + 432) & 2) == 0
    && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible
    && ([(NSMutableSet *)self->_activeTouches count] == self->_numberOfTouchesRequired
     || [(UILongPressGestureRecognizer *)self _buttonType] != -1))
  {
    [(UIGestureRecognizer *)self setState:1];
  }
}

- (void)tooMuchElapsed:(id)a3
{
}

- (BOOL)_touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(UILongPressGestureRecognizer *)self _isGestureType:15]) {
    return 0;
  }
  [(UILongPressGestureRecognizer *)self minimumPressDuration];
  if (v5 < 0.15) {
    return 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_super v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) _gestureRecognizers];
        [v7 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __117__UILongPressGestureRecognizer__touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer___block_invoke;
  v14[3] = &unk_1E52F0F90;
  v14[4] = &v15;
  [v7 enumerateObjectsUsingBlock:v14];
  BOOL v6 = *((unsigned char *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  return v6;
}

uint64_t __117__UILongPressGestureRecognizer__touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 _isGestureType:11];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __60__UILongPressGestureRecognizer__startEnoughTimeElapsedTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    [WeakRetained _incorporateTouchForceMessageIntoImpulseQuietness:a2];
    char v5 = [v8 _requiresQuietImpulse];
    double v4 = v8;
    if ((v5 & 1) != 0 || *((unsigned char *)v8 + 434))
    {
      int v6 = [v8 _impulseQuietEnough];
      int v7 = [v8[43] isHolding];
      if (v6)
      {
        double v4 = v8;
        if (!v7) {
          goto LABEL_10;
        }
        [v8[43] resume];
      }
      else
      {
        double v4 = v8;
        if (v7) {
          goto LABEL_10;
        }
        [v8[43] hold];
      }
      double v4 = v8;
    }
  }
LABEL_10:
}

- (void)_startTapFinishedTimer
{
  [(UILongPressGestureRecognizer *)self clearAllTimers];
  double v3 = [UIDelayedAction alloc];
  [(UITapRecognizer *)self->_imp maximumIntervalBetweenSuccessiveTaps];
  double v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v3, "initWithTarget:action:userInfo:delay:mode:", self, sel_tooMuchElapsed_, 0, *MEMORY[0x1E4F1C4B0]);
  tooMuchTimeElapsed = self->_tooMuchTimeElapsed;
  self->_tooMuchTimeElapsed = v4;
}

- (void)_changeTouchesListTo:(id)a3
{
  [(UILongPressGestureRecognizer *)self _centroidScreen];
  double v6 = v5;
  double v8 = v7;
  double v9 = _CentroidOfTouches(a3, 1);
  CGFloat v11 = v10 - v8 + self->_startPointScreen.y;
  self->_startPointScreen.CGFloat x = self->_startPointScreen.x + v9 - v6;
  self->_startPointScreen.CGFloat y = v11;
  [(UILongPressGestureRecognizer *)self setTouches:a3];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(UILongPressGestureRecognizer *)self _buttonType] == -1) {
    [(UIGestureRecognizer *)self setState:5];
  }
  if (self) {
    self->_requiresQuietImpulseForCurrentTouchSequence = 0;
  }
}

- (BOOL)_impulseQuietEnough
{
  return self->_impulseObservations >= 2 && self->_currentImpulse < 3.33333;
}

- (void)_incorporateTouchForceMessageIntoImpulseQuietness:(id)a3
{
  v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__UILongPressGestureRecognizer__incorporateTouchForceMessageIntoImpulseQuietness___block_invoke;
  v4[3] = &unk_1E52F0FE0;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__UILongPressGestureRecognizer__incorporateTouchForceMessageIntoImpulseQuietness___block_invoke_2;
  v3[3] = &unk_1E52D9F70;
  [a3 ifObservation:v4 ifReset:v3];
}

uint64_t __82__UILongPressGestureRecognizer__incorporateTouchForceMessageIntoImpulseQuietness___block_invoke(uint64_t a1, void *a2)
{
  if ((uint64_t)++*(void *)(*(void *)(a1 + 32) + 400) >= 2)
  {
    [a2 touchForce];
    double v5 = v4 - *(double *)(*(void *)(a1 + 32) + 416);
    [a2 timestamp];
    *(double *)(*(void *)(a1 + 32) + 408) = fabs(v5 / (v6 - *(double *)(*(void *)(a1 + 32) + 424)));
  }
  [a2 touchForce];
  *(void *)(*(void *)(a1 + 32) + 416) = v7;
  uint64_t result = [a2 timestamp];
  *(void *)(*(void *)(a1 + 32) + 424) = v9;
  return result;
}

uint64_t __82__UILongPressGestureRecognizer__incorporateTouchForceMessageIntoImpulseQuietness___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetImpulseQuietness];
}

- (int64_t)_finalStateForRecognition
{
  return 3;
}

- (void)_appendSubclassDescription:(id)a3
{
  if ([(UITapRecognizer *)self->_imp numberOfTapsRequired] != 1) {
    objc_msgSend(a3, "appendFormat:", @"; numberOfTapsRequired = %ld",
  }
      [(UITapRecognizer *)self->_imp numberOfTapsRequired]);
  if ([(UITapRecognizer *)self->_imp numberOfTouchesRequired] != 1) {
    objc_msgSend(a3, "appendFormat:", @"; unint64_t numberOfTouchesRequired = %ld",
  }
      [(UITapRecognizer *)self->_imp numberOfTouchesRequired]);
  [(UILongPressGestureRecognizer *)self minimumPressDuration];
  if (v5 > 0.0)
  {
    [(UILongPressGestureRecognizer *)self minimumPressDuration];
    objc_msgSend(a3, "appendFormat:", @"; double minimumPressDuration = %2g", v6);
  }
  if ([(UITapRecognizer *)self->_imp buttonMaskRequired] != 1) {
    objc_msgSend(a3, "appendFormat:", @"; buttonMaskRequired = %ld",
  }
      [(UITapRecognizer *)self->_imp buttonMaskRequired]);
}

- (CGPoint)_centroidInView:(id)a3
{
  if (a3)
  {
    double v5 = [a3 _window];
    [(UILongPressGestureRecognizer *)self _centroidScreen];
    objc_msgSend(v5, "_convertPointFromSceneReferenceSpace:");
    double v7 = v6;
    double v9 = v8;

    objc_msgSend(a3, "convertPoint:fromView:", 0, v7, v9);
  }
  else
  {
    [(UILongPressGestureRecognizer *)self _centroidScreen];
  }
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGPoint)centroid
{
  double v3 = [(UIGestureRecognizer *)self view];
  [(UILongPressGestureRecognizer *)self _centroidInView:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)_startPointInView:(id)a3
{
  double v5 = [a3 window];
  objc_msgSend(v5, "_convertPointFromSceneReferenceSpace:", self->_startPointScreen.x, self->_startPointScreen.y);
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(a3, "convertPoint:fromView:", 0, v7, v9);
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGPoint)startPoint
{
  double v3 = [(UIGestureRecognizer *)self view];
  [(UILongPressGestureRecognizer *)self _startPointInView:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)_translationInView:(id)a3
{
  -[UILongPressGestureRecognizer _centroidInView:](self, "_centroidInView:");
  double v6 = v5;
  double v8 = v7;
  [(UILongPressGestureRecognizer *)self _startPointInView:a3];
  double v10 = v6 - v9;
  double v12 = v8 - v11;
  result.CGFloat y = v12;
  result.CGFloat x = v10;
  return result;
}

- (void)_setTranslation:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  -[UILongPressGestureRecognizer _centroidInView:](self, "_centroidInView:");
  double v9 = x + v8;
  double v11 = y + v10;
  double v12 = [a4 window];
  objc_msgSend(a4, "convertPoint:toView:", v12, v9, v11);
  double v14 = v13;
  double v16 = v15;

  uint64_t v17 = [a4 window];
  objc_msgSend(v17, "_convertPointToSceneReferenceSpace:", v14, v16);
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  self->_startPointScreen.double x = v19;
  self->_startPointScreen.double y = v21;
}

- (void)_setButtonType:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(UILongPressGestureRecognizer *)self _buttonType] != a3)
  {
    double v6 = [(UIGestureRecognizer *)self view];

    if (v6)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"UILongPressGestureRecognizer.m" lineNumber:768 description:@"_buttonType can't be changed after a gesture recognizer is added to a view"];
    }
    double v7 = [NSNumber numberWithInteger:a3];
    v10[0] = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(UIGestureRecognizer *)self setAllowedPressTypes:v8];
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if (-[UILongPressGestureRecognizer _shouldFailInResponseToPresses:withEvent:](self, "_shouldFailInResponseToPresses:withEvent:"))
  {
    [(UIGestureRecognizer *)self setState:5];
  }
  else if ((*((unsigned char *)self + 432) & 4) != 0)
  {
    if (self->_tooMuchTimeElapsed) {
      [(UILongPressGestureRecognizer *)self clearAllTimers];
    }
    if ((*((unsigned char *)self + 432) & 1) == 0)
    {
      [(UILongPressGestureRecognizer *)self clearAllTimersAndStartEnoughTimeElapsedTimer];
    }
  }
  else
  {
    imp = self->_imp;
    [(UITapRecognizer *)imp pressesBegan:a3 withEvent:a4];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  if ((*((unsigned char *)self + 432) & 4) != 0) {
    -[UILongPressGestureRecognizer _interactionsEndedWithValidTouches:](self, "_interactionsEndedWithValidTouches:", 1, a4);
  }
  else {
    [(UITapRecognizer *)self->_imp pressesEnded:a3 withEvent:a4];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
}

- (BOOL)_shouldReceivePress:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UILongPressGestureRecognizer;
  if (-[UIGestureRecognizer _shouldReceivePress:](&v10, sel__shouldReceivePress_))
  {
    BOOL v5 = 1;
  }
  else
  {
    int64_t v6 = [(UILongPressGestureRecognizer *)self _buttonType];
    BOOL v5 = v6 == [a3 type];
  }
  double v7 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  BOOL v8 = [(UILongPressGestureRecognizer *)self _shouldFailInResponseToPresses:v7 withEvent:0];

  return v5 || v8;
}

- (BOOL)_shouldFailInResponseToPresses:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)tapIsPossibleForTapRecognizer:(id)a3
{
  return [(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible;
}

- (void)tapRecognizerRecognizedTap:(id)a3
{
  *((unsigned char *)self + 432) |= 4u;
  [(UILongPressGestureRecognizer *)self _startTapFinishedTimer];
  imp = self->_imp;
  [(UITapRecognizer *)imp _reset];
}

- (void)tapRecognizerFailedToRecognizeTap:(id)a3
{
}

- (double)_touchSloppinessFactor
{
  v2 = [(UIGestureRecognizer *)self view];
  [v2 _touchSloppinessFactor];
  double v4 = v3;

  return v4;
}

- (CGPoint)locationInView:(id)a3
{
  if ([(NSArray *)self->_touches count])
  {
    [(UILongPressGestureRecognizer *)self _centroidInView:a3];
  }
  else
  {
    [(UITapRecognizer *)self->_imp locationInViewNotTrackingTouches:a3];
    double v7 = v5;
    double v8 = v6;
    if (a3)
    {
      double v9 = [a3 _window];
      objc_msgSend(v9, "_convertPointFromSceneReferenceSpace:", v7, v8);
      objc_msgSend(a3, "convertPoint:fromView:", 0);
      double v11 = v10;
      double v13 = v12;

      double v5 = v11;
      double v6 = v13;
    }
  }
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (unint64_t)numberOfTouches
{
  return [(NSArray *)self->_touches count];
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  if ([(NSArray *)self->_touches count] <= a3)
  {
    double v13 = NSString;
    double v14 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v14);
    double v16 = NSStringFromSelector(a2);
    double v8 = [v13 stringWithFormat:@"-[%@ %@]", v15, v16];

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%ld) beyond bounds (%ld).", v8, a3, -[NSArray count](self->_touches, "count") format];
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    double v8 = [(NSArray *)self->_touches objectAtIndex:a3];
    [v8 locationInView:a4];
    double v10 = v9;
    double v12 = v11;
  }

  double v17 = v10;
  double v18 = v12;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)_convertVelocitySample:(id)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  if (a3 && *((double *)a3 + 5) >= 0.001)
  {
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, *((double *)a3 + 1), *((double *)a3 + 2));
    double v10 = v9;
    double v12 = v11;
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, *((double *)a3 + 3), *((double *)a3 + 4));
    double v14 = *((double *)a3 + 5);
    double v5 = (v13 - v10) / v14;
    double v6 = (v15 - v12) / v14;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  [(UILongPressGestureRecognizer *)self _convertVelocitySample:self->_velocitySample fromSceneReferenceCoordinatesToView:a3];
  double v5 = v4;
  double v7 = v6;
  previousVelocitySample = self->_previousVelocitySample;
  if (previousVelocitySample && previousVelocitySample->dt > 0.00000011920929)
  {
    -[UILongPressGestureRecognizer _convertVelocitySample:fromSceneReferenceCoordinatesToView:](self, "_convertVelocitySample:fromSceneReferenceCoordinatesToView:");
    double v5 = v5 * 0.25 + v9 * 0.75;
    double v7 = v7 * 0.25 + v10 * 0.75;
  }
  double v11 = v5;
  double v12 = v7;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (UIOffset)_offsetInViewFromSceneReferenceLocation:(CGPoint)a3 toSceneReferenceLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  double v9 = [(UIGestureRecognizer *)self view];
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v9, v7, v6);
  double v11 = v10;
  double v13 = v12;

  double v14 = [(UIGestureRecognizer *)self view];
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v14, x, y);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16 - v11;
  double v20 = v18 - v13;
  result.vertical = v20;
  result.horizontal = v19;
  return result;
}

- (CGPoint)_shiftPanLocationToNewSceneReferenceLocation:(CGPoint)a3
{
  -[UILongPressGestureRecognizer _offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:](self, "_offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:", self->_lastUnadjustedSceneReferenceLocation.x, self->_lastUnadjustedSceneReferenceLocation.y, a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(UIGestureRecognizer *)self view];
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v8, self->_lastSceneReferenceLocation.x, self->_lastSceneReferenceLocation.y);
  double v10 = v9;
  double v12 = v11;

  double v13 = [(UIGestureRecognizer *)self view];
  -[UIGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v13, v5 + v10, v7 + v12);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  if ([a3 _isGestureType:1])
  {
    id v5 = a3;
    uint64_t v6 = [v5 numberOfTouchesRequired];
    if (v6 == [(UILongPressGestureRecognizer *)self numberOfTouchesRequired]
      && (uint64_t v7 = [v5 buttonMaskRequired],
          v7 == [(UILongPressGestureRecognizer *)self buttonMaskRequired]))
    {
      unint64_t v8 = [v5 numberOfTapsRequired];
      BOOL v9 = v8 > [(UILongPressGestureRecognizer *)self numberOfTapsRequired];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  return !v9;
}

- (CGFloat)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)_requiresQuietImpulse
{
  return self->_requiresQuietImpulse;
}

- (double)_allowableElapsedTimeForAllRequiredTouches
{
  return self->_allowableElapsedTimeForAllRequiredTouches;
}

- (CGPoint)lastSceneReferenceLocation
{
  double x = self->_lastSceneReferenceLocation.x;
  double y = self->_lastSceneReferenceLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastSceneReferenceLocation:(CGPoint)a3
{
  self->_lastSceneReferenceLocation = a3;
}

- (CGPoint)lastUnadjustedSceneReferenceLocation
{
  double x = self->_lastUnadjustedSceneReferenceLocation.x;
  double y = self->_lastUnadjustedSceneReferenceLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastUnadjustedSceneReferenceLocation:(CGPoint)a3
{
  self->_lastUnadjustedSceneReferenceLocation = a3;
}

- (double)lastTouchTime
{
  return self->_lastTouchTime;
}

- (void)setLastTouchTime:(double)a3
{
  self->_double lastTouchTime = a3;
}

- (BOOL)_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers
{
  return self->__prefersToBeExclusiveWithCompetingLongPressGestureRecognizers;
}

- (BOOL)_shouldAlwaysEnableMultitouchTimerAtTouchesBegin
{
  return self->__shouldAlwaysEnableMultitouchTimerAtTouchesBegin;
}

- (void)_setShouldAlwaysEnableMultitouchTimerAtTouchesBegin:(BOOL)a3
{
  self->__shouldAlwaysEnableMultitouchTimerAtTouchesBegin = a3;
}

@end