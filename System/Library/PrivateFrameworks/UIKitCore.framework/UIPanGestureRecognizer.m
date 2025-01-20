@interface UIPanGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
+ (BOOL)supportsSecureCoding;
+ (double)_defaultHysteresis;
+ (void)_setPanGestureRecognizersEnabled:(BOOL)a3;
- (BOOL)_canPanHorizontally;
- (BOOL)_canPanVertically;
- (BOOL)_failsPastHysteresisWithoutMinTouches;
- (BOOL)_iOSMacIgnoreScrollDirectionUserPreference;
- (BOOL)_iOSMacScrollingEnabled;
- (BOOL)_iOSMacUseNonacceleratedDelta;
- (BOOL)_ignoresStationaryTouches;
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_requiresImmediateMultipleTouches;
- (BOOL)_shouldBeginHorizontally:(BOOL)a3 vertically:(BOOL)a4 withEvent:(id)a5;
- (BOOL)_shouldTryToBeginWithEvent:(id)a3;
- (BOOL)_touchesExceedAllowableSeparation;
- (BOOL)_updateMovingTouchesArraySavingOldArray:(id *)a3;
- (BOOL)_willScrollX;
- (BOOL)_willScrollY;
- (BOOL)failsPastMaxTouches;
- (BOOL)isIOSMacScrollingEnabled;
- (BOOL)shouldReceiveEvent:(id)a3;
- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)result;
- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4;
- (CGPoint)_convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4;
- (CGPoint)_convertVelocitySample:(id)a3 fromSceneReferenceCoordinatesToView:(id)a4;
- (CGPoint)_initialLocationInView:(id)a3;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4;
- (CGPoint)translationInView:(UIView *)view;
- (CGPoint)velocityInView:(UIView *)view;
- (NSArray)_allowedScrollTypes;
- (NSUInteger)maximumNumberOfTouches;
- (NSUInteger)minimumNumberOfTouches;
- (UIPanGestureRecognizer)initWithCoder:(id)a3;
- (UIPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UIScrollTypeMask)allowedScrollTypesMask;
- (double)_allowableSeparation;
- (double)_allowableTouchTimeSeparation;
- (double)_hysteresis;
- (double)_offsetInViewFromSceneReferenceLocation:(double)a3 toSceneReferenceLocation:(double)a4;
- (double)_shiftPanLocationToNewSceneReferenceLocation:(double)a3 lockingToAxis:(double)a4;
- (double)_translationDistanceInSceneInSelfAxis:(double)a3;
- (id)_activeTouches;
- (id)_movingTouches;
- (uint64_t)_scrollDeviceCategory;
- (unint64_t)numberOfTouches;
- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 affectingTranslation:(BOOL)a5;
- (void)_handleEndedTouches:(id)a3 withFinalStateAdjustments:(id)a4;
- (void)_ignoreTouchForTouchIdentifier:(unsigned int)a3;
- (void)_ignoreTouches:(uint64_t)a3 forEvent:;
- (void)_processScrollPhaseChanged:(id)a3;
- (void)_removeHysteresisFromTranslation;
- (void)_resetGestureRecognizer;
- (void)_resetVelocitySamples;
- (void)_scrollingChangedWithEvent:(id)a3;
- (void)_setAllowableSeparation:(double)a3;
- (void)_setAllowableTouchTimeSeparation:(double)a3;
- (void)_setAllowedScrollTypes:(id)a3;
- (void)_setCanPanHorizontally:(BOOL)a3;
- (void)_setCanPanVertically:(BOOL)a3;
- (void)_setFailsPastHysteresisWithoutMinTouches:(BOOL)a3;
- (void)_setHysteresis:(double)a3;
- (void)_setIgnoresStationaryTouches:(BOOL)a3;
- (void)_setRequiresImmediateMultipleTouches:(BOOL)a3;
- (void)_setiOSMacIgnoreScrollDirectionUserPreference:(BOOL)a3;
- (void)_setiOSMacScrollingEnabled:(BOOL)a3;
- (void)_setiOSMacUseNonacceleratedDelta:(BOOL)a3;
- (void)_touchesListChangedFrom:(id)a3 to:(id)a4;
- (void)_willBeginAfterSatisfyingFailureRequirements;
- (void)clearMultitouchTimer;
- (void)encodeWithCoder:(id)a3;
- (void)multitouchExpired:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)setAllowedScrollTypesMask:(UIScrollTypeMask)allowedScrollTypesMask;
- (void)setDelegate:(id)a3;
- (void)setFailsPastMaxTouches:(BOOL)a3;
- (void)setMaximumNumberOfTouches:(NSUInteger)maximumNumberOfTouches;
- (void)setMinimumNumberOfTouches:(NSUInteger)minimumNumberOfTouches;
- (void)setTranslation:(CGPoint)translation inView:(UIView *)view;
- (void)startMultitouchTimer:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIPanGestureRecognizer

- (BOOL)shouldReceiveEvent:(id)a3
{
  if ([a3 type] == 10)
  {
    id v5 = a3;
    if (!self->_allowedScrollTypesMask) {
      goto LABEL_7;
    }
    if (![(UIPanGestureRecognizer *)self _iOSMacUseNonacceleratedDelta])
    {
      int64_t allowedScrollTypesMask = self->_allowedScrollTypesMask;
      BOOL v6 = (allowedScrollTypesMask & (1 << [v5 _scrollType])) != 0;
      goto LABEL_9;
    }
    if ([v5 _scrollType] == 1)
    {
      [v5 nonAcceleratedDelta];
      BOOL v6 = 1;
    }
    else
    {
LABEL_7:
      BOOL v6 = 0;
    }
LABEL_9:

    return v6;
  }
  v9.receiver = self;
  v9.super_class = (Class)UIPanGestureRecognizer;
  return [(UIGestureRecognizer *)&v9 shouldReceiveEvent:a3];
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (UIPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIPanGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  id v5 = v4;
  if (v4) {
    _UIPanGestureRecognizerCommonInit((uint64_t)v4);
  }
  return v5;
}

+ (double)_defaultHysteresis
{
  return 10.0;
}

- (void)_setIgnoresStationaryTouches:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 385) = *((unsigned char *)self + 385) & 0xFB | v3;
}

- (void)setDelegate:(id)a3
{
  *((unsigned char *)self + 384) = *((unsigned char *)self + 384) & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)self + 384) = *((unsigned char *)self + 384) & 0xFD | v5;
  v6.receiver = self;
  v6.super_class = (Class)UIPanGestureRecognizer;
  [(UIGestureRecognizer *)&v6 setDelegate:a3];
}

- (double)_translationDistanceInSceneInSelfAxis:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  objc_super v6 = [a1 view];
  [a1 translationInView:v6];
  double v8 = a2 * v7;
  double v10 = a3 * v9;
  objc_msgSend(a1, "_convertPoint:toSceneReferenceCoordinatesFromView:", v6, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v12 = v11;
  double v14 = v13;
  objc_msgSend(a1, "_convertPoint:toSceneReferenceCoordinatesFromView:", v6, v8, v10);
  double v17 = hypot(v15 - v12, v16 - v14);

  return v17;
}

- (CGPoint)translationInView:(UIView *)view
{
  [(UIPanGestureRecognizer *)self _convertPoint:self->_firstSceneReferenceLocation.x fromSceneReferenceCoordinatesToView:self->_firstSceneReferenceLocation.y];
  double v6 = v5;
  double v8 = v7;
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", view, self->_lastSceneReferenceLocation.x, self->_lastSceneReferenceLocation.y);
  double v10 = v9 - v6;
  double v12 = v11 - v8;
  result.y = v12;
  result.x = v10;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    id v6 = a4;
  }
  else
  {
    double v7 = [(UIGestureRecognizer *)self view];
    id v6 = [v7 _window];
  }
  double v8 = [v6 _window];
  double v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_convertDoublePointFromSceneReferenceSpace:", x, y);
    double x = v10;
    double y = v11;
  }
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    id v6 = a4;
  }
  else
  {
    double v7 = [(UIGestureRecognizer *)self view];
    id v6 = [v7 window];
  }
  double v8 = [v6 _window];
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  double v11 = v9;
  double v12 = v10;
  if (v8)
  {
    objc_msgSend(v8, "_convertDoublePointToSceneReferenceSpace:", v9, v10);
    double v11 = v13;
    double v12 = v14;
  }

  double v15 = v11;
  double v16 = v12;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    p_digitizerLocation = &self->_digitizerLocation;
    [a4 _digitizerLocation];
    p_digitizerLocation->double x = v8;
    self->_digitizerLocation.double y = v9;
  }
  uint64_t v10 = [(NSMutableArray *)self->_movingTouches copy];
  double v11 = (void *)v10;
  if (UIPanGestureRecognizersEnabled)
  {
    v23 = (void *)v10;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = a3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if ([(NSMutableArray *)self->_touches count] >= self->_maximumNumberOfTouches)
          {
            if ((*((unsigned char *)self + 384) & 4) != 0
              && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
            {

              BOOL v18 = 1;
              goto LABEL_20;
            }
          }
          else
          {
            [(NSMutableArray *)self->_touches addObject:v17];
            [(NSMutableArray *)self->_movingTouches addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    BOOL v18 = self->_allowableSeparation != 1.79769313e308
       && [(UIPanGestureRecognizer *)self _touchesExceedAllowableSeparation];
LABEL_20:
    double v11 = v23;
  }
  else
  {
    BOOL v18 = 1;
  }
  if ([(UIPanGestureRecognizer *)self minimumNumberOfTouches] >= 2)
  {
    if ([(UIPanGestureRecognizer *)self _requiresImmediateMultipleTouches])
    {
      [(UIPanGestureRecognizer *)self _allowableTouchTimeSeparation];
      if (v19 > 0.0)
      {
        [(UIPanGestureRecognizer *)self _allowableTouchTimeSeparation];
        -[UIPanGestureRecognizer startMultitouchTimer:](self, "startMultitouchTimer:");
      }
    }
  }
  if (v18)
  {
    [(UIPanGestureRecognizer *)self clearMultitouchTimer];
    [(UIGestureRecognizer *)self setState:5];
  }
  else if (self->_lastTouchCount)
  {
    [(UIPanGestureRecognizer *)self _touchesListChangedFrom:v11 to:self->_movingTouches];
  }
  else
  {
    [(UIGestureRecognizer *)self _centroidOfTouches:self->_movingTouches excludingEnded:1];
    self->_firstSceneReferenceLocation.double x = v20;
    self->_firstSceneReferenceLocation.double y = v21;
    self->_lastSceneReferenceLocation = self->_firstSceneReferenceLocation;
    self->_lastUnadjustedSceneReferenceLocation = self->_firstSceneReferenceLocation;
    self->_lastTouchCount = [(NSMutableArray *)self->_movingTouches count];
    [a4 timestamp];
    self->_lastTouchTime = v22;
  }
}

- (NSUInteger)minimumNumberOfTouches
{
  return self->_minimumNumberOfTouches;
}

- (double)_allowableTouchTimeSeparation
{
  return self->_allowableTouchTimeSeparation;
}

- (void)startMultitouchTimer:(double)a3
{
  [(UIPanGestureRecognizer *)self clearMultitouchTimer];
  *((unsigned char *)self + 385) |= 8u;
  [(UIPanGestureRecognizer *)self performSelector:sel_multitouchExpired_ withObject:0 afterDelay:a3];
}

- (BOOL)_touchesExceedAllowableSeparation
{
  double v3 = _BoundingRectForTouches(self->_touches, 0);
  double v5 = v4;
  double v7 = v6;
  [(UIPanGestureRecognizer *)self _allowableSeparation];
  return v8 < sqrt(v5 * v5 + v7 * v7);
}

- (BOOL)_requiresImmediateMultipleTouches
{
  return (*((unsigned __int8 *)self + 385) >> 4) & 1;
}

- (double)_allowableSeparation
{
  double allowableSeparation = self->_allowableSeparation;
  double v3 = [(UIGestureRecognizer *)self view];
  [v3 _touchSloppinessFactor];
  double v5 = allowableSeparation * v4;

  return v5;
}

- (void)setAllowedScrollTypesMask:(UIScrollTypeMask)allowedScrollTypesMask
{
  self->_int64_t allowedScrollTypesMask = allowedScrollTypesMask;
}

- (void)setFailsPastMaxTouches:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 384) = *((unsigned char *)self + 384) & 0xFB | v3;
}

- (void)setMaximumNumberOfTouches:(NSUInteger)maximumNumberOfTouches
{
  self->_maximumNumberOfTouches = maximumNumberOfTouches;
}

- (void)_setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (void)setMinimumNumberOfTouches:(NSUInteger)minimumNumberOfTouches
{
  self->_minimumNumberOfTouches = minimumNumberOfTouches;
}

- (void)_setFailsPastHysteresisWithoutMinTouches:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 384) = *((unsigned char *)self + 384) & 0xF7 | v3;
}

- (void)_setAllowableTouchTimeSeparation:(double)a3
{
  self->_allowableTouchTimeSeparation = a3;
}

- (void)_setRequiresImmediateMultipleTouches:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 385) = *((unsigned char *)self + 385) & 0xEF | v3;
}

- (void)_setAllowableSeparation:(double)a3
{
  self->_double allowableSeparation = a3;
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  if (![a3 type]
    && [(NSMutableArray *)self->_movingTouches count] < self->_minimumNumberOfTouches
    || ![(UIPanGestureRecognizer *)self _shouldBeginHorizontally:[(UIPanGestureRecognizer *)self _willScrollX] vertically:[(UIPanGestureRecognizer *)self _willScrollY] withEvent:a3])
  {
    return 0;
  }
  BOOL v5 = 1;
  [(UIPanGestureRecognizer *)self _shouldBeginHorizontally:1 vertically:1 withEvent:a3];
  return v5;
}

- (BOOL)_willScrollY
{
  double v3 = [(UIPanGestureRecognizer *)self _translationDistanceInSceneInSelfAxis:1.0];
  [(UIPanGestureRecognizer *)self _hysteresis];
  if (v3 >= v4) {
    LOBYTE(v5) = 1;
  }
  else {
    return (*((unsigned __int8 *)self + 385) >> 6) & 1;
  }
  return v5;
}

- (BOOL)_willScrollX
{
  double v3 = [(UIPanGestureRecognizer *)self _translationDistanceInSceneInSelfAxis:0.0];
  [(UIPanGestureRecognizer *)self _hysteresis];
  if (v3 >= v4) {
    LOBYTE(v5) = 1;
  }
  else {
    return (*((unsigned __int8 *)self + 385) >> 5) & 1;
  }
  return v5;
}

- (BOOL)_shouldBeginHorizontally:(BOOL)a3 vertically:(BOOL)a4 withEvent:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  double v8 = self;
  CGFloat v9 = [(UIGestureRecognizer *)self delegate];
  uint64_t v10 = v9;
  if ((*((unsigned char *)v8 + 384) & 1) != 0 && v7 && (*((unsigned char *)v8 + 385) & 1) == 0)
  {
    if ([v9 _panGestureRecognizer:v8 shouldTryToBeginHorizontallyWithEvent:a5]) {
      char v11 = 64;
    }
    else {
      char v11 = 0;
    }
    *((unsigned char *)v8 + 384) = *((unsigned char *)v8 + 384) & 0xBF | v11;
    *((unsigned char *)v8 + 385) |= 1u;
  }
  if ((*((unsigned char *)v8 + 384) & 2) != 0 && v6 && (*((unsigned char *)v8 + 385) & 2) == 0)
  {
    if ([v10 _panGestureRecognizer:v8 shouldTryToBeginVerticallyWithEvent:a5]) {
      char v12 = 0x80;
    }
    else {
      char v12 = 0;
    }
    *((unsigned char *)v8 + 384) = v12 & 0x80 | *((unsigned char *)v8 + 384) & 0x7F;
    *((unsigned char *)v8 + 385) |= 2u;
  }
  if (!v7)
  {
    if (!v6)
    {
      LOBYTE(v8) = 0;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  unsigned int v13 = *((unsigned __int8 *)v8 + 384);
  if (((!v6 | ((v13 & 0x40) >> 6)) & 1) == 0)
  {
LABEL_19:
    LOBYTE(v8) = *((char *)v8 + 384) < 0;
    goto LABEL_21;
  }
  LODWORD(v8) = (v13 >> 6) & 1;
LABEL_21:

  return (char)v8;
}

- (double)_hysteresis
{
  double hysteresis = self->_hysteresis;
  double v4 = [(UIGestureRecognizer *)self view];
  [v4 _touchSloppinessFactor];
  double v6 = hysteresis * v5;

  BOOL v7 = [(UIGestureRecognizer *)self _activeEventOfType:10];
  double v8 = v7;
  if (v7 && ![v7 _scrollType])
  {
    int v9 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_DiscreteScrollHysteresisScale, @"DiscreteScrollHysteresisScale");
    double v10 = *(double *)&qword_1E8FD5298;
    if (v9) {
      double v10 = 0.0001;
    }
    double v6 = v6 * v10;
  }

  return v6;
}

- (void)_resetGestureRecognizer
{
  [(UIPanGestureRecognizer *)self clearMultitouchTimer];
  -[UIPanGestureRecognizer _resetVelocitySamples]((uint64_t)self);
  self->_lastTouchCount = 0;
  [(NSMutableArray *)self->_touches removeAllObjects];
  [(NSMutableArray *)self->_movingTouches removeAllObjects];
  *((unsigned char *)self + 384) |= 0x40u;
  *((unsigned char *)self + 384) |= 0x80u;
  *((unsigned char *)self + 385) &= ~1u;
  *((unsigned char *)self + 385) &= ~2u;
  *((unsigned char *)self + 385) &= ~0x20u;
  *((unsigned char *)self + 385) &= ~0x40u;
  v3.receiver = self;
  v3.super_class = (Class)UIPanGestureRecognizer;
  [(UIGestureRecognizer *)&v3 _resetGestureRecognizer];
}

- (void)clearMultitouchTimer
{
  char v3 = *((unsigned char *)self + 385);
  if ((v3 & 8) != 0)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_multitouchExpired_ object:0];
    char v3 = *((unsigned char *)self + 385);
  }
  *((unsigned char *)self + 385) = v3 & 0xF7;
}

- (void)_resetVelocitySamples
{
  if (a1)
  {
    v2 = *(void **)(a1 + 416);
    *(void *)(a1 + 416) = 0;

    char v3 = *(void **)(a1 + 424);
    *(void *)(a1 + 424) = 0;
  }
}

- (void)_setCanPanVertically:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 384) = *((unsigned char *)self + 384) & 0xDF | v3;
}

- (void)_setiOSMacUseNonacceleratedDelta:(BOOL)a3
{
  self->_iOSMacUseNonacceleratedDelta = a3;
}

- (CGPoint)locationInView:(id)a3
{
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, self->_lastSceneReferenceLocation.x, self->_lastSceneReferenceLocation.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (self)
  {
    p_digitizerLocation = &self->_digitizerLocation;
    [a4 _digitizerLocation];
    p_digitizerLocation->double x = v7;
    self->_digitizerLocation.double y = v8;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__UIPanGestureRecognizer_touchesEnded_withEvent___block_invoke;
  v9[3] = &unk_1E52D9F70;
  v9[4] = self;
  [(UIPanGestureRecognizer *)self _handleEndedTouches:a3 withFinalStateAdjustments:v9];
}

- (void)_handleEndedTouches:(id)a3 withFinalStateAdjustments:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v6 = (void *)[(NSMutableArray *)self->_movingTouches copy];
  BOOL v7 = [(UIPanGestureRecognizer *)self _updateMovingTouchesArraySavingOldArray:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        [(NSMutableArray *)self->_touches removeObject:v13];
        [(NSMutableArray *)self->_movingTouches removeObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  if ([(NSMutableArray *)self->_movingTouches count])
  {
    if (v7
      || (unint64_t lastTouchCount = self->_lastTouchCount,
          lastTouchCount != [(NSMutableArray *)self->_movingTouches count]))
    {
      [(UIPanGestureRecognizer *)self _touchesListChangedFrom:v6 to:self->_movingTouches];
    }
  }
  else
  {
    (*((void (**)(void))a4 + 2))();
  }
}

uint64_t __49__UIPanGestureRecognizer_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 1)
  {
    uint64_t v2 = 3;
  }
  else if ([*(id *)(a1 + 32) state] == 2)
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 5;
  }
  double v3 = *(void **)(a1 + 32);
  return [v3 setState:v2];
}

- (BOOL)_updateMovingTouchesArraySavingOldArray:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 385) & 4) == 0 || (unint64_t)[(NSMutableArray *)self->_touches count] < 2) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obj = self->_touches;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        int v11 = -[UITouch _isStationaryRelativeToTouches:](v10, self->_touches);
        if (v11 == [(NSMutableArray *)self->_movingTouches containsObject:v10])
        {
          if (a3 && !*a3) {
            *a3 = (id)[(NSMutableArray *)self->_movingTouches copy];
          }
          movingTouches = self->_movingTouches;
          if (v11) {
            [(NSMutableArray *)movingTouches removeObject:v10];
          }
          else {
            [(NSMutableArray *)movingTouches addObject:v10];
          }
          char v7 = 1;
        }
      }
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);
  objc_storeStrong((id *)&self->_velocitySample, 0);
  objc_storeStrong((id *)&self->_movingTouches, 0);
  objc_storeStrong((id *)&self->_touches, 0);
}

- (void)_setCanPanHorizontally:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 384) = *((unsigned char *)self + 384) & 0xEF | v3;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    p_digitizerLocation = &self->_digitizerLocation;
    [a4 _digitizerLocation];
    p_digitizerLocation->double x = v8;
    self->_digitizerLocation.double y = v9;
    id v30 = 0;
    BOOL v10 = [(UIPanGestureRecognizer *)self _updateMovingTouchesArraySavingOldArray:&v30];
    int v11 = (NSMutableArray *)v30;
    if (v10)
    {
LABEL_13:
      if (v11) {
        movingTouches = v11;
      }
      else {
        movingTouches = self->_movingTouches;
      }
      -[UIPanGestureRecognizer _touchesListChangedFrom:to:](self, "_touchesListChangedFrom:to:", movingTouches);
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      char v12 = self->_movingTouches;
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            if (objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "phase", (void)v26) >= 3)
            {

              goto LABEL_13;
            }
          }
          uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
    -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", self->_movingTouches, 1, (void)v26);
    double v19 = v18;
    double v21 = v20;
    [a4 timestamp];
    -[UIPanGestureRecognizer _centroidMovedTo:atTime:affectingTranslation:](self, "_centroidMovedTo:atTime:affectingTranslation:", 1, v19, v21, v22);
    [(UIPanGestureRecognizer *)self _didUpdateCentroidWithTouches:a3 event:a4];
  }
  if ([(UIGestureRecognizer *)self state]
    || ![(UIPanGestureRecognizer *)self _shouldTryToBeginWithEvent:a4])
  {
    if (![(UIPanGestureRecognizer *)self _failsPastHysteresisWithoutMinTouches]) {
      return;
    }
    if ([(UIGestureRecognizer *)self state]) {
      return;
    }
    unint64_t v25 = [(NSMutableArray *)self->_movingTouches count];
    if (v25 >= [(UIPanGestureRecognizer *)self minimumNumberOfTouches]
      || ![(UIPanGestureRecognizer *)self _willScrollX]
      && ![(UIPanGestureRecognizer *)self _willScrollY])
    {
      return;
    }
    v23 = self;
    uint64_t v24 = 5;
  }
  else
  {
    [(UIPanGestureRecognizer *)self _removeHysteresisFromTranslation];
    v23 = self;
    uint64_t v24 = 1;
  }
  [(UIGestureRecognizer *)v23 setState:v24];
}

- (BOOL)_failsPastHysteresisWithoutMinTouches
{
  return (*((unsigned __int8 *)self + 384) >> 3) & 1;
}

- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 affectingTranslation:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  -[UIPanGestureRecognizer _adjustSceneReferenceLocation:](self, "_adjustSceneReferenceLocation:");
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v14 = a4 - self->_lastTouchTime;
  if (v14 > 0.008 || v14 > 0.0)
  {
    uint64_t v15 = self->_previousVelocitySample;
    objc_storeStrong((id *)&self->_previousVelocitySample, self->_velocitySample);
    long long v16 = v15;
    if (!v15) {
      long long v16 = objc_opt_new();
    }
    objc_storeStrong((id *)&self->_velocitySample, v16);
    long long v17 = v16;
    if (!v15) {

    }
    *(CGPoint *)(v17 + 8) = self->_lastSceneReferenceLocation;
    *((CGFloat *)v17 + 3) = v11;
    *((CGFloat *)v17 + 4) = v13;
    *((double *)v17 + 5) = v14;
  }
  if (v5)
  {
    self->_lastUnadjustedSceneReferenceLocation.CGFloat x = x;
    self->_lastUnadjustedSceneReferenceLocation.CGFloat y = y;
    self->_lastSceneReferenceLocation.CGFloat x = v11;
    self->_lastSceneReferenceLocation.CGFloat y = v13;
  }
  self->_lastTouchTime = a4;
}

- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)result
{
  if ((*((unsigned char *)self + 384) & 0x20) == 0 || (*((char *)self + 384) & 0x80000000) == 0)
  {
    uint64_t v3 = 1;
LABEL_4:
    result.CGFloat x = [(UIPanGestureRecognizer *)(double *)self _shiftPanLocationToNewSceneReferenceLocation:result.x lockingToAxis:result.y];
    return result;
  }
  if ((*((unsigned char *)self + 384) & 0x10) == 0 || (*((unsigned char *)self + 384) & 0x40) == 0)
  {
    uint64_t v3 = 2;
    goto LABEL_4;
  }
  if (self->_lastSceneReferenceLocation.x != self->_lastUnadjustedSceneReferenceLocation.x
    || self->_lastSceneReferenceLocation.y != self->_lastUnadjustedSceneReferenceLocation.y)
  {
    uint64_t v3 = 0;
    goto LABEL_4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIPanGestureRecognizer)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIPanGestureRecognizer;
  double v4 = -[UIGestureRecognizer initWithCoder:](&v8, sel_initWithCoder_);
  BOOL v5 = v4;
  if (v4)
  {
    _UIPanGestureRecognizerCommonInit((uint64_t)v4);
    if ([a3 containsValueForKey:@"UIPanGestureRecognizer.minimumNumberOfTouches"]) {
      v5->_minimumNumberOfTouches = [a3 decodeIntegerForKey:@"UIPanGestureRecognizer.minimumNumberOfTouches"];
    }
    if ([a3 containsValueForKey:@"UIPanGestureRecognizer.maximumNumberOfTouches"]) {
      v5->_maximumNumberOfTouches = [a3 decodeIntegerForKey:@"UIPanGestureRecognizer.maximumNumberOfTouches"];
    }
    if ([a3 containsValueForKey:@"UIPanGestureRecognizer.allowedScrollTypesMask"]) {
      v5->_int64_t allowedScrollTypesMask = [a3 decodeIntegerForKey:@"UIPanGestureRecognizer.allowedScrollTypesMask"];
    }
    uint64_t v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIPanGestureRecognizer;
  -[UIGestureRecognizer encodeWithCoder:](&v7, sel_encodeWithCoder_);
  unint64_t minimumNumberOfTouches = self->_minimumNumberOfTouches;
  if (minimumNumberOfTouches != 1) {
    [a3 encodeInteger:minimumNumberOfTouches forKey:@"UIPanGestureRecognizer.minimumNumberOfTouches"];
  }
  unint64_t maximumNumberOfTouches = self->_maximumNumberOfTouches;
  if (maximumNumberOfTouches != 0xFFFFFFFF) {
    [a3 encodeInteger:maximumNumberOfTouches forKey:@"UIPanGestureRecognizer.maximumNumberOfTouches"];
  }
  [a3 encodeInteger:self->_allowedScrollTypesMask forKey:@"UIPanGestureRecognizer.allowedScrollTypesMask"];
}

- (void)multitouchExpired:(id)a3
{
  if ([(NSMutableArray *)self->_touches count] < self->_minimumNumberOfTouches)
  {
    [(UIPanGestureRecognizer *)self clearMultitouchTimer];
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (BOOL)failsPastMaxTouches
{
  return (*((unsigned __int8 *)self + 384) >> 2) & 1;
}

- (BOOL)_ignoresStationaryTouches
{
  return (*((unsigned __int8 *)self + 385) >> 2) & 1;
}

- (BOOL)_canPanHorizontally
{
  return (*((unsigned __int8 *)self + 384) >> 4) & 1;
}

- (BOOL)_canPanVertically
{
  return (*((unsigned __int8 *)self + 384) >> 5) & 1;
}

- (id)_movingTouches
{
  return self->_movingTouches;
}

+ (void)_setPanGestureRecognizersEnabled:(BOOL)a3
{
  UIPanGestureRecognizersEnabled = a3;
}

- (void)setTranslation:(CGPoint)translation inView:(UIView *)view
{
  if (self->_lastTouchCount)
  {
    double y = translation.y;
    double x = translation.x;
    [(UIPanGestureRecognizer *)self _convertPoint:self->_lastSceneReferenceLocation.x fromSceneReferenceCoordinatesToView:self->_lastSceneReferenceLocation.y];
    -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", view, v8 - x, v9 - y);
    self->_firstSceneReferenceLocation.double x = v10;
    self->_firstSceneReferenceLocation.double y = v11;
  }
}

- (CGPoint)_convertVelocitySample:(id)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  if (a3)
  {
    double v5 = 0.0;
    double v6 = 0.0;
    if (*((double *)a3 + 5) >= 0.001)
    {
      -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, *((double *)a3 + 1), *((double *)a3 + 2));
      double v10 = v9;
      double v12 = v11;
      -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, *((double *)a3 + 3), *((double *)a3 + 4));
      double v14 = *((double *)a3 + 5);
      double v5 = (v13 - v10) / v14;
      double v6 = (v15 - v12) / v14;
    }
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
  }
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)velocityInView:(UIView *)view
{
  [(UIPanGestureRecognizer *)self _convertVelocitySample:self->_velocitySample fromSceneReferenceCoordinatesToView:view];
  double v5 = v4;
  double v7 = v6;
  previousVelocitySample = self->_previousVelocitySample;
  if (previousVelocitySample && previousVelocitySample->dt > 0.00000011920929)
  {
    -[UIPanGestureRecognizer _convertVelocitySample:fromSceneReferenceCoordinatesToView:](self, "_convertVelocitySample:fromSceneReferenceCoordinatesToView:");
    double v5 = v5 * 0.2 + v9 * 0.8;
    double v7 = v7 * 0.2 + v10 * 0.8;
  }
  double v11 = v5;
  double v12 = v7;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)_touchesListChangedFrom:(id)a3 to:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  [(UIGestureRecognizer *)self _centroidOfTouches:v6 excludingEnded:0];
  double v8 = v7;
  double v10 = v9;

  double v11 = [MEMORY[0x1E4F1CAD0] setWithArray:a4];
  [(UIGestureRecognizer *)self _centroidOfTouches:v11 excludingEnded:1];
  double v13 = v12;
  double v15 = v14;

  CGFloat v16 = v15 - v10 + self->_firstSceneReferenceLocation.y;
  self->_firstSceneReferenceLocation.double x = v13 - v8 + self->_firstSceneReferenceLocation.x;
  self->_firstSceneReferenceLocation.double y = v16;
  CGFloat v17 = v15 - v10 + self->_lastSceneReferenceLocation.y;
  self->_lastSceneReferenceLocation.double x = v13 - v8 + self->_lastSceneReferenceLocation.x;
  self->_lastSceneReferenceLocation.double y = v17;
  CGFloat v18 = v15 - v10 + self->_lastUnadjustedSceneReferenceLocation.y;
  self->_lastUnadjustedSceneReferenceLocation.double x = v13 - v8 + self->_lastUnadjustedSceneReferenceLocation.x;
  self->_lastUnadjustedSceneReferenceLocation.double y = v18;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v19 = a4;
  unint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    int v21 = 0;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        if (objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v23), "phase", (void)v24) < 3) {
          ++v21;
        }
        ++v23;
      }
      while (v20 != v23);
      unint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v20);
    unint64_t v20 = v21;
  }

  self->_unint64_t lastTouchCount = v20;
}

- (double)_offsetInViewFromSceneReferenceLocation:(double)a3 toSceneReferenceLocation:(double)a4
{
  if (!a1) {
    return 0.0;
  }
  double v10 = [a1 view];
  objc_msgSend(a1, "_convertPoint:fromSceneReferenceCoordinatesToView:", v10, a2, a3);
  double v12 = v11;

  double v13 = [a1 view];
  objc_msgSend(a1, "_convertPoint:fromSceneReferenceCoordinatesToView:", v13, a4, a5);
  double v15 = v14;

  return v15 - v12;
}

- (double)_shiftPanLocationToNewSceneReferenceLocation:(double)a3 lockingToAxis:(double)a4
{
  if (!a1) {
    return 0.0;
  }
  double v6 = -[UIPanGestureRecognizer _offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:](a1, a1[45], a1[46], a3, a4);
  if (a2 == 1) {
    double v8 = 0.0;
  }
  else {
    double v8 = v7;
  }
  if (a2 == 2) {
    double v9 = 0.0;
  }
  else {
    double v9 = v6;
  }
  if (a2 == 2) {
    double v10 = v7;
  }
  else {
    double v10 = v8;
  }
  double v11 = objc_msgSend(a1, "view", v6);
  objc_msgSend(a1, "_convertPoint:fromSceneReferenceCoordinatesToView:", v11, a1[36], a1[37]);
  double v13 = v12;
  double v15 = v14;

  CGFloat v16 = [a1 view];
  objc_msgSend(a1, "_convertPoint:toSceneReferenceCoordinatesFromView:", v16, v9 + v13, v10 + v15);
  double v18 = v17;

  return v18;
}

- (void)_removeHysteresisFromTranslation
{
  id v33 = [(UIGestureRecognizer *)self view];
  [(UIPanGestureRecognizer *)self _hysteresis];
  double v4 = v3;
  [(UIPanGestureRecognizer *)self translationInView:v33];
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v33, *MEMORY[0x1E4F1DAD8], v10);
  double v12 = v11;
  double v14 = v13;
  -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v33, v6, v8);
  double v16 = v15 - v12;
  double v18 = v17 - v14;
  double v19 = v4 + v16;
  if (v4 + v16 > 0.0) {
    double v19 = 0.0;
  }
  double v20 = fmax(v16 - v4, 0.0);
  if (v16 > 0.0) {
    double v21 = v20;
  }
  else {
    double v21 = v19;
  }
  double v22 = v4 + v18;
  if (v4 + v18 > 0.0) {
    double v22 = 0.0;
  }
  double v23 = fmax(v18 - v4, 0.0);
  if (v18 > 0.0) {
    double v24 = v23;
  }
  else {
    double v24 = v22;
  }
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v33, v9, v10);
  double v26 = v25;
  double v28 = v27;
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v33, v21, v24);
  double v30 = v29 - v26;
  double v32 = v31 - v28;
  if ((*((unsigned char *)self + 384) & 0x40) == 0) {
    double v30 = 0.0;
  }
  if (*((char *)self + 384) >= 0) {
    double v32 = 0.0;
  }
  -[UIPanGestureRecognizer setTranslation:inView:](self, "setTranslation:inView:", v33, v30, v32);
}

- (void)_willBeginAfterSatisfyingFailureRequirements
{
  id v3 = [(UIGestureRecognizer *)self view];
  -[UIPanGestureRecognizer setTranslation:inView:](self, "setTranslation:inView:", v3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__UIPanGestureRecognizer_touchesCancelled_withEvent___block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(UIPanGestureRecognizer *)self _handleEndedTouches:a3 withFinalStateAdjustments:v4];
}

uint64_t __53__UIPanGestureRecognizer_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:5];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  double v7 = [a3 anyObject];
  [(UIGestureRecognizer *)self ignorePress:v7 forEvent:a4];

  v8.receiver = self;
  v8.super_class = (Class)UIPanGestureRecognizer;
  [(UIGestureRecognizer *)&v8 pressesBegan:a3 withEvent:a4];
}

- (void)_ignoreTouchForTouchIdentifier:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = self->_touches;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      double v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "_touchIdentifier", (void)v13) == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    double v11 = v10;

    if (!v11) {
      return;
    }
    double v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
    [(UIPanGestureRecognizer *)self touchesCancelled:v12 withEvent:0];

    [(UIGestureRecognizer *)self ignoreTouch:v11 forEvent:0];
    double v5 = v11;
  }
LABEL_12:
}

- (unint64_t)numberOfTouches
{
  return [(NSMutableArray *)self->_touches count];
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  if ([(NSMutableArray *)self->_touches count] <= a3)
  {
    long long v13 = NSString;
    long long v14 = (objc_class *)objc_opt_class();
    long long v15 = NSStringFromClass(v14);
    long long v16 = NSStringFromSelector(a2);
    uint64_t v8 = [v13 stringWithFormat:@"-[%@ %@]", v15, v16];

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%ld) beyond bounds (%ld).", v8, a3, -[NSMutableArray count](self->_touches, "count") format];
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    uint64_t v8 = [(NSMutableArray *)self->_touches objectAtIndex:a3];
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

- (id)_activeTouches
{
  if (a1)
  {
    a1 = (id *)a1[39];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_ignoreTouches:(uint64_t)a3 forEvent:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1 && [a2 count])
  {
    [a1 touchesCancelled:a2 withEvent:a3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = a2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(a1, "ignoreTouch:forEvent:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), a3, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (CGPoint)_initialLocationInView:(id)a3
{
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, self->_firstSceneReferenceLocation.x, self->_firstSceneReferenceLocation.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (NSArray)_allowedScrollTypes
{
  double v3 = objc_opt_new();
  double v4 = v3;
  int64_t allowedScrollTypesMask = self->_allowedScrollTypesMask;
  if (allowedScrollTypesMask)
  {
    [v3 addObject:&unk_1ED3F4350];
    int64_t allowedScrollTypesMask = self->_allowedScrollTypesMask;
  }
  if ((allowedScrollTypesMask & 2) != 0) {
    [v4 addObject:&unk_1ED3F4368];
  }
  id v6 = (void *)[v4 copy];

  return (NSArray *)v6;
}

- (void)_setAllowedScrollTypes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->_int64_t allowedScrollTypesMask = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) integerValue];
        if (v10 == 2 || v10 == 1)
        {
          int64_t v11 = self->_allowedScrollTypesMask | 2;
          goto LABEL_11;
        }
        if (!v10)
        {
          int64_t v11 = self->_allowedScrollTypesMask | 1;
LABEL_11:
          self->_int64_t allowedScrollTypesMask = v11;
          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v8, @"Invalid value for scroll type: %ld. Must be either UIScrollTypeDiscrete or UIScrollTypeContinuous", v10);
LABEL_13:
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_setiOSMacScrollingEnabled:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  [(UIPanGestureRecognizer *)self setAllowedScrollTypesMask:v3];
}

- (BOOL)isIOSMacScrollingEnabled
{
  return self->_allowedScrollTypesMask != 0;
}

- (void)_processScrollPhaseChanged:(id)a3
{
  objc_msgSend(a3, "_adjustedDeltaForPanWithAcceleration:honoringScrollDirectionPreference:", -[UIPanGestureRecognizer _iOSMacUseNonacceleratedDelta](self, "_iOSMacUseNonacceleratedDelta") ^ 1, -[UIPanGestureRecognizer _iOSMacIgnoreScrollDirectionUserPreference](self, "_iOSMacIgnoreScrollDirectionUserPreference") ^ 1);
  BOOL v7 = v6 != 0.0 || v5 != 0.0;
  if (v7)
  {
LABEL_18:
    double v14 = v5 + self->_lastUnadjustedSceneReferenceLocation.x;
    double v15 = v6 + self->_lastUnadjustedSceneReferenceLocation.y;
    [a3 timestamp];
    -[UIPanGestureRecognizer _centroidMovedTo:atTime:affectingTranslation:](self, "_centroidMovedTo:atTime:affectingTranslation:", v7, v14, v15, v16);
    goto LABEL_19;
  }
  [a3 _stifledDelta];
  if (v5 != 0.0 || v6 != 0.0)
  {
    unsigned int v8 = *((unsigned __int8 *)self + 385);
    int v9 = (v8 >> 5) & 1;
    if (v5 != 0.0) {
      int v9 = 1;
    }
    if (v9) {
      char v10 = 32;
    }
    else {
      char v10 = 0;
    }
    *((unsigned char *)self + 385) = v10 | v8 & 0xDF;
    unsigned int v11 = *((unsigned __int8 *)self + 385);
    int v12 = (v11 >> 6) & 1;
    if (v6 != 0.0) {
      int v12 = 1;
    }
    if (v12) {
      char v13 = 64;
    }
    else {
      char v13 = 0;
    }
    *((unsigned char *)self + 385) = v13 | v11 & 0xBF;
    goto LABEL_18;
  }
LABEL_19:
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible
    && [(UIPanGestureRecognizer *)self _shouldTryToBeginWithEvent:a3])
  {
    if ((*((unsigned char *)self + 385) & 0x20) == 0 && (*((unsigned char *)self + 385) & 0x40) == 0) {
      [(UIPanGestureRecognizer *)self _removeHysteresisFromTranslation];
    }
    [(UIGestureRecognizer *)self setState:1];
  }
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  switch([a3 phase])
  {
    case 2:
      if (self)
      {
        [a3 _digitizerLocation];
        self->_digitizerLocation.double x = v5;
        self->_digitizerLocation.double y = v6;
      }
      BOOL v7 = [a3 _allWindows];
      id v19 = [v7 anyObject];

      [a3 locationInView:0];
      -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v19);
      self->_firstSceneReferenceLocation.double x = v8;
      self->_firstSceneReferenceLocation.double y = v9;
      self->_lastSceneReferenceLocation = self->_firstSceneReferenceLocation;
      self->_lastUnadjustedSceneReferenceLocation = self->_firstSceneReferenceLocation;
      [a3 timestamp];
      self->_lastTouchTime = v10;
      self->_unint64_t lastTouchCount = 1;
      if (![a3 _scrollType]) {
        [(UIPanGestureRecognizer *)self _processScrollPhaseChanged:a3];
      }

      break;
    case 3:
      [(UIPanGestureRecognizer *)self _processScrollPhaseChanged:a3];
      break;
    case 4:
      if ([(UIGestureRecognizer *)self state] != UIGestureRecognizerStateBegan
        && [(UIGestureRecognizer *)self state] != UIGestureRecognizerStateChanged)
      {
        goto LABEL_19;
      }
      [a3 timestamp];
      double v12 = v11 - self->_lastTouchTime;
      int v13 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_DurationBetweenScrollChangeAndEndEventsToResetVelocity, @"DurationBetweenScrollChangeAndEndEventsToResetVelocity");
      double v14 = *(double *)&qword_1E8FD5288;
      if (v13) {
        double v14 = 0.13;
      }
      if (v12 > v14)
      {
        velocitySample = self->_velocitySample;
        self->_velocitySample = 0;

        previousVelocitySample = self->_previousVelocitySample;
        self->_previousVelocitySample = 0;
      }
      uint64_t v17 = self;
      uint64_t v18 = 3;
      goto LABEL_20;
    case 5:
LABEL_19:
      uint64_t v17 = self;
      uint64_t v18 = 5;
LABEL_20:
      [(UIGestureRecognizer *)v17 setState:v18];
      break;
    default:
      return;
  }
}

- (uint64_t)_scrollDeviceCategory
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 _activeEventOfType:10];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v2 = [v1 _scrollDeviceCategory];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 8;
}

- (NSUInteger)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (UIScrollTypeMask)allowedScrollTypesMask
{
  return self->_allowedScrollTypesMask;
}

- (BOOL)_iOSMacUseNonacceleratedDelta
{
  return self->_iOSMacUseNonacceleratedDelta;
}

- (BOOL)_iOSMacIgnoreScrollDirectionUserPreference
{
  return self->_iOSMacIgnoreScrollDirectionUserPreference;
}

- (void)_setiOSMacIgnoreScrollDirectionUserPreference:(BOOL)a3
{
  self->_iOSMacIgnoreScrollDirectionUserPreference = a3;
}

- (BOOL)_iOSMacScrollingEnabled
{
  return self->_iOSMacScrollingEnabled;
}

@end