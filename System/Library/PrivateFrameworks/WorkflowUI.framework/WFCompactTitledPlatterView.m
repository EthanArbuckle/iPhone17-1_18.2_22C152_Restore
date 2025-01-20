@interface WFCompactTitledPlatterView
- (BOOL)sashVisible;
- (CGRect)_mainContentFrame;
- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3;
- (NSString)title;
- (WFCompactAppearanceProvider)appearanceProvider;
- (WFCompactPlatterSashView)sashView;
- (WFCompactTitledPlatterView)initWithRecipe:(int64_t)a3;
- (WFCompactTitledPlatterViewDelegate)delegate;
- (WFIcon)icon;
- (void)configureSashViewIfNecessary;
- (void)layoutHeaderViews;
- (void)layoutSubviews;
- (void)setAppearanceProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIcon:(id)a3;
- (void)setNeedsLayout;
- (void)setSashView:(id)a3;
- (void)setSashVisible:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFCompactTitledPlatterView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sashView, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSashView:(id)a3
{
}

- (WFCompactPlatterSashView)sashView
{
  return self->_sashView;
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (void)setDelegate:(id)a3
{
}

- (WFCompactTitledPlatterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFCompactTitledPlatterViewDelegate *)WeakRetained;
}

- (BOOL)sashVisible
{
  return self->_sashVisible;
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  [(WFCompactTitledPlatterView *)self configureSashViewIfNecessary];
  id v5 = [(WFCompactTitledPlatterView *)self sashView];
  [v5 setIcon:v4];
}

- (WFIcon)icon
{
  v2 = [(WFCompactTitledPlatterView *)self sashView];
  v3 = [v2 icon];

  return (WFIcon *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  [(WFCompactTitledPlatterView *)self configureSashViewIfNecessary];
  id v6 = (id)[v4 copy];

  id v5 = [(WFCompactTitledPlatterView *)self sashView];
  [v5 setTitle:v6];
}

- (NSString)title
{
  v2 = [(WFCompactTitledPlatterView *)self sashView];
  v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setAppearanceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  id v5 = a3;
  [(WFCompactPlatterSashView *)self->_sashView setAppearanceProvider:v5];

  [(WFCompactTitledPlatterView *)self layoutSubviews];
}

- (CGRect)_mainContentFrame
{
  [(WFCompactTitledPlatterView *)self bounds];
  CGFloat x = v19.origin.x;
  double y = v19.origin.y;
  CGFloat width = v19.size.width;
  double height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    [(WFCompactTitledPlatterView *)self layoutHeaderViews];
    BOOL v7 = [(WFCompactTitledPlatterView *)self sashVisible];
    double v8 = 0.0;
    if (v7) {
      [(WFCompactPlatterSashView *)self->_sashView contentBaseline];
    }
    double y = y + v8;
    double height = height - v8;
  }
  v20.origin.CGFloat x = x;
  v20.origin.double y = y;
  v20.size.CGFloat width = width;
  v20.size.double height = height;
  if (!CGRectIsEmpty(v20))
  {
    v9 = [(WFCompactTitledPlatterView *)self window];
    v10 = [v9 screen];
    [v10 scale];
    UIRectIntegralWithScale();
    CGFloat x = v11;
    double y = v12;
    CGFloat width = v13;
    double height = v14;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.double height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WFCompactTitledPlatterView;
  -[PLPlatterView sizeThatFitsContentWithSize:](&v11, sel_sizeThatFitsContentWithSize_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(WFCompactTitledPlatterView *)self configureSashViewIfNecessary];
  if (self->_sashView && [(WFCompactTitledPlatterView *)self sashVisible])
  {
    [(WFCompactPlatterSashView *)self->_sashView contentBaseline];
    double v7 = v7 + v8;
  }
  if (v7 > 0.0 && [(WFCompactTitledPlatterView *)self sashVisible]) {
    double v7 = v7 + 16.0;
  }
  double v9 = v5;
  double v10 = v7;
  result.double height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)WFCompactTitledPlatterView;
  [(PLPlatterView *)&v20 layoutSubviews];
  [(WFCompactTitledPlatterView *)self configureSashViewIfNecessary];
  [(WFCompactTitledPlatterView *)self layoutHeaderViews];
  [(WFCompactTitledPlatterView *)self _mainContentFrame];
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  if (!CGRectIsEmpty(v21))
  {
    double v7 = [(PLPlatterView *)self customContentView];
    objc_msgSend(v7, "setFrame:", x, y, width, height);
  }
  if ([(WFCompactTitledPlatterView *)self sashVisible]) {
    double v8 = 16.0;
  }
  else {
    double v8 = 0.0;
  }
  double v9 = [(PLPlatterView *)self customContentView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12 + 0.0;
  double v15 = v8 + v14;
  double v17 = v16 - v8;
  double v18 = [(PLPlatterView *)self customContentView];
  objc_msgSend(v18, "setFrame:", v13, v15, v11, v17);

  CGRect v19 = [(WFCompactTitledPlatterView *)self delegate];
  [v19 layoutCustomContentViewForPlatterView:self];
}

- (void)layoutHeaderViews
{
  [(WFCompactTitledPlatterView *)self bounds];
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  if (!CGRectIsEmpty(v16))
  {
    -[WFCompactPlatterSashView sizeThatFits:](self->_sashView, "sizeThatFits:", width, height);
    BSRectWithSize();
    double v7 = [(WFCompactTitledPlatterView *)self window];
    double v8 = [v7 screen];
    [v8 scale];
    UIRectIntegralWithScale();
    double x = v9;
    double y = v10;
    double width = v11;
    double height = v12;
  }
  double v13 = [(WFCompactTitledPlatterView *)self sashView];
  objc_msgSend(v13, "setFrame:", x, y, width, height);

  id v14 = [(WFCompactTitledPlatterView *)self sashView];
  [v14 setNeedsLayout];
}

- (void)configureSashViewIfNecessary
{
  if (!self->_sashView && [(WFCompactTitledPlatterView *)self sashVisible])
  {
    v3 = [WFCompactPlatterSashView alloc];
    double v4 = -[WFCompactPlatterSashView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    sashView = self->_sashView;
    self->_sashView = v4;

    [(WFCompactPlatterSashView *)self->_sashView setAutoresizesSubviews:1];
    [(WFCompactTitledPlatterView *)self addSubview:self->_sashView];
    double v6 = self->_sashView;
    [(WFCompactTitledPlatterView *)self bringSubviewToFront:v6];
  }
}

- (void)setSashVisible:(BOOL)a3
{
  self->_sashVisible = a3;
  if (a3)
  {
    [(WFCompactTitledPlatterView *)self configureSashViewIfNecessary];
  }
  else
  {
    double v4 = [(WFCompactTitledPlatterView *)self sashView];
    [v4 removeFromSuperview];
  }
  [(WFCompactTitledPlatterView *)self setNeedsLayout];
  [(WFCompactTitledPlatterView *)self layoutIfNeeded];
}

- (void)setNeedsLayout
{
  v4.receiver = self;
  v4.super_class = (Class)WFCompactTitledPlatterView;
  [(WFCompactTitledPlatterView *)&v4 setNeedsLayout];
  v3 = [(WFCompactTitledPlatterView *)self sashView];
  [v3 setNeedsLayout];
}

- (WFCompactTitledPlatterView)initWithRecipe:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFCompactTitledPlatterView;
  v3 = [(PLPlatterView *)&v7 initWithRecipe:a3];
  objc_super v4 = v3;
  if (v3)
  {
    v3->_sashVisible = 0;
    double v5 = v3;
  }

  return v4;
}

@end