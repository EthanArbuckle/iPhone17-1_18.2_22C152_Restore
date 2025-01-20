@interface FCGetWebTokenOperation
- (FCGetWebTokenOperation)initWithEndpointConnection:(id)a3 completion:(id)a4;
- (FCNewsletterEndpointConnection)endpointConnection;
- (id)completion;
- (void)performOperation;
- (void)setCompletion:(id)a3;
- (void)setEndpointConnection:(id)a3;
@end

@implementation FCGetWebTokenOperation

- (FCGetWebTokenOperation)initWithEndpointConnection:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCGetWebTokenOperation;
  v9 = [(FCOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointConnection, a3);
    v11 = _Block_copy(v8);
    id completion = v10->_completion;
    v10->_id completion = v11;
  }
  return v10;
}

- (void)performOperation
{
  endpointConnection = self->_endpointConnection;
  v4 = dispatch_get_global_queue(-2, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__FCGetWebTokenOperation_performOperation__block_invoke;
  v5[3] = &unk_1E5B55FE8;
  v5[4] = self;
  [(FCNewsletterEndpointConnection *)endpointConnection getWebTokenWithCallbackQueue:v4 completion:v5];
}

void __42__FCGetWebTokenOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[47];
  id v8 = v5;
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
    id v5 = v8;
    v6 = *(void **)(a1 + 32);
  }
  [v6 finishedPerformingOperationWithError:v5];
}

- (FCNewsletterEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

@end