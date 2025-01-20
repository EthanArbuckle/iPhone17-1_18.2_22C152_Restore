@interface SBHPeopleWidgetPersonDetailFadeAnimator
- (BOOL)isAlreadyAnimating;
- (BSAnimationSettings)animationSettings;
- (SBHPeopleWidgetPersonDetailFadeAnimator)init;
- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4;
- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5;
- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)setAlreadyAnimating:(BOOL)a3;
@end

@implementation SBHPeopleWidgetPersonDetailFadeAnimator

- (SBHPeopleWidgetPersonDetailFadeAnimator)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBHPeopleWidgetPersonDetailFadeAnimator;
  v2 = [(SBHPeopleWidgetPersonDetailFadeAnimator *)&v10 init];
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
  v9[2] = __84__SBHPeopleWidgetPersonDetailFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v9[3] = &unk_1E6AADF50;
  id v10 = v6;
  v11 = self;
  int64_t v12 = a3;
  id v8 = v6;
  [v7 performWithoutAnimation:v9];
}

void __84__SBHPeopleWidgetPersonDetailFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) sourceView];
  v2 = [*(id *)(a1 + 32) containerView];
  v3 = [*(id *)(a1 + 32) backgroundView];
  [v2 insertSubview:v9 belowSubview:v3];

  [*(id *)(a1 + 32) sourceContentFrame];
  objc_msgSend(v9, "setFrame:");
  v4 = [*(id *)(a1 + 32) platterView];
  [*(id *)(a1 + 32) targetContentFrame];
  objc_msgSend(v4, "setFrame:");
  [v2 addSubview:v4];
  v5 = [*(id *)(a1 + 32) targetView];
  [v4 bounds];
  objc_msgSend(v5, "setFrame:");
  [v4 addSubview:v5];
  [*(id *)(a1 + 32) targetContentCornerRadius];
  objc_msgSend(v4, "_setContinuousCornerRadius:");
  v6 = [v9 layer];
  uint64_t v7 = [v9 traitCollection];
  [v7 displayScale];
  objc_msgSend(v6, "setRasterizationScale:");

  id v8 = [v9 layer];
  [v8 setShouldRasterize:1];

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
    if ([(SBHPeopleWidgetPersonDetailFadeAnimator *)self isAlreadyAnimating]) {
      uint64_t v12 = (2 * (a3 == 1)) | 4;
    }
    [(SBHPeopleWidgetPersonDetailFadeAnimator *)self setAlreadyAnimating:1];
    v13 = [v10 platterView];
    v14 = [v13 layer];
    [v14 setAllowsHitTesting:a3 == 1];

    v15 = [v10 backgroundView];
    v16 = [v15 layer];
    [v16 setAllowsHitTesting:a3 == 1];

    v17 = (void *)MEMORY[0x1E4F4F898];
    v18 = [(SBHPeopleWidgetPersonDetailFadeAnimator *)self animationSettings];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __84__SBHPeopleWidgetPersonDetailFadeAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v27[3] = &unk_1E6AADF50;
    v28[0] = v10;
    v28[1] = a3;
    v19 = (id *)v28;
    v27[4] = self;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __84__SBHPeopleWidgetPersonDetailFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
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
    v23[2] = __84__SBHPeopleWidgetPersonDetailFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
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

uint64_t __84__SBHPeopleWidgetPersonDetailFadeAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) context:*(void *)(a1 + 40)];
}

uint64_t __84__SBHPeopleWidgetPersonDetailFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __84__SBHPeopleWidgetPersonDetailFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) context:*(void *)(a1 + 40)];
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  v6 = [a4 userInfo];
  [(SBHPeopleWidgetPersonDetailFadeAnimator *)self setAlreadyAnimating:0];
  uint64_t v7 = [v6 sourceView];
  id v8 = [v7 layer];
  [v8 setShouldRasterize:0];

  id v9 = [v6 sourceView];
  [v9 removeFromSuperview];

  id v10 = [v6 platterView];
  int v11 = [v6 targetView];
  uint64_t v12 = v11;
  if (!a3)
  {
    [v11 removeFromSuperview];
    [v10 removeFromSuperview];
  }
  v13 = [v10 layer];
  [v13 setAllowsHitTesting:1];

  v14 = [v6 backgroundView];
  v15 = [v14 layer];
  [v15 setAllowsHitTesting:1];

  v16 = (void *)MEMORY[0x1E4FB1EB0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__SBHPeopleWidgetPersonDetailFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v18[3] = &unk_1E6AAC838;
  id v19 = v6;
  int64_t v20 = a3;
  id v17 = v6;
  [v16 performWithoutAnimation:v18];
}

void __83__SBHPeopleWidgetPersonDetailFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
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
  uint64_t v7 = [v10 platterView];
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