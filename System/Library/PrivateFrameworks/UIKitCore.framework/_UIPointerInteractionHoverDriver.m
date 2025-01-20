@interface _UIPointerInteractionHoverDriver
- (BOOL)allowsUpdatesWhilePrimaryButtonIsPressed;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isActive;
- (CAPoint3D)locationInView:(id)a3;
- (UIView)view;
- (_UIPointerInteractionHoverDriver)initWithSink:(id)a3;
- (double)_currentTouchForce;
- (int64_t)_currentButtonMask;
- (int64_t)type;
- (void)_handleHoverGesture:(id)a3;
- (void)_handlePressGesture:(id)a3;
- (void)_installToView:(id)a3;
- (void)_pointerStateDidChange:(id)a3;
- (void)_uninstallFromView:(id)a3;
- (void)_updateHover:(id)a3 forced:(BOOL)a4;
- (void)invalidate;
- (void)setView:(id)a3;
@end

@implementation _UIPointerInteractionHoverDriver

- (void)setView:(id)a3
{
  p_view = &self->_view;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [(_UIPointerInteractionHoverDriver *)self _uninstallFromView:WeakRetained];

  id v6 = objc_storeWeak((id *)p_view, obj);
  id v7 = v6;
  if (obj)
  {
    id v8 = objc_loadWeakRetained((id *)p_view);
    [(_UIPointerInteractionHoverDriver *)self _installToView:v8];
  }
}

- (void)_uninstallFromView:(id)a3
{
  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  id v5 = a3;
  [v5 removeGestureRecognizer:hoverGestureRecognizer];
  [v5 removeGestureRecognizer:self->_pressGestureRecognizer];

  if (self->_flags.observing)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = +[_UIPointerArbiter sharedArbiter];
    [v6 removeObserver:self name:0x1ED14D680 object:v7];

    self->_flags.observing = 0;
  }
}

- (_UIPointerInteractionHoverDriver)initWithSink:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPointerInteractionHoverDriver;
  id v5 = [(_UIPointerInteractionHoverDriver *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_sink, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_sink);
}

- (CAPoint3D)locationInView:(id)a3
{
  [(UIHoverGestureRecognizer *)self->_hoverGestureRecognizer _location3DInView:a3];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)isActive
{
  UIGestureRecognizerState v3 = [(UIGestureRecognizer *)self->_hoverGestureRecognizer state];
  if (v3 != UIGestureRecognizerStateBegan) {
    LOBYTE(v3) = [(UIGestureRecognizer *)self->_hoverGestureRecognizer state] == UIGestureRecognizerStateChanged;
  }
  return v3;
}

- (void)invalidate
{
  self->_flags.invalid = 1;
  objc_initWeak(&location, self);
  v2 = (void *)UIApp;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46___UIPointerInteractionHoverDriver_invalidate__block_invoke;
  v3[3] = &unk_1E52DC308;
  objc_copyWeak(&v4, &location);
  [v2 _performBlockAfterCATransactionCommits:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (int64_t)type
{
  return 0;
}

- (void)_handleHoverGesture:(id)a3
{
  double v5 = (_UIPointerInteractionHoverGestureRecognizer *)a3;
  id v7 = v5;
  if (self->_hoverGestureRecognizer != v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v5);
    [v6 handleFailureInMethod:a2 object:self file:@"_UIPointerInteractionHoverDriver.m" lineNumber:165 description:@"Received updates from an unknown hover gesture recognizer."];
  }
  self->_flags.invalid = 0;
  -[_UIPointerInteractionHoverDriver _updateHover:forced:](self, "_updateHover:forced:");
}

- (void)_updateHover:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  self->_flags.receivedUpdateWhilePointerDisabled = 0;
  if ([v6 state] == 3 || objc_msgSend(v6, "state") == 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
    [WeakRetained driverDidExit:self];

    goto LABEL_4;
  }
  objc_super v8 = +[_UIPointerArbiter sharedArbiter];
  uint64_t v9 = [v8 pointerState];

  switch(v9)
  {
    case 0:
LABEL_10:
      self->_flags.receivedUpdateWhilePointerDisabled = 1;
      break;
    case 3:
      id v23 = objc_loadWeakRetained((id *)&self->_sink);
      [v23 driverDidExit:self];

      goto LABEL_10;
    case 1:
      v10 = [v6 view];
      [v6 _location3DInView:v10];
      uint64_t v12 = v11;
      uint64_t v14 = v13;
      uint64_t v16 = v15;

      BOOL v17 = v4;
      memset(v26, 0, sizeof(v26));
      uint64_t v18 = [v6 modifierFlags];
      int64_t v19 = [(_UIPointerInteractionHoverDriver *)self _currentButtonMask];
      [(_UIPointerInteractionHoverDriver *)self _currentTouchForce];
      uint64_t v21 = v20;
      id v22 = objc_loadWeakRetained((id *)&self->_sink);
      v24[0] = v12;
      v24[1] = v14;
      v24[2] = v16;
      v24[3] = 0;
      v24[4] = v18;
      v24[5] = v19;
      v24[6] = v17;
      char v25 = 1;
      uint64_t v27 = v21;
      [v22 driver:self didIssueUpdate:v24];

      break;
  }
LABEL_4:
}

- (void)_handlePressGesture:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  [v4 locationInView:v5];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  memset(v17, 0, sizeof(v17));
  uint64_t v10 = [v4 modifierFlags];

  int64_t v11 = [(_UIPointerInteractionHoverDriver *)self _currentButtonMask];
  [(_UIPointerInteractionHoverDriver *)self _currentTouchForce];
  uint64_t v13 = v12;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
  v15[0] = v7;
  v15[1] = v9;
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v10;
  v15[5] = v11;
  v15[6] = 0;
  char v16 = 1;
  uint64_t v18 = v13;
  [WeakRetained driver:self didIssueUpdate:v15];
}

- (int64_t)_currentButtonMask
{
  int64_t v3 = [(UIGestureRecognizer *)self->_pressGestureRecognizer buttonMask];
  if ([(UIGestureRecognizer *)self->_pressGestureRecognizer state] <= UIGestureRecognizerStateChanged) {
    return v3;
  }
  else {
    return 0;
  }
}

- (double)_currentTouchForce
{
  v2 = [(UIGestureRecognizer *)self->_hoverGestureRecognizer _allActiveTouches];
  int64_t v3 = [v2 anyObject];

  [v3 force];
  double v5 = v4;

  return v5;
}

- (BOOL)allowsUpdatesWhilePrimaryButtonIsPressed
{
  return 0;
}

- (void)_pointerStateDidChange:(id)a3
{
  id v9 = a3;
  double v4 = [v9 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = v9;
  if (isKindOfClass)
  {
    uint64_t v7 = [v9 object];
    uint64_t v8 = v7;
    if (self->_flags.receivedUpdateWhilePointerDisabled && [v7 pointerState] == 1) {
      [(_UIPointerInteractionHoverDriver *)self _updateHover:self->_hoverGestureRecognizer forced:0];
    }

    uint64_t v6 = v9;
  }
}

- (void)_installToView:(id)a3
{
  id v11 = a3;
  if (!self->_hoverGestureRecognizer)
  {
    double v4 = [(UIHoverGestureRecognizer *)[_UIPointerInteractionHoverGestureRecognizer alloc] initWithTarget:self action:sel__handleHoverGesture_];
    hoverGestureRecognizer = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = v4;

    [(UIGestureRecognizer *)self->_hoverGestureRecognizer setDelegate:self];
    -[UIHoverGestureRecognizer _setAllowedTouchTypes:](self->_hoverGestureRecognizer, (uint64_t)&unk_1ED3EFB18);
  }
  if (!self->_pressGestureRecognizer)
  {
    uint64_t v6 = [(UILongPressGestureRecognizer *)[_UIPointerInteractionPressGestureRecognizer alloc] initWithTarget:self action:sel__handlePressGesture_];
    pressGestureRecognizer = self->_pressGestureRecognizer;
    self->_pressGestureRecognizer = v6;

    [(UIGestureRecognizer *)self->_pressGestureRecognizer setDelegate:self];
    [(UILongPressGestureRecognizer *)self->_pressGestureRecognizer setButtonMaskRequired:3];
    [(UILongPressGestureRecognizer *)self->_pressGestureRecognizer setMinimumPressDuration:0.0];
    [(UIGestureRecognizer *)self->_pressGestureRecognizer setAllowedTouchTypes:&unk_1ED3EFB30];
    [(UIGestureRecognizer *)self->_pressGestureRecognizer setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)self->_pressGestureRecognizer setDelaysTouchesEnded:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
  [WeakRetained driver:self willAttachHoverGestureRecognizer:self->_hoverGestureRecognizer toView:v11];

  [v11 addGestureRecognizer:self->_hoverGestureRecognizer];
  [v11 addGestureRecognizer:self->_pressGestureRecognizer];
  if (!self->_flags.observing)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = +[_UIPointerArbiter sharedArbiter];
    [v9 addObserver:self selector:sel__pointerStateDidChange_ name:0x1ED14D680 object:v10];

    self->_flags.observing = 1;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

@end