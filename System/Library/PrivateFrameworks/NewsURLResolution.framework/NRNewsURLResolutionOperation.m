@interface NRNewsURLResolutionOperation
- (BOOL)validateOperation;
- (NRNewsURLResolutionOperation)init;
- (NRNewsURLResolutionOperation)initWithNewsURL:(id)a3;
- (NSURL)newsURL;
- (NSURL)resultWebURL;
- (id)resolutionCompletion;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setResolutionCompletion:(id)a3;
- (void)setResultWebURL:(id)a3;
- (void)validateOperation;
@end

@implementation NRNewsURLResolutionOperation

- (NRNewsURLResolutionOperation)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NRNewsURLResolutionOperation init]";
    __int16 v9 = 2080;
    v10 = "NRNewsURLResolutionOperation.m";
    __int16 v11 = 1024;
    int v12 = 32;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_224EA7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NRNewsURLResolutionOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NRNewsURLResolutionOperation)initWithNewsURL:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NRNewsURLResolutionOperation initWithNewsURL:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)NRNewsURLResolutionOperation;
  v5 = [(FCOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    newsURL = v5->_newsURL;
    v5->_newsURL = (NSURL *)v6;
  }
  return v5;
}

- (BOOL)validateOperation
{
  v2 = [(NRNewsURLResolutionOperation *)self newsURL];

  if (!v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NRNewsURLResolutionOperation validateOperation]();
  }
  return v2 != 0;
}

- (void)performOperation
{
  v3 = [(NRNewsURLResolutionOperation *)self newsURL];
  if (objc_msgSend(v3, "nr_isNewsURL"))
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.newsd.url-resolution" options:0];
    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D848BC0];
    uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v5 setClasses:v6 forSelector:sel_resolveNewsURL_withCompletion_ argumentIndex:0 ofReply:1];

    [v4 setRemoteObjectInterface:v5];
    [v4 resume];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__NRNewsURLResolutionOperation_performOperation__block_invoke_2;
    v12[3] = &unk_264708BF8;
    v12[4] = self;
    id v7 = v4;
    id v13 = v7;
    v8 = [v7 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__NRNewsURLResolutionOperation_performOperation__block_invoke_3;
    v10[3] = &unk_264708C20;
    v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    [v8 resolveNewsURL:v3 withCompletion:v10];
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__NRNewsURLResolutionOperation_performOperation__block_invoke;
    v14[3] = &unk_264708BD0;
    v14[4] = self;
    __48__NRNewsURLResolutionOperation_performOperation__block_invoke((uint64_t)v14);
  }
}

void __48__NRNewsURLResolutionOperation_performOperation__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"NRErrorDomain" code:2 userInfo:0];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v2];
}

uint64_t __48__NRNewsURLResolutionOperation_performOperation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
  v3 = *(void **)(a1 + 40);
  return [v3 invalidate];
}

uint64_t __48__NRNewsURLResolutionOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResultWebURL:a2];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];

  id v7 = *(void **)(a1 + 40);
  return [v7 invalidate];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(NRNewsURLResolutionOperation *)self resolutionCompletion];

  if (v4)
  {
    v5 = [(NRNewsURLResolutionOperation *)self resolutionCompletion];
    id v6 = [(NRNewsURLResolutionOperation *)self resultWebURL];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (id)resolutionCompletion
{
  return self->_resolutionCompletion;
}

- (void)setResolutionCompletion:(id)a3
{
}

- (NSURL)newsURL
{
  return self->_newsURL;
}

- (NSURL)resultWebURL
{
  return self->_resultWebURL;
}

- (void)setResultWebURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultWebURL, 0);
  objc_storeStrong((id *)&self->_newsURL, 0);
  objc_storeStrong(&self->_resolutionCompletion, 0);
}

- (void)initWithNewsURL:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "newsURL != nil");
  *(_DWORD *)buf = 136315906;
  id v2 = "-[NRNewsURLResolutionOperation initWithNewsURL:]";
  __int16 v3 = 2080;
  id v4 = "NRNewsURLResolutionOperation.m";
  __int16 v5 = 1024;
  int v6 = 37;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_224EA7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)validateOperation
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"news url resolution operation requires URL"];
  int v1 = 136315906;
  id v2 = "-[NRNewsURLResolutionOperation validateOperation]";
  __int16 v3 = 2080;
  id v4 = "NRNewsURLResolutionOperation.m";
  __int16 v5 = 1024;
  int v6 = 53;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_224EA7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end