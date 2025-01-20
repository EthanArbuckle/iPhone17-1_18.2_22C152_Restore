@interface OBSimplePasscodeInputView
- (BOOL)limitCharactersToNumbers;
- (OBPasscodeField)passcodeField;
- (OBSimplePasscodeInputView)initWithFrame:(CGRect)a3 numberOfEntryFields:(unint64_t)a4;
- (id)passcode;
- (id)passcodeDisplayView;
- (void)passcodeField:(id)a3 enteredPasscode:(id)a4;
- (void)setLimitCharactersToNumbers:(BOOL)a3;
- (void)setPasscode:(id)a3;
- (void)setPasscodeField:(id)a3;
@end

@implementation OBSimplePasscodeInputView

- (OBSimplePasscodeInputView)initWithFrame:(CGRect)a3 numberOfEntryFields:(unint64_t)a4
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)OBSimplePasscodeInputView;
  v5 = -[OBSimplePasscodeInputView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [[OBPasscodeField alloc] initWithNumberOfEntryFields:a4];
    passcodeField = v5->_passcodeField;
    v5->_passcodeField = v6;

    [(OBPasscodeField *)v5->_passcodeField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(OBPasscodeField *)v5->_passcodeField setDelegate:v5];
    [(OBSimplePasscodeInputView *)v5 addSubview:v5->_passcodeField];
    v18 = (void *)MEMORY[0x1E4F28DC8];
    v22 = [(OBPasscodeField *)v5->_passcodeField leadingAnchor];
    v21 = [(OBSimplePasscodeInputView *)v5 leadingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v19 = [(OBPasscodeField *)v5->_passcodeField trailingAnchor];
    v8 = [(OBSimplePasscodeInputView *)v5 trailingAnchor];
    v9 = [v19 constraintEqualToAnchor:v8];
    v24[1] = v9;
    v10 = [(OBPasscodeField *)v5->_passcodeField topAnchor];
    v11 = [(OBSimplePasscodeInputView *)v5 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v24[2] = v12;
    v13 = [(OBPasscodeField *)v5->_passcodeField bottomAnchor];
    v14 = [(OBSimplePasscodeInputView *)v5 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v24[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v18 activateConstraints:v16];
  }
  return v5;
}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)setPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(OBSimplePasscodeInputView *)self passcodeField];
  [v5 setStringValue:v4];
}

- (id)passcode
{
  v2 = [(OBSimplePasscodeInputView *)self passcodeField];
  v3 = [v2 stringValue];

  return v3;
}

- (void)passcodeField:(id)a3 enteredPasscode:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [(OBPasscodeInputView *)self delegate];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(OBPasscodeInputView *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(OBPasscodeInputView *)self delegate];
      [v9 passcodeInput:self enteredPasscode:v10];
    }
  }
}

- (BOOL)limitCharactersToNumbers
{
  return self->_limitCharactersToNumbers;
}

- (void)setLimitCharactersToNumbers:(BOOL)a3
{
  self->_limitCharactersToNumbers = a3;
}

- (OBPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end