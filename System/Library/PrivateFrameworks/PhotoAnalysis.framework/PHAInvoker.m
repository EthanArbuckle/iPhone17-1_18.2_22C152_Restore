@interface PHAInvoker
- (PHAInvoker)initWithDelegate:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)handleInvocation:(id)a3 withTarget:(id)a4 service:(id)a5;
@end

@implementation PHAInvoker

- (void).cxx_destruct
{
}

- (void)handleInvocation:(id)a3 withTarget:(id)a4 service:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  NSStringFromSelector((SEL)[v10 selector]);
  id v11 = objc_claimAutoreleasedReturnValue();
  [v11 UTF8String];
  v12 = (void *)os_transaction_create();
  [v10 setTarget:v9];
  v13 = [[PHAServiceCancelableOperation alloc] initWithOperationId:0 invocation:v10];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__PHAInvoker_handleInvocation_withTarget_service___block_invoke;
  v16[3] = &unk_1E6918C50;
  id v17 = v12;
  id v14 = v12;
  [(PHAServiceCancelableOperation *)v13 addCompletionBlock:v16];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dispatchOperation:v13 toTarget:v9 service:v8];
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  id v11 = [v7 target];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = objc_msgSend(WeakRetained, "targetForOriginalTarget:connection:selector:", v11, v8, objc_msgSend(v7, "selector"));

  if (v10) {
    [(PHAInvoker *)self handleInvocation:v7 withTarget:v10 service:v11];
  }
  else {
    [v7 invoke];
  }
}

- (PHAInvoker)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHAInvoker;
  v5 = [(PHAInvoker *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

@end