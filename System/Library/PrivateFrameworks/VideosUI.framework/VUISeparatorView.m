@interface VUISeparatorView
- (CGSize)intrinsicContentSize;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIColor)color;
- (UIColor)darkColor;
- (UIView)line;
- (VUISeparatorView)initWithFrame:(CGRect)a3;
- (double)lineHeight;
- (id)lineColor;
- (void)_updateLineColor;
- (void)initializeVUISeparatorView;
- (void)setColor:(id)a3;
- (void)setDarkColor:(id)a3;
- (void)setLine:(id)a3;
- (void)setLineHeight:(double)a3;
@end

@implementation VUISeparatorView

- (VUISeparatorView)initWithFrame:(CGRect)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VUISeparatorView;
  v3 = -[VUISeparatorView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(VUISeparatorView *)v3 initializeVUISeparatorView];
    objc_initWeak(&location, v4);
    v11[0] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__VUISeparatorView_initWithFrame___block_invoke;
    v7[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v8, &location);
    [(VUISeparatorView *)v4 vui_registerForTraitChanges:v5 withHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __34__VUISeparatorView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLineColor];
}

- (void)initializeVUISeparatorView
{
  v3 = objc_msgSend(MEMORY[0x1E4FB1BA8], "vui_main");
  objc_msgSend(v3, "vui_nativeScale");
  self->_lineHeight = 1.0 / v4;

  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  line = self->_line;
  self->_line = v5;

  objc_msgSend(MEMORY[0x1E4FB1618], "vui_separatorColor");
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  color = self->_color;
  self->_color = v7;

  [(VUISeparatorView *)self _updateLineColor];
  v9 = self->_line;
  [(VUISeparatorView *)self addSubview:v9];
}

- (id)lineColor
{
  return (id)[(UIView *)self->_line vuiBackgroundColor];
}

- (void)setColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    [(VUISeparatorView *)self _updateLineColor];
    v5 = v6;
  }
}

- (void)setDarkColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_darkColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_darkColor, a3);
    [(VUISeparatorView *)self _updateLineColor];
    v5 = v6;
  }
}

- (void)setLineHeight:(double)a3
{
  self->_lineHeight = a3;
  [(VUISeparatorView *)self vui_setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  -[UIView vui_sizeThatFits:](self, "vui_sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat width = a3.width;
  if (!a4)
  {
    [(VUISeparatorView *)self bounds];
    -[UIView setFrame:](self->_line, "setFrame:", 0.0, 0.0);
  }
  double lineHeight = self->_lineHeight;
  double v7 = width;
  result.height = lineHeight;
  result.CGFloat width = v7;
  return result;
}

- (void)_updateLineColor
{
  double v3 = [(VUISeparatorView *)self vuiTraitCollection];
  if ([v3 userInterfaceStyle] == 2)
  {
    p_darkColor = &self->_darkColor;
    darkColor = self->_darkColor;

    if (darkColor) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  p_darkColor = &self->_color;
LABEL_6:
  line = self->_line;
  double v7 = *p_darkColor;
  [(UIView *)line setVuiBackgroundColor:v7];
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)darkColor
{
  return self->_darkColor;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (UIView)line
{
  return self->_line;
}

- (void)setLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line, 0);
  objc_storeStrong((id *)&self->_darkColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end