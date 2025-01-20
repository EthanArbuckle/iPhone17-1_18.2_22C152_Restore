@interface PLCacheMetricsCollectorClient
- (PLCacheMetricsCollectorClient)initWithAssetsdClient:(id)a3;
- (void)incrementImageCacheHitCount;
- (void)incrementImageCacheMissCount;
- (void)incrementVideoComplementCacheHitCount;
- (void)incrementVideoComplementCacheMissCount;
@end

@implementation PLCacheMetricsCollectorClient

- (void)incrementImageCacheHitCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (unsigned int *)_sharedRegion;
  atomic_fetch_add((atomic_uint *volatile)_sharedRegion, 1u);
  v3 = PLCacheMetricsCollectorGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = atomic_load(v2);
    uint64_t v5 = atomic_load(v2 + 1);
    uint64_t v6 = atomic_load(v2 + 2);
    uint64_t v7 = atomic_load(v2 + 3);
    int v8 = 134218752;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "incrementImageCacheHitCount, current stats: [%ld, %ld, %ld, %ld]", (uint8_t *)&v8, 0x2Au);
  }
}

- (PLCacheMetricsCollectorClient)initWithAssetsdClient:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLCacheMetricsCollectorClient;
  uint64_t v5 = [(PLCacheMetricsCollectorClient *)&v16 init];
  if (v5) {
    BOOL v6 = _sharedRegion == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
LABEL_12:
    __int16 v12 = v5;
    goto LABEL_13;
  }
  uint64_t v7 = mmap(0, 0x1000uLL, 3, 4097, 1207959552, 0);
  _sharedRegion = (uint64_t)v7;
  if (v7 != (void *)-1)
  {
    xpc_object_t v8 = xpc_shmem_create(v7, 0x1000uLL);
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F8BA40]) initWithXPCObject:v8];
    if (v4)
    {
      __int16 v10 = [v4 resourceAvailabilityClient];
      [v10 setSharedMemoryForCacheMetricsCollector:v9];
    }
    uint64_t v11 = PLCacheMetricsCollectorGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "PLCacheMetricsCollectorClient initialized for system Library", v15, 2u);
    }

    goto LABEL_12;
  }
  __int16 v14 = PLCacheMetricsCollectorGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Unable to allocate shared memory in PLCacheMetricsCollectorClient", v15, 2u);
  }

  __int16 v12 = 0;
LABEL_13:

  return v12;
}

- (void)incrementVideoComplementCacheMissCount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (unsigned int *)_sharedRegion;
  v3 = (unsigned int *)(_sharedRegion + 12);
  atomic_fetch_add((atomic_uint *volatile)(_sharedRegion + 12), 1u);
  id v4 = PLCacheMetricsCollectorGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = atomic_load(v2);
    uint64_t v6 = atomic_load(v2 + 1);
    uint64_t v7 = atomic_load(v2 + 2);
    uint64_t v8 = atomic_load(v3);
    int v9 = 134218752;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "incrementVideoComplementMissCount, updated stats: [%ld, %ld, %ld, %ld]", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)incrementVideoComplementCacheHitCount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (unsigned int *)_sharedRegion;
  v3 = (unsigned int *)(_sharedRegion + 8);
  atomic_fetch_add((atomic_uint *volatile)(_sharedRegion + 8), 1u);
  id v4 = PLCacheMetricsCollectorGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = atomic_load(v2);
    uint64_t v6 = atomic_load(v2 + 1);
    uint64_t v7 = atomic_load(v3);
    uint64_t v8 = atomic_load(v2 + 3);
    int v9 = 134218752;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "incrementVideoComplementHitCount, current stats: [%ld, %ld, %ld, %ld]", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)incrementImageCacheMissCount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (unsigned int *)_sharedRegion;
  v3 = (unsigned int *)(_sharedRegion + 4);
  atomic_fetch_add((atomic_uint *volatile)(_sharedRegion + 4), 1u);
  id v4 = PLCacheMetricsCollectorGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = atomic_load(v2);
    uint64_t v6 = atomic_load(v3);
    uint64_t v7 = atomic_load(v2 + 2);
    uint64_t v8 = atomic_load(v2 + 3);
    int v9 = 134218752;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "incrementImageCacheMissCount, current stats: [%ld, %ld, %ld, %ld]", (uint8_t *)&v9, 0x2Au);
  }
}

@end