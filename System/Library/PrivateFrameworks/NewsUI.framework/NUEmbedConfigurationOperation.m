@interface NUEmbedConfigurationOperation
- (FCFlintResourceManager)flintResourceManager;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (NUEmbedConfigurationOperation)initWithAppConfigManager:(id)a3 flintResourceManager:(id)a4;
- (NUEmbedConfigurationOperationResult)result;
- (id)completion;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setAppConfigurationManager:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setFlintResourceManager:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation NUEmbedConfigurationOperation

- (void)setCompletion:(id)a3
{
}

- (NUEmbedConfigurationOperation)initWithAppConfigManager:(id)a3 flintResourceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUEmbedConfigurationOperation;
  v9 = [(FCOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_flintResourceManager, a4);
  }

  return v10;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  v4 = [(NUEmbedConfigurationOperation *)self completion];

  if (v4)
  {
    v5 = [(NUEmbedConfigurationOperation *)self completion];
    v6 = [(NUEmbedConfigurationOperation *)self result];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (id)completion
{
  return self->_completion;
}

- (NUEmbedConfigurationOperationResult)result
{
  return self->_result;
}

void __49__NUEmbedConfigurationOperation_performOperation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  v5 = [a2 embedConfigurationAssetID];
  if (!v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __49__NUEmbedConfigurationOperation_performOperation__block_invoke_cold_1();
    }
    goto LABEL_7;
  }
  if (a3 || ([*(id *)(a1 + 32) isCancelled] & 1) != 0)
  {
LABEL_7:
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
    goto LABEL_8;
  }
  v6 = [*(id *)(a1 + 32) flintResourceManager];
  v19[0] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  uint64_t v8 = [*(id *)(a1 + 32) relativePriority];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __49__NUEmbedConfigurationOperation_performOperation__block_invoke_6;
  v16 = &unk_2645FF948;
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 32);
  id v17 = v10;
  uint64_t v18 = v11;
  objc_super v12 = [v6 fetchResourcesWithIdentifiers:v7 downloadAssets:1 relativePriority:v8 callBackQueue:v9 completionBlock:&v13];

  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v12, v13, v14, v15, v16);
LABEL_8:
}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

void __49__NUEmbedConfigurationOperation_performOperation__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  v5 = [a2 objectForKey:*(void *)(a1 + 32)];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 assetHandle];
    uint64_t v8 = [v7 filePath];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v8];
      id v10 = [[NUEmbedConfigurationOperationResult alloc] initWithData:v9 idenfifier:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) setResult:v10];

      [*(id *)(a1 + 40) finishedPerformingOperationWithError:0];
    }
    else
    {
      [*(id *)(a1 + 40) finishedPerformingOperationWithError:v11];
    }
  }
  else
  {
    [*(id *)(a1 + 40) finishedPerformingOperationWithError:v11];
  }
}

- (void)setResult:(id)a3
{
}

- (void)performOperation
{
  [(NUEmbedConfigurationOperation *)self qualityOfService];
  v3 = FCDispatchQueueForQualityOfService();
  v4 = [(NUEmbedConfigurationOperation *)self appConfigurationManager];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__NUEmbedConfigurationOperation_performOperation__block_invoke;
  v6[3] = &unk_2645FF970;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchAppConfigurationIfNeededWithCompletionQueue:v5 completion:v6];
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);

  objc_storeStrong(&self->_completion, 0);
}

- (void)setAppConfigurationManager:(id)a3
{
}

- (void)setFlintResourceManager:(id)a3
{
}

void __49__NUEmbedConfigurationOperation_performOperation__block_invoke_cold_1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"Expecting a resource identifier for the embed configuration"];
  int v1 = 136315906;
  v2 = "-[NUEmbedConfigurationOperation performOperation]_block_invoke";
  __int16 v3 = 2080;
  v4 = "NUEmbedConfigurationOperation.m";
  __int16 v5 = 1024;
  int v6 = 44;
  __int16 v7 = 2114;
  uint64_t v8 = v0;
  _os_log_error_impl(&dword_2221C5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end