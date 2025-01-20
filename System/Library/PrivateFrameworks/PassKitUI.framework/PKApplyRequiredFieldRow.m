@interface PKApplyRequiredFieldRow
- (Class)cellClass;
- (NSCopying)identifier;
- (PKApplyRequiredFieldRow)initWithField:(id)a3 cellDelegate:(id)a4;
- (void)configureCell:(id)a3;
@end

@implementation PKApplyRequiredFieldRow

- (PKApplyRequiredFieldRow)initWithField:(id)a3 cellDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplyRequiredFieldRow;
  v9 = [(PKApplyRequiredFieldRow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_field, a3);
    objc_storeWeak((id *)&v10->_cellDelegate, v8);
  }

  return v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)[(PKPaymentSetupField *)self->_field identifier];
}

- (void)configureCell:(id)a3
{
  id v13 = a3;
  [(PKApplyRequiredFieldRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    id v4 = v13;
    v5 = +[PKListTextFieldContentConfiguration valueCellConfiguration];
    v6 = [(PKPaymentSetupField *)self->_field currentValue];
    [v5 setText:v6];

    id v7 = [(PKPaymentSetupField *)self->_field localizedPlaceholder];
    [v5 setPlaceholderText:v7];

    [v5 setClearsOnBeginEditing:0];
    [v5 directionalLayoutMargins];
    [v5 setDirectionalLayoutMargins:10.0];
    [v5 setKeyboardType:1];
    [v5 setReturnKeyType:9];
    id v8 = [v5 secondaryTextProperties];
    v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27D0]);
    [v8 setFont:v9];

    [v4 setContentConfiguration:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cellDelegate);
    [v4 setDelegate:WeakRetained];

    v11 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    objc_super v12 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v11 setBackgroundColor:v12];

    [v4 setBackgroundConfiguration:v11];
    [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85910]];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cellDelegate);

  objc_storeStrong((id *)&self->_field, 0);
}

@end