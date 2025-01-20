@interface SBUIProudLockIconContentView
- (BOOL)setState:(int64_t)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6;
- (SBUIProudLockIconContentView)initWithSecureContent:(BOOL)a3;
- (id)_fileNameForCurrentDevice;
- (id)acquireNonSecureContentAssertionForReason:(id)a3;
- (void)_updateContent;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SBUIProudLockIconContentView

- (SBUIProudLockIconContentView)initWithSecureContent:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SBUIProudLockIconContentView;
  v4 = -[SBUIProudLockIconContentView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_isForSecureContent = a3;
    objc_initWeak(&location, v4);
    v6 = (void *)MEMORY[0x1E4F4F6E8];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __54__SBUIProudLockIconContentView_initWithSecureContent___block_invoke;
    v17 = &unk_1E5CCC630;
    objc_copyWeak(&v18, &location);
    uint64_t v9 = [v6 assertionWithIdentifier:v8 stateDidChangeHandler:&v14];
    nonSecureContentAssertions = v5->_nonSecureContentAssertions;
    v5->_nonSecureContentAssertions = (BSCompoundAssertion *)v9;

    v11 = v5->_nonSecureContentAssertions;
    v12 = SBLogLockScreenBiometricFaceIDCoaching();
    -[BSCompoundAssertion setLog:](v11, "setLog:", v12, v14, v15, v16, v17);

    [(SBUIProudLockIconContentView *)v5 _updateContent];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __54__SBUIProudLockIconContentView_initWithSecureContent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateContent];
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_nonSecureContentAssertions invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBUIProudLockIconContentView;
  [(SBUIProudLockIconContentView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SBUIProudLockIconContentView;
  [(SBUIProudLockIconContentView *)&v11 layoutSubviews];
  [(SBUIProudLockIconContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SBUISecureLockView setFrame:](self->_secureLockView, "setFrame:");
  -[BSUICAPackageView setFrame:](self->_lockView, "setFrame:", v4, v6, v8, v10);
}

- (BOOL)setState:(int64_t)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  BOOL v7 = a4;
  double v10 = (void (**)(id, void))a6;
  self->_desiredState = a3;
  lockView = self->_lockView;
  if (lockView)
  {
    if ((unint64_t)(a3 - 1) > 2) {
      v12 = @"Locked";
    }
    else {
      v12 = off_1E5CCC650[a3 - 1];
    }
    LOBYTE(v7) = [(BSUICAPackageView *)lockView setState:v12 animated:v7 transitionSpeed:v10 completion:a5];
  }
  else
  {
    BOOL v7 = [(SBUISecureLockView *)self->_secureLockView transitionToState:a3];
    if (v10) {
      v10[2](v10, v7);
    }
  }

  return v7;
}

- (id)acquireNonSecureContentAssertionForReason:(id)a3
{
  if (self->_isForSecureContent)
  {
    double v3 = [(BSCompoundAssertion *)self->_nonSecureContentAssertions acquireForReason:a3];
  }
  else
  {
    double v4 = SBLogLockScreenBiometricFaceIDCoaching();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "[Secure Lock Indicator] Cannot return non secure content assertion since we're already rendering non securely", v6, 2u);
    }

    double v3 = 0;
  }
  return v3;
}

- (id)_fileNameForCurrentDevice
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  int v3 = BSFloatEqualToFloat();

  double v4 = @"@3x";
  if (v3) {
    double v4 = @"@2x";
  }
  double v5 = v4;
  double v6 = +[SBUIBiometricResource sharedInstance];
  int v7 = [v6 hasPoseidonSupport];

  double v8 = &stru_1EFCB7578;
  if ((MGGetBoolAnswer() & 1) != 0 || v7)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2) {
        double v8 = @"-120fps";
      }
    }
    else
    {
      double v9 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v9 userInterfaceIdiom] == 1) {
        double v8 = @"-120fps";
      }
    }
  }
  double v10 = v8;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_14:
      objc_super v11 = @"~ipad";
      goto LABEL_27;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (v13 == 1) {
      goto LABEL_14;
    }
  }
  objc_super v11 = &stru_1EFCB7578;
  uint64_t v14 = SBFEffectiveArtworkSubtype();
  if (v14 <= 2795)
  {
    if (v14 != 2556 && v14 != 2622) {
      goto LABEL_23;
    }
LABEL_22:
    objc_super v11 = @"-d73";
    goto LABEL_23;
  }
  if (v14 == 2868 || v14 == 2796) {
    goto LABEL_22;
  }
LABEL_23:
  if (![(__CFString *)v11 length])
  {
    [MEMORY[0x1E4FA5F68] proudLockAssetSize];
    if (BSFloatEqualToFloat()) {
      objc_super v11 = @"-896h";
    }
    else {
      objc_super v11 = @"-812h";
    }
  }
LABEL_27:
  uint64_t v15 = [NSString stringWithFormat:@"lock%@%@%@", v5, v10, v11];

  return v15;
}

- (void)_updateContent
{
  if (self->_isForSecureContent
    && ([(BSCompoundAssertion *)self->_nonSecureContentAssertions isActive] & 1) == 0)
  {
    p_secureLockView = (id *)&self->_secureLockView;
    if (self->_secureLockView)
    {
      double v4 = &OBJC_IVAR___SBUIProudLockIconContentView__lockView;
      goto LABEL_13;
    }
    v12 = [[SBUISecureLockView alloc] initWithType:1];
    id v13 = *p_secureLockView;
    id *p_secureLockView = v12;

    [*p_secureLockView transitionToState:self->_desiredState];
    double v4 = &OBJC_IVAR___SBUIProudLockIconContentView__lockView;
  }
  else
  {
    p_secureLockView = (id *)&self->_lockView;
    if (self->_lockView)
    {
      double v4 = &OBJC_IVAR___SBUIProudLockIconContentView__secureLockView;
      goto LABEL_13;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F4F8A0]);
    double v6 = [(SBUIProudLockIconContentView *)self _fileNameForCurrentDevice];
    int v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v5 initWithPackageName:v6 inBundle:v7];
    id v9 = *p_secureLockView;
    id *p_secureLockView = (id)v8;

    unint64_t v10 = self->_desiredState - 1;
    if (v10 > 2) {
      objc_super v11 = @"Locked";
    }
    else {
      objc_super v11 = off_1E5CCC650[v10];
    }
    [*p_secureLockView setState:v11];
    double v4 = &OBJC_IVAR___SBUIProudLockIconContentView__secureLockView;
  }
  [(SBUIProudLockIconContentView *)self addSubview:*p_secureLockView];
  [(SBUIProudLockIconContentView *)self layoutIfNeeded];
LABEL_13:
  uint64_t v14 = *v4;
  [*(id *)((char *)&self->super.super.super.isa + v14) removeFromSuperview];
  uint64_t v15 = *(Class *)((char *)&self->super.super.super.isa + v14);
  *(Class *)((char *)&self->super.super.super.isa + v14) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonSecureContentAssertions, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong((id *)&self->_secureLockView, 0);
}

@end