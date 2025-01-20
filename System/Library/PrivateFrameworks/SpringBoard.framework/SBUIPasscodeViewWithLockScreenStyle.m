@interface SBUIPasscodeViewWithLockScreenStyle
- (SBUIPasscodeLockView)passcodeView;
- (SBUIPasscodeViewWithLockScreenStyle)initWithFrame:(CGRect)a3 includeBlur:(BOOL)a4 passcodeViewGenerator:(id)a5;
- (void)layoutSubviews;
- (void)setBlurEnabled:(BOOL)a3;
@end

@implementation SBUIPasscodeViewWithLockScreenStyle

- (SBUIPasscodeViewWithLockScreenStyle)initWithFrame:(CGRect)a3 includeBlur:(BOOL)a4 passcodeViewGenerator:(id)a5
{
  BOOL v5 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11 = (void (**)(void))a5;
  v27.receiver = self;
  v27.super_class = (Class)SBUIPasscodeViewWithLockScreenStyle;
  v12 = -[SBUIPasscodeViewWithLockScreenStyle initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    if (v5)
    {
      id v13 = objc_alloc(MEMORY[0x1E4FA7998]);
      [(SBUIPasscodeViewWithLockScreenStyle *)v12 bounds];
      uint64_t v14 = objc_msgSend(v13, "initWithFrame:");
      backgroundView = v12->_backgroundView;
      v12->_backgroundView = (SBUIBackgroundView *)v14;

      [(SBUIBackgroundView *)v12->_backgroundView setAutoresizingMask:18];
      [(SBUIBackgroundView *)v12->_backgroundView setBackgroundStyle:3];
      [(SBUIPasscodeViewWithLockScreenStyle *)v12 addSubview:v12->_backgroundView];
      [(SBUIPasscodeViewWithLockScreenStyle *)v12 sendSubviewToBack:v12->_backgroundView];
    }
    v16 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:2030];
    v17 = [v16 combinedTintColor];

    uint64_t v18 = v11[2](v11);
    passcodeView = v12->_passcodeView;
    v12->_passcodeView = (SBUIPasscodeLockView *)v18;

    v20 = v12->_passcodeView;
    [v17 alphaComponent];
    v21 = objc_msgSend(v17, "colorWithAlphaComponent:");
    [(SBUIPasscodeLockView *)v20 setCustomBackgroundColor:v21];

    [(SBUIPasscodeLockView *)v12->_passcodeView setShowsEmergencyCallButton:0];
    [(SBUIPasscodeViewWithLockScreenStyle *)v12 addSubview:v12->_passcodeView];
    id v22 = objc_alloc(MEMORY[0x1E4FA5EA8]);
    v23 = [(SBUIBackgroundView *)v12->_backgroundView backdropView];
    v24 = (void *)[v22 initWithBackdropView:v23];

    [(SBUIPasscodeLockView *)v12->_passcodeView setBackgroundLegibilitySettingsProvider:v24];
    v25 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBUIPasscodeViewWithLockScreenStyle *)v12 setBackgroundColor:v25];
  }
  return v12;
}

- (void)layoutSubviews
{
  [(SBUIPasscodeViewWithLockScreenStyle *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SBUIPasscodeLockView setFrame:](self->_passcodeView, "setFrame:");
  backgroundView = self->_backgroundView;
  -[SBUIBackgroundView setFrame:](backgroundView, "setFrame:", v4, v6, v8, v10);
}

- (void)setBlurEnabled:(BOOL)a3
{
  backgroundView = self->_backgroundView;
  if (a3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [(SBUIBackgroundView *)backgroundView setBackgroundStyle:v4];
}

- (SBUIPasscodeLockView)passcodeView
{
  return self->_passcodeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
}

@end