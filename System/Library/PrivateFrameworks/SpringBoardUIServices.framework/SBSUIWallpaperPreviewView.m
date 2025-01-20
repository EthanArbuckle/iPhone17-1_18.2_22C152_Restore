@interface SBSUIWallpaperPreviewView
- (BOOL)shouldEnableParallax;
- (PBUIWallpaperView)wallpaperView;
- (SBFLockScreenDateView)dateView;
- (SBSUIWallpaperPreviewView)initWithFrame:(CGRect)a3 wallpaperView:(id)a4 disableParallax:(BOOL)a5;
- (SBSUIWallpaperPreviewViewDelegate)delegate;
- (UIButton)cancelButton;
- (UIButton)irisButton;
- (UIButton)parallaxButton;
- (UIButton)setButton;
- (double)_segmentedControlInset;
- (id)_makeButtonWithVisualEffectBlur;
- (void)_fadeOutInstructionsWithDelay:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_layoutCancelButton;
- (void)_layoutDateView;
- (void)_layoutGradientView;
- (void)_layoutIrisButton;
- (void)_layoutIrisInstructionLabels;
- (void)_layoutParallaxButton;
- (void)_layoutSetButton;
- (void)_layoutStackedButtons;
- (void)_layoutWallpaperView;
- (void)_userDidTapOnCancelButton:(id)a3;
- (void)_userDidTapOnIrisButton:(id)a3;
- (void)_userDidTapOnParallaxButton:(id)a3;
- (void)_userDidTapOnSetButton:(id)a3;
- (void)dealloc;
- (void)displayInstructionsForEffect:(unint64_t)a3 enabled:(BOOL)a4 animated:(BOOL)a5;
- (void)irisWallpaperPlayerPlaybackStateDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setCancelButton:(id)a3;
- (void)setDateView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIrisButton:(id)a3;
- (void)setParallaxButton:(id)a3;
- (void)setSetButton:(id)a3;
- (void)setWallpaperView:(id)a3;
- (void)updateForChangedSettings:(id)a3;
@end

@implementation SBSUIWallpaperPreviewView

- (SBSUIWallpaperPreviewView)initWithFrame:(CGRect)a3 wallpaperView:(id)a4 disableParallax:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v90.receiver = self;
  v90.super_class = (Class)SBSUIWallpaperPreviewView;
  v13 = -[SBSUIWallpaperPreviewView initWithFrame:](&v90, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    v14 = [MEMORY[0x1E4F428B8] blackColor];
    [(SBSUIWallpaperPreviewView *)v13 setBackgroundColor:v14];

    p_wallpaperView = (id *)&v13->_wallpaperView;
    objc_storeStrong((id *)&v13->_wallpaperView, a4);
    if (v13->_wallpaperView) {
      -[SBSUIWallpaperPreviewView addSubview:](v13, "addSubview:");
    }
    int v83 = [v12 supportsCropping];
    id v87 = v12;
    if ([MEMORY[0x1E4F42FF0] _motionEffectsEnabled]) {
      BOOL v16 = [(id)objc_opt_class() allowsParallax] & !a5;
    }
    else {
      BOOL v16 = 0;
    }
    v13->_parallaxPossible = v16;
    id v17 = *p_wallpaperView;
    if (objc_opt_respondsToSelector()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    v13->_irisPossible = v19 != 0;
    uint64_t v20 = *MEMORY[0x1E4F438C8];
    v21 = objc_msgSend(MEMORY[0x1E4F42A38], "preferredFontDescriptorWithTextStyle:");
    uint64_t v22 = [v21 fontDescriptorWithSymbolicTraits:0];

    v86 = (void *)v22;
    v85 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v22 size:0.0];
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F42A98], "configurationWithFont:");
    [MEMORY[0x1E4FA5F68] dateLabelFontSize];
    objc_msgSend(MEMORY[0x1E4F42A30], "systemFontOfSize:");
    v89 = v88 = (void *)v23;
    unint64_t v24 = 0x1E4F28000;
    if (v13->_irisPossible)
    {
      v25 = [(SBSUIWallpaperPreviewView *)v13 _makeButtonWithVisualEffectBlur];
      v26 = [MEMORY[0x1E4F42A80] systemImageNamed:@"livephoto.slash" withConfiguration:v23];
      [v25 setImage:v26 forState:0];

      v27 = [MEMORY[0x1E4F42A80] systemImageNamed:@"livephoto" withConfiguration:v23];
      [v25 setImage:v27 forState:4];

      v28 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      [v25 setTintColor:v28];

      [v25 addTarget:v13 action:sel__userDidTapOnIrisButton_ forControlEvents:64];
      [(SBSUIWallpaperPreviewView *)v13 setIrisButton:v25];
      id v29 = objc_alloc(MEMORY[0x1E4F43220]);
      v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"IRIS_INSTRUCTIONS_LINE_1" value:&stru_1EFCB7578 table:@"SpringBoardUIServices-OrbHW"];
      uint64_t v32 = [v29 initWithSettings:0 strength:v31 string:v89 font:5.0];
      irisInstructionsLabel1 = v13->_irisInstructionsLabel1;
      v13->_irisInstructionsLabel1 = (_UILegibilityLabel *)v32;

      [(_UILegibilityLabel *)v13->_irisInstructionsLabel1 setAlpha:0.0];
      [(SBSUIWallpaperPreviewView *)v13 addSubview:v13->_irisInstructionsLabel1];
      id v34 = objc_alloc(MEMORY[0x1E4F43220]);
      v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v36 = [v35 localizedStringForKey:@"IRIS_INSTRUCTIONS_LINE_2" value:&stru_1EFCB7578 table:@"SpringBoardUIServices-OrbHW"];
      uint64_t v37 = [v34 initWithSettings:0 strength:v36 string:v89 font:5.0];
      irisInstructionsLabel2 = v13->_irisInstructionsLabel2;
      v13->_irisInstructionsLabel2 = (_UILegibilityLabel *)v37;

      [(_UILegibilityLabel *)v13->_irisInstructionsLabel2 setAlpha:0.0];
      [(SBSUIWallpaperPreviewView *)v13 addSubview:v13->_irisInstructionsLabel2];
      [*p_wallpaperView setIrisDelegate:v13];

      unint64_t v24 = 0x1E4F28000uLL;
    }
    unint64_t v39 = v24;
    if (v13->_parallaxPossible)
    {
      v40 = [(SBSUIWallpaperPreviewView *)v13 _makeButtonWithVisualEffectBlur];
      v41 = [MEMORY[0x1E4F42A80] systemImageNamed:@"rectangle.and.arrow.up.right.and.arrow.down.left.slash" withConfiguration:v23];
      [v40 setImage:v41 forState:0];

      v42 = [MEMORY[0x1E4F42A80] systemImageNamed:@"rectangle.and.arrow.up.right.and.arrow.down.left" withConfiguration:v23];
      [v40 setImage:v42 forState:4];

      v43 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      [v40 setTintColor:v43];

      [v40 addTarget:v13 action:sel__userDidTapOnParallaxButton_ forControlEvents:64];
      [(SBSUIWallpaperPreviewView *)v13 setParallaxButton:v40];
    }
    uint64_t v80 = v20;
    v44 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:v20];
    uint64_t v45 = [v44 fontDescriptorWithSymbolicTraits:2];

    v46 = [(SBSUIWallpaperPreviewView *)v13 _makeButtonWithVisualEffectBlur];
    v47 = [v46 layer];
    uint64_t v48 = *MEMORY[0x1E4F39EA8];
    [v47 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    v49 = [v46 titleLabel];
    v50 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v45 size:0.0];
    [v49 setFont:v50];

    unint64_t v51 = v39;
    v52 = [*(id *)(v39 + 2896) bundleForClass:objc_opt_class()];
    uint64_t v53 = [v52 localizedStringForKey:@"WALLPAPER_PREVIEW_VIEW_CANCEL" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

    v81 = (void *)v53;
    [v46 setTitle:v53 forState:0];
    [v46 addTarget:v13 action:sel__userDidTapOnCancelButton_ forControlEvents:64];
    [(SBSUIWallpaperPreviewView *)v13 setCancelButton:v46];
    v54 = [(SBSUIWallpaperPreviewView *)v13 _makeButtonWithVisualEffectBlur];
    v55 = [v54 layer];
    [v55 setCornerCurve:v48];

    v56 = [v54 titleLabel];
    unint64_t v57 = v51;
    v82 = (void *)v45;
    v58 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v45 size:0.0];
    [v56 setFont:v58];

    v59 = [*(id *)(v51 + 2896) bundleForClass:objc_opt_class()];
    v60 = [v59 localizedStringForKey:@"WALLPAPER_PREVIEW_VIEW_SET" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

    [v54 setTitle:v60 forState:0];
    [v54 addTarget:v13 action:sel__userDidTapOnSetButton_ forControlEvents:64];
    [(SBSUIWallpaperPreviewView *)v13 setSetButton:v54];
    v61 = objc_alloc_init(_SBSUIWallpaperGradientView);
    gradientView = v13->_gradientView;
    v13->_gradientView = &v61->super;

    [(SBSUIWallpaperPreviewView *)v13 addSubview:v13->_gradientView];
    v63 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    v64 = [v63 preferredFontForTextStyle:v80 hiFontStyle:4];

    if (v83)
    {
      v84 = [MEMORY[0x1E4F42A98] configurationWithFont:v64];
      v65 = [MEMORY[0x1E4F42A80] systemImageNamed:@"crop" withConfiguration:v84];
      v66 = [v65 imageWithRenderingMode:2];

      v67 = [_SBUIWallpaperInstructionView alloc];
      v68 = [*(id *)(v57 + 2896) bundleForClass:objc_opt_class()];
      v69 = [v68 localizedStringForKey:@"WALLPAPER_MOVE_ROTATE_SCALE" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
      uint64_t v70 = [(_SBUIWallpaperInstructionView *)v67 initWithImage:v66 text:v69 font:v64];
      cropInstructionView = v13->_cropInstructionView;
      v13->_cropInstructionView = (_SBUIWallpaperInstructionView *)v70;

      v72 = v13->_cropInstructionView;
      v73 = [MEMORY[0x1E4F428B8] whiteColor];
      [(_SBUIWallpaperInstructionView *)v72 setTintColor:v73];

      [(SBSUIWallpaperPreviewView *)v13 addSubview:v13->_cropInstructionView];
    }
    v74 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    effectStateLabel = v13->_effectStateLabel;
    v13->_effectStateLabel = v74;

    v76 = v13->_effectStateLabel;
    v77 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v76 setTextColor:v77];

    [(UILabel *)v13->_effectStateLabel setFont:v64];
    [(UILabel *)v13->_effectStateLabel setAlpha:0.0];
    [(UILabel *)v13->_effectStateLabel setNumberOfLines:0];
    [(SBSUIWallpaperPreviewView *)v13 addSubview:v13->_effectStateLabel];
    v78 = v13;

    id v12 = v87;
  }

  return v13;
}

- (id)_makeButtonWithVisualEffectBlur
{
  v2 = objc_alloc_init(SBSUIWallpaperButton);
  return v2;
}

- (void)_userDidTapOnIrisButton:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSUIWallpaperPreviewView *)self delegate];
  [v5 userDidTapOnIrisButton:v4];
}

- (void)_userDidTapOnParallaxButton:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSUIWallpaperPreviewView *)self delegate];
  [v5 userDidTapOnParallaxButton:v4];
}

- (void)_userDidTapOnCancelButton:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSUIWallpaperPreviewView *)self delegate];
  [v5 userDidTapOnCancelButton:v4];
}

- (void)_userDidTapOnSetButton:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSUIWallpaperPreviewView *)self delegate];
  [v5 userDidTapOnSetButton:v4];
}

- (void)dealloc
{
  if (self->_irisPossible) {
    [(PBUIWallpaperView *)self->_wallpaperView setIrisDelegate:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBSUIWallpaperPreviewView;
  [(SBSUIWallpaperPreviewView *)&v3 dealloc];
}

- (void)setDateView:(id)a3
{
  id v6 = a3;
  dateView = self->_dateView;
  if (dateView) {
    [(SBFLockScreenDateView *)dateView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_dateView, a3);
  if (self->_dateView) {
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");
  }
}

- (void)setIrisButton:(id)a3
{
  id v6 = a3;
  irisButton = self->_irisButton;
  if (irisButton) {
    [(UIButton *)irisButton removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_irisButton, a3);
  if (self->_irisButton) {
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");
  }
}

- (void)setParallaxButton:(id)a3
{
  id v6 = a3;
  parallaxButton = self->_parallaxButton;
  if (parallaxButton) {
    [(UIButton *)parallaxButton removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_parallaxButton, a3);
  if (self->_parallaxButton) {
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");
  }
}

- (void)setCancelButton:(id)a3
{
  id v6 = a3;
  cancelButton = self->_cancelButton;
  if (cancelButton) {
    [(UIButton *)cancelButton removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_cancelButton, a3);
  if (self->_cancelButton) {
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");
  }
}

- (void)setSetButton:(id)a3
{
  id v6 = a3;
  setButton = self->_setButton;
  if (setButton) {
    [(UIButton *)setButton removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_setButton, a3);
  if (self->_setButton) {
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");
  }
}

- (void)setWallpaperView:(id)a3
{
  id v7 = a3;
  p_wallpaperView = &self->_wallpaperView;
  wallpaperView = self->_wallpaperView;
  if (wallpaperView) {
    [(PBUIWallpaperView *)wallpaperView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_wallpaperView, a3);
  if (*p_wallpaperView)
  {
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");
    [(SBSUIWallpaperPreviewView *)self sendSubviewToBack:*p_wallpaperView];
    if (self->_irisPossible) {
      [(PBUIWallpaperView *)*p_wallpaperView setIrisDelegate:self];
    }
  }
}

- (BOOL)shouldEnableParallax
{
  [(PBUIWallpaperView *)self->_wallpaperView parallaxFactor];
  return v2 > 0.0;
}

- (void)updateForChangedSettings:(id)a3
{
  irisInstructionsLabel1 = self->_irisInstructionsLabel1;
  id v5 = a3;
  [(_UILegibilityLabel *)irisInstructionsLabel1 updateForChangedSettings:v5];
  [(_UILegibilityLabel *)self->_irisInstructionsLabel2 updateForChangedSettings:v5];
}

- (void)displayInstructionsForEffect:(unint64_t)a3 enabled:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke;
  v9[3] = &unk_1E5CCE1B8;
  BOOL v11 = v5;
  v10[1] = (id)a3;
  v9[4] = self;
  BOOL v12 = a4;
  objc_copyWeak(v10, &location);
  [(SBSUIWallpaperPreviewView *)self _fadeOutInstructionsWithDelay:v5 animated:v9 completion:0.0];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  if (*(unsigned char *)(a1 + 56)) {
    double v3 = 0.25;
  }
  else {
    double v3 = 0.0;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == 1)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 472))
    {
      if (*(unsigned char *)(a1 + 57)) {
        double v2 = 1.0;
      }
      else {
        double v2 = 0.0;
      }
      BOOL v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v6 = v5;
      int v7 = *(unsigned __int8 *)(a1 + 57);
      v8 = @"WALLPAPER_LIVE_PHOTO_ON";
      v9 = @"WALLPAPER_LIVE_PHOTO_OFF";
      goto LABEL_13;
    }
LABEL_17:
    BOOL v11 = 0;
    goto LABEL_18;
  }
  if (v4 || !*(unsigned char *)(*(void *)(a1 + 32) + 473)) {
    goto LABEL_17;
  }
  BOOL v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = v5;
  int v7 = *(unsigned __int8 *)(a1 + 57);
  v8 = @"WALLPAPER_PERSPECTIVE_ZOOM_ON";
  v9 = @"WALLPAPER_PERSPECTIVE_ZOOM_OFF";
LABEL_13:
  if (v7) {
    v10 = v8;
  }
  else {
    v10 = v9;
  }
  BOOL v11 = [v5 localizedStringForKey:v10 value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

LABEL_18:
  [*(id *)(*(void *)(a1 + 32) + 448) setText:v11];
  [*(id *)(a1 + 32) setNeedsLayout];
  id v12 = objc_alloc(MEMORY[0x1E4F43008]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_2;
  v23[3] = &unk_1E5CCC850;
  v23[4] = *(void *)(a1 + 32);
  *(double *)&v23[5] = v2;
  uint64_t v13 = [v12 initWithDuration:0 curve:v23 animations:v3];
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 416);
  *(void *)(v14 + 416) = v13;

  BOOL v16 = *(void **)(*(void *)(a1 + 32) + 416);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_3;
  uint64_t v20 = &unk_1E5CCE190;
  objc_copyWeak(&v22, (id *)(a1 + 40));
  uint64_t v21 = *(void *)(a1 + 32);
  [v16 addCompletion:&v17];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "startAnimation", v17, v18, v19, v20);
  objc_destroyWeak(&v22);
}

uint64_t __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:*(double *)(a1 + 40)];
  double v2 = *(void **)(*(void *)(a1 + 32) + 448);
  return [v2 setAlpha:1.0];
}

void __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    v6[7] = v2;
    v6[8] = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_4;
    v6[3] = &unk_1E5CCC6E8;
    v6[4] = *(void *)(a1 + 32);
    [WeakRetained _fadeOutInstructionsWithDelay:1 animated:v6 completion:4.0];
  }
}

void __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_4(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_5;
  v5[3] = &unk_1E5CCC580;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F43008] runningPropertyAnimatorWithDuration:0 delay:v5 options:0 animations:0.25 completion:0.0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 408);
  *(void *)(v3 + 408) = v2;
}

uint64_t __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:1.0];
}

- (void)_fadeOutInstructionsWithDelay:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (v5) {
    double v9 = 0.25;
  }
  else {
    double v9 = 0.0;
  }
  [(UIViewPropertyAnimator *)self->_cropInstructionsAnimator stopAnimation:1];
  [(UIViewPropertyAnimator *)self->_effectInstructionsAnimator stopAnimation:1];
  [(UIViewPropertyAnimator *)self->_fadeOutInstructionsAnimator stopAnimation:1];
  id v10 = objc_alloc(MEMORY[0x1E4F43008]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__SBSUIWallpaperPreviewView__fadeOutInstructionsWithDelay_animated_completion___block_invoke;
  v20[3] = &unk_1E5CCC580;
  v20[4] = self;
  BOOL v11 = (UIViewPropertyAnimator *)[v10 initWithDuration:0 curve:v20 animations:v9];
  fadeOutInstructionsAnimator = self->_fadeOutInstructionsAnimator;
  self->_fadeOutInstructionsAnimator = v11;

  uint64_t v13 = self->_fadeOutInstructionsAnimator;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __79__SBSUIWallpaperPreviewView__fadeOutInstructionsWithDelay_animated_completion___block_invoke_2;
  uint64_t v18 = &unk_1E5CCE1E0;
  id v19 = v8;
  id v14 = v8;
  [(UIViewPropertyAnimator *)v13 addCompletion:&v15];
  -[UIViewPropertyAnimator startAnimationAfterDelay:](self->_fadeOutInstructionsAnimator, "startAnimationAfterDelay:", a3, v15, v16, v17, v18);
}

uint64_t __79__SBSUIWallpaperPreviewView__fadeOutInstructionsWithDelay_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 456);
  return [v2 setAlpha:0.0];
}

uint64_t __79__SBSUIWallpaperPreviewView__fadeOutInstructionsWithDelay_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBSUIWallpaperPreviewView;
  [(SBSUIWallpaperPreviewView *)&v3 layoutSubviews];
  [(SBSUIWallpaperPreviewView *)self _layoutGradientView];
  [(SBSUIWallpaperPreviewView *)self _layoutStackedButtons];
  [(SBSUIWallpaperPreviewView *)self _layoutIrisButton];
  [(SBSUIWallpaperPreviewView *)self _layoutParallaxButton];
  [(SBSUIWallpaperPreviewView *)self _layoutCancelButton];
  [(SBSUIWallpaperPreviewView *)self _layoutSetButton];
  [(SBSUIWallpaperPreviewView *)self _layoutDateView];
  [(SBSUIWallpaperPreviewView *)self _layoutWallpaperView];
  [(SBSUIWallpaperPreviewView *)self _layoutIrisInstructionLabels];
}

- (void)_layoutGradientView
{
  if (self->_gradientView)
  {
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");
    [(SBSUIWallpaperPreviewView *)self bounds];
    [(SBSUIWallpaperPreviewView *)self bounds];
    CGRectGetMaxY(v11);
    [(SBSUIWallpaperPreviewView *)self bounds];
    UIPointRoundToViewScale();
    double v4 = v3;
    double v6 = v5;
    UISizeRoundToViewScale();
    gradientView = self->_gradientView;
    -[UIView setFrame:](gradientView, "setFrame:", v4, v6, v7, v8);
  }
}

- (void)_layoutWallpaperView
{
  wallpaperView = self->_wallpaperView;
  if (wallpaperView)
  {
    [(SBSUIWallpaperPreviewView *)self bounds];
    -[PBUIWallpaperView setFrame:](wallpaperView, "setFrame:");
  }
}

- (void)_layoutDateView
{
  dateView = self->_dateView;
  if (dateView)
  {
    [(SBFLockScreenDateView *)dateView layoutIfNeeded];
    double v4 = self->_dateView;
    [(SBSUIWallpaperPreviewView *)self bounds];
    -[SBFLockScreenDateView setFrame:](v4, "setFrame:");
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      double v5 = (void *)MEMORY[0x1E4FA5EE0];
      [(SBSUIWallpaperPreviewView *)self bounds];
      objc_msgSend(v5, "suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:", 0);
      double v6 = self->_dateView;
      -[SBFLockScreenDateView setFrame:](v6, "setFrame:");
    }
  }
}

- (double)_segmentedControlInset
{
  [(SBSUIWallpaperPreviewView *)self safeAreaInsets];
  return v2 + 104.0;
}

- (void)_layoutStackedButtons
{
  p_cancelButton = &self->_cancelButton;
  double v4 = [(UIButton *)self->_cancelButton titleLabel];
  double v5 = [v4 font];
  [v5 pointSize];
  double v7 = v6 * 1.8;

  double v8 = fmax(v7, 34.0);
  double v9 = [(SBSUIWallpaperPreviewView *)self readableContentGuide];
  [v9 layoutFrame];
  double v11 = v10;

  id v12 = [(SBSUIWallpaperPreviewView *)self readableContentGuide];
  [v12 layoutFrame];
  id v120 = v13;

  id v14 = [(UIButton *)*p_cancelButton titleLabel];
  [v14 intrinsicContentSize];
  double v16 = v15;

  uint64_t v17 = [(UIButton *)self->_setButton titleLabel];
  [v17 intrinsicContentSize];
  double v19 = v18;

  p_parallaxButton = &self->_parallaxButton;
  parallaxButton = self->_parallaxButton;
  if (parallaxButton) {
    double v22 = v8;
  }
  else {
    double v22 = 0.0;
  }
  p_irisButton = &self->_irisButton;
  irisButton = self->_irisButton;
  if (parallaxButton) {
    BOOL v25 = irisButton == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (v25) {
    double v26 = 0.0;
  }
  else {
    double v26 = 24.0;
  }
  double v114 = v26;
  double v116 = v22;
  if (v16 >= v19) {
    double v27 = v16;
  }
  else {
    double v27 = v19;
  }
  double v28 = v27 + 32.0;
  double v29 = v8 + v27;
  unint64_t v30 = (unint64_t)irisButton | (unint64_t)parallaxButton;
  if (irisButton) {
    double v31 = v8;
  }
  else {
    double v31 = 0.0;
  }
  if (v30) {
    double v32 = 24.0;
  }
  else {
    double v32 = 0.0;
  }
  v33 = [(SBSUIWallpaperPreviewView *)self safeAreaLayoutGuide];
  [v33 layoutFrame];
  double MaxY = CGRectGetMaxY(v123);

  [(SBSUIWallpaperPreviewView *)self bounds];
  double v35 = CGRectGetMaxY(v124) + -35.0;
  if (MaxY < v35) {
    double v35 = MaxY;
  }
  double v36 = v35 - v8;
  double v118 = v28 * 2.0 + 16.0;
  if (v118 > v11)
  {
    if (v11 >= v29) {
      double v37 = v29;
    }
    else {
      double v37 = v11;
    }
    v125.origin.CGFloat x = 0.0;
    v125.origin.double y = v36;
    v125.size.double width = v37;
    v125.size.double height = v8;
    CGFloat v38 = CGRectGetMinY(v125) - v8 + -10.0;
    [(SBSUIWallpaperPreviewView *)self bounds];
    v127.origin.CGFloat x = CGRectGetMidX(v126) + v37 * -0.5;
    CGFloat x = v127.origin.x;
    v127.origin.double y = v38;
    v127.size.double width = v37;
    v127.size.double height = v8;
    CGRectGetMinY(v127);
    double v40 = v11;
    if (*p_irisButton && *p_parallaxButton)
    {
      v128.origin.CGFloat x = x;
      v128.origin.double y = v36;
      v128.size.double width = v37;
      v128.size.double height = v8;
      CGRectGetMaxX(v128);
    }
    else
    {
      v134.origin.CGFloat x = x;
      v134.origin.double y = v36;
      v134.size.double width = v37;
      v134.size.double height = v8;
      CGRectGetMidX(v134);
    }
    goto LABEL_50;
  }
  double v41 = v116;
  double v42 = v32 + v116 + v114 + v31 + v32 + v28 * 2.0;
  if (v31 >= v116) {
    double v41 = v31;
  }
  BOOL v43 = v42 <= v11 || v32 + v32 + v28 * 2.0 + v41 > v11;
  double rect_8 = v11;
  BOOL v44 = !v43 && *p_irisButton && *p_parallaxButton != 0;
  double v45 = v28 * 2.0 + 16.0;
  if (v42 <= v11) {
    double v45 = v32 + v116 + v114 + v31 + v32 + v28 * 2.0;
  }
  double v46 = v11 - v45;
  double v47 = fmax(v29 - v28, 0.0);
  if (v47 >= v46 * 0.5) {
    double v48 = v46 * 0.5;
  }
  else {
    double v48 = v47;
  }
  [(SBSUIWallpaperPreviewView *)self bounds];
  double v49 = v28 + v48;
  double v50 = fmin(*(double *)&v120 + (v46 + (v28 + v48 - v28) * -2.0) * 0.5, 35.0);
  double v51 = CGRectGetMaxX(v129) - v50 - (v28 + v48);
  if (v42 <= rect_8)
  {
    if (*p_irisButton && *p_parallaxButton)
    {
      v130.origin.CGFloat x = v51;
      v130.origin.double y = v36;
      v130.size.double width = v49;
      v130.size.double height = v8;
      double MinX = CGRectGetMinX(v130);
      v131.origin.CGFloat x = v50;
      v131.origin.double y = v36;
      v131.size.double width = v49;
      v131.size.double height = v8;
      double v53 = MinX - CGRectGetMaxX(v131) - v8 - v8;
      CGFloat v54 = v50;
      double v55 = v53 / 3.0;
      v132.origin.CGFloat x = v54;
      v132.origin.double y = v36;
      v132.size.double width = v49;
      v132.size.double height = v8;
      v133.origin.CGFloat x = CGRectGetMaxX(v132) + v55;
      v133.origin.double y = v36;
      v133.size.double width = v8;
      v133.size.double height = v8;
      CGRectGetMaxX(v133);
LABEL_49:
      double v40 = rect_8;
      goto LABEL_50;
    }
LABEL_48:
    [(SBSUIWallpaperPreviewView *)self center];
    goto LABEL_49;
  }
  v135.origin.CGFloat x = v50;
  v135.origin.double y = v36;
  v135.size.double width = v49;
  v135.size.double height = v8;
  CGRectGetMinY(v135);
  if (v44) {
    goto LABEL_48;
  }
  double v40 = rect_8;
  if (*p_irisButton && *p_parallaxButton)
  {
    v140.origin.CGFloat x = v50;
    v140.origin.double y = v36;
    v140.size.double width = v49;
    v140.size.double height = v8;
    CGRectGetMidX(v140);
    v141.origin.CGFloat x = v51;
    v141.origin.double y = v36;
    v141.size.double width = v49;
    v141.size.double height = v8;
    CGRectGetMidX(v141);
  }
  else
  {
    v104 = [(SBSUIWallpaperPreviewView *)self readableContentGuide];
    [v104 layoutFrame];
    CGRectGetMidX(v142);
  }
LABEL_50:
  BOOL v56 = [(SBSUIWallpaperPreviewView *)self effectiveUserInterfaceLayoutDirection] == 0;
  if (v118 > v40) {
    BOOL v56 = 1;
  }
  if (v56) {
    p_setButton = p_cancelButton;
  }
  else {
    p_setButton = &self->_setButton;
  }
  v121 = *p_setButton;
  BOOL v58 = [(SBSUIWallpaperPreviewView *)self effectiveUserInterfaceLayoutDirection] == 0;
  if (v118 > v40) {
    BOOL v58 = 1;
  }
  if (v58) {
    v59 = &self->_setButton;
  }
  else {
    v59 = p_cancelButton;
  }
  v60 = *v59;
  if ([(SBSUIWallpaperPreviewView *)self effectiveUserInterfaceLayoutDirection]) {
    v61 = &self->_parallaxButton;
  }
  else {
    v61 = &self->_irisButton;
  }
  v62 = *v61;
  if ([(SBSUIWallpaperPreviewView *)self effectiveUserInterfaceLayoutDirection]) {
    v63 = &self->_irisButton;
  }
  else {
    v63 = &self->_parallaxButton;
  }
  v64 = *v63;
  UIPointRoundToViewScale();
  double v66 = v65;
  double v108 = v67;
  UISizeRoundToViewScale();
  double v69 = v68;
  double v71 = v70;
  UIPointRoundToViewScale();
  double v73 = v72;
  double v75 = v74;
  UISizeRoundToViewScale();
  double v107 = v76;
  double rect_8a = v77;
  UIPointRoundToViewScale();
  double rect = v78;
  double v119 = v79;
  UISizeRoundToViewScale();
  double v115 = v81;
  double v117 = v80;
  UIPointRoundToViewScale();
  double rect_16 = v83;
  double rect_24 = v82;
  UISizeRoundToViewScale();
  double v85 = v84;
  double v105 = v86;
  CGFloat v106 = v84;
  -[UIButton setFrame:](v121, "setFrame:", v66, v108, v69, v71);
  -[UIButton setFrame:](v60, "setFrame:", v73, v75, v107, rect_8a);
  -[UIButton setFrame:](v62, "setFrame:", rect, v119, v117, v115);
  -[UIButton setFrame:](v64, "setFrame:", rect_24, rect_16, v85, v105);
  v136.origin.CGFloat x = v66;
  v136.origin.double y = v108;
  v136.size.double width = v69;
  v136.size.double height = v71;
  double MinY = CGRectGetMinY(v136);
  v137.origin.CGFloat x = v73;
  v137.origin.double y = v75;
  v137.size.double width = v107;
  v137.size.double height = rect_8a;
  double v88 = CGRectGetMinY(v137);
  if (MinY >= v88) {
    double MinY = v88;
  }
  v138.origin.CGFloat x = rect;
  v138.size.double width = v117;
  v138.origin.double y = v119;
  v138.size.double height = v115;
  double v89 = CGRectGetMinY(v138);
  if (MinY >= v89) {
    double MinY = v89;
  }
  v139.origin.double y = rect_16;
  v139.origin.CGFloat x = rect_24;
  v139.size.double width = v106;
  v139.size.double height = v105;
  double v90 = CGRectGetMinY(v139);
  if (MinY >= v90) {
    double v91 = v90;
  }
  else {
    double v91 = MinY;
  }
  cropInstructionView = self->_cropInstructionView;
  [(SBSUIWallpaperPreviewView *)self size];
  -[_SBUIWallpaperInstructionView sizeThatFits:](cropInstructionView, "sizeThatFits:");
  double v94 = v93;
  BSRectWithSize();
  [(SBSUIWallpaperPreviewView *)self bounds];
  UIRectCenteredXInRectScale();
  -[_SBUIWallpaperInstructionView setFrame:](self->_cropInstructionView, "setFrame:", v95, SBUIFloatFloorForScale(v91 - v94 + -20.0, 0.0), v96, v97, 0);
  [(SBSUIWallpaperPreviewView *)self bringSubviewToFront:self->_cropInstructionView];
  effectStateLabel = self->_effectStateLabel;
  [(SBSUIWallpaperPreviewView *)self size];
  -[UILabel sizeThatFits:](effectStateLabel, "sizeThatFits:");
  double v100 = v99;
  BSRectWithSize();
  [(SBSUIWallpaperPreviewView *)self bounds];
  UIRectCenteredXInRectScale();
  -[UILabel setFrame:](self->_effectStateLabel, "setFrame:", v101, SBUIFloatFloorForScale(v91 - v100 + -20.0, 0.0), v102, v103, 0);
  [(SBSUIWallpaperPreviewView *)self bringSubviewToFront:self->_effectStateLabel];
}

- (void)_layoutIrisInstructionLabels
{
  irisInstructionsLabel2 = self->_irisInstructionsLabel2;
  [(SBSUIWallpaperPreviewView *)self size];
  -[_UILegibilityLabel sizeThatFits:](irisInstructionsLabel2, "sizeThatFits:");
  BSRectWithSize();
  [(SBSUIWallpaperPreviewView *)self bounds];
  UIRectCenteredIntegralRect();
  -[_UILegibilityLabel setFrame:](self->_irisInstructionsLabel2, "setFrame:");
  irisInstructionsLabel1 = self->_irisInstructionsLabel1;
  [(SBSUIWallpaperPreviewView *)self size];
  -[_UILegibilityLabel sizeThatFits:](irisInstructionsLabel1, "sizeThatFits:");
  BSRectWithSize();
  [(SBSUIWallpaperPreviewView *)self bounds];
  UIRectCenteredIntegralRect();
  double v5 = self->_irisInstructionsLabel1;
  -[_UILegibilityLabel setFrame:](v5, "setFrame:");
}

- (void)_layoutIrisButton
{
  irisButton = self->_irisButton;
  if (irisButton)
  {
    double v4 = [(UIButton *)irisButton layer];
    [(UIButton *)self->_irisButton frame];
    [v4 setCornerRadius:CGRectGetHeight(v7) * 0.5];

    double v5 = self->_irisButton;
    [(SBSUIWallpaperPreviewView *)self bringSubviewToFront:v5];
  }
}

- (void)_layoutParallaxButton
{
  parallaxButton = self->_parallaxButton;
  if (parallaxButton)
  {
    double v4 = [(UIButton *)parallaxButton layer];
    [(UIButton *)self->_parallaxButton frame];
    [v4 setCornerRadius:CGRectGetHeight(v7) * 0.5];

    double v5 = self->_parallaxButton;
    [(SBSUIWallpaperPreviewView *)self bringSubviewToFront:v5];
  }
}

- (void)_layoutCancelButton
{
  cancelButton = self->_cancelButton;
  if (cancelButton)
  {
    double v4 = [(UIButton *)cancelButton layer];
    [(UIButton *)self->_cancelButton frame];
    [v4 setCornerRadius:CGRectGetHeight(v7) * 0.5];

    double v5 = self->_cancelButton;
    [(SBSUIWallpaperPreviewView *)self bringSubviewToFront:v5];
  }
}

- (void)_layoutSetButton
{
  setButton = self->_setButton;
  if (setButton)
  {
    double v4 = [(UIButton *)setButton layer];
    [(UIButton *)self->_setButton frame];
    [v4 setCornerRadius:CGRectGetHeight(v7) * 0.5];

    double v5 = self->_setButton;
    [(SBSUIWallpaperPreviewView *)self bringSubviewToFront:v5];
  }
}

- (void)irisWallpaperPlayerPlaybackStateDidChange:(id)a3
{
  if ([a3 irisPlaybackState] == 4)
  {
    [(SBSUIWallpaperPreviewView *)self _fadeOutInstructionsWithDelay:1 animated:0 completion:0.0];
  }
}

- (SBSUIWallpaperPreviewViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSUIWallpaperPreviewViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFLockScreenDateView)dateView
{
  return self->_dateView;
}

- (PBUIWallpaperView)wallpaperView
{
  return self->_wallpaperView;
}

- (UIButton)irisButton
{
  return self->_irisButton;
}

- (UIButton)parallaxButton
{
  return self->_parallaxButton;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (UIButton)setButton
{
  return self->_setButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_parallaxButton, 0);
  objc_storeStrong((id *)&self->_irisButton, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_cropInstructionView, 0);
  objc_storeStrong((id *)&self->_effectStateLabel, 0);
  objc_storeStrong((id *)&self->_irisInstructionsLabel2, 0);
  objc_storeStrong((id *)&self->_irisInstructionsLabel1, 0);
  objc_storeStrong((id *)&self->_fadeOutInstructionsAnimator, 0);
  objc_storeStrong((id *)&self->_effectInstructionsAnimator, 0);
  objc_storeStrong((id *)&self->_cropInstructionsAnimator, 0);
}

@end