@interface UIView
@end

@implementation UIView

uint64_t __50__UIView_PGAdditions__PG_performWithoutAnimation___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] activate];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

uint64_t __61__UIView_PGAdditions__PG_performWithoutRetargetingAnimation___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] activate];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

uint64_t __85__UIView_PGAdditions__PG_animateUsingDefaultTimingWithOptions_animations_completion___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] activate];
  [MEMORY[0x1E4F39CF8] begin];
  v2 = (void *)MEMORY[0x1E4F39CF8];
  [*(id *)(a1 + 40) _currentAnimationDuration];
  objc_msgSend(v2, "setAnimationDuration:");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v3 = (void *)MEMORY[0x1E4F39CF8];

  return [v3 commit];
}

uint64_t __105__UIView_PGAdditions__PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity_animations_completion___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] activate];
  [MEMORY[0x1E4F39CF8] begin];
  v2 = (void *)MEMORY[0x1E4F39CF8];
  [*(id *)(a1 + 40) _currentAnimationDuration];
  objc_msgSend(v2, "setAnimationDuration:");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v3 = (void *)MEMORY[0x1E4F39CF8];

  return [v3 commit];
}

@end