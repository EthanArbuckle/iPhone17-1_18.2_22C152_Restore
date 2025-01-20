@interface ULQueueScheduler
- (OS_dispatch_queue)queue;
- (ULQueueScheduler)initWithQueue:(id)a3;
- (void)performAsyncBlock:(id)a3;
- (void)performSyncBlock:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ULQueueScheduler

- (ULQueueScheduler)initWithQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULQueueScheduler;
  v5 = [(ULQueueScheduler *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ULQueueScheduler *)v5 setQueue:v4];
  }

  return v6;
}

- (void)performAsyncBlock:(id)a3
{
  id v4 = a3;
  v5 = [(ULQueueScheduler *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ULQueueScheduler_performAsyncBlock___block_invoke;
  block[3] = &unk_2653FDF88;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __38__ULQueueScheduler_performAsyncBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performSyncBlock:(id)a3
{
  id v4 = a3;
  v5 = [(ULQueueScheduler *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ULQueueScheduler_performSyncBlock___block_invoke;
  block[3] = &unk_2653FDF88;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

uint64_t __37__ULQueueScheduler_performSyncBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end