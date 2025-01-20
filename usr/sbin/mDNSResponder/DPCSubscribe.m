@interface DPCSubscribe
@end

@implementation DPCSubscribe

void ___DPCSubscribe_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v4, v5, v6, v7, v8, v9, v10, v11);
  if (a2 == 1)
  {
    _Querier_HandleSubscriberInvalidation(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    os_release(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
  else if (a2 == 2)
  {
    _Querier_ApplyUpdate(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }

  KQueueUnlock((uint64_t)"Subscriber event handler", v12, v13, v14, v15, v16, v17, v18);
}

@end