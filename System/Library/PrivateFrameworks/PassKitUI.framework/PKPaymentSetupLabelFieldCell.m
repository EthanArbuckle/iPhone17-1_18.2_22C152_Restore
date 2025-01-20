@interface PKPaymentSetupLabelFieldCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentSetupLabelFieldCell)init;
- (double)minimumTextFieldOffset;
- (id)editableTextField;
- (void)_buttonTapped;
- (void)_updateDisplay:(BOOL)a3;
- (void)_updateDisplayForFieldTypeLabel:(id)a3;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
@end

@implementation PKPaymentSetupLabelFieldCell

- (PKPaymentSetupLabelFieldCell)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupLabelFieldCell;
  return [(PKPaymentSetupFieldCell *)&v3 init];
}

- (id)editableTextField
{
  return 0;
}

- (double)minimumTextFieldOffset
{
  return 0.0;
}

- (void)_updateDisplay:(BOOL)a3
{
  if (a3) {
    [(PKPaymentSetupFieldCell *)self _applyDefaultValues];
  }
  id v5 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
  v4 = [v5 labelFieldObject];
  [(PKPaymentSetupLabelFieldCell *)self _updateDisplayForFieldTypeLabel:v4];
}

- (void)_updateDisplayForFieldTypeLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentSetupLabelFieldCell *)self textLabel];
  v6 = [v4 title];
  [v5 setText:v6];

  v7 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], (NSString *)*MEMORY[0x1E4FB2778]);
  [v5 setFont:v7];

  v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v5 setTextColor:v8];

  [v5 setNumberOfLines:0];
  uint64_t v9 = [v4 alingment];
  if (v9 == 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    if (v9 != 2) {
      goto LABEL_6;
    }
    uint64_t v10 = 1;
  }
  [v5 setTextAlignment:v10];
LABEL_6:
  v11 = [v4 buttonTitle];
  uint64_t v12 = [v11 length];
  button = self->_button;
  if (v12)
  {
    if (!button)
    {
      v14 = (void *)MEMORY[0x1E4FB14D8];
      v15 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
      v16 = objc_msgSend(v14, "pkui_plainConfigurationWithTitle:font:", v11, v15);

      objc_initWeak(&location, self);
      v17 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __64__PKPaymentSetupLabelFieldCell__updateDisplayForFieldTypeLabel___block_invoke;
      v26 = &unk_1E59CBEE0;
      objc_copyWeak(&v27, &location);
      v18 = [v17 actionWithHandler:&v23];
      objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v16, v18, v23, v24, v25, v26);
      v19 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v20 = self->_button;
      self->_button = v19;

      [(UIButton *)self->_button setConfigurationUpdateHandler:&__block_literal_global_128];
      v21 = [(PKPaymentSetupLabelFieldCell *)self contentView];
      [v21 addSubview:self->_button];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(UIButton *)button removeFromSuperview];
    v22 = self->_button;
    self->_button = 0;
  }
}

void __64__PKPaymentSetupLabelFieldCell__updateDisplayForFieldTypeLabel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _buttonTapped];
}

void __64__PKPaymentSetupLabelFieldCell__updateDisplayForFieldTypeLabel___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  id v3 = [v2 titleLabel];

  [v3 setTextAlignment:1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  PKFloatCeilToPixel();
  double v7 = v6;
  double v8 = width + PKTableViewCellTextInset() * -2.0;
  [(PKPaymentSetupLabelFieldCell *)self layoutMargins];
  [(PKPaymentSetupLabelFieldCell *)self layoutMargins];
  [(PKPaymentSetupLabelFieldCell *)self layoutMargins];
  double v10 = v9;
  [(PKPaymentSetupLabelFieldCell *)self layoutMargins];
  double v12 = height - (v10 + v11);
  v13 = [(PKPaymentSetupLabelFieldCell *)self textLabel];
  objc_msgSend(v13, "pkui_sizeThatFits:forceWordWrap:", 1, v8, v12);

  PKFloatCeilToPixel();
  double v15 = v14 + 10.0 + 25.0;
  button = self->_button;
  if (button)
  {
    -[UIButton sizeThatFits:](button, "sizeThatFits:", v8, 1.79769313e308);
    PKFloatCeilToPixel();
    double v15 = v15 + 25.0 + v17;
  }
  [(id)objc_opt_class() minimumCellHeight];
  if (v15 <= v18)
  {
    [(id)objc_opt_class() minimumCellHeight];
    double v15 = v19;
  }
  double v20 = v7;
  double v21 = v15;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupLabelFieldCell;
  [(PKPaymentSetupFieldCell *)&v14 layoutSubviews];
  id v3 = [(PKPaymentSetupLabelFieldCell *)self contentView];
  [v3 bounds];
  double v5 = v4 + PKTableViewCellTextInset() * -2.0;

  double v6 = [(PKPaymentSetupLabelFieldCell *)self textLabel];
  [v6 frame];
  double v7 = PKTableViewCellTextInset();
  [(PKPaymentSetupLabelFieldCell *)self bounds];
  objc_msgSend(v6, "pkui_sizeThatFits:forceWordWrap:", 1, v5, CGRectGetHeight(v15) + -10.0 + -25.0);
  PKFloatCeilToPixel();
  CGFloat v9 = v8;
  objc_msgSend(v6, "setFrame:", v7, 10.0, v5, v8);
  button = self->_button;
  if (button)
  {
    [(UIButton *)button frame];
    double v11 = PKTableViewCellTextInset();
    v16.origin.y = 10.0;
    v16.origin.x = v7;
    v16.size.double width = v5;
    v16.size.double height = v9;
    CGFloat v12 = CGRectGetMaxY(v16) + 25.0 + 25.0;
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v5, 1.79769313e308);
    PKFloatCeilToPixel();
    -[UIButton setFrame:](self->_button, "setFrame:", v11, v12, v5, v13);
  }
}

- (void)_buttonTapped
{
  id v3 = [(PKPaymentSetupFieldCell *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 fieldCellDidTapButton:self];
  }
}

- (void).cxx_destruct
{
}

- (void)pk_applyAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupLabelFieldCell;
  id v4 = a3;
  [(PKPaymentSetupFieldCell *)&v6 pk_applyAppearance:v4];
  double v5 = objc_msgSend(v4, "backgroundColor", v6.receiver, v6.super_class);

  [(PKPaymentSetupLabelFieldCell *)self setBackgroundColor:v5];
}

@end