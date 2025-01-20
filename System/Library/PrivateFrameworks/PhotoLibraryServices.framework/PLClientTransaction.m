@interface PLClientTransaction
@end

@implementation PLClientTransaction

void __43___PLClientTransaction_completeTransaction__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 64);
  if ((v3 & 0x80000000) == 0)
  {
    flock(*(_DWORD *)(v2 + 64), 8);
    close(v3);
    *(_DWORD *)(*(void *)(a1 + 32) + 64) = -1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 80));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    dispatch_semaphore_signal(v5);

    v6 = (id *)(*(void *)(a1 + 32) + 80);
    objc_storeWeak(v6, 0);
  }
}

uint64_t __49___PLClientTransaction_persistTransactionScopes___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(*(void *)(a1 + 32) + 64);
  if ((result & 0x80000000) == 0)
  {
    pwrite(result, (const void *)(a1 + 40), 8uLL, 0);
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 64);
    return fsync(v3);
  }
  return result;
}

void __44___PLClientTransaction__fdResourceSemaphore__block_invoke()
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    dispatch_semaphore_t v0 = dispatch_semaphore_create(16);
    v1 = (void *)_fdResourceSemaphore_fdResourceSem;
    _fdResourceSemaphore_fdResourceSem = (uint64_t)v0;
  }
}

void __41___PLClientTransaction__fdIsolationQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("PLClientServerTransactions.fdIsolationQueue", 0);
  v1 = (void *)_fdIsolationQueue_sQueue;
  _fdIsolationQueue_sQueue = (uint64_t)v0;
}

void __31___PLClientTransaction_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 64);
  if ((v3 & 0x80000000) == 0)
  {
    flock(*(_DWORD *)(v2 + 64), 8);
    close(v3);
    *(_DWORD *)(*(void *)(a1 + 32) + 64) = -1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 80));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    dispatch_semaphore_signal(v5);

    v6 = (id *)(*(void *)(a1 + 32) + 80);
    objc_storeWeak(v6, 0);
  }
}

@end