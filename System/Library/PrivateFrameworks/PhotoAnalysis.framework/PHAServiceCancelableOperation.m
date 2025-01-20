@interface PHAServiceCancelableOperation
+ (id)operationNotFoundError:(int64_t)a3;
- (BOOL)cancel;
- (BOOL)isCancelled;
- (NSInvocation)invocation;
- (PHAServiceCancelableOperation)initWithOperationId:(int64_t)a3 invocation:(id)a4;
- (PHAServiceOperationListener)delegate;
- (id)description;
- (id)operationCanceledError:(BOOL)a3;
- (id)progressBlock;
- (int64_t)operationId;
- (void)_startWork;
- (void)addCompletionBlock:(id)a3;
- (void)enqueueOnQueue:(id)a3;
- (void)setCancellationBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)waitForCompletion;
@end

@implementation PHAServiceCancelableOperation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);

  objc_storeStrong((id *)&self->_invocation, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PHAServiceOperationListener)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAServiceOperationListener *)WeakRetained;
}

- (NSInvocation)invocation
{
  return (NSInvocation *)objc_getProperty(self, a2, 8, 1);
}

- (void)waitForCompletion
{
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelRequested = v2->_cancelRequested;
  objc_sync_exit(v2);

  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [NSNumber numberWithInteger:v2->_operationId];
  v8 = NSStringFromSelector([(NSInvocation *)v2->_invocation selector]);
  v9 = [v4 stringWithFormat:@"<%@ %p>: operationId %@ canceled=%d SEL=%@", v6, v2, v7, cancelRequested, v8];

  return v9;
}

- (id)operationCanceledError:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v3 = 16;
  }
  else {
    uint64_t v3 = 18;
  }
  v4 = (void *)MEMORY[0x1E4F28C58];
  v9 = @"operationId";
  v5 = [NSNumber numberWithInteger:self->_operationId];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = objc_msgSend(v4, "pl_analysisErrorWithCode:userInfo:", v3, v6);

  return v7;
}

- (void)enqueueOnQueue:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PHAServiceCancelableOperation_enqueueOnQueue___block_invoke;
  block[3] = &unk_1E6918C50;
  block[4] = self;
  uint64_t v3 = a3;
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v3, v4);
}

uint64_t __48__PHAServiceCancelableOperation_enqueueOnQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWork];
}

- (void)_startWork
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 operationWillStart:self];
  }
  [(NSInvocation *)self->_invocation invoke];
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 operationDidFinish:self];
  }
  dispatch_group_leave((dispatch_group_t)self->_completionGroup);
  invocation = self->_invocation;
  self->_invocation = 0;
}

- (BOOL)isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelRequested = v2->_cancelRequested;
  objc_sync_exit(v2);

  return cancelRequested;
}

- (BOOL)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelRequested = v2->_cancelRequested;
  if (v2->_cancelRequested)
  {
    dispatch_block_t v4 = 0;
  }
  else
  {
    dispatch_block_t v4 = (void (**)(void))_Block_copy(v2->_cancellationBlock);
    id cancellationBlock = v2->_cancellationBlock;
    v2->_id cancellationBlock = 0;
  }
  v2->_BOOL cancelRequested = 1;
  objc_sync_exit(v2);

  if (v4) {
    v4[2](v4);
  }

  return !cancelRequested;
}

- (void)setProgressBlock:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  char v5 = _Block_copy(v4);

  id progressBlock = obj->_progressBlock;
  obj->_id progressBlock = v5;

  objc_sync_exit(obj);
}

- (id)progressBlock
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = _Block_copy(v2->_progressBlock);
  objc_sync_exit(v2);

  return v3;
}

- (void)setCancellationBlock:(id)a3
{
  aBlock = (void (**)(void))a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_cancelRequested)
  {
    objc_sync_exit(v4);

    aBlock[2]();
  }
  else
  {
    char v5 = _Block_copy(aBlock);
    id cancellationBlock = v4->_cancellationBlock;
    v4->_id cancellationBlock = v5;

    objc_sync_exit(v4);
  }
}

- (int64_t)operationId
{
  return self->_operationId;
}

- (void)addCompletionBlock:(id)a3
{
  completionGroup = self->_completionGroup;
  char v5 = dispatch_get_global_queue(17, 0);
  dispatch_group_notify(completionGroup, v5, a3);
}

- (PHAServiceCancelableOperation)initWithOperationId:(int64_t)a3 invocation:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHAServiceCancelableOperation;
  char v8 = [(PHAServiceCancelableOperation *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_invocation, a4);
    v9->_operationId = a3;
    dispatch_group_t v10 = dispatch_group_create();
    completionGroup = v9->_completionGroup;
    v9->_completionGroup = (OS_dispatch_group *)v10;

    dispatch_group_enter((dispatch_group_t)v9->_completionGroup);
  }

  return v9;
}

+ (id)operationNotFoundError:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  char v8 = @"operationId";
  id v4 = [NSNumber numberWithInteger:a3];
  v9[0] = v4;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = objc_msgSend(v3, "pl_analysisErrorWithCode:userInfo:", 19, v5);

  return v6;
}

@end