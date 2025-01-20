@interface VSFetchAllSupportedAppsOperation
- (NSOperationQueue)privateQueue;
- (VSFetchAllSupportedAppsOperation)init;
- (VSOptional)result;
- (void)executionDidBegin;
- (void)setPrivateQueue:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSFetchAllSupportedAppsOperation

- (VSFetchAllSupportedAppsOperation)init
{
  v11.receiver = self;
  v11.super_class = (Class)VSFetchAllSupportedAppsOperation;
  v2 = [(VSFetchAllSupportedAppsOperation *)&v11 init];
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    v4 = v2->_result;
    v2->_result = v3;

    v5 = (void *)MEMORY[0x263F08A48];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 queueWithName:v7];
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (NSOperationQueue *)v8;

    [(NSOperationQueue *)v2->_privateQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (void)executionDidBegin
{
  v3 = [(VSFetchAllSupportedAppsOperation *)self privateQueue];
  id v4 = objc_alloc_init(MEMORY[0x263F1E160]);
  [v4 setMethodName:*MEMORY[0x263F1E330]];
  [v4 setRequestType:1];
  v5 = (void *)[objc_alloc(MEMORY[0x263F1E168]) initWithRequest:v4];
  [v3 addOperation:v5];
  v6 = (void *)MEMORY[0x263F086D0];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  objc_super v11 = __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke;
  v12 = &unk_265076FD0;
  id v13 = v5;
  v14 = self;
  id v7 = v5;
  uint64_t v8 = [v6 blockOperationWithBlock:&v9];
  objc_msgSend(v8, "addDependency:", v7, v9, v10, v11, v12);
  [v3 addOperation:v8];
}

void __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08D50] valueTransformerForName:@"VSAMSChannelAppsResponseValueTransformer"];
  v3 = [*(id *)(a1 + 32) result];
  id v4 = [v3 forceUnwrapObject];
  v5 = [v2 transformedValue:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke_2;
  v7[3] = &unk_265077C48;
  uint64_t v8 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke_3;
  v6[3] = &unk_265076EB8;
  v6[4] = v8;
  [v5 unwrapObject:v7 error:v6];
  [*(id *)(a1 + 40) finishExecutionIfPossible];
}

void __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x263F1E250];
  id v4 = (void *)MEMORY[0x263F1E208];
  id v7 = [a2 allApps];
  v5 = [v4 failableWithObject:v7];
  v6 = [v3 optionalWithObject:v5];
  [v2 setResult:v6];
}

void __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x263F1E250];
  id v5 = [MEMORY[0x263F1E208] failableWithError:a2];
  id v4 = [v3 optionalWithObject:v5];
  [v2 setResult:v4];
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end