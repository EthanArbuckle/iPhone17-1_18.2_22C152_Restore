@interface PKCurrencyAmountSelectorCustomEntryItem
+ (id)cellReuseIdentifier;
- (BOOL)inputIsValid;
- (BOOL)shouldHighlight;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (PKCurrencyAmountSelectorCustomEntryItem)initWithCurrencyCode:(id)a3;
- (id)decimalNumberValue;
- (id)editingChangedHandler;
- (id)inputValueChangedHandler;
- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (int64_t)editingStyle;
- (unint64_t)maximumInput;
- (void)_textFieldValueChanged:(id)a3;
- (void)clear;
- (void)endEditing;
- (void)setEditingChangedHandler:(id)a3;
- (void)setInputValueChangedHandler:(id)a3;
- (void)setMaximumInput:(unint64_t)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
@end

@implementation PKCurrencyAmountSelectorCustomEntryItem

- (PKCurrencyAmountSelectorCustomEntryItem)initWithCurrencyCode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCurrencyAmountSelectorCustomEntryItem;
  v5 = [(PKCurrencyAmountSelectorCustomEntryItem *)&v9 init];
  if (v5)
  {
    v6 = [[PKTextfieldTableViewSettingsRowCurrencyFormatter alloc] initWithCurrencyCode:v4];
    formatter = v5->_formatter;
    v5->_formatter = v6;
  }
  return v5;
}

- (void)endEditing
{
  id v2 = [(PKTextFieldTableViewCell *)self->_cell textField];
  [v2 endEditing:1];
}

- (void)clear
{
  id v2 = [(PKTextFieldTableViewCell *)self->_cell textField];
  [v2 setText:0];
}

- (id)decimalNumberValue
{
  v3 = [(PKTextFieldTableViewCell *)self->_cell textField];
  id v4 = [v3 text];

  if (v4 && [v4 length])
  {
    v5 = [(PKTextfieldTableViewSettingsRowCurrencyFormatter *)self->_formatter submissionValueFromFormattedInput:v4];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithString:v5];
    v7 = [MEMORY[0x1E4F28C28] notANumber];
    char v8 = [v6 isEqualToNumber:v7];

    if (v8) {
      id v9 = 0;
    }
    else {
      id v9 = v6;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)cellReuseIdentifier
{
  return @"CustomOptionEntryCellReuseIdentifier";
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  cell = self->_cell;
  if (!cell)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = [(id)objc_opt_class() cellReuseIdentifier];
    v10 = [v8 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];

    v11 = self->_cell;
    self->_cell = v10;

    v12 = [(PKTextFieldTableViewCell *)self->_cell textField];
    v13 = PKLocalizedMadisonString(&cfstr_CustomAmount.isa);
    [v12 setPlaceholder:v13];

    [v12 setKeyboardType:8];
    [v12 setDelegate:self];
    [v12 addTarget:self action:sel__textFieldValueChanged_ forControlEvents:0x20000];
    [(PKTextFieldTableViewCell *)self->_cell setAccessibilityIdentifier:*MEMORY[0x1E4F85400]];

    cell = self->_cell;
  }

  return cell;
}

- (BOOL)shouldHighlight
{
  return 0;
}

- (int64_t)editingStyle
{
  return 0;
}

- (void)_textFieldValueChanged:(id)a3
{
  id v4 = a3;
  formatter = self->_formatter;
  if (formatter)
  {
    id v13 = v4;
    v6 = [v4 text];
    id v7 = [(PKTextfieldTableViewSettingsRowCurrencyFormatter *)formatter formattedValueFromInput:v6];

    [v13 setText:v7];
    id v8 = [(PKTextfieldTableViewSettingsRowCurrencyFormatter *)self->_formatter numberFromInput:v7];
    unint64_t v9 = [v8 integerValue];
    unint64_t maximumInput = self->_maximumInput;
    v11 = (void *)MEMORY[0x1E4FB1618];
    self->_inputIsValid = v9 <= maximumInput;
    if (v9 > maximumInput) {
      [v11 redColor];
    }
    else {
    v12 = [v11 labelColor];
    }
    [v13 setTextColor:v12];

    (*((void (**)(void))self->_inputValueChangedHandler + 2))();
    id v4 = v13;
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  v10 = [a3 text];
  v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  v12 = [(PKTextfieldTableViewSettingsRowCurrencyFormatter *)self->_formatter numberFromInput:v11];
  unint64_t v13 = [v12 integerValue];
  BOOL v15 = self->_inputIsValid || v13 <= self->_maximumInput;

  return v15;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  editingChangedHandler = (void (**)(id, uint64_t))self->_editingChangedHandler;
  if (editingChangedHandler) {
    editingChangedHandler[2](editingChangedHandler, 1);
  }
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  editingChangedHandler = (void (**)(id, void))self->_editingChangedHandler;
  if (editingChangedHandler) {
    editingChangedHandler[2](editingChangedHandler, 0);
  }
}

- (id)editingChangedHandler
{
  return self->_editingChangedHandler;
}

- (void)setEditingChangedHandler:(id)a3
{
}

- (id)inputValueChangedHandler
{
  return self->_inputValueChangedHandler;
}

- (void)setInputValueChangedHandler:(id)a3
{
}

- (unint64_t)maximumInput
{
  return self->_maximumInput;
}

- (void)setMaximumInput:(unint64_t)a3
{
  self->_unint64_t maximumInput = a3;
}

- (BOOL)inputIsValid
{
  return self->_inputIsValid;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inputValueChangedHandler, 0);
  objc_storeStrong(&self->_editingChangedHandler, 0);
  objc_storeStrong((id *)&self->_formatter, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end