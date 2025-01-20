@interface SKUIQuicklinksView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (SKUIQuicklinksView)initWithFrame:(CGRect)a3;
- (UIView)collectionView;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIQuicklinksView

- (SKUIQuicklinksView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIQuicklinksView initWithFrame:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIQuicklinksView;
  v8 = -[SKUIQuicklinksView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    borderView = v8->_borderView;
    v8->_borderView = v9;

    v11 = v8->_borderView;
    v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v11 setBackgroundColor:v12];

    [(SKUIQuicklinksView *)v8 addSubview:v8->_borderView];
  }
  return v8;
}

- (void)setCollectionView:(id)a3
{
  v5 = (UIView *)a3;
  collectionView = self->_collectionView;
  v7 = v5;
  if (collectionView != v5)
  {
    [(UIView *)collectionView removeFromSuperview];
    objc_storeStrong((id *)&self->_collectionView, a3);
    if (self->_collectionView) {
      -[SKUIQuicklinksView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v17 = a3;
  v4 = [v17 backgroundColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v7 = v6;

  [(SKUIQuicklinksView *)self setBackgroundColor:v7];
  [(UIView *)self->_collectionView setBackgroundColor:v7];
  v8 = [v17 secondaryTextColor];
  titleColor = self->_titleColor;
  self->_titleColor = v8;

  if (self->_titleColor)
  {
    titleLabel = self->_titleLabel;
LABEL_7:
    -[UILabel setTextColor:](titleLabel, "setTextColor:");
    goto LABEL_8;
  }
  v11 = [v17 primaryTextColor];
  v12 = self->_titleColor;
  self->_titleColor = v11;

  titleLabel = self->_titleLabel;
  if (self->_titleColor) {
    goto LABEL_7;
  }
  v16 = [MEMORY[0x1E4FB1618] blackColor];
  [(UILabel *)titleLabel setTextColor:v16];

LABEL_8:
  v13 = [v17 primaryTextColor];
  borderView = self->_borderView;
  if (v13)
  {
    [(UIView *)borderView setBackgroundColor:v13];
  }
  else
  {
    v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)borderView setBackgroundColor:v15];
  }
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  if (v4 != v15 && ([v4 isEqualToString:v15] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        id v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        v9 = [(SKUIQuicklinksView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          objc_super v14 = [MEMORY[0x1E4FB1618] blackColor];
          [(UILabel *)v12 setTextColor:v14];
        }
        [(SKUIQuicklinksView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v13 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SKUIQuicklinksView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SKUIQuicklinksView *)self bounds];
  double v4 = v3;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    CGFloat v7 = v6;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, 15.0, v4 + -15.0 + -15.0);
    v14.origin.double x = 15.0;
    v14.origin.double y = 15.0;
    v14.size.double width = v4 + -15.0 + -15.0;
    v14.size.double height = v7;
    double v8 = CGRectGetMaxY(v14) + 11.0;
  }
  else
  {
    double v8 = 15.0;
  }
  [(UIView *)self->_collectionView frame];
  -[UIView setFrame:](self->_collectionView, "setFrame:", 0.0, v8, v4);
  v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  double v11 = 1.0 / v10;

  borderView = self->_borderView;

  -[UIView setFrame:](borderView, "setFrame:", 0.0, v8 - v11, v4, v11);
}

- (void)setBackgroundColor:(id)a3
{
  collectionView = self->_collectionView;
  id v5 = a3;
  [(UIView *)collectionView setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIQuicklinksView;
  [(SKUIQuicklinksView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    double v7 = v6 + 30.0;
  }
  else
  {
    double v7 = 30.0;
  }
  collectionView = self->_collectionView;
  if (collectionView)
  {
    [(UIView *)collectionView frame];
    double v7 = v7 + v9;
  }
  if (self->_titleLabel && self->_collectionView) {
    double v7 = v7 + 11.0;
  }
  double v10 = width;
  double v11 = v7;
  result.double height = v11;
  result.CGFloat width = v10;
  return result;
}

- (UIView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_borderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIQuicklinksView initWithFrame:]";
}

@end