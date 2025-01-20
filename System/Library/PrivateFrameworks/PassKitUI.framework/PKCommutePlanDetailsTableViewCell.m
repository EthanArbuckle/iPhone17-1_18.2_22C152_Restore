@interface PKCommutePlanDetailsTableViewCell
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)primaryText;
- (NSString)secondaryText;
- (PKCommutePlanDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKCommutePlanDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 passDetailViewStyle:(int64_t)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
@end

@implementation PKCommutePlanDetailsTableViewCell

- (PKCommutePlanDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(PKCommutePlanDetailsTableViewCell *)self initWithStyle:a3 reuseIdentifier:a4 passDetailViewStyle:0];
}

- (PKCommutePlanDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 passDetailViewStyle:(int64_t)a5
{
  v24.receiver = self;
  v24.super_class = (Class)PKCommutePlanDetailsTableViewCell;
  v6 = [(PKCommutePlanDetailsTableViewCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  v7 = v6;
  if (v6)
  {
    v8 = [(PKCommutePlanDetailsTableViewCell *)v6 contentView];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = v7->_primaryLabel;
    v7->_primaryLabel = v9;

    [(UILabel *)v7->_primaryLabel setNumberOfLines:0];
    [(UILabel *)v7->_primaryLabel setLineBreakMode:0];
    v11 = v7->_primaryLabel;
    v12 = (NSString *)*MEMORY[0x1E4FB27F0];
    v13 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0]);
    [(UILabel *)v11 setFont:v13];

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryLabel = v7->_secondaryLabel;
    v7->_secondaryLabel = v14;

    [(UILabel *)v7->_secondaryLabel setNumberOfLines:0];
    [(UILabel *)v7->_secondaryLabel setLineBreakMode:0];
    v16 = v7->_secondaryLabel;
    v17 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], v12);
    [(UILabel *)v16 setFont:v17];

    v18 = v7->_primaryLabel;
    if (a5 == 2)
    {
      v19 = PKBridgeAppearanceGetAppearanceSpecifier();
      v20 = [v19 textColor];
      [(UILabel *)v18 setTextColor:v20];
    }
    else
    {
      v21 = [MEMORY[0x1E4FB1618] labelColor];
      [(UILabel *)v18 setTextColor:v21];

      v22 = v7->_secondaryLabel;
      v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UILabel *)v22 setTextColor:v19];
    }

    [v8 addSubview:v7->_primaryLabel];
    [v8 addSubview:v7->_secondaryLabel];
  }
  return v7;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKCommutePlanDetailsTableViewCell;
  [(PKCommutePlanDetailsTableViewCell *)&v4 layoutSubviews];
  v3 = [(PKCommutePlanDetailsTableViewCell *)self contentView];
  [v3 bounds];
  [(PKCommutePlanDetailsTableViewCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_templateLayout = 1;
  -[PKCommutePlanDetailsTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, 1.79769313e308);
  self->_templateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PKCommutePlanDetailsTableViewCell;
  [(PKCommutePlanDetailsTableViewCell *)&v5 prepareForReuse];
  primaryText = self->_primaryText;
  self->_primaryText = 0;

  secondaryText = self->_secondaryText;
  self->_secondaryText = 0;
}

- (void)setPrimaryText:(id)a3
{
  id v4 = a3;
  primaryText = self->_primaryText;
  v10 = (NSString *)v4;
  v6 = primaryText;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_primaryText;
    self->_primaryText = v8;

    [(UILabel *)self->_primaryLabel setText:self->_primaryText];
    [(PKCommutePlanDetailsTableViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSecondaryText:(id)a3
{
  id v4 = a3;
  secondaryText = self->_secondaryText;
  v10 = (NSString *)v4;
  v6 = secondaryText;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_secondaryText;
    self->_secondaryText = v8;

    [(UILabel *)self->_secondaryLabel setText:self->_secondaryText];
    [(PKCommutePlanDetailsTableViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  memset(&slice, 0, sizeof(slice));
  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  CGFloat v10 = width - (v8 + v9);
  remainder.origin.double x = x + v8;
  remainder.origin.double y = y + 10.0;
  remainder.size.double width = v10;
  remainder.size.double height = height + -20.0;
  [(PKCommutePlanDetailsTableViewCell *)self _shouldReverseLayoutDirection];
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_primaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v10, height + -20.0);
  CGFloat v12 = v11;
  v27.origin.double x = remainder.origin.x;
  v27.origin.double y = y + 10.0;
  v27.size.double width = v10;
  v27.size.double height = height + -20.0;
  CGRectDivide(v27, &slice, &remainder, v12, CGRectMinYEdge);
  double v22 = slice.origin.y;
  double v23 = slice.origin.x;
  double v20 = slice.size.height;
  double v21 = slice.size.width;
  CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
  double v13 = v12 + 4.0 + 20.0;
  if (PKStringIsBlank(self->_secondaryText))
  {
    if (!self->_templateLayout)
    {
      primaryLabel = self->_primaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](primaryLabel, "setFrame:");
    }
  }
  else
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    double v16 = v15;
    CGRectDivide(remainder, &slice, &remainder, v15, CGRectMinYEdge);
    if (!self->_templateLayout)
    {
      -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v23, v22, v21, v20);
      -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    }
    double v13 = v13 + v16;
  }
  float v17 = v13;
  double v18 = ceilf(v17);
  double v19 = width;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end