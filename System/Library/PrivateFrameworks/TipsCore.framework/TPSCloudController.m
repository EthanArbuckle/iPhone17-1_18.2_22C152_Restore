@interface TPSCloudController
+ (id)sharedInstance;
- (BOOL)isHintDisplayedForContentID:(id)a3;
- (TPSCloudController)init;
- (id)_listDisplayContentIDs;
- (void)_clearDisplayedContentIDs;
- (void)checkForUpdates;
- (void)dealloc;
- (void)hintDisplayedForContentID:(id)a3;
- (void)registerForNotifications:(id)a3;
- (void)updateKVStoreItems:(id)a3;
@end

@implementation TPSCloudController

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1) {
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_gTPSCloudController;
  return v2;
}

uint64_t __36__TPSCloudController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TPSCloudController);
  uint64_t v1 = sharedInstance_gTPSCloudController;
  sharedInstance_gTPSCloudController = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F29130] defaultStore];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F28A30] object:v3];

  v5.receiver = self;
  v5.super_class = (Class)TPSCloudController;
  [(TPSCloudController *)&v5 dealloc];
}

- (TPSCloudController)init
{
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudController;
  v2 = [(TPSCloudController *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.tipsd.cloudQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    displayedContentIDs = v2->_displayedContentIDs;
    v2->_displayedContentIDs = (NSMutableSet *)v6;

    [(TPSCloudController *)v2 checkForUpdates];
  }
  return v2;
}

- (void)checkForUpdates
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__TPSCloudController_checkForUpdates__block_invoke;
  block[3] = &unk_1E5906740;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__TPSCloudController_checkForUpdates__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29130] defaultStore];
  [v2 synchronize];
  v3 = [v2 objectForKey:@"TPSDCloudHintDisplayed"];
  uint64_t v4 = [MEMORY[0x1E4F1CA80] setWithArray:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  if (v3)
  {
    v7 = +[TPSLogger daemon];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_19C8DC000, v7, OS_LOG_TYPE_DEFAULT, "Current cloud identifiers %@", (uint8_t *)&v9, 0xCu);
    }
  }
  v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v8 setObject:v3 forKey:@"TPSDCloudHintDisplayed"];
  [v8 synchronize];
}

- (BOOL)isHintDisplayedForContentID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__TPSCloudController_isHintDisplayedForContentID___block_invoke;
  v7[3] = &unk_1E5906768;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  LOBYTE(self) = [(id)v9[5] containsObject:v4];
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __50__TPSCloudController_isHintDisplayedForContentID___block_invoke(uint64_t a1)
{
}

- (void)hintDisplayedForContentID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__TPSCloudController_hintDisplayedForContentID___block_invoke;
  v7[3] = &unk_1E5906790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __48__TPSCloudController_hintDisplayedForContentID___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v7 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  [v6 setValue:v7 forKey:@"TPSDCloudHintDisplayed"];

  [v6 synchronize];
  id v8 = [MEMORY[0x1E4F29130] defaultStore];
  [*(id *)(a1 + 32) registerForNotifications:v8];
  int v9 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  uint64_t v10 = +[TPSLogger daemon];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_19C8DC000, v10, OS_LOG_TYPE_DEFAULT, "Synchronizing displayed content IDs to KVS store: %@", (uint8_t *)&v11, 0xCu);
  }

  [v8 setArray:v9 forKey:@"TPSDCloudHintDisplayed"];
  [v8 synchronize];
}

- (id)_listDisplayContentIDs
{
  v2 = [MEMORY[0x1E4F29130] defaultStore];
  [v2 synchronize];
  uint64_t v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (void)_clearDisplayedContentIDs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29130] defaultStore];
  uint64_t v3 = +[TPSLogger daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "synchronize"));
    int v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "Synchronizing: %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v5 = [v2 dictionaryRepresentation];
  id v6 = +[TPSLogger daemon];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_19C8DC000, v6, OS_LOG_TYPE_DEFAULT, "Current state: %@", (uint8_t *)&v11, 0xCu);
  }

  [v2 setArray:MEMORY[0x1E4F1CBF0] forKey:@"TPSDCloudHintDisplayed"];
  v7 = +[TPSLogger daemon];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "synchronize"));
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_19C8DC000, v7, OS_LOG_TYPE_DEFAULT, "Saving: %@", (uint8_t *)&v11, 0xCu);
  }
  int v9 = +[TPSLogger daemon];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v2 dictionaryRepresentation];
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_19C8DC000, v9, OS_LOG_TYPE_DEFAULT, "After state: %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)registerForNotifications:(id)a3
{
  if (!self->_registered)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 addObserver:self selector:sel_updateKVStoreItems_ name:*MEMORY[0x1E4F28A30] object:v5];

    self->_registered = 1;
  }
}

- (void)updateKVStoreItems:(id)a3
{
  id v4 = a3;
  id v5 = +[TPSAnalyticsEventDaemonActive eventWithReason:@"cloudSync" alreadyRunning:1];
  [v5 log];

  id v6 = [v4 userInfo];

  v7 = [v6 objectForKey:*MEMORY[0x1E4F28A20]];
  id v8 = v7;
  if (v7 && (unint64_t)[v7 integerValue] <= 1)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__TPSCloudController_updateKVStoreItems___block_invoke;
    v10[3] = &unk_1E5906790;
    id v11 = v6;
    v12 = self;
    dispatch_sync(queue, v10);
  }
}

void __41__TPSCloudController_updateKVStoreItems___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F28A28]];
  uint64_t v3 = [MEMORY[0x1E4F29130] defaultStore];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v3, "objectForKey:", v10, (void)v16);
        [v4 setObject:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  [v4 synchronize];
  v12 = [v3 objectForKey:@"TPSDCloudHintDisplayed"];
  uint64_t v13 = [MEMORY[0x1E4F1CA80] setWithArray:v12];
  uint64_t v14 = *(void *)(a1 + 40);
  v15 = *(void **)(v14 + 24);
  *(void *)(v14 + 24) = v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedContentIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end