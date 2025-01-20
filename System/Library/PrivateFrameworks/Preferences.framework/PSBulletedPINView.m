@interface PSBulletedPINView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (PSBulletedPINView)initWithFrame:(CGRect)a3;
- (PSBulletedPINView)initWithFrame:(CGRect)a3 numberOfFields:(int)a4;
- (id)stringValue;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)deleteLastCharacter;
- (void)hidePasscodeField:(BOOL)a3;
- (void)layoutSubviews;
- (void)notifyDelegatePINChanged;
- (void)notifyDelegatePINEntered;
- (void)setBlocked:(BOOL)a3;
- (void)setStringValue:(id)a3;
@end

@implementation PSBulletedPINView

- (PSBulletedPINView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PSBulletedPINView)initWithFrame:(CGRect)a3 numberOfFields:(int)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  v23.receiver = self;
  v23.super_class = (Class)PSBulletedPINView;
  v7 = -[PSBulletedPINView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v7)
  {
    v8 = +[PSListController appearance];
    v9 = [v8 backgroundColor];
    [(PSBulletedPINView *)v7 setBackgroundColor:v9];

    v10 = [[PSPasscodeField alloc] initWithNumberOfEntryFields:a4];
    passcodeField = v7->_passcodeField;
    v7->_passcodeField = v10;

    [(PSPasscodeField *)v7->_passcodeField frame];
    -[PSPasscodeField setFrame:](v7->_passcodeField, "setFrame:", floor((width - v12) * 0.5), floor((height - v13) * 0.5));
    [(PSBulletedPINView *)v7 addSubview:v7->_passcodeField];
    [(PSPasscodeField *)v7->_passcodeField setDelegate:v7];
    id v14 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v7->super._titleLabel;
    v7->super._titleLabel = (UILabel *)v15;

    v17 = v7->super._titleLabel;
    v18 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v17 setFont:v18];

    [(UILabel *)v7->super._titleLabel setOpaque:0];
    [(UILabel *)v7->super._titleLabel setBackgroundColor:0];
    [(UILabel *)v7->super._titleLabel setTextAlignment:1];
    v19 = v7->super._titleLabel;
    v20 = +[PSListController appearance];
    v21 = [v20 textColor];
    [(UILabel *)v19 setTextColor:v21];

    [(UILabel *)v7->super._titleLabel setNumberOfLines:0];
    [(UILabel *)v7->super._titleLabel accessibilitySetIdentification:@"titleLabel"];
    [(UILabel *)v7->super._titleLabel setAdjustsFontSizeToFitWidth:1];
    [(PSBulletedPINView *)v7 addSubview:v7->super._titleLabel];
  }
  return v7;
}

- (void)dealloc
{
  [(PSPasscodeField *)self->_passcodeField setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PSBulletedPINView;
  [(PSBulletedPINView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(PSPasscodeField *)self->_passcodeField frame];
  double v4 = v3;
  double v6 = v5;
  [(PSBulletedPINView *)self bounds];
  double v8 = floor((v7 - v4) * 0.5);
  [(PSBulletedPINView *)self bounds];
  double v10 = floor((v9 - v6) * 0.5);
  -[PSPasscodeField setFrame:](self->_passcodeField, "setFrame:", v8, v10, v4, v6);
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.double width = v4;
  v16.size.double height = v6;
  CGFloat v11 = CGRectGetMinY(v16) + -22.0;
  [(PINView *)self layoutTopLabel:self->super._titleLabel withMaxY:v11];
  [(PINView *)self layoutTopLabel:self->super._errorTitleLabel withMaxY:v11];
  v15.receiver = self;
  v15.super_class = (Class)PSBulletedPINView;
  [(PINView *)&v15 layoutSubviews];
  if (self->super._pinPolicyLabel)
  {
    v17.origin.x = v8;
    v17.origin.y = v10;
    v17.size.double width = v4;
    v17.size.double height = v6;
    [(PINView *)self layoutBottomSubview:self->super._pinPolicyLabel withLabel:self->super._pinPolicyLabel withMinY:CGRectGetMaxY(v17) + 10.0];
  }
  if (self->super._failureView)
  {
    v18.origin.x = v8;
    v18.origin.y = v10;
    v18.size.double width = v4;
    v18.size.double height = v6;
    CGFloat v12 = CGRectGetMaxY(v18) + 22.0;
    failureView = self->super._failureView;
    id v14 = [(FailureBarView *)failureView titleLabel];
    [(PINView *)self layoutBottomSubview:failureView withLabel:v14 withMinY:v12];
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
  [(PSPasscodeField *)self->_passcodeField frame];
  *(void *)&long long v16 = v5;
  *((void *)&v16 + 1) = v6;
  *(void *)&long long v17 = v7;
  *((void *)&v17 + 1) = v8;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__PSBulletedPINView_hidePasscodeField___block_invoke;
  v12[3] = &unk_1E5C5E530;
  objc_copyWeak(&v13, &location);
  v12[4] = v15;
  uint64_t v9 = MEMORY[0x1AD0BE2A0](v12);
  double v10 = (void *)v9;
  if (v3)
  {
    CGFloat v11 = (void *)MEMORY[0x1E4F42FF0];
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

void __39__PSBulletedPINView_hidePasscodeField___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = -*(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 48);
  objc_msgSend(WeakRetained[60], "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
}

- (id)stringValue
{
  return [(PSPasscodeField *)self->_passcodeField stringValue];
}

- (void)setStringValue:(id)a3
{
  [(PSPasscodeField *)self->_passcodeField setStringValue:a3];
  [(PSBulletedPINView *)self notifyDelegatePINChanged];
}

- (void)deleteLastCharacter
{
  [(PSPasscodeField *)self->_passcodeField deleteBackward];
  [(PSBulletedPINView *)self notifyDelegatePINChanged];
}

- (void)appendString:(id)a3
{
  [(PSPasscodeField *)self->_passcodeField insertText:a3];
  [(PSBulletedPINView *)self notifyDelegatePINChanged];
}

- (BOOL)isFirstResponder
{
  return [(PSPasscodeField *)self->_passcodeField isFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return [(PSPasscodeField *)self->_passcodeField canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(PSPasscodeField *)self->_passcodeField becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)PSBulletedPINView;
  [(PSBulletedPINView *)&v4 resignFirstResponder];
  return [(PSPasscodeField *)self->_passcodeField resignFirstResponder];
}

- (void)setBlocked:(BOOL)a3
{
}

- (void)notifyDelegatePINChanged
{
  id v4 = [(PINView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(PSBulletedPINView *)self stringValue];
    [v4 pinView:self pinValueChanged:v3];
  }
}

- (void)notifyDelegatePINEntered
{
  id v4 = [(PINView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(PSBulletedPINView *)self stringValue];
    [v4 pinView:self pinEntered:v3];
  }
}

- (void).cxx_destruct
{
}

@end