@interface UIBackdropView
@end

@implementation UIBackdropView

void __33___UIBackdropView_applySettings___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) backdropEffectView];
  [v1 setAlpha:1.0];
}

void __52___UIBackdropView_adjustTintImplementationIfNeeded___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 49))
    {
      [*(id *)(a1 + 32) setTintFilter:0];
      [*(id *)(a1 + 32) _updateFilters];
      v2 = [*(id *)(a1 + 32) grayscaleTintView];
      [v2 setHidden:0];

      v3 = [*(id *)(a1 + 32) colorTintView];
      [v3 setHidden:0];

      uint64_t v4 = [*(id *)(a1 + 40) isBackdropVisible];
      v5 = *(void **)(a1 + 32);
      [v5 setBackdropVisible:v4];
    }
  }
  else if (*(unsigned char *)(a1 + 50) && !*(unsigned char *)(a1 + 49))
  {
    [*(id *)(a1 + 32) setBackdropVisible:1];
    [*(id *)(a1 + 32) setTintFilterForSettings:*(void *)(a1 + 40)];
    *(void *)(*(void *)(a1 + 32) + 816) = 0xBFF0000000000000;
    v6 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) blurRadius];
    double v8 = v7;
    v9 = [*(id *)(a1 + 40) blurQuality];
    [v6 setBlurFilterWithRadius:v9 blurQuality:v8];

    *(void *)(*(void *)(a1 + 32) + 824) = 0xC059000000000000;
    v10 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) saturationDeltaFactor];
    objc_msgSend(v10, "setSaturationDeltaFactor:");
    v11 = [*(id *)(a1 + 32) grayscaleTintView];
    [v11 setHidden:1];

    id v12 = [*(id *)(a1 + 32) colorTintView];
    [v12 setHidden:1];
  }
}

uint64_t __33___UIBackdropView_applySettings___block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backdropEffectView];
  [v2 setAlpha:1.0];

  objc_msgSend(*(id *)(a1 + 32), "setBackdropVisible:", objc_msgSend(*(id *)(a1 + 40), "isBackdropVisible"));
  v3 = *(void **)(a1 + 32);
  return [v3 _applyCornerRadiusToSubviews];
}

uint64_t __55___UIBackdropView_computeAndApplySettingsForTransition__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) transitionComplete];
  }
  return result;
}

uint64_t __50___UIBackdropView_prepareForTransitionToSettings___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) inputSettings];
  if (v2)
  {
    v3 = [*(id *)(a1 + 32) inputSettings];
    BOOL v4 = v3[76] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  [*(id *)(a1 + 32) setInputSettings:*(void *)(a1 + 40)];
  v5 = +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", [*(id *)(a1 + 40) style]);
  [*(id *)(a1 + 32) setOutputSettings:v5];

  v6 = [*(id *)(a1 + 32) outputSettings];
  [v6 copyAdditionalSettingsFromSettings:*(void *)(a1 + 40)];

  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(v7 + 480) + 76)) {
    char v8 = 1;
  }
  else {
    char v8 = v4;
  }
  *(unsigned char *)(v7 + 435) = v8;
  v9 = *(void **)(a1 + 32);
  v10 = [v9 inputSettings];
  [v9 updateSubviewHierarchyIfNeededForSettings:v10];

  v11 = [*(id *)(a1 + 32) inputSettings];
  LODWORD(v10) = [v11 isBackdropVisible];

  if (v10) {
    [*(id *)(a1 + 32) setBackdropVisible:1];
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v12 + 435))
  {
    v13 = [*(id *)(v12 + 504) backdropLayer];
    [v13 setShouldRasterize:1];

    v14 = [*(id *)(*(void *)(a1 + 32) + 504) backdropLayer];
    [v14 setScale:0.5];
LABEL_14:

    goto LABEL_15;
  }
  if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49))
  {
    v14 = [(id)v12 backdropEffectView];
    v15 = [v14 backdropLayer];
    [v15 setScale:1.0];

    goto LABEL_14;
  }
LABEL_15:
  uint64_t v16 = [*(id *)(a1 + 40) style];
  v17 = *(void **)(a1 + 32);
  return [v17 setStyle:v16];
}

void __35___UIBackdropView_allBackdropViews__block_invoke(uint64_t a1)
{
  _AllBackdropViews();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __53___UIBackdropView_applySettingsWithBuiltInAnimation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applySettings:*(void *)(a1 + 40)];
}

void __53___UIBackdropView_applySettingsWithBuiltInAnimation___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 outputSettings];
  [v1 adjustTintImplementationIfNeeded:v2];
}

uint64_t __33___UIBackdropView_applySettings___block_invoke(double *a1)
{
  double v1 = a1[5];
  double v2 = a1[6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33___UIBackdropView_applySettings___block_invoke_2;
  v4[3] = &unk_1E52D9F70;
  *(double *)&v4[4] = a1[4];
  return +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:v1 animations:v2];
}

void __33___UIBackdropView_applySettings___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) backdropEffectView];
  [v1 setAlpha:1.0];
}

uint64_t __33___UIBackdropView_applySettings___block_invoke_3(uint64_t a1)
{
  double v1 = 1.0 - *(double *)(a1 + 40) - *(double *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33___UIBackdropView_applySettings___block_invoke_4;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v3, v1);
}

void __33___UIBackdropView_applySettings___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) backdropEffectView];
  [v1 setAlpha:0.0];
}

@end