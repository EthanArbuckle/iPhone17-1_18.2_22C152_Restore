@interface SUUIProductPageCopyrightView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)copyrightString;
- (SUUIColorScheme)colorScheme;
- (void)layoutSubviews;
- (void)setColorScheme:(id)a3;
- (void)setCopyrightString:(id)a3;
@end

@implementation SUUIProductPageCopyrightView

- (void)setColorScheme:(id)a3
{
  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    copyrightLabel = self->_copyrightLabel;
    v8 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      v9 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
      v10 = SUUIColorWithAlpha(v9, 0.3);
      [(UILabel *)copyrightLabel setTextColor:v10];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
      [(UILabel *)copyrightLabel setTextColor:v9];
    }

    v5 = v11;
  }
}

- (NSString)copyrightString
{
  return [(UILabel *)self->_copyrightLabel text];
}

- (void)setCopyrightString:(id)a3
{
  id v18 = a3;
  v4 = [(UILabel *)self->_copyrightLabel text];
  char v5 = [v4 isEqualToString:v18];

  id v7 = v18;
  if ((v5 & 1) == 0)
  {
    copyrightLabel = self->_copyrightLabel;
    if (v18)
    {
      if (!copyrightLabel)
      {
        v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v10 = self->_copyrightLabel;
        self->_copyrightLabel = v9;

        v11 = self->_copyrightLabel;
        v12 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [(UILabel *)v11 setFont:v12];

        [(UILabel *)self->_copyrightLabel setNumberOfLines:0];
        v13 = self->_copyrightLabel;
        v14 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v14)
        {
          v15 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
          v16 = SUUIColorWithAlpha(v15, 0.3);
          [(UILabel *)v13 setTextColor:v16];
        }
        else
        {
          v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
          [(UILabel *)v13 setTextColor:v15];
        }

        [(SUUIProductPageCopyrightView *)self addSubview:self->_copyrightLabel];
        copyrightLabel = self->_copyrightLabel;
      }
      uint64_t v6 = [(UILabel *)copyrightLabel setText:v18];
    }
    else
    {
      [(UILabel *)copyrightLabel removeFromSuperview];
      v17 = self->_copyrightLabel;
      self->_copyrightLabel = 0;
    }
    id v7 = v18;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)layoutSubviews
{
  [(SUUIProductPageCopyrightView *)self bounds];
  copyrightLabel = self->_copyrightLabel;
  if (copyrightLabel)
  {
    double v6 = v3;
    double v7 = v4;
    [(UILabel *)copyrightLabel frame];
    double v8 = v6 + -30.0;
    -[UILabel sizeThatFits:](self->_copyrightLabel, "sizeThatFits:", v8, v7);
    double v10 = v9;
    float v11 = (v7 - v9) * 0.5;
    v12 = self->_copyrightLabel;
    double v13 = roundf(v11);
    -[UILabel setFrame:](v12, "setFrame:", 15.0, v13, v8, v10);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UILabel sizeThatFits:](self->_copyrightLabel, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4 + 32.0;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_copyrightLabel, 0);
}

@end