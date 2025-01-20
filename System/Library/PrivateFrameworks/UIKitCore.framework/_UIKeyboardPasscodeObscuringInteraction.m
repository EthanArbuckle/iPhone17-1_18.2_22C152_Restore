@interface _UIKeyboardPasscodeObscuringInteraction
- (UIPointerInteraction)pointerInteraction;
- (UIView)view;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)didMoveToView:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIKeyboardPasscodeObscuringInteraction

- (UIPointerInteraction)pointerInteraction
{
  pointerInteraction = self->_pointerInteraction;
  if (!pointerInteraction)
  {
    v4 = [[UIPointerInteraction alloc] initWithDelegate:self];
    v5 = self->_pointerInteraction;
    self->_pointerInteraction = v4;

    pointerInteraction = self->_pointerInteraction;
  }
  return pointerInteraction;
}

- (void)willMoveToView:(id)a3
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v6 = [WeakRetained layer];
  [v6 setDisableUpdateMask:0];

  if (self->_pointerInteraction)
  {
    id v7 = objc_loadWeakRetained((id *)p_view);
    [v7 removeInteraction:self->_pointerInteraction];
  }
  objc_storeWeak((id *)p_view, 0);
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    id v7 = [WeakRetained layer];
    [v7 setDisableUpdateMask:18];

    id v8 = objc_loadWeakRetained((id *)p_view);
    v9 = [(_UIKeyboardPasscodeObscuringInteraction *)self pointerInteraction];
    [v8 addInteraction:v9];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  id v7 = [a3 view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v6 identifier];

  v17 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v4 = +[UIPointerStyle systemPointerStyle];
  objc_msgSend(v4, "set_suppressesMirroring:", 1);
  return v4;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end