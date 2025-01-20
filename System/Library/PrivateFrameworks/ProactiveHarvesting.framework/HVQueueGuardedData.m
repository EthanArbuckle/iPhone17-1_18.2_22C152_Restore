@interface HVQueueGuardedData
- (BMContentStream)diskStorage;
- (BMSource)diskStorageSource;
- (BOOL)diskStorageIsKnownToBeEmpty;
- (BOOL)isMemoryStorageFull;
- (HVQueueBookmark)bookmark;
- (NSMutableArray)memoryStorage;
- (NSMutableSet)dequeuedContentIdentifiers;
- (OS_dispatch_source)memoryStorageIdleSource;
- (OS_dispatch_source)memoryStorageSigtermSource;
- (OS_os_transaction)memoryStorageTransaction;
- (_PASBloomFilterForWriting)diskContentBloomFilter;
- (char)initWithBiomeStream:(__int16)a3 memoryLimit:(void *)a4 memoryStorageFlushCallback:;
- (signed)memoryStorageLimit;
- (unsigned)bloomFilterFalsePositives;
- (unsigned)bloomFilterHits;
- (unsigned)bloomFilterMisses;
- (unsigned)dequeuedCount;
- (unsigned)diskStorageEventCount;
- (unsigned)enqueuedCount;
- (void)dealloc;
- (void)setBloomFilterFalsePositives:(unsigned int)a3;
- (void)setBloomFilterHits:(unsigned int)a3;
- (void)setBloomFilterMisses:(unsigned int)a3;
- (void)setDequeuedCount:(unsigned int)a3;
- (void)setDiskContentBloomFilter:(id)a3;
- (void)setDiskStorageEventCount:(unsigned int)a3;
- (void)setDiskStorageIsKnownToBeEmpty:(BOOL)a3;
- (void)setDiskStorageSource:(id)a3;
- (void)setEnqueuedCount:(unsigned int)a3;
- (void)setMemoryStorageTransaction:(id)a3;
@end

@implementation HVQueueGuardedData

- (BOOL)diskStorageIsKnownToBeEmpty
{
  return self->_diskStorageIsKnownToBeEmpty;
}

- (NSMutableArray)memoryStorage
{
  return self->_memoryStorage;
}

- (_PASBloomFilterForWriting)diskContentBloomFilter
{
  return self->_diskContentBloomFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskContentBloomFilter, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_diskStorageSource, 0);
  objc_storeStrong((id *)&self->_diskStorage, 0);
  objc_storeStrong((id *)&self->_memoryStorageIdleSource, 0);
  objc_storeStrong((id *)&self->_memoryStorageSigtermSource, 0);
  objc_storeStrong((id *)&self->_memoryStorageTransaction, 0);
  objc_storeStrong((id *)&self->_memoryStorage, 0);

  objc_storeStrong((id *)&self->_dequeuedContentIdentifiers, 0);
}

- (void)setBloomFilterFalsePositives:(unsigned int)a3
{
  self->_bloomFilterFalsePositives = a3;
}

- (unsigned)bloomFilterFalsePositives
{
  return self->_bloomFilterFalsePositives;
}

- (void)setBloomFilterMisses:(unsigned int)a3
{
  self->_bloomFilterMisses = a3;
}

- (unsigned)bloomFilterMisses
{
  return self->_bloomFilterMisses;
}

- (void)setBloomFilterHits:(unsigned int)a3
{
  self->_bloomFilterHits = a3;
}

- (unsigned)bloomFilterHits
{
  return self->_bloomFilterHits;
}

- (void)setDequeuedCount:(unsigned int)a3
{
  self->_dequeuedCount = a3;
}

- (unsigned)dequeuedCount
{
  return self->_dequeuedCount;
}

- (void)setEnqueuedCount:(unsigned int)a3
{
  self->_enqueuedCount = a3;
}

- (unsigned)enqueuedCount
{
  return self->_enqueuedCount;
}

- (void)setDiskStorageIsKnownToBeEmpty:(BOOL)a3
{
  self->_diskStorageIsKnownToBeEmpty = a3;
}

- (void)setDiskStorageEventCount:(unsigned int)a3
{
  self->_diskStorageEventCount = a3;
}

- (unsigned)diskStorageEventCount
{
  return self->_diskStorageEventCount;
}

- (void)setDiskContentBloomFilter:(id)a3
{
}

- (HVQueueBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setDiskStorageSource:(id)a3
{
}

- (BMSource)diskStorageSource
{
  return self->_diskStorageSource;
}

- (BMContentStream)diskStorage
{
  return self->_diskStorage;
}

- (OS_dispatch_source)memoryStorageIdleSource
{
  return self->_memoryStorageIdleSource;
}

- (OS_dispatch_source)memoryStorageSigtermSource
{
  return self->_memoryStorageSigtermSource;
}

- (void)setMemoryStorageTransaction:(id)a3
{
}

- (OS_os_transaction)memoryStorageTransaction
{
  return self->_memoryStorageTransaction;
}

- (signed)memoryStorageLimit
{
  return self->_memoryStorageLimit;
}

- (NSMutableSet)dequeuedContentIdentifiers
{
  return self->_dequeuedContentIdentifiers;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_memoryStorage count])
  {
    v3 = hv_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = [(NSMutableArray *)self->_memoryStorage count];
      memoryStorage = self->_memoryStorage;
      *(_DWORD *)buf = 134218243;
      uint64_t v10 = v6;
      __int16 v11 = 2113;
      v12 = memoryStorage;
      _os_log_fault_impl(&dword_226C41000, v3, OS_LOG_TYPE_FAULT, "deallocating HVQueueGuardedData with %tu enqueued items (%{private}@) in memory!", buf, 0x16u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
  if (!self->_memoryStorageTransaction)
  {
    memoryStorageSigtermSource = self->_memoryStorageSigtermSource;
    if (memoryStorageSigtermSource) {
      dispatch_resume(memoryStorageSigtermSource);
    }
    memoryStorageIdleSource = self->_memoryStorageIdleSource;
    if (memoryStorageIdleSource) {
      dispatch_resume(memoryStorageIdleSource);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)HVQueueGuardedData;
  [(HVQueueGuardedData *)&v8 dealloc];
}

- (BOOL)isMemoryStorageFull
{
  return (self->_memoryStorageLimit & 0x80000000) == 0
      && [(NSMutableArray *)self->_memoryStorage count] >= (unint64_t)self->_memoryStorageLimit;
}

- (char)initWithBiomeStream:(__int16)a3 memoryLimit:(void *)a4 memoryStorageFlushCallback:
{
  id v8 = a2;
  id v9 = a4;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)HVQueueGuardedData;
    a1 = (char *)objc_msgSendSuper2(&v24, sel_init);
    if (a1)
    {
      uint64_t v10 = objc_opt_new();
      __int16 v11 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v10;

      uint64_t v12 = objc_opt_new();
      uint64_t v13 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v12;

      *((_WORD *)a1 + 5) = a3;
      objc_storeStrong((id *)a1 + 10, a2);
      uint64_t v14 = objc_opt_new();
      v15 = (void *)*((void *)a1 + 12);
      *((void *)a1 + 12) = v14;

      a1[8] = 0;
      *(void *)(a1 + 12) = 0;
      *(void *)(a1 + 28) = 0;
      *(void *)(a1 + 20) = 0;
      if (v8)
      {
        if (!v9)
        {
          v23 = [MEMORY[0x263F08690] currentHandler];
          [v23 handleFailureInMethod:sel_initWithBiomeStream_memoryLimit_memoryStorageFlushCallback_, a1, @"HVQueue.m", 139, @"Invalid parameter not satisfying: %@", @"memoryStorageFlushCallback != nil" object file lineNumber description];
        }
        if (initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasOnceToken2 != -1) {
          dispatch_once(&initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasOnceToken2, &__block_literal_global_1065);
        }
        v16 = (id)initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasExprOnceResult;
        dispatch_source_t v17 = dispatch_source_create(MEMORY[0x263EF83F0], 0xFuLL, 0, v16);
        v18 = (void *)*((void *)a1 + 8);
        *((void *)a1 + 8) = v17;

        dispatch_source_t v19 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v16);
        v20 = (void *)*((void *)a1 + 9);
        *((void *)a1 + 9) = v19;

        v21 = (void *)[v9 copy];
        dispatch_source_set_event_handler(*((dispatch_source_t *)a1 + 8), v21);
        dispatch_source_set_event_handler(*((dispatch_source_t *)a1 + 9), v21);
        dispatch_activate(*((dispatch_object_t *)a1 + 8));
        dispatch_activate(*((dispatch_object_t *)a1 + 9));
        dispatch_suspend(*((dispatch_object_t *)a1 + 8));
        dispatch_suspend(*((dispatch_object_t *)a1 + 9));

        id v9 = v21;
      }
    }
  }

  return a1;
}

void __81__HVQueueGuardedData_initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("HVQueueNotify", v1);

  v3 = (void *)initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasExprOnceResult;
  initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasExprOnceResult = (uint64_t)v2;
}

@end