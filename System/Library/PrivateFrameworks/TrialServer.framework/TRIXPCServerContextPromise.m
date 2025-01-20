@interface TRIXPCServerContextPromise
- (OS_dispatch_queue)fullfillmentQueue;
- (TRIServerContext)serverContext;
- (TRITaskQueuing)taskQueue;
- (TRIXPCServerContextPromise)init;
- (void)addBlockToExecuteAfterPromiseFullfillment:(id)a3;
- (void)fullfillWithContext:(id)a3 taskQueue:(id)a4;
- (void)reject;
- (void)setFullfillmentQueue:(id)a3;
- (void)setServerContext:(id)a3;
- (void)setTaskQueue:(id)a3;
@end

@implementation TRIXPCServerContextPromise

- (TRIXPCServerContextPromise)init
{
  v9.receiver = self;
  v9.super_class = (Class)TRIXPCServerContextPromise;
  v2 = [(TRIXPCServerContextPromise *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93B18];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    id v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v5, "UTF8String"), 17);
    [(TRIXPCServerContextPromise *)v2 setFullfillmentQueue:v6];

    [(TRIXPCServerContextPromise *)v2 setServerContext:0];
    [(TRIXPCServerContextPromise *)v2 setTaskQueue:0];
    v7 = [(TRIXPCServerContextPromise *)v2 fullfillmentQueue];
    dispatch_suspend(v7);
  }
  return v2;
}

- (void)fullfillWithContext:(id)a3 taskQueue:(id)a4
{
  id v6 = a4;
  [(TRIXPCServerContextPromise *)self setServerContext:a3];
  [(TRIXPCServerContextPromise *)self setTaskQueue:v6];

  v7 = [(TRIXPCServerContextPromise *)self fullfillmentQueue];
  dispatch_resume(v7);
}

- (void)reject
{
  v2 = [(TRIXPCServerContextPromise *)self fullfillmentQueue];
  dispatch_resume(v2);
}

- (void)addBlockToExecuteAfterPromiseFullfillment:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __72__TRIXPCServerContextPromise_addBlockToExecuteAfterPromiseFullfillment___block_invoke;
  v11 = &unk_1E6BB82D0;
  v12 = self;
  id v13 = v4;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v8);
  v7 = [(TRIXPCServerContextPromise *)self fullfillmentQueue];
  dispatch_async(v7, v6);
}

void __72__TRIXPCServerContextPromise_addBlockToExecuteAfterPromiseFullfillment___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = TRILogCategory_Server();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = qos_class_self();
    _os_log_impl(&dword_1DA291000, v2, OS_LOG_TYPE_DEFAULT, "Running server context block with qos: %u", (uint8_t *)v6, 8u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) serverContext];
  id v5 = [*(id *)(a1 + 32) taskQueue];
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);
}

- (OS_dispatch_queue)fullfillmentQueue
{
  return self->_fullfillmentQueue;
}

- (void)setFullfillmentQueue:(id)a3
{
}

- (TRIServerContext)serverContext
{
  return self->_serverContext;
}

- (void)setServerContext:(id)a3
{
}

- (TRITaskQueuing)taskQueue
{
  return self->_taskQueue;
}

- (void)setTaskQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_serverContext, 0);
  objc_storeStrong((id *)&self->_fullfillmentQueue, 0);
}

@end