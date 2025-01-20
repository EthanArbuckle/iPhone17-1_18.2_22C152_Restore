@interface SUUIGroupedHeaderView
- (BOOL)hasBottomBorder;
- (BOOL)hasTopBorder;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (SUUIGroupedHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHasBottomBorder:(BOOL)a3;
- (void)setHasTopBorder:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIGroupedHeaderView

- (SUUIGroupedHeaderView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SUUIGroupedHeaderView;
  v3 = -[SUUIGroupedHeaderView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] colorWithWhite:0.94 alpha:1.0];
    [(SUUIGroupedHeaderView *)v3 setBackgroundColor:v4];

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    v7 = v3->_titleLabel;
    v8 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v7 setFont:v8];

    v9 = v3->_titleLabel;
    v10 = [MEMORY[0x263F825C8] colorWithWhite:0.43 alpha:1.0];
    [(UILabel *)v9 setTextColor:v10];

    [(SUUIGroupedHeaderView *)v3 addSubview:v3->_titleLabel];
    v11 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    topBorder = v3->_topBorder;
    v3->_topBorder = v11;

    v13 = v3->_topBorder;
    v14 = [MEMORY[0x263F825C8] colorWithWhite:0.85 alpha:1.0];
    [(UIView *)v13 setBackgroundColor:v14];

    [(SUUIGroupedHeaderView *)v3 addSubview:v3->_topBorder];
    v15 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    botBorder = v3->_botBorder;
    v3->_botBorder = v15;

    v17 = v3->_botBorder;
    v18 = [MEMORY[0x263F825C8] colorWithWhite:0.85 alpha:1.0];
    [(UIView *)v17 setBackgroundColor:v18];

    [(SUUIGroupedHeaderView *)v3 addSubview:v3->_botBorder];
  }
  return v3;
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
  v21.receiver = self;
  v21.super_class = (Class)SUUIGroupedHeaderView;
  [(SUUIGroupedHeaderView *)&v21 layoutSubviews];
  [(SUUIGroupedHeaderView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_titleLabel sizeToFit];
  [(UILabel *)self->_titleLabel frame];
  double v12 = v11;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.double width = v8;
  v22.size.double height = v10;
  CGFloat MaxY = CGRectGetMaxY(v22);
  [(UILabel *)self->_titleLabel setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v4 + 15.0, MaxY - v12 + -5.0, v8 + 30.0, v12, v4, v6, v8, v10)];
  if (storeShouldReverseLayoutDirection()) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 0;
  }
  [(UILabel *)self->_titleLabel setTextAlignment:v14];
  v15 = [MEMORY[0x263F82B60] mainScreen];
  [v15 scale];
  double v17 = 1.0 / v16;

  -[UIView setFrame:](self->_topBorder, "setFrame:", v4, v6, v8, v17);
  v18 = [MEMORY[0x263F82B60] mainScreen];
  [v18 scale];
  double v20 = 1.0 / v19;

  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.double width = v8;
  v23.size.double height = v10;
  -[UIView setFrame:](self->_botBorder, "setFrame:", v4, CGRectGetMaxY(v23) - v20, v8, v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_botBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end