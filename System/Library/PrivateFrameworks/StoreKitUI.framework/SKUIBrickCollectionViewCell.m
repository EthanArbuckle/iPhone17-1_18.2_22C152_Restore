@interface SKUIBrickCollectionViewCell
- (BOOL)isItemImageHidden;
- (NSString)accessibilityLabel;
- (NSString)title;
- (SKUIClientContext)clientContext;
- (SKUICountdown)countdown;
- (UIEdgeInsets)itemImageInsets;
- (UIImage)itemImage;
- (UIView)itemImageView;
- (void)_reloadHighlight;
- (void)_removeOverlay;
- (void)countdown;
- (void)itemImage;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setCountdown:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItemImage:(id)a3;
- (void)setItemImageHidden:(BOOL)a3;
- (void)setItemImageInsets:(UIEdgeInsets)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)title;
@end

@implementation SKUIBrickCollectionViewCell

- (SKUICountdown)countdown
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIBrickCollectionViewCell *)v3 countdown];
      }
    }
  }
  v11 = [(SKUICountdownView *)self->_countdownView countdown];

  return (SKUICountdown *)v11;
}

- (UIImage)itemImage
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIBrickCollectionViewCell itemImage]();
  }
  BOOL v3 = [(UIImageView *)self->_itemImageView image];

  return (UIImage *)v3;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBrickCollectionViewCell setAccessibilityLabel:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_accessibilityLabel != v4)
  {
    v13 = (NSString *)[(NSString *)v4 copy];
    accessibilityLabel = self->_accessibilityLabel;
    self->_accessibilityLabel = v13;

    [(UIImageView *)self->_itemImageView setAccessibilityLabel:self->_accessibilityLabel];
  }
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBrickCollectionViewCell setColoringWithColorScheme:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [v4 primaryTextColor];
  p_titleColor = &self->_titleColor;
  titleColor = self->_titleColor;
  if (v13 != titleColor && ([(UIColor *)titleColor isEqual:v13] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, v13);
    titleLabel = self->_titleLabel;
    if (*p_titleColor)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:");
    }
    else
    {
      v17 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)titleLabel setTextColor:v17];
    }
  }
}

- (void)setCountdown:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBrickCollectionViewCell setCountdown:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUICountdownView *)self->_countdownView countdown];

  if (v13 != v4)
  {
    [(SKUICountdownView *)self->_countdownView removeFromSuperview];
    countdownView = self->_countdownView;
    self->_countdownView = 0;

    if (v4)
    {
      v15 = [[SKUICountdownView alloc] initWithCountdown:v4 clientContext:self->_clientContext];
      v16 = self->_countdownView;
      self->_countdownView = v15;

      [(SKUICountdownView *)self->_countdownView sizeToFit];
      [(SKUIBrickCollectionViewCell *)self addSubview:self->_countdownView];
      [(SKUIBrickCollectionViewCell *)self setNeedsLayout];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBrickCollectionViewCell setHighlighted:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickCollectionViewCell;
  [(SKUIBrickCollectionViewCell *)&v13 setHighlighted:v3];
  [(SKUIBrickCollectionViewCell *)self _reloadHighlight];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBrickCollectionViewCell setSelected:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickCollectionViewCell;
  [(SKUIBrickCollectionViewCell *)&v13 setSelected:v3];
  [(SKUIBrickCollectionViewCell *)self _reloadHighlight];
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
        -[SKUIBrickCollectionViewCell setItemImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(UIImageView *)self->_itemImageView image];

  if (v13 != v4)
  {
    itemImageView = self->_itemImageView;
    if (v4)
    {
      if (!itemImageView)
      {
        v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        v16 = self->_itemImageView;
        self->_itemImageView = v15;

        [(UIImageView *)self->_itemImageView setAccessibilityLabel:self->_accessibilityLabel];
        v17 = self->_itemImageView;
        v18 = [(SKUIBrickCollectionViewCell *)self backgroundColor];
        [(UIImageView *)v17 setBackgroundColor:v18];

        [(UIImageView *)self->_itemImageView setHidden:[(SKUIBrickCollectionViewCell *)self isItemImageHidden]];
        v19 = [(SKUIBrickCollectionViewCell *)self contentView];
        [v19 addSubview:self->_itemImageView];

        itemImageView = self->_itemImageView;
      }
      [(UIImageView *)itemImageView setImage:v4];
      [(UIImageView *)self->_itemImageView sizeToFit];
    }
    else
    {
      [(UIImageView *)itemImageView removeFromSuperview];
      v20 = self->_itemImageView;
      self->_itemImageView = 0;
    }
    [(SKUIBrickCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setItemImageHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBrickCollectionViewCell setItemImageHidden:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_itemImageHidden != v3)
  {
    self->_itemImageHidden = v3;
    [(UIImageView *)self->_itemImageView setHidden:v3];
  }
}

- (void)setItemImageInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIBrickCollectionViewCell setItemImageInsets:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = self->_itemImageInsets.top;
  if (self->_itemImageInsets.left != left
    || v16 != top
    || self->_itemImageInsets.right != right
    || self->_itemImageInsets.bottom != bottom)
  {
    self->_itemImageInsets.double top = top;
    self->_itemImageInsets.double left = left;
    self->_itemImageInsets.double bottom = bottom;
    self->_itemImageInsets.double right = right;
    [(SKUIBrickCollectionViewCell *)self setNeedsLayout];
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
        -[SKUIBrickCollectionViewCell setTitle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIBrickCollectionViewCell *)self title];
  if (v13 != v4 && ([v4 isEqualToString:v13] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v4)
    {
      if (!titleLabel)
      {
        uint64_t v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        double v16 = self->_titleLabel;
        self->_titleLabel = v15;

        v17 = self->_titleLabel;
        v18 = [(SKUIBrickCollectionViewCell *)self backgroundColor];
        [(UILabel *)v17 setBackgroundColor:v18];

        v19 = self->_titleLabel;
        v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
        [(UILabel *)v19 setFont:v20];

        v21 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          v23 = [MEMORY[0x1E4FB1618] blackColor];
          [(UILabel *)v21 setTextColor:v23];
        }
        [(SKUIBrickCollectionViewCell *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setText:v4];
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v22 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SKUIBrickCollectionViewCell *)self setNeedsLayout];
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
        [(SKUIBrickCollectionViewCell *)v3 title];
      }
    }
  }
  uint64_t v11 = [(UILabel *)self->_titleLabel text];

  return (NSString *)v11;
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
        -[SKUIBrickCollectionViewCell setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UIImageView *)self->_itemImageView setBackgroundColor:v4];
  [(UILabel *)self->_titleLabel setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickCollectionViewCell;
  [(SKUIBrickCollectionViewCell *)&v13 setBackgroundColor:v4];
}

- (void)layoutSubviews
{
}

- (void)_reloadHighlight
{
  if (([(SKUIBrickCollectionViewCell *)self isHighlighted] & 1) != 0
    || [(SKUIBrickCollectionViewCell *)self isSelected])
  {
    if (!self->_overlayImageView)
    {
      BOOL v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      overlayImageView = self->_overlayImageView;
      self->_overlayImageView = v3;

      BOOL v5 = self->_overlayImageView;
      uint64_t v6 = [(SKUIBrickCollectionViewCell *)self backgroundColor];
      [(UIImageView *)v5 setBackgroundColor:v6];

      uint64_t v7 = [(SKUIBrickCollectionViewCell *)self contentView];
      [v7 addSubview:self->_overlayImageView];

      [(SKUIBrickCollectionViewCell *)self setNeedsLayout];
    }
    uint64_t v8 = [(SKUICountdownView *)self->_countdownView backgroundImage];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(UIImageView *)self->_itemImageView image];
    }
    id v14 = v10;

    uint64_t v11 = self->_overlayImageView;
    uint64_t v12 = [MEMORY[0x1E4FB1618] blackColor];
    objc_super v13 = [v14 _flatImageWithColor:v12];
    [(UIImageView *)v11 setImage:v13];

    [(UIImageView *)self->_overlayImageView setAlpha:0.3];
  }
  else
  {
    [MEMORY[0x1E4F39CF8] begin];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__SKUIBrickCollectionViewCell__reloadHighlight__block_invoke;
    v15[3] = &unk_1E6422020;
    v15[4] = self;
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v15];
    [(UIImageView *)self->_overlayImageView setAlpha:0.0];
    [MEMORY[0x1E4F39CF8] commit];
  }
}

uint64_t __47__SKUIBrickCollectionViewCell__reloadHighlight__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeOverlay];
}

- (void)_removeOverlay
{
  [(UIImageView *)self->_overlayImageView alpha];
  if (v3 == 0.0)
  {
    [(UIImageView *)self->_overlayImageView removeFromSuperview];
    overlayImageView = self->_overlayImageView;
    self->_overlayImageView = 0;
  }
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (BOOL)isItemImageHidden
{
  return self->_itemImageHidden;
}

- (UIEdgeInsets)itemImageInsets
{
  double top = self->_itemImageInsets.top;
  double left = self->_itemImageInsets.left;
  double bottom = self->_itemImageInsets.bottom;
  double right = self->_itemImageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)itemImageView
{
  return &self->_itemImageView->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

- (void)countdown
{
}

- (void)itemImage
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBrickCollectionViewCell itemImage]";
}

- (void)setAccessibilityLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setCountdown:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setHighlighted:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSelected:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemImageHidden:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemImageInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)title
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end