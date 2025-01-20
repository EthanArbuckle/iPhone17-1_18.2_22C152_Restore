@interface UIHyperAsymmetricExtender
@end

@implementation UIHyperAsymmetricExtender

uint64_t __44___UIHyperAsymmetricExtender_initWithCoder___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44___UIHyperAsymmetricExtender_initWithCoder___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43___UIHyperAsymmetricExtender_copyWithZone___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _extentBeyondMinimum];
  [*(id *)(a1 + 32) _dimensions];
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __43___UIHyperAsymmetricExtender_copyWithZone___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _extentBeyondMaximum];
  [*(id *)(a1 + 32) _dimensions];
  return cblas_dcopy_NEWLAPACK();
}

@end