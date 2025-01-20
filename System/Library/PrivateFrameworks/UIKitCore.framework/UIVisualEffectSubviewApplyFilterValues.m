@interface UIVisualEffectSubviewApplyFilterValues
@end

@implementation UIVisualEffectSubviewApplyFilterValues

void ___UIVisualEffectSubviewApplyFilterValues_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  v5 = [*(id *)(a1 + 32) stringByAppendingString:a2];
  id v6 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v8) {
    id v7 = 0;
  }
  else {
    id v7 = v8;
  }
  [*(id *)(a1 + 40) setValue:v7 forKeyPath:v5];
}

@end