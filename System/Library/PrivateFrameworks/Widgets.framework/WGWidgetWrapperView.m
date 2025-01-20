@interface WGWidgetWrapperView
- (CGSize)intrinsicContentSize;
- (UIView)contentView;
- (WGWidgetPlatterView)platterView;
- (WGWidgetWrapperView)initWithPlatterView:(id)a3;
- (double)overrideIntrinsicContentHeight;
- (double)topMarginForLayout;
- (void)layoutSubviews;
- (void)setOverrideIntrinsicContentHeight:(double)a3;
- (void)setPlatterView:(id)a3;
- (void)setTopMarginForLayout:(double)a3;
@end

@implementation WGWidgetWrapperView

- (WGWidgetWrapperView)initWithPlatterView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetWrapperView;
  v6 = [(WGWidgetWrapperView *)&v11 init];
  if (v6)
  {
    v7 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    contentView = v6->_contentView;
    v6->_contentView = v7;

    [(UIView *)v6->_contentView setClipsToBounds:0];
    [(UIView *)v6->_contentView setAutoresizingMask:18];
    v9 = [(UIView *)v6->_contentView layer];
    [v9 setAllowsGroupOpacity:1];

    [(WGWidgetWrapperView *)v6 addSubview:v6->_contentView];
    objc_storeStrong((id *)&v6->_platterView, a3);
    [(UIView *)v6->_contentView addSubview:v6->_platterView];
    v6->_overrideIntrinsicContentHeight = -1.0;
  }

  return v6;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetWrapperView;
  [(WGWidgetWrapperView *)&v4 layoutSubviews];
  platterView = self->_platterView;
  [(UIView *)self->_contentView bounds];
  -[WGWidgetPlatterView setFrame:](platterView, "setFrame:");
  [(WGWidgetPlatterView *)self->_platterView setTopMarginForLayout:self->_topMarginForLayout];
}

- (void)setTopMarginForLayout:(double)a3
{
  if (vabdd_f64(self->_topMarginForLayout, a3) >= 2.22044605e-16)
  {
    self->_topMarginForLayout = a3;
    [(WGWidgetWrapperView *)self setNeedsLayout];
  }
}

- (void)setOverrideIntrinsicContentHeight:(double)a3
{
  if (vabdd_f64(self->_overrideIntrinsicContentHeight, a3) >= 2.22044605e-16)
  {
    self->_overrideIntrinsicContentHeight = a3;
    [(WGWidgetWrapperView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  if (self->_overrideIntrinsicContentHeight <= 0.0)
  {
    platterView = self->_platterView;
    [(WGWidgetWrapperView *)self bounds];
    double Width = CGRectGetWidth(v10);
    -[WGWidgetPlatterView sizeThatFits:](platterView, "sizeThatFits:", Width, 1.79769313e308);
  }
  else
  {
    [(WGWidgetWrapperView *)self bounds];
    double v3 = CGRectGetWidth(v9);
    double overrideIntrinsicContentHeight = self->_overrideIntrinsicContentHeight;
  }
  result.height = overrideIntrinsicContentHeight;
  result.width = v3;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (WGWidgetPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (double)overrideIntrinsicContentHeight
{
  return self->_overrideIntrinsicContentHeight;
}

- (double)topMarginForLayout
{
  return self->_topMarginForLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end