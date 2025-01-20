@interface UIDragSetDownItemAnimation
@end

@implementation UIDragSetDownItemAnimation

void __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = [(id)objc_opt_class() defaultSingleItemAnimationForPlatterView:*(void *)(a1 + 32)];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);
}

void __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = [(id)objc_opt_class() defaultMultiItemAnimationForPlatterView:*(void *)(a1 + 32)];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);
}

void __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = [(id)objc_opt_class() defaultDropAnimationForPlatterView:*(void *)(a1 + 32)];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);
}

void __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_4(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained animationReachedTarget];

  [*(id *)(a1 + 32) removeFromSuperview];
  id v4 = objc_loadWeakRetained(v2);
  [v4 animationCompleted];
}

void __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained dropContainerView];
  [WeakRetained targetFrame];
  double v5 = v4 + v3 * 0.5;
  double v8 = v7 + v6 * 0.5;
  objc_msgSend(WeakRetained, "setCenter:", v5, v8, 0.0);
  [v2 _currentScreenScale];
  double v10 = UIPointRoundToScale(v5, v8, v9);
  double v12 = v11;
  v13 = [WeakRetained platterContainerView];
  v14 = [v13 superview];
  objc_msgSend(v2, "convertPoint:toCoordinateSpace:", v14, v10, v12);
  double v16 = v15;
  double v18 = v17;

  v19 = [WeakRetained platterContainerView];
  objc_msgSend(v19, "setCenter:", v16, v18);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v20 = objc_msgSend(WeakRetained, "propertyAnimator", 0);
  v21 = [v20 _animations];
  v22 = (void *)[v21 copy];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * i) + 16))();
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v24);
  }
}

void __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [*(id *)(a1 + 32) setLifted:0];
  [*(id *)(a1 + 32) setBackgroundVisible:1];
  [*(id *)(a1 + 32) setShadowVisible:1];
  [*(id *)(a1 + 32) setConstrainSize:0];
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 32) setStackRotation:0.0];
  objc_msgSend(*(id *)(a1 + 32), "setAppliesOriginalRotation:", objc_msgSend(WeakRetained, "previewMode") != 4);
  [*(id *)(a1 + 40) setAlpha:0.0];
  [*(id *)(a1 + 40) setStackRotation:0.0];
  long long v3 = 0uLL;
  memset(&v15, 0, sizeof(v15));
  double v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 targetTransformIncludingAppliedTransform:0];
    long long v3 = 0uLL;
  }
  *(_OWORD *)&v14.c = v3;
  *(_OWORD *)&v14.tx = v3;
  *(_OWORD *)&v14.a = v3;
  CATransform3D v12 = v15;
  CATransform3DGetAffineTransform(&t1, &v12);
  double v5 = [WeakRetained targetedDropPreview];
  double v6 = [v5 target];
  double v7 = v6;
  if (v6) {
    [v6 transform];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CGAffineTransformConcat(&v14, &t1, &v11);

  double v8 = *(void **)(a1 + 48);
  double v9 = [WeakRetained targetedDropPreview];
  double v10 = [v9 _duiPreview];
  [v10 unscaledSize];
  *(_OWORD *)&v12.m11 = *(_OWORD *)&v14.a;
  *(_OWORD *)&v12.m13 = *(_OWORD *)&v14.c;
  *(_OWORD *)&v12.m21 = *(_OWORD *)&v14.tx;
  objc_msgSend(v8, "applyTransform:withSize:", &v12);
}

uint64_t __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShadowVisible:0];
}

uint64_t __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundVisible:0];
}

void __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained animationReachedTarget];
  long long v3 = [WeakRetained propertyAnimator];
  double v4 = [v3 _completions];
  double v5 = (void *)[v4 copy];

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__241;
  long long v29 = __Block_byref_object_dispose__241;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_52;
  aBlock[3] = &unk_1E52D9F70;
  id v6 = v5;
  id v24 = v6;
  id v30 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_2_53;
  v15[3] = &unk_1E53106C0;
  char v22 = *(unsigned char *)(a1 + 96);
  id v7 = *(id *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 64);
  long long v19 = *(_OWORD *)(a1 + 48);
  long long v20 = v8;
  long long v21 = *(_OWORD *)(a1 + 80);
  id v16 = v7;
  id v17 = WeakRetained;
  double v18 = &v25;
  double v9 = (void (**)(void))_Block_copy(v15);
  double v10 = [WeakRetained visualTarget];
  CGAffineTransform v11 = [WeakRetained delegate];
  CATransform3D v12 = [WeakRetained item];
  char v13 = [v10 _setDownAnimation:v11 shouldDelaySetDownOfDragItem:v12 completion:v9];

  if (v13)
  {
    (*(void (**)(void))(v26[5] + 16))();
    CGAffineTransform v14 = (void *)v26[5];
    v26[5] = 0;
  }
  else
  {
    v9[2](v9);
  }

  _Block_object_dispose(&v25, 8);
}

void __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_52(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_2_53(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104))
  {
    [*(id *)(a1 + 32) removeFromSuperview];
  }
  else if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    if (v2)
    {
      [v2 transform];
      uint64_t v3 = *(void **)(a1 + 32);
    }
    else
    {
      uint64_t v3 = 0;
      memset(&t1, 0, sizeof(t1));
    }
    long long v4 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&t2.a = *(_OWORD *)(a1 + 56);
    *(_OWORD *)&t2.c = v4;
    *(_OWORD *)&t2.tx = *(_OWORD *)(a1 + 88);
    CGAffineTransformConcat(&v23, &t1, &t2);
    CGAffineTransform v20 = v23;
    [v3 setTransform:&v20];
  }
  int v5 = [*(id *)(a1 + 40) updatedPreviewWasAdded];
  long long v6 = [*(id *)(a1 + 40) updatedAppPlatterView];
  long long v7 = [v6 sourceView];
  long long v8 = v7;
  if (v5)
  {
    [v7 removeFromSuperview];
  }
  else
  {
    if (v7) {
      [v7 transform];
    }
    else {
      memset(&v18, 0, sizeof(v18));
    }
    long long v9 = [*(id *)(a1 + 40) updatedTargetedDropPreview];
    double v10 = [v9 target];
    uint64_t v11 = v10;
    if (v10) {
      [v10 transform];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    CGAffineTransformConcat(&v19, &v18, &v17);
    CATransform3D v12 = [*(id *)(a1 + 40) updatedAppPlatterView];
    char v13 = [v12 sourceView];
    CGAffineTransform v16 = v19;
    [v13 setTransform:&v16];
  }
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v14) {
    (*(void (**)(void))(v14 + 16))();
  }
  return [*(id *)(a1 + 40) animationCompleted];
}

void __80___UIDragSetDownItemAnimation_reparentRetargetingContainerViewInTargetContainer__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 120) setAlpha:1.0];
  uint64_t v2 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2C0]];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  long long v4 = [*(id *)(*(void *)(a1 + 32) + 120) layer];
  [v4 setFilters:v3];

  int v5 = [*(id *)(*(void *)(a1 + 32) + 120) layer];
  [v5 setValue:&unk_1ED3F2938 forKeyPath:@"filters.opacityPair.inputAmount"];
}

uint64_t __57___UIDragSetDownItemAnimation_performTrackingAnimations___block_invoke(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __55___UIDragSetDownItemAnimation_performSpringAnimations___block_invoke(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __57___UIDragSetDownItemAnimation_animationCompletionHandler__block_invoke(uint64_t a1)
{
  if (!--*(_DWORD *)(*(void *)(a1 + 32) + 20))
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 112);
    if (has_internal_diagnostics)
    {
      if (!v3)
      {
        long long v7 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "The completion handler must be not be nil for this set down animation", buf, 2u);
        }
      }
    }
    else if (!v3)
    {
      long long v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_DNDSetDownReparentingCrossfadeDuration_block_invoke___s_category)+ 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v9 = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "The completion handler must be not be nil for this set down animation", v9, 2u);
      }
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 112);
    if (v4)
    {
      (*(void (**)(void))(v4 + 16))();
      uint64_t v5 = *(void *)(a1 + 32);
      long long v6 = *(void **)(v5 + 112);
      *(void *)(v5 + 112) = 0;
    }
  }
}

uint64_t __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke_2;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 128) setAlpha:0.0];
  uint64_t v2 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2C0]];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  CAFrameRateRange v4 = [*(id *)(*(void *)(a1 + 32) + 120) layer];
  [v4 setFilters:v3];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 120) layer];
  [v5 setValue:&unk_1ED3F2948 forKeyPath:@"filters.opacityPair.inputAmount"];
}

uint64_t __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke_64(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) setHidden:1];
}

void __57___UIDragSetDownItemAnimation_updateTargetedDropPreview___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateTargetedDropPreview:*(void *)(a1 + 32)];
}

uint64_t __57___UIDragSetDownItemAnimation_updateTargetedDropPreview___block_invoke_2(uint64_t a1)
{
  memset(&v13, 0, sizeof(v13));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 144);
  if (v2) {
    [v2 targetTransform];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CATransform3DGetAffineTransform(&t1, &v11);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 80) target];
  CAFrameRateRange v4 = v3;
  if (v3) {
    [v3 transform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransformConcat(&v13, &t1, &t2);

  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = *(void **)(v5 + 160);
  long long v7 = [*(id *)(v5 + 80) _duiPreview];
  [v7 unscaledSize];
  CGAffineTransform v9 = v13;
  objc_msgSend(v6, "applyTransform:withSize:", &v9);

  [*(id *)(*(void *)(a1 + 32) + 144) setAlpha:1.0];
  return [*(id *)(*(void *)(a1 + 32) + 136) setAlpha:0.0];
}

@end