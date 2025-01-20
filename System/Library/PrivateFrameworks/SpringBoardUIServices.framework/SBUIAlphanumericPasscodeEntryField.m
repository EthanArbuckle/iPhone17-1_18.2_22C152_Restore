@interface SBUIAlphanumericPasscodeEntryField
- (CGSize)_viewSize;
- (SBUIAlphanumericPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3;
- (UITextInputTraits)textInputTraits;
- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3;
- (void)_resetForFailedPasscode:(BOOL)a3;
- (void)layoutSubviews;
- (void)notePasscodeFieldTextDidChange;
@end

@implementation SBUIAlphanumericPasscodeEntryField

- (SBUIAlphanumericPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  v32.receiver = self;
  v32.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  v4 = [(SBUIPasscodeEntryField *)&v32 initWithDefaultSizeAndLightStyle:a3];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F42A30];
    int v6 = __sb__runningInSpringBoard();
    char v7 = v6;
    v8 = (void *)0x1E4F42000;
    if (v6)
    {
      BOOL v9 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      v3 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v9 = [v3 userInterfaceIdiom] == 1;
    }
    double v10 = 17.0;
    if (v9) {
      double v10 = 27.0;
    }
    v11 = objc_msgSend(v5, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory((void *)*MEMORY[0x1E4F43770], v10));
    if ((v7 & 1) == 0) {

    }
    if (__sb__runningInSpringBoard())
    {
      BOOL v12 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      v13 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v12 = [v13 userInterfaceIdiom] == 1;
    }
    [v11 _bodyLeading];
    double v15 = v14 + 12.0;
    double v16 = 38.0;
    if (v12) {
      double v16 = 74.0;
    }
    if (v16 >= v15) {
      double v17 = v16;
    }
    else {
      double v17 = v15;
    }
    [(SBUIAlphanumericPasscodeEntryField *)v4 setUserInteractionEnabled:1];
    v18 = [MEMORY[0x1E4F42D90] mainScreen];
    [v18 bounds];
    -[SBUIAlphanumericPasscodeEntryField setFrame:](v4, "setFrame:", 0.0, 0.0);

    [(SBUIAlphanumericPasscodeEntryField *)v4 setClipsToBounds:1];
    v19 = [(SBUIPasscodeEntryField *)v4 _textField];
    int v20 = __sb__runningInSpringBoard();
    char v21 = v20;
    if (v20)
    {
      BOOL v22 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      v8 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v22 = [v8 userInterfaceIdiom] == 1;
    }
    if (v22) {
      double v23 = 526.0;
    }
    else {
      double v23 = 314.0;
    }
    objc_msgSend(v19, "setFrame:", 0.0, 0.0, v23, v17);
    if ((v21 & 1) == 0) {

    }
    [v19 setTextAlignment:0];
    [v19 setClearButtonMode:0];
    [v19 setEmptyContentReturnKeyType:1];
    [v19 setReturnKeyType:9];
    [v19 setFont:v11];
    v24 = [v19 textInputTraits];
    [v24 setAcceptsSplitKeyboard:0];
    [v24 setAcceptsFloatingKeyboard:0];
    [v24 setUseInterfaceLanguageForLocalization:1];
    [v24 setReturnKeyType:9];
    id v25 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBUIAlphanumericPasscodeEntryField *)v4 bounds];
    uint64_t v26 = objc_msgSend(v25, "initWithFrame:");
    springViewParent = v4->_springViewParent;
    v4->_springViewParent = (UIView *)v26;

    id v28 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBUIAlphanumericPasscodeEntryField *)v4 bounds];
    uint64_t v29 = objc_msgSend(v28, "initWithFrame:");
    springView = v4->_springView;
    v4->_springView = (UIView *)v29;

    [(UIView *)v4->_springView setAutoresizingMask:2];
    [(UIView *)v4->_springViewParent setAutoresizingMask:2];
    [(SBUIAlphanumericPasscodeEntryField *)v4 addSubview:v4->_springViewParent];
    [(UIView *)v4->_springViewParent addSubview:v4->_springView];
    [(UIView *)v4->_springView addSubview:v19];
  }
  return v4;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  [(SBUIAlphanumericPasscodeEntryField *)&v13 layoutSubviews];
  v3 = [(SBUIPasscodeEntryField *)self _textField];
  [v3 frame];
  [(SBUIAlphanumericPasscodeEntryField *)self bounds];
  UIRectCenteredXInRectScale();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = [(SBUIPasscodeEntryField *)self _textField];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (UITextInputTraits)textInputTraits
{
  v2 = [(SBUIPasscodeEntryField *)self _textField];
  v3 = [v2 textInputTraits];

  return (UITextInputTraits *)v3;
}

- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(SBUIPasscodeEntryField *)self _textField];
  [v5 setText:@"0000000000"];
  v6.receiver = self;
  v6.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  [(SBUIPasscodeEntryField *)&v6 _autofillForBiometricAuthenticationWithCompletion:v4];
}

- (void)notePasscodeFieldTextDidChange
{
  v3 = [MEMORY[0x1E4F42B20] sharedInstance];
  [v3 updateReturnKey:0];

  v4.receiver = self;
  v4.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  [(SBUIPasscodeEntryField *)&v4 notePasscodeFieldTextDidChange];
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.x"];
  [v5 setMass:1.20000005];
  [v5 setStiffness:1200.0];
  [v5 setDamping:12.0];
  LODWORD(v6) = 1028389654;
  LODWORD(v7) = 990057071;
  LODWORD(v8) = 1059712716;
  LODWORD(v9) = 1.0;
  double v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v6 :v7 :v8 :v9];
  [v5 setTimingFunction:v10];

  [v5 setDuration:0.666999996];
  [v5 setVelocity:0.0];
  uint64_t v11 = *MEMORY[0x1E4F39F98];
  [v5 setFillMode:*MEMORY[0x1E4F39F98]];
  BOOL v12 = NSNumber;
  objc_super v13 = [(UIView *)self->_springView layer];
  [v13 position];
  double v15 = v14 + 75.0;
  *(float *)&double v15 = v15;
  double v16 = [v12 numberWithFloat:v15];
  [v5 setFromValue:v16];

  double v17 = [(UIView *)self->_springView layer];
  [v17 addAnimation:v5 forKey:@"shake"];

  v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.x"];
  LODWORD(v19) = 1054276898;
  LODWORD(v20) = 1058305108;
  LODWORD(v21) = 1.0;
  BOOL v22 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v19 :0.0 :v20 :v21];
  [v18 setTimingFunction:v22];

  [v18 setDuration:0.100000001];
  [v18 setFillMode:v11];
  double v23 = NSNumber;
  v24 = [(UIView *)self->_springViewParent layer];
  [v24 position];
  double v26 = v25 + -75.0;
  *(float *)&double v26 = v26;
  v27 = [v23 numberWithFloat:v26];
  [v18 setFromValue:v27];

  id v28 = [(UIView *)self->_springViewParent layer];
  [v28 addAnimation:v18 forKey:@"force-off-center"];

  v29.receiver = self;
  v29.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  [(SBUIPasscodeEntryField *)&v29 _resetForFailedPasscode:v3];
}

- (CGSize)_viewSize
{
  v2 = [(SBUIPasscodeEntryField *)self _textField];
  BOOL v3 = [v2 font];

  if (__sb__runningInSpringBoard())
  {
    BOOL v4 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    double v5 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v4 = [v5 userInterfaceIdiom] == 1;
  }
  [v3 _bodyLeading];
  double v7 = v6 + 12.0;
  double v8 = 38.0;
  if (v4) {
    double v8 = 74.0;
  }
  if (v8 >= v7) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  double v10 = [MEMORY[0x1E4F42D90] mainScreen];
  [v10 bounds];
  double v12 = v11;

  double v13 = v12;
  double v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springViewParent, 0);
  objc_storeStrong((id *)&self->_springView, 0);
}

@end