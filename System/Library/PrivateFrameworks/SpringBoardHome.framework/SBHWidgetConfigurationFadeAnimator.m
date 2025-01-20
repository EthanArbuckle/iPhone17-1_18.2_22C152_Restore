@interface SBHWidgetConfigurationFadeAnimator
- (BOOL)isAlreadyAnimating;
- (BSAnimationSettings)animationSettings;
- (SBHWidgetConfigurationFadeAnimator)init;
- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4;
- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5;
- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)setAlreadyAnimating:(BOOL)a3;
@end

@implementation SBHWidgetConfigurationFadeAnimator

- (SBHWidgetConfigurationFadeAnimator)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBHWidgetConfigurationFadeAnimator;
  v2 = [(SBHWidgetConfigurationFadeAnimator *)&v10 init];
  if (v2)
  {
    v3 = +[SBHHomeScreenDomain rootSettings];
    v4 = [v3 iconAnimationSettings];

    v5 = [v4 reducedMotionSettings];
    v6 = [v5 centralAnimationSettings];

    uint64_t v7 = [v6 BSAnimationSettings];
    animationSettings = v2->_animationSettings;
    v2->_animationSettings = (BSAnimationSettings *)v7;
  }
  return v2;
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  v6 = [a4 userInfo];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__SBHWidgetConfigurationFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v9[3] = &unk_1E6AADF50;
  id v10 = v6;
  v11 = self;
  int64_t v12 = a3;
  id v8 = v6;
  [v7 performWithoutAnimation:v9];
}

void __79__SBHWidgetConfigurationFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) sourceView];
  v2 = [*(id *)(a1 + 32) backgroundView];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) backgroundTintView];
  }
  v5 = v4;

  v6 = [*(id *)(a1 + 32) containerView];
  [v6 insertSubview:v8 belowSubview:v5];

  [*(id *)(a1 + 32) sourceContentFrame];
  UIRectGetCenter();
  objc_msgSend(v8, "setCenter:");
  uint64_t v7 = [*(id *)(a1 + 32) referenceView];
  [v7 setAlpha:0.0];

  [*(id *)(a1 + 40) _configureForEndpoint:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = [v9 userInfo];
  int v11 = [v9 wantsAnimation];

  if (v11)
  {
    uint64_t v12 = 2 * (a3 == 1);
    if ([(SBHWidgetConfigurationFadeAnimator *)self isAlreadyAnimating]) {
      uint64_t v12 = (2 * (a3 == 1)) | 4;
    }
    [(SBHWidgetConfigurationFadeAnimator *)self setAlreadyAnimating:1];
    v13 = [v10 targetView];
    v14 = [v13 layer];
    [v14 setAllowsHitTesting:a3 == 1];

    v15 = [v10 backgroundView];
    v16 = [v15 layer];
    [v16 setAllowsHitTesting:a3 == 1];

    v17 = (void *)MEMORY[0x1E4F4F898];
    v18 = [(SBHWidgetConfigurationFadeAnimator *)self animationSettings];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v27[3] = &unk_1E6AADF50;
    v28[0] = v10;
    v28[1] = a3;
    v19 = (id *)v28;
    v27[4] = self;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
    v25[3] = &unk_1E6AADF78;
    v26 = v8;
    id v20 = v10;
    [v17 animateWithSettings:v18 options:v12 actions:v27 completion:v25];
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4FB1EB0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
    v23[3] = &unk_1E6AADF50;
    v24[0] = v10;
    v24[1] = a3;
    v19 = (id *)v24;
    v23[4] = self;
    id v22 = v10;
    [v21 performWithoutAnimation:v23];
    if (v8) {
      v8[2](v8);
    }
  }
}

uint64_t __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) context:*(void *)(a1 + 40)];
}

uint64_t __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) context:*(void *)(a1 + 40)];
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  v6 = [a4 userInfo];
  [(SBHWidgetConfigurationFadeAnimator *)self setAlreadyAnimating:0];
  uint64_t v7 = [v6 sourceView];
  [v7 removeFromSuperview];

  id v8 = [v6 targetView];
  id v9 = [v8 layer];
  [v9 setAllowsHitTesting:1];

  id v10 = [v6 backgroundView];
  int v11 = [v10 layer];
  [v11 setAllowsHitTesting:1];

  uint64_t v12 = (void *)MEMORY[0x1E4FB1EB0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__SBHWidgetConfigurationFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v14[3] = &unk_1E6AAC838;
  id v15 = v6;
  int64_t v16 = a3;
  id v13 = v6;
  [v12 performWithoutAnimation:v14];
}

void __78__SBHWidgetConfigurationFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) referenceView];
  id v4 = v2;
  double v3 = 1.0;
  if (*(void *)(a1 + 40) == 1) {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
}

- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4
{
  id v10 = a4;
  if (a3) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  if (!UIAccessibilityIsReduceTransparencyEnabled())
  {
    v6 = [v10 sourceView];
    [v6 setAlpha:1.0 - v5];
  }
  uint64_t v7 = [v10 targetView];
  [v7 setAlpha:v5];

  id v8 = [v10 backgroundView];
  [v8 setWeighting:v5];

  id v9 = [v10 backgroundTintView];
  [v9 setAlpha:v5];
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (BOOL)isAlreadyAnimating
{
  return self->_alreadyAnimating;
}

- (void)setAlreadyAnimating:(BOOL)a3
{
  self->_alreadyAnimating = a3;
}

- (void).cxx_destruct
{
}

@end