@interface SUUIRedeemPreflightOperation
- (BOOL)forcesAuthentication;
- (BOOL)loadsRedeemCodeMetadata;
- (SUUIRedeemConfiguration)redeemConfiguration;
- (SUUIRedeemPreflightOperation)initWithClientContext:(id)a3 redeemCode:(id)a4 forcesAuthentication:(BOOL)a5;
- (SUUIRedeemViewControllerLegacy)redeemViewController;
- (id)_authenticationContext;
- (id)_initSUUIRedeemPreflightOperation;
- (id)_redeemCodeMetadataWithClientContext:(id)a3;
- (id)outputBlock;
- (void)main;
- (void)setForcesAuthentication:(BOOL)a3;
- (void)setLoadsRedeemCodeMetadata:(BOOL)a3;
- (void)setOutputBlock:(id)a3;
- (void)setRedeemConfiguration:(id)a3;
- (void)setRedeemViewController:(id)a3;
@end

@implementation SUUIRedeemPreflightOperation

- (id)_initSUUIRedeemPreflightOperation
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemPreflightOperation;
  v2 = [(SUUIRedeemPreflightOperation *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIRedeemPreflightOperation", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_dispatchQueue;
    v6 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v5, v6);

    v2->_forcesAuthentication = 1;
  }
  return v2;
}

- (SUUIRedeemPreflightOperation)initWithClientContext:(id)a3 redeemCode:(id)a4 forcesAuthentication:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(SUUIRedeemPreflightOperation *)self _initSUUIRedeemPreflightOperation];
  v12 = (SUUIRedeemPreflightOperation *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 31, a3);
    uint64_t v13 = [v10 copy];
    redeemCode = v12->_redeemCode;
    v12->_redeemCode = (NSString *)v13;

    v12->_forcesAuthentication = a5;
  }

  return v12;
}

- (BOOL)loadsRedeemCodeMetadata
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SUUIRedeemPreflightOperation_loadsRedeemCodeMetadata__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SUUIRedeemPreflightOperation_loadsRedeemCodeMetadata__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 264);
  return result;
}

- (id)outputBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__95;
  id v10 = __Block_byref_object_dispose__95;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SUUIRedeemPreflightOperation_outputBlock__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __43__SUUIRedeemPreflightOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 272) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (SUUIRedeemConfiguration)redeemConfiguration
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__2_1;
  id v10 = __Block_byref_object_dispose__3_1;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SUUIRedeemPreflightOperation_redeemConfiguration__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIRedeemConfiguration *)v3;
}

void __51__SUUIRedeemPreflightOperation_redeemConfiguration__block_invoke(uint64_t a1)
{
}

- (void)setLoadsRedeemCodeMetadata:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SUUIRedeemPreflightOperation_setLoadsRedeemCodeMetadata___block_invoke;
  v4[3] = &unk_265404138;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __59__SUUIRedeemPreflightOperation_setLoadsRedeemCodeMetadata___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 264) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SUUIRedeemPreflightOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_265400DC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void *__47__SUUIRedeemPreflightOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 272) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 272);
    *(void *)(v5 + 272) = v4;
    return (void *)MEMORY[0x270F9A758](v4, v6);
  }
  return result;
}

- (void)setRedeemConfiguration:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SUUIRedeemPreflightOperation_setRedeemConfiguration___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __55__SUUIRedeemPreflightOperation_setRedeemConfiguration___block_invoke(uint64_t a1)
{
}

- (void)main
{
  uint64_t v3 = objc_alloc_init(SUUIRedeemPreflightResult);
  [(SUUIRedeemPreflightResult *)v3 setClientContext:self->_clientContext];
  if ([(SUUIRedeemPreflightOperation *)self forcesAuthentication])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F89460]);
    uint64_t v5 = [(SUUIRedeemPreflightOperation *)self _authenticationContext];
    id v6 = [v5 requiredUniqueIdentifier];

    if (([v4 canPerformExtendedBiometricActionsForAccountIdentifier:v6] & 1) == 0)
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      id v8 = objc_alloc(MEMORY[0x263F7B118]);
      char v9 = [(SUUIRedeemPreflightOperation *)self _authenticationContext];
      id v10 = (void *)[v8 initWithAuthenticationContext:v9];

      id v11 = [(SUUIRedeemPreflightOperation *)self redeemViewController];
      objc_msgSend(v10, "set_parentViewController:", v11);

      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __36__SUUIRedeemPreflightOperation_main__block_invoke;
      v36[3] = &unk_2654089D0;
      v37 = v3;
      dispatch_semaphore_t v38 = v7;
      v12 = v7;
      [v10 startWithAuthenticateResponseBlock:v36];
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  if (!self->_clientContext && ![(SUUIRedeemPreflightResult *)v3 resultType])
  {
    uint64_t v13 = objc_alloc_init(SUUIReloadConfigurationOperation);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __36__SUUIRedeemPreflightOperation_main__block_invoke_2;
    v34[3] = &unk_2654018B8;
    v35 = v3;
    [(SUUIReloadConfigurationOperation *)v13 setOutputBlock:v34];
    [(SUUIReloadConfigurationOperation *)v13 main];
  }
  if (![(SUUIRedeemPreflightResult *)v3 resultType]
    && [(SUUIRedeemPreflightOperation *)self loadsRedeemCodeMetadata]
    && self->_redeemCode)
  {
    v14 = [(SUUIRedeemPreflightResult *)v3 clientContext];
    v15 = [(SUUIRedeemPreflightOperation *)self _redeemCodeMetadataWithClientContext:v14];

    [(SUUIRedeemPreflightResult *)v3 setCodeMetadata:v15];
  }
  v16 = [(SUUIRedeemPreflightOperation *)self redeemConfiguration];
  if (v16 && ![(SUUIRedeemPreflightResult *)v3 resultType])
  {
    v17 = [SUUIRedeemConfiguration alloc];
    v18 = [v16 operationQueue];
    uint64_t v19 = [v16 category];
    v20 = [(SUUIRedeemPreflightResult *)v3 clientContext];
    v21 = [(SUUIRedeemConfiguration *)v17 initWithOperationQueue:v18 category:v19 clientContext:v20];

    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __36__SUUIRedeemPreflightOperation_main__block_invoke_3;
    v30 = &unk_2654089F8;
    v31 = v3;
    v32 = v21;
    dispatch_semaphore_t v33 = v22;
    v23 = v22;
    v24 = v21;
    [(SUUIRedeemConfiguration *)v24 loadConfigurationWithCompletionBlock:&v27];
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v25 = [(SUUIRedeemPreflightOperation *)self outputBlock];
  v26 = (void *)v25;
  if (v25) {
    (*(void (**)(uint64_t, SUUIRedeemPreflightResult *))(v25 + 16))(v25, v3);
  }
}

void __36__SUUIRedeemPreflightOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [a2 authenticatedAccount];
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    [v6 setAccount:v5];
  }
  else
  {
    [v6 setError:v7];
    [*(id *)(a1 + 32) setResultType:1];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __36__SUUIRedeemPreflightOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v5 = [[SUUIClientContext alloc] initWithConfigurationDictionary:v6];
    [*(id *)(a1 + 32) setClientContext:v5];
  }
  else
  {
    [*(id *)(a1 + 32) setError:a3];
    [*(id *)(a1 + 32) setResultType:2];
  }
}

intptr_t __36__SUUIRedeemPreflightOperation_main__block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 setRedeemConfiguration:*(void *)(a1 + 40)];
  }
  else
  {
    objc_msgSend(v3, "setError:");
    [*(id *)(a1 + 32) setResultType:3];
  }
  id v4 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v4);
}

- (id)_authenticationContext
{
  uint64_t v2 = [MEMORY[0x263F7B0E8] defaultStore];
  uint64_t v3 = [v2 activeAccount];

  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccount:v3];
    [v4 setPromptStyle:1];
    [v4 setShouldCreateNewSession:1];
  }
  else
  {
    id v4 = [MEMORY[0x263F7B288] contextForSignIn];
  }

  return v4;
}

- (id)_redeemCodeMetadataWithClientContext:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2_1;
  uint64_t v27 = __Block_byref_object_dispose__3_1;
  id v28 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [v4 URLBag];
  uint64_t v7 = *MEMORY[0x263F7BCF8];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__SUUIRedeemPreflightOperation__redeemCodeMetadataWithClientContext___block_invoke;
  v20[3] = &unk_265408A20;
  v20[4] = self;
  dispatch_semaphore_t v22 = &v23;
  id v8 = v5;
  v21 = v8;
  [v6 loadValueForKey:v7 completionBlock:v20];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v24[5])
  {
    id v9 = objc_alloc_init(MEMORY[0x263F89528]);
    id v10 = [MEMORY[0x263F7B0E8] defaultStore];
    id v11 = [v10 activeAccount];

    v12 = (void *)[objc_alloc(MEMORY[0x263F7B120]) initWithAccount:v11];
    [v9 setAuthenticationContext:v12];
    id v13 = objc_alloc(MEMORY[0x263F7B368]);
    v14 = (void *)[v13 initWithURL:v24[5]];
    [v9 setRequestProperties:v14];
    id v15 = objc_alloc_init(MEMORY[0x263F89508]);
    [v9 setDataProvider:v15];
    [v9 main];
    id v16 = objc_alloc(MEMORY[0x263F7B3C0]);
    v17 = [v15 output];
    v18 = (void *)[v16 initWithRedeemCodeDictionary:v17];

    [v18 setInputCode:self->_redeemCode];
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v18;
}

intptr_t __69__SUUIRedeemPreflightOperation__redeemCodeMetadataWithClientContext___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x263F08BA0];
    id v4 = a2;
    dispatch_semaphore_t v5 = (void *)[[v3 alloc] initWithString:v4];

    id v6 = [v5 queryItems];
    id v7 = (id)[v6 mutableCopy];

    if (!v7) {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v8 = objc_alloc(MEMORY[0x263F08BD0]);
    id v9 = (void *)[v8 initWithName:*MEMORY[0x263F7BCF0] value:*(void *)(a1[4] + 280)];
    [v7 addObject:v9];
    [v5 setQueryItems:v7];
    uint64_t v10 = [v5 URL];
    uint64_t v11 = *(void *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  id v13 = a1[5];
  return dispatch_semaphore_signal(v13);
}

- (SUUIRedeemViewControllerLegacy)redeemViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redeemViewController);
  return (SUUIRedeemViewControllerLegacy *)WeakRetained;
}

- (void)setRedeemViewController:(id)a3
{
}

- (BOOL)forcesAuthentication
{
  return self->_forcesAuthentication;
}

- (void)setForcesAuthentication:(BOOL)a3
{
  self->_forcesAuthentication = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redeemViewController);
  objc_storeStrong((id *)&self->_redeemConfiguration, 0);
  objc_storeStrong((id *)&self->_redeemCode, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end