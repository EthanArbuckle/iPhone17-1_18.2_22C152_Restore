@interface UIAlertControllerModernTVActionBackgroundView
@end

@implementation UIAlertControllerModernTVActionBackgroundView

uint64_t __65___UIAlertControllerModernTVActionBackgroundView_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) backgroundView];
  [v3 setBackgroundColor:v2];

  [*(id *)(a1 + 32) updateCompositingForHighlighted:*(unsigned __int8 *)(a1 + 56)];
  double v4 = *(double *)(a1 + 48);
  v5 = [*(id *)(a1 + 32) backgroundView];
  [v5 setAlpha:v4];

  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  return [v6 setShouldShowShadow:v7];
}

uint64_t __65___UIAlertControllerModernTVActionBackgroundView_setHighlighted___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end