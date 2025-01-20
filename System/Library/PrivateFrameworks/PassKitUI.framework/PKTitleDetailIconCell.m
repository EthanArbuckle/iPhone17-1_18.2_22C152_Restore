@interface PKTitleDetailIconCell
- (BOOL)centerDetailText;
- (BOOL)centerTitleText;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)detailText;
- (NSString)titleText;
- (UIColor)detailTextColor;
- (UIColor)titleTextColor;
- (UIFont)detailFont;
- (UIFont)titleFont;
- (UIImage)icon;
- (double)additionalIconPadding;
- (void)_configureView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAdditionalIconPadding:(double)a3;
- (void)setCenterDetailText:(BOOL)a3;
- (void)setCenterTitleText:(BOOL)a3;
- (void)setDetailFont:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setDetailTextColor:(id)a3;
- (void)setIcon:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation PKTitleDetailIconCell

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKTitleDetailIconCell;
  [(PKTitleDetailIconCell *)&v4 layoutSubviews];
  v3 = [(PKTitleDetailIconCell *)self contentView];
  [v3 bounds];
  -[PKTitleDetailIconCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKTitleDetailIconCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width = a3.size.width;
  double v7 = a3.origin.x + 12.0;
  double v8 = a3.origin.y + 12.0;
  double v9 = a3.size.width + -24.0;
  double v10 = a3.size.height + -24.0;
  if ([(PKTitleDetailIconCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v11 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v11 = CGRectMinXEdge;
  }
  memset(&v51, 0, sizeof(v51));
  remainder.origin.x = v7;
  remainder.origin.y = v8;
  remainder.size.double width = width + -24.0;
  remainder.size.height = v10;
  icon = self->_icon;
  uint64_t v13 = MEMORY[0x1E4F1DB28];
  if (icon)
  {
    [(UIImage *)icon size];
    CGFloat v15 = v14;
    double v17 = v16;
    v18 = self->_icon;
    CGSize v19 = *(CGSize *)(v13 + 16);
    slice.origin = *(CGPoint *)v13;
    slice.size = v19;
    if (v18)
    {
      v53.origin.x = v7;
      v53.origin.y = v8;
      v53.size.double width = width + -24.0;
      v53.size.height = v10;
      CGRectDivide(v53, &slice, &remainder, v15, v11);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      slice.origin.x = v20;
      slice.origin.y = v21;
      slice.size.double width = v22;
      slice.size.height = v23;
      CGRectDivide(remainder, &v51, &remainder, 10.0, v11);
      CGRectDivide(remainder, &v51, &remainder, self->_additionalIconPadding, v11);
      double v9 = remainder.size.width;
    }
  }
  else
  {
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    slice.size = v24;
  }
  if (self->_titleText)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, v10);
    double v26 = v25;
    double v28 = v27;
  }
  else
  {
    double v26 = *MEMORY[0x1E4F1DB30];
    double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_detailText)
  {
    -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v9, v10);
    double v30 = v29;
    double v32 = v31;
  }
  else
  {
    double v30 = *MEMORY[0x1E4F1DB30];
    double v32 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  CGPoint v33 = *(CGPoint *)v13;
  CGSize v34 = *(CGSize *)(v13 + 16);
  v48.origin = *(CGPoint *)v13;
  v48.size = v34;
  if (v26 > 0.0)
  {
    CGSize v45 = v34;
    CGPoint v46 = v33;
    CGRectDivide(remainder, &v48, &remainder, v28, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v48.origin.x = v35;
    v48.origin.y = v36;
    CGSize v34 = v45;
    CGPoint v33 = v46;
    v48.size.double width = v37;
    v48.size.height = v38;
  }
  v47.origin = v33;
  v47.size = v34;
  if (v30 > 0.0)
  {
    CGRectDivide(remainder, &v47, &remainder, v32, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v47.origin.x = v39;
    v47.origin.y = v40;
    v47.size.double width = v41;
    v47.size.height = v42;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
    -[UIImageView setFrame:](self->_iconView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  double v43 = fmax(v17, v28 + v32) + 0.0 + 24.0;
  double v44 = width;
  result.height = v43;
  result.double width = v44;
  return result;
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  titleText = self->_titleText;
  double v9 = (NSString *)v5;
  double v7 = titleText;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_titleText, a3);
    [(PKTitleDetailIconCell *)self _configureView];
  }
LABEL_9:
}

- (void)setDetailText:(id)a3
{
  id v5 = a3;
  detailText = self->_detailText;
  double v9 = (NSString *)v5;
  double v7 = detailText;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_detailText, a3);
    [(PKTitleDetailIconCell *)self _configureView];
  }
LABEL_9:
}

- (void)setTitleFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    [(PKTitleDetailIconCell *)self _configureView];
  }
}

- (void)setDetailFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailFont, a3);
    [(PKTitleDetailIconCell *)self _configureView];
  }
}

- (void)setTitleTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    [(PKTitleDetailIconCell *)self _configureView];
  }
}

- (void)setDetailTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailTextColor, a3);
    [(PKTitleDetailIconCell *)self _configureView];
  }
}

- (void)setIcon:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    [(PKTitleDetailIconCell *)self _configureView];
    id v5 = v6;
  }
}

- (void)setAdditionalIconPadding:(double)a3
{
  if (self->_additionalIconPadding != a3)
  {
    self->_additionalIconPadding = a3;
    [(PKTitleDetailIconCell *)self setNeedsLayout];
  }
}

- (void)setCenterTitleText:(BOOL)a3
{
  if (self->_centerTitleText != a3)
  {
    self->_centerTitleText = a3;
    [(PKTitleDetailIconCell *)self _configureView];
  }
}

- (void)setCenterDetailText:(BOOL)a3
{
  if (self->_centerDetailText != a3)
  {
    self->_centerDetailText = a3;
    [(PKTitleDetailIconCell *)self _configureView];
  }
}

- (void)_configureView
{
  id v27 = [(PKTitleDetailIconCell *)self contentView];
  int v3 = [(PKTitleDetailIconCell *)self _shouldReverseLayoutDirection];
  titleLabel = self->_titleLabel;
  if (self->_titleText)
  {
    if (!titleLabel)
    {
      id v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v6 = self->_titleLabel;
      self->_titleLabel = v5;

      [(UILabel *)self->_titleLabel setNumberOfLines:0];
      [v27 addSubview:self->_titleLabel];
      titleLabel = self->_titleLabel;
    }
    if (self->_titleFont)
    {
      -[UILabel setFont:](titleLabel, "setFont:");
    }
    else
    {
      BOOL v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
      [(UILabel *)titleLabel setFont:v8];
    }
    double v9 = self->_titleLabel;
    if (self->_titleTextColor)
    {
      -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
    }
    else
    {
      double v10 = [MEMORY[0x1E4FB1618] labelColor];
      [(UILabel *)v9 setTextColor:v10];
    }
    [(UILabel *)self->_titleLabel setText:self->_titleText];
    uint64_t v11 = 2;
    if (!v3) {
      uint64_t v11 = 0;
    }
    if (self->_centerTitleText) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    [(UILabel *)self->_titleLabel setTextAlignment:v12];
    [(UILabel *)self->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  }
  else
  {
    [(UILabel *)self->_titleLabel removeFromSuperview];
    double v7 = self->_titleLabel;
    self->_titleLabel = 0;
  }
  detailLabel = self->_detailLabel;
  if (self->_detailText)
  {
    if (!detailLabel)
    {
      double v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      CGFloat v15 = self->_detailLabel;
      self->_detailLabel = v14;

      [(UILabel *)self->_detailLabel setNumberOfLines:0];
      [v27 addSubview:self->_detailLabel];
      detailLabel = self->_detailLabel;
    }
    if (self->_detailFont)
    {
      -[UILabel setFont:](detailLabel, "setFont:");
    }
    else
    {
      double v17 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2790]);
      [(UILabel *)detailLabel setFont:v17];
    }
    v18 = self->_detailLabel;
    if (self->_detailTextColor)
    {
      -[UILabel setTextColor:](self->_detailLabel, "setTextColor:");
    }
    else
    {
      CGSize v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UILabel *)v18 setTextColor:v19];
    }
    [(UILabel *)self->_detailLabel setText:self->_detailText];
    uint64_t v20 = 2;
    if (!v3) {
      uint64_t v20 = 0;
    }
    if (self->_centerDetailText) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v20;
    }
    [(UILabel *)self->_detailLabel setTextAlignment:v21];
    [(UILabel *)self->_detailLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
  }
  else
  {
    [(UILabel *)self->_detailLabel removeFromSuperview];
    double v16 = self->_detailLabel;
    self->_detailLabel = 0;
  }
  icon = self->_icon;
  iconView = self->_iconView;
  if (icon)
  {
    if (!iconView)
    {
      CGSize v24 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      double v25 = self->_iconView;
      self->_iconView = v24;

      [v27 addSubview:self->_iconView];
      iconView = self->_iconView;
      icon = self->_icon;
    }
    [(UIImageView *)iconView setImage:icon];
  }
  else
  {
    [(UIImageView *)iconView removeFromSuperview];
    double v26 = self->_iconView;
    self->_iconView = 0;
  }
  [(PKTitleDetailIconCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  v12.receiver = self;
  v12.super_class = (Class)PKTitleDetailIconCell;
  [(PKTitleDetailIconCell *)&v12 prepareForReuse];
  [(UILabel *)self->_titleLabel removeFromSuperview];
  [(UILabel *)self->_detailLabel removeFromSuperview];
  [(UIImageView *)self->_iconView removeFromSuperview];
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  detailLabel = self->_detailLabel;
  self->_detailLabel = 0;

  titleText = self->_titleText;
  self->_titleText = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  icon = self->_icon;
  self->_icon = 0;

  titleTextColor = self->_titleTextColor;
  self->_titleTextColor = 0;

  detailTextColor = self->_detailTextColor;
  self->_detailTextColor = 0;

  titleFont = self->_titleFont;
  self->_titleFont = 0;

  detailFont = self->_detailFont;
  self->_detailFont = 0;

  self->_additionalIconPadding = 0.0;
  self->_centerTitleText = 0;
  self->_centerDetailText = 0;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIImage)icon
{
  return self->_icon;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)detailFont
{
  return self->_detailFont;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (BOOL)centerTitleText
{
  return self->_centerTitleText;
}

- (BOOL)centerDetailText
{
  return self->_centerDetailText;
}

- (double)additionalIconPadding
{
  return self->_additionalIconPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end