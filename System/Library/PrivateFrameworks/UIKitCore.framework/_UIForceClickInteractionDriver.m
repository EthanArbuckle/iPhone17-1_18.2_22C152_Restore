@interface _UIForceClickInteractionDriver
+ (BOOL)prefersCancelsTouchesInView;
+ (BOOL)requiresForceCapability;
- (BOOL)allowsRepeatedClicks;
- (BOOL)cancelsTouchesInView;
- (BOOL)clicksUpAutomaticallyAfterTimeout;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)hasExceededAllowableMovement;
- (BOOL)isCurrentlyAcceleratedByForce;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (UITouchForceGestureRecognizer)gestureRecognizer;
- (UIView)view;
- (_UIClickInteractionDriverDelegate)delegate;
- (_UIForceClickInteractionDriver)init;
- (double)allowableMovement;
- (double)maximumEffectProgress;
- (double)touchDuration;
- (double)touchForce;
- (unint64_t)inputPrecision;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handleGestureRecognizer:(id)a3;
- (void)cancelInteraction;
- (void)setAllowableMovement:(double)a3;
- (void)setCancelsTouchesInView:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _UIForceClickInteractionDriver

- (_UIForceClickInteractionDriver)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIForceClickInteractionDriver;
  v2 = [(_UIForceClickInteractionDriver *)&v5 init];
  if (v2)
  {
    v3 = [[UITouchForceGestureRecognizer alloc] initWithTarget:v2 action:sel__handleGestureRecognizer_];
    [(UIGestureRecognizer *)v3 setName:@"kUIClickInteractionForceGestureRecognizer"];
    [(UITouchForceGestureRecognizer *)v3 setMaximumNumberOfTouches:1];
    [(UITouchForceGestureRecognizer *)v3 setAutomaticTouchForce:0.0];
    [(UIGestureRecognizer *)v3 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v3 setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)v3 setDelegate:v2];
    [(UIGestureRecognizer *)v3 _setKeepTouchesOnContinuation:1];
    [(_UIForceClickInteractionDriver *)v2 setGestureRecognizer:v3];
  }
  return v2;
}

- (double)touchForce
{
  v2 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
  [v2 touchForce];
  double v4 = v3;

  return v4;
}

- (void)setAllowableMovement:(double)a3
{
  id v4 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
  [v4 setAllowableMovement:a3];
}

- (double)allowableMovement
{
  v2 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
  [v2 allowableMovement];
  double v4 = v3;

  return v4;
}

+ (BOOL)requiresForceCapability
{
  return 1;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 1;
}

- (double)maximumEffectProgress
{
  return 1.0;
}

- (double)touchDuration
{
  v2 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
  [v2 touchDuration];
  double v4 = v3;

  return v4;
}

- (BOOL)hasExceededAllowableMovement
{
  v2 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
  char v3 = [v2 hasExceededAllowableMovement];

  return v3;
}

- (BOOL)isCurrentlyAcceleratedByForce
{
  return 1;
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
    v7 = [v6 view];
    [v7 removeGestureRecognizer:v6];

    id v8 = objc_storeWeak((id *)&self->_view, obj);
    if (obj)
    {
      self->_currentState = 1;
      id v9 = objc_loadWeakRetained((id *)&self->_view);
      [v9 addGestureRecognizer:v6];
    }
    objc_super v5 = obj;
  }
}

- (void)cancelInteraction
{
  char v3 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
  [v3 setEnabled:0];

  id v4 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
  [v4 setEnabled:1];
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UIForceClickInteractionDriver *)self view];
  if (v5)
  {
    v6 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
    [v6 locationInView:v5];
    double v8 = v7;
    double v10 = v9;

    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v4, v8, v10);
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v15 = v12;
  double v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (unint64_t)inputPrecision
{
  v2 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
  if (v2) {
    unint64_t v3 = v2[23];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return 0;
}

- (BOOL)allowsRepeatedClicks
{
  return 1;
}

- (void)_handleGestureRecognizer:(id)a3
{
  p_unint64_t currentState = (uint64_t *)&self->_currentState;
  unint64_t currentState = self->_currentState;
  [(_UIForceClickInteractionDriver *)self touchForce];
  double v7 = v6;
  double v8 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];
  uint64_t v9 = [v8 state];

  if ((unint64_t)(v9 - 4) < 2)
  {
LABEL_7:
    unint64_t v11 = self->_currentState;
    uint64_t v12 = 3;
LABEL_8:
    handleEvent(stateMachineSpec_8, v11, v12, (uint64_t)self, p_currentState);
    goto LABEL_9;
  }
  if (v9 == 3)
  {
    if (currentState == 3) {
      handleEvent(stateMachineSpec_8, self->_currentState, 2, (uint64_t)self, p_currentState);
    }
    goto LABEL_7;
  }
  if (v9 == 1)
  {
    double v10 = [(_UIForceClickInteractionDriver *)self delegate];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59___UIForceClickInteractionDriver__handleGestureRecognizer___block_invoke;
    v16[3] = &unk_1E52EBCD8;
    v16[4] = self;
    [v10 clickDriver:self shouldBegin:v16];

    goto LABEL_9;
  }
  if (currentState == 3)
  {
    if (v7 <= 2.2)
    {
      unint64_t v11 = self->_currentState;
      uint64_t v12 = 2;
      goto LABEL_8;
    }
  }
  else if (currentState == 2 && v7 >= 2.6)
  {
    unint64_t v11 = self->_currentState;
    uint64_t v12 = 1;
    goto LABEL_8;
  }
LABEL_9:
  if (*p_currentState == 2)
  {
    double v13 = [(_UIForceClickInteractionDriver *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      double v15 = [(_UIForceClickInteractionDriver *)self delegate];
      [v15 clickDriver:self didUpdateHighlightProgress:v7 / 2.6 + 0.0];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIForceClickInteractionDriver *)self gestureRecognizer];

  if (v8 != v6) {
    goto LABEL_2;
  }
  double v10 = [v7 name];
  unint64_t v11 = [v6 name];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    double v13 = [v6 view];
    char v14 = [v7 view];
    if (v13 == v14) {
      char v9 = 1;
    }
    else {
      char v9 = [v13 isDescendantOfView:v14];
    }

    goto LABEL_10;
  }
  double v15 = [(_UIForceClickInteractionDriver *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    double v13 = [(_UIForceClickInteractionDriver *)self delegate];
    char v9 = [v13 clickDriver:self shouldDelayGestureRecognizer:v7];
LABEL_10:

    goto LABEL_11;
  }
LABEL_2:
  char v9 = 0;
LABEL_11:

  return v9;
}

- (void)_gestureRecognizerFailed:(id)a3
{
}

- (_UIClickInteractionDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIClickInteractionDriverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (BOOL)cancelsTouchesInView
{
  return self->_cancelsTouchesInView;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_cancelsTouchesInView = a3;
}

- (UITouchForceGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

@end