@interface UIViewControllerTransitionContext
@end

@implementation UIViewControllerTransitionContext

uint64_t __62___UIViewControllerTransitionContext__runAlongsideCompletions__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) _setAlongsideCompletions:0];
}

uint64_t __62___UIViewControllerTransitionContext___runAlongsideAnimations__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) _setAlongsideAnimations:0];
}

uint64_t __62___UIViewControllerTransitionContext__interactivityDidChange___block_invoke(uint64_t a1)
{
  if (!dyld_program_sdk_at_least()
    || (uint64_t result = [*(id *)(a1 + 32) isInterruptible], (result & 1) == 0))
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 128);
    return [v3 _setInteractiveChangeHandlers:0];
  }
  return result;
}

uint64_t __62___UIViewControllerTransitionContext___runAlongsideAnimations__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) _setSystemAlongsideAnimations:0];
}

uint64_t __62___UIViewControllerTransitionContext__runInvalidationHandlers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) _setInvalidationHandlers:0];
}

@end