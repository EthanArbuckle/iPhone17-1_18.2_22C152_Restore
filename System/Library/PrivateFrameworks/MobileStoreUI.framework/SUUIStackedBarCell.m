@interface SUUIStackedBarCell
- (BOOL)expanded;
- (CGSize)sizeThatFits:(CGSize)result;
- (SUUIStackedBarCell)initWithFrame:(CGRect)a3;
- (UIButton)backButton;
- (void)layoutSubviews;
- (void)setExpanded:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
@end

@implementation SUUIStackedBarCell

- (SUUIStackedBarCell)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SUUIStackedBarCell;
  v3 = -[SUUIStackedBarCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separator = v3->_separator;
    v3->_separator = v4;

    v6 = v3->_separator;
    v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.25];
    [(UIView *)v6 setBackgroundColor:v7];

    [(SUUIStackedBarCell *)v3 addSubview:v3->_separator];
    v8 = (void *)MEMORY[0x263F827E8];
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v8 imageNamed:@"AppStoreBrowseCategoryBackChevron" inBundle:v9];

    uint64_t v11 = [MEMORY[0x263F824E8] buttonWithType:1];
    backButton = v3->_backButton;
    v3->_backButton = (UIButton *)v11;

    [(UIButton *)v3->_backButton setImage:v10 forState:0];
    [(UIButton *)v3->_backButton setTag:1398030659];
    [(SUUIStackedBarCell *)v3 addSubview:v3->_backButton];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    expandedLabel = v3->_expandedLabel;
    v3->_expandedLabel = v13;

    v15 = v3->_expandedLabel;
    v16 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
    [(UILabel *)v15 setFont:v16];

    [(SUUIStackedBarCell *)v3 addSubview:v3->_expandedLabel];
    v17 = [(SUUIStackedBarCell *)v3 tintColor];
    [(SUUIStackedBarCell *)v3 setTitleColor:v17 forState:0];

    v18 = [(SUUIStackedBarCell *)v3 titleLabel];
    v19 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    [v18 setFont:v19];

    v20 = [(SUUIStackedBarCell *)v3 titleLabel];
    [v20 setTextAlignment:1];
  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  if (!self->_expanded)
  {
    v5 = [MEMORY[0x263F825C8] colorWithWhite:0.8824 alpha:0.82];
    double v6 = 0.25;
    if (!a3)
    {
      uint64_t v7 = [MEMORY[0x263F825C8] clearColor];

      double v6 = 0.47;
      v5 = (void *)v7;
    }
    v8 = (void *)MEMORY[0x263F82E00];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__SUUIStackedBarCell_setHighlighted___block_invoke;
    v10[3] = &unk_265400890;
    v10[4] = self;
    id v11 = v5;
    id v9 = v5;
    [v8 animateWithDuration:v10 animations:0 completion:v6];
  }
}

uint64_t __37__SUUIStackedBarCell_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  expandedLabel = self->_expandedLabel;
  if (a3)
  {
    double v5 = 1.0;
    CGAffineTransformMakeScale(&v10, 1.0, 1.0);
    [(UILabel *)expandedLabel setTransform:&v10];
    [(UILabel *)self->_expandedLabel setAlpha:1.0];
    double v6 = [(SUUIStackedBarCell *)self titleLabel];
    uint64_t v7 = v6;
    double v8 = 0.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.705882353, 0.705882353);
    [(UILabel *)expandedLabel setTransform:&v9];
    double v5 = 0.0;
    [(UILabel *)self->_expandedLabel setAlpha:0.0];
    double v6 = [(SUUIStackedBarCell *)self titleLabel];
    uint64_t v7 = v6;
    double v8 = 1.0;
  }
  [v6 setAlpha:v8];

  [(UIButton *)self->_backButton setAlpha:v5];
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIStackedBarCell;
  id v6 = a3;
  [(SUUIStackedBarCell *)&v7 setTitle:v6 forState:a4];
  -[UILabel setText:](self->_expandedLabel, "setText:", v6, v7.receiver, v7.super_class);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  if (!self->_expanded) {
    double v3 = 25.0;
  }
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)SUUIStackedBarCell;
  [(SUUIStackedBarCell *)&v20 layoutSubviews];
  [(SUUIStackedBarCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(SUUIStackedBarCell *)self bounds];
  CGFloat Width = CGRectGetWidth(v21);
  v13 = [MEMORY[0x263F82B60] mainScreen];
  [v13 scale];
  CGFloat v15 = 1.0 / v14;

  [(SUUIStackedBarCell *)self bounds];
  double Height = CGRectGetHeight(v22);
  v23.origin.x = 0.0;
  v23.origin.y = v11;
  v23.size.width = Width;
  v23.size.height = v15;
  CGFloat v17 = CGRectGetHeight(v23);
  [(UIView *)self->_separator setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, Height - v17, Width, v15, v4, v6, v8, v10)];
  [(UIButton *)self->_backButton setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, 0.0, 47.0, 42.0, v4, v6, v8, v10)];
  [(UILabel *)self->_expandedLabel sizeToFit];
  expandedLabel = self->_expandedLabel;
  v19 = [(SUUIStackedBarCell *)self titleLabel];
  [v19 center];
  -[UILabel setCenter:](expandedLabel, "setCenter:");
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (UIButton)backButton
{
  return self->_backButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_expandedLabel, 0);
}

@end