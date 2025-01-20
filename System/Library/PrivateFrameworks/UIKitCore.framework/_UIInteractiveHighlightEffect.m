@interface _UIInteractiveHighlightEffect
- (UIEdgeInsets)preferredContentInsets;
- (UIView)superview;
- (UIView)view;
- (UIVisualEffectView)effectView;
- (_UIInteractiveHighlightEnvironment)environment;
- (_UIPortalView)portalView;
- (void)applyBackgroundEffectWithMagnitude:(double)a3 interactive:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)finalizeEffect;
- (void)setEffectView:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setPortalView:(id)a3;
- (void)setPreferredContentInsets:(UIEdgeInsets)a3;
- (void)setSuperview:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _UIInteractiveHighlightEffect

- (void)applyBackgroundEffectWithMagnitude:(double)a3 interactive:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (v5) {
    -[_UIInteractiveHighlightEnvironment applyContentInsets:](self->_environment, "applyContentInsets:", self->_preferredContentInsets.top, self->_preferredContentInsets.left, self->_preferredContentInsets.bottom, self->_preferredContentInsets.right);
  }
  [(_UIInteractiveHighlightEnvironment *)self->_environment applyBackgroundEffectWithMagnitude:v5 interactive:v8 completion:a3];
}

- (void)finalizeEffect
{
}

- (void)dealloc
{
  [(_UIInteractiveHighlightEffect *)self finalizeEffect];
  v3.receiver = self;
  v3.super_class = (Class)_UIInteractiveHighlightEffect;
  [(_UIInteractiveHighlightEffect *)&v3 dealloc];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_effectView);
  return (UIVisualEffectView *)WeakRetained;
}

- (void)setEffectView:(id)a3
{
}

- (UIEdgeInsets)preferredContentInsets
{
  double top = self->_preferredContentInsets.top;
  double left = self->_preferredContentInsets.left;
  double bottom = self->_preferredContentInsets.bottom;
  double right = self->_preferredContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPreferredContentInsets:(UIEdgeInsets)a3
{
  self->_preferredContentInsets = a3;
}

- (_UIInteractiveHighlightEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (UIView)superview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superview);
  return (UIView *)WeakRetained;
}

- (void)setSuperview:(id)a3
{
}

- (_UIPortalView)portalView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_portalView);
  return (_UIPortalView *)WeakRetained;
}

- (void)setPortalView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_portalView);
  objc_destroyWeak((id *)&self->_superview);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_effectView);
  objc_destroyWeak((id *)&self->_view);
}

@end