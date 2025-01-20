@interface UIViewControllerNullAnimationTransitionCoordinator
@end

@implementation UIViewControllerNullAnimationTransitionCoordinator

uint64_t __90___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideCompletionsAfterCommit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runAlongsideCompletions];
}

void __79___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideCompletions__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

void __78___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideAnimations__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

@end