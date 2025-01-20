@interface SBUIPasscodeLockViewInstallTonightLongNumericKeypad
- (SBUIPasscodeLockViewInstallTonightLongNumericKeypad)initWithLightStyle:(BOOL)a3;
- (void)_actionButtonHit;
- (void)_configureActionButton;
- (void)_layoutActionButton;
- (void)_layoutStatusView;
- (void)_setShowsCancelButton:(BOOL)a3 fromEmergencyCallButton:(BOOL)a4;
- (void)_setShowsEmergencyCallButton:(BOOL)a3 fromCancelButton:(BOOL)a4;
- (void)_sizeLabel:(id)a3;
- (void)passcodeEntryFieldTextDidChange:(id)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsEmergencyCallButton:(BOOL)a3;
@end

@implementation SBUIPasscodeLockViewInstallTonightLongNumericKeypad

- (SBUIPasscodeLockViewInstallTonightLongNumericKeypad)initWithLightStyle:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
  v4 = -[SBUIPasscodeLockViewLongNumericKeypad initWithLightStyle:](&v15, sel_initWithLightStyle_);
  if (v4)
  {
    uint64_t v5 = +[SBUIButton buttonWithType:1];
    actionButton = v4->_actionButton;
    v4->_actionButton = (SBUIButton *)v5;

    [(SBUIButton *)v4->_actionButton setUserInteractionEnabled:1];
    [(SBUIButton *)v4->_actionButton setClipsToBounds:1];
    v7 = v4->_actionButton;
    v8 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBUIButton *)v7 setBackgroundColor:v8];

    v9 = v4->_actionButton;
    if (a3) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    v10 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    [(SBUIButton *)v9 setTitleColor:v10 forState:0];

    [(SBUIButton *)v4->_actionButton addTarget:v4 action:sel__actionButtonHit forControlEvents:64];
    [(SBUIButton *)v4->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(SBUIButton *)v4->_actionButton titleLabel];
    v12 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0];
    [v11 setFont:v12];

    [v11 setLineBreakMode:5];
    [v11 setAdjustsFontSizeToFitWidth:1];
    [v11 setMinimumScaleFactor:2.0];
    v13 = [(SBUIPasscodeLockViewBase *)v4 passcodeAuthenticationView];
    [v13 addSubview:v4->_actionButton];

    [(SBUIPasscodeLockViewInstallTonightLongNumericKeypad *)v4 setShowsCancelButton:1];
  }
  return v4;
}

- (void)_layoutStatusView
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
  [(SBUIPasscodeLockViewWithKeypad *)&v3 _layoutStatusView];
  [(SBUIPasscodeLockViewInstallTonightLongNumericKeypad *)self _layoutActionButton];
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
}

- (void)_setShowsEmergencyCallButton:(BOOL)a3 fromCancelButton:(BOOL)a4
{
  LODWORD(v5) = a3;
  v7 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  if ([v7 deviceClass]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v5;
  }

  v8.receiver = self;
  v8.super_class = (Class)SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
  [(SBUIPasscodeLockViewWithKeypad *)&v8 setShowsEmergencyCallButton:v5];
  if (!a4) {
    [(SBUIPasscodeLockViewInstallTonightLongNumericKeypad *)self _setShowsCancelButton:v5 ^ 1 fromEmergencyCallButton:1];
  }
  [(SBUIPasscodeLockViewInstallTonightLongNumericKeypad *)self _configureActionButton];
}

- (void)setShowsCancelButton:(BOOL)a3
{
}

- (void)_setShowsCancelButton:(BOOL)a3 fromEmergencyCallButton:(BOOL)a4
{
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
  -[SBUIPasscodeLockViewWithKeypad setShowsCancelButton:](&v8, sel_setShowsCancelButton_);
  v7 = [(SBUIPasscodeLockViewWithKeypad *)self _numberPad];
  [v7 setShowsCancelButton:0];

  if (!a4) {
    [(SBUIPasscodeLockViewInstallTonightLongNumericKeypad *)self _setShowsEmergencyCallButton:!v5 fromCancelButton:1];
  }
  [(SBUIPasscodeLockViewInstallTonightLongNumericKeypad *)self _configureActionButton];
}

- (void)passcodeEntryFieldTextDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 stringValue];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [(SBUIButton *)self->_actionButton setHidden:1];
    v7 = [(SBUIPasscodeLockViewWithKeypad *)self _numberPad];
    objc_super v8 = v7;
    uint64_t v9 = 1;
  }
  else
  {
    [(SBUIButton *)self->_actionButton setHidden:[(SBUIPasscodeLockViewBase *)self showsCancelButton] ^ 1];
    v7 = [(SBUIPasscodeLockViewWithKeypad *)self _numberPad];
    objc_super v8 = v7;
    uint64_t v9 = 0;
  }
  [v7 setShowsBackspaceButton:v9];

  [v4 setShowsOkButton:v6 != 0];
  uint64_t v10 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v10)
  {
    v11 = (void *)v10;
    if (objc_opt_respondsToSelector()) {
      [v11 passcodeLockViewPasscodeDidChange:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)_configureActionButton
{
  BOOL v3 = [(SBUIPasscodeLockViewBase *)self showsCancelButton];
  actionButton = self->_actionButton;
  if (v3)
  {
    BOOL v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"SOFTWARE_UPDATE_PASSCODE_REMIND_LATER" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
    [(SBUIButton *)actionButton setTitle:v6 forState:0];

    v7 = self->_actionButton;
    uint64_t v8 = 0;
  }
  else
  {
    v7 = self->_actionButton;
    uint64_t v8 = 1;
  }
  [(SBUIButton *)v7 setHidden:v8];
  id v9 = [(SBUIPasscodeLockViewBase *)self _entryField];
  [(SBUIPasscodeLockViewInstallTonightLongNumericKeypad *)self passcodeEntryFieldTextDidChange:v9];
}

- (void)_sizeLabel:(id)a3
{
  id v5 = a3;
  [v5 setLineBreakMode:0];
  [v5 setNumberOfLines:0];
  [(SBUIPasscodeLockViewInstallTonightLongNumericKeypad *)self bounds];
  CGFloat v4 = CGRectGetWidth(v7) + -40.0;
  [v5 frame];
  objc_msgSend(v5, "setFrame:");
  [v5 setPreferredMaxLayoutWidth:v4];
  [v5 sizeToFit];
}

- (void)_layoutActionButton
{
  BOOL v3 = [(SBUIButton *)self->_actionButton titleLabel];
  [(SBUIPasscodeLockViewInstallTonightLongNumericKeypad *)self _sizeLabel:v3];

  [(SBUIButton *)self->_actionButton sizeToFit];
  id v13 = [(SBUIPasscodeLockViewWithKeypad *)self _numberPad];
  CGFloat v4 = [(SBUIButton *)self->_actionButton centerXAnchor];
  id v5 = [v13 centerXAnchor];
  uint64_t v6 = [v4 constraintEqualToAnchor:v5];
  [v6 setActive:1];

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      CGRect v7 = [v13 backspaceButton];
      uint64_t v8 = [(SBUIButton *)self->_actionButton firstBaselineAnchor];
      id v9 = [v7 firstBaselineAnchor];
      uint64_t v10 = [v8 constraintEqualToAnchor:v9];
      [v10 setActive:1];

      goto LABEL_6;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 != 1) {
      goto LABEL_3;
    }
  }
  CGRect v7 = [(SBUIButton *)self->_actionButton topAnchor];
  uint64_t v8 = [v13 bottomAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];
LABEL_6:
}

- (void)_actionButtonHit
{
  id v3 = [(SBUIPasscodeLockViewBase *)self delegate];
  if ([(SBUIPasscodeLockViewBase *)self showsCancelButton]
    && v3
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v3 passcodeLockViewCancelButtonPressed:self];
  }
}

- (void).cxx_destruct
{
}

@end