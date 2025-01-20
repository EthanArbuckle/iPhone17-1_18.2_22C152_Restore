@interface SKUISegmentedTableHeaderView
- (BOOL)hidesBorderView;
- (CGSize)sizeThatFits:(CGSize)result;
- (SKUISegmentedTableHeaderView)initWithFrame:(CGRect)a3;
- (UIView)segmentedControl;
- (_UIBackdropView)backdropView;
- (id)_borderView;
- (void)layoutSubviews;
- (void)setHidesBorderView:(BOOL)a3;
- (void)setSegmentedControl:(id)a3;
@end

@implementation SKUISegmentedTableHeaderView

- (SKUISegmentedTableHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISegmentedTableHeaderView initWithFrame:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUISegmentedTableHeaderView;
  v8 = -[SKUISegmentedTableHeaderView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2010];
    backdropView = v8->_backdropView;
    v8->_backdropView = (_UIBackdropView *)v9;

    [(SKUISegmentedTableHeaderView *)v8 addSubview:v8->_backdropView];
  }
  return v8;
}

- (BOOL)hidesBorderView
{
  return [(UIView *)self->_borderView isHidden];
}

- (void)setHidesBorderView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SKUISegmentedTableHeaderView *)self _borderView];
  [v4 setHidden:v3];
}

- (void)setSegmentedControl:(id)a3
{
  v5 = (UIView *)a3;
  segmentedControl = self->_segmentedControl;
  v7 = v5;
  if (segmentedControl != v5)
  {
    [(UIView *)segmentedControl removeFromSuperview];
    objc_storeStrong((id *)&self->_segmentedControl, a3);
    if (self->_segmentedControl) {
      -[SKUISegmentedTableHeaderView addSubview:](self, "addSubview:");
    }
  }
}

- (void)layoutSubviews
{
  [(SKUISegmentedTableHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    [(UIView *)segmentedControl frame];
    float v9 = (v6 - v8) * 0.5;
    -[UIView setFrame:](self->_segmentedControl, "setFrame:", 15.0, floorf(v9), v4 + -15.0 + -15.0);
  }
  v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  double v12 = 1.0 / v11;

  id v13 = [(SKUISegmentedTableHeaderView *)self _borderView];
  objc_msgSend(v13, "setFrame:", 0.0, v6 - v12, v4, v12);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  result.double height = v3;
  return result;
}

- (id)_borderView
{
  borderView = self->_borderView;
  if (!borderView)
  {
    double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    double v5 = self->_borderView;
    self->_borderView = v4;

    double v6 = self->_borderView;
    v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v6 setBackgroundColor:v7];

    [(SKUISegmentedTableHeaderView *)self addSubview:self->_borderView];
    borderView = self->_borderView;
  }

  return borderView;
}

- (UIView)segmentedControl
{
  return self->_segmentedControl;
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_borderView, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISegmentedTableHeaderView initWithFrame:]";
}

@end