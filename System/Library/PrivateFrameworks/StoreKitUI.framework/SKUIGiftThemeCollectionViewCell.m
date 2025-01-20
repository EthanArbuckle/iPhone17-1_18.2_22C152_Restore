@interface SKUIGiftThemeCollectionViewCell
- (SKUIGift)gift;
- (SKUIGiftConfiguration)giftConfiguration;
- (SKUIGiftTheme)theme;
- (UIImage)itemImage;
- (id)_itemView;
- (void)_reloadItemView;
- (void)_setHeaderImage:(id)a3;
- (void)_setMessage:(id)a3;
- (void)_setPrice:(id)a3;
- (void)_setSenderName:(id)a3;
- (void)itemImage;
- (void)layoutSubviews;
- (void)reloadThemeHeaderImage;
- (void)setBackgroundColor:(id)a3;
- (void)setGift:(id)a3;
- (void)setGiftConfiguration:(id)a3;
- (void)setItemImage:(id)a3;
- (void)setTheme:(id)a3;
@end

@implementation SKUIGiftThemeCollectionViewCell

- (UIImage)itemImage
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftThemeCollectionViewCell *)v3 itemImage];
      }
    }
  }
  v11 = [(SKUIGiftThemeCollectionViewCell *)self _itemView];
  v12 = [v11 itemImage];

  return (UIImage *)v12;
}

- (void)reloadThemeHeaderImage
{
}

- (void)setGift:(id)a3
{
  uint64_t v5 = (SKUIGift *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIGiftThemeCollectionViewCell setGift:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_gift = &self->_gift;
  if (self->_gift != v5)
  {
    objc_storeStrong((id *)&self->_gift, a3);
    v15 = [(SKUIGift *)*p_gift message];
    [(SKUIGiftThemeCollectionViewCell *)self _setMessage:v15];

    v16 = [(SKUIGift *)*p_gift senderName];
    [(SKUIGiftThemeCollectionViewCell *)self _setSenderName:v16];

    v17 = [(SKUIGift *)*p_gift item];

    if (v17)
    {
      [(SKUIGiftThemeCollectionViewCell *)self _setPrice:0];
      [(SKUIGiftThemeCollectionViewCell *)self _reloadItemView];
    }
    else
    {
      [(SKUIGiftItemView *)self->_itemView removeFromSuperview];
      itemView = self->_itemView;
      self->_itemView = 0;

      v19 = (void *)MEMORY[0x1E4F28EE0];
      v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[SKUIGift giftAmount](*p_gift, "giftAmount"));
      v21 = [v19 localizedStringFromNumber:v20 numberStyle:1];

      v22 = [(SKUIGiftConfiguration *)self->_giftConfiguration currencySymbol];
      if ([(SKUIGiftConfiguration *)self->_giftConfiguration currencySymbolPosition] == 1)
      {
        v23 = v21;
        v24 = v22;
      }
      else
      {
        v23 = v22;
        v24 = v21;
      }
      v25 = [v23 stringByAppendingString:v24];
      [(SKUIGiftThemeCollectionViewCell *)self _setPrice:v25];
    }
  }
}

- (void)setItemImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGiftThemeCollectionViewCell setItemImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKUIGiftThemeCollectionViewCell *)self _itemView];
  [v13 setItemImage:v4];
}

- (void)setTheme:(id)a3
{
  BOOL v5 = (SKUIGiftTheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIGiftThemeCollectionViewCell setTheme:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_theme = &self->_theme;
  if (self->_theme != v5)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    v15 = [(SKUIGiftTheme *)*p_theme headerImage];
    [(SKUIGiftThemeCollectionViewCell *)self _setHeaderImage:v15];

    v16 = [(SKUIGiftTheme *)*p_theme backgroundColor];
    v17 = [(SKUIGiftThemeCollectionViewCell *)self contentView];
    [v17 setBackgroundColor:v16];

    [(UIImageView *)self->_headerImageView setBackgroundColor:v16];
    [(SKUIGiftItemView *)self->_itemView setBackgroundColor:v16];
    [(SKUIGiftItemView *)self->_itemView setTheme:*p_theme];
    [(UILabel *)self->_priceLabel setBackgroundColor:v16];
    priceLabel = self->_priceLabel;
    v19 = [(SKUIGiftTheme *)*p_theme primaryTextColor];
    [(UILabel *)priceLabel setTextColor:v19];

    [(UILabel *)self->_messageLabel setBackgroundColor:v16];
    messageLabel = self->_messageLabel;
    v21 = [(SKUIGiftTheme *)*p_theme bodyTextColor];
    [(UILabel *)messageLabel setTextColor:v21];

    [(UILabel *)self->_senderNameLabel setBackgroundColor:v16];
    senderNameLabel = self->_senderNameLabel;
    v23 = [(SKUIGiftTheme *)*p_theme bodyTextColor];
    [(UILabel *)senderNameLabel setTextColor:v23];

    [(UILabel *)self->_senderNameLabelLabel setBackgroundColor:v16];
    senderNameLabelLabel = self->_senderNameLabelLabel;
    v25 = [(SKUIGiftTheme *)*p_theme primaryTextColor];
    [(UILabel *)senderNameLabelLabel setTextColor:v25];

    v26 = [(SKUIGiftTheme *)v5 themeName];
    [(SKUIGiftThemeCollectionViewCell *)self setAccessibilityLabel:v26];

    [(SKUIGiftThemeCollectionViewCell *)self setIsAccessibilityElement:1];
    [(SKUIGiftThemeCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIGiftThemeCollectionViewCell;
  [(SKUIGiftThemeCollectionViewCell *)&v6 setBackgroundColor:a3];
  id v4 = [(SKUIGiftThemeCollectionViewCell *)self contentView];
  BOOL v5 = [(SKUIGiftTheme *)self->_theme backgroundColor];
  [v4 setBackgroundColor:v5];
}

- (id)_itemView
{
  BOOL v3 = [(SKUIGift *)self->_gift item];
  if (v3)
  {
    itemView = self->_itemView;
    if (!itemView)
    {
      BOOL v5 = [[SKUIGiftItemView alloc] initWithStyle:1 item:v3 clientContext:0];
      objc_super v6 = self->_itemView;
      self->_itemView = v5;

      uint64_t v7 = [(SKUIGiftThemeCollectionViewCell *)self contentView];
      [v7 addSubview:self->_itemView];

      itemView = self->_itemView;
    }
    uint64_t v8 = itemView;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_reloadItemView
{
  id v12 = [(SKUIGift *)self->_gift item];
  BOOL v3 = [(SKUIGiftThemeCollectionViewCell *)self _itemView];
  id v4 = [v12 artistName];
  [v3 setArtistName:v4];

  BOOL v5 = [(SKUIGiftTheme *)self->_theme backgroundColor];
  [v3 setBackgroundColor:v5];

  objc_super v6 = [v12 categoryName];
  [v3 setCategoryName:v6];

  objc_msgSend(v3, "setNumberOfUserRatings:", objc_msgSend(v12, "numberOfUserRatings"));
  uint64_t v7 = [v12 primaryItemOffer];
  uint64_t v8 = [v7 buttonText];
  [v3 setPrice:v8];

  [v3 setTheme:self->_theme];
  uint64_t v9 = [v12 title];
  [v3 setTitle:v9];

  [v12 userRating];
  *(float *)&double v11 = v10 / 5.0;
  [v3 setUserRating:v11];
  [(SKUIGiftThemeCollectionViewCell *)self setNeedsLayout];
}

- (void)_setHeaderImage:(id)a3
{
  id v11 = a3;
  id v4 = [(UIImageView *)self->_headerImageView image];

  if (v4 != v11)
  {
    headerImageView = self->_headerImageView;
    if (v11)
    {
      if (!headerImageView)
      {
        uint64_t v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        uint64_t v8 = self->_headerImageView;
        self->_headerImageView = v7;

        [(UIImageView *)self->_headerImageView setContentMode:1];
        uint64_t v9 = [(SKUIGiftThemeCollectionViewCell *)self contentView];
        [v9 addSubview:self->_headerImageView];

        headerImageView = self->_headerImageView;
      }
      -[UIImageView setImage:](headerImageView, "setImage:");
      [(UIImageView *)self->_headerImageView sizeToFit];
    }
    else
    {
      [(UIImageView *)headerImageView removeFromSuperview];
      float v10 = self->_headerImageView;
      self->_headerImageView = 0;
    }
    uint64_t v5 = [(SKUIGiftThemeCollectionViewCell *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820](v5);
}

- (void)_setMessage:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_messageLabel text];
  if (v4 != v16 && ([v16 isEqualToString:v4] & 1) == 0)
  {
    messageLabel = self->_messageLabel;
    if (v16)
    {
      if (!messageLabel)
      {
        objc_super v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        uint64_t v7 = self->_messageLabel;
        self->_messageLabel = v6;

        uint64_t v8 = self->_messageLabel;
        uint64_t v9 = [(SKUIGiftTheme *)self->_theme backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        float v10 = self->_messageLabel;
        id v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_messageLabel setNumberOfLines:0];
        id v12 = self->_messageLabel;
        uint64_t v13 = [(SKUIGiftTheme *)self->_theme bodyTextColor];
        [(UILabel *)v12 setTextColor:v13];

        v14 = [(SKUIGiftThemeCollectionViewCell *)self contentView];
        [v14 addSubview:self->_messageLabel];

        messageLabel = self->_messageLabel;
      }
      -[UILabel setText:](messageLabel, "setText:");
    }
    else
    {
      [(UILabel *)messageLabel removeFromSuperview];
      v15 = self->_messageLabel;
      self->_messageLabel = 0;
    }
    [(SKUIGiftThemeCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)_setPrice:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_priceLabel text];
  if (v4 != v16 && ([v16 isEqualToString:v4] & 1) == 0)
  {
    priceLabel = self->_priceLabel;
    if (v16)
    {
      if (!priceLabel)
      {
        objc_super v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        uint64_t v7 = self->_priceLabel;
        self->_priceLabel = v6;

        uint64_t v8 = self->_priceLabel;
        uint64_t v9 = [(SKUIGiftTheme *)self->_theme backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        float v10 = self->_priceLabel;
        id v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:35.0];
        [(UILabel *)v10 setFont:v11];

        id v12 = self->_priceLabel;
        uint64_t v13 = [(SKUIGiftTheme *)self->_theme primaryTextColor];
        [(UILabel *)v12 setTextColor:v13];

        v14 = [(SKUIGiftThemeCollectionViewCell *)self contentView];
        [v14 addSubview:self->_priceLabel];

        priceLabel = self->_priceLabel;
      }
      -[UILabel setText:](priceLabel, "setText:");
      [(UILabel *)self->_priceLabel sizeToFit];
    }
    else
    {
      [(UILabel *)priceLabel removeFromSuperview];
      v15 = self->_priceLabel;
      self->_priceLabel = 0;
    }
    [(SKUIGiftThemeCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)_setSenderName:(id)a3
{
  id v33 = a3;
  id v4 = [(UILabel *)self->_senderNameLabel text];
  if (v4 != v33 && ([v33 isEqualToString:v4] & 1) == 0)
  {
    senderNameLabel = self->_senderNameLabel;
    if (v33)
    {
      if (!senderNameLabel)
      {
        objc_super v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        uint64_t v7 = self->_senderNameLabel;
        self->_senderNameLabel = v6;

        uint64_t v8 = self->_senderNameLabel;
        uint64_t v9 = [(SKUIGiftTheme *)self->_theme backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        float v10 = self->_senderNameLabel;
        id v11 = [MEMORY[0x1E4FB1618] systemRedColor];
        [(UILabel *)v10 setBackgroundColor:v11];

        id v12 = self->_senderNameLabel;
        uint64_t v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
        [(UILabel *)v12 setFont:v13];

        v14 = self->_senderNameLabel;
        v15 = [(SKUIGiftTheme *)self->_theme bodyTextColor];
        [(UILabel *)v14 setTextColor:v15];

        id v16 = [(SKUIGiftThemeCollectionViewCell *)self contentView];
        [v16 addSubview:self->_senderNameLabel];

        senderNameLabel = self->_senderNameLabel;
      }
      -[UILabel setText:](senderNameLabel, "setText:");
      if (self->_senderNameLabelLabel) {
        goto LABEL_13;
      }
      v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      senderNameLabelLabel = self->_senderNameLabelLabel;
      self->_senderNameLabelLabel = v17;

      v19 = self->_senderNameLabelLabel;
      v20 = [(SKUIGiftTheme *)self->_theme backgroundColor];
      [(UILabel *)v19 setBackgroundColor:v20];

      v21 = self->_senderNameLabelLabel;
      v22 = [MEMORY[0x1E4FB1618] systemRedColor];
      [(UILabel *)v21 setBackgroundColor:v22];

      v23 = self->_senderNameLabelLabel;
      v24 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
      [(UILabel *)v23 setFont:v24];

      v25 = self->_senderNameLabelLabel;
      v26 = [(SKUIGiftTheme *)self->_theme primaryTextColor];
      [(UILabel *)v25 setTextColor:v26];

      v27 = self->_senderNameLabelLabel;
      v28 = [(SKUIGiftConfiguration *)self->_giftConfiguration clientContext];
      v29 = v28;
      if (v28) {
        [v28 localizedStringForKey:@"GIFTING_THEME_SENDER_LABEL" inTable:@"Gifting"];
      }
      else {
      v32 = +[SKUIClientContext localizedStringForKey:@"GIFTING_THEME_SENDER_LABEL" inBundles:0 inTable:@"Gifting"];
      }
      [(UILabel *)v27 setText:v32];

      [(UILabel *)self->_senderNameLabelLabel sizeToFit];
      v31 = [(SKUIGiftThemeCollectionViewCell *)self contentView];
      [v31 addSubview:self->_senderNameLabelLabel];
    }
    else
    {
      [(UILabel *)senderNameLabel removeFromSuperview];
      v30 = self->_senderNameLabel;
      self->_senderNameLabel = 0;

      [(UILabel *)self->_senderNameLabelLabel removeFromSuperview];
      v31 = self->_senderNameLabelLabel;
      self->_senderNameLabelLabel = 0;
    }

LABEL_13:
    [(SKUIGiftThemeCollectionViewCell *)self setNeedsLayout];
  }
}

- (SKUIGiftConfiguration)giftConfiguration
{
  return self->_giftConfiguration;
}

- (void)setGiftConfiguration:(id)a3
{
}

- (SKUIGift)gift
{
  return self->_gift;
}

- (SKUIGiftTheme)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_senderNameLabelLabel, 0);
  objc_storeStrong((id *)&self->_senderNameLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_gift, 0);

  objc_storeStrong((id *)&self->_giftConfiguration, 0);
}

- (void)itemImage
{
}

- (void)setGift:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end