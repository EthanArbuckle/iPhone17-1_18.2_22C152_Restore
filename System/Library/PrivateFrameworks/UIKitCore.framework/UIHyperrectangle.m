@interface UIHyperrectangle
@end

@implementation UIHyperrectangle

uint64_t __34___UIHyperrectangle_copyWithZone___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _minimumPoint];
  [*(id *)(a1 + 32) _dimensions];
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __34___UIHyperrectangle_copyWithZone___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _maximumPoint];
  [*(id *)(a1 + 32) _dimensions];
  return cblas_dcopy_NEWLAPACK();
}

@end