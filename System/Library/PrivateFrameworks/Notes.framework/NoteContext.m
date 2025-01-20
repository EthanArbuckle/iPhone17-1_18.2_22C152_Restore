@interface NoteContext
+ (BOOL)databaseIsCorrupt:(id)a3;
+ (BOOL)isDataProtectionError:(id)a3;
+ (BOOL)isTooLowOnDiskSpace;
+ (BOOL)shouldLogIndexing;
+ (NSFetchRequest)newFetchRequestForNotes;
+ (NSManagedObjectModel)managedObjectModel;
+ (id)allVisibleNotesMatchingPredicate:(id)a3 context:(id)a4;
+ (id)allVisibleNotesMatchingPredicate:(id)a3 sorted:(BOOL)a4 context:(id)a5;
+ (id)allVisibleNotesMatchingPredicate:(id)a3 sorted:(BOOL)a4 context:(id)a5 fetchLimit:(unint64_t)a6;
+ (id)backupsDirectoryURL;
+ (id)defaultNotesSortDescriptors;
+ (id)fileProtectionOption;
+ (id)fileURLProtectionOption;
+ (id)generateGUID;
+ (id)mainContextObjectFromObject:(id)a3;
+ (id)newFetchRequestForAccounts;
+ (id)newFetchRequestForStores;
+ (id)newManagedObjectContext;
+ (id)newlyAddedAttachmentInContext:(id)a3;
+ (id)persistentStoreCoordinator;
+ (id)searchIndexerDataSource;
+ (id)sharedContext;
+ (id)storeOptions;
+ (id)urlForPersistentStore;
+ (id)visibleNotesIncludingEmptyBodyContentPredicate;
+ (id)visibleNotesPredicate;
+ (unint64_t)countOfVisibleNotesInCollection:(id)a3;
+ (unint64_t)countOfVisibleNotesInCollectionIncludingNotesWithoutBodyContent:(id)a3;
+ (unint64_t)countOfVisibleNotesMatchingPredicate:(id)a3 context:(id)a4;
+ (unint64_t)countOfVisibleNotesMatchingPredicate:(id)a3 includingNoteWithoutBodyContent:(BOOL)a4 context:(id)a5;
+ (void)backupPersistentStore:(id)a3;
+ (void)clearTestsNotesRootPath;
+ (void)isTooLowOnDiskSpace;
+ (void)removeConflictingSqliteAndIdxFiles;
+ (void)removeSqliteAndIdxFiles;
+ (void)setTestsNotesRootPath:(id)a3;
- (AccountUtilities)accountUtilities;
- (BOOL)deleteAccount:(id)a3;
- (BOOL)deleteStore:(id)a3;
- (BOOL)forceDeleteAccount:(id)a3;
- (BOOL)hasMultipleEnabledStores;
- (BOOL)isMainContext;
- (BOOL)save:(id *)a3;
- (BOOL)saveSilently:(id *)a3;
- (BOOL)setUpCoreDataStack;
- (BOOL)setUpLastIndexTid;
- (BOOL)setUpLocalAccountAndStore;
- (BOOL)shouldDisableLocalStore;
- (BOOL)shouldObserveDarwinNotifications;
- (BOOL)usePrivateQueue;
- (ICManagedObjectContextUpdater)mocUpdater;
- (ICSelectorDelayer)externalChangeNotificationDelayer;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NoteContext)init;
- (NoteContext)initWithAccountUtilities:(id)a3;
- (NoteContext)initWithAccountUtilities:(id)a3 inMigrator:(BOOL)a4;
- (NoteContext)initWithAccountUtilities:(id)a3 inMigrator:(BOOL)a4 isMainContext:(BOOL)a5 usePrivateQueue:(BOOL)a6;
- (NoteContext)initWithPrivateQueue;
- (NoteContext)initWithPrivateQueue:(BOOL)a3;
- (id)_notePropertyObjectForKey:(id)a3;
- (id)accountForAccountId:(id)a3;
- (id)allAccounts;
- (id)allAccountsAsFaults:(BOOL)a3 prefechedRelationshipKeyPaths:(id)a4;
- (id)allNotes;
- (id)allNotesInCollection:(id)a3;
- (id)allNotesMatchingPredicate:(id)a3;
- (id)allNotesWithoutBodiesInCollection:(id)a3;
- (id)allStores;
- (id)allVisibleNotes;
- (id)allVisibleNotesInCollection:(id)a3;
- (id)allVisibleNotesInCollection:(id)a3 sorted:(BOOL)a4;
- (id)allVisibleNotesMatchingPredicate:(id)a3;
- (id)allVisibleNotesMatchingPredicate:(id)a3 sorted:(BOOL)a4;
- (id)collectionForInfo:(id)a3;
- (id)collectionForObjectID:(id)a3;
- (id)defaultStoreForNewNote;
- (id)faultedInStoresForAccounts:(id)a3;
- (id)getNextIdObject;
- (id)initForMainContext;
- (id)initForMigrator;
- (id)liveNotesNeedingBodiesPredicate;
- (id)localAccount;
- (id)localStore;
- (id)mostRecentlyModifiedNoteInCollection:(id)a3;
- (id)newFRCForAccountsWithDelegate:(id)a3;
- (id)newFRCForCollection:(id)a3 delegate:(id)a4;
- (id)newFRCForCollection:(id)a3 delegate:(id)a4 performFetch:(BOOL)a5;
- (id)newFRCForFetchRequest:(id)a3 delegate:(id)a4 performFetch:(BOOL)a5;
- (id)newFRCForStoresWithDelegate:(id)a3;
- (id)newFetchRequestForNotes;
- (id)newlyAddedAccount;
- (id)newlyAddedAttachment;
- (id)newlyAddedNote;
- (id)newlyAddedNoteWithGUID:(id)a3;
- (id)newlyAddedStore;
- (id)newlyCreatedNoteFromDefaultStore;
- (id)nextIndex;
- (id)noteChangeWithType:(int)a3 store:(id)a4;
- (id)noteForGUID:(id)a3;
- (id)noteForObjectID:(id)a3;
- (id)notesForIntegerIds:(id)a3;
- (id)propertyValueForKey:(id)a3;
- (id)storeForExternalIdentifier:(id)a3;
- (id)storeForObjectID:(id)a3;
- (id)storesInCollection:(id)a3;
- (id)visibleNoteForObjectID:(id)a3;
- (id)visibleNotesForIntegerIds:(id)a3;
- (id)visibleNotesPredicate;
- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6;
- (unint64_t)countOfNotes;
- (unint64_t)countOfNotesInCollection:(id)a3;
- (unint64_t)countOfNotesMatchingPredicate:(id)a3;
- (unint64_t)countOfStores;
- (unint64_t)countOfVisibleNotes;
- (unint64_t)countOfVisibleNotesInCollection:(id)a3;
- (unint64_t)countOfVisibleNotesMatchingPredicate:(id)a3;
- (void)_createLocalAccount:(id *)a3 andStore:(id *)a4;
- (void)allStores;
- (void)batchFaultNotes:(id)a3;
- (void)cleanUpLocks;
- (void)clearCaches;
- (void)countOfStores;
- (void)dealloc;
- (void)deleteChanges:(id)a3;
- (void)deleteNote:(id)a3;
- (void)deleteNoteRegardlessOfConstraints:(id)a3;
- (void)enableChangeLogging:(BOOL)a3;
- (void)forceSetUpUniqueObjects;
- (void)getNextIdObject;
- (void)handleMigration;
- (void)invalidate;
- (void)localAccount;
- (void)managedObjectContext;
- (void)managedObjectContextWillSaveNotification:(id)a3;
- (void)nextIndex;
- (void)postNotesChangedExternally;
- (void)receiveDarwinNotificationWithChangeLogging:(BOOL)a3;
- (void)resetNotificationCount;
- (void)setAccountUtilities:(id)a3;
- (void)setExternalChangeNotificationDelayer:(id)a3;
- (void)setHasPriorityInSaveConflicts:(BOOL)a3;
- (void)setIsMainContext:(BOOL)a3;
- (void)setMocUpdater:(id)a3;
- (void)setPropertyValue:(id)a3 forKey:(id)a4;
- (void)setUpLastIndexTid;
- (void)setUpLocalAccountAndStore;
- (void)setUpUniqueObjects;
- (void)setUsePrivateQueue:(BOOL)a3;
- (void)sortNotes:(id)a3;
- (void)tearDownCoreDataStack;
- (void)trackChanges:(id)a3;
- (void)updateForRecentChanges;
@end

@implementation NoteContext

- (void)enableChangeLogging:(BOOL)a3
{
  self->_logChanges = a3;
}

void __59__NoteContext_newFRCForFetchRequest_delegate_performFetch___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v5 = 0;
  char v2 = [v1 performFetch:&v5];
  id v3 = v5;
  if ((v2 & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __59__NoteContext_newFRCForFetchRequest_delegate_performFetch___block_invoke_cold_1();
    }
  }
}

+ (id)sharedContext
{
  if (sharedContext_once != -1) {
    dispatch_once(&sharedContext_once, &__block_literal_global_3);
  }
  char v2 = (void *)sharedContext_sharedContext;
  return v2;
}

void __33__NoteContext_managedObjectModel__block_invoke()
{
  NoteContextManagedObjectModelPath();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = objc_alloc(MEMORY[0x1E4F1C120]);
  v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  uint64_t v2 = [v0 initWithContentsOfURL:v1];
  id v3 = (void *)managedObjectModel__defaultNotesModel;
  managedObjectModel__defaultNotesModel = v2;

  if (managedObjectModel__defaultNotesModel)
  {
  }
  else
  {
    v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __33__NoteContext_managedObjectModel__block_invoke_cold_1();
    }

    __break(1u);
  }
}

void __38__NoteContext_searchIndexerDataSource__block_invoke()
{
  id v4 = [MEMORY[0x1E4F837B8] sharedIndexer];
  id v0 = objc_alloc_init(ICHTMLSearchIndexerDataSource);
  v1 = (void *)searchIndexerDataSource_sDataSource;
  searchIndexerDataSource_sDataSource = (uint64_t)v0;

  [v4 addDataSource:searchIndexerDataSource_sDataSource];
  uint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
  id v3 = [v2 processName];

  if ((([v3 isEqualToString:@"dataaccessd"] & 1) != 0
     || [v3 isEqualToString:@"exchangesyncd"])
    && ([v4 isObservingChanges] & 1) == 0)
  {
    [v4 setDisabled:0];
    [v4 startObservingChanges];
  }
}

- (BOOL)save:(id *)a3
{
  if (![(NSManagedObjectContext *)self->_managedObjectContext hasChanges]) {
    return 1;
  }
  if (![(NoteContext *)self saveSilently:a3]) {
    return 0;
  }
  if ([(NoteContext *)self shouldObserveDarwinNotifications]) {
    ++self->_notificationCount;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (self->_logChanges) {
    CFStringRef v6 = @"NoteContextDarwinNotificationWithLoggedChanges";
  }
  else {
    CFStringRef v6 = @"NoteContextDarwinNotificationWithoutLoggedChanges";
  }
  BOOL v7 = 1;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v6, 0, 0, 1u);
  return v7;
}

- (void)dealloc
{
  [(NoteContext *)self tearDownCoreDataStack];
  v3.receiver = self;
  v3.super_class = (Class)NoteContext;
  [(NoteContext *)&v3 dealloc];
}

- (void)tearDownCoreDataStack
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  localStore = self->_localStore;
  self->_localStore = 0;

  localAccount = self->_localAccount;
  self->_localAccount = 0;

  nextId = self->_nextId;
  self->_nextId = 0;

  nextIdContext = self->_nextIdContext;
  self->_nextIdContext = 0;

  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = 0;
}

- (id)allAccounts
{
  return [(NoteContext *)self allAccountsAsFaults:1 prefechedRelationshipKeyPaths:0];
}

uint64_t __43__NoteContext_SharedContext__sharedContext__block_invoke()
{
  sharedContext_sharedContext = [[NoteContext alloc] initForMainContext];
  return MEMORY[0x1F41817F8]();
}

- (id)initForMainContext
{
  objc_super v3 = +[AccountUtilities sharedAccountUtilities];
  id v4 = [(NoteContext *)self initWithAccountUtilities:v3 inMigrator:0 isMainContext:1 usePrivateQueue:0];

  return v4;
}

- (NoteContext)initWithPrivateQueue
{
  objc_super v3 = +[AccountUtilities sharedAccountUtilities];
  id v4 = [(NoteContext *)self initWithAccountUtilities:v3 inMigrator:0 isMainContext:0 usePrivateQueue:1];

  return v4;
}

- (NoteContext)initWithAccountUtilities:(id)a3 inMigrator:(BOOL)a4
{
  return [(NoteContext *)self initWithAccountUtilities:a3 inMigrator:a4 isMainContext:0 usePrivateQueue:0];
}

- (NoteContext)initWithAccountUtilities:(id)a3
{
  return [(NoteContext *)self initWithAccountUtilities:a3 inMigrator:0];
}

- (id)newFRCForAccountsWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[NoteContext newFetchRequestForAccounts];
  [v5 setFetchBatchSize:100];
  id v6 = [(NoteContext *)self newFRCForFetchRequest:v5 delegate:v4 performFetch:1];

  return v6;
}

- (id)newFRCForStoresWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[NoteContext newFetchRequestForStores];
  [v5 setFetchBatchSize:100];
  id v6 = [(NoteContext *)self newFRCForFetchRequest:v5 delegate:v4 performFetch:1];

  return v6;
}

- (id)allAccountsAsFaults:(BOOL)a3 prefechedRelationshipKeyPaths:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[NoteContext newFetchRequestForAccounts];
  [v7 setReturnsObjectsAsFaults:v4];
  if (v6) {
    [v7 setRelationshipKeyPathsForPrefetching:v6];
  }
  v8 = [(NoteContext *)self managedObjectContext];
  id v17 = 0;
  v9 = [v8 executeFetchRequest:v7 error:&v17];
  id v10 = v17;

  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[NoteContext allAccountsAsFaults:prefechedRelationshipKeyPaths:]();
    }
    v12 = v11;
LABEL_7:

    goto LABEL_9;
  }
  if (![v9 count])
  {
    v14 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[NoteContext allAccountsAsFaults:prefechedRelationshipKeyPaths:]();
    }

    [(NoteContext *)self forceSetUpUniqueObjects];
    v12 = [(NoteContext *)self managedObjectContext];
    id v16 = 0;
    uint64_t v15 = [v12 executeFetchRequest:v7 error:&v16];
    id v10 = v16;
    v11 = v9;
    v9 = v15;
    goto LABEL_7;
  }
LABEL_9:

  return v9;
}

- (void)setHasPriorityInSaveConflicts:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasPriorityInSaveConflicts = a3;
  id v5 = [(NoteContext *)self managedObjectContext];
  if (v3)
  {
    BOOL v4 = +[NoteResurrectionMergePolicy sharedNoteResurrectionMergePolicy];
    [v5 setMergePolicy:v4];
  }
  else
  {
    [v5 setMergePolicy:*MEMORY[0x1E4F1BE48]];
  }
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  v37 = [*(id *)(a1 + 32) urlForPersistentStore];
  v36 = [*v2 managedObjectModel];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v36];
  BOOL v4 = [*v2 storeOptions];
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  if (ICUseCoreDataCoreSpotlightIntegration())
  {
    id v6 = [MEMORY[0x1E4F1C190] persistentStoreDescriptionWithURL:v37];
    [v6 setType:*MEMORY[0x1E4F1BF70]];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v7 = [v5 allKeys];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v11, v36);
          [v6 setOption:v12 forKey:v11];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = 0;
  }
  v13 = objc_opt_class();
  objc_sync_enter(v13);
  v14 = objc_alloc_init(NotesMigrationManager);
  int v15 = ICUseCoreDataCoreSpotlightIntegration();
  uint64_t v16 = *MEMORY[0x1E4F1BF70];
  if (v15)
  {
    id v44 = 0;
    BOOL v17 = [(NotesMigrationManager *)v14 migrateNotesStoreAtURL:v37 storeType:v16 managedObjectModel:v36 options:v5 error:&v44];
    id v18 = v44;
    *((unsigned char *)v50 + 24) = v17;
    if (v6)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __41__NoteContext_persistentStoreCoordinator__block_invoke_2;
      v43[3] = &unk_1E686DFE0;
      v43[4] = &v49;
      [v3 addPersistentStoreWithDescription:v6 completionHandler:v43];
    }
  }
  else
  {
    v19 = [*(id *)(a1 + 32) managedObjectModel];
    id v42 = 0;
    BOOL v20 = [(NotesMigrationManager *)v14 migrateNotesStoreAtURL:v37 storeType:v16 managedObjectModel:v19 options:v5 error:&v42];
    id v21 = v42;
    *((unsigned char *)v50 + 24) = v20;

    id v41 = v21;
    v22 = [v3 addPersistentStoreWithType:v16 configuration:0 URL:v37 options:v5 error:&v41];
    id v23 = v41;

    *((unsigned char *)v50 + 24) = v22 != 0;
    id v18 = v23;
  }

  if (!*((unsigned char *)v50 + 24))
  {
    if ([*(id *)(a1 + 32) isTooLowOnDiskSpace])
    {
      v24 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_1();
      }
    }
    else
    {
      int v25 = [*(id *)(a1 + 32) isDataProtectionError:v18];
      v26 = os_log_create("com.apple.notes", "HTML");
      v24 = v26;
      if (v25)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CFDA4000, v24, OS_LOG_TYPE_INFO, "Data protection prevented loading persistent store, because device has not been unlocked since boot", buf, 2u);
        }
      }
      else
      {
        v27 = v26;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          [v18 userInfo];
          objc_claimAutoreleasedReturnValue();
          __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_5();
        }

        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"+[NoteContext persistentStoreCoordinator]_block_invoke" simulateCrash:1 showAlert:1 format:@"Failed to open HTML notes database."];
        v28 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl(&dword_1CFDA4000, v28, OS_LOG_TYPE_INFO, "Destroying old persistent store and creating a new one", v40, 2u);
        }

        [*(id *)(a1 + 32) backupPersistentStore:v3];
        v29 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_4();
        }

        if (ICUseCoreDataCoreSpotlightIntegration())
        {
          if (v6)
          {
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = __41__NoteContext_persistentStoreCoordinator__block_invoke_236;
            v39[3] = &unk_1E686DFE0;
            v39[4] = &v49;
            [v3 addPersistentStoreWithDescription:v6 completionHandler:v39];
          }
        }
        else
        {
          uint64_t v30 = *MEMORY[0x1E4F1BF70];
          id v38 = v18;
          v31 = [v3 addPersistentStoreWithType:v30 configuration:0 URL:v37 options:v5 error:&v38];
          id v32 = v38;

          *((unsigned char *)v50 + 24) = v31 != 0;
          id v18 = v32;
        }
        v33 = os_log_create("com.apple.notes", "HTML");
        v24 = v33;
        if (v18)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_3();
          }
        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_2();
          }
          id v18 = 0;
        }
      }
    }
  }
  objc_sync_exit(v13);

  if (*((unsigned char *)v50 + 24))
  {
    objc_storeStrong((id *)&persistentStoreCoordinator__persistentStoreCoordinator, v3);
    if (ICUseCoreDataCoreSpotlightIntegration())
    {
      v34 = (void *)[objc_alloc(MEMORY[0x1E4F83728]) initForStoreWithDescription:v6 coordinator:v3 indexingPriority:1];
      if (v34)
      {
        v35 = [MEMORY[0x1E4F83708] sharedReindexer];
        [v35 registerCoreDataCoreSpotlightDelegate:v34];

        [v34 startSpotlightIndexing];
      }
    }
  }

  _Block_object_dispose(&v49, 8);
}

- (id)newFRCForFetchRequest:(id)a3 delegate:(id)a4 performFetch:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NoteContext *)self managedObjectContext];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C0F0]) initWithFetchRequest:v9 managedObjectContext:v10 sectionNameKeyPath:0 cacheName:0];

  [v11 setDelegate:v8];
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__NoteContext_newFRCForFetchRequest_delegate_performFetch___block_invoke;
    v13[3] = &unk_1E686DF70;
    id v14 = v11;
    [v10 performBlockAndWait:v13];
  }
  return v11;
}

- (BOOL)setUpCoreDataStack
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NoteContextWillSetUpCoreDataStackNotification" object:self];

  [(id)objc_opt_class() removeConflictingSqliteAndIdxFiles];
  BOOL v4 = [(id)objc_opt_class() managedObjectModel];

  if (v4
    && ([(id)objc_opt_class() persistentStoreCoordinator],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5)
    && ([(NoteContext *)self managedObjectContext],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __33__NoteContext_setUpCoreDataStack__block_invoke;
    v23[3] = &unk_1E686DF70;
    v23[4] = self;
    id v7 = (void (**)(void))MEMORY[0x1D25DE760](v23);
    id v8 = [(NoteContext *)self managedObjectContext];
    uint64_t v9 = [v8 concurrencyType];

    if (v9)
    {
      id v10 = [(NoteContext *)self managedObjectContext];
      [v10 performBlockAndWait:v7];
    }
    else
    {
      v7[2](v7);
    }
    if (!self->_inMigrator)
    {
      if ([(NoteContext *)self shouldObserveDarwinNotifications])
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__ReceiveNotification, @"NoteContextDarwinNotificationWithLoggedChanges", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        id v14 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(v14, self, (CFNotificationCallback)__ReceiveNotification, @"NoteContextDarwinNotificationWithoutLoggedChanges", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
      id v15 = objc_alloc(MEMORY[0x1E4F83778]);
      uint64_t v16 = [(NoteContext *)self managedObjectContext];
      BOOL v17 = (void *)[v15 initWithStore:0 context:v16];
      [(NoteContext *)self setMocUpdater:v17];

      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:self selector:sel_postNotesChangedExternally delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:0.1];
      [(NoteContext *)self setExternalChangeNotificationDelayer:v18];
    }
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v20 = *MEMORY[0x1E4F1BE38];
    id v21 = [(NoteContext *)self managedObjectContext];
    [v19 addObserver:self selector:sel_managedObjectContextWillSaveNotification_ name:v20 object:v21];

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 postNotificationName:@"NoteContextDidSetUpCoreDataStackNotification" object:self];

    return 1;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"NoteContextDidSetUpCoreDataStackNotification" object:self];

    return 0;
  }
}

- (NSManagedObjectContext)managedObjectContext
{
  managedObjectContext = self->_managedObjectContext;
  if (managedObjectContext)
  {
    BOOL v3 = managedObjectContext;
    goto LABEL_17;
  }
  BOOL v5 = [(id)objc_opt_class() persistentStoreCoordinator];
  if (v5)
  {
    if ([(NoteContext *)self isMainContext])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C110]);
      uint64_t v7 = 2;
    }
    else
    {
      if (![(NoteContext *)self usePrivateQueue])
      {
        id v8 = (NSManagedObjectContext *)objc_alloc_init(MEMORY[0x1E4F1C110]);
        goto LABEL_10;
      }
      id v6 = objc_alloc(MEMORY[0x1E4F1C110]);
      uint64_t v7 = 1;
    }
    id v8 = (NSManagedObjectContext *)[v6 initWithConcurrencyType:v7];
LABEL_10:
    uint64_t v9 = self->_managedObjectContext;
    self->_managedObjectContext = v8;

    [(NSManagedObjectContext *)self->_managedObjectContext setPersistentStoreCoordinator:v5];
  }
  [(NSManagedObjectContext *)self->_managedObjectContext setUndoManager:0];
  [(NSManagedObjectContext *)self->_managedObjectContext setMergePolicy:*MEMORY[0x1E4F1BE48]];
  [(NSManagedObjectContext *)self->_managedObjectContext setStalenessInterval:0.0];
  [(NSManagedObjectContext *)self->_managedObjectContext _setDelegate:self];
  if (self->_managedObjectContext)
  {
    id v10 = (id)[(id)objc_opt_class() searchIndexerDataSource];
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[NoteContext managedObjectContext]();
    }
  }
  BOOL v3 = self->_managedObjectContext;

LABEL_17:
  return v3;
}

+ (id)persistentStoreCoordinator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NoteContext_persistentStoreCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistentStoreCoordinator_onceToken != -1) {
    dispatch_once(&persistentStoreCoordinator_onceToken, block);
  }
  uint64_t v2 = (void *)persistentStoreCoordinator__persistentStoreCoordinator;
  return v2;
}

+ (NSManagedObjectModel)managedObjectModel
{
  if (managedObjectModel_onceToken != -1) {
    dispatch_once(&managedObjectModel_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)managedObjectModel__defaultNotesModel;
  return (NSManagedObjectModel *)v2;
}

- (BOOL)shouldObserveDarwinNotifications
{
  return [MEMORY[0x1E4F29060] isMainThread];
}

- (void)setMocUpdater:(id)a3
{
}

- (void)setExternalChangeNotificationDelayer:(id)a3
{
}

- (BOOL)isMainContext
{
  return self->_isMainContext;
}

+ (id)searchIndexerDataSource
{
  if (searchIndexerDataSource_onceToken != -1) {
    dispatch_once(&searchIndexerDataSource_onceToken, &__block_literal_global_240);
  }
  uint64_t v2 = (void *)searchIndexerDataSource_sDataSource;
  return v2;
}

+ (void)removeConflictingSqliteAndIdxFiles
{
  id v5 = (id)NoteStoreCopyPath(a1, a2);
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v5];

  if (v4) {
    [a1 removeSqliteAndIdxFiles];
  }
}

uint64_t __33__NoteContext_setUpCoreDataStack__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUpUniqueObjects];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 handleMigration];
}

- (void)setUpUniqueObjects
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CFDA4000, v6, v4, "Error: Couldn't save newly created unique objects: %@, %@", v5);
}

+ (id)urlForPersistentStore
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = [a1 pathForPersistentStore];
  uint64_t v4 = [v2 fileURLWithPath:v3];

  return v4;
}

- (void)handleMigration
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CFDA4000, v6, v4, "Error: Saving failed after migration: %@, %@", v5);
}

- (BOOL)usePrivateQueue
{
  return self->_usePrivateQueue;
}

- (NoteContext)initWithAccountUtilities:(id)a3 inMigrator:(BOOL)a4 isMainContext:(BOOL)a5 usePrivateQueue:(BOOL)a6
{
  id v11 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NoteContext;
  v12 = [(NoteContext *)&v21 init];
  v13 = v12;
  if (v12)
  {
    v12->_isMainContext = a5;
    v12->_inMigrator = a4;
    objc_storeStrong((id *)&v12->_accountUtilities, a3);
    v13->_usePrivateQueue = a6;
    *(_WORD *)&v13->_logChanges = 0;
    id v14 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library"];
    id v15 = [v14 stringByAppendingPathComponent:@"Caches"];

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F83750]) initWithName:@"com.apple.notes.autoincrement.lock" cachePath:v15];
    nextIdLock = v13->_nextIdLock;
    v13->_nextIdLock = (ICExclusiveLock *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F83750]) initWithName:@"com.apple.notes.objectcreation.lock" cachePath:v15];
    objectCreationLock = v13->_objectCreationLock;
    v13->_objectCreationLock = (ICExclusiveLock *)v18;

    if (![(NoteContext *)v13 setUpCoreDataStack])
    {

      v13 = 0;
    }
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalChangeNotificationDelayer, 0);
  objc_storeStrong((id *)&self->_mocUpdater, 0);
  objc_storeStrong((id *)&self->_notePropertyObjectsRealized, 0);
  objc_storeStrong((id *)&self->_objectCreationLock, 0);
  objc_storeStrong((id *)&self->_nextId, 0);
  objc_storeStrong((id *)&self->_nextIdLock, 0);
  objc_storeStrong((id *)&self->_nextIdContext, 0);
  objc_storeStrong((id *)&self->_accountUtilities, 0);
  objc_storeStrong((id *)&self->_localAccount, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

+ (id)storeOptions
{
  v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F1BDE8];
  v7[0] = *MEMORY[0x1E4F1BE50];
  v7[1] = v3;
  v8[0] = MEMORY[0x1E4F1CC38];
  v8[1] = MEMORY[0x1E4F1CC38];
  v7[2] = *MEMORY[0x1E4F1BEC0];
  uint64_t v4 = [(id)objc_opt_class() fileProtectionOption];
  v7[3] = *MEMORY[0x1E4F1BE80];
  v8[2] = v4;
  v8[3] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

+ (id)newFetchRequestForStores
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Store"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"name" ascending:1];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v2 setSortDescriptors:v4];

  return v2;
}

+ (id)newFetchRequestForAccounts
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Account"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"name" ascending:1];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v2 setSortDescriptors:v4];

  return v2;
}

+ (id)fileProtectionOption
{
  return (id)*MEMORY[0x1E4F28358];
}

+ (BOOL)shouldLogIndexing
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"ShouldLogIndexing"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)databaseIsCorrupt:(id)a3
{
  id v3 = a3;
  char v4 = [v3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F1BF50]];

  if (v5) {
    char v6 = [v5 intValue] == 11;
  }
  else {
    char v6 = 0;
  }
  if ([v3 code] == 259)
  {
    uint64_t v7 = [v3 domain];
    char v8 = [v7 isEqual:*MEMORY[0x1E4F281F8]];

    v6 |= v8;
  }

  return v6;
}

+ (void)setTestsNotesRootPath:(id)a3
{
}

+ (void)clearTestsNotesRootPath
{
  uint64_t v2 = (void *)s_testsNotesRootPath;
  s_testsNotesRootPath = 0;
}

+ (id)fileURLProtectionOption
{
  return (id)*MEMORY[0x1E4F1C580];
}

+ (id)defaultNotesSortDescriptors
{
  return (id)[MEMORY[0x1E4F83790] sortDescriptorsForCurrentTypeIncludingPinnedNotes:0];
}

+ (id)generateGUID
{
  uint64_t v2 = [MEMORY[0x1E4F29128] UUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)_createLocalAccount:(id *)a3 andStore:(id *)a4
{
  id obj = [(NoteContext *)self newlyAddedAccount];
  uint64_t v7 = [(NoteContext *)self accountUtilities];
  char v8 = [v7 localAccountDisplayName];
  [obj setName:v8];

  [obj setAccountIdentifier:@"local://local/account"];
  uint64_t v9 = [(NoteContext *)self newlyAddedStore];
  [v9 setName:@"LOCAL_NOTES_STORE"];
  [v9 setExternalIdentifier:@"local://local/store"];
  [v9 setAccount:obj];
  [obj setDefaultStore:v9];
  if (a3) {
    objc_storeStrong(a3, obj);
  }
  if (a4) {
    objc_storeStrong(a4, v9);
  }
}

- (BOOL)setUpLocalAccountAndStore
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  char v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = [(NoteContext *)self managedObjectContext];
  char v6 = [v4 entityForName:@"Account" inManagedObjectContext:v5];

  [v3 setEntity:v6];
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"accountIdentifier == %@", @"local://local/account"];
  [v3 setPredicate:v7];
  char v8 = [(NoteContext *)self managedObjectContext];
  id v34 = 0;
  uint64_t v9 = [v8 executeFetchRequest:v3 error:&v34];
  id v10 = v34;

  BOOL v11 = v10 == 0;
  if (v10)
  {
    v12 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[NoteContext setUpLocalAccountAndStore]();
    }
    v13 = v12;
LABEL_18:

    goto LABEL_19;
  }
  if ((unint64_t)[v9 count] >= 2)
  {
    id v14 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[NoteContext setUpLocalAccountAndStore](v9);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v12 = v9;
    uint64_t v15 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      char v17 = 0;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v12);
          }
          if (v17) {
            [(NoteContext *)self forceDeleteAccount:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          }
          char v17 = 1;
        }
        uint64_t v16 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v16);
    }

    v13 = [(NoteContext *)self managedObjectContext];
    id v29 = 0;
    uint64_t v9 = [v13 executeFetchRequest:v3 error:&v29];
    id v10 = v29;
    goto LABEL_18;
  }
  id v10 = 0;
  BOOL v11 = 0;
LABEL_19:
  p_localAccount = (id *)&self->_localAccount;
  localAccount = self->_localAccount;
  self->_localAccount = 0;

  p_localStore = &self->_localStore;
  localStore = self->_localStore;
  self->_localStore = 0;

  if ([v9 count])
  {
    uint64_t v24 = [v9 lastObject];
    id v25 = *p_localAccount;
    id *p_localAccount = (id)v24;

    uint64_t v26 = [*p_localAccount defaultStore];
    v27 = *p_localStore;
    *p_localStore = (NoteStoreObject *)v26;
  }
  else
  {
    [(NoteContext *)self _createLocalAccount:&self->_localAccount andStore:&self->_localStore];
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)setUpLastIndexTid
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  char v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = [(NoteContext *)self managedObjectContext];
  char v6 = [v4 entityForName:@"Property" inManagedObjectContext:v5];

  [v3 setEntity:v6];
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"propertyKey == %@", @"LastTransactionID"];
  [v3 setPredicate:v7];
  char v8 = [(NoteContext *)self managedObjectContext];
  id v35 = 0;
  uint64_t v9 = [v8 executeFetchRequest:v3 error:&v35];
  id v10 = v35;

  BOOL v11 = v10 == 0;
  if (v10)
  {
    v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[NoteContext setUpLastIndexTid]();
    }
  }
  else
  {
    unint64_t v14 = [v9 count];
    BOOL v15 = v14 > 1;
    if (v14 >= 2)
    {
      BOOL v28 = v14 > 1;
      BOOL v29 = v10 == 0;
      uint64_t v16 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[NoteContext setUpLastIndexTid](v9);
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v17 = v9;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        char v20 = 0;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v17);
            }
            if (v20)
            {
              uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              uint64_t v24 = [(NoteContext *)self managedObjectContext];
              [v24 deleteObject:v23];
            }
            char v20 = 1;
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v19);
      }

      id v25 = [(NoteContext *)self managedObjectContext];
      id v30 = 0;
      uint64_t v9 = [v25 executeFetchRequest:v3 error:&v30];
      id v10 = v30;

      if (v10)
      {
        BOOL v11 = 1;
        goto LABEL_6;
      }
      BOOL v15 = v28;
      BOOL v11 = v29;
    }
    if ([v9 count])
    {
      id v10 = 0;
      BOOL v11 = v15;
      goto LABEL_6;
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F1C0A8];
    v27 = [(NoteContext *)self managedObjectContext];
    v12 = [v26 insertNewObjectForEntityForName:@"Property" inManagedObjectContext:v27];

    [v12 setPropertyKey:@"LastTransactionID"];
    id v10 = 0;
  }

LABEL_6:
  return v11;
}

- (void)forceSetUpUniqueObjects
{
  id v3 = [(id)objc_opt_class() persistentStoreCoordinator];
  char v4 = [(id)objc_opt_class() urlForPersistentStore];
  id v8 = [v3 persistentStoreForURL:v4];

  id v5 = [v8 metadata];
  char v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = [NSNumber numberWithBool:0];
  [v6 setObject:v7 forKey:@"LocalAccountAndStoreAlreadySetUp"];

  [v8 setMetadata:v6];
  [(NoteContext *)self setUpUniqueObjects];
}

+ (void)removeSqliteAndIdxFiles
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_15(&dword_1CFDA4000, v0, v1, "Can't remove sqlite and idx files: %@", v2, v3, v4, v5, v6);
}

- (NoteContext)init
{
  uint64_t v3 = +[AccountUtilities sharedAccountUtilities];
  uint64_t v4 = [(NoteContext *)self initWithAccountUtilities:v3 inMigrator:0];

  return v4;
}

- (id)initForMigrator
{
  uint64_t v3 = +[AccountUtilities sharedAccountUtilities];
  uint64_t v4 = [(NoteContext *)self initWithAccountUtilities:v3 inMigrator:1];

  return v4;
}

- (NoteContext)initWithPrivateQueue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[AccountUtilities sharedAccountUtilities];
  uint8_t v6 = [(NoteContext *)self initWithAccountUtilities:v5 inMigrator:0 isMainContext:0 usePrivateQueue:v3];

  return v6;
}

- (id)visibleNotesPredicate
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 visibleNotesPredicate];
}

+ (id)visibleNotesPredicate
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  BOOL v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [v2 predicateWithFormat:@"((deletedFlag == %@) AND (body.content != nil) AND (isBookkeepingEntry == %@))", v3, v4];

  return v5;
}

+ (id)visibleNotesIncludingEmptyBodyContentPredicate
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  BOOL v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [v2 predicateWithFormat:@"((deletedFlag == %@) AND (isBookkeepingEntry == %@))", v3, v4];

  return v5;
}

- (id)liveNotesNeedingBodiesPredicate
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  BOOL v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [v2 predicateWithFormat:@"((body.content = nil) AND (isBookkeepingEntry == %@))", v3];

  return v4;
}

- (id)newFRCForCollection:(id)a3 delegate:(id)a4
{
  return [(NoteContext *)self newFRCForCollection:a3 delegate:a4 performFetch:1];
}

- (id)newFRCForCollection:(id)a3 delegate:(id)a4 performFetch:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NoteContext *)self newFetchRequestForNotes];
  BOOL v11 = (void *)MEMORY[0x1E4F28BA0];
  v12 = (void *)MEMORY[0x1E4F1C978];
  if (v8)
  {
    v13 = [v8 predicateForNotes];
    unint64_t v14 = [(NoteContext *)self visibleNotesPredicate];
    BOOL v15 = objc_msgSend(v12, "arrayWithObjects:", v13, v14, 0);
    uint64_t v16 = [v11 andPredicateWithSubpredicates:v15];
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"store != nil"];
    uint64_t v18 = [(NoteContext *)self visibleNotesPredicate];
    uint64_t v19 = objc_msgSend(v12, "arrayWithObjects:", v17, v18, 0);
    uint64_t v16 = [v11 andPredicateWithSubpredicates:v19];

    char v20 = [v10 sortDescriptors];
    v13 = (void *)[v20 mutableCopy];

    uint64_t v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"store.name" ascending:1];
    objc_msgSend(v13, "ic_addNonNilObject:", v21);

    [v10 setSortDescriptors:v13];
  }

  [v10 setPredicate:v16];
  [v10 setFetchBatchSize:100];
  id v22 = [(NoteContext *)self newFRCForFetchRequest:v10 delegate:v9 performFetch:v5];

  return v22;
}

- (id)newFetchRequestForNotes
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 newFetchRequestForNotes];
}

+ (NSFetchRequest)newFetchRequestForNotes
{
  BOOL v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Note"];
  uint64_t v4 = [a1 defaultNotesSortDescriptors];
  [(NSFetchRequest *)v3 setSortDescriptors:v4];

  return v3;
}

- (void)clearCaches
{
}

- (void)sortNotes:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() defaultNotesSortDescriptors];
  [v3 sortUsingDescriptors:v4];
}

- (void)batchFaultNotes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Note"];
    [v5 setReturnsObjectsAsFaults:0];
    uint8_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v4];
    [v5 setPredicate:v6];

    uint64_t v7 = [(NoteContext *)self managedObjectContext];
    id v11 = 0;
    id v8 = [v7 executeFetchRequest:v5 error:&v11];
    id v9 = v11;

    if (!v8)
    {
      id v10 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[NoteContext batchFaultNotes:]();
      }
    }
  }
}

- (id)newlyAddedNote
{
  id v3 = +[NoteContext generateGUID];
  id v4 = [(NoteContext *)self newlyAddedNoteWithGUID:v3];

  return v4;
}

- (id)newlyAddedNoteWithGUID:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = a3;
  uint8_t v6 = [(NoteContext *)self managedObjectContext];
  uint64_t v7 = [v4 insertNewObjectForEntityForName:@"Note" inManagedObjectContext:v6];

  id v8 = (void *)MEMORY[0x1E4F1C0A8];
  id v9 = [(NoteContext *)self managedObjectContext];
  id v10 = [v8 insertNewObjectForEntityForName:@"NoteBody" inManagedObjectContext:v9];
  [v7 setBody:v10];

  id v11 = [(NoteContext *)self nextIndex];
  [v7 setIntegerId:v11];

  [v7 setGuid:v5];
  return v7;
}

- (id)newlyCreatedNoteFromDefaultStore
{
  id v3 = [(NoteContext *)self newlyAddedNote];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setCreationDate:v4];

  id v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ic_modificationDateForNoteBeingEdited");
  [v3 setModificationDate:v5];

  [v3 setContent:&stru_1F2675F20];
  [v3 setTitle:0];
  uint8_t v6 = [(NoteContext *)self defaultStoreForNewNote];
  [v3 setStore:v6];

  return v3;
}

- (id)newlyAddedAttachment
{
  id v3 = objc_opt_class();
  id v4 = [(NoteContext *)self managedObjectContext];
  id v5 = [v3 newlyAddedAttachmentInContext:v4];

  return v5;
}

+ (id)newlyAddedAttachmentInContext:(id)a3
{
  return (id)[MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"NoteAttachment" inManagedObjectContext:a3];
}

- (id)collectionForObjectID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(NoteContext *)self managedObjectContext];
    uint8_t v6 = [v5 existingObjectWithID:v4 error:0];
  }
  else
  {
    uint8_t v6 = 0;
  }
  return v6;
}

- (id)storeForObjectID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(NoteContext *)self managedObjectContext];
    uint8_t v6 = [v5 existingObjectWithID:v4 error:0];
  }
  else
  {
    uint8_t v6 = 0;
  }
  return v6;
}

- (void)deleteNote:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  if (v5)
  {
    uint8_t v6 = [(NoteContext *)self managedObjectContext];
    uint64_t v7 = [v6 existingObjectWithID:v5 error:0];

    if (([v4 isInserted] & 1) == 0)
    {
      if (v7)
      {
        id v8 = [v7 store];
        id v9 = [v8 objectID];
        id v10 = [(NoteContext *)self storeForObjectID:v9];

        if (v10)
        {
          id v11 = [(NoteContext *)self managedObjectContext];
          v12 = [v10 account];
          v13 = [v12 objectID];
          unint64_t v14 = [v11 existingObjectWithID:v13 error:0];

          if (v14)
          {
            char v15 = [v14 shouldMarkNotesAsDeleted];

            if (v15)
            {
              [v4 markForDeletion];
LABEL_13:

              goto LABEL_14;
            }
          }
          else
          {
            id v17 = [(NoteContext *)self managedObjectContext];
            [v17 deleteObject:v10];
          }
        }
      }
    }
    [(NoteContext *)self deleteNoteRegardlessOfConstraints:v4];
    goto LABEL_13;
  }
  uint64_t v16 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[NoteContext deleteNote:]();
  }

LABEL_14:
}

- (void)deleteNoteRegardlessOfConstraints:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContext *)self managedObjectContext];
  [v5 deleteObject:v4];
}

- (void)deleteChanges:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = [(NoteContext *)self managedObjectContext];
        [v10 deleteObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)invalidate
{
  localStore = self->_localStore;
  self->_localStore = 0;

  localAccount = self->_localAccount;
  self->_localAccount = 0;

  notePropertyObjectsRealized = self->_notePropertyObjectsRealized;
  self->_notePropertyObjectsRealized = 0;

  id v6 = [(NoteContext *)self managedObjectContext];
  [v6 reset];
}

- (BOOL)saveSilently:(id *)a3
{
  uint64_t v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NoteContext saveSilently:]();
  }

  id v6 = [(NoteContext *)self managedObjectContext];
  id v12 = 0;
  char v7 = [v6 save:&v12];
  id v8 = v12;

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[NoteContext saveSilently:]();
    }

    if (+[NoteContext databaseIsCorrupt:v8])
    {
      id v10 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[NoteContext saveSilently:]();
      }
    }
  }
  if (a3) {
    *a3 = v8;
  }

  return v7;
}

- (id)allVisibleNotes
{
  return [(NoteContext *)self allVisibleNotesMatchingPredicate:0];
}

- (unint64_t)countOfVisibleNotes
{
  return [(NoteContext *)self countOfVisibleNotesMatchingPredicate:0];
}

- (id)allVisibleNotesInCollection:(id)a3
{
  return [(NoteContext *)self allVisibleNotesInCollection:a3 sorted:0];
}

- (id)allVisibleNotesInCollection:(id)a3 sorted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 predicateForNotes];
  char v7 = [(NoteContext *)self allVisibleNotesMatchingPredicate:v6 sorted:v4];

  return v7;
}

- (unint64_t)countOfVisibleNotesInCollection:(id)a3
{
  BOOL v4 = [a3 predicateForNotes];
  unint64_t v5 = [(NoteContext *)self countOfVisibleNotesMatchingPredicate:v4];

  return v5;
}

+ (unint64_t)countOfVisibleNotesInCollectionIncludingNotesWithoutBodyContent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 predicateForNotes];
  id v6 = [v4 managedObjectContext];

  unint64_t v7 = [a1 countOfVisibleNotesMatchingPredicate:v5 includingNoteWithoutBodyContent:1 context:v6];
  return v7;
}

+ (unint64_t)countOfVisibleNotesInCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 predicateForNotes];
  id v6 = [v4 managedObjectContext];

  unint64_t v7 = [a1 countOfVisibleNotesMatchingPredicate:v5 context:v6];
  return v7;
}

- (id)allVisibleNotesMatchingPredicate:(id)a3
{
  return [(NoteContext *)self allVisibleNotesMatchingPredicate:a3 sorted:0];
}

- (id)allVisibleNotesMatchingPredicate:(id)a3 sorted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = objc_opt_class();
  id v8 = [(NoteContext *)self managedObjectContext];
  uint64_t v9 = [v7 allVisibleNotesMatchingPredicate:v6 sorted:v4 context:v8];

  return v9;
}

+ (id)allVisibleNotesMatchingPredicate:(id)a3 context:(id)a4
{
  return (id)[a1 allVisibleNotesMatchingPredicate:a3 sorted:0 context:a4];
}

+ (id)allVisibleNotesMatchingPredicate:(id)a3 sorted:(BOOL)a4 context:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [(id)objc_opt_class() allVisibleNotesMatchingPredicate:v8 sorted:v5 context:v7 fetchLimit:0];

  return v9;
}

+ (id)allVisibleNotesMatchingPredicate:(id)a3 sorted:(BOOL)a4 context:(id)a5 fetchLimit:(unint64_t)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    id v12 = (void *)MEMORY[0x1E4F28BA0];
    long long v13 = (void *)MEMORY[0x1E4F1C978];
    long long v14 = [a1 visibleNotesPredicate];
    char v15 = objc_msgSend(v13, "arrayWithObjects:", v14, v10, 0);
    uint64_t v16 = [v12 andPredicateWithSubpredicates:v15];
  }
  else
  {
    uint64_t v16 = [a1 visibleNotesPredicate];
  }
  id v17 = (void *)[a1 newFetchRequestForNotes];
  [v17 setPredicate:v16];
  if (v8)
  {
    uint64_t v18 = [a1 defaultNotesSortDescriptors];
    [v17 setSortDescriptors:v18];
  }
  if (a6) {
    [v17 setFetchLimit:a6];
  }
  uint64_t v19 = [v11 executeFetchRequest:v17 error:0];

  return v19;
}

- (unint64_t)countOfVisibleNotesMatchingPredicate:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_class();
  id v6 = [(NoteContext *)self managedObjectContext];
  unint64_t v7 = [v5 countOfVisibleNotesMatchingPredicate:v4 context:v6];

  return v7;
}

+ (unint64_t)countOfVisibleNotesMatchingPredicate:(id)a3 context:(id)a4
{
  return [a1 countOfVisibleNotesMatchingPredicate:a3 includingNoteWithoutBodyContent:0 context:a4];
}

+ (unint64_t)countOfVisibleNotesMatchingPredicate:(id)a3 includingNoteWithoutBodyContent:(BOOL)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4) {
    [a1 visibleNotesIncludingEmptyBodyContentPredicate];
  }
  else {
  id v10 = [a1 visibleNotesPredicate];
  }
  id v11 = v10;
  if (v8)
  {
    id v12 = (void *)MEMORY[0x1E4F28BA0];
    long long v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v10, v8, 0);
    id v14 = [v12 andPredicateWithSubpredicates:v13];
  }
  else
  {
    id v14 = v10;
  }
  char v15 = (void *)[a1 newFetchRequestForNotes];
  [v15 setPredicate:v14];
  uint64_t v16 = [v9 countForFetchRequest:v15 error:0];
  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = v16;
  }

  return v17;
}

- (id)visibleNoteForObjectID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    objc_opt_class();
    BOOL v5 = [(NoteContext *)self managedObjectContext];
    id v6 = [v5 existingObjectWithID:v4 error:0];

    unint64_t v7 = ICCheckedDynamicCast();

    id v8 = 0;
    if (([v7 isMarkedForDeletion] & 1) == 0)
    {
      id v9 = [v7 body];
      id v10 = [v9 content];

      if (v10) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)visibleNotesForIntegerIds:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContext *)self newFetchRequestForNotes];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  unint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(integerId IN %@)", v4];

  id v9 = [(NoteContext *)self visibleNotesPredicate];
  id v10 = objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);
  id v11 = [v6 andPredicateWithSubpredicates:v10];

  [v5 setPredicate:v11];
  id v12 = [(NoteContext *)self managedObjectContext];
  id v17 = 0;
  long long v13 = [v12 executeFetchRequest:v5 error:&v17];
  id v14 = v17;

  if (v14)
  {
    char v15 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[NoteContext visibleNotesForIntegerIds:]();
    }
  }
  return v13;
}

- (id)mostRecentlyModifiedNoteInCollection:(id)a3
{
  uint64_t v4 = [a3 predicateForNotes];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = (void *)MEMORY[0x1E4F28BA0];
    unint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = [(NoteContext *)self visibleNotesPredicate];
    id v9 = objc_msgSend(v7, "arrayWithObjects:", v8, v5, 0);
    id v10 = [v6 andPredicateWithSubpredicates:v9];
  }
  else
  {
    id v10 = [(NoteContext *)self visibleNotesPredicate];
  }
  id v11 = [(NoteContext *)self newFetchRequestForNotes];
  [v11 setPredicate:v10];
  id v12 = [(id)objc_opt_class() defaultNotesSortDescriptors];
  [v11 setSortDescriptors:v12];

  [v11 setFetchLimit:1];
  long long v13 = [(NoteContext *)self managedObjectContext];
  id v14 = [v13 executeFetchRequest:v11 error:0];

  char v15 = [v14 lastObject];

  return v15;
}

- (id)allNotes
{
  id v3 = [(NoteContext *)self newFetchRequestForNotes];
  uint64_t v4 = [(NoteContext *)self managedObjectContext];
  id v5 = [v4 executeFetchRequest:v3 error:0];

  return v5;
}

- (unint64_t)countOfNotes
{
  id v3 = [(NoteContext *)self newFetchRequestForNotes];
  uint64_t v4 = [(NoteContext *)self managedObjectContext];
  uint64_t v5 = [v4 countForFetchRequest:v3 error:0];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v5;
  }

  return v6;
}

- (id)allNotesInCollection:(id)a3
{
  uint64_t v4 = [a3 predicateForNotes];
  uint64_t v5 = [(NoteContext *)self allNotesMatchingPredicate:v4];

  return v5;
}

- (unint64_t)countOfNotesInCollection:(id)a3
{
  uint64_t v4 = [a3 predicateForNotes];
  unint64_t v5 = [(NoteContext *)self countOfNotesMatchingPredicate:v4];

  return v5;
}

- (id)allNotesMatchingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContext *)self newFetchRequestForNotes];
  [v5 setPredicate:v4];

  unint64_t v6 = [(NoteContext *)self managedObjectContext];
  unint64_t v7 = [v6 executeFetchRequest:v5 error:0];

  return v7;
}

- (unint64_t)countOfNotesMatchingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContext *)self newFetchRequestForNotes];
  [v5 setPredicate:v4];

  unint64_t v6 = [(NoteContext *)self managedObjectContext];
  uint64_t v7 = [v6 countForFetchRequest:v5 error:0];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = v7;
  }

  return v8;
}

- (id)noteForObjectID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(NoteContext *)self managedObjectContext];
    unint64_t v6 = [v5 existingObjectWithID:v4 error:0];
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6;
}

- (id)notesForIntegerIds:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContext *)self newFetchRequestForNotes];
  unint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(integerId IN %@)", v4];

  [v5 setPredicate:v6];
  uint64_t v7 = [(NoteContext *)self managedObjectContext];
  id v12 = 0;
  unint64_t v8 = [v7 executeFetchRequest:v5 error:&v12];
  id v9 = v12;

  if (v9)
  {
    id v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[NoteContext visibleNotesForIntegerIds:]();
    }
  }
  return v8;
}

- (id)noteForGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContext *)self newFetchRequestForNotes];
  unint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(guid ==[c] %@)", v4];
  [v5 setPredicate:v6];
  uint64_t v7 = [(NoteContext *)self managedObjectContext];
  id v13 = 0;
  unint64_t v8 = [v7 executeFetchRequest:v5 error:&v13];
  id v9 = v13;

  if (v9)
  {
    id v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[NoteContext noteForGUID:]();
    }
  }
  id v11 = [v8 firstObject];

  return v11;
}

- (id)storeForExternalIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(id)objc_opt_class() newFetchRequestForStores];
  unint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(externalIdentifier == %@)", v4];
  [v5 setPredicate:v6];
  uint64_t v7 = [(NoteContext *)self managedObjectContext];
  id v13 = 0;
  unint64_t v8 = [v7 executeFetchRequest:v5 error:&v13];
  id v9 = v13;

  if (v9)
  {
    id v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[NoteContext storeForExternalIdentifier:]();
    }
  }
  id v11 = [v8 firstObject];

  return v11;
}

- (id)allNotesWithoutBodiesInCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContext *)self newFetchRequestForNotes];
  if (v4)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    unint64_t v8 = [v4 predicateForNotes];
    id v9 = [(NoteContext *)self liveNotesNeedingBodiesPredicate];
    id v10 = objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);
    id v11 = [v6 andPredicateWithSubpredicates:v10];
  }
  else
  {
    id v11 = [(NoteContext *)self liveNotesNeedingBodiesPredicate];
  }
  [v5 setPredicate:v11];
  id v12 = [(NoteContext *)self managedObjectContext];
  id v17 = 0;
  id v13 = [v12 executeFetchRequest:v5 error:&v17];
  id v14 = v17;

  if (v14)
  {
    char v15 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[NoteContext visibleNotesForIntegerIds:]();
    }
  }
  return v13;
}

- (id)collectionForInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 objectForKey:@"NoteCollectionPrimaryIdentifier"],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [(NoteContext *)self accountForAccountId:v6],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    unint64_t v8 = [v5 objectForKey:@"NoteCollectionType"];
    int v9 = [v8 isEqualToString:@"Account"];

    if (v9)
    {
      id v10 = v7;
    }
    else
    {
      id v11 = [v5 objectForKey:@"NoteCollectionSecondaryIdentifier"];
      id v10 = [v7 storeForExternalId:v11];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)newlyAddedStore
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0A8];
  id v3 = [(NoteContext *)self managedObjectContext];
  id v4 = [v2 insertNewObjectForEntityForName:@"Store" inManagedObjectContext:v3];

  return v4;
}

- (id)allStores
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = [(NoteContext *)self managedObjectContext];
  unint64_t v6 = [v4 entityForName:@"Store" inManagedObjectContext:v5];
  [v3 setEntity:v6];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"name" ascending:1];
  unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
  [v3 setSortDescriptors:v8];

  int v9 = [(NoteContext *)self managedObjectContext];
  id v18 = 0;
  id v10 = [v9 executeFetchRequest:v3 error:&v18];
  id v11 = v18;

  if (v11)
  {
    id v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[NoteContext allStores]();
    }
    id v13 = v12;
LABEL_5:

    goto LABEL_7;
  }
  if (![v10 count])
  {
    char v15 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[NoteContext allStores]();
    }

    [(NoteContext *)self forceSetUpUniqueObjects];
    id v13 = [(NoteContext *)self managedObjectContext];
    id v17 = 0;
    uint64_t v16 = [v13 executeFetchRequest:v3 error:&v17];
    id v11 = v17;
    id v12 = v10;
    id v10 = v16;
    goto LABEL_5;
  }
LABEL_7:

  return v10;
}

- (id)storesInCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContext *)self allStores];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__NoteContext_storesInCollection___block_invoke;
  v9[3] = &unk_1E686DF98;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "ic_objectsPassingTest:", v9);

  return v7;
}

BOOL __34__NoteContext_storesInCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = [v3 parentStore];

  if (isKindOfClass) {
    id v6 = 0;
  }
  else {
    id v6 = *(void **)(a1 + 32);
  }
  BOOL v7 = v5 == v6;

  return v7;
}

- (id)faultedInStoresForAccounts:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithEntityName:@"Store"];
  [v6 setReturnsObjectsAsFaults:0];
  BOOL v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"account", v5];

  [v6 setPredicate:v7];
  unint64_t v8 = [(NoteContext *)self managedObjectContext];
  id v14 = 0;
  int v9 = [v8 executeFetchRequest:v6 error:&v14];
  id v10 = v14;

  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[NoteContext faultedInStoresForAccounts:]();
    }
  }
  return v9;
}

- (unint64_t)countOfStores
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = [(NoteContext *)self managedObjectContext];
  id v6 = [v4 entityForName:@"Store" inManagedObjectContext:v5];
  [v3 setEntity:v6];

  BOOL v7 = [(NoteContext *)self managedObjectContext];
  id v15 = 0;
  uint64_t v8 = [v7 countForFetchRequest:v3 error:&v15];
  id v9 = v15;

  if (v9)
  {
    id v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[NoteContext allStores]();
    }

LABEL_5:
    goto LABEL_7;
  }
  if (!v8)
  {
    id v13 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[NoteContext countOfStores]();
    }

    [(NoteContext *)self forceSetUpUniqueObjects];
    id v10 = [(NoteContext *)self managedObjectContext];
    id v14 = 0;
    uint64_t v8 = [v10 countForFetchRequest:v3 error:&v14];
    id v9 = v14;
    goto LABEL_5;
  }
LABEL_7:
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = v8;
  }

  return v11;
}

- (id)newlyAddedAccount
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0A8];
  id v3 = [(NoteContext *)self managedObjectContext];
  id v4 = [v2 insertNewObjectForEntityForName:@"Account" inManagedObjectContext:v3];

  return v4;
}

- (id)accountForAccountId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v6 = (void *)MEMORY[0x1E4F1C0A8];
  BOOL v7 = [(NoteContext *)self managedObjectContext];
  uint64_t v8 = [v6 entityForName:@"Account" inManagedObjectContext:v7];
  [v5 setEntity:v8];

  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"accountIdentifier == %@", v4];
  [v5 setPredicate:v9];

  id v10 = [(NoteContext *)self managedObjectContext];
  id v16 = 0;
  unint64_t v11 = [v10 executeFetchRequest:v5 error:&v16];
  id v12 = v16;

  if (v12)
  {
    id v13 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[NoteContext accountForAccountId:]();
    }
  }
  id v14 = [v11 lastObject];

  return v14;
}

- (id)defaultStoreForNewNote
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.mobilenotes");
  id v3 = (void *)CFPreferencesCopyAppValue(@"DefaultNotesAccount", @"com.apple.mobilenotes");
  id v4 = [(NoteContext *)self accountUtilities];
  id v5 = [v4 defaultStoreSyncIdWithDesiredSyncId:v3];

  id v6 = [(NoteContext *)self accountForAccountId:v5];
  id v7 = v6;
  if (v6 && ![v6 didChooseToMigrate])
  {
LABEL_13:
    id v14 = [v7 defaultStore];

    goto LABEL_15;
  }

  [(NoteContext *)self allAccounts];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
      if (!objc_msgSend(v13, "didChooseToMigrate", (void)v16)) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v7 = v13;

    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_11:

LABEL_14:
  id v14 = [(NoteContext *)self localStore];
LABEL_15:

  return v14;
}

- (id)localStore
{
  localStore = self->_localStore;
  if (!localStore)
  {
    id v4 = [(NoteContext *)self localAccount];
    id v5 = [v4 defaultStore];
    id v6 = self->_localStore;
    self->_localStore = v5;

    localStore = self->_localStore;
  }
  return localStore;
}

- (id)localAccount
{
  localAccount = self->_localAccount;
  if (!localAccount)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    id v5 = (void *)MEMORY[0x1E4F1C0A8];
    id v6 = [(NoteContext *)self managedObjectContext];
    id v7 = [v5 entityForName:@"Account" inManagedObjectContext:v6];

    [v4 setEntity:v7];
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"accountIdentifier == %@", @"local://local/account"];
    [v4 setPredicate:v8];
    uint64_t v9 = [(NoteContext *)self managedObjectContext];
    id v17 = 0;
    uint64_t v10 = [v9 executeFetchRequest:v4 error:&v17];
    id v11 = v17;

    if (v11)
    {
      uint64_t v12 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[NoteContext localAccount]();
      }
    }
    else if ([v10 count] == 1)
    {
      id v13 = [v10 lastObject];
      id v14 = self->_localAccount;
      self->_localAccount = v13;
    }
    else
    {
      id v15 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(NoteContext *)v10 localAccount];
      }

      [(NoteContext *)self forceSetUpUniqueObjects];
    }

    localAccount = self->_localAccount;
  }
  return localAccount;
}

- (BOOL)forceDeleteAccount:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v36 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"NoteAttachment"];
  long long v34 = v4;
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"note.store.account == %@", v4];
  [v5 setPredicate:v6];

  long long v33 = v5;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v5];
  [v7 setResultType:1];
  long long v32 = self;
  id v8 = [(NoteContext *)self managedObjectContext];
  id v44 = 0;
  long long v31 = v7;
  uint64_t v9 = [v8 executeRequest:v7 error:&v44];
  id v10 = v44;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v30 = v9;
  id obj = [v9 result];
  uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
        id v39 = v10;
        long long v16 = +[NoteAttachmentObject attachmentDirectoryURLForAttachmentObjectID:v15 error:&v39];
        id v17 = v39;

        if (v17)
        {
          long long v18 = os_log_create("com.apple.notes", "HTML");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v46 = v17;
            _os_log_fault_impl(&dword_1CFDA4000, v18, OS_LOG_TYPE_FAULT, "Error getting file directory URL for attachment: %@", buf, 0xCu);
          }
        }
        if (v16)
        {
          id v38 = v17;
          char v19 = [v36 removeItemAtURL:v16 error:&v38];
          id v10 = v38;

          if (v19) {
            goto LABEL_18;
          }
          char v20 = os_log_create("com.apple.notes", "HTML");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v46 = v10;
            _os_log_fault_impl(&dword_1CFDA4000, v20, OS_LOG_TYPE_FAULT, "Error removing attachment file: %@", buf, 0xCu);
          }
        }
        else
        {
          char v20 = os_log_create("com.apple.notes", "HTML");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v46 = v15;
            _os_log_fault_impl(&dword_1CFDA4000, v20, OS_LOG_TYPE_FAULT, "Failed to get attachment folder URL for object ID: %@", buf, 0xCu);
          }
          id v10 = v17;
        }

LABEL_18:
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v12);
  }

  id v21 = [(NoteContext *)v32 newFetchRequestForNotes];
  id v22 = [v34 predicateForNotes];
  [v21 setPredicate:v22];

  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v21];
  uint64_t v24 = [(NoteContext *)v32 managedObjectContext];
  id v37 = v10;
  id v25 = (id)[v24 executeRequest:v23 error:&v37];
  id v26 = v37;

  if (v26)
  {
    v27 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[NoteContext forceDeleteAccount:]();
    }
  }
  BOOL v28 = [(NoteContext *)v32 managedObjectContext];
  [v28 deleteObject:v34];

  return 1;
}

- (BOOL)deleteAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContext *)self localAccount];

  BOOL v6 = v5 != v4 && [(NoteContext *)self forceDeleteAccount:v4];
  return v6;
}

- (BOOL)deleteStore:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NoteContext *)self localStore];

  if (v5 != v4)
  {
    BOOL v6 = [(NoteContext *)self allNotesInCollection:v4];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [(NoteContext *)self deleteNoteRegardlessOfConstraints:*(void *)(*((void *)&v13 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    uint64_t v11 = [(NoteContext *)self managedObjectContext];
    [v11 deleteObject:v4];
  }
  return v5 != v4;
}

- (BOOL)shouldDisableLocalStore
{
  if ([(NoteContext *)self countOfStores] < 2) {
    return 0;
  }
  id v3 = [(NoteContext *)self localStore];
  BOOL v4 = [(NoteContext *)self countOfNotesInCollection:v3] == 0;

  return v4;
}

- (BOOL)hasMultipleEnabledStores
{
  unint64_t v3 = [(NoteContext *)self countOfStores];
  if (v3 > 2) {
    return 1;
  }
  if (v3 != 2) {
    return 0;
  }
  id v5 = [(NoteContext *)self localStore];
  BOOL v4 = [(NoteContext *)self countOfNotesInCollection:v5] != 0;

  return v4;
}

- (id)_notePropertyObjectForKey:(id)a3
{
  id v4 = a3;
  notePropertyObjectsRealized = self->_notePropertyObjectsRealized;
  if (!notePropertyObjectsRealized)
  {
    BOOL v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = self->_notePropertyObjectsRealized;
    self->_notePropertyObjectsRealized = v6;

    notePropertyObjectsRealized = self->_notePropertyObjectsRealized;
  }
  uint64_t v8 = [(NSMutableDictionary *)notePropertyObjectsRealized objectForKey:v4];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(NoteContext *)self managedObjectContext];
    [v10 refreshObject:v9 mergeChanges:1];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    uint64_t v12 = (void *)MEMORY[0x1E4F1C0A8];
    long long v13 = [(NoteContext *)self managedObjectContext];
    long long v14 = [v12 entityForName:@"Property" inManagedObjectContext:v13];
    [v11 setEntity:v14];

    long long v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"propertyKey == %@", v4];
    [v11 setPredicate:v15];
    [v11 setFetchLimit:1];
    long long v16 = [(NoteContext *)self managedObjectContext];
    id v21 = 0;
    id v17 = [v16 executeFetchRequest:v11 error:&v21];
    id v18 = v21;

    if (v18)
    {
      char v19 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[NoteContext _notePropertyObjectForKey:]();
      }
    }
    uint64_t v9 = [v17 lastObject];
    if (v9) {
      [(NSMutableDictionary *)self->_notePropertyObjectsRealized setObject:v9 forKey:v4];
    }
  }
  return v9;
}

- (void)setPropertyValue:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(NoteContext *)self _notePropertyObjectForKey:v6];
  if (!v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C0A8];
    uint64_t v9 = [(NoteContext *)self managedObjectContext];
    uint64_t v7 = [v8 insertNewObjectForEntityForName:@"Property" inManagedObjectContext:v9];

    [v7 setPropertyKey:v6];
    [(NSMutableDictionary *)self->_notePropertyObjectsRealized setObject:v7 forKey:v6];
  }
  [v7 setPropertyValue:v10];
}

- (id)propertyValueForKey:(id)a3
{
  unint64_t v3 = [(NoteContext *)self _notePropertyObjectForKey:a3];
  id v4 = [v3 propertyValue];

  return v4;
}

- (id)getNextIdObject
{
  if (!self->_nextIdContext)
  {
    unint64_t v3 = [(id)objc_opt_class() persistentStoreCoordinator];
    if (v3)
    {
      id v4 = (NSManagedObjectContext *)objc_alloc_init(MEMORY[0x1E4F1C110]);
      nextIdContext = self->_nextIdContext;
      self->_nextIdContext = v4;

      [(NSManagedObjectContext *)self->_nextIdContext setPersistentStoreCoordinator:v3];
    }
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v7 = [MEMORY[0x1E4F1C0A8] entityForName:@"NextId" inManagedObjectContext:self->_nextIdContext];
  [v6 setEntity:v7];
  uint64_t v8 = self->_nextIdContext;
  id v39 = 0;
  uint64_t v9 = [(NSManagedObjectContext *)v8 executeFetchRequest:v6 error:&v39];
  id v10 = v39;
  if (v10)
  {
    id v11 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[NoteContext getNextIdObject]();
    }
  }
  if ([v9 count])
  {
    uint64_t v12 = [v9 lastObject];
    id v13 = v10;
  }
  else
  {
    id v37 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"NextId" inManagedObjectContext:self->_nextIdContext];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    long long v15 = (void *)MEMORY[0x1E4F1C0A8];
    long long v16 = [(NoteContext *)self managedObjectContext];
    uint64_t v17 = [v15 entityForName:@"Note" inManagedObjectContext:v16];

    uint64_t v36 = (void *)v17;
    [v14 setEntity:v17];
    [v14 setResultType:2];
    uint64_t v18 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"integerId"];
    char v19 = (void *)MEMORY[0x1E4F28C68];
    id v35 = (void *)v18;
    char v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
    uint64_t v21 = [v19 expressionForFunction:@"max:" arguments:v20];

    id v22 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v22 setName:@"maxId"];
    long long v34 = (void *)v21;
    [v22 setExpression:v21];
    [v22 setExpressionResultType:200];
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObject:v22];
    [v14 setPropertiesToFetch:v23];

    uint64_t v24 = [(NoteContext *)self managedObjectContext];
    id v38 = v10;
    id v25 = [v24 executeFetchRequest:v14 error:&v38];
    id v13 = v38;

    if (v13 || !v25 || ![v25 count])
    {
      id v26 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[NoteContext getNextIdObject]();
      }
    }
    v27 = [v25 lastObject];
    BOOL v28 = [v27 valueForKey:@"maxId"];
    unsigned int v29 = [v28 unsignedIntValue];

    unsigned int v30 = 10 * (v29 / 0xA) + 10;
    if (v30 > 0xFFFFFFF5) {
      unsigned int v30 = 0;
    }
    if (v30) {
      uint64_t v31 = v30;
    }
    else {
      uint64_t v31 = 10;
    }
    long long v32 = [NSNumber numberWithUnsignedInt:v31];
    uint64_t v12 = v37;
    [v37 setValue:v32 forKey:@"counter"];
  }
  return v12;
}

- (id)nextIndex
{
  v20[4] = *(id *)MEMORY[0x1E4F143B8];
  nextId = self->_nextId;
  if (!nextId
    || (HIDWORD(v4) = -858993459 * [(NSNumber *)nextId unsignedIntValue],
        LODWORD(v4) = HIDWORD(v4),
        (v4 >> 1) <= 0x19999999))
  {
    id v5 = objc_opt_class();
    objc_sync_enter(v5);
    [(ICExclusiveLock *)self->_nextIdLock lock];
    id v6 = [(NoteContext *)self getNextIdObject];
    uint64_t v7 = [v6 valueForKey:@"counter"];
    uint64_t v8 = self->_nextId;
    self->_nextId = v7;

    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_nextId, "unsignedIntValue") + 10);
    [v6 setValue:v9 forKey:@"counter"];

    nextIdContext = self->_nextIdContext;
    v20[0] = 0;
    BOOL v11 = [(NSManagedObjectContext *)nextIdContext save:v20];
    id v12 = v20[0];
    if (!v11)
    {
      id v13 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        [v12 userInfo];
        objc_claimAutoreleasedReturnValue();
        -[NoteContext nextIndex]();
      }
    }
    [(NSManagedObjectContext *)self->_nextIdContext reset];

    [(ICExclusiveLock *)self->_nextIdLock unlock];
    objc_sync_exit(v5);
  }
  long long v15 = self->_nextId;
  p_nextId = &self->_nextId;
  long long v16 = (void *)[(NSNumber *)v15 copy];
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v16, "unsignedIntValue") + 1);
  uint64_t v18 = *p_nextId;
  *p_nextId = (NSNumber *)v17;

  return v16;
}

+ (id)backupsDirectoryURL
{
  uint64_t v2 = [a1 urlForPersistentStore];
  unint64_t v3 = [v2 URLByDeletingLastPathComponent];
  unint64_t v4 = [v3 URLByAppendingPathComponent:@"Backups" isDirectory:1];

  return v4;
}

+ (void)backupPersistentStore:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[NoteContext backupPersistentStore:].cold.8();
  }

  id v6 = [a1 urlForPersistentStore];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v7 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [v7 stringFromDate:v8];

  id v10 = NSString;
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  id v12 = [(id)v11 UUIDString];
  uint64_t v49 = (void *)v9;
  uint64_t v13 = [v10 stringWithFormat:@"Backup-%@-%@", v9, v12];

  id v14 = [a1 backupsDirectoryURL];
  v50 = (void *)v13;
  long long v15 = [v14 URLByAppendingPathComponent:v13 isDirectory:1];

  long long v16 = [v6 lastPathComponent];
  char v52 = [v15 URLByAppendingPathComponent:v16 isDirectory:0];

  uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v56 = 0;
  LOBYTE(v11) = [v17 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v56];
  id v18 = v56;

  if ((v11 & 1) == 0)
  {
    char v19 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[NoteContext backupPersistentStore:].cold.7();
    }

    id v18 = 0;
  }
  char v20 = [a1 storeOptions];
  uint64_t v21 = [a1 storeOptions];
  uint64_t v22 = *MEMORY[0x1E4F1BF70];
  id v55 = v18;
  uint64_t v51 = v4;
  char v23 = [v4 replacePersistentStoreAtURL:v52 destinationOptions:v20 withPersistentStoreFromURL:v6 sourceOptions:v21 storeType:v22 error:&v55];
  id v24 = v55;

  id v25 = os_log_create("com.apple.notes", "HTML");
  id v26 = v25;
  if ((v23 & 1) == 0)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[NoteContext backupPersistentStore:].cold.6();
    }
    goto LABEL_27;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v58 = v6;
    __int16 v59 = 2112;
    v60 = v52;
    _os_log_impl(&dword_1CFDA4000, v26, OS_LOG_TYPE_INFO, "Backed up old persistent store from %@ to %@", buf, 0x16u);
  }

  id v54 = v24;
  int v27 = [v6 checkResourceIsReachableAndReturnError:&v54];
  id v28 = v54;

  id v26 = os_log_create("com.apple.notes", "HTML");
  BOOL v29 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
  unsigned int v30 = v51;
  if (!v27)
  {
    if (v29) {
      +[NoteContext backupPersistentStore:].cold.5();
    }
    id v24 = v28;
    goto LABEL_28;
  }
  if (v29) {
    +[NoteContext backupPersistentStore:].cold.4();
  }

  uint64_t v31 = [a1 storeOptions];
  id v53 = v28;
  int v32 = [v51 destroyPersistentStoreAtURL:v6 withType:v22 options:v31 error:&v53];
  id v24 = v53;

  long long v33 = os_log_create("com.apple.notes", "HTML");
  id v26 = v33;
  if (!v32)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      +[NoteContext backupPersistentStore:]();
    }

    uint64_t v36 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      +[NoteContext backupPersistentStore:]();
    }

    id v37 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v37 removeItemAtURL:v6 error:0];

    id v38 = [v6 lastPathComponent];
    id v39 = [v38 stringByDeletingPathExtension];
    id v26 = [v39 stringByAppendingPathExtension:@"sqlite-wal"];

    long long v40 = [v6 URLByDeletingLastPathComponent];
    long long v41 = [v40 URLByAppendingPathComponent:v26 isDirectory:0];

    long long v42 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v42 removeItemAtURL:v41 error:0];

    long long v43 = [v6 lastPathComponent];
    id v44 = [v43 stringByDeletingPathExtension];
    long long v45 = [v44 stringByAppendingPathExtension:@"sqlite-shm"];

    id v46 = [v6 URLByDeletingLastPathComponent];
    long long v47 = [v46 URLByAppendingPathComponent:v45 isDirectory:0];

    uint64_t v48 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v48 removeItemAtURL:v47 error:0];

LABEL_27:
    unsigned int v30 = v51;
LABEL_28:
    id v35 = v49;
    long long v34 = v50;
    goto LABEL_29;
  }
  long long v34 = v50;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    +[NoteContext backupPersistentStore:]();
  }
  id v35 = v49;
LABEL_29:
}

+ (BOOL)isTooLowOnDiskSpace
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 urlForPersistentStore];
  unint64_t v3 = [v2 URLByDeletingPathExtension];
  id v4 = [v3 URLByAppendingPathExtension:@"sqlite-wal"];

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v2 URLByDeletingLastPathComponent];
  id v7 = [v6 path];
  id v29 = 0;
  uint64_t v8 = [v5 attributesOfFileSystemForPath:v7 error:&v29];
  id v9 = v29;

  if (v9)
  {
    id v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[NoteContext isTooLowOnDiskSpace];
    }

    unint64_t v11 = 0;
  }
  else
  {
    id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F283A0]];
    unint64_t v11 = [v10 unsignedIntegerValue];
  }

  id v28 = 0;
  uint64_t v12 = *MEMORY[0x1E4F1C5F8];
  id v27 = 0;
  int v13 = [v2 getResourceValue:&v28 forKey:v12 error:&v27];
  id v14 = v28;
  id v15 = v27;

  if (v13)
  {
    uint64_t v16 = [v14 unsignedIntegerValue];
  }
  else
  {
    uint64_t v17 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[NoteContext isTooLowOnDiskSpace]();
    }

    uint64_t v16 = 0;
  }
  id v25 = 0;
  id v26 = 0;
  int v18 = [v4 getResourceValue:&v26 forKey:v12 error:&v25];
  id v19 = v26;

  id v20 = v25;
  if (v18)
  {
    v16 += [v19 unsignedIntegerValue];
  }
  else if ([v20 code] != 260)
  {
    uint64_t v21 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[NoteContext isTooLowOnDiskSpace]();
    }
  }
  unint64_t v22 = 3 * v16 + 0x100000;
  char v23 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v31 = v22;
    __int16 v32 = 2048;
    unint64_t v33 = v11;
    _os_log_impl(&dword_1CFDA4000, v23, OS_LOG_TYPE_INFO, "Minimum free space to open database: %lu, current free space: %lu", buf, 0x16u);
  }

  return v11 < v22;
}

+ (BOOL)isDataProtectionError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  id v5 = [v3 domain];
  uint64_t v6 = *MEMORY[0x1E4F1BF50];
  if ([v5 isEqualToString:*MEMORY[0x1E4F1BF50]])
  {
    id v7 = [NSNumber numberWithInteger:v4];
  }
  else
  {
    uint64_t v8 = [v3 userInfo];
    id v7 = [v8 objectForKeyedSubscript:v6];
  }
  uint64_t v9 = *MEMORY[0x1E4F28798];
  if ([v5 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    id v10 = [NSNumber numberWithInteger:v4];
  }
  else
  {
    unint64_t v11 = [v3 userInfo];
    id v10 = [v11 objectForKeyedSubscript:v9];
  }
  BOOL v12 = [v7 intValue] == 23 || objc_msgSend(v10, "intValue") == 1;

  return v12;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  uint64_t v2 = objc_opt_class();
  return (NSPersistentStoreCoordinator *)[v2 persistentStoreCoordinator];
}

uint64_t __41__NoteContext_persistentStoreCoordinator__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3 == 0;
  return result;
}

uint64_t __41__NoteContext_persistentStoreCoordinator__block_invoke_236(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3 == 0;
  return result;
}

+ (id)newManagedObjectContext
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  uint64_t v4 = [a1 persistentStoreCoordinator];
  [v3 setPersistentStoreCoordinator:v4];

  [v3 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  [v3 setUndoManager:0];
  return v3;
}

- (void)receiveDarwinNotificationWithChangeLogging:(BOOL)a3
{
  unint64_t notificationCount = self->_notificationCount;
  if (notificationCount)
  {
    self->_unint64_t notificationCount = notificationCount - 1;
  }
  else
  {
    id v4 = [(NoteContext *)self mocUpdater];
    [v4 requestUpdate];
  }
}

- (void)resetNotificationCount
{
  self->_unint64_t notificationCount = 0;
}

- (id)noteChangeWithType:(int)a3 store:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C0A8];
  id v7 = a4;
  uint64_t v8 = [(NoteContext *)self managedObjectContext];
  uint64_t v9 = [v6 insertNewObjectForEntityForName:@"NoteChange" inManagedObjectContext:v8];

  [v9 setStore:v7];
  id v10 = [MEMORY[0x1E4F1CA80] set];
  [v9 setNoteIntegerIds:v10];

  unint64_t v11 = [MEMORY[0x1E4F1CA80] set];
  [v9 setNoteServerIds:v11];

  BOOL v12 = [MEMORY[0x1E4F1CA80] set];
  [v9 setNoteServerIntIds:v12];

  int v13 = [NSNumber numberWithInt:v4];
  [v9 setChangeType:v13];

  return v9;
}

- (void)managedObjectContextWillSaveNotification:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v5 = [v6 userInfo];
  [v4 postNotificationName:@"NoteContextWillSaveNotification" object:self userInfo:v5];

  if (self->_logChanges) {
    [(NoteContext *)self trackChanges:v6];
  }
}

- (void)trackChanges:(id)a3
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NoteContext *)self managedObjectContext];
  id v5 = [v4 deletedObjects];
  v96 = (void *)[v5 mutableCopy];

  id v6 = [(NoteContext *)self managedObjectContext];
  id v7 = [v6 updatedObjects];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [(NoteContext *)self managedObjectContext];
  id v10 = [v9 insertedObjects];
  v94 = (void *)[v10 mutableCopy];

  unint64_t v11 = (void *)MEMORY[0x1E4F1C0A8];
  v99 = self;
  BOOL v12 = [(NoteContext *)self managedObjectContext];
  int v13 = [v11 entityForName:@"Note" inManagedObjectContext:v12];

  v103 = [MEMORY[0x1E4F1CA80] set];
  v100 = [MEMORY[0x1E4F1CA80] set];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v116 objects:v123 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v117;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v117 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v116 + 1) + 8 * i);
        id v20 = objc_msgSend(v19, "entity", v94);
        int v21 = [v20 isEqual:v13];

        if (v21)
        {
          id v22 = v19;
          if ([v22 isMarkedForDeletion]) {
            [v100 addObject:v22];
          }
          char v23 = [MEMORY[0x1E4F1C978] arrayWithObject:@"store"];
          id v24 = [v22 committedValuesForKeys:v23];
          id v25 = [v24 objectForKey:@"store"];

          id v26 = [v22 store];

          if (v25 != v26) {
            [v103 addObject:v22];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v116 objects:v123 count:16];
    }
    while (v16);
  }

  [v14 minusSet:v100];
  id v27 = v96;
  [v96 unionSet:v100];
  [v14 minusSet:v103];
  [v96 unionSet:v103];
  [v94 unionSet:v103];
  id v98 = v14;
  if ([v94 count])
  {
    id v101 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v28 = v94;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v112 objects:v122 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v113;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v113 != v31) {
            objc_enumerationMutation(v28);
          }
          unint64_t v33 = *(void **)(*((void *)&v112 + 1) + 8 * j);
          uint64_t v34 = objc_msgSend(v33, "entity", v94);
          int v35 = [v34 isEqual:v13];

          if (v35)
          {
            id v36 = v33;
            id v37 = [v36 store];
            id v38 = v37;
            if (v37)
            {
              id v39 = [v37 objectID];
              long long v40 = [v101 objectForKey:v39];

              if (!v40)
              {
                long long v40 = [(NoteContext *)v99 noteChangeWithType:0 store:v38];
                long long v41 = [v38 objectID];
                [v101 setObject:v40 forKey:v41];
              }
              long long v42 = [v40 noteIntegerIds];
              long long v43 = [v36 integerId];
              [v42 addObject:v43];

              id v14 = v98;
            }
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v112 objects:v122 count:16];
      }
      while (v30);
    }

    id v27 = v96;
  }
  if (objc_msgSend(v14, "count", v94))
  {
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v45 = v14;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v108 objects:v121 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v109;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v109 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v108 + 1) + 8 * k);
          uint64_t v51 = [v50 entity];
          int v52 = [v51 isEqual:v13];

          if (v52)
          {
            id v53 = v50;
            id v54 = [v53 store];
            id v55 = [v54 objectID];
            id v56 = [v44 objectForKey:v55];

            if (!v56)
            {
              v57 = [v53 store];
              id v56 = [(NoteContext *)v99 noteChangeWithType:1 store:v57];

              v58 = [v56 store];
              __int16 v59 = [v58 objectID];
              [v44 setObject:v56 forKey:v59];
            }
            v60 = [v56 noteIntegerIds];
            uint64_t v61 = [v53 integerId];
            [v60 addObject:v61];

            v62 = [v53 serverId];

            if (v62)
            {
              v63 = [v56 noteServerIds];
              v64 = [v53 serverId];
              [v63 addObject:v64];
            }
            if ([v53 serverIntId])
            {
              v65 = [v56 noteServerIntIds];
              v66 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v53, "serverIntId"));
              [v65 addObject:v66];
            }
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v108 objects:v121 count:16];
      }
      while (v47);
    }

    id v27 = v96;
    id v14 = v98;
  }
  if ([v27 count])
  {
    id v102 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v67 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v67 postNotificationName:@"NoteContextDeletedNotesNotification" object:v27];

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v68 = v27;
    uint64_t v69 = [v68 countByEnumeratingWithState:&v104 objects:v120 count:16];
    if (!v69) {
      goto LABEL_67;
    }
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v105;
    id v97 = v68;
    while (1)
    {
      for (uint64_t m = 0; m != v70; ++m)
      {
        if (*(void *)v105 != v71) {
          objc_enumerationMutation(v68);
        }
        v73 = *(void **)(*((void *)&v104 + 1) + 8 * m);
        v74 = [v73 entity];
        int v75 = [v74 isEqual:v13];

        if (v75)
        {
          id v76 = v73;
          v77 = [MEMORY[0x1E4F1C978] arrayWithObject:@"store"];
          v78 = [v76 committedValuesForKeys:v77];

          v79 = [v78 objectForKey:@"store"];
          if (v79)
          {
            uint64_t v80 = [MEMORY[0x1E4F1CA98] null];
            v81 = v79;
            if (v79 == (void *)v80) {
              goto LABEL_63;
            }
            v82 = (void *)v80;
            char v83 = [v68 containsObject:v79];

            if ((v83 & 1) == 0)
            {
              v84 = [v79 objectID];
              v81 = [v102 objectForKey:v84];

              if (!v81)
              {
                v81 = [(NoteContext *)v99 noteChangeWithType:2 store:v79];
                v85 = [v81 store];
                v86 = [v85 objectID];
                [v102 setObject:v81 forKey:v86];
              }
              v87 = [v81 noteIntegerIds];
              v88 = [v76 integerId];
              [v87 addObject:v88];

              v89 = [v76 serverId];

              if (v89)
              {
                v90 = [v81 noteServerIds];
                v91 = [v76 serverId];
                [v90 addObject:v91];
              }
              if ([v76 serverIntId])
              {
                v92 = [v81 noteServerIntIds];
                v93 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v76, "serverIntId"));
                [v92 addObject:v93];
              }
              id v68 = v97;
LABEL_63:
            }
          }

          continue;
        }
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v104 objects:v120 count:16];
      if (!v70)
      {
LABEL_67:

        id v27 = v96;
        id v14 = v98;
        break;
      }
    }
  }
}

- (void)cleanUpLocks
{
  [(ICExclusiveLock *)self->_nextIdLock unlock];
  [(ICExclusiveLock *)self->_objectCreationLock unlock];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NoteContextDidUnlockObjectCreationNotification" object:self];
}

- (void)updateForRecentChanges
{
  id v2 = [(NoteContext *)self mocUpdater];
  [v2 requestUpdate];
}

- (void)postNotesChangedExternally
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NoteContextChangedElsewhereNotification" object:self userInfo:0];
}

- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6
{
  return 2;
}

- (AccountUtilities)accountUtilities
{
  return self->_accountUtilities;
}

- (void)setAccountUtilities:(id)a3
{
}

- (void)setIsMainContext:(BOOL)a3
{
  self->_isMainContext = a3;
}

- (void)setUsePrivateQueue:(BOOL)a3
{
  self->_usePrivateQueue = a3;
}

- (ICManagedObjectContextUpdater)mocUpdater
{
  return self->_mocUpdater;
}

- (ICSelectorDelayer)externalChangeNotificationDelayer
{
  return self->_externalChangeNotificationDelayer;
}

+ (id)mainContextObjectFromObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 sharedContext];
    id v6 = [v5 managedObjectContext];

    id v7 = [v4 managedObjectContext];

    uint64_t v8 = v4;
    if (v7 != v6)
    {
      uint64_t v9 = [v4 objectID];
      uint64_t v8 = [v6 existingObjectWithID:v9 error:0];

      id v10 = [v8 managedObjectContext];

      if (v10 != v6)
      {
        unint64_t v11 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          +[NoteContext(SharedContext) mainContextObjectFromObject:](v4, v11);
        }

        uint64_t v8 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)setUpLocalAccountAndStore
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFDA4000, v2, v3, "Error getting local account: %@, %@", v4, v5, v6, v7, v8);
}

- (void)setUpLastIndexTid
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFDA4000, v2, v3, "Error fetching last transaction ID: %@, %@", v4, v5, v6, v7, v8);
}

void __59__NoteContext_newFRCForFetchRequest_delegate_performFetch___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFDA4000, v2, v3, "Error: Problem performing fetch for NotesListController: %@, %@", v4, v5, v6, v7, v8);
}

- (void)batchFaultNotes:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_17();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_3(&dword_1CFDA4000, v1, (uint64_t)v1, "Can't batch fault objects: %@, with error: %@", v2);
}

- (void)deleteNote:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1CFDA4000, v0, v1, "Trying to delete an object from an HTML account, but the object has a nil object ID: %@", v2, v3, v4, v5, v6);
}

- (void)saveSilently:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1CFDA4000, v0, v1, "Database is corrupt", v2, v3, v4, v5, v6);
}

- (void)saveSilently:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_12(&dword_1CFDA4000, v0, v1, "Error saving silently: %@", v2, v3, v4, v5, v6);
}

- (void)saveSilently:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1CFDA4000, v0, v1, "Saving legacy context", v2, v3, v4, v5, v6);
}

- (void)visibleNotesForIntegerIds:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFDA4000, v2, v3, "Error getting notes with integer IDs: %@, %@", v4, v5, v6, v7, v8);
}

- (void)noteForGUID:.cold.1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13(&dword_1CFDA4000, v2, v3, "Error getting note with guid (%@):  %@, %@", v4, v5, v6, v7, v8);
}

- (void)storeForExternalIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13(&dword_1CFDA4000, v2, v3, "Error getting folder with external identifier (%@):  %@, %@", v4, v5, v6, v7, v8);
}

- (void)allStores
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFDA4000, v2, v3, "Error getting list of all stores: %@, %@", v4, v5, v6, v7, v8);
}

- (void)faultedInStoresForAccounts:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_12(&dword_1CFDA4000, v0, v1, "Error fetching stores: %@", v2, v3, v4, v5, v6);
}

- (void)countOfStores
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1CFDA4000, v0, v1, "Found no stores in [NoteContext countOfStores].  Will attempt to recover.", v2, v3, v4, v5, v6);
}

- (void)allAccountsAsFaults:prefechedRelationshipKeyPaths:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1CFDA4000, v0, v1, "Found no accounts in [NoteContext allAccounts].  Will attempt to recover.", v2, v3, v4, v5, v6);
}

- (void)allAccountsAsFaults:prefechedRelationshipKeyPaths:.cold.2()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFDA4000, v2, v3, "Error getting list of all accounts: %@, %@", v4, v5, v6, v7, v8);
}

- (void)accountForAccountId:.cold.1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13(&dword_1CFDA4000, v2, v3, "Error getting account for account identifier %@: %@, %@", v4, v5, v6, v7, v8);
}

- (void)localAccount
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFDA4000, v2, v3, "Error getting default account: %@, %@", v4, v5, v6, v7, v8);
}

- (void)forceDeleteAccount:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_12(&dword_1CFDA4000, v0, v1, "Error batch deleting notes whil deleting account: %@", v2, v3, v4, v5, v6);
}

- (void)_notePropertyObjectForKey:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFDA4000, v2, v3, "Error fetching property: %@, %@", v4, v5, v6, v7, v8);
}

- (void)getNextIdObject
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFDA4000, v2, v3, "Error: Couldn't fetch next ID: %@, %@", v4, v5, v6, v7, v8);
}

- (void)nextIndex
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CFDA4000, v6, v4, "Error: Couldn't save next ID: %@, %@", v5);
}

+ (void)backupPersistentStore:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_15(&dword_1CFDA4000, v0, v1, "Destroyed persistent store at %@", v2, v3, v4, v5, v6);
}

+ (void)backupPersistentStore:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1CFDA4000, v0, v1, "Falling back to just removing the database file", v2, v3, v4, v5, v6);
}

+ (void)backupPersistentStore:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1CFDA4000, v0, v1, "Error destroying persistent store: %@", v2, v3, v4, v5, v6);
}

+ (void)backupPersistentStore:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_15(&dword_1CFDA4000, v0, v1, "Destroying old persistent store at %@", v2, v3, v4, v5, v6);
}

+ (void)backupPersistentStore:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1CFDA4000, v0, v1, "Backed up store and the old one is gone", v2, v3, v4, v5, v6);
}

+ (void)backupPersistentStore:.cold.6()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1CFDA4000, v0, v1, "Error backing up old persistent store: %@", v2, v3, v4, v5, v6);
}

+ (void)backupPersistentStore:.cold.7()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1CFDA4000, v0, v1, "Failed to create database backup directory: %@", v2, v3, v4, v5, v6);
}

+ (void)backupPersistentStore:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1CFDA4000, v0, v1, "Backing up persistent store", v2, v3, v4, v5, v6);
}

+ (void)isTooLowOnDiskSpace
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 path];
  OUTLINED_FUNCTION_17();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1CFDA4000, a3, OS_LOG_TYPE_ERROR, "Error getting free space for filesystem at path: %@, error: %@", v6, 0x16u);
}

- (void)managedObjectContext
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1CFDA4000, v0, v1, "Failed to create managed object context for legacy notes", v2, v3, v4, v5, v6);
}

void __33__NoteContext_managedObjectModel__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_12(&dword_1CFDA4000, v0, v1, "Failed to load MobileNotes schema at %@", v2, v3, v4, v5, v6);
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1CFDA4000, v0, OS_LOG_TYPE_ERROR, "Low on disk space and unable to load persistent store", v1, 2u);
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1CFDA4000, v0, v1, "Successfully loaded persistent store on the second try", v2, v3, v4, v5, v6);
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1CFDA4000, v0, v1, "Error trying to load persistent store again: %@", v2, v3, v4, v5, v6);
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1CFDA4000, v0, v1, "Trying to load persistent store again", v2, v3, v4, v5, v6);
}

void __41__NoteContext_persistentStoreCoordinator__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CFDA4000, v6, v4, "Unexpected error while opening database %@, %@", v5);
}

@end