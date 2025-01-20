@interface PKPaymentSetupMenuPickerFieldCell
- (BOOL)becomeFirstResponder;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentSetupMenuPickerFieldCell)init;
- (id)editableTextField;
- (void)_pullCurrentValueFromField;
- (void)_updateDisplay:(BOOL)a3;
- (void)_updateDisplayForFieldTypePicker:(id)a3;
- (void)_updatePaymentSetupFieldPickerItem:(id)a3;
- (void)layoutSubviews;
@end

@implementation PKPaymentSetupMenuPickerFieldCell

- (BOOL)becomeFirstResponder
{
  if (self->_button)
  {
    [(UIButton *)self->_button performPrimaryAction];
    return 0;
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)PKPaymentSetupMenuPickerFieldCell;
    return [(PKPaymentSetupFieldCell *)&v3 becomeFirstResponder];
  }
}

- (PKPaymentSetupMenuPickerFieldCell)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupMenuPickerFieldCell;
  v2 = [(PKPaymentSetupFieldCell *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
    referenceConfiguration = v2->_referenceConfiguration;
    v2->_referenceConfiguration = (UIListContentConfiguration *)v3;
  }
  return v2;
}

- (id)editableTextField
{
  return 0;
}

- (void)_updateDisplay:(BOOL)a3
{
  if (a3) {
    [(PKPaymentSetupFieldCell *)self _applyDefaultValues];
  }
  id v5 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
  v4 = [v5 pickerFieldObject];
  [(PKPaymentSetupMenuPickerFieldCell *)self _updateDisplayForFieldTypePicker:v4];
}

- (void)_updatePaymentSetupFieldPickerItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
  id v6 = [v5 pickerFieldObject];

  [v6 setCurrentValue:v4];
  [(PKPaymentSetupMenuPickerFieldCell *)self _pullCurrentValueFromField];
}

- (void)_pullCurrentValueFromField
{
  uint64_t v3 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
  id v18 = [v3 currentValue];

  id v4 = [(UIButton *)self->_button configuration];
  if (v18)
  {
    id v5 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
    id v6 = [v5 displayString];
    [v4 setTitle:v6];

    v7 = [MEMORY[0x1E4FB1618] labelColor];
    [v4 setBaseForegroundColor:v7];

    v8 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
    v9 = [v8 pickerFieldObject];
    v10 = [v9 pickerItems];
    uint64_t v11 = [v10 indexOfObject:v18];

    v12 = [(UIMenu *)self->_menu children];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v12 count])
    {
      unint64_t v14 = 0;
      do
      {
        v15 = [v12 objectAtIndexedSubscript:v14];
        [v15 setState:v11 == v14];
        [v13 addObject:v15];

        ++v14;
      }
      while (v14 < [v12 count]);
    }
    v16 = [(UIMenu *)self->_menu menuByReplacingChildren:v13];
    menu = self->_menu;
    self->_menu = v16;

    [(UIButton *)self->_button setMenu:self->_menu];
  }
  else
  {
    v12 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [v4 setBaseForegroundColor:v12];
  }

  [(UIButton *)self->_button setConfiguration:v4];
}

- (void)_updateDisplayForFieldTypePicker:(id)a3
{
  id v4 = a3;
  if (PKUIGetMinScreenWidthType()) {
    [v4 localizedDisplayName];
  }
  else {
  id v5 = [v4 compactLocalizedDisplayName];
  }
  id v6 = [(PKPaymentSetupMenuPickerFieldCell *)self textLabel];
  [v6 setText:v5];

  objc_initWeak(&location, self);
  v7 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
  v8 = [v7 pickerFieldObject];
  v9 = [v8 pickerItems];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __70__PKPaymentSetupMenuPickerFieldCell__updateDisplayForFieldTypePicker___block_invoke;
  v26 = &unk_1E59D7630;
  objc_copyWeak(&v27, &location);
  v10 = objc_msgSend(v9, "pk_arrayByApplyingBlock:", &v23);

  objc_msgSend(MEMORY[0x1E4FB1970], "menuWithChildren:", v10, v23, v24, v25, v26);
  uint64_t v11 = (UIMenu *)objc_claimAutoreleasedReturnValue();
  menu = self->_menu;
  self->_menu = v11;

  button = self->_button;
  if (!button)
  {
    unint64_t v14 = (void *)MEMORY[0x1E4FB14D8];
    v15 = [v4 localizedDisplayName];
    v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    v17 = objc_msgSend(v14, "pkui_plainConfigurationWithTitle:font:", v15, v16);

    id v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v17 setBaseForegroundColor:v18];

    objc_msgSend(v17, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    v19 = [v4 localizedPlaceholder];
    [v17 setTitle:v19];

    [v17 setIndicator:2];
    v20 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v17 primaryAction:0];
    v21 = self->_button;
    self->_button = v20;

    [(UIButton *)self->_button setShowsMenuAsPrimaryAction:1];
    v22 = [(PKPaymentSetupMenuPickerFieldCell *)self contentView];
    [v22 addSubview:self->_button];

    button = self->_button;
  }
  [(UIButton *)button setMenu:self->_menu];
  [(PKPaymentSetupMenuPickerFieldCell *)self _pullCurrentValueFromField];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

id __70__PKPaymentSetupMenuPickerFieldCell__updateDisplayForFieldTypePicker___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = [v3 localizedDisplayName];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PKPaymentSetupMenuPickerFieldCell__updateDisplayForFieldTypePicker___block_invoke_2;
  v9[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  id v6 = v3;
  id v10 = v6;
  v7 = [v4 actionWithTitle:v5 image:0 identifier:0 handler:v9];

  objc_destroyWeak(&v11);

  return v7;
}

void __70__PKPaymentSetupMenuPickerFieldCell__updateDisplayForFieldTypePicker___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updatePaymentSetupFieldPickerItem:*(void *)(a1 + 32)];
  [WeakRetained setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  PKFloatCeilToPixel();
  double v7 = v6;
  double v8 = width + PKTableViewCellTextInset() * -2.0;
  [(PKPaymentSetupMenuPickerFieldCell *)self layoutMargins];
  [(PKPaymentSetupMenuPickerFieldCell *)self layoutMargins];
  [(PKPaymentSetupMenuPickerFieldCell *)self layoutMargins];
  double v10 = v9;
  [(PKPaymentSetupMenuPickerFieldCell *)self layoutMargins];
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v8, height - (v10 + v11));
  PKFloatCeilToPixel();
  double v13 = v12 + 0.0;
  [(id)objc_opt_class() minimumCellHeight];
  if (v13 <= v14)
  {
    [(id)objc_opt_class() minimumCellHeight];
    double v13 = v15;
  }
  double v16 = v7;
  double v17 = v13;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)PKPaymentSetupMenuPickerFieldCell;
  [(PKPaymentSetupFieldCell *)&v44 layoutSubviews];
  id v3 = [(PKPaymentSetupMenuPickerFieldCell *)self textLabel];
  id v4 = [(PKPaymentSetupMenuPickerFieldCell *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v43 = v7;
  double v9 = v8;
  double v11 = v10;
  [v3 frame];
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v9, v11);
  [v4 bounds];
  int v12 = [(PKPaymentSetupMenuPickerFieldCell *)self _shouldReverseLayoutDirection];
  [(UIListContentConfiguration *)self->_referenceConfiguration directionalLayoutMargins];
  if (v12) {
    double v17 = v16;
  }
  else {
    double v17 = v14;
  }
  if (!v12) {
    double v14 = v16;
  }
  double v18 = v9 - (v17 + v14);
  objc_msgSend(v3, "sizeThatFits:", v18, v11 - (v13 + v15), *(void *)&v13);
  double v20 = v19;
  v21 = [(PKPaymentSetupMenuPickerFieldCell *)self traitCollection];
  v22 = [v21 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v22);

  double v24 = 0.0;
  if (!IsAccessibilityCategory) {
    [(PKPaymentSetupFieldCell *)self minimumTextLabelWidth];
  }
  double v25 = v6 + v17;
  double v26 = fmin(fmax(v20, v24), v18 + -122.0);
  UIRectCenteredYInRect();
  double v41 = v28;
  double v42 = v27;
  double v30 = v29;
  UIRectCenteredYInRect();
  double v33 = v31;
  double v34 = v32;
  if (v12)
  {
    v45.size.double height = v39;
    v45.origin.y = v43 + v40;
    v45.origin.x = v25;
    v45.size.double width = v18;
    CGFloat MaxX = CGRectGetMaxX(v45);
    CGFloat v36 = MaxX - v26;
    objc_msgSend(v3, "setFrame:", MaxX - v26, v33, v26, v34);
    double v37 = v36 - v30;
    double v38 = -22.0;
  }
  else
  {
    objc_msgSend(v3, "setFrame:", v25, v31, v26, v32);
    v46.origin.x = v25;
    v46.origin.y = v33;
    v46.size.double width = v26;
    v46.size.double height = v34;
    double v37 = CGRectGetMaxX(v46);
    double v38 = 22.0;
  }
  -[UIButton setFrame:](self->_button, "setFrame:", v37 + v38, v42, v30, v41);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceConfiguration, 0);
  objc_storeStrong((id *)&self->_menu, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end