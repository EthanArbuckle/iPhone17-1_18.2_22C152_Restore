@interface _UISearchControllerView
- (BOOL)_ensureSystemInputViewAboveSearchBarContainerView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5;
- (void)_ensureCarPlayLimitedUIIsOnTop;
- (void)_ensureContainerIsOnTop;
- (void)_ensurePortalViewIsOnTop;
- (void)_ensureViewOfClassIsOnTop:(Class)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)sendSubviewToBack:(id)a3;
- (void)set_ensureSystemInputViewAboveSearchBarContainerView:(BOOL)a3;
@end

@implementation _UISearchControllerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_UISearchControllerView;
  -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UISearchControllerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (-[UIView __viewDelegate]((id *)&self->super.super.super.isa),
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 _resultsControllerViewContainer],
        v7 = (_UISearchControllerView *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5 == v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)_ensureViewOfClassIsOnTop:(Class)a3
{
  v5 = [(UIView *)self subviews];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53___UISearchControllerView__ensureViewOfClassIsOnTop___block_invoke;
  v6[3] = &unk_1E5303EE8;
  v6[4] = self;
  v6[5] = a3;
  [v5 enumerateObjectsUsingBlock:v6];
}

- (void)_ensureContainerIsOnTop
{
  if (![(_UISearchControllerView *)self _ensureSystemInputViewAboveSearchBarContainerView])
  {
    uint64_t v3 = objc_opt_class();
    [(_UISearchControllerView *)self _ensureViewOfClassIsOnTop:v3];
  }
}

- (void)_ensureCarPlayLimitedUIIsOnTop
{
  uint64_t v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 3)
  {
    uint64_t v5 = objc_opt_class();
    [(_UISearchControllerView *)self _ensureViewOfClassIsOnTop:v5];
  }
}

- (void)_ensurePortalViewIsOnTop
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    uint64_t v3 = objc_opt_class();
    [(_UISearchControllerView *)self _ensureViewOfClassIsOnTop:v3];
  }
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_UISearchControllerView;
  [(UIView *)&v6 _addSubview:a3 positioned:a4 relativeTo:a5];
  [(_UISearchControllerView *)self _ensureContainerIsOnTop];
  [(_UISearchControllerView *)self _ensureCarPlayLimitedUIIsOnTop];
  [(_UISearchControllerView *)self _ensurePortalViewIsOnTop];
}

- (void)bringSubviewToFront:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISearchControllerView;
  [(UIView *)&v4 bringSubviewToFront:a3];
  [(_UISearchControllerView *)self _ensureContainerIsOnTop];
  [(_UISearchControllerView *)self _ensureCarPlayLimitedUIIsOnTop];
  [(_UISearchControllerView *)self _ensurePortalViewIsOnTop];
}

- (void)sendSubviewToBack:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISearchControllerView;
  [(UIView *)&v4 sendSubviewToBack:a3];
  [(_UISearchControllerView *)self _ensureContainerIsOnTop];
  [(_UISearchControllerView *)self _ensureCarPlayLimitedUIIsOnTop];
  [(_UISearchControllerView *)self _ensurePortalViewIsOnTop];
}

- (BOOL)_ensureSystemInputViewAboveSearchBarContainerView
{
  return self->__ensureSystemInputViewAboveSearchBarContainerView;
}

- (void)set_ensureSystemInputViewAboveSearchBarContainerView:(BOOL)a3
{
  self->__ensureSystemInputViewAboveSearchBarContainerView = a3;
}

@end