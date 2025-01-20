@interface UIFloatingContentView
@end

@implementation UIFloatingContentView

uint64_t __40___UIFloatingContentView_initWithFrame___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:0];
  v2 = *(void **)(a1 + 32);
  v3 = +[UIColor colorWithWhite:1.0 alpha:0.9];
  [v2 setBackgroundColor:v3 forState:8];

  v4 = *(void **)(a1 + 32);
  v5 = +[UIColor colorWithWhite:1.0 alpha:0.9];
  [v4 setBackgroundColor:v5 forState:1];

  v6 = *(void **)(a1 + 32);
  v7 = +[UIColor colorWithWhite:1.0 alpha:0.8];
  [v6 setBackgroundColor:v7 forState:4];

  [*(id *)(a1 + 32) setRoundContentWhenDeselected:1];
  objc_msgSend(*(id *)(a1 + 32), "setFocusScaleAnchorPoint:", 0.5, 0.5);
  [*(id *)(a1 + 32) setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [*(id *)(a1 + 32) setCornerRadius:4.5];
  v8 = *(void **)(a1 + 32);
  v9 = [(id)objc_opt_class() _defaultFocusAnimationConfiguration];
  [v8 setFocusAnimationConfiguration:v9];

  [*(id *)(a1 + 32) setVisualEffectContainerViewScaleFactor:1.0];
  [*(id *)(a1 + 32) setUseShadowImage:1];
  [*(id *)(a1 + 32) setClipsContentToBounds:1];
  objc_msgSend(*(id *)(a1 + 32), "setShadowContentsCenter:", 0.5, 0.5, 0.0, 0.0);
  [*(id *)(a1 + 32) setFocusedSizeIncrease:30.0];
  [*(id *)(a1 + 32) setShadowRadius:20.0];
  [*(id *)(a1 + 32) setShadowVerticalOffset:25.0];
  [*(id *)(a1 + 32) setShadowOpacity:1 forUserInterfaceStyle:0.2];
  [*(id *)(a1 + 32) setShadowOpacity:2 forUserInterfaceStyle:0.5];
  [*(id *)(a1 + 32) setUnfocusedShadowOpacity:0.0];
  [*(id *)(a1 + 32) setUnfocusedShadowRadius:0.0];
  [*(id *)(a1 + 32) setUnfocusedShadowVerticalOffset:0.0];
  objc_msgSend(*(id *)(a1 + 32), "setUnfocusedShadowExpansion:", 0.0, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowExpansion:", 35.0, 35.0);
  v10 = *(void **)(a1 + 32);
  return [v10 setShadowEnabled:1];
}

void __52___UIFloatingContentView__shadowPathForSize_radius___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v1 = (void *)_MergedGlobals_11_2;
  _MergedGlobals_11_2 = v0;
}

void __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) floatingContentDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) floatingContentDelegate];
    [v4 floatingContentView:*(void *)(a1 + 32) didFinishTransitioningToState:*(void *)(*(void *)(a1 + 32) + 664)];
  }
  if (*(unsigned char *)(a1 + 40))
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 _primaryStateForState:v5[83]];
    [v5 _updateContainerLayerQualityForPrimaryState:v6];
  }
}

uint64_t __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutShadow];
  [*(id *)(a1 + 32) _updateTransformForPrimaryState:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateShadowContentsScaleForPrimaryState:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateHighContrastFocusIndicatorForPrimaryState:*(void *)(a1 + 40)];
  v2 = [*(id *)(*(void *)(a1 + 32) + 424) layer];
  [v2 setCornerCurve:*(void *)(*(void *)(a1 + 32) + 688)];

  char v3 = [*(id *)(*(void *)(a1 + 32) + 424) layer];
  int v4 = [*(id *)(a1 + 32) _shouldApplyCornerRadiusForPrimaryState:*(void *)(a1 + 40)];
  double v5 = 0.0;
  if (v4) {
    double v5 = *(double *)(*(void *)(a1 + 32) + 592);
  }
  [v3 setCornerRadius:v5];

  if (*(unsigned char *)(a1 + 64))
  {
    +[UIView inheritedAnimationDuration];
    double v7 = v6 * *(double *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke_3;
    v12[3] = &unk_1E52D9CD0;
    uint64_t v8 = *(void *)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    v12[5] = v8;
    +[UIView animateWithDuration:32 delay:v12 options:0 animations:v7 completion:0.0];
  }
  else
  {
    [*(id *)(a1 + 32) _updateHighlightViewForPrimaryState:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _updateShadowOpacityForPrimaryState:*(void *)(a1 + 40)];
  }
  v9 = [*(id *)(a1 + 32) floatingContentDelegate];
  [v9 floatingContentView:*(void *)(a1 + 32) isTransitioningFromState:*(void *)(a1 + 56) toState:*(void *)(*(void *)(a1 + 32) + 664)];

  v10 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40) == 8) {
    return [v10 _installContentMotionEffects];
  }
  else {
    return [v10 _uninstallContentMotionEffects];
  }
}

uint64_t __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateHighlightViewForPrimaryState:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _updateShadowOpacityForPrimaryState:v3];
}

void *__65___UIFloatingContentView_setShadowOpacity_forUserInterfaceStyle___block_invoke(void *result)
{
  uint64_t v1 = 31;
  if (result[5] == 2) {
    uint64_t v1 = 30;
  }
  *(void *)(result[4] + OBJC_IVAR____UIFloatingContentView__backgroundColorsByState[v1]) = result[6];
  return result;
}

void __49___UIFloatingContentView__setShadowImageIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) shadowRadius];
  double v3 = v2;
  [*(id *)(a1 + 32) cornerRadius];
  double v5 = +[_UIStretchableShadow shadowWithRadius:cornerRadius:isContinuousCorner:white:](_UIStretchableShadow, "shadowWithRadius:cornerRadius:isContinuousCorner:white:", [*(id *)(a1 + 32) isContinuousCornerEnabled], v3, v4, 0.0);
  double v6 = *(void **)(a1 + 32);
  id v7 = +[UIImage imageWithCGImage:v5];
  [v6 setShadowImage:v7];
}

@end