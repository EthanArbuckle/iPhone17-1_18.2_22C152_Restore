@interface UIGlintyStringView
@end

@implementation UIGlintyStringView

uint64_t __43___UIGlintyStringView_fadeOutWithDuration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) hide];
  v2 = *(void **)(a1 + 32);
  return [v2 hideBlur];
}

uint64_t __43___UIGlintyStringView_fadeOutWithDuration___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) glintyFadeOutAnimationDidStop];
  [*(id *)(a1 + 32) setShowing:0];
  [*(id *)(a1 + 32) setFading:0];
  v2 = *(void **)(a1 + 32);
  return [v2 stopAnimating];
}

uint64_t __42___UIGlintyStringView_fadeInWithDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) show];
}

uint64_t __42___UIGlintyStringView_fadeInWithDuration___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) glintyFadeInAnimationDidStop];
  [*(id *)(a1 + 32) setFading:0];
  v2 = *(void **)(a1 + 32);
  return [v2 updateBlurForHiddenRequesters];
}

uint64_t __37___UIGlintyStringView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateText];
}

@end