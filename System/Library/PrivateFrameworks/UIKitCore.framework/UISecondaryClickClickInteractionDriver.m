@interface UISecondaryClickClickInteractionDriver
@end

@implementation UISecondaryClickClickInteractionDriver

uint64_t __65___UISecondaryClickClickInteractionDriver__attemptSecondaryClick__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  if (a2 == 2)
  {
    v8 = *(void **)(result + 32);
    return [v8 cancelInteraction];
  }
  else if (!a2)
  {
    handleEvent(stateMachineSpec_7, *(void *)(*(void *)(result + 32) + 8), 0, *(void *)(result + 32), (uint64_t *)(*(void *)(result + 32) + 8));
    v3 = [*(id *)(v2 + 32) delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      v5 = [*(id *)(v2 + 32) delegate];
      v6 = *(void **)(v2 + 32);
      [v6 maximumEffectProgress];
      objc_msgSend(v5, "clickDriver:didUpdateHighlightProgress:", v6);
    }
    result = handleEvent(stateMachineSpec_7, *(void *)(*(void *)(v2 + 32) + 8), 1, *(void *)(v2 + 32), (uint64_t *)(*(void *)(v2 + 32) + 8));
    uint64_t v7 = *(void *)(v2 + 32);
    if (*(void *)(v7 + 8) == 3)
    {
      return handleEvent(stateMachineSpec_7, 3, 2, v7, (uint64_t *)(v7 + 8));
    }
  }
  return result;
}

@end