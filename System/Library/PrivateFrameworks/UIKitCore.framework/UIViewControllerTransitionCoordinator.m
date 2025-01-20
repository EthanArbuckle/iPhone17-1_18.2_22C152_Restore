@interface UIViewControllerTransitionCoordinator
@end

@implementation UIViewControllerTransitionCoordinator

void __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _systemAlongsideAnimations:1];
  }
  else {
  id v5 = [v3 _alongsideAnimations:1];
  }
  v4 = _Block_copy(*(const void **)(a1 + 40));
  [v5 addObject:v4];
}

uint64_t __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, WeakRetained);
}

@end