@interface VMOperation
- (NSProgress)progress;
- (OS_dispatch_queue)queue;
- (VMOperation)init;
- (void)configureProgressWithUnitCount:(int64_t)a3;
- (void)performSynchronousBlock:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation VMOperation

- (VMOperation)init
{
  v15.receiver = self;
  v15.super_class = (Class)VMOperation;
  v2 = [(VMOperation *)&v15 init];
  if (v2)
  {
    v3 = NSString;
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 bundleIdentifier];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [v3 stringWithFormat:@"%@.%@", v5, v7];
    v9 = NSStringFromSelector(sel_queue);
    v10 = [v3 stringWithFormat:@"%@.%@", v8, v9];

    id v11 = v10;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;
  }
  return v2;
}

- (NSProgress)progress
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__VMOperation_progress__block_invoke;
  v4[3] = &unk_26441FC58;
  v4[4] = self;
  v4[5] = &v5;
  [(VMOperation *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSProgress *)v2;
}

void __23__VMOperation_progress__block_invoke(uint64_t a1)
{
}

- (void)configureProgressWithUnitCount:(int64_t)a3
{
  uint64_t v5 = [(VMOperation *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__VMOperation_configureProgressWithUnitCount___block_invoke;
  v6[3] = &unk_26441FC80;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __46__VMOperation_configureProgressWithUnitCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 248);
  *(void *)(v3 + 248) = v2;

  [*(id *)(*(void *)(a1 + 32) + 248) setCancellable:1];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 248);
  return [v5 setPausable:0];
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific((const void *)VMOperationDispatchQueueContextKey) == self)
  {
    v6 = (void (*)(void))*((void *)a3 + 2);
    uint64_t v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    uint64_t v7 = [(VMOperation *)self queue];
    dispatch_sync(v7, v5);
  }
}

- (void)setProgress:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end