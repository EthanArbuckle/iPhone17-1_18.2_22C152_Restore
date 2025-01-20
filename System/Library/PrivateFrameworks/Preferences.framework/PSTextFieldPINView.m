@interface PSTextFieldPINView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)keyboardInputChanged:(id)a3;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)usesNumericKeyboard;
- (PSTextFieldPINView)initWithFrame:(CGRect)a3;
- (id)stringValue;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)deleteLastCharacter;
- (void)hidePasscodeField:(BOOL)a3;
- (void)layoutSubviews;
- (void)notifyDelegatePINChanged;
- (void)notifyDelegatePINEntered;
- (void)okButtonPressed:(id)a3;
- (void)setBlocked:(BOOL)a3;
- (void)setStringValue:(id)a3;
- (void)setTextFieldKeyboardAppearance:(int64_t)a3;
- (void)setTextFieldKeyboardType:(int64_t)a3;
- (void)setUsesNumericKeyboard:(BOOL)a3;
- (void)showError:(id)a3 animate:(BOOL)a4;
@end

@implementation PSTextFieldPINView

- (PSTextFieldPINView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)PSTextFieldPINView;
  v7 = -[PSTextFieldPINView initWithFrame:](&v27, sel_initWithFrame_);
  if (v7)
  {
    v8 = [[AlphanumericPINTableViewCell alloc] initWithStyle:1000 reuseIdentifier:0];
    cell = v7->_cell;
    v7->_cell = v8;

    [(AlphanumericPINTableViewCell *)v7->_cell setOpaque:0];
    [(AlphanumericPINTableViewCell *)v7->_cell setTextFieldOffset:9.0];
    uint64_t v10 = [(AlphanumericPINTableViewCell *)v7->_cell pinTextField];
    passcodeField = v7->_passcodeField;
    v7->_passcodeField = (UITextField *)v10;

    [(UITextField *)v7->_passcodeField setDelegate:v7];
    v12 = [(UITextField *)v7->_passcodeField textInputTraits];
    [v12 setDevicePasscodeEntry:1];
    [(UITextField *)v7->_passcodeField setDevicePasscodeEntry:1];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "set devicePasscodeEntry (PSTextFieldPINView)", v26, 2u);
    }
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", 1, x, y, width, height);
    table = v7->_table;
    v7->_table = (UITableView *)v13;

    [(UITableView *)v7->_table setDataSource:v7];
    [(UITableView *)v7->_table setScrollEnabled:0];
    v15 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITableView *)v7->_table setBackgroundColor:v15];

    [(UITableView *)v7->_table _setTopPadding:0.0];
    [(UITableView *)v7->_table _setBottomPadding:0.0];
    [(PSTextFieldPINView *)v7 addSubview:v7->_table];
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v7 selector:sel_okButtonPressed_ name:*MEMORY[0x1E4F43B48] object:0];

    id v17 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v7->super._titleLabel;
    v7->super._titleLabel = (UILabel *)v18;

    v20 = v7->super._titleLabel;
    v21 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v20 setFont:v21];

    [(UILabel *)v7->super._titleLabel setOpaque:0];
    [(UILabel *)v7->super._titleLabel setBackgroundColor:0];
    [(UILabel *)v7->super._titleLabel setTextAlignment:1];
    v22 = v7->super._titleLabel;
    v23 = +[PSListController appearance];
    v24 = [v23 textColor];
    [(UILabel *)v22 setTextColor:v24];

    [(UILabel *)v7->super._titleLabel setNumberOfLines:0];
    [(UILabel *)v7->super._titleLabel setAdjustsFontSizeToFitWidth:1];
    [(PSTextFieldPINView *)v7 addSubview:v7->super._titleLabel];
  }
  return v7;
}

- (void)setUsesNumericKeyboard:(BOOL)a3
{
  self->_usesNumericKeyboard = a3;
  passcodeField = self->_passcodeField;
  if (a3) {
    uint64_t v4 = 127;
  }
  else {
    uint64_t v4 = 0;
  }
  [(UITextField *)passcodeField setKeyboardType:v4];
}

- (void)layoutSubviews
{
  [(PSTextFieldPINView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UITableView setFrame:](self->_table, "setFrame:");
  v20.origin.double x = v4;
  v20.origin.double y = v6;
  v20.size.double width = v8;
  v20.size.double height = v10;
  double MidY = CGRectGetMidY(v20);
  [(AlphanumericPINTableViewCell *)self->_cell frame];
  -[UITableView setContentInset:](self->_table, "setContentInset:", MidY - v12 * 0.5, 0.0, 0.0, 0.0);
  [(AlphanumericPINTableViewCell *)self->_cell frame];
  double v14 = v13;
  v21.origin.double x = v4;
  v21.origin.double y = v6;
  v21.size.double width = v8;
  v21.size.double height = v10;
  double v15 = floor(CGRectGetMidY(v21) - v14 * 0.5);
  [(PINView *)self layoutTopLabel:self->super._titleLabel withMaxY:v15 + -22.0];
  [(PINView *)self layoutTopLabel:self->super._errorTitleLabel withMaxY:v15 + -22.0];
  v19.receiver = self;
  v19.super_class = (Class)PSTextFieldPINView;
  [(PINView *)&v19 layoutSubviews];
  pinPolicyLabel = self->super._pinPolicyLabel;
  if (pinPolicyLabel) {
    [(PINView *)self layoutBottomSubview:pinPolicyLabel withLabel:self->super._pinPolicyLabel withMinY:v14 + v15 + 10.0];
  }
  failureView = self->super._failureView;
  if (failureView)
  {
    uint64_t v18 = [(FailureBarView *)self->super._failureView titleLabel];
    [(PINView *)self layoutBottomSubview:failureView withLabel:v18 withMinY:v14 + v15 + 22.0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return self->_cell;
}

- (void)setBlocked:(BOOL)a3
{
  BOOL v3 = a3;
  UIKeyboardDisableAutomaticAppearance();
  [(AlphanumericPINTableViewCell *)self->_cell setUserInteractionEnabled:!v3];
  UIKeyboardEnableAutomaticAppearance();
}

- (void)notifyDelegatePINChanged
{
  id v4 = [(PINView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(PSTextFieldPINView *)self stringValue];
    [v4 pinView:self pinValueChanged:v3];
  }
}

- (void)notifyDelegatePINEntered
{
  id v4 = [(PINView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(PSTextFieldPINView *)self stringValue];
    [v4 pinView:self pinEntered:v3];
  }
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id v4 = [(UITextField *)self->_passcodeField text];
  uint64_t v5 = [v4 length];

  if (v5) {
    [(PINView *)self hideError];
  }
  [(PSTextFieldPINView *)self notifyDelegatePINChanged];
  return 1;
}

- (void)setTextFieldKeyboardType:(int64_t)a3
{
}

- (void)setTextFieldKeyboardAppearance:(int64_t)a3
{
}

- (void)showError:(id)a3 animate:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PSTextFieldPINView;
  [(PINView *)&v4 showError:a3 animate:a4];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UITableView *)self->_table setDataSource:0];
  v4.receiver = self;
  v4.super_class = (Class)PSTextFieldPINView;
  [(PSTextFieldPINView *)&v4 dealloc];
}

- (id)stringValue
{
  return [(UITextField *)self->_passcodeField text];
}

- (void)okButtonPressed:(id)a3
{
  objc_super v4 = [(UITextField *)self->_passcodeField text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    [(PSTextFieldPINView *)self notifyDelegatePINEntered];
  }
}

- (void)hidePasscodeField:(BOOL)a3
{
  BOOL v3 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x4010000000;
  v15[3] = "";
  long long v16 = 0u;
  long long v17 = 0u;
  [(AlphanumericPINTableViewCell *)self->_cell frame];
  *(void *)&long long v16 = v5;
  *((void *)&v16 + 1) = v6;
  *(void *)&long long v17 = v7;
  *((void *)&v17 + 1) = v8;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__PSTextFieldPINView_hidePasscodeField___block_invoke;
  v12[3] = &unk_1E5C5E530;
  objc_copyWeak(&v13, &location);
  v12[4] = v15;
  uint64_t v9 = MEMORY[0x1AD0BE2A0](v12);
  CGFloat v10 = (void *)v9;
  if (v3)
  {
    v11 = (void *)MEMORY[0x1E4F42FF0];
    [MEMORY[0x1E4F42FD8] defaultDurationForTransition:7];
    objc_msgSend(v11, "animateWithDuration:animations:", v10);
  }
  else
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(v15, 8);
}

void __40__PSTextFieldPINView_hidePasscodeField___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = -*(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 48);
  objc_msgSend(WeakRetained[61], "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
}

- (BOOL)isFirstResponder
{
  return [(UITextField *)self->_passcodeField isFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return [(UITextField *)self->_passcodeField canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(UITextField *)self->_passcodeField becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)PSTextFieldPINView;
  if (![(PSTextFieldPINView *)&v5 isFirstResponder]) {
    return [(UITextField *)self->_passcodeField resignFirstResponder];
  }
  v4.receiver = self;
  v4.super_class = (Class)PSTextFieldPINView;
  return [(PSTextFieldPINView *)&v4 resignFirstResponder];
}

- (void)setStringValue:(id)a3
{
  [(UITextField *)self->_passcodeField setText:a3];
  [(PSTextFieldPINView *)self notifyDelegatePINChanged];
}

- (void)appendString:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(UITextField *)self->_passcodeField text];
  if ([v4 length])
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v4];
    [v5 appendString:v6];
    [(UITextField *)self->_passcodeField setText:v5];
  }
  else
  {
    [(UITextField *)self->_passcodeField setText:v6];
  }
  [(PSTextFieldPINView *)self notifyDelegatePINChanged];
}

- (void)deleteLastCharacter
{
  id v6 = [(UITextField *)self->_passcodeField text];
  uint64_t v3 = [v6 length];
  if (v3)
  {
    passcodeField = self->_passcodeField;
    objc_super v5 = [v6 substringToIndex:v3 - 1];
    [(UITextField *)passcodeField setText:v5];
  }
  [(PSTextFieldPINView *)self notifyDelegatePINChanged];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (BOOL)usesNumericKeyboard
{
  return self->_usesNumericKeyboard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_passcodeField, 0);
}

@end