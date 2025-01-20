@interface SFPersonCollectionViewMaximumSizeCategory
@end

@implementation SFPersonCollectionViewMaximumSizeCategory

void ___SFPersonCollectionViewMaximumSizeCategory_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  v3 = (void **)MEMORY[0x263F83420];
  if (v2 >= v1) {
    double v4 = v1;
  }
  else {
    double v4 = v2;
  }
  if (v4 > 320.0) {
    v3 = (void **)MEMORY[0x263F83418];
  }
  v5 = *v3;
  objc_storeStrong((id *)&_SFPersonCollectionViewMaximumSizeCategory_maxCategory, v5);
}

@end