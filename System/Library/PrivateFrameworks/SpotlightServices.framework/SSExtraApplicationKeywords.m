@interface SSExtraApplicationKeywords
@end

@implementation SSExtraApplicationKeywords

__n128 __SSExtraApplicationKeywords_block_invoke(void *a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  uint64_t v4 = *(int *)(*(void *)(a1[4] + 8) + 24);
  if ((int)v4 <= 5)
  {
    *(void *)(a1[5] + 8 * v4) = a2;
    v5 = (__n128 *)(a1[6] + 24 * *(int *)(*(void *)(a1[4] + 8) + 24));
    __n128 result = *a4;
    v5[1].n128_u64[0] = a4[1].n128_u64[0];
    __n128 *v5 = result;
    ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  }
  return result;
}

@end