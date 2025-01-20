@interface ICManagedObjectContextUpdater
+ (id)contextSaveNotificationFromPersistentHistoryResult:(id)a3 ignoringContextName:(id)a4 fromTransactionAuthor:(id)a5 latestToken:(id *)a6 latestTimestamp:(id *)a7;
- (BOOL)isListening;
- (BOOL)mergeWithDictionary:(id)a3;
- (ICManagedObjectContextUpdater)init;
- (ICManagedObjectContextUpdater)initWithStore:(id)a3 context:(id)a4;
- (ICSelectorDelayer)delayer;
- (NSDate)previousHistoryDate;
- (NSManagedObjectContext)context;
- (NSPersistentHistoryToken)previousHistoryToken;
- (NSPersistentStore)store;
- (OS_dispatch_queue)queue;
- (id)persistentStoreCoordinator;
- (unint64_t)numberOfCoalescedNotifications;
- (void)dealloc;
- (void)fetchChangeHistory;
- (void)handlePersistentStoreRemoteChangeNotification:(id)a3;
- (void)requestUpdate;
- (void)setContext:(id)a3;
- (void)setDelayer:(id)a3;
- (void)setListening:(BOOL)a3;
- (void)setNumberOfCoalescedNotifications:(unint64_t)a3;
- (void)setPreviousHistoryDate:(id)a3;
- (void)setPreviousHistoryToken:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
- (void)startListeningForRemoteContextDidChangeNotifications;
- (void)stopListeningForRemoteContextDidChangeNotifications;
@end

@implementation ICManagedObjectContextUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previousHistoryDate, 0);
  objc_storeStrong((id *)&self->_previousHistoryToken, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_store);
}

- (void)startListeningForRemoteContextDidChangeNotifications
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_20C263000, v1, OS_LOG_TYPE_DEBUG, "Starting to listen to %@ for %@", v2, 0x16u);
}

- (BOOL)isListening
{
  return self->_listening;
}

- (void)setListening:(BOOL)a3
{
  self->_listening = a3;
}

- (id)persistentStoreCoordinator
{
  __int16 v3 = [(ICManagedObjectContextUpdater *)self context];
  uint64_t v4 = [v3 persistentStoreCoordinator];

  if (!v4)
  {
    uint64_t v5 = [(ICManagedObjectContextUpdater *)self store];
    uint64_t v4 = [v5 persistentStoreCoordinator];
  }
  return v4;
}

- (NSManagedObjectContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (NSManagedObjectContext *)WeakRetained;
}

- (ICManagedObjectContextUpdater)initWithStore:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICManagedObjectContextUpdater;
  v8 = [(ICManagedObjectContextUpdater *)&v15 init];
  v9 = v8;
  if (v8)
  {
    [(ICManagedObjectContextUpdater *)v8 setStore:v6];
    [(ICManagedObjectContextUpdater *)v9 setContext:v7];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.notes.contextupdater", v10);
    [(ICManagedObjectContextUpdater *)v9 setQueue:v11];

    v12 = [MEMORY[0x263EFF910] date];
    [(ICManagedObjectContextUpdater *)v9 setPreviousHistoryDate:v12];

    v13 = [[ICSelectorDelayer alloc] initWithTarget:v9 selector:sel_fetchChangeHistory delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:0.1];
    [(ICManagedObjectContextUpdater *)v9 setDelayer:v13];
  }
  return v9;
}

- (void)setStore:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setPreviousHistoryDate:(id)a3
{
}

- (void)setDelayer:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (void)dealloc
{
  if ([(ICManagedObjectContextUpdater *)self isListening]) {
    [(ICManagedObjectContextUpdater *)self stopListeningForRemoteContextDidChangeNotifications];
  }
  __int16 v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICManagedObjectContextUpdater;
  [(ICManagedObjectContextUpdater *)&v4 dealloc];
}

- (ICManagedObjectContextUpdater)init
{
  return 0;
}

- (void)stopListeningForRemoteContextDidChangeNotifications
{
  os_log_t v1 = [a1 context];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_20C263000, v2, v3, "Stopping listening to store changes for %@", v4, v5, v6, v7, v8);
}

- (void)requestUpdate
{
  id v2 = [(ICManagedObjectContextUpdater *)self delayer];
  [v2 requestFire];
}

- (void)handlePersistentStoreRemoteChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICManagedObjectContextUpdater *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__ICManagedObjectContextUpdater_handlePersistentStoreRemoteChangeNotification___block_invoke;
  v7[3] = &unk_2640CD448;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __79__ICManagedObjectContextUpdater_handlePersistentStoreRemoteChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) object];
    id v6 = *(void **)(a1 + 40);
    uint64_t v5 = (id *)(a1 + 40);
    uint64_t v7 = [v6 persistentStoreCoordinator];
    int v8 = [v4 isEqual:v7];

    if (v8)
    {
      objc_msgSend(*v5, "setNumberOfCoalescedNotifications:", objc_msgSend(*v5, "numberOfCoalescedNotifications") + 1);
      v9 = os_log_create("com.apple.notes", "PersistentHistory");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __79__ICManagedObjectContextUpdater_handlePersistentStoreRemoteChangeNotification___block_invoke_cold_1(v5);
      }

      v10 = [*v5 delayer];
      [v10 requestFire];
    }
  }
}

- (void)fetchChangeHistory
{
  uint64_t v3 = [(ICManagedObjectContextUpdater *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke;
  block[3] = &unk_2640CD3A8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.notes", "PersistentHistory");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_cold_2(a1, v2);
  }

  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = (id *)(a1 + 32);
  [v4 setNumberOfCoalescedNotifications:0];
  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"UsePersistentHistoryTokens"];

  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_cold_1(v3);
    }

    int v8 = (void *)MEMORY[0x263EFF2F8];
    v9 = [*v3 previousHistoryToken];
    uint64_t v10 = [v8 fetchHistoryAfterToken:v9];
  }
  else
  {
    dispatch_queue_t v11 = (void *)MEMORY[0x263EFF2F8];
    v9 = [*v3 previousHistoryDate];
    uint64_t v10 = [v11 fetchHistoryAfterDate:v9];
  }
  v12 = (void *)v10;

  [v12 setResultType:5];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__2;
  v54 = __Block_byref_object_dispose__2;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  id v49 = 0;
  v13 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
  v14 = [*v3 context];
  objc_super v15 = [v14 persistentStoreCoordinator];
  [v13 setPersistentStoreCoordinator:v15];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_22;
  v39[3] = &unk_2640CD998;
  v42 = &v44;
  id v16 = v13;
  id v40 = v16;
  id v36 = v12;
  id v41 = v36;
  v43 = &v50;
  [v16 performBlockAndWait:v39];
  if (v51[5])
  {
    v17 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = [*v3 context];
      uint64_t v34 = v51[5];
      *(_DWORD *)buf = 138412802;
      id v57 = v32;
      __int16 v58 = 2112;
      v59 = v33;
      __int16 v60 = 2112;
      uint64_t v61 = v34;
      _os_log_error_impl(&dword_20C263000, v17, OS_LOG_TYPE_ERROR, "Error executing %@ for %@: %@", buf, 0x20u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    context = (void *)MEMORY[0x210547E60]();
    id v18 = (id)v45[5];
    v19 = objc_opt_class();
    v20 = [*v3 context];
    v21 = [v20 name];
    v22 = [*v3 context];
    v23 = [v22 transactionAuthor];
    id v37 = 0;
    id v38 = 0;
    v24 = [v19 contextSaveNotificationFromPersistentHistoryResult:v18 ignoringContextName:v21 fromTransactionAuthor:v23 latestToken:&v38 latestTimestamp:&v37];
    id v25 = v38;
    id v26 = v37;

    if (v25) {
      objc_msgSend(*v3, "setPreviousHistoryToken:", v25, context);
    }
    if (v26) {
      [*v3 setPreviousHistoryDate:v26];
    }
    if (v24) {
      [*v3 mergeWithDictionary:v24];
    }
  }
  else if (v45[5])
  {
    v27 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = objc_opt_class();
      v29 = (void *)v45[5];
      *(_DWORD *)buf = 138412546;
      id v57 = v28;
      __int16 v58 = 2112;
      v59 = v29;
      id v30 = v28;
      _os_log_impl(&dword_20C263000, v27, OS_LOG_TYPE_INFO, "Result from persistent history request was an unknown type %@: %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);
}

void __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_22(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)mergeWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(ICManagedObjectContextUpdater *)self context];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__ICManagedObjectContextUpdater_mergeWithDictionary___block_invoke;
  v8[3] = &unk_2640CD320;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = self;
  dispatch_queue_t v11 = &v12;
  [v5 performBlockAndWait:v8];

  LOBYTE(self) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

void __53__ICManagedObjectContextUpdater_mergeWithDictionary___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFF288];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) context];
  v17[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [v2 mergeChangesFromRemoteContextSave:v3 intoContexts:v5];

  uint64_t v6 = [*(id *)(a1 + 40) store];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    int v8 = [*(id *)(a1 + 40) store];
    char v9 = [v8 isReadOnly];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [*(id *)(a1 + 40) context];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "ic_save");
    }
  }
  dispatch_queue_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  char v15 = @"ICManagedObjectContextUpdaterChangeDictionaryKey";
  uint64_t v16 = v12;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v11 postNotificationName:@"ICManagedObjectContextUpdaterDidMergeNotification" object:v13 userInfo:v14];
}

+ (id)contextSaveNotificationFromPersistentHistoryResult:(id)a3 ignoringContextName:(id)a4 fromTransactionAuthor:(id)a5 latestToken:(id *)a6 latestTimestamp:(id *)a7
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v69 = a4;
  id v68 = a5;
  uint64_t v12 = [v11 result];
  objc_opt_class();
  LOBYTE(a4) = objc_opt_isKindOfClass();

  if (a4)
  {
    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    id v67 = v11;
    uint64_t v16 = [v11 result];
    v17 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[ICManagedObjectContextUpdater contextSaveNotificationFromPersistentHistoryResult:ignoringContextName:fromTransactionAuthor:latestToken:latestTimestamp:](v16);
    }
    v70 = (void *)v15;
    v71 = v13;
    v72 = v14;
    v65 = a6;
    v66 = a7;

    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = v16;
    uint64_t v18 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v20 = 0;
      v80 = 0;
      uint64_t v21 = *(void *)v83;
      if (v69) {
        BOOL v22 = v68 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      int v23 = !v22;
      int v78 = v23;
      uint64_t v76 = *MEMORY[0x263EFF010];
      uint64_t v74 = *MEMORY[0x263EFF178];
      uint64_t v75 = *MEMORY[0x263EFEFE0];
      unint64_t v24 = 0x263EFF000uLL;
      uint64_t v73 = *(void *)v83;
      do
      {
        uint64_t v25 = 0;
        uint64_t v77 = v19;
        do
        {
          if (*(void *)v83 != v21) {
            objc_enumerationMutation(obj);
          }
          id v26 = *(void **)(*((void *)&v82 + 1) + 8 * v25);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v27 = (void *)MEMORY[0x210547E60]();
            id v28 = v26;
            v29 = v28;
            if (!v20
              || ([v28 timestamp],
                  id v30 = objc_claimAutoreleasedReturnValue(),
                  [v30 timeIntervalSinceReferenceDate],
                  double v32 = v31,
                  [v20 timeIntervalSinceReferenceDate],
                  double v34 = v33,
                  v30,
                  v32 > v34))
            {
              uint64_t v35 = objc_msgSend(v29, "token", v65, v66);

              uint64_t v36 = [v29 timestamp];
              id v37 = v20;
              v20 = (void *)v36;

              v80 = (void *)v35;
            }
            id v38 = objc_msgSend(v29, "contextName", v65, v66);
            uint64_t v39 = [v29 author];
            id v40 = (void *)v39;
            if (v38) {
              int v41 = v78;
            }
            else {
              int v41 = 0;
            }
            BOOL v42 = v41 != 1 || v39 == 0;
            if (v42
              || ![v69 isEqualToString:v38]
              || ([v68 isEqualToString:v40] & 1) == 0)
            {
              v81 = v27;
              v43 = v20;
              uint64_t v44 = [v29 objectIDNotification];
              v45 = [v44 userInfo];

              uint64_t v46 = [v45 objectForKeyedSubscript:v76];
              if ([v46 count]) {
                [v71 unionSet:v46];
              }
              unint64_t v47 = v24;
              v48 = [v45 objectForKeyedSubscript:v75];
              if ([v48 count]) {
                [v72 unionSet:v48];
              }
              id v49 = [v45 objectForKeyedSubscript:v74];
              if (v49) {
                [v70 unionSet:v49];
              }

              v20 = v43;
              uint64_t v21 = v73;
              uint64_t v19 = v77;
              unint64_t v24 = v47;
              v27 = v81;
            }
          }
          else
          {
            uint64_t v50 = os_log_create("com.apple.notes", "PersistentHistory");
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v89 = v51;
              __int16 v90 = 2112;
              v91 = v26;
              id v52 = v51;
              _os_log_impl(&dword_20C263000, v50, OS_LOG_TYPE_DEFAULT, "Found unknown type %@ in persistent history sub-result array: %@", buf, 0x16u);
            }
          }
          ++v25;
        }
        while (v19 != v25);
        uint64_t v19 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
      }
      while (v19);
    }
    else
    {
      v20 = 0;
      v80 = 0;
    }
    __int16 v58 = v20;

    uint64_t v61 = v71;
    v53 = v72;
    if (-[NSObject count](v71, "count") || -[NSObject count](v72, "count") || [v70 count])
    {
      uint64_t v62 = *MEMORY[0x263EFEFE0];
      v86[0] = *MEMORY[0x263EFF010];
      v86[1] = v62;
      v87[0] = v71;
      v87[1] = v72;
      v86[2] = *MEMORY[0x263EFF178];
      v87[2] = v70;
      __int16 v60 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 3, v65, v66);
    }
    else
    {
      __int16 v60 = 0;
    }
    a7 = v66;
    id v11 = v67;
    a6 = v65;

    v59 = v80;
  }
  else
  {
    v53 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = [v11 result];
      id v55 = objc_opt_class();
      id v56 = v55;
      id v57 = [v11 result];
      *(_DWORD *)buf = 138412546;
      v89 = v55;
      __int16 v90 = 2112;
      v91 = v57;
      _os_log_impl(&dword_20C263000, v53, OS_LOG_TYPE_DEFAULT, "Subresult in persistent history result was an unknown type %@: %@", buf, 0x16u);
    }
    __int16 v58 = 0;
    v59 = 0;
    __int16 v60 = 0;
    uint64_t v61 = v53;
  }

  if (a6) {
    *a6 = v59;
  }
  if (a7) {
    *a7 = v58;
  }
  id v63 = v60;

  return v63;
}

- (NSPersistentStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  return (NSPersistentStore *)WeakRetained;
}

- (NSPersistentHistoryToken)previousHistoryToken
{
  return self->_previousHistoryToken;
}

- (void)setPreviousHistoryToken:(id)a3
{
}

- (NSDate)previousHistoryDate
{
  return self->_previousHistoryDate;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)numberOfCoalescedNotifications
{
  return self->_numberOfCoalescedNotifications;
}

- (void)setNumberOfCoalescedNotifications:(unint64_t)a3
{
  self->_numberOfCoalescedNotifications = a3;
}

- (ICSelectorDelayer)delayer
{
  return self->_delayer;
}

void __79__ICManagedObjectContextUpdater_handlePersistentStoreRemoteChangeNotification___block_invoke_cold_1(id *a1)
{
  [*a1 numberOfCoalescedNotifications];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_20C263000, v1, v2, "Received distributed save notification. numberOfCoalescedNotifications=%ld", v3, v4, v5, v6, v7);
}

void __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 previousHistoryToken];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_20C263000, v2, v3, "Previous persistent history token: %@", v4, v5, v6, v7, v8);
}

void __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = (id *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 32) context];
  uint64_t v5 = [*v3 numberOfCoalescedNotifications];
  uint64_t v6 = [*v3 previousHistoryDate];
  [v6 timeIntervalSinceReferenceDate];
  int v8 = 138412802;
  char v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Fetching change history for %@ with %ld coalesced notifications since date (%f)", (uint8_t *)&v8, 0x20u);
}

+ (void)contextSaveNotificationFromPersistentHistoryResult:(void *)a1 ignoringContextName:fromTransactionAuthor:latestToken:latestTimestamp:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_20C263000, v1, v2, "Received a persistent history result with %ld subresults", v3, v4, v5, v6, v7);
}

@end