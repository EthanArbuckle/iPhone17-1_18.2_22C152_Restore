@interface TabOverviewTargetedPreviewContainer
- (TabOverviewItem)tabOverviewItem;
- (TabOverviewTargetedPreviewContainer)initWithFrame:(CGRect)a3;
- (double)initialItemWidth;
- (id)didRemoveLastSubviewBlock;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_didRemoveSubview:(id)a3;
- (void)setDidRemoveLastSubviewBlock:(id)a3;
- (void)setInitialItemWidth:(double)a3;
- (void)setTabOverviewItem:(id)a3;
@end

@implementation TabOverviewTargetedPreviewContainer

- (TabOverviewTargetedPreviewContainer)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TabOverviewTargetedPreviewContainer;
  v3 = -[TabOverviewTargetedPreviewContainer initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v7 = [(TabOverviewTargetedPreviewContainer *)v3 layer];
    objc_msgSend(v7, "setAnchorPoint:", v5, v6);

    v8 = v4;
  }

  return v4;
}

- (void)_didRemoveSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TabOverviewTargetedPreviewContainer;
  [(TabOverviewTargetedPreviewContainer *)&v6 _didRemoveSubview:a3];
  v4 = [(TabOverviewTargetedPreviewContainer *)self subviews];
  if ([v4 count])
  {
  }
  else
  {
    id didRemoveLastSubviewBlock = self->_didRemoveLastSubviewBlock;

    if (didRemoveLastSubviewBlock) {
      (*((void (**)(void))self->_didRemoveLastSubviewBlock + 2))();
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (TabOverviewItem)tabOverviewItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabOverviewItem);
  return (TabOverviewItem *)WeakRetained;
}

- (void)setTabOverviewItem:(id)a3
{
}

- (double)initialItemWidth
{
  return self->_initialItemWidth;
}

- (void)setInitialItemWidth:(double)a3
{
  self->_initialItemWidth = a3;
}

- (id)didRemoveLastSubviewBlock
{
  return self->_didRemoveLastSubviewBlock;
}

- (void)setDidRemoveLastSubviewBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didRemoveLastSubviewBlock, 0);
  objc_destroyWeak((id *)&self->_tabOverviewItem);
}

@end