@interface MDStoreOIDArrayApplyParallelFunction
@end

@implementation MDStoreOIDArrayApplyParallelFunction

uint64_t ___MDStoreOIDArrayApplyParallelFunction_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int16 *)(a1 + 80);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned int *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(unsigned int *)(a1 + 72);
  uint64_t v9 = *(unsigned int *)(a1 + 76);

  return v3(v8, v2, v4 + 8 * v5, v6, v7, v9);
}

@end