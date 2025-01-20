@interface UIStatusBarActivityView
@end

@implementation UIStatusBarActivityView

void __38___UIStatusBarActivityView_setIsSlow___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    int v3 = [*(id *)(*(void *)(a1 + 32) + 456) stopsAfterReversing];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 456);
    *(void *)(v4 + 456) = 0;

    if (v3)
    {
      v6 = *(void **)(a1 + 32);
      [v6 startAnimating];
    }
  }
}

void __38___UIStatusBarActivityView_setIsSlow___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = *(void **)(v2 + 456);
    *(void *)(v2 + 456) = 0;
  }
}

@end