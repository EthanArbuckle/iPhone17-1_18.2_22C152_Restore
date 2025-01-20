@interface SBFolderControllerBackgroundView
+ (id)_tintColorForEffect:(unint64_t)a3;
- (BOOL)_isCurrentlyExpanding;
- (BOOL)isEffectActive;
- (BOOL)isExpanding;
- (BOOL)isFrozen;
- (BOOL)isReduceTransparencyEnabled;
- (BOOL)isTransitionCancelled;
- (SBFolderControllerBackgroundView)initWithFrame:(CGRect)a3;
- (SBFolderControllerBackgroundViewDelegate)delegate;
- (double)minimumHomeScreenScale;
- (id)currentEffectMaterialRecipeNameForHighQualityBlur:(BOOL)a3;
- (unint64_t)concreteEffect;
- (unint64_t)currentEffect;
- (unint64_t)effect;
- (void)_reduceTransparencyEnabledStateChanged;
- (void)_updateCurrentEffect;
- (void)layoutSubviews;
- (void)setCurrentEffect:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEffect:(unint64_t)a3;
- (void)setEffectActive:(BOOL)a3;
- (void)setExpanding:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setReduceTransparencyEnabled:(BOOL)a3;
- (void)setTransitionCancelled:(BOOL)a3;
@end

@implementation SBFolderControllerBackgroundView

void __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 49) || !*(unsigned char *)(a1 + 50))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [*(id *)(*(void *)(a1 + 32) + 408) removeFromSuperview];
      uint64_t v2 = *(void *)(a1 + 32);
      v3 = *(void **)(v2 + 408);
      *(void *)(v2 + 408) = 0;

      id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = *(void **)(v5 + 424);
      *(void *)(v5 + 424) = v4;

      [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
      [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 424)];
    }
  }
  else
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass()) {
        BOOL v7 = SBFEffectiveDeviceClass() == 1;
      }
      else {
        BOOL v7 = 1;
      }
    }
    else
    {
      v8 = [MEMORY[0x1E4FB16C8] currentDevice];
      BOOL v7 = [v8 userInterfaceIdiom] == 0;
    }
    v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = objc_msgSend(v9, "sbf_homescreenFolderBackgroundGraphicsQuality");

    uint64_t v11 = v10 == 100 || v7;
    v12 = [*(id *)(a1 + 32) currentEffectMaterialRecipeNameForHighQualityBlur:v11];
    if (*(unsigned char *)(a1 + 49) || *(unsigned char *)(a1 + 50))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(void **)(v13 + 424);
      *(void *)(v13 + 424) = 0;

      v15 = (void *)MEMORY[0x1E4F743C8];
      v16 = SBHBundle();
      uint64_t v17 = [v15 materialViewWithRecipeNamed:v12 inBundle:v16 options:0 initialWeighting:0 scaleAdjustment:0.01];
      uint64_t v18 = *(void *)(a1 + 32);
      v19 = *(void **)(v18 + 408);
      *(void *)(v18 + 408) = v17;

      [*(id *)(*(void *)(a1 + 32) + 408) setGroupNameBase:@"SBFolderControllerBackgroundViewBlurGroupName"];
      [*(id *)(*(void *)(a1 + 32) + 408) setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:1];
      if (v10 == 100 && v7)
      {
        v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v21 scale];
        double v23 = v22;

        if (v23 == 3.0) {
          [*(id *)(*(void *)(a1 + 32) + 408) setBackdropScaleAdjustment:&__block_literal_global_6];
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 408) setWeighting:0.0];
      [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 408)];
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 432)];
    [*(id *)(a1 + 32) setNeedsLayout];
    v24 = *(void **)(a1 + 32);
    [v24 layoutIfNeeded];
  }
}

- (id)currentEffectMaterialRecipeNameForHighQualityBlur:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = [(SBFolderControllerBackgroundView *)self concreteEffect];
  if (v4 == 2)
  {
    v6 = @"folderExpandedBackgroundApp";
  }
  else if (v4 == 1)
  {
    uint64_t v5 = @"folderExpandedBackgroundHomeSimplified";
    if (v3) {
      uint64_t v5 = @"folderExpandedBackgroundHome";
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_updateCurrentEffect
{
  unint64_t v3 = [(SBFolderControllerBackgroundView *)self currentEffect];
  unint64_t v4 = [(SBFolderControllerBackgroundView *)self concreteEffect];
  [(SBFolderControllerBackgroundView *)self setCurrentEffect:v4];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke;
  v15[3] = &unk_1E6AAD700;
  BOOL v16 = v4 - 3 < 2;
  BOOL v17 = v3 == 0;
  BOOL v18 = v3 - 3 < 2;
  v15[4] = self;
  v15[5] = v19;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v15];
  if (v4 - 3 > 1)
  {
    if (UIAccessibilityIsReduceMotionEnabled() && !UIAccessibilityIsReduceTransparencyEnabled())
    {
      BOOL v9 = [(SBFolderControllerBackgroundView *)self _isCurrentlyExpanding];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_3;
      v13[3] = &unk_1E6AAD728;
      v13[4] = self;
      BOOL v14 = v9;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v13];
      double v10 = 0.0;
      if (v9) {
        double v10 = 1.0;
      }
      [(MTMaterialView *)self->_blurView setAlpha:v10];
    }
    else
    {
      if ([(SBFolderControllerBackgroundView *)self isEffectActive]) {
        double v8 = 1.0;
      }
      else {
        double v8 = 0.0;
      }
      if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_4;
        v12[3] = &unk_1E6AAC838;
        v12[4] = self;
        *(double *)&v12[5] = v8;
        [MEMORY[0x1E4FB1EB0] _animateUsingSpringInteractive:0 animations:v12 completion:0];
      }
      else
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_5;
        v11[3] = &unk_1E6AAC838;
        v11[4] = self;
        *(double *)&v11[5] = v8;
        [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v11];
      }
    }
  }
  else
  {
    uint64_t v5 = [(id)objc_opt_class() _tintColorForEffect:v4];
    [(UIView *)self->_tintView setBackgroundColor:v5];
    BOOL v6 = [(SBFolderControllerBackgroundView *)self isEffectActive];
    double v7 = 0.0;
    if (v6) {
      double v7 = 1.0;
    }
    [(UIView *)self->_tintView setAlpha:v7];
  }
  _Block_object_dispose(v19, 8);
}

- (unint64_t)concreteEffect
{
  unint64_t result = [(SBFolderControllerBackgroundView *)self effect];
  if (!result)
  {
    if ([(SBFolderControllerBackgroundView *)self isReduceTransparencyEnabled]) {
      return 4;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (BOOL)isReduceTransparencyEnabled
{
  return self->_reduceTransparencyEnabled;
}

- (unint64_t)effect
{
  return self->_effect;
}

- (void)setCurrentEffect:(unint64_t)a3
{
  self->_currentEffect = a3;
}

- (BOOL)isEffectActive
{
  return self->_effectActive;
}

- (unint64_t)currentEffect
{
  return self->_currentEffect;
}

double __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_2()
{
  return 0.35;
}

- (void)setTransitionCancelled:(BOOL)a3
{
  if (self->_transitionCancelled != a3)
  {
    self->_transitionCancelled = a3;
    [(SBFolderControllerBackgroundView *)self _updateCurrentEffect];
  }
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    [(SBFolderControllerBackgroundView *)self _updateCurrentEffect];
  }
}

- (void)setEffectActive:(BOOL)a3
{
  if (self->_effectActive != a3)
  {
    self->_effectActive = a3;
    [(SBFolderControllerBackgroundView *)self _updateCurrentEffect];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(SBFolderControllerBackgroundView *)self setNeedsLayout];
    uint64_t v5 = obj;
  }
}

- (SBFolderControllerBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBFolderControllerBackgroundView;
  unint64_t v3 = -[SBFolderControllerBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__reduceTransparencyEnabledStateChanged name:*MEMORY[0x1E4FB24A8] object:0];

    [(SBFolderControllerBackgroundView *)v3 _reduceTransparencyEnabledStateChanged];
  }
  return v3;
}

- (void)_reduceTransparencyEnabledStateChanged
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (IsReduceTransparencyEnabled != [(SBFolderControllerBackgroundView *)self isReduceTransparencyEnabled])
  {
    [(SBFolderControllerBackgroundView *)self setReduceTransparencyEnabled:IsReduceTransparencyEnabled];
    [(SBFolderControllerBackgroundView *)self _updateCurrentEffect];
  }
}

uint64_t __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setWeighting:*(double *)(a1 + 40)];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SBFolderControllerBackgroundView;
  [(SBFolderControllerBackgroundView *)&v18 layoutSubviews];
  [(SBFolderControllerBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SBFolderControllerBackgroundView *)self minimumHomeScreenScale];
  double v12 = v11;
  if (BSFloatGreaterThanFloat())
  {
    UIRectGetCenter();
    CGAffineTransformMakeScale(&v17, 1.0 / v12, 1.0 / v12);
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    CGRectApplyAffineTransform(v19, &v17);
    UIRectCenteredAboutPoint();
    double v4 = v13;
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
  }
  -[MTMaterialView setFrame:](self->_blurView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_tintView, "setFrame:", v4, v6, v8, v10);
  -[UIImageView setFrame:](self->_blurViewSnapshot, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_debugFreezingView, "setFrame:", v4, v6, v8, v10);
}

- (double)minimumHomeScreenScale
{
  double v3 = [(SBFolderControllerBackgroundView *)self delegate];
  double v4 = v3;
  if (v3)
  {
    [v3 minimumHomeScreenScaleForFolderControllerBackgroundView:self];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (SBFolderControllerBackgroundViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFolderControllerBackgroundViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugFreezingView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_blurViewSnapshot, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

+ (id)_tintColorForEffect:(unint64_t)a3
{
  if (a3 == 3)
  {
    double v3 = 0.6;
    goto LABEL_5;
  }
  if (a3 == 4)
  {
    double v3 = 0.8;
LABEL_5:
    double v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:v3];
    goto LABEL_7;
  }
  double v4 = 0;
LABEL_7:
  return v4;
}

- (void)setEffect:(unint64_t)a3
{
  if (self->_effect != a3)
  {
    self->_effect = a3;
    [(SBFolderControllerBackgroundView *)self _updateCurrentEffect];
  }
}

uint64_t __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 408);
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  double v4 = *(void **)(*(void *)(a1 + 32) + 408);
  return [v4 setWeighting:1.0];
}

uint64_t __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setWeighting:*(double *)(a1 + 40)];
}

- (void)setFrozen:(BOOL)a3
{
  if (self->_frozen != a3)
  {
    self->_frozen = a3;
    BOOL v4 = !a3;
    [(UIView *)self->_debugFreezingView setHidden:!a3];
    if (v4)
    {
      [(SBFolderControllerBackgroundView *)self addSubview:self->_blurView];
      [(UIImageView *)self->_blurViewSnapshot removeFromSuperview];
      blurViewSnapshot = self->_blurViewSnapshot;
      self->_blurViewSnapshot = 0;
    }
    else
    {
      double v5 = [MEMORY[0x1E4FB17E0] defaultFormat];
      [v5 setOpaque:1];
      id v6 = objc_alloc(MEMORY[0x1E4FB17D8]);
      [(MTMaterialView *)self->_blurView bounds];
      double v9 = objc_msgSend(v6, "initWithSize:format:", v5, v7, v8);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__SBFolderControllerBackgroundView_setFrozen___block_invoke;
      v14[3] = &unk_1E6AAD750;
      v14[4] = self;
      double v10 = [v9 imageWithActions:v14];
      double v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      double v12 = self->_blurViewSnapshot;
      self->_blurViewSnapshot = v11;

      [(UIImageView *)self->_blurViewSnapshot setImage:v10];
      [(SBFolderControllerBackgroundView *)self addSubview:self->_blurViewSnapshot];
      [(MTMaterialView *)self->_blurView removeFromSuperview];
    }
    [(SBFolderControllerBackgroundView *)self bringSubviewToFront:self->_debugFreezingView];
    [(SBFolderControllerBackgroundView *)self setNeedsLayout];
  }
}

uint64_t __46__SBFolderControllerBackgroundView_setFrozen___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 408);
  [v1 bounds];
  return objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

- (BOOL)_isCurrentlyExpanding
{
  BOOL v3 = [(SBFolderControllerBackgroundView *)self isExpanding];
  return v3 ^ [(SBFolderControllerBackgroundView *)self isTransitionCancelled];
}

- (BOOL)isTransitionCancelled
{
  return self->_transitionCancelled;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setReduceTransparencyEnabled:(BOOL)a3
{
  self->_reduceTransparencyEnabled = a3;
}

@end