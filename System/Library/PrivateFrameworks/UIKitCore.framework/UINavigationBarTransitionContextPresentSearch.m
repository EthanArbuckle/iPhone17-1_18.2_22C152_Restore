@interface UINavigationBarTransitionContextPresentSearch
@end

@implementation UINavigationBarTransitionContextPresentSearch

uint64_t __112___UINavigationBarTransitionContextPresentSearch__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_2;
  v2[3] = &unk_1E52D9F70;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:v2 relativeDuration:0.7 animations:0.3];
}

uint64_t __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) setAlpha:1.0];
}

void __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_3(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_4;
  aBlock[3] = &unk_1E52DE780;
  aBlock[4] = *(void *)(a1 + 32);
  v1 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  v1[2](v1, @"contentView");
  v1[2](v1, @"promptView");
  v1[2](v1, @"weeTitleLabel");
  v1[2](v1, @"largeTitleView");
}

void __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 72);
  id v4 = a2;
  id v7 = [v3 valueForKey:v4];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 80) valueForKey:v4];

  v6 = v7;
  if (v7 != v5)
  {
    [v7 setAlpha:0.0];
    v6 = v7;
  }
}

@end