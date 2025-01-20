@interface SBHIconStyleLabelHidingView
- (BOOL)shouldUseLargeIcons;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (SBHIconStyleLabelHidingView)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_layoutSegmentedControl;
- (void)_setupViewsForTarget:(id)a3 action:(SEL)a4;
- (void)layoutSubviews;
- (void)setShouldUseLargeIcons:(BOOL)a3;
- (void)sizeToFit;
@end

@implementation SBHIconStyleLabelHidingView

- (SBHIconStyleLabelHidingView)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHIconStyleLabelHidingView;
  v7 = -[SBHIconStyleLabelHidingView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_animationCount = 0;
    [(SBHIconStyleLabelHidingView *)v7 _setupViewsForTarget:v6 action:a4];
  }

  return v8;
}

- (void)sizeToFit
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  -[UISegmentedControl systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_segmentedControl, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setShouldUseLargeIcons:(BOOL)a3
{
  if (self->_shouldUseLargeIcons != a3)
  {
    [(SBHIconStyleLabelHidingView *)self willChangeValueForKey:@"shouldUseLargeIcons"];
    self->_shouldUseLargeIcons = a3;
    [(SBHIconStyleLabelHidingView *)self didChangeValueForKey:@"shouldUseLargeIcons"];
    [(SBHIconStyleLabelHidingView *)self _layoutSegmentedControl];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconStyleLabelHidingView;
  [(SBHIconStyleLabelHidingView *)&v3 layoutSubviews];
  [(SBHIconStyleLabelHidingView *)self _layoutSegmentedControl];
}

- (CGSize)intrinsicContentSize
{
  [(UISegmentedControl *)self->_segmentedControl intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_layoutSegmentedControl
{
  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:[(SBHIconStyleLabelHidingView *)self shouldUseLargeIcons]];
  segmentedControl = self->_segmentedControl;
  [(SBHIconStyleLabelHidingView *)self bounds];
  -[UISegmentedControl setFrame:](segmentedControl, "setFrame:");
}

- (void)_setupViewsForTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  if (!self->_segmentedControl)
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E4FB13F0];
    v8 = SBHBundle();
    v9 = [v8 localizedStringForKey:@"LABEL_HIDING_VIEW_SMALL" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__SBHIconStyleLabelHidingView__setupViewsForTarget_action___block_invoke;
    v21[3] = &unk_1E6AAEEC0;
    objc_copyWeak(&v22, &location);
    objc_super v10 = [v7 actionWithTitle:v9 image:0 identifier:0 handler:v21];

    v11 = (void *)MEMORY[0x1E4FB13F0];
    v12 = SBHBundle();
    v13 = [v12 localizedStringForKey:@"LABEL_HIDING_VIEW_LARGE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__SBHIconStyleLabelHidingView__setupViewsForTarget_action___block_invoke_2;
    v19[3] = &unk_1E6AAEEC0;
    objc_copyWeak(&v20, &location);
    v14 = [v11 actionWithTitle:v13 image:0 identifier:0 handler:v19];

    v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v10, v14, 0);
    v16 = [_SBHIconStyleLabelHidingSegmentedControl alloc];
    v17 = -[_SBHIconStyleLabelHidingSegmentedControl initWithFrame:actions:](v16, "initWithFrame:actions:", v15, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    segmentedControl = self->_segmentedControl;
    self->_segmentedControl = v17;

    [(UISegmentedControl *)self->_segmentedControl sizeToFit];
    [(UISegmentedControl *)self->_segmentedControl addTarget:v6 action:a4 forControlEvents:4096];
    [(SBHIconStyleLabelHidingView *)self addSubview:self->_segmentedControl];
    [(UISegmentedControl *)self->_segmentedControl bounds];
    -[SBHIconStyleLabelHidingView setFrame:](self, "setFrame:");

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __59__SBHIconStyleLabelHidingView__setupViewsForTarget_action___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateShouldLabelsBeHidden:0];
}

void __59__SBHIconStyleLabelHidingView__setupViewsForTarget_action___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateShouldLabelsBeHidden:1];
}

- (BOOL)shouldUseLargeIcons
{
  return self->_shouldUseLargeIcons;
}

- (void).cxx_destruct
{
}

@end