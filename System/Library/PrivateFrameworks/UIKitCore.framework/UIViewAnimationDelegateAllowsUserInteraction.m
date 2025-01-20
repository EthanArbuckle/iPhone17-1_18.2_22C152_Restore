@interface UIViewAnimationDelegateAllowsUserInteraction
@end

@implementation UIViewAnimationDelegateAllowsUserInteraction

void ___UIViewAnimationDelegateAllowsUserInteraction_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  v6 = [*(id *)(a1 + 32) layer];
  v7 = [v6 animationForKey:v9];
  v8 = [v7 delegate];

  if (objc_opt_respondsToSelector()) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 _allowsUserInteraction];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v8 _allowsUserInteractionToCutOffEndOfAnimation])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = _UIViewLayerAnimationCanBeConsideredFinished(*(void **)(a1 + 32), v9);
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

@end