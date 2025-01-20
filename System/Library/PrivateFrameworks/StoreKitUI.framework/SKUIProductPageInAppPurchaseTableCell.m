@interface SKUIProductPageInAppPurchaseTableCell
- (NSString)indexString;
- (NSString)priceString;
- (NSString)productName;
- (SKUIColorScheme)colorScheme;
- (UIEdgeInsets)contentInsets;
- (void)indexString;
- (void)layoutSubviews;
- (void)priceString;
- (void)productName;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setIndexString:(id)a3;
- (void)setPriceString:(id)a3;
- (void)setProductName:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SKUIProductPageInAppPurchaseTableCell

- (NSString)indexString
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProductPageInAppPurchaseTableCell *)v3 indexString];
      }
    }
  }
  v11 = [(UILabel *)self->_indexLabel text];

  return (NSString *)v11;
}

- (NSString)priceString
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProductPageInAppPurchaseTableCell *)v3 priceString];
      }
    }
  }
  v11 = [(UILabel *)self->_priceLabel text];

  return (NSString *)v11;
}

- (NSString)productName
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProductPageInAppPurchaseTableCell *)v3 productName];
      }
    }
  }
  v11 = [(UILabel *)self->_nameLabel text];

  return (NSString *)v11;
}

- (void)setColorScheme:(id)a3
{
  uint64_t v5 = (SKUIColorScheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIProductPageInAppPurchaseTableCell setColorScheme:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    indexLabel = self->_indexLabel;
    v16 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v16)
    {
      [(UILabel *)indexLabel setTextColor:v16];
    }
    else
    {
      v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
      [(UILabel *)indexLabel setTextColor:v17];
    }
    priceLabel = self->_priceLabel;
    v19 = [(SKUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v19)
    {
      [(UILabel *)priceLabel setTextColor:v19];
    }
    else
    {
      v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
      [(UILabel *)priceLabel setTextColor:v20];
    }
    nameLabel = self->_nameLabel;
    v22 = [(SKUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v22)
    {
      [(UILabel *)nameLabel setTextColor:v22];
    }
    else
    {
      v23 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)nameLabel setTextColor:v23];
    }
  }
}

- (void)setIndexString:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageInAppPurchaseTableCell setIndexString:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIProductPageInAppPurchaseTableCell *)self indexString];
  v14 = v13;
  if (v13 != v4 && ([v13 isEqualToString:v4] & 1) == 0)
  {
    uint64_t v15 = [v4 length];
    indexLabel = self->_indexLabel;
    if (v15)
    {
      if (!indexLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v18 = self->_indexLabel;
        self->_indexLabel = v17;

        v19 = self->_indexLabel;
        v20 = [(SKUIProductPageInAppPurchaseTableCell *)self backgroundColor];
        [(UILabel *)v19 setBackgroundColor:v20];

        v21 = self->_indexLabel;
        v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
        [(UILabel *)v21 setFont:v22];

        [(UILabel *)self->_indexLabel setTextAlignment:1];
        v23 = self->_indexLabel;
        v24 = [(SKUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v24)
        {
          [(UILabel *)v23 setTextColor:v24];
        }
        else
        {
          v26 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
          [(UILabel *)v23 setTextColor:v26];
        }
        v27 = [(SKUIProductPageInAppPurchaseTableCell *)self contentView];
        [v27 addSubview:self->_indexLabel];

        indexLabel = self->_indexLabel;
      }
      [(UILabel *)indexLabel setText:v4];
    }
    else
    {
      [(UILabel *)indexLabel removeFromSuperview];
      v25 = self->_indexLabel;
      self->_indexLabel = 0;
    }
    [(SKUIProductPageInAppPurchaseTableCell *)self setNeedsLayout];
  }
}

- (void)setPriceString:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageInAppPurchaseTableCell setPriceString:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIProductPageInAppPurchaseTableCell *)self priceString];
  v14 = v13;
  if (v13 != v4 && ([v13 isEqualToString:v4] & 1) == 0)
  {
    uint64_t v15 = [v4 length];
    priceLabel = self->_priceLabel;
    if (v15)
    {
      if (!priceLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v18 = self->_priceLabel;
        self->_priceLabel = v17;

        v19 = self->_priceLabel;
        v20 = [(SKUIProductPageInAppPurchaseTableCell *)self backgroundColor];
        [(UILabel *)v19 setBackgroundColor:v20];

        v21 = self->_priceLabel;
        v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
        [(UILabel *)v21 setFont:v22];

        v23 = self->_priceLabel;
        v24 = [(SKUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v24)
        {
          [(UILabel *)v23 setTextColor:v24];
        }
        else
        {
          v26 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
          [(UILabel *)v23 setTextColor:v26];
        }
        v27 = [(SKUIProductPageInAppPurchaseTableCell *)self contentView];
        [v27 addSubview:self->_priceLabel];

        priceLabel = self->_priceLabel;
      }
      [(UILabel *)priceLabel setText:v4];
      [(UILabel *)self->_priceLabel sizeToFit];
    }
    else
    {
      [(UILabel *)priceLabel removeFromSuperview];
      v25 = self->_priceLabel;
      self->_priceLabel = 0;
    }
    [(SKUIProductPageInAppPurchaseTableCell *)self setNeedsLayout];
  }
}

- (void)setProductName:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProductPageInAppPurchaseTableCell setProductName:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIProductPageInAppPurchaseTableCell *)self productName];
  v14 = v13;
  if (v13 != v4 && ([v13 isEqualToString:v4] & 1) == 0)
  {
    uint64_t v15 = [v4 length];
    nameLabel = self->_nameLabel;
    if (v15)
    {
      if (!nameLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v18 = self->_nameLabel;
        self->_nameLabel = v17;

        v19 = self->_nameLabel;
        v20 = [(SKUIProductPageInAppPurchaseTableCell *)self backgroundColor];
        [(UILabel *)v19 setBackgroundColor:v20];

        v21 = self->_nameLabel;
        v22 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:14.0];
        [(UILabel *)v21 setFont:v22];

        v23 = self->_nameLabel;
        v24 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];
        if (v24)
        {
          [(UILabel *)v23 setTextColor:v24];
        }
        else
        {
          v26 = [MEMORY[0x1E4FB1618] blackColor];
          [(UILabel *)v23 setTextColor:v26];
        }
        v27 = [(SKUIProductPageInAppPurchaseTableCell *)self contentView];
        [v27 addSubview:self->_nameLabel];

        nameLabel = self->_nameLabel;
      }
      [(UILabel *)nameLabel setText:v4];
    }
    else
    {
      [(UILabel *)nameLabel removeFromSuperview];
      v25 = self->_nameLabel;
      self->_nameLabel = 0;
    }
    [(SKUIProductPageInAppPurchaseTableCell *)self setNeedsLayout];
  }
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
        -[SKUIProductPageInAppPurchaseTableCell setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UILabel *)self->_indexLabel setBackgroundColor:v4];
  [(UILabel *)self->_nameLabel setBackgroundColor:v4];
  [(UILabel *)self->_priceLabel setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageInAppPurchaseTableCell;
  [(SKUIProductPageInAppPurchaseTableCell *)&v13 setBackgroundColor:v4];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v4) {
      -[SKUIProductPageInAppPurchaseTableCell setHighlighted:animated:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v4) {
      -[SKUIProductPageInAppPurchaseTableCell setSelected:animated:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_indexLabel, 0);

  objc_storeStrong((id *)&self->_colorScheme, 0);
}

- (void)indexString
{
}

- (void)priceString
{
}

- (void)productName
{
}

- (void)setColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setIndexString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPriceString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setProductName:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setHighlighted:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSelected:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end