@interface UIView
@end

@implementation UIView

uint64_t __61__UIView_PhotoLibraryAdditions__pl_setHidden_delay_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __61__UIView_PhotoLibraryAdditions__pl_setHidden_delay_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alpha];
  if (v3 == *(double *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    return [v4 setHidden:v5];
  }
  return result;
}

@end