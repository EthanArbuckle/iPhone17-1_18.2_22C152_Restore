@interface _UIPointerInteractionPencilHoverDriver
- (BOOL)allowsUpdatesWhilePrimaryButtonIsPressed;
- (BOOL)isActive;
- (CAPoint3D)locationInView:(id)a3;
- (UIView)view;
- (_UIPointerInteractionPencilHoverDriver)initWithSink:(id)a3;
- (int64_t)type;
- (void)_handleHoverGesture:(id)a3;
- (void)_installToView:(id)a3;
- (void)_uninstallFromView:(id)a3;
- (void)_updateHover:(id)a3 forced:(BOOL)a4;
- (void)invalidate;
- (void)setView:(id)a3;
@end

@implementation _UIPointerInteractionPencilHoverDriver

- (void)setView:(id)a3
{
  p_view = &self->_view;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [(_UIPointerInteractionPencilHoverDriver *)self _uninstallFromView:WeakRetained];

  id v6 = objc_storeWeak((id *)p_view, obj);
  id v7 = v6;
  if (obj)
  {
    id v8 = objc_loadWeakRetained((id *)p_view);
    [(_UIPointerInteractionPencilHoverDriver *)self _installToView:v8];
  }
}

- (void)_uninstallFromView:(id)a3
{
}

- (_UIPointerInteractionPencilHoverDriver)initWithSink:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPointerInteractionPencilHoverDriver;
  v5 = [(_UIPointerInteractionPencilHoverDriver *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_sink, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
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
  v3[2] = __52___UIPointerInteractionPencilHoverDriver_invalidate__block_invoke;
  v3[3] = &unk_1E52DC308;
  objc_copyWeak(&v4, &location);
  [v2 _performBlockAfterCATransactionCommits:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (int64_t)type
{
  return 1;
}

- (BOOL)allowsUpdatesWhilePrimaryButtonIsPressed
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
    [v6 handleFailureInMethod:a2 object:self file:@"_UIPointerInteractionPencilHoverDriver.m" lineNumber:93 description:@"Received updates from an unknown hover gesture recognizer."];
  }
  self->_flags.invalid = 0;
  -[_UIPointerInteractionPencilHoverDriver _updateHover:forced:](self, "_updateHover:forced:");
}

- (void)_updateHover:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 state] == 3 || objc_msgSend(v6, "state") == 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
    [WeakRetained driverDidExit:self];
  }
  else if ([v6 state] >= 1)
  {
    objc_super v8 = [v6 view];
    [v6 _location3DInView:v8];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;

    BOOL v15 = v4;
    memset(v22, 0, sizeof(v22));
    [v6 _maximumHoverHeight];
    uint64_t v17 = v16;
    uint64_t v18 = [v6 modifierFlags];
    id v19 = objc_loadWeakRetained((id *)&self->_sink);
    v20[0] = v10;
    v20[1] = v12;
    v20[2] = v14;
    v20[3] = v17;
    v20[4] = v18;
    v20[5] = 0;
    v20[6] = v15;
    char v21 = 0;
    uint64_t v23 = 0;
    [v19 driver:self didIssueUpdate:v20];
  }
}

- (void)_installToView:(id)a3
{
  id v7 = a3;
  if (!self->_hoverGestureRecognizer)
  {
    BOOL v4 = [(UIHoverGestureRecognizer *)[_UIPointerInteractionHoverGestureRecognizer alloc] initWithTarget:self action:sel__handleHoverGesture_];
    hoverGestureRecognizer = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = v4;

    -[UIHoverGestureRecognizer _setAllowedTouchTypes:](self->_hoverGestureRecognizer, (uint64_t)&unk_1ED3F0EE0);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sink);
  [WeakRetained driver:self willAttachHoverGestureRecognizer:self->_hoverGestureRecognizer toView:v7];

  [v7 addGestureRecognizer:self->_hoverGestureRecognizer];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

@end