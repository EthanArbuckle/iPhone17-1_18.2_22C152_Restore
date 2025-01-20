@interface UIPointerContentEffect
@end

@implementation UIPointerContentEffect

void __48___UIPointerContentEffect_initWithStyle_region___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFromState:toState:", objc_msgSend(WeakRetained, "state"), objc_msgSend(WeakRetained, "state"));
}

void __47___UIPointerContentEffect_setPressed_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) platterView];
  [v2 setPressed:v1];
}

void __43___UIPointerContentEffect_setLiftProgress___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) liftProgressProperty];
  [v2 setValue:v1];
}

void __52___UIPointerContentEffect__updateFromState_toState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v48.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v48.c = v2;
  *(_OWORD *)&v48.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v3 = [*(id *)(a1 + 40) targetedPreview];
  v4 = [v3 view];
  v5 = [v4 layer];

  if (*(void *)(a1 + 56) == 1)
  {
    if (*(void *)(a1 + 64) != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "setSourceViewDidAllowEdgeAntialiasing:", objc_msgSend(v5, "allowsEdgeAntialiasing"));
      v6 = [*(id *)(a1 + 40) targetedPreview];
      v7 = [v6 view];
      v8 = [v7 layer];
      [v8 setAllowsEdgeAntialiasing:1];
    }
    v9 = [*(id *)(a1 + 40) targetedPreview];
    v10 = [v9 view];
    [v10 _willBeginBeingDisplayedInPointerContentEffect];

    v11 = [*(id *)(a1 + 32) liftProgressProperty];
    [v11 presentationValue];
    double v13 = v12;
    [*(id *)(a1 + 40) contentScale];
    double v15 = 1.0 - v13 + v13 * v14;

    if ([*(id *)(a1 + 40) options])
    {
      CGAffineTransformMakeScale(&v48, v15, v15);
    }
    else
    {
      if ([*(id *)(a1 + 40) pointerMergesWithContent])
      {
        double v16 = *MEMORY[0x1E4F1DAD8];
        double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      else
      {
        v25 = [*(id *)(a1 + 40) pointerShape];
        v26 = [v25 path];
        if (v26)
        {
          v27 = [v25 path];
          [v27 bounds];
          double v30 = v29 + v28 * 0.5;
          double v33 = v32 + v31 * 0.5;
        }
        else
        {
          [v25 rect];
          double v30 = v35 + v34 * 0.5;
          double v33 = v37 + v36 * 0.5;
        }

        [*(id *)(a1 + 32) initialEffectPlatterPosition];
        double v16 = v30 - v38;
        double v17 = v33 - v39;
      }
      CGAffineTransformMakeTranslation(&v48, v16, v17);
      CGAffineTransform v46 = v48;
      CGAffineTransformScale(&v47, &v46, v15, v15);
      CGAffineTransform v48 = v47;
      CGAffineTransform v46 = v47;
      CGAffineTransformTranslate(&v47, &v46, -v16, -v17);
      CGAffineTransform v48 = v47;
    }
    if (([*(id *)(a1 + 40) options] & 0x2000) != 0) {
      double v24 = 1.0 / v15;
    }
    else {
      double v24 = 1.0;
    }
  }
  else
  {
    uint64_t v18 = [*(id *)(a1 + 32) sourceViewDidAllowEdgeAntialiasing];
    v19 = [*(id *)(a1 + 40) targetedPreview];
    v20 = [v19 view];
    v21 = [v20 layer];
    [v21 setAllowsEdgeAntialiasing:v18];

    v22 = [*(id *)(a1 + 40) targetedPreview];
    v23 = [v22 view];
    [v23 _didStopBeingDisplayedInPointerContentEffect];

    double v24 = 1.0;
  }
  CGAffineTransform v45 = v48;
  [*(id *)(a1 + 48) setTransform:&v45];
  [*(id *)(a1 + 48) setTintViewScale:v24];
  uint64_t v40 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 64) != v40)
  {
    v41 = *(void **)(a1 + 32);
    if (v40 == 1)
    {
      v42 = [v41 exitAnimator];
      [v42 performAllCompletions:0];

      [*(id *)(a1 + 32) entranceAnimator];
    }
    else
    {
      v43 = [v41 entranceAnimator];
      [v43 performAllCompletions:0];

      [*(id *)(a1 + 32) exitAnimator];
    v44 = };
    [v44 performAllAnimations];
  }
}

void __52___UIPointerContentEffect__updateFromState_toState___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") - 1);
  [*(id *)(a1 + 32) animationCount];
  if (![*(id *)(a1 + 32) animationCount])
  {
    uint64_t v2 = [*(id *)(a1 + 32) state];
    v3 = *(void **)(a1 + 32);
    if (v2 == 1)
    {
      id v11 = [v3 entranceAnimator];
      [v11 performAllCompletions:1];
    }
    else
    {
      v4 = [v3 exitAnimator];
      [v4 performAllCompletions:1];

      v5 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke_3;
      v16[3] = &unk_1E52D9F70;
      v16[4] = v5;
      [v5 _modifyEffectContainerViewHierarchy:v16 waitForCACommit:0];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v6 = [*(id *)(a1 + 32) completions];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))();
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        }
        while (v8);
      }
    }
  }
}

uint64_t __52___UIPointerContentEffect__updateFromState_toState___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDownPlatterView];
}

uint64_t __52___UIPointerContentEffect__updateFromState_toState___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  uint64_t v2 = *(void *)(a1 + 56);
  double v3 = 0.0;
  if (v2 == 1 && ([*(id *)(a1 + 40) options] & 0x10) != 0)
  {
    [*(id *)(a1 + 32) liftProgress];
    double v3 = v4 + (1.0 - v4) * 0.0;
  }
  [*(id *)(a1 + 48) setShadowAlpha:v3];
  v5 = *(void **)(a1 + 48);
  return [v5 setTintDisabled:v2 != 1];
}

uint64_t __52___UIPointerContentEffect__updateFromState_toState___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70___UIPointerContentEffect__commitPointerStyleToArbiterWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v13 = objc_loadWeakRetained(&to);
  long long v14 = [v13 platterView];

  id v15 = objc_loadWeakRetained(&to);
  [v15 setPointerPortal:v9];

  id v16 = objc_loadWeakRetained(&to);
  [v16 setLumaSamplingBackdrop:v12];

  double v17 = [*(id *)(a1 + 32) targetedPreview];
  uint64_t v18 = [v17 target];
  v19 = [v18 container];

  id v20 = objc_loadWeakRetained(&to);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __70___UIPointerContentEffect__commitPointerStyleToArbiterWithCompletion___block_invoke_2;
  v26[3] = &unk_1E5300558;
  id v21 = v19;
  id v27 = v21;
  id v22 = v12;
  id v28 = v22;
  id v23 = v9;
  id v29 = v23;
  objc_copyWeak(&v30, &to);
  [v20 _modifyEffectContainerViewHierarchy:v26 waitForCACommit:0];

  if (v10)
  {
    objc_msgSend(v14, "setSpecularOptions:", ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "options") >> 10) & 4 | ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "options") >> 1) & 1);
    [v14 setSpecularHighlight:v10];
  }
  if (v11)
  {
    double v24 = [v14 layer];
    v25 = [v11 createAnimation];
    [v24 addAnimation:v25 forKey:@"_UIPointerContentEffect.pointerMatchMove"];
  }
  objc_destroyWeak(&v30);

  objc_destroyWeak(&to);
}

void __70___UIPointerContentEffect__commitPointerStyleToArbiterWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 48)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _ensureRelativeEffectViewOrderInContainer];
}

uint64_t __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertSubview:*(void *)(a1 + 40) aboveSubview:*(void *)(a1 + 48)];
}

uint64_t __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
}

void __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) target];
  uint64_t v2 = [v3 container];
  [v2 addSubview:*(void *)(a1 + 40)];
}

uint64_t __74___UIPointerContentEffect_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureRelativeEffectViewOrderInContainer];
}

void __74___UIPointerContentEffect_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 platterView];
  [v2 _anchorPlatterView:v3 toPreview:*(void *)(a1 + 40) updateBounds:1];
}

uint64_t __79___UIPointerContentEffect__modifyEffectContainerViewHierarchy_waitForCACommit___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return result;
}

uint64_t __76___UIPointerContentEffect__monitoredView_willMoveFromSuperview_toSuperview___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) end:0];
}

@end