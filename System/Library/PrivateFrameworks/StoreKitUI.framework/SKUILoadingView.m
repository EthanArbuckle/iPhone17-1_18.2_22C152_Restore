@interface SKUILoadingView
+ (id)defaultLoadingTextWithClientContext:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)loadingText;
- (SKUIColorScheme)colorScheme;
- (SKUILoadingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setLoadingText:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation SKUILoadingView

- (SKUILoadingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadingView initWithFrame:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUILoadingView;
  v8 = -[SKUILoadingView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v8->_spinner;
    v8->_spinner = (UIActivityIndicatorView *)v9;

    [(UIActivityIndicatorView *)v8->_spinner sizeToFit];
    [(SKUILoadingView *)v8 addSubview:v8->_spinner];
  }
  return v8;
}

+ (id)defaultLoadingTextWithClientContext:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUILoadingView defaultLoadingTextWithClientContext:]();
    if (v3) {
      goto LABEL_5;
    }
  }
  else if (v3)
  {
LABEL_5:
    uint64_t v4 = [v3 localizedStringForKey:@"DEFAULT_LOADING_TEXT"];
    goto LABEL_8;
  }
  uint64_t v4 = +[SKUIClientContext localizedStringForKey:@"DEFAULT_LOADING_TEXT" inBundles:0];
LABEL_8:
  v5 = (void *)v4;

  return v5;
}

- (NSString)loadingText
{
  return [(UILabel *)self->_label text];
}

- (void)setColorScheme:(id)a3
{
  if (self->_colorScheme != a3)
  {
    uint64_t v4 = (SKUIColorScheme *)[a3 copy];
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;

    uint64_t v6 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x1E4FB1618] labelColor];
    }
    id v7 = (id)v6;
    [(UIActivityIndicatorView *)self->_spinner setColor:v6];
    [(UILabel *)self->_label setTextColor:v7];
  }
}

- (void)setLoadingText:(id)a3
{
  id v4 = a3;
  label = self->_label;
  id v16 = v4;
  if (v4)
  {
    if (!label)
    {
      uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      id v7 = self->_label;
      self->_label = v6;

      v8 = self->_label;
      uint64_t v9 = [(SKUILoadingView *)self backgroundColor];
      [(UILabel *)v8 setBackgroundColor:v9];

      v10 = self->_label;
      v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
      [(UILabel *)v10 setFont:v11];

      objc_super v12 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];
      v13 = self->_label;
      if (v12)
      {
        [(UILabel *)self->_label setTextColor:v12];
      }
      else
      {
        v15 = [MEMORY[0x1E4FB1618] labelColor];
        [(UILabel *)v13 setTextColor:v15];
      }
      [(SKUILoadingView *)self addSubview:self->_label];

      label = self->_label;
    }
    [(UILabel *)label setText:v16];
    [(UILabel *)self->_label sizeToFit];
    [(SKUILoadingView *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)label removeFromSuperview];
    v14 = self->_label;
    self->_label = 0;
  }
}

- (void)layoutSubviews
{
  [(SKUILoadingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  spinner = self->_spinner;
  if (spinner)
  {
    [(UIActivityIndicatorView *)spinner frame];
    float v9 = (v4 - v8) * 0.5;
    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", floorf(v9), 0.0);
  }
  label = self->_label;
  if (label)
  {
    [(UILabel *)label frame];
    float v13 = (v4 - v12) * 0.5;
    double v14 = floorf(v13);
    v15 = self->_label;
    -[UILabel setFrame:](v15, "setFrame:", v14, v6 - v11);
  }
}

- (void)setBackgroundColor:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [(UILabel *)label setBackgroundColor:v5];
  [(UIActivityIndicatorView *)self->_spinner setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUILoadingView;
  [(SKUILoadingView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  spinner = self->_spinner;
  if (spinner)
  {
    [(UIActivityIndicatorView *)spinner frame];
    double width = v5;
    [(UIActivityIndicatorView *)self->_spinner frame];
    double v8 = v7 + 0.0;
  }
  else
  {
    double width = a3.width;
    double v8 = 0.0;
  }
  label = self->_label;
  if (label)
  {
    -[UILabel sizeThatFits:](label, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    if (width < v10) {
      double width = v10;
    }
    double v8 = v8 + 18.0;
  }
  double v11 = width;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIActivityIndicatorView *)self->_spinner isAnimating];
  if (v4)
  {
    if (!v5) {
      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
  }
  else if (v5)
  {
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUILoadingView;
  [(SKUILoadingView *)&v6 willMoveToSuperview:v4];
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_colorScheme, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadingView initWithFrame:]";
}

+ (void)defaultLoadingTextWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUILoadingView defaultLoadingTextWithClientContext:]";
}

@end