@interface _UIDoubleTapInteraction
- (BOOL)continueProcessingSecondTapAtLocation:(CGPoint)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGPoint)initialTapLocationInView;
- (UIDelayedAction)doubleTapAction;
- (UIView)view;
- (_UIDoubleTapInteractionGestureRecognizer)tapGesture;
- (id)didDoubleTap;
- (id)didTimeOut;
- (id)shouldContinueProcessingSecondTap;
- (void)_handleTap:(id)a3;
- (void)_invalidateDoubleTap;
- (void)didMoveToView:(id)a3;
- (void)doubleTapOccurredAtLocation:(CGPoint)a3;
- (void)resetState;
- (void)setDidDoubleTap:(id)a3;
- (void)setDidTimeOut:(id)a3;
- (void)setDoubleTapAction:(id)a3;
- (void)setInitialTapLocationInView:(CGPoint)a3;
- (void)setShouldContinueProcessingSecondTap:(id)a3;
- (void)setTapGesture:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIDoubleTapInteraction

- (void)willMoveToView:(id)a3
{
  v4 = [(_UIDoubleTapInteraction *)self tapGesture];
  v5 = [v4 view];
  v6 = [(_UIDoubleTapInteraction *)self tapGesture];
  [v5 removeGestureRecognizer:v6];

  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    if (!self->_tapGesture)
    {
      v6 = [[_UIDoubleTapInteractionGestureRecognizer alloc] initWithTarget:self action:sel__handleTap_];
      tapGesture = self->_tapGesture;
      self->_tapGesture = v6;

      [(UIGestureRecognizer *)self->_tapGesture setDelegate:self];
    }
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    [WeakRetained addGestureRecognizer:self->_tapGesture];
  }
}

- (void)_handleTap:(id)a3
{
  uint64_t v4 = [a3 state];
  if (v4 == 4)
  {
    [(_UIDoubleTapInteraction *)self resetState];
  }
  else if (v4 == 3 && self)
  {
    id v5 = [(_UIDoubleTapInteraction *)self tapGesture];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [v5 locationInView:WeakRetained];
    v8 = v7;
    v10 = v9;

    v11 = [(_UIDoubleTapInteraction *)self doubleTapAction];
    LODWORD(WeakRetained) = [v11 scheduled];

    if (WeakRetained)
    {
      [(_UIDoubleTapInteraction *)self initialTapLocationInView];
      if (sqrt((v12 - *(double *)&v8) * (v12 - *(double *)&v8) + (v13 - *(double *)&v10) * (v13 - *(double *)&v10)) < 45.0) {
        -[_UIDoubleTapInteraction doubleTapOccurredAtLocation:](self, "doubleTapOccurredAtLocation:", *(double *)&v8, *(double *)&v10);
      }
      [(_UIDoubleTapInteraction *)self resetState];
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      objc_copyWeak(v18, &location);
      v18[1] = v8;
      v18[2] = v10;
      v14 = [(_UIDoubleTapInteraction *)self tapGesture];
      v16 = v14;
      if (v14) {
        objc_setProperty_nonatomic_copy(v14, v15, &v17, 312);
      }

      objc_destroyWeak(v18);
      objc_destroyWeak(&location);
    }
    -[_UIDoubleTapInteraction setInitialTapLocationInView:](self, "setInitialTapLocationInView:", *(double *)&v8, *(double *)&v10);
  }
}

- (void)_invalidateDoubleTap
{
  doubleTapAction = self->_doubleTapAction;
  self->_doubleTapAction = 0;

  uint64_t v4 = [(_UIDoubleTapInteraction *)self tapGesture];
  [v4 setEnabled:0];

  id v5 = [(_UIDoubleTapInteraction *)self tapGesture];
  [v5 setEnabled:1];

  v6 = [(_UIDoubleTapInteraction *)self didTimeOut];

  if (v6)
  {
    v7 = [(_UIDoubleTapInteraction *)self didTimeOut];
    v7[2]();
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v5 = [(_UIDoubleTapInteraction *)self doubleTapAction];
  int v6 = [v5 scheduled];

  if (v6)
  {
    if (self)
    {
      v7 = [(_UIDoubleTapInteraction *)self tapGesture];
      [v7 setCancelsTouchesInView:1];

      v8 = [(_UIDoubleTapInteraction *)self tapGesture];
      v9 = v8;
      uint64_t v10 = 1;
LABEL_6:
      [v8 setDelaysTouchesEnded:v10];
    }
  }
  else if (self)
  {
    v11 = [(_UIDoubleTapInteraction *)self tapGesture];
    [v11 setCancelsTouchesInView:0];

    v8 = [(_UIDoubleTapInteraction *)self tapGesture];
    v9 = v8;
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  int v6 = [(_UIDoubleTapInteraction *)self doubleTapAction];
  int v7 = [v6 scheduled];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [v5 locationInView:WeakRetained];
    double v10 = v9;
    double v12 = v11;

    if (self)
    {
      [(_UIDoubleTapInteraction *)self initialTapLocationInView];
      LOBYTE(self) = sqrt((v13 - v10) * (v13 - v10) + (v14 - v12) * (v14 - v12)) < 45.0;
    }
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v4 = [(_UIDoubleTapInteraction *)self doubleTapAction];
  char v5 = [v4 scheduled] ^ 1;

  return v5;
}

- (BOOL)continueProcessingSecondTapAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(_UIDoubleTapInteraction *)self shouldContinueProcessingSecondTap];

  if (!v6) {
    return 1;
  }
  int v7 = [(_UIDoubleTapInteraction *)self shouldContinueProcessingSecondTap];
  char v8 = v7[2](x, y);

  return v8;
}

- (void)doubleTapOccurredAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(_UIDoubleTapInteraction *)self didDoubleTap];

  if (v6)
  {
    int v7 = [(_UIDoubleTapInteraction *)self didDoubleTap];
    v7[2](x, y);
  }
}

- (void)resetState
{
  [(UIDelayedAction *)self->_doubleTapAction cancel];
  doubleTapAction = self->_doubleTapAction;
  self->_doubleTapAction = 0;

  tapGesture = self->_tapGesture;
  if (tapGesture)
  {
    objc_setProperty_nonatomic_copy(tapGesture, v4, 0, 312);
  }
}

- (UIDelayedAction)doubleTapAction
{
  doubleTapAction = self->_doubleTapAction;
  if (!doubleTapAction)
  {
    uint64_t v4 = [[UIDelayedAction alloc] initWithTarget:self action:sel__invalidateDoubleTap userInfo:0 delay:0.35];
    char v5 = self->_doubleTapAction;
    self->_doubleTapAction = v4;

    [(UIDelayedAction *)self->_doubleTapAction cancel];
    doubleTapAction = self->_doubleTapAction;
  }
  return doubleTapAction;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (id)shouldContinueProcessingSecondTap
{
  return self->_shouldContinueProcessingSecondTap;
}

- (void)setShouldContinueProcessingSecondTap:(id)a3
{
}

- (id)didDoubleTap
{
  return self->_didDoubleTap;
}

- (void)setDidDoubleTap:(id)a3
{
}

- (id)didTimeOut
{
  return self->_didTimeOut;
}

- (void)setDidTimeOut:(id)a3
{
}

- (_UIDoubleTapInteractionGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (CGPoint)initialTapLocationInView
{
  double x = self->_initialTapLocationInView.x;
  double y = self->_initialTapLocationInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialTapLocationInView:(CGPoint)a3
{
  self->_initialTapLocationInView = a3;
}

- (void)setDoubleTapAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapAction, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong(&self->_didTimeOut, 0);
  objc_storeStrong(&self->_didDoubleTap, 0);
  objc_storeStrong(&self->_shouldContinueProcessingSecondTap, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end