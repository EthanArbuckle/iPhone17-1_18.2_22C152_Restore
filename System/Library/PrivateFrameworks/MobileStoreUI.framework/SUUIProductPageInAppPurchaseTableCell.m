@interface SUUIProductPageInAppPurchaseTableCell
- (NSString)indexString;
- (NSString)priceString;
- (NSString)productName;
- (SUUIColorScheme)colorScheme;
- (UIEdgeInsets)contentInsets;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setIndexString:(id)a3;
- (void)setPriceString:(id)a3;
- (void)setProductName:(id)a3;
@end

@implementation SUUIProductPageInAppPurchaseTableCell

- (NSString)indexString
{
  return [(UILabel *)self->_indexLabel text];
}

- (NSString)priceString
{
  return [(UILabel *)self->_priceLabel text];
}

- (NSString)productName
{
  return [(UILabel *)self->_nameLabel text];
}

- (void)setColorScheme:(id)a3
{
  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    indexLabel = self->_indexLabel;
    v8 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UILabel *)indexLabel setTextColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
      [(UILabel *)indexLabel setTextColor:v9];
    }
    priceLabel = self->_priceLabel;
    v11 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v11)
    {
      [(UILabel *)priceLabel setTextColor:v11];
    }
    else
    {
      v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
      [(UILabel *)priceLabel setTextColor:v12];
    }
    nameLabel = self->_nameLabel;
    v14 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v14)
    {
      [(UILabel *)nameLabel setTextColor:v14];
    }
    else
    {
      v15 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)nameLabel setTextColor:v15];
    }
    v5 = v16;
  }
}

- (void)setIndexString:(id)a3
{
  id v18 = a3;
  id v4 = [(SUUIProductPageInAppPurchaseTableCell *)self indexString];
  if (v4 != v18 && ([v4 isEqualToString:v18] & 1) == 0)
  {
    uint64_t v5 = [v18 length];
    indexLabel = self->_indexLabel;
    if (v5)
    {
      if (!indexLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v8 = self->_indexLabel;
        self->_indexLabel = v7;

        v9 = self->_indexLabel;
        v10 = [(SUUIProductPageInAppPurchaseTableCell *)self backgroundColor];
        [(UILabel *)v9 setBackgroundColor:v10];

        v11 = self->_indexLabel;
        v12 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [(UILabel *)v11 setFont:v12];

        [(UILabel *)self->_indexLabel setTextAlignment:1];
        v13 = self->_indexLabel;
        v14 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v14)
        {
          [(UILabel *)v13 setTextColor:v14];
        }
        else
        {
          v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
          [(UILabel *)v13 setTextColor:v16];
        }
        v17 = [(SUUIProductPageInAppPurchaseTableCell *)self contentView];
        [v17 addSubview:self->_indexLabel];

        indexLabel = self->_indexLabel;
      }
      [(UILabel *)indexLabel setText:v18];
    }
    else
    {
      [(UILabel *)indexLabel removeFromSuperview];
      v15 = self->_indexLabel;
      self->_indexLabel = 0;
    }
    [(SUUIProductPageInAppPurchaseTableCell *)self setNeedsLayout];
  }
}

- (void)setPriceString:(id)a3
{
  id v18 = a3;
  id v4 = [(SUUIProductPageInAppPurchaseTableCell *)self priceString];
  if (v4 != v18 && ([v4 isEqualToString:v18] & 1) == 0)
  {
    uint64_t v5 = [v18 length];
    priceLabel = self->_priceLabel;
    if (v5)
    {
      if (!priceLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v8 = self->_priceLabel;
        self->_priceLabel = v7;

        v9 = self->_priceLabel;
        v10 = [(SUUIProductPageInAppPurchaseTableCell *)self backgroundColor];
        [(UILabel *)v9 setBackgroundColor:v10];

        v11 = self->_priceLabel;
        v12 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [(UILabel *)v11 setFont:v12];

        v13 = self->_priceLabel;
        v14 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v14)
        {
          [(UILabel *)v13 setTextColor:v14];
        }
        else
        {
          v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
          [(UILabel *)v13 setTextColor:v16];
        }
        v17 = [(SUUIProductPageInAppPurchaseTableCell *)self contentView];
        [v17 addSubview:self->_priceLabel];

        priceLabel = self->_priceLabel;
      }
      [(UILabel *)priceLabel setText:v18];
      [(UILabel *)self->_priceLabel sizeToFit];
    }
    else
    {
      [(UILabel *)priceLabel removeFromSuperview];
      v15 = self->_priceLabel;
      self->_priceLabel = 0;
    }
    [(SUUIProductPageInAppPurchaseTableCell *)self setNeedsLayout];
  }
}

- (void)setProductName:(id)a3
{
  id v18 = a3;
  id v4 = [(SUUIProductPageInAppPurchaseTableCell *)self productName];
  if (v4 != v18 && ([v4 isEqualToString:v18] & 1) == 0)
  {
    uint64_t v5 = [v18 length];
    nameLabel = self->_nameLabel;
    if (v5)
    {
      if (!nameLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v8 = self->_nameLabel;
        self->_nameLabel = v7;

        v9 = self->_nameLabel;
        v10 = [(SUUIProductPageInAppPurchaseTableCell *)self backgroundColor];
        [(UILabel *)v9 setBackgroundColor:v10];

        v11 = self->_nameLabel;
        v12 = [MEMORY[0x263F81708] boldSystemFontOfSize:14.0];
        [(UILabel *)v11 setFont:v12];

        v13 = self->_nameLabel;
        v14 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
        if (v14)
        {
          [(UILabel *)v13 setTextColor:v14];
        }
        else
        {
          v16 = [MEMORY[0x263F825C8] blackColor];
          [(UILabel *)v13 setTextColor:v16];
        }
        v17 = [(SUUIProductPageInAppPurchaseTableCell *)self contentView];
        [v17 addSubview:self->_nameLabel];

        nameLabel = self->_nameLabel;
      }
      [(UILabel *)nameLabel setText:v18];
    }
    else
    {
      [(UILabel *)nameLabel removeFromSuperview];
      v15 = self->_nameLabel;
      self->_nameLabel = 0;
    }
    [(SUUIProductPageInAppPurchaseTableCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SUUIProductPageInAppPurchaseTableCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = self->_contentInsets.left + 15.0;
  indexLabel = self->_indexLabel;
  if (indexLabel)
  {
    [(UILabel *)indexLabel sizeToFit];
    [(UILabel *)self->_indexLabel frame];
    if (v9 < 15.0) {
      double v9 = 15.0;
    }
    float v11 = (v6 - v10) * 0.5;
    -[UILabel setFrame:](self->_indexLabel, "setFrame:", v7 + floor((15.0 - v9) * 0.5), ceilf(v11));
    double v7 = v7 + 15.0 + 15.0;
  }
  double v12 = v4 + -15.0;
  priceLabel = self->_priceLabel;
  if (priceLabel)
  {
    [(UILabel *)priceLabel sizeToFit];
    [(UILabel *)self->_priceLabel frame];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v18 = v12 - v14;
    float v19 = (v6 - v16) * 0.5;
    CGFloat v20 = ceilf(v19);
    -[UILabel setFrame:](self->_priceLabel, "setFrame:", v18, v20);
    v25.origin.x = v18;
    v25.origin.y = v20;
    v25.size.width = v15;
    v25.size.height = v17;
    double v12 = floor(CGRectGetMinX(v25) + -22.5);
  }
  nameLabel = self->_nameLabel;
  if (nameLabel)
  {
    [(UILabel *)nameLabel sizeToFit];
    [(UILabel *)self->_nameLabel frame];
    float v23 = (v6 - v22) * 0.5;
    -[UILabel setFrame:](self->_nameLabel, "setFrame:", v7, ceilf(v23), v12 - v7);
  }
  v24.receiver = self;
  v24.super_class = (Class)SUUIProductPageInAppPurchaseTableCell;
  [(SUUITableViewCell *)&v24 layoutSubviews];
}

- (void)setBackgroundColor:(id)a3
{
  indexLabel = self->_indexLabel;
  id v5 = a3;
  [(UILabel *)indexLabel setBackgroundColor:v5];
  [(UILabel *)self->_nameLabel setBackgroundColor:v5];
  [(UILabel *)self->_priceLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIProductPageInAppPurchaseTableCell;
  [(SUUIProductPageInAppPurchaseTableCell *)&v6 setBackgroundColor:v5];
}

- (SUUIColorScheme)colorScheme
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

@end