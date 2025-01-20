@interface PLConcurrencyLimiter
+ (BOOL)isRunningUnderLimiter;
+ (id)debugDescriptionOfEnqueuedBlocksOnQueue:(id)a3;
+ (id)sharedLimiter;
+ (void)configureListTrackingForDispatchQueue:(id)a3;
+ (void)reportBlockDequeuedOnQueue:(id)a3;
+ (void)reportBlockEnqueued:(id)a3 isNotifyBlock:(BOOL)a4 onQueue:(id)a5 forLibrary:(id)a6;
- (PLConcurrencyLimiter)init;
- (id)_nextQueueForQoS:(unsigned int)a3 libraryRole:(unint64_t)a4;
- (id)_queuesTrackingBlocks;
- (id)debugDescription;
- (id)sharedBackgroundQueue;
- (id)sharedUtilityQueue;
- (int64_t)maxConcurrency;
- (void)_async:(id)a3 identifyingBlock:(id)a4 libraryRole:(unint64_t)a5 libraryForTelemetry:(id)a6;
- (void)_callOutForQoS:(unsigned int)a3 fromQueue:(id)a4;
- (void)_sync:(id)a3 identifyingBlock:(id)a4 libraryRole:(unint64_t)a5 libraryForTelemetry:(id)a6;
- (void)_syncPerformBlockNotOnAnyQueue:(id)a3;
- (void)async:(id)a3 identifyingBlock:(id)a4 library:(id)a5;
- (void)asyncPerformOnContext:(id)a3 identifyingBlock:(id)a4 block:(id)a5;
- (void)dispatchAfterTime:(unint64_t)a3 library:(id)a4 block:(id)a5;
- (void)dispatchAsync:(id)a3 block:(id)a4;
- (void)groupNotify:(id)a3 queue:(id)a4 block:(id)a5;
- (void)sync:(id)a3 identifyingBlock:(id)a4 library:(id)a5;
@end

@implementation PLConcurrencyLimiter

+ (id)debugDescriptionOfEnqueuedBlocksOnQueue:(id)a3
{
  v3 = a3;
  specific = (os_unfair_lock_s *)dispatch_queue_get_specific(v3, (const void *)PLConcurrencyLimiterTrackingStatsKey);
  v20 = v3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"queue: %@, scheduled blocks (max: %d) with wait times:\n", v3, 20];
  lock = specific + 4;
  os_unfair_lock_lock(specific + 4);
  uint64_t v6 = *(void *)&specific->_os_unfair_lock_opaque;
  if (*(void *)&specific->_os_unfair_lock_opaque)
  {
    unsigned int v7 = 0;
    while (1)
    {
      [v5 appendString:@"{\n\t"];
      if (!v7) {
        [v5 appendString:@"[head] "];
      }
      int v8 = *(_DWORD *)(v6 + 24);
      if (v8 > 20)
      {
        switch(v8)
        {
          case 21:
            v9 = @"[DEF] ";
            goto LABEL_18;
          case 33:
            v9 = @"[UI] ";
            goto LABEL_18;
          case 25:
            v9 = @"[IN] ";
            goto LABEL_18;
        }
      }
      else
      {
        switch(v8)
        {
          case 0:
            v9 = @"[UNSPEC] ";
            goto LABEL_18;
          case 9:
            v9 = @"[BG] ";
            goto LABEL_18;
          case 17:
            v9 = @"[UT] ";
LABEL_18:
            [v5 appendString:v9];
            break;
        }
      }
      if (*(unsigned char *)(v6 + 28)) {
        [v5 appendString:@"[NOTIFY] "];
      }
      else {
        objc_msgSend(v5, "appendFormat:", @"[waiting %g s] ", (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(void *)(v6 + 16)) / 1000000000.0);
      }
      v10 = *(void **)(v6 + 32);
      if (v10)
      {
        v11 = [v10 managedObjectContext];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v13 = v12;
          [v11 lastResetTimestamp];
          [v5 appendFormat:@"(Moc age: %g sec) %@\n", v13 - v14, v11, lock];
        }
      }
      v15 = backtrace_symbols((void *const *)v6, 1);
      if (v15)
      {
        v16 = v15;
        objc_msgSend(v5, "appendFormat:", @"\t%s\n", *v15);
        free(v16);
      }
      [v5 appendString:@"}\n"];
      uint64_t v6 = *(void *)(v6 + 8);
      if (v6)
      {
        if (v7++ < 0x13) {
          continue;
        }
      }
      break;
    }
  }
  os_unfair_lock_unlock(lock);

  return v5;
}

+ (void)reportBlockDequeuedOnQueue:(id)a3
{
  specific = (os_unfair_lock_s *)dispatch_queue_get_specific((dispatch_queue_t)a3, (const void *)PLConcurrencyLimiterTrackingStatsKey);
  os_unfair_lock_lock(specific + 4);
  v4 = *(void **)&specific->_os_unfair_lock_opaque;
  uint64_t v5 = *(void *)&specific->_os_unfair_lock_opaque;
  if (!*(void *)&specific->_os_unfair_lock_opaque)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = [NSString stringWithUTF8String:"+[PLConcurrencyLimiter(Statistics) reportBlockDequeuedOnQueue:]"];
    [v8 handleFailureInFunction:v9 file:@"PLConcurrencyLimiter+Statistics.m" lineNumber:98 description:@"no head"];

    uint64_t v5 = *(void *)&specific->_os_unfair_lock_opaque;
  }
  if (v5 == *(void *)&specific[2]._os_unfair_lock_opaque)
  {
    *(void *)&specific->_os_unfair_lock_opaque = 0;
    *(void *)&specific[2]._os_unfair_lock_opaque = 0;
  }
  else
  {
    uint64_t v6 = v4[1];
    if (!v6)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = [NSString stringWithUTF8String:"+[PLConcurrencyLimiter(Statistics) reportBlockDequeuedOnQueue:]"];
      [v10 handleFailureInFunction:v11 file:@"PLConcurrencyLimiter+Statistics.m" lineNumber:108 description:@"head with no next"];
    }
    *(void *)&specific->_os_unfair_lock_opaque = v6;
  }
  unsigned int v7 = (void *)v4[4];
  v4[4] = 0;

  free(v4);
  os_unfair_lock_unlock(specific + 4);
}

+ (void)reportBlockEnqueued:(id)a3 isNotifyBlock:(BOOL)a4 onQueue:(id)a5 forLibrary:(id)a6
{
  v21 = a3;
  v9 = a5;
  id v10 = a6;
  specific = (char *)dispatch_queue_get_specific(v9, (const void *)PLConcurrencyLimiterTrackingStatsKey);
  if (!specific)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"+[PLConcurrencyLimiter(Statistics) reportBlockEnqueued:isNotifyBlock:onQueue:forLibrary:]"];
    [v17 handleFailureInFunction:v18 file:@"PLConcurrencyLimiter+Statistics.m" lineNumber:61 description:@"no stat struct."];
  }
  double v12 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A0040E2C296BEuLL);
  *(void *)double v12 = v21[2];
  *((void *)v12 + 2) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  *((_DWORD *)v12 + 6) = qos_class_self();
  *((unsigned char *)v12 + 28) = a4;
  if (v10) {
    objc_storeStrong((id *)v12 + 4, a6);
  }
  double v13 = (os_unfair_lock_s *)(specific + 16);
  os_unfair_lock_lock((os_unfair_lock_t)specific + 4);
  if (*(void *)specific)
  {
    uint64_t v16 = *((void *)specific + 1);
    double v14 = specific + 8;
    uint64_t v15 = v16;
    if (!v16)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"+[PLConcurrencyLimiter(Statistics) reportBlockEnqueued:isNotifyBlock:onQueue:forLibrary:]"];
      [v19 handleFailureInFunction:v20 file:@"PLConcurrencyLimiter+Statistics.m" lineNumber:82 description:@"no tail"];
    }
    *(void *)(v15 + 8) = v12;
  }
  else
  {
    *(void *)specific = v12;
    double v14 = specific + 8;
  }
  *double v14 = v12;
  os_unfair_lock_unlock(v13);
}

+ (void)configureListTrackingForDispatchQueue:(id)a3
{
  queue = a3;
  if (!queue)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"+[PLConcurrencyLimiter(Statistics) configureListTrackingForDispatchQueue:]"];
    [v4 handleFailureInFunction:v5 file:@"PLConcurrencyLimiter+Statistics.m" lineNumber:51 description:@"queue required."];
  }
  v3 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040EDCEB4C7uLL);
  v3[4] = 0;
  dispatch_queue_set_specific(queue, (const void *)PLConcurrencyLimiterTrackingStatsKey, v3, _PLConcurrencyLimiterQueueTrackingStatsDestructor);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedWorkloop, 0);
  objc_storeStrong((id *)&self->_sharedBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_sharedUtilityQueue, 0);
  objc_storeStrong((id *)&self->_exclusiveMomentsQueue, 0);
  objc_storeStrong((id *)&self->_highQOSAssetIngestQueue, 0);
  objc_storeStrong((id *)&self->_backgroundAndUtilityQueue, 0);
  objc_storeStrong((id *)&self->_userInitiatedQueueA, 0);
}

- (void)async:(id)a3 identifyingBlock:(id)a4 library:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[PLConcurrencyLimiter _async:identifyingBlock:libraryRole:libraryForTelemetry:](self, "_async:identifyingBlock:libraryRole:libraryForTelemetry:", v10, v9, [v8 role], v8);
}

- (void)sync:(id)a3 identifyingBlock:(id)a4 library:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[PLConcurrencyLimiter _sync:identifyingBlock:libraryRole:libraryForTelemetry:](self, "_sync:identifyingBlock:libraryRole:libraryForTelemetry:", v10, v9, [v8 role], v8);
}

- (void)groupNotify:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = qos_class_self();
  double v12 = [(PLConcurrencyLimiter *)self _nextQueueForQoS:v11 libraryRole:0];
  double v13 = [(PLConcurrencyLimiter *)self _callOutForQoS:v11 fromQueue:v12];
  [(id)objc_opt_class() reportBlockEnqueued:v9 isNotifyBlock:1 onQueue:v12 forLibrary:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PLConcurrencyLimiter_groupNotify_queue_block___block_invoke;
  block[3] = &unk_1E5873600;
  id v21 = v9;
  v22 = v13;
  id v18 = v8;
  v19 = self;
  id v20 = v12;
  double v14 = v12;
  id v15 = v9;
  id v16 = v8;
  dispatch_group_notify(v10, v14, block);
}

void __48__PLConcurrencyLimiter_groupNotify_queue_block___block_invoke(uint64_t a1)
{
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  v2 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  pthread_setspecific(_limiterDepthThreadKey_s_key, v2 + 1);
  v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PLConcurrencyLimiter_groupNotify_queue_block___block_invoke_2;
  block[3] = &unk_1E5870E88;
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v7 = v5;
  dispatch_sync(v3, block);
  _limiterDepthPop();
  [(id)objc_opt_class() reportBlockDequeuedOnQueue:*(void *)(a1 + 48)];
}

uint64_t __48__PLConcurrencyLimiter_groupNotify_queue_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))(*(void *)(a1 + 32));
}

- (void)dispatchAfterTime:(unint64_t)a3 library:(id)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = qos_class_self();
  uint64_t v11 = [v9 options];
  double v12 = -[PLConcurrencyLimiter _nextQueueForQoS:libraryRole:](self, "_nextQueueForQoS:libraryRole:", v10, [v11 libraryRole]);

  double v13 = [(PLConcurrencyLimiter *)self _callOutForQoS:v10 fromQueue:v12];
  [(id)objc_opt_class() reportBlockEnqueued:v8 isNotifyBlock:0 onQueue:v12 forLibrary:v9];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__PLConcurrencyLimiter_dispatchAfterTime_library_block___block_invoke;
  v16[3] = &unk_1E5873510;
  id v18 = v8;
  v19 = v13;
  v16[4] = self;
  id v17 = v12;
  double v14 = v12;
  id v15 = v8;
  dispatch_after(a3, v14, v16);
}

uint64_t __56__PLConcurrencyLimiter_dispatchAfterTime_library_block___block_invoke(uint64_t a1)
{
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  v2 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  pthread_setspecific(_limiterDepthThreadKey_s_key, v2 + 1);
  (*(void (**)(void))(a1 + 56))(*(void *)(a1 + 48));
  _limiterDepthPop();
  v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 reportBlockDequeuedOnQueue:v4];
}

- (void)dispatchAsync:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__PLConcurrencyLimiter_dispatchAsync_block___block_invoke;
  v10[3] = &unk_1E58742F0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PLConcurrencyLimiter *)self _async:v10 identifyingBlock:0 libraryRole:0 libraryForTelemetry:0];
}

void __44__PLConcurrencyLimiter_dispatchAsync_block___block_invoke(uint64_t a1)
{
}

- (void)asyncPerformOnContext:(id)a3 identifyingBlock:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = a4;
  double v13 = objc_msgSend(v11, "photoLibrary", v14, 3221225472, __69__PLConcurrencyLimiter_asyncPerformOnContext_identifyingBlock_block___block_invoke, &unk_1E58742F0);
  -[PLConcurrencyLimiter _async:identifyingBlock:libraryRole:libraryForTelemetry:](self, "_async:identifyingBlock:libraryRole:libraryForTelemetry:", &v14, v12, [v13 role], 0);
}

uint64_t __69__PLConcurrencyLimiter_asyncPerformOnContext_identifyingBlock_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBlockAndWait:*(void *)(a1 + 40)];
}

- (int64_t)maxConcurrency
{
  v2 = [(PLConcurrencyLimiter *)self _queuesTrackingBlocks];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)debugDescription
{
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"PLConcurrencyLimiter: \n"];
  uint64_t v4 = [(PLConcurrencyLimiter *)self _queuesTrackingBlocks];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PLConcurrencyLimiter_debugDescription__block_invoke;
  v8[3] = &unk_1E5870E60;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  [v4 enumerateObjectsWithOptions:2 usingBlock:v8];

  id v6 = v5;
  return v6;
}

void __40__PLConcurrencyLimiter_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [(id)objc_opt_class() debugDescriptionOfEnqueuedBlocksOnQueue:v3];

  [v2 appendString:v4];
}

- (id)sharedBackgroundQueue
{
  return self->_sharedBackgroundQueue;
}

- (id)sharedUtilityQueue
{
  return self->_sharedUtilityQueue;
}

- (PLConcurrencyLimiter)init
{
  v26.receiver = self;
  v26.super_class = (Class)PLConcurrencyLimiter;
  id v2 = [(PLConcurrencyLimiter *)&v26 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = pl_dispatch_queue_create_with_fallback_qos();
    id v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    [(id)objc_opt_class() configureListTrackingForDispatchQueue:*((void *)v2 + 1)];
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = pl_dispatch_queue_create_with_fallback_qos();
    id v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    [(id)objc_opt_class() configureListTrackingForDispatchQueue:*((void *)v2 + 2)];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = pl_dispatch_queue_create_with_fallback_qos();
    id v11 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v10;

    [(id)objc_opt_class() configureListTrackingForDispatchQueue:*((void *)v2 + 3)];
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = pl_dispatch_queue_create_with_fallback_qos();
    uint64_t v14 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v13;

    [(id)objc_opt_class() configureListTrackingForDispatchQueue:*((void *)v2 + 4)];
    dispatch_workloop_t v15 = dispatch_workloop_create("PLConcurrencyLimiter auxillary workloop");
    id v16 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v15;

    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2("PLConcurrencyLimiter auxillary UT", v18, *((dispatch_queue_t *)v2 + 7));
    id v20 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v19;

    id v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v23 = dispatch_queue_create_with_target_V2("PLConcurrencyLimiter auxillary BG", v22, *((dispatch_queue_t *)v2 + 7));
    v24 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v23;
  }
  return (PLConcurrencyLimiter *)v2;
}

- (void)_async:(id)a3 identifyingBlock:(id)a4 libraryRole:(unint64_t)a5 libraryForTelemetry:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = qos_class_self();
  uint64_t v14 = [(PLConcurrencyLimiter *)self _nextQueueForQoS:v13 libraryRole:a5];
  if (!v11) {
    id v11 = (id)MEMORY[0x19F38D650](v10);
  }
  dispatch_workloop_t v15 = [(PLConcurrencyLimiter *)self _callOutForQoS:v13 fromQueue:v14];
  [(id)objc_opt_class() reportBlockEnqueued:v11 isNotifyBlock:0 onQueue:v14 forLibrary:v12];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__PLConcurrencyLimiter__async_identifyingBlock_libraryRole_libraryForTelemetry___block_invoke;
  v18[3] = &unk_1E5873510;
  id v20 = v10;
  id v21 = v15;
  v18[4] = self;
  id v19 = v14;
  id v16 = v14;
  id v17 = v10;
  dispatch_async(v16, v18);
}

uint64_t __80__PLConcurrencyLimiter__async_identifyingBlock_libraryRole_libraryForTelemetry___block_invoke(uint64_t a1)
{
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  id v2 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  pthread_setspecific(_limiterDepthThreadKey_s_key, v2 + 1);
  (*(void (**)(void))(a1 + 56))(*(void *)(a1 + 48));
  _limiterDepthPop();
  id v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 reportBlockDequeuedOnQueue:v4];
}

- (void)_sync:(id)a3 identifyingBlock:(id)a4 libraryRole:(unint64_t)a5 libraryForTelemetry:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = qos_class_self();
  if ([(id)objc_opt_class() isRunningUnderLimiter])
  {
    [(PLConcurrencyLimiter *)self _syncPerformBlockNotOnAnyQueue:v10];
  }
  else
  {
    uint64_t v14 = [(PLConcurrencyLimiter *)self _nextQueueForQoS:v13 libraryRole:a5];
    if (!v11) {
      id v11 = (id)MEMORY[0x19F38D650](v10);
    }
    [(id)objc_opt_class() reportBlockEnqueued:v11 isNotifyBlock:0 onQueue:v14 forLibrary:v12];
    dispatch_workloop_t v15 = [(PLConcurrencyLimiter *)self _callOutForQoS:v13 fromQueue:v14];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __79__PLConcurrencyLimiter__sync_identifyingBlock_libraryRole_libraryForTelemetry___block_invoke;
    id v20 = &unk_1E58742F0;
    id v21 = v14;
    id v22 = v10;
    id v16 = v14;
    v15(&v17);
    objc_msgSend((id)objc_opt_class(), "reportBlockDequeuedOnQueue:", v16, v17, v18, v19, v20);
  }
}

uint64_t __79__PLConcurrencyLimiter__sync_identifyingBlock_libraryRole_libraryForTelemetry___block_invoke(uint64_t a1)
{
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  id v2 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  pthread_setspecific(_limiterDepthThreadKey_s_key, v2 + 1);
  dispatch_sync(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
  return _limiterDepthPop();
}

- (void)_syncPerformBlockNotOnAnyQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(PLConcurrencyLimiter *)self _callOutForQoS:qos_class_self() fromQueue:0];
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  id v6 = (char *)pthread_getspecific(_limiterDepthThreadKey_s_key);
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  pthread_setspecific(_limiterDepthThreadKey_s_key, v6 + 1);
  v5(v4);

  _limiterDepthPop();
}

- (id)_queuesTrackingBlocks
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  userInitiatedQueueA = self->_userInitiatedQueueA;
  long long v5 = *(_OWORD *)&self->_backgroundAndUtilityQueue;
  exclusiveMomentsQueue = self->_exclusiveMomentsQueue;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&userInitiatedQueueA count:4];
  return v2;
}

- (id)_nextQueueForQoS:(unsigned int)a3 libraryRole:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  long long v5 = self;
  if (!a4) {
    goto LABEL_6;
  }
  if (a4 == 1)
  {
    uint64_t v6 = 32;
    goto LABEL_10;
  }
  if (a4 != 2) {
    goto LABEL_11;
  }
  if (qos_class_self() != QOS_CLASS_USER_INITIATED)
  {
LABEL_6:
    HIDWORD(v8) = v4 - 9;
    LODWORD(v8) = v4 - 9;
    unsigned int v7 = v8 >> 3;
    if (v7 >= 4)
    {
      [(PLConcurrencyLimiter *)v5 _handleUnexpectedQoSClass:v4];
      uint64_t v6 = 16;
    }
    else
    {
      uint64_t v6 = qword_19BA9ECA8[v7];
    }
    goto LABEL_10;
  }
  uint64_t v6 = 24;
LABEL_10:
  self = (PLConcurrencyLimiter *)*(id *)((char *)&v5->super.isa + v6);
LABEL_11:
  return self;
}

- (void)_callOutForQoS:(unsigned int)a3 fromQueue:(id)a4
{
  uint64_t v6 = (OS_dispatch_queue *)a4;
  if (self->_highQOSAssetIngestQueue == v6
    && (qos_class_t v7 = qos_class_self(),
        unint64_t v8 = __PLQUEUE_DISPATCH_IS_CALLING_OUT_TO_HIGH_QOS_INGEST_BLOCK__,
        v7 == QOS_CLASS_USER_INITIATED)
    || (unint64_t v8 = __PLQUEUE_DISPATCH_IS_CALLING_OUT_TO_MOMENTS_BLOCK__, self->_exclusiveMomentsQueue == v6)
    || (HIDWORD(v10) = a3 - 9,
        LODWORD(v10) = a3 - 9,
        unsigned int v9 = v10 >> 2,
        unint64_t v8 = __PLQUEUE_DISPATCH_IS_CALLING_OUT_TO_UN_BLOCK__,
        v9 > 6))
  {
    id v11 = (uint64_t (*)())v8;
  }
  else
  {
    id v11 = off_1EEB2D728[v9];
  }

  return v11;
}

+ (BOOL)isRunningUnderLimiter
{
  if (_limiterDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_limiterDepthThreadKey_s_onceToken, &__block_literal_global_84);
  }
  return (uint64_t)pthread_getspecific(_limiterDepthThreadKey_s_key) > 0;
}

+ (id)sharedLimiter
{
  if (sharedLimiter_onceToken != -1) {
    dispatch_once(&sharedLimiter_onceToken, &__block_literal_global_89818);
  }
  id v2 = (void *)sharedLimiter_queueManager;
  return v2;
}

void __37__PLConcurrencyLimiter_sharedLimiter__block_invoke()
{
  v0 = objc_alloc_init(PLConcurrencyLimiter);
  v1 = (void *)sharedLimiter_queueManager;
  sharedLimiter_queueManager = (uint64_t)v0;
}

@end