@interface SBSALogDictionaryDescribable
@end

@implementation SBSALogDictionaryDescribable

uint64_t ___SBSALogDictionaryDescribable_block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) >= *(void *)(a1 + 40)) {
    v2 = @">";
  }
  else {
    v2 = @"; ";
  }
  return [a2 appendString:v2];
}

@end