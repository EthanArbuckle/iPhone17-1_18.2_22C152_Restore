@interface SBHStackConfigurationFadeAnimator
- (BOOL)isAlreadyAnimating;
- (BSAnimationSettings)animationSettings;
- (SBHStackConfigurationFadeAnimator)init;
- (UIView)sourceSnapshotView;
- (void)_configureForEndpoint:(int64_t)a3 withCoordinator:(id)a4;
- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4;
- (void)_updateSourceSnapshotViewUsingSourceIconView:(BOOL)a3 withCoordinator:(id)a4;
- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5;
- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)setAlreadyAnimating:(BOOL)a3;
- (void)setSourceSnapshotView:(id)a3;
@end

@implementation SBHStackConfigurationFadeAnimator

- (SBHStackConfigurationFadeAnimator)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBHStackConfigurationFadeAnimator;
  v2 = [(SBHStackConfigurationFadeAnimator *)&v10 init];
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
  uint64_t v7 = [v6 widgetStackMatchingBackgroundView];
  [v7 setHidden:1];
  v8 = (void *)MEMORY[0x1E4FB1EB0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__SBHStackConfigurationFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v10[3] = &unk_1E6AADF50;
  id v11 = v6;
  int64_t v12 = a3;
  v10[4] = self;
  id v9 = v6;
  [v8 performWithoutAnimation:v10];
}

uint64_t __78__SBHStackConfigurationFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (!v2)
  {
    [*(id *)(a1 + 32) _updateSourceSnapshotViewUsingSourceIconView:1 withCoordinator:*(void *)(a1 + 40)];
    uint64_t v2 = *(void *)(a1 + 48);
  }
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _configureForEndpoint:v2 withCoordinator:v4];
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  v8 = (void (**)(void))a5;
  id v9 = a4;
  objc_super v10 = [v9 userInfo];
  int v11 = [v9 wantsAnimation];

  if (v11)
  {
    if ([(SBHStackConfigurationFadeAnimator *)self isAlreadyAnimating]) {
      uint64_t v12 = (2 * (a3 == 1)) | 4;
    }
    else {
      uint64_t v12 = 2 * (a3 == 1);
    }
    [(SBHStackConfigurationFadeAnimator *)self setAlreadyAnimating:1];
    if (a3 != 1)
    {
      v13 = (void *)MEMORY[0x1E4FB1EB0];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke;
      v26[3] = &unk_1E6AACA90;
      v26[4] = self;
      id v27 = v10;
      [v13 performWithoutAnimation:v26];
    }
    v14 = (void *)MEMORY[0x1E4F4F898];
    v15 = [(SBHStackConfigurationFadeAnimator *)self animationSettings];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
    v24[3] = &unk_1E6AADF50;
    v25[0] = v10;
    v25[1] = a3;
    v16 = (id *)v25;
    v24[4] = self;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
    v22[3] = &unk_1E6AADF78;
    v23 = v8;
    id v17 = v10;
    [v14 animateWithSettings:v15 options:v12 actions:v24 completion:v22];
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4FB1EB0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_4;
    v20[3] = &unk_1E6AADF50;
    v21[0] = v10;
    v21[1] = a3;
    v16 = (id *)v21;
    v20[4] = self;
    id v19 = v10;
    [v18 performWithoutAnimation:v20];
    if (v8) {
      v8[2](v8);
    }
  }
}

void __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSourceSnapshotViewUsingSourceIconView:0 withCoordinator:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) sourceSnapshotView];
  if (v4)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    v3 = [*(id *)(a1 + 40) sourceIconView];
    [v2 _setupMatchMoveAnimationWithSourceView:v3 targetView:v4];
  }
}

uint64_t __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) withCoordinator:*(void *)(a1 + 40)];
}

uint64_t __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) withCoordinator:*(void *)(a1 + 40)];
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  v6 = [a4 userInfo];
  [(SBHStackConfigurationFadeAnimator *)self setAlreadyAnimating:0];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SBHStackConfigurationFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v9[3] = &unk_1E6AADF50;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performWithoutAnimation:v9];
}

uint64_t __77__SBHStackConfigurationFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) withCoordinator:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) sourceSnapshotView];
  [v2 removeFromSuperview];

  v3 = *(void **)(a1 + 32);
  return [v3 setSourceSnapshotView:0];
}

- (void)_configureForEndpoint:(int64_t)a3 withCoordinator:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 == 1) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  id v9 = [v6 fadingViews];
  id v10 = [v7 widgetContentContainerView];
  int64_t v11 = [v9 setByAddingObject:v10];

  uint64_t v12 = [v7 materialViews];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) setWeighting:v8];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v14);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v11;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "setAlpha:", v8, (void)v27);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  if (a3 == 1) {
    double v22 = 0.0;
  }
  else {
    double v22 = 1.0;
  }
  v23 = objc_msgSend(v7, "sourceIconView", (void)v27);
  v24 = [v23 customIconImageViewController];
  v25 = [v24 view];

  [v25 setAlpha:v22];
  v26 = [(SBHStackConfigurationFadeAnimator *)self sourceSnapshotView];
  [v26 setAlpha:v22];
}

- (void)_updateSourceSnapshotViewUsingSourceIconView:(BOOL)a3 withCoordinator:(id)a4
{
  BOOL v4 = a3;
  id v27 = a4;
  id v6 = [(SBHStackConfigurationFadeAnimator *)self sourceSnapshotView];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 removeFromSuperview];
    double v8 = [v7 layer];
    id v9 = [v8 presentationLayer];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v7 layer];
    }
    uint64_t v13 = v11;

    [v13 opacity];
    double v12 = v14;
  }
  else
  {
    double v12 = 0.0;
  }
  uint64_t v15 = [v27 sourceIconView];
  v16 = v15;
  if (v4) {
    [v15 iconImageSnapshotView];
  }
  else {
  id v17 = [v27 visiblyActiveDataSourceSnapshotView];
  }
  [(SBHStackConfigurationFadeAnimator *)self setSourceSnapshotView:v17];
  if (v17)
  {
    uint64_t v18 = [v27 configurationView];
    [v16 iconImageFrame];
    objc_msgSend(v16, "convertRect:toView:", v18);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    [v18 insertSubview:v17 atIndex:0];
    objc_msgSend(v17, "setFrame:", v20, v22, v24, v26);
    [v17 setAlpha:v12];
  }
}

- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F39C00];
  id v6 = a4;
  id v7 = a3;
  double v8 = [v5 animation];
  id v9 = [v7 layer];
  [v8 setSourceLayer:v9];

  [v8 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v8 setRemovedOnCompletion:0];
  [v8 setDuration:INFINITY];
  [v8 setAppliesY:1];
  [v8 setAppliesX:1];
  [v6 bounds];
  double v11 = v10;
  double v13 = v12;
  [v7 bounds];
  objc_msgSend(v7, "convertRect:toView:", v6);
  double v15 = v14;
  double v17 = v16;

  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v11 * 0.5 - v15, v13 * 0.5 - v17);
  v21[0] = v18;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v8 setSourcePoints:v19];

  double v20 = [v6 layer];

  [v20 addAnimation:v8 forKey:0];
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

- (UIView)sourceSnapshotView
{
  return self->_sourceSnapshotView;
}

- (void)setSourceSnapshotView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSnapshotView, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end