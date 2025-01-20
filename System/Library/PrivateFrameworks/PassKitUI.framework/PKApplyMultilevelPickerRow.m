@interface PKApplyMultilevelPickerRow
- (Class)cellClass;
- (NSCopying)identifier;
- (PKApplyMultilevelPickerRow)initWithPicker:(id)a3;
- (PKPaymentSetupFieldPicker)picker;
- (void)configureCell:(id)a3;
@end

@implementation PKApplyMultilevelPickerRow

- (PKApplyMultilevelPickerRow)initWithPicker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyMultilevelPickerRow;
  v6 = [(PKApplyMultilevelPickerRow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_picker, a3);
  }

  return v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)[(PKPaymentSetupFieldPicker *)self->_picker identifier];
}

- (void)configureCell:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKApplyMultilevelPickerRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
    v6 = [v5 textProperties];
    [v6 setNumberOfLines:0];
    v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
    [v6 setFont:v7];

    v8 = [(PKPaymentSetupFieldPicker *)self->_picker localizedDisplayName];
    objc_super v9 = [(PKPaymentSetupFieldPicker *)self->_picker localizedPlaceholder];
    v10 = [(PKPaymentSetupFieldPicker *)self->_picker currentValue];

    if (v10)
    {
      v11 = [(PKPaymentSetupFieldPicker *)self->_picker currentValue];
      uint64_t v12 = [v11 localizedDisplayName];

      objc_super v9 = 0;
      v8 = (void *)v12;
    }
    [v5 setText:v8];
    [v5 setSecondaryText:v9];
    v13 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    v14 = PKProvisioningSecondaryBackgroundColor();
    [v13 setBackgroundColor:v14];

    [v4 setBackgroundConfiguration:v13];
    [v4 setContentConfiguration:v5];
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1518]);
    v18[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v4 setAccessories:v16];

    v17 = [(PKApplyMultilevelPickerRow *)self identifier];
    [v4 setAccessibilityIdentifier:v17];
  }
}

- (PKPaymentSetupFieldPicker)picker
{
  return self->_picker;
}

- (void).cxx_destruct
{
}

@end