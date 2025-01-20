@interface MRMediaRemoteGetDeviceUIDWithRetryIntervals
@end

@implementation MRMediaRemoteGetDeviceUIDWithRetryIntervals

void ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mediaremote.utility.getDeviceUIDWithRetry", v2);
  v1 = (void *)_MRMediaRemoteGetDeviceUIDWithRetryIntervals_workerQueue;
  _MRMediaRemoteGetDeviceUIDWithRetryIntervals_workerQueue = (uint64_t)v0;
}

uint64_t ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_405(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MRMediaRemoteCopyDeviceUID();
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_3;
    v9[3] = &unk_1E57D0DB8;
    id v11 = *(id *)(a1 + 48);
    id v10 = v2;
    dispatch_async(v3, v9);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    v5 = _MRLogForCategory(0);
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_2_cold_1((uint64_t *)(a1 + 56), a1, v6);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 40) count];
      v8 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
      *(_DWORD *)buf = 134218242;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[GetDeviceUIDWithRetry] Unable to getDeviceUID - will retry up to %ld times with intervals [%@]", buf, 0x16u);
    }
    _MRMediaRemoteGetDeviceUIDWithRetryIntervals(*(void *)(a1 + 40), *(void *)(a1 + 56) + 1, *(void *)(a1 + 32), *(void *)(a1 + 48));
  }
}

uint64_t ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_406(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _MRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[GetDeviceUIDWithRetry] Retrying to getDeviceUID - retry #%ld after %f seconds", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void ___MRMediaRemoteGetDeviceUIDWithRetryIntervals_block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = [*(id *)(a2 + 40) count];
  int v6 = 134218240;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "[GetDeviceUIDWithRetry] Unable to getDeviceUID - retry %ld of up to %ld", (uint8_t *)&v6, 0x16u);
}

@end