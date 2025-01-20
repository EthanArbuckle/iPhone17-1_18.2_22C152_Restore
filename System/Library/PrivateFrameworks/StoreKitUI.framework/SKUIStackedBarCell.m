@interface SKUIStackedBarCell
- (BOOL)expanded;
- (CGSize)sizeThatFits:(CGSize)result;
- (SKUIStackedBarCell)initWithFrame:(CGRect)a3;
- (UIButton)backButton;
- (void)layoutSubviews;
- (void)setExpanded:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
@end

@implementation SKUIStackedBarCell

- (SKUIStackedBarCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStackedBarCell initWithFrame:]();
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUIStackedBarCell;
  v8 = -[SKUIStackedBarCell initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separator = v8->_separator;
    v8->_separator = v9;

    v11 = v8->_separator;
    v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.25];
    [(UIView *)v11 setBackgroundColor:v12];

    [(SKUIStackedBarCell *)v8 addSubview:v8->_separator];
    v13 = (void *)MEMORY[0x1E4FB1818];
    v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v13 imageNamed:@"AppStoreBrowseCategoryBackChevron" inBundle:v14];

    uint64_t v16 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    backButton = v8->_backButton;
    v8->_backButton = (UIButton *)v16;

    [(UIButton *)v8->_backButton setImage:v15 forState:0];
    [(UIButton *)v8->_backButton setTag:1398030659];
    [(SKUIStackedBarCell *)v8 addSubview:v8->_backButton];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    expandedLabel = v8->_expandedLabel;
    v8->_expandedLabel = v18;

    v20 = v8->_expandedLabel;
    v21 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
    [(UILabel *)v20 setFont:v21];

    [(SKUIStackedBarCell *)v8 addSubview:v8->_expandedLabel];
    v22 = [(SKUIStackedBarCell *)v8 tintColor];
    [(SKUIStackedBarCell *)v8 setTitleColor:v22 forState:0];

    v23 = [(SKUIStackedBarCell *)v8 titleLabel];
    v24 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [v23 setFont:v24];

    v25 = [(SKUIStackedBarCell *)v8 titleLabel];
    [v25 setTextAlignment:1];
  }
  return v8;
}

- (void)setHighlighted:(BOOL)a3
{
  if (!self->_expanded)
  {
    v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8824 alpha:0.82];
    double v6 = 0.25;
    if (!a3)
    {
      uint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];

      double v6 = 0.47;
      v5 = (void *)v7;
    }
    v8 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__SKUIStackedBarCell_setHighlighted___block_invoke;
    v10[3] = &unk_1E6421FF8;
    v10[4] = self;
    id v11 = v5;
    id v9 = v5;
    [v8 animateWithDuration:v10 animations:0 completion:v6];
  }
}

uint64_t __37__SKUIStackedBarCell_setHighlighted___block_invoke(uint64_t a1)
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
    double v6 = [(SKUIStackedBarCell *)self titleLabel];
    uint64_t v7 = v6;
    double v8 = 0.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.705882353, 0.705882353);
    [(UILabel *)expandedLabel setTransform:&v9];
    double v5 = 0.0;
    [(UILabel *)self->_expandedLabel setAlpha:0.0];
    double v6 = [(SKUIStackedBarCell *)self titleLabel];
    uint64_t v7 = v6;
    double v8 = 1.0;
  }
  [v6 setAlpha:v8];

  [(UIButton *)self->_backButton setAlpha:v5];
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIStackedBarCell;
  id v6 = a3;
  [(SKUIStackedBarCell *)&v7 setTitle:v6 forState:a4];
  -[UILabel setText:](self->_expandedLabel, "setText:", v6, v7.receiver, v7.super_class);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  if (!self->_expanded) {
    double v3 = 25.0;
  }
  result.double height = v3;
  return result;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SKUIStackedBarCell;
  [(SKUIStackedBarCell *)&v22 layoutSubviews];
  [(SKUIStackedBarCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(SKUIStackedBarCell *)self bounds];
  CGFloat Width = CGRectGetWidth(v23);
  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  CGFloat v15 = 1.0 / v14;

  [(SKUIStackedBarCell *)self bounds];
  double Height = CGRectGetHeight(v24);
  v25.origin.double x = 0.0;
  v25.origin.double y = v11;
  v25.size.double width = Width;
  v25.size.double height = v15;
  CGFloat v17 = CGRectGetHeight(v25);
  separator = self->_separator;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, Height - v17, Width, v15, v4, v6, v8, v10);
  -[UIView setFrame:](separator, "setFrame:");
  backButton = self->_backButton;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, 0.0, 47.0, 42.0, v4, v6, v8, v10);
  -[UIButton setFrame:](backButton, "setFrame:");
  [(UILabel *)self->_expandedLabel sizeToFit];
  expandedLabel = self->_expandedLabel;
  v21 = [(SKUIStackedBarCell *)self titleLabel];
  [v21 center];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStackedBarCell initWithFrame:]";
}

@end