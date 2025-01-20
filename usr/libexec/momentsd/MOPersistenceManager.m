@interface MOPersistenceManager
+ (id)createModel;
+ (id)currentManagedObjectModel;
+ (id)defaultModelsDirectory;
+ (id)defaultStoresDirectory;
+ (id)getBundlingJSONURLWithTrigger:(unint64_t)a3;
+ (id)getCollectionDate;
+ (id)getPlistFileURL;
+ (id)protectedStoreFilesExtensions;
+ (id)userCacheDirectoryPath;
+ (void)defaultModelsDirectory;
+ (void)defaultStoresDirectory;
+ (void)getCollectionDate;
+ (void)persistCollectionDate;
- (BOOL)_acquireBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4;
- (BOOL)_acquireBackgroundProcessingPermissions;
- (BOOL)acquireBackgroundProcessingPermissions;
- (BOOL)loadStore;
- (MOConfigurationManager)configurationManager;
- (MODispatcher)dispatcher;
- (MOPersistenceManager)initWithUniverse:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentContainer)persistentContainer;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSURL)modelsDirectory;
- (NSURL)storesDirectory;
- (OS_dispatch_queue)queue;
- (int)_acquireBackgroundAssertionForFileDescriptor:(int)a3;
- (int)_getFileDescriptorForPersistenceStoreFile:(id)a3;
- (unint64_t)availability;
- (void)onLockStateChangeNotification:(id)a3;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)registerForNotifications;
- (void)setConfigurationManager:(id)a3;
- (void)setDispatcher:(id)a3;
@end

@implementation MOPersistenceManager

- (MOPersistenceManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  id v40 = (id)os_transaction_create();
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  if (v8)
  {
    v9 = +[MOPersistenceManager defaultModelsDirectory];
    v10 = +[MOPersistenceManager defaultStoresDirectory];
    v39.receiver = self;
    v39.super_class = (Class)MOPersistenceManager;
    v11 = [(MOPersistenceManager *)&v39 init];
    self = v11;
    if (v11 && v10 && v9)
    {
      objc_storeStrong((id *)&v11->_modelsDirectory, v9);
      objc_storeStrong((id *)&self->_storesDirectory, v10);
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = (OS_dispatch_queue *)dispatch_queue_create("MOPersistenceManager", v12);
      queue = self->_queue;
      self->_queue = v13;

      id v15 = +[MOPersistenceManager currentManagedObjectModel];
      v16 = (NSPersistentContainer *)[objc_alloc((Class)NSPersistentContainer) initWithName:@"moments" managedObjectModel:v15];
      persistentContainer = self->_persistentContainer;
      self->_persistentContainer = v16;

      self->_availability = 1;
      v18 = objc_opt_new();
      [v18 setShouldAddStoreAsynchronously:0];
      [v18 setShouldMigrateStoreAutomatically:1];
      [v18 setShouldInferMappingModelAutomatically:1];
      [v18 setURL:self->_storesDirectory];
      [v18 setType:NSSQLiteStoreType];
      [v18 setOption:NSFileProtectionCompleteUnlessOpen forKey:NSPersistentStoreFileProtectionKey];
      v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, 0);
      [(NSPersistentContainer *)self->_persistentContainer setPersistentStoreDescriptions:v19];

      v20 = [(NSPersistentContainer *)self->_persistentContainer newBackgroundContext];
      managedObjectContext = self->_managedObjectContext;
      self->_managedObjectContext = v20;

      v22 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[MOPersistenceManager initWithUniverse:]((uint64_t)&self->_managedObjectContext, v22, v23, v24, v25, v26, v27, v28);
      }

      v29 = [[MODispatcher alloc] initWithNotifier:v8];
      dispatcher = self->_dispatcher;
      self->_dispatcher = v29;

      [(MOPersistenceManager *)self registerForNotifications];
      id v31 = v40;
      id v40 = 0;

      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      v34 = [v5 getService:v33];
      configurationManager = self->_configurationManager;
      self->_configurationManager = v34;

      v36 = self;
    }
    else
    {
      v36 = 0;
      id v15 = v40;
      id v40 = 0;
    }
  }
  else
  {
    v37 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[MOPersistenceManager initWithUniverse:]();
    }

    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MOPersistenceManager.m" lineNumber:45 description:@"Invalid parameter not satisfying: notifier"];
    v36 = 0;
  }

  return v36;
}

- (void)registerForNotifications
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __48__MOPersistenceManager_registerForNotifications__block_invoke;
  v5[3] = &unk_1002CE8B8;
  v5[4] = self;
  v3 = objc_retainBlock(v5);
  v4 = [(MOPersistenceManager *)self dispatcher];
  [v4 registerForNotification:2 withHandler:v3];
}

void __48__MOPersistenceManager_registerForNotifications__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2)
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __48__MOPersistenceManager_registerForNotifications__block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) onLockStateChangeNotification:v5];
  }
}

- (void)onLockStateChangeNotification:(id)a3
{
  v4 = [a3 valueForKey:@"isUnlocked"];

  if (v4 && (id)[(MOPersistenceManager *)self availability] == (id)2)
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[MOPersistenceManager onLockStateChangeNotification:]();
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __54__MOPersistenceManager_onLockStateChangeNotification___block_invoke;
    block[3] = &unk_1002C98B8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __54__MOPersistenceManager_onLockStateChangeNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dispatcher];
  [v1 unregisterForNotification:2];
}

- (unint64_t)availability
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_availability != 2 && [(MOPersistenceManager *)v2 loadStore]) {
    v2->_availability = 2;
  }
  objc_sync_exit(v2);

  return v2->_availability;
}

- (BOOL)loadStore
{
  unsigned int v3 = [(MOPersistenceManager *)self _acquireBackgroundProcessingPermissions];
  v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v5) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v6 = "Succeed to update background processing assertion";
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v6 = "Fail to update background processing assertion";
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v6, buf, 2u);
LABEL_7:

  *(void *)buf = 0;
  uint64_t v25 = buf;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v7 = [(NSPersistentContainer *)self->_persistentContainer persistentStoreCoordinator];
  v8 = [v7 persistentStores];
  id v9 = [v8 count];

  if (v9)
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "store is already loaded", v19, 2u);
    }
    id v11 = 0;
  }
  else
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    persistentContainer = self->_persistentContainer;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __33__MOPersistenceManager_loadStore__block_invoke;
    v21[3] = &unk_1002CEFA8;
    uint64_t v23 = buf;
    v10 = v12;
    v22 = v10;
    [(NSPersistentContainer *)persistentContainer loadPersistentStoresWithCompletionHandler:v21];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Persistence/MOPersistenceManager.m", 154, "-[MOPersistenceManager loadStore]");
    id v20 = 0;
    BOOL v15 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v10, &v20, v14, 10.0);
    id v11 = v20;
    if (!v15)
    {
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
      }
    }
  }

  uint8_t v17 = v25[24];
  _Block_object_dispose(buf, 8);

  return v17;
}

void __33__MOPersistenceManager_loadStore__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __33__MOPersistenceManager_loadStore__block_invoke_cold_2();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __33__MOPersistenceManager_loadStore__block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return [(NSPersistentContainer *)self->_persistentContainer persistentStoreCoordinator];
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  [(MOPersistenceManager *)self managedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __37__MOPersistenceManager_performBlock___block_invoke;
  v7[3] = &unk_1002CEFD0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v8;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __37__MOPersistenceManager_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  [(MOPersistenceManager *)self managedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __44__MOPersistenceManager_performBlockAndWait___block_invoke;
  v7[3] = &unk_1002CEFD0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v8;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __44__MOPersistenceManager_performBlockAndWait___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)defaultModelsDirectory
{
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 resourceURL];
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[MOPersistenceManager defaultModelsDirectory].cold.4();
  }

  v7 = [@"moments" stringByAppendingPathExtension:@"momd"];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[MOPersistenceManager defaultModelsDirectory]();
  }

  id v9 = [objc_alloc((Class)NSURL) initFileURLWithPath:v7 relativeToURL:v5];
  id v16 = 0;
  unsigned __int8 v10 = [v9 checkResourceIsReachableAndReturnError:&v16];
  id v11 = v16;
  if ((v10 & 1) == 0)
  {
    dispatch_semaphore_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[MOPersistenceManager defaultModelsDirectory]();
    }

    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"MOPersistenceManager.m", 200, @"Failed to locate momd bundle: %@ (in %s:%d)", v11, "+[MOPersistenceManager defaultModelsDirectory]", 200 object file lineNumber description];
  }
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[MOPersistenceManager defaultModelsDirectory]();
  }

  return v9;
}

+ (id)defaultStoresDirectory
{
  v2 = [a1 userCacheDirectoryPath];
  if (v2)
  {
    unsigned int v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];
    id v4 = [v3 URLByAppendingPathComponent:@"momentsDataModel.sqlite"];
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[MOPersistenceManager defaultStoresDirectory]();
    }
  }
  else
  {
    unsigned int v3 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[MOPersistenceManager defaultStoresDirectory]();
    }
    id v4 = 0;
  }

  return v4;
}

+ (id)currentManagedObjectModel
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__MOPersistenceManager_currentManagedObjectModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentManagedObjectModel_onceToken != -1) {
    dispatch_once(&currentManagedObjectModel_onceToken, block);
  }
  v2 = (void *)currentManagedObjectModel__model;

  return v2;
}

uint64_t __49__MOPersistenceManager_currentManagedObjectModel__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) createModel];
  uint64_t v2 = currentManagedObjectModel__model;
  currentManagedObjectModel__model = v1;

  return _objc_release_x1(v1, v2);
}

+ (id)createModel
{
  id v3 = objc_alloc((Class)NSManagedObjectModel);
  id v4 = [a1 defaultModelsDirectory];
  id v5 = [v3 initWithContentsOfURL:v4];

  return v5;
}

+ (id)userCacheDirectoryPath
{
  return +[MOPersistenceUtilities userCacheDirectoryPath];
}

+ (id)getPlistFileURL
{
  uint64_t v2 = [a1 userCacheDirectoryPath];
  if (v2)
  {
    id v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];
    id v4 = [v3 URLByAppendingPathComponent:@"lastCollection.plist"];
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MODaemonAnalyticsManager getDaemonPlistFileURL]();
    }

    id v4 = 0;
  }

  return v4;
}

+ (void)persistCollectionDate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "couldn't write to the collection plist file, %@", v2, v3, v4, v5, v6);
}

+ (id)getCollectionDate
{
  uint64_t v2 = [a1 getPlistFileURL];
  uint64_t v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [v2 path];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  uint8_t v6 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v15 = @"lastCollection.plist";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "File %@ found.", buf, 0xCu);
    }

    id v13 = 0;
    id v8 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v2 error:&v13];
    uint8_t v6 = v13;
    if (v6 || !v8)
    {
      id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[MOPersistenceManager getCollectionDate]();
      }
    }
    else
    {
      id v9 = [v8 objectForKey:@"lastCollectTriggerDate"];
      unsigned __int8 v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
      id v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v15 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "The most recent collection date was successfully read from plist, %@", buf, 0xCu);
        }
        goto LABEL_17;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[MOPersistenceManager getCollectionDate]();
      }
    }
    id v9 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = @"lastCollection.plist";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "File %@ doesn't exists.", buf, 0xCu);
  }
  id v9 = 0;
LABEL_18:

  return v9;
}

+ (id)getBundlingJSONURLWithTrigger:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 - 1 < 5 && ((0x1Bu >> v3) & 1) != 0)
  {
    unsigned int v5 = +[MOPersistenceUtilities getBundlingJSONURLWithDirectorySuffix:*(&off_1002CEFF0 + v3)];
  }
  else
  {
    uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[MOPersistenceManager getBundlingJSONURLWithTrigger:]();
    }

    unsigned int v5 = 0;
  }

  return v5;
}

- (int)_acquireBackgroundAssertionForFileDescriptor:(int)a3
{
  uint64_t v4 = [(MOPersistenceManager *)self configurationManager];
  [v4 getDoubleSettingForKey:@"persistenceDriverBackgroundProcessingAssertionDuration" withFallback:86400.0];
  double v6 = v5;

  v8[0] = 0;
  v8[1] = (unint64_t)(v6 * 1000000000.0);
  return fcntl(a3, 108, v8);
}

- (int)_getFileDescriptorForPersistenceStoreFile:(id)a3
{
  return open_dprotected_np((const char *)[a3 UTF8String], 2, 2, 0, 416);
}

+ (id)protectedStoreFilesExtensions
{
  uint64_t v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  if (!protectedStoreFilesExtensions_cacheFilesExtensions)
  {
    uint64_t v3 = +[NSArray arrayWithObjects:@"sqlite", @"sqlite-wal", @"sqlite-shm", 0];
    uint64_t v4 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
    protectedStoreFilesExtensions_cacheFilesExtensions = v3;

    uint64_t v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  }

  return v2;
}

- (BOOL)_acquireBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 path];
  unsigned __int8 v10 = [v9 stringByReplacingOccurrencesOfString:@"sqlite" withString:v8];

  uint64_t v11 = [(MOPersistenceManager *)self _getFileDescriptorForPersistenceStoreFile:v10];
  if ((v11 & 0x80000000) != 0)
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MOPersistenceManager _acquireBackgroundProcessingPermissionForStoreURL:cacheFileExtension:]((uint64_t)v10, v14);
    }
    goto LABEL_7;
  }
  unsigned int v12 = [(MOPersistenceManager *)self _acquireBackgroundAssertionForFileDescriptor:v11];
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v15 = NSStringFromSelector(a2);
      int v16 = *__error();
      uint8_t v17 = __error();
      v18 = strerror(*v17);
      int v22 = 138413314;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 1024;
      *(_DWORD *)char v27 = v12;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = v16;
      __int16 v28 = 2080;
      v29 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ Fail to acquire background processing assertion for the persistence store file %@ with code error %d and errno %d %s", (uint8_t *)&v22, 0x2Cu);
    }
LABEL_7:
    BOOL v19 = 0;
    goto LABEL_8;
  }
  BOOL v19 = 1;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v21 = NSStringFromSelector(a2);
    int v22 = 138412802;
    uint64_t v23 = v21;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    *(void *)char v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ Succeed to acquire background processing assertion for the persistence store type %@ and the extension %@", (uint8_t *)&v22, 0x20u);
  }
LABEL_8:

  return v19;
}

- (BOOL)_acquireBackgroundProcessingPermissions
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = +[MOPersistenceManager protectedStoreFilesExtensions];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = +[MOPersistenceManager defaultStoresDirectory];
        LODWORD(v8) = [(MOPersistenceManager *)self _acquireBackgroundProcessingPermissionForStoreURL:v9 cacheFileExtension:v8];

        if (!v8)
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)acquireBackgroundProcessingPermissions
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(MOPersistenceManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __62__MOPersistenceManager_acquireBackgroundProcessingPermissions__block_invoke;
  v5[3] = &unk_1002CEC88;
  v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

id __62__MOPersistenceManager_acquireBackgroundProcessingPermissions__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _acquireBackgroundProcessingPermissions];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (NSManagedObjectModel)managedObjectModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 24, 1);
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 32, 1);
}

- (NSURL)modelsDirectory
{
  return self->_modelsDirectory;
}

- (NSURL)storesDirectory
{
  return self->_storesDirectory;
}

- (MODispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_storesDirectory, 0);
  objc_storeStrong((id *)&self->_modelsDirectory, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);

  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)initWithUniverse:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: notifier", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __48__MOPersistenceManager_registerForNotifications__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Locked status changed %@", v2, v3, v4, v5, v6);
}

- (void)onLockStateChangeNotification:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "store is already loaded and available so unregister for lock state change notification", v1, 2u);
}

void __33__MOPersistenceManager_loadStore__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "load store successfully", v1, 2u);
}

void __33__MOPersistenceManager_loadStore__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fail to load store, error, %@", v2, v3, v4, v5, v6);
}

+ (void)defaultModelsDirectory
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "resourceURL, %@", v2, v3, v4, v5, v6);
}

+ (void)defaultStoresDirectory
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "storepath, %@", v2, v3, v4, v5, v6);
}

+ (void)getCollectionDate
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "couldn't read a valid last collection date.", v2, v3, v4, v5, v6);
}

+ (void)getBundlingJSONURLWithTrigger:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "No known data dump trigger source.", v2, v3, v4, v5, v6);
}

- (void)_acquireBackgroundProcessingPermissionForStoreURL:(uint64_t)a1 cacheFileExtension:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v4 = *__error();
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "acquireBackgroundProcessing:Unable to to get the file descriptor for the file %@ with data protection, errno, %{errno}d", (uint8_t *)&v5, 0x12u);
}

@end