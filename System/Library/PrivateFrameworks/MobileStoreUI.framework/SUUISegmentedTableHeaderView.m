@interface SUUISegmentedTableHeaderView
- (BOOL)hidesBorderView;
- (CGSize)sizeThatFits:(CGSize)result;
- (SUUISegmentedTableHeaderView)initWithFrame:(CGRect)a3;
- (UIView)segmentedControl;
- (_UIBackdropView)backdropView;
- (id)_borderView;
- (void)layoutSubviews;
- (void)setHidesBorderView:(BOOL)a3;
- (void)setSegmentedControl:(id)a3;
@end

@implementation SUUISegmentedTableHeaderView

- (SUUISegmentedTableHeaderView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUISegmentedTableHeaderView;
  v3 = -[SUUISegmentedTableHeaderView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F82EB8]) initWithPrivateStyle:2010];
    backdropView = v3->_backdropView;
    v3->_backdropView = (_UIBackdropView *)v4;

    [(SUUISegmentedTableHeaderView *)v3 addSubview:v3->_backdropView];
  }
  return v3;
}

- (BOOL)hidesBorderView
{
  return [(UIView *)self->_borderView isHidden];
}

- (void)setHidesBorderView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SUUISegmentedTableHeaderView *)self _borderView];
  [v4 setHidden:v3];
}

- (void)setSegmentedControl:(id)a3
{
  v5 = (UIView *)a3;
  segmentedControl = self->_segmentedControl;
  objc_super v7 = v5;
  if (segmentedControl != v5)
  {
    [(UIView *)segmentedControl removeFromSuperview];
    objc_storeStrong((id *)&self->_segmentedControl, a3);
    if (self->_segmentedControl) {
      -[SUUISegmentedTableHeaderView addSubview:](self, "addSubview:");
    }
  }
}

- (void)layoutSubviews
{
  [(SUUISegmentedTableHeaderView *)self bounds];
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
  v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  double v12 = 1.0 / v11;

  id v13 = [(SUUISegmentedTableHeaderView *)self _borderView];
  objc_msgSend(v13, "setFrame:", 0.0, v6 - v12, v4, v12);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  result.height = v3;
  return result;
}

- (id)_borderView
{
  borderView = self->_borderView;
  if (!borderView)
  {
    double v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    double v5 = self->_borderView;
    self->_borderView = v4;

    double v6 = self->_borderView;
    objc_super v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v6 setBackgroundColor:v7];

    [(SUUISegmentedTableHeaderView *)self addSubview:self->_borderView];
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

@end