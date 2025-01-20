@interface UINavigationBarTransitionContextCrossfade
@end

@implementation UINavigationBarTransitionContextCrossfade

void __65___UINavigationBarTransitionContextCrossfade__animateContentView__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 88) setContentHidden:1];
    id v2 = [*(id *)(*(void *)(a1 + 32) + 88) augmentedTitleView];
    [v2 _performNavigationBarTransition:2 willBeDisplayed:0];
  }
}

void __65___UINavigationBarTransitionContextCrossfade__animateContentView__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 96) setBackButtonHidden:0 titleLabelHidden:(*(unsigned __int16 *)(*(void *)(a1 + 32) + 160) >> 6) & 1 titleViewHidden:0 barsHidden:0];
    id v2 = [*(id *)(*(void *)(a1 + 32) + 96) augmentedTitleView];
    [v2 _performNavigationBarTransition:2 willBeDisplayed:1];
  }
}

uint64_t __68___UINavigationBarTransitionContextCrossfade__animateLargeTitleView__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(_WORD *)(v1 + 160) & 0x20) != 0) {
    return [*(id *)(v1 + 104) setContentHidden:1];
  }
  return result;
}

uint64_t __68___UINavigationBarTransitionContextCrossfade__animateLargeTitleView__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(_WORD *)(v1 + 160) & 0x40) != 0) {
    return [*(id *)(v1 + 112) setContentHidden:0];
  }
  return result;
}

void __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v1) {
    uint64_t v1 = (void *)v1[30];
  }
  id v2 = v1;
  [v2 setAlpha:0.0];
}

void __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v2) {
    id v2 = (void *)v2[30];
  }
  v3 = v2;
  [v3 setAlpha:1.0];

  double v4 = -[_UINavigationBarLayout searchBarLayoutFrame](*(void **)(*(void *)(a1 + 32) + 80));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v11) {
    v11 = (void *)v11[30];
  }
  v12 = v11;
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

void __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v1) {
    uint64_t v1 = (void *)v1[30];
  }
  id v2 = v1;
  [v2 setAlpha:0.0];
}

void __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v1) {
    uint64_t v1 = (void *)v1[30];
  }
  id v2 = v1;
  [v2 setAlpha:1.0];
}

uint64_t __108___UINavigationBarTransitionContextCrossfade__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

@end