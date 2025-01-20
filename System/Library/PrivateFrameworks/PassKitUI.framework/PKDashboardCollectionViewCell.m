@interface PKDashboardCollectionViewCell
+ (double)defaultHorizontalInset;
+ (id)defaultBackgroundColor;
- (BOOL)showsBottomSeparator;
- (BOOL)wantsCustomAppearance;
- (BOOL)wantsDefaultHighlightBehavior;
- (PKDashboardCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)_bottomSeparatorAlpha;
- (double)horizontalInset;
- (unint64_t)maskType;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBottomSeparatorVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setHorizontalInset:(double)a3;
- (void)setMaskType:(unint64_t)a3;
- (void)setShowsBottomSeparator:(BOOL)a3;
- (void)setWantsCustomAppearance:(BOOL)a3;
- (void)setWantsDefaultHighlightBehavior:(BOOL)a3;
- (void)updateMask;
@end

@implementation PKDashboardCollectionViewCell

+ (double)defaultHorizontalInset
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 16.0;
  double v4 = 20.0;
  if (v2 >= 8) {
    double v5 = 20.0;
  }
  else {
    double v5 = 16.0;
  }
  if (v2 != 4) {
    double v4 = 16.0;
  }
  if (v2 > 4) {
    double v4 = v5;
  }
  if (v2) {
    return v4;
  }
  return result;
}

+ (id)defaultBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
}

- (PKDashboardCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKDashboardCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(PKDashboardCollectionViewCell *)v3 setBackgroundView:v4];

    double v5 = [(PKDashboardCollectionViewCell *)v3 backgroundView];
    v6 = [(id)objc_opt_class() defaultBackgroundColor];
    [v5 setBackgroundColor:v6];

    v3->_bottomSeparatorVisible = 1;
    [(PKDashboardCollectionViewCell *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85420]];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKDashboardCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v13 layoutSubviews];
  v3 = [(UIView *)self->_separatorView superview];

  if (v3)
  {
    id v4 = [(PKDashboardCollectionViewCell *)self contentView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    -[UIView setFrame:](self->_separatorView, "setFrame:", v6 + 14.0, v8 + v12 - PKUIPixelLength(), v10 + -14.0);
  }
  [(PKDashboardCollectionViewCell *)self updateMask];
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v7 prepareForReuse];
  self->_bottomSeparatorVisible = 1;
  separatorView = self->_separatorView;
  if (separatorView)
  {
    [(PKDashboardCollectionViewCell *)self _bottomSeparatorAlpha];
    -[UIView setAlpha:](separatorView, "setAlpha:");
  }
  BOOL wantsCustomAppearance = self->_wantsCustomAppearance;
  double v5 = [(PKDashboardCollectionViewCell *)self backgroundView];
  if (wantsCustomAppearance) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  double v6 = [(id)objc_opt_class() defaultBackgroundColor];
  }
  [v5 setBackgroundColor:v6];
}

- (void)setHorizontalInset:(double)a3
{
  self->_customHorizontalInset = 1;
  self->_horizontalInset = a3;
}

- (double)horizontalInset
{
  if (self->_customHorizontalInset) {
    return self->_horizontalInset;
  }
  v3 = objc_opt_class();

  [v3 defaultHorizontalInset];
  return result;
}

- (unint64_t)maskType
{
  return self->_maskType;
}

- (void)setMaskType:(unint64_t)a3
{
  if (self->_maskType != a3)
  {
    self->_maskType = a3;
    [(PKDashboardCollectionViewCell *)self updateMask];
  }
}

- (void)updateMask
{
  [(PKDashboardCollectionViewCell *)self bounds];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if (self->_previousMaskType != self->_maskType
    || (v13.origin.x = v3,
        v13.origin.y = v4,
        v13.size.width = v5,
        v13.size.height = v6,
        !CGRectEqualToRect(self->_previousMaskBounds, v13)))
  {
    self->_previousMaskBounds.origin.x = v7;
    self->_previousMaskBounds.origin.y = v8;
    self->_previousMaskBounds.size.width = v9;
    self->_previousMaskBounds.size.height = v10;
    self->_previousMaskType = self->_maskType;
    unint64_t maskType = self->_maskType;
    [(UIView *)self pkui_setMaskType:maskType];
  }
}

- (void)setShowsBottomSeparator:(BOOL)a3
{
  if (((!self->_showsBottomSeparator ^ a3) & 1) == 0)
  {
    self->_showsBottomSeparator = a3;
    separatorView = self->_separatorView;
    if (a3)
    {
      if (!separatorView)
      {
        CGFloat v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        CGFloat v6 = self->_separatorView;
        self->_separatorView = v5;

        CGFloat v7 = self->_separatorView;
        CGFloat v8 = [MEMORY[0x1E4FB1618] separatorColor];
        [(UIView *)v7 setBackgroundColor:v8];

        [(UIView *)self->_separatorView setAutoresizingMask:2];
        CGFloat v9 = self->_separatorView;
        [(PKDashboardCollectionViewCell *)self _bottomSeparatorAlpha];
        -[UIView setAlpha:](v9, "setAlpha:");
      }
      CGFloat v10 = [(PKDashboardCollectionViewCell *)self contentView];
      [v10 addSubview:self->_separatorView];

      [(PKDashboardCollectionViewCell *)self setNeedsLayout];
    }
    else
    {
      [(UIView *)separatorView removeFromSuperview];
    }
  }
}

- (void)setBottomSeparatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_bottomSeparatorVisible ^ a3) & 1) == 0)
  {
    self->_bottomSeparatorVisible = a3;
    separatorView = self->_separatorView;
    if (separatorView)
    {
      if (a4)
      {
        CGFloat v6 = [(UIView *)separatorView superview];

        [(PKDashboardCollectionViewCell *)self _bottomSeparatorAlpha];
        if (v6)
        {
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __68__PKDashboardCollectionViewCell_setBottomSeparatorVisible_animated___block_invoke;
          v9[3] = &unk_1E59CB460;
          v9[4] = self;
          v9[5] = v7;
          [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v9 completion:0];
          return;
        }
      }
      else
      {
        [(PKDashboardCollectionViewCell *)self _bottomSeparatorAlpha];
      }
      CGFloat v8 = self->_separatorView;
      -[UIView setAlpha:](v8, "setAlpha:");
    }
  }
}

uint64_t __68__PKDashboardCollectionViewCell_setBottomSeparatorVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 640) setAlpha:*(double *)(a1 + 40)];
}

- (double)_bottomSeparatorAlpha
{
  LOBYTE(v2) = self->_bottomSeparatorVisible;
  return (double)v2;
}

- (void)setWantsCustomAppearance:(BOOL)a3
{
  if (((!self->_wantsCustomAppearance ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_BOOL wantsCustomAppearance = a3;
    id v5 = [(PKDashboardCollectionViewCell *)self backgroundView];
    if (v3) {
      [MEMORY[0x1E4FB1618] clearColor];
    }
    else {
    CGFloat v4 = [(id)objc_opt_class() defaultBackgroundColor];
    }
    [v5 setBackgroundColor:v4];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDashboardCollectionViewCell;
  -[PKDashboardCollectionViewCell setHighlighted:](&v11, sel_setHighlighted_);
  if (!self->_wantsCustomAppearance || self->_wantsDefaultHighlightBehavior)
  {
    id v5 = (void *)MEMORY[0x1E4FB1EB0];
    if (v3)
    {
      CGFloat v6 = v10;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      uint64_t v7 = __48__PKDashboardCollectionViewCell_setHighlighted___block_invoke;
    }
    else
    {
      CGFloat v6 = &v8;
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      uint64_t v7 = __48__PKDashboardCollectionViewCell_setHighlighted___block_invoke_2;
    }
    v6[2] = (uint64_t)v7;
    v6[3] = (uint64_t)&unk_1E59CA7D0;
    v6[4] = (uint64_t)self;
    [v5 _animateUsingDefaultTimingWithOptions:0 animations:v8 completion:v9];
  }
}

void __48__PKDashboardCollectionViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundView];
  v1 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  [v2 setBackgroundColor:v1];
}

void __48__PKDashboardCollectionViewCell_setHighlighted___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundView];
  v1 = [(id)objc_opt_class() defaultBackgroundColor];
  [v2 setBackgroundColor:v1];
}

- (BOOL)wantsCustomAppearance
{
  return self->_wantsCustomAppearance;
}

- (BOOL)wantsDefaultHighlightBehavior
{
  return self->_wantsDefaultHighlightBehavior;
}

- (void)setWantsDefaultHighlightBehavior:(BOOL)a3
{
  self->_wantsDefaultHighlightBehavior = a3;
}

- (BOOL)showsBottomSeparator
{
  return self->_showsBottomSeparator;
}

- (void).cxx_destruct
{
}

@end