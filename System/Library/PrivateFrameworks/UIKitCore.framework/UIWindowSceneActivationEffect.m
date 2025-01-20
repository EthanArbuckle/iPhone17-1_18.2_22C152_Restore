@interface UIWindowSceneActivationEffect
@end

@implementation UIWindowSceneActivationEffect

void __49___UIWindowSceneActivationEffect_advanceToScale___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) platterView];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

void __49___UIWindowSceneActivationEffect_advanceToScale___block_invoke_2(uint64_t a1)
{
  v2 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
  [v2 pinchPlatterMaxShadowIntensity];
  double v4 = v3;
  v5 = [*(id *)(a1 + 32) platterView];
  [v5 setShadowAlpha:v4];

  id v6 = [*(id *)(a1 + 32) platterView];
  [v6 setBackgroundAlpha:1.0];
}

uint64_t __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke(uint64_t result)
{
  if (!--*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 32) state];
    if (!result)
    {
      v2 = [*(id *)(v1 + 32) platterContainer];
      [v2 removeFromSuperview];

      double v3 = *(void **)(v1 + 32);
      return [v3 _performAllCompletionBlocks];
    }
  }
  return result;
}

uint64_t __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke_2(uint64_t a1)
{
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShadowAlpha:0.0];
}

@end