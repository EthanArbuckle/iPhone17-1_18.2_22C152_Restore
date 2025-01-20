@interface _UISecondaryClickClickInteractionDriver
+ (BOOL)prefersCancelsTouchesInView;
+ (BOOL)requiresForceCapability;
- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4;
- (BOOL)allowsFeedback;
- (BOOL)cancelsTouchesInView;
- (BOOL)clicksUpAutomaticallyAfterTimeout;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasExceededAllowableMovement;
- (BOOL)isCurrentlyAcceleratedByForce;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (UIView)view;
- (_UIClickInteractionDriverDelegate)delegate;
- (_UISecondaryClickClickInteractionDriver)init;
- (_UISecondaryClickDriverGestureRecognizer)gestureRecognizer;
- (double)allowableMovement;
- (double)maximumEffectProgress;
- (double)touchDuration;
- (unint64_t)driverStyle;
- (unint64_t)inputPrecision;
- (void)_attemptSecondaryClick;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handleGestureRecognizer:(id)a3;
- (void)cancelInteraction;
- (void)setAllowableMovement:(double)a3;
- (void)setCancelsTouchesInView:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _UISecondaryClickClickInteractionDriver

- (void)_gestureRecognizerFailed:(id)a3
{
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = [(_UISecondaryClickClickInteractionDriver *)self gestureRecognizer];
    v7 = [v6 view];
    [v7 removeGestureRecognizer:v6];

    id v8 = objc_storeWeak((id *)&self->_view, obj);
    if (obj)
    {
      self->_currentState = 1;
      id v9 = objc_loadWeakRetained((id *)&self->_view);
      [v9 addGestureRecognizer:v6];
    }
    v5 = obj;
  }
}

- (_UISecondaryClickDriverGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setDelegate:(id)a3
{
}

- (_UISecondaryClickClickInteractionDriver)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UISecondaryClickClickInteractionDriver;
  v2 = [(_UISecondaryClickClickInteractionDriver *)&v5 init];
  if (v2)
  {
    v3 = [(UIGestureRecognizer *)[_UISecondaryClickDriverGestureRecognizer alloc] initWithTarget:v2 action:sel__handleGestureRecognizer_];
    [(UIGestureRecognizer *)v3 setDelegate:v2];
    [(_UISecondaryClickClickInteractionDriver *)v2 setGestureRecognizer:v3];
  }
  return v2;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

- (_UIClickInteractionDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIClickInteractionDriverDelegate *)WeakRetained;
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
  return 0.0;
}

- (double)touchDuration
{
  return 0.0;
}

- (BOOL)hasExceededAllowableMovement
{
  return 0;
}

- (BOOL)isCurrentlyAcceleratedByForce
{
  return 0;
}

- (void)cancelInteraction
{
  v3 = [(_UISecondaryClickClickInteractionDriver *)self gestureRecognizer];
  [v3 setEnabled:0];

  id v4 = [(_UISecondaryClickClickInteractionDriver *)self gestureRecognizer];
  [v4 setEnabled:1];
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UISecondaryClickClickInteractionDriver *)self view];
  if (v5)
  {
    v6 = [(_UISecondaryClickClickInteractionDriver *)self gestureRecognizer];
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

- (BOOL)allowsFeedback
{
  return 0;
}

- (unint64_t)inputPrecision
{
  v2 = [(_UISecondaryClickClickInteractionDriver *)self gestureRecognizer];
  if (v2) {
    unint64_t v3 = v2[23];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (unint64_t)driverStyle
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
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UISecondaryClickClickInteractionDriver *)self gestureRecognizer];

  if (v8 == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v9 = [v6 view];
    double v10 = [v7 view];
    if (v9 == v10) {
      char v11 = 1;
    }
    else {
      char v11 = [v9 isDescendantOfView:v10];
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)_handleGestureRecognizer:(id)a3
{
  id v4 = [(_UISecondaryClickClickInteractionDriver *)self gestureRecognizer];
  uint64_t v5 = [v4 state];

  if (v5 == 1)
  {
    [(_UISecondaryClickClickInteractionDriver *)self _attemptSecondaryClick];
  }
  else if (v5 == 4)
  {
    unint64_t currentState = self->_currentState;
    handleEvent(stateMachineSpec_7, currentState, 3, (uint64_t)self, (uint64_t *)&self->_currentState);
  }
}

- (void)_attemptSecondaryClick
{
  unint64_t v3 = [(_UISecondaryClickClickInteractionDriver *)self delegate];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65___UISecondaryClickClickInteractionDriver__attemptSecondaryClick__block_invoke;
  v4[3] = &unk_1E52EBCD8;
  v4[4] = self;
  [v3 clickDriver:self shouldBegin:v4];
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

@end