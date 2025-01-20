@interface SBCenterAppIconZoomAnimator
- (CGPoint)cameraPosition;
- (NSMutableArray)animationCompletions;
- (SBCenterAppIconZoomAnimator)initWithFolderController:(id)a3 appView:(id)a4;
- (SBReversibleLayerPropertyAnimator)appZoomAnimator;
- (double)_appZPositionForZoomFraction:(double)a3;
- (double)_appZoomDelay;
- (double)_iconZoomDelay;
- (double)distantScale;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_cleanupAnimation;
- (void)_delayedForRotation;
- (void)_fadeAppForZoomFraction:(double)a3;
- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3;
- (void)_translateAppForZoomFraction:(double)a3;
- (void)_zoomAppForZoomFraction:(double)a3;
- (void)setAnimationCompletions:(id)a3;
- (void)setAppZoomAnimator:(id)a3;
- (void)setDistantScale:(double)a3;
@end

@implementation SBCenterAppIconZoomAnimator

- (SBCenterAppIconZoomAnimator)initWithFolderController:(id)a3 appView:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBCenterAppIconZoomAnimator;
  v7 = [(SBCenterIconZoomAnimator *)&v19 initWithFolderController:a3];
  v8 = v7;
  if (v7)
  {
    p_x = &v7->_destinationFrame.origin.x;
    [v6 frame];
    *(void *)p_x = v10;
    v8->_destinationFrame.origin.y = v11;
    v8->_destinationFrame.size.width = v12;
    v8->_destinationFrame.size.height = v13;
    v14 = -[SBZoomableView initWithFrame:]([SBZoomableView alloc], "initWithFrame:", *p_x, v8->_destinationFrame.origin.y, v8->_destinationFrame.size.width, v8->_destinationFrame.size.height);
    appView = v8->_appView;
    v8->_appView = &v14->super;

    BSRectWithSize();
    objc_msgSend(v6, "setFrame:");
    [(UIView *)v8->_appView addSubview:v6];
    v8->_distantScale = 0.01;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    animationCompletions = v8->_animationCompletions;
    v8->_animationCompletions = v16;

    if ([(SBIconAnimator *)v8 _isDelayedForRotation]) {
      [(SBCenterAppIconZoomAnimator *)v8 _delayedForRotation];
    }
  }

  return v8;
}

- (void)_delayedForRotation
{
  [(UIView *)self->_appView setHidden:1];
  id v4 = +[SBUIController sharedInstance];
  v3 = [v4 window];
  [v3 addSubview:self->_appView];
}

- (void)_prepareAnimation
{
  [(UIView *)self->_appView setHidden:0];
  v28.receiver = self;
  v28.super_class = (Class)SBCenterAppIconZoomAnimator;
  [(SBCenterIconZoomAnimator *)&v28 _prepareAnimation];
  v3 = [(SBCenterIconZoomAnimator *)self zoomView];
  id v4 = [(SBIconAnimator *)self referenceView];
  v5 = [(SBIconAnimator *)self settings];
  if ([v5 zoomViewBelowIcons])
  {
    appView = self->_appView;
    [v4 bounds];
    UIRectGetCenter();
    objc_msgSend(v3, "convertPoint:fromView:", v4);
    -[UIView setCenter:](appView, "setCenter:");
    [v3 insertSubview:self->_appView atIndex:0];
  }
  else
  {
    [v3 bounds];
    objc_msgSend(v4, "convertRect:fromView:", v3);
    CGFloat v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v7, v8, v9, v10);
    appZoomView = self->_appZoomView;
    self->_appZoomView = v11;

    CGFloat v13 = [(UIView *)self->_appZoomView layer];
    v14 = [v3 layer];
    v15 = v14;
    if (v14) {
      [v14 sublayerTransform];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    [v13 setSublayerTransform:v27];

    [(UIView *)self->_appZoomView frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [(UIView *)self->_appZoomView layer];
    v25 = [v3 layer];
    [v25 anchorPoint];
    objc_msgSend(v24, "setAnchorPoint:");

    -[UIView setFrame:](self->_appZoomView, "setFrame:", v17, v19, v21, v23);
    v26 = self->_appView;
    [v4 bounds];
    UIRectGetCenter();
    -[UIView setCenter:](v26, "setCenter:");
    [(UIView *)self->_appZoomView addSubview:self->_appView];
    [v4 addSubview:self->_appZoomView];
  }
}

- (void)_setAnimationFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBCenterAppIconZoomAnimator;
  -[SBCenterIconZoomAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  [(SBCenterAppIconZoomAnimator *)self _zoomAppForZoomFraction:a3];
  [(SBCenterAppIconZoomAnimator *)self _translateAppForZoomFraction:a3];
  [(SBCenterAppIconZoomAnimator *)self _fadeAppForZoomFraction:a3];
}

- (void)_cleanupAnimation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  appView = self->_appView;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v21[0] = *MEMORY[0x1E4F1DAB8];
  v21[1] = v4;
  v21[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)appView setTransform:v21];
  objc_super v5 = [(UIView *)self->_appView layer];
  [v5 setZPosition:0.0];

  [(UIView *)self->_appView removeFromSuperview];
  id v6 = self->_appView;
  self->_appView = 0;

  [(UIView *)self->_appZoomView removeFromSuperview];
  appZoomView = self->_appZoomView;
  self->_appZoomView = 0;

  double v8 = [(SBCenterAppIconZoomAnimator *)self animationCompletions];
  double v9 = (void *)[v8 copy];

  if ([v9 count])
  {
    double v10 = [(SBCenterAppIconZoomAnimator *)self animationCompletions];
    [v10 removeAllObjects];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v15++) + 16))();
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }
  }
  [(SBReversibleLayerPropertyAnimator *)self->_appZoomAnimator invalidate];
  [(SBCenterAppIconZoomAnimator *)self setAppZoomAnimator:0];
  v16.receiver = self;
  v16.super_class = (Class)SBCenterAppIconZoomAnimator;
  [(SBCenterIconZoomAnimator *)&v16 _cleanupAnimation];
}

- (unint64_t)_numberOfSignificantAnimations
{
  v3.receiver = self;
  v3.super_class = (Class)SBCenterAppIconZoomAnimator;
  return [(SBCenterIconZoomAnimator *)&v3 _numberOfSignificantAnimations] + 2;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a7;
  v64.receiver = self;
  v64.super_class = (Class)SBCenterAppIconZoomAnimator;
  [(SBCenterIconZoomAnimator *)&v64 _performAnimationToFraction:v12 withCentralAnimationSettings:v8 delay:v13 alreadyAnimating:a3 sharedCompletion:a5];
  [(SBCenterAppIconZoomAnimator *)self _appZoomDelay];
  double v15 = v14 + a5;
  objc_super v16 = [(SBIconAnimator *)self settings];
  uint64_t v17 = 4;
  if (!v8) {
    uint64_t v17 = 0;
  }
  uint64_t v54 = v17;
  if (v8) {
    double v15 = 0.0;
  }
  long long v18 = (id *)MEMORY[0x1E4F43630];
  if ([(id)*MEMORY[0x1E4F43630] isRunningTest])
  {
    long long v19 = @"AppOpenCenterZoom";
    int v20 = [*v18 isRunningTest:@"AppOpenCenterZoom"];
    id v21 = *v18;
    if (v20)
    {
      double v22 = @"workspaceActivate";
LABEL_10:
      [v21 finishedSubTest:v22 forTest:v19];
      goto LABEL_11;
    }
    long long v19 = @"AppCloseCenterZoom";
    if ([v21 isRunningTest:@"AppCloseCenterZoom"])
    {
      id v21 = *v18;
      double v22 = @"workspaceDeactivate";
      goto LABEL_10;
    }
  }
LABEL_11:
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
  v62[3] = &unk_1E6AF5AA0;
  v62[4] = self;
  id v51 = v13;
  id v63 = v51;
  uint64_t v23 = MEMORY[0x1D948C7A0](v62);
  v53 = v16;
  v24 = [v16 appZoomSettings];
  v25 = [v24 BSAnimationSettings];

  v26 = (void *)[v25 mutableCopy];
  [v26 delay];
  [v26 setDelay:v15 + v27];
  objc_super v28 = [(SBCenterAppIconZoomAnimator *)self animationCompletions];
  v55 = (void *)v23;
  v29 = (void *)MEMORY[0x1D948C7A0](v23);
  [v28 addObject:v29];

  ++self->_testCompletionCount;
  uint64_t v30 = [(SBCenterAppIconZoomAnimator *)self appZoomAnimator];
  v52 = v12;
  if (v30
    && (v31 = (void *)v30,
        [(SBCenterAppIconZoomAnimator *)self appZoomAnimator],
        v32 = objc_claimAutoreleasedReturnValue(),
        char v33 = [v32 hasReversed],
        v32,
        v31,
        (v33 & 1) == 0))
  {
    if (BSFloatIsOne())
    {
      v34 = [MEMORY[0x1E4F4F840] settingsWithMass:3.0 stiffness:1000.0 damping:500.0];
      v45 = [MEMORY[0x1E4FA6270] rootSettings];
      v46 = [v45 iconAnimationSettings];
      v47 = [v46 crossfadeAcceleratedSuspendSettings];
      v48 = [v47 centralAnimationSettings];
      v50 = [v48 BSAnimationSettings];

      v49 = [(SBCenterAppIconZoomAnimator *)self appZoomAnimator];
      [v49 reverseWithSettings:v34 directionChangeSettings:v50 headStart:0.0002];
    }
    else
    {
      v34 = [(SBCenterAppIconZoomAnimator *)self appZoomAnimator];
      [v34 reverse];
    }
  }
  else
  {
    [(SBCenterAppIconZoomAnimator *)self _appZPositionForZoomFraction:a3];
    v34 = [(UIView *)self->_appView layer];
    id v35 = objc_alloc(MEMORY[0x1E4FA6448]);
    [v34 zPosition];
    v36 = objc_msgSend(v35, "initWithLayer:keyPath:initialValue:targetValue:", v34, @"zPosition");
    [(SBCenterAppIconZoomAnimator *)self setAppZoomAnimator:v36];
    objc_initWeak(&location, self);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
    v58[3] = &unk_1E6AF7920;
    objc_copyWeak(&v60, &location);
    id v37 = v36;
    id v59 = v37;
    v38 = (void *)MEMORY[0x1D948C7A0](v58);
    [v37 animateWithSettings:v26 completion:v38];

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);
  }
  v39 = v53;

  v40 = [MEMORY[0x1E4F4F898] factoryWithSettings:v25];
  if (!v8 || BSFloatIsZero()) {
    objc_msgSend(v40, "setAllowsAdditiveAnimations:", 1, v50);
  }
  ++self->_testCompletionCount;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
  v57[3] = &unk_1E6AF4A70;
  v57[4] = self;
  *(double *)&v57[5] = a3;
  objc_msgSend(MEMORY[0x1E4F4F898], "animateWithFactory:additionalDelay:options:actions:completion:", v40, v54, v57, v55, v15, v50);
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    v41 = [v53 appFadeSettings];
    v42 = [v41 BSAnimationSettings];
    v43 = (void *)[v42 mutableCopy];

    if (v8) {
      [v43 setDelay:0.0];
    }
    v44 = [MEMORY[0x1E4F4F898] factoryWithSettings:v43];
    if (!v8 || BSFloatIsZero()) {
      [v44 setAllowsAdditiveAnimations:1];
    }
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_6;
    v56[3] = &unk_1E6AF4A70;
    v56[4] = self;
    *(double *)&v56[5] = a3;
    [MEMORY[0x1E4F4F898] animateWithFactory:v44 additionalDelay:v54 options:v56 actions:0 completion:v15];

    v39 = v53;
  }
}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  if (!--*(unsigned char *)(*(void *)(a1 + 32) + 280))
  {
    v2 = (id *)MEMORY[0x1E4F43630];
    if ([(id)*MEMORY[0x1E4F43630] isRunningTest])
    {
      objc_super v3 = @"AppOpenCenterZoom";
      int v4 = [*v2 isRunningTest:@"AppOpenCenterZoom"];
      id v5 = *v2;
      if (v4)
      {
        id v6 = @"AppOpenCenterZoomAnimation";
      }
      else
      {
        objc_super v3 = @"AppCloseCenterZoom";
        if (![v5 isRunningTest:@"AppCloseCenterZoom"]) {
          goto LABEL_8;
        }
        id v5 = *v2;
        id v6 = @"AppCloseCenterZoomAnimation";
      }
      [v5 finishedSubTest:v6 forTest:v3];
    }
  }
LABEL_8:
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

void __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = [WeakRetained appZoomAnimator];
  LODWORD(v1) = [v3 isEqual:*(void *)(v1 + 32)];

  if (v1)
  {
    [WeakRetained setAppZoomAnimator:0];
    int v4 = [WeakRetained animationCompletions];
    id v5 = (void *)[v4 copy];

    if ([v5 count])
    {
      id v6 = [WeakRetained animationCompletions];
      [v6 removeAllObjects];

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _translateAppForZoomFraction:*(double *)(a1 + 40)];
  uint64_t v1 = (id *)MEMORY[0x1E4F43630];
  uint64_t result = [(id)*MEMORY[0x1E4F43630] isRunningTest];
  if (result)
  {
    int v3 = [*v1 isRunningTest:@"AppOpenCenterZoom"];
    id v4 = *v1;
    if (v3)
    {
      id v5 = &__block_literal_global_349;
    }
    else
    {
      uint64_t result = [v4 isRunningTest:@"AppCloseCenterZoom"];
      if (!result) {
        return result;
      }
      id v4 = *v1;
      id v5 = &__block_literal_global_42_0;
    }
    return [v4 installCACommitCompletionBlock:v5];
  }
  return result;
}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenCenterZoomAnimation" forTest:@"AppOpenCenterZoom"];
}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_5()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseCenterZoomAnimation" forTest:@"AppCloseCenterZoom"];
}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fadeAppForZoomFraction:*(double *)(a1 + 40)];
}

- (double)_iconZoomDelay
{
  v2 = [(SBIconAnimator *)self settings];
  [v2 appHeadStart];
  double v4 = v3;

  return fmax(v4, 0.0);
}

- (CGPoint)cameraPosition
{
  double v3 = [(SBIconAnimator *)self referenceView];
  UIRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(SBCenterIconZoomAnimator *)self zoomView];
  objc_msgSend(v3, "convertPoint:toView:", v8, v5, v7);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (double)_appZoomDelay
{
  v2 = [(SBIconAnimator *)self settings];
  [v2 appHeadStart];
  double v4 = v3;

  double result = -v4;
  if (v4 >= 0.0) {
    return 0.0;
  }
  return result;
}

- (void)_zoomAppForZoomFraction:(double)a3
{
  [(SBCenterAppIconZoomAnimator *)self _appZPositionForZoomFraction:a3];
  double v5 = v4;
  id v6 = [(UIView *)self->_appView layer];
  [v6 setZPosition:v5];
}

- (double)_appZPositionForZoomFraction:(double)a3
{
  SBHZPositionForScale();
  return (1.0 - a3) * v4;
}

- (void)_translateAppForZoomFraction:(double)a3
{
  [(UIView *)self->_appView center];
  double v6 = v5;
  double v8 = v7;
  [(SBCenterAppIconZoomAnimator *)self cameraPosition];
  appView = self->_appView;
  CGAffineTransformMakeTranslation(&v12, (v9 - v6) * a3, (v10 - v8) * a3);
  [(UIView *)appView setTransform:&v12];
}

- (void)_fadeAppForZoomFraction:(double)a3
{
}

- (double)distantScale
{
  return self->_distantScale;
}

- (void)setDistantScale:(double)a3
{
  self->_distantScale = a3;
}

- (SBReversibleLayerPropertyAnimator)appZoomAnimator
{
  return self->_appZoomAnimator;
}

- (void)setAppZoomAnimator:(id)a3
{
}

- (NSMutableArray)animationCompletions
{
  return self->_animationCompletions;
}

- (void)setAnimationCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationCompletions, 0);
  objc_storeStrong((id *)&self->_appZoomAnimator, 0);
  objc_storeStrong((id *)&self->_appZoomView, 0);
  objc_storeStrong((id *)&self->_appView, 0);
}

@end