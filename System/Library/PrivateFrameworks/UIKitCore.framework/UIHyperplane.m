@interface UIHyperplane
@end

@implementation UIHyperplane

uint64_t __30___UIHyperplane_copyWithZone___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _point];
  [*(id *)(a1 + 32) _dimensions];
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __30___UIHyperplane_copyWithZone___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _normal];
  [*(id *)(a1 + 32) _dimensions];
  return cblas_dcopy_NEWLAPACK();
}

@end