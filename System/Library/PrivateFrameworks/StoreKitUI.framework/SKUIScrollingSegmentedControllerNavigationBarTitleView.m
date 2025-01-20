@interface SKUIScrollingSegmentedControllerNavigationBarTitleView
+ (UIEdgeInsets)defaultLayoutMargins;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIInteractiveSegmentedControl)segmentedControl;
- (SKUIScrollingSegmentedControllerNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (double)segmentedControlMinimumHeight;
- (int64_t)layoutStyle;
- (void)layoutSubviews;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSegmentedControlMinimumHeight:(double)a3;
@end

@implementation SKUIScrollingSegmentedControllerNavigationBarTitleView

- (SKUIScrollingSegmentedControllerNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIScrollingSegmentedControllerNavigationBarTitleView;
  v8 = -[SKUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_segmentedControlMinimumHeight = 29.0;
    [(id)objc_opt_class() defaultLayoutMargins];
    [(SKUIScrollingSegmentedControllerNavigationBarTitleView *)v9 setLayoutMargins:"setLayoutMargins:"];
  }
  return v9;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SKUIScrollingSegmentedControllerNavigationBarTitleView;
  [(SKUIScrollingSegmentedControllerNavigationBarTitleView *)&v28 layoutSubviews];
  if (self->_segmentedControl)
  {
    v3 = [(SKUIScrollingSegmentedControllerNavigationBarTitleView *)self traitCollection];
    [v3 displayScale];
    double v5 = v4;

    if (v5 <= 0.00000011920929)
    {
      v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v6 scale];
      double v5 = v7;
    }
    [(SKUIScrollingSegmentedControllerNavigationBarTitleView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(SKUIScrollingSegmentedControllerNavigationBarTitleView *)self layoutMargins];
    double v17 = v16;
    double v19 = v9 + v18;
    double v21 = v11 + v20;
    double v23 = v13 - (v18 + v22);
    double v24 = v15 - (v20 + v17);
    if (self->_layoutStyle != 1)
    {
      -[SKUIInteractiveSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v23, v24);
      double v27 = v5;
      UIRectCenteredXInRectScale();
      double v19 = v25;
      double v21 = v26;
    }
    -[SKUIInteractiveSegmentedControl setFrame:](self->_segmentedControl, "setFrame:", v19, v21, v23, v24, *(void *)&v27);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SKUIInteractiveSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", 1.79769313e308, self->_segmentedControlMinimumHeight);
  double v5 = v4;
  double v7 = v6;
  [(SKUIScrollingSegmentedControllerNavigationBarTitleView *)self layoutMargins];
  double v10 = v5 + v8 + v9;
  double v13 = v7 + v11 + v12;
  double v14 = v10;
  result.double height = v13;
  result.double width = v14;
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
  double v5 = (SKUIInteractiveSegmentedControl *)a3;
  p_segmentedControl = &self->_segmentedControl;
  segmentedControl = self->_segmentedControl;
  if (segmentedControl != v5)
  {
    double v9 = v5;
    double v8 = [(SKUIInteractiveSegmentedControl *)segmentedControl superview];

    if (v8 == self) {
      [(SKUIInteractiveSegmentedControl *)*p_segmentedControl removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_segmentedControl, a3);
    segmentedControl = (SKUIInteractiveSegmentedControl *)[(SKUIScrollingSegmentedControllerNavigationBarTitleView *)self addSubview:*p_segmentedControl];
    double v5 = v9;
  }

  MEMORY[0x1F41817F8](segmentedControl, v5);
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(SKUIScrollingSegmentedControllerNavigationBarTitleView *)self setNeedsLayout];
  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (SKUIInteractiveSegmentedControl)segmentedControl
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:]";
}

@end