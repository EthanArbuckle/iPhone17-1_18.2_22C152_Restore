@interface UINavigationBarTransitionContextDismissSearch
@end

@implementation UINavigationBarTransitionContextDismissSearch

uint64_t __112___UINavigationBarTransitionContextDismissSearch__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke_2;
  v2[3] = &unk_1E52D9F70;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:v2 relativeDuration:0.0 animations:0.3];
}

uint64_t __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setAlpha:0.0];
}

uint64_t __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v2) {
    v2 = (void *)v2[16];
  }
  v3 = v2;
  [v3 setAlpha:1.0];

  v4 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v4) {
    v4 = (void *)v4[15];
  }
  v5 = v4;
  [v5 setAlpha:1.0];

  v6 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v6) {
    v6 = (void *)v6[29];
  }
  v7 = v6;
  [v7 setAlpha:1.0];

  v8 = *(void **)(a1 + 40);
  return [v8 setAlpha:1.0];
}

uint64_t __58___UINavigationBarTransitionContextDismissSearch_complete__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) layoutIfNeeded];
}

@end