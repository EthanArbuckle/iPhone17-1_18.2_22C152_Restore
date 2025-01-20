@interface NRWebURLResolutionOperation
- (BOOL)validateOperation;
- (NRBloomFilterInfoService)bloomFilterInfoService;
- (NRWebURLResolutionOperation)init;
- (NRWebURLResolutionOperation)initWithWebURL:(id)a3 bloomFilterInfoService:(id)a4;
- (NSURL)resultNewsURL;
- (NSURL)webURL;
- (id)resolutionCompletion;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setResolutionCompletion:(id)a3;
- (void)setResultNewsURL:(id)a3;
- (void)validateOperation;
@end

@implementation NRWebURLResolutionOperation

- (NRWebURLResolutionOperation)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NRWebURLResolutionOperation init]";
    __int16 v9 = 2080;
    v10 = "NRWebURLResolutionOperation.m";
    __int16 v11 = 1024;
    int v12 = 35;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_224EA7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NRWebURLResolutionOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NRWebURLResolutionOperation)initWithWebURL:(id)a3 bloomFilterInfoService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NRWebURLResolutionOperation initWithWebURL:bloomFilterInfoService:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NRWebURLResolutionOperation initWithWebURL:bloomFilterInfoService:]();
  }
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)NRWebURLResolutionOperation;
  v8 = [(FCOperation *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    webURL = v8->_webURL;
    v8->_webURL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_bloomFilterInfoService, a4);
  }

  return v8;
}

- (BOOL)validateOperation
{
  v3 = [(NRWebURLResolutionOperation *)self webURL];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NRWebURLResolutionOperation validateOperation]();
  }
  uint64_t v4 = [(NRWebURLResolutionOperation *)self bloomFilterInfoService];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NRWebURLResolutionOperation validateOperation]();
  }
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)performOperation
{
  v3 = [(NRWebURLResolutionOperation *)self webURL];
  if (objc_msgSend(v3, "nr_isWebURL"))
  {
    uint64_t v4 = [(NRWebURLResolutionOperation *)self bloomFilterInfoService];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__NRWebURLResolutionOperation_performOperation__block_invoke_2;
    v5[3] = &unk_264708C48;
    id v6 = v3;
    id v7 = self;
    [v4 fetchWebURLBloomFilterInfoWithCompletion:v5];
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__NRWebURLResolutionOperation_performOperation__block_invoke;
    v8[3] = &unk_264708BD0;
    v8[4] = self;
    __47__NRWebURLResolutionOperation_performOperation__block_invoke((uint64_t)v8);
  }
}

void __47__NRWebURLResolutionOperation_performOperation__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"NRErrorDomain" code:1 userInfo:0];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v2];
}

void __47__NRWebURLResolutionOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "fc_maybeContainsURL:", *(void *)(a1 + 32)))
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.newsd.url-resolution" options:0];
    uint64_t v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D848BC0];
    BOOL v5 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v4 setClasses:v5 forSelector:sel_resolveWebURL_withCompletion_ argumentIndex:0 ofReply:1];

    [v3 setRemoteObjectInterface:v4];
    [v3 resume];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__NRWebURLResolutionOperation_performOperation__block_invoke_4;
    v12[3] = &unk_264708BF8;
    v12[4] = *(void *)(a1 + 40);
    id v6 = v3;
    id v13 = v6;
    id v7 = [v6 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__NRWebURLResolutionOperation_performOperation__block_invoke_5;
    v10[3] = &unk_264708C20;
    uint64_t v8 = *(void *)(a1 + 32);
    v10[4] = *(void *)(a1 + 40);
    id v11 = v6;
    id v9 = v6;
    [v7 resolveWebURL:v8 withCompletion:v10];
  }
  else
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __47__NRWebURLResolutionOperation_performOperation__block_invoke_3;
    v17 = &unk_264708BD0;
    [*(id *)(a1 + 40) finishedPerformingOperationWithError:0];
  }
}

uint64_t __47__NRWebURLResolutionOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
}

uint64_t __47__NRWebURLResolutionOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
  v3 = *(void **)(a1 + 40);
  return [v3 invalidate];
}

uint64_t __47__NRWebURLResolutionOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResultNewsURL:a2];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];

  id v7 = *(void **)(a1 + 40);
  return [v7 invalidate];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(NRWebURLResolutionOperation *)self resolutionCompletion];

  if (v4)
  {
    BOOL v5 = [(NRWebURLResolutionOperation *)self resolutionCompletion];
    id v6 = [(NRWebURLResolutionOperation *)self resultNewsURL];
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

- (NSURL)webURL
{
  return self->_webURL;
}

- (NRBloomFilterInfoService)bloomFilterInfoService
{
  return self->_bloomFilterInfoService;
}

- (NSURL)resultNewsURL
{
  return self->_resultNewsURL;
}

- (void)setResultNewsURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultNewsURL, 0);
  objc_storeStrong((id *)&self->_bloomFilterInfoService, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong(&self->_resolutionCompletion, 0);
}

- (void)initWithWebURL:bloomFilterInfoService:.cold.1()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "bloomFilterInfoService != nil");
  int v2 = 136315906;
  v3 = "-[NRWebURLResolutionOperation initWithWebURL:bloomFilterInfoService:]";
  __int16 v4 = 2080;
  BOOL v5 = "NRWebURLResolutionOperation.m";
  __int16 v6 = 1024;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_224EA7000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);
}

- (void)initWithWebURL:bloomFilterInfoService:.cold.2()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "webURL != nil");
  int v2 = 136315906;
  v3 = "-[NRWebURLResolutionOperation initWithWebURL:bloomFilterInfoService:]";
  __int16 v4 = 2080;
  BOOL v5 = "NRWebURLResolutionOperation.m";
  __int16 v6 = 1024;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_224EA7000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);
}

- (void)validateOperation
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"web URL resolution operation requires URL"];
  int v2 = 136315906;
  v3 = "-[NRWebURLResolutionOperation validateOperation]";
  __int16 v4 = 2080;
  BOOL v5 = "NRWebURLResolutionOperation.m";
  __int16 v6 = 1024;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224EA7000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);
}

@end