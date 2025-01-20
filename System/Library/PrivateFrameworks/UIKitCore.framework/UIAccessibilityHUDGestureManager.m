@interface UIAccessibilityHUDGestureManager
- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIAccessibilityHUDGestureManager)initWithView:(id)a3 delegate:(id)a4;
- (UIGestureRecognizer)_recognizer;
- (UIView)view;
- (id)_bestViewControllerForView;
- (id)_subscribedConcurrentGestureRecognizers;
- (void)_backOff;
- (void)_clearButtonItemGestureSubscriptions;
- (void)_didToggleLargeContentViewer:(id)a3;
- (void)_dismissAccessibilityHUD;
- (void)_gestureRecognizerChanged:(id)a3;
- (void)_invalidate;
- (void)_openGate;
- (void)_setRecognizersEnabled:(BOOL)a3;
- (void)_showAccessibilityHUDItem:(id)a3;
- (void)dealloc;
@end

@implementation UIAccessibilityHUDGestureManager

- (UIAccessibilityHUDGestureManager)initWithView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UIAccessibilityHUDGestureManager;
  v8 = [(UIAccessibilityHUDGestureManager *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = [[_UIAccessibilityHUDLongPressGestureRecognizer alloc] initWithTarget:v9 action:sel__gestureRecognizerChanged_];
    recognizer = v9->_recognizer;
    v9->_recognizer = v10;

    [(UILongPressGestureRecognizer *)v9->_recognizer setMinimumPressDuration:0.15];
    [(UIGestureRecognizer *)v9->_recognizer setDelegate:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_view);
    [WeakRetained addGestureRecognizer:v9->_recognizer];

    uint64_t v13 = objc_opt_new();
    gateRecognizer = v9->_gateRecognizer;
    v9->_gateRecognizer = (_UIAccessibilityHUDGateGestureRecognizer *)v13;

    [(UIGestureRecognizer *)v9->_gateRecognizer setDelegate:v9];
    id v15 = objc_loadWeakRetained((id *)&v9->_view);
    [v15 addGestureRecognizer:v9->_gateRecognizer];

    [(UIAccessibilityHUDGestureManager *)v9 _setRecognizersEnabled:+[UILargeContentViewerInteraction isEnabled]];
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v9 selector:sel__didToggleLargeContentViewer_ name:@"UILargeContentViewerInteractionEnabledStatusDidChangeNotification" object:0];

    id v17 = objc_loadWeakRetained((id *)&v9->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id v18 = objc_loadWeakRetained((id *)&v9->_delegate);
      v9->_delegateDirectlyShowsHUD = objc_opt_respondsToSelector() & 1;
    }
    else
    {
      v9->_delegateDirectlyShowsHUD = 0;
    }

    id v19 = objc_loadWeakRetained((id *)&v9->_delegate);
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)&v9->_delegate);
      -[UIGestureRecognizer setCancelsTouchesInView:](v9->_recognizer, "setCancelsTouchesInView:", [v21 _accessibilityHUDGestureManagerCancelsTouchesInView:v9]);
    }
  }

  return v9;
}

- (void)_setRecognizersEnabled:(BOOL)a3
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v5 = [WeakRetained traitCollection];
    uint64_t v6 = [v5 _isLargeContentViewerEnabled];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(UIGestureRecognizer *)self->_recognizer setEnabled:v6];
  gateRecognizer = self->_gateRecognizer;
  [(UIGestureRecognizer *)gateRecognizer setEnabled:v6];
}

- (void)dealloc
{
  [(UIAccessibilityHUDGestureManager *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityHUDGestureManager;
  [(UIAccessibilityHUDGestureManager *)&v3 dealloc];
}

- (UIGestureRecognizer)_recognizer
{
  return (UIGestureRecognizer *)self->_recognizer;
}

- (void)_invalidate
{
  if (!self->_isInvalidated)
  {
    self->_isInvalidated = 1;
    [(UIAccessibilityHUDGestureManager *)self _clearButtonItemGestureSubscriptions];
    [(UIAccessibilityHUDGestureManager *)self _setRecognizersEnabled:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained removeGestureRecognizer:self->_recognizer];

    id v4 = objc_loadWeakRetained((id *)&self->_view);
    [v4 removeGestureRecognizer:self->_gateRecognizer];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"UILargeContentViewerInteractionEnabledStatusDidChangeNotification" object:0];
  }
}

- (id)_subscribedConcurrentGestureRecognizers
{
  subscribedConcurrentGestureRecognizers = self->_subscribedConcurrentGestureRecognizers;
  if (!subscribedConcurrentGestureRecognizers)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = self->_subscribedConcurrentGestureRecognizers;
    self->_subscribedConcurrentGestureRecognizers = v4;

    subscribedConcurrentGestureRecognizers = self->_subscribedConcurrentGestureRecognizers;
  }
  return subscribedConcurrentGestureRecognizers;
}

- (void)_clearButtonItemGestureSubscriptions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = [(UIAccessibilityHUDGestureManager *)self _subscribedConcurrentGestureRecognizers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) removeTarget:self action:sel__concurrentGestureRecognizerFired_];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8 = [(UIAccessibilityHUDGestureManager *)self _subscribedConcurrentGestureRecognizers];
  [v8 removeAllObjects];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4 = (_UIAccessibilityHUDLongPressGestureRecognizer *)a3;
  if (self->_recognizer == v4
    && (id v5 = objc_loadWeakRetained((id *)&self->_delegate),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = objc_loadWeakRetained((id *)&self->_view);
    [(UILongPressGestureRecognizer *)v4 locationInView:v8];
    char v9 = objc_msgSend(WeakRetained, "_accessibilityHUDGestureManager:shouldBeginAtPoint:", self);
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  char v6 = (_UIAccessibilityHUDLongPressGestureRecognizer *)a3;
  id v7 = a4;
  if ((_UIAccessibilityHUDLongPressGestureRecognizer *)self->_gateRecognizer != v6)
  {
    if (self->_recognizer != v6
      || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
          int v9 = [WeakRetained _accessibilityHUDGestureManager:self shouldRecognizeSimultaneouslyWithGestureRecognizer:v7], WeakRetained, !v9))
    {
      BOOL v15 = 0;
      goto LABEL_9;
    }
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0
      || (id v12 = objc_loadWeakRetained((id *)&self->_delegate),
          int v13 = [v12 _accessibilityHUDGestureManager:self shouldTerminateHUDGestureForOtherGestureRecognizer:v7], v12, v13))
    {
      [v7 addTarget:self action:sel__concurrentGestureRecognizerFired_];
      uint64_t v14 = [(UIAccessibilityHUDGestureManager *)self _subscribedConcurrentGestureRecognizers];
      [v14 addObject:v7];
    }
  }
  BOOL v15 = 1;
LABEL_9:

  return v15;
}

- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_recognizer == a3
    && (id v7 = objc_loadWeakRetained((id *)&self->_delegate),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = [WeakRetained _accessibilityHUDGestureManager:self canCancelGestureRecognizer:v6];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)_backOff
{
  if ([(UIGestureRecognizer *)self->_recognizer isEnabled])
  {
    [(UIAccessibilityHUDGestureManager *)self _setRecognizersEnabled:0];
    [(UIAccessibilityHUDGestureManager *)self _setRecognizersEnabled:1];
  }
}

- (void)_showAccessibilityHUDItem:(id)a3
{
  if (self->_delegateDirectlyShowsHUD)
  {
    id v5 = a3;
    id obj = objc_loadWeakRetained((id *)&self->_delegate);
    [obj _accessibilityHUDGestureManager:self showHUDItem:v5];
  }
  else
  {
    id v6 = a3;
    id obj = [(UIAccessibilityHUDGestureManager *)self _bestViewControllerForView];
    p_viewControllerDisplayingHUD = &self->_viewControllerDisplayingHUD;
    id WeakRetained = objc_loadWeakRetained((id *)p_viewControllerDisplayingHUD);

    int v9 = obj;
    if (obj != WeakRetained)
    {
      id v10 = objc_loadWeakRetained((id *)p_viewControllerDisplayingHUD);
      [v10 _dismissAccessibilityHUD];

      int v9 = obj;
    }
    objc_storeWeak((id *)p_viewControllerDisplayingHUD, v9);
    [obj _showAccessibilityHUDItem:v6];
  }
}

- (void)_dismissAccessibilityHUD
{
  if (self->_delegateDirectlyShowsHUD)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained _dismissAccessibilityHUDForGestureManager:self];
  }
  else
  {
    p_viewControllerDisplayingHUD = &self->_viewControllerDisplayingHUD;
    id v4 = objc_loadWeakRetained((id *)&self->_viewControllerDisplayingHUD);
    [v4 _dismissAccessibilityHUD];

    objc_storeWeak((id *)p_viewControllerDisplayingHUD, 0);
  }
}

- (void)_didToggleLargeContentViewer:(id)a3
{
  BOOL v4 = +[UILargeContentViewerInteraction isEnabled];
  [(UIAccessibilityHUDGestureManager *)self _setRecognizersEnabled:v4];
}

- (id)_bestViewControllerForView
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (id v6 = objc_loadWeakRetained((id *)p_delegate),
        [v6 _viewControllerForAccessibilityHUDGestureManager:self],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    +[UIAccessibilityHUDView preferredHUDSize];
    double v9 = v8;
    double v11 = v10;
    id v12 = objc_loadWeakRetained((id *)&self->_view);
    int v13 = [v12 _viewControllerForAncestor];

    uint64_t v14 = 0;
    if (v13)
    {
      double v15 = 3.40282347e38;
      while (1)
      {
        v16 = [v13 view];
        [v16 size];
        double v18 = v17;
        double v20 = v19;

        double v21 = v9 - v18 >= v11 - v20 ? v9 - v18 : v11 - v20;
        if (v21 < 0.0) {
          break;
        }
        if (v21 < v15)
        {
          id v22 = v13;

          uint64_t v14 = v22;
          double v15 = v21;
        }
        objc_super v23 = [v13 view];
        v24 = [v23 superview];
        uint64_t v25 = [v24 _viewControllerForAncestor];

        int v13 = (void *)v25;
        if (!v25) {
          goto LABEL_12;
        }
      }
      id v26 = v13;
      v27 = v26;
    }
    else
    {
LABEL_12:
      id v26 = v14;
      uint64_t v14 = v26;
      v27 = 0;
    }
    id v7 = v26;
  }
  return v7;
}

- (void)_openGate
{
}

- (void)_gestureRecognizerChanged:(id)a3
{
  p_view = &self->_view;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [v5 locationInView:WeakRetained];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [v5 state];
  switch(v11)
  {
    case 3:
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "_accessibilityHUDGestureManager:gestureLiftedAtPoint:", self, v8, v10);

      break;
    case 2:
      goto LABEL_5;
    case 1:
      [(UIAccessibilityHUDGestureManager *)self performSelector:sel__openGate withObject:0 afterDelay:1.0];
LABEL_5:
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "_accessibilityHUDGestureManager:HUDItemForPoint:", self, v8, v10);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        [(UIAccessibilityHUDGestureManager *)self _showAccessibilityHUDItem:v15];
      }
      else
      {
        [(UIAccessibilityHUDGestureManager *)self _dismissAccessibilityHUD];
      }
      return;
  }
  [(UIAccessibilityHUDGestureManager *)self _dismissAccessibilityHUD];
  [(UIAccessibilityHUDGestureManager *)self _clearButtonItemGestureSubscriptions];
  [(_UIRelationshipGestureRecognizer *)self->_gateRecognizer _fail];
  uint64_t v14 = (void *)MEMORY[0x1E4FBA8A8];
  [v14 cancelPreviousPerformRequestsWithTarget:self selector:sel__openGate object:0];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedConcurrentGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_gateRecognizer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_destroyWeak((id *)&self->_viewControllerDisplayingHUD);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end