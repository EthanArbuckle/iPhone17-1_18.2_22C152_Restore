@interface IMCoreDataSource
+ (id)persistentStoreExtension;
+ (id)persistentStoreName;
+ (id)persistentStoreNameSeed;
+ (id)persistentStoreVersion;
- (BOOL)metadataDictionaryDirty;
- (IMCoreDataSource)initWithPersistentStoreURL:(id)a3;
- (NSManagedObjectModel)managedObjectModel;
- (NSMutableDictionary)metadataDictionary;
- (NSPersistentStore)persistentStore;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSURL)persistentStoreURL;
- (id)bundleForManagedObjectModel;
- (id)copyMaxSortValue:(id)a3 forEntityName:(id)a4;
- (id)copyNextSortValue:(id)a3 forKey:(id)a4 forEntityName:(id)a5;
- (id)generationValue:(id)a3;
- (id)metadataObjectForKey:(id)a3;
- (id)migrationHandler;
- (id)newManagedObjectContext;
- (id)newManagedObjectContextWithClass:(Class)a3;
- (id)newPrivateQueueManagedObjectContextWithClass:(Class)a3;
- (id)persistentStoreInitializedHandler;
- (void)_loadPersistentStoreAndRetryIfNeeded:(BOOL)a3;
- (void)cacheMetadataDictionary;
- (void)incrementGeneration:(id)a3;
- (void)loadCoreData;
- (void)loadCoreDataPersistentStoreInitializedHandler:(id)a3 migrationHandler:(id)a4;
- (void)loadManagedObjectModel;
- (void)loadPersistentStore;
- (void)loadPersistentStoreCoordinator;
- (void)saveManagedObjectContext:(id)a3;
- (void)saveMetaData;
- (void)setManagedObjectModel:(id)a3;
- (void)setMetadataDictionary:(id)a3;
- (void)setMetadataDictionaryDirty:(BOOL)a3;
- (void)setMetadataObject:(id)a3 forKey:(id)a4;
- (void)setMigrationHandler:(id)a3;
- (void)setPersistentStore:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
- (void)setPersistentStoreInitializedHandler:(id)a3;
@end

@implementation IMCoreDataSource

- (IMCoreDataSource)initWithPersistentStoreURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMCoreDataSource;
  v6 = [(IMCoreDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentStoreURL, a3);
  }

  return v7;
}

+ (id)persistentStoreName
{
  v2 = objc_opt_class();
  id v3 = [v2 managedObjectModelName];
  v4 = [v2 persistentStoreVersion];
  id v5 = v3;
  if ([v4 length])
  {
    id v5 = [v3 stringByAppendingFormat:@"-%@", v4];
  }
  v6 = [v2 persistentStoreNameSeed];
  if ([v6 length])
  {
    uint64_t v7 = [v5 stringByAppendingFormat:@"-%@", v6];

    id v5 = (void *)v7;
  }
  v8 = [v2 persistentStoreExtension];
  if (v8)
  {
    uint64_t v9 = [v5 stringByAppendingPathExtension:v8];

    id v5 = (void *)v9;
  }
  id v10 = v5;

  return v10;
}

+ (id)persistentStoreVersion
{
  return &stru_2CE418;
}

+ (id)persistentStoreExtension
{
  return @"sqlite";
}

+ (id)persistentStoreNameSeed
{
  return &stru_2CE418;
}

- (void)loadCoreData
{
  [(IMCoreDataSource *)self loadManagedObjectModel];
  [(IMCoreDataSource *)self loadPersistentStoreCoordinator];

  [(IMCoreDataSource *)self loadPersistentStore];
}

- (void)loadCoreDataPersistentStoreInitializedHandler:(id)a3 migrationHandler:(id)a4
{
  id v6 = a4;
  [(IMCoreDataSource *)self setPersistentStoreInitializedHandler:a3];
  [(IMCoreDataSource *)self setMigrationHandler:v6];

  [(IMCoreDataSource *)self loadManagedObjectModel];
  [(IMCoreDataSource *)self loadPersistentStoreCoordinator];

  [(IMCoreDataSource *)self loadPersistentStore];
}

- (id)newManagedObjectContext
{
  uint64_t v3 = objc_opt_class();

  return [(IMCoreDataSource *)self newManagedObjectContextWithClass:v3];
}

- (id)newPrivateQueueManagedObjectContextWithClass:(Class)a3
{
  id v4 = [[a3 alloc] initWithConcurrencyType:1];
  id v5 = [(IMCoreDataSource *)self persistentStoreCoordinator];
  [v4 setPersistentStoreCoordinator:v5];

  [v4 setUndoManager:0];
  [v4 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  return v4;
}

- (id)newManagedObjectContextWithClass:(Class)a3
{
  id v4 = [[a3 alloc] initWithConcurrencyType:0];
  id v5 = [(IMCoreDataSource *)self persistentStoreCoordinator];
  [v4 setPersistentStoreCoordinator:v5];

  [v4 setUndoManager:0];
  [v4 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  return v4;
}

- (void)saveMetaData
{
  if ([(IMCoreDataSource *)self metadataDictionaryDirty])
  {
    uint64_t v3 = [(IMCoreDataSource *)self metadataDictionary];

    if (v3)
    {
      v11[0] = NSMigratePersistentStoresAutomaticallyOption;
      v11[1] = NSInferMappingModelAutomaticallyOption;
      v12[0] = &__kCFBooleanTrue;
      v12[1] = &__kCFBooleanTrue;
      id v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
      id v5 = [(IMCoreDataSource *)self persistentStoreCoordinator];
      id v6 = [(IMCoreDataSource *)self persistentStore];
      uint64_t v7 = [v5 metadataForPersistentStore:v6];
      id v8 = [v7 mutableCopy];

      uint64_t v9 = [(IMCoreDataSource *)self metadataDictionary];
      id v10 = [v9 copy];
      [v8 setObject:v10 forKey:@"BKDatabase-Metadata"];

      +[NSPersistentStoreCoordinator setMetadata:v8 forPersistentStoreOfType:NSSQLiteStoreType URL:self->_persistentStoreURL options:v4 error:0];
      [(IMCoreDataSource *)self setMetadataDictionaryDirty:0];
    }
  }
}

- (void)saveManagedObjectContext:(id)a3
{
  id v4 = a3;
  [(IMCoreDataSource *)self saveMetaData];
  if ([v4 hasChanges])
  {
    id v9 = 0;
    unsigned __int8 v5 = [v4 save:&v9];
    id v6 = (char *)v9;
    if ((v5 & 1) == 0)
    {
      uint64_t v7 = BCIMLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v11 = "-[IMCoreDataSource saveManagedObjectContext:]";
        __int16 v12 = 2080;
        v13 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCCoreDataSource.m";
        __int16 v14 = 1024;
        int v15 = 155;
        _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      id v8 = BCIMLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_INFO, "@\"Failed to save MOC with error: %@\"", buf, 0xCu);
      }
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (id)bundleForManagedObjectModel
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (void)loadManagedObjectModel
{
  uint64_t v3 = [(IMCoreDataSource *)self managedObjectModel];

  if (!v3)
  {
    id v4 = [(id)objc_opt_class() managedObjectModelName];
    unsigned __int8 v5 = [(IMCoreDataSource *)self bundleForManagedObjectModel];
    id v6 = [v5 pathForResource:v4 ofType:@"momd"];
    if (!v6)
    {
      v23 = v5;
      v24 = v4;
      uint64_t v7 = [v5 resourceURL];
      id v8 = +[NSFileManager defaultManager];
      NSURLResourceKey v30 = NSURLNameKey;
      id v9 = +[NSArray arrayWithObjects:&v30 count:1];
      v22 = (void *)v7;
      id v10 = [v8 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v9 options:1 error:0];

      id v11 = objc_alloc_init((Class)NSMutableArray);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v18 = [v17 pathExtension];
            unsigned int v19 = [v18 hasPrefix:@"mom"];

            if (v19) {
              [v11 addObject:v17];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v14);
      }

      unsigned __int8 v5 = v23;
      id v4 = v24;
      id v6 = 0;
    }
    v20 = +[NSURL fileURLWithPath:v6];
    id v21 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v20];
    [(IMCoreDataSource *)self setManagedObjectModel:v21];
  }
}

- (void)loadPersistentStoreCoordinator
{
  uint64_t v3 = [(IMCoreDataSource *)self persistentStoreCoordinator];

  if (!v3)
  {
    id v4 = objc_alloc((Class)NSPersistentStoreCoordinator);
    unsigned __int8 v5 = [(IMCoreDataSource *)self managedObjectModel];
    id v6 = [v4 initWithManagedObjectModel:v5];

    [(IMCoreDataSource *)self setPersistentStoreCoordinator:v6];
  }
}

- (void)loadPersistentStore
{
}

- (void)_loadPersistentStoreAndRetryIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  v46[0] = NSMigratePersistentStoresAutomaticallyOption;
  v46[1] = NSInferMappingModelAutomaticallyOption;
  v47[0] = &__kCFBooleanFalse;
  v47[1] = &__kCFBooleanTrue;
  unsigned __int8 v5 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  uint64_t v6 = [(IMCoreDataSource *)self persistentStoreURL];
  uint64_t v7 = NSSQLiteStoreType;
  v33 = self;
  id v8 = [(IMCoreDataSource *)self persistentStoreCoordinator];
  id v37 = 0;
  v34 = v7;
  id v9 = v7;
  id v10 = (char *)v6;
  uint64_t v11 = [v8 addPersistentStoreWithType:v9 configuration:0 URL:v6 options:v5 error:&v37];
  id v12 = (char *)v37;

  if (v11)
  {
    id v13 = (void *)v11;
    id v14 = v5;
    uint64_t v15 = v33;
LABEL_7:
    [(IMCoreDataSource *)v15 setPersistentStore:v13];
    uint64_t v22 = [(IMCoreDataSource *)v15 persistentStoreInitializedHandler];
    v23 = (void *)v22;
    if (v22) {
      (*(void (**)(uint64_t))(v22 + 16))(v22);
    }

    v18 = v34;
    if (!v11)
    {
      uint64_t v24 = [(IMCoreDataSource *)v15 migrationHandler];
      long long v25 = (void *)v24;
      if (v24) {
        (*(void (**)(uint64_t))(v24 + 16))(v24);
      }
    }
    [(IMCoreDataSource *)v15 setPersistentStoreInitializedHandler:0];
    [(IMCoreDataSource *)v15 setMigrationHandler:0];

    goto LABEL_14;
  }
  if ([v12 code] == &loc_20BD4 || objc_msgSend(v12, "code") == &loc_20B84)
  {
    v44[0] = NSMigratePersistentStoresAutomaticallyOption;
    v44[1] = NSInferMappingModelAutomaticallyOption;
    v45[0] = &__kCFBooleanTrue;
    v45[1] = &__kCFBooleanTrue;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];

    uint64_t v15 = v33;
    v17 = [(IMCoreDataSource *)v33 persistentStoreCoordinator];
    v36 = v12;
    v18 = v34;
    unsigned int v19 = v12;
    v20 = (void *)v16;
    id v13 = [v17 addPersistentStoreWithType:v34 configuration:0 URL:v10 options:v16 error:&v36];
    id v21 = v36;

    if (v13)
    {
      [(IMCoreDataSource *)v33 setPersistentStore:v13];
      id v14 = v20;
      id v12 = v21;
      goto LABEL_7;
    }
    long long v26 = v21;
    id v14 = v20;
  }
  else
  {
    long long v26 = v12;
    id v14 = v5;
    v18 = v34;
  }
  long long v27 = BCIMLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v39 = "-[IMCoreDataSource _loadPersistentStoreAndRetryIfNeeded:]";
    __int16 v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCCoreDataSource.m";
    __int16 v42 = 1024;
    int v43 = 250;
    _os_log_impl(&def_7D91C, v27, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
  }

  long long v28 = BCIMLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v10;
    __int16 v40 = 2112;
    v41 = v26;
    _os_log_impl(&def_7D91C, v28, OS_LOG_TYPE_INFO, "@\"Failed to add persistentStore {%@} error {%@}\"", buf, 0x16u);
  }

  if (v3)
  {
    v29 = [(IMCoreDataSource *)v33 persistentStoreCoordinator];
    v35 = v26;
    unsigned int v30 = [v29 bkspi_destroyPersistentStoreAtURL:v10 withType:v18 error:&v35];
    id v12 = v35;

    if (v30)
    {
      [(IMCoreDataSource *)v33 _loadPersistentStoreAndRetryIfNeeded:0];
    }
    else
    {
      v31 = BCIMLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v39 = "-[IMCoreDataSource _loadPersistentStoreAndRetryIfNeeded:]";
        __int16 v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCCoreDataSource.m";
        __int16 v42 = 1024;
        int v43 = 260;
        _os_log_impl(&def_7D91C, v31, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v32 = BCIMLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v10;
        __int16 v40 = 2112;
        v41 = v12;
        _os_log_impl(&def_7D91C, v32, OS_LOG_TYPE_INFO, "@\"Failed to destroy persistent store at URL {%@} error {%@}\"", buf, 0x16u);
      }

      [(IMCoreDataSource *)v33 setPersistentStoreInitializedHandler:0];
      [(IMCoreDataSource *)v33 setMigrationHandler:0];
    }
  }
  else
  {
    [(IMCoreDataSource *)v33 setPersistentStoreInitializedHandler:0];
    [(IMCoreDataSource *)v33 setMigrationHandler:0];
    id v12 = v26;
  }
LABEL_14:
}

- (id)copyMaxSortValue:(id)a3 forEntityName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[NSPredicate predicateWithValue:1];
  id v8 = [v6 entity:v5 withPredicate:v7 sortBy:@"sortKey" ascending:0 fetchLimit:1];

  if ([v8 count])
  {
    id v9 = [v8 objectAtIndex:0];
    id v10 = [v9 valueForKey:@"sortKey"];
  }
  else
  {
    id v10 = [objc_alloc((Class)NSNumber) initWithLongLong:0];
  }

  return v10;
}

- (id)copyNextSortValue:(id)a3 forKey:(id)a4 forEntityName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(IMCoreDataSource *)self persistentStoreCoordinator];
  id v12 = [v11 persistentStores];
  id v13 = [v12 lastObject];

  if (v13)
  {
    id v14 = [(IMCoreDataSource *)self metadataObjectForKey:v9];
    if (!v14)
    {
      id v15 = [(IMCoreDataSource *)self copyMaxSortValue:v8 forEntityName:v10];
      id v16 = objc_alloc((Class)NSNumber);
      v17 = (char *)[v15 longLongValue];
      id v14 = [v16 initWithLongLong:&v17[kIMCoreDataSourceSortOrderInitialGap]];
    }
    id v18 = objc_alloc((Class)NSNumber);
    unsigned int v19 = (char *)[v14 longLongValue];
    id v20 = [v18 initWithLongLong:&v19[kIMCoreDataSourceSortOrderInitialGap]];
    [(IMCoreDataSource *)self setMetadataObject:v20 forKey:v9];
  }
  else
  {
    id v20 = [(IMCoreDataSource *)self copyMaxSortValue:v8 forEntityName:v10];
    id v21 = objc_alloc((Class)NSNumber);
    uint64_t v22 = (char *)[v20 longLongValue];
    id v14 = [v21 initWithLongLong:&v22[kIMCoreDataSourceSortOrderInitialGap]];
  }

  return v14;
}

- (void)setMetadataObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(IMCoreDataSource *)v8 persistentStore];
  if (v9)
  {
    id v10 = [(IMCoreDataSource *)v8 persistentStoreCoordinator];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_422F0;
    v11[3] = &unk_2C48E0;
    v11[4] = v8;
    id v12 = v6;
    id v13 = v7;
    [v10 performBlockAndWait:v11];
  }
  objc_sync_exit(v8);
}

- (id)metadataObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_424AC;
  id v16 = sub_424BC;
  id v17 = 0;
  id v5 = [(IMCoreDataSource *)self persistentStore];
  if (v5)
  {
    id v6 = [(IMCoreDataSource *)self persistentStoreCoordinator];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_424C4;
    v9[3] = &unk_2C5530;
    v9[4] = self;
    uint64_t v11 = &v12;
    id v10 = v4;
    [v6 performBlockAndWait:v9];
  }
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)cacheMetadataDictionary
{
  BOOL v3 = [(IMCoreDataSource *)self metadataDictionary];

  if (!v3)
  {
    id v10 = [(IMCoreDataSource *)self persistentStore];
    id v4 = [(IMCoreDataSource *)self persistentStoreCoordinator];
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
    id v9 = v8;
    [(IMCoreDataSource *)self setMetadataDictionary:v8];

    [(IMCoreDataSource *)self setMetadataDictionaryDirty:0];
  }
}

- (id)generationValue:(id)a3
{
  id v3 = [(IMCoreDataSource *)self metadataObjectForKey:a3];
  if (!v3) {
    id v3 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:0];
  }

  return v3;
}

- (void)incrementGeneration:(id)a3
{
  id v4 = a3;
  id v6 = [(IMCoreDataSource *)self generationValue:v4];
  id v5 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:((char *)[v6 unsignedLongLongValue]) + 1];
  [(IMCoreDataSource *)self setGenerationValue:v5 forKey:v4];
}

- (NSURL)persistentStoreURL
{
  return self->_persistentStoreURL;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (NSManagedObjectModel)managedObjectModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManagedObjectModel:(id)a3
{
}

- (NSPersistentStore)persistentStore
{
  return (NSPersistentStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersistentStore:(id)a3
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

- (id)persistentStoreInitializedHandler
{
  return self->_persistentStoreInitializedHandler;
}

- (void)setPersistentStoreInitializedHandler:(id)a3
{
}

- (id)migrationHandler
{
  return self->_migrationHandler;
}

- (void)setMigrationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_migrationHandler, 0);
  objc_storeStrong(&self->_persistentStoreInitializedHandler, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);

  objc_storeStrong((id *)&self->_persistentStoreURL, 0);
}

@end