@interface PKTextFieldTableViewSettingsRow
+ (id)cellReuseIdentifier;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlight;
- (NSCopying)identifier;
- (NSString)placeholder;
- (NSString)title;
- (PKTextFieldTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5 formatter:(id)a6 changeHandler:(id)a7;
- (id)changeHandler;
- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)value;
- (int64_t)keyboardType;
- (unint64_t)hash;
- (void)_textFieldValueChanged:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
@end

@implementation PKTextFieldTableViewSettingsRow

- (PKTextFieldTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5 formatter:(id)a6 changeHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PKTextFieldTableViewSettingsRow;
  v17 = [(PKTextFieldTableViewSettingsRow *)&v30 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSCopying *)v18;

    uint64_t v20 = [v13 copy];
    title = v17->_title;
    v17->_title = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    id value = v17->_value;
    v17->_id value = (id)v22;

    objc_storeStrong((id *)&v17->_formatter, a6);
    uint64_t v24 = [v16 copy];
    id changeHandler = v17->_changeHandler;
    v17->_id changeHandler = (id)v24;

    formatter = v17->_formatter;
    if (formatter)
    {
      uint64_t v27 = [(PKTextFieldTableViewSettingsRowFormatter *)formatter formattedValueFromInput:v17->_value];
      id v28 = v17->_value;
      v17->_id value = (id)v27;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_value];
  [v3 safelyAddObject:self->_formatter];
  [v3 safelyAddObject:self->_placeholder];
  PKCombinedHash();
  PKIntegerHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKTextFieldTableViewSettingsRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        if (!PKEqualObjects()) {
          goto LABEL_22;
        }
        title = v6->_title;
        v8 = self->_title;
        v9 = title;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_21;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_22;
          }
        }
        if (!PKEqualObjects()
          || !PKEqualObjects()
          || self->_keyboardType != v6->_keyboardType)
        {
          goto LABEL_22;
        }
        placeholder = v6->_placeholder;
        v8 = self->_placeholder;
        id v14 = placeholder;
        if (v8 == v14)
        {

LABEL_26:
          if (self->_changeHandler == v6->_changeHandler)
          {
            BOOL v12 = self->_enabled == v6->_enabled;
            goto LABEL_23;
          }
LABEL_22:
          BOOL v12 = 0;
LABEL_23:

          goto LABEL_24;
        }
        v10 = v14;
        if (v8 && v14)
        {
          BOOL v15 = [(NSString *)v8 isEqualToString:v14];

          if (!v15) {
            goto LABEL_22;
          }
          goto LABEL_26;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    BOOL v12 = 0;
  }
LABEL_24:

  return v12;
}

+ (id)cellReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(id)objc_opt_class() cellReuseIdentifier];
  v7 = [v5 dequeueReusableCellWithIdentifier:v6];

  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1000 reuseIdentifier:v6];
  }
  v8 = [v7 textLabel];
  [v8 setText:self->_title];

  v9 = [v7 textLabel];
  [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  v10 = [v7 editableTextField];
  [v10 setDelegate:self];
  [v10 setText:self->_value];
  [v10 addTarget:self action:sel__textFieldValueChanged_ forControlEvents:0x20000];
  [v10 setKeyboardType:self->_keyboardType];
  [v10 setPlaceholder:self->_placeholder];
  [v10 setReturnKeyType:9];
  [v10 setEnabled:self->_enabled];
  if (self->_keyboardType == 8)
  {
    id v11 = objc_alloc(MEMORY[0x1E4FB1DF0]);
    BOOL v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v14 = (void *)MEMORY[0x1E4FB13F0];
    BOOL v15 = PKLocalizedString(&cfstr_Done.isa);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __73__PKTextFieldTableViewSettingsRow_tableViewCellForTableView_atIndexPath___block_invoke;
    v25 = &unk_1E59D5200;
    id v16 = v10;
    id v26 = v16;
    v17 = [v14 actionWithTitle:v15 image:0 identifier:0 handler:&v22];
    uint64_t v18 = objc_msgSend(v13, "initWithPrimaryAction:", v17, v22, v23, v24, v25);

    v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v27[0] = v19;
    v27[1] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    [v12 setItems:v20];

    [v12 sizeToFit];
    [v16 setInputAccessoryView:v12];
  }
  [v7 setAccessibilityIdentifier:self->_identifier];

  return v7;
}

uint64_t __73__PKTextFieldTableViewSettingsRow_tableViewCellForTableView_atIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resignFirstResponder];
}

- (BOOL)shouldHighlight
{
  return 0;
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  if (!a4)
  {
    uint64_t v6 = [a3 text];
    formatter = self->_formatter;
    if (formatter)
    {
      id v9 = (id)v6;
      uint64_t v8 = -[PKTextFieldTableViewSettingsRowFormatter submissionValueFromFormattedInput:](formatter, "submissionValueFromFormattedInput:");

      uint64_t v6 = v8;
    }
    id v10 = (id)v6;
    (*((void (**)(void))self->_changeHandler + 2))();
  }
}

- (void)_textFieldValueChanged:(id)a3
{
  formatter = self->_formatter;
  if (formatter)
  {
    id v4 = a3;
    id v5 = [v4 text];
    id v6 = [(PKTextFieldTableViewSettingsRowFormatter *)formatter formattedValueFromInput:v5];

    [v4 setText:v6];
  }
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_formatter, 0);
}

@end