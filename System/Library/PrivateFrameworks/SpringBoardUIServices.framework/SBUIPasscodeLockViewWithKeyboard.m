@interface SBUIPasscodeLockViewWithKeyboard
- (BOOL)becomeFirstResponder;
- (BOOL)passcodeEntryField:(id)a3 shouldInsertText:(id)a4;
- (BOOL)passcodeEntryFieldShouldShowSystemKeyboard:(id)a3;
- (BOOL)resignFirstResponder;
- (CGRect)_keyboardFrameForInterfaceOrientation:(int64_t)a3;
- (SBUIPasscodeLockViewWithKeyboard)initWithLightStyle:(BOOL)a3;
- (UILabel)statusField;
- (UILabel)statusSubtitleView;
- (double)_keyboardToEntryFieldOffset;
- (double)_largeTextEmergencyButtonMaxWidth;
- (double)_statusFieldHeightWithWidth:(double)a3;
- (double)_statusTitleWidth;
- (id)_alphanumericPasscodeEntryField;
- (id)_newStatusField;
- (id)_newStatusSubtitleView;
- (id)_statusSubtitleView;
- (id)_statusTitleView;
- (id)_viewForKeyboardTracking;
- (id)passcode;
- (void)_acceptOrCancelReturnKeyPress;
- (void)_hardwareReturnKeyPressed:(id)a3;
- (void)_keyboardDidHideNotification:(id)a3;
- (void)_keyboardWillChangeFrameNotification:(id)a3;
- (void)_keyboardWillShowNotification:(id)a3;
- (void)_layoutForMinimizationState:(BOOL)a3;
- (void)_layoutStatusView;
- (void)_luminanceBoostDidChange;
- (void)_notifyDelegatePasscodeCancelled;
- (void)_notifyDelegatePasscodeEntered;
- (void)_notifyDelegateThatEmergencyCallButtonWasPressed;
- (void)_setKeyboardTracksLockView:(BOOL)a3;
- (void)_toggleForEmergencyCall;
- (void)_toggleForStatusField;
- (void)_updateFont;
- (void)_updateKeyboardHeightOffsetForKeyboardNotification:(id)a3;
- (void)becomeActiveWithAnimationSettings:(id)a3;
- (void)beginTransitionToState:(int64_t)a3;
- (void)dealloc;
- (void)didEndTransitionToState:(int64_t)a3;
- (void)layoutSubviews;
- (void)passcodeEntryFieldDidCancelEntry:(id)a3;
- (void)passcodeEntryFieldTextDidChange:(id)a3;
- (void)resignActiveWithAnimationSettings:(id)a3;
- (void)setShowsEmergencyCallButton:(BOOL)a3;
- (void)setShowsStatusField:(BOOL)a3;
- (void)setStatusField:(id)a3;
- (void)setStatusSubtitleView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForTransitionToPasscodeView:(BOOL)a3 animated:(BOOL)a4;
- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5;
@end

@implementation SBUIPasscodeLockViewWithKeyboard

- (SBUIPasscodeLockViewWithKeyboard)initWithLightStyle:(BOOL)a3
{
  BOOL v4 = a3;
  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v56.receiver = self;
  v56.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  v15 = -[SBUIPasscodeLockViewBase initWithFrame:](&v56, sel_initWithFrame_, v8, v10, v12, v14);
  v16 = v15;
  if (!v15) {
    return v16;
  }
  v15->_usesLightStyle = v4;
  v17 = [MEMORY[0x1E4F42D90] mainScreen];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  -[SBUIPasscodeLockViewWithKeyboard setFrame:](v16, "setFrame:", v19, v21, v23, v25);
  v26 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  statusFieldBackground = v16->_statusFieldBackground;
  v16->_statusFieldBackground = v26;

  v28 = [(SBUIPasscodeLockViewBase *)v16 passcodeAuthenticationView];
  [v28 addSubview:v16->_statusFieldBackground];

  id v29 = [(SBUIPasscodeLockViewWithKeyboard *)v16 _newStatusField];
  [(SBUIPasscodeLockViewWithKeyboard *)v16 setStatusField:v29];
  v30 = [(SBUIPasscodeLockViewBase *)v16 passcodeAuthenticationView];
  [v30 addSubview:v29];

  v31 = [(SBUIPasscodeLockViewBase *)v16 _statusSubtitleText];
  v32 = (void *)[v31 length];

  if (v32)
  {
    id v33 = [(SBUIPasscodeLockViewWithKeyboard *)v16 _newStatusSubtitleView];
    [(SBUIPasscodeLockViewWithKeyboard *)v16 setStatusSubtitleView:v33];
    v32 = [(SBUIPasscodeLockViewBase *)v16 passcodeAuthenticationView];
    [v32 addSubview:v33];
  }
  v34 = [[SBUIAlphanumericPasscodeEntryField alloc] initWithDefaultSizeAndLightStyle:v4];
  alphaEntryField = v16->_alphaEntryField;
  v16->_alphaEntryField = v34;

  [(SBUIPasscodeEntryField *)v16->_alphaEntryField setDelegate:v16];
  [(SBUIPasscodeLockViewBase *)v16 _setEntryField:v16->_alphaEntryField];
  v36 = [(SBUIPasscodeLockViewBase *)v16 passcodeAuthenticationView];
  [v36 addSubview:v16->_alphaEntryField];

  v37 = v16->_alphaEntryField;
  v38 = (void *)MEMORY[0x1E4F42A30];
  int v39 = __sb__runningInSpringBoard();
  char v40 = v39;
  if (v39)
  {
    BOOL v41 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v32 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v41 = [v32 userInterfaceIdiom] == 1;
  }
  if (v41) {
    double v42 = 27.0;
  }
  else {
    double v42 = 17.0;
  }
  int v43 = __sb__runningInSpringBoard();
  if (v43)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v44 = 0;
LABEL_18:
      v45 = (void **)MEMORY[0x1E4F43760];
      goto LABEL_19;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom])
    {
      int v44 = 1;
      goto LABEL_18;
    }
  }
  int v44 = v43 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2) {
    goto LABEL_18;
  }
  v45 = (void **)MEMORY[0x1E4F437A0];
LABEL_19:
  v46 = objc_msgSend(v38, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v45, v42));
  [(SBUIPasscodeEntryField *)v37 setFont:v46];

  if (v44) {
  if ((v40 & 1) == 0)
  }

  v16->_keyboardVisible = 1;
  v47 = objc_alloc_init(SBPasscodeKeyboardAnimator);
  keyboardAnimator = v16->_keyboardAnimator;
  v16->_keyboardAnimator = v47;

  v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v49 addObserver:v16 selector:sel__hardwareReturnKeyPressed_ name:@"SBUIHardwareKeyboardReturnKeyPressedNotification" object:0];

  v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v50 addObserver:v16 selector:sel__keyboardDidHideNotification_ name:*MEMORY[0x1E4F43AC0] object:0];

  v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v51 addObserver:v16 selector:sel__keyboardWillShowNotification_ name:*MEMORY[0x1E4F43B88] object:0];

  v52 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v52 addObserver:v16 selector:sel__keyboardWillChangeFrameNotification_ name:*MEMORY[0x1E4F43B70] object:0];

  v53 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v53 addObserver:v16 selector:sel__keyboardDidRequestDismissalNotification_ name:@"UIKeyboardPrivateDidRequestDismissalNotification" object:0];

  [(SBUIPasscodeLockViewWithKeyboard *)v16 _toggleForEmergencyCall];
  if (v16->_usesLightStyle) {
    [MEMORY[0x1E4F428B8] clearColor];
  }
  else {
  v54 = [MEMORY[0x1E4F428B8] blackColor];
  }
  [(SBUIPasscodeLockViewBase *)v16 setCustomBackgroundColor:v54];

  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewBase *)&v4 dealloc];
}

- (void)_luminanceBoostDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewBase *)&v4 _luminanceBoostDidChange];
  if (!self->_usesLightStyle)
  {
    v3 = [MEMORY[0x1E4F42B08] activeKeyboard];
    [(SBUIPasscodeLockViewBase *)self _luminosityBoost];
    objc_msgSend(v3, "_setPasscodeOutlineAlpha:");
  }
}

- (id)passcode
{
  return [(SBUIPasscodeEntryField *)self->_alphaEntryField stringValue];
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewBase *)&v4 setShowsEmergencyCallButton:a3];
  [(SBUIPasscodeLockViewWithKeyboard *)self _toggleForEmergencyCall];
}

- (void)setShowsStatusField:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewBase *)&v4 setShowsStatusField:a3];
  [(SBUIPasscodeLockViewWithKeyboard *)self _toggleForStatusField];
}

- (void)beginTransitionToState:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewBase *)&v4 beginTransitionToState:a3];
  [(SBUIPasscodeLockViewWithKeyboard *)self _setKeyboardTracksLockView:1];
}

- (void)didEndTransitionToState:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewBase *)&v4 didEndTransitionToState:a3];
  [(SBUIPasscodeLockViewWithKeyboard *)self _setKeyboardTracksLockView:0];
}

- (void)updateForTransitionToPasscodeView:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = (void *)MEMORY[0x1E4F4F680];
  double v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  double v9 = [v7 settingsWithDuration:v8 timingFunction:0.15];

  [(SBPasscodeKeyboardAnimator *)self->_keyboardAnimator setAnimationSettings:v9];
  v10.receiver = self;
  v10.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewBase *)&v10 updateForTransitionToPasscodeView:v5 animated:v4];
}

- (id)_viewForKeyboardTracking
{
  v2 = [MEMORY[0x1E4F42C68] sharedInstance];
  v3 = [v2 _currentInputView];
  BOOL v4 = [v3 superview];

  return v4;
}

- (void)_setKeyboardTracksLockView:(BOOL)a3
{
  BOOL v3 = a3;
  v44[4] = *MEMORY[0x1E4F143B8];
  self->_keyboardTracksLockView = a3;
  BOOL v5 = [(SBUIPasscodeLockViewWithKeyboard *)self _viewForKeyboardTracking];
  v6 = v5;
  if (v3)
  {
    if (!self->_keyboardTrackingView)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
      double v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      keyboardTrackingView = self->_keyboardTrackingView;
      self->_keyboardTrackingView = v8;

      objc_super v10 = [(SBUIPasscodeLockViewBase *)self passcodeAuthenticationView];
      [v10 addSubview:self->_keyboardTrackingView];
    }
    double v11 = (void *)MEMORY[0x1E4F42FF0];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __63__SBUIPasscodeLockViewWithKeyboard__setKeyboardTracksLockView___block_invoke;
    v41[3] = &unk_1E5CCC878;
    double v12 = v6;
    double v42 = v12;
    int v43 = self;
    [v11 performWithoutAnimation:v41];
    double v13 = [(UIView *)v12 layer];
    [v13 removeAnimationForKey:@"KeyboardTracking_MatchMoveAnimation"];

    double v14 = [MEMORY[0x1E4F39C00] animation];
    v15 = [(UIView *)self->_keyboardTrackingView layer];
    [v14 setSourceLayer:v15];

    [v14 setDuration:INFINITY];
    v16 = [(UIView *)self->_keyboardTrackingView layer];
    [v16 bounds];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    double v25 = (void *)MEMORY[0x1E4F29238];
    v45.origin.x = v18;
    v45.origin.y = v20;
    v45.size.width = v22;
    v45.size.height = v24;
    double MinX = CGRectGetMinX(v45);
    v46.origin.x = v18;
    v46.origin.y = v20;
    v46.size.width = v22;
    v46.size.height = v24;
    v27 = objc_msgSend(v25, "valueWithCGPoint:", MinX, CGRectGetMinY(v46));
    v44[0] = v27;
    v28 = (void *)MEMORY[0x1E4F29238];
    v47.origin.x = v18;
    v47.origin.y = v20;
    v47.size.width = v22;
    v47.size.height = v24;
    double MaxX = CGRectGetMaxX(v47);
    v48.origin.x = v18;
    v48.origin.y = v20;
    v48.size.width = v22;
    v48.size.height = v24;
    v30 = objc_msgSend(v28, "valueWithCGPoint:", MaxX, CGRectGetMinY(v48));
    v44[1] = v30;
    v31 = (void *)MEMORY[0x1E4F29238];
    v49.origin.x = v18;
    v49.origin.y = v20;
    v49.size.width = v22;
    v49.size.height = v24;
    double v32 = CGRectGetMaxX(v49);
    v50.origin.x = v18;
    v50.origin.y = v20;
    v50.size.width = v22;
    v50.size.height = v24;
    id v33 = objc_msgSend(v31, "valueWithCGPoint:", v32, CGRectGetMaxY(v50));
    v44[2] = v33;
    v34 = (void *)MEMORY[0x1E4F29238];
    v51.origin.x = v18;
    v51.origin.y = v20;
    v51.size.width = v22;
    v51.size.height = v24;
    double v35 = CGRectGetMinX(v51);
    v52.origin.x = v18;
    v52.origin.y = v20;
    v52.size.width = v22;
    v52.size.height = v24;
    v36 = objc_msgSend(v34, "valueWithCGPoint:", v35, CGRectGetMaxY(v52));
    v44[3] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
    [v14 setSourcePoints:v37];

    [v14 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v14 setRemovedOnCompletion:0];
    v38 = [(UIView *)v12 layer];
    [v38 addAnimation:v14 forKey:@"KeyboardTracking_MatchMoveAnimation"];

    int v39 = v42;
  }
  else
  {
    char v40 = [v5 layer];
    [v40 removeAnimationForKey:@"KeyboardTracking_MatchMoveAnimation"];

    [(UIView *)self->_keyboardTrackingView removeFromSuperview];
    int v39 = self->_keyboardTrackingView;
    self->_keyboardTrackingView = 0;
  }
}

uint64_t __63__SBUIPasscodeLockViewWithKeyboard__setKeyboardTracksLockView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 40) bounds];
  id v7 = *(void **)(*(void *)(a1 + 40) + 872);
  return objc_msgSend(v7, "setFrame:", 0.0, v6 - v5, v3, v5);
}

- (void)layoutSubviews
{
  [(SBUIPasscodeLockViewWithKeyboard *)self _setKeyboardTracksLockView:self->_keyboardTracksLockView];
  [(SBUIPasscodeLockViewWithKeyboard *)self _layoutForMinimizationState:0];
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewBase *)&v3 layoutSubviews];
}

- (BOOL)becomeFirstResponder
{
  double v2 = self;
  self->_isResigningResponderStatus = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke;
  v5[3] = &unk_1E5CCC580;
  v5[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke_2;
  v4[3] = &unk_1E5CCD768;
  v4[4] = v2;
  v4[5] = &v6;
  [MEMORY[0x1E4F42FF0] animateWithDuration:32 delay:v4 options:0 animations:0.0 completion:0.0];
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) window];
  [v1 makeKeyAndVisible];
}

uint64_t __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke_2(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  double v2 = *(void **)(*(void *)(a1 + 32) + 816);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke_3;
  v4[3] = &unk_1E5CCD7B8;
  long long v5 = v1;
  return [v2 applyToKeyboardOperations:v4];
}

id __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke_3(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  id result = objc_msgSendSuper2(&v3, sel_becomeFirstResponder);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

- (BOOL)resignFirstResponder
{
  double v2 = self;
  self->_isResigningResponderStatus = 1;
  objc_super v3 = [(SBUIPasscodeLockViewWithKeyboard *)self _viewForKeyboardTracking];
  double v4 = [v3 layer];
  [v4 removeAllAnimations];

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBUIPasscodeLockViewWithKeyboard_resignFirstResponder__block_invoke;
  v6[3] = &unk_1E5CCD768;
  v6[4] = v2;
  v6[5] = &v7;
  [MEMORY[0x1E4F42FF0] animateWithDuration:32 delay:v6 options:0 animations:0.0 completion:0.0];
  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __56__SBUIPasscodeLockViewWithKeyboard_resignFirstResponder__block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  double v2 = *(void **)(*(void *)(a1 + 32) + 816);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SBUIPasscodeLockViewWithKeyboard_resignFirstResponder__block_invoke_2;
  v4[3] = &unk_1E5CCD7B8;
  long long v5 = v1;
  return [v2 applyToKeyboardOperations:v4];
}

id __56__SBUIPasscodeLockViewWithKeyboard_resignFirstResponder__block_invoke_2(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  id result = objc_msgSendSuper2(&v3, sel_resignFirstResponder);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

- (void)becomeActiveWithAnimationSettings:(id)a3
{
  [(SBPasscodeKeyboardAnimator *)self->_keyboardAnimator setAnimationSettings:a3];
  [(SBUIPasscodeLockViewWithKeyboard *)self becomeFirstResponder];
}

- (void)resignActiveWithAnimationSettings:(id)a3
{
  [(SBPasscodeKeyboardAnimator *)self->_keyboardAnimator setAnimationSettings:a3];
  [(SBUIPasscodeLockViewWithKeyboard *)self resignFirstResponder];
}

- (void)_hardwareReturnKeyPressed:(id)a3
{
  if (([(SBUIPasscodeLockViewWithKeyboard *)self isFirstResponder] & 1) != 0
    || [(SBUIPasscodeEntryField *)self->_alphaEntryField isFirstResponder])
  {
    [(SBUIPasscodeLockViewWithKeyboard *)self _acceptOrCancelReturnKeyPress];
  }
}

- (void)_notifyDelegatePasscodeEntered
{
  id v3 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 passcodeLockViewPasscodeEntered:self];
  }
}

- (void)_notifyDelegateThatEmergencyCallButtonWasPressed
{
  id v3 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 passcodeLockViewEmergencyCallButtonPressed:self];
  }
}

- (void)_notifyDelegatePasscodeCancelled
{
  id v3 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 passcodeLockViewCancelButtonPressed:self];
  }
}

- (void)passcodeEntryFieldDidCancelEntry:(id)a3
{
  if ([(SBUIPasscodeLockViewBase *)self showsCancelButton])
  {
    [(SBUIPasscodeLockViewWithKeyboard *)self _notifyDelegatePasscodeCancelled];
  }
}

- (BOOL)passcodeEntryField:(id)a3 shouldInsertText:(id)a4
{
  return 1;
}

- (void)passcodeEntryFieldTextDidChange:(id)a3
{
  uint64_t v4 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v4)
  {
    long long v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 passcodeLockViewPasscodeDidChange:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (BOOL)passcodeEntryFieldShouldShowSystemKeyboard:(id)a3
{
  return 1;
}

- (id)_statusTitleView
{
  return self->_statusField;
}

- (id)_statusSubtitleView
{
  return self->_statusSubtitleView;
}

- (id)_alphanumericPasscodeEntryField
{
  return self->_alphaEntryField;
}

- (id)_newStatusField
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  uint64_t v5 = 0x1E4F42000uLL;
  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
LABEL_9:
      uint64_t v8 = (void *)MEMORY[0x1E4F42A30];
      uint64_t v9 = __sb__runningInSpringBoard();
      if (v9)
      {
        if (SBFEffectiveDeviceClass() == 2)
        {
          int v10 = 0;
          char v11 = 0;
          double v12 = 27.0;
          goto LABEL_92;
        }
      }
      else
      {
        char v40 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v40 userInterfaceIdiom] == 1)
        {
          int v10 = 0;
          double v12 = 27.0;
          char v11 = 1;
          goto LABEL_92;
        }
      }
      char v11 = v9 ^ 1;
      int v16 = __sb__runningInSpringBoard();
      if (v16)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          int v10 = 0;
          double v12 = 18.0;
          goto LABEL_92;
        }
      }
      else
      {
        uint64_t v9 = [MEMORY[0x1E4F42948] currentDevice];
        if ([(id)v9 userInterfaceIdiom])
        {
          double v12 = 18.0;
          int v10 = 1;
          goto LABEL_92;
        }
      }
      int v10 = v16 ^ 1;
      uint64_t v35 = SBFEffectiveHomeButtonType();
      double v12 = 18.0;
      if (v35 == 2) {
        double v12 = 22.0;
      }
LABEL_92:
      v36 = [v8 systemFontOfSize:v12];
      [v4 setFont:v36];

      if (v10) {
      if ((v11 & 1) == 0)
      }
        goto LABEL_69;
LABEL_68:

      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v6 userInterfaceIdiom])
    {
    }
    else
    {
      uint64_t v7 = SBFEffectiveHomeButtonType();

      if (v7 == 2) {
        goto LABEL_9;
      }
    }
  }
  double v13 = (void *)MEMORY[0x1E4F42A30];
  int v14 = __sb__runningInSpringBoard();
  if (v14)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      uint64_t v41 = 0;
      int v15 = 27;
      goto LABEL_32;
    }
  }
  else
  {
    char v40 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v40 userInterfaceIdiom] == 1)
    {
      int v15 = 27;
      uint64_t v41 = 0x100000000;
      goto LABEL_32;
    }
  }
  uint64_t v2 = __sb__runningInSpringBoard();
  HIDWORD(v41) = v14 ^ 1;
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v41) = 0;
      int v15 = 18;
      goto LABEL_32;
    }
  }
  else
  {
    int v39 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v39 userInterfaceIdiom])
    {
      int v15 = 18;
      LODWORD(v41) = 1;
      goto LABEL_32;
    }
  }
  LODWORD(v41) = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2) {
    int v15 = 22;
  }
  else {
    int v15 = 18;
  }
LABEL_32:
  double v17 = (double)v15;
  CGFloat v18 = (void *)__sb__runningInSpringBoard();
  if (v18)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v9 = 0;
      goto LABEL_40;
    }
  }
  else
  {
    v38 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v38 userInterfaceIdiom])
    {
      uint64_t v9 = 1;
      goto LABEL_40;
    }
  }
  uint64_t v9 = v18 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    CGFloat v22 = (void **)MEMORY[0x1E4F43790];
    goto LABEL_57;
  }
LABEL_40:
  int v23 = __sb__runningInSpringBoard();
  if (v23)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v19 = 0;
      int v20 = 0;
      goto LABEL_51;
    }
  }
  else
  {
    CGFloat v18 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v18 userInterfaceIdiom])
    {
      int v20 = 0;
      int v19 = 1;
      goto LABEL_51;
    }
  }
  int v19 = v23 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  v37 = (void *)v2;
  int v20 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v24 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_53;
  }
  uint64_t v5 = 0x1E4F42000uLL;
LABEL_51:
  int v25 = __sb__runningInSpringBoard();
  if (v25)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_53:
      int v21 = 0;
      CGFloat v22 = (void **)MEMORY[0x1E4F43770];
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom] == 1)
    {
      CGFloat v22 = (void **)MEMORY[0x1E4F43770];
      int v21 = 1;
      goto LABEL_57;
    }
  }
  int v21 = v25 ^ 1;
  CGFloat v22 = (void **)MEMORY[0x1E4F43778];
LABEL_57:
  v26 = objc_msgSend(v13, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v22, v17));
  [v4 setFont:v26];

  if (v21) {
  if (v20)
  }

  if (v19) {
  if (v9)
  }

  if (v41) {
  if (HIDWORD(v41))
  }
    goto LABEL_68;
LABEL_69:
  [v4 setNumberOfLines:0];
  [v4 setLineBreakMode:0];
  v27 = [(SBUIPasscodeLockViewBase *)self _statusText];
  [v4 setText:v27];

  [v4 setClipsToBounds:1];
  v28 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 setBackgroundColor:v28];

  if (self->_usesLightStyle) {
    [MEMORY[0x1E4F428B8] blackColor];
  }
  else {
  id v29 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  [v4 setTextColor:v29];

  [v4 setTextAlignment:1];
  [v4 setAdjustsFontSizeToFitWidth:1];
  int v30 = __sb__runningInSpringBoard();
  char v31 = v30;
  if (!v30)
  {
    id v29 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v29 userInterfaceIdiom] == 1)
    {
      [v4 setMinimumScaleFactor:0.444444444];
      goto LABEL_86;
    }
LABEL_77:
    int v32 = __sb__runningInSpringBoard();
    char v33 = v32;
    if (v32)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        [v4 setMinimumScaleFactor:0.666666667];
        goto LABEL_85;
      }
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F42948] currentDevice];
      if ([(id)v9 userInterfaceIdiom])
      {
        [v4 setMinimumScaleFactor:0.666666667];
LABEL_84:

LABEL_85:
        if (v31) {
          return v4;
        }
LABEL_86:

        return v4;
      }
    }
    [v4 setMinimumScaleFactor:dbl_1A76A5550[SBFEffectiveHomeButtonType() == 2]];
    if (v33) {
      goto LABEL_85;
    }
    goto LABEL_84;
  }
  if (SBFEffectiveDeviceClass() != 2) {
    goto LABEL_77;
  }
  [v4 setMinimumScaleFactor:0.444444444];
  return v4;
}

- (id)_newStatusSubtitleView
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  uint64_t v5 = 0x1E4F42000uLL;
  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
LABEL_9:
      uint64_t v8 = (void *)MEMORY[0x1E4F42A30];
      uint64_t v9 = __sb__runningInSpringBoard();
      if (v9)
      {
        if (SBFEffectiveDeviceClass() == 2)
        {
          int v10 = 0;
          char v11 = 0;
          double v12 = 22.0;
          goto LABEL_92;
        }
      }
      else
      {
        int v44 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v44 userInterfaceIdiom] == 1)
        {
          int v10 = 0;
          double v12 = 22.0;
          char v11 = 1;
          goto LABEL_92;
        }
      }
      char v11 = v9 ^ 1;
      uint64_t v2 = __sb__runningInSpringBoard();
      if (v2)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          int v10 = 0;
          double v12 = 14.0;
          goto LABEL_92;
        }
      }
      else
      {
        uint64_t v9 = [MEMORY[0x1E4F42948] currentDevice];
        if ([(id)v9 userInterfaceIdiom])
        {
          double v12 = 14.0;
          int v10 = 1;
          goto LABEL_92;
        }
      }
      int v10 = v2 ^ 1;
      uint64_t v38 = SBFEffectiveHomeButtonType();
      double v12 = 14.0;
      if (v38 == 2) {
        double v12 = 15.0;
      }
LABEL_92:
      int v39 = [v8 systemFontOfSize:v12];
      [v4 setFont:v39];

      if (v10) {
      if ((v11 & 1) == 0)
      }
        goto LABEL_69;
LABEL_68:

      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v6 userInterfaceIdiom])
    {
    }
    else
    {
      uint64_t v7 = SBFEffectiveHomeButtonType();

      if (v7 == 2) {
        goto LABEL_9;
      }
    }
  }
  double v13 = (void *)MEMORY[0x1E4F42A30];
  int v14 = __sb__runningInSpringBoard();
  CGRect v45 = self;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      int v15 = 0;
      int v16 = 0;
      int v17 = 22;
      goto LABEL_32;
    }
  }
  else
  {
    int v44 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v44 userInterfaceIdiom] == 1)
    {
      int v16 = 0;
      int v17 = 22;
      int v15 = 1;
      goto LABEL_32;
    }
  }
  int v15 = v14 ^ 1;
  int v18 = __sb__runningInSpringBoard();
  if (v18)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v16 = 0;
      int v17 = 14;
      goto LABEL_32;
    }
  }
  else
  {
    int v43 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v43 userInterfaceIdiom])
    {
      int v17 = 14;
      int v16 = 1;
      goto LABEL_32;
    }
  }
  int v16 = v18 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2) {
    int v17 = 15;
  }
  else {
    int v17 = 14;
  }
LABEL_32:
  double v19 = (double)v17;
  int v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v21 = 0;
      goto LABEL_40;
    }
  }
  else
  {
    double v42 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v42 userInterfaceIdiom])
    {
      int v21 = 1;
      goto LABEL_40;
    }
  }
  int v21 = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = 0x1E4F42000uLL;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = (void **)MEMORY[0x1E4F43798];
    goto LABEL_57;
  }
LABEL_40:
  uint64_t v26 = __sb__runningInSpringBoard();
  if (v26)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v22 = 0;
      int v23 = 0;
      goto LABEL_51;
    }
  }
  else
  {
    char v40 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v40 userInterfaceIdiom])
    {
      int v23 = 0;
      int v22 = 1;
      goto LABEL_51;
    }
  }
  uint64_t v2 = 0x1E4F42000uLL;
  int v22 = v26 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v26 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v26 _referenceBounds];
  }
  uint64_t v41 = (void *)v26;
  int v23 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v27 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_53;
  }
  uint64_t v5 = 0x1E4F42000uLL;
LABEL_51:
  int v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    uint64_t v2 = 0x1E4F42000uLL;
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_53:
      int v24 = 0;
      int v25 = (void **)MEMORY[0x1E4F43770];
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v2 = 0x1E4F42000uLL;
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom] == 1)
    {
      int v25 = (void **)MEMORY[0x1E4F43770];
      int v24 = 1;
      goto LABEL_57;
    }
  }
  int v24 = v28 ^ 1;
  int v25 = (void **)MEMORY[0x1E4F43778];
LABEL_57:
  id v29 = objc_msgSend(v13, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v25, v19));
  [v4 setFont:v29];

  if (v24) {
  if (v23)
  }

  if (v22) {
  if (v21)
  }

  self = v45;
  if (v16) {

  }
  if (v15) {
    goto LABEL_68;
  }
LABEL_69:
  objc_msgSend(v4, "setNumberOfLines:", 0, v40);
  [v4 setLineBreakMode:0];
  [v4 setClipsToBounds:1];
  int v30 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 setBackgroundColor:v30];

  if (self->_usesLightStyle) {
    [MEMORY[0x1E4F428B8] blackColor];
  }
  else {
  char v31 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  [v4 setTextColor:v31];

  [v4 setTextAlignment:1];
  [v4 setAdjustsFontSizeToFitWidth:1];
  int v32 = __sb__runningInSpringBoard();
  char v33 = v32;
  if (!v32)
  {
    char v31 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v31 userInterfaceIdiom] == 1)
    {
      [v4 setMinimumScaleFactor:0.545454545];
      goto LABEL_86;
    }
LABEL_77:
    int v34 = __sb__runningInSpringBoard();
    char v35 = v34;
    if (v34)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        [v4 setMinimumScaleFactor:0.857142857];
        goto LABEL_85;
      }
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
      if ([(id)v2 userInterfaceIdiom])
      {
        [v4 setMinimumScaleFactor:0.857142857];
LABEL_84:

LABEL_85:
        if (v33) {
          goto LABEL_87;
        }
LABEL_86:

        goto LABEL_87;
      }
    }
    [v4 setMinimumScaleFactor:dbl_1A76A5560[SBFEffectiveHomeButtonType() == 2]];
    if (v35) {
      goto LABEL_85;
    }
    goto LABEL_84;
  }
  if (SBFEffectiveDeviceClass() != 2) {
    goto LABEL_77;
  }
  [v4 setMinimumScaleFactor:0.545454545];
LABEL_87:
  v36 = [(SBUIPasscodeLockViewBase *)self _statusSubtitleText];
  [v4 setText:v36];

  return v4;
}

- (void)_acceptOrCancelReturnKeyPress
{
  id v3 = [(SBUIPasscodeEntryField *)self->_alphaEntryField stringValue];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    [(SBUIPasscodeLockViewWithKeyboard *)self _notifyDelegatePasscodeEntered];
  }
  else if ([(SBUIPasscodeLockViewBase *)self showsCancelButton])
  {
    [(SBUIPasscodeLockViewWithKeyboard *)self _notifyDelegatePasscodeCancelled];
  }
}

- (void)_toggleForEmergencyCall
{
  if ([(SBUIPasscodeLockViewBase *)self showsEmergencyCallButton])
  {
    uint64_t v4 = [(UIView *)self->_statusFieldBackground backgroundColor];
    [(UIView *)self->_statusFieldBackground alpha];
    if (self->_emergencyCallButton)
    {
LABEL_63:
      v37 = [(SBUIPasscodeLockViewBase *)self passcodeAuthenticationView];
      [v37 addSubview:self->_emergencyCallButton];

      goto LABEL_64;
    }
    double v6 = v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F42A30];
    int v8 = __sb__runningInSpringBoard();
    uint64_t v9 = 0x1E4F42000uLL;
    if (v8)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        int v10 = 0;
        double v11 = 12.0;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v41 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v41 userInterfaceIdiom])
      {
        double v11 = 12.0;
        int v10 = 1;
        goto LABEL_14;
      }
    }
    int v10 = v8 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2) {
      double v11 = 16.0;
    }
    else {
      double v11 = 12.0;
    }
LABEL_14:
    int v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        int v14 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      char v40 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v40 userInterfaceIdiom])
      {
        int v14 = 1;
        goto LABEL_22;
      }
    }
    int v14 = v13 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = (void **)MEMORY[0x1E4F43798];
      goto LABEL_39;
    }
LABEL_22:
    int v19 = __sb__runningInSpringBoard();
    if (v19)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        int v15 = 0;
        int v16 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v38 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v38 userInterfaceIdiom])
      {
        int v15 = 0;
        int v16 = 1;
        goto LABEL_33;
      }
    }
    int v16 = v19 ^ 1;
    uint64_t v9 = __sb__runningInSpringBoard();
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    int v15 = v9 ^ 1;
    BSSizeRoundForScale();
    int v39 = v2;
    if (v20 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
      goto LABEL_35;
    }
    uint64_t v9 = 0x1E4F42000uLL;
LABEL_33:
    int v21 = __sb__runningInSpringBoard();
    if (v21)
    {
      if (SBFEffectiveDeviceClass() == 2)
      {
LABEL_35:
        int v17 = 0;
        int v18 = (void **)MEMORY[0x1E4F43768];
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F42948] currentDevice];
      if ([(id)v9 userInterfaceIdiom] == 1)
      {
        int v18 = (void **)MEMORY[0x1E4F43768];
        int v17 = 1;
        goto LABEL_39;
      }
    }
    int v17 = v21 ^ 1;
    int v18 = (void **)MEMORY[0x1E4F43770];
LABEL_39:
    int v22 = objc_msgSend(v7, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v18, v11));
    if (v17) {

    }
    if (v15) {
    if (v16)
    }

    if (v14) {
    if (v10)
    }

    if (self->_usesLightStyle) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    int v23 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    int v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v25 = [v24 localizedStringForKey:@"PASSCODE_EMERGENCY" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

    if (__sb__runningInSpringBoard())
    {
      if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
        && SBFEffectiveHomeButtonType() == 2)
      {
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v26 userInterfaceIdiom])
      {
      }
      else
      {
        uint64_t v27 = SBFEffectiveHomeButtonType();

        if (v27 == 2)
        {
LABEL_60:
          id v28 = objc_alloc(MEMORY[0x1E4F427E0]);
          id v29 = (UIControl *)objc_msgSend(v28, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          [(UIControl *)v29 setTitle:v25 forState:0];
          [(UIControl *)v29 setTitleColor:v23 forState:0];
          int v30 = [(UIControl *)v29 titleLabel];
          [v30 setFont:v22];

          emergencyCallButton = self->_emergencyCallButton;
          self->_emergencyCallButton = v29;
LABEL_62:

          [(UIControl *)self->_emergencyCallButton addTarget:self action:sel__notifyDelegateThatEmergencyCallButtonWasPressed forControlEvents:64];
          [(UIControl *)self->_emergencyCallButton setExclusiveTouch:1];

          goto LABEL_63;
        }
      }
    }
    int v32 = [SBUIRingViewLabelButton alloc];
    char v33 = -[SBUIRingViewLabelButton initWithFrame:](v32, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    emergencyCallButton = [(UIControl *)v33 backgroundRing];
    [emergencyCallButton setColorInsideRing:v4];
    [emergencyCallButton setColorOutsideRing:v4];
    [emergencyCallButton setAlphaInsideRing:v6];
    [emergencyCallButton setAlphaOutsideRing:v6];
    [emergencyCallButton setCornerRadius:4.0];
    int v34 = self->_emergencyCallButton;
    self->_emergencyCallButton = v33;
    char v35 = v33;

    v36 = [(UIControl *)v35 label];

    [v36 setFont:v22];
    [v36 setTextColor:v23];
    [v36 setText:v25];
    [v36 setAdjustsFontSizeToFitWidth:1];
    [v36 setMinimumScaleFactor:0.5];

    goto LABEL_62;
  }
  double v12 = self->_emergencyCallButton;
  if (!v12) {
    goto LABEL_65;
  }
  [(UIControl *)v12 removeFromSuperview];
  uint64_t v4 = self->_emergencyCallButton;
  self->_emergencyCallButton = 0;
LABEL_64:

LABEL_65:
  [(SBUIPasscodeLockViewWithKeyboard *)self setNeedsLayout];
}

- (void)_toggleForStatusField
{
  BOOL v3 = [(SBUIPasscodeLockViewBase *)self showsStatusField];
  uint64_t v4 = [(SBUIPasscodeLockViewWithKeyboard *)self statusField];
  BOOL v5 = !v3;
  [v4 setHidden:v5];

  id v6 = [(SBUIPasscodeLockViewWithKeyboard *)self statusSubtitleView];
  [v6 setHidden:v5];
}

- (void)_layoutForMinimizationState:(BOOL)a3
{
  BOOL v4 = a3;
  [(SBUIPasscodeLockViewWithKeyboard *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(SBUIPasscodeLockViewWithKeyboard *)self _keyboardFrameForInterfaceOrientation:[(SBUIPasscodeLockViewBase *)self _orientation]];
  double MinY = CGRectGetMinY(v59);
  [(SBUIAlphanumericPasscodeEntryField *)self->_alphaEntryField frame];
  double v16 = v15;
  double v18 = v17;
  v60.origin.x = v7;
  v60.origin.y = v9;
  v60.size.width = v11;
  v60.size.height = v13;
  double Width = CGRectGetWidth(v60);
  -[SBUIPasscodeEntryField sizeThatFits:](self->_alphaEntryField, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v20 = v19;
  if (!v4)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
        || SBFEffectiveHomeButtonType() != 2)
      {
        goto LABEL_12;
      }
LABEL_11:
      [(SBUIPasscodeLockViewWithKeyboard *)self _keyboardToEntryFieldOffset];
      double v26 = MinY - v25 - v20;
      goto LABEL_14;
    }
    int v23 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v23 userInterfaceIdiom])
    {
    }
    else
    {
      uint64_t v24 = SBFEffectiveHomeButtonType();

      if (v24 == 2) {
        goto LABEL_11;
      }
    }
LABEL_12:
    objc_msgSend(MEMORY[0x1E4FA5F68], "pinKeyboardEntryFieldOffset:", -[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented"));
    goto LABEL_13;
  }
  v61.origin.x = v7;
  v61.origin.y = v9;
  v61.size.width = v11;
  v61.size.height = v13;
  CGFloat Height = CGRectGetHeight(v61);
  double v22 = SBUIFloatFloorForMainScreenScale(Height * 0.5 - v20);
LABEL_13:
  double v26 = v22;
LABEL_14:
  id v57 = [(SBUIPasscodeLockViewWithKeyboard *)self statusSubtitleView];
  uint64_t v27 = [v57 text];
  id v28 = (void *)[v27 length];

  if (!v28) {
    goto LABEL_36;
  }
  [(SBUIPasscodeLockViewWithKeyboard *)self _statusTitleWidth];
  double v30 = v29;
  v62.size.width = v11;
  v62.origin.x = v7;
  v62.size.height = v13;
  v62.origin.y = v9;
  objc_msgSend(v57, "sizeThatFits:", v30, CGRectGetHeight(v62));
  double v32 = v31;
  char v33 = [v57 font];
  [v33 lineHeight];
  uint64_t v35 = (uint64_t)(v32 / v34);

  int v36 = __sb__runningInSpringBoard();
  char v37 = v36;
  if (v36)
  {
    if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2)
    {
      uint64_t v38 = 2;
      goto LABEL_34;
    }
    goto LABEL_21;
  }
  id v28 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v28 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
  {
LABEL_21:
    int v39 = __sb__runningInSpringBoard();
    char v40 = v39;
    if (v39)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    BSSizeRoundForScale();
    BOOL v42 = v41 == *(double *)(MEMORY[0x1E4FA6E50] + 272);
    if (v43 != *(double *)(MEMORY[0x1E4FA6E50] + 280)) {
      BOOL v42 = 0;
    }
    if (v42) {
      uint64_t v38 = 1;
    }
    else {
      uint64_t v38 = 2;
    }
    if ((v40 & 1) == 0) {

    }
    if (v37) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v38 = 2;
LABEL_33:

LABEL_34:
  if (v35 > v38)
  {
    int v44 = [v57 font];
    [v44 lineHeight];
    double v26 = v26 + (double)(v35 - v38) * v45;
  }
LABEL_36:
  -[SBUIAlphanumericPasscodeEntryField setFrame:](self->_alphaEntryField, "setFrame:", v16, v26, Width, v18);
  if (!self->_emergencyCallButton) {
    goto LABEL_63;
  }
  int v46 = __sb__runningInSpringBoard();
  char v47 = v46;
  if (v46)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_49;
    }
  }
  else
  {
    id v28 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v28 userInterfaceIdiom])
    {
LABEL_48:

      goto LABEL_49;
    }
  }
  int v48 = __sb__runningInSpringBoard();
  char v49 = v48;
  if (v48)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  if ((v49 & 1) == 0) {

  }
  if ((v47 & 1) == 0) {
    goto LABEL_48;
  }
LABEL_49:
  CGRect v50 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v50);

  if (!IsAccessibilityCategory) {
    goto LABEL_62;
  }
  if (!__sb__runningInSpringBoard())
  {
    CGRect v52 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v52 userInterfaceIdiom])
    {
    }
    else
    {
      uint64_t v53 = SBFEffectiveHomeButtonType();

      if (v53 == 2) {
        goto LABEL_59;
      }
    }
LABEL_60:
    uint64_t v54 = [(UIControl *)self->_emergencyCallButton label];
    goto LABEL_61;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
    || SBFEffectiveHomeButtonType() != 2)
  {
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v54 = [(UIControl *)self->_emergencyCallButton titleLabel];
LABEL_61:
  v55 = (void *)v54;
  [(SBUIPasscodeLockViewWithKeyboard *)self _largeTextEmergencyButtonMaxWidth];
  objc_msgSend(v55, "sizeThatFits:");

LABEL_62:
  UIRectCenteredXInRectScale();
  [(UIControl *)self->_emergencyCallButton setFrame:0];
LABEL_63:
  [(SBUIPasscodeLockViewWithKeyboard *)self _layoutStatusView];
  [(SBUIPasscodeLockViewWithKeyboard *)self bringSubviewToFront:self->_statusField];
}

- (CGRect)_keyboardFrameForInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F42B08], "keyboardSizeForInterfaceOrientation:");
  double v5 = v4;
  double v7 = v6;
  [MEMORY[0x1E4F42B20] deviceSpecificPaddingForInterfaceOrientation:a3 inputMode:0];
  double v9 = v7 + v8;
  double v10 = [MEMORY[0x1E4F42D90] mainScreen];
  [v10 bounds];
  double v12 = v11;

  double v13 = v12 - v9;
  double v14 = 0.0;
  double v15 = v5;
  double v16 = v9;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (double)_keyboardToEntryFieldOffset
{
  BOOL v4 = [(SBUIPasscodeLockViewBase *)self _isBoundsPortraitOriented];
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {

      goto LABEL_15;
    }
  }
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v9 = v8;
  double v10 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v7 & 1) == 0) {

  }
  if ((v5 & 1) == 0) {
  if (v9 >= v10)
  }
  {
    BOOL v11 = !v4;
    double result = 242.0;
    double v13 = 430.0;
    goto LABEL_25;
  }
LABEL_15:
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v16 = [(id)v5 userInterfaceIdiom];

    if (v16 != 1)
    {
LABEL_17:
      int v14 = __sb__runningInSpringBoard();
      if (v14)
      {
        char v15 = v14;
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
          goto LABEL_33;
        }
        if (SBFEffectiveHomeButtonType() == 2)
        {
          if (v15) {
            goto LABEL_34;
          }
          goto LABEL_30;
        }
        if (v15)
        {
LABEL_33:
          double result = 4.0;
          if (v4) {
            return result;
          }
          goto LABEL_34;
        }
      }
      else
      {
        uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
        if (![(id)v5 userInterfaceIdiom] && SBFEffectiveHomeButtonType() == 2)
        {
LABEL_30:

LABEL_34:
          double v17 = (void *)MEMORY[0x1E4FA5F68];
          objc_msgSend(v17, "pinAlphanumericEntryFieldBottomYDistanceFromKeyboard:", v4, result);
          return result;
        }
      }

      goto LABEL_33;
    }
  }
  BOOL v11 = !v4;
  double result = 135.0;
  double v13 = 322.0;
LABEL_25:
  if (!v11) {
    return v13;
  }
  return result;
}

- (double)_statusFieldHeightWithWidth:(double)a3
{
  BOOL v4 = [(SBUIPasscodeLockViewWithKeyboard *)self statusField];
  objc_msgSend(v4, "sizeThatFits:", a3, 0.0);
  double v6 = v5;

  return v6;
}

- (double)_statusTitleWidth
{
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double v4 = v3 + -40.0;

  return v4;
}

- (double)_largeTextEmergencyButtonMaxWidth
{
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double v4 = v3 + -40.0;

  return v4;
}

- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewBase *)&v31 updateStatusText:v8 subtitle:v9 animated:v5];
  double v10 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1
    && ![(SBUIPasscodeLockViewBase *)self _isBoundsPortraitOriented])
  {
    goto LABEL_16;
  }
  double v12 = [(SBUIPasscodeLockViewWithKeyboard *)self statusField];
  double v13 = [v12 text];
  int v14 = [v8 isEqualToString:v13];

  if (v14)
  {

    double v12 = 0;
    id v15 = 0;
  }
  else
  {
    id v15 = [(SBUIPasscodeLockViewWithKeyboard *)self _newStatusField];
    [v15 setText:v8];
    [(SBUIPasscodeLockViewWithKeyboard *)self setStatusField:v15];
  }
  uint64_t v16 = [(SBUIPasscodeLockViewWithKeyboard *)self statusSubtitleView];
  if (v9)
  {
    [(SBUIPasscodeLockViewBase *)self _setStatusSubtitleText:v9];
    id v17 = [(SBUIPasscodeLockViewWithKeyboard *)self _newStatusSubtitleView];
    [(SBUIPasscodeLockViewWithKeyboard *)self setStatusSubtitleView:v17];
    double v18 = [(SBUIPasscodeLockViewBase *)self passcodeAuthenticationView];
    [v18 insertSubview:v17 aboveSubview:self->_statusFieldBackground];

    if (!v12) {
      goto LABEL_12;
    }
LABEL_10:
    if (v15)
    {
      double v19 = [(SBUIPasscodeLockViewBase *)self passcodeAuthenticationView];
      [v19 insertSubview:v15 aboveSubview:v12];
    }
    goto LABEL_12;
  }
  [(SBUIPasscodeLockViewWithKeyboard *)self setStatusSubtitleView:0];
  id v17 = 0;
  if (v12) {
    goto LABEL_10;
  }
LABEL_12:
  [(SBUIPasscodeLockViewWithKeyboard *)self setNeedsLayout];
  if (v5)
  {
    [v15 setAlpha:0.0];
    double v20 = (void *)MEMORY[0x1E4F42FF0];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke;
    v28[3] = &unk_1E5CCC878;
    id v29 = v12;
    id v30 = v16;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke_2;
    v25[3] = &unk_1E5CCD258;
    id v26 = v29;
    id v27 = v30;
    [v20 animateWithDuration:v28 animations:v25 completion:0.22];
    int v21 = (void *)MEMORY[0x1E4F42FF0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke_3;
    v22[3] = &unk_1E5CCC878;
    id v23 = v15;
    id v24 = v17;
    [v21 animateWithDuration:0 delay:v22 options:0 animations:0.4 completion:0.17];
  }
  else
  {
    [v12 removeFromSuperview];
    [v16 removeFromSuperview];
  }

LABEL_16:
}

uint64_t __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

uint64_t __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

- (void)_layoutStatusView
{
  [(SBUIPasscodeLockViewWithKeyboard *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(SBUIAlphanumericPasscodeEntryField *)self->_alphaEntryField frame];
  CGFloat rect = v12;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  rect_8 = [(SBUIPasscodeLockViewWithKeyboard *)self statusField];
  double v19 = [(SBUIPasscodeLockViewWithKeyboard *)self statusSubtitleView];
  double v20 = [v19 text];
  int v21 = (void *)[v20 length];

  CGFloat v55 = v14;
  double v52 = v5;
  double v53 = v9;
  if (v21)
  {
    [(SBUIPasscodeLockViewWithKeyboard *)self _statusTitleWidth];
    double v23 = v22;
    v59.origin.x = v5;
    v59.origin.y = v7;
    v59.size.width = v9;
    v59.size.height = v11;
    objc_msgSend(v19, "sizeThatFits:", v23, CGRectGetHeight(v59));
    double v25 = v24;
    UIRectCenteredXInRectScale();
    double v27 = v26;
    double v28 = v7;
    double v30 = v29;
    v60.origin.y = v14;
    double v31 = v11;
    double v33 = v32;
    v60.origin.x = rect;
    v60.size.width = v16;
    v60.size.height = v18;
    CGFloat MinY = CGRectGetMinY(v60);
    double v35 = v30;
    CGFloat v7 = v28;
    double v36 = v33;
    CGFloat v11 = v31;
    objc_msgSend(v19, "setFrame:", v27, MinY - v25 + -14.0, v35, v36, 0);
    double v37 = v25 + 14.0;
  }
  else
  {
    double v37 = 0.0;
  }
  [(SBUIPasscodeLockViewWithKeyboard *)self _statusTitleWidth];
  -[SBUIPasscodeLockViewWithKeyboard _statusFieldHeightWithWidth:](self, "_statusFieldHeightWithWidth:");
  double v39 = v38;
  int v40 = __sb__runningInSpringBoard();
  char v41 = v40;
  CGFloat v54 = v11;
  if (v21)
  {
    CGFloat v42 = v16;
    if (v40)
    {
      CGFloat v43 = v52;
      CGFloat v44 = v53;
      CGFloat v45 = v7;
      if (SBFEffectiveDeviceClass() == 2) {
        int v46 = 3;
      }
      else {
        int v46 = 4;
      }
    }
    else
    {
      CGFloat v43 = v52;
      CGFloat v44 = v53;
      CGFloat v45 = v7;
      char v47 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v47 userInterfaceIdiom] == 1) {
        int v46 = 3;
      }
      else {
        int v46 = 4;
      }
    }
    goto LABEL_30;
  }
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      CGFloat v42 = v16;
      CGFloat v43 = v52;
      CGFloat v44 = v53;
      CGFloat v45 = v7;
      int v46 = 13;
      goto LABEL_30;
    }
  }
  else
  {
    int v21 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v21 userInterfaceIdiom])
    {
      CGFloat v42 = v16;
      CGFloat v43 = v52;
      CGFloat v44 = v53;
      CGFloat v45 = v7;
      int v46 = 13;
      goto LABEL_29;
    }
  }
  int v48 = __sb__runningInSpringBoard();
  char v49 = v48;
  if (v48)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v50 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    int v46 = 13;
  }
  else {
    int v46 = 24;
  }
  CGFloat v42 = v16;
  if ((v49 & 1) == 0)
  {
    CGFloat v43 = v52;
    CGFloat v44 = v53;
    CGFloat v45 = v7;

    if (v41) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  CGFloat v43 = v52;
  CGFloat v44 = v53;
  CGFloat v45 = v7;
  if ((v41 & 1) == 0) {
LABEL_29:
  }

LABEL_30:
  v61.origin.y = v55;
  v61.origin.x = rect;
  v61.size.width = v42;
  v61.size.height = v18;
  CGFloat v51 = CGRectGetMinY(v61) - v39 - v37 - (double)v46;
  v62.origin.x = v43;
  v62.origin.y = v45;
  v62.size.width = v44;
  v62.size.height = v54;
  -[UIView setFrame:](self->_statusFieldBackground, "setFrame:", 0.0, v51, CGRectGetWidth(v62), v37 + v39 + (double)v46);
  UIRectCenteredXInRectScale();
  [rect_8 setFrame:0];
}

- (void)_updateFont
{
  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
      goto LABEL_112;
    }
  }
  else
  {
    CGFloat v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v5 userInterfaceIdiom])
    {
    }
    else
    {
      uint64_t v6 = SBFEffectiveHomeButtonType();

      if (v6 == 2) {
        goto LABEL_112;
      }
    }
  }
  CGFloat v7 = [(SBUIPasscodeLockViewWithKeyboard *)self statusField];
  double v8 = (void *)MEMORY[0x1E4F42A30];
  int v9 = __sb__runningInSpringBoard();
  if (v9)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      int v10 = 0;
      int v67 = 0;
      int v11 = 27;
      goto LABEL_23;
    }
  }
  else
  {
    v65 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v65 userInterfaceIdiom] == 1)
    {
      int v10 = 0;
      int v11 = 27;
      int v67 = 1;
      goto LABEL_23;
    }
  }
  uint64_t v2 = __sb__runningInSpringBoard();
  int v67 = v9 ^ 1;
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v10 = 0;
      int v11 = 18;
      goto LABEL_23;
    }
  }
  else
  {
    v66 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v66 userInterfaceIdiom])
    {
      int v11 = 18;
      int v10 = 1;
      goto LABEL_23;
    }
  }
  int v10 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2) {
    int v11 = 22;
  }
  else {
    int v11 = 18;
  }
LABEL_23:
  double v12 = (double)v11;
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v14 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v64 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v64 userInterfaceIdiom])
    {
      int v14 = 1;
      goto LABEL_31;
    }
  }
  int v14 = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    CGFloat v18 = (void **)MEMORY[0x1E4F43790];
    goto LABEL_47;
  }
LABEL_31:
  int v19 = __sb__runningInSpringBoard();
  if (v19)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v15 = 0;
      int v16 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v13 userInterfaceIdiom])
    {
      int v15 = 0;
      int v16 = 1;
      goto LABEL_41;
    }
  }
  int v16 = v19 ^ 1;
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v15 = v4 ^ 1;
  BSSizeRoundForScale();
  if (v20 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_43;
  }
LABEL_41:
  int v21 = __sb__runningInSpringBoard();
  if (v21)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_43:
      int v17 = 0;
      CGFloat v18 = (void **)MEMORY[0x1E4F43770];
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v4 userInterfaceIdiom] == 1)
    {
      CGFloat v18 = (void **)MEMORY[0x1E4F43770];
      int v17 = 1;
      goto LABEL_47;
    }
  }
  int v17 = v21 ^ 1;
  CGFloat v18 = (void **)MEMORY[0x1E4F43778];
LABEL_47:
  double v22 = objc_msgSend(v8, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v18, v12));
  [v7 setFont:v22];

  if (v17)
  {

    if (!v15) {
      goto LABEL_49;
    }
  }
  else if (!v15)
  {
LABEL_49:
    if (v16) {
      goto LABEL_50;
    }
LABEL_54:
    if (!v14) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }

  if (!v16) {
    goto LABEL_54;
  }
LABEL_50:

  if (v14) {
LABEL_55:
  }

LABEL_56:
  if (v10) {

  }
  if (v67) {
  double v23 = [(SBUIPasscodeLockViewWithKeyboard *)self statusSubtitleView];
  }
  double v24 = (void *)MEMORY[0x1E4F42A30];
  int v25 = __sb__runningInSpringBoard();
  if (v25)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      int v68 = 0;
      int v26 = 0;
      int v27 = 22;
      goto LABEL_74;
    }
  }
  else
  {
    v65 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v65 userInterfaceIdiom] == 1)
    {
      int v26 = 0;
      int v27 = 22;
      int v68 = 1;
      goto LABEL_74;
    }
  }
  uint64_t v2 = __sb__runningInSpringBoard();
  int v68 = v25 ^ 1;
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v26 = 0;
      int v27 = 14;
      goto LABEL_74;
    }
  }
  else
  {
    v66 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v66 userInterfaceIdiom])
    {
      int v27 = 14;
      int v26 = 1;
      goto LABEL_74;
    }
  }
  int v26 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2) {
    int v27 = 15;
  }
  else {
    int v27 = 14;
  }
LABEL_74:
  double v28 = (double)v27;
  uint64_t v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v29 = 0;
      goto LABEL_82;
    }
  }
  else
  {
    v64 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v64 userInterfaceIdiom])
    {
      int v29 = 1;
      goto LABEL_82;
    }
  }
  int v29 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    double v33 = (void **)MEMORY[0x1E4F43798];
    goto LABEL_98;
  }
LABEL_82:
  int v34 = __sb__runningInSpringBoard();
  if (v34)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v30 = 0;
      int v31 = 0;
      goto LABEL_92;
    }
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v3 userInterfaceIdiom])
    {
      int v31 = 0;
      int v30 = 1;
      goto LABEL_92;
    }
  }
  int v30 = v34 ^ 1;
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v31 = v4 ^ 1;
  BSSizeRoundForScale();
  if (v35 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_94;
  }
LABEL_92:
  int v36 = __sb__runningInSpringBoard();
  if (v36)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_94:
      int v32 = 0;
      double v33 = (void **)MEMORY[0x1E4F43770];
      goto LABEL_98;
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v4 userInterfaceIdiom] == 1)
    {
      double v33 = (void **)MEMORY[0x1E4F43770];
      int v32 = 1;
      goto LABEL_98;
    }
  }
  int v32 = v36 ^ 1;
  double v33 = (void **)MEMORY[0x1E4F43778];
LABEL_98:
  double v37 = objc_msgSend(v24, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v33, v28));
  [v23 setFont:v37];

  if (v32)
  {

    if (!v31) {
      goto LABEL_100;
    }
  }
  else if (!v31)
  {
LABEL_100:
    if (v30) {
      goto LABEL_101;
    }
    goto LABEL_105;
  }

  if (v30)
  {
LABEL_101:

    if (!v29) {
      goto LABEL_107;
    }
    goto LABEL_106;
  }
LABEL_105:
  if (v29) {
LABEL_106:
  }

LABEL_107:
  if (v26) {

  }
  if (v68) {
LABEL_112:
  }
  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
      goto LABEL_120;
    }
  }
  else
  {
    double v38 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v38 userInterfaceIdiom])
    {
    }
    else
    {
      uint64_t v39 = SBFEffectiveHomeButtonType();

      if (v39 == 2)
      {
LABEL_120:
        uint64_t v40 = [(UIControl *)self->_emergencyCallButton titleLabel];
        goto LABEL_122;
      }
    }
  }
  uint64_t v40 = [(UIControl *)self->_emergencyCallButton label];
LABEL_122:
  id v69 = (id)v40;
  char v41 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v42 = __sb__runningInSpringBoard();
  if (v42)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v43 = 0;
      double v44 = 12.0;
      goto LABEL_131;
    }
  }
  else
  {
    v66 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v66 userInterfaceIdiom])
    {
      double v44 = 12.0;
      int v43 = 1;
      goto LABEL_131;
    }
  }
  int v43 = v42 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2) {
    double v44 = 16.0;
  }
  else {
    double v44 = 12.0;
  }
LABEL_131:
  uint64_t v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v46 = 0;
      goto LABEL_139;
    }
  }
  else
  {
    uint64_t v42 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v42 userInterfaceIdiom])
    {
      int v46 = 1;
      goto LABEL_139;
    }
  }
  int v46 = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    double v50 = (void **)MEMORY[0x1E4F43798];
    goto LABEL_155;
  }
LABEL_139:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v47 = 0;
      int v48 = 0;
      goto LABEL_149;
    }
  }
  else
  {
    uint64_t v45 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v45 userInterfaceIdiom])
    {
      int v48 = 0;
      int v47 = 1;
      goto LABEL_149;
    }
  }
  int v47 = v2 ^ 1;
  uint64_t v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v48 = v3 ^ 1;
  BSSizeRoundForScale();
  if (v51 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_151;
  }
LABEL_149:
  int v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_151:
      int v49 = 0;
      double v50 = (void **)MEMORY[0x1E4F43768];
      goto LABEL_155;
    }
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v3 userInterfaceIdiom] == 1)
    {
      double v50 = (void **)MEMORY[0x1E4F43768];
      int v49 = 1;
      goto LABEL_155;
    }
  }
  int v49 = v52 ^ 1;
  double v50 = (void **)MEMORY[0x1E4F43770];
LABEL_155:
  double v53 = objc_msgSend(v41, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v50, v44));
  [v69 setFont:v53];

  if (v49)
  {

    if (!v48) {
      goto LABEL_157;
    }
  }
  else if (!v48)
  {
LABEL_157:
    if (v47) {
      goto LABEL_158;
    }
LABEL_162:
    if (!v46) {
      goto LABEL_164;
    }
    goto LABEL_163;
  }

  if (!v47) {
    goto LABEL_162;
  }
LABEL_158:

  if (v46) {
LABEL_163:
  }

LABEL_164:
  if (v43) {

  }
  alphaEntryField = self->_alphaEntryField;
  CGFloat v55 = (void *)MEMORY[0x1E4F42A30];
  int v56 = __sb__runningInSpringBoard();
  char v57 = v56;
  if (v56)
  {
    BOOL v58 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    double v53 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v58 = [v53 userInterfaceIdiom] == 1;
  }
  if (v58) {
    double v59 = 27.0;
  }
  else {
    double v59 = 17.0;
  }
  int v60 = __sb__runningInSpringBoard();
  if (v60)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v61 = 0;
      goto LABEL_180;
    }
  }
  else
  {
    uint64_t v45 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v45 userInterfaceIdiom])
    {
      int v61 = 1;
      goto LABEL_180;
    }
  }
  int v61 = v60 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    CGRect v62 = (void **)MEMORY[0x1E4F437A0];
    goto LABEL_181;
  }
LABEL_180:
  CGRect v62 = (void **)MEMORY[0x1E4F43760];
LABEL_181:
  v63 = objc_msgSend(v55, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v62, v59));
  [(SBUIPasscodeEntryField *)alphaEntryField setFont:v63];

  if (v61) {
  if ((v57 & 1) == 0)
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  [(SBUIPasscodeLockViewWithKeyboard *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    CGFloat v5 = [(SBUIPasscodeLockViewWithKeyboard *)self traitCollection];
    uint64_t v6 = [v5 preferredContentSizeCategory];
    CGFloat v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(SBUIPasscodeLockViewWithKeyboard *)self _updateFont];
      [(SBUIPasscodeLockViewWithKeyboard *)self setNeedsLayout];
    }
  }
}

- (void)_updateKeyboardHeightOffsetForKeyboardNotification:(id)a3
{
  id v4 = [a3 userInfo];
  CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v5 CGRectValue];
  double v7 = v6;

  if (v7 > 0.0) {
    self->_keyboardHeightOffset = v7;
  }
}

- (void)_keyboardWillChangeFrameNotification:(id)a3
{
  [(SBUIPasscodeLockViewWithKeyboard *)self _updateKeyboardHeightOffsetForKeyboardNotification:a3];
  [(SBUIPasscodeLockViewWithKeyboard *)self setNeedsLayout];
}

- (void)_keyboardWillShowNotification:(id)a3
{
  self->_keyboardVisible = 1;
  id v4 = a3;
  [(SBUIPasscodeLockViewWithKeyboard *)self _setKeyboardTracksLockView:1];
  [(SBUIPasscodeLockViewWithKeyboard *)self _updateKeyboardHeightOffsetForKeyboardNotification:v4];

  [(SBUIPasscodeLockViewWithKeyboard *)self setNeedsLayout];
}

- (void)_keyboardDidHideNotification:(id)a3
{
  [(SBUIPasscodeLockViewWithKeyboard *)self _setKeyboardTracksLockView:0];
  if (!self->_isResigningResponderStatus)
  {
    self->_keyboardVisible = 0;
    [(SBUIPasscodeLockViewWithKeyboard *)self setNeedsLayout];
  }
}

- (UILabel)statusField
{
  return self->_statusField;
}

- (void)setStatusField:(id)a3
{
}

- (UILabel)statusSubtitleView
{
  return self->_statusSubtitleView;
}

- (void)setStatusSubtitleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusSubtitleView, 0);
  objc_storeStrong((id *)&self->_statusField, 0);
  objc_storeStrong((id *)&self->_keyboardTrackingView, 0);
  objc_storeStrong((id *)&self->_emergencyCallButton, 0);
  objc_storeStrong((id *)&self->_statusFieldBackground, 0);
  objc_storeStrong((id *)&self->_alphaEntryField, 0);
  objc_storeStrong((id *)&self->_keyboardAnimator, 0);
}

@end