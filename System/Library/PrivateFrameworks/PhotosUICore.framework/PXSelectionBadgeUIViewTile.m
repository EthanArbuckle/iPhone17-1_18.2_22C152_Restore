@interface PXSelectionBadgeUIViewTile
+ (CGSize)preferredSize;
- (BOOL)_selected;
- (PXSelectionBadgeUIViewTile)initWithFrame:(CGRect)a3;
- (void)_invalidate;
- (void)_setSelected:(BOOL)a3;
- (void)_showSelectedView;
- (void)_showUnselectedView;
- (void)_updateBadgeViewIfNeeded;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)prepareForReuse;
@end

@implementation PXSelectionBadgeUIViewTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedView, 0);
  objc_storeStrong((id *)&self->_selectedView, 0);
}

- (BOOL)_selected
{
  return self->__selected;
}

- (void)_showUnselectedView
{
  selectedView = self->_selectedView;
  if (selectedView) {
    [(UIView *)selectedView setHidden:1];
  }
  unselectedView = self->_unselectedView;
  if (!unselectedView)
  {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "px_circularGlyphViewWithName:backgroundColor:", @"circle", 0);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_unselectedView;
    self->_unselectedView = v5;

    v7 = [(PXSelectionBadgeUIViewTile *)self view];
    [v7 addSubview:self->_unselectedView];

    unselectedView = self->_unselectedView;
  }
  [(UIView *)unselectedView setHidden:0];
}

- (void)_showSelectedView
{
  unselectedView = self->_unselectedView;
  if (unselectedView) {
    [(UIView *)unselectedView setHidden:1];
  }
  selectedView = self->_selectedView;
  if (!selectedView)
  {
    v5 = (void *)MEMORY[0x1E4FB1EB0];
    v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
    objc_msgSend(v5, "px_circularGlyphViewWithName:prefersMulticolor:backgroundColor:", @"checkmark.circle", 0, v6);
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_selectedView;
    self->_selectedView = v7;

    v9 = [(PXSelectionBadgeUIViewTile *)self view];
    [v9 addSubview:self->_selectedView];

    selectedView = self->_selectedView;
  }
  [(UIView *)selectedView setHidden:0];
}

- (void)_updateBadgeViewIfNeeded
{
  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    if ([(PXSelectionBadgeUIViewTile *)self _selected])
    {
      [(PXSelectionBadgeUIViewTile *)self _showSelectedView];
    }
    else
    {
      [(PXSelectionBadgeUIViewTile *)self _showUnselectedView];
    }
  }
}

- (void)_invalidate
{
  self->_needsUpdate = 1;
}

- (void)_setSelected:(BOOL)a3
{
  if (self->__selected != a3)
  {
    self->__selected = a3;
    [(PXSelectionBadgeUIViewTile *)self _invalidate];
  }
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[PXSelectionBadgeUIViewTile _setSelected:](self, "_setSelected:", objc_msgSend(a4, "isSelected", a3));
  [(PXSelectionBadgeUIViewTile *)self _updateBadgeViewIfNeeded];
}

- (void)prepareForReuse
{
  v3 = [(PXSelectionBadgeUIViewTile *)self view];
  [v3 setHidden:0];

  [(PXSelectionBadgeUIViewTile *)self _invalidate];
}

- (void)becomeReusable
{
  id v2 = [(PXSelectionBadgeUIViewTile *)self view];
  [v2 setHidden:1];
}

- (PXSelectionBadgeUIViewTile)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXSelectionBadgeUIViewTile;
  v3 = -[PXSelectionBadgeUIViewTile initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PXSelectionBadgeUIViewTile *)v3 setUserInteractionEnabled:0];
    [(PXSelectionBadgeUIViewTile *)v4 _invalidate];
  }
  return v4;
}

+ (CGSize)preferredSize
{
  if (preferredSize_onceToken_184175 != -1) {
    dispatch_once(&preferredSize_onceToken_184175, &__block_literal_global_184176);
  }
  double v2 = *(double *)&preferredSize_contentSize_0;
  double v3 = *(double *)&preferredSize_contentSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __43__PXSelectionBadgeUIViewTile_preferredSize__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4FB1EB0], "px_circularGlyphViewWithName:backgroundColor:", @"circle", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 frame];
  preferredSize_contentSize_0 = v0;
  preferredSize_contentSize_1 = v1;
}

@end