@interface SUUIMediaSocialAdminPermissionsCoordinator
+ (id)sharedCoordinator;
- (NSArray)lastKnownAuthors;
- (NSNumber)lastKnownAdminStatus;
- (SUUIMediaSocialAdminPermissionsCoordinator)init;
- (void)_authenticateOnCompletion:(id)a3;
- (void)_fireResultsBlocksWithAuthors:(id)a3 error:(id)a4;
- (void)_getAuthors;
- (void)_handleOperationResponseWithAuthors:(id)a3 error:(id)a4;
- (void)_queueResultBlock:(id)a3;
- (void)getAdminStatusWithOptions:(id)a3 resultBlock:(id)a4;
- (void)getAuthorsAndWaitWithOptions:(id)a3 authorsBlock:(id)a4;
- (void)getAuthorsWithOptions:(id)a3 authorsBlock:(id)a4;
- (void)reset;
@end

@implementation SUUIMediaSocialAdminPermissionsCoordinator

- (SUUIMediaSocialAdminPermissionsCoordinator)init
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIMediaSocialAdminPermissionsCoordinator;
  v2 = [(SUUIMediaSocialAdminPermissionsCoordinator *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIMediaSocialAdminPermissionsCoordinator.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIMediaSocialAdminPermissionsCoordinator", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    lastKnownAuthors = v2->_lastKnownAuthors;
    v2->_lastKnownAuthors = 0;

    lastRequestDate = v2->_lastRequestDate;
    v2->_lastRequestDate = 0;
  }
  return v2;
}

+ (id)sharedCoordinator
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SUUIMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_sOnce_0 != -1) {
    dispatch_once(&sharedCoordinator_sOnce_0, block);
  }
  v2 = (void *)sharedCoordinator_sCoordinator_0;
  return v2;
}

uint64_t __63__SUUIMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedCoordinator_sCoordinator_0;
  sharedCoordinator_sCoordinator_0 = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (void)getAdminStatusWithOptions:(id)a3 resultBlock:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [a3 objectForKeyedSubscript:@"SUUIMediaSocialAdminPermissionsOptionIgnoreCache"];
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x263EFFA80];
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  uint64_t v12 = *MEMORY[0x263F7BCD0];
  v13[0] = v9;
  objc_super v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11 = [MEMORY[0x263F7B3A8] sharedCoordinator];

  [v11 getAdminStatusWithOptions:v10 resultBlock:v5];
}

- (void)getAuthorsWithOptions:(id)a3 authorsBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__SUUIMediaSocialAdminPermissionsCoordinator_getAuthorsWithOptions_authorsBlock___block_invoke;
  block[3] = &unk_265404230;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __81__SUUIMediaSocialAdminPermissionsCoordinator_getAuthorsWithOptions_authorsBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"SUUIMediaSocialAdminPermissionsOptionIgnoreCache"];
  char v3 = [v2 BOOLValue];

  v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 40) + 32)];
  double v6 = v5;

  id v7 = *(id **)(a1 + 40);
  if (v6 > 30.0) {
    char v8 = v3;
  }
  else {
    char v8 = 0;
  }
  if (!v7[3] || (v8 & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v9 = [v7[3] copy];
  if (!v9)
  {
    id v7 = *(id **)(a1 + 40);
LABEL_10:
    [v7 _queueResultBlock:*(void *)(a1 + 48)];
    uint64_t v11 = [*(id *)(a1 + 40) _getAuthors];
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11)
  {
    uint64_t v13 = v10;
    uint64_t v11 = (*(uint64_t (**)(void))(v11 + 16))();
    uint64_t v10 = v13;
  }
LABEL_11:
  return MEMORY[0x270F9A758](v11, v10);
}

- (void)getAuthorsAndWaitWithOptions:(id)a3 authorsBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__SUUIMediaSocialAdminPermissionsCoordinator_getAuthorsAndWaitWithOptions_authorsBlock___block_invoke;
  v11[3] = &unk_265405378;
  dispatch_semaphore_t v12 = v8;
  id v13 = v6;
  uint64_t v9 = v8;
  id v10 = v6;
  [(SUUIMediaSocialAdminPermissionsCoordinator *)self getAuthorsWithOptions:v7 authorsBlock:v11];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __88__SUUIMediaSocialAdminPermissionsCoordinator_getAuthorsAndWaitWithOptions_authorsBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v2);
}

- (NSArray)lastKnownAuthors
{
  uint64_t v2 = (void *)[(NSArray *)self->_lastKnownAuthors copy];
  return (NSArray *)v2;
}

- (NSNumber)lastKnownAdminStatus
{
  uint64_t v2 = NSNumber;
  char v3 = [MEMORY[0x263F7B3A8] sharedCoordinator];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isCurrentUserAdmin"));

  return (NSNumber *)v4;
}

- (void)reset
{
  lastKnownAuthors = self->_lastKnownAuthors;
  self->_lastKnownAuthors = 0;

  lastRequestDate = self->_lastRequestDate;
  self->_lastRequestDate = 0;

  id v5 = [MEMORY[0x263F7B3A8] sharedCoordinator];
  [v5 reset];
}

- (void)_authenticateOnCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F7B0E8] defaultStore];
  id v5 = [v4 activeAccount];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccount:v5];
    [v6 setPromptStyle:1];
    [v6 setShouldCreateNewSession:1];
  }
  else
  {
    id v6 = [MEMORY[0x263F7B288] contextForSignIn];
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F7B118]) initWithAuthenticationContext:v6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__SUUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke;
  v9[3] = &unk_2654016D8;
  id v10 = v3;
  id v8 = v3;
  [v7 startWithAuthenticateResponseBlock:v9];
}

void __72__SUUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__SUUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke_2;
  v5[3] = &unk_265400DC8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __72__SUUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) authenticateResponseType];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_fireResultsBlocksWithAuthors:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_lastKnownAuthors, a3);
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    lastRequestDate = self->_lastRequestDate;
    self->_lastRequestDate = v9;
  }
  uint64_t v11 = (void *)[(NSMutableArray *)self->_resultBlocks copy];
  [(NSMutableArray *)self->_resultBlocks removeAllObjects];
  if ([v11 count])
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__SUUIMediaSocialAdminPermissionsCoordinator__fireResultsBlocksWithAuthors_error___block_invoke;
    block[3] = &unk_265400958;
    id v14 = v11;
    id v15 = v7;
    id v16 = v8;
    dispatch_async(callbackQueue, block);
  }
}

void __82__SUUIMediaSocialAdminPermissionsCoordinator__fireResultsBlocksWithAuthors_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_getAuthors
{
  uint64_t v3 = [MEMORY[0x263F7B358] contextWithBagType:0];
  uint64_t v4 = SSVDefaultUserAgent();
  [v3 setValue:v4 forHTTPHeaderField:*MEMORY[0x263F7B788]];

  uint64_t v5 = [(SSURLBag *)[SUUIURLBag alloc] initWithURLBagContext:v3];
  long long v6 = objc_alloc_init(SUUIMediaSocialAdminPermissionsOperation);
  [(SSVComplexOperation *)v6 configureWithURLBag:v5];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  long long v9 = __57__SUUIMediaSocialAdminPermissionsCoordinator__getAuthors__block_invoke;
  id v10 = &unk_265401A50;
  objc_copyWeak(&v11, &location);
  [(SUUIMediaSocialAdminPermissionsOperation *)v6 setOutputBlock:&v7];
  [(SUUIMediaSocialAdminPermissionsOperation *)v6 main];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__SUUIMediaSocialAdminPermissionsCoordinator__getAuthors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleOperationResponseWithAuthors:v6 error:v5];
}

- (void)_handleOperationResponseWithAuthors:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SUUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke;
  block[3] = &unk_265400958;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __88__SUUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] domain];
  if ([v2 isEqualToString:@"SUUIErrorDomain"])
  {
    uint64_t v3 = [a1[4] code];

    if (v3 == 3)
    {
      objc_initWeak(&location, a1[5]);
      id v4 = a1[5];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __88__SUUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke_2;
      v8[3] = &unk_2654016B0;
      objc_copyWeak(&v11, &location);
      id v9 = a1[6];
      id v10 = a1[4];
      [v4 _authenticateOnCompletion:v8];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {
  }
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  [v5 _fireResultsBlocksWithAuthors:v6 error:v7];
}

void __88__SUUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (a2) {
    [WeakRetained _getAuthors];
  }
  else {
    [WeakRetained _fireResultsBlocksWithAuthors:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
}

- (void)_queueResultBlock:(id)a3
{
  if (a3)
  {
    id v4 = (void *)[a3 copy];
    resultBlocks = self->_resultBlocks;
    aBlock = v4;
    if (!resultBlocks)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v7 = self->_resultBlocks;
      self->_resultBlocks = v6;

      id v4 = aBlock;
      resultBlocks = self->_resultBlocks;
    }
    uint64_t v8 = _Block_copy(v4);
    [(NSMutableArray *)resultBlocks addObject:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultBlocks, 0);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_lastKnownAuthors, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end