@interface DevicePINPane
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isSecureTextEntry;
- (BOOL)numericKeyboard;
- (BOOL)requiresKeyboard;
- (BOOL)resignFirstResponder;
- (BOOL)simplePIN;
- (DevicePINKeypadContainerView)keypadContainerView;
- (DevicePINPane)initWithFrame:(CGRect)a3;
- (NSString)passcodeOptionsTitle;
- (PINEntryView)pinView;
- (id)passcodeOptionsHandler;
- (id)password;
- (id)specifierLabel;
- (id)text;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (unsigned)PINLength;
- (void)_setKeypadState:(BOOL)a3 animated:(BOOL)a4;
- (void)_setPlaysKeyboardClicks:(BOOL)a3;
- (void)activateKeypadView;
- (void)clearPassword;
- (void)deactivateKeypadView;
- (void)dealloc;
- (void)delayForTextEntryAnimationsWithCompletion:(id)a3;
- (void)deleteBackward;
- (void)dismissKeypad;
- (void)hideError;
- (void)hideFailedAttempts;
- (void)insertText:(id)a3;
- (void)layoutSubviews;
- (void)okButtonPressed;
- (void)pinView:(id)a3 pinEntered:(id)a4;
- (void)pinView:(id)a3 pinValueChanged:(id)a4;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setKeyboardIsNumeric:(BOOL)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setKeyboardUserInteractionEnabled:(BOOL)a3;
- (void)setKeypadContainerView:(id)a3;
- (void)setNumericKeyboard:(BOOL)a3;
- (void)setPINLength:(unsigned int)a3;
- (void)setPINPolicyString:(id)a3 visible:(BOOL)a4;
- (void)setPasscodeOptionsHandler:(id)a3;
- (void)setPasscodeOptionsTitle:(id)a3;
- (void)setPinView:(id)a3;
- (void)setSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4;
- (void)setSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5;
- (void)setSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 showsOptions:(BOOL)a6;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
- (void)showError:(id)a3 error:(id)a4 isBlocked:(BOOL)a5 animate:(BOOL)a6;
- (void)showFailedAttempts:(int64_t)a3;
- (void)slideToNewPasscodeField:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5;
- (void)slideToNewPasscodeField:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 transition:(int)a6 showsOptionsButton:(BOOL)a7;
- (void)slideToNewPasscodeField:(BOOL)a3 withKeyboard:(BOOL)a4;
- (void)transitionToSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 showsOptions:(BOOL)a6;
- (void)transitionViewDidComplete:(id)a3;
@end

@implementation DevicePINPane

- (id)specifierLabel
{
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  v3 = [WeakRetained pinInstructionsPrompt];

  return v3;
}

- (void)_setPlaysKeyboardClicks:(BOOL)a3
{
  BOOL inPropertyData = a3;
  int inSpecifier = 1104;
  AudioServicesSetProperty(0x61637421u, 4u, &inSpecifier, 4u, &inPropertyData);
}

- (DevicePINPane)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)DevicePINPane;
  v7 = -[PSEditingPane initWithFrame:](&v16, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(DevicePINPane *)v7 setAutocapitalizationType:0];
    uint64_t v9 = 1;
    [(DevicePINPane *)v8 setAutocorrectionType:1];
    [(DevicePINPane *)v8 setAutoresizingMask:0];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FD8]), "initWithFrame:", x, y, width, height);
    transitionView = v8->_transitionView;
    v8->_transitionView = (UITransitionView *)v10;

    [(DevicePINPane *)v8 addSubview:v8->_transitionView];
    [(DevicePINPane *)v8 setAutoresizingMask:18];
    [(UITransitionView *)v8->_transitionView setAutoresizingMask:18];
    v12 = (void *)CFPreferencesCopyValue(@"keyboard", @"com.apple.preferences.sounds", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    v13 = v12;
    if (v12)
    {
      uint64_t v9 = [v12 BOOLValue];
      v8->_playSound = v9;
    }
    else
    {
      v8->_playSound = 1;
    }
    [(DevicePINPane *)v8 _setPlaysKeyboardClicks:v9];
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v8 selector:sel_keyboardWillChangeFrame_ name:*MEMORY[0x1E4F43B70] object:0];
  }
  return v8;
}

- (void)dealloc
{
  [(PINEntryView *)self->_pinView setDelegate:0];
  [(DevicePINPane *)self _setPlaysKeyboardClicks:0];
  [(DevicePINPane *)self dismissKeypad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DevicePINPane;
  [(DevicePINPane *)&v4 dealloc];
}

- (void)setKeyboardIsNumeric:(BOOL)a3
{
  if (self->_numericKeyboard != a3)
  {
    BOOL v3 = a3;
    self->_numericKeyboard = a3;
    v5 = +[PSListController appearance];
    unsigned int v6 = [v5 usesDarkTheme];

    uint64_t v7 = v6;
    if (v3)
    {
      uint64_t v8 = 127;
      if (PSUsePadStylePIN()) {
        uint64_t v7 = 127;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    [(DevicePINPane *)self setKeyboardType:v8];
    [(DevicePINPane *)self setKeyboardAppearance:v7];
    if ([(DevicePINPane *)self requiresKeyboard])
    {
      uint64_t v9 = [(DevicePINPane *)self pinView];
      [v9 setTextFieldKeyboardType:v8];

      id v10 = [(DevicePINPane *)self pinView];
      [v10 setTextFieldKeyboardAppearance:v7];
    }
  }
}

- (void)activateKeypadView
{
  if (!self->_keypadActive)
  {
    if (!self->_keypadContainerView)
    {
      BOOL v3 = objc_alloc_init(DevicePINKeypad);
      keypad = self->_keypad;
      self->_keypad = &v3->super;
      v5 = v3;

      unsigned int v6 = [[DevicePINKeypadContainerView alloc] initWithKeypad:v5];
      keypadContainerView = self->_keypadContainerView;
      self->_keypadContainerView = v6;
    }
    [(UIKeyboard *)self->_keypad activate];
    [(PINEntryView *)self->_pinView setBlocked:1];
    self->_keypadActive = 1;
    uint64_t v8 = [(DevicePINKeypadContainerView *)self->_keypadContainerView superview];

    if (!v8)
    {
      uint64_t v9 = self->_keypadContainerView;
      [(DevicePINPane *)self addSubview:v9];
    }
  }
}

- (void)deactivateKeypadView
{
  if (self->_keypadActive)
  {
    [(PINEntryView *)self->_pinView setBlocked:0];
    [(UIKeyboard *)self->_keypad deactivate];
    self->_keypadActive = 0;
  }
}

- (void)showFailedAttempts:(int64_t)a3
{
}

- (void)hideFailedAttempts
{
}

- (void)transitionToSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 showsOptions:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  pinView = self->_pinView;
  if (pinView)
  {
    [(PINEntryView *)pinView setDelegate:0];
    [(PINEntryView *)self->_pinView removeFromSuperview];
    v12 = self->_pinView;
    self->_pinView = 0;
  }
  self->_simplePIN = a3;
  *((unsigned char *)&self->super + 424) = *((unsigned char *)&self->super + 424) & 0xFE | a4;
  if (self->_simplePIN)
  {
    v13 = [PSBulletedPINView alloc];
    uint64_t v14 = [(DevicePINPane *)self PINLength];
    v18 = -[PSBulletedPINView initWithFrame:numberOfFields:](v13, "initWithFrame:numberOfFields:", v14, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v18 = objc_alloc_init(PSTextFieldPINView);
  [(PSTextFieldPINView *)v18 setUsesNumericKeyboard:v7];
  if (v6)
  {
LABEL_5:
    v15 = [(DevicePINPane *)self passcodeOptionsTitle];
    [(PINView *)v18 setOptionsButtonTitle:v15];

    objc_super v16 = [(DevicePINPane *)self passcodeOptionsHandler];
    [(PINView *)v18 setPasscodeOptionsHandler:v16];
  }
LABEL_6:
  [(DevicePINPane *)self setPinView:v18];
  v17 = [(DevicePINPane *)self specifierLabel];
  [(DevicePINPane *)self setTitle:v17];

  [(DevicePINPane *)self setKeyboardIsNumeric:v7];
  [(DevicePINPane *)self _setKeypadState:(*((unsigned char *)&self->super + 424) & 1) == 0 animated:1];
  [(PINEntryView *)self->_pinView setDelegate:self];
  [(UITransitionView *)self->_transitionView addSubview:self->_pinView];
  [(DevicePINPane *)self setNeedsLayout];
}

- (void)setSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4
{
}

- (void)setSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5
{
}

- (void)setSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 showsOptions:(BOOL)a6
{
  if (!self->_pinView) {
    [(DevicePINPane *)self transitionToSimplePIN:a3 requiresKeyboard:a4 numericOnly:a5 showsOptions:a6];
  }
}

- (BOOL)simplePIN
{
  return self->_simplePIN;
}

- (BOOL)requiresKeyboard
{
  return *((unsigned char *)&self->super + 424) & 1;
}

- (void)_setKeypadState:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3)
  {
    [(DevicePINPane *)self activateKeypadView];
    if (UIKeyboardAutomaticIsOnScreen())
    {
      if (v4) {
        UIKeyboardOrderOutAutomatic();
      }
      else {
        UIKeyboardOrderOutAutomaticSkippingAnimation();
      }
    }
  }
  uint64_t v23 = 0;
  v24 = (double *)&v23;
  uint64_t v25 = 0x4010000000;
  v26 = "";
  long long v27 = 0u;
  long long v28 = 0u;
  [(DevicePINKeypadContainerView *)self->_keypadContainerView frame];
  *(void *)&long long v27 = v7;
  *((void *)&v27 + 1) = v8;
  *(void *)&long long v28 = v9;
  *((void *)&v28 + 1) = v10;
  if ((PSUsePadStylePIN() & 1) != 0 || !self->_keypadActive)
  {
    if (v5) {
      goto LABEL_25;
    }
  }
  else
  {
    if (v5)
    {
      double v11 = v24[4];
      v24[5] = v24[5] - v24[7];
      [(DevicePINKeypadContainerView *)self->_keypadContainerView setFrame:v11];
      objc_initWeak(&location, self);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __42__DevicePINPane__setKeypadState_animated___block_invoke;
      v20[3] = &unk_1E5C5E530;
      objc_copyWeak(&v21, &location);
      v20[4] = &v23;
      uint64_t v12 = MEMORY[0x1AD0BE2A0](v20);
      v13 = (void *)v12;
      if (v4)
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F42FF0];
        [MEMORY[0x1E4F42FD8] defaultDurationForTransition:7];
        objc_msgSend(v14, "animateWithDuration:animations:", v13);
      }
      else
      {
        (*(void (**)(uint64_t))(v12 + 16))(v12);
      }

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      goto LABEL_25;
    }
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__DevicePINPane__setKeypadState_animated___block_invoke_2;
    v18[3] = &unk_1E5C5E530;
    objc_copyWeak(&v19, &location);
    v18[4] = &v23;
    uint64_t v15 = MEMORY[0x1AD0BE2A0](v18);
    objc_super v16 = (void *)v15;
    if (v4)
    {
      v17 = (void *)MEMORY[0x1E4F42FF0];
      [MEMORY[0x1E4F42FD8] defaultDurationForTransition:7];
      objc_msgSend(v17, "animateWithDuration:animations:", v16);
    }
    else
    {
      (*(void (**)(uint64_t))(v15 + 16))(v15);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  if (UIKeyboardAutomaticIsOffScreen())
  {
    if (v4) {
      UIKeyboardOrderInAutomatic();
    }
    else {
      UIKeyboardOrderInAutomaticSkippingAnimation();
    }
  }
  if (self->_keypadActive)
  {
    [(DevicePINPane *)self dismissKeypad];
    [(DevicePINPane *)self setNeedsLayout];
  }
LABEL_25:
  _Block_object_dispose(&v23, 8);
}

void __42__DevicePINPane__setKeypadState_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 56)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 40);
  objc_msgSend(WeakRetained[66], "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
}

void __42__DevicePINPane__setKeypadState_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 56)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 40);
  objc_msgSend(WeakRetained[66], "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
}

- (void)dismissKeypad
{
  [(DevicePINPane *)self deactivateKeypadView];
  keypadContainerView = self->_keypadContainerView;
  if (keypadContainerView)
  {
    [(DevicePINKeypadContainerView *)keypadContainerView removeFromSuperview];
    BOOL v4 = self->_keypadContainerView;
    self->_keypadContainerView = 0;

    keypad = self->_keypad;
    self->_keypad = 0;
  }
}

- (BOOL)canBecomeFirstResponder
{
  if (*((unsigned char *)&self->super + 424)) {
    return [(PINEntryView *)self->_pinView canBecomeFirstResponder];
  }
  else {
    return self->_keypadActive;
  }
}

- (BOOL)becomeFirstResponder
{
  if (*((unsigned char *)&self->super + 424))
  {
    pinView = self->_pinView;
    return [(PINEntryView *)pinView becomeFirstResponder];
  }
  else
  {
    if (!self->_keypadActive) {
      return 0;
    }
    UIKeyboardDisableAutomaticAppearance();
    v6.receiver = self;
    v6.super_class = (Class)DevicePINPane;
    BOOL v3 = [(DevicePINPane *)&v6 becomeFirstResponder];
    if (!v3) {
      UIKeyboardEnableAutomaticAppearance();
    }
    [(DevicePINKeypadContainerView *)self->_keypadContainerView setNeedsLayout];
    return v3;
  }
}

- (BOOL)resignFirstResponder
{
  [(DevicePINPane *)self setKeyboardUserInteractionEnabled:1];
  if ([(DevicePINPane *)self isFirstResponder])
  {
    v5.receiver = self;
    v5.super_class = (Class)DevicePINPane;
    if ([(DevicePINPane *)&v5 resignFirstResponder])
    {
      UIKeyboardEnableAutomaticAppearance();
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    char v3 = [(PINEntryView *)self->_pinView resignFirstResponder];
    if (UIKeyboardAutomaticIsOnScreen()) {
      UIKeyboardOrderOutAutomatic();
    }
  }
  return v3;
}

- (void)setKeyboardUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DevicePINPane *)self requiresKeyboard])
  {
    id v6 = [MEMORY[0x1E4F42B08] activeKeyboard];
    [v6 setUserInteractionEnabled:v3];
  }
  else
  {
    keypad = self->_keypad;
    [(UIKeyboard *)keypad setUserInteractionEnabled:v3];
  }
}

- (void)showError:(id)a3 error:(id)a4 isBlocked:(BOOL)a5 animate:(BOOL)a6
{
  BOOL v6 = a6;
  int v7 = a5;
  id v12 = a3;
  id v10 = a4;
  int isBlocked = self->_isBlocked;
  if (isBlocked != v7)
  {
    self->_int isBlocked = v7;
    [(DevicePINPane *)self setKeyboardUserInteractionEnabled:v7 ^ 1u];
    [(PINEntryView *)self->_pinView setBlocked:self->_isBlocked];
    int isBlocked = self->_isBlocked;
  }
  if (isBlocked) {
    [(PINEntryView *)self->_pinView showError:v10 animate:v6];
  }
  [(PINEntryView *)self->_pinView setStringValue:&stru_1EFB51FD0];
}

- (void)setPINPolicyString:(id)a3 visible:(BOOL)a4
{
  [(PINEntryView *)self->_pinView setPINPolicyString:a3 visible:a4];
  pinView = self->_pinView;
  [(PINEntryView *)pinView setStringValue:&stru_1EFB51FD0];
}

- (void)okButtonPressed
{
}

- (void)hideError
{
}

- (void)setTitle:(id)a3
{
  pinView = self->_pinView;
  p_delegate = &self->super._delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(p_delegate);
  BOOL v6 = [WeakRetained pinInstructionsPromptFont];
  [(PINEntryView *)pinView setTitle:v5 font:v6];
}

- (void)slideToNewPasscodeField:(BOOL)a3 withKeyboard:(BOOL)a4
{
}

- (void)slideToNewPasscodeField:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5
{
}

- (void)slideToNewPasscodeField:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 transition:(int)a6 showsOptionsButton:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a5;
  *((unsigned char *)&self->super + 424) = *((unsigned char *)&self->super + 424) & 0xFE | a4;
  self->_simplePIN = a3;
  id v32 = [(DevicePINPane *)self pinView];
  [v32 getCurrentTitleFontSize];
  double v11 = v10;
  if ([(DevicePINPane *)self requiresKeyboard]) {
    UIKeyboardDisableAutomaticAppearance();
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F42DF8]);
  [(UITransitionView *)self->_transitionView addSubview:v12];
  [v32 frame];
  objc_msgSend(v12, "setFrame:");
  [v12 captureSnapshotOfView:v32 withSnapshotType:1];
  [v32 removeFromSuperview];
  [(DevicePINPane *)self hideFailedAttempts];
  [(DevicePINPane *)self setPINPolicyString:0 visible:0];
  self->_transitioning = 1;
  [(UITransitionView *)self->_transitionView setDelegate:self];
  v13 = [(DevicePINPane *)self pinView];
  [v13 setDelegate:0];

  BOOL v31 = v8;
  if (self->_simplePIN)
  {
    uint64_t v14 = [PSBulletedPINView alloc];
    [v32 frame];
    id v19 = -[PSBulletedPINView initWithFrame:numberOfFields:](v14, "initWithFrame:numberOfFields:", [(DevicePINPane *)self PINLength], v15, v16, v17, v18);
  }
  else
  {
    v20 = [PSTextFieldPINView alloc];
    [v32 frame];
    id v19 = -[PSTextFieldPINView initWithFrame:](v20, "initWithFrame:");
    [(PSBulletedPINView *)v19 setUsesNumericKeyboard:v8];
  }
  [(PINView *)v19 setDelegate:self];
  [(PSBulletedPINView *)v19 setBlocked:(*((unsigned char *)&self->super + 424) & 1) == 0];
  id v21 = (void *)MEMORY[0x1E4F42A30];
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  uint64_t v23 = [WeakRetained pinInstructionsPromptFont];
  v24 = [v23 fontDescriptor];
  uint64_t v25 = [v21 fontWithDescriptor:v24 size:v11];

  v26 = [(DevicePINPane *)self specifierLabel];
  [(PINView *)v19 setTitle:v26 font:v25];

  [(PINView *)v19 setShowsOptionsButton:v7];
  if (v7)
  {
    long long v27 = [(DevicePINPane *)self passcodeOptionsTitle];
    [(PINView *)v19 setOptionsButtonTitle:v27];

    long long v28 = [(DevicePINPane *)self passcodeOptionsHandler];
    [(PINView *)v19 setPasscodeOptionsHandler:v28];
  }
  [(PSBulletedPINView *)v19 layoutIfNeeded];
  [(DevicePINPane *)self setPinView:v19];
  [(UITransitionView *)self->_transitionView transition:a6 fromView:v12 toView:v19];
  [(DevicePINPane *)self setKeyboardIsNumeric:v31];
  uint64_t v29 = PSUsePadStylePIN();
  [(DevicePINPane *)self _setKeypadState:(*((unsigned char *)&self->super + 424) & 1) == 0 animated:v29];
  if (v29) {
    [(DevicePINPane *)self becomeFirstResponder];
  }
  [(DevicePINPane *)self setNeedsLayout];
}

- (void)transitionViewDidComplete:(id)a3
{
  self->_transitioning = 0;
  if ([(DevicePINPane *)self requiresKeyboard]) {
    UIKeyboardEnableAutomaticAppearance();
  }
  BOOL v4 = [MEMORY[0x1E4F42948] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isiPhone");

  if (v5)
  {
    [(DevicePINPane *)self becomeFirstResponder];
  }
}

- (id)password
{
  return (id)[(PINEntryView *)self->_pinView stringValue];
}

- (void)clearPassword
{
}

- (id)text
{
  return (id)[(PINEntryView *)self->_pinView stringValue];
}

- (void)setText:(id)a3
{
}

- (BOOL)hasText
{
  v2 = [(PINEntryView *)self->_pinView stringValue];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  if (!self->_isBlocked)
  {
    id v8 = v4;
    int v5 = [(PINEntryView *)self->_pinView stringValue];
    unint64_t v6 = [v5 length];
    if (v6 >= [(DevicePINPane *)self PINLength])
    {
      BOOL simplePIN = self->_simplePIN;

      id v4 = v8;
      if (simplePIN) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    [(PINEntryView *)self->_pinView hideError];
    [(PINEntryView *)self->_pinView appendString:v8];
    id v4 = v8;
  }
LABEL_6:
}

- (void)deleteBackward
{
}

- (void)delayForTextEntryAnimationsWithCompletion:(id)a3
{
  id v4 = a3;
  [(PINEntryView *)self->_pinView recursivelyForceDisplayIfNeeded];
  [MEMORY[0x1E4F39CF8] flush];
  [(DevicePINPane *)self setKeyboardUserInteractionEnabled:0];
  dispatch_time_t v5 = dispatch_time(0, 76000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__DevicePINPane_delayForTextEntryAnimationsWithCompletion___block_invoke;
  v7[3] = &unk_1E5C5ECF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x1E4F14428], v7);
}

uint64_t __59__DevicePINPane_delayForTextEntryAnimationsWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setKeyboardUserInteractionEnabled:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)pinView:(id)a3 pinValueChanged:(id)a4
{
  if (!self->_simplePIN)
  {
    p_delegate = &self->super._delegate;
    id v5 = a4;
    id WeakRetained = objc_loadWeakRetained(p_delegate);
    uint64_t v6 = [v5 length];

    [WeakRetained adjustButtonsForPasswordLength:v6];
  }
}

- (void)pinView:(id)a3 pinEntered:(id)a4
{
  id v5 = a4;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __36__DevicePINPane_pinView_pinEntered___block_invoke;
  id v12 = &unk_1E5C5DDD0;
  v13 = self;
  id v14 = v5;
  id v6 = v5;
  uint64_t v7 = MEMORY[0x1AD0BE2A0](&v9);
  id v8 = (void *)v7;
  if (self->_simplePIN) {
    -[DevicePINPane delayForTextEntryAnimationsWithCompletion:](self, "delayForTextEntryAnimationsWithCompletion:", v7, v9, v10, v11, v12, v13, v14);
  }
  else {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

void __36__DevicePINPane_pinView_pinEntered___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 416));
  [WeakRetained pinEntered:*(void *)(a1 + 40)];
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)DevicePINPane;
  [(DevicePINPane *)&v47 layoutSubviews];
  [(DevicePINPane *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PSEditingPane *)self viewController];
  id v12 = [v11 view];
  v13 = [v12 safeAreaLayoutGuide];
  [v13 layoutFrame];
  double v15 = v14;

  double v16 = v6 + v15;
  double v17 = v10 - v15;
  CGFloat v18 = v4;
  -[UITransitionView setFrame:](self->_transitionView, "setFrame:", v4, v16, v8, v10 - v15);
  [(UITransitionView *)self->_transitionView bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  keypadContainerView = self->_keypadContainerView;
  if (keypadContainerView)
  {
    double v27 = *MEMORY[0x1E4F1DB28];
    -[DevicePINKeypadContainerView sizeThatFits:](keypadContainerView, "sizeThatFits:", v8, v17);
    CGFloat v28 = v16;
    CGFloat v45 = v16;
    double v46 = v21;
    double v30 = v29;
    double v32 = v31;
    v48.origin.double x = v18;
    v48.origin.double y = v28;
    v48.size.double width = v8;
    v48.size.double height = v17;
    CGFloat MaxY = CGRectGetMaxY(v48);
    CGFloat v44 = v8;
    double v34 = v25;
    double v35 = v23;
    double v36 = PSRoundToPixel(MaxY - v32);
    -[DevicePINKeypadContainerView setFrame:](self->_keypadContainerView, "setFrame:", v27, v36, v30, v32);
    v49.origin.double x = v27;
    v49.origin.double y = v36;
    double v23 = v35;
    double v25 = v34;
    v49.size.double width = v30;
    v49.size.double height = v32;
    double v21 = v46;
    double MinY = CGRectGetMinY(v49);
    v50.origin.double x = v18;
    v50.size.double width = v44;
    v50.origin.double y = v45;
    v50.size.double height = v17;
    double v38 = MinY - CGRectGetMinY(v50);
LABEL_3:
    double v39 = PSRoundToPixel(v38);
    goto LABEL_4;
  }
  double v39 = v19;
  if ([(DevicePINPane *)self requiresKeyboard] && (PSUsePadStylePIN() & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1E4F42B08];
    v41 = [MEMORY[0x1E4F42738] sharedApplication];
    objc_msgSend(v40, "sizeForInterfaceOrientation:", objc_msgSend(v41, "statusBarOrientation"));
    double v43 = v42;

    double v38 = v39 - v43;
    goto LABEL_3;
  }
LABEL_4:
  -[PINEntryView setFrame:](self->_pinView, "setFrame:", v21, v23, v25, v39);
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (unsigned)PINLength
{
  return self->_PINLength;
}

- (void)setPINLength:(unsigned int)a3
{
  self->_PINLength = a3;
}

- (PINEntryView)pinView
{
  return self->_pinView;
}

- (void)setPinView:(id)a3
{
}

- (id)passcodeOptionsHandler
{
  return self->_passcodeOptionsHandler;
}

- (void)setPasscodeOptionsHandler:(id)a3
{
}

- (BOOL)numericKeyboard
{
  return self->_numericKeyboard;
}

- (void)setNumericKeyboard:(BOOL)a3
{
  self->_numericKeyboard = a3;
}

- (DevicePINKeypadContainerView)keypadContainerView
{
  return (DevicePINKeypadContainerView *)objc_getProperty(self, a2, 528, 1);
}

- (void)setKeypadContainerView:(id)a3
{
}

- (NSString)passcodeOptionsTitle
{
  return self->_passcodeOptionsTitle;
}

- (void)setPasscodeOptionsTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeOptionsTitle, 0);
  objc_storeStrong((id *)&self->_keypadContainerView, 0);
  objc_storeStrong(&self->_passcodeOptionsHandler, 0);
  objc_storeStrong((id *)&self->_pinView, 0);
  objc_storeStrong((id *)&self->_keypad, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);
}

@end