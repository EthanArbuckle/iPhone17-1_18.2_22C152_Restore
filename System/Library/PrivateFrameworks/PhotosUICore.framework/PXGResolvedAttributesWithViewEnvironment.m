@interface PXGResolvedAttributesWithViewEnvironment
@end

@implementation PXGResolvedAttributesWithViewEnvironment

void ___PXGResolvedAttributesWithViewEnvironment_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = PXGViewEnvironmentResolvedColor(*(void **)(a1 + 40), v5);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

@end