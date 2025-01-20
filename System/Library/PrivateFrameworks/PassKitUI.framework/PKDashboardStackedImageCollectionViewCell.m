@interface PKDashboardStackedImageCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)subtitle;
- (NSString)tertiaryText;
- (NSString)title;
- (PKDashboardStackedImageCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImage)icon;
- (double)_contentHeightWithWidth:(double)a3;
- (double)_maxWidthForTransactionCellInWidth:(double)a3;
- (void)layoutSubviews;
- (void)setIcon:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTertiaryText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKDashboardStackedImageCollectionViewCell

- (PKDashboardStackedImageCollectionViewCell)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)PKDashboardStackedImageCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKDashboardStackedImageCollectionViewCell *)v3 contentView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v11;

    [(UIImageView *)v4->_iconImageView _setContinuousCornerRadius:8.0];
    [(UIImageView *)v4->_iconImageView setClipsToBounds:1];
    [(UIImageView *)v4->_iconImageView setContentMode:1];
    v13 = [(UIImageView *)v4->_iconImageView layer];
    id v14 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    objc_msgSend(v13, "setBorderColor:", objc_msgSend(v14, "CGColor"));

    [v13 setBorderWidth:PKUIPixelLength()];
    [v5 addSubview:v4->_iconImageView];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v15;

    v17 = v4->_titleLabel;
    v18 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], 0, 2, 0);
    [(UILabel *)v17 setFont:v18];

    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [v5 addSubview:v4->_titleLabel];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v19;

    v21 = v4->_subtitleLabel;
    v22 = (NSString *)*MEMORY[0x1E4FB2950];
    v23 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    [(UILabel *)v21 setFont:v23];

    v24 = v4->_subtitleLabel;
    v25 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v24 setTextColor:v25];

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:2];
    [(UILabel *)v4->_subtitleLabel setTextAlignment:1];
    [v5 addSubview:v4->_subtitleLabel];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    tertiaryLabel = v4->_tertiaryLabel;
    v4->_tertiaryLabel = (UILabel *)v26;

    v28 = v4->_tertiaryLabel;
    v29 = PKFontForDefaultDesign(v22, 0);
    [(UILabel *)v28 setFont:v29];

    v30 = v4->_tertiaryLabel;
    v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v30 setTextColor:v31];

    [(UILabel *)v4->_tertiaryLabel setNumberOfLines:2];
    [(UILabel *)v4->_tertiaryLabel setTextAlignment:1];
    [v5 addSubview:v4->_tertiaryLabel];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDashboardStackedImageCollectionViewCell _maxWidthForTransactionCellInWidth:](self, "_maxWidthForTransactionCellInWidth:", a3.width, a3.height);
  double v5 = v4;
  [(PKDashboardStackedImageCollectionViewCell *)self _contentHeightWithWidth:v4 + -32.0];
  double v7 = fmax(v6 + 32.0, 200.0);
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)_contentHeightWithWidth:(double)a3
{
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
  double v6 = v5 + 86.0;
  double v7 = [(UILabel *)self->_subtitleLabel text];

  if (v7)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
    double v6 = v6 + v8 + 3.0;
  }
  double v9 = [(UILabel *)self->_tertiaryLabel text];

  if (v9)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
    return v6 + v10 + 3.0;
  }
  return v6;
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)PKDashboardStackedImageCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v40 layoutSubviews];
  v3 = [(PKDashboardStackedImageCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double x = v5 + 16.0;
  double y = v7 + 16.0;
  double width = v9 + -32.0;
  remainder.origin.double x = x;
  remainder.origin.double y = y;
  double height = v11 + -32.0;
  remainder.size.double width = width;
  remainder.size.double height = height;
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  -[PKDashboardStackedImageCollectionViewCell _contentHeightWithWidth:](self, "_contentHeightWithWidth:", CGRectGetWidth(v41), (unsigned __int128)0, (unsigned __int128)0);
  double v17 = v16;
  v42.origin.double x = x;
  v42.origin.double y = y;
  v42.size.double width = width;
  v42.size.double height = height;
  if (v17 < CGRectGetHeight(v42))
  {
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    CGRectGetHeight(v43);
    PKFloatRoundToPixel();
    CGRectDivide(remainder, &v38, &remainder, v18, CGRectMinYEdge);
    double x = remainder.origin.x;
    double y = remainder.origin.y;
    double width = remainder.size.width;
    double height = remainder.size.height;
  }
  v44.origin.double x = x;
  v44.origin.double y = y;
  v44.size.double width = width;
  v44.size.double height = height;
  CGRectDivide(v44, &v38, &remainder, 70.0, CGRectMinYEdge);
  iconImageView = self->_iconImageView;
  [(UIImage *)self->_icon size];
  PKSizeAspectFit();
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](iconImageView, "setFrame:");
  CGRectDivide(remainder, &v38, &remainder, 16.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v38, &remainder, v20, CGRectMinYEdge);
  titleLabel = self->_titleLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  v22 = [(UILabel *)self->_subtitleLabel text];

  if (v22)
  {
    CGRectDivide(remainder, &v38, &remainder, 3.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGRectDivide(remainder, &v38, &remainder, v23, CGRectMinYEdge);
    subtitleLabel = self->_subtitleLabel;
    PKSizeAlignedInRect();
    v29 = subtitleLabel;
  }
  else
  {
    v29 = self->_subtitleLabel;
    double v25 = *MEMORY[0x1E4F1DB28];
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  -[UILabel setFrame:](v29, "setFrame:", v25, v26, v27, v28);
  v30 = [(UILabel *)self->_tertiaryLabel text];

  if (v30)
  {
    CGRectDivide(remainder, &v38, &remainder, 3.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGRectDivide(remainder, &v38, &remainder, v31, CGRectMinYEdge);
    tertiaryLabel = self->_tertiaryLabel;
    PKSizeAlignedInRect();
    v37 = tertiaryLabel;
  }
  else
  {
    v37 = self->_tertiaryLabel;
    double v33 = *MEMORY[0x1E4F1DB28];
    double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  -[UILabel setFrame:](v37, "setFrame:", v33, v34, v35, v36);
}

- (void)setIcon:(id)a3
{
  p_icon = &self->_icon;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    [(UIImageView *)self->_iconImageView setImage:*p_icon];
    [(PKDashboardStackedImageCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_title;
  id v6 = (NSString *)v4;
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
    [(PKDashboardStackedImageCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_subtitle;
  id v6 = (NSString *)v4;
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
    [(PKDashboardStackedImageCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTertiaryText:(id)a3
{
  id v4 = a3;
  double v5 = self->_tertiaryText;
  id v6 = (NSString *)v4;
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
    tertiaryText = self->_tertiaryText;
    self->_tertiaryText = v8;

    [(UILabel *)self->_tertiaryLabel setText:self->_tertiaryText];
    [(PKDashboardStackedImageCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (double)_maxWidthForTransactionCellInWidth:(double)a3
{
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  return a3 + v4 * -2.0;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end