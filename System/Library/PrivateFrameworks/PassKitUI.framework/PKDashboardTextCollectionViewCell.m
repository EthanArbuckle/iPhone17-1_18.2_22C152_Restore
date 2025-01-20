@interface PKDashboardTextCollectionViewCell
- (BOOL)hideDisclosure;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)subtitle;
- (NSString)title;
- (PKDashboardTextCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIColor)accessoryColor;
- (UIColor)subtitleColor;
- (UIColor)titleColor;
- (UIImage)accessoryImage;
- (UIImage)iconImage;
- (UIImage)subtitleImage;
- (UIImage)titleImage;
- (double)_maxWidthForTransactionCellInWidth:(double)a3;
- (id)_defaultAccessoryColor;
- (id)_defaultSubtitleColor;
- (id)_defaultTitleColor;
- (id)_subtitleFont;
- (id)_titleFont;
- (int64_t)textLayoutStyle;
- (void)_setAccessoryImageAfterApplyingSymbolConfiguration;
- (void)_setFonts;
- (void)_setIconImageAfterApplyingSymbolConfiguration;
- (void)_setSubtitleImageAfterApplyingSymbolConfiguration;
- (void)_setTitleImageAfterApplyingSymbolConfiguration;
- (void)layoutSubviews;
- (void)setAccessoryColor:(id)a3;
- (void)setAccessoryImage:(id)a3;
- (void)setHideDisclosure:(BOOL)a3;
- (void)setIconImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleColor:(id)a3;
- (void)setSubtitleImage:(id)a3;
- (void)setTextLayoutStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleImage:(id)a3;
@end

@implementation PKDashboardTextCollectionViewCell

- (PKDashboardTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)PKDashboardTextCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKDashboardTextCollectionViewCell *)v3 contentView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v11;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v13;

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    v15 = v4->_titleLabel;
    v16 = [(PKDashboardTextCollectionViewCell *)v4 _defaultTitleColor];
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    titleImageView = v4->_titleImageView;
    v4->_titleImageView = (UIImageView *)v17;

    v19 = v4->_titleImageView;
    v20 = [(PKDashboardTextCollectionViewCell *)v4 _defaultTitleColor];
    [(UIImageView *)v19 setTintColor:v20];

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v21;

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v4->_subtitleLabel setLineBreakMode:0];
    v23 = v4->_subtitleLabel;
    v24 = [(PKDashboardTextCollectionViewCell *)v4 _defaultSubtitleColor];
    [(UILabel *)v23 setTextColor:v24];

    [(UILabel *)v4->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    subtitleImageView = v4->_subtitleImageView;
    v4->_subtitleImageView = (UIImageView *)v25;

    v27 = v4->_subtitleImageView;
    v28 = [(PKDashboardTextCollectionViewCell *)v4 _defaultSubtitleColor];
    [(UIImageView *)v27 setTintColor:v28];

    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = (UIImageView *)v29;

    v31 = v4->_accessoryImageView;
    v32 = [(PKDashboardTextCollectionViewCell *)v4 _defaultAccessoryColor];
    [(UIImageView *)v31 setTintColor:v32];

    [(PKDashboardTextCollectionViewCell *)v4 _setFonts];
    [v5 addSubview:v4->_iconImageView];
    [v5 addSubview:v4->_titleLabel];
    [v5 addSubview:v4->_titleImageView];
    [v5 addSubview:v4->_subtitleLabel];
    [v5 addSubview:v4->_subtitleImageView];
    [v5 addSubview:v4->_accessoryImageView];
    id v33 = objc_alloc(MEMORY[0x1E4FB1838]);
    v34 = PKUIChevronImage();
    uint64_t v35 = [v33 initWithImage:v34];
    disclosureView = v4->_disclosureView;
    v4->_disclosureView = (UIImageView *)v35;

    [(UIImageView *)v4->_disclosureView setContentMode:1];
    v37 = v4->_disclosureView;
    v38 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIImageView *)v37 setTintColor:v38];

    [v5 addSubview:v4->_disclosureView];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  if (!self->_hideDisclosure)
  {
    [(UIImageView *)self->_disclosureView bounds];
    double v8 = v9 + 16.0;
  }
  if (self->_iconImage)
  {
    double v10 = [(UIImageView *)self->_iconImageView image];
    [v10 size];
    double v7 = v11 + 10.0;
  }
  double v12 = width + v6 * -2.0;
  if (self->_accessoryImage)
  {
    uint64_t v13 = [(UIImageView *)self->_accessoryImageView image];
    [v13 size];
    double v15 = v14 + 16.0;
  }
  else
  {
    double v15 = 0.0;
  }
  double v16 = v12 - v7 - v8 - v15 + -32.0;
  -[UILabel pkui_sizeThatFits:](self->_titleLabel, "pkui_sizeThatFits:", v16, 1.79769313e308);
  double v18 = v17;
  if (self->_titleImage)
  {
    v19 = [(UIImageView *)self->_titleImageView image];
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "pkui_alignmentSizeThatFits:maximumScale:", v16, 1.79769313e308, 1.0);
      double v21 = v38;
    }
    else
    {
      double v21 = 0.0;
    }
  }
  else
  {
    double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  -[UILabel pkui_sizeThatFits:](self->_subtitleLabel, "pkui_sizeThatFits:", v16, 1.79769313e308);
  double v23 = v22;
  if (self->_subtitleImage)
  {
    v24 = [(UIImageView *)self->_subtitleImageView image];
    uint64_t v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "pkui_alignmentSizeThatFits:maximumScale:", v16, 1.79769313e308, 1.0);
      double v26 = *((double *)&v34 + 1);
    }
    else
    {
      uint64_t v37 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      double v26 = 0.0;
    }
  }
  else
  {
    double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  int64_t textLayoutStyle = self->_textLayoutStyle;
  if (textLayoutStyle == 1)
  {
    if (v18 <= v21) {
      double v31 = v21;
    }
    else {
      double v31 = v18;
    }
    double v29 = v31 + 32.0;
    if (v23 <= v26) {
      double v30 = v26;
    }
    else {
      double v30 = v23;
    }
    goto LABEL_32;
  }
  double v28 = 0.0;
  if (!textLayoutStyle)
  {
    if (v18 <= v21) {
      double v29 = v21;
    }
    else {
      double v29 = v18;
    }
    double v30 = 32.0;
LABEL_32:
    double v28 = v29 + v30;
  }
  -[PKDashboardTextCollectionViewCell _maxWidthForTransactionCellInWidth:](self, "_maxWidthForTransactionCellInWidth:", width, v34, v35, v36, v37);
  double v33 = v28;
  result.height = v33;
  result.double width = v32;
  return result;
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)PKDashboardTextCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v55 layoutSubviews];
  int v3 = [(PKDashboardTextCollectionViewCell *)self _shouldReverseLayoutDirection];
  v4 = [(PKDashboardTextCollectionViewCell *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  BOOL v13 = v3 == 0;
  if (v3) {
    CGRectEdge v14 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v14 = CGRectMinXEdge;
  }
  memset(&v53, 0, sizeof(v53));
  remainder.origin.x = v6 + 16.0;
  remainder.origin.y = v8 + 16.0;
  remainder.size.double width = v10 + -32.0;
  remainder.size.height = v12 + -32.0;
  if (v13) {
    CGRectEdge v15 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v15 = CGRectMinXEdge;
  }
  disclosureView = self->_disclosureView;
  double v17 = (double *)MEMORY[0x1E4F1DB28];
  if (self->_hideDisclosure)
  {
    -[UIImageView setFrame:](disclosureView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  else
  {
    -[UIImageView sizeThatFits:](disclosureView, "sizeThatFits:");
    CGRectDivide(remainder, &v53, &remainder, v18, v15);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
    CGRectDivide(remainder, &v53, &remainder, 16.0, v15);
  }
  accessoryImageView = self->_accessoryImageView;
  if (self->_accessoryImage)
  {
    v20 = [(UIImageView *)accessoryImageView image];
    [v20 size];

    PKSizeAspectFit();
    CGRectDivide(remainder, &v53, &remainder, v21, v15);
    double v22 = self->_accessoryImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](v22, "setFrame:");
    CGRectDivide(remainder, &v53, &remainder, 16.0, v15);
  }
  else
  {
    -[UIImageView setFrame:](accessoryImageView, "setFrame:", *v17, v17[1], v17[2], v17[3]);
  }
  iconImageView = self->_iconImageView;
  if (self->_iconImage)
  {
    v24 = [(UIImageView *)iconImageView image];
    [v24 size];

    PKSizeAspectFit();
    CGRectDivide(remainder, &v53, &remainder, v25, v14);
    double v26 = self->_iconImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](v26, "setFrame:");
    CGRectDivide(remainder, &v53, &remainder, 10.0, v14);
  }
  else
  {
    -[UIImageView setFrame:](iconImageView, "setFrame:", *v17, v17[1], v17[2], v17[3]);
  }
  int64_t textLayoutStyle = self->_textLayoutStyle;
  if (textLayoutStyle == 1)
  {
    if (self->_subtitleImage)
    {
      double v31 = [(UIImageView *)self->_subtitleImageView image];
      [v31 size];

      PKSizeAspectFit();
      CGRectDivide(remainder, &v53, &remainder, v32, CGRectMaxYEdge);
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", *v17, v17[1], v17[2], v17[3]);
      subtitleImageView = self->_subtitleImageView;
      PKContentAlignmentMake();
      goto LABEL_22;
    }
    subtitleLabel = self->_subtitleLabel;
    if (self->_subtitle)
    {
      -[UILabel pkui_sizeThatFits:](subtitleLabel, "pkui_sizeThatFits:", remainder.size.width, 1.79769313e308);
      CGRectDivide(remainder, &v53, &remainder, v41, CGRectMaxYEdge);
      objc_super v40 = self->_subtitleLabel;
      goto LABEL_27;
    }
LABEL_28:
    double v42 = *v17;
    double v43 = v17[1];
    double v44 = v17[2];
    double v45 = v17[3];
    -[UILabel setFrame:](subtitleLabel, "setFrame:", *v17, v43, v44, v45, *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
    uint64_t v37 = self->_subtitleImageView;
    double v33 = v42;
    double v34 = v43;
    double v35 = v44;
    double v36 = v45;
    goto LABEL_29;
  }
  if (textLayoutStyle) {
    goto LABEL_30;
  }
  if (!self->_subtitleImage)
  {
    subtitleLabel = self->_subtitleLabel;
    if (self->_subtitle)
    {
      -[UILabel pkui_sizeThatFits:](subtitleLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
      CGRectDivide(remainder, &v53, &remainder, v39, v15);
      objc_super v40 = self->_subtitleLabel;
LABEL_27:
      -[UILabel setFrame:](v40, "setFrame:", *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size, *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
      uint64_t v37 = self->_subtitleImageView;
      double v33 = *v17;
      double v34 = v17[1];
      double v35 = v17[2];
      double v36 = v17[3];
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  double v28 = [(UIImageView *)self->_subtitleImageView image];
  [v28 size];

  PKSizeAspectFit();
  CGRectDivide(remainder, &v53, &remainder, v29, v15);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", *v17, v17[1], v17[2], v17[3]);
  subtitleImageView = self->_subtitleImageView;
LABEL_22:
  PKSizeAlignedInRect();
  uint64_t v37 = subtitleImageView;
LABEL_29:
  -[UIImageView setFrame:](v37, "setFrame:", v33, v34, v35, v36, *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
LABEL_30:
  if (self->_titleImage)
  {
    v46 = [(UIImageView *)self->_titleImageView image];
    [v46 size];

    PKSizeAspectFit();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", *v17, v17[1], v17[2], v17[3]);
    titleImageView = self->_titleImageView;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v52 = titleImageView;
  }
  else
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    v52 = self->_titleImageView;
    double v48 = *v17;
    double v49 = v17[1];
    double v50 = v17[2];
    double v51 = v17[3];
  }
  -[UIImageView setFrame:](v52, "setFrame:", v48, v49, v50, v51, *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_title;
  double v6 = (NSString *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    title = self->_title;
    self->_title = v8;

    [(UILabel *)self->_titleLabel setText:self->_title];
    [(PKDashboardTextCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTitleImage:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleImage, a3);
    [(PKDashboardTextCollectionViewCell *)self _setTitleImageAfterApplyingSymbolConfiguration];
    [(PKDashboardTextCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = self->_subtitle;
  double v6 = (NSString *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    subtitle = self->_subtitle;
    self->_subtitle = v8;

    [(UILabel *)self->_subtitleLabel setText:self->_subtitle];
    [(PKDashboardTextCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSubtitleImage:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitleImage, a3);
    [(PKDashboardTextCollectionViewCell *)self _setSubtitleImageAfterApplyingSymbolConfiguration];
    [(PKDashboardTextCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setAccessoryImage:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_accessoryImage, a3);
    [(PKDashboardTextCollectionViewCell *)self _setAccessoryImageAfterApplyingSymbolConfiguration];
    [(PKDashboardTextCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setTitleColor:(id)a3
{
  id v6 = a3;
  if (PKEqualObjects())
  {
    id v5 = [(PKDashboardTextCollectionViewCell *)self _defaultTitleColor];
    [(UILabel *)self->_titleLabel setTextColor:v5];
    [(UIImageView *)self->_titleImageView setTintColor:v5];
  }
  else
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    [(UILabel *)self->_titleLabel setTextColor:v6];
    [(UIImageView *)self->_titleImageView setTintColor:v6];
  }
}

- (void)setSubtitleColor:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitleColor, a3);
    if (v6)
    {
      -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:");
      [(UIImageView *)self->_subtitleImageView setTintColor:v6];
    }
    else
    {
      id v5 = [(PKDashboardTextCollectionViewCell *)self _defaultSubtitleColor];
      [(UILabel *)self->_subtitleLabel setTextColor:v5];
      [(UIImageView *)self->_subtitleImageView setTintColor:v5];
    }
  }
}

- (void)setAccessoryColor:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    if (v6)
    {
      objc_storeStrong((id *)&self->_accessoryColor, a3);
      [(UIImageView *)self->_accessoryImageView setTintColor:v6];
    }
    else
    {
      id v5 = [(PKDashboardTextCollectionViewCell *)self _defaultAccessoryColor];
      [(UIImageView *)self->_accessoryImageView setTintColor:v5];
    }
  }
}

- (void)setHideDisclosure:(BOOL)a3
{
  if (((!self->_hideDisclosure ^ a3) & 1) == 0)
  {
    self->_hideDisclosure = a3;
    -[UIImageView setHidden:](self->_disclosureView, "setHidden:");
    [(PKDashboardTextCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setTextLayoutStyle:(int64_t)a3
{
  if (self->_textLayoutStyle != a3)
  {
    self->_int64_t textLayoutStyle = a3;
    [(PKDashboardTextCollectionViewCell *)self _setFonts];
    [(PKDashboardTextCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setIconImage:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    [(PKDashboardTextCollectionViewCell *)self _setIconImageAfterApplyingSymbolConfiguration];
    [(PKDashboardTextCollectionViewCell *)self setNeedsLayout];
  }
}

- (double)_maxWidthForTransactionCellInWidth:(double)a3
{
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  return a3 + v4 * -2.0;
}

- (void)_setFonts
{
  id v4 = [(PKDashboardTextCollectionViewCell *)self _titleFont];
  int v3 = [(PKDashboardTextCollectionViewCell *)self _subtitleFont];
  [(UILabel *)self->_titleLabel setFont:v4];
  [(PKDashboardTextCollectionViewCell *)self _setTitleImageAfterApplyingSymbolConfiguration];
  [(UILabel *)self->_subtitleLabel setFont:v3];
  [(PKDashboardTextCollectionViewCell *)self _setSubtitleImageAfterApplyingSymbolConfiguration];
  [(PKDashboardTextCollectionViewCell *)self _setIconImageAfterApplyingSymbolConfiguration];
  [(PKDashboardTextCollectionViewCell *)self _setAccessoryImageAfterApplyingSymbolConfiguration];
}

- (id)_titleFont
{
  int64_t textLayoutStyle = self->_textLayoutStyle;
  if (textLayoutStyle == 1)
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2908], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    self = (PKDashboardTextCollectionViewCell *)objc_claimAutoreleasedReturnValue();
  }
  else if (!textLayoutStyle)
  {
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
    self = (PKDashboardTextCollectionViewCell *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (id)_subtitleFont
{
  int64_t textLayoutStyle = self->_textLayoutStyle;
  if (textLayoutStyle)
  {
    if (textLayoutStyle != 1) {
      goto LABEL_6;
    }
    int v3 = (NSString *)*MEMORY[0x1E4FB2790];
    id v4 = (NSString **)MEMORY[0x1E4FB28D0];
  }
  else
  {
    int v3 = 0;
    id v4 = (NSString **)MEMORY[0x1E4FB28C8];
  }
  PKFontForDefaultDesign(*v4, v3);
  self = (PKDashboardTextCollectionViewCell *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return self;
}

- (id)_defaultTitleColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (id)_defaultSubtitleColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (id)_defaultAccessoryColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (void)_setTitleImageAfterApplyingSymbolConfiguration
{
  if (self->_titleImage)
  {
    int v3 = (void *)MEMORY[0x1E4FB1830];
    id v4 = [(UILabel *)self->_titleLabel font];
    id v8 = [v3 configurationWithFont:v4 scale:-1];

    titleImageView = self->_titleImageView;
    id v6 = [(UIImage *)self->_titleImage imageByApplyingSymbolConfiguration:v8];
    [(UIImageView *)titleImageView setImage:v6];
  }
  else
  {
    BOOL v7 = self->_titleImageView;
    [(UIImageView *)v7 setImage:0];
  }
}

- (void)_setSubtitleImageAfterApplyingSymbolConfiguration
{
  if (self->_subtitleImage)
  {
    int v3 = (void *)MEMORY[0x1E4FB1830];
    id v4 = [(UILabel *)self->_subtitleLabel font];
    id v8 = [v3 configurationWithFont:v4 scale:-1];

    subtitleImageView = self->_subtitleImageView;
    id v6 = [(UIImage *)self->_subtitleImage imageByApplyingSymbolConfiguration:v8];
    [(UIImageView *)subtitleImageView setImage:v6];
  }
  else
  {
    BOOL v7 = self->_subtitleImageView;
    [(UIImageView *)v7 setImage:0];
  }
}

- (void)_setIconImageAfterApplyingSymbolConfiguration
{
  if (self->_iconImage)
  {
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    int v3 = [MEMORY[0x1E4FB1830] configurationWithFont:v11 scale:-1];
    iconImage = self->_iconImage;
    id v5 = [(UILabel *)self->_titleLabel textColor];
    id v6 = [(UIImage *)iconImage imageWithTintColor:v5];
    BOOL v7 = [v6 imageWithRenderingMode:1];

    iconImageView = self->_iconImageView;
    double v9 = [v7 imageByApplyingSymbolConfiguration:v3];
    [(UIImageView *)iconImageView setImage:v9];
  }
  else
  {
    double v10 = self->_iconImageView;
    [(UIImageView *)v10 setImage:0];
  }
}

- (void)_setAccessoryImageAfterApplyingSymbolConfiguration
{
  if (self->_accessoryImage)
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2908], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    int v3 = [MEMORY[0x1E4FB1830] configurationWithFont:v7 scale:3];
    accessoryImageView = self->_accessoryImageView;
    id v5 = [(UIImage *)self->_accessoryImage imageByApplyingSymbolConfiguration:v3];
    [(UIImageView *)accessoryImageView setImage:v5];
  }
  else
  {
    id v6 = self->_accessoryImageView;
    [(UIImageView *)v6 setImage:0];
  }
}

- (int64_t)textLayoutStyle
{
  return self->_textLayoutStyle;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)subtitleImage
{
  return self->_subtitleImage;
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (UIImage)accessoryImage
{
  return self->_accessoryImage;
}

- (UIColor)accessoryColor
{
  return self->_accessoryColor;
}

- (BOOL)hideDisclosure
{
  return self->_hideDisclosure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryColor, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_subtitleImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_subtitleImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end