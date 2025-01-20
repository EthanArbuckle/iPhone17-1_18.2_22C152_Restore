@interface SBUIPasscodeLockViewWithKeypad
- (BOOL)_includesStatusView;
- (BOOL)_undoInputOnTouchCancellation;
- (BOOL)_usesLightStyle;
- (BOOL)passcodeEntryField:(id)a3 shouldInsertText:(id)a4;
- (CGRect)_defaultEntryFieldPosition;
- (NSString)lastCharacterBeforeBackspace;
- (SBUIPasscodeLockViewWithKeypad)init;
- (SBUIPasscodeLockViewWithKeypad)initWithLightStyle:(BOOL)a3;
- (UILabel)statusSubtitleView;
- (UILabel)statusTitleView;
- (double)_entryFieldBottomYDistanceFromNumberPadTopButton;
- (double)_offsetForCenteringTitleAndEntryFieldFrame:(CGRect)a3 withTopYvalue:(double)a4 bottomYvalue:(double)a5;
- (double)_statusTitleWidth;
- (double)_topBoundingOffset;
- (id)_newEntryField;
- (id)_newStatusSubtitleView;
- (id)_newStatusTitleView;
- (id)_numberPad;
- (id)_numericEntryFieldIfExists;
- (id)_statusSubtitleView;
- (id)_statusSubtitleViewTitleFont;
- (id)_statusTitleView;
- (id)_statusTitleViewTitleFont;
- (id)passcode;
- (void)_layoutStatusView;
- (void)_noteBackspaceHit;
- (void)_noteKeyUp:(id)a3;
- (void)_noteStringEntered:(id)a3 eligibleForPlayingSounds:(BOOL)a4;
- (void)_notifyDelegatePasscodeCancelled;
- (void)_notifyDelegatePasscodeEntered;
- (void)_setHasInput:(BOOL)a3;
- (void)_setUndoInputOnTouchCancellation:(BOOL)a3;
- (void)_toggleForStatusField;
- (void)_updateFonts;
- (void)dealloc;
- (void)layoutSubviews;
- (void)passcodeEntryFieldDidCancelEntry:(id)a3;
- (void)passcodeEntryFieldTextDidChange:(id)a3;
- (void)passcodeLockNumberPad:(id)a3 keyCancelled:(id)a4;
- (void)passcodeLockNumberPad:(id)a3 keyDown:(id)a4;
- (void)passcodeLockNumberPad:(id)a3 keyUp:(id)a4;
- (void)passcodeLockNumberPadEmergencyCallButtonHit:(id)a3;
- (void)reset;
- (void)resetForFailedPasscode;
- (void)setKeypadVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setLastCharacterBeforeBackspace:(id)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsEmergencyCallButton:(BOOL)a3;
- (void)setShowsStatusField:(BOOL)a3;
- (void)setStatusSubtitleView:(id)a3;
- (void)setStatusTitleView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForTransitionToPasscodeView:(BOOL)a3 animated:(BOOL)a4;
- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5;
- (void)willTransitionToPasscodeView;
@end

@implementation SBUIPasscodeLockViewWithKeypad

- (SBUIPasscodeLockViewWithKeypad)init
{
  return [(SBUIPasscodeLockViewWithKeypad *)self initWithLightStyle:0];
}

- (SBUIPasscodeLockViewWithKeypad)initWithLightStyle:(BOOL)a3
{
  v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v30.receiver = self;
  v30.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  v14 = -[SBUIPasscodeLockViewBase initWithFrame:](&v30, sel_initWithFrame_, v7, v9, v11, v13);
  v15 = v14;
  if (v14)
  {
    v14->_useLightStyle = a3;
    id v16 = [(SBUIPasscodeLockViewWithKeypad *)v14 _newStatusTitleView];
    [(SBUIPasscodeLockViewWithKeypad *)v15 setStatusTitleView:v16];

    v17 = [(SBUIPasscodeLockViewBase *)v15 passcodeAuthenticationView];
    v18 = [(SBUIPasscodeLockViewWithKeypad *)v15 statusTitleView];
    [v17 addSubview:v18];

    v19 = [(SBUIPasscodeLockViewBase *)v15 _statusSubtitleText];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      id v21 = [(SBUIPasscodeLockViewWithKeypad *)v15 _newStatusSubtitleView];
      [(SBUIPasscodeLockViewWithKeypad *)v15 setStatusSubtitleView:v21];

      v22 = [(SBUIPasscodeLockViewBase *)v15 passcodeAuthenticationView];
      v23 = [(SBUIPasscodeLockViewWithKeypad *)v15 statusSubtitleView];
      [v22 addSubview:v23];
    }
    id v24 = [(SBUIPasscodeLockViewWithKeypad *)v15 _newEntryField];
    [v24 setDelegate:v15];
    [(SBUIPasscodeLockViewBase *)v15 _setEntryField:v24];
    v25 = [(SBUIPasscodeLockViewBase *)v15 passcodeAuthenticationView];
    [v25 addSubview:v24];

    v26 = [[SBUIPasscodeLockNumberPad alloc] initWithDefaultSizeAndLightStyle:v15->_useLightStyle];
    numberPad = v15->_numberPad;
    v15->_numberPad = v26;

    [(SBUIPasscodeLockNumberPad *)v15->_numberPad setDelegate:v15];
    [(SBUIPasscodeLockNumberPad *)v15->_numberPad setShowsBackspaceButton:0];
    [(SBUIPasscodeLockNumberPad *)v15->_numberPad setShowsEmergencyCallButton:[(SBUIPasscodeLockViewBase *)v15 showsEmergencyCallButton]];
    v28 = [(SBUIPasscodeLockViewBase *)v15 passcodeAuthenticationView];
    [v28 addSubview:v15->_numberPad];

    [(SBUIPasscodeLockViewWithKeypad *)v15 _setHasInput:0];
    v15->_undoInputOnTouchCancellation = 1;
  }
  return v15;
}

- (void)dealloc
{
  [(SBUIPasscodeLockViewBase *)self setPlaysKeypadSounds:0];
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  [(SBUIPasscodeLockViewBase *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  [(SBUIPasscodeLockViewBase *)&v10 layoutSubviews];
  if (!self->_hasPerformedLayoutOnce) {
    self->_hasPerformedLayoutOnce = 1;
  }
  [(SBUIPasscodeLockViewWithKeypad *)self bounds];
  [(SBUIPasscodeLockNumberPad *)self->_numberPad frame];
  UIRectCenteredXInRectScale();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[SBUIPasscodeLockViewBase _numberPadOffsetFromTopOfScreen:](self, "_numberPadOffsetFromTopOfScreen:", self->_numberPad, 0);
  -[SBUIPasscodeLockNumberPad setFrame:](self->_numberPad, "setFrame:", v4, v9, v6, v8);
  [(SBUIPasscodeLockViewWithKeypad *)self _layoutEntryField];
  [(SBUIPasscodeLockViewWithKeypad *)self _layoutStatusView];
  if (self->_statusTitleView) {
    -[SBUIPasscodeLockViewWithKeypad bringSubviewToFront:](self, "bringSubviewToFront:");
  }
}

- (id)passcode
{
  v2 = [(SBUIPasscodeLockViewBase *)self _entryField];
  double v3 = [v2 stringValue];

  return v3;
}

- (void)resetForFailedPasscode
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  [(SBUIPasscodeLockViewBase *)&v3 resetForFailedPasscode];
  [(SBUIPasscodeLockViewWithKeypad *)self _setHasInput:0];
  [(SBUIPasscodeLockViewWithKeypad *)self setLastCharacterBeforeBackspace:0];
}

- (void)reset
{
  [(SBUIPasscodeLockViewWithKeypad *)self setLastCharacterBeforeBackspace:0];
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  [(SBUIPasscodeLockViewBase *)&v3 reset];
  [(SBUIPasscodeLockViewWithKeypad *)self _setHasInput:0];
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase setShowsEmergencyCallButton:](&v5, sel_setShowsEmergencyCallButton_);
  [(SBUIPasscodeLockNumberPad *)self->_numberPad setShowsEmergencyCallButton:v3];
}

- (void)setShowsCancelButton:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase setShowsCancelButton:](&v5, sel_setShowsCancelButton_);
  [(SBUIPasscodeLockNumberPad *)self->_numberPad setShowsCancelButton:v3];
}

- (void)setShowsStatusField:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  [(SBUIPasscodeLockViewBase *)&v4 setShowsStatusField:a3];
  [(SBUIPasscodeLockViewWithKeypad *)self _toggleForStatusField];
}

- (void)setKeypadVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase setKeypadVisible:animated:](&v7, sel_setKeypadVisible_animated_);
  [(SBUIPasscodeLockNumberPad *)self->_numberPad setVisible:v5 animated:v4];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  [(SBUIPasscodeLockViewWithKeypad *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    BOOL v5 = [(SBUIPasscodeLockViewWithKeypad *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    objc_super v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(SBUIPasscodeLockViewWithKeypad *)self _updateFonts];
      [(SBUIPasscodeLockViewWithKeypad *)self setNeedsLayout];
    }
  }
}

- (void)willTransitionToPasscodeView
{
}

- (void)updateForTransitionToPasscodeView:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase updateForTransitionToPasscodeView:animated:](&v10, sel_updateForTransitionToPasscodeView_animated_);
  if (v5)
  {
    objc_super v7 = self;
    uint64_t v8 = 1;
    uint64_t v9 = v4;
  }
  else
  {
    if (!v4) {
      return;
    }
    objc_super v7 = self;
    uint64_t v8 = 0;
    uint64_t v9 = 1;
  }
  [(SBUIPasscodeLockViewWithKeypad *)v7 setKeypadVisible:v8 animated:v9];
}

- (id)_statusTitleView
{
  return self->_statusTitleView;
}

- (id)_statusSubtitleView
{
  return self->_statusSubtitleView;
}

- (id)_numberPad
{
  return self->_numberPad;
}

- (id)_newEntryField
{
  return 0;
}

- (BOOL)_includesStatusView
{
  return 1;
}

- (void)_setHasInput:(BOOL)a3
{
}

- (double)_entryFieldBottomYDistanceFromNumberPadTopButton
{
  return 20.0;
}

- (id)_statusTitleViewTitleFont
{
  return (id)[MEMORY[0x1E4FA5F68] pinKeypadStatusTitleViewTitleFont];
}

- (id)_statusSubtitleViewTitleFont
{
  return (id)[MEMORY[0x1E4FA5F68] pinKeypadStatusSubtitleViewTitleFont];
}

- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  [(SBUIPasscodeLockViewBase *)&v32 updateStatusText:v8 subtitle:v9 animated:v5];
  objc_super v10 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || (unint64_t)([(SBUIPasscodeLockViewBase *)self _orientation] - 3) > 1)
  {
    double v12 = [(SBUIPasscodeLockViewWithKeypad *)self statusTitleView];
    double v13 = [v12 text];
    int v14 = [v8 isEqualToString:v13];

    if (v14)
    {

      double v12 = 0;
      id v15 = 0;
    }
    else
    {
      id v15 = [(SBUIPasscodeLockViewWithKeypad *)self _newStatusTitleView];
      [v15 setText:v8];
      [(SBUIPasscodeLockViewWithKeypad *)self setStatusTitleView:v15];
    }
    id v16 = [(SBUIPasscodeLockViewWithKeypad *)self statusSubtitleView];
    if (v9)
    {
      [(SBUIPasscodeLockViewBase *)self _setStatusSubtitleText:v9];
      id v17 = [(SBUIPasscodeLockViewWithKeypad *)self _newStatusSubtitleView];
      [(SBUIPasscodeLockViewWithKeypad *)self setStatusSubtitleView:v17];
      v18 = [(SBUIPasscodeLockViewBase *)self passcodeAuthenticationView];
      v19 = [(SBUIPasscodeLockViewBase *)self _entryField];
      [v18 insertSubview:v17 belowSubview:v19];
    }
    else
    {
      [(SBUIPasscodeLockViewWithKeypad *)self setStatusSubtitleView:0];
      id v17 = 0;
    }
    [(SBUIPasscodeLockViewWithKeypad *)self setNeedsLayout];
    if (v12 && v15)
    {
      uint64_t v20 = [(SBUIPasscodeLockViewBase *)self passcodeAuthenticationView];
      [v20 insertSubview:v15 aboveSubview:v12];
    }
    if (self->_hasPerformedLayoutOnce && v5)
    {
      [v15 setAlpha:0.0];
      [v17 setAlpha:0.0];
      id v21 = (void *)MEMORY[0x1E4F42FF0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke;
      v29[3] = &unk_1E5CCC878;
      id v30 = v12;
      id v31 = v16;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke_2;
      v26[3] = &unk_1E5CCD258;
      id v27 = v30;
      id v28 = v31;
      [v21 animateWithDuration:v29 animations:v26 completion:0.22];
      v22 = (void *)MEMORY[0x1E4F42FF0];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke_3;
      v23[3] = &unk_1E5CCC878;
      id v24 = v15;
      id v25 = v17;
      [v22 animateWithDuration:0 delay:v23 options:0 animations:0.4 completion:0.17];
    }
    else
    {
      [v12 removeFromSuperview];
      [v16 removeFromSuperview];
    }
  }
  else
  {
    [(SBUIPasscodeLockViewWithKeypad *)self setStatusTitleView:0];
    [(SBUIPasscodeLockViewWithKeypad *)self setStatusSubtitleView:0];
  }
}

uint64_t __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

uint64_t __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

- (double)_statusTitleWidth
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 _referenceBounds];
  double v4 = v3 + -40.0;

  return v4;
}

- (id)_newStatusTitleView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v3 setUserInteractionEnabled:0];
  double v4 = [(SBUIPasscodeLockViewWithKeypad *)self _statusTitleViewTitleFont];
  [v3 setFont:v4];

  [v3 setLineBreakMode:4];
  BOOL v5 = [(SBUIPasscodeLockViewBase *)self _statusText];
  [v3 setText:v5];

  [v3 setAdjustsFontSizeToFitWidth:1];
  double v6 = [v3 font];
  [v6 pointSize];
  [v3 setMinimumScaleFactor:12.0 / v7];

  id v8 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v8];

  if (self->_useLightStyle) {
    [MEMORY[0x1E4F428B8] blackColor];
  }
  else {
  id v9 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  [v3 setTextColor:v9];

  [v3 setTextAlignment:1];
  [v3 setNumberOfLines:1];
  return v3;
}

- (id)_newStatusSubtitleView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v3 setUserInteractionEnabled:0];
  double v4 = [(SBUIPasscodeLockViewWithKeypad *)self _statusSubtitleViewTitleFont];
  [v3 setFont:v4];

  [v3 setLineBreakMode:4];
  [v3 setAdjustsFontSizeToFitWidth:1];
  [v3 setMinimumScaleFactor:0.8];
  BOOL v5 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v5];

  if (self->_useLightStyle) {
    [MEMORY[0x1E4F428B8] blackColor];
  }
  else {
  double v6 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  [v3 setTextColor:v6];

  [v3 setTextAlignment:1];
  double v7 = [(SBUIPasscodeLockViewBase *)self _statusSubtitleText];
  [v3 setText:v7];
  id v8 = [v7 componentsSeparatedByString:@"\n"];
  uint64_t v9 = [v8 count];

  if (v9 == 1) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  [v3 setNumberOfLines:v10];

  return v3;
}

- (double)_offsetForCenteringTitleAndEntryFieldFrame:(CGRect)a3 withTopYvalue:(double)a4 bottomYvalue:(double)a5
{
  double height = a3.size.height;
  double y = a3.origin.y;
  [(SBUIPasscodeLockViewWithKeypad *)self _entryFieldBottomYDistanceFromNumberPadTopButton];
  double v11 = v10;
  double v12 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1 && SBFEffectiveHomeButtonType() == 2) {
    goto LABEL_3;
  }
  id v15 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1 || SBFEffectiveHomeButtonType() != 2) {
    goto LABEL_12;
  }
  uint64_t v17 = SBFEffectiveArtworkSubtype();
  if (v17 > 2795)
  {
    if (v17 != 2796 && v17 != 2868) {
      goto LABEL_3;
    }
LABEL_12:
    [(SBUIPasscodeLockViewWithKeypad *)self _topBoundingOffset];
    return SBUIFloatFloorForMainScreenScale((height + y + v11 - v14 - (a5 - a4)) * 0.5) - (height + y + v11 - a5);
  }
  if (v17 == 2556 || v17 == 2622) {
    goto LABEL_12;
  }
LABEL_3:
  [MEMORY[0x1E4FA5F68] proudLockOffsetFromTopOfScreen];
  return SBUIFloatFloorForMainScreenScale((height + y + v11 - v14 - (a5 - a4)) * 0.5) - (height + y + v11 - a5);
}

- (double)_topBoundingOffset
{
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (!v4)
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom])
    {
      char IsD94Like = _SBF_Private_IsD94Like();

      if (IsD94Like) {
        return 42.0;
      }
      goto LABEL_22;
    }
LABEL_9:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      char v9 = _SBF_Private_IsD94Like();
      goto LABEL_19;
    }
    int v7 = __sb__runningInSpringBoard();
    char v8 = v7;
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      id v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v10 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      char v9 = 0;
      if (v8) {
        goto LABEL_19;
      }
    }
    else
    {
      char v9 = _SBF_Private_IsD94Like();
      if (v8)
      {
LABEL_19:
        if ((v5 & 1) == 0) {

        }
        if (v9) {
          return 42.0;
        }
        goto LABEL_22;
      }
    }

    goto LABEL_19;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_9;
  }
  if (_SBF_Private_IsD94Like()) {
    return 42.0;
  }
LABEL_22:
  int v11 = __sb__runningInSpringBoard();
  char v12 = v11;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_40;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if (v12) {
        goto LABEL_40;
      }
LABEL_32:

      goto LABEL_40;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
      goto LABEL_32;
    }
  }
  int v13 = __sb__runningInSpringBoard();
  char v14 = v13;
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    id v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v16 = v15;
  double v17 = *(double *)(MEMORY[0x1E4FA6E50] + 200);
  if ((v14 & 1) == 0) {

  }
  if ((v12 & 1) == 0) {
  if (v16 >= v17)
  }
    return 87.3333333;
LABEL_40:
  int v19 = __sb__runningInSpringBoard();
  char v20 = v19;
  if (v19)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      if (_SBF_Private_IsD93Like()) {
        return 42.0;
      }
      goto LABEL_47;
    }
LABEL_58:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      char IsD93Like = _SBF_Private_IsD93Like();
      goto LABEL_68;
    }
    int v26 = __sb__runningInSpringBoard();
    char v27 = v26;
    if (v26)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      id v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v29 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      char IsD93Like = 0;
      if (v27) {
        goto LABEL_68;
      }
    }
    else
    {
      char IsD93Like = _SBF_Private_IsD93Like();
      if (v27)
      {
LABEL_68:
        if ((v20 & 1) == 0) {

        }
        if (IsD93Like) {
          return 42.0;
        }
        goto LABEL_47;
      }
    }

    goto LABEL_68;
  }
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if (![v2 userInterfaceIdiom]) {
    goto LABEL_58;
  }
  char v21 = _SBF_Private_IsD93Like();

  if (v21) {
    return 42.0;
  }
LABEL_47:
  int v22 = __sb__runningInSpringBoard();
  char v23 = v22;
  if (v22)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_79;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if (v23) {
        goto LABEL_79;
      }
      goto LABEL_57;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_57:

      goto LABEL_79;
    }
  }
  int v24 = __sb__runningInSpringBoard();
  char v25 = v24;
  if (v24)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    id v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v31 = v30;
  double v32 = *(double *)(MEMORY[0x1E4FA6E50] + 184);
  if ((v25 & 1) == 0) {

  }
  if ((v23 & 1) == 0) {
  if (v31 >= v32)
  }
    return 86.0;
LABEL_79:
  v33 = (void *)MEMORY[0x1E4FA5F68];
  [v33 proudLockOffsetFromTopOfScreen];
  return result;
}

- (CGRect)_defaultEntryFieldPosition
{
  [(SBUIPasscodeLockViewWithKeypad *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  int v11 = [(SBUIPasscodeLockViewBase *)self _entryField];
  [v11 bounds];
  double v13 = v12;
  [(SBUIPasscodeLockNumberPad *)self->_numberPad frame];
  double v15 = v14;
  [(SBUIPasscodeLockNumberPad *)self->_numberPad _distanceToTopOfFirstButton];
  double v17 = v15 + v16;
  [(SBUIPasscodeLockViewWithKeypad *)self _entryFieldBottomYDistanceFromNumberPadTopButton];
  double v19 = v17 - v18 - v13;
  v25.origin.x = v4;
  v25.origin.double y = v6;
  v25.size.width = v8;
  v25.size.double height = v10;
  CGFloat Width = CGRectGetWidth(v25);

  double v21 = 0.0;
  double v22 = v19;
  double v23 = Width;
  double v24 = v13;
  result.size.double height = v24;
  result.size.width = v23;
  result.origin.double y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_layoutStatusView
{
  id v71 = [(SBUIPasscodeLockViewWithKeypad *)self statusTitleView];
  double v3 = [(SBUIPasscodeLockViewWithKeypad *)self statusSubtitleView];
  CGFloat v4 = v3;
  if (v3)
  {
    double v5 = [v3 text];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  [(SBUIPasscodeLockViewWithKeypad *)self bounds];
  double v8 = v7;
  double v9 = [(SBUIPasscodeLockViewBase *)self _entryField];
  [(SBUIPasscodeLockViewWithKeypad *)self _defaultEntryFieldPosition];
  double v67 = v10;
  double v68 = v11;
  double v13 = v12;
  double v69 = v14;
  [(SBUIPasscodeLockViewWithKeypad *)self _statusTitleWidth];
  double v16 = v15;
  double v17 = (double *)MEMORY[0x1E4F1DB28];
  double v18 = *MEMORY[0x1E4F1DB28];
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [v71 setLineBreakMode:0];
  [v71 setNumberOfLines:2];
  double v70 = v8;
  objc_msgSend(v71, "sizeThatFits:", v16, v8);
  CGFloat v21 = v20;
  double v23 = v22;
  objc_msgSend(v71, "setBounds:", v18, v19, v20, v22);
  if (v6)
  {
    [v4 setLineBreakMode:0];
    [v4 setNumberOfLines:2];
    double v25 = *MEMORY[0x1E4F1DAD8];
    double v24 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(v4, "sizeThatFits:", v16, v70);
    double v64 = v13;
    objc_msgSend(v4, "setBounds:", v25, v24, v26, v27);
    double v17 = (double *)0x1E4FA5000;
    [MEMORY[0x1E4FA5F68] pinKeypadStatusTitleBaselineOffsetFromEntryFieldIncludingSubtitle];
    CGFloat v28 = v23;
    double v30 = v13 - v29;
    [MEMORY[0x1E4FA5F68] pinKeypadStatusTitleBaselineOffsetFromTitle];
    [v71 _lastLineBaseline];
    double v32 = v31;
    [MEMORY[0x1E4FA5F68] pinKeypadStatusTitleExtraOffsetIncludingSubtitle];
    double v34 = v30 - (v32 + v33);
    [v4 _firstLineBaselineOffsetFromBoundsTop];
    [MEMORY[0x1E4FA5F68] pinKeypadStatusSubtitleTitleExtraOffset];
    double v35 = fmax(v34, 0.0);
    if (SBUIPasscodeScreenShouldNotWrapSubtitle([(SBUIPasscodeLockViewBase *)self _orientation])) {
      double v35 = v35 + 20.0;
    }
    v73.origin.x = v18;
    v73.origin.double y = v35;
    v73.size.width = v21;
    v73.size.double height = v28;
    CGRectGetMaxY(v73);
    UIRectCenteredXInRectScale();
    double v37 = v36;
    double v19 = v38;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    objc_msgSend(MEMORY[0x1E4FA5F68], "pinKeypadEntryFieldOffsetForSubtitle", 0);
    double v44 = v64 + v43;
    v74.origin.x = v37;
    v74.origin.double y = v19;
    double v66 = v40;
    v74.size.width = v40;
    v74.size.double height = v42;
    double MaxY = CGRectGetMaxY(v74);
    if (v44 >= MaxY) {
      double v46 = v44;
    }
    else {
      double v46 = MaxY;
    }
    double v47 = v35;
  }
  else
  {
    CGFloat v42 = v17[3];
    double v66 = v17[2];
    [MEMORY[0x1E4FA5F68] pinKeypadStatusTitleBaselineOffsetFromEntryField];
    double v46 = v13;
    double v49 = v13 - v48;
    [v71 _lastLineBaseline];
    double v47 = v49 - v50;
    double v37 = v18;
  }
  int v51 = __sb__runningInSpringBoard();
  double v65 = v42;
  if (v51)
  {
    char v52 = v51;
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_26;
    }
    if (SBFEffectiveHomeButtonType() == 2)
    {
      if (![(SBUIPasscodeLockViewBase *)self _isBoundsPortraitOriented]) {
        goto LABEL_26;
      }
      goto LABEL_21;
    }
    if (v52) {
      goto LABEL_26;
    }
LABEL_25:

    goto LABEL_26;
  }
  double v17 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v17 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
    goto LABEL_25;
  }
  BOOL v53 = [(SBUIPasscodeLockViewBase *)self _isBoundsPortraitOriented];

  if (!v53) {
    goto LABEL_26;
  }
LABEL_21:
  [v71 _capOffsetFromBoundsTop];
  -[SBUIPasscodeLockViewWithKeypad _offsetForCenteringTitleAndEntryFieldFrame:withTopYvalue:bottomYvalue:](self, "_offsetForCenteringTitleAndEntryFieldFrame:withTopYvalue:bottomYvalue:", v67, v46, v69, v68, v47 + v54, v68 + v46);
  double v46 = v46 - v55;
  if (!v6) {
    double v55 = 0.0;
  }
  double v19 = v19 - v55;
LABEL_26:
  UIRectCenteredXInRectScale();
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  objc_msgSend(v71, "setPreferredMaxLayoutWidth:", v60, 0);
  objc_msgSend(v71, "setFrame:", v57, v59, v61, v63);
  objc_msgSend(v9, "setFrame:", v67, v46, v69, v68);
  if (v6) {
    objc_msgSend(v4, "setFrame:", v37, v19, v66, v65);
  }
}

- (void)_toggleForStatusField
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self showsStatusField] ^ 1;
  [(UILabel *)self->_statusTitleView setHidden:v3];
  statusSubtitleView = self->_statusSubtitleView;
  [(UILabel *)statusSubtitleView setHidden:v3];
}

- (void)_notifyDelegatePasscodeEntered
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v3)
  {
    CGFloat v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 passcodeLockViewPasscodeEntered:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)_notifyDelegatePasscodeCancelled
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v3)
  {
    CGFloat v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 passcodeLockViewCancelButtonPressed:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)_noteStringEntered:(id)a3 eligibleForPlayingSounds:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v9 = v6;
    if (v4 && [(SBUIPasscodeLockViewBase *)self playsKeypadSounds])
    {
      double v7 = [(SBUIPasscodeLockViewBase *)self keyboardFeedbackBehavior];
      [v7 actionOccurred:1];
    }
    double v8 = [(SBUIPasscodeLockViewBase *)self _entryField];
    [v8 appendString:v9];

    id v6 = v9;
  }
}

- (void)_noteBackspaceHit
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self _entryField];
  BOOL v4 = [v3 stringValue];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [(SBUIPasscodeLockViewBase *)self _entryField];
    double v7 = [v6 stringValue];
    double v8 = [v7 substringFromIndex:v5 - 1];
    [(SBUIPasscodeLockViewWithKeypad *)self setLastCharacterBeforeBackspace:v8];

    id v9 = [(SBUIPasscodeLockViewBase *)self _entryField];
    [v9 deleteLastCharacter];
  }
}

- (void)_noteKeyUp:(id)a3
{
  if ([a3 characterType] == 1) {
    [(SBUIPasscodeLockViewBase *)self _sendDelegateKeypadKeyUp];
  }
  [(SBUIPasscodeLockViewWithKeypad *)self setLastCharacterBeforeBackspace:0];
  BOOL v4 = [(SBUIPasscodeLockViewBase *)self _entryField];
  id v7 = [v4 stringValue];

  uint64_t v5 = [(SBUIPasscodeLockViewWithKeypad *)self _numericEntryFieldIfExists];
  if (v5)
  {
    unint64_t v6 = [v7 length];
    if (v6 >= [v5 maxNumbersAllowed]) {
      [(SBUIPasscodeLockViewWithKeypad *)self _notifyDelegatePasscodeEntered];
    }
  }
}

- (id)_numericEntryFieldIfExists
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self _entryField];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(SBUIPasscodeLockViewBase *)self _entryField];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)_usesLightStyle
{
  return self->_useLightStyle;
}

- (void)_updateFonts
{
  statusTitleView = self->_statusTitleView;
  BOOL v4 = [(SBUIPasscodeLockViewWithKeypad *)self _statusTitleViewTitleFont];
  [(UILabel *)statusTitleView setFont:v4];

  statusSubtitleView = self->_statusSubtitleView;
  id v6 = [(SBUIPasscodeLockViewWithKeypad *)self _statusSubtitleViewTitleFont];
  [(UILabel *)statusSubtitleView setFont:v6];
}

- (void)passcodeLockNumberPad:(id)a3 keyDown:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [(SBUIPasscodeLockViewWithKeypad *)self _numericEntryFieldIfExists];
  [v5 setAutoAcceptWhenMaxNumbersMet:0];

  int v6 = [v8 characterType];
  if (v6 == 1)
  {
    [(SBUIPasscodeLockViewBase *)self _sendDelegateKeypadKeyDown];
    id v7 = [v8 stringCharacter];
    [(SBUIPasscodeLockViewWithKeypad *)self _noteStringEntered:v7 eligibleForPlayingSounds:1];
  }
  else if (v6 == 2)
  {
    [(SBUIPasscodeLockViewWithKeypad *)self _noteBackspaceHit];
  }
}

- (void)passcodeLockNumberPad:(id)a3 keyUp:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(SBUIPasscodeLockViewWithKeypad *)self _numericEntryFieldIfExists];
  [v5 setAutoAcceptWhenMaxNumbersMet:1];

  [(SBUIPasscodeLockViewWithKeypad *)self _noteKeyUp:v6];
}

- (void)passcodeLockNumberPad:(id)a3 keyCancelled:(id)a4
{
  id v7 = a4;
  uint64_t v5 = [(SBUIPasscodeLockViewWithKeypad *)self _numericEntryFieldIfExists];
  [v5 setAutoAcceptWhenMaxNumbersMet:1];

  int v6 = [v7 characterType];
  if (v6 == 2)
  {
    if (!self->_lastCharacterBeforeBackspace) {
      goto LABEL_9;
    }
    if (self->_undoInputOnTouchCancellation) {
      -[SBUIPasscodeLockViewWithKeypad _noteStringEntered:eligibleForPlayingSounds:](self, "_noteStringEntered:eligibleForPlayingSounds:");
    }
  }
  else
  {
    if (v6 != 1) {
      goto LABEL_9;
    }
    if (self->_undoInputOnTouchCancellation) {
      [(SBUIPasscodeLockViewWithKeypad *)self _noteBackspaceHit];
    }
  }
  [(SBUIPasscodeLockViewWithKeypad *)self _noteKeyUp:v7];
LABEL_9:
}

- (void)passcodeLockNumberPadEmergencyCallButtonHit:(id)a3
{
  uint64_t v4 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 passcodeLockViewEmergencyCallButtonPressed:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)passcodeEntryFieldDidCancelEntry:(id)a3
{
  if ([(SBUIPasscodeLockViewBase *)self showsCancelButton])
  {
    [(SBUIPasscodeLockViewWithKeypad *)self _notifyDelegatePasscodeCancelled];
  }
}

- (BOOL)passcodeEntryField:(id)a3 shouldInsertText:(id)a4
{
  return 1;
}

- (void)passcodeEntryFieldTextDidChange:(id)a3
{
  uint64_t v4 = [a3 stringValue];
  -[SBUIPasscodeLockViewWithKeypad _setHasInput:](self, "_setHasInput:", [v4 length] != 0);

  uint64_t v5 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v5)
  {
    int v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      [v6 passcodeLockViewPasscodeDidChange:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (BOOL)_undoInputOnTouchCancellation
{
  return self->_undoInputOnTouchCancellation;
}

- (void)_setUndoInputOnTouchCancellation:(BOOL)a3
{
  self->_undoInputOnTouchCancellation = a3;
}

- (NSString)lastCharacterBeforeBackspace
{
  return self->_lastCharacterBeforeBackspace;
}

- (void)setLastCharacterBeforeBackspace:(id)a3
{
}

- (UILabel)statusTitleView
{
  return self->_statusTitleView;
}

- (void)setStatusTitleView:(id)a3
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
  objc_storeStrong((id *)&self->_lastCharacterBeforeBackspace, 0);
  objc_storeStrong((id *)&self->_numberPad, 0);
  objc_storeStrong((id *)&self->_statusSubtitleView, 0);
  objc_storeStrong((id *)&self->_statusTitleView, 0);
}

@end