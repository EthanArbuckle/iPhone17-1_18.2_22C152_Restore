@interface MTCoreDataContainer
- (BOOL)valid;
- (MTCoreDataContainer)initWithConfig:(id)a3;
- (MTCoreDataContainerConfigProvider)config;
- (MTManagedObjectContext)carPlayContext;
- (MTManagedObjectContext)importContext;
- (MTManagedObjectContext)loggingContext;
- (MTManagedObjectContext)mainQueueContext;
- (MTManagedObjectContext)playbackContext;
- (MTManagedObjectContext)privateQueueContext;
- (MTManagedObjectContext)resetableImportContext;
- (MTManagedObjectContext)storeContext;
- (NSArray)entityNames;
- (NSHashTable)notifiers;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentStoreCoordinator)coordinator;
- (OS_dispatch_queue)mergeNotifierQueue;
- (OS_dispatch_queue)mergeQueue;
- (PFManagedObjectContextMonitor)importMonitor;
- (PFManagedObjectContextMonitor)privateMonitor;
- (id)_createManagedObjectContextWithName:(id)a3 coordinator:(id)a4 concurrencyType:(unint64_t)a5;
- (id)allContexts;
- (id)contextForName:(id)a3;
- (id)mainOrPrivateContext;
- (id)managedObjectIDForURI:(id)a3 error:(id *)a4;
- (id)persistentStoreCoordinator;
- (id)persistentStoreUuid;
- (id)safePersistentStoreCoordinatorWithError:(id *)a3;
- (void)_addChanges:(id)a3 ofType:(int)a4 toLibraryChanges:(id)a5;
- (void)_notifyLibraryChanged:(id)a3 contextName:(id)a4;
- (void)_tearDown:(BOOL)a3;
- (void)addChangeNotifier:(id)a3;
- (void)checkForBackwardsMigration_probablyNotABug:(id)a3;
- (void)checkForFullDisk_probablyNotABug:(id)a3;
- (void)checkForRadar75450416_probablyNotABug:(id)a3;
- (void)checkForWritePermissions:(id)a3;
- (void)destroy;
- (void)mergeFromContextDidSaveNotification:(id)a3;
- (void)removeChangeNotifier:(id)a3;
- (void)setCarPlayContext:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setEntityNames:(id)a3;
- (void)setImportContext:(id)a3;
- (void)setImportMonitor:(id)a3;
- (void)setLoggingContext:(id)a3;
- (void)setMainQueueContext:(id)a3;
- (void)setManagedObjectModel:(id)a3;
- (void)setMergeNotifierQueue:(id)a3;
- (void)setMergeQueue:(id)a3;
- (void)setNotifiers:(id)a3;
- (void)setPlaybackContext:(id)a3;
- (void)setPrivateMonitor:(id)a3;
- (void)setPrivateQueueContext:(id)a3;
- (void)setResetableImportContext:(id)a3;
- (void)setStoreContext:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)tearDownAsync:(BOOL)a3;
@end

@implementation MTCoreDataContainer

uint64_t __57__MTCoreDataContainer__notifyLibraryChanged_contextName___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) libraryDidChange:*(void *)(a1 + 40)];
}

- (MTCoreDataContainer)initWithConfig:(id)a3
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTCoreDataContainer;
  v5 = [(MTCoreDataContainer *)&v20 init];
  v6 = v5;
  if (v5)
  {
    [(MTCoreDataContainer *)v5 setConfig:v4];
    [(MTCoreDataContainer *)v6 setValid:1];
    v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(MTCoreDataContainer *)v6 setNotifiers:v7];

    v21[0] = @"MTPodcast";
    v21[1] = @"MTEpisode";
    v21[2] = @"MTPlaylist";
    v21[3] = @"MTPodcastPlaylistSettings";
    v21[4] = @"MTChannel";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
    [(MTCoreDataContainer *)v6 setEntityNames:v8];

    v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    id v12 = [v9 stringWithFormat:@"%@MergeQueue", v11];
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
    [(MTCoreDataContainer *)v6 setMergeQueue:v13];

    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    id v17 = [v14 stringWithFormat:@"%@MergeNotifierQueue", v16];
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    [(MTCoreDataContainer *)v6 setMergeNotifierQueue:v18];
  }
  return v6;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setNotifiers:(id)a3
{
}

- (void)setMergeQueue:(id)a3
{
}

- (void)setMergeNotifierQueue:(id)a3
{
}

- (void)setEntityNames:(id)a3
{
}

- (void)setConfig:(id)a3
{
}

void __57__MTCoreDataContainer__notifyLibraryChanged_contextName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) mergeNotifierQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MTCoreDataContainer__notifyLibraryChanged_contextName___block_invoke_2;
  v6[3] = &unk_1E5E615A8;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (OS_dispatch_queue)mergeNotifierQueue
{
  return self->_mergeNotifierQueue;
}

- (id)mainOrPrivateContext
{
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    [(MTCoreDataContainer *)self mainQueueContext];
  }
  else {
  id v3 = [(MTCoreDataContainer *)self privateQueueContext];
  }
  return v3;
}

- (void)addChangeNotifier:(id)a3
{
  id v6 = a3;
  id v4 = [(MTCoreDataContainer *)self notifiers];
  objc_sync_enter(v4);
  id v5 = [(MTCoreDataContainer *)self notifiers];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

void __59__MTCoreDataContainer_mergeFromContextDidSaveNotification___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained valid])
  {
    id v3 = _MTLogCategoryDatabase();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    id v5 = _MTLogCategoryDatabase();
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      id v7 = [*(id *)(a1 + 32) name];
      int v14 = 138543362;
      v15 = v7;
      _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "mergeFromContextDidSaveNotification", "from: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    id v8 = (void *)MEMORY[0x1E4F1C110];
    v9 = [*(id *)(a1 + 40) userInfo];
    [v8 mergeChangesFromRemoteContextSave:v9 intoContexts:*(void *)(a1 + 48)];

    uint64_t v10 = *(void *)(a1 + 40);
    v11 = [*(id *)(a1 + 32) name];
    [WeakRetained _notifyLibraryChanged:v10 contextName:v11];

    id v12 = _MTLogCategoryDatabase();
    dispatch_queue_t v13 = v12;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v13, OS_SIGNPOST_INTERVAL_END, v4, "mergeFromContextDidSaveNotification", "", (uint8_t *)&v14, 2u);
    }
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (id)contextForName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(MTCoreDataContainer *)self allContexts];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "name", (void)v13);
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)mergeFromContextDidSaveNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(MTCoreDataContainer *)self allContexts];
  uint64_t v7 = v6;
  if (!v5) {
    goto LABEL_4;
  }
  if ([v6 containsObject:v5])
  {
    [v7 removeObject:v5];
LABEL_4:
    objc_initWeak(&location, self);
    id v8 = [(MTCoreDataContainer *)self mergeQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MTCoreDataContainer_mergeFromContextDidSaveNotification___block_invoke;
    block[3] = &unk_1E5E61900;
    objc_copyWeak(&v13, &location);
    id v10 = v5;
    id v11 = v4;
    id v12 = v7;
    dispatch_async(v8, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (id)allContexts
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
  id v4 = v3;
  if (self->_mainQueueContext) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_privateQueueContext) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_carPlayContext) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_storeContext) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_importContext) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_resetableImportContext) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_loggingContext) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_playbackContext) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (OS_dispatch_queue)mergeQueue
{
  return self->_mergeQueue;
}

- (void)_notifyLibraryChanged:(id)a3 contextName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTCoreDataContainer *)self notifiers];
  objc_sync_enter(v8);
  v9 = [(MTCoreDataContainer *)self notifiers];
  id v10 = [v9 allObjects];

  objc_sync_exit(v8);
  id inited = objc_initWeak(&location, self);
  id v12 = (void *)MEMORY[0x1AD11A870]();
  id v13 = inited;
  long long v14 = [[MTLibraryChanges alloc] initWithContextName:v7];
  long long v15 = [v6 userInfo];
  long long v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F1BDF0]];
  [(MTCoreDataContainer *)self _addChanges:v16 ofType:0 toLibraryChanges:v14];

  id v17 = [v6 userInfo];
  uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA0]];
  [(MTCoreDataContainer *)self _addChanges:v18 ofType:2 toLibraryChanges:v14];

  v19 = [v6 userInfo];
  objc_super v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F1BDB8]];
  [(MTCoreDataContainer *)self _addChanges:v20 ofType:1 toLibraryChanges:v14];

  if ([(MTLibraryChanges *)v14 hasChanges])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__MTCoreDataContainer__notifyLibraryChanged_contextName___block_invoke;
    v21[3] = &unk_1E5E61928;
    v21[4] = self;
    v22 = v14;
    [v10 enumerateObjectsUsingBlock:v21];
  }
  objc_destroyWeak(&location);
}

- (NSHashTable)notifiers
{
  return self->_notifiers;
}

- (void)_addChanges:(id)a3 ofType:(int)a4 toLibraryChanges:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v14 = [v13 entity];
        long long v15 = [v14 name];

        long long v16 = [(MTCoreDataContainer *)self entityNames];
        int v17 = [v16 containsObject:v15];

        if (v17) {
          [v8 addChangeWith:v13 entityName:v15 changeType:a4];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
}

- (NSArray)entityNames
{
  return self->_entityNames;
}

- (MTManagedObjectContext)loggingContext
{
  loggingContext = self->_loggingContext;
  if (!loggingContext)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_loggingContext)
    {
      id v5 = [(MTCoreDataContainer *)v4 persistentStoreCoordinator];
      id v6 = [(MTCoreDataContainer *)v4 _createManagedObjectContextWithName:@"logging" coordinator:v5 concurrencyType:1];
      id v7 = self->_loggingContext;
      self->_loggingContext = v6;
    }
    objc_sync_exit(v4);

    loggingContext = self->_loggingContext;
  }
  id v8 = loggingContext;
  return v8;
}

- (MTManagedObjectContext)storeContext
{
  storeContext = self->_storeContext;
  if (!storeContext)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_storeContext)
    {
      id v5 = [(MTCoreDataContainer *)v4 persistentStoreCoordinator];
      id v6 = [(MTCoreDataContainer *)v4 _createManagedObjectContextWithName:@"state machine context" coordinator:v5 concurrencyType:1];
      id v7 = self->_storeContext;
      self->_storeContext = v6;
    }
    objc_sync_exit(v4);

    storeContext = self->_storeContext;
  }
  id v8 = storeContext;
  return v8;
}

- (id)_createManagedObjectContextWithName:(id)a3 coordinator:(id)a4 concurrencyType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[MTManagedObjectContext alloc] initWithConcurrencyType:a5 name:v9];

  [(MTManagedObjectContext *)v10 setPersistentStoreCoordinator:v8];
  [(MTManagedObjectContext *)v10 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  [(MTManagedObjectContext *)v10 setUndoManager:0];
  [(MTManagedObjectContext *)v10 setType:a5 != 2];
  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_mergeFromContextDidSaveNotification_ name:*MEMORY[0x1E4F1BE28] object:v10];

  return v10;
}

- (MTManagedObjectContext)importContext
{
  importContext = self->_importContext;
  if (!importContext)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_importContext)
    {
      id v5 = [(MTCoreDataContainer *)v4 persistentStoreCoordinator];
      id v6 = [(MTCoreDataContainer *)v4 _createManagedObjectContextWithName:@"import context" coordinator:v5 concurrencyType:1];
      id v7 = self->_importContext;
      self->_importContext = v6;

      id v8 = [[PFManagedObjectContextMonitor alloc] initWithContext:self->_importContext label:1 pingInterval:1.0 shortHangDuration:10.0 severeHangDuration:20.0 criticalHangDuration:30.0 criticalHangRepeatInterval:1.0];
      importMonitor = v4->_importMonitor;
      v4->_importMonitor = v8;

      [(PFManagedObjectContextMonitor *)v4->_importMonitor beginMonitoring];
    }
    objc_sync_exit(v4);

    importContext = self->_importContext;
  }
  uint64_t v10 = importContext;
  return v10;
}

- (MTManagedObjectContext)privateQueueContext
{
  privateQueueContext = self->_privateQueueContext;
  if (!privateQueueContext)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_privateQueueContext)
    {
      id v5 = [(MTCoreDataContainer *)v4 persistentStoreCoordinator];
      id v6 = [(MTCoreDataContainer *)v4 _createManagedObjectContextWithName:@"background context" coordinator:v5 concurrencyType:1];
      id v7 = self->_privateQueueContext;
      self->_privateQueueContext = v6;

      id v8 = [[PFManagedObjectContextMonitor alloc] initWithContext:self->_privateQueueContext label:0 pingInterval:1.0 shortHangDuration:5.0 severeHangDuration:10.0 criticalHangDuration:15.0 criticalHangRepeatInterval:1.0];
      privateMonitor = v4->_privateMonitor;
      v4->_privateMonitor = v8;

      [(PFManagedObjectContextMonitor *)v4->_privateMonitor beginMonitoring];
    }
    objc_sync_exit(v4);

    privateQueueContext = self->_privateQueueContext;
  }
  uint64_t v10 = privateQueueContext;
  return v10;
}

- (id)persistentStoreCoordinator
{
  coordinator = self->_coordinator;
  if (coordinator)
  {
    id v3 = coordinator;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C188]);
    id v6 = [(MTCoreDataContainer *)self config];
    id v7 = [v6 managedObjectModel];
    id v8 = (void *)[v5 initWithManagedObjectModel:v7];
    [(MTCoreDataContainer *)self setCoordinator:v8];

    id v9 = [(MTCoreDataContainer *)self coordinator];
    uint64_t v10 = *MEMORY[0x1E4F1BF70];
    uint64_t v11 = [(MTCoreDataContainer *)self config];
    id v12 = [v11 databaseFileUrl];
    id v13 = [(MTCoreDataContainer *)self config];
    long long v14 = [v13 persistentStoreOptions];
    id v18 = 0;
    long long v15 = [v9 addPersistentStoreWithType:v10 configuration:0 URL:v12 options:v14 error:&v18];
    id v16 = v18;

    if (!v15)
    {
      [(MTCoreDataContainer *)self checkForBackwardsMigration_probablyNotABug:v16];
      [(MTCoreDataContainer *)self checkForFullDisk_probablyNotABug:v16];
      [(MTCoreDataContainer *)self checkForRadar75450416_probablyNotABug:v16];
      [(MTCoreDataContainer *)self checkForWritePermissions:v16];
      [MEMORY[0x1E4F1CA00] raise:@"Error creating persistent store", @"Error: %@", v16 format];
    }
    id v3 = [(MTCoreDataContainer *)self coordinator];
  }
  return v3;
}

- (MTCoreDataContainerConfigProvider)config
{
  return self->_config;
}

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (MTManagedObjectContext)mainQueueContext
{
  mainQueueContext = self->_mainQueueContext;
  if (!mainQueueContext)
  {
    id v4 = self;
    objc_sync_enter(v4);
    id v5 = [(MTCoreDataContainer *)v4 persistentStoreCoordinator];
    id v6 = [(MTCoreDataContainer *)v4 _createManagedObjectContextWithName:@"main queue context" coordinator:v5 concurrencyType:2];
    id v7 = self->_mainQueueContext;
    self->_mainQueueContext = v6;

    objc_sync_exit(v4);
    mainQueueContext = self->_mainQueueContext;
  }
  id v8 = mainQueueContext;
  return v8;
}

- (MTManagedObjectContext)carPlayContext
{
  carPlayContext = self->_carPlayContext;
  if (!carPlayContext)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_carPlayContext)
    {
      id v5 = [(MTCoreDataContainer *)v4 persistentStoreCoordinator];
      id v6 = [(MTCoreDataContainer *)v4 _createManagedObjectContextWithName:@"carplay context" coordinator:v5 concurrencyType:1];
      id v7 = self->_carPlayContext;
      self->_carPlayContext = v6;
    }
    objc_sync_exit(v4);

    carPlayContext = self->_carPlayContext;
  }
  id v8 = carPlayContext;
  return v8;
}

- (MTManagedObjectContext)resetableImportContext
{
  resetableImportContext = self->_resetableImportContext;
  if (!resetableImportContext)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_resetableImportContext)
    {
      id v5 = [(MTCoreDataContainer *)v4 persistentStoreCoordinator];
      id v6 = [(MTCoreDataContainer *)v4 _createManagedObjectContextWithName:@"resetable import context" coordinator:v5 concurrencyType:1];
      id v7 = self->_resetableImportContext;
      self->_resetableImportContext = v6;

      [(MTManagedObjectContext *)self->_resetableImportContext setIsResetable:1];
    }
    objc_sync_exit(v4);

    resetableImportContext = self->_resetableImportContext;
  }
  id v8 = resetableImportContext;
  return v8;
}

- (MTManagedObjectContext)playbackContext
{
  playbackContext = self->_playbackContext;
  if (!playbackContext)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_playbackContext)
    {
      id v5 = [(MTCoreDataContainer *)v4 persistentStoreCoordinator];
      id v6 = [(MTCoreDataContainer *)v4 _createManagedObjectContextWithName:@"playback" coordinator:v5 concurrencyType:1];
      id v7 = self->_playbackContext;
      self->_playbackContext = v6;
    }
    objc_sync_exit(v4);

    playbackContext = self->_playbackContext;
  }
  id v8 = playbackContext;
  return v8;
}

- (id)managedObjectIDForURI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MTCoreDataContainer *)self safePersistentStoreCoordinatorWithError:a4];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 managedObjectIDForURIRepresentation:v6];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)safePersistentStoreCoordinatorWithError:(id *)a3
{
  coordinator = self->_coordinator;
  if (coordinator)
  {
    id v4 = coordinator;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C188]);
    id v8 = [(MTCoreDataContainer *)self config];
    id v9 = [v8 managedObjectModel];
    uint64_t v10 = (void *)[v7 initWithManagedObjectModel:v9];
    [(MTCoreDataContainer *)self setCoordinator:v10];

    uint64_t v11 = [(MTCoreDataContainer *)self coordinator];
    uint64_t v12 = *MEMORY[0x1E4F1BF70];
    id v13 = [(MTCoreDataContainer *)self config];
    long long v14 = [v13 databaseFileUrl];
    long long v15 = [(MTCoreDataContainer *)self config];
    id v16 = [v15 persistentStoreOptions];
    id v17 = (id)[v11 addPersistentStoreWithType:v12 configuration:0 URL:v14 options:v16 error:a3];

    id v4 = [(MTCoreDataContainer *)self coordinator];
  }
  return v4;
}

- (void)checkForBackwardsMigration_probablyNotABug:(id)a3
{
  id v5 = a3;
  id v3 = [v5 domain];
  if ([v3 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v4 = [v5 code];

    if (v4 == 134100 && +[MTDB coreDataVersion] >= 143) {
      [MEMORY[0x1E4F1CA00] raise:@"Database is newer than app" format:@"Update install to an older build is unsupported by podcasts."];
    }
  }
  else
  {
  }
}

- (void)checkForFullDisk_probablyNotABug:(id)a3
{
  id v8 = a3;
  id v3 = [v8 domain];
  uint64_t v4 = *MEMORY[0x1E4F1BF50];
  if ([v3 isEqualToString:*MEMORY[0x1E4F1BF50]])
  {
    id v5 = [v8 userInfo];
    id v6 = [v5 objectForKeyedSubscript:v4];
    int v7 = [v6 intValue];

    if (v7 == 13) {
      [MEMORY[0x1E4F1CA00] raise:@"Disk is full" format:@"Could not open podcasts library because the disk is full."];
    }
  }
  else
  {
  }
}

- (void)checkForRadar75450416_probablyNotABug:(id)a3
{
  id v5 = a3;
  id v3 = [v5 domain];
  if ([v3 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v4 = [v5 code];

    if (v4 == 134100 && +[MTDB coreDataVersion] == 78) {
      [MEMORY[0x1E4F1CA00] raise:@"Unmigratable database", @"This device has a corrupt, unmigrateable database that never shipped to the public. See rdar://75450416 for mitigation instructions." format];
    }
  }
  else
  {
  }
}

- (void)checkForWritePermissions:(id)a3
{
  id v5 = a3;
  id v3 = [v5 domain];
  if ([v3 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v4 = [v5 code];

    if (v4 == 513) {
      [MEMORY[0x1E4F1CA00] raise:@"No write permissions" format:@"The current user does not have write permissions for the Podcasts library path."];
    }
  }
  else
  {
  }
}

- (id)persistentStoreUuid
{
  id v3 = (void *)MEMORY[0x1E4F1C188];
  uint64_t v4 = *MEMORY[0x1E4F1BF70];
  id v5 = [(MTCoreDataContainer *)self config];
  id v6 = [v5 databaseFileUrl];
  int v7 = [(MTCoreDataContainer *)self config];
  id v8 = [v7 persistentStoreOptions];
  id v13 = 0;
  id v9 = [v3 metadataForPersistentStoreOfType:v4 URL:v6 options:v8 error:&v13];
  id v10 = v13;

  if (v9 || [v10 code] != 260)
  {
    uint64_t v11 = [v9 objectForKey:*MEMORY[0x1E4F1BF90]];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)removeChangeNotifier:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(MTCoreDataContainer *)self notifiers];
  objc_sync_enter(v4);
  id v5 = [(MTCoreDataContainer *)self notifiers];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)tearDownAsync:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  id v6 = [(MTCoreDataContainer *)self mergeQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__MTCoreDataContainer_tearDownAsync___block_invoke;
  v7[3] = &unk_1E5E61950;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(v6, v7);
}

uint64_t __37__MTCoreDataContainer_tearDownAsync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDown:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_tearDown:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  mainQueueContext = self->_mainQueueContext;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __33__MTCoreDataContainer__tearDown___block_invoke;
  v40[3] = &unk_1E5E611F0;
  BOOL v8 = v6;
  v41 = v8;
  [(MTManagedObjectContext *)mainQueueContext performBlock:v40];
  dispatch_group_enter(v8);
  privateQueueContext = self->_privateQueueContext;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __33__MTCoreDataContainer__tearDown___block_invoke_2;
  v38[3] = &unk_1E5E611F0;
  id v10 = v8;
  v39 = v10;
  [(MTManagedObjectContext *)privateQueueContext performBlock:v38];
  dispatch_group_enter(v10);
  carPlayContext = self->_carPlayContext;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __33__MTCoreDataContainer__tearDown___block_invoke_3;
  v36[3] = &unk_1E5E611F0;
  uint64_t v12 = v10;
  v37 = v12;
  [(MTManagedObjectContext *)carPlayContext performBlock:v36];
  dispatch_group_enter(v12);
  storeContext = self->_storeContext;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __33__MTCoreDataContainer__tearDown___block_invoke_4;
  v34[3] = &unk_1E5E611F0;
  long long v14 = v12;
  v35 = v14;
  [(MTManagedObjectContext *)storeContext performBlock:v34];
  dispatch_group_enter(v14);
  importContext = self->_importContext;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __33__MTCoreDataContainer__tearDown___block_invoke_5;
  v32[3] = &unk_1E5E611F0;
  id v16 = v14;
  v33 = v16;
  [(MTManagedObjectContext *)importContext performBlock:v32];
  dispatch_group_enter(v16);
  resetableImportContext = self->_resetableImportContext;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __33__MTCoreDataContainer__tearDown___block_invoke_6;
  v30[3] = &unk_1E5E611F0;
  id v18 = v16;
  v31 = v18;
  [(MTManagedObjectContext *)resetableImportContext performBlock:v30];
  dispatch_group_enter(v18);
  loggingContext = self->_loggingContext;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __33__MTCoreDataContainer__tearDown___block_invoke_7;
  v28[3] = &unk_1E5E611F0;
  long long v20 = v18;
  v29 = v20;
  [(MTManagedObjectContext *)loggingContext performBlock:v28];
  dispatch_group_enter(v20);
  playbackContext = self->_playbackContext;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __33__MTCoreDataContainer__tearDown___block_invoke_8;
  v26[3] = &unk_1E5E611F0;
  v27 = v20;
  long long v22 = v20;
  [(MTManagedObjectContext *)playbackContext performBlock:v26];
  v23 = [(MTCoreDataContainer *)self mergeQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __33__MTCoreDataContainer__tearDown___block_invoke_9;
  v24[3] = &unk_1E5E61950;
  v24[4] = self;
  BOOL v25 = a3;
  dispatch_group_notify(v22, v23, v24);
}

void __33__MTCoreDataContainer__tearDown___block_invoke(uint64_t a1)
{
}

void __33__MTCoreDataContainer__tearDown___block_invoke_2(uint64_t a1)
{
}

void __33__MTCoreDataContainer__tearDown___block_invoke_3(uint64_t a1)
{
}

void __33__MTCoreDataContainer__tearDown___block_invoke_4(uint64_t a1)
{
}

void __33__MTCoreDataContainer__tearDown___block_invoke_5(uint64_t a1)
{
}

void __33__MTCoreDataContainer__tearDown___block_invoke_6(uint64_t a1)
{
}

void __33__MTCoreDataContainer__tearDown___block_invoke_7(uint64_t a1)
{
}

void __33__MTCoreDataContainer__tearDown___block_invoke_8(uint64_t a1)
{
}

void __33__MTCoreDataContainer__tearDown___block_invoke_9(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  [v2 setValid:0];
  if (*(unsigned char *)(a1 + 40)) {
    [v2 destroy];
  }
}

- (void)destroy
{
  id v3 = [(MTCoreDataContainer *)self persistentStoreCoordinator];
  uint64_t v4 = [(MTCoreDataContainer *)self config];
  id v5 = [v4 databaseFileUrl];
  uint64_t v6 = *MEMORY[0x1E4F1BF70];
  int v7 = [(MTCoreDataContainer *)self config];
  BOOL v8 = [v7 persistentStoreOptions];
  id v20 = 0;
  char v9 = [v3 destroyPersistentStoreAtURL:v5 withType:v6 options:v8 error:&v20];
  id v10 = v20;
  if (v9)
  {
    int v11 = 0;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = [(MTCoreDataContainer *)self config];
    long long v14 = [v13 databaseFileUrl];
    id v19 = v10;
    int v15 = [v12 removeItemAtURL:v14 error:&v19];
    id v18 = v4;
    id v16 = v3;
    id v17 = v19;

    int v11 = v15 ^ 1;
    id v10 = v17;
    id v3 = v16;
    uint64_t v4 = v18;
  }

  if (v11) {
    [MEMORY[0x1E4F1CA00] raise:@"Failed to destory store", @"Error: %@", v10 format];
  }
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (void)setManagedObjectModel:(id)a3
{
}

- (void)setMainQueueContext:(id)a3
{
}

- (void)setPrivateQueueContext:(id)a3
{
}

- (void)setCarPlayContext:(id)a3
{
}

- (void)setStoreContext:(id)a3
{
}

- (void)setImportContext:(id)a3
{
}

- (void)setResetableImportContext:(id)a3
{
}

- (void)setLoggingContext:(id)a3
{
}

- (void)setPlaybackContext:(id)a3
{
}

- (PFManagedObjectContextMonitor)privateMonitor
{
  return self->_privateMonitor;
}

- (void)setPrivateMonitor:(id)a3
{
}

- (PFManagedObjectContextMonitor)importMonitor
{
  return self->_importMonitor;
}

- (void)setImportMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityNames, 0);
  objc_storeStrong((id *)&self->_notifiers, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_mergeNotifierQueue, 0);
  objc_storeStrong((id *)&self->_mergeQueue, 0);
  objc_storeStrong((id *)&self->_importMonitor, 0);
  objc_storeStrong((id *)&self->_privateMonitor, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_loggingContext, 0);
  objc_storeStrong((id *)&self->_resetableImportContext, 0);
  objc_storeStrong((id *)&self->_importContext, 0);
  objc_storeStrong((id *)&self->_storeContext, 0);
  objc_storeStrong((id *)&self->_carPlayContext, 0);
  objc_storeStrong((id *)&self->_privateQueueContext, 0);
  objc_storeStrong((id *)&self->_mainQueueContext, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
}

@end