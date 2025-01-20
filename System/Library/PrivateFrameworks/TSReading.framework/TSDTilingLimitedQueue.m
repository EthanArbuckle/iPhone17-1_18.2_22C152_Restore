@interface TSDTilingLimitedQueue
- (TSDTilingLimitedQueue)init;
- (TSDTilingLimitedQueue)initWithLimit:(unint64_t)a3;
- (void)dealloc;
- (void)performAsync:(id)a3;
@end

@implementation TSDTilingLimitedQueue

- (TSDTilingLimitedQueue)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDTilingLimitedQueue init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 1374, @"-initWithLimit: is the designated initializer");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"-initWithLimit: is the designated initializer", "-[TSDTilingLimitedQueue init]"), 0 reason userInfo]);
}

- (TSDTilingLimitedQueue)initWithLimit:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSDTilingLimitedQueue;
  v4 = [(TSDTilingLimitedQueue *)&v9 init];
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDTilingLimitedQueue initWithLimit:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 1382, @"Queue limit shoudl be at least one.");
      a3 = 1;
    }
    v4->mLimit = a3;
    v4->mManagerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.limitedqueue.manager", 0);
    v7 = dispatch_queue_create("com.apple.iwork.limitedqueue", MEMORY[0x263EF83A8]);
    v4->mTargetQueue = (OS_dispatch_queue *)v7;
    dispatch_queue_set_specific(v7, (const void *)TSDTilingBackgroundQueueSpecific, (void *)TSDTilingBackgroundQueueSpecific, 0);
    v4->mSpinLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }
  return v4;
}

- (void)dealloc
{
  dispatch_barrier_sync((dispatch_queue_t)self->mManagerQueue, &__block_literal_global_42);
  dispatch_release((dispatch_object_t)self->mManagerQueue);
  dispatch_release((dispatch_object_t)self->mTargetQueue);
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLimitedQueue;
  [(TSDTilingLimitedQueue *)&v3 dealloc];
}

- (void)performAsync:(id)a3
{
  mManagerQueue = self->mManagerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__TSDTilingLimitedQueue_performAsync___block_invoke;
  v4[3] = &unk_2646B1DC8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mManagerQueue, v4);
}

void __38__TSDTilingLimitedQueue_performAsync___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  ++*(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32) == *(void *)(v2 + 24))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 8));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v5[2] = __38__TSDTilingLimitedQueue_performAsync___block_invoke_2;
  v5[3] = &unk_2646B14B0;
  long long v6 = v3;
  dispatch_async(v4, v5);
}

void __38__TSDTilingLimitedQueue_performAsync___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  --*(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32) == *(void *)(v2 + 24) - 1)
  {
    dispatch_resume(*(dispatch_object_t *)(v2 + 8));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
}

@end