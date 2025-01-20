@interface SKUIGallerySwooshCollectionViewCell
- (NSString)title;
- (UIView)contentChildView;
- (void)layoutSubviews;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setContentChildView:(id)a3;
- (void)setTitle:(id)a3;
- (void)title;
@end

@implementation SKUIGallerySwooshCollectionViewCell

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGallerySwooshCollectionViewCell setColoringWithColorScheme:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [v4 primaryTextColor];
  p_titleColor = &self->_titleColor;
  titleColor = self->_titleColor;
  if (titleColor != v13 && ([(UIColor *)titleColor isEqual:v13] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, v13);
    titleLabel = self->_titleLabel;
    if (*p_titleColor)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:");
    }
    else
    {
      v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.235294118 alpha:1.0];
      [(UILabel *)titleLabel setTextColor:v17];
    }
  }
}

- (void)setContentChildView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIGallerySwooshCollectionViewCell setContentChildView:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_contentChildView = &self->_contentChildView;
  v15 = v5;
  if (self->_contentChildView != v5)
  {
    if ([(UIView *)self->_contentChildView isDescendantOfView:self]) {
      [(UIView *)*p_contentChildView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentChildView, a3);
    [(SKUIGallerySwooshCollectionViewCell *)self setNeedsLayout];
    v15 = *p_contentChildView;
  }
  if (v15 && ![(UIView *)v15 isDescendantOfView:self])
  {
    v16 = [(SKUIGallerySwooshCollectionViewCell *)self contentView];
    [v16 addSubview:*p_contentChildView];
    [(SKUIGallerySwooshCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGallerySwooshCollectionViewCell setTitle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(UILabel *)self->_titleLabel text];
  v14 = v13;
  if (v13 != v4 && ([v13 isEqualToString:v4] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v4)
    {
      if (!titleLabel)
      {
        v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v17 = self->_titleLabel;
        self->_titleLabel = v16;

        v18 = self->_titleLabel;
        v19 = [(SKUIGallerySwooshCollectionViewCell *)self backgroundColor];
        [(UILabel *)v18 setBackgroundColor:v19];

        v20 = self->_titleLabel;
        v21 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
        [(UILabel *)v20 setFont:v21];

        v22 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          v24 = [MEMORY[0x1E4FB1618] colorWithWhite:0.235294118 alpha:1.0];
          [(UILabel *)v22 setTextColor:v24];
        }
        v25 = [(SKUIGallerySwooshCollectionViewCell *)self contentView];
        [v25 addSubview:self->_titleLabel];

        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setText:v4];
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v23 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SKUIGallerySwooshCollectionViewCell *)self setNeedsLayout];
  }
}

- (NSString)title
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGallerySwooshCollectionViewCell *)v3 title];
      }
    }
  }
  uint64_t v11 = [(UILabel *)self->_titleLabel text];

  return (NSString *)v11;
}

- (void)layoutSubviews
{
}

- (UIView)contentChildView
{
  return self->_contentChildView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);

  objc_storeStrong((id *)&self->_contentChildView, 0);
}

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContentChildView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)title
{
}

@end