@interface _UIInteractiveHighlightViewRecord
- (NSHashTable)interactiveHighlightEffects;
- (UIView)superview;
- (UIView)view;
- (UIVisualEffectView)effectView;
- (_UIPortalView)portalView;
- (void)setEffectView:(id)a3;
- (void)setInteractiveHighlightEffects:(id)a3;
- (void)setPortalView:(id)a3;
- (void)setSuperview:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _UIInteractiveHighlightViewRecord

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
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

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
}

- (NSHashTable)interactiveHighlightEffects
{
  return self->_interactiveHighlightEffects;
}

- (void)setInteractiveHighlightEffects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveHighlightEffects, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_destroyWeak((id *)&self->_superview);
  objc_destroyWeak((id *)&self->_view);
}

@end