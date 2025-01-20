@interface UNCSpotlightDaemonClient
+ (id)sharedInstance;
- (UNCSpotlightDaemonClient)init;
- (uint64_t)init;
- (void)addObserver:(id)a3;
- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6;
- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4;
@end

@implementation UNCSpotlightDaemonClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __42__UNCSpotlightDaemonClient_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(UNCSpotlightDaemonClient);

  return MEMORY[0x270F9A758]();
}

- (UNCSpotlightDaemonClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)UNCSpotlightDaemonClient;
  v2 = [(UNCSpotlightDaemonClient *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = v2;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    v6 = (void (*)(__CFString *, UNCSpotlightDaemonClient *))getSpotlightDaemonClientRegisterSymbolLoc_ptr;
    v19 = getSpotlightDaemonClientRegisterSymbolLoc_ptr;
    if (!getSpotlightDaemonClientRegisterSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      v13 = __getSpotlightDaemonClientRegisterSymbolLoc_block_invoke;
      v14 = &unk_2655675A0;
      v15 = &v16;
      __getSpotlightDaemonClientRegisterSymbolLoc_block_invoke((uint64_t)buf);
      v6 = (void (*)(__CFString *, UNCSpotlightDaemonClient *))v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v6)
    {
      v9 = (_Unwind_Exception *)-[UNCSpotlightDaemonClient init]();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(v9);
    }
    v6(@"com.apple.corespotlight.daemon.notifications", v5);

    v7 = *MEMORY[0x263F1E078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E078], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "Registered as Spotlight client", buf, 2u);
    }
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  if (a8) {
    (*((void (**)(id, void, void))a8 + 2))(a8, 0, 0);
  }
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  if (a8) {
    (*((void (**)(id, void, void))a8 + 2))(a8, 0, 0);
  }
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  if (a6) {
    (*((void (**)(id))a6 + 2))(a6);
  }
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27 = [MEMORY[0x263EFF980] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v9 = NSString;
        uint64_t v10 = objc_opt_class();
        v11 = [v8 uniqueIdentifier];
        uint64_t v12 = [v8 attributeSet];
        uint64_t v13 = [v12 summarizationStatus];
        v14 = [v8 attributeSet];
        v15 = [v9 stringWithFormat:@"<%@:%p, %@, %d, %d>", v10, v8, v11, v13, objc_msgSend(v14, "urgencyStatus")];
        [v27 addObject:v15];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v5);
  }

  uint64_t v16 = (os_log_t *)MEMORY[0x263F1E078];
  v17 = *MEMORY[0x263F1E078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E078], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v38 = a4;
    __int16 v39 = 2112;
    v40 = v27;
    _os_log_impl(&dword_2608DB000, v17, OS_LOG_TYPE_DEFAULT, "SpotlightDaemonClient searchableItemsDidUpdate: %lu, %@", buf, 0x16u);
  }
  if (a4)
  {
    uint64_t v18 = self->_observers;
    objc_sync_enter(v18);
    if ([(NSHashTable *)self->_observers count])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v19 = self->_observers;
      uint64_t v20 = [(NSHashTable *)v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v19);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * j) searchableItemsDidUpdate:obj];
          }
          uint64_t v20 = [(NSHashTable *)v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v20);
      }
    }
    else
    {
      v23 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
        -[UNCSpotlightDaemonClient searchableItemsDidUpdate:mask:](v23);
      }
    }
    objc_sync_exit(v18);
  }
}

- (void).cxx_destruct
{
}

- (uint64_t)init
{
  dlerror();
  v0 = abort_report_np();
  return -[UNCSpotlightDaemonClient searchableItemsDidUpdate:mask:](v0);
}

- (void)searchableItemsDidUpdate:(os_log_t)log mask:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "SpotlightDaemonClient no observers", v1, 2u);
}

@end