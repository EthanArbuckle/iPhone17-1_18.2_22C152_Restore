@interface TVNavigationCrossfadeAnimator
@end

@implementation TVNavigationCrossfadeAnimator

uint64_t __52___TVNavigationCrossfadeAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

uint64_t __136___TVNavigationCrossfadeAnimator__beginCrossfadeAnimationFromView_toView_containerView_delay_fadeOutFromView_removeFromView_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setAlpha:0.0];
  }
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __136___TVNavigationCrossfadeAnimator__beginCrossfadeAnimationFromView_toView_containerView_delay_fadeOutFromView_removeFromView_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) removeFromSuperview];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end