@interface UISearchControllerView
@end

@implementation UISearchControllerView

void __53___UISearchControllerView__ensureViewOfClassIsOnTop___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_opt_isKindOfClass())
  {
    v8 = [*(id *)(a1 + 32) subviews];
    uint64_t v9 = [v8 count] - 1;

    if (v9 != a3)
    {
      v10.receiver = *(id *)(a1 + 32);
      v10.super_class = (Class)_UISearchControllerView;
      objc_msgSendSuper2(&v10, sel_bringSubviewToFront_, v7);
    }
    *a4 = 1;
  }
}

@end