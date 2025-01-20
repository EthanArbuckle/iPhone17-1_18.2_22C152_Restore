@interface SKUILockupSwooshCellLayout
- (CGSize)cellSizeForImageOfSize:(CGSize)a3;
- (CGSize)maxImageSize;
- (CGSize)videoSize;
- (NSString)artistName;
- (NSString)category;
- (NSString)itemCountString;
- (NSString)price;
- (NSString)title;
- (SKUILockupSwooshCellLayout)initWithCollectionViewCell:(id)a3;
- (UIImage)videoThumbnailImage;
- (id)_newDefaultLabel;
- (unint64_t)visibleFields;
- (void)_layoutFieldsHorizontal;
- (void)_layoutFieldsVertical;
- (void)_reloadHighlight;
- (void)_reloadPriceLabel;
- (void)_removeHighlightViews;
- (void)layoutSubviews;
- (void)setArtistName:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCategory:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItemCountString:(id)a3;
- (void)setItemOffer:(id)a3;
- (void)setItemState:(id)a3 animated:(BOOL)a4;
- (void)setMaxImageSize:(CGSize)a3;
- (void)setPrice:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVideoSize:(CGSize)a3;
- (void)setVideoThumbnailImage:(id)a3;
- (void)setVisibleFields:(unint64_t)a3;
@end

@implementation SKUILockupSwooshCellLayout

- (SKUILockupSwooshCellLayout)initWithCollectionViewCell:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupSwooshCellLayout initWithCollectionViewCell:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUILockupSwooshCellLayout;
  v5 = [(SKUICellLayout *)&v9 initWithCollectionViewCell:v4];
  if (v5)
  {
    SKUILockupStyleDefault((uint64_t)v7);
    v5->_visibleFields = v8;
  }

  return v5;
}

- (NSString)artistName
{
  return [(UILabel *)self->_artistNameLabel text];
}

- (NSString)category
{
  return [(UILabel *)self->_categoryLabel text];
}

- (CGSize)cellSizeForImageOfSize:(CGSize)a3
{
  double height = a3.height;
  unint64_t visibleFields = self->_visibleFields;
  float v6 = a3.height + 5.0;
  double v7 = ceilf(v6);
  if ((visibleFields & 2) != 0) {
    double v8 = v7;
  }
  else {
    double v8 = 0.0;
  }
  if ((visibleFields & 0x400) != 0)
  {
    double width = self->_videoSize.width;
    double v8 = v8 + self->_videoSize.height + 10.0;
  }
  else
  {
    float v9 = a3.width;
    double width = ceilf(v9);
  }
  v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];
  double v13 = 1.0 / v12 + 14.0;

  unint64_t v14 = self->_visibleFields;
  double v15 = 28.0;
  if ((v14 & 0x10) == 0) {
    double v15 = 0.0;
  }
  double v16 = -0.0;
  if ((v14 & 8) != 0) {
    double v17 = v13;
  }
  else {
    double v17 = -0.0;
  }
  double v18 = v15 + v17;
  if (v14) {
    double v19 = v13;
  }
  else {
    double v19 = -0.0;
  }
  double v20 = v19 + v18;
  if ((v14 & 0x80) != 0) {
    double v21 = v13;
  }
  else {
    double v21 = -0.0;
  }
  double v22 = v21 + v20;
  unint64_t v23 = (v14 & 1)
      + ((v14 & 8) >> 3)
      + ((v14 & 0x10) >> 4)
      + ((unint64_t)(v14 & 0x80) >> 7)
      + ((v14 & 4) >> 2);
  if ((v14 & 4) != 0) {
    double v24 = v13;
  }
  else {
    double v24 = -0.0;
  }
  double v25 = v24 + v22;
  if (v23) {
    double v25 = v25 + 6.0;
  }
  BOOL v26 = v23 > 1;
  uint64_t v27 = v23 - 1;
  if (v26) {
    double v16 = (float)v27;
  }
  double v28 = v25 + v16;
  if ((v14 & 0x400) != 0 && (v14 & 2) != 0)
  {
    BOOL v26 = v28 <= height;
    double v30 = v8 + v28 - height;
    if (v26) {
      double v29 = v8;
    }
    else {
      double v29 = v30;
    }
  }
  else
  {
    double v29 = v8 + v28;
  }
  double v31 = width;
  result.double height = v29;
  result.double width = v31;
  return result;
}

- (NSString)itemCountString
{
  return [(UILabel *)self->_itemCountLabel text];
}

- (NSString)price
{
  return [(UILabel *)self->_priceLabel text];
}

- (void)setArtistName:(id)a3
{
  id v10 = a3;
  id v4 = [(UILabel *)self->_artistNameLabel text];
  if (v4 != v10 && ([v4 isEqualToString:v10] & 1) == 0)
  {
    artistNameLabel = self->_artistNameLabel;
    if (v10)
    {
      if (!artistNameLabel)
      {
        float v6 = [(SKUILockupSwooshCellLayout *)self _newDefaultLabel];
        double v7 = self->_artistNameLabel;
        self->_artistNameLabel = v6;

        double v8 = [(SKUICellLayout *)self contentView];
        [v8 addSubview:self->_artistNameLabel];

        artistNameLabel = self->_artistNameLabel;
      }
      -[UILabel setText:](artistNameLabel, "setText:");
    }
    else
    {
      [(UILabel *)artistNameLabel removeFromSuperview];
      float v9 = self->_artistNameLabel;
      self->_artistNameLabel = 0;
    }
    [(SKUICellLayout *)self setNeedsLayout];
  }
}

- (void)setCategory:(id)a3
{
  id v10 = a3;
  id v4 = [(UILabel *)self->_categoryLabel text];
  if (v4 != v10 && ([v4 isEqualToString:v10] & 1) == 0)
  {
    categoryLabel = self->_categoryLabel;
    if (v10)
    {
      if (!categoryLabel)
      {
        float v6 = [(SKUILockupSwooshCellLayout *)self _newDefaultLabel];
        double v7 = self->_categoryLabel;
        self->_categoryLabel = v6;

        double v8 = [(SKUICellLayout *)self contentView];
        [v8 addSubview:self->_categoryLabel];

        categoryLabel = self->_categoryLabel;
      }
      -[UILabel setText:](categoryLabel, "setText:");
    }
    else
    {
      [(UILabel *)categoryLabel removeFromSuperview];
      float v9 = self->_categoryLabel;
      self->_categoryLabel = 0;
    }
    [(SKUICellLayout *)self setNeedsLayout];
  }
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  [v4 primaryTextColor];
  p_primaryTextColor = &self->_primaryTextColor;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_primaryTextColor, v17);
  categoryLabel = self->_categoryLabel;
  if (self->_primaryTextColor)
  {
    -[UILabel setTextColor:](self->_categoryLabel, "setTextColor:");
  }
  else
  {
    double v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.600000024];
    [(UILabel *)categoryLabel setTextColor:v7];
  }
  itemCountLabel = self->_itemCountLabel;
  if (*p_primaryTextColor)
  {
    -[UILabel setTextColor:](self->_itemCountLabel, "setTextColor:");
  }
  else
  {
    float v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.600000024];
    [(UILabel *)itemCountLabel setTextColor:v9];
  }
  priceLabel = self->_priceLabel;
  if (*p_primaryTextColor)
  {
    -[UILabel setTextColor:](self->_priceLabel, "setTextColor:");
  }
  else
  {
    v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.600000024];
    [(UILabel *)priceLabel setTextColor:v11];
  }
  double v12 = [v4 secondaryTextColor];

  double v13 = v12;
  if (!v12) {
    double v13 = *p_primaryTextColor;
  }
  p_titleColor = &self->_titleColor;
  objc_storeStrong((id *)&self->_titleColor, v13);
  titleLabel = self->_titleLabel;
  if (*p_titleColor)
  {
    -[UILabel setTextColor:](titleLabel, "setTextColor:");
  }
  else
  {
    double v16 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)titleLabel setTextColor:v16];
  }
}

- (void)setItemCountString:(id)a3
{
  id v10 = a3;
  id v4 = [(UILabel *)self->_itemCountLabel text];
  if (v4 != v10 && ([v4 isEqualToString:v10] & 1) == 0)
  {
    itemCountLabel = self->_itemCountLabel;
    if (v10)
    {
      if (!itemCountLabel)
      {
        float v6 = [(SKUILockupSwooshCellLayout *)self _newDefaultLabel];
        double v7 = self->_itemCountLabel;
        self->_itemCountLabel = v6;

        double v8 = [(SKUICellLayout *)self contentView];
        [v8 addSubview:self->_itemCountLabel];

        itemCountLabel = self->_itemCountLabel;
      }
      -[UILabel setText:](itemCountLabel, "setText:");
    }
    else
    {
      [(UILabel *)itemCountLabel removeFromSuperview];
      float v9 = self->_itemCountLabel;
      self->_itemCountLabel = 0;
    }
    [(SKUICellLayout *)self setNeedsLayout];
  }
}

- (void)setPrice:(id)a3
{
  id v10 = a3;
  id v4 = [(UILabel *)self->_priceLabel text];
  if (v4 != v10 && ([v4 isEqualToString:v10] & 1) == 0)
  {
    priceLabel = self->_priceLabel;
    if (v10)
    {
      if (!priceLabel)
      {
        float v6 = [(SKUILockupSwooshCellLayout *)self _newDefaultLabel];
        double v7 = self->_priceLabel;
        self->_priceLabel = v6;

        double v8 = [(SKUICellLayout *)self contentView];
        [v8 addSubview:self->_priceLabel];

        priceLabel = self->_priceLabel;
      }
      -[UILabel setText:](priceLabel, "setText:");
    }
    else
    {
      [(UILabel *)priceLabel removeFromSuperview];
      float v9 = self->_priceLabel;
      self->_priceLabel = 0;
    }
    [(SKUICellLayout *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v17 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  if (v4 != v17 && ([v4 isEqualToString:v17] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v17)
    {
      if (!titleLabel)
      {
        float v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        double v7 = self->_titleLabel;
        self->_titleLabel = v6;

        double v8 = self->_titleLabel;
        float v9 = [(SKUICellLayout *)self parentCellView];
        id v10 = [v9 backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v10];

        v11 = self->_titleLabel;
        double v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
        [(UILabel *)v11 setFont:v12];

        [(UILabel *)self->_titleLabel setNumberOfLines:2];
        double v13 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          double v15 = [MEMORY[0x1E4FB1618] blackColor];
          [(UILabel *)v13 setTextColor:v15];
        }
        double v16 = [(SKUICellLayout *)self contentView];
        [v16 addSubview:self->_titleLabel];

        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      unint64_t v14 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SKUICellLayout *)self setNeedsLayout];
  }
}

- (void)setVideoThumbnailImage:(id)a3
{
  id v17 = a3;
  id v4 = [(SKUILockupSwooshCellLayout *)self videoThumbnailImage];

  v5 = v17;
  if (v4 != v17)
  {
    if (v17)
    {
      float v6 = [(SKUICellLayout *)self contentView];
      if (!self->_videoImageView)
      {
        double v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        videoImageView = self->_videoImageView;
        self->_videoImageView = v7;

        float v9 = self->_videoImageView;
        id v10 = [(SKUICellLayout *)self parentCellView];
        v11 = [v10 backgroundColor];
        [(UIImageView *)v9 setBackgroundColor:v11];

        [(UIImageView *)self->_videoImageView setContentMode:6];
        [v6 addSubview:self->_videoImageView];
      }
      if (!self->_videoPlayButtonImageView)
      {
        double v12 = (void *)MEMORY[0x1E4FB1818];
        double v13 = SKUIBundle();
        unint64_t v14 = [v12 imageNamed:@"PlayControl" inBundle:v13];

        double v15 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v14];
        videoPlayButtonImageView = self->_videoPlayButtonImageView;
        self->_videoPlayButtonImageView = v15;

        [(UIImageView *)self->_videoPlayButtonImageView setContentMode:4];
      }
      [(UIImageView *)self->_videoImageView setImage:v17];
      [v6 insertSubview:self->_videoPlayButtonImageView aboveSubview:self->_videoImageView];
    }
    else
    {
      [(UIImageView *)self->_videoPlayButtonImageView setHidden:1];
      [(UIImageView *)self->_videoImageView removeFromSuperview];
      float v6 = self->_videoImageView;
      self->_videoImageView = 0;
    }

    [(SKUICellLayout *)self setNeedsLayout];
    v5 = v17;
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if (self->_visibleFields != a3)
  {
    self->_unint64_t visibleFields = a3;
    [(SKUICellLayout *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (UIImage)videoThumbnailImage
{
  return [(UIImageView *)self->_videoImageView image];
}

- (void)layoutSubviews
{
  unint64_t visibleFields = self->_visibleFields;
  if ((visibleFields & 0x400) != 0)
  {
    double width = self->_videoSize.width;
    double height = self->_videoSize.height;
    -[UIImageView setFrame:](self->_videoImageView, "setFrame:", 0.0, 5.0, width, height);
    [(UIImageView *)self->_videoImageView setHidden:0];
    double v7 = [(UIImageView *)self->_videoImageView image];
    double v8 = v7;
    if (v7)
    {
      [v7 size];
      double v10 = v9;
      v20.origin.x = 0.0;
      v20.origin.y = 5.0;
      v20.size.double width = width;
      v20.size.double height = height;
      double v11 = CGRectGetMaxY(v20) - v10;
      double height = v10;
    }
    else
    {
      double v11 = 5.0;
    }
    -[UIImageView setFrame:](self->_videoPlayButtonImageView, "setFrame:", 0.0, v11, width, height);
    [(UIImageView *)self->_videoPlayButtonImageView setHidden:0];
    double v4 = self->_videoSize.height + 10.0 + 5.0;
  }
  else
  {
    [(UIImageView *)self->_videoImageView setHidden:1];
    [(UIImageView *)self->_videoPlayButtonImageView setHidden:1];
    double v4 = 5.0;
  }
  double v12 = [(SKUIItemCellLayout *)self iconImageView];
  id v18 = v12;
  if ((self->_visibleFields & 2) != 0)
  {
    [v12 frame];
    objc_msgSend(v18, "setFrame:", 0.0, v4 + self->_maxImageSize.height - v14);
    BOOL v13 = [(SKUIItemCellLayout *)self isIconImageHidden];
    double v12 = v18;
  }
  else
  {
    BOOL v13 = 1;
  }
  [v12 setHidden:v13];
  if ((visibleFields & 0x400) != 0) {
    [(SKUILockupSwooshCellLayout *)self _layoutFieldsHorizontal];
  }
  else {
    [(SKUILockupSwooshCellLayout *)self _layoutFieldsVertical];
  }
  iconHighlightImageView = self->_iconHighlightImageView;
  if (iconHighlightImageView)
  {
    double v16 = [(SKUIItemCellLayout *)self iconImageView];
    [v16 frame];
    -[UIImageView setFrame:](iconHighlightImageView, "setFrame:");
  }
  videoHighlightImageView = self->_videoHighlightImageView;
  if (videoHighlightImageView)
  {
    [(UIImageView *)self->_videoImageView frame];
    -[UIImageView setFrame:](videoHighlightImageView, "setFrame:");
  }
}

- (void)setBackgroundColor:(id)a3
{
  artistNameLabel = self->_artistNameLabel;
  id v5 = a3;
  [(UILabel *)artistNameLabel setBackgroundColor:v5];
  [(UILabel *)self->_categoryLabel setBackgroundColor:v5];
  [(UILabel *)self->_itemCountLabel setBackgroundColor:v5];
  [(UILabel *)self->_priceLabel setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  [(UIImageView *)self->_videoImageView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUILockupSwooshCellLayout;
  [(SKUIItemCellLayout *)&v6 setBackgroundColor:v5];
}

- (void)setItemOffer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUILockupSwooshCellLayout;
  [(SKUIItemCellLayout *)&v4 setItemOffer:a3];
  [(SKUILockupSwooshCellLayout *)self _reloadPriceLabel];
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SKUILockupSwooshCellLayout;
  [(SKUIItemCellLayout *)&v5 setItemState:a3 animated:a4];
  [(SKUILockupSwooshCellLayout *)self _reloadPriceLabel];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUILockupSwooshCellLayout;
  [(SKUIItemCellLayout *)&v4 setHighlighted:a3];
  [(SKUILockupSwooshCellLayout *)self _reloadHighlight];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUILockupSwooshCellLayout;
  [(SKUIItemCellLayout *)&v4 setSelected:a3];
  [(SKUILockupSwooshCellLayout *)self _reloadHighlight];
}

- (void)_layoutFieldsHorizontal
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [(SKUICellLayout *)self contentView];
  [v3 bounds];
  double v5 = v4;

  objc_super v6 = [(SKUIItemCellLayout *)self iconImageView];
  double v7 = 0.0;
  double v8 = 0.0;
  unint64_t visibleFields = self->_visibleFields;
  id v33 = v6;
  if ((visibleFields & 2) != 0)
  {
    [v6 frame];
    double v8 = CGRectGetMaxX(v50) + 9.0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  titleLabel = self->_titleLabel;
  v34[0] = 16;
  v34[1] = titleLabel;
  long long v35 = *MEMORY[0x1E4F1DB30];
  categoryLabel = self->_categoryLabel;
  uint64_t v36 = 8;
  v37 = categoryLabel;
  long long v38 = v35;
  artistNameLabel = self->_artistNameLabel;
  uint64_t v39 = 1;
  v40 = artistNameLabel;
  long long v41 = v35;
  itemCountLabel = self->_itemCountLabel;
  uint64_t v42 = 128;
  v43 = itemCountLabel;
  priceLabel = self->_priceLabel;
  uint64_t v45 = 4;
  v46 = priceLabel;
  double v16 = v5 - v8;
  long long v44 = v35;
  long long v47 = v35;
  do
  {
    id v17 = (UILabel *)(id)v34[v9 + 1];
    id v18 = v17;
    if ((v34[v9] & self->_visibleFields) != 0)
    {
      if (v17)
      {
        double v19 = (double *)&v34[v9];
        if (v17 == self->_titleLabel)
        {
          -[UILabel sizeThatFits:](v17, "sizeThatFits:", v16, 1.79769313e308);
          double v22 = v23;
          *((void *)v19 + 2) = v24;
          v19[3] = v23;
        }
        else
        {
          CGRect v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v20 scale];
          double v22 = 1.0 / v21 + 14.0;
          v19[2] = v16;
          v19[3] = v22;
        }
        -[UILabel setHidden:](v18, "setHidden:", 0, visibleFields);
        double v7 = v7 + v22;
        ++v10;
      }
    }
    else
    {
      [(UILabel *)v17 setHidden:1];
    }

    v9 += 4;
  }
  while (v9 != 20);
  if (v10 > 0)
  {
    double v25 = self->_videoSize.height + 5.0 + 10.0;
    if ((visibleFields & 2) != 0)
    {
      float v26 = (self->_maxImageSize.height - (v7 + (float)(v10 - 1))) * 0.5;
      double v25 = v25 + floorf(v26);
    }
    for (uint64_t i = 0; i != 20; i += 4)
    {
      double v28 = (double *)&v34[i];
      id v29 = (id)v34[i + 1];
      if (([v29 isHidden] & 1) == 0)
      {
        [v29 frame];
        double v30 = v28[2];
        double v31 = v28[3];
        objc_msgSend(v29, "setFrame:", v8, v25, v30, v31);
        v51.origin.x = v8;
        v51.origin.y = v25;
        v51.size.double width = v30;
        v51.size.double height = v31;
        double v25 = CGRectGetMaxY(v51) + 1.0;
      }
    }
  }
}

- (void)_layoutFieldsVertical
{
  v3 = [(SKUICellLayout *)self contentView];
  [v3 bounds];
  double v5 = v4;

  objc_super v6 = [(SKUIItemCellLayout *)self iconImageView];
  unint64_t visibleFields = self->_visibleFields;
  id v31 = v6;
  if ((visibleFields & 2) != 0)
  {
    [v6 frame];
    double v8 = CGRectGetMaxY(v33) + 6.0;
    unint64_t visibleFields = self->_visibleFields;
  }
  else
  {
    double v8 = 6.0;
  }
  titleLabel = self->_titleLabel;
  if ((visibleFields & 0x10) != 0)
  {
    if (titleLabel)
    {
      [(UILabel *)titleLabel frame];
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5, 1.79769313e308);
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, v8, v10, v12);
      [(UILabel *)self->_titleLabel setHidden:0];
      v34.origin.x = 0.0;
      v34.origin.y = v8;
      v34.size.double width = v11;
      v34.size.double height = v13;
      double v8 = CGRectGetMaxY(v34) + 1.0;
    }
  }
  else
  {
    [(UILabel *)titleLabel setHidden:1];
  }
  categoryLabel = self->_categoryLabel;
  if ((self->_visibleFields & 8) != 0)
  {
    if (categoryLabel)
    {
      [(UILabel *)categoryLabel frame];
      double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v15 scale];
      CGFloat v17 = 1.0 / v16 + 14.0;

      -[UILabel setFrame:](self->_categoryLabel, "setFrame:", 0.0, v8, v5, v17);
      [(UILabel *)self->_categoryLabel setHidden:0];
      v35.origin.x = 0.0;
      v35.origin.y = v8;
      v35.size.double width = v5;
      v35.size.double height = v17;
      double v8 = CGRectGetMaxY(v35) + 1.0;
    }
  }
  else
  {
    [(UILabel *)categoryLabel setHidden:1];
  }
  artistNameLabel = self->_artistNameLabel;
  if (self->_visibleFields)
  {
    if (artistNameLabel)
    {
      [(UILabel *)artistNameLabel frame];
      double v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v19 scale];
      CGFloat v21 = 1.0 / v20 + 14.0;

      -[UILabel setFrame:](self->_artistNameLabel, "setFrame:", 0.0, v8, v5, v21);
      [(UILabel *)self->_artistNameLabel setHidden:0];
      v36.origin.x = 0.0;
      v36.origin.y = v8;
      v36.size.double width = v5;
      v36.size.double height = v21;
      double v8 = CGRectGetMaxY(v36) + 1.0;
    }
  }
  else
  {
    [(UILabel *)artistNameLabel setHidden:1];
  }
  itemCountLabel = self->_itemCountLabel;
  if ((self->_visibleFields & 0x80) != 0)
  {
    if (itemCountLabel)
    {
      [(UILabel *)itemCountLabel frame];
      double v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v23 scale];
      CGFloat v25 = 1.0 / v24 + 14.0;

      -[UILabel setFrame:](self->_itemCountLabel, "setFrame:", 0.0, v8, v5, v25);
      [(UILabel *)self->_itemCountLabel setHidden:0];
      v37.origin.x = 0.0;
      v37.origin.y = v8;
      v37.size.double width = v5;
      v37.size.double height = v25;
      double v8 = CGRectGetMaxY(v37) + 1.0;
    }
  }
  else
  {
    [(UILabel *)itemCountLabel setHidden:1];
  }
  priceLabel = self->_priceLabel;
  if ((self->_visibleFields & 4) != 0)
  {
    if (!priceLabel) {
      goto LABEL_25;
    }
    [(UILabel *)priceLabel frame];
    double v28 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v28 scale];
    double v30 = 1.0 / v29 + 14.0;

    -[UILabel setFrame:](self->_priceLabel, "setFrame:", 0.0, v8, v5, v30);
    priceLabel = self->_priceLabel;
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v27 = 1;
  }
  [(UILabel *)priceLabel setHidden:v27];
LABEL_25:
}

- (id)_newDefaultLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  double v4 = [(SKUICellLayout *)self parentCellView];
  double v5 = [v4 backgroundColor];
  [v3 setBackgroundColor:v5];

  objc_super v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v3 setFont:v6];

  if (self->_primaryTextColor)
  {
    objc_msgSend(v3, "setTextColor:");
  }
  else
  {
    double v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.600000024];
    [v3 setTextColor:v7];
  }
  return v3;
}

- (void)_reloadPriceLabel
{
  id v3 = [(SKUIItemCellLayout *)self itemState];
  char v4 = [v3 state];

  if ((v4 & 3) != 0)
  {
    double v5 = [(SKUICellLayout *)self clientContext];
    if (v5)
    {
      objc_super v6 = @"ITEM_OFFER_BUTTON_INSTALLING";
LABEL_14:
      uint64_t v8 = [v5 localizedStringForKey:v6];
      goto LABEL_19;
    }
    double v7 = @"ITEM_OFFER_BUTTON_INSTALLING";
  }
  else if ((v4 & 4) != 0)
  {
    double v5 = [(SKUICellLayout *)self clientContext];
    if (v5)
    {
      objc_super v6 = @"ITEM_OFFER_BUTTON_INSTALLED";
      goto LABEL_14;
    }
    double v7 = @"ITEM_OFFER_BUTTON_INSTALLED";
  }
  else if ((v4 & 8) != 0)
  {
    double v5 = [(SKUICellLayout *)self clientContext];
    if (v5)
    {
      objc_super v6 = @"ITEM_OFFER_BUTTON_INSTALL";
      goto LABEL_14;
    }
    double v7 = @"ITEM_OFFER_BUTTON_INSTALL";
  }
  else
  {
    if ((v4 & 0x10) == 0) {
      goto LABEL_21;
    }
    double v5 = [(SKUICellLayout *)self clientContext];
    if (v5)
    {
      objc_super v6 = @"ITEM_OFFER_BUTTON_GRATIS";
      goto LABEL_14;
    }
    double v7 = @"ITEM_OFFER_BUTTON_GRATIS";
  }
  uint64_t v8 = +[SKUIClientContext localizedStringForKey:v7 inBundles:0];
LABEL_19:
  id v10 = (id)v8;

  if (v10)
  {
    [(SKUILockupSwooshCellLayout *)self setPrice:v10];
    goto LABEL_22;
  }
LABEL_21:
  id v10 = [(SKUIItemCellLayout *)self itemOffer];
  uint64_t v9 = [v10 buttonText];
  [(SKUILockupSwooshCellLayout *)self setPrice:v9];

LABEL_22:
}

- (void)_reloadHighlight
{
  if ([(SKUIItemCellLayout *)self isHighlighted]
    || [(SKUIItemCellLayout *)self isSelected])
  {
    iconHighlightImageView = self->_iconHighlightImageView;
    if (!iconHighlightImageView)
    {
      char v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      double v5 = self->_iconHighlightImageView;
      self->_iconHighlightImageView = v4;

      objc_super v6 = self->_iconHighlightImageView;
      double v7 = [(SKUICellLayout *)self parentCellView];
      uint64_t v8 = [v7 backgroundColor];
      [(UIImageView *)v6 setBackgroundColor:v8];

      uint64_t v9 = [(SKUICellLayout *)self contentView];
      [v9 addSubview:self->_iconHighlightImageView];

      [(SKUICellLayout *)self setNeedsLayout];
      iconHighlightImageView = self->_iconHighlightImageView;
    }
    id v10 = [(SKUIItemCellLayout *)self iconImage];
    CGFloat v11 = [MEMORY[0x1E4FB1618] blackColor];
    double v12 = [v10 _flatImageWithColor:v11];
    [(UIImageView *)iconHighlightImageView setImage:v12];

    [(UIImageView *)self->_iconHighlightImageView setAlpha:0.3];
    videoImageView = self->_videoImageView;
    if (videoImageView && ([(UIImageView *)videoImageView isHidden] & 1) == 0)
    {
      videoHighlightImageView = self->_videoHighlightImageView;
      if (!videoHighlightImageView)
      {
        double v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        double v16 = self->_videoHighlightImageView;
        self->_videoHighlightImageView = v15;

        CGFloat v17 = self->_videoHighlightImageView;
        id v18 = [(SKUICellLayout *)self parentCellView];
        double v19 = [v18 backgroundColor];
        [(UIImageView *)v17 setBackgroundColor:v19];

        [(UIImageView *)self->_videoHighlightImageView setContentMode:6];
        double v20 = [(SKUICellLayout *)self contentView];
        [v20 insertSubview:self->_videoHighlightImageView aboveSubview:self->_videoImageView];

        [(SKUICellLayout *)self setNeedsLayout];
        videoHighlightImageView = self->_videoHighlightImageView;
      }
      CGFloat v21 = [(UIImageView *)self->_videoImageView image];
      double v22 = [MEMORY[0x1E4FB1618] blackColor];
      double v23 = [v21 _flatImageWithColor:v22];
      [(UIImageView *)videoHighlightImageView setImage:v23];

      double v24 = self->_videoHighlightImageView;
      [(UIImageView *)v24 setAlpha:0.3];
    }
  }
  else
  {
    [MEMORY[0x1E4F39CF8] begin];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __46__SKUILockupSwooshCellLayout__reloadHighlight__block_invoke;
    v25[3] = &unk_1E6422020;
    v25[4] = self;
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v25];
    [(UIImageView *)self->_iconHighlightImageView setAlpha:0.0];
    [(UIImageView *)self->_videoHighlightImageView setAlpha:0.0];
    [MEMORY[0x1E4F39CF8] commit];
  }
}

uint64_t __46__SKUILockupSwooshCellLayout__reloadHighlight__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeHighlightViews];
}

- (void)_removeHighlightViews
{
  [(UIImageView *)self->_iconHighlightImageView alpha];
  if (v3 == 0.0)
  {
    [(UIImageView *)self->_iconHighlightImageView removeFromSuperview];
    iconHighlightImageView = self->_iconHighlightImageView;
    self->_iconHighlightImageView = 0;
  }
  [(UIImageView *)self->_videoHighlightImageView alpha];
  if (v5 == 0.0)
  {
    [(UIImageView *)self->_videoHighlightImageView removeFromSuperview];
    videoHighlightImageView = self->_videoHighlightImageView;
    self->_videoHighlightImageView = 0;
  }
}

- (CGSize)maxImageSize
{
  double width = self->_maxImageSize.width;
  double height = self->_maxImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxImageSize:(CGSize)a3
{
  self->_maxImageSize = a3;
}

- (CGSize)videoSize
{
  double width = self->_videoSize.width;
  double height = self->_videoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setVideoSize:(CGSize)a3
{
  self->_videoSize = a3;
}

- (unint64_t)visibleFields
{
  return self->_visibleFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayButtonImageView, 0);
  objc_storeStrong((id *)&self->_videoImageView, 0);
  objc_storeStrong((id *)&self->_videoHighlightImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_itemCountLabel, 0);
  objc_storeStrong((id *)&self->_iconHighlightImageView, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);

  objc_storeStrong((id *)&self->_artistNameLabel, 0);
}

- (void)initWithCollectionViewCell:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILockupSwooshCellLayout initWithCollectionViewCell:]";
}

@end