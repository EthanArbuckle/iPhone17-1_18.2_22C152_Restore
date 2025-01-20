@interface PKApplyRadioPickerRow
- (BOOL)selected;
- (Class)cellClass;
- (NSCopying)identifier;
- (PKApplyRadioPickerRow)initWithTitle:(id)a3 submissionValue:(id)a4;
- (id)action;
- (void)configureCell:(id)a3;
- (void)setAction:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKApplyRadioPickerRow

- (PKApplyRadioPickerRow)initWithTitle:(id)a3 submissionValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplyRadioPickerRow;
  v9 = [(PKApplyRadioPickerRow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_submissionValue, a4);
  }

  return v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_submissionValue;
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  [(PKApplyRadioPickerRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    BOOL selected = self->_selected;
    id v5 = v6;
    [v5 setRadioButtonSelected:selected];
    [v5 setTitle:self->_title];
    [v5 setAction:self->_action];
    [v5 setAccessibilityIdentifier:self->_submissionValue];
  }
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_BOOL selected = a3;
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
  objc_storeStrong((id *)&self->_submissionValue, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end