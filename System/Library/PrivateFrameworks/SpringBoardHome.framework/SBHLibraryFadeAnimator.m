@interface SBHLibraryFadeAnimator
- (BOOL)isAlreadyAnimating;
- (BSAnimationSettings)animationSettings;
- (SBHLibraryFadeAnimator)init;
- (void)_configureIndicatorViewsForEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)_configurePrimaryViewsForEndpoint:(int64_t)a3 finalizing:(BOOL)a4 withContext:(id)a5;
- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5;
- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)setAlreadyAnimating:(BOOL)a3;
@end

@implementation SBHLibraryFadeAnimator

- (SBHLibraryFadeAnimator)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryFadeAnimator;
  v2 = [(SBHLibraryFadeAnimator *)&v10 init];
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
  v9[2] = __67__SBHLibraryFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v9[3] = &unk_1E6AADF50;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performWithoutAnimation:v9];
}

uint64_t __67__SBHLibraryFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configurePrimaryViewsForEndpoint:*(void *)(a1 + 48) finalizing:0 withContext:*(void *)(a1 + 40)];
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = [v9 userInfo];
  int64_t v11 = [(SBHLibraryFadeAnimator *)self animationSettings];
  [v11 duration];
  double v13 = v12;
  if ([v9 wantsAnimation]) {
    double v14 = v13;
  }
  else {
    double v14 = 0.0;
  }
  [v10 noteWillAnimateToEndpoint:a3 withAnimationDuration:v14];
  int v15 = [v9 wantsAnimation];

  if (v15)
  {
    if ([(SBHLibraryFadeAnimator *)self isAlreadyAnimating]) {
      uint64_t v16 = (2 * (a3 == 1)) | 4;
    }
    else {
      uint64_t v16 = 2 * (a3 == 1);
    }
    [(SBHLibraryFadeAnimator *)self setAlreadyAnimating:1];
    v17 = (void *)MEMORY[0x1E4F4F898];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v37[3] = &unk_1E6AADF50;
    v37[4] = self;
    v38[1] = a3;
    id v18 = v10;
    v38[0] = v18;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
    v35[3] = &unk_1E6AADF78;
    v36 = v8;
    [v17 animateWithSettings:v11 options:v16 actions:v37 completion:v35];
    v19 = (id *)v38;
    double v20 = v13 / 3.0;
    uint64_t v21 = 0x10000;
    double v22 = v13 / 5.0;
    if (a3 == 1) {
      double v23 = 0.0;
    }
    else {
      double v23 = v13 / 3.0;
    }
    if (a3 == 1) {
      uint64_t v21 = 0x20000;
    }
    v24 = (void *)MEMORY[0x1E4FB1EB0];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
    v32[3] = &unk_1E6AADF50;
    id v33 = v18;
    int64_t v34 = a3;
    if (a3 == 1) {
      double v25 = v22;
    }
    else {
      double v25 = v20;
    }
    uint64_t v26 = v21 | v16;
    v32[4] = self;
    id v27 = v18;
    [v24 animateWithDuration:v26 delay:v32 options:0 animations:v25 completion:v23];
  }
  else
  {
    v28 = (void *)MEMORY[0x1E4FB1EB0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_4;
    v30[3] = &unk_1E6AADF50;
    v31[0] = v10;
    v31[1] = a3;
    v19 = (id *)v31;
    v30[4] = self;
    id v29 = v10;
    [v28 performWithoutAnimation:v30];
    if (v8) {
      v8[2](v8);
    }
  }
}

uint64_t __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configurePrimaryViewsForEndpoint:*(void *)(a1 + 48) finalizing:0 withContext:*(void *)(a1 + 40)];
}

uint64_t __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureIndicatorViewsForEndpoint:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40)];
}

uint64_t __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _configurePrimaryViewsForEndpoint:*(void *)(a1 + 48) finalizing:0 withContext:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  return [v4 _configureIndicatorViewsForEndpoint:v2 withContext:v3];
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  v6 = [a4 userInfo];
  [(SBHLibraryFadeAnimator *)self setAlreadyAnimating:0];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBHLibraryFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v9[3] = &unk_1E6AADF50;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performWithoutAnimation:v9];
}

uint64_t __66__SBHLibraryFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configurePrimaryViewsForEndpoint:*(void *)(a1 + 48) finalizing:1 withContext:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  return [v4 _configureIndicatorViewsForEndpoint:v2 withContext:v3];
}

- (void)_configurePrimaryViewsForEndpoint:(int64_t)a3 finalizing:(BOOL)a4 withContext:(id)a5
{
  BOOL v5 = a3 == 1 || a4;
  if (a3 == 1) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  if (v5) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  id v8 = a5;
  id v9 = [v8 libraryView];
  [v9 setAlpha:v7];

  id v10 = [v8 backgroundView];

  [v10 setWeighting:v6];
}

- (void)_configureIndicatorViewsForEndpoint:(int64_t)a3 withContext:(id)a4
{
  if (a3 == 1) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  if (a3 == 1) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  id v8 = [a4 libraryIconViewController];
  double v6 = [v8 categoryStackView];
  [v6 setAlpha:v5];

  double v7 = [v8 dismissalView];
  [v7 setAlpha:v4];
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