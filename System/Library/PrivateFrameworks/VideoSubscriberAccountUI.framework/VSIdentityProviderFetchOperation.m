@interface VSIdentityProviderFetchOperation
- (BOOL)fetchFromStoreOnly;
- (NSOperationQueue)privateQueue;
- (NSString)identityProviderID;
- (NSString)identityProviderUniqueID;
- (VSAuditToken)auditToken;
- (VSIdentityProviderFetchOperation)init;
- (VSIdentityProviderFetchOperation)initWithIdentityProviderID:(id)a3;
- (VSIdentityProviderFetchOperation)initWithIdentityProviderUniqueID:(id)a3;
- (VSOptional)result;
- (id)_fetchAllOperation;
- (void)cancel;
- (void)executionDidBegin;
- (void)setAuditToken:(id)a3;
- (void)setFetchFromStoreOnly:(BOOL)a3;
- (void)setIdentityProviderID:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSIdentityProviderFetchOperation

- (VSIdentityProviderFetchOperation)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSIdentityProviderFetchOperation)initWithIdentityProviderID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The identityProviderID parameter must not be nil."];
  }
  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderFetchOperation;
  v5 = [(VSIdentityProviderFetchOperation *)&v10 init];
  v6 = v5;
  if (v5)
  {
    commonInit_2(v5);
    uint64_t v7 = [v4 copy];
    identityProviderID = v6->_identityProviderID;
    v6->_identityProviderID = (NSString *)v7;
  }
  return v6;
}

- (VSIdentityProviderFetchOperation)initWithIdentityProviderUniqueID:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The identityProviderUniqueID parameter must not be nil."];
  }
  v9.receiver = self;
  v9.super_class = (Class)VSIdentityProviderFetchOperation;
  v6 = [(VSIdentityProviderFetchOperation *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    commonInit_2(v6);
    objc_storeStrong((id *)&v7->_identityProviderUniqueID, a3);
  }

  return v7;
}

- (id)_fetchAllOperation
{
  BOOL v3 = [(VSIdentityProviderFetchOperation *)self fetchFromStoreOnly];
  id v4 = off_265076460;
  if (!v3) {
    id v4 = off_265076468;
  }
  id v5 = objc_alloc_init(*v4);
  v6 = [(VSIdentityProviderFetchOperation *)self auditToken];
  [v5 setAuditToken:v6];

  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The fetchAllOperation parameter must not be nil."];
  }
  return v5;
}

- (void)executionDidBegin
{
  BOOL v3 = [(VSIdentityProviderFetchOperation *)self privateQueue];
  id v4 = [(VSIdentityProviderFetchOperation *)self _fetchAllOperation];
  [v3 addOperation:v4];
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x263F086D0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  objc_super v10 = __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke;
  v11 = &unk_265076E48;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v12 = v6;
  v13 = self;
  uint64_t v7 = [v5 blockOperationWithBlock:&v8];
  objc_msgSend(v7, "addDependency:", v6, v8, v9, v10, v11);
  [v3 addOperation:v7];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v3 = [*(id *)(a1 + 32) result];
    id v4 = [v3 forceUnwrapObject];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke_2;
    v6[3] = &unk_265077850;
    v6[4] = *(void *)(a1 + 40);
    v6[5] = WeakRetained;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke_3;
    v5[3] = &unk_265076EB8;
    v5[4] = WeakRetained;
    [v4 unwrapObject:v6 error:v5];

    [WeakRetained finishExecutionIfPossible];
  }
}

void __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  v32[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) identityProviderID];

  if (v4)
  {
    id v5 = objc_alloc_init(VSIdentityProviderFilter);
    [(VSIdentityProviderFilter *)v5 setAllIdentityProviders:v3];
    id v6 = [*(id *)(a1 + 40) identityProviderID];
    v32[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    [(VSIdentityProviderFilter *)v5 setSupportedAccountProviderIDs:v7];

    uint64_t v8 = [(VSIdentityProviderFilter *)v5 filteredIdentityProviders];
    id v9 = [v8 firstObject];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = (VSIdentityProviderFilter *)v3;
    id v9 = (id)[(VSIdentityProviderFilter *)v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      id v26 = v3;
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v13 = [v12 uniqueID];
          id v14 = [v13 forceUnwrapObject];
          v15 = [*(id *)(a1 + 32) identityProviderUniqueID];
          int v16 = [v14 isEqual:v15];

          if (v16)
          {
            id v9 = v12;
            goto LABEL_13;
          }
        }
        id v9 = (id)[(VSIdentityProviderFilter *)v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
LABEL_13:
      id v3 = v26;
    }
  }

  if (v9)
  {
    v17 = *(void **)(a1 + 40);
    v18 = (void *)MEMORY[0x263F1E250];
    v19 = (void *)MEMORY[0x263F1E208];
    id v20 = v9;
    v21 = (void *)[v20 copy];
    v22 = [v19 failableWithObject:v21];
    v23 = [v18 optionalWithObject:v22];
    [v17 setResult:v23];
  }
  else
  {
    v21 = VSPrivateError();
    v24 = *(void **)(a1 + 40);
    v25 = (void *)MEMORY[0x263F1E250];
    v22 = [MEMORY[0x263F1E208] failableWithError:v21];
    v23 = [v25 optionalWithObject:v22];
    [v24 setResult:v23];
  }
}

void __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F1E250];
  id v5 = [MEMORY[0x263F1E208] failableWithError:a2];
  id v4 = [v3 optionalWithObject:v5];
  [v2 setResult:v4];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderFetchOperation;
  [(VSAsyncOperation *)&v4 cancel];
  id v3 = [(VSIdentityProviderFetchOperation *)self privateQueue];
  [v3 cancelAllOperations];

  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (NSString)identityProviderID
{
  return self->_identityProviderID;
}

- (void)setIdentityProviderID:(id)a3
{
}

- (NSString)identityProviderUniqueID
{
  return self->_identityProviderUniqueID;
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

- (BOOL)fetchFromStoreOnly
{
  return self->_fetchFromStoreOnly;
}

- (void)setFetchFromStoreOnly:(BOOL)a3
{
  self->_fetchFromStoreOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_identityProviderUniqueID, 0);
  objc_storeStrong((id *)&self->_identityProviderID, 0);
}

@end