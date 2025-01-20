@interface PLManagedObjectContext
+ (BOOL)_isAssetLibraryFetchingAlbum:(id)a3;
+ (BOOL)_pl_megamoc_isInPLMocPerform;
+ (BOOL)_shouldRetryNewPersistentStoreCoordinatorWithError:(id)a3;
+ (BOOL)assetsLibraryLoggingEnabled;
+ (BOOL)canMergeRemoteChanges;
+ (BOOL)shouldHavePhotoLibrary;
+ (id)changeNotificationObjectIDKeys;
+ (id)changeNotificationObjectIDMutationKeys;
+ (id)changeNotificationObjectKeys;
+ (id)changeNotificationObjectMutationKeys;
+ (id)contextForRepairingSingletonObjectsWithReason:(id)a3 libraryURL:(id)a4 error:(id *)a5;
+ (id)contextForUninitializedPhotoLibrary:(id)a3 automaticallyMerges:(BOOL)a4 automaticallyPinToFirstFetch:(BOOL)a5;
+ (id)managedObjectModel;
+ (id)managedObjectModelURL;
+ (id)newContextForPhotoLibrary:(id)a3 automaticallyMerges:(BOOL)a4;
+ (id)sanitizedErrorFromError:(id)a3;
+ (void)_pl_megamoc_contextPerformDepthPop;
+ (void)_pl_megamoc_contextPerformDepthPush;
+ (void)_pl_megamoc_runWithPerformWarningsSuppressed:(id)a3;
+ (void)_setupInitialQueryGenerationForContext:(id)a3;
+ (void)_setupNameForContext:(id)a3 withLibrary:(id)a4;
+ (void)getPersistentStoreURL:(id *)a3 options:(id *)a4 forDatabasePath:(id)a5;
+ (void)removePhotosDatabaseWithPathManager:(id)a3;
- (BOOL)_adjustmentTimestampChangedChangedAttribute:(id)a3 from:(id)a4;
- (BOOL)_tooManyAssetChangesToHandle:(unint64_t)a3;
- (BOOL)getAndClearSyncChangeMarker;
- (BOOL)hasPreviouslyMergedDeleteForObject:(id)a3;
- (BOOL)hasRecordedBackgroundWorkItemWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5;
- (BOOL)isBackingALAssetsLibrary;
- (BOOL)isDatabaseCreationContext;
- (BOOL)isInitializingSingletons;
- (BOOL)isLocalOnlyDelete;
- (BOOL)isReadOnly;
- (BOOL)isUserInterfaceContext;
- (BOOL)isValidForSelector:(SEL)a3 error:(id *)a4;
- (BOOL)mergingChanges;
- (BOOL)nonCoalescing;
- (BOOL)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (BOOL)pl_performWithOptions:(unint64_t)a3 andBlock:(id)a4;
- (BOOL)pl_suppressUnhandledErrorDuringPerform;
- (BOOL)regenerateVideoThumbnails;
- (BOOL)save:(id *)a3;
- (BOOL)savingDuringMerge;
- (BOOL)shouldMergeFromRemoteContextWithChanges:(id)a3;
- (NSString)pl_basename;
- (PLDelayedFiledSystemDeletions)delayedDeletions;
- (PLDelayedSaveActions)delayedSaveActions;
- (PLManagedObjectContext)initWithConcurrencyType:(unint64_t)a3 libraryBundle:(id)a4;
- (PLManagedObjectContext)initWithConcurrencyType:(unint64_t)a3 libraryBundle:(id)a4 changeHandlingContainer:(id)a5 coordinator:(id)a6;
- (PLManagedObjectContextPTPNotificationDelegate)ptpNotificationDelegate;
- (PLPhotoLibrary)photoLibrary;
- (double)lastResetTimestamp;
- (id)_pl_executeFetchRequest:(id)a3 error:(id *)a4;
- (id)executeFetchRequest:(id)a3 error:(id *)a4;
- (id)executeRequest:(id)a3 error:(id *)a4;
- (id)existingObjectWithID:(id)a3 error:(id *)a4;
- (id)getAndClearRecordedAvalancheUUIDsForUpdate;
- (id)getAndClearRecordedObjectsForCloudDeletion;
- (id)pathManager;
- (id)pl_fetchObjectsWithIDs:(id)a3;
- (id)pl_fetchObjectsWithIDs:(id)a3 rootEntity:(id)a4;
- (id)pl_graphCache;
- (id)pl_libraryBundle;
- (id)storeUUID;
- (int)changeSource;
- (int64_t)resetCloudLibraryMode;
- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4;
- (void)_addCloudUUID:(id)a3 forDeletionType:(int64_t)a4;
- (void)_createDelayedSaveActionsWithTransaction:(id)a3;
- (void)_destroyDelayedSaveActions;
- (void)_directPerformBlock:(id)a3;
- (void)_directPerformBlockAndWait:(id)a3;
- (void)_getInsertedIDs:(id)a3 deletedIDs:(id)a4 changedIDs:(id)a5 adjustedIDs:(id)a6 ofEntityKind:(id)a7 fromRemoteContextDidSaveObjectIDsNotification:(id)a8;
- (void)_informPTPDelegateAboutChangesFromRemoteContextSaveNotification:(id)a3;
- (void)_logDatabaseDirectoryDiagnosticInfo;
- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4;
- (void)_notifyALAssetsLibraryWithChanges:(id)a3 usingObjectIDs:(BOOL)a4;
- (void)_recordChangedKeys:(id)a3 forObjectID:(id)a4;
- (void)_resetName;
- (void)_setNameFromCurrentQoS;
- (void)appendDelayedDeletionsToXPCMessage:(id)a3;
- (void)connectToChangeHandling;
- (void)dealloc;
- (void)disconnectFromChangeHandling;
- (void)getAndClearUpdatedObjectsAttributes:(id *)a3 relationships:(id *)a4;
- (void)invalidateWithReason:(id)a3;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)pl_wrapperForPerformBlock:(id)a3;
- (void)recordAvalancheUUIDForUpdate:(id)a3;
- (void)recordBackgroundJobWorkItemCreated:(id)a3;
- (void)recordChangesFromTriggerModifiedObjectIDs:(id)a3;
- (void)recordCloudDeletionForObject:(id)a3;
- (void)recordManagedObjectWillSave:(id)a3;
- (void)recordNeedsBackgroundJobProcessing;
- (void)recordSyncChangeMarker;
- (void)refreshAllObjects;
- (void)registerFilesystemDeletionInfo:(id)a3;
- (void)reset;
- (void)resetAllFetchingAlbums;
- (void)setChangeSource:(int)a3;
- (void)setDelayedDeletions:(id)a3;
- (void)setIsBackingALAssetsLibrary:(BOOL)a3;
- (void)setIsInitializingSingletons:(BOOL)a3;
- (void)setLocalOnlyDelete:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNonCoalescing:(BOOL)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setPl_basename:(id)a3;
- (void)setPl_suppressUnhandledErrorDuringPerform:(BOOL)a3;
- (void)setPtpNotificationDelegate:(id)a3;
- (void)setRegenerateVideoThumbnails:(BOOL)a3;
- (void)setResetCloudLibraryMode:(int64_t)a3;
- (void)setupDelegateWithBundle:(id)a3;
- (void)updateTransactionAuthor;
- (void)withDispatchGroup:(id)a3 performBlock:(id)a4;
@end

@implementation PLManagedObjectContext

+ (id)managedObjectModel
{
  return +[PLPersistentContainer managedObjectModel];
}

+ (id)contextForUninitializedPhotoLibrary:(id)a3 automaticallyMerges:(BOOL)a4 automaticallyPinToFirstFetch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  pl_dispatch_once();
  v9 = (void *)[a1 newContextForPhotoLibrary:v8 automaticallyMerges:v6];
  [a1 _setupNameForContext:v9 withLibrary:v8];
  if (v5) {
    [a1 _setupInitialQueryGenerationForContext:v9];
  }
  objc_msgSend(v9, "_pl_setupStalenessInterval");
  [v9 setPhotoLibrary:v8];

  return v9;
}

- (void)setPhotoLibrary:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLManagedObjectContext.m" lineNumber:519 description:@"photoLibrary cannot be changed once set."];
  }
  objc_storeWeak((id *)&self->_photoLibrary, obj);
}

+ (id)newContextForPhotoLibrary:(id)a3 automaticallyMerges:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [v5 libraryBundle];
  v7 = (objc_class *)objc_opt_class();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 || !v4)
  {
    if (isKindOfClass) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    v7 = (objc_class *)objc_opt_class();
  }
  else
  {
    uint64_t v9 = 1;
  }
  v10 = (void *)[[v7 alloc] initWithConcurrencyType:v9 libraryBundle:v6];

  return v10;
}

- (PLManagedObjectContext)initWithConcurrencyType:(unint64_t)a3 libraryBundle:(id)a4
{
  id v6 = a4;
  v7 = [v6 changeHandlingContainer];
  id v8 = [v6 persistentContainer];
  uint64_t v9 = [v8 sharedPersistentStoreCoordinator];
  v10 = [(PLManagedObjectContext *)self initWithConcurrencyType:a3 libraryBundle:v6 changeHandlingContainer:v7 coordinator:v9];

  return v10;
}

- (PLManagedObjectContext)initWithConcurrencyType:(unint64_t)a3 libraryBundle:(id)a4 changeHandlingContainer:(id)a5 coordinator:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v35.receiver = self;
  v35.super_class = (Class)PLManagedObjectContext;
  v13 = [(PLManagedObjectContext *)&v35 initWithConcurrencyType:a3];
  v14 = v13;
  if (v13)
  {
    if (!v12)
    {
      v33 = 0;
      goto LABEL_8;
    }
    v13->_changeSource = 0;
    [(PLManagedObjectContext *)v13 updateTransactionAuthor];
    v15 = [v10 pathManager];
    pathManager = v14->_pathManager;
    v14->_pathManager = v15;
    v17 = v15;

    objc_storeStrong((id *)&v14->_changeHandlingContainer, a5);
    [(PLManagedObjectContext *)v14 setPersistentStoreCoordinator:v12];
    v18 = [(NSMergePolicy *)[PLMergePolicy alloc] initWithMergeType:2];
    [(PLManagedObjectContext *)v14 setMergePolicy:v18];
    id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v20 = PLAllCloudDeletionKeys();
    uint64_t v21 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));
    uuidsForCloudDeletion = v14->_uuidsForCloudDeletion;
    v14->_uuidsForCloudDeletion = (NSMutableDictionary *)v21;

    uint64_t v23 = objc_opt_new();
    updatedObjectsAttributes = v14->_updatedObjectsAttributes;
    v14->_updatedObjectsAttributes = (NSMutableDictionary *)v23;

    uint64_t v25 = objc_opt_new();
    updatedObjectsRelationships = v14->_updatedObjectsRelationships;
    v14->_updatedObjectsRelationships = (NSMutableDictionary *)v25;

    [(PLManagedObjectContext *)v14 connectToChangeHandling];
    [(PLManagedObjectContext *)v14 setupLocalChangeNotifications];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v14->_lastResetTimestamp = v27;
    v14->_initFinished = 1;
    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    backgroundWorkItemIdentifiers = v14->_backgroundWorkItemIdentifiers;
    v14->_backgroundWorkItemIdentifiers = v28;

    [(PLManagedObjectContext *)v14 setupDelegateWithBundle:v10];
  }
  v30 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = objc_opt_class();
    v32 = v14->_pathManager;
    *(_DWORD *)buf = 138413058;
    uint64_t v37 = v31;
    __int16 v38 = 2048;
    v39 = v14;
    __int16 v40 = 2048;
    unint64_t v41 = a3;
    __int16 v42 = 2112;
    v43 = v32;
    _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEBUG, "%@ %p initWithConcurrencyType:%tu pathManager:%@", buf, 0x2Au);
  }

  v33 = v14;
LABEL_8:

  return v33;
}

- (void)setupDelegateWithBundle:(id)a3
{
  id v4 = a3;
  if (+[PLFetchRecorder isCurrentProcessEnabledForRecordingBundle:v4])
  {
    id v5 = [v4 fetchRecorder];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_alloc_init(PLManagedObjectContextDelegate);
  photosDelegate = self->_photosDelegate;
  self->_photosDelegate = v6;

  [(PLManagedObjectContextDelegate *)self->_photosDelegate setFetchRecorder:v5];
  [(PLManagedObjectContext *)self _setDelegate:self->_photosDelegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PLManagedObjectContext_setupDelegateWithBundle___block_invoke;
  v8[3] = &unk_1E5875CE0;
  v8[4] = self;
  [(PLManagedObjectContext *)self performBlockAndWait:v8];
}

- (void)connectToChangeHandling
{
  if (!self->_isConnectedToChangeHandling)
  {
    self->_isConnectedToChangeHandling = 1;
    if ([(id)objc_opt_class() canMergeRemoteChanges]) {
      [(PLChangeHandlingContainer *)self->_changeHandlingContainer registerToReceiveCoreDataChanges:self];
    }
    changeHandlingContainer = self->_changeHandlingContainer;
    [(PLChangeHandlingContainer *)changeHandlingContainer connectManagedObjectContext:self];
  }
}

+ (void)_setupNameForContext:(id)a3 withLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 pathManager];
  id v16 = [v7 libraryURL];

  id v8 = [MEMORY[0x1E4F8B908] redactedDescriptionForFileURL:v16];
  uint64_t v9 = [v5 name];
  id v10 = (void *)v9;
  id v11 = @"anon";
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  id v12 = v11;

  uint64_t v13 = [v5 role];
  v14 = +[PLPhotoLibrary stringFromLibraryRole:v13];
  v15 = [NSString stringWithFormat:@"%@ (%@) %@", v12, v8, v14];

  objc_msgSend(v6, "setPl_basename:", v15);
  [v6 setName:v15];
}

- (void)setPl_basename:(id)a3
{
}

- (void)setName:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%@ %p setName:%@", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLManagedObjectContext;
  [(PLManagedObjectContext *)&v6 setName:v4];
}

- (void)updateTransactionAuthor
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PLManagedObjectContext_updateTransactionAuthor__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PLManagedObjectContext *)self _directPerformBlockAndWait:v2];
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  id v5 = [(PLManagedObjectContext *)self photoLibrary];
  if (PLIsAssetsd())
  {
    BOOL v6 = !self->_initFinished || v5 == 0;
    if (!v6
      && !+[PLManagedObjectContext _pl_megamoc_isInPLMocPerform](PLManagedObjectContext, "_pl_megamoc_isInPLMocPerform")&& !+[PLConcurrencyLimiter isRunningUnderLimiter])
    {
      v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_FAULT, "Unexpected direct call to performBlockAndWait: sidesteps concurrency limits, convert to a perform call on photoLibrary, or call PLConcurrencyLimiter directly for plain NSManagedObjectContexts.", v8, 2u);
      }
    }
  }
  [(PLManagedObjectContext *)self _directPerformBlockAndWait:v4];
}

- (void)_directPerformBlockAndWait:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLManagedObjectContext__directPerformBlockAndWait___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PLManagedObjectContext;
  id v5 = v4;
  [(PLManagedObjectContext *)&v6 performBlockAndWait:v7];
}

- (PLPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PLPhotoLibrary *)WeakRetained;
}

- (BOOL)pl_performWithOptions:(unint64_t)a3 andBlock:(id)a4
{
  id v7 = a4;
  BOOL v8 = [(PLManagedObjectContext *)self isValidForSelector:a2 error:0];
  if (v8)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__PLManagedObjectContext_pl_performWithOptions_andBlock___block_invoke;
    v11[3] = &unk_1E5874098;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    v10.receiver = self;
    v10.super_class = (Class)PLManagedObjectContext;
    [(PLManagedObjectContext *)&v10 performWithOptions:a3 andBlock:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(PLManagedObjectContext *)self isValidForSelector:a2 error:a4])
  {
    id v12 = 0;
    BOOL v8 = [(PLManagedObjectContext *)self _pl_executeFetchRequest:v7 error:&v12];
    id v9 = v12;
    if (!v8)
    {
      objc_super v10 = [(PLManagedObjectContext *)self photoLibrary];
      [v10 handlePossibleCoreDataError:v9];

      if (a4) {
        *a4 = v9;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isValidForSelector:(SEL)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_invalidationStateLock = &self->_invalidationStateLock;
  os_unfair_lock_lock(&self->_invalidationStateLock);
  invalidationReason = self->_invalidationReason;
  if (invalidationReason)
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = NSStringFromSelector(a3);
      __int16 v11 = self->_invalidationReason;
      int v13 = 138543618;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ called after invalidate: %@", (uint8_t *)&v13, 0x16u);
    }
    if (a4) {
      *a4 = self->_invalidationReason;
    }
  }
  os_unfair_lock_unlock(p_invalidationStateLock);
  return invalidationReason == 0;
}

- (id)_pl_executeFetchRequest:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[PLFetchRequest pl_importantFetchNameForFetchRequest:v6];
  if (v7)
  {
    PLImportantFetchGetLog();
    BOOL v8 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    objc_super v10 = v8;
    __int16 v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = (uint64_t)v7;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ImportantPhotosFetch", "%{public}@", buf, 0xCu);
    }
  }
  else
  {
    __int16 v11 = 0;
    os_signpost_id_t v9 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)PLManagedObjectContext;
  id v12 = [(PLManagedObjectContext *)&v17 executeFetchRequest:v6 error:a4];
  if (v7)
  {
    int v13 = v11;
    v14 = v13;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      uint64_t v15 = [v12 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v15;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v9, "ImportantPhotosFetch", "%tu", buf, 0xCu);
    }
  }
  return v12;
}

+ (void)_pl_megamoc_runWithPerformWarningsSuppressed:(id)a3
{
  v3 = (void (**)(void))a3;
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPush");
  v3[2](v3);

  id v4 = objc_opt_class();
  objc_msgSend(v4, "_pl_megamoc_contextPerformDepthPop");
}

void __57__PLManagedObjectContext_pl_performWithOptions_andBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pl_wrapperForPerformBlock:", *(void *)(a1 + 32));
}

- (void)pl_wrapperForPerformBlock:(id)a3
{
  v3 = (void (**)(void))a3;
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPush");
  v3[2](v3);
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPop");
}

uint64_t __53__PLManagedObjectContext__directPerformBlockAndWait___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPush");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = objc_opt_class();
  return objc_msgSend(v2, "_pl_megamoc_contextPerformDepthPop");
}

+ (void)_pl_megamoc_contextPerformDepthPush
{
  if (_contextPerformDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_574);
  }
  v2 = (char *)pthread_getspecific(_contextPerformDepthThreadKey_s_key);
  if (_contextPerformDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_574);
  }
  pthread_key_t v3 = _contextPerformDepthThreadKey_s_key;
  pthread_setspecific(v3, v2 + 1);
}

+ (void)_pl_megamoc_contextPerformDepthPop
{
  if (_contextPerformDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_574);
  }
  id v4 = (char *)pthread_getspecific(_contextPerformDepthThreadKey_s_key);
  if ((uint64_t)v4 <= 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"PLManagedObjectContext.m" lineNumber:924 description:@"unbalanced calls to PLManagedObjectContext _contextPerformDepthPush/Pop()"];
  }
  if (_contextPerformDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_574);
  }
  pthread_key_t v5 = _contextPerformDepthThreadKey_s_key;
  pthread_setspecific(v5, v4 - 1);
}

uint64_t __50__PLManagedObjectContext_setupDelegateWithBundle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTrackSQLiteDatabaseStatistics:1];
}

void __49__PLManagedObjectContext_updateTransactionAuthor__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[PLPersistentHistoryTransactionModifiers transactionAuthorFromChangeSource:*(unsigned int *)(*(void *)(a1 + 32) + 316) syncChangeMarker:*(unsigned __int8 *)(*(void *)(a1 + 32) + 216) nonCoalescing:*(unsigned __int8 *)(*(void *)(a1 + 32) + 313)];
  [*(id *)(a1 + 32) setTransactionAuthor:v2];

  pthread_key_t v3 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [*(id *)(a1 + 32) transactionAuthor];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Updated transaction author: %@, for context: %p", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)isUserInterfaceContext
{
  return 0;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  pthread_key_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v11 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "PLManagedObjectContext %p dealloc", buf, 0xCu);
  }

  [(PLManagedObjectContext *)self tearDownLocalChangeNotifications];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  [(PLManagedObjectContext *)self setPtpNotificationDelegate:0];
  if (self->_avalancheUUIDsForUpdate)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:objc_opt_class() name:*MEMORY[0x1E4F1BE38] object:self];
  }
  uuidsForCloudDeletion = self->_uuidsForCloudDeletion;
  self->_uuidsForCloudDeletion = 0;

  updatedObjectsAttributes = self->_updatedObjectsAttributes;
  self->_updatedObjectsAttributes = 0;

  updatedObjectsRelationships = self->_updatedObjectsRelationships;
  self->_updatedObjectsRelationships = 0;

  [(PLManagedObjectContext *)self disconnectFromChangeHandling];
  v9.receiver = self;
  v9.super_class = (Class)PLManagedObjectContext;
  [(PLManagedObjectContext *)&v9 dealloc];
}

- (void)setPtpNotificationDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ptpNotificationDelegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_ptpNotificationDelegate, obj);

    if (obj)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      __int16 v8 = [v7 libraryBundle];
      [v8 beginObservingChanges];

      uint64_t v5 = obj;
      if (!self->_isObservingChangesForPTPNotificationDelegate)
      {
        objc_super v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v9 addObserver:self selector:sel__informPTPDelegateAboutChangesFromRemoteContextSaveNotification_ name:@"PLManagedObjectContextsPhotoKitNotification" object:0];

        uint64_t v5 = obj;
        self->_isObservingChangesForPTPNotificationDelegate = 1;
      }
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 removeObserver:self name:@"PLManagedObjectContextsPhotoKitNotification" object:0];

      self->_isObservingChangesForPTPNotificationDelegate = 0;
      id v11 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      uint64_t v12 = [v11 libraryBundle];
      [v12 endObservingChanges];

      uint64_t v5 = 0;
    }
  }
}

- (void)disconnectFromChangeHandling
{
  if (self->_isConnectedToChangeHandling)
  {
    self->_isConnectedToChangeHandling = 0;
    [(PLChangeHandlingContainer *)self->_changeHandlingContainer disconnectManagedObjectContext:self];
  }
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = [(PLManagedObjectContext *)self isValidForSelector:a2 error:a4];
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)PLManagedObjectContext;
    id v19 = 0;
    unint64_t v9 = [(PLManagedObjectContext *)&v18 countForFetchRequest:v7 error:&v19];
    id v10 = v19;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = [(PLManagedObjectContext *)self photoLibrary];
      [v11 handlePossibleCoreDataError:v10];

      if (!v10)
      {
        uint64_t v12 = PLBackendGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)objc_super v17 = 0;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_FAULT, "countForFetchRequest returned NSNotFound but no error was returned", v17, 2u);
        }

        int v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F8C500];
        uint64_t v20 = *MEMORY[0x1E4F28228];
        v21[0] = @"countForFetchRequest returned NSNotFound but no error was returned";
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        id v10 = [v13 errorWithDomain:v14 code:41001 userInfo:v15];
      }
      if (a4)
      {
        id v10 = v10;
        *a4 = v10;
      }
    }
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pl_basename, 0);
  objc_destroyWeak((id *)&self->_ptpNotificationDelegate);
  objc_storeStrong((id *)&self->_backgroundWorkItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_invalidationReason, 0);
  objc_storeStrong((id *)&self->_changeHandlingContainer, 0);
  objc_storeStrong((id *)&self->_delayedSaveActions, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_updatedObjectsRelationships, 0);
  objc_storeStrong((id *)&self->_updatedObjectsAttributes, 0);
  objc_storeStrong((id *)&self->_uuidsForCloudDeletion, 0);
  objc_storeStrong((id *)&self->_avalancheUUIDsForUpdate, 0);
  objc_storeStrong((id *)&self->_delayedDeletions, 0);
  objc_storeStrong((id *)&self->_photosDelegate, 0);
}

- (void)setPl_suppressUnhandledErrorDuringPerform:(BOOL)a3
{
  self->_pl_suppressUnhandledErrorDuringPerform = a3;
}

- (BOOL)pl_suppressUnhandledErrorDuringPerform
{
  return self->_pl_suppressUnhandledErrorDuringPerform;
}

- (NSString)pl_basename
{
  return self->_pl_basename;
}

- (void)setLocalOnlyDelete:(BOOL)a3
{
  self->_localOnlyDelete = a3;
}

- (BOOL)isLocalOnlyDelete
{
  return self->_localOnlyDelete;
}

- (void)setResetCloudLibraryMode:(int64_t)a3
{
  self->_resetCloudLibraryMode = a3;
}

- (int64_t)resetCloudLibraryMode
{
  return self->_resetCloudLibraryMode;
}

- (void)setIsBackingALAssetsLibrary:(BOOL)a3
{
  self->_isBackingALAssetsLibrary = a3;
}

- (BOOL)isBackingALAssetsLibrary
{
  return self->_isBackingALAssetsLibrary;
}

- (void)setIsInitializingSingletons:(BOOL)a3
{
  self->_isInitializingSingletons = a3;
}

- (BOOL)isInitializingSingletons
{
  return self->_isInitializingSingletons;
}

- (BOOL)nonCoalescing
{
  return self->_nonCoalescing;
}

- (int)changeSource
{
  return self->_changeSource;
}

- (void)setRegenerateVideoThumbnails:(BOOL)a3
{
  self->_regenerateVideoThumbnails = a3;
}

- (BOOL)regenerateVideoThumbnails
{
  return self->_regenerateVideoThumbnails;
}

- (void)setDelayedDeletions:(id)a3
{
}

- (PLDelayedFiledSystemDeletions)delayedDeletions
{
  return self->_delayedDeletions;
}

- (BOOL)savingDuringMerge
{
  return self->_savingDuringMerge;
}

- (BOOL)mergingChanges
{
  return self->_mergingChanges;
}

- (BOOL)shouldMergeFromRemoteContextWithChanges:(id)a3
{
  return 1;
}

- (void)appendDelayedDeletionsToXPCMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLManagedObjectContext *)self delayedDeletions];
  [v5 appendToXPCMessage:v4 managedObjectContext:self];

  [(PLManagedObjectContext *)self setDelayedDeletions:0];
}

- (void)_informPTPDelegateAboutChangesFromRemoteContextSaveNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = [(PLManagedObjectContext *)self ptpNotificationDelegate];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    BOOL v8 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = +[PLManagedObject entityInManagedObjectContext:self];
    [(PLManagedObjectContext *)self _getInsertedIDs:v7 deletedIDs:v8 changedIDs:v9 adjustedIDs:v10 ofEntityKind:v11 fromRemoteContextDidSaveObjectIDsNotification:v4];
    uint64_t v12 = [v7 count];
    uint64_t v13 = [v8 count] + v12;
    uint64_t v14 = v13 + [v9 count];
    if (v14 + [v10 count])
    {
      uint64_t v15 = [(PLManagedObjectContext *)self concurrencyType];
      if (v15 == *MEMORY[0x1E4F1C1C0])
      {
        [v6 managedObjectContext:self libraryChangedWithInsertedAssetIDs:v7 deletedAssetIDs:v8 changedAssetIDs:v9 adjustedAssetIDs:v10];
      }
      else
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __90__PLManagedObjectContext__informPTPDelegateAboutChangesFromRemoteContextSaveNotification___block_invoke;
        v16[3] = &unk_1E5874110;
        id v17 = v6;
        objc_super v18 = self;
        id v19 = v7;
        id v20 = v8;
        id v21 = v9;
        id v22 = v10;
        [(PLManagedObjectContext *)self _directPerformBlockAndWait:v16];
      }
    }
  }
}

uint64_t __90__PLManagedObjectContext__informPTPDelegateAboutChangesFromRemoteContextSaveNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) managedObjectContext:*(void *)(a1 + 40) libraryChangedWithInsertedAssetIDs:*(void *)(a1 + 48) deletedAssetIDs:*(void *)(a1 + 56) changedAssetIDs:*(void *)(a1 + 64) adjustedAssetIDs:*(void *)(a1 + 72)];
}

- (void)_getInsertedIDs:(id)a3 deletedIDs:(id)a4 changedIDs:(id)a5 adjustedIDs:(id)a6 ofEntityKind:(id)a7 fromRemoteContextDidSaveObjectIDsNotification:(id)a8
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v41 = a4;
  id v38 = a5;
  id v37 = a6;
  id v13 = a7;
  uint64_t v31 = [a8 userInfo];
  v36 = [v31 objectForKeyedSubscript:@"PLUpdatedAttributesByObjectIDKey"];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = +[PLManagedObjectContext changeNotificationObjectIDKeys];
  uint64_t v32 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v48;
    uint64_t v14 = *MEMORY[0x1E4F1BDF0];
    uint64_t v40 = *MEMORY[0x1E4F1BDB8];
    uint64_t v39 = *MEMORY[0x1E4F1BFA0];
    uint64_t v34 = *MEMORY[0x1E4F1BF28];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v48 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v15;
        id v16 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v17 = [v31 objectForKey:v16];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v44 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              uint64_t v23 = [v22 entity];
              int v24 = [v23 isKindOfEntity:v13];

              if (v24)
              {
                if (char v25 = [v16 isEqualToString:v14], v26 = v42, (v25)
                  || (char v27 = [v16 isEqualToString:v40], v26 = v41, (v27 & 1) != 0)
                  || (([v16 isEqualToString:v39] & 1) != 0
                   || [v16 isEqualToString:v34])
                  && ([v38 addObject:v22],
                      BOOL v28 = [(PLManagedObjectContext *)self _adjustmentTimestampChangedChangedAttribute:v22 from:v36], v26 = v37, v28))
                {
                  [v26 addObject:v22];
                }
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v19);
        }

        uint64_t v15 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v32);
  }
}

- (BOOL)_adjustmentTimestampChangedChangedAttribute:(id)a3 from:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PLManagedAsset entityName];
  BOOL v8 = [v5 entity];
  unint64_t v9 = [v8 name];
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    id v11 = [v6 objectForKeyedSubscript:v5];
    uint64_t v12 = [v11 unsignedLongLongValue];

    v19[0] = @"adjustmentTimestamp";
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v14 = [v5 entity];
    uint64_t v15 = [v14 name];
    unint64_t v16 = +[PLPropertyIndexMapping indexValueForAttributeNames:v13 entity:v15];

    BOOL v17 = (v16 & v12) != 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F38D3B0]();
  BOOL v8 = [(PLManagedObjectContext *)self mergingChanges];
  if (!v8) {
    self->_mergingChanges = 1;
  }
  unint64_t v9 = [(PLManagedObjectContext *)self userInfo];
  int v10 = [v9 objectForKey:@"PLMOCRedundantDeleteObjectIDs"];

  if (!v10)
  {
    int v10 = [MEMORY[0x1E4F1CA80] set];
    id v11 = [(PLManagedObjectContext *)self userInfo];
    [v11 setObject:v10 forKey:@"PLMOCRedundantDeleteObjectIDs"];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = [v6 objectForKey:*MEMORY[0x1E4F1BDB8]];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        [v10 addObject:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  v19.receiver = self;
  v19.super_class = (Class)PLManagedObjectContext;
  [(PLManagedObjectContext *)&v19 _mergeChangesFromDidSaveDictionary:v6 usingObjectIDs:v4];
  BOOL v17 = [(PLManagedObjectContext *)self ptpNotificationDelegate];

  if (v17) {
    [(PLManagedObjectContext *)self processPendingChanges];
  }
  if ([(PLManagedObjectContext *)self isBackingALAssetsLibrary])
  {
    uint64_t v18 = [(PLManagedObjectContext *)self photoLibrary];

    if (v18) {
      [(PLManagedObjectContext *)self _notifyALAssetsLibraryWithChanges:v6 usingObjectIDs:v4];
    }
  }
  if (!v8) {
    self->_mergingChanges = 0;
  }
}

- (void)resetAllFetchingAlbums
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = +[PLGenericAlbum allAlbumsRegisteredWithManagedObjectContext:](PLFetchingAlbum, "allAlbumsRegisteredWithManagedObjectContext:", self, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if ([(id)objc_opt_class() _isAssetLibraryFetchingAlbum:v7]) {
          [v7 updateSnapshotAndClearCaches:0];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifyALAssetsLibraryWithChanges:(id)a3 usingObjectIDs:(BOOL)a4
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x19F38D3B0]();
  if (+[PLManagedObjectContext assetsLibraryLoggingEnabled])
  {
    NSLog(&cfstr_Notifyalassets.isa, self, v5);
  }
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F1BE00]];

  if (v7) {
    goto LABEL_63;
  }
  v94 = v6;
  long long v8 = +[PLManagedObject entityInManagedObjectContext:self];
  long long v9 = +[PLManagedObject entityInManagedObjectContext:self];
  BOOL v10 = +[PLPhotoLibrary _assetsLibrary_isSharedPhotoStreamsSupportEnabled];
  long long v11 = +[PLManagedObject entityInManagedObjectContext:self];
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __75__PLManagedObjectContext__notifyALAssetsLibraryWithChanges_usingObjectIDs___block_invoke;
  v115[3] = &unk_1E5865C30;
  id v93 = v8;
  id v116 = v93;
  BOOL v89 = v10;
  BOOL v119 = v10;
  id v92 = v11;
  id v117 = v92;
  id v12 = v9;
  id v118 = v12;
  uint64_t v13 = MEMORY[0x19F38D650](v115);
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v16 = [v5 objectForKey:*MEMORY[0x1E4F1BDF0]];
  v96 = (void *)v14;
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v13 + 16))(v13, v16, v14, v15);

  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  objc_super v19 = [v5 objectForKey:*MEMORY[0x1E4F1BFA0]];
  (*(void (**)(uint64_t, void *, uint64_t, void *))(v13 + 16))(v13, v19, v17, v18);

  long long v20 = [v5 objectForKey:*MEMORY[0x1E4F1BF28]];
  (*(void (**)(uint64_t, void *, uint64_t, void *))(v13 + 16))(v13, v20, v17, v18);

  long long v21 = [v5 objectForKey:*MEMORY[0x1E4F1BE08]];
  v105 = (void *)v17;
  (*(void (**)(uint64_t, void *, uint64_t, void *))(v13 + 16))(v13, v21, v17, v18);

  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
  id v95 = v5;
  int v24 = [v5 objectForKey:*MEMORY[0x1E4F1BDB8]];
  v91 = (void *)v13;
  v98 = (void *)v22;
  v103 = (void *)v23;
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v13 + 16))(v13, v24, v22, v23);

  uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
  v90 = (void *)v15;
  [v25 addObjectsFromArray:v15];
  [v25 addObjectsFromArray:v18];
  v97 = v18;
  BOOL v99 = -[PLManagedObjectContext _tooManyAssetChangesToHandle:](self, "_tooManyAssetChangesToHandle:", [v18 count]);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v102 = self;
  v26 = [(PLChangeHandlingContainer *)self->_changeHandlingContainer allDidSaveObjectIDsUserInfo];
  char v27 = [v26 objectForKeyedSubscript:@"PLUpdatedAttributesByObjectIDKey"];

  uint64_t v28 = [v27 countByEnumeratingWithState:&v111 objects:v125 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v112 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void **)(*((void *)&v111 + 1) + 8 * i);
        uint64_t v33 = [v32 entity];
        int v34 = [v33 isKindOfEntity:v12];

        if (v34) {
          [v25 addObject:v32];
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v111 objects:v125 count:16];
    }
    while (v29);
  }

  self = v102;
  objc_super v35 = v96;
  if (!v99)
  {
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id obj = +[PLGenericAlbum allAlbumsRegisteredWithManagedObjectContext:v102];
    uint64_t v36 = [obj countByEnumeratingWithState:&v107 objects:v124 count:16];
    if (!v36) {
      goto LABEL_28;
    }
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v108;
    uint64_t v100 = *(void *)v108;
    v101 = v25;
    while (1)
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v108 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void **)(*((void *)&v107 + 1) + 8 * j);
        if ([v40 isLibrary])
        {
          if ([v103 count]) {
            goto LABEL_25;
          }
          id v41 = (void *)MEMORY[0x1E4F1C0D0];
          id v42 = +[PLManagedAsset entityName];
          long long v43 = [v41 fetchRequestWithEntityName:v42];

          long long v44 = (void *)MEMORY[0x1E4F28BA0];
          long long v45 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v25];
          v123[0] = v45;
          long long v46 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForFinderSyncedAsset"), 1);
          v123[1] = v46;
          long long v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:2];
          long long v48 = [v44 andPredicateWithSubpredicates:v47];
          [v43 setPredicate:v48];

          uint64_t v25 = v101;
          [v43 setFetchLimit:1];
          [v43 setResultType:4];
          [v43 setIncludesPropertyValues:0];
          [v43 setIncludesPendingChanges:0];
          uint64_t v49 = [(PLManagedObjectContext *)v102 countForFetchRequest:v43 error:0];

          if (v49) {
            goto LABEL_25;
          }
        }
        else if (+[PLManagedObjectContext _isAssetLibraryFetchingAlbum:v40])
        {
          long long v50 = (void *)MEMORY[0x1E4F1C0D0];
          v51 = +[PLManagedAsset entityName];
          v52 = [v50 fetchRequestWithEntityName:v51];

          uint64_t v53 = (void *)MEMORY[0x1E4F28BA0];
          v54 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v25];
          v122[0] = v54;
          v55 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForNotifyALAssetsLibraryWithChangesExclusions"), 1);
          v122[1] = v55;
          v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:2];
          v57 = [v53 andPredicateWithSubpredicates:v56];

          v58 = +[PLFetchingAlbum predicateForAlbumKind:](PLFetchingAlbum, "predicateForAlbumKind:", [v40 kindValue]);
          v59 = (void *)MEMORY[0x1E4F28BA0];
          v121[0] = v57;
          v121[1] = v58;
          uint64_t v38 = v100;
          v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
          v61 = [v59 andPredicateWithSubpredicates:v60];

          [v52 setPredicate:v61];
          [v52 setFetchLimit:1];
          [v52 setResultType:4];
          [v52 setIncludesPropertyValues:0];
          [v52 setIncludesPendingChanges:0];
          uint64_t v62 = [(PLManagedObjectContext *)v102 countForFetchRequest:v52 error:0];

          uint64_t v25 = v101;
          if (v62)
          {
LABEL_25:
            v63 = [v40 objectID];
            [v105 addObject:v63];

            [v40 updateSnapshotAndClearCaches:0];
            continue;
          }
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v107 objects:v124 count:16];
      if (!v37)
      {
LABEL_28:

        self = v102;
        objc_super v35 = v96;
        if (+[PLManagedObjectContext assetsLibraryLoggingEnabled])
        {
          NSLog(&cfstr_Insertedalbumo.isa, v102, v96);
          NSLog(&cfstr_Updatedalbumoi.isa, v102, v105);
          NSLog(&cfstr_Updatedassetoi.isa, v102, v97);
        }
        id v64 = v97;
        v65 = v64;
        if (v89)
        {
          v66 = v64;
        }
        else
        {
          v67 = (void *)MEMORY[0x1E4F1C0D0];
          v68 = +[PLManagedAsset entityName];
          v69 = [v67 fetchRequestWithEntityName:v68];

          v70 = (void *)MEMORY[0x1E4F28BA0];
          v71 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v65];
          v120[0] = v71;
          v72 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForNotifyALAssetsLibraryWithChangesCloudSharedExclusions"), 1);
          v120[1] = v72;
          v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:2];
          v74 = [v70 andPredicateWithSubpredicates:v73];
          [v69 setPredicate:v74];

          self = v102;
          [v69 setResultType:1];
          [v69 setIncludesPropertyValues:0];
          [v69 setIncludesPendingChanges:0];
          v66 = [(PLManagedObjectContext *)v102 executeFetchRequest:v69 error:0];

          if (+[PLManagedObjectContext assetsLibraryLoggingEnabled])
          {
            NSLog(&cfstr_Updatedassetoi_0.isa, v102, v66);
          }
        }
        v75 = [MEMORY[0x1E4F1CA60] dictionary];
        if ([v96 count]
          || [v105 count]
          || [v98 count]
          || [v66 count])
        {
          v106[0] = MEMORY[0x1E4F143A8];
          v106[1] = 3221225472;
          v106[2] = __75__PLManagedObjectContext__notifyALAssetsLibraryWithChanges_usingObjectIDs___block_invoke_2;
          v106[3] = &unk_1E5865C58;
          v106[4] = self;
          v76 = (void (**)(void, void, void))MEMORY[0x19F38D650](v106);
          if ([v96 count])
          {
            v77 = ((void (**)(void, void *, uint64_t))v76)[2](v76, v96, 1);
            if ([v77 count]) {
              [v75 setObject:v77 forKey:@"insertedAssetGroups"];
            }
          }
          if ([v105 count])
          {
            v78 = ((void (**)(void, void *, void))v76)[2](v76, v105, 0);
            if ([v78 count]) {
              [v75 setObject:v78 forKey:@"updatedAssetGroups"];
            }
          }
          if ([v98 count])
          {
            v79 = ((void (**)(void, void *, void))v76)[2](v76, v98, 0);
            if ([v79 count]) {
              [v75 setObject:v79 forKey:@"deletedAssetGroups"];
            }
          }
          if ([v66 count])
          {
            v80 = ((void (**)(void, void *, void))v76)[2](v76, v66, 0);
            if ([v80 count]) {
              [v75 setObject:v80 forKey:@"updatedAssets"];
            }
          }
        }
        if (v89 || [v75 count])
        {
          if (+[PLManagedObjectContext assetsLibraryLoggingEnabled])
          {
            NSLog(&cfstr_Plgenericchang.isa, self, v75);
          }
          v81 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v82 = (void *)MEMORY[0x1E4F28EA0];
          v83 = [(PLManagedObjectContext *)self photoLibrary];
          v84 = [v82 notificationWithName:@"PLGenericChangeNotification" object:v83 userInfo:v75];
          [v81 postNotification:v84];
        }
        break;
      }
    }
  }

  uint64_t v6 = v94;
  id v5 = v95;
  if (v99)
  {
LABEL_63:
    [(PLManagedObjectContext *)self resetAllFetchingAlbums];
    if (+[PLManagedObjectContext assetsLibraryLoggingEnabled])
    {
      NSLog(&cfstr_Plgenericchang_0.isa, self);
    }
    v85 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v86 = (void *)MEMORY[0x1E4F28EA0];
    v87 = [(PLManagedObjectContext *)self photoLibrary];
    v88 = [v86 notificationWithName:@"PLGenericChangeNotification" object:v87 userInfo:0];
    [v85 postNotification:v88];
  }
}

void __75__PLManagedObjectContext__notifyALAssetsLibraryWithChanges_usingObjectIDs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 objectID];
        }
        else
        {
          id v15 = v14;
        }
        unint64_t v16 = v15;
        if (v15)
        {
          uint64_t v17 = [v15 entity];
          uint64_t v18 = v17;
          if (v8
            && [v17 isKindOfEntity:*(void *)(a1 + 32)]
            && ((objc_super v19 = v8, *(unsigned char *)(a1 + 56))
             || (v20 = [v18 isKindOfEntity:*(void *)(a1 + 40)], objc_super v19 = v8, !v20))
            || v9 && (v21 = [v18 isKindOfEntity:*(void *)(a1 + 48)], objc_super v19 = v9, v21))
          {
            [v19 addObject:v16];
          }
        }
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
}

id __75__PLManagedObjectContext__notifyALAssetsLibraryWithChanges_usingObjectIDs___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v20;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [*(id *)(a1 + 32) objectRegisteredForID:v13];
        if (v14)
        {
          id v15 = v6;
          unint64_t v16 = v14;
LABEL_8:
          [v15 addObject:v16];
          goto LABEL_13;
        }
        if (a3)
        {
          if (v10)
          {
            id v15 = v10;
            unint64_t v16 = v13;
            goto LABEL_8;
          }
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v13, 0);
        }
LABEL_13:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v9)
      {

        if (v10)
        {
          uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "pl_fetchObjectsWithIDs:", v7);
          [v6 addObjectsFromArray:v17];
          goto LABEL_18;
        }
        goto LABEL_19;
      }
    }
  }
  uint64_t v10 = 0;
  uint64_t v17 = v7;
LABEL_18:

LABEL_19:
  return v6;
}

- (id)pl_fetchObjectsWithIDs:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v31 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v11 = [v10 entity];
        uint64_t v12 = [v11 superentity];

        if (v12)
        {
          do
          {
            uint64_t v13 = [v11 superentity];

            uint64_t v14 = [v13 superentity];

            uint64_t v11 = v13;
          }
          while (v14);
        }
        else
        {
          uint64_t v13 = v11;
        }
        id v15 = [v4 objectForKey:v13];
        if (!v15)
        {
          id v15 = [MEMORY[0x1E4F1CA48] array];
          [v4 setObject:v15 forKey:v13];
        }
        [v15 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v7);
  }
  uint64_t v30 = v5;

  id v16 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  [v16 setIncludesPropertyValues:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v17 = v4;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        long long v23 = [v17 objectForKey:v22];
        [v16 setEntity:v22];
        uint64_t v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF in %@", v23, v30];
        [v16 setPredicate:v24];

        id v33 = 0;
        long long v25 = [(PLManagedObjectContext *)self executeFetchRequest:v16 error:&v33];
        id v26 = v33;
        if (v25)
        {
          [v31 addObjectsFromArray:v25];
        }
        else
        {
          uint64_t v27 = PLBackendGetLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = [v22 name];
            *(_DWORD *)buf = 138412802;
            long long v43 = v28;
            __int16 v44 = 2112;
            long long v45 = v23;
            __int16 v46 = 2112;
            id v47 = v26;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch %@ oids %@: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v48 count:16];
    }
    while (v19);
  }

  return v31;
}

- (id)pl_fetchObjectsWithIDs:(id)a3 rootEntity:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  [v8 setEntity:v7];
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF in %@", v6];
  [v8 setPredicate:v9];

  id v15 = 0;
  uint64_t v10 = [(PLManagedObjectContext *)self executeFetchRequest:v8 error:&v15];
  id v11 = v15;
  if (!v10)
  {
    uint64_t v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v7 name];
      *(_DWORD *)buf = 138412802;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch %@ oids %@: %@", buf, 0x20u);
    }
  }

  return v10;
}

- (BOOL)hasRecordedBackgroundWorkItemWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5
{
  backgroundWorkItemIdentifiers = self->_backgroundWorkItemIdentifiers;
  id v6 = +[PLBackgroundJobWorkItem jobIdentifierWithIdentifier:a3 jobType:a4 jobFlags:a5];
  LOBYTE(backgroundWorkItemIdentifiers) = [(NSMutableSet *)backgroundWorkItemIdentifiers containsObject:v6];

  return (char)backgroundWorkItemIdentifiers;
}

- (void)recordBackgroundJobWorkItemCreated:(id)a3
{
  backgroundWorkItemIdentifiers = self->_backgroundWorkItemIdentifiers;
  id v4 = [a3 jobIdentifier];
  [(NSMutableSet *)backgroundWorkItemIdentifiers addObject:v4];
}

- (void)recordNeedsBackgroundJobProcessing
{
  self->_needsBackgroundJobProcessing = 1;
}

- (BOOL)_tooManyAssetChangesToHandle:(unint64_t)a3
{
  BOOL v4 = [(PLChangeHandlingContainer *)self->_changeHandlingContainer isMergingCoalescedSaveNotification];
  unint64_t v5 = 100;
  if (v4) {
    unint64_t v5 = 50;
  }
  return v5 < a3;
}

- (void)setNonCoalescing:(BOOL)a3
{
  self->_nonCoalescing = a3;
  [(PLManagedObjectContext *)self updateTransactionAuthor];
}

- (void)setChangeSource:(int)a3
{
  self->_changeSource = a3;
  [(PLManagedObjectContext *)self updateTransactionAuthor];
}

- (BOOL)getAndClearSyncChangeMarker
{
  BOOL syncChangeMarker = self->_syncChangeMarker;
  self->_BOOL syncChangeMarker = 0;
  [(PLManagedObjectContext *)self updateTransactionAuthor];
  return syncChangeMarker;
}

- (void)recordSyncChangeMarker
{
  self->_BOOL syncChangeMarker = 1;
  [(PLManagedObjectContext *)self updateTransactionAuthor];
}

- (id)getAndClearRecordedObjectsForCloudDeletion
{
  id v3 = (void *)[(NSMutableDictionary *)self->_uuidsForCloudDeletion copy];
  [(NSMutableDictionary *)self->_uuidsForCloudDeletion removeAllObjects];
  return v3;
}

- (void)_addCloudUUID:(id)a3 forDeletionType:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    if ((unint64_t)a4 > 0xD) {
      id v7 = @"cloudUnknownDeleteGUIDs";
    }
    else {
      id v7 = off_1E5869C60[a4 - 1];
    }
    uint64_t v9 = v7;
    uint64_t v10 = [(NSMutableDictionary *)self->_uuidsForCloudDeletion objectForKey:v9];
    id v11 = (void *)[v10 mutableCopy];

    if (!v11) {
      id v11 = objc_opt_new();
    }
    [v11 addObject:v6];
    [(NSMutableDictionary *)self->_uuidsForCloudDeletion setObject:v11 forKey:v9];
  }
  else
  {
    id v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v12 = 134218242;
      uint64_t v13 = 0;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_FAULT, "unexpected cloudDeletionType %ld for cloudUUID %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)recordCloudDeletionForObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 cloudDeletionType];
  id v6 = [v4 cloudUUIDForDeletion];
  if (v6
    && ![(PLManagedObjectContext *)self isLocalOnlyDelete]
    && ([(PLManagedObjectContext *)self photoLibrary],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isCloudPhotoLibraryEnabled],
        v7,
        v8))
  {
    uint64_t v9 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      __int16 v18 = v6;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Marking as CPLCloudDeleteStateDeleted: %{public}@ [cloudGUID: %{public}@]", (uint8_t *)&v15, 0x16u);
    }
    [v4 setCloudDeleteState:1];
    [(PLManagedObjectContext *)self recordSyncChangeMarker];
    [(PLManagedObjectContext *)self _addCloudUUID:v6 forDeletionType:v5];
  }
  else
  {
    int v12 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      int v15 = 138543618;
      uint64_t v16 = v14;
      __int16 v17 = 2114;
      __int16 v18 = v6;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "NOT marking as CPLCloudDeleteStateDeleted: %{public}@ [cloudGUID: %{public}@]", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (id)getAndClearRecordedAvalancheUUIDsForUpdate
{
  id v3 = (void *)[(NSMutableSet *)self->_avalancheUUIDsForUpdate copy];
  [(NSMutableSet *)self->_avalancheUUIDsForUpdate removeAllObjects];
  return v3;
}

- (void)recordAvalancheUUIDForUpdate:(id)a3
{
  id v9 = a3;
  id v4 = [v9 avalancheUUID];
  if (v4 && [v9 isDeleted])
  {
    avalancheUUIDsForUpdate = self->_avalancheUUIDsForUpdate;
    if (!avalancheUUIDsForUpdate)
    {
      id v6 = (NSMutableSet *)objc_opt_new();
      id v7 = self->_avalancheUUIDsForUpdate;
      self->_avalancheUUIDsForUpdate = v6;

      int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:objc_opt_class() selector:sel_handleUpdatesForContextWillSave_ name:*MEMORY[0x1E4F1BE38] object:self];

      avalancheUUIDsForUpdate = self->_avalancheUUIDsForUpdate;
    }
    [(NSMutableSet *)avalancheUUIDsForUpdate addObject:v4];
  }
}

- (void)registerFilesystemDeletionInfo:(id)a3
{
  id v7 = a3;
  if (!self->_delayedDeletions)
  {
    id v4 = objc_alloc_init(PLDelayedFiledSystemDeletions);
    delayedDeletions = self->_delayedDeletions;
    self->_delayedDeletions = v4;
  }
  id v6 = [(PLManagedObjectContext *)self delayedDeletions];
  [v6 addFilesystemDeletionInfo:v7];
}

- (BOOL)hasPreviouslyMergedDeleteForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLManagedObjectContext *)self userInfo];
  id v6 = [v5 objectForKey:@"PLMOCRedundantDeleteObjectIDs"];

  id v7 = [v4 objectID];

  LOBYTE(v4) = [v6 containsObject:v7];
  return (char)v4;
}

- (void)_destroyDelayedSaveActions
{
  delayedSaveActions = self->_delayedSaveActions;
  self->_delayedSaveActions = 0;
}

- (void)_createDelayedSaveActionsWithTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PLDelayedSaveActions alloc] initWithClientTransaction:v4];

  delayedSaveActions = self->_delayedSaveActions;
  self->_delayedSaveActions = v5;
}

- (PLDelayedSaveActions)delayedSaveActions
{
  return self->_delayedSaveActions;
}

- (void)getAndClearUpdatedObjectsAttributes:(id *)a3 relationships:(id *)a4
{
  if (a3)
  {
    *a3 = (id)[(NSMutableDictionary *)self->_updatedObjectsAttributes copy];
    [(NSMutableDictionary *)self->_updatedObjectsAttributes removeAllObjects];
  }
  if (a4)
  {
    *a4 = (id)[(NSMutableDictionary *)self->_updatedObjectsRelationships copy];
    updatedObjectsRelationships = self->_updatedObjectsRelationships;
    [(NSMutableDictionary *)updatedObjectsRelationships removeAllObjects];
  }
}

- (void)_recordChangedKeys:(id)a3 forObjectID:(id)a4
{
}

- (void)recordChangesFromTriggerModifiedObjectIDs:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [v9 entity];
        id v11 = +[PLManagedObject entityInManagedObjectContext:self];
        int v12 = [v10 isKindOfEntity:v11];

        if (v12)
        {
          uint64_t v22 = @"faceCount";
          uint64_t v13 = &v22;
        }
        else
        {
          __int16 v14 = +[PLManagedObject entityInManagedObjectContext:self];
          int v15 = [v10 isKindOfEntity:v14];

          if (!v15) {
            goto LABEL_11;
          }
          id v21 = @"assetVisible";
          uint64_t v13 = &v21;
        }
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
        [(PLManagedObjectContext *)self _recordChangedKeys:v16 forObjectID:v9];

LABEL_11:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }
}

- (void)recordManagedObjectWillSave:(id)a3
{
  id v10 = a3;
  if (([v10 isInserted] & 1) == 0)
  {
    if ([v10 isDeleted])
    {
      updatedObjectsAttributes = self->_updatedObjectsAttributes;
      uint64_t v5 = [v10 objectID];
      [(NSMutableDictionary *)updatedObjectsAttributes removeObjectForKey:v5];

      updatedObjectsRelationships = self->_updatedObjectsRelationships;
      uint64_t v7 = [v10 objectID];
      [(NSMutableDictionary *)updatedObjectsRelationships removeObjectForKey:v7];
    }
    else
    {
      if (![v10 isUpdated]) {
        goto LABEL_9;
      }
      uint64_t v7 = [v10 changedValues];
      int v8 = [v7 allKeys];
      if ([v8 count])
      {
        id v9 = [v10 objectID];
        [(PLManagedObjectContext *)self _recordChangedKeys:v8 forObjectID:v9];
      }
    }
  }
LABEL_9:
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLManagedObjectContext *)self photoLibrary];
  if (PLIsAssetsd())
  {
    BOOL v6 = !self->_initFinished || v5 == 0;
    if (!v6
      && !+[PLManagedObjectContext _pl_megamoc_isInPLMocPerform](PLManagedObjectContext, "_pl_megamoc_isInPLMocPerform")&& !+[PLConcurrencyLimiter isRunningUnderLimiter])
    {
      uint64_t v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_FAULT, "Unexpected direct call to performBlock: sidesteps concurrency limits, convert to a perform call on photoLibrary, or call PLConcurrencyLimiter directly for plain NSManagedObjectContexts.", v8, 2u);
      }
    }
  }
  [(PLManagedObjectContext *)self _directPerformBlock:v4];
}

- (void)refreshAllObjects
{
  v4.receiver = self;
  v4.super_class = (Class)PLManagedObjectContext;
  [(PLManagedObjectContext *)&v4 refreshAllObjects];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_lastResetTimestamp = v3;
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)PLManagedObjectContext;
  [(PLManagedObjectContext *)&v4 reset];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_lastResetTimestamp = v3;
}

- (BOOL)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PLManagedObjectContext;
  id v11 = 0;
  BOOL v6 = [(PLManagedObjectContext *)&v10 obtainPermanentIDsForObjects:a3 error:&v11];
  id v7 = v11;
  if (!v6)
  {
    int v8 = [(PLManagedObjectContext *)self photoLibrary];
    [v8 handlePossibleCoreDataError:v7];

    if (a4) {
      *a4 = v7;
    }
  }

  return v6;
}

- (void)_resetName
{
  id v3 = [(PLManagedObjectContext *)self pl_basename];
  [(PLManagedObjectContext *)self setName:v3];
}

- (void)_setNameFromCurrentQoS
{
  id v3 = NSString;
  objc_super v4 = [(PLManagedObjectContext *)self pl_basename];
  qos_class_self();
  uint64_t v5 = PLShortStringFromQoSClass();
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  [(PLManagedObjectContext *)self setName:v6];
}

- (BOOL)save:(id *)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if ([(PLManagedObjectContext *)self isValidForSelector:a2 error:a3])
  {
    +[PLUnintendedChangeChecker checkForUnintendedChangesDuringeSave:self withBlock:&__block_literal_global_17584];
    if ([(id)objc_opt_class() shouldHavePhotoLibrary])
    {
      uint64_t v5 = [(PLManagedObjectContext *)self photoLibrary];
      if (!v5)
      {
        id v6 = PLBackendGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "strongPhotoLibrary is nil during PLMOC save", buf, 2u);
        }

        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F8C500];
        uint64_t v32 = *MEMORY[0x1E4F28228];
        v33[0] = @"strongPhotoLibrary is nil during PLMOC save";
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
        id v10 = [v7 errorWithDomain:v8 code:41003 userInfo:v9];

        if (a3)
        {
          id v10 = v10;
          uint64_t v5 = 0;
          LOBYTE(v11) = 0;
          *a3 = v10;
        }
        else
        {
          uint64_t v5 = 0;
          LOBYTE(v11) = 0;
        }
LABEL_28:

        return v11;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    if (PLIsAssetsdProxyService())
    {
      [(PLManagedObjectContext *)self hasChanges];
      int v12 = 0;
      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = [(PLManagedObjectContext *)self isDatabaseCreationContext];
      int v12 = 0;
      if ([(PLManagedObjectContext *)self hasChanges] && !v13)
      {
        __int16 v14 = [MEMORY[0x1E4F1CAD0] setWithObject:@"PLTransactionScopeFileIngestion"];
        int v15 = [(PLManagedObjectContext *)self pathManager];
        int v12 = +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v14, v15, "-[PLManagedObjectContext save:]");

        uint64_t v16 = [(PLManagedObjectContext *)self userInfo];
        +[PLClientServerTransaction addTransaction:v12 toUserInfo:v16];

        [(PLManagedObjectContext *)self _createDelayedSaveActionsWithTransaction:v12];
        BOOL v13 = 0;
      }
    }
    [(PLManagedObjectContext *)self _setNameFromCurrentQoS];
    v29.receiver = self;
    v29.super_class = (Class)PLManagedObjectContext;
    id v30 = 0;
    BOOL v11 = [(PLManagedObjectContext *)&v29 save:&v30];
    id v10 = v30;
    [(PLManagedObjectContext *)self _resetName];
    if (!v11)
    {
      [v12 abortTransaction];
      [v5 handlePossibleCoreDataError:v10];
      if (a3) {
        *a3 = v10;
      }
    }
    long long v17 = [(PLManagedObjectContext *)self userInfo];
    [v17 removeObjectForKey:@"PLMOCRedundantDeleteObjectIDs"];

    if (!v13)
    {
      long long v18 = [(PLManagedObjectContext *)self userInfo];
      +[PLClientServerTransaction removeTransactionFromUserInfo:v18];

      [(PLManagedObjectContext *)self _destroyDelayedSaveActions];
    }
    if (v11)
    {
      if (self->_needsBackgroundJobProcessing)
      {
        long long v19 = [v5 libraryServicesManager];
        long long v20 = [v19 backgroundJobService];
        id v21 = [(PLManagedObjectContext *)self pl_libraryBundle];
        [v20 signalBackgroundProcessingNeededOnBundle:v21];

        self->_needsBackgroundJobProcessing = 0;
      }
      if ([(NSMutableSet *)self->_backgroundWorkItemIdentifiers count]) {
        [(NSMutableSet *)self->_backgroundWorkItemIdentifiers removeAllObjects];
      }
      uint64_t v22 = [(PLManagedObjectContext *)self userInfo];
      long long v23 = [v22 objectForKeyedSubscript:@"com.apple.photos.PLCameraPreviewWellNeedsUpdate"];
      int v24 = [v23 BOOLValue];

      if (v24)
      {
        long long v25 = [v5 libraryServicesManager];
        id v26 = [v25 cameraPreviewWellManager];
        [v26 refreshPreviewWellImageWithContext:self avoidNotificationIfLinkIsAlreadySet:1];

        uint64_t v27 = [(PLManagedObjectContext *)self userInfo];
        [v27 setObject:0 forKeyedSubscript:@"com.apple.photos.PLCameraPreviewWellNeedsUpdate"];
      }
    }

    goto LABEL_28;
  }
  LOBYTE(v11) = 0;
  return v11;
}

void __31__PLManagedObjectContext_save___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_FAULT, "Unintended change during save: key %@, value: %@, context %@, object %@", buf, 0x2Au);
  }

  BOOL v13 = [NSString stringWithFormat:@"Unintended change during save: key %@, value: %@, context %@, object %@", v8, v9, v10, v11];
  +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Photo Library state" message:@"Please file a Radar against Photos" radarTitle:@"TTR: Unintended change during save" radarDescription:v13];
}

- (id)executeRequest:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(PLManagedObjectContext *)self isValidForSelector:a2 error:a4])
  {
    v12.receiver = self;
    v12.super_class = (Class)PLManagedObjectContext;
    id v13 = 0;
    id v8 = [(PLManagedObjectContext *)&v12 executeRequest:v7 error:&v13];
    id v9 = v13;
    if (!v8)
    {
      id v10 = [(PLManagedObjectContext *)self photoLibrary];
      [v10 handlePossibleCoreDataError:v9];

      if (a4) {
        *a4 = v9;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)existingObjectWithID:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(PLManagedObjectContext *)self isValidForSelector:a2 error:a4])
  {
    v12.receiver = self;
    v12.super_class = (Class)PLManagedObjectContext;
    id v13 = 0;
    id v8 = [(PLManagedObjectContext *)&v12 existingObjectWithID:v7 error:&v13];
    id v9 = v13;
    if (!v8)
    {
      id v10 = [(PLManagedObjectContext *)self photoLibrary];
      [v10 handlePossibleCoreDataError:v9];

      if (a4) {
        *a4 = v9;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_logDatabaseDirectoryDiagnosticInfo
{
  v2 = [(PLManagedObjectContext *)self pathManager];
  id v3 = [v2 photosDatabasePath];
  objc_super v4 = [v3 stringByDeletingLastPathComponent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Diagnostic info for database directory:", buf, 2u);
    }

    [MEMORY[0x1E4F8B908] logDiagnosticInfoForURL:v5];
  }
  else
  {
    uint64_t v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "PLMOC pathManager database directory path is nil", v7, 2u);
    }
  }
}

- (void)invalidateWithReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLManagedObjectContext.m", 615, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  if ([(PLManagedObjectContext *)self isValidForSelector:a2 error:0])
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "PLManagedObjectContext invalidateWithReason: %@", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__PLManagedObjectContext_invalidateWithReason___block_invoke;
    v9[3] = &unk_1E5875E18;
    v9[4] = self;
    id v10 = v5;
    id v7 = (void (**)(void))MEMORY[0x19F38D650](v9);
    if ([(PLManagedObjectContext *)self concurrencyType] == 1) {
      [(PLManagedObjectContext *)self _directPerformBlockAndWait:v7];
    }
    else {
      v7[2](v7);
    }
  }
}

void __47__PLManagedObjectContext_invalidateWithReason___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 280), *(id *)(a1 + 40));
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 272);
  os_unfair_lock_unlock(v2);
}

- (id)pl_graphCache
{
  v2 = [(PLManagedObjectContext *)self pl_libraryBundle];
  id v3 = [v2 graphCache];

  return v3;
}

- (id)pl_libraryBundle
{
  v2 = [(PLManagedObjectContext *)self photoLibrary];
  id v3 = [v2 libraryBundle];

  if (!v3)
  {
    objc_super v4 = +[PLPhotoLibraryBundleController sharedBundleController];
    id v5 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    id v3 = [v4 bundleForLibraryURL:v5];
  }
  return v3;
}

- (id)pathManager
{
  id v3 = [(PLManagedObjectContext *)self photoLibrary];
  objc_super v4 = [v3 pathManager];

  if (!v4)
  {
    objc_super v4 = self->_pathManager;
    if (!v4)
    {
      objc_super v4 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    }
  }
  return v4;
}

- (BOOL)isReadOnly
{
  v2 = [(PLManagedObjectContext *)self persistentStoreCoordinator];
  id v3 = [v2 persistentStores];
  objc_super v4 = [v3 lastObject];
  char v5 = [v4 isReadOnly];

  return v5;
}

- (void)withDispatchGroup:(id)a3 performBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    dispatch_group_enter(v6);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PLManagedObjectContext_withDispatchGroup_performBlock___block_invoke;
  v10[3] = &unk_1E58742F0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(PLManagedObjectContext *)self performBlock:v10];
}

void __57__PLManagedObjectContext_withDispatchGroup_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
  }
}

- (id)storeUUID
{
  v2 = [(PLManagedObjectContext *)self persistentStoreCoordinator];
  id v3 = [v2 persistentStores];
  objc_super v4 = [v3 firstObject];
  char v5 = [v4 metadata];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1BF90]];

  return v6;
}

- (BOOL)isDatabaseCreationContext
{
  return 0;
}

- (PLManagedObjectContextPTPNotificationDelegate)ptpNotificationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ptpNotificationDelegate);
  return (PLManagedObjectContextPTPNotificationDelegate *)WeakRetained;
}

- (double)lastResetTimestamp
{
  return self->_lastResetTimestamp;
}

- (void)_directPerformBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PLManagedObjectContext__directPerformBlock___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PLManagedObjectContext;
  id v5 = v4;
  [(PLManagedObjectContext *)&v6 performBlock:v7];
}

uint64_t __46__PLManagedObjectContext__directPerformBlock___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_pl_megamoc_contextPerformDepthPush");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = objc_opt_class();
  return objc_msgSend(v2, "_pl_megamoc_contextPerformDepthPop");
}

+ (BOOL)assetsLibraryLoggingEnabled
{
  return assetsLibraryLoggingEnabled_alLogging;
}

void __53__PLManagedObjectContext_assetsLibraryLoggingEnabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  assetsLibraryLoggingEnabled_alLogging = [v0 BOOLForKey:@"ALAssetsLibraryLoggingEnabled"];
}

+ (BOOL)_isAssetLibraryFetchingAlbum:(id)a3
{
  int v3 = [a3 kindValue];
  return v3 == 1613 || v3 == 1552;
}

+ (id)changeNotificationObjectIDKeys
{
  pl_dispatch_once();
  v2 = (void *)changeNotificationObjectIDKeys_pl_once_object_41;
  return v2;
}

void __56__PLManagedObjectContext_changeNotificationObjectIDKeys__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F1BDF0], *MEMORY[0x1E4F1BFA0], *MEMORY[0x1E4F1BDB8], *MEMORY[0x1E4F1C1C8], *MEMORY[0x1E4F1BF28], *MEMORY[0x1E4F1BE08], 0);
  v2 = (void *)changeNotificationObjectIDKeys_pl_once_object_41;
  changeNotificationObjectIDKeys_pl_once_object_41 = v1;
}

+ (id)changeNotificationObjectIDMutationKeys
{
  pl_dispatch_once();
  v2 = (void *)changeNotificationObjectIDMutationKeys_pl_once_object_40;
  return v2;
}

void __64__PLManagedObjectContext_changeNotificationObjectIDMutationKeys__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F1BDF0], *MEMORY[0x1E4F1BFA0], *MEMORY[0x1E4F1BDB8], *MEMORY[0x1E4F1C1C8], 0);
  v2 = (void *)changeNotificationObjectIDMutationKeys_pl_once_object_40;
  changeNotificationObjectIDMutationKeys_pl_once_object_40 = v1;
}

+ (id)changeNotificationObjectKeys
{
  pl_dispatch_once();
  v2 = (void *)changeNotificationObjectKeys_pl_once_object_39;
  return v2;
}

void __54__PLManagedObjectContext_changeNotificationObjectKeys__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F1BDF8], *MEMORY[0x1E4F1BFA8], *MEMORY[0x1E4F1BDC0], *MEMORY[0x1E4F1C1D0], *MEMORY[0x1E4F1BF30], *MEMORY[0x1E4F1BE10], 0);
  v2 = (void *)changeNotificationObjectKeys_pl_once_object_39;
  changeNotificationObjectKeys_pl_once_object_39 = v1;
}

+ (id)changeNotificationObjectMutationKeys
{
  pl_dispatch_once();
  v2 = (void *)changeNotificationObjectMutationKeys_pl_once_object_38;
  return v2;
}

void __62__PLManagedObjectContext_changeNotificationObjectMutationKeys__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F1BDF8], *MEMORY[0x1E4F1BFA8], *MEMORY[0x1E4F1BDC0], *MEMORY[0x1E4F1C1D0], 0);
  v2 = (void *)changeNotificationObjectMutationKeys_pl_once_object_38;
  changeNotificationObjectMutationKeys_pl_once_object_38 = v1;
}

+ (id)managedObjectModelURL
{
  return +[PLPersistentContainer managedObjectModelURL];
}

+ (void)getPersistentStoreURL:(id *)a3 options:(id *)a4 forDatabasePath:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PLManagedObjectContext_getPersistentStoreURL_options_forDatabasePath___block_invoke;
  v5[3] = &__block_descriptor_48_e32_v24__0__NSURL_8__NSDictionary_16l;
  v5[4] = a3;
  v5[5] = a4;
  +[PLPersistentContainer getConfigurationForDatabasePath:a5 withBlock:v5];
}

id __72__PLManagedObjectContext_getPersistentStoreURL_options_forDatabasePath___block_invoke(uint64_t a1, id a2, void *a3)
{
  **(void **)(a1 + 32) = a2;
  id result = a3;
  **(void **)(a1 + 40) = result;
  return result;
}

+ (BOOL)_pl_megamoc_isInPLMocPerform
{
  if (_contextPerformDepthThreadKey_s_onceToken != -1) {
    dispatch_once(&_contextPerformDepthThreadKey_s_onceToken, &__block_literal_global_574);
  }
  return (uint64_t)pthread_getspecific(_contextPerformDepthThreadKey_s_key) > 0;
}

+ (BOOL)shouldHavePhotoLibrary
{
  return 1;
}

+ (void)removePhotosDatabaseWithPathManager:(id)a3
{
}

+ (BOOL)canMergeRemoteChanges
{
  return 1;
}

+ (id)sanitizedErrorFromError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [v3 localizedDescription];
    if (v5) {
      [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    objc_super v6 = [v3 localizedFailureReason];
    if (v6) {
      [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    }
    id v7 = (void *)MEMORY[0x1E4F28C58];
    id v8 = [v3 domain];
    id v9 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v3, "code"), v4);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)contextForRepairingSingletonObjectsWithReason:(id)a3 libraryURL:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  pl_dispatch_once();
  id v10 = +[PLPhotoLibraryBundleController sharedBundleController];
  id v11 = [v10 lookupOrCreateBundleForLibraryURL:v9];

  if (!v11)
  {
    long long v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F8C500];
    v41[0] = *MEMORY[0x1E4F28228];
    v41[1] = @"libraryURL";
    v42[0] = @"Failed to create library bundle";
    v42[1] = v9;
    long long v25 = (void *)MEMORY[0x1E4F1C9E8];
    id v26 = v42;
    uint64_t v27 = v41;
LABEL_13:
    uint64_t v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:2];
    objc_super v29 = [v23 errorWithDomain:v24 code:46102 userInfo:v28];

    id v30 = v29;
LABEL_14:
    if (a5)
    {
      id v30 = v30;
      uint64_t v22 = 0;
      *a5 = v30;
    }
    else
    {
      uint64_t v22 = 0;
    }
    goto LABEL_25;
  }
  uint64_t v12 = [v11 persistentContainer];
  if (!v12)
  {
    long long v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F8C500];
    v43[0] = *MEMORY[0x1E4F28228];
    v43[1] = @"libraryURL";
    v44[0] = @"Failed to create persistent container";
    v44[1] = v9;
    long long v25 = (void *)MEMORY[0x1E4F1C9E8];
    id v26 = v44;
    uint64_t v27 = v43;
    goto LABEL_13;
  }
  uint64_t v13 = (void *)v12;
  if ([&unk_1EEBF17A8 count])
  {
    long long v39 = a5;
    uint64_t v14 = 0;
    id v15 = 0;
    while (1)
    {
      __int16 v16 = v15;
      id v40 = v15;
      id v17 = (void *)[v13 newPersistentStoreCoordinatorForMigration:&v40];
      id v15 = v40;

      if (v17) {
        break;
      }
      if ([a1 _shouldRetryNewPersistentStoreCoordinatorWithError:v15])
      {
        __int16 v18 = [&unk_1EEBF17A8 objectAtIndexedSubscript:v14];
        [v18 floatValue];
        float v20 = v19;

        id v21 = PLMigrationGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          id v48 = v8;
          __int16 v49 = 2048;
          double v50 = v20;
          __int16 v51 = 1024;
          int v52 = v14;
          __int16 v53 = 2112;
          id v54 = v15;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to create coordinator to repair singletons (reason: %@), retry in %2.2f s, retry count %d (%@)", buf, 0x26u);
        }

        usleep((float)(v20 * 1000000.0));
        if ([&unk_1EEBF17A8 count] > (unint64_t)++v14) {
          continue;
        }
      }
      id v17 = 0;
      uint64_t v22 = 0;
LABEL_23:
      a5 = v39;
      goto LABEL_24;
    }
    id v31 = [(PLManagedObjectContext *)[PLDisconnectedManagedObjectContext alloc] initWithConcurrencyType:1 libraryBundle:v11 changeHandlingContainer:0 coordinator:v17];
    if (v31)
    {
      uint64_t v22 = v31;
      uint64_t v32 = NSString;
      id v33 = [v9 path];
      long long v34 = [v32 stringWithFormat:@"reason:%@ (%@)", v8, v33];
      [(PLManagedObjectContext *)v22 setName:v34];
LABEL_22:

      goto LABEL_23;
    }
    a5 = v39;
    if (v39)
    {
      long long v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F8C500];
      uint64_t v45 = *MEMORY[0x1E4F28228];
      __int16 v46 = @"Failed to create PLDisconnectedManagedObjectContext";
      id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      [v35 errorWithDomain:v36 code:46502 userInfo:v33];
      uint64_t v22 = 0;
      long long v34 = v15;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    uint64_t v22 = 0;
  }
  else
  {
    id v17 = 0;
    id v15 = 0;
    uint64_t v22 = 0;
  }
LABEL_24:

  id v30 = v15;
  if (!v22) {
    goto LABEL_14;
  }
LABEL_25:

  long long v37 = v22;
  return v37;
}

+ (BOOL)_shouldRetryNewPersistentStoreCoordinatorWithError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqual:*MEMORY[0x1E4F1BF50]];

  BOOL v6 = v5 && ([v3 code] == 15 || objc_msgSend(v3, "code") == 6 || objc_msgSend(v3, "code") == 5);
  return v6;
}

+ (void)_setupInitialQueryGenerationForContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1C1A0] currentQueryGenerationToken];
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  float v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__17716;
  uint64_t v22 = __Block_byref_object_dispose__17717;
  id v23 = 0;
  uint64_t v6 = [v4 concurrencyType];
  if (!v6 || *MEMORY[0x1E4F1C1C0] == v6)
  {
    id v7 = (id *)(v19 + 5);
    id obj = (id)v19[5];
    int v8 = [v4 setQueryGenerationFromToken:v5 error:&obj];
    objc_storeStrong(v7, obj);
    *((unsigned char *)v25 + 24) = v8;
    if (v8) {
      goto LABEL_9;
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__PLManagedObjectContext__setupInitialQueryGenerationForContext___block_invoke;
    v13[3] = &unk_1E5874900;
    id v14 = v4;
    __int16 v16 = &v24;
    id v15 = v5;
    id v17 = &v18;
    +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v13];

    if (*((unsigned char *)v25 + 24)) {
      goto LABEL_9;
    }
  }
  id v9 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v19[5];
    *(_DWORD *)buf = 138412802;
    uint64_t v29 = v10;
    __int16 v30 = 2048;
    id v31 = a1;
    __int16 v32 = 2114;
    uint64_t v33 = v11;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "%@ %p unable to set query generation to current: %{public}@", buf, 0x20u);
  }

LABEL_9:
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __65__PLManagedObjectContext__setupInitialQueryGenerationForContext___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PLManagedObjectContext__setupInitialQueryGenerationForContext___block_invoke_2;
  v5[3] = &unk_1E5874900;
  uint64_t v8 = *(void *)(a1 + 48);
  id v6 = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v9 = v4;
  [v6 performBlockAndWait:v5];
}

void __65__PLManagedObjectContext__setupInitialQueryGenerationForContext___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id obj = 0;
  char v4 = [v2 setQueryGenerationFromToken:v3 error:&obj];
  id v5 = obj;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
}

@end