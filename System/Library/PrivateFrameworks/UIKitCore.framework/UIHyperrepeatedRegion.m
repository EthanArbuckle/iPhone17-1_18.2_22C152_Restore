@interface UIHyperrepeatedRegion
@end

@implementation UIHyperrepeatedRegion

void *__39___UIHyperrepeatedRegion_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v4 = (const void *)[*(id *)(a1 + 32) _repetitions];
  size_t v5 = 8 * [*(id *)(a1 + 32) _dimensions];
  return memcpy(a2, v4, v5);
}

uint64_t __39___UIHyperrepeatedRegion_copyWithZone___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _offset];
  [*(id *)(a1 + 32) _dimensions];
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __39___UIHyperrepeatedRegion_copyWithZone___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _increment];
  [*(id *)(a1 + 32) _dimensions];
  return cblas_dcopy_NEWLAPACK();
}

@end