@interface IMUbiquitousDataProvider
+ (BOOL)ubiquityDebug;
+ (id)managedObjectModelBundle;
+ (id)managedObjectModelName;
+ (id)ubiquityQueue;
+ (void)deleteCloudDataWithCompletion:(id)a3;
+ (void)initialize;
- (BOOL)isEnabled;
- (BOOL)isReady;
- (BOOL)metadataDictionaryDirty;
- (BOOL)saveManagedObjectContext:(id)a3;
- (IMUbiquitousDataProvider)init;
- (IMUbiquitousDataProvider)initWithPersistentStoreURL:(id)a3;
- (IMUbiquitousPersistentStoreLoader)bringUpPersistentStoreLoader;
- (IMUbiquitousPersistentStoreLoader)localPersistentStoreLoader;
- (NSManagedObjectModel)managedObjectModel;
- (NSMutableDictionary)metadataDictionary;
- (NSPersistentStore)currentPersistentStore;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)metadataObjectForKey:(id)a3;
- (id)newManagedObjectContext;
- (id)newManagedObjectContextWithClass:(Class)a3;
- (id)newManagedObjectContextWithClass:(Class)a3 concurrencyType:(unint64_t)a4;
- (int)currentPersistentStoreType;
- (void)applicationDidBecomeActive:(id)a3;
- (void)cacheMetadataDictionary;
- (void)loadBringUpPersistentStore;
- (void)loadCoreData;
- (void)loadLocalPersistentStoreWithCompletionBlock:(id)a3;
- (void)loadManagedObjectModel;
- (void)loadPersistentStore;
- (void)loadPersistentStoreCoordinator;
- (void)removePersistentStores;
- (void)setBringUpPersistentStoreLoader:(id)a3;
- (void)setCurrentPersistentStore:(id)a3;
- (void)setCurrentPersistentStoreType:(int)a3;
- (void)setLocalPersistentStoreLoader:(id)a3;
- (void)setManagedObjectModel:(id)a3;
- (void)setMetadataDictionary:(id)a3;
- (void)setMetadataDictionaryDirty:(BOOL)a3;
- (void)setMetadataObject:(id)a3 forKey:(id)a4;
- (void)setPersistentStoreCoordinator:(id)a3;
@end

@implementation IMUbiquitousDataProvider

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_345650 = (uint64_t)dispatch_queue_create("com.apple.itunesmobile.ubiquity", 0);
    _objc_release_x1();
  }
}

+ (id)ubiquityQueue
{
  return (id)qword_345650;
}

- (IMUbiquitousDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMUbiquitousDataProvider;
  v2 = [(IMUbiquitousDataProvider *)&v6 init];
  if (v2)
  {
    v3 = [[IMUbiquitousPersistentStoreLoader alloc] initWithIdentifier:@"local"];
    localPersistentStoreLoader = v2->_localPersistentStoreLoader;
    v2->_localPersistentStoreLoader = v3;
  }
  __dmb(0xBu);
  return v2;
}

- (IMUbiquitousDataProvider)initWithPersistentStoreURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMUbiquitousDataProvider;
  v5 = [(IMUbiquitousDataProvider *)&v9 init];
  if (v5)
  {
    objc_super v6 = [[IMUbiquitousPersistentStoreLoader alloc] initWithPersistentStoreURL:v4];
    localPersistentStoreLoader = v5->_localPersistentStoreLoader;
    v5->_localPersistentStoreLoader = v6;
  }
  return v5;
}

- (BOOL)isReady
{
  return ([(IMUbiquitousDataProvider *)self currentPersistentStoreType] & 0xFFFFFFFD) != 0;
}

+ (BOOL)ubiquityDebug
{
  if ((byte_345659 & 1) == 0)
  {
    v2 = +[NSProcessInfo processInfo];
    v3 = [v2 environment];
    id v4 = [v3 valueForKey:@"kIMUbiquitousDataProviderDebug"];

    v5 = +[NSUserDefaults standardUserDefaults];
    objc_super v6 = [v5 valueForKey:@"kIMUbiquitousDataProviderDebug"];

    byte_345658 = [v4 isEqualToString:@"YES"];
    unsigned __int8 v7 = [v6 isEqualToString:@"YES"];
    byte_345658 |= v7;
    byte_345659 = 1;
  }
  return byte_345658;
}

- (BOOL)saveManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [(IMUbiquitousDataProvider *)self currentPersistentStore];
  if ([(IMUbiquitousDataProvider *)self metadataDictionaryDirty])
  {
    uint64_t v6 = [(IMUbiquitousDataProvider *)self metadataDictionary];
    if (v6)
    {
      unsigned __int8 v7 = (void *)v6;
      v8 = [v4 persistentStoreCoordinator];
      objc_super v9 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
      unsigned int v10 = [v8 isEqual:v9];

      if (v10)
      {
        v11 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
        v12 = [v11 metadataForPersistentStore:v5];
        id v13 = [v12 mutableCopy];

        v14 = [(IMUbiquitousDataProvider *)self metadataDictionary];
        id v15 = [v14 copy];

        [v13 setObject:v15 forKey:@"BKDatabase-Metadata"];
        v16 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
        [v16 setMetadata:v13 forPersistentStore:v5];

        [(IMUbiquitousDataProvider *)self setMetadataDictionaryDirty:0];
      }
    }
  }
  if (![v4 hasChanges])
  {
    v18 = 0;
LABEL_14:
    BOOL v19 = 0;
    goto LABEL_15;
  }
  id v23 = 0;
  unsigned __int8 v17 = [v4 save:&v23];
  v18 = (char *)v23;
  if ((v17 & 1) == 0)
  {
    v20 = BCIMLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "-[IMUbiquitousDataProvider saveManagedObjectContext:]";
      __int16 v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCUbiquitousDataProvider.m";
      __int16 v28 = 1024;
      int v29 = 140;
      _os_log_impl(&def_7D91C, v20, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v21 = BCIMLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&def_7D91C, v21, OS_LOG_TYPE_INFO, "@\"Failed to save syncMOC with error: %@\"", buf, 0xCu);
    }

    goto LABEL_14;
  }
  BOOL v19 = 1;
LABEL_15:

  return v19;
}

- (id)newManagedObjectContextWithClass:(Class)a3 concurrencyType:(unint64_t)a4
{
  [(IMUbiquitousDataProvider *)self loadCoreData];
  unsigned __int8 v7 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
  id v8 = [[a3 alloc] initWithConcurrencyType:a4];
  if ([v8 concurrencyType])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_5D694;
    v10[3] = &unk_2C3AF8;
    id v11 = v8;
    id v12 = v7;
    [v11 performBlock:v10];

    if (v8) {
      goto LABEL_9;
    }
  }
  else
  {
    [v8 setPersistentStoreCoordinator:v7];
    [v8 setUndoManager:0];
    [v8 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    if (v8) {
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1EAE90();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1EAE48();
  }
LABEL_9:

  return v8;
}

- (id)newManagedObjectContextWithClass:(Class)a3
{
  return [(IMUbiquitousDataProvider *)self newManagedObjectContextWithClass:a3 concurrencyType:0];
}

- (id)newManagedObjectContext
{
  uint64_t v3 = objc_opt_class();

  return [(IMUbiquitousDataProvider *)self newManagedObjectContextWithClass:v3];
}

- (void)loadCoreData
{
  int64_t onceToken = self->_onceToken;
  p_int64_t onceToken = &self->_onceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5D7B8;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (onceToken != -1) {
    dispatch_once(p_onceToken, block);
  }
}

- (void)setMetadataObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = self;
    objc_sync_enter(v8);
    objc_super v9 = [(IMUbiquitousDataProvider *)v8 currentPersistentStore];
    if (v9)
    {
      unsigned int v10 = [(IMUbiquitousDataProvider *)v8 persistentStoreCoordinator];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_5D924;
      v11[3] = &unk_2C48E0;
      v11[4] = v8;
      id v12 = v6;
      id v13 = v7;
      [v10 performBlockAndWait:v11];
    }
    objc_sync_exit(v8);
  }
}

- (id)metadataObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_5DAE0;
  v16 = sub_5DAF0;
  id v17 = 0;
  v5 = [(IMUbiquitousDataProvider *)self currentPersistentStore];
  if (v5)
  {
    id v6 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_5DAF8;
    v9[3] = &unk_2C5530;
    v9[4] = self;
    id v11 = &v12;
    id v10 = v4;
    [v6 performBlockAndWait:v9];
  }
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)applicationDidBecomeActive:(id)a3
{
  if ([(IMUbiquitousDataProvider *)self isReady])
  {
    [(IMUbiquitousDataProvider *)self updateCurrentPersistentStore];
  }
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[IMUbiquitousPersistentStoreLoader databaseFolderURL];
  v5 = +[NSFileManager defaultManager];
  id v8 = 0;
  [v5 removeItemAtURL:v4 error:&v8];
  id v6 = v8;

  id v7 = (void (**)(id, BOOL, id))objc_retainBlock(v3);
  if (v7) {
    v7[2](v7, v6 == 0, v6);
  }
}

- (void)loadManagedObjectModel
{
  id v3 = [(IMUbiquitousDataProvider *)self managedObjectModel];

  if (!v3)
  {
    id v4 = objc_opt_class();
    id v9 = [v4 managedObjectModelName];
    v5 = [v4 managedObjectModelBundle];
    id v6 = [v5 pathForResource:v9 ofType:@"momd"];

    id v7 = +[NSURL fileURLWithPath:v6];
    id v8 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v7];
    [(IMUbiquitousDataProvider *)self setManagedObjectModel:v8];
  }
}

- (void)loadPersistentStoreCoordinator
{
  id v3 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];

  if (!v3)
  {
    id v4 = objc_alloc((Class)NSPersistentStoreCoordinator);
    v5 = [(IMUbiquitousDataProvider *)self managedObjectModel];
    id v6 = [v4 initWithManagedObjectModel:v5];

    [(IMUbiquitousDataProvider *)self setPersistentStoreCoordinator:v6];
  }
}

- (void)loadLocalPersistentStoreWithCompletionBlock:(id)a3
{
  id v8 = a3;
  id v4 = [(IMUbiquitousDataProvider *)self localPersistentStoreLoader];
  v5 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
  id v6 = [v4 addPersistentStoreToPersistentStoreCoordinator:v5];
  [(IMUbiquitousDataProvider *)self setCurrentPersistentStore:v6];

  [(IMUbiquitousDataProvider *)self setCurrentPersistentStoreType:1];
  id v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    id v7 = v8;
  }
}

- (void)loadPersistentStore
{
}

- (void)loadBringUpPersistentStore
{
  if (![(IMUbiquitousDataProvider *)self currentPersistentStoreType])
  {
    id v3 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_5DF68;
    v4[3] = &unk_2C3C50;
    v4[4] = self;
    [v3 performBlockAndWait:v4];
  }
}

- (void)removePersistentStores
{
  id v3 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
  id v4 = [v3 persistentStores];
  id v5 = [v4 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v10);
        uint64_t v12 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
        id v15 = 0;
        unsigned __int8 v13 = [v12 removePersistentStore:v11 error:&v15];
        id v14 = v15;

        if ((v13 & 1) == 0) {
          +[NSException raise:NSGenericException, @"%@ Could not remove local Persistent Store: %@\nError: %@", objc_opt_class(), v11, v14 format];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(IMUbiquitousDataProvider *)self setCurrentPersistentStore:0];
}

- (void)cacheMetadataDictionary
{
  id v3 = [(IMUbiquitousDataProvider *)self metadataDictionary];

  if (!v3)
  {
    id v10 = [(IMUbiquitousDataProvider *)self currentPersistentStore];
    id v4 = [(IMUbiquitousDataProvider *)self persistentStoreCoordinator];
    id v5 = [v4 metadataForPersistentStore:v10];

    id v6 = [v5 objectForKey:@"BKDatabase-Metadata"];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 mutableCopy];
    }
    else
    {
      id v8 = +[NSMutableDictionary dictionary];
    }
    uint64_t v9 = v8;
    [(IMUbiquitousDataProvider *)self setMetadataDictionary:v8];

    [(IMUbiquitousDataProvider *)self setMetadataDictionaryDirty:0];
  }
}

- (BOOL)isEnabled
{
  return 1;
}

+ (id)managedObjectModelName
{
  id v3 = NSStringFromSelector(a2);
  +[NSException raise:NSGenericException, @"%@ is an abstract class, %@ should be implemented by a concrete subclass", a1, v3 format];

  return 0;
}

+ (id)managedObjectModelBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (NSManagedObjectModel)managedObjectModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManagedObjectModel:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return (NSPersistentStoreCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (NSPersistentStore)currentPersistentStore
{
  return self->_currentPersistentStore;
}

- (void)setCurrentPersistentStore:(id)a3
{
}

- (int)currentPersistentStoreType
{
  return self->_currentPersistentStoreType;
}

- (void)setCurrentPersistentStoreType:(int)a3
{
  self->_currentPersistentStoreType = a3;
}

- (IMUbiquitousPersistentStoreLoader)bringUpPersistentStoreLoader
{
  return self->_bringUpPersistentStoreLoader;
}

- (void)setBringUpPersistentStoreLoader:(id)a3
{
}

- (IMUbiquitousPersistentStoreLoader)localPersistentStoreLoader
{
  return self->_localPersistentStoreLoader;
}

- (void)setLocalPersistentStoreLoader:(id)a3
{
}

- (NSMutableDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
}

- (BOOL)metadataDictionaryDirty
{
  return self->_metadataDictionaryDirty;
}

- (void)setMetadataDictionaryDirty:(BOOL)a3
{
  self->_metadataDictionaryDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_localPersistentStoreLoader, 0);
  objc_storeStrong((id *)&self->_bringUpPersistentStoreLoader, 0);
  objc_storeStrong((id *)&self->_currentPersistentStore, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);

  objc_storeStrong((id *)&self->_managedObjectModel, 0);
}

@end