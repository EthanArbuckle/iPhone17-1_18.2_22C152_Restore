@interface PKCenteredTextCollectionViewCell
- (NSString)subtitle;
- (NSString)title;
- (PKCenteredTextCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)resetFonts;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTitleTextColor;
@end

@implementation PKCenteredTextCollectionViewCell

- (PKCenteredTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PKCenteredTextCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    v11 = [(PKCenteredTextCollectionViewCell *)v3 contentView];
    [v11 addSubview:v3->_titleLabel];

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v12;

    v14 = v3->_subtitleLabel;
    v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v14 setTextColor:v15];

    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v3->_subtitleLabel setTextAlignment:1];
    v16 = [(PKCenteredTextCollectionViewCell *)v3 contentView];
    [v16 addSubview:v3->_subtitleLabel];
  }
  return v3;
}

- (void)resetFonts
{
  v3 = [(UILabel *)self->_subtitleLabel text];
  uint64_t v4 = [v3 length];

  titleLabel = self->_titleLabel;
  double v6 = (NSString *)*MEMORY[0x1E4FB2790];
  if (v4)
  {
    double v7 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2998], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    [(UILabel *)titleLabel setFont:v7];

    double v8 = (NSString *)*MEMORY[0x1E4FB28C8];
  }
  else
  {
    double v8 = (NSString *)*MEMORY[0x1E4FB28C8];
    uint64_t v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    [(UILabel *)titleLabel setFont:v9];
  }
  subtitleLabel = self->_subtitleLabel;
  v11 = PKFontForDefaultDesign(v8, v6);
  [(UILabel *)subtitleLabel setFont:v11];

  [(PKCenteredTextCollectionViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)PKCenteredTextCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v30 layoutSubviews];
  v3 = [(PKCenteredTextCollectionViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9 + -32.0, v11);
  CGFloat v13 = v12;
  v14 = [(UILabel *)self->_subtitleLabel text];
  if ([v14 length])
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v9 + -32.0, v11);
    uint64_t v27 = v15;
    double v17 = v16;
  }
  else
  {
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v27 = *MEMORY[0x1E4F1DB30];
  }

  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v11;
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  CGRectDivide(v31, &slice, &remainder, 16.0, CGRectMinXEdge);
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMaxXEdge);
  PKFloatCeilToPixel();
  CGFloat v19 = v18;
  CGRectDivide(remainder, &slice, &remainder, v18, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v19, CGRectMaxYEdge);
  CGRectDivide(remainder, &slice, &remainder, v13, CGRectMinYEdge);
  titleLabel = self->_titleLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  if (v17 <= 0.0)
  {
    subtitleLabel = self->_subtitleLabel;
    double v22 = *MEMORY[0x1E4F1DB28];
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v17, CGRectMinYEdge);
    v21 = self->_subtitleLabel;
    PKSizeAlignedInRect();
    subtitleLabel = v21;
  }
  -[UILabel setFrame:](subtitleLabel, "setFrame:", v22, v23, v24, v25, v27);
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(UILabel *)self->_titleLabel text];
  id v8 = v4;
  id v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(UILabel *)self->_titleLabel setText:v8];
    [(PKCenteredTextCollectionViewCell *)self resetFonts];
    [(PKCenteredTextCollectionViewCell *)self updateTitleTextColor];
    [(PKCenteredTextCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(UILabel *)self->_subtitleLabel text];
  id v8 = v4;
  id v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(UILabel *)self->_subtitleLabel setText:v8];
    [(PKCenteredTextCollectionViewCell *)self resetFonts];
    [(PKCenteredTextCollectionViewCell *)self updateTitleTextColor];
    [(PKCenteredTextCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)updateTitleTextColor
{
  v3 = [(UILabel *)self->_subtitleLabel text];
  uint64_t v4 = [v3 length];

  titleLabel = self->_titleLabel;
  if (v4) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  id v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [(UILabel *)titleLabel setTextColor:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKCenteredTextCollectionViewCell;
  [(PKCenteredTextCollectionViewCell *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKCenteredTextCollectionViewCell *)self traitCollection];
  id v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      char v7 = [v4 preferredContentSizeCategory];
      id v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9) {
        [(PKCenteredTextCollectionViewCell *)self resetFonts];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end