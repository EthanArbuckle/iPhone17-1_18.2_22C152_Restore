@interface UIKeyboardTaskExecutionContext
- (UIKeyboardTaskExecutionContext)init;
- (UIKeyboardTaskExecutionContext)initWithExecutionQueue:(id)a3;
- (UIKeyboardTaskExecutionContext)initWithParentContext:(id)a3 continuation:(id)a4;
- (UIKeyboardTaskQueue)executionQueue;
- (id)childWithContinuation:(id)a3;
- (id)info;
- (id)takeOwnershipOfPendingCompletionBlock;
- (void)returnExecutionToParent;
- (void)returnExecutionToParentWithInfo:(id)a3;
- (void)setInfo:(id)a3;
- (void)setPendingCompletionBlock:(id)a3;
- (void)transferExecutionToMainThreadWithTask:(id)a3;
- (void)transferExecutionToMainThreadWithTask:(id)a3 breadcrumb:(id)a4;
@end

@implementation UIKeyboardTaskExecutionContext

- (UIKeyboardTaskExecutionContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardTaskExecutionContext;
  v3 = [(UIKeyboardTaskExecutionContext *)&v6 init];
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:v3 file:@"UIKeyboardTaskQueue.m" lineNumber:151 description:@"Only UIKeyboardTaskQueue may create UIKeyboardTaskExecutionContext instances."];

  return v3;
}

- (UIKeyboardTaskExecutionContext)initWithExecutionQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardTaskExecutionContext;
  objc_super v6 = [(UIKeyboardTaskExecutionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_executionQueue, a3);
  }

  return v7;
}

- (UIKeyboardTaskExecutionContext)initWithParentContext:(id)a3 continuation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIKeyboardTaskExecutionContext;
  objc_super v9 = [(UIKeyboardTaskExecutionContext *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v7 executionQueue];
    executionQueue = v9->_executionQueue;
    v9->_executionQueue = (UIKeyboardTaskQueue *)v10;

    objc_storeStrong((id *)&v9->_parentExecutionContext, a3);
    uint64_t v12 = [v8 copy];
    id continuation = v9->_continuation;
    v9->_id continuation = (id)v12;
  }
  return v9;
}

- (id)childWithContinuation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    objc_super v6 = _UIKeyboardTaskQueueLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[UIKeyboardTaskExecutionContext childWithContinuation:]";
      _os_log_error_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "%s should probably only be called from the main thread.", buf, 0xCu);
    }
  }
  id v7 = [(UIKeyboardTaskQueue *)self->_executionQueue executionContext];

  if (v7 != self)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardTaskQueue.m", 191, @"Received %s when not the current execution context.", "-[UIKeyboardTaskExecutionContext childWithContinuation:]");
  }
  id v8 = [[UIKeyboardTaskExecutionContext alloc] initWithParentContext:self continuation:v5];

  [(UIKeyboardTaskQueue *)self->_executionQueue setExecutionContext:v8];
  return v8;
}

- (void)returnExecutionToParent
{
  [(UIKeyboardTaskExecutionContext *)self returnExecutionToParentWithInfo:0];
}

- (void)returnExecutionToParentWithInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    objc_super v6 = _UIKeyboardTaskQueueLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v15 = "-[UIKeyboardTaskExecutionContext returnExecutionToParentWithInfo:]";
      _os_log_error_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "%s should probably only be called from the main thread.", buf, 0xCu);
    }
  }
  id v7 = [(UIKeyboardTaskQueue *)self->_executionQueue executionContext];

  if (v7 != self)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardTaskQueue.m", 210, @"Received %s when not the current execution context.", "-[UIKeyboardTaskExecutionContext returnExecutionToParentWithInfo:]");
  }
  parentExecutionContext = self->_parentExecutionContext;
  if (parentExecutionContext)
  {
    objc_super v9 = self;
    [(UIKeyboardTaskExecutionContext *)parentExecutionContext setInfo:v5];
    [(UIKeyboardTaskQueue *)self->_executionQueue setExecutionContext:self->_parentExecutionContext];
    (*((void (**)(void))v9->_continuation + 2))();
  }
  else
  {
    executionQueue = self->_executionQueue;
    v11 = self;
    [(UIKeyboardTaskQueue *)executionQueue finishExecution];
  }
  uint64_t v12 = self->_executionQueue;
  self->_executionQueue = 0;
}

- (void)transferExecutionToMainThreadWithTask:(id)a3
{
  id v4 = a3;
  _UIKeyboardTaskBreadcrumbEmpty();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIKeyboardTaskExecutionContext *)self transferExecutionToMainThreadWithTask:v4 breadcrumb:v5];
}

- (void)transferExecutionToMainThreadWithTask:(id)a3 breadcrumb:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  id v8 = [(UIKeyboardTaskQueue *)self->_executionQueue executionContext];

  if (v8 != self)
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardTaskQueue.m", 239, @"Received %s when not the current execution context.", "-[UIKeyboardTaskExecutionContext transferExecutionToMainThreadWithTask:breadcrumb:]");
  }
  [(UIKeyboardTaskQueue *)self->_executionQueue performTaskOnMainThread:v10 breadcrumb:v7 waitUntilDone:0];
}

- (void)setPendingCompletionBlock:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  id pendingCompletionBlock = v4->_pendingCompletionBlock;
  v4->_id pendingCompletionBlock = (id)v5;

  objc_sync_exit(v4);
}

- (id)takeOwnershipOfPendingCompletionBlock
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = _Block_copy(v2->_pendingCompletionBlock);
  id pendingCompletionBlock = v2->_pendingCompletionBlock;
  v2->_id pendingCompletionBlock = 0;

  objc_sync_exit(v2);
  uint64_t v5 = _Block_copy(v3);

  return v5;
}

- (id)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (UIKeyboardTaskQueue)executionQueue
{
  return self->_executionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong(&self->_info, 0);
  objc_storeStrong(&self->_pendingCompletionBlock, 0);
  objc_storeStrong(&self->_continuation, 0);
  objc_storeStrong((id *)&self->_parentExecutionContext, 0);
}

@end