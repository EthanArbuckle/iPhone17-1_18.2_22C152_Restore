@interface _PUProgressIndicatorTileView
- (BOOL)showingErrorProgressView;
- (UIView)extraHittableSubview;
- (_PUProgressIndicatorTileViewDelegate)traitCollectionDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setExtraHittableSubview:(id)a3;
- (void)setShowingErrorProgressView:(BOOL)a3;
- (void)setTraitCollectionDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _PUProgressIndicatorTileView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_traitCollectionDelegate);
  objc_destroyWeak((id *)&self->_extraHittableSubview);
}

- (_PUProgressIndicatorTileViewDelegate)traitCollectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitCollectionDelegate);
  return (_PUProgressIndicatorTileViewDelegate *)WeakRetained;
}

- (void)setShowingErrorProgressView:(BOOL)a3
{
  self->_showingErrorProgressView = a3;
}

- (BOOL)showingErrorProgressView
{
  return self->_showingErrorProgressView;
}

- (void)setExtraHittableSubview:(id)a3
{
}

- (UIView)extraHittableSubview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extraHittableSubview);
  return (UIView *)WeakRetained;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PUProgressIndicatorTileView;
  [(_PUProgressIndicatorTileView *)&v5 traitCollectionDidChange:a3];
  if (self->_delegateFlags.respondsToDidChangeTraitCollection)
  {
    v4 = [(_PUProgressIndicatorTileView *)self traitCollectionDelegate];
    [v4 viewTraitCollectionDidChange:self];
  }
}

- (void)setTraitCollectionDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitCollectionDelegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_traitCollectionDelegate, obj);
    self->_delegateFlags.respondsToDidChangeTraitCollection = objc_opt_respondsToSelector() & 1;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = +[PUOneUpSettings sharedInstance];
  int v9 = [v8 allowsVisualIntelligenceV2];

  if (v9)
  {
    if ([(_PUProgressIndicatorTileView *)self showingErrorProgressView])
    {
      v16.receiver = self;
      v16.super_class = (Class)_PUProgressIndicatorTileView;
      v10 = -[_PUProgressIndicatorTileView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_PUProgressIndicatorTileView;
    v10 = -[_PUProgressIndicatorTileView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
    v11 = [(_PUProgressIndicatorTileView *)self extraHittableSubview];
    v12 = v11;
    if (!v10)
    {
      v13 = [v11 superview];

      if (v13 == self)
      {
        objc_msgSend(v12, "convertPoint:fromView:", self, x, y);
        v10 = objc_msgSend(v12, "hitTest:withEvent:", v7);
      }
      else
      {
        v10 = 0;
      }
    }
  }
  return v10;
}

@end