@interface OITSUReadWriteQueue
- (OITSUReadWriteQueue)initWithIdentifier:(id)a3;
- (void)dealloc;
- (void)performAsyncWrite:(id)a3;
- (void)performSyncRead:(id)a3;
- (void)performSyncWrite:(id)a3;
- (void)waitOnInFlightWriters;
@end

@implementation OITSUReadWriteQueue

- (OITSUReadWriteQueue)initWithIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OITSUReadWriteQueue;
  v3 = [(OITSUReadWriteQueue *)&v5 init];
  if (v3)
  {
    v3->mCanEnqueueReaders = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v3->mGlobalQueue = (OS_dispatch_queue *)dispatch_get_global_queue(0, 0);
    v3->mInFlightReaders = (OS_dispatch_group *)dispatch_group_create();
    v3->mInFlightWriters = (OS_dispatch_group *)dispatch_group_create();
  }
  return v3;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->mInFlightReaders);
  dispatch_release((dispatch_object_t)self->mCanEnqueueReaders);
  dispatch_release((dispatch_object_t)self->mInFlightWriters);
  v3.receiver = self;
  v3.super_class = (Class)OITSUReadWriteQueue;
  [(OITSUReadWriteQueue *)&v3 dealloc];
}

- (void)performSyncRead:(id)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mCanEnqueueReaders, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_enter((dispatch_group_t)self->mInFlightReaders);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mCanEnqueueReaders);
  (*((void (**)(id))a3 + 2))(a3);
  mInFlightReaders = self->mInFlightReaders;
  dispatch_group_leave(mInFlightReaders);
}

- (void)performAsyncWrite:(id)a3
{
  mInFlightWriters = self->mInFlightWriters;
  mGlobalQueue = self->mGlobalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__OITSUReadWriteQueue_performAsyncWrite___block_invoke;
  v5[3] = &unk_264D61078;
  v5[4] = self;
  v5[5] = a3;
  dispatch_group_async(mInFlightWriters, mGlobalQueue, v5);
}

intptr_t __41__OITSUReadWriteQueue_performAsyncWrite___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  return dispatch_semaphore_signal(v2);
}

- (void)performSyncWrite:(id)a3
{
  dispatch_group_enter((dispatch_group_t)self->mInFlightWriters);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mCanEnqueueReaders, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait((dispatch_group_t)self->mInFlightReaders, 0xFFFFFFFFFFFFFFFFLL);
  (*((void (**)(id))a3 + 2))(a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mCanEnqueueReaders);
  mInFlightWriters = self->mInFlightWriters;
  dispatch_group_leave(mInFlightWriters);
}

- (void)waitOnInFlightWriters
{
}

@end