@interface SWURLSchemeTask
- (NSURLRequest)request;
- (SWLogger)logger;
- (SWURLSchemeTask)initWithTask:(id)a3 logger:(id)a4;
- (WKURLSchemeTask)task;
- (id)completionBlock;
- (void)didFailWithError:(id)a3;
- (void)didFinish;
- (void)didReceiveData:(id)a3;
- (void)didReceiveResponse:(id)a3;
- (void)onCompletion:(id)a3;
- (void)performBlockOnMainThread:(id)a3;
@end

@implementation SWURLSchemeTask

- (SWURLSchemeTask)initWithTask:(id)a3 logger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWURLSchemeTask;
  v9 = [(SWURLSchemeTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_task, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
  }

  return v10;
}

- (NSURLRequest)request
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__SWURLSchemeTask_request__block_invoke;
  v4[3] = &unk_2646FFB68;
  v4[4] = self;
  v4[5] = &v5;
  [(SWURLSchemeTask *)self performBlockOnMainThread:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSURLRequest *)v2;
}

uint64_t __26__SWURLSchemeTask_request__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) request];
  return MEMORY[0x270F9A758]();
}

- (void)didReceiveResponse:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  v6 = [NSString stringWithFormat:@"Received response for task %@", self];
  [(SWLogger *)logger log:v6];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SWURLSchemeTask_didReceiveResponse___block_invoke;
  v8[3] = &unk_2646FFB90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SWURLSchemeTask *)self performBlockOnMainThread:v8];
}

uint64_t __38__SWURLSchemeTask_didReceiveResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) didReceiveResponse:*(void *)(a1 + 40)];
}

- (void)didReceiveData:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  v6 = [NSString stringWithFormat:@"Received data (%li) for task %@", objc_msgSend(v4, "length"), self];
  [(SWLogger *)logger log:v6];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__SWURLSchemeTask_didReceiveData___block_invoke;
  v8[3] = &unk_2646FFB90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SWURLSchemeTask *)self performBlockOnMainThread:v8];
}

uint64_t __34__SWURLSchemeTask_didReceiveData___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) didReceiveData:*(void *)(a1 + 40)];
}

- (void)didFinish
{
  logger = self->_logger;
  id v4 = [NSString stringWithFormat:@"Finished task %@", self];
  [(SWLogger *)logger log:v4];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__SWURLSchemeTask_didFinish__block_invoke;
  v5[3] = &unk_2646FFBB8;
  v5[4] = self;
  [(SWURLSchemeTask *)self performBlockOnMainThread:v5];
}

uint64_t __28__SWURLSchemeTask_didFinish__block_invoke(uint64_t a1)
{
  id v6 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = [v6 didFinish];
  if (v6)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v4) {
      uint64_t v4 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v6);
    }
  }
  return MEMORY[0x270F9A758](v4);
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  id v6 = [NSString stringWithFormat:@"Failed task %@ with error %@", self, v4];
  [(SWLogger *)logger logError:v6];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__SWURLSchemeTask_didFailWithError___block_invoke;
  v8[3] = &unk_2646FFB90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SWURLSchemeTask *)self performBlockOnMainThread:v8];
}

uint64_t __36__SWURLSchemeTask_didFailWithError___block_invoke(uint64_t a1)
{
  id v6 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = [v6 didFailWithError:*(void *)(a1 + 40)];
  if (v6)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v4) {
      uint64_t v4 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v6);
    }
  }
  return MEMORY[0x270F9A758](v4);
}

- (void)performBlockOnMainThread:(id)a3
{
  v3 = (void *)MEMORY[0x263F08B88];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)onCompletion:(id)a3
{
}

- (WKURLSchemeTask)task
{
  return self->_task;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end