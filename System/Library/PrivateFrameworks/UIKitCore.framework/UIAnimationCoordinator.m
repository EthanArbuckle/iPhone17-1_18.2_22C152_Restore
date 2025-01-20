@interface UIAnimationCoordinator
@end

@implementation UIAnimationCoordinator

uint64_t __34___UIAnimationCoordinator_animate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

uint64_t __47___UIAnimationCoordinator_animateInteractively__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

uint64_t __45___UIAnimationCoordinator_animateTransition___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) _postInteractiveCompletionHandler];

  if (v2)
  {
    v3 = [*(id *)(*(void *)(a1 + 32) + 16) _postInteractiveCompletionHandler];
    v3[2]();

    [*(id *)(*(void *)(a1 + 32) + 16) _setPostInteractiveCompletionHandler:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) completeTransition:1];
  v4 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v4 _setAnimator:0];
}

uint64_t __45___UIAnimationCoordinator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 48);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v4 = *(void **)(v2 + 16);
  return objc_msgSend(v4, "__runAlongsideAnimations");
}

uint64_t __45___UIAnimationCoordinator_animateTransition___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) endDisablingInterfaceAutorotation];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

@end