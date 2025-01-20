@interface SKUIProductPagePlaceholderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIProductPagePlaceholderView)initWithPlaceholderString:(id)a3 isPad:(BOOL)a4;
- (UIColor)textColor;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation SKUIProductPagePlaceholderView

- (SKUIProductPagePlaceholderView)initWithPlaceholderString:(id)a3 isPad:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPagePlaceholderView initWithPlaceholderString:isPad:]();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIProductPagePlaceholderView;
  v7 = [(SKUIProductPagePlaceholderView *)&v21 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    v10 = [MEMORY[0x1E4FB1818] imageNamed:@"RelatedProxyGraphicApp" inBundle:v8];
    uint64_t v11 = [v9 initWithImage:v10];
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v11;

    [(SKUIProductPagePlaceholderView *)v7 addSubview:v7->_imageView];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v7->_label;
    v7->_label = v13;

    [(UILabel *)v7->_label setText:v6];
    v15 = v7->_label;
    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.384313732 alpha:1.0];
    [(UILabel *)v15 setTextColor:v16];

    v17 = v7->_label;
    double v18 = 12.0;
    if (v4) {
      double v18 = 18.0;
    }
    v19 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v18];
    [(UILabel *)v17 setFont:v19];

    [(UILabel *)v7->_label sizeToFit];
    [(SKUIProductPagePlaceholderView *)v7 addSubview:v7->_label];
  }
  return v7;
}

- (void)setTextColor:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_textColor, a3);
  label = self->_label;
  if (self->_textColor)
  {
    -[UILabel setTextColor:](self->_label, "setTextColor:");
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.384313732 alpha:1.0];
    [(UILabel *)label setTextColor:v6];
  }
}

- (void)layoutSubviews
{
  [(SKUIProductPagePlaceholderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIImageView *)self->_imageView frame];
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_label frame];
  float v12 = (v6 - (v10 + 7.0 + v11)) * 0.5;
  CGFloat v13 = floorf(v12);
  float v14 = (v4 - v8) * 0.5;
  CGFloat v15 = floorf(v14);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v15, v13, v8, v10);
  v22.origin.x = v15;
  v22.origin.y = v13;
  v22.size.width = v8;
  v22.size.height = v10;
  double v16 = CGRectGetMaxY(v22) + 7.0;
  [(UILabel *)self->_label frame];
  float v18 = (v4 - v17) * 0.5;
  label = self->_label;
  double v20 = floorf(v18);

  -[UILabel setFrame:](label, "setFrame:", v20, v16);
}

- (void)setBackgroundColor:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [(UIImageView *)imageView setBackgroundColor:v5];
  [(UILabel *)self->_label setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIProductPagePlaceholderView;
  [(SKUIProductPagePlaceholderView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(UIImageView *)self->_imageView frame];
  double v6 = v5 + 7.0;
  [(UILabel *)self->_label frame];
  double v8 = v6 + v7;
  double v9 = width;
  result.height = v8;
  result.CGFloat width = v9;
  return result;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)initWithPlaceholderString:isPad:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPagePlaceholderView initWithPlaceholderString:isPad:]";
}

@end