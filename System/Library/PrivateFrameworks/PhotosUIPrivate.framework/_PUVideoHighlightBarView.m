@interface _PUVideoHighlightBarView
- (BOOL)expanded;
- (UIColor)highlightColor;
- (UIEdgeInsets)expandedOutsets;
- (_PUVideoHighlightBarView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setExpandedOutsets:(UIEdgeInsets)a3;
- (void)setHighlightColor:(id)a3;
@end

@implementation _PUVideoHighlightBarView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_barView, 0);
}

- (UIEdgeInsets)expandedOutsets
{
  double top = self->_expandedOutsets.top;
  double left = self->_expandedOutsets.left;
  double bottom = self->_expandedOutsets.bottom;
  double right = self->_expandedOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)_PUVideoHighlightBarView;
  [(_PUVideoHighlightBarView *)&v18 layoutSubviews];
  [(_PUVideoHighlightBarView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(_PUVideoHighlightBarView *)self expanded];
  [(_PUVideoHighlightBarView *)self expandedOutsets];
  double v12 = 1.0;
  if (v11)
  {
    PXEdgeInsetsInvert();
    PXEdgeInsetsInsetRect();
    double v4 = v13;
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
    double v12 = 1.5;
  }
  v17 = [(UIView *)self->_barView layer];
  [v17 setCornerRadius:v12];

  -[UIView setFrame:](self->_barView, "setFrame:", v4, v6, v8, v10);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_expanded != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_expanded = a3;
    [(_PUVideoHighlightBarView *)self setNeedsLayout];
    if (v4)
    {
      if (v5)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __49___PUVideoHighlightBarView_setExpanded_animated___block_invoke;
        v8[3] = &unk_1E5F2ED10;
        v8[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v8 usingSpringWithDamping:0 initialSpringVelocity:0.95 options:0.0 animations:0.45 completion:0.0];
      }
      else
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __49___PUVideoHighlightBarView_setExpanded_animated___block_invoke_2;
        v7[3] = &unk_1E5F2ED10;
        v7[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:0.15];
      }
    }
  }
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpandedOutsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  p_expandedOutsets = &self->_expandedOutsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_expandedOutsets->CGFloat top = top;
    p_expandedOutsets->CGFloat left = left;
    p_expandedOutsets->CGFloat bottom = bottom;
    p_expandedOutsets->CGFloat right = right;
    [(_PUVideoHighlightBarView *)self setNeedsLayout];
  }
}

- (void)setHighlightColor:(id)a3
{
  double v7 = (UIColor *)a3;
  BOOL v5 = self->_highlightColor;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIColor *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_highlightColor, a3);
      [(UIView *)self->_barView setBackgroundColor:v7];
    }
  }
}

- (_PUVideoHighlightBarView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_PUVideoHighlightBarView;
  double v3 = -[_PUVideoHighlightBarView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(_PUVideoHighlightBarView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    barView = v3->_barView;
    v3->_barView = (UIView *)v5;

    double v7 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UIView *)v3->_barView setBackgroundColor:v7];

    [(_PUVideoHighlightBarView *)v3 setClipsToBounds:0];
    [(_PUVideoHighlightBarView *)v3 setUserInteractionEnabled:0];
    [(_PUVideoHighlightBarView *)v3 addSubview:v3->_barView];
  }
  return v3;
}

@end