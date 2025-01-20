@interface SUUILoadingView
+ (id)defaultLoadingTextWithClientContext:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)loadingText;
- (SUUIColorScheme)colorScheme;
- (SUUILoadingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setLoadingText:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation SUUILoadingView

- (SUUILoadingView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUILoadingView;
  v3 = -[SUUILoadingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    [(UIActivityIndicatorView *)v3->_spinner sizeToFit];
    [(SUUILoadingView *)v3 addSubview:v3->_spinner];
  }
  return v3;
}

+ (id)defaultLoadingTextWithClientContext:(id)a3
{
  if (a3) {
    [a3 localizedStringForKey:@"DEFAULT_LOADING_TEXT"];
  }
  else {
  v3 = +[SUUIClientContext localizedStringForKey:@"DEFAULT_LOADING_TEXT" inBundles:0];
  }
  return v3;
}

- (NSString)loadingText
{
  return [(UILabel *)self->_label text];
}

- (void)setColorScheme:(id)a3
{
  if (self->_colorScheme != a3)
  {
    uint64_t v4 = (SUUIColorScheme *)[a3 copy];
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;

    uint64_t v6 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x263F825C8] labelColor];
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
      uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      id v7 = self->_label;
      self->_label = v6;

      v8 = self->_label;
      v9 = [(SUUILoadingView *)self backgroundColor];
      [(UILabel *)v8 setBackgroundColor:v9];

      v10 = self->_label;
      v11 = [MEMORY[0x263F81708] systemFontOfSize:11.0];
      [(UILabel *)v10 setFont:v11];

      v12 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
      v13 = self->_label;
      if (v12)
      {
        [(UILabel *)self->_label setTextColor:v12];
      }
      else
      {
        v15 = [MEMORY[0x263F825C8] labelColor];
        [(UILabel *)v13 setTextColor:v15];
      }
      [(SUUILoadingView *)self addSubview:self->_label];

      label = self->_label;
    }
    [(UILabel *)label setText:v16];
    [(UILabel *)self->_label sizeToFit];
    [(SUUILoadingView *)self setNeedsLayout];
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
  [(SUUILoadingView *)self bounds];
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
  v6.super_class = (Class)SUUILoadingView;
  [(SUUILoadingView *)&v6 setBackgroundColor:v5];
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
  result.height = v12;
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
  v6.super_class = (Class)SUUILoadingView;
  [(SUUILoadingView *)&v6 willMoveToSuperview:v4];
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end