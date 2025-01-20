@interface MRInvokeClientCallback
@end

@implementation MRInvokeClientCallback

uint64_t ___onClientQueue_MRInvokeClientCallback_block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void ___onClientQueue_MRInvokeClientCallback_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___onClientQueue_MRInvokeClientCallback_block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) startCachingContentItemUpdatesForItem:*(void *)(a1 + 40) forPendingRequest:*(void *)(a1 + 48)];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___onClientQueue_MRInvokeClientCallback_block_invoke_29;
  v8[3] = &unk_1E57D0DB8;
  v5 = *(NSObject **)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void ___onClientQueue_MRInvokeClientCallback_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) disarm])
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v4();
  }
  else if (a2 {
         || MRContentItemIsEmpty(*(void **)(a1 + 40))
  }
         || ([*(id *)(a1 + 48) includeArtwork] & 1) != 0)
  {
    v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      id v7 = MRContentItemCopyMinimalReadableDescription(*(void **)(a1 + 40));
      int v14 = 138543618;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueServiceClient] After completion playbackQueueRequest %{public}@ responded to asset request with item, but was ignored %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    v8 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = MRContentItemCopyMinimalReadableDescription(*(void **)(a1 + 40));
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueServiceClient] After completion playbackQueueRequest %{public}@ responded to asset request with item %{public}@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v13 = [*(id *)(a1 + 56) playerPath];
    MRMediaRemotePlaybackQueueDataSourceContentItemChangedWithRequestForPlayer(v11, v12, (uint64_t)v13);
  }
}

uint64_t ___onClientQueue_MRInvokeClientCallback_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void ___onClientQueue_MRInvokeClientCallback_block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_7();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_194F3C000, v1, OS_LOG_TYPE_ERROR, "[MRPlaybackQueueServiceClient] playbackQueueRequest %{public}@ responded to asset request with error %{public}@", v2, 0x16u);
}

@end