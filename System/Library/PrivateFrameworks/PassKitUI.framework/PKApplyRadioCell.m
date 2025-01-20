@interface PKApplyRadioCell
- (BOOL)radioButtonSelected;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PKApplyRadioCell)initWithFrame:(CGRect)a3;
- (id)action;
- (void)layoutSubviews;
- (void)setAction:(id)a3;
- (void)setRadioButtonSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKApplyRadioCell

- (PKApplyRadioCell)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)PKApplyRadioCell;
  v3 = -[PKApplyRadioCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKApplyRadioCell *)v3 contentView];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    [(UILabel *)v4->_titleLabel setNumberOfLines:1];
    [(UILabel *)v4->_titleLabel setAdjustsFontSizeToFitWidth:1];
    v8 = v4->_titleLabel;
    v9 = (NSString *)*MEMORY[0x1E4FB28C8];
    v10 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
    [(UILabel *)v8 setFont:v10];

    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v5 addSubview:v4->_titleLabel];
    objc_initWeak(&location, v4);
    v11 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __34__PKApplyRadioCell_initWithFrame___block_invoke;
    v26 = &unk_1E59CBEE0;
    objc_copyWeak(&v27, &location);
    v12 = [v11 actionWithHandler:&v23];
    v13 = objc_msgSend(MEMORY[0x1E4FB14D8], "plainButtonConfiguration", v23, v24, v25, v26);
    v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
    [v13 setImage:v14];

    v15 = [MEMORY[0x1E4FB1498] clearConfiguration];
    [v13 setBackground:v15];
    objc_msgSend(v13, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
    v16 = (void *)MEMORY[0x1E4FB1830];
    v17 = PKFontForDefaultDesign(v9, 0, *MEMORY[0x1E4FB09D8]);
    v18 = [v16 configurationWithFont:v17];

    [v13 setPreferredSymbolConfigurationForImage:v18];
    uint64_t v19 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v13 primaryAction:v12];
    button = v4->_button;
    v4->_button = (UIButton *)v19;

    [(UIButton *)v4->_button setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
    [v5 addSubview:v4->_button];
    v21 = PKProvisioningSecondaryBackgroundColor();
    [v5 setBackgroundColor:v21];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __34__PKApplyRadioCell_initWithFrame___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[84] + 16))();
    WeakRetained = v2;
  }
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  title = self->_title;
  v9 = (NSString *)v5;
  v7 = title;
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
    objc_storeStrong((id *)&self->_title, a3);
    [(UILabel *)self->_titleLabel setText:self->_title];
    [(PKApplyRadioCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setRadioButtonSelected:(BOOL)a3
{
  if (((!self->_radioButtonSelected ^ a3) & 1) == 0)
  {
    self->_radioButtonSelected = a3;
    if (a3) {
      v4 = @"checkmark.circle.fill";
    }
    else {
      v4 = @"circle";
    }
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:v4];
    [(UIButton *)self->_button pkui_updateConfigurationWithImage:v5];
    [(PKApplyRadioCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKApplyRadioCell;
  [(PKApplyRadioCell *)&v3 layoutSubviews];
  [(PKApplyRadioCell *)self bounds];
  [(PKApplyRadioCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKApplyRadioCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = PKTableViewCellTextInset();
  double v9 = x + v8;
  CGFloat v21 = width;
  CGFloat v22 = height;
  double v10 = width - (v8 + v8);
  double v11 = height + -24.0;
  if ([(PKApplyRadioCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  memset(&slice, 0, sizeof(slice));
  remainder.origin.double x = v9;
  remainder.origin.double y = y + 12.0;
  remainder.size.double width = v10;
  remainder.size.double height = v11;
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v10, v11);
  if (v13 <= v10) {
    CGFloat v14 = v13;
  }
  else {
    CGFloat v14 = v10;
  }
  v26.origin.double x = v9;
  v26.origin.double y = y + 12.0;
  v26.size.double width = v10;
  v26.size.double height = v11;
  CGRectDivide(v26, &slice, &remainder, v14, v12);
  if (!self->_isTemplateLayout)
  {
    button = self->_button;
    PKSizeAlignedInRect();
    -[UIButton setFrame:](button, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 4.0, v12);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v17 = v16;
  CGRectDivide(remainder, &slice, &remainder, v16, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    titleLabel = self->_titleLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](titleLabel, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 12.0, CGRectMinYEdge);
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = v21;
  v27.size.double height = v22;
  double v19 = CGRectGetWidth(v27);
  double v20 = v17 + 12.0 + 12.0;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)radioButtonSelected
{
  return self->_radioButtonSelected;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end