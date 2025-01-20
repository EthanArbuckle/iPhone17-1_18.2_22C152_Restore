@interface PASQueueLock
@end

@implementation PASQueueLock

uint64_t __42___PASQueueLock_runAsyncWithLockAcquired___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

void *__57___PASQueueLock_runWithLockAcquired_shouldContinueBlock___block_invoke(void *result)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(result[5] + 8) + 32), 1u) & 1) == 0) {
    return (void *)(*(uint64_t (**)(void, void))(*(void *)(*(void *)(result[6] + 8) + 40) + 16))(*(void *)(*(void *)(result[6] + 8) + 40), *(void *)(result[4] + 16));
  }
  return result;
}

uint64_t __37___PASQueueLock_runWithLockAcquired___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

void __49___PASQueueLock_initWithGuardedData_serialQueue___block_invoke(uint64_t a1)
{
}

@end