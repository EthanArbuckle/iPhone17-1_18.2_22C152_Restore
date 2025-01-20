@interface RECategoricalHistogram
@end

@implementation RECategoricalHistogram

uint64_t __53___RECategoricalHistogram_enumerateValuesUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) countForValue:a2];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

@end