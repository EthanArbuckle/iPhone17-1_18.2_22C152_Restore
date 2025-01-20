@interface SBHStackConfigurationApertureAnimator
- (BOOL)_shouldUseCenterZoomTransitionForCoordinator:(id)a3;
- (BOOL)isAlreadyAnimating;
- (NSSet)innerWidgetBackgroundViews;
- (SBHStackConfigurationApertureAnimator)init;
- (SBHWidgetSettings)widgetSettings;
- (void)_configureApertureBackgroundViewsForEndpoint:(int64_t)a3 withCoordinator:(id)a4;
- (void)_configureForEndpoint:(int64_t)a3 scroll:(BOOL)a4 withCoordinator:(id)a5;
- (void)_configureInnerWidgetBackgroundViewsForEndpoint:(int64_t)a3 withCoordinator:(id)a4;
- (void)_configureWidgetStackMatchingBackgroundViewForEndpoint:(int64_t)a3 withCoordinator:(id)a4;
- (void)_removeMatchMoveAnimationFromTargetView:(id)a3;
- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4;
- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5;
- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)setAlreadyAnimating:(BOOL)a3;
- (void)setInnerWidgetBackgroundViews:(id)a3;
@end

@implementation SBHStackConfigurationApertureAnimator

- (SBHStackConfigurationApertureAnimator)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBHStackConfigurationApertureAnimator;
  v2 = [(SBHStackConfigurationApertureAnimator *)&v7 init];
  if (v2)
  {
    v3 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v4 = [v3 widgetSettings];
    widgetSettings = v2->_widgetSettings;
    v2->_widgetSettings = (SBHWidgetSettings *)v4;
  }
  return v2;
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  v6 = [a4 userInfo];
  objc_super v7 = [v6 sourceIconView];
  v8 = v7;
  if (!a3)
  {
    v9 = [v7 customIconImageViewController];
    v10 = [v9 view];

    [v10 setHidden:1];
  }
  v11 = (void *)MEMORY[0x1E4FB1EB0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__SBHStackConfigurationApertureAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v14[3] = &unk_1E6AAFF50;
  id v15 = v8;
  id v16 = v6;
  v17 = self;
  int64_t v18 = a3;
  BOOL v19 = a3 == 0;
  id v12 = v6;
  id v13 = v8;
  [v11 performWithoutAnimation:v14];
}

void __82__SBHStackConfigurationApertureAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) customIconImageViewController];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  objc_super v7 = [v6 backgroundView];

  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v19 = v10;

  v11 = [*(id *)(a1 + 40) widgetStackMatchingBackgroundView];
  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  id v15 = v14;

  if (v19)
  {
    if (v15)
    {
      uint64_t v16 = [v15 recipe];
      if (v16 != [v19 recipe])
      {
        objc_msgSend(v15, "setRecipe:", objc_msgSend(v19, "recipe"));
        [v15 layoutIfNeeded];
      }
    }
  }
  [*(id *)(a1 + 48) _configureForEndpoint:*(void *)(a1 + 56) scroll:*(unsigned __int8 *)(a1 + 64) withCoordinator:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _configureApertureBackgroundViewsForEndpoint:*(void *)(a1 + 56) withCoordinator:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _configureWidgetStackMatchingBackgroundViewForEndpoint:*(void *)(a1 + 56) withCoordinator:*(void *)(a1 + 40)];
  v17 = *(void **)(a1 + 48);
  int64_t v18 = [*(id *)(a1 + 40) widgetBackgroundViews];
  [v17 setInnerWidgetBackgroundViews:v18];

  [*(id *)(a1 + 48) _configureInnerWidgetBackgroundViewsForEndpoint:*(void *)(a1 + 56) withCoordinator:*(void *)(a1 + 40)];
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  uint64_t v8 = (void (**)(void))a5;
  id v9 = a4;
  v10 = [v9 userInfo];
  int v11 = [v9 wantsAnimation];

  if (v11)
  {
    if ([(SBHStackConfigurationApertureAnimator *)self isAlreadyAnimating]) {
      uint64_t v12 = (2 * (a3 == 1)) | 4;
    }
    else {
      uint64_t v12 = 2 * (a3 == 1);
    }
    [(SBHStackConfigurationApertureAnimator *)self setAlreadyAnimating:1];
    if (a3 == 1)
    {
      double v13 = 0.3;
    }
    else
    {
      v17 = [v10 sourceIconView];
      int64_t v18 = [v10 widgetContentContainerView];
      [(SBHStackConfigurationApertureAnimator *)self _setupMatchMoveAnimationWithSourceView:v17 targetView:v18];

      double v13 = 0.8;
    }
    id v19 = [(SBHStackConfigurationApertureAnimator *)self widgetSettings];
    [v19 stackConfigurationZoomTransitionDuration];
    double v21 = v20;

    v22 = (void *)MEMORY[0x1E4FB1EB0];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v35[3] = &unk_1E6AADF50;
    v35[4] = self;
    v36[1] = a3;
    id v15 = (id *)v36;
    id v23 = v10;
    v36[0] = v23;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
    v33[3] = &unk_1E6AADF78;
    v34 = v8;
    [v22 animateWithDuration:v12 delay:v35 usingSpringWithDamping:v33 initialSpringVelocity:v21 options:0.0 animations:1.0 completion:0.0];
    double v24 = v13 * v21;
    v25 = (void *)MEMORY[0x1E4FB1EB0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_4;
    v30[3] = &unk_1E6AADF50;
    if (a3 == 1) {
      double v26 = 0.0;
    }
    else {
      double v26 = v21 - v24;
    }
    id v31 = v23;
    int64_t v32 = a3;
    v30[4] = self;
    id v27 = v23;
    [v25 animateWithDuration:v12 delay:v30 usingSpringWithDamping:0 initialSpringVelocity:v24 options:v26 animations:1.0 completion:0.0];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4FB1EB0];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_6;
    v28[3] = &unk_1E6AADF50;
    v29[0] = v10;
    v29[1] = a3;
    id v15 = (id *)v29;
    v28[4] = self;
    id v16 = v10;
    [v14 performWithoutAnimation:v28];
    if (v8) {
      v8[2](v8);
    }
  }
}

void __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v14.minimum;
  float maximum = v14.maximum;
  float preferred = v14.preferred;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
  v11[3] = &unk_1E6AADF50;
  objc_super v7 = (void *)a1[5];
  uint64_t v6 = a1[6];
  v11[4] = a1[4];
  uint64_t v13 = v6;
  id v12 = v7;
  *(float *)&double v8 = minimum;
  *(float *)&double v9 = maximum;
  *(float *)&double v10 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114134, v11, v8, v9, v10);
}

uint64_t __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) scroll:1 withCoordinator:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureWidgetStackMatchingBackgroundViewForEndpoint:*(void *)(a1 + 48) withCoordinator:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 32);
  return [v4 _configureInnerWidgetBackgroundViewsForEndpoint:v2 withCoordinator:v3];
}

uint64_t __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_4(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v14.minimum;
  float maximum = v14.maximum;
  float preferred = v14.preferred;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_5;
  v11[3] = &unk_1E6AADF50;
  objc_super v7 = (void *)a1[5];
  uint64_t v6 = a1[6];
  v11[4] = a1[4];
  uint64_t v13 = v6;
  id v12 = v7;
  *(float *)&double v8 = minimum;
  *(float *)&double v9 = maximum;
  *(float *)&double v10 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114134, v11, v8, v9, v10);
}

uint64_t __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureApertureBackgroundViewsForEndpoint:*(void *)(a1 + 48) withCoordinator:*(void *)(a1 + 40)];
}

uint64_t __82__SBHStackConfigurationApertureAnimator_animateToEndpoint_withContext_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) scroll:1 withCoordinator:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureApertureBackgroundViewsForEndpoint:*(void *)(a1 + 48) withCoordinator:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureWidgetStackMatchingBackgroundViewForEndpoint:*(void *)(a1 + 48) withCoordinator:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 32);
  return [v4 _configureInnerWidgetBackgroundViewsForEndpoint:v2 withCoordinator:v3];
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  uint64_t v6 = [a4 userInfo];
  [(SBHStackConfigurationApertureAnimator *)self setAlreadyAnimating:0];
  objc_super v7 = [v6 sourceIconView];
  double v8 = v7;
  if (!a3)
  {
    double v9 = [v7 customIconImageViewController];
    double v10 = [v9 view];

    [v10 setHidden:0];
    [v10 setAlpha:1.0];
  }
  int v11 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__SBHStackConfigurationApertureAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v13[3] = &unk_1E6AADF50;
  id v14 = v6;
  int64_t v15 = a3;
  v13[4] = self;
  id v12 = v6;
  [v11 performWithoutAnimation:v13];
  [(SBHStackConfigurationApertureAnimator *)self setInnerWidgetBackgroundViews:0];
}

uint64_t __81__SBHStackConfigurationApertureAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) scroll:0 withCoordinator:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureApertureBackgroundViewsForEndpoint:*(void *)(a1 + 48) withCoordinator:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureWidgetStackMatchingBackgroundViewForEndpoint:*(void *)(a1 + 48) withCoordinator:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 32);
  return [v4 _configureInnerWidgetBackgroundViewsForEndpoint:v2 withCoordinator:v3];
}

- (void)_configureForEndpoint:(int64_t)a3 scroll:(BOOL)a4 withCoordinator:(id)a5
{
  BOOL v5 = a4;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = v8;
  if (a3 == 1) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  int v11 = [v8 sourceIconView];
  id v12 = [v9 materialViews];
  uint64_t v13 = [v9 fadingViews];
  BOOL v14 = [(SBHStackConfigurationApertureAnimator *)self _shouldUseCenterZoomTransitionForCoordinator:v9];
  int64_t v15 = [v9 widgetContentContainerView];
  [v15 layer];
  v70 = v69 = v11;
  id v16 = [v11 customIconImageViewController];
  uint64_t v17 = objc_opt_class();
  id v18 = v16;
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }
  id v20 = v19;

  id v68 = v20;
  if (a3 == 1)
  {
    CGFloat v21 = 1.0;
    CGFloat v22 = 0.0;
    CGFloat v23 = 0.0;
    CGFloat v24 = 0.0;
    CGFloat v25 = 0.0;
    double v26 = 1.0;
    uint64_t v27 = 0;
    double v28 = 0.0;
    uint64_t v29 = 1;
    if (v14) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  v30 = [v20 backgroundView];
  id v31 = v30;
  v67 = v12;
  if (v30)
  {
    id v32 = v30;
  }
  else
  {
    id v32 = [v20 view];
  }
  v33 = v32;

  v34 = [v33 layer];
  [v34 bounds];
  objc_msgSend(v34, "convertRect:toLayer:", v70);
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  CGFloat v22 = v39;
  CGFloat v23 = v40;
  v41 = [v20 pageControl];
  v42 = [v41 layer];
  [v42 bounds];
  objc_msgSend(v42, "convertRect:toLayer:", v70);
  double MidX = CGRectGetMidX(v86);
  uint64_t v44 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  uint64_t v45 = v36;
  uint64_t v46 = v38;
  CGFloat v47 = v22;
  CGFloat v48 = v23;
  if (v44 == 1) {
    double MinX = CGRectGetMinX(*(CGRect *)&v45);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v45);
  }
  double v50 = MinX;
  memset(&v80, 0, sizeof(v80));
  if (v41) {
    [v41 transform];
  }
  double v28 = vabdd_f64(MidX, v50);
  UIRectGetCenter();
  CGFloat v24 = v51;
  CGFloat v25 = v52;
  double v26 = sqrt(v80.a * v80.a + v80.c * v80.c);
  [v41 alpha];
  uint64_t v27 = v53;

  CGFloat v21 = 1.0;
  uint64_t v29 = 2;
  id v12 = v67;
  if (!v14)
  {
LABEL_21:
    v80.a = v21;
    v80.b = v22;
    v80.c = v23;
    v80.d = v24;
    v80.tx = v25;
    v80.ty = v26;
    uint64_t v81 = v27;
    double v82 = v28;
    [v9 configureWithStackLayoutMetrics:&v80];
    if (v5) {
      [v9 setScrollPosition:v29];
    }
  }
LABEL_23:
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v54 = v12;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v77 != v57) {
          objc_enumerationMutation(v54);
        }
        [*(id *)(*((void *)&v76 + 1) + 8 * i) setWeighting:v10];
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v76 objects:v84 count:16];
    }
    while (v56);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v59 = v13;
  uint64_t v60 = [v59 countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v61; ++j)
      {
        if (*(void *)v73 != v62) {
          objc_enumerationMutation(v59);
        }
        [*(id *)(*((void *)&v72 + 1) + 8 * j) setAlpha:v10];
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v72 objects:v83 count:16];
    }
    while (v61);
  }

  if (v14)
  {
    memset(&v80, 0, sizeof(v80));
    v64 = v68;
    if (a3 == 1)
    {
      long long v65 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v80.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v80.c = v65;
      *(_OWORD *)&v80.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    else
    {
      CGAffineTransformMakeScale(&v80, 0.01, 0.01);
    }
    CGAffineTransform v71 = v80;
    [v15 setTransform:&v71];
    [v15 setAlpha:v10];
  }
  else
  {
    v66 = [v9 configurationView];
    [v66 layoutIfNeeded];

    v64 = v68;
  }
}

- (void)_configureApertureBackgroundViewsForEndpoint:(int64_t)a3 withCoordinator:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![(SBHStackConfigurationApertureAnimator *)self _shouldUseCenterZoomTransitionForCoordinator:v6])
  {
    if (a3 == 1) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    id v8 = [v6 apertureBackgroundViews];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) setAlpha:v7];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)_configureWidgetStackMatchingBackgroundViewForEndpoint:(int64_t)a3 withCoordinator:(id)a4
{
  id v8 = a4;
  if (!-[SBHStackConfigurationApertureAnimator _shouldUseCenterZoomTransitionForCoordinator:](self, "_shouldUseCenterZoomTransitionForCoordinator:"))
  {
    if (a3 == 1) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
    double v7 = [v8 widgetStackMatchingBackgroundView];
    [v7 setAlpha:v6];
  }
}

- (void)_configureInnerWidgetBackgroundViewsForEndpoint:(int64_t)a3 withCoordinator:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![(SBHStackConfigurationApertureAnimator *)self _shouldUseCenterZoomTransitionForCoordinator:v6])
  {
    if (a3 == 1)
    {
      double v7 = [MEMORY[0x1E4FB1618] clearColor];
    }
    else
    {
      id v8 = [v6 sourceIconView];
      uint64_t v9 = [v8 customIconImageViewController];
      uint64_t v10 = objc_opt_class();
      id v11 = v9;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }
      }
      else
      {
        id v12 = 0;
      }
      id v13 = v12;

      double v7 = [v13 backgroundTintingColor];
    }
    long long v14 = [(SBHStackConfigurationApertureAnimator *)self innerWidgetBackgroundViews];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      if (a3 == 1) {
        double v18 = 1.0;
      }
      else {
        double v18 = 0.0;
      }
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          id v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = v20;
            CGFloat v22 = [v21 underlyingBackgroundView];
            [v22 setBackgroundColor:v7];

            CGFloat v23 = [v21 widgetBackgroundView];

            [v23 setAlpha:v18];
          }
          ++v19;
        }
        while (v16 != v19);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }
  }
}

- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F39C00];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 animation];
  uint64_t v9 = [v7 layer];
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

  double v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v11 * 0.5 - v15, v13 * 0.5 - v17);
  v21[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v8 setSourcePoints:v19];

  id v20 = [v6 layer];

  [v20 addAnimation:v8 forKey:@"SBHStackConfigurationIconMatchMoveKey"];
}

- (void)_removeMatchMoveAnimationFromTargetView:(id)a3
{
  id v3 = [a3 layer];
  [v3 removeAnimationForKey:@"SBHStackConfigurationIconMatchMoveKey"];
}

- (BOOL)_shouldUseCenterZoomTransitionForCoordinator:(id)a3
{
  id v3 = [a3 sourceIconView];
  id v4 = [v3 icon];
  BOOL v5 = [v4 iconDataSourceCount] == 0;

  return v5;
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (BOOL)isAlreadyAnimating
{
  return self->_alreadyAnimating;
}

- (void)setAlreadyAnimating:(BOOL)a3
{
  self->_alreadyAnimating = a3;
}

- (NSSet)innerWidgetBackgroundViews
{
  return self->_innerWidgetBackgroundViews;
}

- (void)setInnerWidgetBackgroundViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerWidgetBackgroundViews, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
}

@end