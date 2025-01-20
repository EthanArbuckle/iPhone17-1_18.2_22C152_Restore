@interface UIButtonBarTargetAction
@end

@implementation UIButtonBarTargetAction

uint64_t __45___UIButtonBarTargetAction__invoke_forEvent___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) _triggerActionForEvent:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 _executeValidationHandler];
}

@end