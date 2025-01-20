@interface UIHitTestGestureContainer
@end

@implementation UIHitTestGestureContainer

BOOL ___UIHitTestGestureContainer_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = (*(double (**)(void))(*(void *)(a1 + 48) + 16))();
  v9 = performHitTest(v4, a2, v5, v6, v7, v8, *(double *)(a1 + 64));
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  v11 = v9;
  if (!v9) {
    v11 = *(void **)(v10 + 40);
  }
  objc_storeStrong((id *)(v10 + 40), v11);

  return v9 != 0;
}

@end