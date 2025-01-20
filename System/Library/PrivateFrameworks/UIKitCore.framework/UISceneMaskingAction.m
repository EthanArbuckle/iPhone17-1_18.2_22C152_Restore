@interface UISceneMaskingAction
@end

@implementation UISceneMaskingAction

void __70___UISceneMaskingAction_actionForBeginMaskingWithReason_continuation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 error];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

@end