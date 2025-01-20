@interface OITSUWidthLimitedQueue
- (OITSUWidthLimitedQueue)init;
- (OITSUWidthLimitedQueue)initWithLimit:(unint64_t)a3;
- (id)targetDispatchQueue;
- (void)dealloc;
- (void)performAsync:(id)a3;
- (void)performSync:(id)a3;
@end

@implementation OITSUWidthLimitedQueue

- (OITSUWidthLimitedQueue)init
{
  unint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "processorCount");
  if (v3 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  unint64_t v5 = 2 * v4;
  if (v5 >= 0x18) {
    uint64_t v6 = 24;
  }
  else {
    uint64_t v6 = v5;
  }
  return [(OITSUWidthLimitedQueue *)self initWithLimit:v6];
}

- (OITSUWidthLimitedQueue)initWithLimit:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OITSUWidthLimitedQueue;
  uint64_t v4 = [(OITSUWidthLimitedQueue *)&v8 init];
  if (v4)
  {
    if (a3)
    {
      if (a3 >> 31)
      {
        uint64_t v5 = [NSString stringWithUTF8String:"-[OITSUWidthLimitedQueue initWithLimit:]"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUWidthLimitedQueue.m"], 39, 0, "Out-of-bounds type assignment was clamped to max");
        +[OITSUAssertionHandler logBacktraceThrottled];
        LODWORD(a3) = 0x7FFFFFFF;
      }
    }
    else
    {
      uint64_t v6 = [NSString stringWithUTF8String:"-[OITSUWidthLimitedQueue initWithLimit:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUWidthLimitedQueue.m"], 36, 0, "Queue limit shoudl be at least one.");
      +[OITSUAssertionHandler logBacktraceThrottled];
      LODWORD(a3) = 1;
    }
    v4->mReaderCount = 0;
    v4->mLimit = a3;
    v4->mManagerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.limitedqueue.manager", 0);
    v4->mTargetQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.limitedqueue", MEMORY[0x263EF83A8]);
    v4->mUnfairLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }
  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->mManagerQueue);
  dispatch_release((dispatch_object_t)self->mTargetQueue);
  v3.receiver = self;
  v3.super_class = (Class)OITSUWidthLimitedQueue;
  [(OITSUWidthLimitedQueue *)&v3 dealloc];
}

- (void)performAsync:(id)a3
{
  mManagerQueue = self->mManagerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__OITSUWidthLimitedQueue_performAsync___block_invoke;
  v4[3] = &unk_264D61078;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mManagerQueue, v4);
}

void __39__OITSUWidthLimitedQueue_performAsync___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  ++*(_DWORD *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 8) == *(_DWORD *)(v2 + 12))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 16));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[2] = __39__OITSUWidthLimitedQueue_performAsync___block_invoke_2;
  v5[3] = &unk_264D61168;
  long long v6 = v3;
  dispatch_async(v4, v5);
}

void __39__OITSUWidthLimitedQueue_performAsync___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  --*(_DWORD *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 8) == *(_DWORD *)(v2 + 12) - 1)
  {
    dispatch_resume(*(dispatch_object_t *)(v2 + 16));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
}

- (void)performSync:(id)a3
{
  mManagerQueue = self->mManagerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__OITSUWidthLimitedQueue_performSync___block_invoke;
  v4[3] = &unk_264D61078;
  v4[4] = self;
  v4[5] = a3;
  dispatch_barrier_sync(mManagerQueue, v4);
}

void __38__OITSUWidthLimitedQueue_performSync___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  ++*(_DWORD *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 8) == *(_DWORD *)(v2 + 12))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 16));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[2] = __38__OITSUWidthLimitedQueue_performSync___block_invoke_2;
  v5[3] = &unk_264D61168;
  long long v6 = v3;
  dispatch_barrier_sync(v4, v5);
}

void __38__OITSUWidthLimitedQueue_performSync___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  --*(_DWORD *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 8) == *(_DWORD *)(v2 + 12) - 1)
  {
    dispatch_resume(*(dispatch_object_t *)(v2 + 16));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
}

- (id)targetDispatchQueue
{
  return self->mTargetQueue;
}

@end