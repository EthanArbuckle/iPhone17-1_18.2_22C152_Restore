@interface PLCacheDeleteClient
+ (BOOL)hasEntitlementsForCacheDelete;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_queryAvailableSpace;
- (CacheDeleteToken)currentCacheDeletePurgeToken;
- (NSByteCountFormatter)byteFormatter;
- (NSString)cacheDeleteVolume;
- (NSString)pathForVolume;
- (OS_dispatch_queue)cacheDeleteQueryQueue;
- (OS_dispatch_queue)callbackQueue;
- (PLCacheDeleteClient)initWithQoSClass:(unsigned int)a3 pathForVolume:(id)a4 callbackQueue:(id)a5;
- (void)_notifyDiskAvailabilityRequestCompletionHandler:(id)a3 withSuccess:(BOOL)a4 numBytesPurged:(int64_t)a5 additionalBytesRequired:(int64_t)a6 error:(id)a7;
- (void)cancelDiskSpaceAvailabilityRequest;
- (void)requestDiskSpaceAvailabilityOfSize:(int64_t)a3 completion:(id)a4;
- (void)setCurrentCacheDeletePurgeToken:(CacheDeleteToken *)a3;
@end

@implementation PLCacheDeleteClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byteFormatter, 0);
  objc_storeStrong((id *)&self->_pathForVolume, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_cacheDeleteQueryQueue, 0);
  objc_storeStrong((id *)&self->_cachedVolume, 0);
}

- (void)setCurrentCacheDeletePurgeToken:(CacheDeleteToken *)a3
{
  self->_currentCacheDeletePurgeToken = a3;
}

- (CacheDeleteToken)currentCacheDeletePurgeToken
{
  return self->_currentCacheDeletePurgeToken;
}

- (NSByteCountFormatter)byteFormatter
{
  return self->_byteFormatter;
}

- (NSString)pathForVolume
{
  return self->_pathForVolume;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (OS_dispatch_queue)cacheDeleteQueryQueue
{
  return self->_cacheDeleteQueryQueue;
}

- (void)cancelDiskSpaceAvailabilityRequest
{
  v3 = [(PLCacheDeleteClient *)self cacheDeleteQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PLCacheDeleteClient_cancelDiskSpaceAvailabilityRequest__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __57__PLCacheDeleteClient_cancelDiskSpaceAvailabilityRequest__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentCacheDeletePurgeToken];
  v3 = PLBackendGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Cancelling purge request", buf, 2u);
    }

    v5 = (const void *)[*(id *)(a1 + 32) currentCacheDeletePurgeToken];
    [*(id *)(a1 + 32) setCurrentCacheDeletePurgeToken:0];
    CacheDeleteCancelPurge();
    CFRelease(v5);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: No active purge request to cancel.", v6, 2u);
    }
  }
}

- (void)_notifyDiskAvailabilityRequestCompletionHandler:(id)a3 withSuccess:(BOOL)a4 numBytesPurged:(int64_t)a5 additionalBytesRequired:(int64_t)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v14 = [(PLCacheDeleteClient *)self currentCacheDeletePurgeToken];
  if (v14) {
    CFRelease(v14);
  }
  [(PLCacheDeleteClient *)self setCurrentCacheDeletePurgeToken:0];
  v15 = [(PLCacheDeleteClient *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__PLCacheDeleteClient__notifyDiskAvailabilityRequestCompletionHandler_withSuccess_numBytesPurged_additionalBytesRequired_error___block_invoke;
  block[3] = &unk_1E5862E58;
  BOOL v23 = a4;
  int64_t v21 = a5;
  int64_t v22 = a6;
  id v19 = v13;
  id v20 = v12;
  id v16 = v13;
  id v17 = v12;
  dispatch_async(v15, block);
}

uint64_t __128__PLCacheDeleteClient__notifyDiskAvailabilityRequestCompletionHandler_withSuccess_numBytesPurged_additionalBytesRequired_error___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1) {
    return (*(uint64_t (**)(void, void, void, void, void))(v1 + 16))(*(void *)(result + 40), *(unsigned __int8 *)(result + 64), *(void *)(result + 48), *(void *)(result + 56), *(void *)(result + 32));
  }
  return result;
}

- (void)requestDiskSpaceAvailabilityOfSize:(int64_t)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(PLCacheDeleteClient *)self byteFormatter];
    v9 = [v8 stringFromByteCount:a3];
    *(_DWORD *)buf = 138543362;
    id v16 = v9;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Ensuring availability of %{public}@ free space", buf, 0xCu);
  }
  v10 = [(PLCacheDeleteClient *)self cacheDeleteQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke;
  block[3] = &unk_1E5873370;
  void block[4] = self;
  id v13 = v6;
  int64_t v14 = a3;
  id v11 = v6;
  dispatch_async(v10, block);
}

void __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) currentCacheDeletePurgeToken])
  {
    uint64_t v2 = PLBackendGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "PLCacheDeleteClient: Attempting to make a purge request when we already have one active. Ignoring.", buf, 2u);
    }

    v3 = PLCacheDeleteClientError(2, @"A purge request is already active and hasn't been cancelled.");
    [*(id *)(a1 + 32) _notifyDiskAvailabilityRequestCompletionHandler:*(void *)(a1 + 40) withSuccess:0 numBytesPurged:0 additionalBytesRequired:0 error:v3];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) _queryAvailableSpace];
    uint64_t v6 = v5;
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Available space (MB):\n\tFree=%lld MB (%lld)\n\tPurgeable=%lld MB (%lld)", v4 / 0x100000, v4, v6 / 0x100000, v6);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Current disk state: %{public}@", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = v9 - v4;
    if (v9 <= v4)
    {
      v24 = PLBackendGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [*(id *)(a1 + 32) byteFormatter];
        v26 = [v25 stringFromByteCount:v4];
        v27 = [*(id *)(a1 + 32) byteFormatter];
        v28 = [v27 stringFromByteCount:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v26;
        __int16 v34 = 2114;
        v35 = v28;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Purging cache delete files not required, as there is enough free space (%{public}@) to cover the required disk space (%{public}@)", buf, 0x16u);
      }
      [*(id *)(a1 + 32) _notifyDiskAvailabilityRequestCompletionHandler:*(void *)(a1 + 40) withSuccess:1 numBytesPurged:0 additionalBytesRequired:0 error:0];
    }
    else
    {
      id v11 = PLBackendGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [*(id *)(a1 + 32) byteFormatter];
        id v13 = [v12 stringFromByteCount:v4];
        int64_t v14 = [*(id *)(a1 + 32) byteFormatter];
        v15 = [v14 stringFromByteCount:v10];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v34 = 2114;
        v35 = v15;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Since we have %{public}@ free already, requesting %{public}@ of purgeable space to be cleared...", buf, 0x16u);
      }
      id v16 = [*(id *)(a1 + 32) cacheDeleteVolume];
      v31[0] = @"CACHE_DELETE_VOLUME";
      v31[1] = @"CACHE_DELETE_URGENCY_LIMIT";
      v32[0] = v16;
      v32[1] = &unk_1EEBED0C8;
      v31[2] = @"CACHE_DELETE_AMOUNT";
      uint64_t v17 = [NSNumber numberWithLongLong:v10];
      v32[2] = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

      id v19 = PLBackendGetLog();
      os_signpost_id_t v20 = os_signpost_id_generate(v19);
      *(void *)buf = 0;
      mach_timebase_info((mach_timebase_info_t)buf);
      int64_t v21 = v19;
      int64_t v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)v30 = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PLCacheDeleteClientPurgeRequest", "", v30, 2u);
      }

      mach_absolute_time();
      CFAbsoluteTimeGetCurrent();
      id v29 = *(id *)(a1 + 40);
      BOOL v23 = v22;
      [*(id *)(a1 + 32) setCurrentCacheDeletePurgeToken:CacheDeletePurgeSpaceWithInfo()];
    }
  }
}

void __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = *(double *)(a1 + 56);
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = *(void *)(a1 + 64);
  unsigned int v9 = *(_DWORD *)(a1 + 96);
  unsigned int v8 = *(_DWORD *)(a1 + 100);
  uint64_t v10 = *(id *)(a1 + 32);
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PLCacheDeleteClientPurgeRequest", "", buf, 2u);
  }

  id v13 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "PLCacheDeleteClientPurgeRequest";
    __int16 v38 = 2048;
    double v39 = (float)((float)((float)((float)(v6 - v7) * (float)v9) / (float)v8) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  double v14 = Current - v5;
  double v15 = COERCE_DOUBLE(a2);
  uint64_t v16 = [*(id *)(a1 + 40) currentCacheDeletePurgeToken];
  double v17 = [*(id *)&v15 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
  v18 = [*(id *)&v15 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  uint64_t v19 = [v18 longLongValue];

  if (v16)
  {
    if (v17 == 0.0)
    {
      id v29 = [*(id *)(a1 + 40) cacheDeleteQueryQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke_69;
      block[3] = &unk_1E5862E08;
      void block[4] = *(void *)(a1 + 40);
      double v33 = v14;
      id v31 = *(id *)&v15;
      uint64_t v34 = v19;
      long long v35 = *(_OWORD *)(a1 + 80);
      id v32 = *(id *)(a1 + 48);
      dispatch_async(v29, block);
    }
    else
    {
      os_signpost_id_t v20 = PLBackendGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int64_t v21 = [*(id *)(a1 + 40) byteFormatter];
        int64_t v22 = [v21 stringFromByteCount:*(void *)(a1 + 80)];
        *(_DWORD *)buf = 138543618;
        v37 = v22;
        __int16 v38 = 2112;
        double v39 = v17;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "PLCacheDeleteClient: Encountered error requesting purge of %{public}@. Error string: \"%@\"", buf, 0x16u);
      }
      BOOL v23 = [NSString stringWithFormat:@"Encountered error in Cache Delete: %@", *(void *)&v17];
      v24 = PLCacheDeleteClientError(4, v23);

      [*(id *)(a1 + 40) _notifyDiskAvailabilityRequestCompletionHandler:*(void *)(a1 + 48) withSuccess:0 numBytesPurged:v19 additionalBytesRequired:*(void *)(a1 + 80) - v19 error:v24];
    }
  }
  else
  {
    v25 = PLBackendGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [*(id *)(a1 + 40) byteFormatter];
      v27 = [v26 stringFromByteCount:v19];
      *(_DWORD *)buf = 134218498;
      v37 = *(const char **)&v14;
      __int16 v38 = 2114;
      double v39 = v15;
      __int16 v40 = 2114;
      v41 = v27;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Purge cancelled (%.3f seconds) with results: %{public}@\n%{public}@ purged before cancellation.", buf, 0x20u);
    }
    v28 = PLCacheDeleteClientError(1, @"Purge request was cancelled.");
    [*(id *)(a1 + 40) _notifyDiskAvailabilityRequestCompletionHandler:*(void *)(a1 + 48) withSuccess:0 numBytesPurged:v19 additionalBytesRequired:*(void *)(a1 + 80) - v19 error:v28];
  }
}

void __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke_69(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _queryAvailableSpace];
  uint64_t v4 = v3;
  uint64_t v5 = [MEMORY[0x1E4F8B8D8] diskSpaceAvailableForUse];
  uint64_t v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void **)(a1 + 56);
    unsigned int v8 = *(void **)(a1 + 40);
    objc_msgSend(NSString, "stringWithFormat:", @"Available space (MB):\n\tFree=%lld MB (%lld)\n\tPurgeable=%lld MB (%lld)", v2 / 0x100000, v2, v4 / 0x100000, v4);
    unsigned int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 32) byteFormatter];
    id v11 = [v10 stringFromByteCount:v5];
    os_signpost_id_t v12 = [*(id *)(a1 + 32) byteFormatter];
    id v13 = [v12 stringFromByteCount:*(void *)(a1 + 64)];
    *(_DWORD *)buf = 134219010;
    __int16 v40 = v7;
    __int16 v41 = 2114;
    uint64_t v42 = v8;
    __int16 v43 = 2114;
    v44 = v9;
    __int16 v45 = 2114;
    v46 = v11;
    __int16 v47 = 2114;
    v48 = v13;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Purge completed (%.3f seconds) with results: %{public}@\n%{public}@\n%{public}@ free\n%{public}@ purged.", buf, 0x34u);
  }
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 80);
  double v17 = PLBackendGetLog();
  v18 = v17;
  if (v5 >= v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v38 = [*(id *)(a1 + 32) byteFormatter];
      v28 = [v38 stringFromByteCount:*(void *)(a1 + 72)];
      id v29 = [*(id *)(a1 + 32) byteFormatter];
      v30 = [v29 stringFromByteCount:*(void *)(a1 + 64)];
      if (v14 >= v15) {
        id v31 = @"YES";
      }
      else {
        id v31 = @"NO";
      }
      id v32 = [*(id *)(a1 + 32) byteFormatter];
      double v33 = [v32 stringFromByteCount:*(void *)(a1 + 80)];
      uint64_t v34 = [*(id *)(a1 + 32) byteFormatter];
      long long v35 = [v34 stringFromByteCount:v5];
      *(_DWORD *)buf = 138544642;
      __int16 v40 = v28;
      __int16 v41 = 2114;
      uint64_t v42 = v30;
      __int16 v43 = 2114;
      v44 = v31;
      __int16 v45 = 2114;
      v46 = v33;
      __int16 v47 = 2114;
      v48 = v35;
      __int16 v49 = 2114;
      v50 = @"YES";
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Purged enough bytes (requested=%{public}@, purged=%{public}@): %{public}@, Enough space now available (total needed: %{public}@, now available=%{public}@): %{public}@", buf, 0x3Eu);
    }
    [*(id *)(a1 + 32) _notifyDiskAvailabilityRequestCompletionHandler:*(void *)(a1 + 48) withSuccess:1 numBytesPurged:*(void *)(a1 + 64) additionalBytesRequired:0 error:0];
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v37 = [*(id *)(a1 + 32) byteFormatter];
      uint64_t v19 = [v37 stringFromByteCount:*(void *)(a1 + 64)];
      uint64_t v36 = [*(id *)(a1 + 32) byteFormatter];
      os_signpost_id_t v20 = [v36 stringFromByteCount:*(void *)(a1 + 72)];
      if (v14 >= v15) {
        int64_t v21 = @"YES";
      }
      else {
        int64_t v21 = @"NO";
      }
      int64_t v22 = [*(id *)(a1 + 32) byteFormatter];
      BOOL v23 = [v22 stringFromByteCount:v5];
      v24 = [*(id *)(a1 + 32) byteFormatter];
      v25 = [v24 stringFromByteCount:*(void *)(a1 + 80)];
      *(_DWORD *)buf = 138544642;
      __int16 v40 = v19;
      __int16 v41 = 2114;
      uint64_t v42 = v20;
      __int16 v43 = 2114;
      v44 = v21;
      __int16 v45 = 2114;
      v46 = v23;
      __int16 v47 = 2114;
      v48 = v25;
      __int16 v49 = 2114;
      v50 = @"NO";
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "PLCacheDeleteClient: Purged enough bytes (purged=%{public}@ requested=%{public}@): %{public}@, Enough space now available (available=%{public}@ total needed: %{public}@): %{public}@", buf, 0x3Eu);
    }
    uint64_t v26 = *(void *)(a1 + 80) - v5;
    v27 = PLCacheDeleteClientError(3, @"The requested disk space could not be satisfied with currently available (and purgeable) disk space.");
    [*(id *)(a1 + 32) _notifyDiskAvailabilityRequestCompletionHandler:*(void *)(a1 + 48) withSuccess:0 numBytesPurged:*(void *)(a1 + 64) additionalBytesRequired:v26 error:v27];
  }
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_queryAvailableSpace
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLCacheDeleteClient *)self cacheDeleteQueryQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(PLCacheDeleteClient *)self cacheDeleteVolume];
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    int64_t v22 = @"CACHE_DELETE_VOLUME";
    v23[0] = v4;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v6 = CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
    double v7 = CFAbsoluteTimeGetCurrent();
    unsigned int v8 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_FREESPACE"];
    uint64_t v9 = [v8 longLongValue];

    uint64_t v10 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_FSPURGEABLE"];
    uint64_t v11 = [v10 longLongValue];

    os_signpost_id_t v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Available space (MB):\n\tFree=%lld MB (%lld)\n\tPurgeable=%lld MB (%lld)", v9 / 0x100000, v9, v11 / 0x100000, v11);
      *(_DWORD *)buf = 134218498;
      double v17 = v7 - Current;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      __int16 v20 = 2112;
      int64_t v21 = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: queryAvailableSpace (%.3f seconds)\nCacheDeleteCopyItemizedPurgeableSpaceWithInfo: %@ \n%@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "PLCacheDeleteClient: queryAvailableSpace returning 0 available space because cacheDeleteVolume was nil", buf, 2u);
    }
    uint64_t v11 = 0;
    uint64_t v9 = 0;
  }

  int64_t v14 = v9;
  int64_t v15 = v11;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (NSString)cacheDeleteVolume
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  cachedVolume = self->_cachedVolume;
  if (!cachedVolume)
  {
    memset(&v12, 0, 512);
    if (statfs([(NSString *)self->_pathForVolume fileSystemRepresentation], &v12))
    {
      uint64_t v4 = PLBackendGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = __error();
        uint64_t v6 = strerror(*v5);
        int v10 = 136315138;
        uint64_t v11 = v6;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "statfs error: %s, Unable to get storage mount point.", (uint8_t *)&v10, 0xCu);
      }
    }
    double v7 = [NSString stringWithCString:v12.f_mntonname encoding:4];
    unsigned int v8 = self->_cachedVolume;
    self->_cachedVolume = v7;

    cachedVolume = self->_cachedVolume;
  }
  return cachedVolume;
}

- (PLCacheDeleteClient)initWithQoSClass:(unsigned int)a3 pathForVolume:(id)a4 callbackQueue:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  statfs v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLCacheDeleteClient.m", 110, @"Invalid parameter not satisfying: %@", @"pathForVolume" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  int64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PLCacheDeleteClient.m", 111, @"Invalid parameter not satisfying: %@", @"callbackQueue" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)PLCacheDeleteClient;
  uint64_t v13 = [(PLCacheDeleteClient *)&v22 init];
  if (v13)
  {
    int64_t v14 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.photos.CacheDeleteRequest", v14);
    cacheDeleteQueryQueue = v13->_cacheDeleteQueryQueue;
    v13->_cacheDeleteQueryQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_pathForVolume, a4);
    objc_storeStrong((id *)&v13->_callbackQueue, a5);
    double v17 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E4F28B68]);
    byteFormatter = v13->_byteFormatter;
    v13->_byteFormatter = v17;
  }
  return v13;
}

+ (BOOL)hasEntitlementsForCacheDelete
{
  if (hasEntitlementsForCacheDelete_onceToken != -1) {
    dispatch_once(&hasEntitlementsForCacheDelete_onceToken, &__block_literal_global_3309);
  }
  return hasEntitlementsForCacheDelete_hasEntitlements;
}

void __52__PLCacheDeleteClient_hasEntitlementsForCacheDelete__block_invoke()
{
  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v0)
  {
    uint64_t v1 = v0;
    id v3 = (id)SecTaskCopyValueForEntitlement(v0, @"com.apple.private.CacheDelete", 0);
    CFRelease(v1);
  }
  else
  {
    id v3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v3;
    if ([v2 containsObject:@"CLIENT_ENTITLEMENT"]
      && [v2 containsObject:@"PURGE_ENTITLEMENT"]
      && [v2 containsObject:@"ITEMIZED_PURGEABLE_ENTITLEMENT"]
      && [v2 containsObject:@"CANCEL_PURGE_ENTITLEMENT"])
    {
      hasEntitlementsForCacheDelete_hasEntitlements = 1;
    }
  }
}

@end