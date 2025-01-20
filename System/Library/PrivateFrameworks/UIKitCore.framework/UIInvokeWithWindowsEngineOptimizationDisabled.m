@interface UIInvokeWithWindowsEngineOptimizationDisabled
@end

@implementation UIInvokeWithWindowsEngineOptimizationDisabled

uint64_t ___UIInvokeWithWindowsEngineOptimizationDisabled_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) withAutomaticOptimizationDisabled:*(void *)(a1 + 40)];
}

@end