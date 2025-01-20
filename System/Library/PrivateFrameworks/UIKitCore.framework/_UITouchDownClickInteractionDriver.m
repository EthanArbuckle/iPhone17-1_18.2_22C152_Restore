@interface _UITouchDownClickInteractionDriver
+ (BOOL)prefersCancelsTouchesInView;
+ (BOOL)requiresForceCapability;
- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4;
- (BOOL)allowsFeedback;
- (BOOL)cancelsTouchesInView;
- (BOOL)clicksUpAutomaticallyAfterTimeout;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)hasExceededAllowableMovement;
- (BOOL)isCurrentlyAcceleratedByForce;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (UIGestureRecognizer)primaryGestureRecognizer;
- (UIView)view;
- (_UIClickInteractionDriverDelegate)delegate;
- (_UITouchDownClickInteractionDriver)init;
- (double)allowableMovement;
- (double)maximumEffectProgress;
- (double)touchDuration;
- (unint64_t)inputPrecision;
- (void)_handleGestureRecognizer:(id)a3;
- (void)cancelInteraction;
- (void)setAllowableMovement:(double)a3;
- (void)setCancelsTouchesInView:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _UITouchDownClickInteractionDriver

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != obj)
  {
    v5 = [(UIGestureRecognizer *)self->_gesture view];
    [v5 removeGestureRecognizer:self->_gesture];

    id v6 = objc_storeWeak((id *)&self->_view, obj);
    [obj addGestureRecognizer:self->_gesture];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (_UITouchDownClickInteractionDriver)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UITouchDownClickInteractionDriver;
  v2 = [(_UITouchDownClickInteractionDriver *)&v6 init];
  if (v2)
  {
    v3 = [[_UITouchDownGestureRecognizer alloc] initWithTarget:v2 action:sel__handleGestureRecognizer_];
    gesture = v2->_gesture;
    v2->_gesture = v3;

    [(UIGestureRecognizer *)v2->_gesture setDelegate:v2];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gesture, 0);
}

+ (BOOL)requiresForceCapability
{
  return 0;
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
  return 0.0;
}

- (BOOL)hasExceededAllowableMovement
{
  return 0;
}

- (UIGestureRecognizer)primaryGestureRecognizer
{
  return (UIGestureRecognizer *)self->_gesture;
}

- (BOOL)isCurrentlyAcceleratedByForce
{
  return 0;
}

- (void)cancelInteraction
{
  [(UIGestureRecognizer *)self->_gesture setEnabled:0];
  gesture = self->_gesture;
  [(UIGestureRecognizer *)gesture setEnabled:1];
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  v5 = [(_UITouchDownClickInteractionDriver *)self view];
  if (v5)
  {
    [(_UITouchDownGestureRecognizer *)self->_gesture locationInView:v5];
    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v4);
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)allowsFeedback
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  double v6 = (_UITouchDownGestureRecognizer *)a3;
  id v7 = a4;
  if (self->_gesture == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v8 = [(UIGestureRecognizer *)v6 view];
    double v9 = [v7 view];
    if (v8 == v9) {
      char v10 = 1;
    }
    else {
      char v10 = [v8 isDescendantOfView:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  if (self->_gesture == a3) {
    return [a4 _isGestureType:3];
  }
  else {
    return 0;
  }
}

- (void)_handleGestureRecognizer:(id)a3
{
  UIGestureRecognizerState v4 = [(UIGestureRecognizer *)self->_gesture state];
  if ((unint64_t)(v4 - 4) >= 2)
  {
    if (v4 == UIGestureRecognizerStateEnded)
    {
      v5 = [(_UITouchDownClickInteractionDriver *)self delegate];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __63___UITouchDownClickInteractionDriver__handleGestureRecognizer___block_invoke;
      v6[3] = &unk_1E52EBCD8;
      v6[4] = self;
      [v5 clickDriver:self shouldBegin:v6];
    }
  }
  else
  {
    [(_UITouchDownClickInteractionDriver *)self cancelInteraction];
  }
}

- (_UIClickInteractionDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIClickInteractionDriverDelegate *)WeakRetained;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)cancelsTouchesInView
{
  return self->_cancelsTouchesInView;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_cancelsTouchesInView = a3;
}

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return self->_clicksUpAutomaticallyAfterTimeout;
}

- (unint64_t)inputPrecision
{
  return self->_inputPrecision;
}

@end