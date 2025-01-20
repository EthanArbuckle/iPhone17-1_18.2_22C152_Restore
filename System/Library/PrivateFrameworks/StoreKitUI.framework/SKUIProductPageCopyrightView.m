@interface SKUIProductPageCopyrightView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)copyrightString;
- (SKUIColorScheme)colorScheme;
- (void)copyrightString;
- (void)layoutSubviews;
- (void)setColorScheme:(id)a3;
- (void)setCopyrightString:(id)a3;
@end

@implementation SKUIProductPageCopyrightView

- (void)setColorScheme:(id)a3
{
  v5 = (SKUIColorScheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIProductPageCopyrightView setColorScheme:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    copyrightLabel = self->_copyrightLabel;
    v16 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v16)
    {
      v17 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
      v18 = SKUIColorWithAlpha(v17, 0.3);
      [(UILabel *)copyrightLabel setTextColor:v18];
    }
    else
    {
      v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
      [(UILabel *)copyrightLabel setTextColor:v17];
    }
  }
}

- (NSString)copyrightString
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProductPageCopyrightView *)v3 copyrightString];
      }
    }
  }
  uint64_t v11 = [(UILabel *)self->_copyrightLabel text];

  return (NSString *)v11;
}

- (void)setCopyrightString:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageCopyrightView setCopyrightString:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(UILabel *)self->_copyrightLabel text];
  char v14 = [v13 isEqualToString:v4];

  if ((v14 & 1) == 0)
  {
    copyrightLabel = self->_copyrightLabel;
    if (v4)
    {
      if (!copyrightLabel)
      {
        v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v17 = self->_copyrightLabel;
        self->_copyrightLabel = v16;

        v18 = self->_copyrightLabel;
        v19 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
        [(UILabel *)v18 setFont:v19];

        [(UILabel *)self->_copyrightLabel setNumberOfLines:0];
        v20 = self->_copyrightLabel;
        v21 = [(SKUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v21)
        {
          v22 = [(SKUIColorScheme *)self->_colorScheme secondaryTextColor];
          v23 = SKUIColorWithAlpha(v22, 0.3);
          [(UILabel *)v20 setTextColor:v23];
        }
        else
        {
          v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
          [(UILabel *)v20 setTextColor:v22];
        }

        [(SKUIProductPageCopyrightView *)self addSubview:self->_copyrightLabel];
        copyrightLabel = self->_copyrightLabel;
      }
      [(UILabel *)copyrightLabel setText:v4];
    }
    else
    {
      [(UILabel *)copyrightLabel removeFromSuperview];
      v24 = self->_copyrightLabel;
      self->_copyrightLabel = 0;
    }
  }
}

- (void)layoutSubviews
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIProductPageCopyrightView sizeThatFits:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  -[UILabel sizeThatFits:](self->_copyrightLabel, "sizeThatFits:", width, height);
  double v15 = v14 + 32.0;
  double v16 = width;
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);

  objc_storeStrong((id *)&self->_copyrightLabel, 0);
}

- (void)setColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyrightString
{
}

- (void)setCopyrightString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end