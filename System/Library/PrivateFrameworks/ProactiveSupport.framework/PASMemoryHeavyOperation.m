@interface PASMemoryHeavyOperation
@end

@implementation PASMemoryHeavyOperation

uint64_t ___PASMemoryHeavyOperation_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = pthread_setspecific(_PASMemoryHeavyOperation_tlKey, (const void *)1);
  v3 = (void *)MEMORY[0x1A62450A0](v2);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  pthread_key_t v4 = _PASMemoryHeavyOperation_tlKey;

  return pthread_setspecific(v4, 0);
}

uint64_t ___PASMemoryHeavyOperation_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("_PASMemoryHeavyOperationLock-UI", 0);
  v1 = (void *)_PASMemoryHeavyOperation_uiQueue;
  _PASMemoryHeavyOperation_uiQueue = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("_PASMemoryHeavyOperationLock-Low", 0);
  v3 = (void *)_PASMemoryHeavyOperation_lowQueue;
  _PASMemoryHeavyOperation_lowQueue = (uint64_t)v2;

  return pthread_key_create((pthread_key_t *)&_PASMemoryHeavyOperation_tlKey, 0);
}

@end