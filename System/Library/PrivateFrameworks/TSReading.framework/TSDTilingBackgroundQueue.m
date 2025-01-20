@interface TSDTilingBackgroundQueue
+ (BOOL)isHoldingReadLockFromBackgroundQueue;
+ (id)p_sharedLimitedQueue;
- (BOOL)isShuttingDown;
- (TSDTilingBackgroundQueue)init;
- (TSDTilingBackgroundQueue)initWithAccessController:(id)a3;
- (void)dealloc;
- (void)drainAndPerformSync:(id)a3;
- (void)p_readLock;
- (void)p_readUnlock;
- (void)performAsync:(id)a3;
- (void)setShuttingDown:(BOOL)a3;
- (void)shutdown;
@end

@implementation TSDTilingBackgroundQueue

+ (id)p_sharedLimitedQueue
{
  if (p_sharedLimitedQueue_onceToken != -1) {
    dispatch_once(&p_sharedLimitedQueue_onceToken, &__block_literal_global_195);
  }
  return (id)p_sharedLimitedQueue_sLimitedQueue;
}

TSDTilingLimitedQueue *__48__TSDTilingBackgroundQueue_p_sharedLimitedQueue__block_invoke()
{
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "processorCount");
  if (v0 <= 1) {
    unint64_t v1 = 1;
  }
  else {
    unint64_t v1 = v0;
  }
  if (v1 >= 0xC) {
    uint64_t v2 = 24;
  }
  else {
    uint64_t v2 = 2 * v1;
  }
  result = [[TSDTilingLimitedQueue alloc] initWithLimit:v2];
  p_sharedLimitedQueue_sLimitedQueue = (uint64_t)result;
  return result;
}

- (TSDTilingBackgroundQueue)init
{
  uint64_t v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDTilingBackgroundQueue init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 1466, @"-initWithAccessController: is the designated initializer");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"-initWithAccessController: is the designated initializer", "-[TSDTilingBackgroundQueue init]"), 0 reason userInfo]);
}

- (TSDTilingBackgroundQueue)initWithAccessController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDTilingBackgroundQueue;
  v4 = [(TSDTilingBackgroundQueue *)&v6 init];
  if (v4)
  {
    v4->mCanEnqueueReaders = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v4->mInFlightReaders = (OS_dispatch_group *)dispatch_group_create();
    v4->mAccessController = (TSKAccessController *)a3;
    v4->mReaderSpinLock._os_unfair_lock_opaque = 0;
    v4->mReadLockSignal = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  }
  __dmb(0xBu);
  return v4;
}

- (void)dealloc
{
  [(TSDTilingBackgroundQueue *)self shutdown];
  dispatch_release((dispatch_object_t)self->mCanEnqueueReaders);
  dispatch_release((dispatch_object_t)self->mInFlightReaders);
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingBackgroundQueue;
  [(TSDTilingBackgroundQueue *)&v3 dealloc];
}

- (void)shutdown
{
  int64_t mShutdownToken = self->mShutdownToken;
  p_int64_t mShutdownToken = &self->mShutdownToken;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__TSDTilingBackgroundQueue_shutdown__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  if (mShutdownToken != -1) {
    dispatch_once(p_mShutdownToken, block);
  }
}

uint64_t __36__TSDTilingBackgroundQueue_shutdown__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShuttingDown:1];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 drainAndPerformSync:&__block_literal_global_203];
}

- (void)performAsync:(id)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mCanEnqueueReaders, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_enter((dispatch_group_t)self->mInFlightReaders);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mCanEnqueueReaders);
  os_unfair_lock_lock(&self->mReaderSpinLock);
  unint64_t mReaderCount = self->mReaderCount;
  if (!mReaderCount)
  {
    [(TSDTilingBackgroundQueue *)self p_readLock];
    unint64_t mReaderCount = self->mReaderCount;
  }
  self->unint64_t mReaderCount = mReaderCount + 1;
  os_unfair_lock_unlock(&self->mReaderSpinLock);
  objc_super v6 = objc_msgSend((id)objc_opt_class(), "p_sharedLimitedQueue");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__TSDTilingBackgroundQueue_performAsync___block_invoke;
  v7[3] = &unk_2646B14B0;
  v7[4] = self;
  v7[5] = a3;
  [v6 performAsync:v7];
}

void __41__TSDTilingBackgroundQueue_performAsync___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  --*(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
  if (!*(void *)&v2[8]._os_unfair_lock_opaque)
  {
    [(os_unfair_lock_s *)v2 p_readUnlock];
    uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
  }
  objc_super v3 = v2 + 6;

  os_unfair_lock_unlock(v3);
}

- (void)drainAndPerformSync:(id)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mCanEnqueueReaders, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait((dispatch_group_t)self->mInFlightReaders, 0xFFFFFFFFFFFFFFFFLL);
  (*((void (**)(id))a3 + 2))(a3);
  mCanEnqueueReaders = self->mCanEnqueueReaders;

  dispatch_semaphore_signal(mCanEnqueueReaders);
}

- (void)p_readLock
{
  global_queue = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__TSDTilingBackgroundQueue_p_readLock__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __38__TSDTilingBackgroundQueue_p_readLock__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__TSDTilingBackgroundQueue_p_readLock__block_invoke_2;
  v4[3] = &unk_2646AF7B8;
  v4[4] = v1;
  return [v2 performRead:v4];
}

intptr_t __38__TSDTilingBackgroundQueue_p_readLock__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)p_readUnlock
{
}

+ (BOOL)isHoldingReadLockFromBackgroundQueue
{
  return dispatch_get_specific((const void *)TSDTilingBackgroundQueueSpecific) != 0;
}

- (BOOL)isShuttingDown
{
  return self->mShuttingDown;
}

- (void)setShuttingDown:(BOOL)a3
{
  self->mShuttingDown = a3;
}

@end