@interface BFFSimplePasscodeInputView
- (BFFSimplePasscodeInputView)initWithFrame:(CGRect)a3 numberOfEntryFields:(unint64_t)a4;
- (BOOL)limitCharactersToNumbers;
- (PSPasscodeField)passcodeField;
- (id)passcode;
- (id)passcodeDisplayView;
- (id)passcodeField:(id)a3 shouldInsertText:(id)a4;
- (void)layoutSubviews;
- (void)passcodeField:(id)a3 enteredPasscode:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setLimitCharactersToNumbers:(BOOL)a3;
- (void)setPasscode:(id)a3;
- (void)setPasscodeField:(id)a3;
@end

@implementation BFFSimplePasscodeInputView

- (BFFSimplePasscodeInputView)initWithFrame:(CGRect)a3 numberOfEntryFields:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BFFSimplePasscodeInputView;
  v5 = -[BFFPasscodeInputView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [MEMORY[0x263F5FBC0] appearance];
    v7 = [MEMORY[0x263F825C8] _labelColor];
    [v6 setTextColor:v7];

    uint64_t v8 = [objc_alloc(MEMORY[0x263F5FC00]) initWithNumberOfEntryFields:a4];
    passcodeField = v5->_passcodeField;
    v5->_passcodeField = (PSPasscodeField *)v8;

    [(PSPasscodeField *)v5->_passcodeField setDelegate:v5];
    [(BFFSimplePasscodeInputView *)v5 addSubview:v5->_passcodeField];
    [(BFFSimplePasscodeInputView *)v5 setLimitCharactersToNumbers:1];
  }
  return v5;
}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)layoutSubviews
{
  v3 = [MEMORY[0x263F82438] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v48.receiver = self;
  v48.super_class = (Class)BFFSimplePasscodeInputView;
  [(BFFPasscodeInputView *)&v48 layoutSubviews];
  v6 = [(BFFSimplePasscodeInputView *)self passcodeField];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  [(BFFSimplePasscodeInputView *)self bounds];
  double v12 = v11;
  double v13 = 0.0;
  if (!IsAccessibilityCategory)
  {
    [(BFFSimplePasscodeInputView *)self bounds];
    double v13 = floor((v14 - v10) * 0.5);
  }
  v15 = [(BFFPasscodeInputView *)self instructionsLinkButton];

  if (v15)
  {
    v16 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    v17 = [v16 titleLabel];
    [v17 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    -[BFFSimplePasscodeInputView convertRect:fromView:](self, "convertRect:fromView:", v26, v19, v21, v23, v25);
    double MaxY = CGRectGetMaxY(v49);
    v28 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    v29 = [v28 titleLabel];
    [v29 _baselineOffsetFromBottom];
    double v31 = MaxY - v30 + 36.0 + -7.0;

    if (v13 >= v31) {
      double v31 = v13;
    }
  }
  else
  {
    v32 = [(BFFPasscodeInputView *)self instructions];
    [v32 frame];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v47 = v8;
    double v39 = v10;
    double v40 = v12;
    CGFloat v42 = v41;

    v50.origin.x = v34;
    v50.origin.y = v36;
    v50.size.width = v38;
    v50.size.height = v42;
    double v43 = CGRectGetMaxY(v50) + 10.0;
    if (v13 >= v43) {
      double v31 = v13;
    }
    else {
      double v31 = v43;
    }
    v44 = [(BFFPasscodeInputView *)self instructions];
    double v45 = v42;
    double v12 = v40;
    double v10 = v39;
    double v8 = v47;
    objc_msgSend(v44, "setFrame:", v34, v36, v38, v45);
  }
  v46 = [(BFFSimplePasscodeInputView *)self passcodeField];
  objc_msgSend(v46, "setFrame:", floor((v12 - v8) * 0.5), v31, v8, v10);
}

- (void)setPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(BFFSimplePasscodeInputView *)self passcodeField];
  [v5 setStringValue:v4];
}

- (id)passcode
{
  v2 = [(BFFSimplePasscodeInputView *)self passcodeField];
  v3 = [v2 stringValue];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
}

- (id)passcodeField:(id)a3 shouldInsertText:(id)a4
{
  id v5 = a4;
  if ([(BFFSimplePasscodeInputView *)self limitCharactersToNumbers])
  {
    v6 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    double v7 = [v6 invertedSet];
    double v8 = [v5 componentsSeparatedByCharactersInSet:v7];
    id v9 = [v8 componentsJoinedByString:&stru_26D1D0C18];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (void)passcodeField:(id)a3 enteredPasscode:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [(BFFPasscodeInputView *)self delegate];
  if (v5)
  {
    v6 = (void *)v5;
    double v7 = [(BFFPasscodeInputView *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(BFFPasscodeInputView *)self delegate];
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

- (PSPasscodeField)passcodeField
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