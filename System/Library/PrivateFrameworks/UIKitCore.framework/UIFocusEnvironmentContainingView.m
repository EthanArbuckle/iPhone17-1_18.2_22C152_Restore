@interface UIFocusEnvironmentContainingView
@end

@implementation UIFocusEnvironmentContainingView

void ___UIFocusEnvironmentContainingView_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (_IsKindOfUIView((uint64_t)v6))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

@end