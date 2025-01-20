@interface CLPersistenceManager
+ (id)defaultModelsDirectory;
+ (id)defaultStoresDirectory;
+ (id)getStoreURLFromDirectory:(id)a3;
+ (void)deleteDefaultStoreFileFromDisk;
+ (void)deleteStoreFile:(id)a3;
- (BOOL)_isStoreConnected;
- (BOOL)connectToStore;
- (BOOL)disconnectFromStore;
- (BOOL)useCloudKit;
- (CLPersistenceManager)initWithDefaultDirectories:(BOOL)a3;
- (CLPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 useCloudKit:(BOOL)a5;
- (CLPersistenceStore)persistenceStore;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentCloudKitContainer)persistentCloudKitContainer;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)createManagedObjectContext;
- (void)dealloc;
- (void)initializeCloudKitSchema;
- (void)setPersistenceStore:(id)a3;
- (void)setPersistentCloudKitContainer:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
- (void)setUseCloudKit:(BOOL)a3;
@end

@implementation CLPersistenceManager

- (CLPersistenceManager)initWithDefaultDirectories:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[CLPersistenceManager defaultModelsDirectory];
  id v6 = +[CLPersistenceManager defaultStoresDirectory];

  return [(CLPersistenceManager *)self initWithModelsDirectory:v5 storesDirectory:v6 useCloudKit:v3];
}

- (CLPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 useCloudKit:(BOOL)a5
{
  if (([a3 isFileURL] & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLPersistenceManager.m", 31, @"Invalid parameter not satisfying: %@", @"modelsDirectory.isFileURL" object file lineNumber description];
  }
  if (([a4 isFileURL] & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLPersistenceManager.m", 32, @"Invalid parameter not satisfying: %@", @"storesDirectory.isFileURL" object file lineNumber description];
  }
  if ([a3 isFileURL] && objc_msgSend(a4, "isFileURL"))
  {
    self->_useCloudKit = a5;
    v15.receiver = self;
    v15.super_class = (Class)CLPersistenceManager;
    v10 = [(CLPersistenceManager *)&v15 init];
    if (!v10)
    {
LABEL_16:
      NSLog(@"CoreData, PersistenceManager initialized with models directory %@ and stores directory %@", v10->_modelsDirectory, v10->_storesDirectory);
      return v10;
    }
    v10->_modelsDirectory = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", [a3 path], 1);
    v10->_storesDirectory = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", [a4 path], 1);
    v11 = (NSManagedObjectModel *)[objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v10->_modelsDirectory];
    v10->_managedObjectModel = v11;
    if (v11)
    {
      NSLog(@"CoreData, Initialized NSManagedObjectModel from URL: %@", v10->_modelsDirectory);
      NSLog(@"CoreData, Loaded ManagedObjectModel Version: %@", [(NSManagedObjectModel *)v10->_managedObjectModel versionIdentifiers]);
      if (v10->_useCloudKit)
      {
        v12 = (objc_class *)[objc_alloc((Class)NSPersistentCloudKitContainer) initWithName:@"CoreLocation" managedObjectModel:v10->_managedObjectModel];
        uint64_t v13 = 56;
      }
      else
      {
        v12 = (objc_class *)[objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v10->_managedObjectModel];
        uint64_t v13 = 40;
      }
      *(Class *)((char *)&v10->super.isa + v13) = v12;
      v10->_lock._os_unfair_lock_opaque = 0;
      goto LABEL_16;
    }
    NSLog(@"CoreData, Failed to initialize persistence model from URL: %@", v10->_modelsDirectory);
  }
  return 0;
}

- (void)initializeCloudKitSchema
{
  uint64_t v2 = 0;
  if ([(NSPersistentCloudKitContainer *)self->_persistentCloudKitContainer initializeCloudKitSchemaWithOptions:0 error:&v2])
  {
    NSLog(@"CoreData+CloudKit, initializeCloudKitSchema, Successfully initialized CloudKit schema!");
  }
  else
  {
    NSLog(@"CoreData+CloudKit, initializeCloudKitSchema, Failed to initialize CloudKit schema: %@", v2);
  }
}

+ (id)getStoreURLFromDirectory:(id)a3
{
  id v3 = [a3 URLByAppendingPathComponent:@"CoreData"];

  return _[v3 URLByAppendingPathExtension:@"sqlite"];
}

- (BOOL)connectToStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(CLPersistenceManager *)self _isStoreConnected])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [[CLPersistenceStore alloc] initWithURL:+[CLPersistenceManager getStoreURLFromDirectory:self->_storesDirectory] useCloudKit:self->_useCloudKit];
    self->_persistenceStore = v5;
    if (self->_useCloudKit)
    {
      id v6 = [(CLPersistenceStore *)v5 persistentStoreDescription];
      persistentCloudKitContainer = self->_persistentCloudKitContainer;
      id v15 = v6;
      [(NSPersistentCloudKitContainer *)persistentCloudKitContainer setPersistentStoreDescriptions:+[NSArray arrayWithObjects:&v15 count:1]];
      uint64_t v11 = 0;
      v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      v8 = self->_persistentCloudKitContainer;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1010CCF64;
      v10[3] = &unk_10230F7A0;
      v10[4] = &v11;
      [(NSPersistentCloudKitContainer *)v8 loadPersistentStoresWithCompletionHandler:v10];
      unsigned __int8 v4 = *((unsigned char *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }
    else
    {
      unsigned __int8 v4 = [(CLPersistenceStore *)v5 loadWithCoordinator:self->_persistentStoreCoordinator];
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)disconnectFromStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(CLPersistenceManager *)self _isStoreConnected])
  {
    persistentCloudKitContainer = self->_persistentCloudKitContainer;
    if (persistentCloudKitContainer)
    {
      persistentStoreCoordinator = (NSPersistentStoreCoordinator *)[(NSPersistentCloudKitContainer *)persistentCloudKitContainer persistentStoreCoordinator];
      self->_persistentStoreCoordinator = persistentStoreCoordinator;
    }
    else
    {
      persistentStoreCoordinator = self->_persistentStoreCoordinator;
    }
    uint64_t v10 = 0;
    id v7 = [(NSArray *)[(NSPersistentStoreCoordinator *)persistentStoreCoordinator persistentStores] firstObject];
    [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator removePersistentStore:v7 error:&v10];
    if (v10)
    {
      id v8 = [v7 URL];
      NSLog(@"Failed to disconnect from store %@ with error %@", v8, v10);
    }
    unsigned int v6 = ![(CLPersistenceManager *)self _isStoreConnected];
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)createManagedObjectContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (![(CLPersistenceManager *)self _isStoreConnected])
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CLPersistenceManager.m" lineNumber:185 description:@"Unable to create managed object context since no store is connected"];
    goto LABEL_5;
  }
  id v5 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  [v5 setMergePolicy:+[NSMergePolicy errorMergePolicy](NSMergePolicy, "errorMergePolicy")];
  [v5 setPersistentStoreCoordinator:-[CLPersistenceManager persistentStoreCoordinator](self, "persistentStoreCoordinator")];
  [v5 setName:[+[NSProcessInfo processInfo](NSProcessInfo, "processInfo") processName]];
  [v5 setTransactionAuthor:[v5 name]];
  [v5 setUndoManager:0];
  if (!v5)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CLPersistenceManager.m" lineNumber:207 description:@"Failed to create a valid managed object context."];
LABEL_5:
    id v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

+ (id)defaultModelsDirectory
{
  unsigned __int8 v4 = +[NSBundle bundleWithIdentifier:@"com.apple.corelocation"];
  NSLog(@"coreLocationFrameworkBundle: %@", v4);
  id v5 = [(NSBundle *)v4 pathForResource:@"CoreLocationCoreDataModel" ofType:@"momd"];
  if (!v5) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"CLPersistenceManager.m" lineNumber:224 description:@"Failed to find models directory!"];
  }

  return +[NSURL fileURLWithPath:v5 isDirectory:1];
}

+ (id)defaultStoresDirectory
{
  if ([+[NSFileManager defaultManager] fileExistsAtPath:@"/var/root/Library/Caches/locationd"])
  {
    return +[NSURL fileURLWithPath:@"/var/root/Library/Caches/locationd" isDirectory:1];
  }
  uint64_t v4 = 0;
  if ([+[NSFileManager defaultManager] createDirectoryAtPath:@"/var/root/Library/Caches/locationd" withIntermediateDirectories:1 attributes:0 error:&v4]&& v4 == 0)
  {
    return +[NSURL fileURLWithPath:@"/var/root/Library/Caches/locationd" isDirectory:1];
  }
  NSLog(@"CoreData, Failed to create %@, error, %@", @"/var/root/Library/Caches/locationd", v4);
  return 0;
}

+ (void)deleteStoreFile:(id)a3
{
  if (a3)
  {
    if ([+[NSFileManager defaultManager] fileExistsAtPath:a3])
    {
      uint64_t v5 = 0;
      if ([+[NSFileManager defaultManager] removeItemAtPath:a3 error:&v5])
      {
        BOOL v4 = v5 == 0;
      }
      else
      {
        BOOL v4 = 0;
      }
      if (v4) {
        NSLog(@"CoreData, successfully deleted store file %@", a3);
      }
      else {
        NSLog(@"CoreData, failed to delete store file %@, error, %@", a3, v5);
      }
    }
    else
    {
      NSLog(@"CoreData, skip deleting store file %@ as it does not exist", a3);
    }
  }
}

+ (void)deleteDefaultStoreFileFromDisk
{
  id v3 = +[CLPersistenceManager getStoreURLFromDirectory:](CLPersistenceManager, "getStoreURLFromDirectory:", +[CLPersistenceManager defaultStoresDirectory]);
  if (v3)
  {
    id v4 = [v3 path];
    [a1 deleteStoreFile:v4];
    [a1 deleteStoreFile:[v4 stringByAppendingString:@"-shm"]];
    id v5 = [v4 stringByAppendingString:@"-wal"];
    [a1 deleteStoreFile:v5];
  }
}

- (BOOL)_isStoreConnected
{
  persistentCloudKitContainer = self->_persistentCloudKitContainer;
  if (persistentCloudKitContainer)
  {
    persistentStoreCoordinator = (NSPersistentStoreCoordinator *)[(NSPersistentCloudKitContainer *)persistentCloudKitContainer persistentStoreCoordinator];
    self->_persistentStoreCoordinator = persistentStoreCoordinator;
  }
  else
  {
    persistentStoreCoordinator = self->_persistentStoreCoordinator;
  }
  return [(NSArray *)[(NSPersistentStoreCoordinator *)persistentStoreCoordinator persistentStores] count] != 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLPersistenceManager;
  [(CLPersistenceManager *)&v3 dealloc];
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (CLPersistenceStore)persistenceStore
{
  return self->_persistenceStore;
}

- (void)setPersistenceStore:(id)a3
{
}

- (NSPersistentCloudKitContainer)persistentCloudKitContainer
{
  return self->_persistentCloudKitContainer;
}

- (void)setPersistentCloudKitContainer:(id)a3
{
}

- (BOOL)useCloudKit
{
  return self->_useCloudKit;
}

- (void)setUseCloudKit:(BOOL)a3
{
  self->_useCloudKit = a3;
}

@end