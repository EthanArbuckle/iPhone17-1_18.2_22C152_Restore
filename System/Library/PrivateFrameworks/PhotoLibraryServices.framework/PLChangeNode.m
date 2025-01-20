@interface PLChangeNode
- (BOOL)_isInvalidRemoteChangeEvent:(id)a3 reply:(id)a4;
- (PLChangeNode)initWithLibraryURL:(id)a3 changeMerger:(id)a4 changePublisher:(id)a5 libraryServicesManager:(id)a6;
- (void)connectManagedObjectContext:(id)a3;
- (void)dealloc;
- (void)disconnectManagedObjectContext:(id)a3;
- (void)distributeRemoteContextDidSaveEvent:(id)a3 delayedSaveActionsDetail:(id)a4 transaction:(id)a5;
- (void)invalidate;
- (void)publishChangesForDidSaveObjectIDsNotification:(id)a3;
- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 reply:(id)a5;
@end

@implementation PLChangeNode

- (void)connectManagedObjectContext:(id)a3
{
  id v5 = a3;
  if (PLIsAssetsd()) {
    [(PLUpdatedOrderKeys *)self->_updatedOrderKeys registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:v5];
  }
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_publishChangesForDidSaveObjectIDsNotification_ name:*MEMORY[0x1E4F1BE28] object:v5];
}

- (void)disconnectManagedObjectContext:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F1BE28] object:v5];
}

- (PLChangeNode)initWithLibraryURL:(id)a3 changeMerger:(id)a4 changePublisher:(id)a5 libraryServicesManager:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (PLIsAssetsdProxyService())
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"PLChangeNode.m" lineNumber:72 description:@"PLChangeNode is disabled for assetsd proxy service"];
  }
  v35.receiver = self;
  v35.super_class = (Class)PLChangeNode;
  v15 = [(PLChangeNode *)&v35 init];
  if (v15)
  {
    id v34 = v13;
    id v16 = v12;
    id v17 = objc_alloc_init(MEMORY[0x1E4F29128]);
    [v17 getUUIDBytes:v15->_nodeUUID];
    v18 = [v17 UUIDString];
    v19 = [(PLChangeNode *)v18 substringToIndex:8];
    uint64_t v20 = [v19 copy];
    nodeUUIDShortString = v15->_nodeUUIDShortString;
    v15->_nodeUUIDShortString = (NSString *)v20;

    v22 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v15->_nodeUUIDShortString;
      *(_DWORD *)buf = 138412802;
      uint64_t v37 = (uint64_t)v23;
      __int16 v38 = 2112;
      v39 = v18;
      __int16 v40 = 2112;
      id v41 = v11;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "PLChangeNode [%@]: Created change node with UUID %@ for libraryURL: %@", buf, 0x20u);
    }

    uint64_t v24 = [v11 copy];
    libraryUrl = v15->_libraryUrl;
    v15->_libraryUrl = (NSURL *)v24;

    v26 = objc_alloc_init(PLUpdatedOrderKeys);
    updatedOrderKeys = v15->_updatedOrderKeys;
    v15->_updatedOrderKeys = v26;

    objc_storeStrong((id *)&v15->_changeMerger, a4);
    objc_storeStrong((id *)&v15->_changePublisher, a5);
    if (v14)
    {
      v28 = [[PLDelayedSaveActionsProcessor alloc] initWithLibraryServicesManager:v14];
      delayedSaveActionsProcessor = v15->_delayedSaveActionsProcessor;
      v15->_delayedSaveActionsProcessor = v28;
    }
    objc_storeStrong((id *)&v15->_libraryServicesManager, a6);

    id v12 = v16;
    id v13 = v34;
  }
  v30 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    uint64_t v37 = v31;
    __int16 v38 = 2048;
    v39 = v15;
    __int16 v40 = 2112;
    id v41 = v11;
    _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryURL:%@", buf, 0x20u);
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedSaveActionsProcessor, 0);
  objc_storeStrong((id *)&self->_changePublisher, 0);
  objc_storeStrong((id *)&self->_changeMerger, 0);
  objc_storeStrong((id *)&self->_updatedOrderKeys, 0);
  objc_storeStrong((id *)&self->_nodeUUIDShortString, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
  objc_storeStrong((id *)&self->_libraryUrl, 0);
}

- (void)publishChangesForDidSaveObjectIDsNotification:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x19F38D3B0]();
  v7 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    nodeUUIDShortString = self->_nodeUUIDShortString;
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v55 = nodeUUIDShortString;
    __int16 v56 = 2112;
    v57 = v9;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "PLChangeNode [%@]: %@", buf, 0x16u);
  }
  v10 = [v5 userInfo];
  id v11 = [v5 object];
  if (([v11 savingDuringMerge] & 1) == 0)
  {
    uint64_t v12 = [v11 photoLibrary];
    if (!v12)
    {
      uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, self, @"PLChangeNode.m", 212, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
    }
    v43 = v6;
    if ([v11 isUserInterfaceContext])
    {
      id v13 = +[PLChangeNotificationCenter defaultCenter];
      [v13 processContextDidSaveObjectIDsNotification:v5];
    }
    id v40 = v5;
    uint64_t v42 = [v11 delayedSaveActions];
    uint64_t v44 = [v42 popDelayedSaveActionsDetail];
    id v14 = [v11 userInfo];
    v15 = +[PLClientServerTransaction transactionFromUserInfo:v14];

    id v16 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1C1C8]];
    [v11 recordChangesFromTriggerModifiedObjectIDs:v16];

    v47 = v10;
    id v17 = (void *)[v10 mutableCopy];
    id v53 = 0;
    id v52 = 0;
    [v11 getAndClearUpdatedObjectsAttributes:&v53 relationships:&v52];
    id v18 = v53;
    id v19 = v52;
    v46 = v18;
    [v17 setObject:v18 forKeyedSubscript:@"PLUpdatedAttributesByObjectIDKey"];
    v45 = v19;
    [v17 setObject:v19 forKeyedSubscript:@"PLUpdatedRelationshipsByObjectIDKey"];
    id v41 = (void *)v12;
    if ([(PLUpdatedOrderKeys *)self->_updatedOrderKeys isObservingOrderKeys])
    {
      uint64_t v20 = [(PLUpdatedOrderKeys *)self->_updatedOrderKeys getAndClearUpdatedOrderKeys];
      [v17 setObject:v20 forKeyedSubscript:@"PLUpdatedOrderKeyRelationshipsByObjectIDKey"];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F1CC08];
    }
    v21 = [v11 userInfo];
    v22 = [v21 objectForKey:@"PLMOCRedundantDeleteObjectIDs"];
    v23 = [v11 getAndClearRecordedObjectsForCloudDeletion];
    int v24 = [v11 changeSource];
    BYTE4(v38) = [v11 getAndClearSyncChangeMarker];
    LODWORD(v38) = v24;
    id v25 = +[PLLegacyChangeEventBuilder createXPCDictionaryFromChangedObjectIDs:redundantDeletes:uuidsForCloudDeletion:updatedAttributesByObjectID:updatedRelationshipsByObjectID:updatedOrderKeys:changeSource:syncChangeMarker:](PLLegacyChangeEventBuilder, "createXPCDictionaryFromChangedObjectIDs:redundantDeletes:uuidsForCloudDeletion:updatedAttributesByObjectID:updatedRelationshipsByObjectID:updatedOrderKeys:changeSource:syncChangeMarker:", v47, v22, v23, v46, v45, v20, v38);

    if (v25)
    {
      +[PLClientServerTransaction addTransaction:v15 toXPCDictionary:v25];
      [v11 appendDelayedDeletionsToXPCMessage:v25];
      v26 = (void *)v44;
      uint64_t v27 = [(PLChangePublisher *)self->_changePublisher publishChangeEvent:v25 delayedSaveActionsDetail:v44 transaction:v15];

      v15 = (void *)v27;
      v28 = v41;
    }
    else
    {
      v28 = v41;
      v26 = (void *)v44;
      if (PLIsAssetsd())
      {
        v29 = [v15 transactionToken];
        if (v29)
        {
          id v39 = v29;
          id v30 = v15;
          uint64_t v31 = [v41 pathManager];
          v32 = [v30 changeScopes];
          v15 = +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v39, v32, v31, "-[PLChangeNode publishChangesForDidSaveObjectIDsNotification:]");

          v26 = (void *)v44;
          [v30 completeTransaction];

          v29 = v39;
        }
      }
      else
      {
        [v15 abortTransaction];
      }
    }
    if (PLIsAssetsd() && [v26 shouldHandleMoments]) {
      [(PLDelayedSaveActionsProcessor *)self->_delayedSaveActionsProcessor processDelayedMomentGeneratorSaveActionsFromDetail:v26];
    }
    changeMerger = self->_changeMerger;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __62__PLChangeNode_publishChangesForDidSaveObjectIDsNotification___block_invoke;
    v48[3] = &unk_1E5875BF8;
    v48[4] = self;
    id v49 = v26;
    id v50 = v28;
    id v51 = v15;
    id v34 = v15;
    id v35 = v28;
    id v36 = v26;
    [(PLCoreDataChangeMerger *)changeMerger mergeChangesFromRemoteContextSave:v17 intoAllContextsNotIdenticalTo:v11 completionHandler:v48];

    id v6 = v43;
    v10 = v47;
    id v5 = v40;
  }
}

uint64_t __62__PLChangeNode_publishChangesForDidSaveObjectIDsNotification___block_invoke(void *a1)
{
  uint64_t result = PLIsAssetsd();
  if (result)
  {
    uint64_t v3 = a1[5];
    v4 = *(void **)(a1[4] + 72);
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v4 processDelayedSaveActionsDetail:v3 withPhotoLibrary:v5 transaction:v6];
  }
  return result;
}

- (void)distributeRemoteContextDidSaveEvent:(id)a3 delayedSaveActionsDetail:(id)a4 transaction:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PLLibraryServicesManager *)self->_libraryServicesManager libraryBundle];
  uint64_t v12 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v11 persistentContainer];
    id v14 = [v13 sharedPersistentStoreCoordinator];
    v15 = +[PLLegacyChangeEvent _descriptionForEvent:v8 withPersistentStoreCoordinator:v14];
    *(_DWORD *)buf = 138412290;
    v33 = v15;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Got remote event: %@", buf, 0xCu);
  }
  id v16 = +[PLLegacyChangeEvent localChangeEventFromChangeHubEvent:v8 withLibraryBundle:v11];
  id v17 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v16;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "incoming from change hub: %@", buf, 0xCu);
  }

  int v18 = PLIsAssetsd();
  id v19 = v10;
  if (v18)
  {
    if ([v9 shouldHandleMoments]) {
      [(PLDelayedSaveActionsProcessor *)self->_delayedSaveActionsProcessor processDelayedMomentGeneratorSaveActionsFromDetail:v9];
    }
    uint64_t v20 = [(PLLibraryServicesManager *)self->_libraryServicesManager databaseContext];
    v21 = (void *)[v20 newShortLivedLibraryWithName:"-[PLChangeNode distributeRemoteContextDidSaveEvent:delayedSaveActionsDetail:transaction:]"];

    if (!v21)
    {
      v22 = PLChangeHandlingGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        libraryServicesManager = self->_libraryServicesManager;
        int v24 = [(PLLibraryServicesManager *)libraryServicesManager databaseContext];
        *(_DWORD *)buf = 134218240;
        v33 = libraryServicesManager;
        __int16 v34 = 2048;
        id v35 = v24;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "PLChangeNode distribute: transientLibrary is nil. LSM=%p databaseContext=%p", buf, 0x16u);
      }
      goto LABEL_15;
    }
  }
  else
  {
    v21 = 0;
  }
  changeMerger = self->_changeMerger;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __89__PLChangeNode_distributeRemoteContextDidSaveEvent_delayedSaveActionsDetail_transaction___block_invoke;
  v27[3] = &unk_1E586BE50;
  char v31 = v18;
  v27[4] = self;
  id v28 = v9;
  v22 = v21;
  v29 = v22;
  id v26 = v19;
  id v30 = v26;
  [(PLCoreDataChangeMerger *)changeMerger mergeIntoAllContextsChangesFromRemoteContextSave:v16 completionHandler:v27];
  if (v18) {
    [(PLDelayedSaveActionsProcessor *)self->_delayedSaveActionsProcessor processDelayedDeletionsFromChangeHubEvent:v8 library:v22 transaction:v26];
  }

LABEL_15:
}

uint64_t __89__PLChangeNode_distributeRemoteContextDidSaveEvent_delayedSaveActionsDetail_transaction___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 64)) {
    return [*(id *)(*(void *)(result + 32) + 72) processDelayedSaveActionsDetail:*(void *)(result + 40) withPhotoLibrary:*(void *)(result + 48) transaction:*(void *)(result + 56)];
  }
  return result;
}

- (BOOL)_isInvalidRemoteChangeEvent:(id)a3 reply:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void *))a4;
  int uint64 = xpc_dictionary_get_uint64(a3, "eventKind");
  if (uint64 != 1)
  {
    v7 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = uint64;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Invalid change hub event kind (%d)", buf, 8u);
    }

    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F8C500];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    id v14 = @"Invalid change hub event kind";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v11 = [v8 errorWithDomain:v9 code:44002 userInfo:v10];

    v5[2](v5, v11);
  }

  return uint64 != 1;
}

- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 reply:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void))a5;
  if (![(PLChangeNode *)self _isInvalidRemoteChangeEvent:v13 reply:v9])
  {
    id v10 = [(PLLibraryServicesManager *)self->_libraryServicesManager pathManager];
    id v11 = +[PLClientServerTransaction beginServerTransactionWithClientTransactionFromXPCDictionary:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithClientTransactionFromXPCDictionary:pathManager:identifier:", v13, v10, "-[PLChangeNode publishRemoteChangeEvent:delayedSaveActionsDetail:reply:]");

    v9[2](v9, 0);
    uint64_t v12 = [(PLChangePublisher *)self->_changePublisher publishChangeEvent:v13 delayedSaveActionsDetail:v8 transaction:v11];

    [(PLChangeNode *)self distributeRemoteContextDidSaveEvent:v13 delayedSaveActionsDetail:v8 transaction:v12];
  }
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = objc_opt_class();
    libraryUrl = self->_libraryUrl;
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = libraryUrl;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate %@", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = objc_opt_class();
    libraryUrl = self->_libraryUrl;
    *(_DWORD *)buf = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = libraryUrl;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc %@", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLChangeNode;
  [(PLChangeNode *)&v6 dealloc];
}

@end