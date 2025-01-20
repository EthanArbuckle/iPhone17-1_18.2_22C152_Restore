@interface SKUIMediaSocialAdminPermissionsCoordinator
+ (id)sharedCoordinator;
- (NSArray)lastKnownAuthors;
- (NSNumber)lastKnownAdminStatus;
- (SKUIMediaSocialAdminPermissionsCoordinator)init;
- (void)_authenticateOnCompletion:(id)a3;
- (void)_fireResultsBlocksWithAuthors:(id)a3 error:(id)a4;
- (void)_getAuthors;
- (void)_handleOperationResponseWithAuthors:(id)a3 error:(id)a4;
- (void)_queueResultBlock:(id)a3;
- (void)getAdminStatusWithOptions:(id)a3 resultBlock:(id)a4;
- (void)getAuthorsAndWaitWithOptions:(id)a3 authorsBlock:(id)a4;
- (void)getAuthorsWithOptions:(id)a3 authorsBlock:(id)a4;
- (void)init;
- (void)reset;
@end

@implementation SKUIMediaSocialAdminPermissionsCoordinator

- (SKUIMediaSocialAdminPermissionsCoordinator)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialAdminPermissionsCoordinator init]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIMediaSocialAdminPermissionsCoordinator;
  v3 = [(SKUIMediaSocialAdminPermissionsCoordinator *)&v11 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaSocialAdminPermissionsCoordinator.callback", 0);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaSocialAdminPermissionsCoordinator", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    lastKnownAuthors = v3->_lastKnownAuthors;
    v3->_lastKnownAuthors = 0;

    lastRequestDate = v3->_lastRequestDate;
    v3->_lastRequestDate = 0;
  }
  return v3;
}

+ (id)sharedCoordinator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SKUIMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_sOnce != -1) {
    dispatch_once(&sharedCoordinator_sOnce, block);
  }
  v2 = (void *)sharedCoordinator_sCoordinator;

  return v2;
}

uint64_t __63__SKUIMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedCoordinator_sCoordinator;
  sharedCoordinator_sCoordinator = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)getAdminStatusWithOptions:(id)a3 resultBlock:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [a3 objectForKeyedSubscript:@"SKUIMediaSocialAdminPermissionsOptionIgnoreCache"];
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E4F1CC28];
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  uint64_t v12 = *MEMORY[0x1E4FA8968];
  v13[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  objc_super v11 = [MEMORY[0x1E4FA8340] sharedCoordinator];

  [v11 getAdminStatusWithOptions:v10 resultBlock:v5];
}

- (void)getAuthorsWithOptions:(id)a3 authorsBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SKUIMediaSocialAdminPermissionsCoordinator_getAuthorsWithOptions_authorsBlock___block_invoke;
  block[3] = &unk_1E64266D0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __81__SKUIMediaSocialAdminPermissionsCoordinator_getAuthorsWithOptions_authorsBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"SKUIMediaSocialAdminPermissionsOptionIgnoreCache"];
  char v3 = [v2 BOOLValue];

  dispatch_queue_t v4 = [MEMORY[0x1E4F1C9C8] date];
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

  return MEMORY[0x1F41817F8](v11, v10);
}

- (void)getAuthorsAndWaitWithOptions:(id)a3 authorsBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__SKUIMediaSocialAdminPermissionsCoordinator_getAuthorsAndWaitWithOptions_authorsBlock___block_invoke;
  v11[3] = &unk_1E6429F10;
  dispatch_semaphore_t v12 = v8;
  id v13 = v6;
  uint64_t v9 = v8;
  id v10 = v6;
  [(SKUIMediaSocialAdminPermissionsCoordinator *)self getAuthorsWithOptions:v7 authorsBlock:v11];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __88__SKUIMediaSocialAdminPermissionsCoordinator_getAuthorsAndWaitWithOptions_authorsBlock___block_invoke(uint64_t a1)
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
  char v3 = [MEMORY[0x1E4FA8340] sharedCoordinator];
  dispatch_queue_t v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isCurrentUserAdmin"));

  return (NSNumber *)v4;
}

- (void)reset
{
  lastKnownAuthors = self->_lastKnownAuthors;
  self->_lastKnownAuthors = 0;

  lastRequestDate = self->_lastRequestDate;
  self->_lastRequestDate = 0;

  id v5 = [MEMORY[0x1E4FA8340] sharedCoordinator];
  [v5 reset];
}

- (void)_authenticateOnCompletion:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = [MEMORY[0x1E4FA8100] defaultStore];
  id v5 = [v4 activeAccount];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA8260]) initWithAccount:v5];
    [v6 setPromptStyle:1];
    [v6 setShouldCreateNewSession:1];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA8260] contextForSignIn];
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA8128]) initWithAuthenticationContext:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SKUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke;
  v9[3] = &unk_1E64287D8;
  id v10 = v3;
  id v8 = v3;
  [v7 startWithAuthenticateResponseBlock:v9];
}

void __72__SKUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__SKUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke_2;
  v5[3] = &unk_1E6423820;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __72__SKUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke_2(uint64_t a1)
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
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    lastRequestDate = self->_lastRequestDate;
    self->_lastRequestDate = v9;
  }
  uint64_t v11 = (void *)[(NSMutableArray *)self->_resultBlocks copy];
  [(NSMutableArray *)self->_resultBlocks removeAllObjects];
  if ([v11 count])
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SKUIMediaSocialAdminPermissionsCoordinator__fireResultsBlocksWithAuthors_error___block_invoke;
    block[3] = &unk_1E64225B0;
    id v14 = v11;
    id v15 = v7;
    id v16 = v8;
    dispatch_async(callbackQueue, block);
  }
}

void __82__SKUIMediaSocialAdminPermissionsCoordinator__fireResultsBlocksWithAuthors_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
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
  uint64_t v3 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
  uint64_t v4 = SSVDefaultUserAgent();
  [v3 setValue:v4 forHTTPHeaderField:*MEMORY[0x1E4FA8698]];

  uint64_t v5 = [(SSURLBag *)[SKUIURLBag alloc] initWithURLBagContext:v3];
  long long v6 = objc_alloc_init(SKUIMediaSocialAdminPermissionsOperation);
  [(SSVComplexOperation *)v6 configureWithURLBag:v5];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  long long v9 = __57__SKUIMediaSocialAdminPermissionsCoordinator__getAuthors__block_invoke;
  id v10 = &unk_1E6423C58;
  objc_copyWeak(&v11, &location);
  [(SKUIMediaSocialAdminPermissionsOperation *)v6 setOutputBlock:&v7];
  [(SKUIMediaSocialAdminPermissionsOperation *)v6 main];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__SKUIMediaSocialAdminPermissionsCoordinator__getAuthors__block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SKUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke;
  block[3] = &unk_1E64225B0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __88__SKUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] domain];
  if ([v2 isEqualToString:@"SKUIErrorDomain"])
  {
    uint64_t v3 = [a1[4] code];

    if (v3 == 3)
    {
      objc_initWeak(&location, a1[5]);
      id v4 = a1[5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __88__SKUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke_2;
      v8[3] = &unk_1E64287B0;
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

void __88__SKUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke_2(uint64_t a1, int a2)
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
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "-[SKUIMediaSocialAdminPermissionsCoordinator init]";
}

@end