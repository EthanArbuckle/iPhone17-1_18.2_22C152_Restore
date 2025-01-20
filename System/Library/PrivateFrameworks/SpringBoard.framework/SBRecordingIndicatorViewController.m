@interface SBRecordingIndicatorViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_secureRenderingSupported;
- (BOOL)_shouldForceViewToShowForBacklightLuminance:(uint64_t)a1;
- (BOOL)_shouldForceViewToShowForCurrentBacklightLuminance;
- (BOOL)_usesSpringAnimationsWithContainerView;
- (SBRecordingIndicatorView)indicatorView;
- (SBRecordingIndicatorViewControllerDelegate)delegate;
- (SBWindowScene)windowScene;
- (UIColor)indicatorColor;
- (UIView)indicatorContainerView;
- (double)_alphaForStateIdleOn;
- (double)_sizeForStateIdleOn;
- (id)_hasMedinaPadBehaviors;
- (id)_interchangesViewAndLayer;
- (id)_screen;
- (id)_springAnimationForKeyPath:(void *)a3 fromValue:(void *)a4 toValue:(double)a5 duration:;
- (id)_usesSpringAnimations;
- (id)initForLocation:(unint64_t)a3 windowScene:(id)a4;
- (int64_t)activeInterfaceOrientation;
- (uint64_t)_configureRootLayer;
- (uint64_t)_hasProminentIdleState;
- (uint64_t)_ignoresActiveInterfaceOrientation;
- (uint64_t)_isOnExtendedDesktop;
- (uint64_t)_isSuppressingFlipbookRendering;
- (uint64_t)_screenTypeForcesFastFadeAnimations;
- (uint64_t)_stopAllAnimations;
- (uint64_t)_updateCenterWithoutAnimationForOrientation:(uint64_t)result;
- (uint64_t)_updateIndicatorLayerSize:(double)a3 opacity:;
- (uint64_t)_updateIndicatorLayerWithBounds:(double)a3 andCenter:(double)a4;
- (unint64_t)indicatorState;
- (unint64_t)location;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addBlurFilterToLayer:(double)a3 withBlurRadius:;
- (void)_animateLayer:(void *)a3 forKeyPath:(void *)a4 fromValue:(void *)a5 toValue:(int)a6 persistingToValue:(double)a7 duration:;
- (void)_updateIndicatorForBacklightLuminance:(uint64_t)a3 previousBacklightLuminance:;
- (void)_updateIndicatorViewSize:(double)a3 alpha:;
- (void)_updateIndicatorVisibilityWithSpringAnimation:(id *)a1;
- (void)_updateLiveRenderingAssertionIfNeededForIndicatorVisible:(uint64_t)a1;
- (void)_updateToOrientation:(double)a3 withDuration:;
- (void)calculateInitialIndicatorPositionAndSize;
- (void)dealloc;
- (void)setActiveInterfaceOrientation:(int64_t)a3 withDuration:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setIndicatorColor:(id)a3;
- (void)setIndicatorState:(void *)a1;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateIndicatorType:(unint64_t)a3;
- (void)updateIndicatorVisibility:(BOOL)a3;
- (void)updateIndicatorVisibilityWithFastFadeAnimation:(BOOL)a3;
@end

@implementation SBRecordingIndicatorViewController

- (unint64_t)indicatorState
{
  return self->_indicatorState;
}

- (void)updateIndicatorVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  -[SBRecordingIndicatorViewController _updateLiveRenderingAssertionIfNeededForIndicatorVisible:]((uint64_t)self, a3);
  if (-[SBRecordingIndicatorViewController _usesSpringAnimations]((id *)&self->super.super.super.isa))
  {
    -[SBRecordingIndicatorViewController _updateIndicatorVisibilityWithSpringAnimation:]((id *)&self->super.super.super.isa, v3);
  }
  else if (-[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations]((uint64_t)self))
  {
    [(SBRecordingIndicatorViewController *)self updateIndicatorVisibilityWithFastFadeAnimation:v3];
  }
  else
  {
    v5 = SBLogStatusBarish();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        v6 = @"on";
      }
      else {
        v6 = @"off";
      }
      unint64_t v7 = [(SBRecordingIndicatorViewController *)self location];
      v8 = @"Standalone";
      if (v7 == 1) {
        v8 = @"StatusBar";
      }
      if (v7 == 2) {
        v8 = @"SystemAperture";
      }
      v9 = v8;
      *(_DWORD *)buf = 138543618;
      v42 = v6;
      __int16 v43 = 2114;
      v44 = v9;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (normal animation)", buf, 0x16u);
    }
    -[SBRecordingIndicatorViewController _stopAllAnimations]((uint64_t)self);
    if (v3)
    {
      objc_initWeak((id *)buf, self);
      id v10 = objc_alloc(MEMORY[0x1E4F43008]);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke;
      v40[3] = &unk_1E6AF4AC0;
      v40[4] = self;
      v11 = (UIViewPropertyAnimator *)[v10 initWithDuration:0 curve:v40 animations:0.7];
      animatorScaleToOverscale = self->_animatorScaleToOverscale;
      self->_animatorScaleToOverscale = v11;

      id v13 = objc_alloc(MEMORY[0x1E4F43008]);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_2;
      v39[3] = &unk_1E6AF4AC0;
      v39[4] = self;
      v14 = (UIViewPropertyAnimator *)[v13 initWithDuration:0 curve:v39 animations:0.7];
      animatorScaleToNormal = self->_animatorScaleToNormal;
      self->_animatorScaleToNormal = v14;

      id v16 = objc_alloc(MEMORY[0x1E4F43008]);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_3;
      v38[3] = &unk_1E6AF4AC0;
      v38[4] = self;
      v17 = (UIViewPropertyAnimator *)[v16 initWithDuration:0 curve:v38 animations:2.0];
      animatorScaleToRest = self->_animatorScaleToRest;
      self->_animatorScaleToRest = v17;

      v19 = self->_animatorScaleToOverscale;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_4;
      v36[3] = &unk_1E6B06D20;
      objc_copyWeak(&v37, (id *)buf);
      [(UIViewPropertyAnimator *)v19 addCompletion:v36];
      v20 = self->_animatorScaleToNormal;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_5;
      v34[3] = &unk_1E6B06D20;
      objc_copyWeak(&v35, (id *)buf);
      [(UIViewPropertyAnimator *)v20 addCompletion:v34];
      v21 = self->_animatorScaleToRest;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_6;
      v32[3] = &unk_1E6B06D20;
      objc_copyWeak(&v33, (id *)buf);
      [(UIViewPropertyAnimator *)v21 addCompletion:v32];
      -[SBRecordingIndicatorViewController setIndicatorState:](self, 1);
      [(UIViewPropertyAnimator *)self->_animatorScaleToOverscale startAnimation];
      objc_destroyWeak(&v33);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(CASecureIndicatorLayer *)self->_contentLayer opacity];
      if ((BSFloatIsZero() & 1) == 0
        && ![(SBRecordingIndicatorViewController *)self location]
        && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)&self->super.super.super.isa) & 1) == 0)
      {
        -[SBRecordingIndicatorViewController _updateIndicatorLayerSize:opacity:]((uint64_t)self, 0.0, 0.0);
        if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)&self->super.super.super.isa)) {
          double size = self->_size;
        }
        else {
          double size = self->_size * 0.8;
        }
        if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)&self->super.super.super.isa)) {
          double v23 = 1.0;
        }
        else {
          double v23 = 0.8;
        }
        -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:]((double *)self, size, v23);
      }
      id v24 = objc_alloc(MEMORY[0x1E4F43008]);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_7;
      v31[3] = &unk_1E6AF4AC0;
      v31[4] = self;
      v25 = (UIViewPropertyAnimator *)[v24 initWithDuration:0 curve:v31 animations:1.0];
      animatorScaleToZero = self->_animatorScaleToZero;
      self->_animatorScaleToZero = v25;

      objc_initWeak((id *)buf, self);
      v27 = self->_animatorScaleToZero;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_8;
      v28[3] = &unk_1E6B06D48;
      objc_copyWeak(&v29, (id *)buf);
      char v30 = 0;
      [(UIViewPropertyAnimator *)v27 addCompletion:v28];
      -[SBRecordingIndicatorViewController setIndicatorState:](self, 3);
      [(UIViewPropertyAnimator *)self->_animatorScaleToZero startAnimation];
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (id)_usesSpringAnimations
{
  if (result)
  {
    v1 = result;
    return (id *)((-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors](result) & 1) != 0
               || -[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations]((uint64_t)v1)
               && [v1 location] == 2);
  }
  return result;
}

- (id)_hasMedinaPadBehaviors
{
  v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v3 = [v2 userInterfaceIdiom];

    if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && +[SBRecordingIndicatorManager _supportsSecureIndicator])
    {
      id WeakRetained = objc_loadWeakRetained(v1 + 146);
      if ([WeakRetained isMainDisplayWindowScene]) {
        v1 = (id *)([v1 location] == 0);
      }
      else {
        v1 = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (void)_updateIndicatorVisibilityWithSpringAnimation:(id *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = SBLogStatusBarish();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        v5 = @"on";
      }
      else {
        v5 = @"off";
      }
      uint64_t v6 = [a1 location];
      unint64_t v7 = @"Standalone";
      if (v6 == 1) {
        unint64_t v7 = @"StatusBar";
      }
      if (v6 == 2) {
        unint64_t v7 = @"SystemAperture";
      }
      v8 = v7;
      *(_DWORD *)buf = 138543618;
      id v29 = v5;
      __int16 v30 = 2114;
      v31 = v8;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (spring animation)", buf, 0x16u);
    }
    -[SBRecordingIndicatorViewController _stopAllAnimations]((uint64_t)a1);
    objc_initWeak((id *)buf, a1);
    v9 = [a1 indicatorView];
    id v10 = [v9 layer];
    unsigned __int8 v11 = -[SBRecordingIndicatorViewController _hasMedinaPadBehaviors](a1);
    if (a2)
    {
      if ((v11 & 1) == 0)
      {
        -[SBRecordingIndicatorViewController _addBlurFilterToLayer:withBlurRadius:]((uint64_t)a1, v10, 6.0);
        -[SBRecordingIndicatorViewController _animateLayer:forKeyPath:fromValue:toValue:persistingToValue:duration:]((uint64_t)a1, v10, @"filters.gaussianBlur.inputRadius", &unk_1F3348C58, &unk_1F3348C68, 1, 0.8);
      }
      id v12 = objc_alloc(MEMORY[0x1E4F43008]);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke;
      v27[3] = &unk_1E6AF4AC0;
      v27[4] = a1;
      uint64_t v13 = [v12 initWithDuration:v27 dampingRatio:1.9 animations:0.35];
      id v14 = a1[127];
      a1[127] = (id)v13;

      id v15 = a1[127];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_2;
      v25[3] = &unk_1E6B06D20;
      id v16 = &v26;
      objc_copyWeak(&v26, (id *)buf);
      [v15 addCompletion:v25];
      -[SBRecordingIndicatorViewController setIndicatorState:](a1, 1);
      [a1[127] startAnimation];
    }
    else
    {
      if ((v11 & 1) == 0)
      {
        -[SBRecordingIndicatorViewController _addBlurFilterToLayer:withBlurRadius:]((uint64_t)a1, v10, 0.0);
        -[SBRecordingIndicatorViewController _animateLayer:forKeyPath:fromValue:toValue:persistingToValue:duration:]((uint64_t)a1, v10, @"filters.gaussianBlur.inputRadius", &unk_1F3348C78, &unk_1F3348C88, 0, 1.0);
      }
      id v17 = objc_alloc(MEMORY[0x1E4F43008]);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_34;
      v24[3] = &unk_1E6AF4AC0;
      v24[4] = a1;
      uint64_t v18 = [v17 initWithDuration:v24 dampingRatio:1.5 animations:1.02];
      id v19 = a1[128];
      a1[128] = (id)v18;

      id v20 = a1[128];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_2_35;
      v21[3] = &unk_1E6B06D48;
      id v16 = &v22;
      objc_copyWeak(&v22, (id *)buf);
      char v23 = 0;
      [v20 addCompletion:v21];
      -[SBRecordingIndicatorViewController setIndicatorState:](a1, 3);
      [a1[128] startAnimation];
    }
    objc_destroyWeak(v16);

    objc_destroyWeak((id *)buf);
  }
}

- (void)setIndicatorState:(void *)a1
{
  if (a1 && a1[142] != a2)
  {
    a1[142] = a2;
    id v4 = [a1 delegate];
    [v4 recordingIndicatorViewController:a1 didUpdateIndicatorState:a2];
  }
}

- (SBRecordingIndicatorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRecordingIndicatorViewControllerDelegate *)WeakRetained;
}

- (void)_updateIndicatorViewSize:(double)a3 alpha:
{
  if (a1)
  {
    id v16 = [a1 indicatorView];
    objc_msgSend(v16, "setSize:", a2, a2);
    [v16 setAlpha:a3];
    if (-[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations]((uint64_t)a1)
      && [a1 location] == 2)
    {
      uint64_t v6 = [a1 indicatorContainerView];
      [v6 center];
      double v8 = v7;
      double v10 = v9;
      unsigned __int8 v11 = [v6 superview];
      objc_msgSend(v6, "convertPoint:fromView:", v11, v8, v10);
      double v13 = v12;
      double v15 = v14;

      objc_msgSend(v16, "setCenter:", v13, v15);
    }
    else
    {
      objc_msgSend(v16, "setCenter:", a1[132], a1[133]);
    }
  }
}

- (unint64_t)location
{
  return self->_location;
}

- (uint64_t)_screenTypeForcesFastFadeAnimations
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = 1;
  uint64_t v2 = SBFEffectiveArtworkSubtype();
  if (v2 > 2795)
  {
    if (v2 != 2796 && v2 != 2868) {
      return 0;
    }
  }
  else if (v2 != 2556 && v2 != 2622)
  {
    return 0;
  }
  return v1;
}

- (UIView)indicatorContainerView
{
  return self->_indicatorContainerView;
}

- (uint64_t)_stopAllAnimations
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 976) stopAnimation:1];
    [*(id *)(v1 + 984) stopAnimation:1];
    [*(id *)(v1 + 992) stopAnimation:1];
    [*(id *)(v1 + 1000) stopAnimation:1];
    [*(id *)(v1 + 1008) stopAnimation:1];
    [*(id *)(v1 + 1016) stopAnimation:1];
    uint64_t v2 = *(void **)(v1 + 1024);
    return [v2 stopAnimation:1];
  }
  return result;
}

- (void)_animateLayer:(void *)a3 forKeyPath:(void *)a4 fromValue:(void *)a5 toValue:(int)a6 persistingToValue:(double)a7 duration:
{
  id v16 = a2;
  id v13 = a3;
  id v14 = a5;
  if (a1)
  {
    double v15 = -[SBRecordingIndicatorViewController _springAnimationForKeyPath:fromValue:toValue:duration:](a1, (uint64_t)v13, a4, v14, a7);
    [v16 addAnimation:v15 forKey:v13];
    if (a6) {
      [v16 setValue:v14 forKeyPath:v13];
    }
  }
}

- (id)_springAnimationForKeyPath:(void *)a3 fromValue:(void *)a4 toValue:(double)a5 duration:
{
  if (a1)
  {
    double v8 = (void *)MEMORY[0x1E4F39C90];
    id v9 = a4;
    id v10 = a3;
    unsigned __int8 v11 = [v8 animationWithKeyPath:a2];
    [v11 setBeginTime:CACurrentMediaTime()];
    [v11 setFillMode:*MEMORY[0x1E4F39F98]];
    [v11 setFromValue:v10];

    [v11 setToValue:v9];
    [v11 setMass:2.0];
    [v11 setStiffness:300.0];
    [v11 setDamping:50.0];
    [v11 setDuration:a5];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }
  return v11;
}

- (void)_addBlurFilterToLayer:(double)a3 withBlurRadius:
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (void *)MEMORY[0x1E4F39BC0];
    uint64_t v5 = *MEMORY[0x1E4F3A0D0];
    id v6 = a2;
    double v7 = [v4 filterWithType:v5];
    [v7 setName:@"gaussianBlur"];
    [v7 setValue:@"high" forKey:@"inputQuality"];
    double v8 = [NSNumber numberWithDouble:a3];
    [v7 setValue:v8 forKey:@"inputRadius"];

    v10[0] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v6 setFilters:v9];
  }
}

- (void)setIndicatorColor:(id)a3
{
  p_indicatorColor = &self->_indicatorColor;
  objc_storeStrong((id *)&self->_indicatorColor, a3);
  id v7 = a3;
  id v6 = [(SBRecordingIndicatorViewController *)self indicatorView];
  [v6 setBackgroundColor:*p_indicatorColor];

  [(CASecureIndicatorLayer *)self->_contentLayer setBackgroundColor:[(UIColor *)*p_indicatorColor cgColor]];
}

- (void)updateIndicatorType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3) {
    [MEMORY[0x1E4F428B8] systemOrangeColor];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4F428B8] systemGreenColor];
  }
  [(SBRecordingIndicatorViewController *)self setIndicatorColor:v5];
  id v6 = [(SBRecordingIndicatorViewController *)self indicatorView];
  [v6 setIndicatorType:a3];

  id v7 = CAPrivacyIndicatorTypeForIndicatorType((id)a3);
  double v8 = SBLogStatusBarish();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    double v12 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating secure indicator type for layer-dot to %@", (uint8_t *)&v11, 0xCu);
  }

  [(CASecureIndicatorLayer *)self->_contentLayer setPrivacyIndicatorType:v7];
  BOOL IsCircular = SBRecordingIndicatorTypeIsCircular(a3);
  double v10 = 0.0;
  if (IsCircular) {
    double v10 = self->_size * 0.5;
  }
  [(CASecureIndicatorLayer *)self->_contentLayer setCornerRadius:v10];
}

- (SBRecordingIndicatorView)indicatorView
{
  return self->_indicatorView;
}

void __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke(uint64_t a1)
{
}

- (id)initForLocation:(unint64_t)a3 windowScene:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBRecordingIndicatorViewController;
  id v7 = [(SBRecordingIndicatorViewController *)&v17 init];
  uint64_t v8 = (uint64_t)v7;
  if (v7)
  {
    v7->_location = a3;
    v7->_activeInterfaceOrientation = 1;
    v7->_indicatorState = 0;
    objc_storeWeak((id *)&v7->_windowScene, v6);
    id v9 = [(id)v8 view];
    double v10 = objc_alloc_init(SBRecordingIndicatorView);
    [(SBRecordingIndicatorView *)v10 setAutoresizingMask:0];
    objc_storeStrong((id *)(v8 + 1120), v10);
    if (-[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations](v8)
      && [(id)v8 location] == 2)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      double v12 = *(void **)(v8 + 1112);
      *(void *)(v8 + 1112) = v11;
      id v13 = v11;

      [v9 addSubview:v13];
      [v13 addSubview:v10];
    }
    else
    {
      [v9 addSubview:v10];
    }
    if (![(id)v8 location]
      && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)v8) & 1) == 0)
    {
      -[SBRecordingIndicatorViewController _configureRootLayer](v8);
    }
    -[SBRecordingIndicatorViewController calculateInitialIndicatorPositionAndSize](v8);
    id v14 = objc_alloc_init(SBRecordingIndicatorRotationRateLimiter);
    double v15 = *(void **)(v8 + 1096);
    *(void *)(v8 + 1096) = v14;
  }
  return (id)v8;
}

- (BOOL)_usesSpringAnimationsWithContainerView
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    return -[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations](result)
        && [v1 location] == 2;
  }
  return result;
}

- (id)_interchangesViewAndLayer
{
  if (result)
  {
    uint64_t v1 = result;
    if ([result location]) {
      return 0;
    }
    else {
      return (id *)(-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors](v1) ^ 1);
    }
  }
  return result;
}

- (uint64_t)_configureRootLayer
{
  v38[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (id *)result;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    id WeakRetained = objc_loadWeakRetained(v1 + 146);
    uint64_t v3 = [WeakRetained screen];
    id v4 = [v3 _display];
    [v3 scale];
    CGFloat v6 = v5;
    int v7 = [WeakRetained isExternalDisplayWindowScene];
    uint64_t v8 = *MEMORY[0x1E4F1CFD0];
    uint64_t v9 = *MEMORY[0x1E4F39E90];
    v37[0] = *MEMORY[0x1E4F39E68];
    v37[1] = v9;
    v38[0] = v8;
    v38[1] = v8;
    v37[2] = *MEMORY[0x1E4F39E58];
    double v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "displayId"));
    v38[2] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

    uint64_t v12 = [MEMORY[0x1E4F39B58] remoteContextWithOptions:v11];
    id v13 = v1[134];
    v1[134] = (id)v12;

    LODWORD(v14) = 1148846080;
    [v1[134] setLevel:v14];
    [v1[134] setSecure:1];
    uint64_t v15 = [MEMORY[0x1E4F39BE8] layer];
    id v16 = v1[135];
    v1[135] = (id)v15;

    id v17 = v1[135];
    CGAffineTransformMakeScale(&v36, v6, v6);
    [v17 setAffineTransform:&v36];
    if (v7)
    {
      [v3 nativeBounds];
    }
    else
    {
      GSMainScreenPixelSize();
      BSRectWithSize();
    }
    CGFloat v22 = v18;
    CGFloat v23 = v19;
    CGFloat v24 = v20;
    CGFloat v25 = v21;
    objc_msgSend(v1[135], "setFrame:");
    GSMainScreenOrientation();
    if (v26 == 0.0) {
      char v27 = 1;
    }
    else {
      char v27 = v7;
    }
    if ((v27 & 1) == 0)
    {
      float v28 = v26;
      id v29 = v1[135];
      v39.origin.x = v22;
      v39.origin.y = v23;
      v39.size.width = v24;
      v39.size.height = v25;
      double MidY = CGRectGetMidY(v39);
      v40.origin.x = v22;
      v40.origin.y = v23;
      v40.size.width = v24;
      v40.size.height = v25;
      objc_msgSend(v29, "setPosition:", MidY, CGRectGetMidX(v40));
      id v31 = v1[135];
      if (v31) {
        [v31 affineTransform];
      }
      else {
        memset(&v34, 0, sizeof(v34));
      }
      CGAffineTransformRotate(&v35, &v34, (float)-v28);
      [v31 setAffineTransform:&v35];
    }
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F39C80], "layer", *(_OWORD *)&v34.a, *(_OWORD *)&v34.c, *(_OWORD *)&v34.tx);
    id v33 = v1[136];
    v1[136] = (id)v32;

    [v1[136] setMasksToBounds:1];
    [v1[135] addSublayer:v1[136]];
    [v1[134] setLayer:v1[135]];

    return [MEMORY[0x1E4F39CF8] commit];
  }
  return result;
}

- (void)calculateInitialIndicatorPositionAndSize
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SBHStringForScreenType();
  int v4 = 138412290;
  double v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[Recording Indicator] no layout info for screen type: %@", (uint8_t *)&v4, 0xCu);
}

- (void)dealloc
{
  [(BLSAssertion *)self->_liveRenderingAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBRecordingIndicatorViewController;
  [(SBRecordingIndicatorViewController *)&v3 dealloc];
}

- (double)_alphaForStateIdleOn
{
  if (!a1) {
    return 0.0;
  }
  int hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState](a1);
  double result = 0.8;
  if (hasProminentIdle) {
    return 1.0;
  }
  return result;
}

- (uint64_t)_hasProminentIdleState
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 1;
  uint64_t v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 == 2796 || v3 == 2868) {
      return v2;
    }
  }
  else if (v3 == 2556 || v3 == 2622)
  {
    return v2;
  }
  if ((-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors](a1) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 146);
    uint64_t v2 = [WeakRetained isExternalDisplayWindowScene];
  }
  return v2;
}

- (double)_sizeForStateIdleOn
{
  if (!a1) {
    return 0.0;
  }
  int hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)a1);
  double result = *(double *)(a1 + 1032);
  if (!hasProminentIdle) {
    return result * 0.8;
  }
  return result;
}

- (uint64_t)_ignoresActiveInterfaceOrientation
{
  if (result)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(result + 1168));
    uint64_t v2 = [WeakRetained isExternalDisplayWindowScene];

    return v2;
  }
  return result;
}

- (BOOL)_secureRenderingSupported
{
  if (result) {
    return +[SBRecordingIndicatorManager _supportsSecureIndicator];
  }
  return result;
}

- (void)_updateLiveRenderingAssertionIfNeededForIndicatorVisible:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1 && ((a2 & 1) != 0 || !*(void *)(a1 + 1136)))
  {
    BOOL v4 = +[SBRecordingIndicatorManager _supportsSecureIndicator];
    double v5 = [(id)a1 view];
    uint64_t v6 = [v5 window];
    int v7 = [v6 windowScene];

    if (v7) {
      int v8 = a2;
    }
    else {
      int v8 = 0;
    }
    if (v4) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    double v10 = SBLogStatusBarish();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      BOOL v21 = v4;
      __int16 v22 = 1024;
      int v23 = a2;
      __int16 v24 = 2112;
      CGFloat v25 = v7;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating live rendering assertion... hasSecureIndicator: %{BOOL}u, indicatorVisible: %{BOOL}u, windowScene: %@", buf, 0x18u);
    }

    [*(id *)(a1 + 1104) invalidate];
    if (v9)
    {
      id v11 = (void *)MEMORY[0x1E4F4F4C0];
      uint64_t v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      double v14 = [MEMORY[0x1E4F4F528] requestLiveUpdatingForScene:v7];
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F4F530], "requestUnrestrictedFramerateForScene:", v7, v14);
      v19[1] = v15;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      uint64_t v17 = [v11 acquireWithExplanation:v13 observer:0 attributes:v16];
      double v18 = *(void **)(a1 + 1104);
      *(void *)(a1 + 1104) = v17;
    }
    else
    {
      id v13 = *(void **)(a1 + 1104);
      *(void *)(a1 + 1104) = 0;
    }
  }
}

- (uint64_t)_isOnExtendedDesktop
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v3 = [v2 userInterfaceIdiom];

    if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 1168));
      uint64_t v1 = [WeakRetained isMainDisplayWindowScene] ^ 1;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (void)setActiveInterfaceOrientation:(int64_t)a3 withDuration:(double)a4
{
}

- (void)_updateToOrientation:(double)a3 withDuration:
{
  if (a1 && *(void *)(a1 + 1144) != a2)
  {
    *(void *)(a1 + 1144) = a2;
    unsigned int v6 = -[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)a1);
    int v7 = [*(id *)(a1 + 1096) shouldAllowRotationUnderRateLimits];
    if (a3 > 0.0 && v6 && v7)
    {
      int v8 = +[SBRecordingIndicatorDomain rootSettings];
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        [v8 delayBeforeFadeOut180];
        double v10 = v9;
        [v8 fadeOutDuration180];
        double v12 = v11;
        [v8 delayBeforeFadeIn180];
        double v14 = v13;
        [v8 fadeInDuration180];
      }
      else
      {
        [v8 delayBeforeFadeOut90];
        double v10 = v16;
        [v8 fadeOutDuration90];
        double v12 = v17;
        [v8 delayBeforeFadeIn90];
        double v14 = v18;
        [v8 fadeInDuration90];
      }
      double v19 = v15;
      objc_initWeak(&location, (id)a1);
      id v20 = objc_alloc(MEMORY[0x1E4F43008]);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke;
      v33[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v34, &location);
      BOOL v21 = (void *)[v20 initWithDuration:0 curve:v33 animations:v12];
      id v22 = objc_alloc(MEMORY[0x1E4F43008]);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke_2;
      v31[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v32, &location);
      int v23 = (void *)[v22 initWithDuration:0 curve:v31 animations:v19];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      char v27 = __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke_3;
      float v28 = &unk_1E6B06CF8;
      objc_copyWeak(v30, &location);
      id v24 = v23;
      id v29 = v24;
      v30[1] = v14;
      [v21 addCompletion:&v25];
      objc_msgSend(v21, "startAnimationAfterDelay:", v10, v25, v26, v27, v28);

      objc_destroyWeak(v30);
      objc_destroyWeak(&v32);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else
    {
      -[SBRecordingIndicatorViewController _updateCenterWithoutAnimationForOrientation:](a1, a2);
    }
  }
}

- (uint64_t)_updateIndicatorLayerWithBounds:(double)a3 andCenter:(double)a4
{
  if (result)
  {
    id v13 = (id *)result;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    double v14 = [v13 indicatorView];
    BOOL IsCircular = SBRecordingIndicatorTypeIsCircular([v14 indicatorType]);

    double v16 = a4 * 0.5;
    if (!IsCircular) {
      double v16 = 0.0;
    }
    [v13[136] setCornerRadius:v16];
    objc_msgSend(v13[136], "setBounds:", a2, a3, a4, a5);
    objc_msgSend(v13[136], "setPosition:", a6, a7);
    double v17 = (void *)MEMORY[0x1E4F39CF8];
    return [v17 commit];
  }
  return result;
}

- (uint64_t)_updateIndicatorLayerSize:(double)a3 opacity:
{
  if (result)
  {
    uint64_t v5 = result;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    unsigned int v6 = [(id)v5 indicatorView];
    BOOL IsCircular = SBRecordingIndicatorTypeIsCircular([v6 indicatorType]);

    double v8 = a2 * 0.5;
    if (!IsCircular) {
      double v8 = 0.0;
    }
    [*(id *)(v5 + 1088) setCornerRadius:v8];
    [*(id *)(v5 + 1088) frame];
    objc_msgSend(*(id *)(v5 + 1088), "setFrame:");
    objc_msgSend(*(id *)(v5 + 1088), "setPosition:", *(double *)(v5 + 1056), *(double *)(v5 + 1064));
    *(float *)&double v9 = a3;
    [*(id *)(v5 + 1088) setOpacity:v9];
    double v10 = (void *)MEMORY[0x1E4F39CF8];
    return [v10 commit];
  }
  return result;
}

void __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    uint64_t v2 = [WeakRetained view];
    [v2 setAlpha:0.0];

    [v3[135] setOpacity:0.0];
    id WeakRetained = v3;
  }
}

void __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    uint64_t v2 = [WeakRetained view];
    [v2 setAlpha:1.0];

    LODWORD(v3) = 1.0;
    [v4[135] setOpacity:v3];
    id WeakRetained = v4;
  }
}

void __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    -[SBRecordingIndicatorViewController _updateCenterWithoutAnimationForOrientation:]((uint64_t)WeakRetained, WeakRetained[143]);
    [*(id *)(a1 + 32) startAnimationAfterDelay:*(double *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (uint64_t)_updateCenterWithoutAnimationForOrientation:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (-[SBRecordingIndicatorViewController _ignoresActiveInterfaceOrientation](result)) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = a2;
  }
  uint64_t v5 = [(id)v3 _screen];
  [v5 _referenceBounds];
  double v7 = v6;
  double v9 = v8;

  switch(v4)
  {
    case 4:
      uint64_t v13 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      double v11 = *(double *)(v3 + 1048);
      double v10 = *(double *)(v3 + 1032);
      if (v13 == 1) {
        double v11 = v7 - v11 - v10;
      }
      uint64_t v15 = 1040;
      break;
    case 3:
      uint64_t v12 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      double v11 = *(double *)(v3 + 1048);
      double v10 = *(double *)(v3 + 1032);
      if (v12 != 1) {
        double v11 = v7 - v11 - v10;
      }
      double v14 = v9 - *(double *)(v3 + 1040) - v10;
      goto LABEL_24;
    case 2:
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
      {
        double v10 = *(double *)(v3 + 1032);
        double v11 = v7 - v10 - *(double *)(v3 + 1040);
      }
      else
      {
        double v11 = *(double *)(v3 + 1040);
        double v10 = *(double *)(v3 + 1032);
      }
      double v14 = v9 - v10 - *(double *)(v3 + 1048);
      goto LABEL_24;
    default:
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
      {
        double v11 = *(double *)(v3 + 1040);
        double v10 = *(double *)(v3 + 1032);
      }
      else
      {
        double v10 = *(double *)(v3 + 1032);
        double v11 = v7 - v10 - *(double *)(v3 + 1040);
      }
      uint64_t v15 = 1048;
      break;
  }
  double v14 = *(double *)(v3 + v15);
LABEL_24:
  v21.origin.x = v11;
  v21.origin.y = v14;
  v21.size.width = v10;
  v21.size.height = v10;
  CGFloat MidX = CGRectGetMidX(v21);
  v22.origin.x = v11;
  v22.origin.y = v14;
  v22.size.width = v10;
  v22.size.height = v10;
  CGFloat MidY = CGRectGetMidY(v22);
  *(CGFloat *)(v3 + 1056) = MidX;
  *(CGFloat *)(v3 + 1064) = MidY;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_msgSend(*(id *)(v3 + 1088), "setPosition:", *(double *)(v3 + 1056), *(double *)(v3 + 1064));
  double v18 = [(id)v3 indicatorView];
  objc_msgSend(v18, "setCenter:", *(double *)(v3 + 1056), *(double *)(v3 + 1064));

  double v19 = (void *)MEMORY[0x1E4F39CF8];
  return [v19 commit];
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke(uint64_t a1)
{
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_2(uint64_t a1)
{
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(double **)(a1 + 32);
  double v2 = 0.0;
  if (v1)
  {
    if (-[SBRecordingIndicatorViewController _hasProminentIdleState](*(id **)(a1 + 32))) {
      double v4 = v1[129];
    }
    else {
      double v4 = v1[129] * 0.8;
    }
    uint64_t v5 = *(id **)(a1 + 32);
    if (v5)
    {
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState](v5)) {
        double v2 = 1.0;
      }
      else {
        double v2 = 0.8;
      }
    }
  }
  else
  {
    double v4 = 0.0;
  }
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](v1, v4, v2);
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = WeakRetained;
    [WeakRetained[123] startAnimation];
    id WeakRetained = v2;
  }
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = WeakRetained;
    [WeakRetained[124] startAnimationAfterDelay:2.0];
    id WeakRetained = v2;
  }
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_6(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (![WeakRetained location]
      && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)WeakRetained) & 1) == 0)
    {
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)WeakRetained)) {
        double v1 = WeakRetained[129];
      }
      else {
        double v1 = WeakRetained[129] * 0.8;
      }
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)WeakRetained)) {
        double v2 = 1.0;
      }
      else {
        double v2 = 0.8;
      }
      -[SBRecordingIndicatorViewController _updateIndicatorLayerSize:opacity:]((uint64_t)WeakRetained, v1, v2);
      uint64_t v3 = [WeakRetained traitCollection];
      uint64_t v4 = [v3 _backlightLuminance];

      double v5 = 0.0;
      if (v4 == 1)
      {
        if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)WeakRetained)) {
          double v5 = 1.0;
        }
        else {
          double v5 = 0.8;
        }
      }
      int hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)WeakRetained);
      double v7 = WeakRetained[129];
      if (!hasProminentIdle) {
        double v7 = v7 * 0.8;
      }
      -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](WeakRetained, v7, v5);
    }
    -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 2);
  }
}

- (BOOL)_shouldForceViewToShowForCurrentBacklightLuminance
{
  if (!a1) {
    return 0;
  }
  double v1 = [a1 traitCollection];
  BOOL v2 = [v1 _backlightLuminance] == 1;

  return v2;
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_7(uint64_t a1)
{
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 0);
  -[SBRecordingIndicatorViewController _updateLiveRenderingAssertionIfNeededForIndicatorVisible:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));
}

- (void)updateIndicatorVisibilityWithFastFadeAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  double v5 = SBLogStatusBarish();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      double v6 = @"on";
    }
    else {
      double v6 = @"off";
    }
    unint64_t v7 = [(SBRecordingIndicatorViewController *)self location];
    double v8 = @"Standalone";
    if (v7 == 1) {
      double v8 = @"StatusBar";
    }
    if (v7 == 2) {
      double v8 = @"SystemAperture";
    }
    double v9 = v8;
    *(_DWORD *)buf = 138543618;
    id v31 = v6;
    __int16 v32 = 2114;
    id v33 = v9;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (fast fade animation)", buf, 0x16u);
  }
  -[SBRecordingIndicatorViewController _stopAllAnimations]((uint64_t)self);
  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F43008]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke;
    v29[3] = &unk_1E6AF4AC0;
    v29[4] = self;
    double v11 = (UIViewPropertyAnimator *)[v10 initWithDuration:0 curve:v29 animations:0.2];
    animatorFastFade = self->_animatorFastFade;
    self->_animatorFastFade = v11;

    objc_initWeak((id *)buf, self);
    uint64_t v13 = self->_animatorFastFade;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_2;
    v27[3] = &unk_1E6B06D70;
    objc_copyWeak(&v28, (id *)buf);
    v27[4] = self;
    [(UIViewPropertyAnimator *)v13 addCompletion:v27];
    -[SBRecordingIndicatorViewController setIndicatorState:](self, 1);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (self
      && ![(SBRecordingIndicatorViewController *)self location]
      && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)&self->super.super.super.isa) & 1) == 0)
    {
      -[SBRecordingIndicatorViewController _updateIndicatorLayerSize:opacity:]((uint64_t)self, 0.0, 0.0);
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)&self->super.super.super.isa)) {
        double size = self->_size;
      }
      else {
        double size = self->_size * 0.8;
      }
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)&self->super.super.super.isa)) {
        double v15 = 1.0;
      }
      else {
        double v15 = 0.8;
      }
      -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:]((double *)self, size, v15);
    }
    id v16 = objc_alloc(MEMORY[0x1E4F43008]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_3;
    v26[3] = &unk_1E6AF4AC0;
    v26[4] = self;
    double v17 = (UIViewPropertyAnimator *)[v16 initWithDuration:0 curve:v26 animations:0.2];
    double v18 = self->_animatorFastFade;
    self->_animatorFastFade = v17;

    objc_initWeak((id *)buf, self);
    double v19 = self->_animatorFastFade;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    CGRect v22 = __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_4;
    int v23 = &unk_1E6B06D48;
    objc_copyWeak(&v24, (id *)buf);
    char v25 = 0;
    [(UIViewPropertyAnimator *)v19 addCompletion:&v20];
    -[SBRecordingIndicatorViewController setIndicatorState:](self, 3);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  [(UIViewPropertyAnimator *)self->_animatorFastFade startAnimation];
}

void __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke(uint64_t a1)
{
  double v1 = *(double **)(a1 + 32);
  double v2 = 0.0;
  if (v1)
  {
    if (-[SBRecordingIndicatorViewController _hasProminentIdleState](*(id **)(a1 + 32))) {
      double v4 = v1[129];
    }
    else {
      double v4 = v1[129] * 0.8;
    }
    double v5 = *(id **)(a1 + 32);
    if (v5)
    {
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState](v5)) {
        double v2 = 1.0;
      }
      else {
        double v2 = 0.8;
      }
    }
  }
  else
  {
    double v4 = 0.0;
  }
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](v1, v4, v2);
}

void __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v11 = WeakRetained;
    if (![WeakRetained location]
      && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)v11) & 1) == 0)
    {
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)v11)) {
        double v3 = v11[129];
      }
      else {
        double v3 = v11[129] * 0.8;
      }
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)v11)) {
        double v4 = 1.0;
      }
      else {
        double v4 = 0.8;
      }
      -[SBRecordingIndicatorViewController _updateIndicatorLayerSize:opacity:]((uint64_t)v11, v3, v4);
      double v5 = [v11 traitCollection];
      uint64_t v6 = [v5 _backlightLuminance];

      double v7 = 0.0;
      if (v6 == 1)
      {
        double v8 = *(id **)(a1 + 32);
        if (v8)
        {
          if (-[SBRecordingIndicatorViewController _hasProminentIdleState](v8)) {
            double v7 = 1.0;
          }
          else {
            double v7 = 0.8;
          }
        }
      }
      int hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)v11);
      double v10 = v11[129];
      if (!hasProminentIdle) {
        double v10 = v10 * 0.8;
      }
      -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](v11, v10, v7);
    }
    -[SBRecordingIndicatorViewController setIndicatorState:](v11, 2);
    id WeakRetained = v11;
  }
}

void __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_3(uint64_t a1)
{
}

void __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 0);
  -[SBRecordingIndicatorViewController _updateLiveRenderingAssertionIfNeededForIndicatorVisible:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));
}

void __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained indicatorState] == 1) {
    -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 2);
  }
}

void __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_34(uint64_t a1)
{
}

void __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_2_35(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained indicatorState] == 3)
  {
    -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 0);
    -[SBRecordingIndicatorViewController _updateLiveRenderingAssertionIfNeededForIndicatorVisible:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));
  }
}

- (void)_updateIndicatorForBacklightLuminance:(uint64_t)a3 previousBacklightLuminance:
{
  if (a1
    && (-[SBRecordingIndicatorViewController _isSuppressingFlipbookRendering]((uint64_t)a1) & 1) == 0
    && [a1 indicatorState] == 2
    && ![a1 location]
    && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)a1) & 1) == 0
    && (a2 == 1 || a3 == 1))
  {
    id v8 = [a1 indicatorView];
    double v6 = 0.0;
    if (a2 == 1)
    {
      int hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)a1);
      double v6 = 0.8;
      if (hasProminentIdle) {
        double v6 = 1.0;
      }
    }
    [v8 setAlpha:v6];
  }
}

- (uint64_t)_isSuppressingFlipbookRendering
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = objc_opt_class();
    double v3 = [*(id *)(v1 + 1104) attributes];
    double v4 = objc_msgSend(v3, "bs_firstObjectOfClass:", v2);
    uint64_t v1 = v4 != 0;
  }
  return v1;
}

- (BOOL)_shouldForceViewToShowForBacklightLuminance:(uint64_t)a1
{
  return a1 && a2 == 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  double v4 = [(SBRecordingIndicatorViewController *)self traitCollection];
  uint64_t v5 = [v4 _backlightLuminance];
  if (v5 != [v6 _backlightLuminance]) {
    -[SBRecordingIndicatorViewController _updateIndicatorForBacklightLuminance:previousBacklightLuminance:](self, v5, [v6 _backlightLuminance]);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  double v4 = [WeakRetained screen];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBRecordingIndicatorViewController;
    id v6 = [(SBRecordingIndicatorViewController *)&v9 _screen];
  }
  double v7 = v6;

  return v7;
}

- (UIColor)indicatorColor
{
  return self->_indicatorColor;
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (void)setDelegate:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indicatorColor, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_animatorSpringToOff, 0);
  objc_storeStrong((id *)&self->_animatorSpringToOn, 0);
  objc_storeStrong((id *)&self->_animatorFastFade, 0);
  objc_storeStrong((id *)&self->_animatorScaleToZero, 0);
  objc_storeStrong((id *)&self->_animatorScaleToRest, 0);
  objc_storeStrong((id *)&self->_animatorScaleToNormal, 0);
  objc_storeStrong((id *)&self->_animatorScaleToOverscale, 0);
}

@end