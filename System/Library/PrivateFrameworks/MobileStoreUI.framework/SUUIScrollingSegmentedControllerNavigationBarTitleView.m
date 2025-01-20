@interface SUUIScrollingSegmentedControllerNavigationBarTitleView
+ (UIEdgeInsets)defaultLayoutMargins;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIInteractiveSegmentedControl)segmentedControl;
- (SUUIScrollingSegmentedControllerNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (double)segmentedControlMinimumHeight;
- (int64_t)layoutStyle;
- (void)layoutSubviews;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSegmentedControlMinimumHeight:(double)a3;
@end

@implementation SUUIScrollingSegmentedControllerNavigationBarTitleView

- (SUUIScrollingSegmentedControllerNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIScrollingSegmentedControllerNavigationBarTitleView;
  v3 = -[SUUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_segmentedControlMinimumHeight = 29.0;
    [(id)objc_opt_class() defaultLayoutMargins];
    [(SUUIScrollingSegmentedControllerNavigationBarTitleView *)v4 setLayoutMargins:"setLayoutMargins:"];
  }
  return v4;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SUUIScrollingSegmentedControllerNavigationBarTitleView;
  [(SUUIScrollingSegmentedControllerNavigationBarTitleView *)&v28 layoutSubviews];
  if (self->_segmentedControl)
  {
    v3 = [(SUUIScrollingSegmentedControllerNavigationBarTitleView *)self traitCollection];
    [v3 displayScale];
    double v5 = v4;

    if (v5 <= 0.00000011920929)
    {
      objc_super v6 = [MEMORY[0x263F82B60] mainScreen];
      [v6 scale];
      double v5 = v7;
    }
    [(SUUIScrollingSegmentedControllerNavigationBarTitleView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(SUUIScrollingSegmentedControllerNavigationBarTitleView *)self layoutMargins];
    double v17 = v16;
    double v19 = v9 + v18;
    double v21 = v11 + v20;
    double v23 = v13 - (v18 + v22);
    double v24 = v15 - (v20 + v17);
    if (self->_layoutStyle != 1)
    {
      -[SUUIInteractiveSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v23, v24);
      double v27 = v5;
      UIRectCenteredXInRectScale();
      double v19 = v25;
      double v21 = v26;
    }
    -[SUUIInteractiveSegmentedControl setFrame:](self->_segmentedControl, "setFrame:", v19, v21, v23, v24, *(void *)&v27);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SUUIInteractiveSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", 1.79769313e308, self->_segmentedControlMinimumHeight);
  double v5 = v4;
  double v7 = v6;
  [(SUUIScrollingSegmentedControllerNavigationBarTitleView *)self layoutMargins];
  double v10 = v5 + v8 + v9;
  double v13 = v7 + v11 + v12;
  double v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

+ (UIEdgeInsets)defaultLayoutMargins
{
  double v2 = 4.0;
  double v3 = 8.0;
  double v4 = 4.0;
  double v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setSegmentedControl:(id)a3
{
  double v5 = (SUUIInteractiveSegmentedControl *)a3;
  p_segmentedControl = &self->_segmentedControl;
  segmentedControl = self->_segmentedControl;
  if (segmentedControl != v5)
  {
    double v9 = v5;
    double v8 = [(SUUIInteractiveSegmentedControl *)segmentedControl superview];

    if (v8 == self) {
      [(SUUIInteractiveSegmentedControl *)*p_segmentedControl removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_segmentedControl, a3);
    segmentedControl = (SUUIInteractiveSegmentedControl *)[(SUUIScrollingSegmentedControllerNavigationBarTitleView *)self addSubview:*p_segmentedControl];
    double v5 = v9;
  }
  MEMORY[0x270F9A758](segmentedControl, v5);
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(SUUIScrollingSegmentedControllerNavigationBarTitleView *)self setNeedsLayout];
  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (SUUIInteractiveSegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (double)segmentedControlMinimumHeight
{
  return self->_segmentedControlMinimumHeight;
}

- (void)setSegmentedControlMinimumHeight:(double)a3
{
  self->_segmentedControlMinimumHeight = a3;
}

- (void).cxx_destruct
{
}

@end