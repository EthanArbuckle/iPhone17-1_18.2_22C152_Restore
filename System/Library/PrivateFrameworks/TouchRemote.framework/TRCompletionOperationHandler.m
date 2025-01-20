@interface TRCompletionOperationHandler
- (TRCompletionOperationHandler)initWithCompletionHandler:(id)a3;
- (id)completionHandler;
- (void)_handleCompletionRequest:(id)a3 withResponseHandler:(id)a4;
- (void)registerMessageHandlersForSession:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation TRCompletionOperationHandler

- (TRCompletionOperationHandler)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRCompletionOperationHandler;
  v5 = [(TRCompletionOperationHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = (id)v6;
  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__TRCompletionOperationHandler_registerMessageHandlersForSession___block_invoke;
  v4[3] = &unk_264220738;
  v4[4] = self;
  id v3 = a3;
  [v3 setRequestHandler:v4 forRequestClass:objc_opt_class()];
}

uint64_t __66__TRCompletionOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCompletionRequest:a2 withResponseHandler:a3];
}

- (void)_handleCompletionRequest:(id)a3 withResponseHandler:(id)a4
{
  id v10 = a3;
  if (self->_completionHandler)
  {
    uint64_t v6 = (void (**)(id, void, TRSetupCompletionResponse *))a4;
    v7 = objc_alloc_init(TRSetupCompletionResponse);
    v6[2](v6, 0, v7);

    [v10 completedSuccessfully];
    [v10 errorCode];
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  else
  {
    v8 = (void *)MEMORY[0x263F087E8];
    objc_super v9 = (void (**)(id, TRSetupCompletionResponse *, void))a4;
    v7 = [v8 errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
    v9[2](v9, v7, 0);
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end