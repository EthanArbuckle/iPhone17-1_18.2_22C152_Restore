@interface SKUIMediaSocialProfileCoordinator
+ (id)sharedCoordinator;
- (SKUIMediaSocialProfileCoordinator)init;
- (void)_accountStoreChangeNotification:(id)a3;
- (void)_authenticateOnCompletion:(id)a3;
- (void)_fireProfileBlocksWithProfile:(id)a3 isFinal:(BOOL)a4 error:(id)a5;
- (void)_handleOperationResponseWithProfile:(id)a3 error:(id)a4;
- (void)_queueProfileBlock:(id)a3;
- (void)_requestProfile;
- (void)dealloc;
- (void)getProfileWithOptions:(id)a3 profileBlock:(id)a4;
- (void)init;
- (void)reset;
@end

@implementation SKUIMediaSocialProfileCoordinator

- (SKUIMediaSocialProfileCoordinator)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialProfileCoordinator init]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIMediaSocialProfileCoordinator;
  v3 = [(SKUIMediaSocialProfileCoordinator *)&v12 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaSocialProfileCoordinator.callback", 0);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaSocialProfileCoordinator", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4FA83B8];
    v10 = [MEMORY[0x1E4FA8100] defaultStore];
    [v8 addObserver:v3 selector:sel__accountStoreChangeNotification_ name:v9 object:v10];
  }
  return v3;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4FA83B8];
  v5 = [MEMORY[0x1E4FA8100] defaultStore];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)SKUIMediaSocialProfileCoordinator;
  [(SKUIMediaSocialProfileCoordinator *)&v6 dealloc];
}

+ (id)sharedCoordinator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SKUIMediaSocialProfileCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_sOnce_0 != -1) {
    dispatch_once(&sharedCoordinator_sOnce_0, block);
  }
  v2 = (void *)sharedCoordinator_sCoordinator_0;

  return v2;
}

uint64_t __54__SKUIMediaSocialProfileCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedCoordinator_sCoordinator_0;
  sharedCoordinator_sCoordinator_0 = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)getProfileWithOptions:(id)a3 profileBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SKUIMediaSocialProfileCoordinator_getProfileWithOptions_profileBlock___block_invoke;
  block[3] = &unk_1E642A978;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

id *__72__SKUIMediaSocialProfileCoordinator_getProfileWithOptions_profileBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48) && (v3 = [*(id *)(v2 + 48) operationCount], uint64_t v2 = *(void *)(a1 + 32), v3)
    || *(unsigned char *)(v2 + 64))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    return (id *)[(id)v2 _queueProfileBlock:v4];
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) objectForKey:@"SKUIMediaSocialProfileOptionIgnoreCache"];
    int v7 = [v6 BOOLValue];

    result = *(id **)(a1 + 32);
    if (result[5])
    {
      [result[5] timeIntervalSinceNow];
      BOOL v9 = v8 > 30.0;
      result = *(id **)(a1 + 32);
    }
    else
    {
      BOOL v9 = 0;
    }
    if (!result[4]) {
      goto LABEL_18;
    }
    if (*(void *)(a1 + 48)) {
      char v10 = v7;
    }
    else {
      char v10 = 1;
    }
    if ((v10 & 1) == 0)
    {
      v11 = (void *)[result[4] copy];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      result = *(id **)(a1 + 32);
      if (!result[4]) {
        BOOL v9 = 1;
      }
    }
    if ((v9 | v7) == 1)
    {
LABEL_18:
      [result _queueProfileBlock:*(void *)(a1 + 48)];
      id v12 = *(void **)(a1 + 32);
      return (id *)[v12 _requestProfile];
    }
  }
  return result;
}

- (void)reset
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SKUIMediaSocialProfileCoordinator_reset__block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __42__SKUIMediaSocialProfileCoordinator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

- (void)_accountStoreChangeNotification:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FA8100], "defaultStore", a3);
  id v9 = [v4 activeAccount];

  if (v9)
  {
    if (!self->_waitingForAuthentication)
    {
      lastAuthenticationAttempt = self->_lastAuthenticationAttempt;
      if (!lastAuthenticationAttempt
        || ([(NSDate *)lastAuthenticationAttempt timeIntervalSinceNow], v6 > 10.0))
      {
        id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        double v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"SKUIMediaSocialProfileOptionIgnoreCache", 0);
        [(SKUIMediaSocialProfileCoordinator *)self getProfileWithOptions:v8 profileBlock:0];
      }
    }
  }
  else
  {
    [(SKUIMediaSocialProfileCoordinator *)self reset];
  }
}

- (void)_authenticateOnCompletion:(id)a3
{
  id v4 = a3;
  self->_waitingForAuthentication = 1;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  lastAuthenticationAttempt = self->_lastAuthenticationAttempt;
  self->_lastAuthenticationAttempt = v5;

  id v7 = [MEMORY[0x1E4FA8100] defaultStore];
  double v8 = [v7 activeAccount];

  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA8260]) initWithAccount:v8];
    [v9 setPromptStyle:1];
    [v9 setShouldCreateNewSession:1];
  }
  else
  {
    id v9 = [MEMORY[0x1E4FA8260] contextForSignIn];
  }
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4FA8128]) initWithAuthenticationContext:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SKUIMediaSocialProfileCoordinator__authenticateOnCompletion___block_invoke;
  v12[3] = &unk_1E642A9A0;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [v10 startWithAuthenticateResponseBlock:v12];
}

void __63__SKUIMediaSocialProfileCoordinator__authenticateOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SKUIMediaSocialProfileCoordinator__authenticateOnCompletion___block_invoke_2;
  block[3] = &unk_1E642A978;
  id v8 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __63__SKUIMediaSocialProfileCoordinator__authenticateOnCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) authenticateResponseType];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v2 == 4);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 64) = 0;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  return MEMORY[0x1F41817F8](v4, v6);
}

- (void)_queueProfileBlock:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_profileBlocks)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  profileBlocks = self->_profileBlocks;
  self->_profileBlocks = v7;

  id v4 = v9;
  if (v9)
  {
LABEL_3:
    uint64_t v5 = self->_profileBlocks;
    uint64_t v6 = (void *)[v9 copy];
    [(NSMutableArray *)v5 addObject:v6];

    id v4 = v9;
  }
LABEL_4:
}

- (void)_requestProfile
{
  if (!self->_operationQueue)
  {
    uint64_t v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = self->_operationQueue;
    self->_operationQueue = v3;

    [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.StoreKitUI.SKUIMediaSocialProfileCoordinator.operationQueue"];
    [(NSOperationQueue *)self->_operationQueue setQualityOfService:25];
    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
  }
  uint64_t v5 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
  uint64_t v6 = SSVDefaultUserAgent();
  [v5 setValue:v6 forHTTPHeaderField:*MEMORY[0x1E4FA8698]];

  id v7 = [(SSURLBag *)[SKUIURLBag alloc] initWithURLBagContext:v5];
  id v8 = objc_alloc_init(SKUIMediaSocialProfileOperation);
  [(SSVComplexOperation *)v8 configureWithURLBag:v7];
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __52__SKUIMediaSocialProfileCoordinator__requestProfile__block_invoke;
  id v12 = &unk_1E642A9C8;
  objc_copyWeak(&v13, &location);
  [(SKUIMediaSocialProfileOperation *)v8 setOutputBlock:&v9];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__SKUIMediaSocialProfileCoordinator__requestProfile__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleOperationResponseWithProfile:v6 error:v5];
}

- (void)_fireProfileBlocksWithProfile:(id)a3 isFinal:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = (SKUIMediaSocialProfile *)[v8 copy];
    lastKnownProfile = self->_lastKnownProfile;
    self->_lastKnownProfile = v10;

    id v12 = [MEMORY[0x1E4F1C9C8] date];
    lastRequestDate = self->_lastRequestDate;
    self->_lastRequestDate = v12;
  }
  v14 = (void *)[(NSMutableArray *)self->_profileBlocks copy];
  [(NSMutableArray *)self->_profileBlocks removeAllObjects];
  if ([v14 count])
  {
    callbackQueue = self->_callbackQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__SKUIMediaSocialProfileCoordinator__fireProfileBlocksWithProfile_isFinal_error___block_invoke;
    v16[3] = &unk_1E642A920;
    id v17 = v14;
    id v18 = v8;
    BOOL v20 = a4;
    id v19 = v9;
    dispatch_async(callbackQueue, v16);
  }
}

void __81__SKUIMediaSocialProfileCoordinator__fireProfileBlocksWithProfile_isFinal_error___block_invoke(uint64_t a1)
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

- (void)_handleOperationResponseWithProfile:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SKUIMediaSocialProfileCoordinator__handleOperationResponseWithProfile_error___block_invoke;
  block[3] = &unk_1E64225B0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __79__SKUIMediaSocialProfileCoordinator__handleOperationResponseWithProfile_error___block_invoke(id *a1)
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
      v8[2] = __79__SKUIMediaSocialProfileCoordinator__handleOperationResponseWithProfile_error___block_invoke_2;
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

  [v5 _fireProfileBlocksWithProfile:v6 isFinal:1 error:v7];
}

void __79__SKUIMediaSocialProfileCoordinator__handleOperationResponseWithProfile_error___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (a2) {
    [WeakRetained _requestProfile];
  }
  else {
    [WeakRetained _fireProfileBlocksWithProfile:*(void *)(a1 + 32) isFinal:1 error:*(void *)(a1 + 40)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileBlocks, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_lastKnownProfile, 0);
  objc_storeStrong((id *)&self->_lastAuthenticationAttempt, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "-[SKUIMediaSocialProfileCoordinator init]";
}

@end