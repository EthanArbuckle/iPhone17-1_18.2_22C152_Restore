@interface SKUIProductPageTableExpandableHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)actionString;
- (NSString)title;
- (SKUIColorScheme)colorScheme;
- (UIColor)bottomBorderColor;
- (UIColor)topBorderColor;
- (void)actionString;
- (void)bottomBorderColor;
- (void)layoutSubviews;
- (void)setActionString:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBottomBorderColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopBorderColor:(id)a3;
- (void)title;
- (void)topBorderColor;
@end

@implementation SKUIProductPageTableExpandableHeaderView

- (NSString)actionString
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProductPageTableExpandableHeaderView *)v3 actionString];
      }
    }
  }
  v11 = [(UILabel *)self->_actionLabel text];

  return (NSString *)v11;
}

- (UIColor)bottomBorderColor
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProductPageTableExpandableHeaderView *)v3 bottomBorderColor];
      }
    }
  }
  v11 = [(UIView *)self->_bottomBorderView backgroundColor];

  return (UIColor *)v11;
}

- (void)setActionString:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageTableExpandableHeaderView setActionString:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIProductPageTableExpandableHeaderView *)self actionString];
  v14 = v13;
  if (v13 != v4 && ([v13 isEqualToString:v4] & 1) == 0)
  {
    uint64_t v15 = [v4 length];
    actionLabel = self->_actionLabel;
    if (v15)
    {
      if (!actionLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v18 = self->_actionLabel;
        self->_actionLabel = v17;

        v19 = self->_actionLabel;
        v20 = [(SKUIProductPageTableExpandableHeaderView *)self backgroundColor];
        [(UILabel *)v19 setBackgroundColor:v20];

        v21 = self->_actionLabel;
        v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
        [(UILabel *)v21 setFont:v22];

        v23 = self->_actionLabel;
        v24 = [(SKUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v24)
        {
          [(UILabel *)v23 setTextColor:v24];
        }
        else
        {
          v26 = [(SKUIProductPageTableExpandableHeaderView *)self tintColor];
          [(UILabel *)v23 setTextColor:v26];
        }
        [(SKUIProductPageTableExpandableHeaderView *)self addSubview:self->_actionLabel];
        actionLabel = self->_actionLabel;
      }
      [(UILabel *)actionLabel setText:v4];
      [(UILabel *)self->_actionLabel sizeToFit];
    }
    else
    {
      [(UILabel *)actionLabel removeFromSuperview];
      v25 = self->_actionLabel;
      self->_actionLabel = 0;
    }
    [(SKUIProductPageTableExpandableHeaderView *)self setNeedsLayout];
  }
}

- (void)setBottomBorderColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageTableExpandableHeaderView setBottomBorderColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  bottomBorderView = self->_bottomBorderView;
  if (v4)
  {
    if (!bottomBorderView)
    {
      v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      uint64_t v15 = self->_bottomBorderView;
      self->_bottomBorderView = v14;

      [(SKUIProductPageTableExpandableHeaderView *)self addSubview:self->_bottomBorderView];
      bottomBorderView = self->_bottomBorderView;
    }
    [(UIView *)bottomBorderView setBackgroundColor:v4];
  }
  else
  {
    [(UIView *)bottomBorderView removeFromSuperview];
    v16 = self->_bottomBorderView;
    self->_bottomBorderView = 0;
  }
}

- (void)setColorScheme:(id)a3
{
  BOOL v5 = (SKUIColorScheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIProductPageTableExpandableHeaderView setColorScheme:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    actionLabel = self->_actionLabel;
    v16 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v16)
    {
      [(UILabel *)actionLabel setTextColor:v16];
    }
    else
    {
      v17 = [(SKUIProductPageTableExpandableHeaderView *)self tintColor];
      [(UILabel *)actionLabel setTextColor:v17];
    }
    titleLabel = self->_titleLabel;
    v19 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v19)
    {
      [(UILabel *)titleLabel setTextColor:v19];
    }
    else
    {
      v20 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)titleLabel setTextColor:v20];
    }
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
        -[SKUIProductPageTableExpandableHeaderView setTitle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIProductPageTableExpandableHeaderView *)self title];
  v14 = v13;
  if (v13 != v4 && ([v13 isEqualToString:v4] & 1) == 0)
  {
    uint64_t v15 = [v4 length];
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v18 = self->_titleLabel;
        self->_titleLabel = v17;

        v19 = self->_titleLabel;
        v20 = [(SKUIProductPageTableExpandableHeaderView *)self backgroundColor];
        [(UILabel *)v19 setBackgroundColor:v20];

        v21 = self->_titleLabel;
        v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
        [(UILabel *)v21 setFont:v22];

        v23 = self->_titleLabel;
        v24 = [(SKUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v24)
        {
          [(UILabel *)v23 setTextColor:v24];
        }
        else
        {
          v26 = [MEMORY[0x1E4FB1618] blackColor];
          [(UILabel *)v23 setTextColor:v26];
        }
        [(SKUIProductPageTableExpandableHeaderView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setText:v4];
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v25 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SKUIProductPageTableExpandableHeaderView *)self setNeedsLayout];
  }
}

- (void)setTopBorderColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageTableExpandableHeaderView setTopBorderColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  topBorderView = self->_topBorderView;
  if (v4)
  {
    if (!topBorderView)
    {
      v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      uint64_t v15 = self->_topBorderView;
      self->_topBorderView = v14;

      [(SKUIProductPageTableExpandableHeaderView *)self addSubview:self->_topBorderView];
      topBorderView = self->_topBorderView;
    }
    [(UIView *)topBorderView setBackgroundColor:v4];
  }
  else
  {
    [(UIView *)topBorderView removeFromSuperview];
    v16 = self->_topBorderView;
    self->_topBorderView = 0;
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
        [(SKUIProductPageTableExpandableHeaderView *)v3 title];
      }
    }
  }
  uint64_t v11 = [(UILabel *)self->_titleLabel text];

  return (NSString *)v11;
}

- (UIColor)topBorderColor
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProductPageTableExpandableHeaderView *)v3 topBorderColor];
      }
    }
  }
  uint64_t v11 = [(UIView *)self->_topBorderView backgroundColor];

  return (UIColor *)v11;
}

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageTableExpandableHeaderView setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UILabel *)self->_actionLabel setBackgroundColor:v4];
  [(UILabel *)self->_titleLabel setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageTableExpandableHeaderView;
  [(SKUIProductPageTableExpandableHeaderView *)&v13 setBackgroundColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIProductPageTableExpandableHeaderView sizeThatFits:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = 44.0;
  double v13 = width;
  result.height = v12;
  result.CGFloat width = v13;
  return result;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);

  objc_storeStrong((id *)&self->_actionLabel, 0);
}

- (void)actionString
{
}

- (void)bottomBorderColor
{
}

- (void)setActionString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBottomBorderColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTopBorderColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)title
{
}

- (void)topBorderColor
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end