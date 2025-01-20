@interface SKUILockupMetadataView
+ (double)maximumHeightWithVisibleFields:(unint64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)artistName;
- (NSString)categoryString;
- (NSString)editorialBadgeString;
- (NSString)itemCountString;
- (NSString)itemOfferString;
- (NSString)releaseDateString;
- (NSString)title;
- (SKUIClientContext)clientContext;
- (SKUILockupMetadataView)initWithFrame:(CGRect)a3;
- (UIColor)primaryTextColor;
- (float)userRating;
- (id)_decimalNumberFormatter;
- (id)_newDefaultLabel;
- (int64_t)numberOfUserRatings;
- (unint64_t)visibleFields;
- (void)_reloadUserRatingViews;
- (void)drawRect:(CGRect)a3;
- (void)setArtistName:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCategoryString:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setEditorialBadgeString:(id)a3;
- (void)setItemCountString:(id)a3;
- (void)setItemOfferString:(id)a3;
- (void)setNumberOfUserRatings:(int64_t)a3;
- (void)setReleaseDateString:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserRating:(float)a3;
- (void)setVisibleFields:(unint64_t)a3;
@end

@implementation SKUILockupMetadataView

- (SKUILockupMetadataView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupMetadataView initWithFrame:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUILockupMetadataView;
  v8 = -[SKUILockupMetadataView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8) {
    [(SKUILockupMetadataView *)v8 setContentMode:7];
  }
  return v9;
}

+ (double)maximumHeightWithVisibleFields:(unint64_t)a3
{
  __int16 v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUILockupMetadataView maximumHeightWithVisibleFields:]();
  }
  double v4 = 37.0;
  if ((v3 & 0x10) == 0) {
    double v4 = 0.0;
  }
  if ((v3 & 8) != 0) {
    double v4 = v4 + 15.0;
  }
  if ((v3 & 0x80) != 0) {
    double v4 = v4 + 15.0;
  }
  if (v3) {
    double v4 = v4 + 15.0;
  }
  if ((v3 & 0x20) != 0) {
    double v4 = v4 + 15.0;
  }
  if ((v3 & 0x100) != 0) {
    double v4 = v4 + 15.0;
  }
  unint64_t v5 = (v3 & 1)
     + ((unint64_t)(v3 & 0x80) >> 7)
     + ((unint64_t)(v3 & 8) >> 3)
     + ((unint64_t)(v3 & 0x20) >> 5)
     + ((unint64_t)(v3 & 0x100) >> 8);
  double v6 = (float)(uint64_t)(v5 - 1);
  if (v5 <= 1) {
    double v6 = -0.0;
  }
  double result = v6 + v4;
  if ((v3 & 0x40) != 0) {
    return result + 14.0;
  }
  return result;
}

- (NSString)artistName
{
  return [(UILabel *)self->_artistNameLabel text];
}

- (NSString)editorialBadgeString
{
  return (NSString *)[(SKUIBadgeLabel *)self->_editorialBadgeLabel text];
}

- (NSString)categoryString
{
  return [(UILabel *)self->_categoryLabel text];
}

- (NSString)itemCountString
{
  return [(UILabel *)self->_itemCountLabel text];
}

- (NSString)itemOfferString
{
  return [(UILabel *)self->_itemOfferLabel text];
}

- (NSString)releaseDateString
{
  return [(UILabel *)self->_releaseDateLabel text];
}

- (void)setArtistName:(id)a3
{
  id v8 = a3;
  id v4 = [(UILabel *)self->_artistNameLabel text];
  if (v4 != v8 && ([v4 isEqualToString:v8] & 1) == 0)
  {
    artistNameLabel = self->_artistNameLabel;
    if (v8)
    {
      if (!artistNameLabel)
      {
        double v6 = [(SKUILockupMetadataView *)self _newDefaultLabel];
        v7 = self->_artistNameLabel;
        self->_artistNameLabel = v6;

        artistNameLabel = self->_artistNameLabel;
      }
      -[UILabel setText:](artistNameLabel, "setText:");
      [(UILabel *)self->_artistNameLabel sizeToFit];
    }
    else
    {
      self->_artistNameLabel = 0;
    }
    [(SKUILockupMetadataView *)self setNeedsDisplay];
  }
}

- (void)setEditorialBadgeString:(id)a3
{
  id v13 = a3;
  id v4 = [(SKUIBadgeLabel *)self->_editorialBadgeLabel text];
  if (v4 != v13 && ([v4 isEqualToString:v13] & 1) == 0)
  {
    editorialBadgeLabel = self->_editorialBadgeLabel;
    if (v13)
    {
      if (!editorialBadgeLabel)
      {
        double v6 = objc_alloc_init(SKUIBadgeLabel);
        v7 = self->_editorialBadgeLabel;
        self->_editorialBadgeLabel = v6;

        id v8 = self->_editorialBadgeLabel;
        v9 = [(SKUILockupMetadataView *)self backgroundColor];
        if (v9)
        {
          [(SKUIBadgeLabel *)v8 setTextColor:v9];
        }
        else
        {
          v10 = +[SKUIBadgeLabel defaultTextColor];
          [(SKUIBadgeLabel *)v8 setTextColor:v10];
        }
        objc_super v11 = self->_editorialBadgeLabel;
        if (self->_textColor)
        {
          -[SKUIBadgeLabel setBackgroundColor:](self->_editorialBadgeLabel, "setBackgroundColor:");
        }
        else
        {
          v12 = +[SKUIBadgeLabel defaultBackgroundColor];
          [(SKUIBadgeLabel *)v11 setBackgroundColor:v12];
        }
      }
      -[SKUIBadgeLabel setText:](self->_editorialBadgeLabel, "setText:");
      [(SKUIBadgeLabel *)self->_editorialBadgeLabel sizeToFit];
    }
    else
    {
      self->_editorialBadgeLabel = 0;
    }
    [(SKUILockupMetadataView *)self setNeedsDisplay];
  }
}

- (void)setCategoryString:(id)a3
{
  id v8 = a3;
  id v4 = [(UILabel *)self->_categoryLabel text];
  if (v4 != v8 && ([v4 isEqualToString:v8] & 1) == 0)
  {
    categoryLabel = self->_categoryLabel;
    if (v8)
    {
      if (!categoryLabel)
      {
        double v6 = [(SKUILockupMetadataView *)self _newDefaultLabel];
        v7 = self->_categoryLabel;
        self->_categoryLabel = v6;

        categoryLabel = self->_categoryLabel;
      }
      -[UILabel setText:](categoryLabel, "setText:");
      [(UILabel *)self->_categoryLabel sizeToFit];
    }
    else
    {
      self->_categoryLabel = 0;
    }
    [(SKUILockupMetadataView *)self setNeedsDisplay];
  }
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v20 = a3;
  id v4 = [v20 primaryTextColor];
  p_textColor = &self->_textColor;
  textColor = self->_textColor;
  if (textColor != v4 && ([(UIColor *)textColor isEqual:v4] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, v4);
    categoryLabel = self->_categoryLabel;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_categoryLabel, "setTextColor:");
    }
    else
    {
      id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
      [(UILabel *)categoryLabel setTextColor:v8];
    }
    itemCountLabel = self->_itemCountLabel;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_itemCountLabel, "setTextColor:");
    }
    else
    {
      v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
      [(UILabel *)itemCountLabel setTextColor:v10];
    }
    userRatingLabel = self->_userRatingLabel;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_userRatingLabel, "setTextColor:");
    }
    else
    {
      v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
      [(UILabel *)userRatingLabel setTextColor:v12];
    }
    editorialBadgeLabel = self->_editorialBadgeLabel;
    if (*p_textColor)
    {
      -[SKUIBadgeLabel setBackgroundColor:](self->_editorialBadgeLabel, "setBackgroundColor:");
    }
    else
    {
      v14 = +[SKUIBadgeLabel defaultBackgroundColor];
      [(SKUIBadgeLabel *)editorialBadgeLabel setBackgroundColor:v14];
    }
  }
  v15 = [v20 secondaryTextColor];
  p_titleColor = &self->_titleColor;
  titleColor = self->_titleColor;
  if (titleColor != v15 && ([(UIColor *)titleColor isEqual:v15] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, v15);
    titleLabel = self->_titleLabel;
    if (*p_titleColor)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:");
    }
    else
    {
      v19 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)titleLabel setTextColor:v19];
    }
  }
}

- (void)setItemCountString:(id)a3
{
  id v8 = a3;
  id v4 = [(UILabel *)self->_itemCountLabel text];
  if (v4 != v8 && ([v4 isEqualToString:v8] & 1) == 0)
  {
    itemCountLabel = self->_itemCountLabel;
    if (v8)
    {
      if (!itemCountLabel)
      {
        double v6 = [(SKUILockupMetadataView *)self _newDefaultLabel];
        v7 = self->_itemCountLabel;
        self->_itemCountLabel = v6;

        itemCountLabel = self->_itemCountLabel;
      }
      -[UILabel setText:](itemCountLabel, "setText:");
      [(UILabel *)self->_itemCountLabel sizeToFit];
    }
    else
    {
      self->_itemCountLabel = 0;
    }
    [(SKUILockupMetadataView *)self setNeedsDisplay];
  }
}

- (void)setItemOfferString:(id)a3
{
  id v8 = a3;
  id v4 = [(UILabel *)self->_itemOfferLabel text];
  if (v4 != v8 && ([v4 isEqualToString:v8] & 1) == 0)
  {
    itemOfferLabel = self->_itemOfferLabel;
    if (v8)
    {
      if (!itemOfferLabel)
      {
        double v6 = [(SKUILockupMetadataView *)self _newDefaultLabel];
        v7 = self->_itemOfferLabel;
        self->_itemOfferLabel = v6;

        itemOfferLabel = self->_itemOfferLabel;
      }
      -[UILabel setText:](itemOfferLabel, "setText:");
      [(UILabel *)self->_itemOfferLabel sizeToFit];
    }
    else
    {
      self->_itemOfferLabel = 0;
    }
    [(SKUILockupMetadataView *)self setNeedsDisplay];
  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  if (self->_numberOfUserRatings != a3 || !self->_userRatingLabel)
  {
    self->_numberOfUserRatings = a3;
    [(SKUILockupMetadataView *)self _reloadUserRatingViews];
  }
}

- (void)setReleaseDateString:(id)a3
{
  id v8 = a3;
  id v4 = [(UILabel *)self->_releaseDateLabel text];
  if (v4 != v8 && ([v4 isEqualToString:v8] & 1) == 0)
  {
    releaseDateLabel = self->_releaseDateLabel;
    if (v8)
    {
      if (!releaseDateLabel)
      {
        double v6 = [(SKUILockupMetadataView *)self _newDefaultLabel];
        v7 = self->_releaseDateLabel;
        self->_releaseDateLabel = v6;

        releaseDateLabel = self->_releaseDateLabel;
      }
      -[UILabel setText:](releaseDateLabel, "setText:");
      [(UILabel *)self->_releaseDateLabel sizeToFit];
    }
    else
    {
      self->_releaseDateLabel = 0;
    }
    [(SKUILockupMetadataView *)self setNeedsDisplay];
  }
}

- (void)setTitle:(id)a3
{
  id v14 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  if (v4 != v14 && ([v4 isEqualToString:v14] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v14)
    {
      if (!titleLabel)
      {
        double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        id v8 = self->_titleLabel;
        v9 = [(SKUILockupMetadataView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        objc_super v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_titleLabel setNumberOfLines:2];
        v12 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          id v13 = [MEMORY[0x1E4FB1618] blackColor];
          [(UILabel *)v12 setTextColor:v13];
        }
      }
      -[UILabel setText:](self->_titleLabel, "setText:");
    }
    else
    {
      self->_titleLabel = 0;
    }
    [(SKUILockupMetadataView *)self setNeedsDisplay];
  }
}

- (void)setUserRating:(float)a3
{
  if (self->_userRating != a3 || !self->_userRatingImageView)
  {
    self->_userRating = a3;
    [(SKUILockupMetadataView *)self _reloadUserRatingViews];
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if (self->_visibleFields != a3)
  {
    self->_visibleFields = a3;
    [(SKUILockupMetadataView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)drawRect:(CGRect)a3
{
  v50[8] = *MEMORY[0x1E4F143B8];
  [(SKUILockupMetadataView *)self bounds];
  double v5 = v4;
  unint64_t visibleFields = self->_visibleFields;
  titleLabel = self->_titleLabel;
  if ((visibleFields & 0x10) == 0)
  {
    [(UILabel *)titleLabel setHidden:1];
LABEL_8:
    double v11 = 0.0;
    goto LABEL_9;
  }
  if (!titleLabel) {
    goto LABEL_8;
  }
  if (((self->_editorialBadgeLabel != 0) & (visibleFields >> 11)) != 0) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(UILabel *)titleLabel setNumberOfLines:v8];
  [(UILabel *)self->_titleLabel frame];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5, 1.79769313e308);
  CGFloat v10 = v9;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 0.0, v5, v9);
  [(UILabel *)self->_titleLabel setHidden:0];
  v51.origin.double x = 0.0;
  v51.origin.double y = 0.0;
  v51.size.double width = v5;
  v51.size.double height = v10;
  double v11 = CGRectGetMaxY(v51) + 1.0;
LABEL_9:
  categoryLabel = self->_categoryLabel;
  if ((self->_visibleFields & 8) != 0)
  {
    if (categoryLabel)
    {
      [(UILabel *)categoryLabel frame];
      -[UILabel sizeThatFits:](self->_categoryLabel, "sizeThatFits:", v5, 1.79769313e308);
      CGFloat v14 = v13;
      -[UILabel setFrame:](self->_categoryLabel, "setFrame:", 0.0, v11, v5, v13);
      [(UILabel *)self->_categoryLabel setHidden:0];
      v52.origin.double x = 0.0;
      v52.origin.double y = v11;
      v52.size.double width = v5;
      v52.size.double height = v14;
      double v11 = CGRectGetMaxY(v52) + 1.0;
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
      -[UILabel sizeThatFits:](self->_artistNameLabel, "sizeThatFits:", v5, 1.79769313e308);
      CGFloat v17 = v16;
      -[UILabel setFrame:](self->_artistNameLabel, "setFrame:", 0.0, v11, v5, v16);
      [(UILabel *)self->_artistNameLabel setHidden:0];
      v53.origin.double x = 0.0;
      v53.origin.double y = v11;
      v53.size.double width = v5;
      v53.size.double height = v17;
      double v11 = CGRectGetMaxY(v53) + 1.0;
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
      -[UILabel sizeThatFits:](self->_itemCountLabel, "sizeThatFits:", v5, 1.79769313e308);
      CGFloat v20 = v19;
      -[UILabel setFrame:](self->_itemCountLabel, "setFrame:", 0.0, v11, v5, v19);
      [(UILabel *)self->_itemCountLabel setHidden:0];
      v54.origin.double x = 0.0;
      v54.origin.double y = v11;
      v54.size.double width = v5;
      v54.size.double height = v20;
      double v11 = CGRectGetMaxY(v54) + 1.0;
    }
  }
  else
  {
    [(UILabel *)itemCountLabel setHidden:1];
  }
  releaseDateLabel = self->_releaseDateLabel;
  if ((self->_visibleFields & 0x20) != 0)
  {
    if (releaseDateLabel)
    {
      [(UILabel *)releaseDateLabel frame];
      -[UILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v5, 1.79769313e308);
      CGFloat v23 = v22;
      -[UILabel setFrame:](self->_releaseDateLabel, "setFrame:", 0.0, v11, v5, v22);
      [(UILabel *)self->_releaseDateLabel setHidden:0];
      v55.origin.double x = 0.0;
      v55.origin.double y = v11;
      v55.size.double width = v5;
      v55.size.double height = v23;
      double v11 = CGRectGetMaxY(v55) + 1.0;
    }
  }
  else
  {
    [(UILabel *)releaseDateLabel setHidden:1];
  }
  itemOfferLabel = self->_itemOfferLabel;
  if ((self->_visibleFields & 0x100) != 0)
  {
    if (itemOfferLabel)
    {
      [(UILabel *)itemOfferLabel frame];
      -[UILabel sizeThatFits:](self->_itemOfferLabel, "sizeThatFits:", v5, 1.79769313e308);
      CGFloat v26 = v25;
      -[UILabel setFrame:](self->_itemOfferLabel, "setFrame:", 0.0, v11, v5, v25);
      [(UILabel *)self->_itemOfferLabel setHidden:0];
      v56.origin.double x = 0.0;
      v56.origin.double y = v11;
      v56.size.double width = v5;
      v56.size.double height = v26;
      double v11 = CGRectGetMaxY(v56) + 1.0;
    }
  }
  else
  {
    [(UILabel *)itemOfferLabel setHidden:1];
  }
  uint64_t v49 = 408;
  userRatingImageView = self->_userRatingImageView;
  if ((self->_visibleFields & 0x40) == 0)
  {
    -[UIImageView setHidden:](userRatingImageView, "setHidden:", 1, 408);
    [(UILabel *)self->_userRatingLabel setHidden:1];
    goto LABEL_43;
  }
  if (!userRatingImageView || ([(UIImageView *)userRatingImageView isHidden] & 1) != 0)
  {
    p_userRatingLabel = &self->_userRatingLabel;
    userRatingLabel = self->_userRatingLabel;
    if (!userRatingLabel) {
      goto LABEL_43;
    }
    [(UILabel *)userRatingLabel frame];
    double v30 = 0.0;
    float v31 = 0.0;
    goto LABEL_42;
  }
  [(UIImageView *)self->_userRatingImageView frame];
  p_userRatingLabel = &self->_userRatingLabel;
  double v33 = 16.0;
  if (v32 >= 16.0) {
    double v33 = v32;
  }
  if (self->_userRatingLabel) {
    double v34 = v33;
  }
  else {
    double v34 = v32;
  }
  [(UIImageView *)self->_userRatingImageView frame];
  float v36 = (v34 - v35) * 0.5;
  -[UIImageView setFrame:](self->_userRatingImageView, "setFrame:", 0.0, v11 + floorf(v36));
  [(UIImageView *)self->_userRatingImageView setHidden:0];
  if (*p_userRatingLabel)
  {
    [(UILabel *)*p_userRatingLabel frame];
    [(UIImageView *)self->_userRatingImageView frame];
    double v30 = CGRectGetMaxX(v57) + 3.0;
    float v31 = (v34 + -16.0) * 0.5;
LABEL_42:
    CGFloat v37 = v11 + floorf(v31) + -1.0;
    -[UILabel setFrame:](*p_userRatingLabel, "setFrame:", v30, v37, v5 - v30, 16.0, v49);
    [(UILabel *)*p_userRatingLabel setHidden:0];
    v58.size.double height = 16.0;
    v58.origin.double x = v30;
    v58.origin.double y = v37;
    v58.size.double width = v5 - v30;
    double v11 = CGRectGetMaxY(v58) + 1.0;
  }
LABEL_43:
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if ((self->_visibleFields & 0x800) != 0)
  {
    if (editorialBadgeLabel)
    {
      [(SKUIBadgeLabel *)editorialBadgeLabel frame];
      double v39 = floor(v11);
      -[SKUIBadgeLabel sizeThatFits:](self->_editorialBadgeLabel, "sizeThatFits:", v5, 1.79769313e308);
      CGFloat v42 = v41;
      if (v5 >= v40) {
        double v5 = v40;
      }
      -[SKUIBadgeLabel setFrame:](self->_editorialBadgeLabel, "setFrame:", 0.0, v39, v5, v41, v49);
      [(SKUIBadgeLabel *)self->_editorialBadgeLabel setHidden:0];
      v59.origin.double x = 0.0;
      v59.origin.double y = v39;
      v59.size.double width = v5;
      v59.size.double height = v42;
      CGRectGetMaxY(v59);
    }
  }
  else
  {
    [(SKUIBadgeLabel *)editorialBadgeLabel setHidden:1];
  }
  v50[0] = self->_titleLabel;
  v50[1] = self->_categoryLabel;
  v50[2] = *(id *)((char *)&self->super.super.super.isa + v49);
  v50[3] = self->_itemCountLabel;
  v50[4] = self->_releaseDateLabel;
  v50[5] = self->_itemOfferLabel;
  v50[6] = self->_userRatingLabel;
  uint64_t v43 = 0;
  v50[7] = self->_editorialBadgeLabel;
  do
  {
    v44 = (void *)v50[v43];
    if (v44 && ([(id)v50[v43] isHidden] & 1) == 0)
    {
      [v44 frame];
      objc_msgSend(v44, "drawTextInRect:");
    }
    ++v43;
  }
  while (v43 != 8);
  v45 = self->_userRatingImageView;
  v46 = v45;
  if (v45 && ([(UIImageView *)v45 isHidden] & 1) == 0)
  {
    v47 = [(UIImageView *)v46 image];
    [(UIImageView *)v46 frame];
    objc_msgSend(v47, "drawInRect:");
  }
  for (uint64_t i = 7; i != -1; --i)
}

- (void)setBackgroundColor:(id)a3
{
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (a3)
  {
    [(SKUIBadgeLabel *)editorialBadgeLabel setTextColor:a3];
  }
  else
  {
    id v6 = 0;
    v7 = +[SKUIBadgeLabel defaultTextColor];
    [(SKUIBadgeLabel *)editorialBadgeLabel setTextColor:v7];
  }
  [(UILabel *)self->_artistNameLabel setBackgroundColor:a3];
  [(UILabel *)self->_categoryLabel setBackgroundColor:a3];
  [(UILabel *)self->_itemCountLabel setBackgroundColor:a3];
  [(UILabel *)self->_titleLabel setBackgroundColor:a3];
  [(UIImageView *)self->_userRatingImageView setBackgroundColor:a3];
  [(UILabel *)self->_userRatingLabel setBackgroundColor:a3];
  v8.receiver = self;
  v8.super_class = (Class)SKUILockupMetadataView;
  [(SKUILockupMetadataView *)&v8 setBackgroundColor:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  titleLabel = self->_titleLabel;
  double v6 = 0.0;
  if (titleLabel && (self->_visibleFields & 0x10) != 0)
  {
    if (self->_editorialBadgeLabel) {
      BOOL v7 = (self->_visibleFields & 0x800) == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    -[UILabel setNumberOfLines:](titleLabel, "setNumberOfLines:", v8, a3.width, a3.height);
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
    double v6 = v9 + 0.0 + 1.0;
  }
  categoryLabel = self->_categoryLabel;
  if (categoryLabel && (self->_visibleFields & 8) != 0)
  {
    -[UILabel sizeThatFits:](categoryLabel, "sizeThatFits:", width, 1.79769313e308);
    double v6 = v6 + v12;
    unint64_t v11 = 1;
  }
  else
  {
    unint64_t v11 = 0;
  }
  artistNameLabel = self->_artistNameLabel;
  if (artistNameLabel && (self->_visibleFields & 1) != 0)
  {
    -[UILabel sizeThatFits:](artistNameLabel, "sizeThatFits:", width, 1.79769313e308);
    double v6 = v6 + v14;
    ++v11;
  }
  itemCountLabel = self->_itemCountLabel;
  if (itemCountLabel && (self->_visibleFields & 0x80) != 0)
  {
    -[UILabel sizeThatFits:](itemCountLabel, "sizeThatFits:", width, 1.79769313e308);
    double v6 = v6 + v16;
    ++v11;
  }
  releaseDateLabel = self->_releaseDateLabel;
  if (releaseDateLabel && (self->_visibleFields & 0x20) != 0)
  {
    -[UILabel sizeThatFits:](releaseDateLabel, "sizeThatFits:", width, 1.79769313e308);
    double v6 = v6 + v18;
    ++v11;
  }
  itemOfferLabel = self->_itemOfferLabel;
  if (itemOfferLabel && (self->_visibleFields & 0x100) != 0)
  {
    -[UILabel sizeThatFits:](itemOfferLabel, "sizeThatFits:", width, 1.79769313e308);
    double v6 = v6 + v20;
    ++v11;
  }
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (editorialBadgeLabel && (self->_visibleFields & 0x800) != 0)
  {
    -[SKUIBadgeLabel sizeThatFits:](editorialBadgeLabel, "sizeThatFits:", width, 1.79769313e308);
    double v6 = v6 + v22;
    ++v11;
  }
  double v23 = (float)(uint64_t)(v11 - 1);
  if (v11 <= 1) {
    double v23 = -0.0;
  }
  double v24 = v6 + v23;
  if ((self->_visibleFields & 0x40) != 0)
  {
    userRatingImageView = self->_userRatingImageView;
    if (userRatingImageView) {
      [(UIImageView *)userRatingImageView frame];
    }
    else {
      double v26 = 0.0;
    }
    double v27 = 16.0;
    if (v26 >= 16.0) {
      double v27 = v26;
    }
    if (!self->_userRatingLabel) {
      double v27 = v26;
    }
    if (v27 <= 0.00000011920929) {
      double v27 = -0.0;
    }
    double v24 = v24 + v27;
  }
  double v28 = width;
  double v29 = v24;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (id)_decimalNumberFormatter
{
  if (_decimalNumberFormatter_sOnce != -1) {
    dispatch_once(&_decimalNumberFormatter_sOnce, &__block_literal_global_1);
  }
  v2 = (void *)_decimalNumberFormatter_sNumberFormatter;

  return v2;
}

uint64_t __49__SKUILockupMetadataView__decimalNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_decimalNumberFormatter_sNumberFormatter;
  _decimalNumberFormatter_sNumberFormatter = (uint64_t)v0;

  v2 = (void *)_decimalNumberFormatter_sNumberFormatter;

  return [v2 setNumberStyle:1];
}

- (id)_newDefaultLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  double v4 = [(SKUILockupMetadataView *)self backgroundColor];
  [v3 setBackgroundColor:v4];

  double v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v3 setFont:v5];

  if (self->_textColor)
  {
    objc_msgSend(v3, "setTextColor:");
  }
  else
  {
    double v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    [v3 setTextColor:v6];
  }
  return v3;
}

- (void)_reloadUserRatingViews
{
  if (!self->_userRatingLabel)
  {
    id v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    userRatingLabel = self->_userRatingLabel;
    self->_userRatingLabel = v3;

    double v5 = self->_userRatingLabel;
    double v6 = [(SKUILockupMetadataView *)self backgroundColor];
    [(UILabel *)v5 setBackgroundColor:v6];

    BOOL v7 = self->_userRatingLabel;
    uint64_t v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
    [(UILabel *)v7 setFont:v8];

    double v9 = self->_userRatingLabel;
    if (self->_textColor)
    {
      -[UILabel setTextColor:](self->_userRatingLabel, "setTextColor:");
    }
    else
    {
      CGFloat v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
      [(UILabel *)v9 setTextColor:v10];
    }
  }
  if (self->_numberOfUserRatings)
  {
    unint64_t v11 = [(SKUILockupMetadataView *)self _decimalNumberFormatter];
    double v12 = self->_userRatingLabel;
    double v13 = NSString;
    double v14 = [NSNumber numberWithInteger:self->_numberOfUserRatings];
    v15 = [v11 stringFromNumber:v14];
    double v16 = [v13 stringWithFormat:@"(%@)", v15];
    [(UILabel *)v12 setText:v16];

    if (!self->_userRatingImageView)
    {
      CGFloat v17 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      userRatingImageView = self->_userRatingImageView;
      self->_userRatingImageView = v17;

      double v19 = self->_userRatingImageView;
      double v20 = [(SKUILockupMetadataView *)self backgroundColor];
      [(UIImageView *)v19 setBackgroundColor:v20];
    }
    v21 = +[SKUIRatingStarsCache cacheWithProperties:1];
    double v22 = self->_userRatingImageView;
    double v23 = [v21 ratingStarsImageForRating:self->_userRating];
    [(UIImageView *)v22 setImage:v23];

    [(UIImageView *)self->_userRatingImageView setHidden:0];
    [(UIImageView *)self->_userRatingImageView sizeToFit];
  }
  else
  {
    [(UIImageView *)self->_userRatingImageView setHidden:1];
    double v24 = self->_userRatingLabel;
    double v25 = [(SKUILockupMetadataView *)self clientContext];
    unint64_t v11 = v25;
    if (v25) {
      [v25 localizedStringForKey:@"NO_RATINGS"];
    }
    else {
    v21 = +[SKUIClientContext localizedStringForKey:@"NO_RATINGS" inBundles:0];
    }
    [(UILabel *)v24 setText:v21];
  }

  [(SKUILockupMetadataView *)self setNeedsDisplay];
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (UIColor)primaryTextColor
{
  return self->_textColor;
}

- (float)userRating
{
  return self->_userRating;
}

- (unint64_t)visibleFields
{
  return self->_visibleFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingLabel, 0);
  objc_storeStrong((id *)&self->_userRatingImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_releaseDateLabel, 0);
  objc_storeStrong((id *)&self->_itemOfferLabel, 0);
  objc_storeStrong((id *)&self->_itemCountLabel, 0);
  objc_storeStrong((id *)&self->_editorialBadgeLabel, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);

  objc_storeStrong((id *)&self->_artistNameLabel, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILockupMetadataView initWithFrame:]";
}

+ (void)maximumHeightWithVisibleFields:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUILockupMetadataView maximumHeightWithVisibleFields:]";
}

@end