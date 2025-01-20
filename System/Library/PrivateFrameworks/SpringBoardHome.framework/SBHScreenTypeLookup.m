@interface SBHScreenTypeLookup
@end

@implementation SBHScreenTypeLookup

uint64_t ___SBHScreenTypeLookup_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  SBHGetScreenSpecification(a2, (uint64_t)&v12);
  v10[0] = v12;
  v10[1] = v13;
  uint64_t v11 = v14;
  long long v6 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v6;
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t result = SBHScreenSpecificationEqualToScreenSpecification((uint64_t)v10, (uint64_t)v8);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end