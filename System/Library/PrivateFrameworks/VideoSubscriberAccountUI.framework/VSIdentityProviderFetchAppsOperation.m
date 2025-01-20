@interface VSIdentityProviderFetchAppsOperation
- (BOOL)shouldFetchImages;
- (BOOL)shouldPrecomposeIcon;
- (NSOperationQueue)privateQueue;
- (NSString)identityProviderID;
- (NSString)providerIdentifier;
- (VSIdentityProviderFetchAppsOperation)initWithProviderIdentifier:(id)a3 andType:(unint64_t)a4;
- (VSOptional)result;
- (unint64_t)requestType;
- (void)executionDidBegin;
- (void)setIdentityProviderID:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setResult:(id)a3;
- (void)setShouldFetchImages:(BOOL)a3;
- (void)setShouldPrecomposeIcon:(BOOL)a3;
@end

@implementation VSIdentityProviderFetchAppsOperation

- (VSIdentityProviderFetchAppsOperation)initWithProviderIdentifier:(id)a3 andType:(unint64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSIdentityProviderFetchAppsOperation;
  v8 = [(VSIdentityProviderFetchAppsOperation *)&v17 init];
  if (v8)
  {
    v9 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    v10 = v8->_result;
    v8->_result = v9;

    objc_storeStrong((id *)&v8->_providerIdentifier, a3);
    v8->_requestType = a4;
    v11 = (void *)MEMORY[0x263F08A48];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 queueWithName:v13];
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = (NSOperationQueue *)v14;
  }
  return v8;
}

- (void)executionDidBegin
{
  v3 = [(VSIdentityProviderFetchAppsOperation *)self privateQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke;
  v18[3] = &unk_265076A18;
  v18[4] = self;
  v4 = [MEMORY[0x263F086D0] blockOperationWithBlock:v18];
  id v5 = objc_alloc_init(MEMORY[0x263F1E160]);
  [v5 setMethodName:*MEMORY[0x263F1E330]];
  objc_msgSend(v5, "setRequestType:", -[VSIdentityProviderFetchAppsOperation requestType](self, "requestType"));
  v6 = [(VSIdentityProviderFetchAppsOperation *)self providerIdentifier];
  [v5 setProviderIdentifier:v6];

  id v7 = (void *)[objc_alloc(MEMORY[0x263F1E168]) initWithRequest:v5];
  [v3 addOperation:v7];
  v8 = (void *)MEMORY[0x263F086D0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_2;
  v13[3] = &unk_265077218;
  id v14 = v7;
  v15 = self;
  id v16 = v4;
  id v17 = v3;
  id v9 = v3;
  id v10 = v4;
  id v11 = v7;
  v12 = [v8 blockOperationWithBlock:v13];
  [v12 addDependency:v11];
  [v9 addOperation:v12];
}

uint64_t __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishExecutionIfPossible];
}

void __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F08D50] valueTransformerForName:@"VSAMSChannelAppsResponseValueTransformer"];
  v3 = [*(id *)(a1 + 32) result];
  v4 = [v3 forceUnwrapObject];
  id v5 = [v2 transformedValue:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_3;
  v9[3] = &unk_2650771F0;
  v6 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v6;
  id v11 = *(id *)(a1 + 56);
  [v5 unwrapObject:v9 error:&__block_literal_global_6];
  id v7 = *(void **)(a1 + 40);
  v8 = [MEMORY[0x263F1E250] optionalWithObject:v5];
  [v7 setResult:v8];

  [*(id *)(a1 + 56) addOperation:*(void *)(a1 + 48)];
}

void __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_3(id *a1, void *a2)
{
  id v4 = [a2 allApps];
  if ([a1[4] shouldFetchImages])
  {
    v3 = -[VSLoadAllAppIconsOperation initWithApps:shouldPrecomposeIcon:]([VSLoadAllAppIconsOperation alloc], "initWithApps:shouldPrecomposeIcon:", v4, [a1[4] shouldPrecomposeIcon]);
    [a1[5] addDependency:v3];
    [a1[6] addOperation:v3];
  }
}

void __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_4_cold_1((uint64_t)v2, v3);
  }
}

- (NSString)identityProviderID
{
  return self->_identityProviderID;
}

- (void)setIdentityProviderID:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (BOOL)shouldFetchImages
{
  return self->_shouldFetchImages;
}

- (void)setShouldFetchImages:(BOOL)a3
{
  self->_shouldFetchImages = a3;
}

- (BOOL)shouldPrecomposeIcon
{
  return self->_shouldPrecomposeIcon;
}

- (void)setShouldPrecomposeIcon:(BOOL)a3
{
  self->_shouldPrecomposeIcon = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_identityProviderID, 0);
}

void __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Error Transforming AppChannelMappings: %@", (uint8_t *)&v2, 0xCu);
}

@end