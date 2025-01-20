@interface SBUILongNumericPasscodeEntryField
+ (BOOL)_shouldResetAutoAcceptWhenMaxNumbersMetInResignFirstResponder;
+ (BOOL)_usesTextFieldForFirstResponder;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)resignFirstResponder;
- (BOOL)showsOkButton;
- (BOOL)showsPromptLabel;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (CGSize)_viewSize;
- (SBUILongNumericPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3;
- (UIButton)okButton;
- (UILabel)promptLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3;
- (void)_getPasscodeFieldSize:(CGSize *)a3 okButtonSize:(CGSize *)a4;
- (void)_handleKeyUIEvent:(id)a3;
- (void)_okButtonHit;
- (void)_resetForFailedPasscode:(BOOL)a3;
- (void)layoutSubviews;
- (void)setShowsOkButton:(BOOL)a3;
- (void)setShowsPromptLabel:(BOOL)a3;
@end

@implementation SBUILongNumericPasscodeEntryField

- (SBUILongNumericPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  v40.receiver = self;
  v40.super_class = (Class)SBUILongNumericPasscodeEntryField;
  v4 = -[SBUINumericPasscodeEntryFieldBase initWithDefaultSizeAndLightStyle:](&v40, sel_initWithDefaultSizeAndLightStyle_);
  v5 = v4;
  if (v4)
  {
    [(SBUINumericPasscodeEntryFieldBase *)v4 setAllowsNewlineAcceptance:1];
    [(SBUINumericPasscodeEntryFieldBase *)v5 setAutoAcceptWhenMaxNumbersMet:0];
    [(SBUILongNumericPasscodeEntryField *)v5 setUserInteractionEnabled:1];
    [(SBUILongNumericPasscodeEntryField *)v5 setClipsToBounds:1];
    uint64_t v6 = +[SBUIButton buttonWithType:1];
    okButton = v5->_okButton;
    v5->_okButton = (SBUIButton *)v6;

    -[SBUIButton setHitAreaAdjustments:](v5->_okButton, "setHitAreaAdjustments:", -15.0, -15.0, -15.0, -15.0);
    v8 = v5->_okButton;
    v9 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBUIButton *)v8 setBackgroundColor:v9];

    v10 = v5->_okButton;
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"PASSCODE_ENTRY_OK" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
    [(SBUIButton *)v10 setTitle:v12 forState:0];

    v13 = v5->_okButton;
    if (a3) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    v14 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    [(SBUIButton *)v13 setTitleColor:v14 forState:0];

    [(SBUIButton *)v5->_okButton addTarget:v5 action:sel__okButtonHit forControlEvents:64];
    v15 = [(SBUIButton *)v5->_okButton titleLabel];
    v16 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0];
    [v15 setFont:v16];

    [v15 setLineBreakMode:4];
    [v15 setTextAlignment:1];
    [(SBUILongNumericPasscodeEntryField *)v5 bounds];
    double v18 = v17;
    long long v39 = *MEMORY[0x1E4F1DB30];
    [(SBUILongNumericPasscodeEntryField *)v5 _getPasscodeFieldSize:&v39 okButtonSize:0];
    double v19 = SBUIFloatFloorForMainScreenScale((v18 - *(double *)&v39) * 0.5);
    v20 = [(SBUIPasscodeEntryField *)v5 _textField];
    objc_msgSend(v20, "setFrame:", v19, 0.0, v39);
    [v20 setTextAlignment:1];
    [v20 setAutoresizingMask:5];
    [v20 setText:0];
    id v21 = objc_alloc(MEMORY[0x1E4F42B38]);
    [v20 frame];
    uint64_t v22 = objc_msgSend(v21, "initWithFrame:");
    promptLabel = v5->_promptLabel;
    v5->_promptLabel = (UILabel *)v22;

    [(UILabel *)v5->_promptLabel setAutoresizingMask:5];
    v24 = v5->_promptLabel;
    v25 = [MEMORY[0x1E4F42A30] systemFontOfSize:18.0];
    [(UILabel *)v24 setFont:v25];

    [(UILabel *)v5->_promptLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v5->_promptLabel setMinimumScaleFactor:0.555555556];
    v26 = v5->_promptLabel;
    [v20 bounds];
    [(UILabel *)v26 setPreferredMaxLayoutWidth:v27];
    [(UILabel *)v5->_promptLabel setLineBreakMode:4];
    v28 = v5->_promptLabel;
    v29 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v28 setBackgroundColor:v29];

    v30 = v5->_promptLabel;
    if (a3) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    v31 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    [(UILabel *)v30 setTextColor:v31];

    [(UILabel *)v5->_promptLabel setTextAlignment:1];
    id v32 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBUILongNumericPasscodeEntryField *)v5 bounds];
    uint64_t v33 = objc_msgSend(v32, "initWithFrame:");
    springViewParent = v5->_springViewParent;
    v5->_springViewParent = (UIView *)v33;

    id v35 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBUILongNumericPasscodeEntryField *)v5 bounds];
    uint64_t v36 = objc_msgSend(v35, "initWithFrame:");
    springView = v5->_springView;
    v5->_springView = (UIView *)v36;

    [(UIView *)v5->_springView setAutoresizingMask:2];
    [(UIView *)v5->_springViewParent setAutoresizingMask:2];
    [(SBUILongNumericPasscodeEntryField *)v5 addSubview:v5->_springViewParent];
    [(UIView *)v5->_springViewParent addSubview:v5->_springView];
    [(UIView *)v5->_springView addSubview:v20];
    [(UIView *)v5->_springView addSubview:v5->_okButton];
    [(UIView *)v5->_springView addSubview:v5->_promptLabel];
    [(SBUILongNumericPasscodeEntryField *)v5 setShowsOkButton:1];
    [(SBUILongNumericPasscodeEntryField *)v5 setShowsOkButton:0];
    [(SBUILongNumericPasscodeEntryField *)v5 setShowsPromptLabel:1];
    [(SBUILongNumericPasscodeEntryField *)v5 setShowsPromptLabel:0];
  }
  return v5;
}

- (void)setShowsOkButton:(BOOL)a3
{
  if (self->_showsOkButton != a3)
  {
    self->_showsOkButton = a3;
    okButton = self->_okButton;
    double v4 = 0.0;
    if (a3) {
      double v4 = 1.0;
    }
    [(SBUIButton *)okButton setAlpha:v4];
  }
}

- (void)setShowsPromptLabel:(BOOL)a3
{
  if (self->_showsPromptLabel != a3)
  {
    BOOL v3 = a3;
    self->_showsPromptLabel = a3;
    v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    int v7 = v6 & 0xFFFFFFFB;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      int v7 = (unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 5) < 0xFFFFFFFFFFFFFFFELL;
    }
    promptLabel = self->_promptLabel;
    double v9 = 0.0;
    if ((v3 & v7) != 0) {
      double v9 = 1.0;
    }
    [(UILabel *)promptLabel setAlpha:v9];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)SBUILongNumericPasscodeEntryField;
  BOOL result = [(SBUIPasscodeEntryField *)&v4 becomeFirstResponder];
  self->_firstResponder = result;
  return result;
}

- (BOOL)isFirstResponder
{
  return self->_firstResponder;
}

- (BOOL)canResignFirstResponder
{
  return self->_firstResponder;
}

- (BOOL)resignFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)SBUILongNumericPasscodeEntryField;
  BOOL v3 = [(SBUINumericPasscodeEntryFieldBase *)&v6 resignFirstResponder];
  if (self->_firstResponder && v3) {
    self->_firstResponder = 0;
  }
  return v3;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SBUILongNumericPasscodeEntryField;
  [(SBUILongNumericPasscodeEntryField *)&v16 layoutSubviews];
  BOOL v3 = [(SBUIPasscodeEntryField *)self _textField];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  double MinX = CGRectGetMinX(v17);
  long long v15 = *MEMORY[0x1E4F1DB30];
  [(SBUILongNumericPasscodeEntryField *)self _getPasscodeFieldSize:0 okButtonSize:&v15];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    double v13 = *(double *)&v15;
    double v14 = MinX + 100.0 + -100.0 - *(double *)&v15 + -16.0;
  }
  else
  {
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    double v14 = CGRectGetMaxX(v18) + 16.0;
    double v13 = *(double *)&v15;
  }
  -[SBUIButton setFrame:](self->_okButton, "setFrame:", v14, 0.0, v13, *((double *)&v15 + 1));
  [(UIView *)self->_springView bringSubviewToFront:self->_okButton];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self->_showsOkButton
    && (okButton = self->_okButton,
        -[SBUILongNumericPasscodeEntryField convertPoint:toView:](self, "convertPoint:toView:", okButton, x, y),
        -[SBUIButton pointInside:withEvent:](okButton, "pointInside:withEvent:", v7)))
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBUILongNumericPasscodeEntryField;
    BOOL v9 = -[SBUILongNumericPasscodeEntryField pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self->_showsOkButton
    && (okButton = self->_okButton,
        -[SBUILongNumericPasscodeEntryField convertPoint:toView:](self, "convertPoint:toView:", okButton, x, y),
        -[SBUIButton hitTest:withEvent:](okButton, "hitTest:withEvent:", v7),
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    double v10 = self->_okButton;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBUILongNumericPasscodeEntryField;
    -[SBUILongNumericPasscodeEntryField hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    double v10 = (SBUIButton *)objc_claimAutoreleasedReturnValue();
  }
  objc_super v11 = v10;

  return v11;
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4 = a3;
  CGFloat v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (![v4 _hidEvent])
  {
    [v5 _isKeyDown];
LABEL_9:
    v9.receiver = self;
    v9.super_class = (Class)SBUILongNumericPasscodeEntryField;
    [(SBUILongNumericPasscodeEntryField *)&v9 _handleKeyUIEvent:v5];
    goto LABEL_10;
  }
  double v6 = BKSHIDEventGetBaseAttributes();
  int v7 = [v6 source];

  if (![v5 _isKeyDown] || (v7 & 0xFFFFFFFD) != 1) {
    goto LABEL_9;
  }
  double v8 = [v5 _modifiedInput];
  if (([v8 isEqualToString:@"\r"] & 1) == 0
    && ![v8 isEqualToString:@"\n"])
  {
    if ([v8 isEqualToString:@"\b"]) {
      [(SBUIPasscodeEntryField *)self deleteLastCharacter];
    }
    else {
      [(SBUIPasscodeEntryField *)self appendString:v8];
    }

    goto LABEL_9;
  }
  [(SBUILongNumericPasscodeEntryField *)self _okButtonHit];

LABEL_10:
}

+ (BOOL)_shouldResetAutoAcceptWhenMaxNumbersMetInResignFirstResponder
{
  return 0;
}

+ (BOOL)_usesTextFieldForFirstResponder
{
  return 0;
}

- (void)_okButtonHit
{
  if (self->_showsOkButton) {
    [(SBUIPasscodeEntryField *)self notePasscodeFieldDidAcceptEntry];
  }
}

- (void)_getPasscodeFieldSize:(CGSize *)a3 okButtonSize:(CGSize *)a4
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_3:
      double v7 = 14.0;
      double v8 = 41.0;
      double v9 = 137.0;
      double v10 = 169.0;
      uint64_t v11 = 0x4046000000000000;
      goto LABEL_12;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (v13 == 1) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  if ((unint64_t)(v14 - 1) >= 2) {
    double v8 = 28.0;
  }
  else {
    double v8 = 38.0;
  }
  if ((unint64_t)(v14 - 1) >= 2) {
    double v9 = 128.0;
  }
  else {
    double v9 = 123.0;
  }
  double v7 = 10.0;
  double v10 = 150.0;
  uint64_t v11 = 0x4044000000000000;
LABEL_12:
  double v15 = *(double *)&v11;
  okButton = self->_okButton;
  [(SBUIButton *)okButton frame];
  -[SBUIButton sizeThatFits:](okButton, "sizeThatFits:", v17, v18);
  double v20 = v7 + v19;
  if (v15 >= v20) {
    double v20 = v15;
  }
  double v21 = v20 - v15;
  double v22 = v10 - v9 - (v20 - v15);
  double v23 = -0.0;
  if (v22 < 0.0) {
    double v23 = v10 - v9 - (v20 - v15);
  }
  if (a3)
  {
    if (v22 < 0.0) {
      double v21 = v10 - v9;
    }
    a3->width = v10 - v21;
    a3->height = v8;
  }
  if (a4)
  {
    a4->width = v20 + v23;
    a4->height = v8;
  }
}

- (CGSize)_viewSize
{
  long long v8 = *MEMORY[0x1E4F1DB30];
  [(SBUILongNumericPasscodeEntryField *)self _getPasscodeFieldSize:&v8 okButtonSize:0];
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v5 = *((double *)&v8 + 1);

  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(SBUIPasscodeEntryField *)self _textField];
  double v6 = [MEMORY[0x1E4F28E78] stringWithString:@"000000000"];
  [v5 setText:v6];
  [v5 bounds];
  objc_msgSend(v5, "textRectForBounds:");
  double v8 = v7;
  while (1)
  {
    double v9 = [v5 defaultTextAttributes];
    [v6 sizeWithAttributes:v9];
    double v11 = v10;

    if (v11 <= v8) {
      break;
    }
    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
    [v5 setText:v6];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBUILongNumericPasscodeEntryField;
  [(SBUIPasscodeEntryField *)&v12 _autofillForBiometricAuthenticationWithCompletion:v4];
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
  objc_super v12 = NSNumber;
  uint64_t v13 = [(UIView *)self->_springView layer];
  [v13 position];
  double v15 = v14 + 75.0;
  *(float *)&double v15 = v15;
  objc_super v16 = [v12 numberWithFloat:v15];
  [v5 setFromValue:v16];

  double v17 = [(UIView *)self->_springView layer];
  [v17 addAnimation:v5 forKey:@"shake"];

  double v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.x"];
  LODWORD(v19) = 1054276898;
  LODWORD(v20) = 1058305108;
  LODWORD(v21) = 1.0;
  double v22 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v19 :0.0 :v20 :v21];
  [v18 setTimingFunction:v22];

  [v18 setDuration:0.100000001];
  [v18 setFillMode:v11];
  double v23 = NSNumber;
  v24 = [(UIView *)self->_springViewParent layer];
  [v24 position];
  double v26 = v25 + -75.0;
  *(float *)&double v26 = v26;
  double v27 = [v23 numberWithFloat:v26];
  [v18 setFromValue:v27];

  v28 = [(UIView *)self->_springViewParent layer];
  [v28 addAnimation:v18 forKey:@"force-off-center"];

  v29.receiver = self;
  v29.super_class = (Class)SBUILongNumericPasscodeEntryField;
  [(SBUIPasscodeEntryField *)&v29 _resetForFailedPasscode:v3];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 0;
}

- (UIButton)okButton
{
  return &self->_okButton->super;
}

- (BOOL)showsOkButton
{
  return self->_showsOkButton;
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (BOOL)showsPromptLabel
{
  return self->_showsPromptLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springViewParent, 0);
  objc_storeStrong((id *)&self->_springView, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
}

@end