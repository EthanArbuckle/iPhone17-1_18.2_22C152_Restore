@interface PKTitleDetailValueCell
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)detailText;
- (NSString)titleText;
- (NSString)valueText;
- (PKTitleDetailValueCell)initWithFrame:(CGRect)a3;
- (PKTitleDetailValueCell)initWithSize:(CGSize)a3;
- (UIColor)detailColor;
- (UIColor)titleColor;
- (UIColor)valueColor;
- (UIFont)detailFont;
- (UIFont)titleFont;
- (UIFont)valueFont;
- (UIImage)detailIcon;
- (double)horizontalMargin;
- (double)labelPadding;
- (double)verticalMargin;
- (unint64_t)accessory;
- (void)_configureView;
- (void)_resetValues;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessory:(unint64_t)a3;
- (void)setDetailColor:(id)a3;
- (void)setDetailFont:(id)a3;
- (void)setDetailIcon:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHorizontalMargin:(double)a3;
- (void)setLabelPadding:(double)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setValueColor:(id)a3;
- (void)setValueFont:(id)a3;
- (void)setValueText:(id)a3;
- (void)setVerticalMargin:(double)a3;
@end

@implementation PKTitleDetailValueCell

- (PKTitleDetailValueCell)initWithSize:(CGSize)a3
{
  return -[PKTitleDetailValueCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKTitleDetailValueCell)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PKTitleDetailValueCell;
  v3 = -[PKTitleDetailValueCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSString *)*MEMORY[0x1E4FB28C8];
    v5 = (NSString *)*MEMORY[0x1E4FB2790];
    uint64_t v6 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    defaultTitleFont = v3->_defaultTitleFont;
    v3->_defaultTitleFont = (UIFont *)v6;

    uint64_t v8 = PKFontForDefaultDesign(v4, v5);
    defaultDetailFont = v3->_defaultDetailFont;
    v3->_defaultDetailFont = (UIFont *)v8;

    uint64_t v10 = PKFontForDefaultDesign(v4, v5);
    defaultValueFont = v3->_defaultValueFont;
    v3->_defaultValueFont = (UIFont *)v10;

    uint64_t v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    defaultDetailColor = v3->_defaultDetailColor;
    v3->_defaultDetailColor = (UIColor *)v12;

    [(PKTitleDetailValueCell *)v3 _resetValues];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKTitleDetailValueCell;
  [(PKTitleDetailValueCell *)&v4 layoutSubviews];
  v3 = [(PKTitleDetailValueCell *)self contentView];
  [v3 bounds];
  -[PKTitleDetailValueCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKTitleDetailValueCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double verticalMargin = self->_verticalMargin;
  double horizontalMargin = self->_horizontalMargin;
  double v8 = a3.origin.x + horizontalMargin;
  double v9 = a3.origin.y + verticalMargin;
  double v10 = a3.size.width - (horizontalMargin + horizontalMargin);
  double v37 = verticalMargin + verticalMargin;
  CGFloat width = a3.size.width;
  double v11 = a3.size.height - (verticalMargin + verticalMargin);
  if ([(PKTitleDetailValueCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  remainder.origin.x = v8;
  remainder.origin.y = v9;
  remainder.size.CGFloat width = v10;
  remainder.size.height = v11;
  checkmarkView = self->_checkmarkView;
  if (checkmarkView)
  {
    [(UIImageView *)checkmarkView frame];
    -[UIImageView sizeThatFits:](self->_checkmarkView, "sizeThatFits:", v10, v11);
    double v15 = v14;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB30];
  }
  memset(&slice, 0, sizeof(slice));
  if (v15 <= 0.0) {
    double v16 = 0.0;
  }
  else {
    double v16 = 11.0;
  }
  [(PKTitleDetailValueTextView *)self->_textView frame];
  -[PKTitleDetailValueTextView sizeThatFits:](self->_textView, "sizeThatFits:", v10 - v15 - v16, 1.79769313e308);
  CGFloat v18 = v17;
  v42.origin.x = v8;
  v42.origin.y = v9;
  v42.size.CGFloat width = v10;
  v42.size.height = v11;
  CGRectDivide(v42, &slice, &remainder, v18, v12);
  PKSizeAlignedInRect();
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  CGRectDivide(remainder, &slice, &remainder, v16, v12);
  CGRectDivide(remainder, &slice, &remainder, v15, v12);
  PKSizeAlignedInRect();
  double v31 = v30;
  if (!a4)
  {
    double v32 = v27;
    double v33 = v28;
    double v34 = v29;
    -[PKTitleDetailValueTextView setFrame:](self->_textView, "setFrame:", v20, v22, v24, v26);
    -[UIImageView setFrame:](self->_checkmarkView, "setFrame:", v32, v33, v34, v31);
  }
  double v35 = v37 + fmax(v31, v26) + 0.0;
  double v36 = width;
  result.height = v35;
  result.CGFloat width = v36;
  return result;
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  titleText = self->_titleText;
  double v9 = (NSString *)v5;
  v7 = titleText;
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
    [(PKTitleDetailValueCell *)self _configureView];
  }
LABEL_9:
}

- (void)setTitleFont:(id)a3
{
  p_titleFont = &self->_titleFont;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    defaultTitleFont = *p_titleFont;
    if (!*p_titleFont) {
      defaultTitleFont = self->_defaultTitleFont;
    }
    objc_storeStrong((id *)&self->_titleFont, defaultTitleFont);
    [(PKTitleDetailValueCell *)self _configureView];
  }
}

- (void)setTitleColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    [(PKTitleDetailValueCell *)self _configureView];
  }
}

- (void)setDetailText:(id)a3
{
  id v5 = a3;
  detailText = self->_detailText;
  double v9 = (NSString *)v5;
  id v7 = detailText;
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
    [(PKTitleDetailValueCell *)self _configureView];
  }
LABEL_9:
}

- (void)setDetailIcon:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailIcon, a3);
    [(PKTitleDetailValueCell *)self _configureView];
  }
}

- (void)setDetailFont:(id)a3
{
  p_detailFont = &self->_detailFont;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailFont, a3);
    defaultDetailFont = *p_detailFont;
    if (!*p_detailFont) {
      defaultDetailFont = self->_defaultDetailFont;
    }
    objc_storeStrong((id *)&self->_detailFont, defaultDetailFont);
    [(PKTitleDetailValueCell *)self _configureView];
  }
}

- (void)setDetailColor:(id)a3
{
  p_detailColor = &self->_detailColor;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailColor, a3);
    defaultDetailColor = *p_detailColor;
    if (!*p_detailColor) {
      defaultDetailColor = self->_defaultDetailColor;
    }
    objc_storeStrong((id *)&self->_detailColor, defaultDetailColor);
    [(PKTitleDetailValueCell *)self _configureView];
  }
}

- (void)setValueText:(id)a3
{
  id v5 = a3;
  valueText = self->_valueText;
  double v9 = (NSString *)v5;
  id v7 = valueText;
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
    objc_storeStrong((id *)&self->_valueText, a3);
    [(PKTitleDetailValueCell *)self _configureView];
  }
LABEL_9:
}

- (void)setValueFont:(id)a3
{
  p_valueFont = &self->_valueFont;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFont, a3);
    defaultValueFont = *p_valueFont;
    if (!*p_valueFont) {
      defaultValueFont = self->_defaultValueFont;
    }
    objc_storeStrong((id *)&self->_valueFont, defaultValueFont);
    [(PKTitleDetailValueCell *)self _configureView];
  }
}

- (void)setValueColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueColor, a3);
    [(PKTitleDetailValueCell *)self _configureView];
  }
}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessory = a3;
    [(PKTitleDetailValueCell *)self _configureView];
  }
}

- (void)setHorizontalMargin:(double)a3
{
  if (self->_horizontalMargin != a3)
  {
    if (a3 == 0.0) {
      a3 = 16.0;
    }
    self->_double horizontalMargin = a3;
    [(PKTitleDetailValueCell *)self setNeedsLayout];
  }
}

- (void)setVerticalMargin:(double)a3
{
  if (self->_verticalMargin != a3)
  {
    if (a3 == 0.0) {
      a3 = 16.0;
    }
    self->_double verticalMargin = a3;
    [(PKTitleDetailValueCell *)self setNeedsLayout];
  }
}

- (void)setLabelPadding:(double)a3
{
  if (self->_labelPadding != a3)
  {
    if (a3 == 0.0) {
      a3 = 0.0;
    }
    self->_labelPadding = a3;
    [(PKTitleDetailValueCell *)self _configureView];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(PKTitleDetailValueCell *)self isHighlighted] & 1) == 0 && !self->_backgroundColor)
  {
    id v5 = [(PKTitleDetailValueCell *)self backgroundConfiguration];
    uint64_t v6 = [v5 backgroundColor];
    id v7 = v6;
    if (v6)
    {
      BOOL v8 = v6;
    }
    else
    {
      BOOL v8 = [(PKTitleDetailValueCell *)self backgroundColor];
    }
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v8;
  }
  v15.receiver = self;
  v15.super_class = (Class)PKTitleDetailValueCell;
  [(PKTitleDetailValueCell *)&v15 setHighlighted:v3];
  if (v3)
  {
    double v10 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    double v10 = self->_backgroundColor;
  }
  double v11 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__PKTitleDetailValueCell_setHighlighted___block_invoke;
  v13[3] = &unk_1E59CA870;
  v13[4] = self;
  double v14 = v10;
  CGRectEdge v12 = v10;
  [v11 _animateUsingDefaultTimingWithOptions:0 animations:v13 completion:0];
}

uint64_t __41__PKTitleDetailValueCell_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

- (void)_configureView
{
  id v21 = [(PKTitleDetailValueCell *)self contentView];
  textView = self->_textView;
  if (!textView)
  {
    double v4 = objc_alloc_init(PKTitleDetailValueTextView);
    id v5 = self->_textView;
    self->_textView = v4;

    [v21 addSubview:self->_textView];
    textView = self->_textView;
  }
  uint64_t v6 = [(NSString *)self->_titleText pk_attributedString];
  [(PKTitleDetailValueTextView *)textView setPrimaryText:v6];

  [(PKTitleDetailValueTextView *)self->_textView setPrimaryFont:self->_titleFont];
  [(PKTitleDetailValueTextView *)self->_textView setPrimaryTextColor:self->_titleColor];
  id v7 = self->_textView;
  BOOL v8 = [(NSString *)self->_detailText pk_attributedString];
  [(PKTitleDetailValueTextView *)v7 setSecondaryText:v8];

  [(PKTitleDetailValueTextView *)self->_textView setSecondaryFont:self->_detailFont];
  [(PKTitleDetailValueTextView *)self->_textView setSecondaryIcon:self->_detailIcon];
  [(PKTitleDetailValueTextView *)self->_textView setSecondaryTextColor:self->_detailColor];
  double v9 = self->_textView;
  if (self->_valueText)
  {
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_valueText];
    [(PKTitleDetailValueTextView *)v9 setAmountText:v10];
  }
  else
  {
    [(PKTitleDetailValueTextView *)self->_textView setAmountText:0];
  }
  [(PKTitleDetailValueTextView *)self->_textView setAmountFont:self->_valueFont];
  [(PKTitleDetailValueTextView *)self->_textView setAmountTextColor:self->_valueColor];
  [(PKTitleDetailValueTextView *)self->_textView setLabelPadding:self->_labelPadding];
  [(PKTitleDetailValueTextView *)self->_textView setAccessory:self->_accessory == 1];
  unint64_t accessory = self->_accessory;
  BOOL v12 = accessory >= 2;
  unint64_t v13 = accessory - 2;
  if (v12)
  {
    if (v13 <= 1)
    {
      [(UIImageView *)self->_checkmarkView removeFromSuperview];
      id v14 = objc_alloc(MEMORY[0x1E4FB1838]);
      objc_super v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
      double v16 = (UIImageView *)[v14 initWithImage:v15];
      checkmarkView = self->_checkmarkView;
      self->_checkmarkView = v16;

      CGFloat v18 = self->_checkmarkView;
      double v19 = [MEMORY[0x1E4FB1618] linkColor];
      [(UIImageView *)v18 setTintColor:v19];

      [(UIImageView *)self->_checkmarkView setHidden:self->_accessory == 3];
      [v21 addSubview:self->_checkmarkView];
    }
  }
  else
  {
    [(UIImageView *)self->_checkmarkView removeFromSuperview];
    double v20 = self->_checkmarkView;
    self->_checkmarkView = 0;
  }
  [(PKTitleDetailValueCell *)self setNeedsLayout];
}

- (void)_resetValues
{
  self->_double verticalMargin = 16.0;
  self->_double horizontalMargin = 16.0;
  self->_labelPadding = 0.0;
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)PKTitleDetailValueCell;
  [(PKTitleDetailValueCell *)&v9 prepareForReuse];
  titleText = self->_titleText;
  self->_titleText = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  valueText = self->_valueText;
  self->_valueText = 0;

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = 0;

  self->_unint64_t accessory = 0;
  [(PKTitleDetailValueCell *)self _resetValues];
  [(PKTitleDetailValueTextView *)self->_textView removeFromSuperview];
  textView = self->_textView;
  self->_textView = 0;

  [(UIImageView *)self->_checkmarkView removeFromSuperview];
  checkmarkView = self->_checkmarkView;
  self->_checkmarkView = 0;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIImage)detailIcon
{
  return self->_detailIcon;
}

- (UIFont)detailFont
{
  return self->_detailFont;
}

- (UIColor)detailColor
{
  return self->_detailColor;
}

- (NSString)valueText
{
  return self->_valueText;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (UIColor)valueColor
{
  return self->_valueColor;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (double)verticalMargin
{
  return self->_verticalMargin;
}

- (double)labelPadding
{
  return self->_labelPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueColor, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_detailColor, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_detailIcon, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_defaultDetailColor, 0);
  objc_storeStrong((id *)&self->_defaultValueFont, 0);
  objc_storeStrong((id *)&self->_defaultDetailFont, 0);
  objc_storeStrong((id *)&self->_defaultTitleFont, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end