@interface UIEditingOverlayGestureView
- (BOOL)_isTransparentFocusRegion;
- (UIWindow)previousWindow;
- (id)_gestureRecognizersForEvent:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)textEffectsVisibilityLevel;
- (void)didMoveToWindow;
- (void)setPreviousWindow:(id)a3;
@end

@implementation UIEditingOverlayGestureView

- (id)_gestureRecognizersForEvent:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UIView *)self window];
  int v6 = [v5 isMemberOfClass:objc_opt_class()];

  if (!v6)
  {
LABEL_11:
    v15 = [(UIView *)self window];
    v16 = [v15 windowScene];
    unint64_t v17 = [v16 activationState];

    if (v17 > 1)
    {
      v13 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_26;
    }
    v13 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v9 = [(UIView *)self gestureRecognizers];
    uint64_t v18 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (!v18) {
      goto LABEL_24;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
LABEL_14:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v28 != v20) {
        objc_enumerationMutation(v9);
      }
      v22 = *(void **)(*((void *)&v27 + 1) + 8 * v21);
      v23 = [v22 _activeEvents];
      if ([v23 count])
      {
        v24 = [v22 _activeEvents];
        int v25 = [v24 containsObject:v4];

        if (!v25) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      [v13 addObject:v22];
LABEL_22:
      if (v19 == ++v21)
      {
        uint64_t v19 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (!v19) {
          goto LABEL_24;
        }
        goto LABEL_14;
      }
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v7 = [(UIView *)self window];
  v8 = [v7 windowScene];
  v9 = [v8 windows];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v32;
  v13 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_4:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v32 != v12) {
      objc_enumerationMutation(v9);
    }
    if ([*(id *)(*((void *)&v31 + 1) + 8 * v14) isMemberOfClass:objc_opt_class()]) {
      break;
    }
    if (v11 == ++v14)
    {
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (!v11)
      {
LABEL_10:

        goto LABEL_11;
      }
      goto LABEL_4;
    }
  }
LABEL_24:

LABEL_26:
  return v13;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = +[UIKeyShortcutHUDService _existingHUDService];
  [v8 handleTouchEvent:v7];

  v12.receiver = self;
  v12.super_class = (Class)UIEditingOverlayGestureView;
  -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v9 = (UIEditingOverlayGestureView *)objc_claimAutoreleasedReturnValue();

  if (v9 == self) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }

  return v10;
}

- (int)textEffectsVisibilityLevel
{
  return 225;
}

- (void)didMoveToWindow
{
  v3 = [(UIEditingOverlayGestureView *)self previousWindow];

  if (v3)
  {
    id v4 = (void *)UIApp;
    v5 = [(UIEditingOverlayGestureView *)self previousWindow];
    int v6 = (id *)(id)[v4 _touchesEventForWindow:v5];

    if (v6) {
      [v6[8] removeObject:self];
    }
    if (_os_feature_enabled_impl())
    {
      id v7 = (void *)UIApp;
      v8 = [(UIEditingOverlayGestureView *)self previousWindow];
      v9 = (id *)(id)[v7 _hoverEventForWindow:v8];

      if (v9) {
        [v9[8] removeObject:self];
      }
    }
  }
  uint64_t v10 = [(UIView *)self window];

  if (v10)
  {
    uint64_t v11 = (void *)UIApp;
    objc_super v12 = [(UIView *)self window];
    id v13 = (id)[v11 _touchesEventForWindow:v12];

    -[UIEvent _addEventObserver:]((uint64_t)v13, self);
    if (_os_feature_enabled_impl())
    {
      uint64_t v14 = (void *)UIApp;
      v15 = [(UIView *)self window];
      id v16 = (id)[v14 _hoverEventForWindow:v15];

      -[UIEvent _addEventObserver:]((uint64_t)v16, self);
    }
  }
  id v17 = [(UIView *)self window];
  [(UIEditingOverlayGestureView *)self setPreviousWindow:v17];
}

- (void)setPreviousWindow:(id)a3
{
}

- (UIWindow)previousWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousWindow);
  return (UIWindow *)WeakRetained;
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

- (void).cxx_destruct
{
}

@end