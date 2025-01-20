@interface PKApplyListPickerRow
- (BOOL)selected;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSString)submissionValue;
- (NSString)title;
- (PKApplyListPickerRow)initWithPickerItem:(id)a3;
- (PKPaymentSetupFieldPickerItem)pickerItem;
- (void)configureCell:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKApplyListPickerRow

- (PKApplyListPickerRow)initWithPickerItem:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKApplyListPickerRow;
  v6 = [(PKApplyListPickerRow *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pickerItem, a3);
    uint64_t v8 = [v5 localizedDisplayName];
    title = v7->_title;
    v7->_title = (NSString *)v8;

    uint64_t v10 = [v5 submissionValue];
    submissionValue = v7->_submissionValue;
    v7->_submissionValue = (NSString *)v10;
  }
  return v7;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_submissionValue;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKApplyListPickerRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x1E4FB1948] cellConfiguration];
    if (self->_selected)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
      v7 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [v6 setTintColor:v7];

      v13[0] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [v4 setAccessories:v8];
    }
    else
    {
      [v4 setAccessories:MEMORY[0x1E4F1CBF0]];
    }
    v9 = [v5 textProperties];
    [v9 setNumberOfLines:0];
    uint64_t v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
    [v9 setFont:v10];

    [v5 setText:self->_title];
    v11 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    v12 = PKProvisioningSecondaryBackgroundColor();
    [v11 setBackgroundColor:v12];

    [v4 setBackgroundConfiguration:v11];
    [v4 setContentConfiguration:v5];
    [v4 setAccessibilityIdentifier:self->_submissionValue];
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)submissionValue
{
  return self->_submissionValue;
}

- (PKPaymentSetupFieldPickerItem)pickerItem
{
  return self->_pickerItem;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerItem, 0);
  objc_storeStrong((id *)&self->_submissionValue, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end