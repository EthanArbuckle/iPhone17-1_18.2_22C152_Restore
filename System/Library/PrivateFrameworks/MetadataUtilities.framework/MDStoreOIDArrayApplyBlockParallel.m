@interface MDStoreOIDArrayApplyBlockParallel
@end

@implementation MDStoreOIDArrayApplyBlockParallel

uint64_t ___MDStoreOIDArrayApplyBlockParallel_block_invoke(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v1();
}

@end