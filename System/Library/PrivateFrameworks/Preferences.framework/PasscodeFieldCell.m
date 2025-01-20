@interface PasscodeFieldCell
- (BOOL)becomeFirstResponder;
- (BOOL)convertsNumeralsToASCII;
- (BOOL)denyFirstResponder;
- (BOOL)hasText;
- (KeychainSyncPasscodeFieldDelegate)delegate;
- (PSPasscodeField)passcodeField;
- (PasscodeFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)passcodeField:(id)a3 shouldInsertText:(id)a4;
- (id)passcodeText;
- (int64_t)keyboardType;
- (void)_setSecureTextEntry:(BOOL)a3;
- (void)deleteBackward;
- (void)layoutSubviews;
- (void)passcodeField:(id)a3 enteredPasscode:(id)a4;
- (void)setConvertsNumeralsToASCII:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDenyFirstResponder:(BOOL)a3;
- (void)setPasscodeText:(id)a3;
@end

@implementation PasscodeFieldCell

- (PasscodeFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PasscodeFieldCell;
  v9 = [(PSTableCell *)&v18 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(PasscodeFieldCell *)v9 setSelectionStyle:0];
    v11 = [v8 propertyForKey:@"numberOfPasscodeFields"];
    uint64_t v12 = [v11 unsignedIntegerValue];

    v13 = [[PSPasscodeField alloc] initWithNumberOfEntryFields:v12];
    passcodeField = v10->_passcodeField;
    v10->_passcodeField = v13;

    [(PSPasscodeField *)v10->_passcodeField setDelegate:v10];
    v15 = [(PasscodeFieldCell *)v10 contentView];
    [v15 addSubview:v10->_passcodeField];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v10 action:sel_cellTapped_];
    [(PasscodeFieldCell *)v10 addGestureRecognizer:v16];
  }
  return v10;
}

- (void)_setSecureTextEntry:(BOOL)a3
{
}

- (void)passcodeField:(id)a3 enteredPasscode:(id)a4
{
  id v5 = a4;
  id v6 = [(PasscodeFieldCell *)self delegate];
  [v6 passcodeField:self didUpdateEnteredPasscode:v5];
}

- (void)setPasscodeText:(id)a3
{
}

- (BOOL)becomeFirstResponder
{
  if ([(PasscodeFieldCell *)self denyFirstResponder]) {
    return 0;
  }
  passcodeField = self->_passcodeField;
  return [(PSPasscodeField *)passcodeField becomeFirstResponder];
}

- (id)passcodeText
{
  return [(PSPasscodeField *)self->_passcodeField stringValue];
}

- (BOOL)hasText
{
  v2 = [(PSPasscodeField *)self->_passcodeField stringValue];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)passcodeField:(id)a3 shouldInsertText:(id)a4
{
  id v5 = a4;
  if ([(PasscodeFieldCell *)self convertsNumeralsToASCII])
  {
    if (!passcodeField_shouldInsertText__asciiMaker)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      v7 = (void *)passcodeField_shouldInsertText__asciiMaker;
      passcodeField_shouldInsertText__asciiMaker = (uint64_t)v6;
    }
    id v8 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v5, "length"));
    if ([v5 length])
    {
      unint64_t v9 = 0;
      do
      {
        v10 = objc_msgSend(v5, "substringWithRange:", v9, 1);
        v11 = [(id)passcodeField_shouldInsertText__asciiMaker numberFromString:v10];
        uint64_t v12 = v11;
        if (v11)
        {
          v13 = [v11 stringValue];
          [v8 appendString:v13];
        }
        else
        {
          [v8 appendString:v10];
        }

        ++v9;
      }
      while (v9 < [v5 length]);
    }
  }
  else
  {
    id v8 = v5;
  }
  return v8;
}

- (void)deleteBackward
{
}

- (int64_t)keyboardType
{
  return 127;
}

- (void)layoutSubviews
{
  BOOL v3 = [MEMORY[0x1E4F428B8] clearColor];
  [(PasscodeFieldCell *)self setBackgroundColor:v3];

  [(PasscodeFieldCell *)self setBackgroundView:0];
  v9.receiver = self;
  v9.super_class = (Class)PasscodeFieldCell;
  [(PSTableCell *)&v9 layoutSubviews];
  v4 = [(PasscodeFieldCell *)self contentView];
  [v4 bounds];
  double v6 = v5;

  [(PSPasscodeField *)self->_passcodeField frame];
  float v8 = (v6 - v7) * 0.5;
  [(PSPasscodeField *)self->_passcodeField setFrame:floorf(v8)];
}

- (KeychainSyncPasscodeFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (KeychainSyncPasscodeFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)convertsNumeralsToASCII
{
  return self->_convertsNumeralsToASCII;
}

- (void)setConvertsNumeralsToASCII:(BOOL)a3
{
  self->_convertsNumeralsToASCII = a3;
}

- (BOOL)denyFirstResponder
{
  return self->_denyFirstResponder;
}

- (void)setDenyFirstResponder:(BOOL)a3
{
  self->_denyFirstResponder = a3;
}

- (PSPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeField, 0);
}

@end