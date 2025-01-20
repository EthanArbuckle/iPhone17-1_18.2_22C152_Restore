@interface PKDashboardViewControllerFooterContainer
- (BOOL)isBackdropOpaque;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDashboardViewControllerFooterContainer)initWithFrame:(CGRect)a3;
- (PKHorizontalScrollingFooterViewComparator)currentFooter;
- (PKHorizontalScrollingFooterViewComparator)nextFooter;
- (double)layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (double)minimumFooterHeight;
- (int64_t)preferredBackdropStyle;
- (void)_updateBackdropViewStyle;
- (void)layoutSubviews;
- (void)setBackdropOpaque:(BOOL)a3;
- (void)setCurrentFooter:(id)a3;
- (void)setMinimumFooterHeight:(double)a3;
- (void)setNextFooter:(id)a3;
- (void)setTransitionProgress:(double)a3;
@end

@implementation PKDashboardViewControllerFooterContainer

- (PKDashboardViewControllerFooterContainer)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PKDashboardViewControllerFooterContainer;
  v3 = -[PKDashboardViewControllerFooterContainer initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_backdropStyle = [(PKDashboardViewControllerFooterContainer *)v3 preferredBackdropStyle];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:v4->_backdropStyle];
    backdropView = v4->_backdropView;
    v4->_backdropView = (_UIBackdropView *)v5;

    [(PKDashboardViewControllerFooterContainer *)v4 addSubview:v4->_backdropView];
    [(_UIBackdropView *)v4->_backdropView setUserInteractionEnabled:1];
    v4->_minimumFooterHeight = 86.0;
    v7 = [(_UIBackdropView *)v4->_backdropView contentView];
    [v7 setUserInteractionEnabled:1];

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topSeparatorView = v4->_topSeparatorView;
    v4->_topSeparatorView = v8;

    v10 = v4->_topSeparatorView;
    v11 = [MEMORY[0x1E4FB1618] systemFillColor];
    [(UIView *)v10 setBackgroundColor:v11];

    v12 = [(_UIBackdropView *)v4->_backdropView contentView];
    [v12 addSubview:v4->_topSeparatorView];

    v13 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    id v14 = (id)[(PKDashboardViewControllerFooterContainer *)v4 registerForTraitChanges:v13 withHandler:&__block_literal_global_161];
  }
  return v4;
}

uint64_t __58__PKDashboardViewControllerFooterContainer_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateBackdropViewStyle];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PKDashboardViewControllerFooterContainer layoutWithBounds:isTemplateLayout:](self, "layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardViewControllerFooterContainer;
  [(PKDashboardViewControllerFooterContainer *)&v3 layoutSubviews];
  [(PKDashboardViewControllerFooterContainer *)self bounds];
  -[PKDashboardViewControllerFooterContainer layoutWithBounds:isTemplateLayout:](self, "layoutWithBounds:isTemplateLayout:", 0);
}

- (double)layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double x = a3.origin.x;
  double y = a3.origin.y;
  double v7 = a3.origin.x + v6;
  double v8 = a3.origin.y + 0.0;
  double height = a3.size.height;
  double width = a3.size.width;
  double v9 = a3.size.width - (v6 + *(double *)(MEMORY[0x1E4FB2848] + 24));
  CGFloat v10 = a3.size.height - (*(double *)(MEMORY[0x1E4FB2848] + 16) + 0.0);
  -[PKHorizontalScrollingFooterViewComparator sizeThatFits:](self->_currentFooter, "sizeThatFits:", v9, v10);
  double v12 = v11;
  double v14 = v13;
  -[PKHorizontalScrollingFooterViewComparator sizeThatFits:](self->_nextFooter, "sizeThatFits:", v9, v10);
  double v16 = v15;
  double v18 = fmax(self->_minimumFooterHeight, fmax(v14, v17));
  double v19 = v7;
  double v20 = v8;
  double v21 = v9;
  double v22 = v18;
  if (self->_currentFooter)
  {
    double v19 = v7;
    double v20 = v8;
    double v21 = v9;
    double v22 = v18;
    if (v12 < v9) {
      PKSizeAlignedInRect();
    }
  }
  double v37 = v21;
  double v38 = v20;
  double v36 = v22;
  if (self->_nextFooter && v16 < v9)
  {
    double v23 = v19;
    PKSizeAlignedInRect();
    double v25 = v24;
    double v27 = v26;
    double v34 = v29;
    double v35 = v28;
  }
  else
  {
    double v23 = v19;
    double v25 = v7;
    double v27 = v8;
    double v34 = v18;
    double v35 = v9;
  }
  v43.origin.double x = v7;
  v43.origin.double y = v8;
  v43.size.double width = v9;
  v43.size.double height = v18;
  double MaxY = CGRectGetMaxY(v43);
  if (!a4)
  {
    -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:", x, y, width, height);
    -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, width, PKUIPixelLength() * 3.0);
    currentFooter = self->_currentFooter;
    if (currentFooter) {
      -[PKHorizontalScrollingFooterViewComparator setFrame:](currentFooter, "setFrame:", v23, v38, v37, v36);
    }
    nextFooter = self->_nextFooter;
    if (nextFooter) {
      -[PKHorizontalScrollingFooterViewComparator setFrame:](nextFooter, "setFrame:", v25, v27, v35, v34);
    }
  }
  return MaxY;
}

- (void)setBackdropOpaque:(BOOL)a3
{
  if (self->_isBackdropOpaque != a3)
  {
    self->_isBackdropOpaque = a3;
    [(PKDashboardViewControllerFooterContainer *)self _updateBackdropViewStyle];
  }
}

- (int64_t)preferredBackdropStyle
{
  v2 = [(PKDashboardViewControllerFooterContainer *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    return 2030;
  }
  else {
    return 2010;
  }
}

- (void)_updateBackdropViewStyle
{
  if (self->_isBackdropOpaque) {
    int64_t v3 = -2;
  }
  else {
    int64_t v3 = [(PKDashboardViewControllerFooterContainer *)self preferredBackdropStyle];
  }
  if (self->_backdropStyle != v3)
  {
    self->_backdropStyle = v3;
    backdropView = self->_backdropView;
    -[_UIBackdropView transitionToPrivateStyle:](backdropView, "transitionToPrivateStyle:");
  }
}

- (void)setTransitionProgress:(double)a3
{
  currentFooter = self->_currentFooter;
  if (currentFooter
    && (p_nextFooter = &self->_nextFooter, self->_nextFooter)
    && (int v7 = -[PKHorizontalScrollingFooterViewComparator isEqualToFooter:](currentFooter, "isEqualToFooter:"),
        currentFooter = self->_currentFooter,
        v7))
  {
    [(PKHorizontalScrollingFooterViewComparator *)currentFooter setAlpha:1.0];
    a3 = 0.0;
  }
  else
  {
    [(PKHorizontalScrollingFooterViewComparator *)currentFooter setAlpha:1.0 - a3];
    p_nextFooter = &self->_nextFooter;
  }
  double v8 = *p_nextFooter;

  [(PKHorizontalScrollingFooterViewComparator *)v8 setAlpha:a3];
}

- (void)setCurrentFooter:(id)a3
{
  double v4 = (PKHorizontalScrollingFooterViewComparator *)a3;
  double v5 = v4;
  currentFooter = self->_currentFooter;
  if (currentFooter) {
    BOOL v7 = currentFooter == v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [(PKHorizontalScrollingFooterViewComparator *)self->_currentFooter removeFromSuperview];
    currentFooter = self->_currentFooter;
  }
  self->_currentFooter = v5;
  double v8 = v5;

  double v9 = [(_UIBackdropView *)self->_backdropView contentView];
  [v9 addSubview:self->_currentFooter];

  CGFloat v10 = [(_UIBackdropView *)self->_backdropView contentView];
  [v10 bringSubviewToFront:self->_currentFooter];

  [(PKDashboardViewControllerFooterContainer *)self setNeedsLayout];
}

- (void)setNextFooter:(id)a3
{
  double v4 = (PKHorizontalScrollingFooterViewComparator *)a3;
  double v5 = v4;
  nextFooter = self->_nextFooter;
  if (nextFooter) {
    BOOL v7 = nextFooter == v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [(PKHorizontalScrollingFooterViewComparator *)self->_nextFooter removeFromSuperview];
    nextFooter = self->_nextFooter;
  }
  self->_nextFooter = v5;
  double v8 = v5;

  double v9 = [(_UIBackdropView *)self->_backdropView contentView];
  [v9 addSubview:self->_nextFooter];

  CGFloat v10 = [(_UIBackdropView *)self->_backdropView contentView];
  [v10 bringSubviewToFront:self->_currentFooter];

  [(PKDashboardViewControllerFooterContainer *)self setNeedsLayout];
}

- (void)setMinimumFooterHeight:(double)a3
{
  if (self->_minimumFooterHeight != a3)
  {
    self->_minimumFooterHeight = a3;
    [(PKDashboardViewControllerFooterContainer *)self setNeedsLayout];
  }
}

- (PKHorizontalScrollingFooterViewComparator)currentFooter
{
  return self->_currentFooter;
}

- (PKHorizontalScrollingFooterViewComparator)nextFooter
{
  return self->_nextFooter;
}

- (double)minimumFooterHeight
{
  return self->_minimumFooterHeight;
}

- (BOOL)isBackdropOpaque
{
  return self->_isBackdropOpaque;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_nextFooter, 0);

  objc_storeStrong((id *)&self->_currentFooter, 0);
}

@end