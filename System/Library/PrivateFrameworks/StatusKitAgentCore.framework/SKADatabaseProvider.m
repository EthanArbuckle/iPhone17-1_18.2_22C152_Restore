@interface SKADatabaseProvider
+ (id)logger;
- (BOOL)accountCheckCompleted;
- (BOOL)accountSupportsDeviceToDeviceEncryption;
- (BOOL)cloudKitSetupCompleted;
- (BOOL)databaseHasBeenCreated;
- (BOOL)hasInitialCloudKitImportOccurred;
- (BOOL)overrideDeviceEncryptionCheck;
- (BOOL)performInitialImportQueryWithContainer:(id)a3;
- (CKContainer)ckContainer;
- (NSMutableArray)importCompletionHandlers;
- (NSPersistentContainer)persistentContainer;
- (OS_dispatch_queue)historyProcessingQueue;
- (SKADatabaseProvider)initWithDelegate:(id)a3;
- (SKADatabaseProvidingDelegate)delegate;
- (id)_persistentCloudKitContainerEventTypeToString:(int64_t)a3;
- (id)appTransactionAuthorName;
- (id)ckContainerIdentifier;
- (id)cloudDatabaseFileURL;
- (id)cloudPersistentStoreDescription;
- (id)containerName;
- (id)createCkContainer;
- (id)createPersistentContainer;
- (id)databaseDirectoryURL;
- (id)existingManagedObjectWithID:(id)a3 managedObjectContext:(id)a4;
- (id)extractModifiedChannelFromPersistentStoreRemoteChangeForChannel:(id)a3 managedObjectContext:(id)a4;
- (id)extractModifiedChannelFromPersistentStoreRemoteChangeForReceivedInvitation:(id)a3 managedObjectContext:(id)a4;
- (id)fileManager;
- (id)lastProcessedPersistentHistoryToken;
- (id)lastProcessedPersistentHistoryTokenFileURL;
- (id)localDatabaseFileURL;
- (id)localPersistentStoreDescription;
- (id)newBackgroundContext;
- (void)createPersistentContainer;
- (void)deviceToDeviceEncryptedDatabaseCapableWithCompletion:(id)a3;
- (void)handleManateeAvailabilityNotification:(id)a3;
- (void)handlePersistentStoreEventChangedNotification:(id)a3;
- (void)handlePersistentStoreRemoteChangeNotification:(id)a3;
- (void)hasInitialCloudKitImportOccurred:(id)a3;
- (void)lastProcessedPersistentHistoryToken;
- (void)processPersistentStoreRemoteChanges;
- (void)setAccountCheckCompleted:(BOOL)a3;
- (void)setAccountSupportsDeviceToDeviceEncryption:(BOOL)a3;
- (void)setCkContainer:(id)a3;
- (void)setCloudKitSetupCompleted:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHasInitialCloudKitImportOccurred:(BOOL)a3;
- (void)setHistoryProcessingQueue:(id)a3;
- (void)setImportCompletionHandlers:(id)a3;
- (void)setLastProcessedPersistentHistoryToken:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation SKADatabaseProvider

- (SKADatabaseProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SKADatabaseProvider;
  v5 = [(SKADatabaseProvider *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    importCompletionHandlers = v6->_importCompletionHandlers;
    v6->_importCompletionHandlers = (NSMutableArray *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.StatusKitAgent.CoreData.historyProcessing", v10);
    historyProcessingQueue = v6->_historyProcessingQueue;
    v6->_historyProcessingQueue = (OS_dispatch_queue *)v11;

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v6 selector:sel_handleManateeAvailabilityNotification_ name:*MEMORY[0x263EFD478] object:0];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v15 = *MEMORY[0x263EFF080];
    v16 = [(SKADatabaseProvider *)v6 persistentContainer];
    [v14 addObserver:v6 selector:sel_handlePersistentStoreEventChangedNotification_ name:v15 object:v16];
  }
  return v6;
}

- (NSPersistentContainer)persistentContainer
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_persistentContainer)
  {
    uint64_t v3 = [(SKADatabaseProvider *)v2 createPersistentContainer];
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = (NSPersistentContainer *)v3;
  }
  objc_sync_exit(v2);

  v5 = v2->_persistentContainer;
  return v5;
}

- (id)createPersistentContainer
{
  v43[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = +[SKADatabaseProvider logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Creating persistent container: %p", (uint8_t *)&buf, 0xCu);
  }

  v34 = [(SKADatabaseProvider *)self containerName];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = (void *)MEMORY[0x263EFF298];
  v43[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
  uint64_t v7 = [v5 mergedModelFromBundles:v6];

  v8 = (void *)[objc_alloc(MEMORY[0x263EFF2C0]) initWithName:v34 managedObjectModel:v7];
  v9 = [(SKADatabaseProvider *)self localPersistentStoreDescription];
  v42[0] = v9;
  v10 = [(SKADatabaseProvider *)self cloudPersistentStoreDescription];
  v42[1] = v10;
  dispatch_queue_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
  [v8 setPersistentStoreDescriptions:v11];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __48__SKADatabaseProvider_createPersistentContainer__block_invoke;
  v36[3] = &unk_2646E1EC8;
  v36[4] = &buf;
  [v8 loadPersistentStoresWithCompletionHandler:v36];
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:self selector:sel_handlePersistentStoreRemoteChangeNotification_ name:*MEMORY[0x263EFF0F8] object:v8];

    v13 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Completed creation of persistent container", v37, 2u);
    }
  }
  else
  {
    v14 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(SKADatabaseProvider *)v14 createPersistentContainer];
    }

    v13 = [objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:v7];
    v22 = [(SKADatabaseProvider *)self localPersistentStoreDescription];
    v23 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v22 URL];
      *(_DWORD *)v37 = 138412290;
      v38 = v24;
      _os_log_impl(&dword_22480C000, v23, OS_LOG_TYPE_DEFAULT, "Destroying persistent store %@", v37, 0xCu);
    }
    v25 = [v22 URL];
    v26 = [v22 type];
    v27 = [v22 options];
    id v35 = 0;
    int v28 = [v13 destroyPersistentStoreAtURL:v25 withType:v26 options:v27 error:&v35];
    id v29 = v35;

    if (v28)
    {
      v30 = +[SKADatabaseProvider logger];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = [v22 URL];
        [(SKADatabaseProvider *)v31 createPersistentContainer];
      }
    }
    else
    {
      v30 = +[SKADatabaseProvider logger];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v32 = [v22 URL];
        [(SKADatabaseProvider *)v32 createPersistentContainer];
      }
    }

    v8 = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __48__SKADatabaseProvider_createPersistentContainer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[SKADatabaseProvider logger];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48__SKADatabaseProvider_createPersistentContainer__block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Completed loading of persistent store: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)hasInitialCloudKitImportOccurred:(id)a3
{
  id aBlock = a3;
  if ([(SKADatabaseProvider *)self cloudKitSetupCompleted])
  {
    if (self->_hasInitialCloudKitImportOccurred)
    {
      id v4 = aBlock;
      if (!aBlock) {
        goto LABEL_9;
      }
      (*((void (**)(id, uint64_t))aBlock + 2))(aBlock, 1);
    }
    else
    {
      uint64_t v7 = [(SKADatabaseProvider *)self persistentContainer];
      BOOL v8 = [(SKADatabaseProvider *)self performInitialImportQueryWithContainer:v7];

      id v4 = aBlock;
      if (!aBlock) {
        goto LABEL_9;
      }
      (*((void (**)(id, BOOL))aBlock + 2))(aBlock, v8);
    }
  }
  else
  {
    id v5 = [(SKADatabaseProvider *)self importCompletionHandlers];
    id v6 = _Block_copy(aBlock);
    [v5 addObject:v6];
  }
  id v4 = aBlock;
LABEL_9:
}

- (id)appTransactionAuthorName
{
  return @"StatusKitAgent";
}

- (id)containerName
{
  return @"SKADatabaseModel";
}

- (id)ckContainerIdentifier
{
  return @"com.apple.statuskit";
}

- (CKContainer)ckContainer
{
  v2 = self;
  objc_sync_enter(v2);
  ckContainer = v2->_ckContainer;
  if (!ckContainer)
  {
    uint64_t v4 = [(SKADatabaseProvider *)v2 createCkContainer];
    id v5 = v2->_ckContainer;
    v2->_ckContainer = (CKContainer *)v4;

    ckContainer = v2->_ckContainer;
  }
  id v6 = ckContainer;
  objc_sync_exit(v2);

  return v6;
}

- (id)createCkContainer
{
  id v3 = objc_alloc(MEMORY[0x263EFD620]);
  uint64_t v4 = [(SKADatabaseProvider *)self ckContainerIdentifier];
  id v5 = (void *)[v3 initWithContainerIdentifier:v4 environment:1];

  id v6 = (void *)[objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v5];
  return v6;
}

- (id)fileManager
{
  return (id)[MEMORY[0x263F08850] defaultManager];
}

- (id)databaseDirectoryURL
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v12 = 0;
  uint64_t v4 = [v3 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:0 error:&v12];

  id v5 = [v4 URLByAppendingPathComponent:@"StatusKit" isDirectory:1];
  id v6 = [v5 URLByAppendingPathComponent:@"database" isDirectory:1];
  uint64_t v7 = [(SKADatabaseProvider *)self fileManager];
  BOOL v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = [(SKADatabaseProvider *)self fileManager];
    [v10 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v6;
}

- (id)localDatabaseFileURL
{
  v2 = [(SKADatabaseProvider *)self databaseDirectoryURL];
  id v3 = [v2 URLByAppendingPathComponent:@"statuskit-local-v1.db" isDirectory:0];

  return v3;
}

- (id)cloudDatabaseFileURL
{
  v2 = [(SKADatabaseProvider *)self databaseDirectoryURL];
  id v3 = [v2 URLByAppendingPathComponent:@"statuskit-cloud.db" isDirectory:0];

  return v3;
}

- (id)lastProcessedPersistentHistoryTokenFileURL
{
  v2 = [(SKADatabaseProvider *)self databaseDirectoryURL];
  id v3 = [v2 URLByAppendingPathComponent:@"lastProcessedPersistentHistoryToken.data" isDirectory:0];

  return v3;
}

- (id)localPersistentStoreDescription
{
  v2 = [(SKADatabaseProvider *)self localDatabaseFileURL];
  id v3 = [MEMORY[0x263EFF328] persistentStoreDescriptionWithURL:v2];
  [v3 setType:*MEMORY[0x263EFF168]];
  [v3 setConfiguration:@"Local"];
  [v3 setShouldAddStoreAsynchronously:0];
  [v3 setOption:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263EFF0B0]];
  uint64_t v4 = MEMORY[0x263EFFA88];
  [v3 setOption:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF070]];
  [v3 setOption:v4 forKey:*MEMORY[0x263EFF008]];

  return v3;
}

- (id)cloudPersistentStoreDescription
{
  id v3 = [(SKADatabaseProvider *)self cloudDatabaseFileURL];
  uint64_t v4 = [MEMORY[0x263EFF328] persistentStoreDescriptionWithURL:v3];
  [v4 setType:*MEMORY[0x263EFF168]];
  [v4 setShouldAddStoreAsynchronously:0];
  id v5 = [(SKADatabaseProvider *)self ckContainerIdentifier];
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF2E0]) initWithContainerIdentifier:v5];
  [v6 setUseDeviceToDeviceEncryption:1];
  [v6 setApsConnectionMachServiceName:@"com.apple.aps.StatusKit.CloudKitMirroring"];
  [v4 setCloudKitContainerOptions:v6];
  [v4 setConfiguration:@"Cloud"];
  uint64_t v7 = MEMORY[0x263EFFA88];
  [v4 setOption:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF0B0]];
  [v4 setOption:v7 forKey:*MEMORY[0x263EFF108]];
  [v4 setOption:v7 forKey:*MEMORY[0x263EFF070]];
  [v4 setOption:v7 forKey:*MEMORY[0x263EFF008]];

  return v4;
}

- (void)handlePersistentStoreRemoteChangeNotification:(id)a3
{
  uint64_t v4 = +[SKADatabaseProvider logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Persistent store remote change notification received.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  historyProcessingQueue = self->_historyProcessingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__SKADatabaseProvider_handlePersistentStoreRemoteChangeNotification___block_invoke;
  block[3] = &unk_2646E1E18;
  objc_copyWeak(&v7, buf);
  dispatch_async(historyProcessingQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __69__SKADatabaseProvider_handlePersistentStoreRemoteChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained processPersistentStoreRemoteChanges];
}

- (void)processPersistentStoreRemoteChanges
{
  id v3 = [(SKADatabaseProvider *)self persistentContainer];
  uint64_t v4 = (void *)[v3 newBackgroundContext];

  id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__SKADatabaseProvider_processPersistentStoreRemoteChanges__block_invoke;
  v10[3] = &unk_2646E1BE8;
  v10[4] = self;
  id v11 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [v7 performBlockAndWait:v10];
  if ((unint64_t)[v6 count] >= 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [v6 array];
    [WeakRetained databaseDidReceiveRemoteChangesForChannels:v9];
  }
}

void __58__SKADatabaseProvider_processPersistentStoreRemoteChanges__block_invoke(uint64_t a1)
{
  v59[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF310] fetchRequest];
  id v3 = [*(id *)(a1 + 32) appTransactionAuthorName];
  uint64_t v4 = (void *)MEMORY[0x263F08A98];
  v59[0] = v3;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
  id v6 = [v4 predicateWithFormat:@"author != %@" argumentArray:v5];

  [v2 setPredicate:v6];
  id v7 = [*(id *)(a1 + 32) lastProcessedPersistentHistoryToken];
  BOOL v8 = [MEMORY[0x263EFF2F8] fetchHistoryAfterToken:v7];
  [v8 setFetchRequest:v2];
  char v9 = *(void **)(a1 + 40);
  id v56 = 0;
  id v10 = [v9 executeRequest:v8 error:&v56];
  id v11 = v56;
  id v12 = [v10 result];
  v13 = v12;
  if (v11)
  {
    v14 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __58__SKADatabaseProvider_processPersistentStoreRemoteChanges__block_invoke_cold_1();
    }
    goto LABEL_30;
  }
  if ([v12 count])
  {
    v36 = 0;
    v37 = v10;
    v38 = v8;
    v39 = v7;
    uint64_t v40 = v6;
    char v41 = v3;
    v42 = v2;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v35 = v13;
    id obj = v13;
    uint64_t v45 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (!v45) {
      goto LABEL_27;
    }
    uint64_t v44 = *(void *)v52;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v52 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v15;
        uint64_t v16 = *(void **)(*((void *)&v51 + 1) + 8 * v15);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v17 = objc_msgSend(v16, "changes", v35, v36, v37, v38, v39, v40, v41, v42);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v48 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              v23 = [v22 changedObjectID];
              v24 = [v23 entity];
              v25 = [v24 name];

              v26 = (objc_class *)objc_opt_class();
              v27 = NSStringFromClass(v26);
              LODWORD(v23) = [v25 isEqualToString:v27];

              if (v23)
              {
                int v28 = [*(id *)(a1 + 32) extractModifiedChannelFromPersistentStoreRemoteChangeForChannel:v22 managedObjectContext:*(void *)(a1 + 40)];
              }
              else
              {
                id v29 = (objc_class *)objc_opt_class();
                v30 = NSStringFromClass(v29);
                int v31 = [v25 isEqualToString:v30];

                if (!v31) {
                  goto LABEL_23;
                }
                int v28 = [*(id *)(a1 + 32) extractModifiedChannelFromPersistentStoreRemoteChangeForReceivedInvitation:v22 managedObjectContext:*(void *)(a1 + 40)];
              }
              v32 = v28;
              if (v28)
              {
                v33 = [v28 identifier];
                if ([v33 length]) {
                  [*(id *)(a1 + 48) addObject:v33];
                }
              }
LABEL_23:
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v57 count:16];
          }
          while (v19);
        }

        uint64_t v15 = v46 + 1;
      }
      while (v46 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
      if (!v45)
      {
LABEL_27:

        v34 = [obj lastObject];
        v14 = [v34 token];

        [*(id *)(a1 + 32) setLastProcessedPersistentHistoryToken:v14];
        id v3 = v41;
        v2 = v42;
        id v7 = v39;
        id v6 = v40;
        id v10 = v37;
        BOOL v8 = v38;
        v13 = v35;
        id v11 = v36;
        goto LABEL_30;
      }
    }
  }
  v14 = +[SKADatabaseProvider logger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "History change request found no results.", buf, 2u);
  }
LABEL_30:
}

- (id)extractModifiedChannelFromPersistentStoreRemoteChangeForChannel:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 changeType];
  if (v8 >= 2)
  {
    if (v8 != 2)
    {
      v13 = 0;
      goto LABEL_15;
    }
    id v10 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = v6;
      _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring delete channel change: %@", (uint8_t *)&v15, 0xCu);
    }
    v13 = 0;
  }
  else
  {
    char v9 = [v6 changedObjectID];
    id v10 = [(SKADatabaseProvider *)self existingManagedObjectWithID:v9 managedObjectContext:v7];

    id v11 = +[SKADatabaseProvider logger];
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        int v15 = 138412546;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        uint64_t v18 = v6;
        _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Have channel matching persistent history change. Channel: %@ Change: %@", (uint8_t *)&v15, 0x16u);
      }

      id v10 = v10;
      v13 = v10;
    }
    else
    {
      if (v12)
      {
        int v15 = 138412290;
        uint64_t v16 = v6;
        _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Could not find channel matching persisent history change: %@", (uint8_t *)&v15, 0xCu);
      }

      v13 = 0;
    }
  }

LABEL_15:
  return v13;
}

- (id)extractModifiedChannelFromPersistentStoreRemoteChangeForReceivedInvitation:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 changeType];
  if (v8 >= 2)
  {
    if (v8 != 2)
    {
      int v15 = 0;
      goto LABEL_22;
    }
    id v10 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      uint64_t v18 = v6;
      _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring delete received invitation change: %@", (uint8_t *)&v17, 0xCu);
    }
    int v15 = 0;
  }
  else
  {
    char v9 = [v6 changedObjectID];
    id v10 = [(SKADatabaseProvider *)self existingManagedObjectWithID:v9 managedObjectContext:v7];

    id v11 = +[SKADatabaseProvider logger];
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        int v17 = 138412546;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v6;
        _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Have received invitation matching persistent history change. ReceivedInvitation: %@ Change: %@", (uint8_t *)&v17, 0x16u);
      }

      id v11 = [v10 channel];
      v13 = +[SKADatabaseProvider logger];
      v14 = v13;
      if (v11)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412546;
          uint64_t v18 = v11;
          __int16 v19 = 2112;
          uint64_t v20 = v6;
          _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "ReceivedInvitation matching persistent history change has channel. Channel: %@ Change: %@", (uint8_t *)&v17, 0x16u);
        }

        id v11 = v11;
        int v15 = v11;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SKADatabaseProvider extractModifiedChannelFromPersistentStoreRemoteChangeForReceivedInvitation:managedObjectContext:]();
        }

        int v15 = 0;
      }
    }
    else
    {
      if (v12)
      {
        int v17 = 138412290;
        uint64_t v18 = v6;
        _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Could not find encryption key matching persisent history change: %@", (uint8_t *)&v17, 0xCu);
      }
      int v15 = 0;
    }
  }
LABEL_22:

  return v15;
}

- (id)existingManagedObjectWithID:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v11 = 0;
  uint64_t v4 = [a4 existingObjectWithID:a3 error:&v11];
  id v5 = v11;
  id v6 = v5;
  if (!v4)
  {
    id v7 = [v5 domain];
    if ([v7 isEqual:*MEMORY[0x263F07F70]])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 133000)
      {
        char v9 = +[SKADatabaseProvider logger];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          v13 = v6;
          _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Did not find object matching change history event. Object has already been deleted. Error: %@", buf, 0xCu);
        }
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
    }
    char v9 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseProvider existingManagedObjectWithID:managedObjectContext:]();
    }
    goto LABEL_9;
  }
LABEL_10:

  return v4;
}

- (void)handlePersistentStoreEventChangedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263EFF088]];

  id v6 = +[SKADatabaseProvider logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = -[SKADatabaseProvider _persistentCloudKitContainerEventTypeToString:](self, "_persistentCloudKitContainerEventTypeToString:", [v5 type]);
    uint64_t v8 = [v5 endDate];
    int v12 = 138412546;
    v13 = v7;
    __int16 v14 = 2112;
    int v15 = v8;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "%@ notification received: endDate = %@", (uint8_t *)&v12, 0x16u);
  }
  if (!self->_hasInitialCloudKitImportOccurred)
  {
    uint64_t v9 = [v5 type];
    if (v9 == 1)
    {
      if (self->_hasInitialCloudKitImportOccurred) {
        goto LABEL_4;
      }
      self->_hasInitialCloudKitImportOccurred = 1;
      id v11 = [(SKADatabaseProvider *)self delegate];
      [v11 initialCloudKitImportReceived:self];
    }
    else
    {
      if (v9) {
        goto LABEL_4;
      }
      id v10 = [v5 endDate];

      if (!v10) {
        goto LABEL_4;
      }
      [(SKADatabaseProvider *)self setCloudKitSetupCompleted:1];
      id v11 = [(SKADatabaseProvider *)self persistentContainer];
      [(SKADatabaseProvider *)self performInitialImportQueryWithContainer:v11];
    }
  }
LABEL_4:
}

- (id)_persistentCloudKitContainerEventTypeToString:(int64_t)a3
{
  id v3 = @"NSPersistentCloudKitContainerEventTypeSetup";
  if (a3 == 1) {
    id v3 = @"NSPersistentCloudKitContainerEventTypeImport";
  }
  if (a3 == 2) {
    return @"NSPersistentCloudKitContainerEventTypeExport";
  }
  else {
    return v3;
  }
}

- (BOOL)performInitialImportQueryWithContainer:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[SKADatabaseProvider logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Fetching NSPersistentCloudKitContainerEvents for first import check", buf, 2u);
  }

  id v6 = [MEMORY[0x263EFF2D8] fetchRequestForEvents];
  id v7 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(succeeded == YES) AND (type == %ld) AND (endDate != nil)", 1);
  [v6 setPredicate:v7];

  uint64_t v8 = [MEMORY[0x263EFF2D8] fetchEventsMatchingFetchRequest:v6];
  [v8 setResultType:1];
  uint64_t v9 = [v4 persistentStoreCoordinator];
  id v10 = [v9 persistentStores];
  [v8 setAffectedStores:v10];

  id v11 = (void *)[v4 newBackgroundContext];
  id v29 = 0;
  int v12 = [v11 executeRequest:v8 error:&v29];
  id v13 = v29;
  __int16 v14 = [v12 result];
  int v15 = [v14 firstObject];
  uint64_t v16 = [v15 unsignedIntegerValue];

  self->_BOOL hasInitialCloudKitImportOccurred = v16 != 0;
  if ([(SKADatabaseProvider *)self cloudKitSetupCompleted])
  {
    id v24 = v13;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    int v17 = [(SKADatabaseProvider *)self importCompletionHandlers];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * i) + 16))();
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v19);
    }

    id v13 = v24;
  }
  BOOL hasInitialCloudKitImportOccurred = self->_hasInitialCloudKitImportOccurred;

  return hasInitialCloudKitImportOccurred;
}

- (id)lastProcessedPersistentHistoryToken
{
  v2 = [(SKADatabaseProvider *)self lastProcessedPersistentHistoryTokenFileURL];
  id v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v2];
  if ([v3 length])
  {
    id v8 = 0;
    id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    id v5 = v8;
    if (v5)
    {
      id v6 = +[SKADatabaseProvider logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKADatabaseProvider lastProcessedPersistentHistoryToken]();
      }
    }
  }
  else
  {
    id v5 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseProvider lastProcessedPersistentHistoryToken]();
    }
    id v4 = 0;
  }

  return v4;
}

- (void)setLastProcessedPersistentHistoryToken:(id)a3
{
  id v14 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v14];
  id v5 = v14;
  if (v5)
  {
    id v6 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseProvider setLastProcessedPersistentHistoryToken:]();
    }
  }
  else if ([v4 length])
  {
    id v6 = [(SKADatabaseProvider *)self lastProcessedPersistentHistoryTokenFileURL];
    [v4 writeToURL:v6 atomically:1];
  }
  else
  {
    id v6 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseProvider setLastProcessedPersistentHistoryToken:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)deviceToDeviceEncryptedDatabaseCapableWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = +[SKADatabaseProvider logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Checking device to device encrypted database capability.", buf, 2u);
  }

  if ([(SKADatabaseProvider *)self overrideDeviceEncryptionCheck])
  {
    id v6 = +[SKADatabaseProvider logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Overriding device-to-device encryption check because default has been set.", buf, 2u);
    }

    v4[2](v4, 1);
  }
  else if ([(SKADatabaseProvider *)self accountCheckCompleted])
  {
    v4[2](v4, [(SKADatabaseProvider *)self accountSupportsDeviceToDeviceEncryption]);
  }
  else
  {
    uint64_t v7 = [(SKADatabaseProvider *)self ckContainer];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke;
    v8[3] = &unk_2646E1EF0;
    v8[4] = self;
    uint64_t v9 = v4;
    [v7 accountInfoWithCompletionHandler:v8];
  }
}

void __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke_2;
  block[3] = &unk_2646E1628;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) supportsDeviceToDeviceEncryption];
  [*(id *)(a1 + 40) setAccountCheckCompleted:1];
  [*(id *)(a1 + 40) setAccountSupportsDeviceToDeviceEncryption:v2];
  id v3 = +[SKADatabaseProvider logger];
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Account supports device-to-device encryption", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)databaseHasBeenCreated
{
  id v3 = [(SKADatabaseProvider *)self fileManager];
  uint64_t v4 = [(SKADatabaseProvider *)self localDatabaseFileURL];
  uint64_t v5 = [v4 path];
  char v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

- (BOOL)overrideDeviceEncryptionCheck
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"skipHSA2", @"com.apple.StatusKitAgent", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)handleManateeAvailabilityNotification:(id)a3
{
  uint64_t v4 = +[SKADatabaseProvider logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Received manatee availability changed notification. Resetting account check status.", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SKADatabaseProvider_handleManateeAvailabilityNotification___block_invoke;
  block[3] = &unk_2646E1F18;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__SKADatabaseProvider_handleManateeAvailabilityNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccountCheckCompleted:0];
}

+ (id)logger
{
  if (logger_onceToken_22 != -1) {
    dispatch_once(&logger_onceToken_22, &__block_literal_global_22);
  }
  uint64_t v2 = (void *)logger__logger_22;
  return v2;
}

uint64_t __29__SKADatabaseProvider_logger__block_invoke()
{
  logger__logger_22 = (uint64_t)os_log_create("com.apple.StatusKit", "SKADatabaseProvider");
  return MEMORY[0x270F9A758]();
}

- (id)newBackgroundContext
{
  uint64_t v2 = [(SKADatabaseProvider *)self persistentContainer];
  BOOL v3 = (void *)[v2 newBackgroundContext];

  return v3;
}

- (SKADatabaseProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKADatabaseProvidingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)historyProcessingQueue
{
  return self->_historyProcessingQueue;
}

- (void)setHistoryProcessingQueue:(id)a3
{
}

- (void)setPersistentContainer:(id)a3
{
}

- (void)setCkContainer:(id)a3
{
}

- (BOOL)accountCheckCompleted
{
  return self->_accountCheckCompleted;
}

- (void)setAccountCheckCompleted:(BOOL)a3
{
  self->_accountCheckCompleted = a3;
}

- (BOOL)accountSupportsDeviceToDeviceEncryption
{
  return self->_accountSupportsDeviceToDeviceEncryption;
}

- (void)setAccountSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  self->_accountSupportsDeviceToDeviceEncryption = a3;
}

- (BOOL)hasInitialCloudKitImportOccurred
{
  return self->_hasInitialCloudKitImportOccurred;
}

- (void)setHasInitialCloudKitImportOccurred:(BOOL)a3
{
  self->_BOOL hasInitialCloudKitImportOccurred = a3;
}

- (BOOL)cloudKitSetupCompleted
{
  return self->_cloudKitSetupCompleted;
}

- (void)setCloudKitSetupCompleted:(BOOL)a3
{
  self->_cloudKitSetupCompleted = a3;
}

- (NSMutableArray)importCompletionHandlers
{
  return self->_importCompletionHandlers;
}

- (void)setImportCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_ckContainer, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_historyProcessingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)createPersistentContainer
{
}

void __48__SKADatabaseProvider_createPersistentContainer__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Failed to load persistent store. Error: %@ Store: %@");
}

void __58__SKADatabaseProvider_processPersistentStoreRemoteChanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error executing history change request: %@", v2, v3, v4, v5, v6);
}

- (void)extractModifiedChannelFromPersistentStoreRemoteChangeForReceivedInvitation:managedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "ReceivedInvitation matching persistent history change has not channel. ReceivedInvitation: %@ Change: %@");
}

- (void)existingManagedObjectWithID:managedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching object matching change transaction. Error: %@", v2, v3, v4, v5, v6);
}

- (void)lastProcessedPersistentHistoryToken
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error unarchiving last processed persistent history token. Error: %@", v2, v3, v4, v5, v6);
}

- (void)setLastProcessedPersistentHistoryToken:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setLastProcessedPersistentHistoryToken:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error archiving last processed persistent history token. Error: %@", v2, v3, v4, v5, v6);
}

void __76__SKADatabaseProvider_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end