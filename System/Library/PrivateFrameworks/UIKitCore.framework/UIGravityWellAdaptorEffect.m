@interface UIGravityWellAdaptorEffect
@end

@implementation UIGravityWellAdaptorEffect

void __44___UIGravityWellAdaptorEffect_endForHandOff__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) adaptedEffect];
  v2 = [*(id *)(a1 + 32) adaptorInteraction];
  [v3 interaction:v2 didChangeWithContext:*(void *)(a1 + 40)];
}

void __45___UIGravityWellAdaptorEffect_addCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performAllCompletions];
}

@end