@interface _UISheetPresentationInteraction
- (UIPanGestureRecognizer)_panGestureRecognizer;
- (UIView)view;
- (_UISheetPresentationInteractionDelegate)_delegate;
- (void)_handlePan:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setPanGestureRecognizer:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UISheetPresentationInteraction

- (void)willMoveToView:(id)a3
{
  id v4 = a3;
  id v7 = [(_UISheetPresentationInteraction *)self view];

  v5 = v7;
  if (v7 && v7 != v4)
  {
    v6 = [(_UISheetPresentationInteraction *)self _panGestureRecognizer];
    [v7 removeGestureRecognizer:v6];

    v5 = v7;
  }
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  [(_UISheetPresentationInteraction *)self setView:v5];
  if (v5)
  {
    id v4 = [(_UISheetPresentationInteraction *)self _panGestureRecognizer];
    [v5 addGestureRecognizer:v4];
  }
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  panGestureRecognizer = self->__panGestureRecognizer;
  if (!panGestureRecognizer)
  {
    id v4 = objc_alloc_init(UIPanGestureRecognizer);
    id v5 = self->__panGestureRecognizer;
    self->__panGestureRecognizer = v4;

    [(UIPanGestureRecognizer *)self->__panGestureRecognizer _setCanPanHorizontally:0];
    [(UIGestureRecognizer *)self->__panGestureRecognizer addTarget:self action:sel__handlePan_];
    panGestureRecognizer = self->__panGestureRecognizer;
  }
  return panGestureRecognizer;
}

- (void)_setPanGestureRecognizer:(id)a3
{
  id v5 = (UIPanGestureRecognizer *)a3;
  p_panGestureRecognizer = &self->__panGestureRecognizer;
  if (self->__panGestureRecognizer != v5)
  {
    v9 = v5;
    id v7 = [(_UISheetPresentationInteraction *)self view];
    panGestureRecognizer = self->__panGestureRecognizer;
    if (panGestureRecognizer)
    {
      [(UIGestureRecognizer *)panGestureRecognizer removeTarget:self action:sel__handlePan_];
      [v7 removeGestureRecognizer:self->__panGestureRecognizer];
    }
    objc_storeStrong((id *)&self->__panGestureRecognizer, a3);
    if (*p_panGestureRecognizer)
    {
      [(UIGestureRecognizer *)*p_panGestureRecognizer addTarget:self action:sel__handlePan_];
      [v7 addGestureRecognizer:self->__panGestureRecognizer];
    }

    id v5 = v9;
  }
}

- (void)_handlePan:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    id v5 = [(_UISheetPresentationInteraction *)self _delegate];
    v6 = [v5 _sheetPresentationInteractionPresentingViewController:self];
    id v7 = [v5 _sheetPresentationInteractionPresentedViewController:self];
    v8 = [v7 presentationController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if (objc_opt_respondsToSelector()) {
        [v5 _sheetPresentationInteractionWillStartPresentationTransition:self];
      }
      [v9 _setPresentsWithGesture:1];
      v10 = [v9 _sheetInteraction];
      [v10 registerPanGestureRecognizer:v4];

      [v4 removeTarget:self action:sel__handlePan_];
      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __46___UISheetPresentationInteraction__handlePan___block_invoke;
      v17[3] = &unk_1E52DC308;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v9, "set_presentationTransitionWillBegin:", v17);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46___UISheetPresentationInteraction__handlePan___block_invoke_2;
      v12[3] = &unk_1E52DD450;
      id v11 = v9;
      id v13 = v11;
      id v14 = v4;
      v15 = self;
      id v16 = v5;
      [v11 _startInteractiveTransitionWithProgress:v6 fromViewController:v12 completion:0.0];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (_UISheetPresentationInteractionDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);
  return (_UISheetPresentationInteractionDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->__panGestureRecognizer, 0);
}

@end