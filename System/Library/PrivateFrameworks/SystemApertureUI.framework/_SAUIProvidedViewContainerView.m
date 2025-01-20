@interface _SAUIProvidedViewContainerView
- (BOOL)portalsProvidedView;
- (SAUIElementView)elementView;
- (UIView)providedView;
- (_SAUIProvidedViewContainerView)initWithFrame:(CGRect)a3;
- (id)_contentView;
- (void)_createPortalView;
- (void)_recreatePortalViewIfNeeded;
- (void)_removePortalView;
- (void)layoutSubviews;
- (void)setElementView:(id)a3;
- (void)setProvidedView:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _SAUIProvidedViewContainerView

- (_SAUIProvidedViewContainerView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_SAUIProvidedViewContainerView;
  v3 = -[_SAUIProvidedViewContainerView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_lastSize = &v3->_lastSize;
    [(_SAUIProvidedViewContainerView *)v3 bounds];
    *(void *)&p_lastSize->width = v6;
    v4->_lastSize.height = v7;
  }
  return v4;
}

- (id)_contentView
{
  portalView = self->_portalView;
  if (!portalView) {
    portalView = (_SAUIPortalView *)self->_providedView;
  }
  return portalView;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)_SAUIProvidedViewContainerView;
  [(_SAUIProvidedViewContainerView *)&v14 layoutSubviews];
  [(_SAUIProvidedViewContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(_SAUIProvidedViewContainerView *)self _contentView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (self->_lastSize.width != v8 || self->_lastSize.height != v10)
  {
    self->_lastSize.width = v8;
    self->_lastSize.height = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    [WeakRetained _didLayoutResizedTransformView:self];
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  id v5 = [(_SAUIProvidedViewContainerView *)self window];
  v6.receiver = self;
  v6.super_class = (Class)_SAUIProvidedViewContainerView;
  [(_SAUIProvidedViewContainerView *)&v6 willMoveToWindow:v4];

  if (v5 != v4 && v4 && v5) {
    [(_SAUIProvidedViewContainerView *)self _recreatePortalViewIfNeeded];
  }
}

- (void)setProvidedView:(id)a3
{
  id v5 = (UIView *)a3;
  p_providedView = &self->_providedView;
  if (self->_providedView != v5)
  {
    double v8 = v5;
    if (objc_opt_respondsToSelector()) {
      int v7 = [(UIView *)v8 allowsReparentingByLayoutHost] ^ 1;
    }
    else {
      LOBYTE(v7) = 1;
    }
    self->_portalsProvidedView = v7;
    if ([(UIView *)*p_providedView isDescendantOfView:self]) {
      [(UIView *)*p_providedView removeFromSuperview];
    }
    [(_SAUIProvidedViewContainerView *)self _removePortalView];
    objc_storeStrong((id *)&self->_providedView, a3);
    id v5 = v8;
    if (v8)
    {
      if (self->_portalsProvidedView)
      {
        [(_SAUIProvidedViewContainerView *)self _createPortalView];
      }
      else
      {
        [(_SAUIProvidedViewContainerView *)self bounds];
        -[UIView setFrame:](v8, "setFrame:");
        [(_SAUIProvidedViewContainerView *)self addSubview:v8];
      }
      [(_SAUIProvidedViewContainerView *)self setNeedsLayout];
      id v5 = v8;
    }
  }
}

- (void)_recreatePortalViewIfNeeded
{
  if (self->_providedView && self->_portalsProvidedView)
  {
    [(_SAUIProvidedViewContainerView *)self _removePortalView];
    [(_SAUIProvidedViewContainerView *)self _createPortalView];
    [(_SAUIProvidedViewContainerView *)self setNeedsLayout];
  }
}

- (void)_createPortalView
{
  double v3 = [_SAUIPortalView alloc];
  [(_SAUIProvidedViewContainerView *)self bounds];
  id v4 = -[_SAUIPortalView initWithFrame:](v3, "initWithFrame:");
  portalView = self->_portalView;
  self->_portalView = v4;

  [(_SAUIPortalView *)self->_portalView setSourceView:self->_providedView];
  objc_super v6 = self->_portalView;
  [(_SAUIProvidedViewContainerView *)self addSubview:v6];
}

- (void)_removePortalView
{
  [(_SAUIPortalView *)self->_portalView removeFromSuperview];
  portalView = self->_portalView;
  self->_portalView = 0;
}

- (UIView)providedView
{
  return self->_providedView;
}

- (BOOL)portalsProvidedView
{
  return self->_portalsProvidedView;
}

- (SAUIElementView)elementView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
  return (SAUIElementView *)WeakRetained;
}

- (void)setElementView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementView);
  objc_storeStrong((id *)&self->_providedView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
}

@end