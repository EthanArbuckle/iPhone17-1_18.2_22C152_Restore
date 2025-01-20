@interface ICBaseSearchIndexerDataSource
+ (BOOL)isAccountReindexedForMigration:(id)a3;
+ (id)didReindexForMigrationUserDefaultKeyForIdentifier:(id)a3;
+ (void)markAccountReindexedForMigration:(id)a3;
- (BOOL)_loadStateDictionaryWithFileManager:(id *)a3 fileURL:(id *)a4 NSError:(id *)a5 fileExists:(BOOL *)a6 savedDictionary:(id *)a7;
- (BOOL)addNewObjectsForProcessing:(id)a3;
- (BOOL)isFolderWithServerShareChanged:(id)a3;
- (BOOL)isObservingChanges;
- (BOOL)isPaperKitOrSynapseAttachment:(id)a3;
- (BOOL)needsReindexing;
- (BOOL)saveStateDictionary:(id)a3;
- (BOOL)shouldIndexableObjectExistInIndexing:(id)a3;
- (ICBaseSearchIndexerDataSource)init;
- (NSMutableOrderedSet)objectIDsBeingProcessed;
- (NSMutableOrderedSet)objectIDsToProcess;
- (NSString)stateFilename;
- (NSString)uuid;
- (NSURL)stateFileURL;
- (OS_dispatch_queue)processingQueue;
- (id)addNotesFromSubtree:(id)a3;
- (id)additionalItemsForObject:(id)a3;
- (id)additionalUniqueIdentifiersToDeleteForObject:(id)a3;
- (id)allIndexableObjectIDsInReversedReindexingOrderWithContext:(id)a3;
- (id)dataSourceIdentifier;
- (id)indexableObjectIDsWithURIs:(id)a3 context:(id)a4;
- (id)loadStateDictionary;
- (id)moveIndexingTrackingFromUserDefaultsToFileIfNecessary;
- (id)newManagedObjectContext;
- (id)objectForManagedObjectIDURI:(id)a3 context:(id)a4;
- (id)objectForSearchableItem:(id)a3 context:(id)a4;
- (id)objectIDsFromSearchableItems:(id)a3;
- (id)objectIDsNeedingProcessing;
- (id)persistentStoreCoordinator;
- (id)searchableItemResultForObject:(id)a3;
- (int64_t)decisionOnObjectID:(id)a3 searchableItemToIndex:(id *)a4 additionalItemsToIndex:(id *)a5 objectIDURIToDelete:(id *)a6 additionalUniqueIdentifiersToDelete:(id *)a7 context:(id)a8;
- (unint64_t)indexingPriority;
- (void)clearObjectIDsToIgnoreAndStageForReindexing;
- (void)clearObjectIDsToProcess;
- (void)contextWillSave:(id)a3;
- (void)loadOrClearStateIfNecessary;
- (void)logFileSizeForFileAtPath:(id)a3 fileManager:(id)a4;
- (void)moveIndexingTrackingFromUserDefaultsToFileIfNecessary;
- (void)resetContextObservers;
- (void)saveStateIfNecessary;
- (void)searchIndexerDidFinishDeletingSearchableItemsWithObjectIDURIs:(id)a3 error:(id)a4;
- (void)searchIndexerDidFinishIndexingObjectIDs:(id)a3 error:(id)a4;
- (void)searchIndexerWillDeleteSearchableItemsWithObjectIDURIs:(id)a3;
- (void)searchIndexerWillIndexObjectIDs:(id)a3;
- (void)setNeedsReindexing:(BOOL)a3;
- (void)setObjectIDsBeingProcessed:(id)a3;
- (void)setObjectIDsToProcess:(id)a3;
- (void)setObservingChanges:(BOOL)a3;
- (void)setProcessingQueue:(id)a3;
- (void)stageForReindexingWithContext:(id)a3;
- (void)stageObjectIDURIsForIndexing:(id)a3 context:(id)a4;
- (void)startObservingChanges;
- (void)stopObservingChanges;
@end

@implementation ICBaseSearchIndexerDataSource

- (void)startObservingChanges
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Starting to observe changes %@", v2, v3, v4, v5, v6);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)stopObservingChanges
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Stopping observing changes %@", v2, v3, v4, v5, v6);
}

- (void)resetContextObservers
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263EFF058];
  [v3 removeObserver:self name:*MEMORY[0x263EFF058] object:0];

  if ([(ICBaseSearchIndexerDataSource *)self isObservingChanges])
  {
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel_contextWillSave_ name:v4 object:0];
  }
}

- (BOOL)isObservingChanges
{
  return self->_observingChanges;
}

- (ICBaseSearchIndexerDataSource)init
{
  v9.receiver = self;
  v9.super_class = (Class)ICBaseSearchIndexerDataSource;
  uint64_t v2 = [(ICBaseSearchIndexerDataSource *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9B0] orderedSet];
    [(ICBaseSearchIndexerDataSource *)v2 setObjectIDsToProcess:v3];

    uint64_t v4 = [MEMORY[0x263EFF9B0] orderedSet];
    [(ICBaseSearchIndexerDataSource *)v2 setObjectIDsBeingProcessed:v4];

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint8_t v6 = dispatch_get_global_queue(-32768, 0);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.notes.index.data-source", v5, v6);
    [(ICBaseSearchIndexerDataSource *)v2 setProcessingQueue:v7];

    [(ICBaseSearchIndexerDataSource *)v2 setObservingChanges:0];
    [(ICBaseSearchIndexerDataSource *)v2 setNeedsReindexing:0];
  }
  return v2;
}

- (void)setObservingChanges:(BOOL)a3
{
  self->_observingChanges = a3;
}

- (void)setProcessingQueue:(id)a3
{
}

- (void)setObjectIDsToProcess:(id)a3
{
}

- (void)setObjectIDsBeingProcessed:(id)a3
{
}

- (void)setNeedsReindexing:(BOOL)a3
{
  self->_needsReindexing = a3;
}

- (void)loadOrClearStateIfNecessary
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 objectIDsToProcess];
  int v5 = 138412802;
  uint8_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = [v4 count];
  __int16 v9 = 1024;
  int v10 = [a1 needsReindexing];
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Loaded indexing state for %@: objectIDs=%lu needsReindexing=%d", (uint8_t *)&v5, 0x1Cu);
}

- (id)loadStateDictionary
{
  id v10 = 0;
  id v11 = 0;
  id v9 = 0;
  [(ICBaseSearchIndexerDataSource *)self _loadStateDictionaryWithFileManager:&v11 fileURL:&v10 NSError:0 fileExists:0 savedDictionary:&v9];
  id v3 = v11;
  id v4 = v10;
  id v5 = v9;
  uint8_t v6 = [v4 path];
  [(ICBaseSearchIndexerDataSource *)self logFileSizeForFileAtPath:v6 fileManager:v3];

  __int16 v7 = (void *)[v5 copy];
  return v7;
}

- (void)logFileSizeForFileAtPath:(id)a3 fileManager:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v15 = 0;
  id v4 = [a4 attributesOfItemAtPath:a3 error:&v15];
  id v5 = v15;
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F080B8]];
  __int16 v7 = (void *)v6;
  uint64_t v8 = &unk_26C144BF8;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  id v10 = os_log_create("com.apple.notes", "SearchIndexer");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v5;
      v12 = "Search indexer state dictionary file size: %@ bytes. error: %@";
      v13 = v10;
      uint32_t v14 = 22;
LABEL_8:
      _os_log_impl(&dword_20C263000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    }
  }
  else if (v11)
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    v12 = "Search indexer state dictionary file size: %@ bytes.";
    v13 = v10;
    uint32_t v14 = 12;
    goto LABEL_8;
  }
}

void __54__ICBaseSearchIndexerDataSource_startObservingChanges__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) loadOrClearStateIfNecessary];
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
  {
    uint64_t v2 = [*v1 objectIDsToProcess];
    uint64_t v3 = [v2 count];

    if (v3)
    {
      id v4 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __54__ICBaseSearchIndexerDataSource_startObservingChanges__block_invoke_cold_1();
      }

      id v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 postNotificationName:@"ICSearchIndexerDataSourceDidChangeNotification" object:*v1];
    }
  }
}

- (NSMutableOrderedSet)objectIDsToProcess
{
  return self->_objectIDsToProcess;
}

- (BOOL)needsReindexing
{
  return self->_needsReindexing;
}

- (BOOL)_loadStateDictionaryWithFileManager:(id *)a3 fileURL:(id *)a4 NSError:(id *)a5 fileExists:(BOOL *)a6 savedDictionary:(id *)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v12 = [MEMORY[0x263F08850] defaultManager];
  v13 = [(ICBaseSearchIndexerDataSource *)self stateFileURL];
  uint32_t v14 = [v13 path];
  int v15 = [v12 fileExistsAtPath:v14];

  v16 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = @"does not exist";
    if (v15) {
      id v17 = @"exists";
    }
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    _os_log_impl(&dword_20C263000, v16, OS_LOG_TYPE_INFO, "Search indexer saved state dictionary file %@.", buf, 0xCu);
  }

  if (!v15)
  {
    id v19 = 0;
    __int16 v18 = (void *)MEMORY[0x263EFFA78];
LABEL_12:
    BOOL v21 = 1;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v24 = 0;
  __int16 v18 = [NSDictionary dictionaryWithContentsOfURL:v13 error:&v24];
  id v19 = v24;
  if (!v19) {
    goto LABEL_12;
  }
  uint64_t v20 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[ICBaseSearchIndexerDataSource _loadStateDictionaryWithFileManager:fileURL:NSError:fileExists:savedDictionary:]((uint64_t)v13);
  }

  BOOL v21 = 0;
  if (a3) {
LABEL_13:
  }
    *a3 = v12;
LABEL_14:
  if (a4) {
    *a4 = v13;
  }
  if (a5) {
    *a5 = v19;
  }
  if (a6) {
    *a6 = v15;
  }
  if (a7) {
    *a7 = v18;
  }

  return v21;
}

- (NSURL)stateFileURL
{
  uint64_t v3 = +[ICPaths applicationDocumentsURL];
  id v4 = [(ICBaseSearchIndexerDataSource *)self stateFilename];
  id v5 = [v3 URLByAppendingPathComponent:v4 isDirectory:0];

  return (NSURL *)v5;
}

- (void)clearObjectIDsToIgnoreAndStageForReindexing
{
  [0 count];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_20C263000, v0, v1, "Observed %ld object IDs to ignore for %@ in NSArray format. Attempting to reindex these items", v2, v3, v4, v5, v6);
}

- (id)moveIndexingTrackingFromUserDefaultsToFileIfNecessary
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = [(ICBaseSearchIndexerDataSource *)self stateFilename];
  uint64_t v5 = [v3 objectForKey:v4];

  if (v5)
  {
    uint8_t v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      __int16 v7 = [(ICBaseSearchIndexerDataSource *)self stateFilename];
      *(_DWORD *)buf = 138412290;
      v40 = v7;
      _os_log_impl(&dword_20C263000, v6, OS_LOG_TYPE_INFO, "Moving Indexing Tracking from UserDefaults to file for %@.", buf, 0xCu);
    }
    char v38 = 0;
    id v36 = 0;
    id v37 = 0;
    id v34 = 0;
    id v35 = 0;
    [(ICBaseSearchIndexerDataSource *)self _loadStateDictionaryWithFileManager:&v37 fileURL:&v36 NSError:&v35 fileExists:&v38 savedDictionary:&v34];
    id v8 = v37;
    os_log_t v9 = (os_log_t)v36;
    os_log_t v10 = (os_log_t)v35;
    id v11 = v34;
    v12 = (void *)[v5 mutableCopy];
    [v12 addEntriesFromDictionary:v11];
    v13 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v12;
      _os_log_impl(&dword_20C263000, v13, OS_LOG_TYPE_INFO, "Combined search indexer state dictionary: %@", buf, 0xCu);
    }

    BOOL v14 = [(ICBaseSearchIndexerDataSource *)self saveStateDictionary:v12];
    int v15 = [v9 path];
    char v38 = [v8 fileExistsAtPath:v15];

    if (v38 && !v10 && v14)
    {
      v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v17 = [(ICBaseSearchIndexerDataSource *)self stateFilename];
      [v16 removeObjectForKey:v17];
    }
    else
    {
      v16 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ICBaseSearchIndexerDataSource moveIndexingTrackingFromUserDefaultsToFileIfNecessary](&v38);
      }
    }

    v28 = (void *)[v12 copy];
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    __int16 v18 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", 0);
    id v19 = [v18 dictionaryRepresentation];
    uint64_t v20 = [v19 allKeys];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v25 hasPrefix:@"NotesIndexerState"]) {
            [v8 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v43 count:16];
      }
      while (v22);
    }

    os_log_t v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v26 = [(ICBaseSearchIndexerDataSource *)self stateFilename];
      uint64_t v27 = [v8 debugDescription];
      *(_DWORD *)buf = 138412546;
      v40 = v26;
      __int16 v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_20C263000, v9, OS_LOG_TYPE_INFO, "Skipped moving index tracking data from user defaults: no data found for key %@. Other possibly related keys: %@", buf, 0x16u);
    }
    v28 = 0;
    os_log_t v10 = v9;
  }

  return v28;
}

- (NSString)stateFilename
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(ICBaseSearchIndexerDataSource *)self dataSourceIdentifier];
  uint64_t v4 = [v2 stringWithFormat:@"NotesIndexerState-%@", v3];

  return (NSString *)v4;
}

- (NSString)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    uint64_t v4 = [MEMORY[0x263F08C38] UUID];
    uint64_t v5 = [v4 UUIDString];
    uint8_t v6 = self->_uuid;
    self->_uuid = v5;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)dataSourceIdentifier
{
  return @"Unknown";
}

- (unint64_t)indexingPriority
{
  return 0;
}

- (id)persistentStoreCoordinator
{
  return 0;
}

- (id)newManagedObjectContext
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
  uint64_t v4 = [(ICBaseSearchIndexerDataSource *)self persistentStoreCoordinator];
  [v3 setPersistentStoreCoordinator:v4];

  return v3;
}

- (id)objectForSearchableItem:(id)a3 context:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueIdentifier];
  os_log_t v9 = [(ICBaseSearchIndexerDataSource *)self persistentStoreCoordinator];
  os_log_t v10 = objc_msgSend(v9, "ic_managedObjectIDForURIString:", v8);

  if (v10)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    id v30 = 0;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__ICBaseSearchIndexerDataSource_objectForSearchableItem_context___block_invoke;
    v20[3] = &unk_2640CD3D0;
    p_long long buf = &buf;
    id v21 = v7;
    id v22 = v10;
    [v21 performBlockAndWait:v20];
    int v11 = [*(id *)(*((void *)&buf + 1) + 40) conformsToProtocol:&unk_26C15BD40];
    v12 = *(void **)(*((void *)&buf + 1) + 40);
    if (v11)
    {
      id v13 = v12;
    }
    else
    {
      if (v12)
      {
        v16 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = (objc_class *)objc_opt_class();
          __int16 v18 = NSStringFromClass(v17);
          *(_DWORD *)id v24 = 138412290;
          v25 = v18;
          _os_log_impl(&dword_20C263000, v16, OS_LOG_TYPE_INFO, "Trying to get object for a searchable item that is not indexable: %@", v24, 0xCu);
        }
      }
      id v13 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v14 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [v6 uniqueIdentifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_20C263000, v14, OS_LOG_TYPE_INFO, "Could not get object ID for searchable item %@", (uint8_t *)&buf, 0xCu);
    }
    id v13 = 0;
  }

  return v13;
}

void __65__ICBaseSearchIndexerDataSource_objectForSearchableItem_context___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v10 = 0;
  uint64_t v4 = [v2 existingObjectWithID:v3 error:&v10];
  id v5 = v10;
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (v5)
  {
    id v8 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = a1[5];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_20C263000, v8, OS_LOG_TYPE_INFO, "Error fetching object with ID %@: %@", buf, 0x16u);
    }
  }
}

- (id)objectForManagedObjectIDURI:(id)a3 context:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICBaseSearchIndexerDataSource *)self persistentStoreCoordinator];
  uint64_t v9 = objc_msgSend(v8, "ic_managedObjectIDForURIString:", v6);

  if (!v9)
  {
    os_log_t v12 = 0;
    goto LABEL_14;
  }
  id v16 = 0;
  id v10 = [v7 existingObjectWithID:v9 error:&v16];
  id v11 = v16;
  if (v10)
  {
    if ([v10 conformsToProtocol:&unk_26C15BD40])
    {
      os_log_t v12 = v10;
      if (![v12 isHiddenFromIndexing]) {
        goto LABEL_13;
      }
    }
    else
    {
      os_log_t v12 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        *(_DWORD *)long long buf = 138412546;
        id v18 = v14;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_20C263000, v12, OS_LOG_TYPE_INFO, "Found %@ for objectIDURI %@, but it's not a search indexable object", buf, 0x16u);
      }
    }
  }
  else
  {
    os_log_t v12 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_20C263000, v12, OS_LOG_TYPE_INFO, "No managed object for searchable item %@: %@", buf, 0x16u);
    }
  }

  os_log_t v12 = 0;
LABEL_13:

LABEL_14:
  return v12;
}

- (id)searchableItemResultForObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  id v6 = [v5 URIRepresentation];
  id v7 = [v6 absoluteString];

  if (objc_opt_class())
  {
    id v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = @"<ICSearchIndexable>";
  }
  id v10 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseSearchIndexerDataSource searchableItemResultForObject:]((uint64_t)v9);
  }

  if (v5 && v7)
  {
    id v11 = [v4 searchableItemAttributeSet];
    if (v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x263F02AE0]);
      __int16 v13 = [v4 searchIndexingIdentifier];
      [v12 setUniqueIdentifier:v13];

      id v14 = [v4 searchDomainIdentifier];
      [v12 setDomainIdentifier:v14];

      uint64_t v15 = [MEMORY[0x263EFF910] distantFuture];
      [v12 setExpirationDate:v15];

      id v16 = [(ICBaseSearchIndexerDataSource *)self dataSourceIdentifier];
      [v11 setIc_dataSourceIdentifier:v16];

      [v12 setAttributeSet:v11];
      os_log_t v17 = [v11 eligibleForPhotosProcessing];
      objc_msgSend(v12, "setIsUpdate:", -[NSObject BOOLValue](v17, "BOOLValue"));
    }
    else
    {
      os_log_t v17 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[ICBaseSearchIndexerDataSource searchableItemResultForObject:]();
      }

      id v12 = 0;
    }
  }
  else
  {
    id v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ICBaseSearchIndexerDataSource searchableItemResultForObject:]((uint64_t)v9);
    }
    id v12 = 0;
  }

  id v18 = objc_alloc_init(ICSearchableItemResult);
  [(ICSearchableItemResult *)v18 setSearchableItem:v12];

  return v18;
}

- (id)additionalItemsForObject:(id)a3
{
  return 0;
}

- (id)additionalUniqueIdentifiersToDeleteForObject:(id)a3
{
  return 0;
}

- (void)contextWillSave:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
  {
    id v5 = [v4 object];
    id v6 = [v5 persistentStoreCoordinator];
    id v7 = [(ICBaseSearchIndexerDataSource *)self persistentStoreCoordinator];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      id v53 = v4;
      uint64_t v9 = [MEMORY[0x263EFF980] array];
      id v10 = [MEMORY[0x263EFF9C0] set];
      id v11 = [v5 insertedObjects];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        __int16 v13 = [v5 insertedObjects];
        [v10 unionSet:v13];
      }
      id v14 = [v5 updatedObjects];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        id v16 = [v5 updatedObjects];
        [v10 unionSet:v16];
      }
      os_log_t v17 = [v5 deletedObjects];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        __int16 v19 = [v5 deletedObjects];
        [v10 unionSet:v19];
      }
      v54 = objc_msgSend(MEMORY[0x263EFF980], "array", v5);
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      obuint64_t j = v10;
      uint64_t v58 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
      if (v58)
      {
        uint64_t v57 = *(void *)v71;
        v56 = self;
        do
        {
          for (uint64_t i = 0; i != v58; ++i)
          {
            if (*(void *)v71 != v57) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            id v22 = objc_opt_new();
            if ([(ICBaseSearchIndexerDataSource *)self isFolderWithServerShareChanged:v21])
            {
              [v54 addObject:v21];
            }
            if ([v21 conformsToProtocol:&unk_26C15BE38])
            {
              uint64_t v23 = [v21 targetSearchIndexable];
              objc_msgSend(v22, "ic_addNonNilObject:", v23);
            }
            else if ([v21 conformsToProtocol:&unk_26C15BD40])
            {
              objc_msgSend(v22, "ic_addNonNilObject:", v21);
            }
            if ([v22 count])
            {
              id v24 = [v22 firstObject];
              char v25 = objc_opt_respondsToSelector();

              if (v25)
              {
                v26 = (void *)MEMORY[0x263EFFA08];
                uint64_t v27 = [v21 changedValues];
                v28 = [v27 allKeys];
                v29 = [v26 setWithArray:v28];

                id v30 = [v22 firstObject];
                uint64_t v31 = [v30 additionalSearchIndexablesForChangedKeys:v29];

                if ([v31 count])
                {
                  long long v32 = [v31 allObjects];
                  objc_msgSend(v22, "ic_addObjectsFromNonNilArray:", v32);
                }
              }
              v59 = v22;
              uint64_t v60 = i;
              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              id v33 = v22;
              uint64_t v34 = [v33 countByEnumeratingWithState:&v66 objects:v79 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v67;
                do
                {
                  for (uint64_t j = 0; j != v35; ++j)
                  {
                    if (*(void *)v67 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    char v38 = *(void **)(*((void *)&v66 + 1) + 8 * j);
                    v39 = [v38 objectID];
                    int v40 = [v39 isTemporaryID];

                    if (v40)
                    {
                      __int16 v41 = [v38 managedObjectContext];
                      v78 = v38;
                      v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
                      id v65 = 0;
                      char v43 = [v41 obtainPermanentIDsForObjects:v42 error:&v65];
                      id v44 = v65;

                      if ((v43 & 1) == 0)
                      {
                        v45 = os_log_create("com.apple.notes", "SearchIndexer");
                        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                        {
                          v49 = (objc_class *)objc_opt_class();
                          v50 = NSStringFromClass(v49);
                          *(_DWORD *)long long buf = 138412546;
                          v75 = v50;
                          __int16 v76 = 2112;
                          id v77 = v44;
                          _os_log_error_impl(&dword_20C263000, v45, OS_LOG_TYPE_ERROR, "Error obtaining permanent ID for %@: %@", buf, 0x16u);
                        }
                      }
                    }
                    v46 = [v38 objectID];
                    char v47 = [v46 isTemporaryID];

                    if ((v47 & 1) == 0)
                    {
                      v48 = [v38 objectID];
                      [v9 addObject:v48];
                    }
                  }
                  uint64_t v35 = [v33 countByEnumeratingWithState:&v66 objects:v79 count:16];
                }
                while (v35);
              }

              self = v56;
              id v22 = v59;
              uint64_t i = v60;
            }
          }
          uint64_t v58 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
        }
        while (v58);
      }

      if ([v9 count] || objc_msgSend(v54, "count"))
      {
        v51 = [(ICBaseSearchIndexerDataSource *)self processingQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __49__ICBaseSearchIndexerDataSource_contextWillSave___block_invoke;
        block[3] = &unk_2640CD3F8;
        id v62 = v54;
        v63 = self;
        id v64 = v9;
        dispatch_async(v51, block);
      }
      id v5 = v52;
      id v4 = v53;
    }
  }
}

uint64_t __49__ICBaseSearchIndexerDataSource_contextWillSave___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(a1[5], "addNotesFromSubtree:", *(void *)(*((void *)&v10 + 1) + 8 * v6), (void)v10);
        [a1[6] addObjectsFromArray:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t result = [a1[6] count];
  if (result)
  {
    uint64_t result = [a1[5] addNewObjectsForProcessing:a1[6]];
    if (result)
    {
      uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 postNotificationName:@"ICSearchIndexerDataSourceDidChangeNotification" object:a1[5]];

      return [a1[5] saveStateIfNecessary];
    }
  }
  return result;
}

- (BOOL)addNewObjectsForProcessing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseSearchIndexerDataSource *)self objectIDsToProcess];
  uint64_t v6 = (void *)[v5 mutableCopy];

  id v7 = [(ICBaseSearchIndexerDataSource *)self objectIDsToProcess];
  [v7 removeObjectsInArray:v4];

  int v8 = [(ICBaseSearchIndexerDataSource *)self objectIDsToProcess];
  [v8 addObjectsFromArray:v4];

  uint64_t v9 = [(ICBaseSearchIndexerDataSource *)self objectIDsToProcess];
  LOBYTE(v4) = [v6 isEqual:v9] ^ 1;

  return (char)v4;
}

- (id)addNotesFromSubtree:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "array", a3);
}

- (BOOL)isFolderWithServerShareChanged:(id)a3
{
  return 0;
}

- (id)indexableObjectIDsWithURIs:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__0;
  __int16 v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__ICBaseSearchIndexerDataSource_indexableObjectIDsWithURIs_context___block_invoke;
  v11[3] = &unk_2640CD320;
  id v8 = v6;
  id v12 = v8;
  long long v13 = self;
  id v14 = &v15;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __68__ICBaseSearchIndexerDataSource_indexableObjectIDsWithURIs_context___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator", (void)v13);
        long long v10 = objc_msgSend(v9, "ic_managedObjectIDForURIString:", v8);

        if (v10) {
          [v2 addObject:v10];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v2;
}

- (id)allIndexableObjectIDsInReversedReindexingOrderWithContext:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  return v3;
}

- (BOOL)shouldIndexableObjectExistInIndexing:(id)a3
{
  id v3 = a3;
  if ([v3 isDeleted]) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [v3 isHiddenFromIndexing] ^ 1;
  }

  return v4;
}

- (id)objectIDsNeedingProcessing
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v3 = [(ICBaseSearchIndexerDataSource *)self processingQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__ICBaseSearchIndexerDataSource_objectIDsNeedingProcessing__block_invoke;
  v6[3] = &unk_2640CD2F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __59__ICBaseSearchIndexerDataSource_objectIDsNeedingProcessing__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objectIDsToProcess];
  id v2 = [v6 array];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)isPaperKitOrSynapseAttachment:(id)a3
{
  return 0;
}

- (int64_t)decisionOnObjectID:(id)a3 searchableItemToIndex:(id *)a4 additionalItemsToIndex:(id *)a5 objectIDURIToDelete:(id *)a6 additionalUniqueIdentifiersToDelete:(id *)a7 context:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  id v46 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  char v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__0;
  id v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke;
  v20[3] = &unk_2640CD420;
  id v15 = v14;
  id v21 = v15;
  id v16 = v13;
  id v22 = v16;
  uint64_t v23 = self;
  id v24 = &v53;
  char v25 = &v47;
  v26 = &v35;
  uint64_t v27 = &v29;
  v28 = &v41;
  [v15 performBlockAndWait:v20];
  if (a4) {
    *a4 = (id) v48[5];
  }
  if (a5) {
    *a5 = (id) v36[5];
  }
  if (a7) {
    *a7 = (id) v30[5];
  }
  if (a6) {
    *a6 = (id) v42[5];
  }
  int64_t v17 = v54[3];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v17;
}

void __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x210547E60]();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 32);
  id v30 = 0;
  uint64_t v5 = [v4 existingObjectWithID:v3 error:&v30];
  id v6 = v30;
  if (v5)
  {
    if (![v5 conformsToProtocol:&unk_26C15BD40])
    {
      id v7 = 0;
      goto LABEL_15;
    }
    id v7 = v5;
    if ([*(id *)(a1 + 48) shouldIndexableObjectExistInIndexing:v7])
    {
      int v8 = [*(id *)(a1 + 48) isPaperKitOrSynapseAttachment:v7];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      if (v8) {
        uint64_t v10 = 3;
      }
      else {
        uint64_t v10 = 1;
      }
      goto LABEL_14;
    }
    id v12 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke_cold_2((uint64_t *)(a1 + 40), v7, v12);
    }
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke_cold_1();
    }

    id v7 = 0;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = 2;
LABEL_14:
  *(void *)(v9 + 24) = v10;
LABEL_15:
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v13 == 1)
  {
    if (!v7) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  if (v13 == 3 && v7 != 0)
  {
LABEL_22:
    id v15 = [*(id *)(a1 + 48) searchableItemResultForObject:v7];
    uint64_t v16 = [v15 searchableItem];
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = [v15 additionalSearchableItems];
    uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v7)
    {
      uint64_t v22 = [*(id *)(a1 + 48) additionalUniqueIdentifiersToDeleteForObject:v7];
      uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
      id v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;
    }
    char v25 = [*(id *)(a1 + 40) URIRepresentation];
    uint64_t v26 = [v25 absoluteString];
    uint64_t v27 = *(void *)(*(void *)(a1 + 88) + 8);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
LABEL_27:
  uint64_t v29 = [v5 managedObjectContext];
  [v29 refreshObject:v5 mergeChanges:0];
}

- (void)searchIndexerWillIndexObjectIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseSearchIndexerDataSource *)self processingQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__ICBaseSearchIndexerDataSource_searchIndexerWillIndexObjectIDs___block_invoke;
  v7[3] = &unk_2640CD448;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__ICBaseSearchIndexerDataSource_searchIndexerWillIndexObjectIDs___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectIDsToProcess];
  [v2 removeObjectsInArray:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) objectIDsBeingProcessed];
  [v3 addObjectsFromArray:*(void *)(a1 + 40)];
}

- (void)searchIndexerDidFinishIndexingObjectIDs:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(ICBaseSearchIndexerDataSource *)self processingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__ICBaseSearchIndexerDataSource_searchIndexerDidFinishIndexingObjectIDs_error___block_invoke;
    block[3] = &unk_2640CD3F8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __79__ICBaseSearchIndexerDataSource_searchIndexerDidFinishIndexingObjectIDs_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectIDsBeingProcessed];
  [v2 removeObjectsInArray:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 48))
  {
    id v3 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 40), "count"));
    id v4 = [*(id *)(a1 + 32) objectIDsToProcess];
    [v4 insertObjects:*(void *)(a1 + 40) atIndexes:v3];
  }
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 saveStateIfNecessary];
}

- (void)searchIndexerWillDeleteSearchableItemsWithObjectIDURIs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseSearchIndexerDataSource *)self processingQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__ICBaseSearchIndexerDataSource_searchIndexerWillDeleteSearchableItemsWithObjectIDURIs___block_invoke;
  v7[3] = &unk_2640CD448;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __88__ICBaseSearchIndexerDataSource_searchIndexerWillDeleteSearchableItemsWithObjectIDURIs___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v19;
    *(void *)&long long v4 = 138412290;
    long long v17 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator", v17, (void)v18);
        id v10 = objc_msgSend(v9, "ic_managedObjectIDForURIString:", v8);

        if (v10)
        {
          id v11 = [*(id *)(a1 + 40) objectIDsBeingProcessed];
          [v11 addObject:v10];

          id v12 = [*(id *)(a1 + 40) objectIDsToProcess];
          [v12 removeObject:v10];

          uint64_t v13 = os_log_create("com.apple.notes", "SearchIndexer");
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_10;
          }
          *(_DWORD *)long long buf = v17;
          uint64_t v23 = v10;
          id v14 = v13;
          id v15 = "About to delete item from index: %@";
        }
        else
        {
          uint64_t v13 = os_log_create("com.apple.notes", "SearchIndexer");
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_10;
          }
          *(_DWORD *)long long buf = v17;
          uint64_t v23 = v8;
          id v14 = v13;
          id v15 = "About to delete an objectIDURI from the index, but we cannot retrieve its object ID: %@";
        }
        _os_log_debug_impl(&dword_20C263000, v14, OS_LOG_TYPE_DEBUG, v15, buf, 0xCu);
LABEL_10:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v16 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v5 = v16;
    }
    while (v16);
  }
}

- (void)searchIndexerDidFinishDeletingSearchableItemsWithObjectIDURIs:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(ICBaseSearchIndexerDataSource *)self processingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__ICBaseSearchIndexerDataSource_searchIndexerDidFinishDeletingSearchableItemsWithObjectIDURIs_error___block_invoke;
    block[3] = &unk_2640CD3F8;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __101__ICBaseSearchIndexerDataSource_searchIndexerDidFinishDeletingSearchableItemsWithObjectIDURIs_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator", (void)v13);
        uint64_t v9 = objc_msgSend(v8, "ic_managedObjectIDForURIString:", v7);

        if (v9)
        {
          id v10 = [*(id *)(a1 + 40) objectIDsBeingProcessed];
          [v10 removeObject:v9];

          if (*(void *)(a1 + 48))
          {
            id v11 = [*(id *)(a1 + 40) objectIDsToProcess];
            [v11 insertObject:v9 atIndex:0];
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) saveStateIfNecessary];
}

- (void)stageForReindexingWithContext:(id)a3
{
  id v4 = a3;
  if (ICVerboseSearchLogging())
  {
    uint64_t v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICBaseSearchIndexerDataSource stageForReindexingWithContext:]();
    }
  }
  uint64_t v6 = [(ICBaseSearchIndexerDataSource *)self processingQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke;
  v8[3] = &unk_2640CD448;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke(uint64_t a1)
{
  if (ICVerboseSearchLogging())
  {
    id v2 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_4();
    }
  }
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = (id *)(a1 + 32);
  uint64_t v6 = [v3 allIndexableObjectIDsInReversedReindexingOrderWithContext:v4];
  if (ICVerboseSearchLogging())
  {
    id v7 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_3();
    }
  }
  if (v6)
  {
    int v8 = [*v5 addNewObjectsForProcessing:v6];
  }
  else
  {
    id v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_2();
    }

    int v8 = 0;
  }
  int v10 = [*v5 needsReindexing];
  [*v5 setNeedsReindexing:0];
  if (ICVerboseSearchLogging())
  {
    id v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_1();
    }
  }
  if ((v10 | v8) == 1) {
    [*v5 saveStateIfNecessary];
  }
}

- (void)clearObjectIDsToProcess
{
  uint64_t v3 = [(ICBaseSearchIndexerDataSource *)self processingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ICBaseSearchIndexerDataSource_clearObjectIDsToProcess__block_invoke;
  block[3] = &unk_2640CD3A8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __56__ICBaseSearchIndexerDataSource_clearObjectIDsToProcess__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectIDsToProcess];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectIDsToProcess];
    [v4 removeAllObjects];

    uint64_t v5 = *(void **)(a1 + 32);
    [v5 saveStateIfNecessary];
  }
}

- (void)stageObjectIDURIsForIndexing:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ICBaseSearchIndexerDataSource *)self processingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__ICBaseSearchIndexerDataSource_stageObjectIDURIsForIndexing_context___block_invoke;
  block[3] = &unk_2640CD3F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __70__ICBaseSearchIndexerDataSource_stageObjectIDURIsForIndexing_context___block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 32) indexableObjectIDsWithURIs:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  if ([v2 count])
  {
    if ([*v1 addNewObjectsForProcessing:v2]) {
      [*v1 saveStateIfNecessary];
    }
  }
  else
  {
    uint64_t v3 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __70__ICBaseSearchIndexerDataSource_stageObjectIDURIsForIndexing_context___block_invoke_cold_1();
    }
  }
}

- (id)objectIDsFromSearchableItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
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
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 uniqueIdentifier];
        id v13 = [(ICBaseSearchIndexerDataSource *)self persistentStoreCoordinator];
        long long v14 = objc_msgSend(v13, "ic_managedObjectIDForURIString:", v12);

        if (v14)
        {
          [v5 addObject:v14];
        }
        else
        {
          long long v15 = os_log_create("com.apple.notes", "SearchIndexer");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[ICBaseSearchIndexerDataSource objectIDsFromSearchableItems:](v21, v11, &v22, v15);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)saveStateIfNecessary
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "saveStateIfNecessary: started for data source %@", v2, v3, v4, v5, v6);
}

void __53__ICBaseSearchIndexerDataSource_saveStateIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = [a2 URIRepresentation];
  uint64_t v5 = [v6 absoluteString];
  [v4 insertObject:v5 atIndex:a3];
}

void __53__ICBaseSearchIndexerDataSource_saveStateIfNecessary__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = [a2 URIRepresentation];
  uint64_t v5 = [v6 absoluteString];
  [v4 insertObject:v5 atIndex:a3];
}

void __60__ICBaseSearchIndexerDataSource_loadOrClearStateIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 persistentStoreCoordinator];
  objc_msgSend(v5, "ic_managedObjectIDForURIString:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
    id v6 = v7;
  }
}

- (BOOL)saveStateDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [(ICBaseSearchIndexerDataSource *)self stateFileURL];
  v13[0] = 0;
  int v7 = [v4 writeToURL:v6 error:v13];
  id v8 = v13[0];
  uint64_t v9 = os_log_create("com.apple.notes", "SearchIndexer");
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_20C263000, v10, OS_LOG_TYPE_INFO, "Wrote search indexer saved state dictionary to file: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[ICBaseSearchIndexerDataSource saveStateDictionary:]();
  }

  id v11 = [v6 path];
  [(ICBaseSearchIndexerDataSource *)self logFileSizeForFileAtPath:v11 fileManager:v5];

  return v7;
}

+ (id)didReindexForMigrationUserDefaultKeyForIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"DidReindexForMigration-%@", a3];
}

+ (BOOL)isAccountReindexedForMigration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v6 = [a1 didReindexForMigrationUserDefaultKeyForIdentifier:v4];
  int v7 = [v5 objectForKey:v6];
  char v8 = [v7 BOOLValue];

  uint64_t v9 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[ICBaseSearchIndexerDataSource isAccountReindexedForMigration:]();
  }

  return v8;
}

+ (void)markAccountReindexedForMigration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[ICBaseSearchIndexerDataSource markAccountReindexedForMigration:]();
  }

  id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v7 = [a1 didReindexForMigrationUserDefaultKeyForIdentifier:v4];
  [v6 setObject:MEMORY[0x263EFFA88] forKey:v7];
}

- (NSMutableOrderedSet)objectIDsBeingProcessed
{
  return self->_objectIDsBeingProcessed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDsBeingProcessed, 0);
  objc_storeStrong((id *)&self->_objectIDsToProcess, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)searchableItemResultForObject:.cold.1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_20C263000, v2, v3, "Skipping creation of searchable item with no attribute set %@, (%@)", v4, v5, v6, v7, v8);
}

- (void)searchableItemResultForObject:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_20C263000, v1, v2, "Skipping creation of searchable item without object ID %@ (%@)", (void)v3, DWORD2(v3));
}

- (void)searchableItemResultForObject:(uint64_t)a1 .cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_20C263000, v1, v2, "Creating searchable item for %@: %@", (void)v3, DWORD2(v3));
}

void __54__ICBaseSearchIndexerDataSource_startObservingChanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "We have object IDs to process after starting to observe changes %@", v2, v3, v4, v5, v6);
}

void __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_20C263000, v1, v2, "Cannot fetch object for objectID when evaluating if we should delete the object %@. Error = %@", (void)v3, DWORD2(v3));
}

void __161__ICBaseSearchIndexerDataSource_decisionOnObjectID_searchableItemToIndex_additionalItemsToIndex_objectIDURIToDelete_additionalUniqueIdentifiersToDelete_context___block_invoke_cold_2(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  uint8_t v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a2, "isDeleted"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a2, "isHiddenFromIndexing"));
  int v8 = 138412802;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  id v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  _os_log_debug_impl(&dword_20C263000, a3, OS_LOG_TYPE_DEBUG, "Will delete indexing for objectID because it is deleted from database or is hidden from indexing %@, deleted=%@, isHiddenFromIndexing=%@", (uint8_t *)&v8, 0x20u);
}

- (void)stageForReindexingWithContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "stageForReindexingWithContext: dispatching to processing queue from data source %@", v2, v3, v4, v5, v6);
}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "stageForReindexingWithContext: changed = %@", v2, v3, v4, v5, v6);
}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "%@ Error fetching allIndexableObjectIDsInReversedReindexingOrder", v2, v3, v4, v5, v6);
}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_20C263000, v1, v2, "stageForReindexingWithContext: data source %@ retrieved objectIDsToProcess %@", (void)v3, DWORD2(v3));
}

void __63__ICBaseSearchIndexerDataSource_stageForReindexingWithContext___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "stageForReindexingWithContext: begin staging for data source %@", v2, v3, v4, v5, v6);
}

void __70__ICBaseSearchIndexerDataSource_stageObjectIDURIsForIndexing_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "%@ Error fetching through indexableObjectIDsWithURIs:", v2, v3, v4, v5, v6);
}

- (void)objectIDsFromSearchableItems:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 uniqueIdentifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_20C263000, a4, OS_LOG_TYPE_DEBUG, "No object ID for searchable item: %@", a1, 0xCu);
}

- (void)moveIndexingTrackingFromUserDefaultsToFileIfNecessary
{
  uint64_t v1 = @"File exists";
  if (!*a1) {
    uint64_t v1 = @"File doesn't exist";
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9(&dword_20C263000, v2, v3, "Failed to write state dictionary to file. %@ (error: %@)", (void)v4, DWORD2(v4));
}

- (void)_loadStateDictionaryWithFileManager:(uint64_t)a1 fileURL:NSError:fileExists:savedDictionary:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9(&dword_20C263000, v1, v2, "Error loading saved state dictionary from url: %@ Error: %@", (void)v3, DWORD2(v3));
}

- (void)saveStateDictionary:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3, NSObject **a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = objc_begin_catch(a1);
  *a3 = v6;
  id v7 = v6;
  int v8 = os_log_create("com.apple.notes", "SearchIndexer");
  *a4 = v8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v7;
    _os_log_error_impl(&dword_20C263000, v8, OS_LOG_TYPE_ERROR, "An exception is thrown when writing search indexer saved state dictionary to file: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)saveStateDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Could not write search indexer saved state dictionary to file, error: %@", v2, v3, v4, v5, v6);
}

+ (void)isAccountReindexedForMigration:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20C263000, v0, v1, "Evaluating account for reindexed after migration: %@. result: %@");
}

+ (void)markAccountReindexedForMigration:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Adding account for reindexed after migration: %@", v2, v3, v4, v5, v6);
}

@end