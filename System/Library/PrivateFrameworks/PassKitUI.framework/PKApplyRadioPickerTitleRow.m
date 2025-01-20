@interface PKApplyRadioPickerTitleRow
- (Class)cellClass;
- (NSCopying)identifier;
- (PKApplyRadioPickerTitleRow)initWithTitle:(id)a3;
- (void)configureCell:(id)a3;
@end

@implementation PKApplyRadioPickerTitleRow

- (PKApplyRadioPickerTitleRow)initWithTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyRadioPickerTitleRow;
  v6 = [(PKApplyRadioPickerTitleRow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_title, a3);
  }

  return v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_title;
}

- (void)configureCell:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1948];
  id v5 = a3;
  id v11 = [v4 cellConfiguration];
  v6 = [v11 textProperties];
  [v6 setNumberOfLines:0];
  v7 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D0], 0);
  [v6 setFont:v7];

  double v8 = PKTableViewCellTextInset();
  objc_msgSend(v11, "setDirectionalLayoutMargins:", v8, v8, 0.0, v8);
  [v11 setText:self->_title];
  objc_super v9 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  v10 = PKProvisioningSecondaryBackgroundColor();
  [v9 setBackgroundColor:v10];

  [v5 setBackgroundConfiguration:v9];
  [v5 setContentConfiguration:v11];
}

- (void).cxx_destruct
{
}

@end