@interface PKDiscoveryDataSource
- (BOOL)_queue_updateArticleLayouts:(id)a3;
- (BOOL)isMiniCardsAllowed;
- (NSArray)articleLayouts;
- (PKDiscoveryDataSource)initWithDelegate:(id)a3;
- (PKDiscoveryDataSourceDelegate)delegate;
- (id)_articleLayoutForItemIdentifier:(id)a3;
- (void)_addDismissActionToArticleLayouts:(id)a3;
- (void)_manifestAllowsMiniCardsWithCompletion:(id)a3;
- (void)_updateArticlesWithCompletion:(id)a3;
- (void)dealloc;
- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)discoveryService:(id)a3 completedCTAForItem:(id)a4;
- (void)discoveryService:(id)a3 receivedUpdatedDiscoveryArticleLayouts:(id)a4;
- (void)displayedDiscoveryItem:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8;
- (void)setArticleLayouts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMiniCardsAllowed:(BOOL)a3;
- (void)tappedDiscoveryItem:(id)a3 callToAction:(id)a4 cardSize:(int64_t)a5;
- (void)updateArticleLayouts;
@end

@implementation PKDiscoveryDataSource

void __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(void *)(a1 + 32))
    {
      uint64_t v10 = objc_msgSend(WeakRetained, "_queue_updateArticleLayouts:", *(void *)(a1 + 40));
      goto LABEL_8;
    }
    v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412546;
      v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      id v9 = v7;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%@ could not fetch discovery article layouts: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v10 = 0;
LABEL_8:
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v10, v3, v4);
}

void __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_21(uint64_t a1, char a2)
{
  uint64_t v4 = *(id *)(a1 + 32);
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_190E10000, v5, OS_SIGNPOST_INTERVAL_END, v6, "com.apple.passkit.discovery.card-fetch", "", buf, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(NSObject **)(v7 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_22;
  v9[3] = &unk_1E56D8B80;
  v9[4] = v7;
  char v10 = a2;
  dispatch_async(v8, v9);
}

- (BOOL)_queue_updateArticleLayouts:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  articleLayouts = self->_articleLayouts;
  if (!v4 || !articleLayouts)
  {
    if (articleLayouts == v4) {
      goto LABEL_4;
    }
LABEL_6:
    [(PKDiscoveryDataSource *)self _addDismissActionToArticleLayouts:v4];
    [(PKDiscoveryDataSource *)self setArticleLayouts:v4];
    BOOL v6 = 1;
    goto LABEL_7;
  }
  if (([(NSArray *)articleLayouts isEqual:v4] & 1) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (NSArray)articleLayouts
{
  p_articleLayoutsLock = &self->_articleLayoutsLock;
  os_unfair_lock_lock(&self->_articleLayoutsLock);
  articleLayouts = self->_articleLayouts;
  if (articleLayouts) {
    v5 = (void *)[(NSArray *)articleLayouts copy];
  }
  else {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_articleLayoutsLock);
  return (NSArray *)v5;
}

- (PKDiscoveryDataSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDiscoveryDataSource;
  v5 = [(PKDiscoveryDataSource *)&v22 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.passd.discoverymanager.work", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_articleLayoutsLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    articleLayouts = v5->_articleLayouts;
    v5->_articleLayouts = v8;

    uint64_t v10 = +[PKDiscoveryService sharedInstance];
    discoveryService = v5->_discoveryService;
    v5->_discoveryService = (PKDiscoveryService *)v10;

    [(PKDiscoveryService *)v5->_discoveryService addObserver:v5];
    v12 = (void *)MEMORY[0x1E4F4DBD8];
    __int16 v13 = [MEMORY[0x1E4F4DD40] bagSubProfile];
    uint64_t v14 = [MEMORY[0x1E4F4DD40] bagSubProfileVersion];
    uint64_t v15 = [v12 bagForProfile:v13 profileVersion:v14];

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F4DD58]) initWithContainerID:@"com.apple.passbook" bag:v15];
    AMPMetrics = v5->_AMPMetrics;
    v5->_AMPMetrics = (AMSMetrics *)v16;

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__PKDiscoveryDataSource_initWithDelegate___block_invoke;
    v20[3] = &unk_1E56DD7C8;
    v18 = v5;
    v21 = v18;
    [(PKDiscoveryDataSource *)v18 _manifestAllowsMiniCardsWithCompletion:v20];
    [(PKDiscoveryDataSource *)v18 updateArticleLayouts];
  }
  return v5;
}

- (void)updateArticleLayouts
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke;
  v4[3] = &unk_1E56DD818;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_manifestAllowsMiniCardsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (PKDiscoveryForceAllowMiniCards())
  {
    id v5 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Skipping lookup for global value miniCardsAllowed due to internal setting to force mini cards", buf, 2u);
    }

    v4[2](v4, 1);
  }
  else
  {
    discoveryService = self->_discoveryService;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__PKDiscoveryDataSource__manifestAllowsMiniCardsWithCompletion___block_invoke;
    v7[3] = &unk_1E56DD840;
    v7[4] = self;
    uint64_t v8 = v4;
    [(PKDiscoveryService *)discoveryService manifestAllowsMiniCardsWithCompletion:v7];
  }
}

void __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[40])
  {
    uint64_t v3 = PKLogFacilityTypeGetObject(0x2EuLL);
    os_signpost_id_t v4 = os_signpost_id_generate(v3);
    id v5 = v3;
    dispatch_queue_t v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_190E10000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "com.apple.passkit.discovery.card-fetch", "", buf, 2u);
    }

    v2[40] = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_21;
    v8[3] = &unk_1E56DD7F0;
    uint64_t v10 = v2;
    os_signpost_id_t v11 = v4;
    id v9 = v6;
    uint64_t v7 = v6;
    [v2 _updateArticlesWithCompletion:v8];
  }
}

- (void)_updateArticlesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  discoveryService = self->_discoveryService;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke;
  v10[3] = &unk_1E56DD890;
  v10[4] = self;
  objc_copyWeak(&v12, &location);
  id v6 = v4;
  id v11 = v6;
  [(PKDiscoveryService *)discoveryService discoveryArticleLayoutsWithCompletion:v10];
  uint64_t v7 = self->_discoveryService;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke_26;
  v8[3] = &unk_1E56DD060;
  objc_copyWeak(&v9, &location);
  [(PKDiscoveryService *)v7 dismissedDiscoveryItems:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "eventForKey:", @"dismiss", (void)v11);
        if (v10) {
          [WeakRetained[2] enqueueEvent:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

void __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke_2;
  block[3] = &unk_1E56DD868;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  id v12 = v6;
  id v13 = v5;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v16);
}

uint64_t __64__PKDiscoveryDataSource__manifestAllowsMiniCardsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = PKLogFacilityTypeGetObject(0x10uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v7 = 138412290;
      uint64_t v8 = v2;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Lookup for global value miniCardsAllowed failed with error:%@ returning NO", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v4)
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Lookup for global value miniCardsAllowed succeeded with value:%ld", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __42__PKDiscoveryDataSource_initWithDelegate___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 56) = a2;
  return result;
}

void __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_22(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));

    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_2;
      block[3] = &unk_1E56D8AE0;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __64__PKDiscoveryDataSource__manifestAllowsMiniCardsWithCompletion___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKDiscoveryDataSource__manifestAllowsMiniCardsWithCompletion___block_invoke_2;
  block[3] = &unk_1E56D8A68;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  char v11 = a3;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)dealloc
{
  id v3 = +[PKDiscoveryService sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryDataSource;
  [(PKDiscoveryDataSource *)&v4 dealloc];
}

- (BOOL)isMiniCardsAllowed
{
  return self->_miniCardsAllowed;
}

void __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained discoveryDataSource:*(void *)(a1 + 32) didUpdateArticleLayouts:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(PKDiscoveryDataSource *)self _articleLayoutForItemIdentifier:v8];
  if (v7) {
    v6[2](v6, v7, 0);
  }
  else {
    [(PKDiscoveryService *)self->_discoveryService discoveryArticleLayoutForItemWithIdentifier:v8 completion:v6];
  }
}

- (void)setArticleLayouts:(id)a3
{
  objc_super v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_articleLayoutsLock);
  articleLayouts = self->_articleLayouts;
  self->_articleLayouts = v4;

  os_unfair_lock_unlock(&self->_articleLayoutsLock);
}

- (void)discoveryService:(id)a3 receivedUpdatedDiscoveryArticleLayouts:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PKDiscoveryDataSource_discoveryService_receivedUpdatedDiscoveryArticleLayouts___block_invoke;
  v8[3] = &unk_1E56D8A90;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(workQueue, v8);
}

void __81__PKDiscoveryDataSource_discoveryService_receivedUpdatedDiscoveryArticleLayouts___block_invoke(uint64_t a1)
{
  char v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_updateArticleLayouts:", *(void *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__PKDiscoveryDataSource_discoveryService_receivedUpdatedDiscoveryArticleLayouts___block_invoke_2;
  v3[3] = &unk_1E56D8B80;
  char v4 = v2;
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __81__PKDiscoveryDataSource_discoveryService_receivedUpdatedDiscoveryArticleLayouts___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
      id v3 = *(void **)(a1 + 32);
      char v4 = [v3 articleLayouts];
      [v5 discoveryDataSource:v3 didUpdateArticleLayouts:v4];
    }
  }
}

- (void)discoveryService:(id)a3 completedCTAForItem:(id)a4
{
  id v5 = [a4 eventForKey:@"actionComplete"];
  if (v5)
  {
    id v6 = v5;
    [(AMSMetrics *)self->_AMPMetrics enqueueEvent:v5];
    id v5 = v6;
  }
}

- (id)_articleLayoutForItemIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_articleLayouts;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "itemIdentifier", (void)v15);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v4;
        id v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          int v13 = [v10 isEqualToString:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

- (void)_addDismissActionToArticleLayouts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_initWeak(&from, v8);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke;
        aBlock[3] = &unk_1E56DD930;
        objc_copyWeak(&v12, &location);
        objc_copyWeak(&v13, &from);
        id v9 = _Block_copy(aBlock);
        [v8 setActionOnDismiss:v9];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&v12);
        objc_destroyWeak(&from);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

void __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = (id *)(a1 + 40);
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = v7;
  if (WeakRetained && v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
    id v9 = (void *)*((void *)WeakRetained + 4);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_2;
    v21[3] = &unk_1E56DD8B8;
    v21[4] = v8;
    uint64_t v10 = [v9 indexOfObjectPassingTest:v21];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v10;
      id v12 = (void *)[*((id *)WeakRetained + 4) mutableCopy];
      [v12 removeObjectAtIndex:v11];
      uint64_t v13 = [v12 copy];
      uint64_t v14 = (void *)*((void *)WeakRetained + 4);
      *((void *)WeakRetained + 4) = v13;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
    long long v15 = (void *)*((void *)WeakRetained + 1);
    long long v16 = [v8 itemIdentifier];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_3;
    v17[3] = &unk_1E56DD908;
    objc_copyWeak(&v19, v4);
    objc_copyWeak(&v20, v6);
    id v18 = v3;
    [v15 updateDiscoveryItemWithIdentifier:v16 forAction:1 completion:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
  }
}

uint64_t __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 itemIdentifier];
  id v4 = [*(id *)(a1 + 32) itemIdentifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

void __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 5);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[6];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_4;
    v7[3] = &unk_1E56DD8E0;
    objc_copyWeak(&v10, a1 + 5);
    objc_copyWeak(&v11, a1 + 6);
    id v9 = a1[4];
    id v8 = v3;
    dispatch_async(v6, v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
  }
}

void __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_4(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v3 = objc_loadWeakRetained(a1 + 7);
  id v4 = v3;
  if (WeakRetained)
  {
    id v5 = [v3 item];
    id v6 = [v5 eventForKey:@"dismiss"];

    if (v6) {
      [WeakRetained[2] enqueueEvent:v6];
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_5;
    v7[3] = &unk_1E56D8798;
    id v9 = a1[5];
    id v8 = a1[4];
    [WeakRetained _updateArticlesWithCompletion:v7];
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

uint64_t __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0, a2);
}

- (void)displayedDiscoveryItem:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  long long v15 = [v14 identifier];
  discoveryService = self->_discoveryService;
  long long v17 = [v14 identifier];
  [(PKDiscoveryService *)discoveryService displayedDiscoveryItemWithIdentifier:v17 isWelcomeCard:v12 afterSwipingToCard:v11 multipleStoryCardsAvailable:v10 callToAction:a7 cardSize:a8];

  if (!v12)
  {
    id v18 = [v14 eventForKey:@"display"];
    if (v18) {
      [(AMSMetrics *)self->_AMPMetrics enqueueEvent:v18];
    }
    objc_initWeak(&location, self);
    id v19 = self->_discoveryService;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __131__PKDiscoveryDataSource_displayedDiscoveryItem_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke;
    v20[3] = &unk_1E56DD958;
    objc_copyWeak(&v21, &location);
    void v20[4] = self;
    [(PKDiscoveryService *)v19 discoveryArticleLayoutForItemWithIdentifier:v15 completion:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __131__PKDiscoveryDataSource_displayedDiscoveryItem_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7 && WeakRetained)
  {
    id v4 = [v7 item];
    if (([v4 hasHitMaxViewCount] & 1) != 0 || objc_msgSend(v4, "hasHitMaxLargeViewCount"))
    {
      id v5 = [v7 item];
      id v6 = [v5 eventForKey:@"displayLimitReached"];

      if (v6) {
        [*(id *)(*(void *)(a1 + 32) + 16) enqueueEvent:v6];
      }
    }
  }
}

- (void)tappedDiscoveryItem:(id)a3 callToAction:(id)a4 cardSize:(int64_t)a5
{
  discoveryService = self->_discoveryService;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [v10 identifier];
  uint64_t v12 = [v9 action];

  [(PKDiscoveryService *)discoveryService tappedDiscoveryItemWithIdentifier:v11 callToAction:v12 cardSize:a5];
  id v14 = [v10 eventForKey:@"action"];

  uint64_t v13 = v14;
  if (v14)
  {
    [(AMSMetrics *)self->_AMPMetrics enqueueEvent:v14];
    uint64_t v13 = v14;
  }
}

- (PKDiscoveryDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKDiscoveryDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setMiniCardsAllowed:(BOOL)a3
{
  self->_miniCardsAllowed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_articleLayouts, 0);
  objc_storeStrong((id *)&self->_AMPMetrics, 0);
  objc_storeStrong((id *)&self->_discoveryService, 0);
}

@end