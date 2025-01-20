@interface SUUIGiftThemeCollectionViewCell
- (SUUIGift)gift;
- (SUUIGiftConfiguration)giftConfiguration;
- (SUUIGiftTheme)theme;
- (UIImage)itemImage;
- (id)_itemView;
- (void)_reloadItemView;
- (void)_setHeaderImage:(id)a3;
- (void)_setMessage:(id)a3;
- (void)_setPrice:(id)a3;
- (void)_setSenderName:(id)a3;
- (void)layoutSubviews;
- (void)reloadThemeHeaderImage;
- (void)setBackgroundColor:(id)a3;
- (void)setGift:(id)a3;
- (void)setGiftConfiguration:(id)a3;
- (void)setItemImage:(id)a3;
- (void)setTheme:(id)a3;
@end

@implementation SUUIGiftThemeCollectionViewCell

- (UIImage)itemImage
{
  v2 = [(SUUIGiftThemeCollectionViewCell *)self _itemView];
  v3 = [v2 itemImage];

  return (UIImage *)v3;
}

- (void)reloadThemeHeaderImage
{
  theme = self->_theme;
  if (theme)
  {
    id v4 = [(SUUIGiftTheme *)theme headerImage];
    [(SUUIGiftThemeCollectionViewCell *)self _setHeaderImage:v4];
  }
}

- (void)setGift:(id)a3
{
  v5 = (SUUIGift *)a3;
  p_gift = &self->_gift;
  if (self->_gift != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)&self->_gift, a3);
    v7 = [(SUUIGift *)*p_gift message];
    [(SUUIGiftThemeCollectionViewCell *)self _setMessage:v7];

    v8 = [(SUUIGift *)*p_gift senderName];
    [(SUUIGiftThemeCollectionViewCell *)self _setSenderName:v8];

    v9 = [(SUUIGift *)*p_gift item];

    if (v9)
    {
      [(SUUIGiftThemeCollectionViewCell *)self _setPrice:0];
      [(SUUIGiftThemeCollectionViewCell *)self _reloadItemView];
    }
    else
    {
      [(SUUIGiftItemView *)self->_itemView removeFromSuperview];
      itemView = self->_itemView;
      self->_itemView = 0;

      v11 = (void *)MEMORY[0x263F08A30];
      v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUUIGift giftAmount](*p_gift, "giftAmount"));
      v13 = [v11 localizedStringFromNumber:v12 numberStyle:1];

      v14 = [(SUUIGiftConfiguration *)self->_giftConfiguration currencySymbol];
      if ([(SUUIGiftConfiguration *)self->_giftConfiguration currencySymbolPosition] == 1)
      {
        v15 = v13;
        v16 = v14;
      }
      else
      {
        v15 = v14;
        v16 = v13;
      }
      v17 = [v15 stringByAppendingString:v16];
      [(SUUIGiftThemeCollectionViewCell *)self _setPrice:v17];
    }
    v5 = v18;
  }
}

- (void)setItemImage:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIGiftThemeCollectionViewCell *)self _itemView];
  [v5 setItemImage:v4];
}

- (void)setTheme:(id)a3
{
  p_theme = &self->_theme;
  v18 = (SUUIGiftTheme *)a3;
  if (*p_theme != v18)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    v6 = [(SUUIGiftTheme *)*p_theme headerImage];
    [(SUUIGiftThemeCollectionViewCell *)self _setHeaderImage:v6];

    v7 = [(SUUIGiftTheme *)*p_theme backgroundColor];
    v8 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
    [v8 setBackgroundColor:v7];

    [(UIImageView *)self->_headerImageView setBackgroundColor:v7];
    [(SUUIGiftItemView *)self->_itemView setBackgroundColor:v7];
    [(SUUIGiftItemView *)self->_itemView setTheme:*p_theme];
    [(UILabel *)self->_priceLabel setBackgroundColor:v7];
    priceLabel = self->_priceLabel;
    v10 = [(SUUIGiftTheme *)*p_theme primaryTextColor];
    [(UILabel *)priceLabel setTextColor:v10];

    [(UILabel *)self->_messageLabel setBackgroundColor:v7];
    messageLabel = self->_messageLabel;
    v12 = [(SUUIGiftTheme *)*p_theme bodyTextColor];
    [(UILabel *)messageLabel setTextColor:v12];

    [(UILabel *)self->_senderNameLabel setBackgroundColor:v7];
    senderNameLabel = self->_senderNameLabel;
    v14 = [(SUUIGiftTheme *)*p_theme bodyTextColor];
    [(UILabel *)senderNameLabel setTextColor:v14];

    [(UILabel *)self->_senderNameLabelLabel setBackgroundColor:v7];
    senderNameLabelLabel = self->_senderNameLabelLabel;
    v16 = [(SUUIGiftTheme *)*p_theme primaryTextColor];
    [(UILabel *)senderNameLabelLabel setTextColor:v16];

    v17 = [(SUUIGiftTheme *)v18 themeName];
    [(SUUIGiftThemeCollectionViewCell *)self setAccessibilityLabel:v17];

    [(SUUIGiftThemeCollectionViewCell *)self setIsAccessibilityElement:1];
    [(SUUIGiftThemeCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)SUUIGiftThemeCollectionViewCell;
  [(SUUIGiftThemeCollectionViewCell *)&v52 layoutSubviews];
  v3 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  v8 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v10 = 25.0;
  }
  else {
    double v10 = 5.0;
  }
  [(SUUIGiftThemeCollectionViewCell *)self bounds];
  double v12 = v11;
  v13 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  double v15 = 50.0;
  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v15 = 10.0;
  }
  CGFloat v16 = v12 - v15;
  objc_msgSend(v3, "setFrame:", v10, v5, v16, v7);
  v17 = [(SUUIGiftThemeCollectionViewCell *)self backgroundView];
  v53.origin.x = v10;
  v53.origin.y = v5;
  v53.size.width = v16;
  v53.size.height = v7;
  CGRect v54 = CGRectInset(v53, -4.0, -4.0);
  objc_msgSend(v17, "setFrame:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
  [v3 bounds];
  double v19 = v18;
  double v21 = v20;
  v22 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
  [v22 bounds];
  float v24 = v23 * 0.5;
  double v25 = (float)(floorf(v24) + -4.0);

  headerImageView = self->_headerImageView;
  if (headerImageView)
  {
    [(UIImageView *)headerImageView frame];
    -[UIImageView setFrame:](self->_headerImageView, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v19, v25);
  }
  itemView = self->_itemView;
  if (itemView)
  {
    [(SUUIGiftItemView *)itemView frame];
    -[SUUIGiftItemView sizeThatFits:](self->_itemView, "sizeThatFits:", v19 + -25.0 + -25.0, 1.79769313e308);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    double v32 = 25.0;
    -[SUUIGiftItemView setFrame:](self->_itemView, "setFrame:", 25.0, v25, v28, v30);
    double v33 = 20.0;
  }
  else
  {
    priceLabel = self->_priceLabel;
    if (!priceLabel) {
      goto LABEL_13;
    }
    [(UILabel *)priceLabel frame];
    CGFloat v29 = v35;
    CGFloat v31 = v36;
    float v37 = (v19 - v35) * 0.5;
    double v32 = floorf(v37);
    -[UILabel setFrame:](self->_priceLabel, "setFrame:", v32, v25);
    double v33 = 21.0;
  }
  v55.origin.x = v32;
  v55.origin.y = v25;
  v55.size.width = v29;
  v55.size.height = v31;
  double v25 = CGRectGetMaxY(v55) + v33;
LABEL_13:
  double v38 = v21 + -16.0;
  if (self->_senderNameLabel)
  {
    [(UILabel *)self->_senderNameLabelLabel frame];
    double v40 = v39;
    double v42 = v41;
    [(UILabel *)self->_senderNameLabel frame];
    -[UILabel sizeThatFits:](self->_senderNameLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v44 = v43;
    *(float *)&double v45 = (v19 - (v40 + 3.0 + v45)) * 0.5;
    CGFloat v46 = fmaxf(floorf(*(float *)&v45), 25.0);
    -[UILabel setFrame:](self->_senderNameLabelLabel, "setFrame:", v46, v38 - v42, v40, v42);
    v56.origin.x = v46;
    v56.origin.y = v38 - v42;
    v56.size.width = v40;
    v56.size.height = v42;
    CGFloat MaxX = CGRectGetMaxX(v56);
    -[UILabel setFrame:](self->_senderNameLabel, "setFrame:", MaxX + 3.0, v38 - v44, v19 + -25.0 - (MaxX + 3.0), v44);
    double v38 = v38 - v42 + -15.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel)
  {
    [(UILabel *)messageLabel frame];
    -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v19 + -50.0, v38 - v25);
    if (v50 >= v38 - v25) {
      double v51 = v38 - v25;
    }
    else {
      double v51 = v50;
    }
    -[UILabel setFrame:](self->_messageLabel, "setFrame:", 25.0, v25, v49, v51);
  }
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIGiftThemeCollectionViewCell;
  [(SUUIGiftThemeCollectionViewCell *)&v6 setBackgroundColor:a3];
  double v4 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
  double v5 = [(SUUIGiftTheme *)self->_theme backgroundColor];
  [v4 setBackgroundColor:v5];
}

- (id)_itemView
{
  v3 = [(SUUIGift *)self->_gift item];
  if (v3)
  {
    itemView = self->_itemView;
    if (!itemView)
    {
      double v5 = [[SUUIGiftItemView alloc] initWithStyle:1 item:v3 clientContext:0];
      objc_super v6 = self->_itemView;
      self->_itemView = v5;

      double v7 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
      [v7 addSubview:self->_itemView];

      itemView = self->_itemView;
    }
    v8 = itemView;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_reloadItemView
{
  id v12 = [(SUUIGift *)self->_gift item];
  v3 = [(SUUIGiftThemeCollectionViewCell *)self _itemView];
  double v4 = [v12 artistName];
  [v3 setArtistName:v4];

  double v5 = [(SUUIGiftTheme *)self->_theme backgroundColor];
  [v3 setBackgroundColor:v5];

  objc_super v6 = [v12 categoryName];
  [v3 setCategoryName:v6];

  objc_msgSend(v3, "setNumberOfUserRatings:", objc_msgSend(v12, "numberOfUserRatings"));
  double v7 = [v12 primaryItemOffer];
  v8 = [v7 buttonText];
  [v3 setPrice:v8];

  [v3 setTheme:self->_theme];
  uint64_t v9 = [v12 title];
  [v3 setTitle:v9];

  [v12 userRating];
  *(float *)&double v11 = v10 / 5.0;
  [v3 setUserRating:v11];
  [(SUUIGiftThemeCollectionViewCell *)self setNeedsLayout];
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
        double v7 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        v8 = self->_headerImageView;
        self->_headerImageView = v7;

        [(UIImageView *)self->_headerImageView setContentMode:1];
        uint64_t v9 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
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
    uint64_t v5 = [(SUUIGiftThemeCollectionViewCell *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
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
        objc_super v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        double v7 = self->_messageLabel;
        self->_messageLabel = v6;

        v8 = self->_messageLabel;
        uint64_t v9 = [(SUUIGiftTheme *)self->_theme backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        float v10 = self->_messageLabel;
        id v11 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_messageLabel setNumberOfLines:0];
        id v12 = self->_messageLabel;
        v13 = [(SUUIGiftTheme *)self->_theme bodyTextColor];
        [(UILabel *)v12 setTextColor:v13];

        uint64_t v14 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
        [v14 addSubview:self->_messageLabel];

        messageLabel = self->_messageLabel;
      }
      -[UILabel setText:](messageLabel, "setText:");
    }
    else
    {
      [(UILabel *)messageLabel removeFromSuperview];
      double v15 = self->_messageLabel;
      self->_messageLabel = 0;
    }
    [(SUUIGiftThemeCollectionViewCell *)self setNeedsLayout];
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
        objc_super v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        double v7 = self->_priceLabel;
        self->_priceLabel = v6;

        v8 = self->_priceLabel;
        uint64_t v9 = [(SUUIGiftTheme *)self->_theme backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        float v10 = self->_priceLabel;
        id v11 = [MEMORY[0x263F81708] systemFontOfSize:35.0];
        [(UILabel *)v10 setFont:v11];

        id v12 = self->_priceLabel;
        v13 = [(SUUIGiftTheme *)self->_theme primaryTextColor];
        [(UILabel *)v12 setTextColor:v13];

        uint64_t v14 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
        [v14 addSubview:self->_priceLabel];

        priceLabel = self->_priceLabel;
      }
      -[UILabel setText:](priceLabel, "setText:");
      [(UILabel *)self->_priceLabel sizeToFit];
    }
    else
    {
      [(UILabel *)priceLabel removeFromSuperview];
      double v15 = self->_priceLabel;
      self->_priceLabel = 0;
    }
    [(SUUIGiftThemeCollectionViewCell *)self setNeedsLayout];
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
        objc_super v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        double v7 = self->_senderNameLabel;
        self->_senderNameLabel = v6;

        v8 = self->_senderNameLabel;
        uint64_t v9 = [(SUUIGiftTheme *)self->_theme backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        float v10 = self->_senderNameLabel;
        id v11 = [MEMORY[0x263F825C8] systemRedColor];
        [(UILabel *)v10 setBackgroundColor:v11];

        id v12 = self->_senderNameLabel;
        v13 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [(UILabel *)v12 setFont:v13];

        uint64_t v14 = self->_senderNameLabel;
        double v15 = [(SUUIGiftTheme *)self->_theme bodyTextColor];
        [(UILabel *)v14 setTextColor:v15];

        id v16 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
        [v16 addSubview:self->_senderNameLabel];

        senderNameLabel = self->_senderNameLabel;
      }
      -[UILabel setText:](senderNameLabel, "setText:");
      if (self->_senderNameLabelLabel) {
        goto LABEL_13;
      }
      v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      senderNameLabelLabel = self->_senderNameLabelLabel;
      self->_senderNameLabelLabel = v17;

      double v19 = self->_senderNameLabelLabel;
      double v20 = [(SUUIGiftTheme *)self->_theme backgroundColor];
      [(UILabel *)v19 setBackgroundColor:v20];

      double v21 = self->_senderNameLabelLabel;
      v22 = [MEMORY[0x263F825C8] systemRedColor];
      [(UILabel *)v21 setBackgroundColor:v22];

      double v23 = self->_senderNameLabelLabel;
      float v24 = [MEMORY[0x263F81708] boldSystemFontOfSize:12.0];
      [(UILabel *)v23 setFont:v24];

      double v25 = self->_senderNameLabelLabel;
      v26 = [(SUUIGiftTheme *)self->_theme primaryTextColor];
      [(UILabel *)v25 setTextColor:v26];

      v27 = self->_senderNameLabelLabel;
      double v28 = [(SUUIGiftConfiguration *)self->_giftConfiguration clientContext];
      CGFloat v29 = v28;
      if (v28) {
        [v28 localizedStringForKey:@"GIFTING_THEME_SENDER_LABEL" inTable:@"Gifting"];
      }
      else {
      double v32 = +[SUUIClientContext localizedStringForKey:@"GIFTING_THEME_SENDER_LABEL" inBundles:0 inTable:@"Gifting"];
      }
      [(UILabel *)v27 setText:v32];

      [(UILabel *)self->_senderNameLabelLabel sizeToFit];
      CGFloat v31 = [(SUUIGiftThemeCollectionViewCell *)self contentView];
      [v31 addSubview:self->_senderNameLabelLabel];
    }
    else
    {
      [(UILabel *)senderNameLabel removeFromSuperview];
      double v30 = self->_senderNameLabel;
      self->_senderNameLabel = 0;

      [(UILabel *)self->_senderNameLabelLabel removeFromSuperview];
      CGFloat v31 = self->_senderNameLabelLabel;
      self->_senderNameLabelLabel = 0;
    }

LABEL_13:
    [(SUUIGiftThemeCollectionViewCell *)self setNeedsLayout];
  }
}

- (SUUIGiftConfiguration)giftConfiguration
{
  return self->_giftConfiguration;
}

- (void)setGiftConfiguration:(id)a3
{
}

- (SUUIGift)gift
{
  return self->_gift;
}

- (SUUIGiftTheme)theme
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

@end