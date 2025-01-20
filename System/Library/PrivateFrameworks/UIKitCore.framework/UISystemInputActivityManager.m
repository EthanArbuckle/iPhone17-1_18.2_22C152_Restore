@interface UISystemInputActivityManager
@end

@implementation UISystemInputActivityManager

void __65___UISystemInputActivityManager_beginTrackingSystemInputActivity__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateClientSettingsSystemInputActive:0];
}

uint64_t __72___UISystemInputActivityManager__updateClientSettingsSystemInputActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSystemInputActive:*(unsigned __int8 *)(a1 + 32)];
}

@end