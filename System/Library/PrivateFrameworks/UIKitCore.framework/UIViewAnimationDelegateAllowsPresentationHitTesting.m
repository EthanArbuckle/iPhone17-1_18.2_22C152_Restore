@interface UIViewAnimationDelegateAllowsPresentationHitTesting
@end

@implementation UIViewAnimationDelegateAllowsPresentationHitTesting

void ___UIViewAnimationDelegateAllowsPresentationHitTesting_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 layer];
  v9 = [v8 animationForKey:v7];

  id v11 = [v9 delegate];

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v10 + 24)) {
    *(unsigned char *)(v10 + 24) = 1;
  }
  if (objc_opt_respondsToSelector()) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 _allowsHitTesting];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

@end