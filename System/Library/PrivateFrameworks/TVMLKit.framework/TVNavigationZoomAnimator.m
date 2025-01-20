@interface TVNavigationZoomAnimator
@end

@implementation TVNavigationZoomAnimator

uint64_t __47___TVNavigationZoomAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

uint64_t __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.5, 1.5);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 32) removeFromSuperview];
  CGAffineTransform v4 = [*(id *)(a1 + 32) layer];
  [v4 setShouldRasterize:0];
}

uint64_t __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  [v2 setShouldRasterize:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    CGAffineTransform v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

@end