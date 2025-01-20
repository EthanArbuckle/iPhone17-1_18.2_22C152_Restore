@interface SBUIPowerDownView
- (BOOL)_isLandscapeAspectRatio;
- (BOOL)deviceSupportsFindMy;
- (BOOL)shouldPowerDownViewShowFindMyAlert;
- (SBUIPowerDownView)initWithFrame:(CGRect)a3;
- (SBUIPowerDownView)initWithFrame:(CGRect)a3 vibrantSettings:(id)a4;
- (SBUIPowerDownViewDelegate)delegate;
- (SPBeaconManager)beaconManager;
- (double)showHideAnimationDuration;
- (id)_createActionSlider;
- (id)createDimmingBackdropViewWithFrame:(CGRect)a3;
- (void)_animatePowerDown;
- (void)_cancelAutoDismissTimer;
- (void)_createFindMyUI;
- (void)_notifyDelegateCancelled;
- (void)_notifyDelegatePowerDown;
- (void)_powerDownSliderDidUpdateSlideWithValue:(double)a3;
- (void)_prepareViewsForAlert;
- (void)_readIODeviceSupportsFindMy;
- (void)_readShouldPowerDownViewShowFindMyAlert;
- (void)_resetAutoDismissTimer;
- (void)_updateSliderExclusionPath;
- (void)_willAnimateIn;
- (void)_willAnimateOut;
- (void)dealloc;
- (void)didAcknowledgeFindMyInfo;
- (void)didSuppressFindMy;
- (void)hideAnimated:(BOOL)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)setBeaconManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceSupportsFindMy:(BOOL)a3;
- (void)setShouldPowerDownViewShowFindMyAlert:(BOOL)a3;
- (void)showAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation SBUIPowerDownView

- (SBUIPowerDownView)initWithFrame:(CGRect)a3
{
  return -[SBUIPowerDownView initWithFrame:vibrantSettings:](self, "initWithFrame:vibrantSettings:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIPowerDownView)initWithFrame:(CGRect)a3 vibrantSettings:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v58.receiver = self;
  v58.super_class = (Class)SBUIPowerDownView;
  v11 = -[SBUIPowerDownView initWithFrame:](&v58, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    id v54 = objc_alloc_init(MEMORY[0x1E4F97C08]);
    [(SBUIPowerDownView *)v11 setBeaconManager:v54];
    [(SBUIPowerDownView *)v11 _readIODeviceSupportsFindMy];
    [(SBUIPowerDownView *)v11 _readShouldPowerDownViewShowFindMyAlert];
    [(SBUIPowerDownView *)v11 setAutoresizingMask:18];
    v12 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBUIPowerDownView *)v11 setBackgroundColor:v12];

    [(SBUIPowerDownView *)v11 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [(SBUIPowerDownView *)v11 setAlpha:0.0];
    uint64_t v21 = -[SBUIPowerDownView createDimmingBackdropViewWithFrame:](v11, "createDimmingBackdropViewWithFrame:", v14, v16, v18, v20);
    backdropView = v11->_backdropView;
    v11->_backdropView = (UIView *)v21;

    [(SBUIPowerDownView *)v11 addSubview:v11->_backdropView];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v55 = 0u;
    SBGetPowerDownViewMetrics((uint64_t)&v55, [(SBUIPowerDownView *)v11 _isLandscapeAspectRatio]);
    objc_storeStrong((id *)&v11->_vibrantSettings, a4);
    uint64_t v23 = [(SBUIPowerDownView *)v11 _createActionSlider];
    actionSlider = v11->_actionSlider;
    v11->_actionSlider = (_UIActionSlider *)v23;

    [(_UIActionSlider *)v11->_actionSlider setAlpha:0.0];
    [(SBUIPowerDownView *)v11 addSubview:v11->_actionSlider];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F427E0]), "initWithFrame:", 0.0, 0.0, *((double *)&v55 + 1), *((double *)&v55 + 1));
    cancelButton = v11->_cancelButton;
    v11->_cancelButton = (UIButton *)v25;

    v27 = v11->_cancelButton;
    v28 = (void *)MEMORY[0x1E4F42A80];
    v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v30 = [MEMORY[0x1E4F42D90] mainScreen];
    v31 = [v30 traitCollection];
    v32 = [v28 imageNamed:@"PowerDownCancel" inBundle:v29 compatibleWithTraitCollection:v31];
    v33 = [MEMORY[0x1E4F428B8] whiteColor];
    v34 = [v32 _flatImageWithColor:v33];
    [(UIButton *)v27 setImage:v34 forState:0];

    [(UIButton *)v11->_cancelButton addTarget:v11 action:sel__cancelButtonTapped forControlEvents:64];
    [(UIButton *)v11->_cancelButton setAlpha:0.0];
    [(SBUIPowerDownView *)v11 addSubview:v11->_cancelButton];
    v35 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    cancelLabel = v11->_cancelLabel;
    v11->_cancelLabel = v35;

    v37 = v11->_cancelLabel;
    v38 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v37 setBackgroundColor:v38];

    v39 = v11->_cancelLabel;
    v40 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v39 setTextColor:v40];

    v41 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v42 = [v41 localizedStringForKey:@"POWER_DOWN_CANCEL" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

    [(UILabel *)v11->_cancelLabel setText:v42];
    v43 = v11->_cancelLabel;
    v44 = [MEMORY[0x1E4F42A30] systemFontOfSize:*((double *)&v56 + 1)];
    [(UILabel *)v43 setFont:v44];

    [(UILabel *)v11->_cancelLabel setAlpha:0.0];
    [(SBUIPowerDownView *)v11 addSubview:v11->_cancelLabel];
    [(UIButton *)v11->_cancelButton setAccessibilityLabel:v42];
    [(UILabel *)v11->_cancelLabel setAccessibilityElementsHidden:1];
    v45 = -[SBUIShapeView initWithFrame:]([SBUIShapeView alloc], "initWithFrame:", v14, v16, v18, v20);
    darkeningUnderlayView = v11->_darkeningUnderlayView;
    v11->_darkeningUnderlayView = v45;

    v47 = v11->_darkeningUnderlayView;
    v48 = [MEMORY[0x1E4F428B8] blackColor];
    [(SBUIShapeView *)v47 setFillColor:v48];

    [(SBUIShapeView *)v11->_darkeningUnderlayView setFillRule:1];
    [(SBUIShapeView *)v11->_darkeningUnderlayView setAlpha:0.0];
    [(SBUIPowerDownView *)v11 addSubview:v11->_darkeningUnderlayView];
    uint64_t v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v14, v16, v18, v20);
    darkeningOverlayView = v11->_darkeningOverlayView;
    v11->_darkeningOverlayView = (UIView *)v49;

    v51 = v11->_darkeningOverlayView;
    v52 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v51 setBackgroundColor:v52];

    [(UIView *)v11->_darkeningOverlayView setAlpha:0.0];
    [(SBUIPowerDownView *)v11 addSubview:v11->_darkeningOverlayView];
  }
  return v11;
}

- (void)dealloc
{
  [(SBUIPowerDownView *)self _cancelAutoDismissTimer];
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)SBUIPowerDownView;
  [(SBUIPowerDownView *)&v3 dealloc];
}

- (void)_createFindMyUI
{
  v53[1] = *MEMORY[0x1E4F143B8];
  long long v51 = 0u;
  memset(v50, 0, sizeof(v50));
  SBGetPowerDownViewMetrics((uint64_t)v50, [(SBUIPowerDownView *)self _isLandscapeAspectRatio]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v46 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:*((double *)&v51 + 1)];
  v48 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"location.fill.radiowaves.left.and.right" withConfiguration:v46];
  v47 = [MEMORY[0x1E4F42698] textAttachmentWithImage:v48];
  v42 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v47];
  v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.right" withConfiguration:v46];
  v45 = [v4 imageFlippedForRightToLeftLayoutDirection];

  v44 = [MEMORY[0x1E4F42698] textAttachmentWithImage:v45];
  v5 = (void *)MEMORY[0x1E4F28B18];
  uint64_t v52 = *MEMORY[0x1E4F42510];
  uint64_t v6 = v52;
  v7 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v53[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
  v40 = [v5 attributedStringWithAttachment:v44 attributes:v8];

  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"POWER_DOWN_FIND_MY"];
  v43 = [v9 localizedStringForKey:v10 value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

  v41 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v43];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  [v12 appendAttributedString:v42];
  [v12 appendAttributedString:v11];
  [v12 appendAttributedString:v41];
  [v12 appendAttributedString:v11];
  uint64_t v13 = [v12 length];
  [v12 appendAttributedString:v40];
  uint64_t v14 = [v12 length];
  v39 = [MEMORY[0x1E4F42A30] systemFontOfSize:*((double *)&v51 + 1)];
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E4F42508], v39, 0, v14);
  double v15 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.55];
  objc_msgSend(v12, "addAttribute:value:range:", v6, v15, 0, v13);

  id v16 = objc_alloc(MEMORY[0x1E4F427E0]);
  double v17 = (UIButton *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  findMyButton = self->_findMyButton;
  self->_findMyButton = v17;
  double v19 = v17;

  [(UIButton *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)v19 setAlpha:0.0];
  double v20 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIButton *)v19 setBackgroundColor:v20];

  [(UIButton *)v19 setAttributedTitle:v12 forState:0];
  uint64_t v21 = [(UIButton *)v19 titleLabel];
  [v21 _setDrawsAsBackdropOverlayWithBlendMode:2];

  v22 = [(UIButton *)v19 titleLabel];
  [v22 setNumberOfLines:0];

  uint64_t v23 = [(UIButton *)v19 titleLabel];
  [v23 setTextAlignment:1];

  v24 = [(UIButton *)v19 titleLabel];
  [v24 setLineBreakMode:0];

  [(UIButton *)v19 addTarget:self action:sel__didTapFindMy forControlEvents:64];
  [(SBUIPowerDownView *)self insertSubview:v19 aboveSubview:self->_cancelLabel];
  uint64_t v25 = [(UIButton *)v19 centerXAnchor];
  v26 = [(SBUIPowerDownView *)self centerXAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v3 addObject:v27];

  v28 = [(UIButton *)v19 leadingAnchor];
  v29 = [(SBUIPowerDownView *)self leadingAnchor];
  v30 = [v28 constraintGreaterThanOrEqualToAnchor:v29 constant:20.0];

  v31 = [(UIButton *)v19 trailingAnchor];
  v32 = [(SBUIPowerDownView *)self trailingAnchor];
  v33 = [v31 constraintLessThanOrEqualToAnchor:v32 constant:20.0];

  [v3 addObject:v30];
  [v3 addObject:v33];
  v34 = [(UIButton *)v19 topAnchor];
  v35 = [(_UIActionSlider *)self->_actionSlider bottomAnchor];
  v36 = [v34 constraintEqualToAnchor:v35 constant:4.0];
  [v3 addObject:v36];

  v37 = [(UIButton *)v19 heightAnchor];
  v38 = [v37 constraintGreaterThanOrEqualToConstant:40.0];
  [v3 addObject:v38];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __36__SBUIPowerDownView__createFindMyUI__block_invoke;
  v49[3] = &unk_1E5CCC580;
  v49[4] = self;
  [MEMORY[0x1E4F42FF0] _animateUsingDefaultTimingWithOptions:0 animations:v49 completion:0];
}

uint64_t __36__SBUIPowerDownView__createFindMyUI__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:1.0];
}

- (id)createDimmingBackdropViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 _graphicsQuality];

  if (v8 == 10)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", x, y, width, height);
    id v10 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.7];
    [v9 setBackgroundColor:v10];
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F430A8]), "initWithFrame:privateStyle:", 2030, x, y, width, height);
  }
  return v9;
}

- (double)showHideAnimationDuration
{
  return 0.3;
}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(_UIActionSlider *)self->_actionSlider closeTrackAnimated:0];
  [(SBUIPowerDownView *)self _updateSliderExclusionPath];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke;
  v25[3] = &unk_1E5CCC580;
  v25[4] = self;
  v7 = (void (**)(void))MEMORY[0x1AD0CF1C0](v25);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_2;
  v23[3] = &unk_1E5CCC5A8;
  v23[4] = self;
  BOOL v24 = v4;
  uint64_t v8 = (void (**)(void))MEMORY[0x1AD0CF1C0](v23);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_3;
  v21[3] = &unk_1E5CCC670;
  v21[4] = self;
  id v9 = v6;
  id v22 = v9;
  id v10 = (void (**)(void))MEMORY[0x1AD0CF1C0](v21);
  if (v4)
  {
    v11 = (void *)MEMORY[0x1E4F42FF0];
    [(SBUIPowerDownView *)self showHideAnimationDuration];
    double v13 = v12;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_4;
    v19[3] = &unk_1E5CCC698;
    double v20 = v7;
    [v11 animateWithDuration:0 delay:v19 options:0 animations:v13 completion:0.0];
    uint64_t v14 = (void *)MEMORY[0x1E4F42FF0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_5;
    v17[3] = &unk_1E5CCC698;
    double v18 = v8;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_6;
    v15[3] = &unk_1E5CCC6C0;
    id v16 = v10;
    [v14 _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v17 options:v15 animations:0.15 completion:0.0];
  }
  else
  {
    v7[2](v7);
    v8[2](v8);
    v10[2](v10);
  }
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 32);
  return [v2 _willAnimateIn];
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 440) openTrackAnimated:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateSliderExclusionPath];
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetAutoDismissTimer];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke;
  v24[3] = &unk_1E5CCC580;
  v24[4] = self;
  v7 = (void (**)(void))MEMORY[0x1AD0CF1C0](v24);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_2;
  v23[3] = &unk_1E5CCC580;
  v23[4] = self;
  uint64_t v8 = (void (**)(void))MEMORY[0x1AD0CF1C0](v23);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_3;
  v21[3] = &unk_1E5CCC670;
  v21[4] = self;
  id v9 = v6;
  id v22 = v9;
  id v10 = (void (**)(void))MEMORY[0x1AD0CF1C0](v21);
  if (v4)
  {
    v11 = (void *)MEMORY[0x1E4F42FF0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_4;
    v19[3] = &unk_1E5CCC698;
    double v20 = v8;
    [v11 _animateUsingDefaultTimingWithOptions:0 animations:v19 completion:0];
    double v12 = (void *)MEMORY[0x1E4F42FF0];
    [(SBUIPowerDownView *)self showHideAnimationDuration];
    double v14 = v13;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_5;
    v17[3] = &unk_1E5CCC698;
    double v18 = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_6;
    v15[3] = &unk_1E5CCC6C0;
    id v16 = v10;
    [v12 animateWithDuration:0 delay:v17 options:v15 animations:v14 completion:0.25];
  }
  else
  {
    v8[2](v8);
    v10[2](v10);
    v7[2](v7);
  }
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _willAnimateOut];
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 488));
  [WeakRetained powerDownViewAnimateOutCompleted:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)SBUIPowerDownView;
  [(SBUIPowerDownView *)&v36 layoutSubviews];
  [(SBUIPowerDownView *)self bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SBUIPowerDownView *)self traitCollection];
  [v11 displayScale];
  uint64_t v13 = v12;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  SBGetPowerDownViewMetrics((uint64_t)&v33, [(SBUIPowerDownView *)self _isLandscapeAspectRatio]);
  [(SBUIPowerDownView *)self safeAreaInsets];
  -[_UIActionSlider sizeThatFits:](self->_actionSlider, "sizeThatFits:", v8, v10);
  UIRectCenteredXInRectScale();
  [(_UIActionSlider *)self->_actionSlider setFrame:v13];
  [(UIButton *)self->_cancelButton frame];
  UIRectCenteredXInRectScale();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v37.origin.double x = v4;
  v37.origin.double y = v6;
  v37.size.double width = v8;
  v37.size.double height = v10;
  -[UIButton setFrame:](self->_cancelButton, "setFrame:", v15, CGRectGetMaxY(v37) - *(double *)&v34 - *((double *)&v33 + 1), v17, v19, v13);
  -[UILabel sizeThatFits:](self->_cancelLabel, "sizeThatFits:", v8, v10);
  uint64_t v31 = v13;
  double v32 = v4;
  UIRectCenteredXInRectScale();
  double v21 = v20;
  CGFloat v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v38.origin.double x = v4;
  v38.origin.double y = v6;
  v38.size.double width = v8;
  v38.size.double height = v10;
  CGFloat v28 = CGRectGetMaxY(v38) - *(double *)&v35;
  v39.origin.double x = v21;
  v39.origin.double y = v23;
  v39.size.double width = v25;
  v39.size.double height = v27;
  CGFloat v29 = v28 - CGRectGetHeight(v39);
  [(UILabel *)self->_cancelLabel _baselineOffsetFromBottom];
  -[UILabel setFrame:](self->_cancelLabel, "setFrame:", v21, v29 + v30, v25, v27);
  -[UIView setFrame:](self->_backdropView, "setFrame:", v32, v6, v8, v10);
  -[SBUIShapeView setFrame:](self->_darkeningUnderlayView, "setFrame:", v32, v6, v8, v10);
  -[UIView setFrame:](self->_darkeningOverlayView, "setFrame:", v32, v6, v8, v10);
  [(SBUIPowerDownView *)self _updateSliderExclusionPath];
  [(UILabel *)self->_cancelLabel setNeedsLayout];
}

- (void)_willAnimateIn
{
  id v3 = [(SBUIPowerDownView *)self delegate];
  [v3 powerDownViewWillAnimateIn:self];
}

- (void)_willAnimateOut
{
  id v3 = [(SBUIPowerDownView *)self delegate];
  [v3 powerDownViewWillAnimateOut:self];
}

- (void)_powerDownSliderDidUpdateSlideWithValue:(double)a3
{
  [(SBUIShapeView *)self->_darkeningUnderlayView setAlpha:a3];
  [(SBUIPowerDownView *)self _updateSliderExclusionPath];
}

- (BOOL)_isLandscapeAspectRatio
{
  [(SBUIPowerDownView *)self bounds];
  return v2 >= v3;
}

- (void)_cancelAutoDismissTimer
{
  [(NSTimer *)self->_autoDismissTimer invalidate];
  autoDismissTimer = self->_autoDismissTimer;
  self->_autoDismissTimer = 0;
}

- (void)_resetAutoDismissTimer
{
  [(SBUIPowerDownView *)self _cancelAutoDismissTimer];
  self->_autoDismissTimer = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__idleTimerFired selector:0 userInfo:0 repeats:30.0];
  MEMORY[0x1F41817F8]();
}

- (void)_updateSliderExclusionPath
{
  double v3 = (void *)MEMORY[0x1E4F427D0];
  [(SBUIPowerDownView *)self bounds];
  CGFloat v4 = objc_msgSend(v3, "bezierPathWithRect:");
  double v5 = [(_UIActionSlider *)self->_actionSlider knobMaskPath];
  [(_UIActionSlider *)self->_actionSlider frame];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  CGFloat MinX = CGRectGetMinX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v14);
  CGAffineTransformMakeTranslation(&v12, MinX, MinY);
  [v5 applyTransform:&v12];
  [v4 appendBezierPath:v5];
  [(SBUIShapeView *)self->_darkeningUnderlayView setPath:v4];
}

- (void)_notifyDelegatePowerDown
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained powerDownViewRequestPowerDown:self];
}

- (void)_notifyDelegateCancelled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained powerDownViewRequestCancel:self];
}

- (void)didAcknowledgeFindMyInfo
{
}

- (void)didSuppressFindMy
{
}

- (void)_animatePowerDown
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__SBUIPowerDownView__animatePowerDown__block_invoke;
  v3[3] = &unk_1E5CCC580;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__SBUIPowerDownView__animatePowerDown__block_invoke_2;
  v2[3] = &unk_1E5CCC6E8;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] _animateUsingDefaultTimingWithOptions:0 animations:v3 completion:v2];
}

uint64_t __38__SBUIPowerDownView__animatePowerDown__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
  double v2 = *(void **)(*(void *)(a1 + 32) + 432);
  return [v2 setAlpha:1.0];
}

uint64_t __38__SBUIPowerDownView__animatePowerDown__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegatePowerDown];
}

- (id)_createActionSlider
{
  double v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 _graphicsQuality];

  id v5 = objc_alloc(MEMORY[0x1E4F43080]);
  double v6 = objc_msgSend(v5, "initWithFrame:vibrantSettings:", self->_vibrantSettings, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = (void *)MEMORY[0x1E4F42A80];
  double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v9 = [MEMORY[0x1E4F42D90] mainScreen];
  double v10 = [v9 traitCollection];
  v11 = [v7 imageNamed:@"PowerDownKnob" inBundle:v8 compatibleWithTraitCollection:v10];
  CGAffineTransform v12 = [v11 imageWithRenderingMode:2];
  [v6 setKnobImage:v12];

  CGRect v13 = [MEMORY[0x1E4F428B8] redColor];
  [v6 setTintColor:v13];

  CGRect v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v15 = [v14 localizedStringForKey:@"POWER_DOWN_LOCK_LABEL" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
  [v6 setTrackText:v15];

  [v6 setDelegate:self];
  objc_msgSend(v6, "setKnobImageOffset:", -0.5, -1.0);
  if (v4 == 10)
  {
    [v6 setStyle:2];
    double v16 = [MEMORY[0x1E4F428B8] colorWithWhite:0.831372549 alpha:0.96];
    [v6 setBackgroundColor:v16];
  }
  return v6;
}

- (void)_prepareViewsForAlert
{
  v12[1] = *MEMORY[0x1E4F143B8];
  [(SBUIPowerDownView *)self _resetAutoDismissTimer];
  [(_UIActionSlider *)self->_actionSlider removeFromSuperview];
  double v3 = [(SBUIPowerDownView *)self _createActionSlider];
  actionSlider = self->_actionSlider;
  self->_actionSlider = v3;

  [(SBUIPowerDownView *)self insertSubview:self->_actionSlider belowSubview:self->_cancelButton];
  findMyButton = self->_findMyButton;
  if (findMyButton)
  {
    double v6 = [(UIButton *)findMyButton topAnchor];
    double v7 = [(_UIActionSlider *)self->_actionSlider bottomAnchor];
    double v8 = [v6 constraintEqualToAnchor:v7 constant:4.0];

    double v9 = (void *)MEMORY[0x1E4F28DC8];
    v12[0] = v8;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v9 activateConstraints:v10];
  }
  [(SBUIPowerDownView *)self setNeedsLayout];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__SBUIPowerDownView__prepareViewsForAlert__block_invoke;
  v11[3] = &unk_1E5CCC580;
  v11[4] = self;
  [MEMORY[0x1E4F42FF0] _animateUsingDefaultTimingWithOptions:4 animations:v11 completion:0];
}

uint64_t __42__SBUIPowerDownView__prepareViewsForAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
}

- (void)_readIODeviceSupportsFindMy
{
  objc_initWeak(&location, self);
  double v3 = [(SBUIPowerDownView *)self beaconManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SBUIPowerDownView__readIODeviceSupportsFindMy__block_invoke;
  v4[3] = &unk_1E5CCC738;
  objc_copyWeak(&v5, &location);
  [v3 isLPEMModeSupported:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__SBUIPowerDownView__readIODeviceSupportsFindMy__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__SBUIPowerDownView__readIODeviceSupportsFindMy__block_invoke_2;
    block[3] = &unk_1E5CCC710;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v3);
  }
}

void __48__SBUIPowerDownView__readIODeviceSupportsFindMy__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setDeviceSupportsFindMy:1];
    [v2 _createFindMyUI];
    id WeakRetained = v2;
  }
}

- (void)_readShouldPowerDownViewShowFindMyAlert
{
  objc_initWeak(&location, self);
  id v3 = [(SBUIPowerDownView *)self beaconManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SBUIPowerDownView__readShouldPowerDownViewShowFindMyAlert__block_invoke;
  v4[3] = &unk_1E5CCC738;
  objc_copyWeak(&v5, &location);
  [v3 userHasAcknowledgeFindMyWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__SBUIPowerDownView__readShouldPowerDownViewShowFindMyAlert__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__SBUIPowerDownView__readShouldPowerDownViewShowFindMyAlert__block_invoke_2;
    v5[3] = &unk_1E5CCC5A8;
    v5[4] = WeakRetained;
    char v6 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __60__SBUIPowerDownView__readShouldPowerDownViewShowFindMyAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldPowerDownViewShowFindMyAlert:*(unsigned char *)(a1 + 40) == 0];
}

- (SBUIPowerDownViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIPowerDownViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)deviceSupportsFindMy
{
  return self->_deviceSupportsFindMy;
}

- (void)setDeviceSupportsFindMy:(BOOL)a3
{
  self->_deviceSupportsFindMCGFloat y = a3;
}

- (BOOL)shouldPowerDownViewShowFindMyAlert
{
  return self->_shouldPowerDownViewShowFindMyAlert;
}

- (void)setShouldPowerDownViewShowFindMyAlert:(BOOL)a3
{
  self->_shouldPowerDownViewShowFindMyAlert = a3;
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_storeStrong((id *)&self->_findMyButton, 0);
  objc_storeStrong((id *)&self->_cancelLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_actionSlider, 0);
  objc_storeStrong((id *)&self->_darkeningOverlayView, 0);
  objc_storeStrong((id *)&self->_darkeningUnderlayView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_autoDismissTimer, 0);
}

@end