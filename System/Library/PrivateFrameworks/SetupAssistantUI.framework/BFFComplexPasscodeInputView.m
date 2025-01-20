@interface BFFComplexPasscodeInputView
- (BFFComplexPasscodeInputView)initWithFrame:(CGRect)a3 numericOnly:(BOOL)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UITextField)passcodeField;
- (id)passcode;
- (id)passcodeDisplayView;
- (void)_layout;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setPasscode:(id)a3;
- (void)setPasscodeField:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BFFComplexPasscodeInputView

- (BFFComplexPasscodeInputView)initWithFrame:(CGRect)a3 numericOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BFFComplexPasscodeInputView;
  v5 = -[BFFPasscodeInputView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (UITextField *)objc_alloc_init(MEMORY[0x263F82CF0]);
    passcodeField = v5->_passcodeField;
    v5->_passcodeField = v6;

    [(UITextField *)v5->_passcodeField setDelegate:v5];
    [(UITextField *)v5->_passcodeField setSecureTextEntry:1];
    [(UITextField *)v5->_passcodeField setReturnKeyType:4];
    if (v4) {
      [(UITextField *)v5->_passcodeField setKeyboardType:4];
    }
    v8 = [(UITextField *)v5->_passcodeField textInputTraits];
    [v8 setDevicePasscodeEntry:1];
    [(UITextField *)v5->_passcodeField setTextAlignment:1];
    v9 = v5->_passcodeField;
    v10 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UITextField *)v9 setFont:v10];

    v11 = [(UITextField *)v5->_passcodeField layer];
    [v11 setBorderWidth:1.0];

    v12 = [(BFFComplexPasscodeInputView *)v5 traitCollection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __57__BFFComplexPasscodeInputView_initWithFrame_numericOnly___block_invoke;
    v18[3] = &unk_26454AAC8;
    v13 = v5;
    v19 = v13;
    [v12 performAsCurrentTraitCollection:v18];

    v14 = [(UITextField *)v5->_passcodeField layer];
    [v14 setCornerRadius:10.0];

    [(UITextField *)v5->_passcodeField sizeToFit];
    v15 = v5->_passcodeField;
    v16 = [MEMORY[0x263F825C8] _labelColor];
    [(UITextField *)v15 setTextColor:v16];

    [(BFFComplexPasscodeInputView *)v13 addSubview:v5->_passcodeField];
  }
  return v5;
}

void __57__BFFComplexPasscodeInputView_initWithFrame_numericOnly___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  id v1 = [MEMORY[0x263F825C8] _labelColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));
}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BFFComplexPasscodeInputView;
  [(BFFPasscodeInputView *)&v3 layoutSubviews];
  [(BFFComplexPasscodeInputView *)self _layout];
}

- (void)setPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(BFFComplexPasscodeInputView *)self passcodeField];
  [v5 setText:v4];
}

- (id)passcode
{
  id v2 = [(BFFComplexPasscodeInputView *)self passcodeField];
  objc_super v3 = [v2 text];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BFFComplexPasscodeInputView;
  [(BFFComplexPasscodeInputView *)&v7 traitCollectionDidChange:a3];
  id v4 = [(BFFComplexPasscodeInputView *)self passcodeField];
  id v5 = [v4 layer];
  id v6 = [MEMORY[0x263F825C8] _labelColor];
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(BFFPasscodeInputView *)self delegate];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(BFFPasscodeInputView *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [v9 text];
      v16 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", location, length, v10);

      v17 = [(BFFPasscodeInputView *)self delegate];
      [v17 passcodeInput:self willChangeContents:v16];
    }
  }

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  uint64_t v4 = [(BFFPasscodeInputView *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(BFFPasscodeInputView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(BFFPasscodeInputView *)self delegate];
      id v9 = [(BFFComplexPasscodeInputView *)self passcode];
      [v8 passcodeInput:self enteredPasscode:v9];
    }
  }
  return 1;
}

- (void)_layout
{
  [(BFFComplexPasscodeInputView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  char v7 = [(BFFComplexPasscodeInputView *)self passcodeField];
  objc_msgSend(v7, "sizeThatFits:", v4, v6);

  UIRectCenteredIntegralRect();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(BFFPasscodeInputView *)self instructionsLinkButton];

  if (v16)
  {
    v17 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    v18 = [v17 titleLabel];
    [v18 frame];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    v27 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    -[BFFComplexPasscodeInputView convertRect:fromView:](self, "convertRect:fromView:", v27, v20, v22, v24, v26);
    double MaxY = CGRectGetMaxY(v46);
    v29 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    v30 = [v29 titleLabel];
    [v30 _baselineOffsetFromBottom];
    double v32 = MaxY - v31 + 36.0 + -11.0;

    if (v11 < v32) {
      double v11 = v32;
    }
  }
  else
  {
    v33 = [(BFFPasscodeInputView *)self instructions];
    [v33 frame];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;

    v47.origin.x = v35;
    v47.origin.y = v37;
    v47.size.width = v39;
    v47.size.height = v41;
    double v42 = CGRectGetMaxY(v47) + 10.0;
    if (v11 < v42) {
      double v11 = v42;
    }
    v43 = [(BFFPasscodeInputView *)self instructions];
    objc_msgSend(v43, "setFrame:", v35, v37, v39, v41);
  }
  id v44 = [(BFFComplexPasscodeInputView *)self passcodeField];
  objc_msgSend(v44, "setFrame:", v9, v11, v13, v15);
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