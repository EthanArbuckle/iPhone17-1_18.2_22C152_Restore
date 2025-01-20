@interface TVHeaderColumnView
@end

@implementation TVHeaderColumnView

void __37___TVHeaderColumnView_setLabelViews___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  v5 = [v7 superview];
  v6 = *(void **)(a1 + 32);

  if (v5 != v6) {
    [*(id *)(a1 + 32) insertSubview:v7 atIndex:a3];
  }
}

@end