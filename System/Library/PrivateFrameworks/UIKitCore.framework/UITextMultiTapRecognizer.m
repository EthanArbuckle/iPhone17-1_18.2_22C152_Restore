@interface UITextMultiTapRecognizer
- (BOOL)_allowsEventWithRequiredButtonMask:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)recognizesOnSubsequentTouchDowns;
- (BOOL)tapIsPossibleForTapRecognizer:(id)a3;
- (CGPoint)location;
- (CGPoint)locationInView:(id)a3;
- (NSArray)touchesForTap;
- (UITextMultiTapRecognizer)initWithTarget:(id)a3 tapAction:(SEL)a4;
- (double)_touchSloppinessFactor;
- (double)allowableMovement;
- (double)maximumIntervalBetweenTaps;
- (double)maximumTouchDownDuration;
- (int64_t)requiredButtonMask;
- (unint64_t)minimumNumberOfTapsRequired;
- (unint64_t)numberOfTouchesRequired;
- (unint64_t)tapCount;
- (void)onStateUpdate:(id)a3;
- (void)reset;
- (void)resetTapCountForTapRecognizer:(id)a3;
- (void)setAllowableMovement:(double)a3;
- (void)setMaximumIntervalBetweenTaps:(double)a3;
- (void)setMaximumTouchDownDuration:(double)a3;
- (void)setMinimumNumberOfTapsRequired:(unint64_t)a3;
- (void)setNumberOfTouchesRequired:(unint64_t)a3;
- (void)setRecognizesOnSubsequentTouchDowns:(BOOL)a3;
- (void)setRequiredButtonMask:(int64_t)a3;
- (void)tapRecognizerFailedToRecognizeTap:(id)a3;
- (void)tapRecognizerRecognizedTap:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UITextMultiTapRecognizer

- (void)setAllowableMovement:(double)a3
{
}

- (UITextMultiTapRecognizer)initWithTarget:(id)a3 tapAction:(SEL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITextMultiTapRecognizer;
  v7 = [(UIGestureRecognizer *)&v12 initWithTarget:self action:sel_onStateUpdate_];
  if (v7)
  {
    v8 = objc_alloc_init(UITapRecognizer);
    tapRecognizer = v7->_tapRecognizer;
    v7->_tapRecognizer = v8;

    [(UITapRecognizer *)v7->_tapRecognizer setDelegate:v7];
    objc_storeWeak(&v7->_target, v6);
    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    v7->_tapAction = v10;
    [(UITapRecognizer *)v7->_tapRecognizer setNumberOfTouchesRequired:1];
    [(UITapRecognizer *)v7->_tapRecognizer setContinuousTapRecognition:1];
    [(UITapRecognizer *)v7->_tapRecognizer setAllowableMovement:45.0];
    [(UITapRecognizer *)v7->_tapRecognizer setMaximumTapDuration:0.75];
    [(UITapRecognizer *)v7->_tapRecognizer setMaximumIntervalBetweenSuccessiveTaps:0.35];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_destroyWeak(&self->_target);
}

- (void)onStateUpdate:(id)a3
{
  id v9 = a3;
  if ([(UIGestureRecognizer *)self state] != UIGestureRecognizerStateBegan
    && [(UIGestureRecognizer *)self state] != UIGestureRecognizerStateChanged
    || self->_sendTapAction)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_target);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      p_tapAction = &self->_tapAction;
      if (self->_tapAction)
      {

        v7 = (void *)UIApp;
        if (*p_tapAction) {
          SEL v8 = *p_tapAction;
        }
        else {
          SEL v8 = 0;
        }
        id v5 = objc_loadWeakRetained(&self->_target);
        [v7 sendAction:v8 to:v5 from:self forEvent:0];
      }
    }
    self->_sendTapAction = 0;
  }
}

- (unint64_t)numberOfTouchesRequired
{
  return [(UITapRecognizer *)self->_tapRecognizer numberOfTouchesRequired];
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
}

- (unint64_t)minimumNumberOfTapsRequired
{
  return [(UITapRecognizer *)self->_tapRecognizer numberOfTapsRequired];
}

- (void)setMinimumNumberOfTapsRequired:(unint64_t)a3
{
}

- (double)allowableMovement
{
  [(UITapRecognizer *)self->_tapRecognizer allowableMovement];
  return result;
}

- (double)maximumTouchDownDuration
{
  [(UITapRecognizer *)self->_tapRecognizer maximumTapDuration];
  return result;
}

- (void)setMaximumTouchDownDuration:(double)a3
{
}

- (double)maximumIntervalBetweenTaps
{
  [(UITapRecognizer *)self->_tapRecognizer maximumIntervalBetweenSuccessiveTaps];
  return result;
}

- (void)setMaximumIntervalBetweenTaps:(double)a3
{
}

- (NSArray)touchesForTap
{
  return [(UITapRecognizer *)self->_tapRecognizer touches];
}

- (unint64_t)tapCount
{
  BOOL v3 = [(UITextMultiTapRecognizer *)self recognizesOnSubsequentTouchDowns];
  uint64_t v4 = 5;
  if (v3) {
    uint64_t v4 = 4;
  }
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___UITextMultiTapRecognizer__tapRecognizer[v4]);
}

- (CGPoint)location
{
  BOOL v3 = [(UIGestureRecognizer *)self view];
  [(UITextMultiTapRecognizer *)self locationInView:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)tapIsPossibleForTapRecognizer:(id)a3
{
  return 1;
}

- (void)tapRecognizerRecognizedTap:(id)a3
{
  unint64_t touchDownCount = self->_touchDownCount;
  if (touchDownCount == [(UITextMultiTapRecognizer *)self minimumNumberOfTapsRequired])
  {
    uint64_t v5 = 1;
LABEL_5:
    [(UIGestureRecognizer *)self setState:v5];
    goto LABEL_6;
  }
  unint64_t v6 = self->_touchDownCount;
  if (v6 > [(UITextMultiTapRecognizer *)self minimumNumberOfTapsRequired])
  {
    uint64_t v5 = 2;
    goto LABEL_5;
  }
LABEL_6:
  ++self->_tapCount;
  self->_sendTapAction = 1;
}

- (void)tapRecognizerFailedToRecognizeTap:(id)a3
{
  double v4 = [(UITapRecognizer *)self->_tapRecognizer activeTouches];
  if ([v4 count])
  {

    uint64_t v5 = 5;
  }
  else
  {
    unint64_t touchDownCount = self->_touchDownCount;
    unint64_t v7 = [(UITextMultiTapRecognizer *)self minimumNumberOfTapsRequired];

    if (touchDownCount >= v7) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 5;
    }
  }
  [(UIGestureRecognizer *)self setState:v5];
}

- (double)_touchSloppinessFactor
{
  v2 = [(UIGestureRecognizer *)self view];
  [v2 _touchSloppinessFactor];
  double v4 = v3;

  return v4;
}

- (void)resetTapCountForTapRecognizer:(id)a3
{
  self->_tapCount = 0;
  self->_unint64_t touchDownCount = 0;
}

- (CGPoint)locationInView:(id)a3
{
  [(UITapRecognizer *)self->_tapRecognizer locationInView:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)UITextMultiTapRecognizer;
  [(UIGestureRecognizer *)&v3 reset];
  self->_sendTapAction = 0;
  [(UITextMultiTapRecognizer *)self resetTapCountForTapRecognizer:self->_tapRecognizer];
  [(UITapRecognizer *)self->_tapRecognizer _reset];
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 _isGestureType:0])
  {
    id v5 = v4;
    uint64_t v6 = [v5 numberOfTouchesRequired];
    if (v6 == [(UITextMultiTapRecognizer *)self numberOfTouchesRequired])
    {
      BOOL v7 = (unint64_t)[v5 numberOfTapsRequired] > 1;
LABEL_8:

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if ([v4 _isGestureType:1])
  {
    id v5 = v4;
    uint64_t v8 = [v5 numberOfTouchesRequired];
    if (v8 == [(UITextMultiTapRecognizer *)self numberOfTouchesRequired])
    {
      BOOL v7 = [v5 numberOfTapsRequired] != 0;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0 && (int)[v4 numberOfFullTaps] > 0;
LABEL_9:

  return !v7;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 modifierFlags] & 0x40000) != 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UITextMultiTapRecognizer;
    BOOL v8 = [(UIGestureRecognizer *)&v10 _shouldReceiveTouch:v6 withEvent:v7];
  }

  return v8;
}

- (BOOL)_allowsEventWithRequiredButtonMask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (self->_requiredButtonMask
    && [v4 _buttonMask]
    && [v6 _containsHIDPointerEvent])
  {
    int64_t requiredButtonMask = self->_requiredButtonMask;
    BOOL v8 = ([v4 _buttonMask] & requiredButtonMask) == requiredButtonMask;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UITextMultiTapRecognizer;
  id v6 = a4;
  id v7 = a3;
  [(UIGestureRecognizer *)&v9 touchesBegan:v7 withEvent:v6];
  -[UITapRecognizer touchesBegan:withEvent:](self->_tapRecognizer, "touchesBegan:withEvent:", v7, v6, v9.receiver, v9.super_class);

  LODWORD(v7) = [(UITextMultiTapRecognizer *)self _allowsEventWithRequiredButtonMask:v6];
  if (!v7)
  {
    uint64_t v8 = 5;
    goto LABEL_6;
  }
  ++self->_touchDownCount;
  if ([(UITextMultiTapRecognizer *)self recognizesOnSubsequentTouchDowns]
    && self->_touchDownCount >= 2)
  {
    self->_sendTapAction = 1;
    uint64_t v8 = 2;
LABEL_6:
    [(UIGestureRecognizer *)self setState:v8];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UITextMultiTapRecognizer;
  [(UIGestureRecognizer *)&v8 touchesMoved:v6 withEvent:v7];
  if ([(UIGestureRecognizer *)self state] != UIGestureRecognizerStateFailed) {
    [(UITapRecognizer *)self->_tapRecognizer touchesMoved:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITextMultiTapRecognizer;
  id v6 = a4;
  id v7 = a3;
  [(UIGestureRecognizer *)&v8 touchesEnded:v7 withEvent:v6];
  -[UITapRecognizer touchesEnded:withEvent:](self->_tapRecognizer, "touchesEnded:withEvent:", v7, v6, v8.receiver, v8.super_class);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITextMultiTapRecognizer;
  id v6 = a4;
  id v7 = a3;
  [(UIGestureRecognizer *)&v8 touchesCancelled:v7 withEvent:v6];
  -[UITapRecognizer touchesCancelled:withEvent:](self->_tapRecognizer, "touchesCancelled:withEvent:", v7, v6, v8.receiver, v8.super_class);

  [(UIGestureRecognizer *)self setState:4];
}

- (BOOL)recognizesOnSubsequentTouchDowns
{
  return self->_recognizesOnSubsequentTouchDowns;
}

- (void)setRecognizesOnSubsequentTouchDowns:(BOOL)a3
{
  self->_recognizesOnSubsequentTouchDowns = a3;
}

- (int64_t)requiredButtonMask
{
  return self->_requiredButtonMask;
}

- (void)setRequiredButtonMask:(int64_t)a3
{
  self->_int64_t requiredButtonMask = a3;
}

@end