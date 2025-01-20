@interface _DASCoreDataStorage
+ (BOOL)createDatabaseDirectory:(id)a3 error:(id *)a4;
+ (id)persistentStoreOptionsFor:(id)a3 readOnly:(BOOL)a4;
+ (id)storageWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6;
- (BOOL)deleteDatabaseForPSC:(id)a3 protectionClass:(id)a4 obliterate:(BOOL)a5;
- (BOOL)deleteStorageFor:(id)a3 obliterate:(BOOL)a4;
- (BOOL)readOnly;
- (NSDictionary)paths;
- (NSManagedObjectModel)managedObjectModel;
- (NSMutableDictionary)managedObjectContexts;
- (NSMutableDictionary)persistentStoreCoordinators;
- (NSString)databaseDirectory;
- (NSString)databaseName;
- (NSURL)modelURL;
- (OS_dispatch_queue)mocQueue;
- (OS_dispatch_queue)pscQueue;
- (_DASCoreDataStorage)init;
- (_DASCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6;
- (_DASDataProtectionStateMonitor)dataProtectionMonitor;
- (id)mocForProtectionClass:(id)a3;
- (id)persistentStoreCoordinatorFor:(id)a3;
- (void)handleDataProtectionChangeFor:(id)a3 willBeAvailable:(BOOL)a4;
- (void)invalidateManagedObjectContextFor:(id)a3;
- (void)invalidatePersistentStoreCoordinatorFor:(id)a3;
- (void)setManagedObjectModel:(id)a3;
@end

@implementation _DASCoreDataStorage

- (_DASCoreDataStorage)init
{
  return 0;
}

+ (id)storageWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithDirectory:v12 databaseName:v11 modelURL:v10 readOnly:v6];

  return v13;
}

- (_DASCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  id v35 = a3;
  id v36 = a4;
  id v37 = a5;
  v41.receiver = self;
  v41.super_class = (Class)_DASCoreDataStorage;
  id v11 = [(_DASCoreDataStorage *)&v41 init];
  id v12 = v11;
  if (v11)
  {
    p_databaseDirectory = &v11->_databaseDirectory;
    objc_storeStrong((id *)&v11->_databaseDirectory, a3);
    objc_storeStrong((id *)&v12->_databaseName, a4);
    objc_storeStrong((id *)&v12->_modelURL, a5);
    v12->_readOnly = a6;
    dispatch_queue_t v14 = dispatch_queue_create("_DASCoreDataStore.mocQueue", 0);
    mocQueue = v12->_mocQueue;
    v12->_mocQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("_DASCoreDataStore.queuePSC", 0);
    pscQueue = v12->_pscQueue;
    v12->_pscQueue = (OS_dispatch_queue *)v16;

    v18 = +[NSString stringWithFormat:@"%@/%@", *p_databaseDirectory, v12->_databaseName];
    v19 = +[NSString stringWithFormat:@"%@%@.db", v18, @"ClassA"];
    v20 = +[NSString stringWithFormat:@"%@%@.db", v18, @"ClassC"];
    v21 = +[NSString stringWithFormat:@"%@%@.db", v18, @"ClassD"];
    v22 = +[_DASDataProtectionStateMonitor dataProtectionClassA];
    v42[0] = v22;
    v43[0] = v19;
    v23 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
    v42[1] = v23;
    v43[1] = v20;
    v24 = +[_DASDataProtectionStateMonitor dataProtectionClassD];
    v42[2] = v24;
    v43[2] = v21;
    uint64_t v25 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
    paths = v12->_paths;
    v12->_paths = (NSDictionary *)v25;

    managedObjectModel = v12->_managedObjectModel;
    v12->_managedObjectModel = 0;

    uint64_t v28 = +[NSMutableDictionary dictionary];
    managedObjectContexts = v12->_managedObjectContexts;
    v12->_managedObjectContexts = (NSMutableDictionary *)v28;

    uint64_t v30 = +[NSMutableDictionary dictionary];
    persistentStoreCoordinators = v12->_persistentStoreCoordinators;
    v12->_persistentStoreCoordinators = (NSMutableDictionary *)v30;

    uint64_t v32 = objc_opt_new();
    dataProtectionMonitor = v12->_dataProtectionMonitor;
    v12->_dataProtectionMonitor = (_DASDataProtectionStateMonitor *)v32;

    objc_initWeak(&location, v12);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100033390;
    v38[3] = &unk_100175430;
    objc_copyWeak(&v39, &location);
    [(_DASDataProtectionStateMonitor *)v12->_dataProtectionMonitor setChangeHandler:v38];
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  return v12;
}

- (void)handleDataProtectionChangeFor:(id)a3 willBeAvailable:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    [(_DASCoreDataStorage *)self invalidateManagedObjectContextFor:v6];
    [(_DASCoreDataStorage *)self invalidatePersistentStoreCoordinatorFor:v6];
  }
}

- (void)invalidateManagedObjectContextFor:(id)a3
{
  id v4 = a3;
  mocQueue = self->_mocQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000334F8;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(mocQueue, v7);
}

- (void)invalidatePersistentStoreCoordinatorFor:(id)a3
{
  id v4 = a3;
  pscQueue = self->_pscQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033690;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(pscQueue, v7);
}

- (NSManagedObjectModel)managedObjectModel
{
  managedObjectModel = self->_managedObjectModel;
  if (managedObjectModel) {
    goto LABEL_4;
  }
  if (self->_modelURL)
  {
    id v4 = (NSManagedObjectModel *)[objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:self->_modelURL];
    v5 = self->_managedObjectModel;
    self->_managedObjectModel = v4;

    managedObjectModel = self->_managedObjectModel;
LABEL_4:
    id v6 = managedObjectModel;
    goto LABEL_5;
  }
  NSLog(@"Missing model URL!", a2);
  id v6 = 0;
LABEL_5:

  return v6;
}

+ (id)persistentStoreOptionsFor:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v9[0] = NSPersistentStoreConnectionPoolMaxSizeKey;
  v9[1] = NSMigratePersistentStoresAutomaticallyOption;
  v10[0] = &off_100186B98;
  v10[1] = &__kCFBooleanTrue;
  v10[2] = &__kCFBooleanTrue;
  v9[2] = NSInferMappingModelAutomaticallyOption;
  v9[3] = NSReadOnlyPersistentStoreOption;
  id v5 = a3;
  id v6 = +[NSNumber numberWithBool:v4];
  v9[4] = NSPersistentStoreFileProtectionKey;
  v10[3] = v6;
  v10[4] = v5;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (id)persistentStoreCoordinatorFor:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(_DASDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:v4];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100033B00;
  v23 = sub_100033B10;
  id v24 = 0;
  uint64_t v15 = 0;
  dispatch_queue_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  pscQueue = self->_pscQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033B18;
  block[3] = &unk_100175B80;
  id v12 = &v19;
  block[4] = self;
  id v7 = v4;
  unsigned __int8 v14 = v5;
  id v11 = v7;
  id v13 = &v15;
  dispatch_sync(pscQueue, block);
  if (*((unsigned char *)v16 + 24))
  {
    [(_DASCoreDataStorage *)self invalidatePersistentStoreCoordinatorFor:v7];
    id v8 = 0;
  }
  else
  {
    id v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (id)mocForProtectionClass:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(_DASDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:v4];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100033B00;
  v23 = sub_100033B10;
  id v24 = 0;
  uint64_t v15 = 0;
  dispatch_queue_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  mocQueue = self->_mocQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033FF4;
  block[3] = &unk_100175B80;
  id v12 = &v19;
  block[4] = self;
  id v7 = v4;
  unsigned __int8 v14 = v5;
  id v11 = v7;
  id v13 = &v15;
  dispatch_sync(mocQueue, block);
  if (*((unsigned char *)v16 + 24))
  {
    [(_DASCoreDataStorage *)self invalidateManagedObjectContextFor:v7];
    id v8 = 0;
  }
  else
  {
    id v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (BOOL)deleteDatabaseForPSC:(id)a3 protectionClass:(id)a4 obliterate:(BOOL)a5
{
  BOOL readOnly = self->_readOnly;
  if (!self->_readOnly)
  {
    BOOL v6 = a5;
    paths = self->_paths;
    id v9 = a3;
    id v10 = [(NSDictionary *)paths objectForKeyedSubscript:a4];
    id v11 = +[NSURL fileURLWithPath:v10];

    if (v6)
    {
      v19[0] = NSPersistentStoreUnlinkDestroyOption;
      v19[1] = NSPersistentStoreForceDestroyOption;
      v20[0] = &__kCFBooleanTrue;
      v20[1] = &__kCFBooleanTrue;
      id v12 = (void **)v20;
      id v13 = v19;
      uint64_t v14 = 2;
    }
    else
    {
      uint64_t v17 = NSPersistentStoreUnlinkDestroyOption;
      char v18 = &__kCFBooleanTrue;
      id v12 = &v18;
      id v13 = &v17;
      uint64_t v14 = 1;
    }
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v13 count:v14];
    [v9 _destroyPersistentStoreAtURL:v11 withType:NSSQLiteStoreType options:v15 error:0];
  }
  return !readOnly;
}

- (BOOL)deleteStorageFor:(id)a3 obliterate:(BOOL)a4
{
  id v6 = a3;
  if (self->_readOnly)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [(_DASCoreDataStorage *)self mocForProtectionClass:v6];
    if (v8)
    {
      id v9 = [(_DASCoreDataStorage *)self persistentStoreCoordinatorFor:v6];
      if (v9)
      {
        uint64_t v16 = 0;
        uint64_t v17 = &v16;
        uint64_t v18 = 0x2020000000;
        char v19 = 0;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100034404;
        v11[3] = &unk_100175BA8;
        v11[4] = self;
        id v12 = v6;
        uint64_t v14 = &v16;
        id v13 = v9;
        BOOL v15 = a4;
        [v8 performWithOptions:4 andBlock:v11];
        BOOL v7 = *((unsigned char *)v17 + 24) != 0;

        _Block_object_dispose(&v16, 8);
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

+ (BOOL)createDatabaseDirectory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  BOOL v7 = +[NSURL fileURLWithPath:v5 isDirectory:1];

  LOBYTE(a4) = [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a4];
  return (char)a4;
}

- (NSString)databaseDirectory
{
  return self->_databaseDirectory;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setManagedObjectModel:(id)a3
{
}

- (NSMutableDictionary)managedObjectContexts
{
  return self->_managedObjectContexts;
}

- (NSMutableDictionary)persistentStoreCoordinators
{
  return self->_persistentStoreCoordinators;
}

- (OS_dispatch_queue)mocQueue
{
  return self->_mocQueue;
}

- (OS_dispatch_queue)pscQueue
{
  return self->_pscQueue;
}

- (_DASDataProtectionStateMonitor)dataProtectionMonitor
{
  return self->_dataProtectionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_pscQueue, 0);
  objc_storeStrong((id *)&self->_mocQueue, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinators, 0);
  objc_storeStrong((id *)&self->_managedObjectContexts, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);

  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

@end