@interface VSIdentityProviderFetchAllFromStoreOperation
- (NSOperationQueue)privateQueue;
- (VSAuditToken)auditToken;
- (VSIdentityProviderFetchAllFromStoreOperation)init;
- (VSOptional)result;
- (void)cancel;
- (void)executionDidBegin;
- (void)setAuditToken:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSIdentityProviderFetchAllFromStoreOperation

- (VSIdentityProviderFetchAllFromStoreOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSIdentityProviderFetchAllFromStoreOperation;
  v2 = [(VSIdentityProviderFetchAllFromStoreOperation *)&v8 init];
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    v4 = v2->_result;
    v2->_result = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v5;

    [(NSOperationQueue *)v2->_privateQueue setName:@"VSIdentityProviderFetchAllFromStoreOperation"];
    [(NSOperationQueue *)v2->_privateQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (void)executionDidBegin
{
  v3 = [(VSIdentityProviderFetchAllFromStoreOperation *)self privateQueue];
  id v4 = objc_alloc_init(MEMORY[0x263F1E160]);
  [v4 setRequestType:0];
  [v4 setMethodName:*MEMORY[0x263F1E330]];
  v5 = [(VSIdentityProviderFetchAllFromStoreOperation *)self auditToken];
  [v4 setAuditToken:v5];

  v6 = (void *)[objc_alloc(MEMORY[0x263F1E168]) initWithRequest:v4];
  [v3 addOperation:v6];
  v7 = objc_alloc_init(VSFeaturedIdentityProviderLimitingOperation);
  objc_initWeak(&location, v7);
  objc_initWeak(&from, self);
  objc_super v8 = (void *)MEMORY[0x263F086D0];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke;
  v15 = &unk_265076DF0;
  id v9 = v6;
  id v16 = v9;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  id v10 = v3;
  id v17 = v10;
  v11 = [v8 blockOperationWithBlock:&v12];
  objc_msgSend(v11, "addDependency:", v9, v12, v13, v14, v15);
  [v10 addOperation:v11];
  [(VSFeaturedIdentityProviderLimitingOperation *)v7 addDependency:v11];
  [v10 addOperation:v7];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke(id *a1)
{
  v2 = [MEMORY[0x263F08D50] valueTransformerForName:@"VSAMSIdentityProviderResponseValueTransformer"];
  v3 = [a1[4] result];
  id v4 = [v3 forceUnwrapObject];
  v5 = [v2 transformedValue:v4];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_2;
  v8[3] = &unk_265076DC8;
  objc_copyWeak(&v10, a1 + 6);
  objc_copyWeak(&v11, a1 + 7);
  id v9 = a1[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_4;
  v6[3] = &unk_265076C58;
  objc_copyWeak(&v7, a1 + 7);
  [v5 unwrapObject:v8 error:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  [WeakRetained setUnlimitedIdentityProviders:v3];
  v5 = (void *)MEMORY[0x263F086D0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_3;
  id v11 = &unk_265076DA0;
  objc_copyWeak(&v13, a1 + 6);
  id v6 = WeakRetained;
  id v12 = v6;
  id v7 = [v5 blockOperationWithBlock:&v8];
  objc_msgSend(v7, "addDependency:", v6, v8, v9, v10, v11);
  [a1[4] addOperation:v7];

  objc_destroyWeak(&v13);
}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)MEMORY[0x263F1E250];
  id v3 = (void *)MEMORY[0x263F1E208];
  id v4 = [*(id *)(a1 + 32) result];
  v5 = [v4 forceUnwrapObject];
  id v6 = [v3 failableWithObject:v5];
  id v7 = [v2 optionalWithObject:v6];
  [WeakRetained setResult:v7];

  [WeakRetained finishExecutionIfPossible];
}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_4_cold_1((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = (void *)MEMORY[0x263F1E250];
  id v7 = [MEMORY[0x263F1E208] failableWithError:v3];
  uint64_t v8 = [v6 optionalWithObject:v7];
  [WeakRetained setResult:v8];

  [WeakRetained finishExecutionIfPossible];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderFetchAllFromStoreOperation;
  [(VSAsyncOperation *)&v4 cancel];
  id v3 = [(VSIdentityProviderFetchAllFromStoreOperation *)self privateQueue];
  [v3 cancelAllOperations];
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
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
  objc_storeStrong((id *)&self->_auditToken, 0);
}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Unable to transform response: %@", (uint8_t *)&v2, 0xCu);
}

@end