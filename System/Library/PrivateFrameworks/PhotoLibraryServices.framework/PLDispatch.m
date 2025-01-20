@interface PLDispatch
@end

@implementation PLDispatch

void __PLDispatch_sync_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __PLDispatch_async_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end