@interface OBComplexPasscodeInputView
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (OBComplexPasscodeInputView)initWithFrame:(CGRect)a3 numericOnly:(BOOL)a4;
- (UITextField)passcodeField;
- (id)passcode;
- (id)passcodeDisplayView;
- (void)setPasscode:(id)a3;
- (void)setPasscodeField:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBComplexPasscodeInputView

- (OBComplexPasscodeInputView)initWithFrame:(CGRect)a3 numericOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v38[5] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)OBComplexPasscodeInputView;
  v5 = -[OBComplexPasscodeInputView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    passcodeField = v5->_passcodeField;
    v5->_passcodeField = v6;

    [(UITextField *)v5->_passcodeField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v5->_passcodeField setDelegate:v5];
    [(UITextField *)v5->_passcodeField setSecureTextEntry:1];
    [(UITextField *)v5->_passcodeField setReturnKeyType:4];
    if (v4) {
      [(UITextField *)v5->_passcodeField setKeyboardType:4];
    }
    v34 = [(UITextField *)v5->_passcodeField textInputTraits];
    [v34 setDevicePasscodeEntry:1];
    [(UITextField *)v5->_passcodeField setTextAlignment:1];
    v8 = v5->_passcodeField;
    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UITextField *)v8 setFont:v9];

    v10 = [(UITextField *)v5->_passcodeField layer];
    [v10 setBorderWidth:1.0];

    v11 = [(OBComplexPasscodeInputView *)v5 traitCollection];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __56__OBComplexPasscodeInputView_initWithFrame_numericOnly___block_invoke;
    v35[3] = &unk_1E58AE998;
    v12 = v5;
    v36 = v12;
    [v11 performAsCurrentTraitCollection:v35];

    v13 = [(UITextField *)v5->_passcodeField layer];
    [v13 setCornerRadius:10.0];

    v14 = v5->_passcodeField;
    v15 = [MEMORY[0x1E4FB1618] labelColor];
    [(UITextField *)v14 setTextColor:v15];

    [(OBComplexPasscodeInputView *)v12 addSubview:v5->_passcodeField];
    v28 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [(UITextField *)v5->_passcodeField heightAnchor];
    [(UITextField *)v5->_passcodeField intrinsicContentSize];
    v32 = [v33 constraintEqualToConstant:v16 + v16];
    v38[0] = v32;
    v31 = [(UITextField *)v5->_passcodeField leadingAnchor];
    v30 = [(OBComplexPasscodeInputView *)v12 leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v38[1] = v29;
    v27 = [(UITextField *)v5->_passcodeField trailingAnchor];
    v17 = [(OBComplexPasscodeInputView *)v12 trailingAnchor];
    v18 = [v27 constraintEqualToAnchor:v17];
    v38[2] = v18;
    v19 = [(UITextField *)v5->_passcodeField topAnchor];
    v20 = [(OBComplexPasscodeInputView *)v12 topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v38[3] = v21;
    v22 = [(UITextField *)v5->_passcodeField bottomAnchor];
    v23 = [(OBComplexPasscodeInputView *)v12 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v38[4] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:5];
    [v28 activateConstraints:v25];
  }
  return v5;
}

void __56__OBComplexPasscodeInputView_initWithFrame_numericOnly___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  id v1 = [MEMORY[0x1E4FB1618] labelColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));
}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)setPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(OBComplexPasscodeInputView *)self passcodeField];
  [v5 setText:v4];
}

- (id)passcode
{
  id v2 = [(OBComplexPasscodeInputView *)self passcodeField];
  v3 = [v2 text];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OBComplexPasscodeInputView;
  [(OBComplexPasscodeInputView *)&v7 traitCollectionDidChange:a3];
  id v4 = [(OBComplexPasscodeInputView *)self passcodeField];
  id v5 = [v4 layer];
  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(OBPasscodeInputView *)self delegate];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(OBPasscodeInputView *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [v9 text];
      double v16 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", location, length, v10);

      v17 = [(OBPasscodeInputView *)self delegate];
      [v17 passcodeInput:self willChangeContents:v16];
    }
  }

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  uint64_t v4 = [(OBPasscodeInputView *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(OBPasscodeInputView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(OBPasscodeInputView *)self delegate];
      id v9 = [(OBComplexPasscodeInputView *)self passcode];
      [v8 passcodeInput:self enteredPasscode:v9];
    }
  }
  return 1;
}

- (UITextField)passcodeField
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