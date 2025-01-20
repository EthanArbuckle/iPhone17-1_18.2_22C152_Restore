@interface MOContextPersistenceManager
+ (id)createModel;
+ (id)currentManagedObjectModelWithClientID:(id)a3;
+ (id)modelsDirectory;
+ (id)protectedStoreFilesExtensions;
+ (id)storeDirectoryPathWithSuffix:(id)a3;
+ (id)storesDirectoryWithClientID:(id)a3;
+ (void)modelsDirectory;
- (BOOL)available;
- (BOOL)loadStore;
- (MOContextPersistenceManager)initWithClientID:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentContainer)persistentContainer;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSURL)modelsDirectory;
- (NSURL)storesDirectory;
- (OS_dispatch_queue)queue;
- (int)_acquireBackgroundAssertionForFileDescriptor:(int)a3;
- (int)_getFileDescriptorForPersistenceStoreFile:(id)a3;
- (unint64_t)_acquireBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4;
- (unint64_t)acquireBackgroundProcessingPermissionsWithClientID:(id)a3;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
@end

@implementation MOContextPersistenceManager

- (MOContextPersistenceManager)initWithClientID:(id)a3
{
  id v4 = a3;
  v5 = +[MOContextPersistenceManager modelsDirectory];
  v6 = +[MOContextPersistenceManager storesDirectoryWithClientID:v4];
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)MOContextPersistenceManager;
    v9 = [(MOContextPersistenceManager *)&v29 init];
    objc_storeStrong((id *)&v9->_modelsDirectory, v5);
    objc_storeStrong((id *)&v9->_storesDirectory, v6);
    v10 = +[MOContextPersistenceManager currentManagedObjectModelWithClientID:v4];
    v11 = (NSPersistentContainer *)[objc_alloc((Class)NSPersistentContainer) initWithName:@"personalizedsensing" managedObjectModel:v10];
    persistentContainer = v9->_persistentContainer;
    v9->_persistentContainer = v11;

    v13 = objc_opt_new();
    [v13 setShouldAddStoreAsynchronously:0];
    [v13 setShouldMigrateStoreAutomatically:1];
    [v13 setShouldInferMappingModelAutomatically:1];
    [v13 setURL:v9->_storesDirectory];
    [v13 setType:NSSQLiteStoreType];
    [v13 setOption:NSFileProtectionCompleteUnlessOpen forKey:NSPersistentStoreFileProtectionKey];
    v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v13, 0);
    [(NSPersistentContainer *)v9->_persistentContainer setPersistentStoreDescriptions:v14];

    v15 = [(NSPersistentContainer *)v9->_persistentContainer newBackgroundContext];
    managedObjectContext = v9->_managedObjectContext;
    v9->_managedObjectContext = v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("MOContextPersistenceManager", v17);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v18;

    v20 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[MOContextPersistenceManager initWithClientID:]((uint64_t)&v9->_managedObjectContext, v20, v22, v23, v24, v25, v26, v27);
    }

    self = v9;
    v8 = self;
  }

  return v8;
}

- (BOOL)available
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_available && [(MOContextPersistenceManager *)v2 loadStore]) {
    v2->_available = 1;
  }
  objc_sync_exit(v2);

  return v2->_available;
}

- (BOOL)loadStore
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v3 = [(NSPersistentContainer *)self->_persistentContainer persistentStoreCoordinator];
  id v4 = [v3 persistentStores];
  id v5 = [v4 count];

  if (v5)
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "store is already loaded", v11, 2u);
    }
  }
  else
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    persistentContainer = self->_persistentContainer;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __40__MOContextPersistenceManager_loadStore__block_invoke;
    v12[3] = &unk_1000A6998;
    v14 = &v15;
    v6 = v7;
    v13 = v6;
    [(NSPersistentContainer *)persistentContainer loadPersistentStoresWithCompletionHandler:v12];
    dispatch_semaphore_wait(v6, 0x1EuLL);
  }
  char v9 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void __40__MOContextPersistenceManager_loadStore__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __40__MOContextPersistenceManager_loadStore__block_invoke_cold_2();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __40__MOContextPersistenceManager_loadStore__block_invoke_cold_1(v6);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  [(MOContextPersistenceManager *)self managedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __44__MOContextPersistenceManager_performBlock___block_invoke;
  v7[3] = &unk_1000A4AD8;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v8;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __44__MOContextPersistenceManager_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  [(MOContextPersistenceManager *)self managedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __51__MOContextPersistenceManager_performBlockAndWait___block_invoke;
  v7[3] = &unk_1000A4AD8;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v8;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __51__MOContextPersistenceManager_performBlockAndWait___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)modelsDirectory
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 resourceURL];
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[MOContextPersistenceManager modelsDirectory].cold.4();
  }

  id v5 = [@"personalizedsensing" stringByAppendingPathExtension:@"momd"];
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[MOContextPersistenceManager modelsDirectory]();
  }

  id v7 = [objc_alloc((Class)NSURL) initFileURLWithPath:v5 relativeToURL:v3];
  id v13 = 0;
  unsigned int v8 = [v7 checkResourceIsReachableAndReturnError:&v13];
  id v9 = v13;
  if (v8)
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MOContextPersistenceManager modelsDirectory]();
    }
  }
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[MOContextPersistenceManager modelsDirectory]();
  }

  return v7;
}

+ (id)storesDirectoryWithClientID:(id)a3
{
  v3 = [a1 storeDirectoryPathWithSuffix:a3];
  if (v3)
  {
    id v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
    id v5 = [v4 URLByAppendingPathComponent:@"contextsDataModel.sqlite"];
    if (MGGetBoolAnswer())
    {
      id v6 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        +[MOContextPersistenceManager storesDirectoryWithClientID:]();
      }
    }
  }
  else
  {
    id v4 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[MOContextPersistenceManager storesDirectoryWithClientID:](v4);
    }
    id v5 = 0;
  }

  return v5;
}

+ (id)currentManagedObjectModelWithClientID:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__MOContextPersistenceManager_currentManagedObjectModelWithClientID___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentManagedObjectModelWithClientID__onceToken != -1) {
    dispatch_once(&currentManagedObjectModelWithClientID__onceToken, block);
  }
  v3 = (void *)currentManagedObjectModelWithClientID___model;
  return v3;
}

uint64_t __69__MOContextPersistenceManager_currentManagedObjectModelWithClientID___block_invoke(uint64_t a1)
{
  currentManagedObjectModelWithClientID___model = [*(id *)(a1 + 32) createModel];
  return _objc_release_x1();
}

+ (id)createModel
{
  id v3 = objc_alloc((Class)NSManagedObjectModel);
  id v4 = [a1 modelsDirectory];
  id v5 = [v3 initWithContentsOfURL:v4];

  return v5;
}

+ (id)storeDirectoryPathWithSuffix:(id)a3
{
  id v3 = a3;
  id v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([v4 count])
  {
    id v5 = [v4 firstObject];
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "user cache path, %@", buf, 0xCu);
    }

    id v7 = [v5 stringByAppendingPathComponent:@"com.apple.momentsd"];
    unsigned int v8 = [v7 stringByAppendingPathComponent:@"personalizedSensing"];
    id v9 = [v8 stringByAppendingPathComponent:v3];

    if (!v9) {
      goto LABEL_8;
    }
    v10 = +[NSFileManager defaultManager];
    unsigned __int8 v11 = [v10 fileExistsAtPath:v9];

    if (v11) {
      goto LABEL_8;
    }
    v12 = +[NSFileManager defaultManager];
    id v18 = 0;
    unsigned int v13 = [v12 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v14 = v18;

    if (!v13 || v14)
    {
      uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[MOContextPersistenceManager storeDirectoryPathWithSuffix:]();
      }

      id v15 = 0;
    }
    else
    {
LABEL_8:
      id v15 = v9;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (int)_acquireBackgroundAssertionForFileDescriptor:(int)a3
{
  long long v4 = xmmword_10009B3D0;
  return fcntl(a3, 108, &v4);
}

- (int)_getFileDescriptorForPersistenceStoreFile:(id)a3
{
  id v3 = a3;
  long long v4 = (const char *)[v3 UTF8String];
  if (MGGetBoolAnswer())
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "file to open: %@", buf, 0xCu);
    }
  }
  int v6 = open_dprotected_np(v4, 2, 2, 0, 416);
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v10) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "fd: %d", buf, 8u);
  }

  return v6;
}

+ (id)protectedStoreFilesExtensions
{
  v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  if (!protectedStoreFilesExtensions_cacheFilesExtensions)
  {
    uint64_t v3 = +[NSArray arrayWithObjects:@"sqlite", @"sqlite-wal", @"sqlite-shm", 0];
    long long v4 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
    protectedStoreFilesExtensions_cacheFilesExtensions = v3;

    v2 = (void *)protectedStoreFilesExtensions_cacheFilesExtensions;
  }
  return v2;
}

- (unint64_t)_acquireBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 path];
  id v10 = [v9 stringByReplacingOccurrencesOfString:@"sqlite" withString:v8];

  memset(&v25, 0, sizeof(v25));
  id v11 = v10;
  stat((const char *)objc_msgSend(v11, "UTF8String", 0), &v25);
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    __darwin_ino64_t st_ino = v25.st_ino;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "acquireBackgroundProcessing, file ID, %llu", buf, 0xCu);
  }

  uint64_t v13 = [(MOContextPersistenceManager *)self _getFileDescriptorForPersistenceStoreFile:v11];
  if ((v13 & 0x80000000) != 0)
  {
    id v18 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MOContextPersistenceManager _acquireBackgroundProcessingPermissionForStoreURL:cacheFileExtension:]((uint64_t)v11, v18);
    }

    unint64_t v17 = 6;
  }
  else
  {
    unsigned int v14 = [(MOContextPersistenceManager *)self _acquireBackgroundAssertionForFileDescriptor:v13];
    id v15 = _mo_log_facility_get_os_log(&MOLogFacilityContextPersistence);
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v21 = NSStringFromSelector(a2);
        int v22 = *__error();
        uint64_t v23 = __error();
        uint64_t v24 = strerror(*v23);
        *(_DWORD *)buf = 138413314;
        __darwin_ino64_t st_ino = (__darwin_ino64_t)v21;
        __int16 v28 = 2112;
        id v29 = v7;
        __int16 v30 = 1024;
        *(_DWORD *)v31 = v14;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = v22;
        __int16 v32 = 2080;
        v33 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ Fail to acquire background processing assertion for the persistence store file %@ with code error %d and errno %d %s", buf, 0x2Cu);
      }
      if (*__error() == 16)
      {
        unint64_t v17 = 2;
      }
      else if (*__error() == 1)
      {
        unint64_t v17 = 3;
      }
      else if (*__error() == 22)
      {
        unint64_t v17 = 4;
      }
      else if (*__error() == 45)
      {
        unint64_t v17 = 5;
      }
      else
      {
        unint64_t v17 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v19 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __darwin_ino64_t st_ino = (__darwin_ino64_t)v19;
        __int16 v28 = 2112;
        id v29 = v7;
        __int16 v30 = 2112;
        *(void *)v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@ Succeed to acquire background processing assertion for the persistence store type %@ and the extension %@", buf, 0x20u);
      }
      unint64_t v17 = 1;
    }
  }

  return v17;
}

- (unint64_t)acquireBackgroundProcessingPermissionsWithClientID:(id)a3
{
  id v4 = a3;
  [(MOContextPersistenceManager *)self loadStore];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = +[MOContextPersistenceManager protectedStoreFilesExtensions];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
      id v11 = +[MOContextPersistenceManager storesDirectoryWithClientID:v4];
      unint64_t v12 = [(MOContextPersistenceManager *)self _acquireBackgroundProcessingPermissionForStoreURL:v11 cacheFileExtension:v10];

      if (v12 != 1) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    unint64_t v12 = 1;
  }

  return v12;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (NSManagedObjectModel)managedObjectModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 24, 1);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return (NSPersistentStoreCoordinator *)objc_getProperty(self, a2, 32, 1);
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)modelsDirectory
{
  return self->_modelsDirectory;
}

- (NSURL)storesDirectory
{
  return self->_storesDirectory;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_storesDirectory, 0);
  objc_storeStrong((id *)&self->_modelsDirectory, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)initWithClientID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __40__MOContextPersistenceManager_loadStore__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "load store successfully", v1, 2u);
}

void __40__MOContextPersistenceManager_loadStore__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "fail to load store, error, %@", v1, 0xCu);
}

+ (void)modelsDirectory
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "resourceURL, %@", v2, v3, v4, v5, v6);
}

+ (void)storesDirectoryWithClientID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to get cache directory, nil cache directory.", v1, 2u);
}

+ (void)storesDirectoryWithClientID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "storepath, %@", v2, v3, v4, v5, v6);
}

+ (void)storeDirectoryPathWithSuffix:.cold.1()
{
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "failed to create %@, error, %@", v2, 0x16u);
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