@interface MTOSTransaction
+ (id)transactionWithDescription:(id)a3;
+ (id)transactionWithDescription:(id)a3 timeout:(double)a4;
+ (id)transactionWithDescription:(id)a3 timeout:(double)a4 timeoutBlock:(id)a5;
- (MTOSTransaction)initWithDescription:(id)a3 timeout:(double)a4 timeoutBlock:(id)a5;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_transaction)transaction;
- (void)_cancel;
- (void)dealloc;
- (void)end;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MTOSTransaction

+ (id)transactionWithDescription:(id)a3
{
  return (id)[a1 transactionWithDescription:a3 timeout:5.0];
}

+ (id)transactionWithDescription:(id)a3 timeout:(double)a4
{
  return (id)[a1 transactionWithDescription:a3 timeout:&__block_literal_global_20 timeoutBlock:a4];
}

+ (id)transactionWithDescription:(id)a3 timeout:(double)a4 timeoutBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDescription:v8 timeout:v7 timeoutBlock:a4];

  return v9;
}

- (MTOSTransaction)initWithDescription:(id)a3 timeout:(double)a4 timeoutBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MTOSTransaction;
  id v10 = [(MTOSTransaction *)&v25 init];
  if (v10)
  {
    [v8 UTF8String];
    uint64_t v11 = os_transaction_create();
    v12 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MTOSTransaction.serial", 0);
    v14 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = v13;

    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v10 + 3));
    v16 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v15;

    objc_initWeak(&location, v10);
    v17 = *((void *)v10 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __60__MTOSTransaction_initWithDescription_timeout_timeoutBlock___block_invoke;
    handler[3] = &unk_1E5916770;
    objc_copyWeak(&v23, &location);
    id v22 = v9;
    dispatch_source_set_event_handler(v17, handler);
    v18 = *((void *)v10 + 2);
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v10 + 2));

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return (MTOSTransaction *)v10;
}

void __60__MTOSTransaction_initWithDescription_timeout_timeoutBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained transaction];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    [WeakRetained _cancel];
  }
}

- (void)end
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__MTOSTransaction_end__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __22__MTOSTransaction_end__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_cancel
{
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
  transaction = self->_transaction;
  self->_transaction = 0;

  v5 = self->_timer;
  self->_timer = 0;
}

- (void)dealloc
{
  [(MTOSTransaction *)self _cancel];
  v3.receiver = self;
  v3.super_class = (Class)MTOSTransaction;
  [(MTOSTransaction *)&v3 dealloc];
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
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
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end