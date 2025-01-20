@interface SBUIPasscodeBiometricAuthenticationView
- (BOOL)ancillaryButtonsVisible;
- (BOOL)faceIDUsePasscodeButtonVisible;
- (BOOL)showsCancelButton;
- (BOOL)showsEmergencyCallButton;
- (BOOL)showsLockIconForFaceID;
- (NSLayoutConstraint)faceIDLabelFaceIDReasonBaselineConstraint;
- (NSString)faceIDReason;
- (NSString)faceIDReasonLine2;
- (NSString)overrideFaceIDReason;
- (NSString)passcodeButtonTitle;
- (NSString)touchIDReason;
- (NSString)unlockDestination;
- (PKGlyphView)touchIDGlyphView;
- (SBUIButton)cancelButton;
- (SBUIButton)emergencyCallButton;
- (SBUIButton)touchIDUsePasscodeButton;
- (SBUIPasscodeBiometricAuthenticationView)initWithFrame:(CGRect)a3 layoutDelegate:(id)a4;
- (SBUIPasscodeBiometricAuthenticationViewDelegate)delegate;
- (SBUIPasscodeBiometricAuthenticationViewLayoutDelegate)layoutDelegate;
- (SBUIPasscodePillButton)faceIDUsePasscodeButton;
- (UIButton)backgroundCancelButton;
- (UIButton)invisibleUsePasscodeButton;
- (UIImageView)faceIDLockIcon;
- (UILabel)faceIDLabel;
- (UILabel)faceIDReasonLabel;
- (UILabel)touchIDReasonLabel;
- (UILayoutGuide)cancelButtonLayoutGuide;
- (UILayoutGuide)faceIDLabelAndReasonHelperGuide;
- (UILayoutGuide)faceIDLabelAndReasonLayoutGuide;
- (UILayoutGuide)touchIDGlyphLayoutGuide;
- (double)_leadingForFaceIDReason;
- (unint64_t)type;
- (void)_cancelButtonHit;
- (void)_emergencyCallButtonHit;
- (void)_layoutAuthReasonLabel:(id)a3;
- (void)_noteContentSizeCategoryDidChange;
- (void)_setFaceIDReason2:(id)a3;
- (void)_setFaceIDReason:(id)a3;
- (void)_setFaceIDReasonLine2:(id)a3;
- (void)_setTouchIDReason:(id)a3;
- (void)_updateConstraints;
- (void)_updateReasonTextIfPossible;
- (void)_updateSubviews;
- (void)_usePasscodeButtonHit;
- (void)layoutSubviews;
- (void)setAncillaryButtonsVisible:(BOOL)a3;
- (void)setAncillaryButtonsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setBackgroundCancelButton:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCancelButtonLayoutGuide:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmergencyCallButton:(id)a3;
- (void)setFaceIDLabel:(id)a3;
- (void)setFaceIDLabelAndReasonHelperGuide:(id)a3;
- (void)setFaceIDLabelAndReasonLayoutGuide:(id)a3;
- (void)setFaceIDLabelFaceIDReasonBaselineConstraint:(id)a3;
- (void)setFaceIDLockIcon:(id)a3;
- (void)setFaceIDReasonLabel:(id)a3;
- (void)setFaceIDUsePasscodeButton:(id)a3;
- (void)setFaceIDUsePasscodeButtonVisible:(BOOL)a3;
- (void)setGlyphViewState:(int64_t)a3;
- (void)setGlyphViewState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setInvisibleUsePasscodeButton:(id)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setPasscodeButtonTitle:(id)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsEmergencyCallButton:(BOOL)a3;
- (void)setShowsLockIconForFaceID:(BOOL)a3;
- (void)setTouchIDGlyphLayoutGuide:(id)a3;
- (void)setTouchIDGlyphView:(id)a3;
- (void)setTouchIDReasonLabel:(id)a3;
- (void)setTouchIDUsePasscodeButton:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUnlockDestination:(id)a3;
@end

@implementation SBUIPasscodeBiometricAuthenticationView

- (SBUIPasscodeBiometricAuthenticationView)initWithFrame:(CGRect)a3 layoutDelegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBUIPasscodeBiometricAuthenticationView;
  v10 = -[SBUIPasscodeBiometricAuthenticationView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(SBUIPasscodeBiometricAuthenticationView *)v10 setLayoutDelegate:v9];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v11 selector:sel__noteContentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];
  }
  return v11;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeBiometricAuthenticationView;
  [(SBUIPasscodeBiometricAuthenticationView *)&v3 layoutSubviews];
  [(SBUIPasscodeBiometricAuthenticationView *)self _layoutAuthReasonLabel:self->_touchIDReasonLabel];
  [(SBUIPasscodeBiometricAuthenticationView *)self _layoutAuthReasonLabel:self->_faceIDReasonLabel];
}

- (void)_layoutAuthReasonLabel:(id)a3
{
  id v3 = a3;
  [v3 frame];
  objc_msgSend(v3, "setFrame:");
  [v3 setPreferredMaxLayoutWidth:246.0];
  [v3 sizeToFit];
}

- (void)setType:(unint64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    [(SBUIPasscodeBiometricAuthenticationView *)self _updateReasonTextIfPossible];
    [(SBUIPasscodeBiometricAuthenticationView *)self _updateSubviews];
    [(SBUIPasscodeBiometricAuthenticationView *)self _updateConstraints];
  }
}

- (void)setUnlockDestination:(id)a3
{
  v4 = (NSString *)[a3 copy];
  unlockDestination = self->_unlockDestination;
  self->_unlockDestination = v4;

  [(SBUIPasscodeBiometricAuthenticationView *)self _updateReasonTextIfPossible];
}

- (void)_updateReasonTextIfPossible
{
  if (self->_unlockDestination)
  {
    id v3 = NSString;
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"TOUCH_ID_REASON" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
    v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, self->_unlockDestination);
    [(SBUIPasscodeBiometricAuthenticationView *)self _setTouchIDReason:v6];

    unint64_t type = self->_type;
    if (type == 3)
    {
      id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v10 = [v9 localizedStringForKey:@"UNLOCKING_WITH_WATCH_REASON_LINE_1" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
      [(SBUIPasscodeBiometricAuthenticationView *)self _setFaceIDReason:v10];
    }
    else
    {
      if (type != 2)
      {
LABEL_10:
        v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v19 = [v18 localizedStringForKey:@"FACE_ID_REASON_LINE_2" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

        v20 = objc_msgSend(NSString, "localizedStringWithFormat:", v19, self->_unlockDestination);
        [(SBUIPasscodeBiometricAuthenticationView *)self _setFaceIDReasonLine2:v20];

        goto LABEL_14;
      }
      v8 = NSString;
      id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v10 = [v9 localizedStringForKey:@"FACE_ID_REASON_LINE_1" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
      v11 = [v8 localizedStringWithFormat:v10];
      [(SBUIPasscodeBiometricAuthenticationView *)self _setFaceIDReason:v11];
    }
    goto LABEL_10;
  }
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"TOUCH_ID_NO_REASON" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
  [(SBUIPasscodeBiometricAuthenticationView *)self _setTouchIDReason:v13];

  unint64_t v14 = self->_type;
  if (v14 == 3)
  {
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = v15;
    v17 = @"UNLOCKING_WITH_WATCH_LABEL";
    goto LABEL_12;
  }
  if (v14 == 2)
  {
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = v15;
    v17 = @"FACE_ID_LABEL";
LABEL_12:
    v21 = [v15 localizedStringForKey:v17 value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
    [(SBUIPasscodeBiometricAuthenticationView *)self _setFaceIDReason:v21];
  }
  [(SBUIPasscodeBiometricAuthenticationView *)self _setFaceIDReasonLine2:@" "];
LABEL_14:
  [(SBUIPasscodeBiometricAuthenticationView *)self setNeedsLayout];
}

- (BOOL)showsEmergencyCallButton
{
  return [(SBUIButton *)self->_emergencyCallButton isHidden] ^ 1;
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
}

- (BOOL)showsCancelButton
{
  return [(SBUIButton *)self->_cancelButton isHidden] ^ 1;
}

- (void)setShowsCancelButton:(BOOL)a3
{
}

- (void)setAncillaryButtonsVisible:(BOOL)a3
{
}

- (void)setAncillaryButtonsVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_ancillaryButtonsVisible != a3)
  {
    self->_ancillaryButtonsVisible = a3;
    double v4 = 0.3;
    if (!a4) {
      double v4 = 0.0;
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __79__SBUIPasscodeBiometricAuthenticationView_setAncillaryButtonsVisible_animated___block_invoke;
    v5[3] = &unk_1E5CCC580;
    v5[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v5 options:0 animations:v4 completion:0.0];
  }
}

uint64_t __79__SBUIPasscodeBiometricAuthenticationView_setAncillaryButtonsVisible_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 416)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [*(id *)(v2 + 528) setAlpha:v3];
  [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:v3];
  double v4 = *(void **)(*(void *)(a1 + 32) + 520);
  return [v4 setAlpha:v3];
}

- (void)setFaceIDUsePasscodeButtonVisible:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__SBUIPasscodeBiometricAuthenticationView_setFaceIDUsePasscodeButtonVisible___block_invoke;
  v3[3] = &unk_1E5CCC5A8;
  v3[4] = self;
  BOOL v4 = a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v3 options:0 animations:0.3 completion:0.0];
}

uint64_t __77__SBUIPasscodeBiometricAuthenticationView_setFaceIDUsePasscodeButtonVisible___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 504);
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 560) setAlpha:v4];
  if (*(unsigned char *)(a1 + 40)) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 576) setAlpha:v5];
  v6 = *(void **)(*(void *)(a1 + 32) + 568);
  if (*(unsigned char *)(a1 + 40)) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  return [v6 setAlpha:v7];
}

- (void)setGlyphViewState:(int64_t)a3
{
}

- (void)setGlyphViewState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)_updateSubviews
{
  double v3 = [(SBUIPasscodeBiometricAuthenticationView *)self layer];
  [v3 setAllowsGroupBlending:0];

  unint64_t v4 = [(SBUIPasscodeBiometricAuthenticationView *)self type];
  BOOL v5 = [(SBUIPasscodeBiometricAuthenticationView *)self type] == 2
    || [(SBUIPasscodeBiometricAuthenticationView *)self type] == 3;
  unint64_t v6 = [(SBUIPasscodeBiometricAuthenticationView *)self type];
  touchIDGlyphLayoutGuide = self->_touchIDGlyphLayoutGuide;
  if (v4 == 1)
  {
    if (!touchIDGlyphLayoutGuide)
    {
      v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
      id v9 = self->_touchIDGlyphLayoutGuide;
      self->_touchIDGlyphLayoutGuide = v8;

      [(SBUIPasscodeBiometricAuthenticationView *)self addLayoutGuide:self->_touchIDGlyphLayoutGuide];
    }
    if (!self->_touchIDGlyphView)
    {
      uint64_t v107 = 0;
      v108 = &v107;
      uint64_t v109 = 0x2050000000;
      v10 = (void *)getPKGlyphViewClass_softClass;
      uint64_t v110 = getPKGlyphViewClass_softClass;
      if (!getPKGlyphViewClass_softClass)
      {
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __getPKGlyphViewClass_block_invoke;
        v106[3] = &unk_1E5CCC5D0;
        v106[4] = &v107;
        __getPKGlyphViewClass_block_invoke((uint64_t)v106);
        v10 = (void *)v108[3];
      }
      v11 = v10;
      _Block_object_dispose(&v107, 8);
      v12 = (PKGlyphView *)[[v11 alloc] initWithStyle:4];
      touchIDGlyphView = self->_touchIDGlyphView;
      self->_touchIDGlyphView = v12;

      unint64_t v14 = self->_touchIDGlyphView;
      v15 = [MEMORY[0x1E4F42D90] mainScreen];
      [v15 scale];
      -[PKGlyphView updateRasterizationScale:](v14, "updateRasterizationScale:");

      [(PKGlyphView *)self->_touchIDGlyphView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PKGlyphView *)self->_touchIDGlyphView setState:0];
      [(PKGlyphView *)self->_touchIDGlyphView setAlpha:0.8];
      [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_touchIDGlyphView];
    }
    if (!self->_touchIDReasonLabel)
    {
      v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      touchIDReasonLabel = self->_touchIDReasonLabel;
      self->_touchIDReasonLabel = v16;

      v18 = self->_touchIDReasonLabel;
      v19 = objc_msgSend(MEMORY[0x1E4F42A30], "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory((void *)*MEMORY[0x1E4F43780], 18.0));
      [(UILabel *)v18 setFont:v19];

      v20 = self->_touchIDReasonLabel;
      v21 = [MEMORY[0x1E4F428B8] clearColor];
      [(UILabel *)v20 setBackgroundColor:v21];

      v22 = self->_touchIDReasonLabel;
      v23 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.48];
      [(UILabel *)v22 setTextColor:v23];

      v24 = [(UILabel *)self->_touchIDReasonLabel layer];
      v25 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
      [v24 setCompositingFilter:v25];

      [(UILabel *)self->_touchIDReasonLabel setTextAlignment:1];
      [(UILabel *)self->_touchIDReasonLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)self->_touchIDReasonLabel setNumberOfLines:0];
      [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_touchIDReasonLabel];
    }
  }
  else
  {
    [(SBUIPasscodeBiometricAuthenticationView *)self removeLayoutGuide:touchIDGlyphLayoutGuide];
    v26 = self->_touchIDGlyphLayoutGuide;
    self->_touchIDGlyphLayoutGuide = 0;

    [(PKGlyphView *)self->_touchIDGlyphView removeFromSuperview];
    v27 = self->_touchIDGlyphView;
    self->_touchIDGlyphView = 0;

    [(UILabel *)self->_touchIDReasonLabel removeFromSuperview];
    v28 = self->_touchIDReasonLabel;
    self->_touchIDReasonLabel = 0;
  }
  backgroundCancelButton = self->_backgroundCancelButton;
  if (v6)
  {
    if (!backgroundCancelButton)
    {
      v30 = +[SBUIButton buttonWithType:1];
      v31 = self->_backgroundCancelButton;
      self->_backgroundCancelButton = v30;

      [(UIButton *)self->_backgroundCancelButton addTarget:self action:sel__cancelButtonHit forControlEvents:1];
      [(UIButton *)self->_backgroundCancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIButton *)self->_backgroundCancelButton sbui_removePointerInteraction];
      [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_backgroundCancelButton];
      v32 = +[SBUIButton buttonWithType:1];
      invisibleUsePasscodeButton = self->_invisibleUsePasscodeButton;
      self->_invisibleUsePasscodeButton = v32;

      [(UIButton *)self->_invisibleUsePasscodeButton addTarget:self action:sel__usePasscodeButtonHit forControlEvents:64];
      [(UIButton *)self->_invisibleUsePasscodeButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIButton *)self->_invisibleUsePasscodeButton sbui_removePointerInteraction];
      [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_invisibleUsePasscodeButton];
    }
  }
  else
  {
    [(UIButton *)backgroundCancelButton removeFromSuperview];
    v34 = self->_backgroundCancelButton;
    self->_backgroundCancelButton = 0;
  }
  faceIDLabel = self->_faceIDLabel;
  if (v5)
  {
    if (!faceIDLabel)
    {
      v36 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      v37 = self->_faceIDLabel;
      self->_faceIDLabel = v36;

      v38 = self->_faceIDLabel;
      v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v40 = [v39 localizedStringForKey:@"FACE_ID_LABEL" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
      [(UILabel *)v38 setText:v40];

      v41 = self->_faceIDLabel;
      v42 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F0]];
      [(UILabel *)v41 setFont:v42];

      [(UILabel *)self->_faceIDLabel setAdjustsFontForContentSizeCategory:1];
      v43 = self->_faceIDLabel;
      v44 = [MEMORY[0x1E4F428B8] clearColor];
      [(UILabel *)v43 setBackgroundColor:v44];

      v45 = self->_faceIDLabel;
      v46 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.48];
      [(UILabel *)v45 setTextColor:v46];

      v47 = [(UILabel *)self->_faceIDLabel layer];
      v48 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
      [v47 setCompositingFilter:v48];

      [(UILabel *)self->_faceIDLabel setTextAlignment:1];
      [(UILabel *)self->_faceIDLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_faceIDLabel];
    }
    if (!self->_faceIDReasonLabel)
    {
      v49 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      faceIDReasonLabel = self->_faceIDReasonLabel;
      self->_faceIDReasonLabel = v49;

      v51 = self->_faceIDReasonLabel;
      v52 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F0]];
      [(UILabel *)v51 setFont:v52];

      [(UILabel *)self->_faceIDReasonLabel setAdjustsFontForContentSizeCategory:1];
      v53 = self->_faceIDReasonLabel;
      v54 = [MEMORY[0x1E4F428B8] clearColor];
      [(UILabel *)v53 setBackgroundColor:v54];

      v55 = self->_faceIDReasonLabel;
      v56 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.23];
      [(UILabel *)v55 setTextColor:v56];

      v57 = [(UILabel *)self->_faceIDReasonLabel layer];
      v58 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
      [v57 setCompositingFilter:v58];

      [(UILabel *)self->_faceIDReasonLabel setTextAlignment:1];
      [(UILabel *)self->_faceIDReasonLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)self->_faceIDReasonLabel setNumberOfLines:0];
      [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_faceIDReasonLabel];
    }
    if (!self->_faceIDLabelAndReasonLayoutGuide)
    {
      v59 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
      faceIDLabelAndReasonLayoutGuide = self->_faceIDLabelAndReasonLayoutGuide;
      self->_faceIDLabelAndReasonLayoutGuide = v59;

      [(SBUIPasscodeBiometricAuthenticationView *)self addLayoutGuide:self->_faceIDLabelAndReasonLayoutGuide];
    }
    if (!self->_faceIDLabelAndReasonHelperGuide)
    {
      v61 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
      faceIDLabelAndReasonHelperGuide = self->_faceIDLabelAndReasonHelperGuide;
      self->_faceIDLabelAndReasonHelperGuide = v61;

      [(SBUIPasscodeBiometricAuthenticationView *)self addLayoutGuide:self->_faceIDLabelAndReasonHelperGuide];
    }
    if (!self->_faceIDUsePasscodeButton)
    {
      v63 = [SBUIPasscodePillButton alloc];
      v64 = -[SBUIPasscodePillButton initWithFrame:](v63, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      faceIDUsePasscodeButton = self->_faceIDUsePasscodeButton;
      self->_faceIDUsePasscodeButton = v64;

      v66 = self->_faceIDUsePasscodeButton;
      v67 = (void *)MEMORY[0x1E4F42A30];
      v68 = [MEMORY[0x1E4F42A38] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4F438F0] addingSymbolicTraits:0x8000 options:1];
      v69 = [v67 fontWithDescriptor:v68 size:0.0];
      [(SBUIPasscodePillButton *)v66 setFont:v69];

      v70 = self->_faceIDUsePasscodeButton;
      v71 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v72 = [v71 localizedStringForKey:@"USE_PASSCODE" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
      [(SBUIPasscodePillButton *)v70 setTitle:v72];

      [(SBUIPasscodePillButton *)self->_faceIDUsePasscodeButton addTarget:self action:sel__usePasscodeButtonHit forControlEvents:64];
      [(SBUIPasscodePillButton *)self->_faceIDUsePasscodeButton setAlpha:0.0];
      [(SBUIPasscodePillButton *)self->_faceIDUsePasscodeButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_faceIDUsePasscodeButton];
    }
  }
  else
  {
    [(UILabel *)faceIDLabel removeFromSuperview];
    v73 = self->_faceIDLabel;
    self->_faceIDLabel = 0;

    [(UILabel *)self->_faceIDReasonLabel removeFromSuperview];
    v74 = self->_faceIDReasonLabel;
    self->_faceIDReasonLabel = 0;

    [(SBUIPasscodePillButton *)self->_faceIDUsePasscodeButton removeFromSuperview];
    v75 = self->_faceIDUsePasscodeButton;
    self->_faceIDUsePasscodeButton = 0;

    [(UIImageView *)self->_faceIDLockIcon removeFromSuperview];
    faceIDLockIcon = self->_faceIDLockIcon;
    self->_faceIDLockIcon = 0;

    v77 = self->_faceIDLabelAndReasonLayoutGuide;
    self->_faceIDLabelAndReasonLayoutGuide = 0;

    v78 = self->_faceIDLabelAndReasonHelperGuide;
    self->_faceIDLabelAndReasonHelperGuide = 0;
  }
  touchIDUsePasscodeButton = self->_touchIDUsePasscodeButton;
  if (v4 == 1)
  {
    if (!touchIDUsePasscodeButton)
    {
      v80 = +[SBUIButton buttonWithType:1];
      v81 = self->_touchIDUsePasscodeButton;
      self->_touchIDUsePasscodeButton = v80;

      v82 = self->_touchIDUsePasscodeButton;
      v83 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v84 = [v83 localizedStringForKey:@"USE_PASSCODE" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
      [(SBUIButton *)v82 setTitle:v84 forState:0];

      [(SBUIButton *)self->_touchIDUsePasscodeButton addTarget:self action:sel__usePasscodeButtonHit forControlEvents:64];
      v85 = self->_touchIDUsePasscodeButton;
      v86 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.48];
      [(SBUIButton *)v85 setTitleColor:v86 forState:0];

      v87 = [(SBUIButton *)self->_touchIDUsePasscodeButton layer];
      v88 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
      [v87 setCompositingFilter:v88];

      [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_touchIDUsePasscodeButton];
    }
  }
  else
  {
    [(SBUIButton *)touchIDUsePasscodeButton removeFromSuperview];
    v89 = self->_touchIDUsePasscodeButton;
    self->_touchIDUsePasscodeButton = 0;
  }
  if (!self->_cancelButtonLayoutGuide)
  {
    v90 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    cancelButtonLayoutGuide = self->_cancelButtonLayoutGuide;
    self->_cancelButtonLayoutGuide = v90;

    [(SBUIPasscodeBiometricAuthenticationView *)self addLayoutGuide:self->_cancelButtonLayoutGuide];
  }
  if (!self->_cancelButton)
  {
    v92 = +[SBUIButton buttonWithType:1];
    cancelButton = self->_cancelButton;
    self->_cancelButton = v92;

    v94 = self->_cancelButton;
    v95 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v96 = [v95 localizedStringForKey:@"PASSCODE_CANCEL" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
    [(SBUIButton *)v94 setTitle:v96 forState:0];

    [(SBUIButton *)self->_cancelButton addTarget:self action:sel__cancelButtonHit forControlEvents:64];
    v97 = self->_cancelButton;
    v98 = [MEMORY[0x1E4F428B8] whiteColor];
    [(SBUIButton *)v97 setTitleColor:v98 forState:0];

    [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_cancelButton];
  }
  if (!self->_emergencyCallButton)
  {
    v99 = +[SBUIButton buttonWithType:1];
    emergencyCallButton = self->_emergencyCallButton;
    self->_emergencyCallButton = v99;

    v101 = self->_emergencyCallButton;
    v102 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v103 = [v102 localizedStringForKey:@"PASSCODE_EMERGENCY" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
    [(SBUIButton *)v101 setTitle:v103 forState:0];

    [(SBUIButton *)self->_emergencyCallButton addTarget:self action:sel__emergencyCallButtonHit forControlEvents:64];
    v104 = self->_emergencyCallButton;
    v105 = [MEMORY[0x1E4F428B8] whiteColor];
    [(SBUIButton *)v104 setTitleColor:v105 forState:0];

    [(SBUIButton *)self->_emergencyCallButton setExclusiveTouch:1];
    [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_emergencyCallButton];
  }
}

- (void)_updateConstraints
{
  v185[4] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBUIPasscodeBiometricAuthenticationView *)self type];
  v169 = self;
  if (v3 - 2 < 2)
  {
    emergencyCallButton = self->_emergencyCallButton;
    v185[0] = self->_cancelButton;
    v185[1] = emergencyCallButton;
    invisibleUsePasscodeButton = self->_invisibleUsePasscodeButton;
    v185[2] = self->_backgroundCancelButton;
    v185[3] = invisibleUsePasscodeButton;
    unint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    double v7 = v185;
LABEL_5:
    uint64_t v10 = 4;
    goto LABEL_7;
  }
  if (v3 == 1)
  {
    cancelButton = self->_cancelButton;
    v184[0] = self->_touchIDUsePasscodeButton;
    v184[1] = cancelButton;
    backgroundCancelButton = self->_backgroundCancelButton;
    v184[2] = self->_emergencyCallButton;
    v184[3] = backgroundCancelButton;
    unint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    double v7 = v184;
    goto LABEL_5;
  }
  v11 = self->_emergencyCallButton;
  v183[0] = self->_cancelButton;
  v183[1] = v11;
  unint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  double v7 = v183;
  uint64_t v10 = 2;
LABEL_7:
  [v6 arrayWithObjects:v7 count:v10];
  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v171 objects:v182 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v172;
    v16 = (void *)*MEMORY[0x1E4F43780];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v172 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v171 + 1) + 8 * i);
        [v18 setUserInteractionEnabled:1];
        [v18 setClipsToBounds:1];
        v19 = [MEMORY[0x1E4F428B8] clearColor];
        [v18 setBackgroundColor:v19];

        v20 = [v18 titleLabel];
        v21 = objc_msgSend(MEMORY[0x1E4F42A30], "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(v16, 16.0));
        [v20 setFont:v21];

        [v20 setLineBreakMode:5];
        [v20 setAdjustsFontSizeToFitWidth:1];
        [v20 setMinimumScaleFactor:1.0];
        [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v18 setContentHorizontalAlignment:0];
        LODWORD(v22) = 1144750080;
        [v18 setContentCompressionResistancePriority:0 forAxis:v22];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v171 objects:v182 count:16];
    }
    while (v14);
  }

  p_isa = (id *)&v169->super.super.super.super.isa;
  v24 = [(SBUIPasscodePillButton *)v169->_faceIDUsePasscodeButton widthAnchor];
  v25 = [v24 constraintEqualToConstant:225.0];

  LODWORD(v26) = 1132068864;
  v168 = v25;
  [v25 setPriority:v26];
  if ([(SBUIPasscodeBiometricAuthenticationView *)v169 type] == 2
    || [(SBUIPasscodeBiometricAuthenticationView *)v169 type] == 3)
  {
    v125 = (void *)MEMORY[0x1E4F28DC8];
    v164 = [(UILabel *)v169->_faceIDLabel centerXAnchor];
    v159 = [(SBUIPasscodeBiometricAuthenticationView *)v169 centerXAnchor];
    v155 = [v164 constraintEqualToAnchor:v159];
    v181[0] = v155;
    v149 = [(UILabel *)v169->_faceIDReasonLabel centerXAnchor];
    v146 = [(SBUIPasscodeBiometricAuthenticationView *)v169 centerXAnchor];
    v144 = [v149 constraintEqualToAnchor:v146];
    v181[1] = v144;
    v141 = [(UILayoutGuide *)v169->_faceIDLabelAndReasonLayoutGuide topAnchor];
    v139 = [(UILabel *)v169->_faceIDLabel topAnchor];
    v137 = [v141 constraintEqualToAnchor:v139];
    v181[2] = v137;
    v135 = [(UILayoutGuide *)v169->_faceIDLabelAndReasonLayoutGuide bottomAnchor];
    v133 = [(UILabel *)v169->_faceIDReasonLabel bottomAnchor];
    v131 = [v135 constraintEqualToAnchor:v133];
    v181[3] = v131;
    v129 = [(UILayoutGuide *)v169->_faceIDLabelAndReasonHelperGuide topAnchor];
    v127 = [(SBUIPasscodeBiometricAuthenticationView *)v169 topAnchor];
    v123 = [v129 constraintEqualToAnchor:v127];
    v181[4] = v123;
    v121 = [(UILayoutGuide *)v169->_faceIDLabelAndReasonHelperGuide heightAnchor];
    v119 = [(SBUIPasscodeBiometricAuthenticationView *)v169 heightAnchor];
    v117 = [v121 constraintEqualToAnchor:v119 multiplier:0.48];
    v181[5] = v117;
    v115 = [(UILayoutGuide *)v169->_faceIDLabelAndReasonLayoutGuide centerYAnchor];
    v114 = [(UILayoutGuide *)v169->_faceIDLabelAndReasonHelperGuide bottomAnchor];
    v113 = [v115 constraintEqualToAnchor:v114];
    v181[6] = v113;
    v112 = [(SBUIPasscodePillButton *)v169->_faceIDUsePasscodeButton centerXAnchor];
    v111 = [(SBUIPasscodeBiometricAuthenticationView *)v169 centerXAnchor];
    uint64_t v110 = [v112 constraintEqualToAnchor:v111];
    v181[7] = v110;
    uint64_t v109 = [(SBUIPasscodePillButton *)v169->_faceIDUsePasscodeButton centerYAnchor];
    v108 = [(UILayoutGuide *)v169->_faceIDLabelAndReasonLayoutGuide centerYAnchor];
    uint64_t v107 = [v109 constraintEqualToAnchor:v108];
    v181[8] = v107;
    v181[9] = v25;
    v106 = [(UIButton *)v169->_invisibleUsePasscodeButton widthAnchor];
    v105 = [v106 constraintEqualToConstant:200.0];
    v181[10] = v105;
    v104 = [(UIButton *)v169->_invisibleUsePasscodeButton heightAnchor];
    v27 = [v104 constraintEqualToConstant:150.0];
    v181[11] = v27;
    v28 = [(UIButton *)v169->_invisibleUsePasscodeButton centerXAnchor];
    v29 = [(SBUIPasscodeBiometricAuthenticationView *)v169 centerXAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v181[12] = v30;
    v31 = [(UIButton *)v169->_invisibleUsePasscodeButton centerYAnchor];
    v32 = [(UILayoutGuide *)v169->_faceIDLabelAndReasonLayoutGuide centerYAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v181[13] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:14];
    [v125 activateConstraints:v34];

    p_isa = (id *)&v169->super.super.super.super.isa;
    v35 = [(UILabel *)v169->_faceIDReasonLabel firstBaselineAnchor];
    v36 = [(UILabel *)v169->_faceIDLabel firstBaselineAnchor];
    [(SBUIPasscodeBiometricAuthenticationView *)v169 _leadingForFaceIDReason];
    uint64_t v37 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36);
    faceIDLabelFaceIDReasonBaselineConstraint = v169->_faceIDLabelFaceIDReasonBaselineConstraint;
    v169->_faceIDLabelFaceIDReasonBaselineConstraint = (NSLayoutConstraint *)v37;

    [(NSLayoutConstraint *)v169->_faceIDLabelFaceIDReasonBaselineConstraint setActive:1];
  }
  if ([p_isa type] == 1)
  {
    v138 = (void *)MEMORY[0x1E4F28DC8];
    v165 = [p_isa[64] heightAnchor];
    v160 = [v165 constraintEqualToConstant:66.0];
    v180[0] = v160;
    v156 = [p_isa[64] widthAnchor];
    v152 = [v156 constraintEqualToConstant:66.0];
    v180[1] = v152;
    v150 = [p_isa[64] centerXAnchor];
    v147 = [p_isa centerXAnchor];
    v145 = [v150 constraintEqualToAnchor:v147];
    v180[2] = v145;
    v143 = [p_isa[75] topAnchor];
    v142 = [p_isa topAnchor];
    v140 = [v143 constraintEqualToAnchor:v142];
    v180[3] = v140;
    v136 = [p_isa[75] heightAnchor];
    v134 = [p_isa heightAnchor];
    v132 = [v136 constraintEqualToAnchor:v134 multiplier:0.4 constant:33.0];
    v180[4] = v132;
    v130 = [p_isa[64] bottomAnchor];
    v128 = [p_isa[75] bottomAnchor];
    v126 = [v130 constraintEqualToAnchor:v128];
    v180[5] = v126;
    v124 = [p_isa[69] centerXAnchor];
    v122 = [p_isa centerXAnchor];
    v120 = [v124 constraintEqualToAnchor:v122];
    v180[6] = v120;
    v118 = [p_isa[69] firstBaselineAnchor];
    v116 = [p_isa[64] bottomAnchor];
    v39 = [v118 constraintEqualToAnchor:v116 constant:36.0];
    v180[7] = v39;
    v40 = [p_isa[62] centerXAnchor];
    v41 = [p_isa centerXAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v180[8] = v42;
    v43 = [p_isa[62] firstBaselineAnchor];
    v44 = [p_isa[69] bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44 constant:56.0];
    v180[9] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:10];
    [v138 activateConstraints:v46];

    p_isa = (id *)&v169->super.super.super.super.isa;
  }
  if ([p_isa type])
  {
    v148 = (void *)MEMORY[0x1E4F28DC8];
    v166 = [p_isa[67] topAnchor];
    v161 = [p_isa topAnchor];
    v157 = [v166 constraintEqualToAnchor:v161];
    v179[0] = v157;
    v153 = [p_isa[67] leadingAnchor];
    v151 = [p_isa leadingAnchor];
    v47 = [v153 constraintEqualToAnchor:v151];
    v179[1] = v47;
    v48 = [p_isa[67] trailingAnchor];
    v49 = [p_isa trailingAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    v179[2] = v50;
    v51 = [p_isa[67] bottomAnchor];
    v52 = [p_isa bottomAnchor];
    v53 = [v51 constraintEqualToAnchor:v52 constant:-50.0];
    v179[3] = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:4];
    [v148 activateConstraints:v54];

    p_isa = (id *)&v169->super.super.super.super.isa;
  }
  v55 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v56 = [v55 userInterfaceIdiom];

  if ((v56 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v75 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v76 = [v75 userInterfaceIdiom];

    if ((v76 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 1) < 2)
    {
      v77 = [p_isa rightAnchor];
      v78 = [p_isa[66] rightAnchor];
      v79 = [v77 constraintGreaterThanOrEqualToAnchor:v78];
      [v79 setActive:1];

      v80 = [p_isa[65] leftAnchor];
      v81 = [p_isa leftAnchor];
      v82 = [v80 constraintGreaterThanOrEqualToAnchor:v81];
      [v82 setActive:1];
    }
    v89 = (void *)MEMORY[0x1E4F28DC8];
    v90 = _NSDictionaryOfVariableBindings(&cfstr_CancelbuttonEm.isa, p_isa[66], p_isa[65], 0);
    v91 = [v89 constraintsWithVisualFormat:@"[_emergencyCallButton]-(>=10)-[_cancelButton]" options:0x10000 metrics:0 views:v90];
    [v89 activateConstraints:v91];

    v170 = [p_isa layoutDelegate];
    [v170 passcodeBiometricAuthenticationViewSideButtonsOffsetFromCenter:p_isa];
    double v93 = v92;
    v163 = (void *)MEMORY[0x1E4F28DC8];
    v94 = [p_isa[65] centerXAnchor];
    v95 = [p_isa centerXAnchor];
    v96 = [v94 constraintEqualToAnchor:v95 constant:-v93];
    v176[0] = v96;
    v97 = [p_isa[66] centerXAnchor];
    v98 = [p_isa centerXAnchor];
    v99 = [v97 constraintEqualToAnchor:v98 constant:v93];
    v176[1] = v99;
    v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:2];
    [v163 activateConstraints:v100];

    [v170 passcodeBiometricAuthenticationViewNumberPadAncillaryButtonOffsetFromTopOfScreen:p_isa];
    double v102 = v101;
    v63 = (void *)MEMORY[0x1E4F28DC8];
    v67 = [p_isa[66] centerYAnchor];
    uint64_t v103 = [p_isa topAnchor];
    v68 = [v67 constraintEqualToAnchor:v103 constant:v102];
    v175[0] = v68;
    v70 = [p_isa[65] centerYAnchor];
    v71 = [p_isa[66] centerYAnchor];
    v72 = [v70 constraintEqualToAnchor:v71];
    v175[1] = v72;
    v73 = (void *)MEMORY[0x1E4F1C978];
    v69 = (void *)v103;
    v74 = v175;
    goto LABEL_33;
  }
  v57 = (id *)MEMORY[0x1E4F43630];
  v58 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v58))
  {
    uint64_t v59 = [p_isa type];

    if (v59)
    {
      double v60 = dbl_1A76A5170[(unint64_t)([*v57 activeInterfaceOrientation] - 1) < 2];
      uint64_t v61 = [p_isa type];
      v62 = &OBJC_IVAR___SBUIPasscodeBiometricAuthenticationView__faceIDReasonLabel;
      if (v61 == 1) {
        v62 = &OBJC_IVAR___SBUIPasscodeBiometricAuthenticationView__touchIDUsePasscodeButton;
      }
      v63 = (void *)MEMORY[0x1E4F28DC8];
      id v64 = p_isa[66];
      id v65 = *(id *)((char *)p_isa + *v62);
      v66 = [v64 centerXAnchor];
      v67 = [p_isa centerXAnchor];
      v170 = v66;
      v68 = [v66 constraintEqualToAnchor:v67];
      v178[0] = v68;
      v69 = v65;
      v70 = [p_isa[66] topAnchor];
      v71 = [v69 bottomAnchor];
      v72 = [v70 constraintEqualToAnchor:v71 constant:v60];
      v178[1] = v72;
      v73 = (void *)MEMORY[0x1E4F1C978];
      v74 = v178;
LABEL_33:
      v83 = [v73 arrayWithObjects:v74 count:2];
      [v63 activateConstraints:v83];
      goto LABEL_34;
    }
  }
  else
  {
  }
  v167 = (void *)MEMORY[0x1E4F28DC8];
  v170 = [p_isa[76] topAnchor];
  uint64_t v162 = [p_isa topAnchor];
  uint64_t v158 = [v170 constraintEqualToAnchor:v162];
  v177[0] = v158;
  v154 = [p_isa[76] heightAnchor];
  v70 = [p_isa heightAnchor];
  v71 = [v154 constraintEqualToAnchor:v70 multiplier:0.6];
  v177[1] = v71;
  v72 = [p_isa[66] centerXAnchor];
  v83 = [p_isa centerXAnchor];
  v84 = [v72 constraintEqualToAnchor:v83];
  v177[2] = v84;
  v85 = [p_isa[66] topAnchor];
  v86 = [p_isa[76] bottomAnchor];
  v87 = [v85 constraintEqualToAnchor:v86];
  v177[3] = v87;
  v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:4];
  [v167 activateConstraints:v88];

  v67 = (void *)v162;
  v69 = (void *)v158;

  v68 = v154;
LABEL_34:
}

- (void)setShowsLockIconForFaceID:(BOOL)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (self->_showsLockIconForFaceID != a3)
  {
    BOOL v3 = a3;
    self->_showsLockIconForFaceID = a3;
    BOOL v5 = [(SBUIPasscodeBiometricAuthenticationView *)self type] == 2
      || [(SBUIPasscodeBiometricAuthenticationView *)self type] == 3;
    [(UILabel *)self->_faceIDLabel setHidden:v3];
    faceIDLockIcon = self->_faceIDLockIcon;
    if (v3 && v5 && !faceIDLockIcon)
    {
      double v7 = (void *)MEMORY[0x1E4F42A80];
      v8 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:2 scale:46.0];
      id v9 = [v7 systemImageNamed:@"lock.fill" withConfiguration:v8];

      uint64_t v10 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v9];
      v11 = self->_faceIDLockIcon;
      self->_faceIDLockIcon = v10;

      id v12 = self->_faceIDLockIcon;
      uint64_t v13 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.23];
      [(UIImageView *)v12 setTintColor:v13];

      [(UIImageView *)self->_faceIDLockIcon setTranslatesAutoresizingMaskIntoConstraints:0];
      [(SBUIPasscodeBiometricAuthenticationView *)self addSubview:self->_faceIDLockIcon];
      uint64_t v14 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v15 = [(UIImageView *)self->_faceIDLockIcon centerXAnchor];
      v16 = [(SBUIPasscodeBiometricAuthenticationView *)self centerXAnchor];
      v17 = [v15 constraintEqualToAnchor:v16];
      v23[0] = v17;
      v18 = [(UIImageView *)self->_faceIDLockIcon bottomAnchor];
      v19 = [(UILabel *)self->_faceIDLabel bottomAnchor];
      v20 = [v18 constraintEqualToAnchor:v19];
      v23[1] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      [v14 activateConstraints:v21];

      [(SBUIPasscodeBiometricAuthenticationView *)self setNeedsUpdateConstraints];
    }
    else
    {
      [(UIImageView *)faceIDLockIcon removeFromSuperview];
      double v22 = self->_faceIDLockIcon;
      self->_faceIDLockIcon = 0;
    }
  }
}

- (void)setPasscodeButtonTitle:(id)a3
{
}

- (void)_setTouchIDReason:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_touchIDReason, "isEqualToString:") && self->_touchIDReasonLabel)
  {
    unint64_t v4 = (NSString *)[v6 copy];
    touchIDReason = self->_touchIDReason;
    self->_touchIDReason = v4;

    [(UILabel *)self->_touchIDReasonLabel setText:self->_touchIDReason];
    [(SBUIPasscodeBiometricAuthenticationView *)self setNeedsLayout];
  }
}

- (void)_setFaceIDReason:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_faceIDReason, "isEqualToString:") && self->_faceIDLabel)
  {
    unint64_t v4 = (NSString *)[v6 copy];
    faceIDReason = self->_faceIDReason;
    self->_faceIDReason = v4;

    [(UILabel *)self->_faceIDLabel setText:self->_faceIDReason];
    [(SBUIPasscodeBiometricAuthenticationView *)self setNeedsLayout];
  }
}

- (void)_setFaceIDReasonLine2:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_faceIDReasonLine2, "isEqualToString:") && self->_faceIDReasonLabel)
  {
    unint64_t v4 = (NSString *)[v6 copy];
    faceIDReasonLine2 = self->_faceIDReasonLine2;
    self->_faceIDReasonLine2 = v4;

    [(UILabel *)self->_faceIDReasonLabel setText:self->_faceIDReasonLine2];
    [(SBUIPasscodeBiometricAuthenticationView *)self setNeedsLayout];
  }
}

- (void)_usePasscodeButtonHit
{
  id v3 = [(SBUIPasscodeBiometricAuthenticationView *)self delegate];
  [v3 passcodeBiometricAuthenticationViewUsePasscodeButtonHit:self];
}

- (void)_cancelButtonHit
{
  id v3 = [(SBUIPasscodeBiometricAuthenticationView *)self delegate];
  [v3 passcodeBiometricAuthenticationViewCancelButtonHit:self];
}

- (void)_emergencyCallButtonHit
{
  id v3 = [(SBUIPasscodeBiometricAuthenticationView *)self delegate];
  [v3 passcodeBiometricAuthenticationViewEmergencyCallButtonHit:self];
}

- (double)_leadingForFaceIDReason
{
  uint64_t v2 = [(UILabel *)self->_faceIDReasonLabel font];
  [v2 _bodyLeading];
  double v4 = v3;

  return v4;
}

- (void)_noteContentSizeCategoryDidChange
{
  faceIDLabelFaceIDReasonBaselineConstraint = self->_faceIDLabelFaceIDReasonBaselineConstraint;
  [(SBUIPasscodeBiometricAuthenticationView *)self _leadingForFaceIDReason];
  -[NSLayoutConstraint setConstant:](faceIDLabelFaceIDReasonBaselineConstraint, "setConstant:");
}

- (BOOL)showsLockIconForFaceID
{
  return self->_showsLockIconForFaceID;
}

- (unint64_t)type
{
  return self->_type;
}

- (SBUIPasscodeBiometricAuthenticationViewLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (SBUIPasscodeBiometricAuthenticationViewLayoutDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (SBUIPasscodeBiometricAuthenticationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIPasscodeBiometricAuthenticationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (BOOL)ancillaryButtonsVisible
{
  return self->_ancillaryButtonsVisible;
}

- (BOOL)faceIDUsePasscodeButtonVisible
{
  return self->_faceIDUsePasscodeButtonVisible;
}

- (NSString)overrideFaceIDReason
{
  return self->_overrideFaceIDReason;
}

- (NSString)passcodeButtonTitle
{
  return self->_passcodeButtonTitle;
}

- (NSString)touchIDReason
{
  return self->_touchIDReason;
}

- (NSString)faceIDReason
{
  return self->_faceIDReason;
}

- (NSString)faceIDReasonLine2
{
  return self->_faceIDReasonLine2;
}

- (void)_setFaceIDReason2:(id)a3
{
}

- (SBUIButton)touchIDUsePasscodeButton
{
  return self->_touchIDUsePasscodeButton;
}

- (void)setTouchIDUsePasscodeButton:(id)a3
{
}

- (SBUIPasscodePillButton)faceIDUsePasscodeButton
{
  return self->_faceIDUsePasscodeButton;
}

- (void)setFaceIDUsePasscodeButton:(id)a3
{
}

- (PKGlyphView)touchIDGlyphView
{
  return self->_touchIDGlyphView;
}

- (void)setTouchIDGlyphView:(id)a3
{
}

- (SBUIButton)emergencyCallButton
{
  return self->_emergencyCallButton;
}

- (void)setEmergencyCallButton:(id)a3
{
}

- (SBUIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)backgroundCancelButton
{
  return self->_backgroundCancelButton;
}

- (void)setBackgroundCancelButton:(id)a3
{
}

- (UIButton)invisibleUsePasscodeButton
{
  return self->_invisibleUsePasscodeButton;
}

- (void)setInvisibleUsePasscodeButton:(id)a3
{
}

- (UILabel)touchIDReasonLabel
{
  return self->_touchIDReasonLabel;
}

- (void)setTouchIDReasonLabel:(id)a3
{
}

- (UILabel)faceIDLabel
{
  return self->_faceIDLabel;
}

- (void)setFaceIDLabel:(id)a3
{
}

- (UILabel)faceIDReasonLabel
{
  return self->_faceIDReasonLabel;
}

- (void)setFaceIDReasonLabel:(id)a3
{
}

- (UIImageView)faceIDLockIcon
{
  return self->_faceIDLockIcon;
}

- (void)setFaceIDLockIcon:(id)a3
{
}

- (UILayoutGuide)faceIDLabelAndReasonHelperGuide
{
  return self->_faceIDLabelAndReasonHelperGuide;
}

- (void)setFaceIDLabelAndReasonHelperGuide:(id)a3
{
}

- (UILayoutGuide)faceIDLabelAndReasonLayoutGuide
{
  return self->_faceIDLabelAndReasonLayoutGuide;
}

- (void)setFaceIDLabelAndReasonLayoutGuide:(id)a3
{
}

- (UILayoutGuide)touchIDGlyphLayoutGuide
{
  return self->_touchIDGlyphLayoutGuide;
}

- (void)setTouchIDGlyphLayoutGuide:(id)a3
{
}

- (UILayoutGuide)cancelButtonLayoutGuide
{
  return self->_cancelButtonLayoutGuide;
}

- (void)setCancelButtonLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)faceIDLabelFaceIDReasonBaselineConstraint
{
  return self->_faceIDLabelFaceIDReasonBaselineConstraint;
}

- (void)setFaceIDLabelFaceIDReasonBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIDLabelFaceIDReasonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButtonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_touchIDGlyphLayoutGuide, 0);
  objc_storeStrong((id *)&self->_faceIDLabelAndReasonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_faceIDLabelAndReasonHelperGuide, 0);
  objc_storeStrong((id *)&self->_faceIDLockIcon, 0);
  objc_storeStrong((id *)&self->_faceIDReasonLabel, 0);
  objc_storeStrong((id *)&self->_faceIDLabel, 0);
  objc_storeStrong((id *)&self->_touchIDReasonLabel, 0);
  objc_storeStrong((id *)&self->_invisibleUsePasscodeButton, 0);
  objc_storeStrong((id *)&self->_backgroundCancelButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_emergencyCallButton, 0);
  objc_storeStrong((id *)&self->_touchIDGlyphView, 0);
  objc_storeStrong((id *)&self->_faceIDUsePasscodeButton, 0);
  objc_storeStrong((id *)&self->_touchIDUsePasscodeButton, 0);
  objc_storeStrong((id *)&self->_faceIDReasonLine2, 0);
  objc_storeStrong((id *)&self->_faceIDReason, 0);
  objc_storeStrong((id *)&self->_touchIDReason, 0);
  objc_storeStrong((id *)&self->_passcodeButtonTitle, 0);
  objc_storeStrong((id *)&self->_overrideFaceIDReason, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

@end