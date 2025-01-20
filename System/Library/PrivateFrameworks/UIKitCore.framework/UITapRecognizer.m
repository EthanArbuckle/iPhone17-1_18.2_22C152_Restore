@interface UITapRecognizer
+ (BOOL)supportsSecureCoding;
- (BOOL)activeTouchesExceedAllowableSeparation;
- (BOOL)continuousTapRecognition;
- (BOOL)countsOnlyActiveTouches;
- (CGPoint)_locationInSceneReferenceSpace;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)locationInView:(id)a3 focusSystem:(id)a4;
- (CGPoint)locationInViewNotTrackingTouches:(id)a3;
- (NSArray)touches;
- (NSSet)activeTouches;
- (UITapRecognizer)init;
- (UITapRecognizer)initWithCoder:(id)a3;
- (UITapRecognizerDelegate)delegate;
- (double)_effectiveAllowableMovement;
- (double)allowableMovement;
- (double)allowableSeparation;
- (double)allowableTouchTimeSeparation;
- (double)maximumIntervalBetweenSuccessiveTaps;
- (double)maximumTapDuration;
- (double)minimumTapDuration;
- (int64_t)buttonMaskRequired;
- (int64_t)exclusiveDirectionalAxis;
- (unint64_t)numberOfTapsRequired;
- (unint64_t)numberOfTouchesRequired;
- (void)_beginInteraction;
- (void)_interactionEndedTouch:(BOOL)a3;
- (void)_reset;
- (void)clearMultitouchTimer;
- (void)clearTapTimer;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)multitouchExpired:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAllowableMovement:(double)a3;
- (void)setAllowableSeparation:(double)a3;
- (void)setAllowableTouchTimeSeparation:(double)a3;
- (void)setButtonMaskRequired:(int64_t)a3;
- (void)setContinuousTapRecognition:(BOOL)a3;
- (void)setCountsOnlyActiveTouches:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExclusiveDirectionalAxis:(int64_t)a3;
- (void)setMaximumIntervalBetweenSuccessiveTaps:(double)a3;
- (void)setMaximumTapDuration:(double)a3;
- (void)setMinimumTapDuration:(double)a3;
- (void)setNumberOfTapsRequired:(unint64_t)a3;
- (void)setNumberOfTouchesRequired:(unint64_t)a3;
- (void)startMultitouchTimer:(double)a3;
- (void)startTapTimer:(double)a3;
- (void)tooSlow:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UITapRecognizer

- (unint64_t)numberOfTapsRequired
{
  return self->_numberOfTapsRequired;
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
  self->_numberOfTouchesRequired = a3;
}

- (void)setNumberOfTapsRequired:(unint64_t)a3
{
  self->_numberOfTapsRequired = a3;
}

- (void)setDelegate:(id)a3
{
}

- (UITapRecognizer)init
{
  v3.receiver = self;
  v3.super_class = (Class)UITapRecognizer;
  result = [(UITapRecognizer *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_numberOfTouchesRequired = vdupq_n_s64(1uLL);
    result->_buttonMaskRequired = 1;
    *((unsigned char *)result + 164) &= 0xF8u;
    *(_OWORD *)&result->_allowableMovement = xmmword_186B96CE0;
    *(_OWORD *)&result->_allowableTouchTimeSeparation = xmmword_186B96CF0;
    result->_startTime = 0.0;
    result->_maximumIntervalBetweenSuccessiveTaps = 0.35;
    result->_minimumTapDuration = 0.0;
    *(_WORD *)&result->_countsOnlyActiveTouches = 1;
    result->_strongestDirectionalAxis = -1;
    result->_strongestDirectionalForce = 0.0;
    result->_exclusiveDirectionalAxis = -1;
  }
  return result;
}

- (void)setExclusiveDirectionalAxis:(int64_t)a3
{
  self->_exclusiveDirectionalAxis = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (int64_t)buttonMaskRequired
{
  return self->_buttonMaskRequired;
}

- (double)allowableSeparation
{
  return self->_allowableSeparation;
}

- (void)setMaximumTapDuration:(double)a3
{
  self->_maximumTapDuration = a3;
}

- (void)setAllowableTouchTimeSeparation:(double)a3
{
  self->_allowableTouchTimeSeparation = a3;
}

- (void)setAllowableSeparation:(double)a3
{
  self->_allowableSeparation = a3;
}

- (void)setButtonMaskRequired:(int64_t)a3
{
  self->_buttonMaskRequired = a3;
}

- (void)setMaximumIntervalBetweenSuccessiveTaps:(double)a3
{
  self->_maximumIntervalBetweenSuccessiveTaps = a3;
}

- (void)setContinuousTapRecognition:(BOOL)a3
{
  self->_continuousTapRecognition = a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  self->_startTime = CACurrentMediaTime();
  [a4 _digitizerLocation];
  self->_digitizerLocation.x = v7;
  self->_digitizerLocation.y = v8;
  activeTouches = self->_activeTouches;
  if (!activeTouches)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v11 = self->_activeTouches;
    self->_activeTouches = v10;

    activeTouches = self->_activeTouches;
  }
  [(NSMutableSet *)activeTouches unionSet:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_countsOnlyActiveTouches)
  {
    if ([(NSMutableSet *)self->_activeTouches count] <= self->_numberOfTouchesRequired) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v18 = [a4 allTouches];
  unint64_t v19 = [v18 count];
  unint64_t numberOfTouchesRequired = self->_numberOfTouchesRequired;

  if (v19 > numberOfTouchesRequired)
  {
LABEL_5:
    [(UITapRecognizer *)self clearTapTimer];
    [(UITapRecognizer *)self clearMultitouchTimer];
    [WeakRetained tapRecognizerFailedToRecognizeTap:self];
  }
LABEL_6:
  if (self->_allowableSeparation != 1.79769313e308
    && [(UITapRecognizer *)self activeTouchesExceedAllowableSeparation])
  {
    [(UITapRecognizer *)self clearTapTimer];
    [(UITapRecognizer *)self clearMultitouchTimer];
    [WeakRetained tapRecognizerFailedToRecognizeTap:self];
  }
  if ((*((unsigned char *)self + 164) & 4) != 0) {
    goto LABEL_23;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v13 = self->_activeTouches;
  uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        if ([*(id *)(*((void *)&v44 + 1) + 8 * i) _isPointerTouch])
        {
          *((unsigned char *)self + 164) |= 4u;
          goto LABEL_22;
        }
      }
      uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  if ((*((unsigned char *)self + 164) & 4) != 0)
  {
LABEL_23:
    uint64_t v21 = [a4 _buttonMask];
    uint64_t v22 = [a4 _modifierFlags];
    unint64_t v23 = v21 & 0xFFFFFFFFFFFFFFFCLL | 2;
    if ((v22 & 0x40000) == 0) {
      unint64_t v23 = v21;
    }
    if ((v23 & self->_buttonMaskRequired) == 0)
    {
      [(UITapRecognizer *)self clearTapTimer];
      [(UITapRecognizer *)self clearMultitouchTimer];
      [WeakRetained tapRecognizerFailedToRecognizeTap:self];
    }
  }
  if ([WeakRetained tapIsPossibleForTapRecognizer:self])
  {
    if (!self->_currentNumberOfTouches) {
      [(UITapRecognizer *)self _beginInteraction];
    }
    self->_currentNumberOfTouches = [(NSMutableSet *)self->_activeTouches count];
    self->_numberOfTouchesForCurrentTap += [a3 count];
    if (self->_numberOfTouchesRequired == self->_currentNumberOfTouches)
    {
      [(NSMutableArray *)self->_touches removeAllObjects];
      if (!self->_touches)
      {
        v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        touches = self->_touches;
        self->_touches = v24;
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v26 = self->_activeTouches;
      uint64_t v27 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v41 != v29) {
              objc_enumerationMutation(v26);
            }
            -[NSMutableArray addObject:](self->_touches, "addObject:", *(void *)(*((void *)&v40 + 1) + 8 * j), (void)v40);
          }
          uint64_t v28 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v28);
      }

      if (!self->_currentNumberOfTaps)
      {
LABEL_47:
        [(UITapRecognizer *)self _locationInSceneReferenceSpace];
        self->_startPoint.x = v38;
        self->_startPoint.y = v39;
        goto LABEL_48;
      }
      if (self->_allowableMovement != 1.79769313e308)
      {
        [(UITapRecognizer *)self _locationInSceneReferenceSpace];
        double v33 = sqrt((self->_startPoint.x - v31) * (self->_startPoint.x - v31)+ (self->_startPoint.y - v32) * (self->_startPoint.y - v32));
        [(UITapRecognizer *)self _effectiveAllowableMovement];
        if (v33 > v34)
        {
          if (!self->_continuousTapRecognition)
          {
            [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
            [(UITapRecognizer *)self clearTapTimer];
            [(UITapRecognizer *)self clearMultitouchTimer];
            [WeakRetained tapRecognizerFailedToRecognizeTap:self];
            goto LABEL_48;
          }
          id v35 = objc_loadWeakRetained((id *)&self->_delegate);
          char v36 = objc_opt_respondsToSelector();

          if (v36)
          {
            id v37 = objc_loadWeakRetained((id *)&self->_delegate);
            [v37 resetTapCountForTapRecognizer:self];
          }
          self->_currentNumberOfTaps = 0;
          goto LABEL_47;
        }
      }
    }
  }
LABEL_48:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  [a4 _digitizerLocation];
  self->_digitizerLocation.x = v6;
  self->_digitizerLocation.y = v7;
  [(NSMutableSet *)self->_activeTouches minusSet:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained tapIsPossibleForTapRecognizer:self])
  {
    if (self->_numberOfTouchesRequired == self->_currentNumberOfTouches)
    {
      double v8 = CACurrentMediaTime();
      double startTime = self->_startTime;
      if (![(NSMutableSet *)self->_activeTouches count] && v8 - startTime > self->_minimumTapDuration) {
        -[UITapRecognizer _interactionEndedTouch:](self, "_interactionEndedTouch:", 1, v8 - startTime);
      }
    }
    else
    {
      [WeakRetained tapRecognizerFailedToRecognizeTap:self];
    }
  }
}

- (void)_beginInteraction
{
  [(UITapRecognizer *)self maximumTapDuration];
  -[UITapRecognizer startTapTimer:](self, "startTapTimer:");
  if ([(UITapRecognizer *)self numberOfTouchesRequired] >= 2)
  {
    [(UITapRecognizer *)self allowableTouchTimeSeparation];
    double v4 = v3;
    [(UITapRecognizer *)self maximumTapDuration];
    if (v4 < v5)
    {
      [(UITapRecognizer *)self allowableTouchTimeSeparation];
      -[UITapRecognizer startMultitouchTimer:](self, "startMultitouchTimer:");
    }
  }
}

- (unint64_t)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (double)maximumTapDuration
{
  return self->_maximumTapDuration;
}

- (double)allowableTouchTimeSeparation
{
  return self->_allowableTouchTimeSeparation;
}

- (void)startTapTimer:(double)a3
{
  [(UITapRecognizer *)self clearTapTimer];
  *((unsigned char *)self + 164) |= 1u;
  [(UITapRecognizer *)self performSelector:sel_tooSlow_ withObject:0 afterDelay:a3];
}

- (BOOL)activeTouchesExceedAllowableSeparation
{
  double v3 = _BoundingRectForTouches(self->_activeTouches, 0);
  double v5 = v4;
  double v7 = v6;
  double allowableSeparation = self->_allowableSeparation;
  v9 = [(UITapRecognizer *)self delegate];
  [v9 _touchSloppinessFactor];
  BOOL v11 = allowableSeparation * v10 < sqrt(v5 * v5 + v7 * v7);

  return v11;
}

- (UITapRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UITapRecognizerDelegate *)WeakRetained;
}

- (void)startMultitouchTimer:(double)a3
{
  [(UITapRecognizer *)self clearMultitouchTimer];
  *((unsigned char *)self + 164) |= 2u;
  [(UITapRecognizer *)self performSelector:sel_multitouchExpired_ withObject:0 afterDelay:a3];
}

- (void)_reset
{
  [(UITapRecognizer *)self clearTapTimer];
  [(UITapRecognizer *)self clearMultitouchTimer];
  *(void *)&self->_currentNumberOfTouches = 0;
  self->_numberOfTouchesForCurrentTap = 0;
  self->_startPoint = (CGPoint)*MEMORY[0x1E4F1DAD8];
  *((unsigned char *)self + 164) &= ~4u;
  self->_strongestDirectionalAxis = -1;
  self->_strongestDirectionalForce = 0.0;
  [(NSMutableSet *)self->_activeTouches removeAllObjects];
  touches = self->_touches;
  [(NSMutableArray *)touches removeAllObjects];
}

- (void)dealloc
{
  [(UITapRecognizer *)self clearTapTimer];
  [(UITapRecognizer *)self clearMultitouchTimer];
  v3.receiver = self;
  v3.super_class = (Class)UITapRecognizer;
  [(UITapRecognizer *)&v3 dealloc];
}

- (void)clearTapTimer
{
  char v3 = *((unsigned char *)self + 164);
  if (v3)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_tooSlow_ object:0];
    char v3 = *((unsigned char *)self + 164);
  }
  *((unsigned char *)self + 164) = v3 & 0xFE;
}

- (void)clearMultitouchTimer
{
  char v3 = *((unsigned char *)self + 164);
  if ((v3 & 2) != 0)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_multitouchExpired_ object:0];
    char v3 = *((unsigned char *)self + 164);
  }
  *((unsigned char *)self + 164) = v3 & 0xFD;
}

- (CGPoint)_locationInSceneReferenceSpace
{
  double v2 = _CentroidOfTouches(self->_touches, 0);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_interactionEndedTouch:(BOOL)a3
{
  uint64_t v4 = self->_currentNumberOfTaps + 1;
  self->_currentNumberOfTaps = v4;
  int64_t exclusiveDirectionalAxis = self->_exclusiveDirectionalAxis;
  if (exclusiveDirectionalAxis == -1
    || ((int64_t strongestDirectionalAxis = self->_strongestDirectionalAxis, strongestDirectionalAxis != -1)
      ? (BOOL v7 = exclusiveDirectionalAxis == strongestDirectionalAxis)
      : (BOOL v7 = 1),
        v7))
  {
    if (self->_numberOfTapsRequired == v4 || self->_continuousTapRecognition)
    {
      [(UITapRecognizer *)self clearTapTimer];
      [(UITapRecognizer *)self clearMultitouchTimer];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained tapRecognizerRecognizedTap:self];

      if (!self->_continuousTapRecognition) {
        return;
      }
    }
    else if (a3)
    {
      self->_currentNumberOfTouches = 0;
      self->_numberOfTouchesForCurrentTap = 0;
    }
    double maximumIntervalBetweenSuccessiveTaps = self->_maximumIntervalBetweenSuccessiveTaps;
    [(UITapRecognizer *)self startTapTimer:maximumIntervalBetweenSuccessiveTaps];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 tapRecognizerFailedToRecognizeTap:self];
  }
}

- (CGPoint)locationInView:(id)a3
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  if (![(NSMutableArray *)self->_touches count])
  {
    [(UITapRecognizer *)self locationInViewNotTrackingTouches:a3];
    double x = v12;
    double y = v13;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    BOOL v7 = [a3 _window];
    objc_msgSend(v7, "_convertPointFromSceneReferenceSpace:", x, y);
    objc_msgSend(a3, "convertPoint:fromView:", 0);
    double x = v8;
    double y = v9;
  }
LABEL_4:
  double v10 = x;
  double v11 = y;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id WeakRetained = a3;
  uint64_t v7 = [WeakRetained countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(WeakRetained);
      }
      double v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
      objc_msgSend(v11, "locationInView:", 0, (void)v24);
      double v13 = v12;
      double v15 = v14;
      [v11 previousLocationInView:0];
      if (sqrt((v16 - v13) * (v16 - v13) + (v17 - v15) * (v17 - v15)) != 0.0) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [WeakRetained countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

    [a4 _digitizerLocation];
    self->_digitizerLocation.double x = v18;
    self->_digitizerLocation.double y = v19;
    if (self->_allowableMovement != 1.79769313e308)
    {
      [(UITapRecognizer *)self _locationInSceneReferenceSpace];
      double v22 = sqrt((self->_startPoint.x - v20) * (self->_startPoint.x - v20)+ (self->_startPoint.y - v21) * (self->_startPoint.y - v21));
      [(UITapRecognizer *)self _effectiveAllowableMovement];
      if (v22 > v23)
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained tapRecognizerFailedToRecognizeTap:self];
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UITapRecognizer)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UITapRecognizer;
  uint64_t v4 = [(UITapRecognizer *)&v11 init];
  double v5 = (UITapRecognizer *)v4;
  if (v4)
  {
    *(int64x2_t *)(v4 + 8) = vdupq_n_s64(1uLL);
    *((void *)v4 + 3) = 1;
    v4[164] &= 0xF8u;
    *(_OWORD *)(v4 + 72) = xmmword_186B96CE0;
    *(_OWORD *)(v4 + 88) = xmmword_186B96CF0;
    *((void *)v4 + 14) = 0;
    *((void *)v4 + 15) = 0x3FD6666666666666;
    *((void *)v4 + 13) = 0;
    *(_WORD *)(v4 + 165) = 1;
    *((void *)v4 + 17) = -1;
    *((void *)v4 + 18) = 0;
    *((void *)v4 + 22) = -1;
    if ([a3 containsValueForKey:@"UITapRecognizer.numberOfTapsRequired"]) {
      v5->_numberOfTapsRequired = [a3 decodeIntegerForKey:@"UITapRecognizer.numberOfTapsRequired"];
    }
    if ([a3 containsValueForKey:@"UITapRecognizer.continuousTapRecognition"]) {
      v5->_continuousTapRecognition = [a3 decodeBoolForKey:@"UITapRecognizer.continuousTapRecognition"];
    }
    if ([a3 containsValueForKey:@"UITapRecognizer.numberOfTouchesRequired"]) {
      v5->_unint64_t numberOfTouchesRequired = [a3 decodeIntegerForKey:@"UITapRecognizer.numberOfTouchesRequired"];
    }
    if ([a3 containsValueForKey:@"UITapRecognizer.buttonMaskRequired"]) {
      v5->_buttonMaskRequired = [a3 decodeIntegerForKey:@"UITapRecognizer.buttonMaskRequired"];
    }
    if ([a3 containsValueForKey:@"UITapRecognizer.allowableMovement"])
    {
      [a3 decodeFloatForKey:@"UITapRecognizer.allowableMovement"];
      v5->_allowableMovement = v6;
    }
    if ([a3 containsValueForKey:@"UITapRecognizer.allowableSeparation"])
    {
      [a3 decodeFloatForKey:@"UITapRecognizer.allowableSeparation"];
      v5->_double allowableSeparation = v7;
    }
    if ([a3 containsValueForKey:@"UITapRecognizer.maximumIntervalBetweenSuccessiveTaps"])
    {
      [a3 decodeFloatForKey:@"UITapRecognizer.maximumIntervalBetweenSuccessiveTaps"];
      v5->_double maximumIntervalBetweenSuccessiveTaps = v8;
    }
    uint64_t v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t numberOfTapsRequired = self->_numberOfTapsRequired;
  if (numberOfTapsRequired != 1) {
    [a3 encodeInteger:numberOfTapsRequired forKey:@"UITapRecognizer.numberOfTapsRequired"];
  }
  if (self->_continuousTapRecognition) {
    [a3 encodeBool:1 forKey:@"UITapRecognizer.continuousTapRecognition"];
  }
  unint64_t numberOfTouchesRequired = self->_numberOfTouchesRequired;
  if (numberOfTouchesRequired != 1) {
    [a3 encodeInteger:numberOfTouchesRequired forKey:@"UITapRecognizer.numberOfTouchesRequired"];
  }
  int64_t buttonMaskRequired = self->_buttonMaskRequired;
  if (buttonMaskRequired != 1) {
    [a3 encodeInteger:buttonMaskRequired forKey:@"UITapRecognizer.buttonMaskRequired"];
  }
  double allowableMovement = self->_allowableMovement;
  if (allowableMovement != 45.0)
  {
    *(float *)&double allowableMovement = allowableMovement;
    [a3 encodeFloat:@"UITapRecognizer.allowableMovement" forKey:allowableMovement];
  }
  double allowableSeparation = self->_allowableSeparation;
  if (allowableSeparation != 1.79769313e308)
  {
    *(float *)&double allowableSeparation = allowableSeparation;
    [a3 encodeFloat:@"UITapRecognizer.allowableSeparation" forKey:allowableSeparation];
  }
  double maximumIntervalBetweenSuccessiveTaps = self->_maximumIntervalBetweenSuccessiveTaps;
  if (maximumIntervalBetweenSuccessiveTaps != 0.35)
  {
    *(float *)&double maximumIntervalBetweenSuccessiveTaps = maximumIntervalBetweenSuccessiveTaps;
    [a3 encodeFloat:@"UITapRecognizer.maximumIntervalBetweenSuccessiveTaps" forKey:maximumIntervalBetweenSuccessiveTaps];
  }
}

- (void)tooSlow:(id)a3
{
  [(UITapRecognizer *)self clearTapTimer];
  [(UITapRecognizer *)self clearMultitouchTimer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tapRecognizerFailedToRecognizeTap:self];
}

- (void)multitouchExpired:(id)a3
{
  unint64_t numberOfTouchesForCurrentTap = self->_numberOfTouchesForCurrentTap;
  if ([(UITapRecognizer *)self numberOfTouchesRequired] > numberOfTouchesForCurrentTap)
  {
    [(UITapRecognizer *)self clearTapTimer];
    [(UITapRecognizer *)self clearMultitouchTimer];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tapRecognizerFailedToRecognizeTap:self];
  }
}

- (double)_effectiveAllowableMovement
{
  double allowableMovement = self->_allowableMovement;
  double v3 = [(UITapRecognizer *)self delegate];
  [v3 _touchSloppinessFactor];
  double v5 = allowableMovement * v4;

  return v5;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->_numberOfTouchesForCurrentTap -= [a3 count];
  [(NSMutableSet *)self->_activeTouches minusSet:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tapRecognizerFailedToRecognizeTap:self];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v6 = [WeakRetained tapIsPossibleForTapRecognizer:self];

  if (v6)
  {
    [(UITapRecognizer *)self _beginInteraction];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  if (self->_exclusiveDirectionalAxis != -1)
  {
    objc_msgSend(a4, "_directionalPressWithStrongestForce", a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 force];
    if (v5 > self->_strongestDirectionalForce)
    {
      [v7 force];
      self->_strongestDirectionalForce = v6;
      self->_int64_t strongestDirectionalAxis = [v7 type];
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v6 = [WeakRetained tapIsPossibleForTapRecognizer:self];

  if (v6)
  {
    [(UITapRecognizer *)self _interactionEndedTouch:0];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tapRecognizerFailedToRecognizeTap:self];
}

- (BOOL)continuousTapRecognition
{
  return self->_continuousTapRecognition;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (double)maximumIntervalBetweenSuccessiveTaps
{
  return self->_maximumIntervalBetweenSuccessiveTaps;
}

- (CGPoint)locationInViewNotTrackingTouches:(id)a3
{
  double v4 = [(UITapRecognizer *)self delegate];
  double v5 = [v4 view];

  int v6 = [v5 _window];
  if (v5)
  {
    id v7 = +[UIFocusSystem focusSystemForEnvironment:v5];
  }
  else
  {
    id v7 = 0;
  }
  float v8 = [v7 focusedItem];
  if (v8)
  {
    uint64_t v9 = +[_UIFocusItemInfo infoWithItem:v8];
    [v9 focusedRectInCoordinateSpace:v6];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    CGFloat v18 = [v5 _window];
    objc_msgSend(v18, "_convertPointToSceneReferenceSpace:", v11 + v15 * 0.5, v13 + v17 * 0.5);
    double v20 = v19;
    double v22 = v21;
  }
  else
  {
    if (v5)
    {
      [v5 bounds];
      objc_msgSend(v5, "convertPoint:toView:", v6, v24 + v23 * 0.5, v26 + v25 * 0.5);
      objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
      double v20 = v27;
      double v22 = v28;
      goto LABEL_9;
    }
    uint64_t v9 = [a3 _window];
    [v9 center];
    objc_msgSend(v9, "_convertPointToSceneReferenceSpace:");
    double v20 = v31;
    double v22 = v32;
  }

LABEL_9:
  double v29 = v20;
  double v30 = v22;
  result.double y = v30;
  result.double x = v29;
  return result;
}

- (CGPoint)locationInView:(id)a3 focusSystem:(id)a4
{
  double v5 = [a4 focusedItem];
  if (v5)
  {
    int v6 = +[_UIFocusItemInfo infoWithItem:v5];
    [v6 focusedRectInCoordinateSpace:a3];
    double v9 = v8 + v7 * 0.5;
    double v12 = v11 + v10 * 0.5;
  }
  else
  {
    int v6 = [a3 _window];
    [v6 center];
    double v9 = v13;
    double v12 = v14;
  }

  double v15 = v9;
  double v16 = v12;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (NSSet)activeTouches
{
  return (NSSet *)self->_activeTouches;
}

- (NSArray)touches
{
  return &self->_touches->super;
}

- (double)minimumTapDuration
{
  return self->_minimumTapDuration;
}

- (void)setMinimumTapDuration:(double)a3
{
  self->_minimumTapDuration = a3;
}

- (BOOL)countsOnlyActiveTouches
{
  return self->_countsOnlyActiveTouches;
}

- (void)setCountsOnlyActiveTouches:(BOOL)a3
{
  self->_countsOnlyActiveTouches = a3;
}

- (int64_t)exclusiveDirectionalAxis
{
  return self->_exclusiveDirectionalAxis;
}

@end