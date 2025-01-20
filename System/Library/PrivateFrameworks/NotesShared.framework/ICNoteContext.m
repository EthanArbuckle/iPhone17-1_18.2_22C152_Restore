@interface ICNoteContext
+ (BOOL)hasContextOptions:(unint64_t)a3;
+ (BOOL)hasSharedContext;
+ (BOOL)isActive;
+ (BOOL)legacyNotesDisabled;
+ (BOOL)updateSharedStateFile:(id)a3 toState:(BOOL)a4 error:(id *)a5;
+ (ICNoteContext)sharedContext;
+ (id)filenameFromFileWrapper:(id)a3;
+ (id)initializeSearchIndexerDataSourceWithPersistentContainer:(id)a3;
+ (id)performBackgroundTaskSerialQueue;
+ (id)snapshotManagedObjectContextForContainer:(id)a3;
+ (id)workerManagedObjectContextForContainer:(id)a3;
+ (void)clearSharedContext;
+ (void)crashThisApp;
+ (void)enableLocalAccount;
+ (void)markOldTrashedNotesForDeletionInContext:(id)a3;
+ (void)resetAppContainer;
+ (void)resetAppState;
+ (void)setLegacyNotesDisabled:(BOOL)a3;
+ (void)sharedContext;
+ (void)startSharedContextWithOptions:(unint64_t)a3;
+ (void)useContainerNamed:(id)a3;
- (BOOL)canBeSharedViaICloud;
- (BOOL)databaseOpenFailedDueToLowDiskSpace;
- (BOOL)delaySaving;
- (BOOL)hasAnyContextOptions:(unint64_t)a3;
- (BOOL)hasContextOptions:(unint64_t)a3;
- (BOOL)isAllNotesContainer;
- (BOOL)isDeleted;
- (BOOL)isModernCustomFolder;
- (BOOL)isSaving;
- (BOOL)isSharedContext;
- (BOOL)isSharedReadOnly;
- (BOOL)isSharedViaICloud;
- (BOOL)isShowingDateHeaders;
- (BOOL)isTrashFolder;
- (BOOL)mergeWithSubFolderMergeableData:(id)a3;
- (BOOL)noteIsVisible:(id)a3;
- (BOOL)recoverFromSaveError;
- (BOOL)save;
- (BOOL)save:(id *)a3;
- (BOOL)saveImmediately;
- (BOOL)shouldEnsureLocalAccount;
- (BOOL)supportsDateHeaders;
- (BOOL)supportsEditingNotes;
- (BOOL)supportsVisibilityTestingType:(int64_t)a3;
- (ICAccount)noteContainerAccount;
- (ICAccountUtilities)accountUtilities;
- (ICFolderCustomNoteSortType)customNoteSortType;
- (ICManagedObjectContextUpdater)contextUpdater;
- (ICNote)currentNote;
- (ICNoteContext)initWithOptions:(unint64_t)a3;
- (ICNotesCrossProcessChangeCoordinator)crossProcessChangeCoordinator;
- (ICPersistentContainer)persistentContainer;
- (NSArray)visibleNotes;
- (NSArray)visibleSubFolders;
- (NSData)subFolderOrderMergeableData;
- (NSDictionary)persistentStoresByAccountId;
- (NSError)databaseOpenError;
- (NSManagedObjectContext)managedObjectContext;
- (NSString)accountName;
- (NSString)containerIdentifier;
- (NSString)titleForNavigationBar;
- (NSTimer)trashDeletionTimer;
- (NSTimer)updateAttachmentLocationsTimer;
- (OS_dispatch_queue)backgroundTaskQueue;
- (id)allICloudACAccounts;
- (id)customNoteSortTypeValue;
- (id)defaultPersistentStoreFromPersistentStores:(id)a3;
- (id)fetchedResultsControllerForFetchRequest:(id)a3 sectionNameKeyPath:(id)a4;
- (id)inMemoryPersistentStoreFromPersistentStores:(id)a3;
- (id)newFetchedResultsControllerForAllAccounts;
- (id)noteVisibilityTestingForSearchingAccount;
- (id)objectID;
- (id)persistentContainerQueue;
- (id)persistentStoreCoordinator;
- (id)persistentStoreForAccountID:(id)a3;
- (id)predicateForPinnedNotes;
- (id)predicateForSearchableAttachments;
- (id)predicateForSearchableNotes;
- (id)predicateForVisibleNotes;
- (id)primaryICloudACAccount;
- (id)snapshotManagedObjectContext;
- (id)storeFilenameForAccountIdentifier:(id)a3;
- (id)workerManagedObjectContext;
- (int)dateHeadersType;
- (unint64_t)contextOptions;
- (unint64_t)countOfPerformBackgroundTask;
- (unint64_t)visibleNotesCount;
- (void)accountsDidChange:(id)a3;
- (void)addOrDeleteLocalAccountIfNecessary;
- (void)applicationWillTerminate;
- (void)cleanupAdditionalPersistentStores;
- (void)clearPersistentContainer;
- (void)cloudContextFetchRecordChangeOperationDidFinish:(id)a3;
- (void)createAdditionalPersistentStoresWithAccountIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)createAdditionalPersistentStoresWithAccountIdentifiers:(id)a3 persistentContainer:(id)a4;
- (void)dealloc;
- (void)deleteEverything;
- (void)destroyPersistentStore;
- (void)ensureModernAccountExistsInContext:(id)a3;
- (void)loadAdditionalPersistentStores;
- (void)managedObjectContextDidSave:(id)a3;
- (void)managedObjectContextUpdaterDidChangeObjectWithID:(id)a3;
- (void)managedObjectContextUpdaterDidMerge:(id)a3;
- (void)performBackgroundTask:(id)a3;
- (void)performSnapshotBackgroundTask:(id)a3;
- (void)purgeDeletedObjectsInManagedObjectContext:(id)a3;
- (void)purgeEverything;
- (void)recoverFromSaveError;
- (void)refreshAll;
- (void)refreshPersistentStoresByAccountIdFromPersistentStores:(id)a3;
- (void)reloadPersistentContainer;
- (void)save;
- (void)setAccountUtilities:(id)a3;
- (void)setBackgroundTaskQueue:(id)a3;
- (void)setContextOptions:(unint64_t)a3;
- (void)setContextUpdater:(id)a3;
- (void)setCountOfPerformBackgroundTask:(unint64_t)a3;
- (void)setCrossProcessChangeCoordinator:(id)a3;
- (void)setCurrentNote:(id)a3;
- (void)setDatabaseOpenError:(id)a3;
- (void)setDatabaseOpenFailedDueToLowDiskSpace:(BOOL)a3;
- (void)setDelaySaving:(BOOL)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setPersistentStoresByAccountId:(id)a3;
- (void)setSaving:(BOOL)a3;
- (void)setShouldEnsureLocalAccount:(BOOL)a3;
- (void)setTrashDeletionTimer:(id)a3;
- (void)setUpdateAttachmentLocationsTimer:(id)a3;
- (void)setupCrossProcessChangeCoordinator;
- (void)setupTrashDeletionTimer;
- (void)startIndexingWithCoreSpotlightDelegateForDescription:(id)a3 coordinator:(id)a4;
- (void)startSearchIndexerChangeObservingIfNecessary;
- (void)updateAccounts;
@end

@implementation ICNoteContext

+ (BOOL)legacyNotesDisabled
{
  v2 = CPSharedResourcesDirectory();
  v3 = [v2 stringByAppendingString:@"/Library/Notes/.DisableLegacyNotes"];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

uint64_t __60__ICNoteContext_defaultPersistentStoreFromPersistentStores___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 URL];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __74__ICNoteContext_initializeSearchIndexerDataSourceWithPersistentContainer___block_invoke(uint64_t a1)
{
  v1 = [[ICModernSearchIndexerDataSource alloc] initWithPersistentContainer:*(void *)(a1 + 32)];
  v2 = (void *)initializeSearchIndexerDataSourceWithPersistentContainer__sDataSource;
  initializeSearchIndexerDataSourceWithPersistentContainer__sDataSource = (uint64_t)v1;

  id v3 = [MEMORY[0x1E4F837B8] sharedIndexer];
  [v3 addDataSource:initializeSearchIndexerDataSourceWithPersistentContainer__sDataSource];
}

void __36__ICNoteContext_persistentContainer__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = (id)*MEMORY[0x1E4F1BF70];
    id v3 = [MEMORY[0x1E4F837A8] standardStoreOptions];
    uint64_t v4 = (void *)[v3 mutableCopy];

    if (([*(id *)(a1 + 32) hasContextOptions:0x200000] & 1) == 0)
    {
      char v5 = ICDataStoreServiceBundleIdentifier();
      [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F1BFE8]];

      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BFD8]];
      id v6 = (id)*MEMORY[0x1E4F1BFF8];

      id v2 = v6;
    }
    if ([*(id *)(a1 + 32) hasContextOptions:2056])
    {
      uint64_t v7 = *MEMORY[0x1E4F1BF68];
      v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1BF68]];
      v9 = (void *)[v8 mutableCopy];

      if (!v9)
      {
        v9 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      [v9 setObject:@"0" forKeyedSubscript:@"cache_spill"];
      [v4 setObject:v9 forKeyedSubscript:v7];
    }
    if ([*(id *)(a1 + 32) hasContextOptions:64]) {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BF20]];
    }
    if ([*(id *)(a1 + 32) hasContextOptions:0x800000]) {
      [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F1BE50]];
    }
    if (([*(id *)(a1 + 32) hasContextOptions:721457] & 1) == 0) {
      [v4 setObject:&unk_1F1F62880 forKeyedSubscript:*MEMORY[0x1E4F1BE90]];
    }
    v10 = [MEMORY[0x1E4F837A0] persistentStoreURL];
    if (v10)
    {
      v11 = objc_alloc_init(ICNoteMergePolicy);
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F837A8]) initWithStoreURL:v10 storeType:v2 options:v4 mergePolicy:v11];
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(void **)(v13 + 16);
      *(void *)(v13 + 16) = v12;
    }
    else
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"storeURL" functionName:"-[ICNoteContext persistentContainer]_block_invoke" simulateCrash:1 showAlert:1 format:@"Couldn't find store URL for persistent container"];
    }
    uint64_t v15 = *(void *)(a1 + 32);
    if (*(void *)(v15 + 16))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __36__ICNoteContext_persistentContainer__block_invoke_2;
      aBlock[3] = &unk_1E64A6BC8;
      aBlock[4] = v15;
      v16 = _Block_copy(aBlock);
      v17 = *(void **)(*(void *)(a1 + 32) + 16);
      id v46 = 0;
      char v18 = [v17 loadPersistentStore:&v46 storeCreatedHandler:v16];
      id v19 = v46;
      v20 = os_log_create("com.apple.notes", "CoreData");
      v21 = v20;
      if (v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __36__ICNoteContext_persistentContainer__block_invoke_cold_1();
        }

        v22 = *(id **)(a1 + 32);
        v23 = [v22[2] persistentStoreCoordinator];
        v24 = [v23 persistentStores];
        [v22 refreshPersistentStoresByAccountIdFromPersistentStores:v24];
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          __36__ICNoteContext_persistentContainer__block_invoke_cold_2();
        }

        [*(id *)(a1 + 32) setDatabaseOpenError:v19];
        v23 = [v19 domain];
        if ([v23 isEqualToString:*MEMORY[0x1E4F83668]]) {
          BOOL v25 = [v19 code] == 209;
        }
        else {
          BOOL v25 = 0;
        }
        [*(id *)(a1 + 32) setDatabaseOpenFailedDueToLowDiskSpace:v25];
      }

      int v26 = [*(id *)(a1 + 32) hasContextOptions:2048];
      v27 = *(void **)(*(void *)(a1 + 32) + 16);
      if (v26)
      {
        uint64_t v28 = [v27 newBackgroundContext];
      }
      else
      {
        uint64_t v28 = [v27 viewContext];
      }
      v29 = (void *)v28;
      [*(id *)(a1 + 32) setManagedObjectContext:v28];

      if (([*(id *)(a1 + 32) hasContextOptions:64] & 1) == 0)
      {
        id v39 = v19;
        v40 = v16;
        id v41 = v2;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v30 = [*(id *)(*(void *)(a1 + 32) + 16) persistentStoreDescriptions];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v43 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              v36 = *(id **)(a1 + 32);
              v37 = [v36[2] persistentStoreCoordinator];
              [v36 startIndexingWithCoreSpotlightDelegateForDescription:v35 coordinator:v37];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v42 objects:v48 count:16];
          }
          while (v32);
        }

        id v38 = (id)[(id)objc_opt_class() initializeSearchIndexerDataSourceWithPersistentContainer:*(void *)(*(void *)(a1 + 32) + 16)];
        v16 = v40;
        id v2 = v41;
        id v19 = v39;
      }
    }
    else
    {
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F83668] code:217 userInfo:0];
      [*(id *)(a1 + 32) setDatabaseOpenError:v16];
    }
  }
}

- (BOOL)hasContextOptions:(unint64_t)a3
{
  return (a3 & ~[(ICNoteContext *)self contextOptions]) == 0;
}

- (unint64_t)contextOptions
{
  return self->_contextOptions;
}

void __36__ICNoteContext_persistentContainer__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Loaded persistent store", v2, v3, v4, v5, v6);
}

- (void)startIndexingWithCoreSpotlightDelegateForDescription:(id)a3 coordinator:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (ICUseCoreDataCoreSpotlightIntegration())
  {
    uint8_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F83728]) initForStoreWithDescription:v8 coordinator:v5 indexingPriority:2];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F83708] sharedReindexer];
      [v7 registerCoreDataCoreSpotlightDelegate:v6];

      [v6 startSpotlightIndexing];
    }
  }
}

- (void)setupCrossProcessChangeCoordinator
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Creating managed object context updater for %@", v2, v3, v4, v5, v6);
}

- (id)persistentStoreCoordinator
{
  uint64_t v2 = [(ICNoteContext *)self persistentContainer];
  uint64_t v3 = [v2 persistentStoreCoordinator];

  return v3;
}

- (id)workerManagedObjectContext
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(ICNoteContext *)self persistentContainer];
  uint64_t v5 = [v3 workerManagedObjectContextForContainer:v4];

  return v5;
}

- (ICPersistentContainer)persistentContainer
{
  uint64_t v3 = [(ICNoteContext *)self persistentContainerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ICNoteContext_persistentContainer__block_invoke;
  block[3] = &unk_1E64A4240;
  block[4] = self;
  dispatch_sync(v3, block);
  uint64_t v4 = [(ICNoteContext *)self crossProcessChangeCoordinator];

  if (!v4) {
    dispatchMainAfterDelay();
  }
  uint64_t v5 = self->_persistentContainer;

  return v5;
}

- (ICNotesCrossProcessChangeCoordinator)crossProcessChangeCoordinator
{
  return self->_crossProcessChangeCoordinator;
}

- (id)persistentContainerQueue
{
  if (persistentContainerQueue_onceToken != -1) {
    dispatch_once(&persistentContainerQueue_onceToken, &__block_literal_global_252);
  }
  uint64_t v2 = (void *)persistentContainerQueue_persistentContainerQueue;
  return v2;
}

+ (id)workerManagedObjectContextForContainer:(id)a3
{
  uint64_t v3 = (void *)[a3 newBackgroundContext];
  [v3 setAutomaticallyMergesChangesFromParent:1];
  [v3 setShouldDeleteInaccessibleFaults:1];
  return v3;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (void)setCrossProcessChangeCoordinator:(id)a3
{
}

- (void)setContextUpdater:(id)a3
{
}

- (ICManagedObjectContextUpdater)contextUpdater
{
  return self->_contextUpdater;
}

+ (id)initializeSearchIndexerDataSourceWithPersistentContainer:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ICNoteContext_initializeSearchIndexerDataSourceWithPersistentContainer___block_invoke;
  block[3] = &unk_1E64A4240;
  id v9 = v3;
  uint64_t v4 = initializeSearchIndexerDataSourceWithPersistentContainer__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&initializeSearchIndexerDataSourceWithPersistentContainer__onceToken, block);
  }
  id v6 = (id)initializeSearchIndexerDataSourceWithPersistentContainer__sDataSource;

  return v6;
}

void __47__ICNoteContext_startSharedContextWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v1 = [[ICNoteContext alloc] initWithOptions:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)sharedContext;
  sharedContext = (uint64_t)v1;
}

- (ICNoteContext)initWithOptions:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)ICNoteContext;
  uint64_t v4 = [(ICNoteContext *)&v35 init];
  id v5 = v4;
  if (!v4) {
    return v5;
  }
  [(ICNoteContext *)v4 setContextOptions:a3];
  if ([(ICNoteContext *)v5 hasAnyContextOptions:3])
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 registerDefaults:&unk_1F1F62DC8];
  }
  if ([(ICNoteContext *)v5 hasContextOptions:0x40000])
  {
    uint64_t v7 = [MEMORY[0x1E4F837A0] applicationDataContainerURL];
    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x1E4F837A0] applicationDocumentsURL];
    }
    id v8 = [v7 URLByAppendingPathComponent:@"tmp" isDirectory:1];
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v34 = 0;
      char v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v34];
      id v11 = v34;

      if ((v10 & 1) == 0)
      {
        uint64_t v12 = os_log_create("com.apple.notes", "Application");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[ICNoteContext initWithOptions:]();
        }
      }
      if (!v7)
      {
LABEL_13:
        if (!v8)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_23:
        id v18 = [v8 path];
        int v19 = setenv("TMPDIR", (const char *)[v18 fileSystemRepresentation], 1);

        os_log_t v20 = os_log_create("com.apple.notes", "Application");
        v21 = v20;
        if (v19)
        {
          v22 = v20;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[ICNoteContext initWithOptions:]();
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v8;
          _os_log_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_INFO, "setenv TMPDIR %@", buf, 0xCu);
        }

        goto LABEL_30;
      }
    }
    else
    {
      id v11 = 0;
      if (!v7) {
        goto LABEL_13;
      }
    }
    id v13 = [v7 path];
    int v14 = setenv("HOME", (const char *)[v13 fileSystemRepresentation], 1);

    os_log_t v15 = os_log_create("com.apple.notes", "Application");
    v16 = v15;
    if (v14)
    {
      v17 = v15;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ICNoteContext initWithOptions:]();
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v7;
      _os_log_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_DEFAULT, "setenv HOME %@", buf, 0xCu);
    }

    if (!v8) {
      goto LABEL_30;
    }
    goto LABEL_23;
  }
LABEL_31:
  uint64_t v23 = [(ICNoteContext *)v5 hasContextOptions:64];
  [MEMORY[0x1E4F837A0] setIsReadOnlyPersistentStore:v23];
  [(ICNoteContext *)v5 startSearchIndexerChangeObservingIfNecessary];
  if (![(ICNoteContext *)v5 hasContextOptions:0x2000])
  {
    v24 = [MEMORY[0x1E4F836D8] sharedInstance];
    [(ICNoteContext *)v5 setAccountUtilities:v24];
  }
  [(ICNoteContext *)v5 setupCrossProcessChangeCoordinator];
  [(ICNoteContext *)v5 setPersistentStoresByAccountId:0];
  [(ICNoteContext *)v5 loadAdditionalPersistentStores];
  BOOL v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 addObserver:v5 selector:sel_accountsDidChange_ name:@"ICAccountsDidChangeNotification" object:0];

  int v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v26 addObserver:v5 selector:sel_managedObjectContextUpdaterDidMerge_ name:*MEMORY[0x1E4F83690] object:0];

  if ([(ICNoteContext *)v5 hasContextOptions:1])
  {
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v28 = *MEMORY[0x1E4F1BE28];
    v29 = [(ICNoteContext *)v5 persistentStoreCoordinator];
    [v27 addObserver:v5 selector:sel_managedObjectContextDidSave_ name:v28 object:v29];

    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = v5;
    dispatchMainAfterDelay();
    v30 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v32, 3221225472, __33__ICNoteContext_initWithOptions___block_invoke, &unk_1E64A4240);
    [v30 addObserver:v33 selector:sel_cloudContextFetchRecordChangeOperationDidFinish_ name:@"ICCloudContextFetchRecordChangeOperationDidFinishNotification" object:0];
  }
  return v5;
}

- (void)startSearchIndexerChangeObservingIfNecessary
{
  if ([(ICNoteContext *)self hasContextOptions:0x10000])
  {
    id v2 = [MEMORY[0x1E4F837B8] sharedIndexer];
    [v2 setDisabled:0];
    if (([v2 isObservingChanges] & 1) == 0) {
      [v2 startObservingChanges];
    }
  }
}

- (void)setContextOptions:(unint64_t)a3
{
  self->_contextOptions = a3;
}

- (void)setAccountUtilities:(id)a3
{
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37 = objc_opt_new();
  id v5 = [(ICNoteContext *)self defaultPersistentStoreFromPersistentStores:v4];
  v36 = v4;
  uint64_t v33 = [(ICNoteContext *)self inMemoryPersistentStoreFromPersistentStores:v4];
  objc_super v35 = self;
  id v6 = [(ICNoteContext *)self accountUtilities];
  uint64_t v7 = [v6 allICloudACAccounts];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v14 = [v13 identifier];
        if (objc_msgSend(v13, "ic_isNotesEnabled"))
        {
          if (objc_msgSend(v13, "ic_isPrimaryAppleAccount"))
          {
            os_log_t v15 = os_log_create("com.apple.notes", "CoreData");
            v16 = v15;
            if (v5)
            {
              v17 = v15;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                v24 = [v5 URL];
                *(_DWORD *)buf = 138412546;
                long long v45 = v14;
                __int16 v46 = 2112;
                v47 = v24;
                _os_log_debug_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_DEBUG, "Found loaded persistent store for primary account %@: %@", buf, 0x16u);
              }
              [v37 setObject:v5 forKeyedSubscript:v14];
            }
            else
            {
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v45 = v14;
                _os_log_debug_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_DEBUG, "Didn't find a loaded persistent store for primary account %@", buf, 0xCu);
              }
            }
          }
          else if (objc_msgSend(v13, "ic_shouldCreateSeparatePersistentStore"))
          {
            id v18 = [(ICNoteContext *)v35 storeFilenameForAccountIdentifier:v14];
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __72__ICNoteContext_refreshPersistentStoresByAccountIdFromPersistentStores___block_invoke;
            v38[3] = &unk_1E64A6BF0;
            id v39 = v18;
            id v19 = v18;
            os_log_t v20 = objc_msgSend(v36, "ic_objectPassingTest:", v38);
            os_log_t v21 = os_log_create("com.apple.notes", "CoreData");
            v22 = v21;
            if (v20)
            {
              uint64_t v23 = v21;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                id v34 = [v20 URL];
                *(_DWORD *)buf = 138412546;
                long long v45 = v14;
                __int16 v46 = 2112;
                v47 = v34;
                _os_log_debug_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_DEBUG, "Found loaded persistent store for account %@: %@", buf, 0x16u);
              }
              [v37 setObject:v20 forKeyedSubscript:v14];
            }
            else
            {
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v45 = v14;
                _os_log_debug_impl(&dword_1C3A61000, v22, OS_LOG_TYPE_DEBUG, "Didn't find a loaded persistent store for account %@", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v10);
  }

  os_log_t v25 = os_log_create("com.apple.notes", "CoreData");
  os_log_t v26 = v25;
  if (v5)
  {
    v27 = v25;
    uint64_t v28 = (void *)v33;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:].cold.5(v5);
    }

    [v37 setObject:v5 forKeyedSubscript:@"LocalAccount"];
  }
  else
  {
    uint64_t v28 = (void *)v33;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:].cold.4();
    }
  }
  v29 = os_log_create("com.apple.notes", "CoreData");
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
  if (v28)
  {
    if (v30) {
      -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:]();
    }

    [v37 setObject:v28 forKeyedSubscript:@"InMemoryAccount"];
  }
  else
  {
    if (v30) {
      -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:]();
    }
  }
  uint64_t v31 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteContext refreshPersistentStoresByAccountIdFromPersistentStores:]();
  }

  uint64_t v32 = (void *)[v37 copy];
  [(ICNoteContext *)v35 setPersistentStoresByAccountId:v32];
}

- (void)setPersistentStoresByAccountId:(id)a3
{
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 URL];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Found loaded persistent store for local account: %@", v4, v5, v6, v7, v8);
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Didn't find a loaded persistent store for in-memory account.", v2, v3, v4, v5, v6);
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Loaded persistentStoresByAccountId: %@", v2, v3, v4, v5, v6);
}

- (void)loadAdditionalPersistentStores
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICNoteContext *)self accountUtilities];
  uint64_t v4 = [v3 allICloudACAccounts];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "ic_shouldCreateSeparatePersistentStore")
          && objc_msgSend(v11, "ic_isNotesEnabled"))
        {
          uint64_t v12 = [v11 identifier];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__ICNoteContext_loadAdditionalPersistentStores__block_invoke;
    v15[3] = &unk_1E64A4240;
    v16 = v13;
    int v14 = v13;
    [(ICNoteContext *)self createAdditionalPersistentStoresWithAccountIdentifiers:v5 completionBlock:v15];
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (ICAccountUtilities)accountUtilities
{
  return self->_accountUtilities;
}

- (id)inMemoryPersistentStoreFromPersistentStores:(id)a3
{
  return (id)objc_msgSend(a3, "ic_objectPassingTest:", &__block_literal_global_279);
}

- (BOOL)hasAnyContextOptions:(unint64_t)a3
{
  return ([(ICNoteContext *)self contextOptions] & a3) != 0;
}

- (id)defaultPersistentStoreFromPersistentStores:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F837A0];
  id v4 = a3;
  uint64_t v5 = [v3 persistentStoreURL];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ICNoteContext_defaultPersistentStoreFromPersistentStores___block_invoke;
  v9[3] = &unk_1E64A6BF0;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(v4, "ic_objectPassingTest:", v9);

  return v7;
}

+ (void)startSharedContextWithOptions:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Forcing SQL store", v2, v3, v4, v5, v6);
}

void __47__ICNoteContext_startSharedContextWithOptions___block_invoke_2()
{
  if (([(id)sharedContext hasContextOptions:64] & 1) == 0
    && ([(id)sharedContext hasContextOptions:8] & 1) == 0)
  {
    int v0 = ICIsSandboxModeEnabled();
    uint64_t v1 = (void *)sharedContext;
    if (v0)
    {
      [v1 updateAccounts];
    }
    else if ([(id)sharedContext hasContextOptions:721457])
    {
      [(id)sharedContext addOrDeleteLocalAccountIfNecessary];
      uint64_t v2 = [(id)sharedContext managedObjectContext];
      int v3 = [v2 hasChanges];

      if (v3)
      {
        id v4 = [(id)sharedContext managedObjectContext];
        objc_msgSend(v4, "ic_save");
      }
    }
  }
}

- (void)addOrDeleteLocalAccountIfNecessary
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Creating local account", v2, v3, v4, v5, v6);
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)shouldEnsureLocalAccount
{
  return self->_shouldEnsureLocalAccount;
}

+ (ICNoteContext)sharedContext
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)sharedContext;
  if (!sharedContext)
  {
    uint64_t v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [MEMORY[0x1E4F29060] callStackSymbols];
      +[ICNoteContext sharedContext];
    }

    uint64_t v3 = (void *)sharedContext;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return (ICNoteContext *)v6;
}

- (void)setCurrentNote:(id)a3
{
}

+ (void)startSharedContextWithOptions:(unint64_t)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  if (!sharedContext)
  {
    +[ICCloudSyncingObjectActivityEvent registerWithICCRCoder];
    +[ICRealtimeCollaborationSelectionState registerWithICCRCoder];
    +[ICTTAudioDocument registerWithICCRCoder];
    +[ICTable registerWithICCRCoder];
    if ((a3 & 0x200000) == 0)
    {
      uint64_t v5 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        +[ICNoteContext startSharedContextWithOptions:]();
      }

      if (([MEMORY[0x1E4F837D0] BOOLForKey:@"EnableXPCStore"] & 1) == 0)
      {
        id v6 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          +[ICNoteContext startSharedContextWithOptions:]();
        }

        a3 |= 0x200000uLL;
      }
    }
    uint64_t v7 = [MEMORY[0x1E4F83768] currentConfiguration];
    uint64_t v8 = [v7 container];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F83768] currentConfiguration];
      id v10 = [v9 container];
      +[ICNoteContext useContainerNamed:v10];
    }
    uint64_t v11 = [MEMORY[0x1E4F83768] currentConfiguration];
    int v12 = [v11 resetsState];

    if (v12) {
      +[ICNoteContext resetAppState];
    }
    id v13 = [MEMORY[0x1E4F83768] currentConfiguration];
    int v14 = [v13 resetsContainer];

    if (v14) {
      +[ICNoteContext resetAppContainer];
    }
    if ((a3 & 0x400000) == 0)
    {
      os_log_t v15 = [MEMORY[0x1E4F836D8] sharedInstance];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __47__ICNoteContext_startSharedContextWithOptions___block_invoke;
      v20[3] = &__block_descriptor_40_e5_v8__0l;
      v20[4] = a3;
      [v15 performBlockInPersonaContext:v20 forAccountIdentifier:0];
    }
    v16 = [(id)sharedContext managedObjectContext];
    [v16 performBlockAndWait:&__block_literal_global_34];

    if (([(id)sharedContext hasContextOptions:64] & 1) == 0)
    {
      if ([(id)sharedContext hasContextOptions:1])
      {
        long long v17 = dispatch_get_global_queue(-2, 0);
        dispatch_async(v17, &__block_literal_global_81);
      }
      else
      {
        [MEMORY[0x1E4F837D0] setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F83810]];
      }
    }
    long long v18 = [MEMORY[0x1E4F83768] currentConfiguration];
    uint64_t v19 = [v18 environment];

    if (v19 == 2) {
      +[ICNoteContext enableLocalAccount];
    }
  }
  objc_sync_exit(v4);
}

+ (void)startSharedContextWithOptions:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Note context options do not specify SQL store", v2, v3, v4, v5, v6);
}

uint64_t __47__ICNoteContext_startSharedContextWithOptions___block_invoke_3()
{
  return [MEMORY[0x1E4F837D0] setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F83810]];
}

BOOL __61__ICNoteContext_inMemoryPersistentStoreFromPersistentStores___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 type];
  BOOL v3 = v2 == (void *)*MEMORY[0x1E4F1BDE0];

  return v3;
}

void __41__ICNoteContext_persistentContainerQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.persistent-container", v2);
  uint64_t v1 = (void *)persistentContainerQueue_persistentContainerQueue;
  persistentContainerQueue_persistentContainerQueue = (uint64_t)v0;
}

+ (void)clearSharedContext
{
  if ([(id)sharedContext hasContextOptions:16])
  {
    BOOL v3 = +[ICCloudContext sharedContext];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__ICNoteContext_clearSharedContext__block_invoke;
    v6[3] = &__block_descriptor_40_e5_v8__0l;
    v6[4] = a1;
    [v3 cancelEverythingWithCompletionHandler:v6];
  }
  else
  {
    id obj = a1;
    objc_sync_enter(obj);
    uint64_t v4 = (void *)sharedContext;
    sharedContext = 0;

    objc_sync_exit(obj);
  }
}

void __35__ICNoteContext_clearSharedContext__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v1 = (void *)sharedContext;
  sharedContext = 0;

  objc_sync_exit(obj);
}

+ (BOOL)hasSharedContext
{
  return sharedContext != 0;
}

+ (void)useContainerNamed:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [MEMORY[0x1E4F837A0] resetApplicationDocumentsURL];
  uint64_t v4 = [MEMORY[0x1E4F837A0] applicationDocumentsURL];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"Containers"];

  uint8_t v6 = (void *)MEMORY[0x1E4F837A0];
  uint64_t v7 = objc_msgSend(v3, "ic_sanitizedFilenameString");
  uint64_t v8 = [v5 URLByAppendingPathComponent:v7];
  [v6 setApplicationDocumentsURL:v8];

  uint64_t v9 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Switched to container named '%@'", (uint8_t *)&v10, 0xCu);
  }
}

+ (void)enableLocalAccount
{
  if ([MEMORY[0x1E4F837D0] BOOLForKey:@"LocalNotes"])
  {
    uint64_t v2 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      __int16 v5 = 0;
      id v3 = "Local account is already enabled";
      uint64_t v4 = (uint8_t *)&v5;
LABEL_6:
      _os_log_impl(&dword_1C3A61000, v2, OS_LOG_TYPE_INFO, v3, v4, 2u);
    }
  }
  else
  {
    [MEMORY[0x1E4F837D0] setBool:1 forKey:@"LocalNotes"];
    [MEMORY[0x1E4F837D0] setBool:1 forKey:*MEMORY[0x1E4F83818]];
    uint64_t v2 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v3 = "Enabled local account";
      uint64_t v4 = buf;
      goto LABEL_6;
    }
  }
}

+ (void)resetAppState
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_FAULT, "UI state reset not implemented for iOS — skipping", v1, 2u);
}

+ (void)resetAppContainer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [MEMORY[0x1E4F837A0] applicationDocumentsURL];
  uint64_t v4 = [v2 enumeratorAtURL:v3 includingPropertiesForKeys:0 options:0 errorHandler:&__block_literal_global_111];

  uint64_t v5 = [v4 nextObject];
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v7 = (void *)v5;
  id v8 = 0;
  *(void *)&long long v6 = 138412546;
  long long v14 = v6;
  do
  {
    uint64_t v9 = v8;
    int v10 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v14);
    id v15 = v8;
    [v10 removeItemAtURL:v7 error:&v15];
    id v8 = v15;

    if (v8)
    {
      id v11 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v14;
        long long v17 = v7;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_error_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_ERROR, "Cannot remove container item {url: %@, error: %@}", buf, 0x16u);
      }
    }
    uint64_t v12 = [v4 nextObject];

    uint64_t v7 = (void *)v12;
  }
  while (v12);
  if (!v8)
  {
LABEL_9:
    id v13 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, "Successfully reset container", buf, 2u);
    }

    id v8 = 0;
  }
}

uint64_t __34__ICNoteContext_resetAppContainer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  long long v6 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __34__ICNoteContext_resetAppContainer__block_invoke_cold_1((uint64_t)v4);
  }

  return 1;
}

uint64_t __33__ICNoteContext_initWithOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupTrashDeletionTimer];
}

- (void)dealloc
{
  id v3 = [(ICNoteContext *)self trashDeletionTimer];
  [v3 invalidate];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  v5.receiver = self;
  v5.super_class = (Class)ICNoteContext;
  [(ICNoteContext *)&v5 dealloc];
}

- (void)applicationWillTerminate
{
  +[ICCloudSyncingObject resetAllDeletedByThisDeviceProperties];
  id v3 = [(ICNoteContext *)self managedObjectContext];
  [(ICNoteContext *)self purgeDeletedObjectsInManagedObjectContext:v3];

  id v4 = [(ICNoteContext *)self managedObjectContext];
  objc_msgSend(v4, "ic_save");
}

- (void)purgeDeletedObjectsInManagedObjectContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ICNoteContext *)self hasContextOptions:64])
  {
    objc_super v5 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICNoteContext purgeDeletedObjectsInManagedObjectContext:]();
    }
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"markedForDeletion == YES"];
    id v14 = v4;
    +[ICCloudSyncingObject ic_objectsMatchingPredicate:v5 context:v4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v13 = v18 = 0u;
    long long v6 = (void *)[v13 copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v11 shouldBeDeletedFromLocalDatabase]
            && ([v11 isDeleted] & 1) == 0)
          {
            uint64_t v12 = os_log_create("com.apple.notes", "Delete");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              -[ICNoteContext purgeDeletedObjectsInManagedObjectContext:]((uint64_t)v19, (uint64_t)v11);
            }

            [v11 deleteFromLocalDatabase];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }

    id v4 = v14;
  }
}

- (void)setupTrashDeletionTimer
{
  if (setupTrashDeletionTimer_onceToken != -1) {
    dispatch_once(&setupTrashDeletionTimer_onceToken, &__block_literal_global_143);
  }
  id v3 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v3 doubleForKey:@"TrashCleanupInterval"];
  double v5 = v4;

  long long v6 = [(ICNoteContext *)self trashDeletionTimer];
  [v6 invalidate];

  objc_initWeak(&location, self);
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __40__ICNoteContext_setupTrashDeletionTimer__block_invoke_148;
  uint64_t v12 = &unk_1E64A5F10;
  objc_copyWeak(&v13, &location);
  uint64_t v8 = [v7 scheduledTimerWithTimeInterval:1 repeats:&v9 block:v5];
  -[ICNoteContext setTrashDeletionTimer:](self, "setTrashDeletionTimer:", v8, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __40__ICNoteContext_setupTrashDeletionTimer__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  uint64_t v2 = @"TrashCleanupInterval";
  v3[0] = &unk_1F1F62850;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  [v0 registerDefaults:v1];
}

void __40__ICNoteContext_setupTrashDeletionTimer__block_invoke_148(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = +[ICNoteContext sharedContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__ICNoteContext_setupTrashDeletionTimer__block_invoke_2;
  v5[3] = &unk_1E64A6B30;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  [v4 performSnapshotBackgroundTask:v5];

  objc_destroyWeak(&v6);
}

void __40__ICNoteContext_setupTrashDeletionTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = (id)+[ICNoteContext performSelector:sel_beginBackgroundTaskNamed_ withObject:@"Mark Trash Notes For Deletion"];
    }
    else
    {
      id v4 = [MEMORY[0x1E4F29238] value:MEMORY[0x1E4FB2748] withObjCType:"Q"];
    }
    double v5 = v4;
    +[ICNoteContext markOldTrashedNotesForDeletionInContext:v6];
    objc_msgSend(v6, "ic_save");
    if (objc_opt_respondsToSelector()) {
      +[ICNoteContext performSelector:sel_endBackgroundTask_ withObject:v5];
    }
  }
}

+ (void)markOldTrashedNotesForDeletionInContext:(id)a3
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (markOldTrashedNotesForDeletionInContext__onceToken != -1) {
    dispatch_once(&markOldTrashedNotesForDeletionInContext__onceToken, &__block_literal_global_164_0);
  }
  id v4 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v4 doubleForKey:@"TrashedNoteLifetime"];
  double v6 = v5;

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v6];
  uint64_t v8 = os_log_create("com.apple.notes", "Delete");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[ICNoteContext markOldTrashedNotesForDeletionInContext:]();
  }

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"folder.folderType == %d", 1);
  v37[0] = v9;
  os_log_t v26 = (void *)v7;
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"folderModificationDate < %@", v7];
  v37[1] = v10;
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"markedForDeletion == NO"];
  v37[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];

  os_log_t v25 = (void *)v12;
  [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v12];
  v24 = id v13 = &off_1E64A3000;
  v27 = v3;
  +[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:");
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v23 = long long v31 = 0u;
  id v14 = (void *)[v23 copy];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v20 = os_log_create("com.apple.notes", "Delete");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = [v19 identifier];
          uint64_t v22 = [v19 folderModificationDate];
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = v21;
          __int16 v34 = 2112;
          objc_super v35 = v22;
          _os_log_debug_impl(&dword_1C3A61000, v20, OS_LOG_TYPE_DEBUG, "Marking expired trashed note (%@) as deleted. Trashed %@", buf, 0x16u);

          id v13 = &off_1E64A3000;
        }

        [v13[244] deleteNote:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }
}

void __57__ICNoteContext_markOldTrashedNotesForDeletionInContext___block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  uint64_t v2 = @"TrashedNoteLifetime";
  v3[0] = &unk_1F1F62868;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  [v0 registerDefaults:v1];
}

- (BOOL)save:(id *)a3
{
  if ([(ICNoteContext *)self hasContextOptions:64]) {
    return 1;
  }
  if (ICInternalSettingsIsTracingEnabled()) {
    kdebug_trace();
  }
  [(ICNoteContext *)self setSaving:1];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__28;
  id v13 = __Block_byref_object_dispose__28;
  id v14 = 0;
  double v6 = [(ICNoteContext *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __22__ICNoteContext_save___block_invoke;
  v8[3] = &unk_1E64A6B58;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  [v6 performBlockAndWait:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  [(ICNoteContext *)self setSaving:0];
  if (ICInternalSettingsIsTracingEnabled()) {
    kdebug_trace();
  }
  BOOL v5 = *((unsigned char *)v16 + 24) != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v5;
}

void __22__ICNoteContext_save___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  int v3 = [v2 hasChanges];

  if (v3)
  {
    id v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __22__ICNoteContext_save___block_invoke_cold_3();
    }

    BOOL v5 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v6 + 40);
    char v7 = [v5 save:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v8 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __22__ICNoteContext_save___block_invoke_cold_2();
      }
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
      && [*(id *)(a1 + 32) hasContextOptions:0x20000])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) recoverFromSaveError];
      int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      uint64_t v10 = os_log_create("com.apple.notes", "CoreData");
      uint64_t v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_INFO, "Successfully recovered from save error", v12, 2u);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __22__ICNoteContext_save___block_invoke_cold_1();
      }
    }
  }
}

- (BOOL)saveImmediately
{
  return [(ICNoteContext *)self save:0];
}

- (BOOL)save
{
  if ([(ICNoteContext *)self delaySaving])
  {
    int v3 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteContext save]();
    }

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_save object:0];
    [(ICNoteContext *)self performSelector:sel_save withObject:0 afterDelay:10.0];
    return 1;
  }
  else
  {
    return [(ICNoteContext *)self saveImmediately];
  }
}

- (BOOL)recoverFromSaveError
{
  int v3 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteContext recoverFromSaveError]();
  }

  [(ICNoteContext *)self cleanupAdditionalPersistentStores];
  id v4 = [(ICNoteContext *)self managedObjectContext];
  [v4 refreshAllObjects];

  BOOL v5 = [(ICNoteContext *)self managedObjectContext];
  [v5 rollback];

  uint64_t v6 = [(ICNoteContext *)self managedObjectContext];
  id v10 = 0;
  char v7 = [v6 save:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0) {
    abort();
  }

  return 1;
}

- (id)predicateForSearchableAttachments
{
  uint64_t v2 = [(ICNoteContext *)self managedObjectContext];
  int v3 = +[ICAttachment predicateForSearchableAttachmentsInContext:v2];

  return v3;
}

- (void)refreshAll
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "refreshAll has changes, saving", v2, v3, v4, v5, v6);
}

void __27__ICNoteContext_refreshAll__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "managedObjectContext", 0);
  uint64_t v3 = [v2 registeredObjects];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        int v9 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __27__ICNoteContext_refreshAll__block_invoke_cold_1((uint64_t)v15, v8);
        }

        id v10 = [*(id *)(a1 + 32) managedObjectContext];
        [v10 refreshObject:v8 mergeChanges:*(unsigned __int8 *)(a1 + 40)];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
}

+ (BOOL)updateSharedStateFile:(id)a3 toState:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9B8] data];
    id v13 = 0;
    [v8 writeToFile:v7 options:0 error:&v13];
    id v9 = v13;

    if (!v9 || [v9 code] != 516) {
      goto LABEL_8;
    }
LABEL_7:

    id v9 = 0;
    goto LABEL_8;
  }
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  [v10 removeItemAtPath:v7 error:&v12];
  id v9 = v12;

  if (v9 && [v9 code] == 4) {
    goto LABEL_7;
  }
LABEL_8:
  if (a5) {
    *a5 = v9;
  }

  return v9 == 0;
}

+ (void)setLegacyNotesDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[ICNoteContext legacyNotesDisabled] != a3)
  {
    uint64_t v5 = CPSharedResourcesDirectory();
    BOOL v6 = [v5 stringByAppendingString:@"/Library/Notes/.DisableLegacyNotes"];
    id v10 = 0;
    char v7 = [a1 updateSharedStateFile:v6 toState:v3 error:&v10];
    id v8 = v10;
    if ((v7 & 1) == 0)
    {
      id v9 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ICNoteContext setLegacyNotesDisabled:](v3);
      }
    }
  }
}

- (void)managedObjectContextDidSave:(id)a3
{
  uint64_t v4 = [a3 object];
  if (self->_persistentContainer)
  {
    uint64_t v5 = [(ICNoteContext *)self managedObjectContext];

    if (v4 != v5)
    {
      BOOL v6 = [(ICNoteContext *)self managedObjectContext];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __45__ICNoteContext_managedObjectContextDidSave___block_invoke;
      v7[3] = &unk_1E64A4240;
      id v8 = v4;
      [v6 performBlock:v7];
    }
  }
}

void __45__ICNoteContext_managedObjectContextDidSave___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICNoteContextDidMergeChangesFromContextDidSaveNotification" object:*(void *)(a1 + 32)];
}

- (void)accountsDidChange:(id)a3
{
  +[ICNoteContext setLegacyNotesDisabled:0];
  uint64_t v4 = [(ICNoteContext *)self accountUtilities];
  [v4 invalidateCache];

  if (+[ICAccount clearAccountForAppleCloudKitTable])
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteContext accountsDidChange:]();
    }
  }
  [(ICNoteContext *)self loadAdditionalPersistentStores];
  if (ICIsSandboxModeEnabled())
  {
    [(ICNoteContext *)self updateAccounts];
  }
  else if ([(ICNoteContext *)self hasContextOptions:721457])
  {
    [(ICNoteContext *)self addOrDeleteLocalAccountIfNecessary];
    BOOL v6 = [(ICNoteContext *)self managedObjectContext];
    int v7 = [v6 hasChanges];

    if (v7)
    {
      id v8 = [(ICNoteContext *)self managedObjectContext];
      objc_msgSend(v8, "ic_save");
    }
  }
}

- (void)updateAccounts
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Updating accounts", v2, v3, v4, v5, v6);
}

void __31__ICNoteContext_updateAccounts__block_invoke(uint64_t a1)
{
}

void __31__ICNoteContext_updateAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  int v5 = objc_msgSend(v3, "ic_isNotesEnabled");
  uint8_t v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v7 = +[ICAccount accountWithIdentifier:v4 context:v6];

  if (v5)
  {
    if (!v7 && v4 != 0)
    {
      id v9 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __31__ICNoteContext_updateAccounts__block_invoke_2_cold_1();
      }

      id v10 = [*(id *)(a1 + 32) managedObjectContext];
      id v7 = +[ICAccount newAccountWithIdentifier:v4 type:1 context:v10];

      [v7 setNeedsToBeFetchedFromCloud:1];
      long long v11 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F835F8]];
      objc_msgSend(v7, "setDidChooseToMigrate:", objc_msgSend(v11, "BOOLValue"));

      id v12 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F83600]];
      objc_msgSend(v7, "setDidFinishMigration:", objc_msgSend(v12, "BOOLValue"));

      id v13 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F83608]];
      objc_msgSend(v7, "setDidMigrateOnMac:", objc_msgSend(v13, "BOOLValue"));

      [*(id *)(a1 + 40) addObject:v7];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  if (v7)
  {
    long long v14 = [v3 accountDescription];

    if (v14)
    {
      uint64_t v15 = [v3 accountDescription];
      [v7 setName:v15];
    }
  }
}

void __31__ICNoteContext_updateAccounts__block_invoke_194()
{
  id v0 = +[ICCloudContext sharedContext];
  [v0 updateCloudContextState];
}

void __31__ICNoteContext_updateAccounts__block_invoke_2_197(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 didFinishMigration])
  {
    uint64_t v2 = +[ICDeviceMigrationState currentDeviceMigrationStateForAccount:v4];
    [v2 setState:7];
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v2 setStateModificationDate:v3];
  }
}

- (id)primaryICloudACAccount
{
  uint64_t v2 = [(ICNoteContext *)self accountUtilities];
  id v3 = [v2 primaryICloudACAccount];

  return v3;
}

- (id)allICloudACAccounts
{
  uint64_t v2 = [(ICNoteContext *)self accountUtilities];
  id v3 = [v2 allICloudACAccounts];

  return v3;
}

- (void)ensureModernAccountExistsInContext:(id)a3
{
  id v4 = a3;
  if (!+[ICAccount hasModernAccountInContext:v4])
  {
    int v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteContext ensureModernAccountExistsInContext:]();
    }

    [(ICNoteContext *)self setShouldEnsureLocalAccount:1];
    [(ICNoteContext *)self addOrDeleteLocalAccountIfNecessary];
    if (+[ICAccount hasModernAccountInContext:v4])
    {
      uint8_t v6 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Successfully created local account.", v7, 2u);
      }
    }
    else
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICNoteContext ensureModernAccountExistsInContext:]" simulateCrash:1 showAlert:0 format:@"Unable to create local account."];
    }
  }
}

- (BOOL)noteIsVisible:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  int v5 = [(ICNoteContext *)self predicateForVisibleNotes];
  char v6 = [v5 evaluateWithObject:v4];

  return v6;
}

- (NSArray)visibleNotes
{
  uint64_t v2 = [(ICNoteContext *)self managedObjectContext];
  id v3 = +[ICNote visibleNotesInContext:v2];

  return (NSArray *)v3;
}

- (unint64_t)visibleNotesCount
{
  uint64_t v2 = [(ICNoteContext *)self managedObjectContext];
  unint64_t v3 = +[ICNote countOfVisibleNotesInContext:v2];

  return v3;
}

- (id)predicateForVisibleNotes
{
  uint64_t v2 = [(ICNoteContext *)self managedObjectContext];
  unint64_t v3 = +[ICNote predicateForVisibleNotesInContext:v2];

  return v3;
}

- (id)predicateForPinnedNotes
{
  return +[ICNote predicateForPinnedNotes];
}

- (id)predicateForSearchableNotes
{
  uint64_t v2 = [(ICNoteContext *)self managedObjectContext];
  unint64_t v3 = +[ICNote predicateForSearchableNotesInContext:v2];

  return v3;
}

- (ICFolderCustomNoteSortType)customNoteSortType
{
  return 0;
}

- (id)newFetchedResultsControllerForAllAccounts
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ICAccount"];
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v8[0] = v4;
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v3 setSortDescriptors:v5];

  char v6 = [(ICNoteContext *)self fetchedResultsControllerForFetchRequest:v3 sectionNameKeyPath:0];

  return v6;
}

- (id)fetchedResultsControllerForFetchRequest:(id)a3 sectionNameKeyPath:(id)a4
{
  char v6 = (objc_class *)MEMORY[0x1E4F1C0F0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [(ICNoteContext *)self managedObjectContext];
  long long v11 = (void *)[v9 initWithFetchRequest:v8 managedObjectContext:v10 sectionNameKeyPath:v7 cacheName:0];

  id v15 = 0;
  LOBYTE(v6) = [v11 performFetch:&v15];
  id v12 = v15;
  id v13 = v12;
  if ((v6 & 1) == 0) {
    NSLog(&cfstr_ErrorProblemPe.isa, v12);
  }

  return v11;
}

- (void)clearPersistentContainer
{
  unint64_t v3 = [(ICNoteContext *)self persistentContainerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ICNoteContext_clearPersistentContainer__block_invoke;
  block[3] = &unk_1E64A4240;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __41__ICNoteContext_clearPersistentContainer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  [*(id *)(a1 + 32) setPersistentStoresByAccountId:0];
  [*(id *)(a1 + 32) setManagedObjectContext:0];
  [*(id *)(a1 + 32) setCrossProcessChangeCoordinator:0];
  id v4 = *(void **)(a1 + 32);
  return [v4 setContextUpdater:0];
}

- (void)reloadPersistentContainer
{
  [(ICNoteContext *)self clearPersistentContainer];
  id v3 = [(ICNoteContext *)self persistentContainer];
}

void __36__ICNoteContext_persistentContainer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__ICNoteContext_persistentContainer__block_invoke_3;
  v6[3] = &unk_1E64A4218;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v5 performBlock:v6];
}

void __36__ICNoteContext_persistentContainer__block_invoke_3(uint64_t a1)
{
  id v2 = +[ICAccount localAccountInContext:*(void *)(a1 + 32)];
  if (!v2)
  {
    if ([*(id *)(a1 + 40) hasContextOptions:64])
    {
      id v2 = 0;
    }
    else
    {
      id v3 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_INFO, "Creating local account.", v4, 2u);
      }

      id v2 = +[ICAccount newLocalAccountInContext:*(void *)(a1 + 32)];
      if (v2) {
        objc_msgSend(*(id *)(a1 + 32), "ic_save");
      }
    }
  }
}

void __36__ICNoteContext_persistentContainer__block_invoke_270(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) crossProcessChangeCoordinator];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 setupCrossProcessChangeCoordinator];
  }
}

void __47__ICNoteContext_loadAdditionalPersistentStores__block_invoke(uint64_t a1)
{
}

- (void)createAdditionalPersistentStoresWithAccountIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v8 = [(ICNoteContext *)self persistentContainer];
  id v9 = [(ICNoteContext *)self persistentContainerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_completionBlock___block_invoke;
  block[3] = &unk_1E64A4500;
  void block[4] = self;
  id v17 = v6;
  id v10 = v8;
  id v18 = v10;
  id v11 = v6;
  dispatch_sync(v9, block);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_completionBlock___block_invoke_2;
  v13[3] = &unk_1E64A4218;
  id v14 = v10;
  id v15 = self;
  id v12 = v10;
  dispatch_sync(v9, v13);
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __88__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createAdditionalPersistentStoresWithAccountIdentifiers:*(void *)(a1 + 40) persistentContainer:*(void *)(a1 + 48)];
}

void __88__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 persistentStores];

  [*(id *)(a1 + 40) refreshPersistentStoresByAccountIdFromPersistentStores:v3];
}

- (id)storeFilenameForAccountIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.sqlite", a3];
}

uint64_t __72__ICNoteContext_refreshPersistentStoresByAccountIdFromPersistentStores___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 URL];
  uint64_t v4 = [v3 absoluteString];
  uint64_t v5 = [v4 containsString:*(void *)(a1 + 32)];

  return v5;
}

- (void)createAdditionalPersistentStoresWithAccountIdentifiers:(id)a3 persistentContainer:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke;
  v14[3] = &unk_1E64A6C60;
  id v9 = v6;
  id v15 = v9;
  uint64_t v16 = v8;
  id v10 = v7;
  id v17 = v10;
  id v11 = [v10 performBlockWithDatabaseOpenLock:v14];
  if (v11)
  {
    id v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v11 userInfo];
      [(ICNoteContext *)(uint64_t)v11 createAdditionalPersistentStoresWithAccountIdentifiers:buf persistentContainer:v12];
    }
  }
  objc_sync_exit(v8);
}

id __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke(id *a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__28;
  v53 = __Block_byref_object_dispose__28;
  id v54 = 0;
  if ([a1[4] count])
  {
    long long v28 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = a1[4];
    uint64_t v2 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    if (v2)
    {
      uint64_t v34 = *(void *)v46;
      uint64_t v29 = *MEMORY[0x1E4F83650];
      uint64_t v27 = *MEMORY[0x1E4F1BE90];
      *(void *)&long long v3 = 138412546;
      long long v26 = v3;
      do
      {
        uint64_t v35 = v2;
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v5 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v38;
            _os_log_debug_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEBUG, "Creating persistent store for %@", buf, 0xCu);
          }

          id v6 = [a1[5] persistentStoresByAccountId];
          id v7 = [v6 objectForKeyedSubscript:v38];

          if (v7)
          {
            v37 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v38;
              _os_log_debug_impl(&dword_1C3A61000, v37, OS_LOG_TYPE_DEBUG, "Already created persistent store for %@", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v8 = [MEMORY[0x1E4F836D8] sharedInstance];
            v37 = [v8 applicationDocumentsURLForAccountIdentifier:v38];

            v36 = [v37 URLByAppendingPathComponent:v29 isDirectory:1];
            long long v31 = [a1[5] storeFilenameForAccountIdentifier:v38];
            uint64_t v9 = objc_msgSend(v36, "URLByAppendingPathComponent:isDirectory:");
            uint64_t v33 = (void *)v9;
            if (v9)
            {
              [v28 setObject:v9 forKeyedSubscript:v38];
              if (([v36 checkResourceIsReachableAndReturnError:0] & 1) != 0
                || ([MEMORY[0x1E4F28CB8] defaultManager],
                    id v10 = objc_claimAutoreleasedReturnValue(),
                    id v44 = 0,
                    [v10 createDirectoryAtURL:v36 withIntermediateDirectories:1 attributes:0 error:&v44], log = v44, v10, !log))
              {
                log = 0;
              }
              else
              {
                id v11 = os_log_create("com.apple.notes", "CoreData");
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v26;
                  v57 = v36;
                  __int16 v58 = 2112;
                  v59 = log;
                  _os_log_error_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_ERROR, "unable to create directory for secondary database. URL: %@ error: %@", buf, 0x16u);
                }
              }
              id v12 = objc_msgSend(MEMORY[0x1E4F1C190], "persistentStoreDescriptionWithURL:", v33, v26);
              [v12 setShouldAddStoreAsynchronously:0];
              if (([a1[5] hasContextOptions:721457] & 1) == 0) {
                [v12 setOption:&unk_1F1F62880 forKey:v27];
              }
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              id v13 = [a1[6] storeOptions];
              id v14 = [v13 allKeys];

              uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v55 count:16];
              if (v15)
              {
                uint64_t v16 = *(void *)v41;
                do
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v41 != v16) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * j);
                    uint64_t v19 = [a1[6] storeOptions];
                    uint64_t v20 = [v19 objectForKeyedSubscript:v18];
                    [v12 setOption:v20 forKey:v18];
                  }
                  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v55 count:16];
                }
                while (v15);
              }

              uint64_t v21 = [a1[6] persistentStoreCoordinator];
              v39[0] = MEMORY[0x1E4F143A8];
              v39[1] = 3221225472;
              v39[2] = __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_281;
              v39[3] = &unk_1E64A6C38;
              v39[5] = &v49;
              v39[4] = v38;
              [v21 addPersistentStoreWithDescription:v12 completionHandler:v39];

              if (([a1[5] hasContextOptions:64] & 1) == 0)
              {
                id v22 = a1[5];
                uint64_t v23 = [a1[6] persistentStoreCoordinator];
                [v22 startIndexingWithCoreSpotlightDelegateForDescription:v12 coordinator:v23];
              }
            }
            else
            {
              log = os_log_create("com.apple.notes", "CoreData");
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v57 = v38;
                _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Couldn't obtain a store URL to add a persistent store for %@", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v2 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
      }
      while (v2);
    }

    id v24 = (id)v50[5];
  }
  else
  {
    long long v28 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_cold_1();
    }
    id v24 = 0;
  }

  _Block_object_dispose(&v49, 8);
  return v24;
}

void __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_281(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.notes", "CoreData");
  uint64_t v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_281_cold_1(a1, v5, v8);
    }

    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_281_cold_2();
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(void *)(v9 + 40))
  {
    id v10 = v6;
    uint64_t v8 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
LABEL_9:
  }
}

- (void)cleanupAdditionalPersistentStores
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Found a persistent store that doesn't belong to the account list: %@", buf, 0xCu);
}

void __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v8 = [*(id *)(a1 + 32) storeFilenameForAccountIdentifier:a2];
  id v6 = [*(id *)(a1 + 40) absoluteString];
  int v7 = [v6 containsString:v8];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_285(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = 0;
  [v4 removePersistentStore:v3 error:&v9];
  id v5 = v9;
  id v6 = os_log_create("com.apple.notes", "CoreData");
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_285_cold_2();
    }
  }
  else
  {
    id v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_285_cold_1(v3);
    }
  }
}

+ (id)performBackgroundTaskSerialQueue
{
  if (performBackgroundTaskSerialQueue_onceToken != -1) {
    dispatch_once(&performBackgroundTaskSerialQueue_onceToken, &__block_literal_global_288);
  }
  uint64_t v2 = (void *)performBackgroundTaskSerialQueue_queue;
  return v2;
}

void __49__ICNoteContext_performBackgroundTaskSerialQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.noteContextBgTaskQueue", v2);
  uint64_t v1 = (void *)performBackgroundTaskSerialQueue_queue;
  performBackgroundTaskSerialQueue_queue = (uint64_t)v0;
}

- (void)performBackgroundTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(id)objc_opt_class() performBackgroundTaskSerialQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__ICNoteContext_performBackgroundTask___block_invoke;
    v6[3] = &unk_1E64A4F70;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __39__ICNoteContext_performBackgroundTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workerManagedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__ICNoteContext_performBackgroundTask___block_invoke_2;
  v5[3] = &unk_1E64A56C8;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  [v4 performBlockAndWait:v5];
}

uint64_t __39__ICNoteContext_performBackgroundTask___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)snapshotManagedObjectContextForContainer:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 newBackgroundContext];
  [v4 setAutomaticallyMergesChangesFromParent:0];
  uint64_t v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = __Block_byref_object_copy__28;
  v20[3] = __Block_byref_object_dispose__28;
  id v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__ICNoteContext_snapshotManagedObjectContextForContainer___block_invoke;
  v16[3] = &unk_1E64A44A8;
  id v5 = v4;
  id v17 = v5;
  uint64_t v18 = &v19;
  [v5 performBlockAndWait:v16];
  if (*(void *)(v20[0] + 40))
  {
    id v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ICNoteContext snapshotManagedObjectContextForContainer:]((uint64_t)v20, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  id v13 = v17;
  id v14 = v5;

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __58__ICNoteContext_snapshotManagedObjectContextForContainer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C1A0] currentQueryGenerationToken];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  [v2 setQueryGenerationFromToken:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (id)snapshotManagedObjectContext
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(ICNoteContext *)self persistentContainer];
  id v5 = [v3 snapshotManagedObjectContextForContainer:v4];

  return v5;
}

- (void)performSnapshotBackgroundTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(id)objc_opt_class() performBackgroundTaskSerialQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__ICNoteContext_performSnapshotBackgroundTask___block_invoke;
    v6[3] = &unk_1E64A4F70;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __47__ICNoteContext_performSnapshotBackgroundTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) snapshotManagedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ICNoteContext_performSnapshotBackgroundTask___block_invoke_2;
  v5[3] = &unk_1E64A56C8;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  [v4 performBlockAndWait:v5];
}

uint64_t __47__ICNoteContext_performSnapshotBackgroundTask___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)persistentStoreForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteContext *)self persistentStoresByAccountId];

  if (v5)
  {
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = [(ICNoteContext *)self persistentStoreCoordinator];
    id v7 = [v6 persistentStores];
    [(ICNoteContext *)self refreshPersistentStoresByAccountIdFromPersistentStores:v7];

    if (!v4)
    {
LABEL_8:
      uint64_t v11 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[ICNoteContext persistentStoreForAccountID:]();
      }

      uint64_t v10 = [(ICNoteContext *)self persistentStoreCoordinator];
      uint64_t v12 = [v10 persistentStores];
      uint64_t v9 = [(ICNoteContext *)self defaultPersistentStoreFromPersistentStores:v12];

      goto LABEL_11;
    }
  }
  uint64_t v8 = [(ICNoteContext *)self persistentStoresByAccountId];
  uint64_t v9 = [v8 objectForKeyedSubscript:v4];

  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v10 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteContext persistentStoreForAccountID:]((uint64_t)v4);
  }
LABEL_11:

  return v9;
}

- (void)destroyPersistentStore
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "error destroying persistent store: %@", v2, v3, v4, v5, v6);
}

- (void)purgeEverything
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ICNoteContext *)self className];
    *(_DWORD *)buf = 138412290;
    id v51 = v4;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Purging everything from %@", buf, 0xCu);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v37 = self;
  uint64_t v5 = [(ICNoteContext *)self managedObjectContext];
  uint8_t v6 = +[ICAccount allAccountsInContext:v5];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v12 = +[ICMedia mediaIdentifiersForAccount:v11];
        +[ICMedia purgeMediaFilesForIdentifiers:v12 account:v11];

        id v13 = +[ICAttachmentPreviewImage attachmentPreviewImageIdentifiersForAccount:v11];
        +[ICAttachmentPreviewImage purgePreviewImageFilesForIdentifiers:v13 account:v11];

        id v14 = +[ICAttachment attachmentIdentifiersForAccount:v11];
        +[ICAttachment purgeAttachmentFilesForIdentifiers:v14 account:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v8);
  }

  uint64_t v15 = +[ICHashtag fetchRequest];
  v48[0] = v15;
  uint64_t v16 = +[ICAttachmentPreviewImage fetchRequest];
  v48[1] = v16;
  id v17 = +[ICMedia fetchRequest];
  v48[2] = v17;
  uint64_t v18 = +[ICInlineAttachment fetchRequest];
  v48[3] = v18;
  uint64_t v19 = +[ICAttachment fetchRequest];
  v48[4] = v19;
  uint64_t v20 = +[ICNote fetchRequest];
  v48[5] = v20;
  id v21 = +[ICLegacyTombstone fetchRequest];
  v48[6] = v21;
  id v22 = +[ICFolder purgableFoldersFetchRequest];
  v48[7] = v22;
  uint64_t v23 = +[ICInvitation fetchRequest];
  v48[8] = v23;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:9];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v25 = v24;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:*(void *)(*((void *)&v39 + 1) + 8 * j)];
        long long v31 = [(ICNoteContext *)v37 managedObjectContext];
        id v38 = 0;
        id v32 = (id)[v31 executeRequest:v30 error:&v38];
        id v33 = v38;

        if (v33)
        {
          uint64_t v34 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v51 = v33;
            _os_log_error_impl(&dword_1C3A61000, v34, OS_LOG_TYPE_ERROR, "Error purging data: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v27);
  }

  uint64_t v35 = +[ICCloudContext sharedContext];
  [v35 deleteAllServerChangeTokens];

  v36 = [(ICNoteContext *)v37 managedObjectContext];
  objc_msgSend(v36, "ic_save");
}

- (void)deleteEverything
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(ICNoteContext *)self className];
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_INFO, "Deleting everything from %@", buf, 0xCu);
  }
  uint64_t v5 = [(ICNoteContext *)self managedObjectContext];
  uint8_t v6 = +[ICCloudSyncingObject ic_objectsMatchingPredicate:0 context:v5];
  uint64_t v7 = (void *)[v6 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v13, "isDeletable", (void)v15)) {
              objc_msgSend(v13, "markForDeletion", (void)v15);
            }
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  +[ICCloudSyncingObject resetAllDeletedByThisDeviceProperties];
  id v14 = [(ICNoteContext *)self managedObjectContext];
  [(ICNoteContext *)self purgeDeletedObjectsInManagedObjectContext:v14];

  [(ICNoteContext *)self saveImmediately];
}

+ (id)filenameFromFileWrapper:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 preferredFilename];

  if (v4)
  {
    uint64_t v5 = [v3 preferredFilename];
  }
  else
  {
    uint8_t v6 = [v3 filename];

    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v5 = [v3 filename];
  }
  uint8_t v6 = (void *)v5;
LABEL_6:

  return v6;
}

- (id)objectID
{
  [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICNoteContext objectID]" simulateCrash:1 showAlert:0 format:@"Note context does not have an object ID"];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C118]);
  return v2;
}

- (id)customNoteSortTypeValue
{
  return 0;
}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  return a3 == 1;
}

- (ICAccount)noteContainerAccount
{
  return 0;
}

- (NSString)accountName
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"All Accounts" value:@"All Accounts" table:0 allowSiri:1];
}

- (NSString)titleForNavigationBar
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"All Notes" value:@"All Notes" table:0 allowSiri:1];
}

- (BOOL)supportsEditingNotes
{
  return 1;
}

- (id)noteVisibilityTestingForSearchingAccount
{
  return +[ICNoteAllAccountVisibilityTesting sharedInstance];
}

- (BOOL)isDeleted
{
  return 0;
}

- (BOOL)isSharedViaICloud
{
  return 0;
}

- (BOOL)canBeSharedViaICloud
{
  return 0;
}

- (BOOL)isSharedReadOnly
{
  return 0;
}

- (BOOL)isAllNotesContainer
{
  return 0;
}

- (BOOL)isModernCustomFolder
{
  return 0;
}

- (BOOL)isTrashFolder
{
  return 0;
}

- (NSString)containerIdentifier
{
  return 0;
}

- (NSArray)visibleSubFolders
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSData)subFolderOrderMergeableData
{
  return 0;
}

- (BOOL)mergeWithSubFolderMergeableData:(id)a3
{
  return 0;
}

- (BOOL)supportsDateHeaders
{
  return 0;
}

- (int)dateHeadersType
{
  return 1;
}

- (BOOL)isShowingDateHeaders
{
  return 0;
}

- (OS_dispatch_queue)backgroundTaskQueue
{
  id v2 = self;
  objc_sync_enter(v2);
  backgroundTaskQueue = v2->_backgroundTaskQueue;
  if (!backgroundTaskQueue)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.notes.BackgroundTask", v4);
    uint8_t v6 = v2->_backgroundTaskQueue;
    v2->_backgroundTaskQueue = (OS_dispatch_queue *)v5;

    backgroundTaskQueue = v2->_backgroundTaskQueue;
  }
  uint64_t v7 = backgroundTaskQueue;
  objc_sync_exit(v2);

  return v7;
}

+ (void)crashThisApp
{
}

+ (BOOL)hasContextOptions:(unint64_t)a3
{
  BOOL result = sharedContext;
  if (sharedContext) {
    return [(id)sharedContext hasContextOptions:a3];
  }
  return result;
}

- (BOOL)isSharedContext
{
  return sharedContext == (void)self;
}

- (void)cloudContextFetchRecordChangeOperationDidFinish:(id)a3
{
  uint64_t v4 = [(ICNoteContext *)self backgroundTaskQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke;
  block[3] = &unk_1E64A4240;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workerManagedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke_2;
  v5[3] = &unk_1E64A4218;
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = v2;
  uint64_t v7 = v3;
  id v4 = v2;
  [v4 performBlock:v5];
}

void __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke_2(uint64_t a1)
{
  +[ICAttachmentPreviewImage deleteStrandedAttachmentPreviewImagesInContext:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) purgeDeletedObjectsInManagedObjectContext:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 32);
  id v6 = 0;
  char v3 = [v2 save:&v6];
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    dispatch_queue_t v5 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke_2_cold_1();
    }
  }
}

- (void)managedObjectContextUpdaterDidMerge:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  dispatch_queue_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F83688]];
  uint64_t v7 = ICCheckedDynamicCast();

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [v7 objectForKey:*MEMORY[0x1E4F1BFA0]];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [(ICNoteContext *)self managedObjectContextUpdaterDidChangeObjectWithID:*(void *)(*((void *)&v22 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E4F1BDF0], 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [(ICNoteContext *)self managedObjectContextUpdaterDidChangeObjectWithID:*(void *)(*((void *)&v18 + 1) + 8 * v17++)];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)managedObjectContextUpdaterDidChangeObjectWithID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(ICNoteContext *)self persistentStoreCoordinator];
  id v6 = [v5 persistentStores];
  uint64_t v7 = [v4 persistentStore];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    uint64_t v9 = [(ICNoteContext *)self managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__ICNoteContext_managedObjectContextUpdaterDidChangeObjectWithID___block_invoke;
    v10[3] = &unk_1E64A4218;
    v10[4] = self;
    id v11 = v4;
    [v9 performBlock:v10];
  }
}

void __66__ICNoteContext_managedObjectContextUpdaterDidChangeObjectWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v6 = [v2 objectWithID:*(void *)(a1 + 40)];

  objc_opt_class();
  char v3 = ICDynamicCast();
  id v4 = v3;
  if (v3)
  {
    dispatch_queue_t v5 = [v3 attachment];
    objc_msgSend(v5, "ic_postNotificationOnMainThreadWithName:", @"ICAttachmentPreviewImagesDidUpdateNotification");
  }
}

+ (BOOL)isActive
{
  return 1;
}

- (BOOL)delaySaving
{
  return self->_delaySaving;
}

- (void)setDelaySaving:(BOOL)a3
{
  self->_delaySaving = a3;
}

- (ICNote)currentNote
{
  return self->_currentNote;
}

- (NSError)databaseOpenError
{
  return self->_databaseOpenError;
}

- (void)setDatabaseOpenError:(id)a3
{
}

- (BOOL)databaseOpenFailedDueToLowDiskSpace
{
  return self->_databaseOpenFailedDueToLowDiskSpace;
}

- (void)setDatabaseOpenFailedDueToLowDiskSpace:(BOOL)a3
{
  self->_databaseOpenFailedDueToLowDiskSpace = a3;
}

- (NSTimer)updateAttachmentLocationsTimer
{
  return self->_updateAttachmentLocationsTimer;
}

- (void)setUpdateAttachmentLocationsTimer:(id)a3
{
}

- (BOOL)isSaving
{
  return self->_saving;
}

- (void)setSaving:(BOOL)a3
{
  self->_saving = a3;
}

- (NSTimer)trashDeletionTimer
{
  return self->_trashDeletionTimer;
}

- (void)setTrashDeletionTimer:(id)a3
{
}

- (void)setBackgroundTaskQueue:(id)a3
{
}

- (void)setShouldEnsureLocalAccount:(BOOL)a3
{
  self->_shouldEnsureLocalAccount = a3;
}

- (NSDictionary)persistentStoresByAccountId
{
  return self->_persistentStoresByAccountId;
}

- (unint64_t)countOfPerformBackgroundTask
{
  return self->_countOfPerformBackgroundTask;
}

- (void)setCountOfPerformBackgroundTask:(unint64_t)a3
{
  self->_countOfPerformBackgroundTask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoresByAccountId, 0);
  objc_storeStrong((id *)&self->_backgroundTaskQueue, 0);
  objc_storeStrong((id *)&self->_trashDeletionTimer, 0);
  objc_storeStrong((id *)&self->_accountUtilities, 0);
  objc_storeStrong((id *)&self->_contextUpdater, 0);
  objc_storeStrong((id *)&self->_updateAttachmentLocationsTimer, 0);
  objc_storeStrong((id *)&self->_databaseOpenError, 0);
  objc_storeStrong((id *)&self->_currentNote, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_crossProcessChangeCoordinator, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

+ (void)sharedContext
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "No shared context: %@", buf, 0xCu);
}

void __34__ICNoteContext_resetAppContainer__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v1, v2, "Cannot remove container item {url: %@, error: %@}", (void)v3, DWORD2(v3));
}

- (void)initWithOptions:.cold.1()
{
  OUTLINED_FUNCTION_4();
  dispatch_queue_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v1, v2, "setenv TMPDIR %@ failed because %s", v3, v4, v5, v6, v7);
}

- (void)initWithOptions:.cold.2()
{
  OUTLINED_FUNCTION_4();
  dispatch_queue_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v1, v2, "setenv HOME %@ failed because %s", v3, v4, v5, v6, v7);
}

- (void)initWithOptions:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error creating temporary directory SQL: %@", v2, v3, v4, v5, v6);
}

- (void)purgeDeletedObjectsInManagedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to delete objects with a read only persistent store", v2, v3, v4, v5, v6);
}

- (void)purgeDeletedObjectsInManagedObjectContext:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "shortLoggingDescription");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_9_3(&dword_1C3A61000, v5, v6, "Deleting object from database because it's marked for deletion and its deletion has synced: %@");
}

+ (void)markOldTrashedNotesForDeletionInContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Marking expired trashed notes as deleted. Cutoff date is %@", v2, v3, v4, v5, v6);
}

void __22__ICNoteContext_save___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Failed to recover from save error", v2, v3, v4, v5, v6);
}

void __22__ICNoteContext_save___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(*(void *)(*(void *)v2 + 8) + 40) domain];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)v1 + 8) + 40) code];
  uint64_t v5 = *(void *)(*(void *)(*(void *)v1 + 8) + 40);
  int v6 = 138412802;
  uint8_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Error saving main managedObjectContext: Domain=%@ Code=%ld \"%@\"", (uint8_t *)&v6, 0x20u);
}

void __22__ICNoteContext_save___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Saving main managedObjectContext", v2, v3, v4, v5, v6);
}

- (void)save
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Delayed ICNoteContext save.", v2, v3, v4, v5, v6);
}

- (void)recoverFromSaveError
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Error saving context. Rolling back.", v2, v3, v4, v5, v6);
}

void __27__ICNoteContext_refreshAll__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "objectID");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_9_3(&dword_1C3A61000, v5, v6, "refreshing objectID %@");
}

+ (void)setLegacyNotesDisabled:(char)a1 .cold.1(char a1)
{
  uint64_t v1 = @"disabling";
  if ((a1 & 1) == 0) {
    uint64_t v1 = @"enabling";
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v2, v3, "Error %@ legacy notes: %@", (void)v4, DWORD2(v4));
}

- (void)accountsDidChange:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Released the cached CloudKit account", v2, v3, v4, v5, v6);
}

void __31__ICNoteContext_updateAccounts__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Creating account: %@", v2, v3, v4, v5, v6);
}

- (void)ensureModernAccountExistsInContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "No modern accounts were found in hosted scene, trying to create a blank modern local account as a fallback.", v2, v3, v4, v5, v6);
}

void __36__ICNoteContext_persistentContainer__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error loading persistent store: %@", v2, v3, v4, v5, v6);
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Found loaded persistent store for in-memory account: %@", v2, v3, v4, v5, v6);
}

- (void)refreshPersistentStoresByAccountIdFromPersistentStores:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Didn't find a loaded persistent store for local account.", v2, v3, v4, v5, v6);
}

- (void)createAdditionalPersistentStoresWithAccountIdentifiers:(uint8_t *)buf persistentContainer:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Returned error while creating additional persistent stores: %@, %@", buf, 0x16u);
}

void __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "No identifiers to create persistent stores.", v2, v3, v4, v5, v6);
}

void __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_281_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 URL];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Added persistent store for account %@: %@", (uint8_t *)&v6, 0x16u);
}

void __92__ICNoteContext_createAdditionalPersistentStoresWithAccountIdentifiers_persistentContainer___block_invoke_281_cold_2()
{
  OUTLINED_FUNCTION_4();
  uint64_t v7 = [v0 userInfo];
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v1, v2, "Error while adding persistent store: %@, %@", v3, v4, v5, v6, 2u);
}

void __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_285_cold_1(void *a1)
{
  uint64_t v1 = [a1 URL];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Removed persistent store: %@", v4, v5, v6, v7, v8);
}

void __50__ICNoteContext_cleanupAdditionalPersistentStores__block_invoke_285_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error removing persistent store: %@", v2, v3, v4, v5, v6);
}

+ (void)snapshotManagedObjectContextForContainer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)persistentStoreForAccountID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "No persistent store for account ID %@, assuming default persistent store", v2, v3, v4, v5, v6);
}

- (void)persistentStoreForAccountID:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_DEBUG, "Found persistent store for account ID %@: %@", (uint8_t *)&v2, 0x16u);
}

void __65__ICNoteContext_cloudContextFetchRecordChangeOperationDidFinish___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Failed to save after doing background tasks: %@", v2, v3, v4, v5, v6);
}

@end