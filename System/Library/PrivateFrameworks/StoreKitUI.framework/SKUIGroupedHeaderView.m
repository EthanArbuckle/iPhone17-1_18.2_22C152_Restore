@interface SKUIGroupedHeaderView
- (BOOL)hasBottomBorder;
- (BOOL)hasTopBorder;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (SKUIGroupedHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHasBottomBorder:(BOOL)a3;
- (void)setHasTopBorder:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIGroupedHeaderView

- (SKUIGroupedHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGroupedHeaderView initWithFrame:]();
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIGroupedHeaderView;
  v8 = -[SKUIGroupedHeaderView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.94 alpha:1.0];
    [(SKUIGroupedHeaderView *)v8 setBackgroundColor:v9];

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v10;

    v12 = v8->_titleLabel;
    v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    [(UILabel *)v12 setFont:v13];

    v14 = v8->_titleLabel;
    v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.43 alpha:1.0];
    [(UILabel *)v14 setTextColor:v15];

    [(SKUIGroupedHeaderView *)v8 addSubview:v8->_titleLabel];
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topBorder = v8->_topBorder;
    v8->_topBorder = v16;

    v18 = v8->_topBorder;
    v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
    [(UIView *)v18 setBackgroundColor:v19];

    [(SKUIGroupedHeaderView *)v8 addSubview:v8->_topBorder];
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    botBorder = v8->_botBorder;
    v8->_botBorder = v20;

    v22 = v8->_botBorder;
    v23 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
    [(UIView *)v22 setBackgroundColor:v23];

    [(SKUIGroupedHeaderView *)v8 addSubview:v8->_botBorder];
  }
  return v8;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (BOOL)hasTopBorder
{
  return [(UIView *)self->_topBorder isHidden];
}

- (void)setHasTopBorder:(BOOL)a3
{
}

- (BOOL)hasBottomBorder
{
  return [(UIView *)self->_botBorder isHidden];
}

- (void)setHasBottomBorder:(BOOL)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(UILabel *)self->_titleLabel text];
  uint64_t v6 = [v5 length];

  double v7 = 35.0;
  if (v6) {
    double v7 = width;
  }
  double v8 = 56.0;
  if (!v6) {
    double v8 = height;
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SKUIGroupedHeaderView;
  [(SKUIGroupedHeaderView *)&v22 layoutSubviews];
  [(SKUIGroupedHeaderView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_titleLabel sizeToFit];
  [(UILabel *)self->_titleLabel frame];
  double v12 = v11;
  v23.origin.double x = v4;
  v23.origin.double y = v6;
  v23.size.double width = v8;
  v23.size.double height = v10;
  CGFloat MaxY = CGRectGetMaxY(v23);
  titleLabel = self->_titleLabel;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v4 + 15.0, MaxY - v12 + -5.0, v8 + 30.0, v12, v4, v6, v8, v10);
  -[UILabel setFrame:](titleLabel, "setFrame:");
  if (storeShouldReverseLayoutDirection()) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 0;
  }
  [(UILabel *)self->_titleLabel setTextAlignment:v15];
  v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v16 scale];
  double v18 = 1.0 / v17;

  -[UIView setFrame:](self->_topBorder, "setFrame:", v4, v6, v8, v18);
  v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v19 scale];
  double v21 = 1.0 / v20;

  v24.origin.double x = v4;
  v24.origin.double y = v6;
  v24.size.double width = v8;
  v24.size.double height = v10;
  -[UIView setFrame:](self->_botBorder, "setFrame:", v4, CGRectGetMaxY(v24) - v21, v8, v21);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_botBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGroupedHeaderView initWithFrame:]";
}

@end