@interface UIAlertControllerTVBackgroundView
@end

@implementation UIAlertControllerTVBackgroundView

uint64_t __53___UIAlertControllerTVBackgroundView_setHighlighted___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:*(double *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  return [v2 setShouldShowShadow:v3];
}

uint64_t __53___UIAlertControllerTVBackgroundView_setHighlighted___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49___UIAlertControllerTVBackgroundView_setPressed___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:*(double *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:*(double *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 419))
  {
    [*(id *)(v3 + 424) setShadowVerticalOffset:*(double *)(a1 + 64)];
    v4 = *(void **)(*(void *)(a1 + 32) + 424);
    double v5 = *(double *)(a1 + 72);
    return [v4 setShadowRadius:v5];
  }
  return result;
}

uint64_t __49___UIAlertControllerTVBackgroundView_setPressed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end