@interface RadioModel
+ (id)_persistentStoreConfigurationOptions;
+ (id)_radioDatabasePath;
+ (id)_radioDirectoryPath;
+ (id)backgroundModel;
+ (id)sharedModel;
+ (void)_postAccountDidDeauthenticateNotification;
+ (void)deleteAllData;
- (NSArray)allStations;
- (NSArray)featuredStations;
- (NSArray)previewStations;
- (NSArray)reportProblemIssueTypes;
- (NSArray)stationSortOrdering;
- (NSArray)userStations;
- (NSString)globalHash;
- (RadioModel)init;
- (id)_arrayByReplacingManagedObjectsInArray:(id)a3;
- (id)_databasePropertyValueForKey:(id)a3;
- (id)_init;
- (id)_initBackgroundModelWithPersistentStoreCoordinator:(id)a3;
- (id)_setByReplacingManagedObjectsInSet:(id)a3;
- (id)context;
- (id)convertObject:(id)a3;
- (id)convertObjects:(id)a3;
- (id)convertObjectsInSet:(id)a3;
- (id)newFeaturedStationWithDictionary:(id)a3;
- (id)newPreviewStationWithDictionary:(id)a3;
- (id)newStationWithDictionary:(id)a3;
- (id)stationWithHash:(id)a3;
- (id)stationWithID:(int64_t)a3;
- (id)stationWithPersistentID:(int64_t)a3;
- (id)stationWithStationStringID:(id)a3;
- (int64_t)databaseVersion;
- (unint64_t)_numberOfSkipsUsedWithSkipTimestamps:(id)a3 currentTimestamp:(double)a4 skipInterval:(double)a5 returningEarliestSkipTimestamp:(double *)a6;
- (unint64_t)authenticatedAccountIdentifier;
- (unint64_t)globalVersion;
- (void)_beginBackgroundTaskAssertion;
- (void)_contextDidSaveNotification:(id)a3;
- (void)_createRadioDirectoryAndDatabaseIfNecessary;
- (void)_defaultRadioModelInitialization;
- (void)_endBackgroundTaskAssertion;
- (void)_performTransactionAndSave:(BOOL)a3 withBlock:(id)a4;
- (void)_postContextDidChangeNotification:(id)a3;
- (void)_prepareModel;
- (void)_resetModel;
- (void)_setDatabasePropertyValue:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)deleteAllData;
- (void)deleteStation:(id)a3;
- (void)deleteStationWithID:(int64_t)a3;
- (void)performTransactionWithBlock:(id)a3;
- (void)performWriteTransactionWithBlock:(id)a3;
- (void)setAuthenticatedAccountIdentifier:(unint64_t)a3;
- (void)setDatabaseVersion:(int64_t)a3;
- (void)setGlobalHash:(id)a3;
- (void)setGlobalVersion:(unint64_t)a3;
- (void)setReportProblemIssueTypes:(id)a3;
- (void)setStationSortOrdering:(id)a3;
- (void)setTrackPlaybackDescriptorQueue:(id)a3 forStation:(id)a4;
@end

@implementation RadioModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCoordinator, 0);
  objc_storeStrong((id *)&self->_stationToSkipControllerMapTable, 0);
  objc_storeStrong((id *)&self->_stationFetchRequest, 0);
  objc_storeStrong((id *)&self->_stationFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_backgroundTaskInvalidateTimerSource, 0);
  objc_storeStrong((id *)&self->_backgroundProcessAssertion, 0);
  objc_storeStrong((id *)&self->_backgroundCleanupQueue, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

- (void)_setDatabasePropertyValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v7, @"key", 0);
    v9 = [(NSManagedObjectModel *)self->_model fetchRequestFromTemplateWithName:@"DatabasePropertyKeyToProperty" substitutionVariables:v8];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__RadioModel__setDatabasePropertyValue_forKey___block_invoke;
    v11[3] = &unk_2643A9FB0;
    v11[4] = self;
    id v12 = v9;
    id v13 = v7;
    id v14 = v6;
    id v10 = v9;
    [(RadioModel *)self performWriteTransactionWithBlock:v11];
  }
}

void __47__RadioModel__setDatabasePropertyValue_forKey___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1[4] + 48) executeFetchRequest:a1[5] error:0];
  v3 = [v2 lastObject];

  [v3 willAccessValueForKey:@"value"];
  v4 = [v3 valueForKey:@"value"];
  [v3 didAccessValueForKey:@"value"];
  if (!v3)
  {
    id v5 = objc_alloc(MEMORY[0x263EFF280]);
    id v6 = [MEMORY[0x263EFF240] entityForName:@"DatabaseProperty" inManagedObjectContext:*(void *)(a1[4] + 48)];
    v3 = (void *)[v5 initWithEntity:v6 insertIntoManagedObjectContext:*(void *)(a1[4] + 48)];

    [v3 willChangeValueForKey:@"key"];
    [v3 setValue:a1[6] forKey:@"key"];
    [v3 didChangeValueForKey:@"key"];
  }
  if (v4 != (void *)a1[7] && (objc_msgSend(v4, "isEqualToString:") & 1) == 0)
  {
    id v7 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_21B56B000, v7, OS_LOG_TYPE_INFO, "[RadioModel] Setting database property: %@", (uint8_t *)&v8, 0xCu);
    }

    [v3 willChangeValueForKey:@"value"];
    [v3 setValue:a1[7] forKey:@"value"];
    [v3 didChangeValueForKey:@"value"];
  }
}

- (id)_setByReplacingManagedObjectsInSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = [[RadioStation alloc] initWithModel:self managedObject:v11];
            [v5 addObject:v12];
          }
          else
          {
            objc_msgSend(v5, "addObject:", v11, (void)v14);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_resetModel
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(NSFetchedResultsController *)self->_stationFetchedResultsController setDelegate:0];
  stationFetchedResultsController = self->_stationFetchedResultsController;
  self->_stationFetchedResultsController = 0;

  stationFetchRequest = self->_stationFetchRequest;
  self->_stationFetchRequest = 0;

  id v5 = [(NSPersistentStoreCoordinator *)self->_storeCoordinator persistentStores];
  id v6 = (void *)[v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSPersistentStoreCoordinator removePersistentStore:error:](self->_storeCoordinator, "removePersistentStore:error:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), 0, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_prepareModel
{
  [(RadioModel *)self _createRadioDirectoryAndDatabaseIfNecessary];
  v3 = (NSManagedObjectContext *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
  context = self->_context;
  self->_context = v3;

  id v5 = self->_context;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __27__RadioModel__prepareModel__block_invoke;
  v17[3] = &unk_2643AA648;
  v17[4] = self;
  [(NSManagedObjectContext *)v5 performBlockAndWait:v17];
  id v6 = (NSFetchRequest *)objc_alloc_init(MEMORY[0x263EFF260]);
  stationFetchRequest = self->_stationFetchRequest;
  self->_stationFetchRequest = v6;

  uint64_t v8 = self->_stationFetchRequest;
  uint64_t v9 = [MEMORY[0x263EFF240] entityForName:@"Station" inManagedObjectContext:self->_context];
  [(NSFetchRequest *)v8 setEntity:v9];

  uint64_t v10 = self->_stationFetchRequest;
  uint64_t v11 = +[RadioManagedStation defaultPropertiesToFetch];
  [(NSFetchRequest *)v10 setPropertiesToFetch:v11];

  long long v12 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"sort_order" ascending:1];
  long long v13 = self->_stationFetchRequest;
  long long v14 = [MEMORY[0x263EFF8C0] arrayWithObject:v12];
  [(NSFetchRequest *)v13 setSortDescriptors:v14];

  [(NSFetchRequest *)self->_stationFetchRequest setFetchBatchSize:10];
  long long v15 = (NSFetchedResultsController *)[objc_alloc(MEMORY[0x263EFF270]) initWithFetchRequest:self->_stationFetchRequest managedObjectContext:self->_context sectionNameKeyPath:0 cacheName:0];
  stationFetchedResultsController = self->_stationFetchedResultsController;
  self->_stationFetchedResultsController = v15;

  [(NSFetchedResultsController *)self->_stationFetchedResultsController setDelegate:self];
}

uint64_t __27__RadioModel__prepareModel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (*(unsigned char *)(v2 + 56)) {
    id v4 = (void *)MEMORY[0x263EFF060];
  }
  else {
    id v4 = (void *)MEMORY[0x263EFF068];
  }
  [v3 setMergePolicy:*v4];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 48);
  uint64_t v7 = *(void *)(v5 + 112);
  return [v6 setPersistentStoreCoordinator:v7];
}

- (void)_postContextDidChangeNotification:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = @"RadioModelDidChangeNotification";
    _os_log_impl(&dword_21B56B000, v5, OS_LOG_TYPE_INFO, "[RadioModel] Posting '%@'", buf, 0xCu);
  }

  id v6 = [v4 userInfo];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [v7 objectForKey:@"inserted"];
  uint64_t v9 = [(RadioModel *)self convertObjectsInSet:v8];

  if ([v9 count])
  {
    uint64_t v10 = [(RadioModel *)self _setByReplacingManagedObjectsInSet:v9];
    [v7 setObject:v10 forKey:@"inserted"];
  }
  uint64_t v11 = [v7 objectForKey:@"updated"];
  long long v12 = [(RadioModel *)self convertObjectsInSet:v11];

  if ([v12 count])
  {
    long long v13 = [(RadioModel *)self _setByReplacingManagedObjectsInSet:v12];
    [v7 setObject:v13 forKey:@"updated"];
  }
  long long v14 = [v7 objectForKey:@"deleted"];
  long long v15 = [(RadioModel *)self convertObjectsInSet:v14];

  if ([v15 count])
  {
    long long v16 = [(RadioModel *)self _setByReplacingManagedObjectsInSet:v15];
    [v7 setObject:v16 forKey:@"deleted"];
  }
  uint64_t v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 postNotificationName:@"RadioModelDidChangeNotification" object:self userInfo:v7];

  if (self->_modelChangedTokenIsValid)
  {
    v29 = v12;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v18 = v9;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
LABEL_12:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v20) {
            goto LABEL_12;
          }
          goto LABEL_18;
        }
      }
    }
    else
    {
LABEL_18:

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = v15;
      uint64_t v23 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (!v23)
      {
LABEL_26:

LABEL_28:
        long long v12 = v29;
        goto LABEL_29;
      }
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
LABEL_20:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v18);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v24 == ++v26)
        {
          uint64_t v24 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v24) {
            goto LABEL_20;
          }
          goto LABEL_26;
        }
      }
    }

    int modelChangedToken = self->_modelChangedToken;
    pid_t v28 = getpid();
    notify_set_state(modelChangedToken, v28);
    notify_post("com.apple.Radio.model-changed");
    goto LABEL_28;
  }
LABEL_29:
}

- (void)_performTransactionAndSave:(BOOL)a3 withBlock:(id)a4
{
  id v6 = a4;
  context = self->_context;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__RadioModel__performTransactionAndSave_withBlock___block_invoke;
  v9[3] = &unk_2643A9F88;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v9];
}

uint64_t __51__RadioModel__performTransactionAndSave_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  ++*(void *)(*(void *)(a1 + 32) + 120);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 120) == 1)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      int v4 = [*(id *)(result + 48) hasChanges];
      uint64_t result = *(void *)(a1 + 32);
      if (v4)
      {
        if (*(unsigned char *)(result + 56))
        {
          [(id)result _beginBackgroundTaskAssertion];
          uint64_t result = *(void *)(a1 + 32);
        }
        [*(id *)(result + 48) processPendingChanges];
        uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
        id v10 = 0;
        char v6 = [v5 save:&v10];
        id v7 = v10;
        if ((v6 & 1) == 0)
        {
          id v8 = os_log_create("com.apple.amp.radio", "Model");
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v12 = v7;
            _os_log_impl(&dword_21B56B000, v8, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to save (%@)", buf, 0xCu);
          }
        }
        uint64_t v9 = *(unsigned char **)(a1 + 32);
        if (v9[56]) {
          [v9 _endBackgroundTaskAssertion];
        }

        uint64_t result = *(void *)(a1 + 32);
      }
    }
  }
  --*(void *)(result + 120);
  return result;
}

- (void)_endBackgroundTaskAssertion
{
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__RadioModel__endBackgroundTaskAssertion__block_invoke;
  block[3] = &unk_2643AA648;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
}

void __41__RadioModel__endBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 32);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    *(void *)(v1 + 32) = v4;
    char v6 = *(void **)(a1 + 32);
    if (!v6[4])
    {
      id v7 = v6[5];
      if (v7)
      {
        dispatch_source_cancel(v7);
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = 0;

        char v6 = *(void **)(a1 + 32);
      }
      objc_initWeak(&location, v6);
      dispatch_source_t v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
      long long v15 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __41__RadioModel__endBackgroundTaskAssertion__block_invoke_2;
      v16[3] = &unk_2643A9F60;
      objc_copyWeak(&v17, &location);
      dispatch_source_set_event_handler(v15, v16);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __41__RadioModel__endBackgroundTaskAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[4])
    {
      BOOL v3 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v2;
        _os_log_impl(&dword_21B56B000, v3, OS_LOG_TYPE_INFO, "[RadioModel] Invalidating process assertion for model: %@", (uint8_t *)&v7, 0xCu);
      }

      [*((id *)v2 + 3) invalidate];
      uint64_t v4 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = 0;
    }
    uint64_t v5 = *((void *)v2 + 5);
    if (v5)
    {
      dispatch_source_cancel(v5);
      char v6 = (void *)*((void *)v2 + 5);
      *((void *)v2 + 5) = 0;
    }
  }
}

- (id)_databasePropertyValueForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v4, @"key", 0);
    char v6 = [(NSManagedObjectModel *)self->_model fetchRequestFromTemplateWithName:@"DatabasePropertyKeyToProperty" substitutionVariables:v5];
    uint64_t v13 = 0;
    dispatch_time_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__48;
    id v17 = __Block_byref_object_dispose__49;
    id v18 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__RadioModel__databasePropertyValueForKey___block_invoke;
    v10[3] = &unk_2643A9EE8;
    v10[4] = self;
    id v7 = v6;
    id v11 = v7;
    id v12 = &v13;
    [(RadioModel *)self performTransactionWithBlock:v10];
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __43__RadioModel__databasePropertyValueForKey___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 48) executeFetchRequest:a1[5] error:0];
  id v6 = [v2 lastObject];

  if (v6)
  {
    [v6 willAccessValueForKey:@"value"];
    uint64_t v3 = [v6 valueForKey:@"value"];
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    [v6 didAccessValueForKey:@"value"];
  }
}

- (void)_createRadioDirectoryAndDatabaseIfNecessary
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&__databaseLock);
  if (!self->_storeCoordinator)
  {
    if (!self->_model)
    {
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = [v4 pathForResource:@"Radio" ofType:@"momd"];

      if (!v5)
      {
        v62 = [MEMORY[0x263F08690] currentHandler];
        [v62 handleFailureInMethod:a2 object:self file:@"RadioModel.m" lineNumber:1092 description:@"unable to find model"];
      }
      v65 = [NSURL fileURLWithPath:v5 isDirectory:0];
      id v6 = (NSManagedObjectModel *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v65];
      model = self->_model;
      self->_model = v6;

      id v8 = [(NSManagedObjectModel *)self->_model entitiesByName];
      uint64_t v9 = [v8 objectForKey:@"Station"];

      id v10 = objc_alloc_init(MEMORY[0x263EFF260]);
      [v10 setEntity:v9];
      id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"station_id == $stationID"];
      [v10 setPredicate:v11];

      v64 = (void *)v5;
      id v12 = +[RadioManagedStation defaultPropertiesToFetch];
      [v10 setPropertiesToFetch:v12];

      [(NSManagedObjectModel *)self->_model setFetchRequestTemplate:v10 forName:@"StationIDToStation"];
      id v13 = objc_alloc_init(MEMORY[0x263EFF260]);
      v63 = (void *)v9;
      [v13 setEntity:v9];
      dispatch_time_t v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"station_hash == $stationHash"];
      [v13 setPredicate:v14];

      uint64_t v15 = +[RadioManagedStation defaultPropertiesToFetch];
      [v13 setPropertiesToFetch:v15];

      [(NSManagedObjectModel *)self->_model setFetchRequestTemplate:v13 forName:@"StationHashToStation"];
      id v16 = objc_alloc_init(MEMORY[0x263EFF260]);
      [v16 setEntity:v9];
      id v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"station_string_id == $stationStringID"];
      [v16 setPredicate:v17];

      id v18 = +[RadioManagedStation defaultPropertiesToFetch];
      [v16 setPropertiesToFetch:v18];

      [(NSManagedObjectModel *)self->_model setFetchRequestTemplate:v16 forName:@"StationStringIDToStation"];
      id v19 = objc_alloc_init(MEMORY[0x263EFF260]);
      uint64_t v20 = [(NSManagedObjectModel *)self->_model entitiesByName];
      uint64_t v21 = [v20 objectForKey:@"SkipHistory"];
      [v19 setEntity:v21];

      uint64_t v22 = [MEMORY[0x263F08A98] predicateWithFormat:@"skip_identifier == $skipIdentifier"];
      [v19 setPredicate:v22];

      [v19 setPropertiesToFetch:&unk_26CB5DE38];
      [(NSManagedObjectModel *)self->_model setFetchRequestTemplate:v19 forName:@"SkipIdentifierToSkipHistory"];
      id v23 = objc_alloc_init(MEMORY[0x263EFF260]);
      uint64_t v24 = [(NSManagedObjectModel *)self->_model entitiesByName];
      uint64_t v25 = [v24 objectForKey:@"SkipHistory"];
      [v23 setEntity:v25];

      uint64_t v26 = [MEMORY[0x263F08A98] predicateWithFormat:@"station_hash == $stationHash"];
      [v23 setPredicate:v26];

      [v23 setPropertiesToFetch:&unk_26CB5DE50];
      [(NSManagedObjectModel *)self->_model setFetchRequestTemplate:v23 forName:@"StationHashToSkipHistory"];
      id v27 = objc_alloc_init(MEMORY[0x263EFF260]);
      pid_t v28 = [(NSManagedObjectModel *)self->_model entitiesByName];
      v29 = [v28 objectForKey:@"SkipHistory"];
      [v27 setEntity:v29];

      long long v30 = [MEMORY[0x263F08A98] predicateWithFormat:@"station_id == $stationID"];
      [v27 setPredicate:v30];

      [v27 setPropertiesToFetch:&unk_26CB5DE68];
      [(NSManagedObjectModel *)self->_model setFetchRequestTemplate:v27 forName:@"StationIDToSkipHistory"];
      id v31 = objc_alloc_init(MEMORY[0x263EFF260]);
      long long v32 = [(NSManagedObjectModel *)self->_model entitiesByName];
      long long v33 = [v32 objectForKey:@"DatabaseProperty"];
      [v31 setEntity:v33];

      long long v34 = [MEMORY[0x263F08A98] predicateWithFormat:@"key == $key"];
      [v31 setPredicate:v34];

      [(NSManagedObjectModel *)self->_model setFetchRequestTemplate:v31 forName:@"DatabasePropertyKeyToProperty"];
    }
    long long v35 = (NSPersistentStoreCoordinator *)[objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:self->_model];
    storeCoordinator = self->_storeCoordinator;
    self->_storeCoordinator = v35;
  }
  long long v37 = [(id)objc_opt_class() _radioDirectoryPath];
  id v38 = objc_alloc_init(MEMORY[0x263F08850]);
  v39 = [MEMORY[0x263F086E0] mainBundle];
  v40 = [v39 bundleIdentifier];
  char v41 = [&unk_26CB5DE80 containsObject:v40];

  char v68 = 0;
  int v42 = [v38 fileExistsAtPath:v37 isDirectory:&v68];
  if (!v42 || !v68)
  {
    if (v42) {
      [v38 removeItemAtPath:v37 error:0];
    }
    if ((v41 & 1) != 0
      || ([v37 stringByDeletingLastPathComponent],
          v43 = objc_claimAutoreleasedReturnValue(),
          int v44 = [v38 isWritableFileAtPath:v43],
          v43,
          v44))
    {
      [v38 createDirectoryAtPath:v37 withIntermediateDirectories:1 attributes:0 error:0];
    }
    else
    {
      v45 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = [v37 stringByDeletingLastPathComponent];
        *(_DWORD *)buf = 138412290;
        v70 = v46;
        _os_log_impl(&dword_21B56B000, v45, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to write to '%@' to create database", buf, 0xCu);
      }
    }
  }
  v47 = [(id)objc_opt_class() _radioDatabasePath];
  v48 = [NSURL fileURLWithPath:v47 isDirectory:0];
  v49 = [(NSPersistentStoreCoordinator *)self->_storeCoordinator persistentStoreForURL:v48];

  if (!v49)
  {
    v50 = [(id)objc_opt_class() _persistentStoreConfigurationOptions];
    uint64_t v51 = *MEMORY[0x263EFF168];
    v52 = [(NSPersistentStoreCoordinator *)self->_storeCoordinator addPersistentStoreWithType:*MEMORY[0x263EFF168] configuration:0 URL:v48 options:v50 error:0];
    if (!v52)
    {
      if (v41 & 1) != 0 || ([v38 isWritableFileAtPath:v47])
      {
        v53 = os_log_create("com.apple.amp.radio", "Model");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B56B000, v53, OS_LOG_TYPE_ERROR, "[RadioModel] Database missing or corrupt, starting over.", buf, 2u);
        }

        v54 = self->_storeCoordinator;
        v55 = [(id)objc_opt_class() _persistentStoreConfigurationOptions];
        id v67 = 0;
        int v56 = [(NSPersistentStoreCoordinator *)v54 _destroyPersistentStoreAtURL:v48 withType:v51 options:v55 error:&v67];
        v57 = v67;

        v58 = os_log_create("com.apple.amp.radio", "Model");
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = @"NO";
          if (v56) {
            v59 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          v70 = v59;
          __int16 v71 = 2112;
          v72 = v57;
          _os_log_impl(&dword_21B56B000, v58, OS_LOG_TYPE_ERROR, "[RadioModel] Attempted database reset with success: %@ (%@)", buf, 0x16u);
        }

        v60 = self->_storeCoordinator;
        id v66 = 0;
        v52 = [(NSPersistentStoreCoordinator *)v60 addPersistentStoreWithType:v51 configuration:0 URL:v48 options:v50 error:&v66];
        id v61 = v66;
        if (!v52) {
          [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Radio: Unable to create database (%@)", v61 format];
        }
      }
      else
      {
        v57 = os_log_create("com.apple.amp.radio", "Model");
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B56B000, v57, OS_LOG_TYPE_ERROR, "[RadioModel] Database missing or corrupt, giving up.", buf, 2u);
        }
        v52 = 0;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__databaseLock);
}

- (unint64_t)_numberOfSkipsUsedWithSkipTimestamps:(id)a3 currentTimestamp:(double)a4 skipInterval:(double)a5 returningEarliestSkipTimestamp:(double *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10)
  {
    unint64_t v12 = 0;
    double v14 = 1.79769313e308;
    if (!a6) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  uint64_t v11 = v10;
  unint64_t v12 = 0;
  uint64_t v13 = *(void *)v21;
  double v14 = 1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v9);
      }
      [*(id *)(*((void *)&v20 + 1) + 8 * i) doubleValue];
      if (v16 < v14) {
        double v14 = v16;
      }
      if (a4 - v16 < a5) {
        ++v12;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v11);
  if (a6)
  {
LABEL_13:
    uint64_t v17 = [v9 count];
    double v18 = 0.0;
    if (v17) {
      double v18 = v14;
    }
    *a6 = v18;
  }
LABEL_16:

  return v12;
}

- (void)_defaultRadioModelInitialization
{
  uint64_t v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Radio.RadioModel.accessSerialQueue", 0);
  accessSerialQueue = self->_accessSerialQueue;
  self->_accessSerialQueue = v3;

  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __46__RadioModel__defaultRadioModelInitialization__block_invoke;
  handler[3] = &unk_2643A9F38;
  handler[4] = self;
  uint64_t v5 = MEMORY[0x263EF83A0];
  self->_modelChangedTokenIsValid = notify_register_dispatch("com.apple.Radio.model-changed", &self->_modelChangedToken, MEMORY[0x263EF83A0], handler) == 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__RadioModel__defaultRadioModelInitialization__block_invoke_300;
  v8[3] = &unk_2643A9F38;
  v8[4] = self;
  uint32_t v6 = notify_register_dispatch("com.apple.Radio.model-deleted", &self->_modelDeletedToken, v5, v8);

  self->_modelDeletedTokenIsValid = v6 == 0;
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__contextDidSaveNotification_ name:*MEMORY[0x263EFF040] object:0];
}

void __46__RadioModel__defaultRadioModelInitialization__block_invoke(uint64_t a1, int token)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  uint64_t v3 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = state64;
    _os_log_impl(&dword_21B56B000, v3, OS_LOG_TYPE_INFO, "[RadioModel] Model changed with pid: %i", buf, 8u);
  }

  uint64_t v4 = state64;
  pid_t v5 = getpid();
  uint64_t v6 = v5;
  if (*(void *)(*(void *)(a1 + 32) + 48)) {
    BOOL v7 = v4 == v5;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    id v8 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B56B000, v8, OS_LOG_TYPE_INFO, "[RadioModel] Rebuilding model for external change...", buf, 2u);
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = (void *)v9[6];
    if (v10 && v4 != v6)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __46__RadioModel__defaultRadioModelInitialization__block_invoke_295;
      v13[3] = &unk_2643AA648;
      v13[4] = v9;
      [v10 performBlockAndWait:v13];
      id v9 = *(void **)(a1 + 32);
    }
    [v9 _prepareModel];
    uint64_t v11 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v16 = @"RadioModelDidChangeNotification";
      _os_log_impl(&dword_21B56B000, v11, OS_LOG_TYPE_INFO, "[RadioModel] Posting '%@' due to an external change", buf, 0xCu);
    }

    unint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 postNotificationName:@"RadioModelDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

void __46__RadioModel__defaultRadioModelInitialization__block_invoke_300(uint64_t a1, int token)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  uint64_t v3 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = state64;
    _os_log_impl(&dword_21B56B000, v3, OS_LOG_TYPE_INFO, "[RadioModel] Model deleted with pid: %i", buf, 8u);
  }

  uint64_t v4 = state64;
  uint64_t v5 = getpid();
  uint64_t v6 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B56B000, v6, OS_LOG_TYPE_INFO, "[RadioModel] Rebuilding model for external deletion...", buf, 2u);
  }

  BOOL v7 = *(void **)(a1 + 32);
  id v8 = (void *)v7[6];
  if (v8) {
    BOOL v9 = v4 == v5;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46__RadioModel__defaultRadioModelInitialization__block_invoke_301;
    v13[3] = &unk_2643AA648;
    v13[4] = v7;
    [v8 performBlockAndWait:v13];
    BOOL v7 = *(void **)(a1 + 32);
  }
  [v7 _prepareModel];
  uint64_t v10 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    double v16 = @"RadioModelWasDeletedNotification";
    __int16 v17 = 2112;
    double v18 = @"RadioModelDidChangeNotification";
    _os_log_impl(&dword_21B56B000, v10, OS_LOG_TYPE_INFO, "[RadioModel] Posting '%@', '%@' due to an external deletion", buf, 0x16u);
  }

  uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"RadioModelWasDeletedNotification" object:*(void *)(a1 + 32)];

  unint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"RadioModelDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __46__RadioModel__defaultRadioModelInitialization__block_invoke_301(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetModel];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
}

void __46__RadioModel__defaultRadioModelInitialization__block_invoke_295(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetModel];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
}

- (void)_beginBackgroundTaskAssertion
{
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__RadioModel__beginBackgroundTaskAssertion__block_invoke;
  block[3] = &unk_2643AA648;
  block[4] = self;
  dispatch_sync(accessSerialQueue, block);
}

void __43__RadioModel__beginBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  ++*(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[5];
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    uint64_t v2 = *(void **)(a1 + 32);
  }
  if ((uint64_t)v2[4] >= 1 && !v2[3])
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    id v7 = objc_alloc(MEMORY[0x263F28180]);
    uint64_t v8 = getpid();
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    long long v21 = __43__RadioModel__beginBackgroundTaskAssertion__block_invoke_2;
    long long v22 = &unk_2643A9F10;
    uint64_t v24 = &v25;
    BOOL v9 = v6;
    long long v23 = v9;
    uint64_t v10 = [v7 initWithPID:v8 flags:21 reason:4 name:@"RadioModelSaveAssertion" withHandler:&v19];
    uint64_t v11 = *(void *)(a1 + 32);
    unint64_t v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v13 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v14;
      _os_log_impl(&dword_21B56B000, v13, OS_LOG_TYPE_INFO, "[RadioModel] Obtained process assertion for model %@", buf, 0xCu);
    }

    if (!*((unsigned char *)v26 + 24))
    {
      uint64_t v15 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v16;
        _os_log_impl(&dword_21B56B000, v15, OS_LOG_TYPE_INFO, "[RadioModel] Failed to acquire process assertion for model %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "invalidate", v19, v20, v21, v22);
      uint64_t v17 = *(void *)(a1 + 32);
      double v18 = *(void **)(v17 + 24);
      *(void *)(v17 + 24) = 0;
    }
    _Block_object_dispose(&v25, 8);
  }
}

intptr_t __43__RadioModel__beginBackgroundTaskAssertion__block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_arrayByReplacingManagedObjectsInArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v12 = [[RadioStation alloc] initWithModel:self managedObject:v11];
            [v5 addObject:v12];
          }
          else
          {
            objc_msgSend(v5, "addObject:", v11, (void)v14);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setDatabaseVersion:(int64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lli", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(RadioModel *)self _setDatabasePropertyValue:v4 forKey:@"databaseVersion"];
}

- (int64_t)databaseVersion
{
  uint64_t v2 = [(RadioModel *)self _databasePropertyValueForKey:@"databaseVersion"];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (id)context
{
  return self->_context;
}

- (NSArray)userStations
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__48;
  uint64_t v10 = __Block_byref_object_dispose__49;
  id v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__RadioModel_userStations__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __26__RadioModel_userStations__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) fetchedObjects];
  if (!v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 88);
    id v21 = 0;
    uint64_t v4 = [v3 performFetch:&v21];
    id v5 = v21;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v5;
        _os_log_impl(&dword_21B56B000, v6, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to fetch stations (%@.)", buf, 0xCu);
      }
    }
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) fetchedObjects];
  }
  if ([v2 count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v2;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v13, "stationID", (void)v17)) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    uint64_t v14 = [*(id *)(a1 + 32) _arrayByReplacingManagedObjectsInArray:v7];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (id)stationWithStationStringID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v4, @"stationStringID", 0);
    uint64_t v6 = [(NSManagedObjectModel *)self->_model fetchRequestFromTemplateWithName:@"StationStringIDToStation" substitutionVariables:v5];
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__48;
    long long v17 = __Block_byref_object_dispose__49;
    id v18 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__RadioModel_stationWithStationStringID___block_invoke;
    v10[3] = &unk_2643A9EE8;
    v10[4] = self;
    id v7 = v6;
    id v11 = v7;
    unint64_t v12 = &v13;
    [(RadioModel *)self performTransactionWithBlock:v10];
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __41__RadioModel_stationWithStationStringID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) executeFetchRequest:a1[5] error:0];
  id v6 = [v2 lastObject];

  if (v6)
  {
    id v3 = [[RadioStation alloc] initWithModel:a1[4] managedObject:v6];
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)stationWithPersistentID:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF260]);
  id v6 = [(NSManagedObjectModel *)self->_model entitiesByName];
  id v7 = [v6 objectForKey:@"Station"];
  [v5 setEntity:v7];

  id v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"persistent_id == %lli", a3);
  [v5 setPredicate:v8];

  uint64_t v9 = +[RadioManagedStation defaultPropertiesToFetch];
  uint64_t v10 = (void *)[v9 mutableCopy];
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  }
  uint64_t v13 = v12;

  if (([v13 containsObject:@"persistent_id"] & 1) == 0) {
    [v13 addObject:@"persistent_id"];
  }
  [v5 setPropertiesToFetch:v13];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__48;
  id v24 = __Block_byref_object_dispose__49;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __38__RadioModel_stationWithPersistentID___block_invoke;
  v17[3] = &unk_2643A9EE8;
  v17[4] = self;
  id v14 = v5;
  id v18 = v14;
  long long v19 = &v20;
  [(RadioModel *)self performTransactionWithBlock:v17];
  id v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __38__RadioModel_stationWithPersistentID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) executeFetchRequest:a1[5] error:0];
  id v6 = [v2 lastObject];

  if (v6)
  {
    id v3 = [[RadioStation alloc] initWithModel:a1[4] managedObject:v6];
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)stationWithID:(int64_t)a3
{
  id v5 = objc_alloc(NSDictionary);
  id v6 = [NSNumber numberWithLongLong:a3];
  id v7 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, @"stationID", 0);

  id v8 = [(NSManagedObjectModel *)self->_model fetchRequestFromTemplateWithName:@"StationIDToStation" substitutionVariables:v7];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__48;
  long long v19 = __Block_byref_object_dispose__49;
  id v20 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __28__RadioModel_stationWithID___block_invoke;
  v12[3] = &unk_2643A9EE8;
  v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  id v14 = &v15;
  [(RadioModel *)self performTransactionWithBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __28__RadioModel_stationWithID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) executeFetchRequest:a1[5] error:0];
  id v6 = [v2 lastObject];

  if (v6)
  {
    id v3 = [[RadioStation alloc] initWithModel:a1[4] managedObject:v6];
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)stationWithHash:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v4, @"stationHash", 0);
    id v6 = [(NSManagedObjectModel *)self->_model fetchRequestFromTemplateWithName:@"StationHashToStation" substitutionVariables:v5];
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__48;
    uint64_t v17 = __Block_byref_object_dispose__49;
    id v18 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __30__RadioModel_stationWithHash___block_invoke;
    v10[3] = &unk_2643A9EE8;
    v10[4] = self;
    id v7 = v6;
    id v11 = v7;
    id v12 = &v13;
    [(RadioModel *)self performTransactionWithBlock:v10];
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __30__RadioModel_stationWithHash___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) executeFetchRequest:a1[5] error:0];
  id v6 = [v2 lastObject];

  if (v6)
  {
    id v3 = [[RadioStation alloc] initWithModel:a1[4] managedObject:v6];
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (NSArray)stationSortOrdering
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  uint64_t v4 = [(RadioModel *)self userStations];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(RadioModel *)self userStations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "stationID"));
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (void)setTrackPlaybackDescriptorQueue:(id)a3 forStation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 model];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__RadioModel_setTrackPlaybackDescriptorQueue_forStation___block_invoke;
  v10[3] = &unk_2643AA1C0;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 performWriteTransactionWithBlock:v10];
}

uint64_t __57__RadioModel_setTrackPlaybackDescriptorQueue_forStation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTrackPlaybackDescriptorQueue:*(void *)(a1 + 40)];
}

- (void)setStationSortOrdering:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__RadioModel_setStationSortOrdering___block_invoke;
  v8[3] = &unk_2643AA648;
  v8[4] = self;
  [(RadioModel *)self performTransactionWithBlock:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__RadioModel_setStationSortOrdering___block_invoke_2;
  v6[3] = &unk_2643AA1C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(RadioModel *)self performWriteTransactionWithBlock:v6];
}

uint64_t __37__RadioModel_setStationSortOrdering___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) processPendingChanges];
}

void __37__RadioModel_setStationSortOrdering___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userStations];
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v2];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = objc_msgSend(*(id *)(a1 + 32), "stationWithID:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "longLongValue"));
        id v11 = v10;
        if (v10)
        {
          [v10 setSortOrder:v7];
          [v3 removeObject:v11];
          uint64_t v7 = (v7 + 1);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
  else
  {
    LODWORD(v7) = 0;
  }

  id v12 = [v3 allObjects];
  long long v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_236];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "setSortOrder:", v7 + j, (void)v19);
      }
      LODWORD(v7) = v7 + j;
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

uint64_t __37__RadioModel_setStationSortOrdering___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6 options:1];
  return v7;
}

- (void)setReportProblemIssueTypes:(id)a3
{
  if (a3)
  {
    id v5 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:0 error:0];
    id v4 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    [(RadioModel *)self _setDatabasePropertyValue:v4 forKey:@"reportProblemIssueTypes"];
  }
  else
  {
    -[RadioModel _setDatabasePropertyValue:forKey:](self, "_setDatabasePropertyValue:forKey:");
  }
}

- (void)setGlobalVersion:(unint64_t)a3
{
  if ([(RadioModel *)self globalVersion] != a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lli", a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(RadioModel *)self _setDatabasePropertyValue:v5 forKey:@"globalVersion"];
  }
}

- (void)setGlobalHash:(id)a3
{
}

- (void)setAuthenticatedAccountIdentifier:(unint64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lli", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioModel _setDatabasePropertyValue:forKey:](self, "_setDatabasePropertyValue:forKey:");
  if (!a3) {
    [(id)objc_opt_class() _postAccountDidDeauthenticateNotification];
  }
}

- (NSArray)reportProblemIssueTypes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(RadioModel *)self _databasePropertyValueForKey:@"reportProblemIssueTypes"];
  id v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x263F08900];
    id v5 = [v2 dataUsingEncoding:4];
    uint64_t v6 = [v4 JSONObjectWithData:v5 options:0 error:0];

    objc_opt_class();
    id v7 = 0;
    if (objc_opt_isKindOfClass())
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              id v7 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
LABEL_14:
  }
  else
  {
    id v7 = 0;
  }

  return (NSArray *)v7;
}

- (NSArray)previewStations
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__48;
  uint64_t v10 = __Block_byref_object_dispose__49;
  id v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__RadioModel_previewStations__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __29__RadioModel_previewStations__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) fetchedObjects];
  if (!v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 88);
    id v21 = 0;
    uint64_t v4 = [v3 performFetch:&v21];
    id v5 = v21;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v5;
        _os_log_impl(&dword_21B56B000, v6, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to fetch stations (%@.)", buf, 0xCu);
      }
    }
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) fetchedObjects];
  }
  if ([v2 count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v2;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v13, "isPreview", (void)v17)) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    uint64_t v14 = [*(id *)(a1 + 32) _arrayByReplacingManagedObjectsInArray:v7];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (void)performWriteTransactionWithBlock:(id)a3
{
}

- (void)performTransactionWithBlock:(id)a3
{
}

- (id)newStationWithDictionary:(id)a3
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21B56B000, v4, OS_LOG_TYPE_INFO, "[RadioModel] Adding/updating station with dictionary: %@", (uint8_t *)&buf, 0xCu);
  }

  v105 = [v3 objectForKey:@"station-id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v103 = [v105 longLongValue];
  }
  else {
    uint64_t v103 = 0;
  }
  v106 = [v3 objectForKey:@"station-hash"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v106 = 0;
  }
  v107 = [v3 objectForKey:@"radio-station-id"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v107 = 0;
  }
  if (!v103 && !v106 && !v107)
  {
    id v5 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_21B56B000, v5, OS_LOG_TYPE_ERROR, "Missing station-id/station-hash/radio-station-id in dictionary: %@", (uint8_t *)&buf, 0xCu);
    }

    id v6 = 0;
    goto LABEL_145;
  }
  uint64_t v154 = 0;
  id v90 = [v3 objectForKey:@"persistent-id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    sscanf((const char *)[v90 UTF8String], "%llx", &v154);
  }
  v89 = [v3 objectForKey:@"adam-id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v69 = [v89 longLongValue];
  }
  else {
    uint64_t v69 = 0;
  }
  id v7 = [v3 objectForKey:@"name"];
  v98 = (void *)[v7 copy];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v98 = 0;
  }
  id v8 = [v3 objectForKey:@"description"];
  v96 = (void *)[v8 copy];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v96 = 0;
  }
  uint64_t v9 = [v3 objectForKey:@"core-seed-name"];
  v94 = (void *)[v9 copy];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v94 = 0;
  }
  v93 = [v3 objectForKey:@"seeds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v93 = 0;
  }
  v88 = [v3 objectForKey:@"mix-type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = (int)[v88 intValue];
  }
  else {
    uint64_t v10 = 1;
  }
  uint64_t v68 = v10;
  uint64_t v11 = [v3 objectForKey:@"skip-identifier"];
  v92 = (void *)[v11 copy];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v92 = 0;
  }
  v102 = [v3 objectForKey:@"rules"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v102 objectForKey:@"edit-enabled"];
    if (objc_opt_respondsToSelector()) {
      char v67 = [v12 BOOLValue];
    }
    else {
      char v67 = 1;
    }
    v91 = [v102 objectForKey:@"edit-fields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v152 = 0u;
      long long v153 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      uint64_t v14 = (void *)[v91 copy];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v150 objects:v160 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v151;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v151 != v16) {
              objc_enumerationMutation(v14);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_51;
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v150 objects:v160 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v14 = v91;
LABEL_51:
      v91 = 0;
    }

    long long v18 = [v102 objectForKey:@"like-enabled"];
    if (objc_opt_respondsToSelector()) {
      char v66 = [v18 BOOLValue];
    }
    else {
      char v66 = 0;
    }
    long long v19 = [v102 objectForKey:@"skip-enabled"];
    if (objc_opt_respondsToSelector()) {
      char v65 = [v19 BOOLValue];
    }
    else {
      char v65 = 1;
    }
    long long v20 = [v102 objectForKey:@"skip-rules"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v21 = [v20 objectForKey:@"interval-in-seconds"];
      double v13 = 0.0;
      if (objc_opt_respondsToSelector()) {
        double v13 = (double)(int)[v21 intValue];
      }
      long long v22 = [v20 objectForKey:@"frequency"];
      if (objc_opt_respondsToSelector()) {
        int v64 = [v22 intValue];
      }
      else {
        int v64 = 0;
      }
    }
    else
    {
      int v64 = 0;
      double v13 = 0.0;
    }
    long long v23 = [v102 objectForKey:@"sharing-enabled"];
    if (objc_opt_respondsToSelector()) {
      char v63 = [v23 BOOLValue];
    }
    else {
      char v63 = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
    char v63 = 0;
    int v64 = 0;
    v91 = 0;
    char v65 = 1;
    char v66 = 0;
    double v13 = 0.0;
    char v67 = 1;
  }
  id v101 = [v3 objectForKey:@"artwork"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v25 = 0;
    id v24 = v101;
    id v101 = 0;
    goto LABEL_74;
  }
  if (v101)
  {
    id v24 = [MEMORY[0x263F08AC0] dataWithPropertyList:v101 format:200 options:0 error:0];
    uint64_t v25 = v24;
LABEL_74:

    goto LABEL_75;
  }
  uint64_t v25 = 0;
  id v101 = 0;
LABEL_75:
  v87 = [v3 objectForKey:@"artwork-url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = [NSURL URLWithString:v87];
  }
  else
  {
    id v26 = 0;
  }
  v86 = [v3 objectForKey:@"virtual-play"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v27 = [v86 BOOLValue];
  }
  else {
    char v27 = 1;
  }
  v85 = [v3 objectForKey:@"ad-data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v28 = [MEMORY[0x263F08AC0] dataWithPropertyList:v85 format:200 options:0 error:0];
  }
  else
  {
    char v28 = 0;
  }
  if (![v28 length])
  {
    uint64_t v29 = [v3 objectForKey:@"iAd-data"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v28 = v29;
    }
    else
    {

      char v28 = 0;
    }
  }
  v84 = [v3 objectForKey:@"is-explicit"];
  if (objc_opt_respondsToSelector()) {
    char v62 = [v84 BOOLValue];
  }
  else {
    char v62 = 0;
  }
  v83 = [v3 objectForKey:@"is-featured"];
  objc_opt_class();
  char v30 = objc_opt_isKindOfClass();
  if (v30) {
    char v61 = [v83 BOOLValue];
  }
  else {
    char v61 = 0;
  }
  v82 = [v3 objectForKey:@"is-iad-gateway-video-enabled"];
  if (objc_opt_respondsToSelector()) {
    char v60 = [v82 BOOLValue];
  }
  else {
    char v60 = 0;
  }
  v81 = [v3 objectForKey:@"is-sponsored"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v59 = [v81 BOOLValue];
  }
  else {
    char v59 = 0;
  }
  v80 = [v3 objectForKey:@"impression-threshold"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v58 = [v80 unsignedIntegerValue];
  }
  else {
    uint64_t v58 = 0;
  }
  v79 = [v3 objectForKey:@"is-premium-placement"];
  if (objc_opt_respondsToSelector()) {
    char v57 = [v79 BOOLValue];
  }
  else {
    char v57 = 0;
  }
  v78 = [v3 objectForKey:@"preview-only"];
  if (objc_opt_respondsToSelector()) {
    char v56 = [v78 BOOLValue];
  }
  else {
    char v56 = 0;
  }
  v77 = [v3 objectForKey:@"requires-subscription"];
  if (objc_opt_respondsToSelector()) {
    char v55 = [v77 BOOLValue];
  }
  else {
    char v55 = 0;
  }
  uint64_t v31 = [v3 objectForKey:@"stream-url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = [NSURL URLWithString:v31];
  }
  else
  {
    v54 = 0;
  }
  v76 = [v3 objectForKey:@"stream-key-cert-url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v53 = [NSURL URLWithString:v76];
  }
  else
  {
    v53 = 0;
  }
  v75 = [v3 objectForKey:@"stream-key-server-url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = [NSURL URLWithString:v75];
  }
  else
  {
    v52 = 0;
  }
  v74 = [v3 objectForKey:@"is-shared"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v51 = [v74 BOOLValue];
  }
  else {
    char v51 = 0;
  }
  uint64_t v73 = [v3 objectForKey:@"is-subscribed"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v50 = [v73 BOOLValue];
  }
  else {
    char v50 = 0;
  }
  v72 = [v3 objectForKey:@"subscriber-count"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v32 = [v72 intValue];
  }
  else {
    int v32 = 0;
  }
  long long v33 = [v3 objectForKey:@"share-token"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    long long v33 = 0;
  }
  long long v34 = [v3 objectForKey:@"debug-dict"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    long long v34 = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v156 = 0x3032000000;
  v157 = __Block_byref_object_copy__48;
  v158 = __Block_byref_object_dispose__49;
  if (!v103)
  {
    uint64_t v35 = 0;
    id v159 = 0;
LABEL_139:
    if (v154)
    {
      uint64_t v36 = -[RadioModel stationWithPersistentID:](self, "stationWithPersistentID:");
      long long v37 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v36;

      uint64_t v35 = *(void *)(*((void *)&buf + 1) + 40);
    }
    goto LABEL_141;
  }
  -[RadioModel stationWithID:](self, "stationWithID:");
  id v159 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v35 = *(void *)(*((void *)&buf + 1) + 40);
  if (!v35) {
    goto LABEL_139;
  }
LABEL_141:
  if (!v35 && v107)
  {
    uint64_t v38 = [(RadioModel *)self stationWithStationStringID:v107];
    v39 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v38;
  }
  v108[0] = MEMORY[0x263EF8330];
  v108[1] = 3221225472;
  v108[2] = __39__RadioModel_newStationWithDictionary___block_invoke;
  v108[3] = &unk_2643A9EA0;
  p_long long buf = &buf;
  v108[4] = self;
  uint64_t v126 = v103;
  id v109 = v106;
  uint64_t v127 = v69;
  id v70 = v26;
  id v110 = v70;
  id v49 = v25;
  id v111 = v49;
  id v40 = v98;
  id v112 = v40;
  id v47 = v96;
  id v113 = v47;
  id v48 = v94;
  id v114 = v48;
  id v95 = v93;
  id v115 = v95;
  char v134 = v67;
  id v99 = v91;
  id v116 = v99;
  char v135 = isKindOfClass & 1;
  char v136 = v66;
  char v137 = v55;
  char v138 = v65;
  int v132 = v64;
  id v97 = v92;
  id v117 = v97;
  double v128 = v13;
  char v139 = v27;
  uint64_t v129 = v68;
  char v140 = v30 & 1;
  char v141 = v61;
  char v142 = v62;
  char v143 = v60;
  char v144 = v59;
  id v104 = v28;
  id v118 = v104;
  uint64_t v130 = v58;
  char v145 = v57;
  char v146 = v56;
  id v119 = v107;
  id v41 = v54;
  id v120 = v41;
  id v42 = v53;
  id v121 = v42;
  id v43 = v52;
  id v122 = v43;
  char v147 = v51;
  char v148 = v50;
  int v133 = v32;
  id v44 = v33;
  id v123 = v44;
  char v149 = v63;
  id v45 = v34;
  id v124 = v45;
  uint64_t v131 = v154;
  [(RadioModel *)self performWriteTransactionWithBlock:v108];
  id v6 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
LABEL_145:

  return v6;
}

uint64_t __39__RadioModel_newStationWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 168) + 8) + 40);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF280]);
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 96) entity];
    id v5 = (void *)[v3 initWithEntity:v4 insertIntoManagedObjectContext:*(void *)(*(void *)(a1 + 32) + 48)];

    if (v5)
    {
      [v5 setSortOrder:0xFFFFFFFFLL];
      id v6 = [[RadioStation alloc] initWithModel:*(void *)(a1 + 32) managedObject:v5];
      uint64_t v7 = *(void *)(*(void *)(a1 + 168) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 168) + 8) + 40);
  }
  [v2 setStationID:*(void *)(a1 + 176)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setStationHash:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setAdamID:*(void *)(a1 + 184)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setArtworkURL:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setArtworkURLData:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setName:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setStationDescription:*(void *)(a1 + 72)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setCoreSeedName:*(void *)(a1 + 80)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSeedTracks:*(void *)(a1 + 88)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setEditEnabled:*(unsigned __int8 *)(a1 + 232)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setEditableFields:*(void *)(a1 + 96)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setHasSkipRules:*(unsigned __int8 *)(a1 + 233)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setLikesEnabled:*(unsigned __int8 *)(a1 + 234)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setRequiresSubscription:*(unsigned __int8 *)(a1 + 235)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSkipEnabled:*(unsigned __int8 *)(a1 + 236)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSkipFrequency:*(unsigned int *)(a1 + 224)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSkipIdentifier:*(void *)(a1 + 104)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSkipInterval:*(double *)(a1 + 192)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setVirtualPlayEnabled:*(unsigned __int8 *)(a1 + 237)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSongMixType:*(void *)(a1 + 200)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setAdData:*(void *)(a1 + 112)];
  if (*(unsigned char *)(a1 + 238)) {
    [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setFeatured:*(unsigned __int8 *)(a1 + 239)];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setIsExplicit:*(unsigned __int8 *)(a1 + 240)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setGatewayVideoAdEnabled:*(unsigned __int8 *)(a1 + 241)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSponsored:*(unsigned __int8 *)(a1 + 242)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setImpressionThreshold:*(void *)(a1 + 208)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setPremiumPlacement:*(unsigned __int8 *)(a1 + 243)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setPreviewOnly:*(unsigned __int8 *)(a1 + 244)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setStationStringID:*(void *)(a1 + 120)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setStreamURL:*(void *)(a1 + 128)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setStreamCertificateURL:*(void *)(a1 + 136)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setStreamKeyURL:*(void *)(a1 + 144)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setShared:*(unsigned __int8 *)(a1 + 245)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSubscribed:*(unsigned __int8 *)(a1 + 246)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSubscriberCount:*(unsigned int *)(a1 + 228)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setShareToken:*(void *)(a1 + 152)];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setSharingEnabled:*(unsigned __int8 *)(a1 + 247)];
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setDebugDictionary:*(void *)(a1 + 160)];
  if (*(void *)(a1 + 216))
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 168) + 8) + 40);
    return objc_msgSend(v10, "setPersistentID:");
  }
  return result;
}

- (id)newPreviewStationWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__48;
  uint64_t v15 = __Block_byref_object_dispose__49;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__RadioModel_newPreviewStationWithDictionary___block_invoke;
  v8[3] = &unk_2643A9EE8;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(RadioModel *)self performWriteTransactionWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __46__RadioModel_newPreviewStationWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) newStationWithDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setStationID:0];
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return [v5 setSortOrder:0];
}

- (id)newFeaturedStationWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__48;
  uint64_t v15 = __Block_byref_object_dispose__49;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__RadioModel_newFeaturedStationWithDictionary___block_invoke;
  v8[3] = &unk_2643A9EE8;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(RadioModel *)self performWriteTransactionWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __47__RadioModel_newFeaturedStationWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) newStationWithDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isSponsored];
  if ((result & 1) == 0)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    return [v6 setFeatured:1];
  }
  return result;
}

- (unint64_t)globalVersion
{
  uint64_t v2 = [(RadioModel *)self _databasePropertyValueForKey:@"globalVersion"];
  unint64_t v3 = [v2 longLongValue];

  return v3;
}

- (NSString)globalHash
{
  uint64_t v2 = [(RadioModel *)self _databasePropertyValueForKey:@"globalHash"];
  unint64_t v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSArray)featuredStations
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__48;
  uint64_t v10 = __Block_byref_object_dispose__49;
  id v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__RadioModel_featuredStations__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __30__RadioModel_featuredStations__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) fetchedObjects];
  if (!v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 88);
    id v21 = 0;
    uint64_t v4 = [v3 performFetch:&v21];
    id v5 = v21;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v24 = v5;
        _os_log_impl(&dword_21B56B000, v6, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to fetch stations (%@.)", buf, 0xCu);
      }
    }
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) fetchedObjects];
  }
  if ([v2 count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v2;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (!objc_msgSend(v13, "stationID", (void)v17)
            && (([v13 isFeatured] & 1) != 0 || objc_msgSend(v13, "isSponsored")))
          {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    uint64_t v14 = [*(id *)(a1 + 32) _arrayByReplacingManagedObjectsInArray:v7];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (void)deleteStation:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21B56B000, v5, OS_LOG_TYPE_INFO, "[RadioModel] Deleting station: %@", buf, 0xCu);
    }

    uint64_t v6 = [v4 model];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__RadioModel_deleteStation___block_invoke;
    v7[3] = &unk_2643AA1C0;
    v7[4] = self;
    id v8 = v4;
    [v6 performWriteTransactionWithBlock:v7];
  }
}

void __28__RadioModel_deleteStation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v2 = [*(id *)(a1 + 40) managedObject];
  [v1 deleteObject:v2];
}

- (void)deleteStationWithID:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__RadioModel_deleteStationWithID___block_invoke;
  v3[3] = &unk_2643AA0F8;
  v3[4] = self;
  v3[5] = a3;
  [(RadioModel *)self performWriteTransactionWithBlock:v3];
}

void __34__RadioModel_deleteStationWithID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 stationWithID:*(void *)(a1 + 40)];
  [v1 deleteStation:v2];
}

- (void)deleteAllData
{
  id v2 = objc_opt_class();
  [v2 deleteAllData];
}

- (id)convertObjectsInSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = [(RadioModel *)self convertObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10)
        {
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          }
          [v7 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)convertObjects:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = [(RadioModel *)self convertObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10)
        {
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v7 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)convertObject:(id)a3
{
  id v5 = a3;
  uint64_t v37 = 0;
  uint64_t v38 = (id *)&v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__48;
  id v41 = __Block_byref_object_dispose__49;
  id v42 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 managedObjectContext];
    id v7 = v6;
    if (v6 && ![v6 isEqual:self->_context])
    {
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __28__RadioModel_convertObject___block_invoke;
      v33[3] = &unk_2643A9EE8;
      uint64_t v35 = self;
      uint64_t v36 = &v37;
      id v34 = v5;
      [(RadioModel *)self performTransactionWithBlock:v33];
      id v10 = v34;
    }
    else
    {
      uint64_t v8 = v38;
      id v9 = v5;
      id v10 = v8[5];
      void v8[5] = v9;
    }
  }
  else if ([v5 conformsToProtocol:&unk_26CB5F410])
  {
    if ([v5 isDatabaseBacked])
    {
      uint64_t v27 = 0;
      char v28 = &v27;
      uint64_t v29 = 0x3032000000;
      char v30 = __Block_byref_object_copy__48;
      uint64_t v31 = __Block_byref_object_dispose__49;
      id v32 = 0;
      uint64_t v11 = [v5 managedObject];
      long long v12 = v11;
      if (v11)
      {
        long long v13 = [v11 managedObjectContext];
        int v14 = [v13 isEqual:self->_context];

        if (v14)
        {
          objc_storeStrong(v38 + 5, a3);
        }
        else
        {
          uint64_t v20 = MEMORY[0x263EF8330];
          uint64_t v21 = 3221225472;
          long long v22 = __28__RadioModel_convertObject___block_invoke_2;
          long long v23 = &unk_2643A9EE8;
          id v26 = &v27;
          id v24 = self;
          id v25 = v12;
          [(RadioModel *)self performTransactionWithBlock:&v20];
          if (v28[5])
          {
            id v17 = objc_alloc((Class)objc_opt_class());
            uint64_t v18 = objc_msgSend(v17, "initWithModel:managedObject:", self, v28[5], v20, v21, v22, v23, v24);
            id v19 = v38[5];
            v38[5] = (id)v18;
          }
        }
      }

      _Block_object_dispose(&v27, 8);
    }
    else
    {
      objc_storeStrong(v38 + 5, a3);
    }
  }
  id v15 = v38[5];
  _Block_object_dispose(&v37, 8);

  return v15;
}

void __28__RadioModel_convertObject___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) objectID];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 48) existingObjectWithID:v5 error:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __28__RadioModel_convertObject___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = [*(id *)(a1 + 40) objectID];
  uint64_t v3 = [v2 existingObjectWithID:v6 error:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unint64_t)authenticatedAccountIdentifier
{
  uint64_t v2 = [(RadioModel *)self _databasePropertyValueForKey:@"accountIdentifier"];
  unint64_t v3 = [v2 longLongValue];

  return v3;
}

- (NSArray)allStations
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__48;
  id v10 = __Block_byref_object_dispose__49;
  id v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__RadioModel_allStations__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  [(NSManagedObjectContext *)context performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __25__RadioModel_allStations__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) fetchedObjects];
  if (!v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 88);
    id v10 = 0;
    uint64_t v4 = [v3 performFetch:&v10];
    id v5 = v10;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = os_log_create("com.apple.amp.radio", "Model");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_21B56B000, v6, OS_LOG_TYPE_ERROR, "[RadioModel] Error: Unable to fetch stations (%@.)", buf, 0xCu);
      }
    }
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) fetchedObjects];
  }
  if ([v2 count])
  {
    uint64_t v7 = [*(id *)(a1 + 32) _arrayByReplacingManagedObjectsInArray:v2];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (void)_contextDidSaveNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  uint64_t v6 = [(NSManagedObjectContext *)v5 persistentStoreCoordinator];
  int v7 = [v6 isEqual:self->_storeCoordinator];

  if (v7)
  {
    context = self->_context;
    if (v5 == context)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __42__RadioModel__contextDidSaveNotification___block_invoke_3;
      v10[3] = &unk_2643AA1C0;
      void v10[4] = self;
      id v9 = &v11;
      id v11 = v4;
      dispatch_async(MEMORY[0x263EF83A0], v10);
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __42__RadioModel__contextDidSaveNotification___block_invoke;
      v12[3] = &unk_2643AA1C0;
      v12[4] = self;
      id v9 = &v13;
      id v13 = v4;
      [(NSManagedObjectContext *)context performBlock:v12];
    }
  }
}

void __42__RadioModel__contextDidSaveNotification___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__RadioModel__contextDidSaveNotification___block_invoke_2;
  v3[3] = &unk_2643AA1C0;
  uint64_t v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __42__RadioModel__contextDidSaveNotification___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postContextDidChangeNotification:*(void *)(a1 + 40)];
}

uint64_t __42__RadioModel__contextDidSaveNotification___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postContextDidChangeNotification:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFF040] object:0];
  [(NSOperationQueue *)self->_backgroundCleanupQueue cancelAllOperations];
  backgroundTaskInvalidateTimerSource = self->_backgroundTaskInvalidateTimerSource;
  if (backgroundTaskInvalidateTimerSource) {
    dispatch_source_cancel(backgroundTaskInvalidateTimerSource);
  }
  [(BKSProcessAssertion *)self->_backgroundProcessAssertion invalidate];
  if (self->_modelChangedTokenIsValid) {
    notify_cancel(self->_modelChangedToken);
  }
  if (self->_modelDeletedTokenIsValid) {
    notify_cancel(self->_modelDeletedToken);
  }
  [(NSFetchedResultsController *)self->_stationFetchedResultsController setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)RadioModel;
  [(RadioModel *)&v5 dealloc];
}

- (id)_initBackgroundModelWithPersistentStoreCoordinator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RadioModel;
  uint64_t v6 = [(RadioModel *)&v11 init];
  int v7 = v6;
  if (v6)
  {
    [(RadioModel *)v6 _defaultRadioModelInitialization];
    v7->_isBackgroundModel = 1;
    objc_storeStrong((id *)&v7->_storeCoordinator, a3);
    uint64_t v8 = [(NSPersistentStoreCoordinator *)v7->_storeCoordinator managedObjectModel];
    model = v7->_model;
    v7->_model = (NSManagedObjectModel *)v8;

    [(RadioModel *)v7 _prepareModel];
  }

  return v7;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)RadioModel;
  uint64_t v2 = [(RadioModel *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(RadioModel *)v2 _defaultRadioModelInitialization];
    [(RadioModel *)v3 _prepareModel];
  }
  return v3;
}

- (RadioModel)init
{
  return 0;
}

+ (id)_radioDirectoryPath
{
  if (_radioDirectoryPath_sOnceToken != -1) {
    dispatch_once(&_radioDirectoryPath_sOnceToken, &__block_literal_global_284);
  }
  uint64_t v2 = (void *)_radioDirectoryPath_sRadioDirectory;
  return v2;
}

uint64_t __33__RadioModel__radioDirectoryPath__block_invoke()
{
  _radioDirectoryPath_sRadioDirectory = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Media/Radio"];
  return MEMORY[0x270F9A758]();
}

+ (id)_radioDatabasePath
{
  uint64_t v2 = [a1 _radioDirectoryPath];
  id v3 = [v2 stringByAppendingPathComponent:@"Radio.db"];

  return v3;
}

+ (void)_postAccountDidDeauthenticateNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.Radio.account.did-deauthenticate", 0, 0, 1u);
}

+ (id)_persistentStoreConfigurationOptions
{
  v8[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFF158];
  v7[0] = *MEMORY[0x263EFF160];
  v7[1] = v2;
  v8[0] = &unk_26CB5DE98;
  v8[1] = MEMORY[0x263EFFA88];
  uint64_t v3 = *MEMORY[0x263EFF008];
  v7[2] = *MEMORY[0x263EFF070];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x263EFF0E8];
  v7[4] = *MEMORY[0x263EFF0E0];
  void v7[5] = v4;
  v8[2] = MEMORY[0x263EFFA88];
  v8[3] = MEMORY[0x263EFFA88];
  v8[4] = *MEMORY[0x263F080B0];
  void v8[5] = MEMORY[0x263EFFA88];
  objc_super v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:6];
  return v5;
}

+ (void)deleteAllData
{
  uint64_t v3 = +[RadioImageCache sharedCache];
  [v3 _removeAllCachedImages];

  uint64_t v4 = +[RadioModel sharedModel];
  objc_super v5 = +[RadioModel backgroundModel];
  uint64_t v6 = [v4 context];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __27__RadioModel_deleteAllData__block_invoke;
  v10[3] = &unk_2643A9E78;
  id v11 = v5;
  id v12 = v4;
  id v13 = a1;
  id v7 = v4;
  id v8 = v5;
  [v6 performBlockAndWait:v10];

  id v9 = +[RadioRequest defaultURLCache];
  [v9 removeAllCachedResponses];
}

void __27__RadioModel_deleteAllData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__RadioModel_deleteAllData__block_invoke_2;
  v5[3] = &unk_2643A9E78;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 performBlockAndWait:v5];
}

void __27__RadioModel_deleteAllData__block_invoke_2(id *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [a1[4] _resetModel];
  [a1[5] _resetModel];
  uint64_t v2 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21B56B000, v2, OS_LOG_TYPE_INFO, "[RadioModel] Destroying data...", buf, 2u);
  }

  id v3 = [a1[6] _radioDatabasePath];
  if (v3)
  {
    uint64_t v4 = [NSURL fileURLWithPath:v3];
    objc_super v5 = os_log_create("com.apple.amp.radio", "Model");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      long long v23 = v4;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_21B56B000, v5, OS_LOG_TYPE_INFO, "[RadioModel] Destroying database at URL: %@ (path: %@)", buf, 0x16u);
    }

    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&__databaseLock);
      id v6 = (void *)*((void *)a1[4] + 14);
      uint64_t v7 = *MEMORY[0x263EFF168];
      uint64_t v8 = [a1[6] _persistentStoreConfigurationOptions];
      id v21 = 0;
      int v9 = [v6 _destroyPersistentStoreAtURL:v4 withType:v7 options:v8 error:&v21];
      id v10 = v21;

      os_unfair_lock_unlock((os_unfair_lock_t)&__databaseLock);
    }
    else
    {
      int v9 = 0;
      id v10 = 0;
    }
  }
  else
  {
    int v9 = 0;
    id v10 = 0;
  }
  id v11 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = @"NO";
    if (v9) {
      id v12 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    long long v23 = v12;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_21B56B000, v11, OS_LOG_TYPE_INFO, "[RadioModel] Destroy results: success: %@, error: %@", buf, 0x16u);
  }

  id v13 = os_log_create("com.apple.amp.radio", "Model");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v23 = @"RadioModelWasDeletedNotification";
    _os_log_impl(&dword_21B56B000, v13, OS_LOG_TYPE_INFO, "[RadioModel] Posting '%@'", buf, 0xCu);
  }

  int v14 = [MEMORY[0x263F08A00] defaultCenter];
  id v15 = +[RadioModel sharedModel];
  [v14 postNotificationName:@"RadioModelWasDeletedNotification" object:v15];

  id v16 = [MEMORY[0x263F08A00] defaultCenter];
  id v17 = +[RadioModel backgroundModel];
  [v16 postNotificationName:@"RadioModelWasDeletedNotification" object:v17];

  uint64_t v18 = a1[4];
  if (*((unsigned char *)v18 + 84))
  {
    int v19 = v18[20];
    pid_t v20 = getpid();
    notify_set_state(v19, v20);
  }
  notify_post("com.apple.Radio.model-deleted");
  [a1[4] _postContextDidChangeNotification:0];
  [a1[5] _postContextDidChangeNotification:0];
  [a1[6] _postAccountDidDeauthenticateNotification];
}

+ (id)sharedModel
{
  if (sharedModel___once != -1) {
    dispatch_once(&sharedModel___once, &__block_literal_global_102);
  }
  uint64_t v2 = (void *)sharedModel___sharedModel;
  return v2;
}

uint64_t __25__RadioModel_sharedModel__block_invoke()
{
  sharedModel___sharedModel = [[RadioModel alloc] _init];
  return MEMORY[0x270F9A758]();
}

+ (id)backgroundModel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__RadioModel_backgroundModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (backgroundModel___once != -1) {
    dispatch_once(&backgroundModel___once, block);
  }
  uint64_t v2 = (void *)backgroundModel___backgroundModel;
  return v2;
}

void __29__RadioModel_backgroundModel__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v4 = +[RadioModel sharedModel];
  uint64_t v2 = [v1 _initBackgroundModelWithPersistentStoreCoordinator:v4[14]];
  id v3 = (void *)backgroundModel___backgroundModel;
  backgroundModel___backgroundModel = v2;
}

@end