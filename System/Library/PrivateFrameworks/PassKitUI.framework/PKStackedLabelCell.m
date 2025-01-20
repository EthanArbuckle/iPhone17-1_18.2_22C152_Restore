@interface PKStackedLabelCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)detailText;
- (NSString)titleText;
- (PKStackedLabelCell)initWithReuseIdentifier:(id)a3;
- (PKStackedLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)detailTextColor;
- (UIColor)titleTextColor;
- (UIImage)detailImage;
- (void)_applyLabelStyles;
- (void)layoutSubviews;
- (void)setDetailImage:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setDetailTextColor:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKStackedLabelCell

- (PKStackedLabelCell)initWithReuseIdentifier:(id)a3
{
  return [(PKStackedLabelCell *)self initWithStyle:0 reuseIdentifier:a3];
}

- (PKStackedLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)PKStackedLabelCell;
  v4 = [(PKStackedLabelCell *)&v17 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
    titleTextColor = v4->_titleTextColor;
    v4->_titleTextColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    detailTextColor = v4->_detailTextColor;
    v4->_detailTextColor = (UIColor *)v7;

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setTextAlignment:4];
    [(UILabel *)v4->_titleLabel setTextColor:v4->_titleTextColor];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v11;

    [(UILabel *)v4->_detailLabel setNumberOfLines:0];
    [(UILabel *)v4->_detailLabel setTextAlignment:4];
    [(UILabel *)v4->_detailLabel setTextColor:v4->_detailTextColor];
    [(UILabel *)v4->_detailLabel setLineBreakMode:4];
    [(UILabel *)v4->_detailLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    detailImageView = v4->_detailImageView;
    v4->_detailImageView = v13;

    [(PKStackedLabelCell *)v4 _applyLabelStyles];
    v15 = [(PKStackedLabelCell *)v4 contentView];
    [v15 addSubview:v4->_titleLabel];
    [v15 addSubview:v4->_detailLabel];
    [v15 addSubview:v4->_detailImageView];
    v4->_isRTL = [(PKStackedLabelCell *)v4 _shouldReverseLayoutDirection];
  }
  return v4;
}

- (void)_applyLabelStyles
{
  titleLabel = self->_titleLabel;
  v4 = (NSString *)*MEMORY[0x1E4FB28C8];
  uint64_t v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)titleLabel setFont:v5];

  detailLabel = self->_detailLabel;
  PKFontForDefaultDesign(v4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)detailLabel setFont:v7];
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)PKStackedLabelCell;
  [(PKStackedLabelCell *)&v44 layoutSubviews];
  [(UILabel *)self->_titleLabel frame];
  [(UILabel *)self->_detailLabel frame];
  [(UIImageView *)self->_detailImageView frame];
  v3 = [(UILabel *)self->_titleLabel font];
  [v3 lineHeight];
  double v40 = v4;

  uint64_t v5 = [(UILabel *)self->_detailLabel font];
  [v5 lineHeight];

  v6 = [(PKStackedLabelCell *)self contentView];
  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v6 bounds];
  double v16 = v10 + v15;
  double v18 = v8 + v17;
  double v20 = v19 - (v10 + v14);
  double v22 = v21 - (v8 + v12);
  remainder.origin.x = v16;
  remainder.origin.y = v18;
  remainder.size.width = v20;
  remainder.size.height = v22;
  memset(&slice, 0, sizeof(slice));
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v20, v22);
  double v24 = v23;
  CGFloat amount = v25;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v20, v22);
  double v27 = v26;
  -[UIImageView sizeThatFits:](self->_detailImageView, "sizeThatFits:", v20, v22);
  double v29 = v28;
  PKFloatRoundToPixel();
  double v31 = v30;
  double v41 = v27;
  double v32 = v30 + v24 + v27 + v29 + v40 * 0.4863;
  CGRectEdge v33 = 2 * self->_isRTL;
  PKContentAlignmentMake();
  if (v32 <= v20)
  {
    PKContentAlignmentMake();
    CGRectDivide(remainder, &slice, &remainder, v24, v33);
    titleLabel = self->_titleLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](titleLabel, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, remainder.size.width - v41 - v31, v33);
    detailImageView = self->_detailImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](detailImageView, "setFrame:");
  }
  else
  {
    v45.origin.x = v16;
    v45.origin.y = v18;
    v45.size.width = v20;
    v45.size.height = v22;
    CGRectDivide(v45, &slice, &remainder, amount, CGRectMinYEdge);
    v34 = self->_titleLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v34, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, 6.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v29, v33);
    v35 = self->_detailImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](v35, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, v31, v33);
  detailLabel = self->_detailLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](detailLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = [(PKStackedLabelCell *)self contentView];
  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  double v38 = v6;
  double v39 = v5;
  double v8 = v7;
  double v10 = v9;
  [v4 frame];
  double v12 = v11 - (v8 + v10);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, 1.79769313e308);
  double v14 = v13;
  double v16 = v15;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v12, 1.79769313e308);
  double v18 = v17;
  double v20 = v19;
  -[UIImageView sizeThatFits:](self->_detailImageView, "sizeThatFits:", v12, 1.79769313e308);
  double v22 = v21;
  double v23 = [(UILabel *)self->_titleLabel font];
  [v23 lineHeight];
  double v25 = v24;

  double v26 = [(UILabel *)self->_detailLabel font];
  [v26 lineHeight];
  double v28 = v27;

  v31.n128_f64[0] = fmax(v16, v20);
  if (v14 + v18 + v22 + v25 * 0.4863 + v28 * 0.0986 <= v12) {
    v29.n128_f64[0] = v31.n128_f64[0];
  }
  else {
    v29.n128_f64[0] = v16 + 6.0 + v20;
  }
  v30.n128_f64[0] = v38 + v39 + v29.n128_f64[0];
  v29.n128_f64[0] = width;
  PKSizeRoundToPixel(v29, v30, v31);
  double v33 = v32;
  double v35 = v34;

  double v36 = v33;
  double v37 = v35;
  result.height = v37;
  result.CGFloat width = v36;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKStackedLabelCell;
  [(PKStackedLabelCell *)&v4 traitCollectionDidChange:a3];
  [(PKStackedLabelCell *)self _applyLabelStyles];
  [(PKStackedLabelCell *)self setNeedsLayout];
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  double v6 = self->_titleText;
  double v7 = (NSString *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_titleText, a3);
    [(UILabel *)self->_titleLabel setText:self->_titleText];
    [(UILabel *)self->_titleLabel sizeToFit];
    [(PKStackedLabelCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setDetailText:(id)a3
{
  id v5 = a3;
  double v6 = self->_detailText;
  double v7 = (NSString *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_detailText, a3);
    [(UILabel *)self->_detailLabel setText:v9];
    [(UILabel *)self->_detailLabel sizeToFit];
    [(PKStackedLabelCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setDetailImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_detailImage != v5)
  {
    objc_storeStrong((id *)&self->_detailImage, a3);
    [(UIImageView *)self->_detailImageView setImage:v5];
    [(UIImageView *)self->_detailImageView setTintColor:self->_detailTextColor];
    [(PKStackedLabelCell *)self setNeedsLayout];
  }
}

- (void)setTitleTextColor:(id)a3
{
  p_titleTextColor = &self->_titleTextColor;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    [(UILabel *)self->_titleLabel setTextColor:*p_titleTextColor];
  }
}

- (void)setDetailTextColor:(id)a3
{
  p_detailTextColor = &self->_detailTextColor;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailTextColor, a3);
    [(UILabel *)self->_detailLabel setTextColor:*p_detailTextColor];
  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIImage)detailImage
{
  return self->_detailImage;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_detailImage, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_detailImageView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end