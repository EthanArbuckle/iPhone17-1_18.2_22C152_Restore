@interface NADApplicationStore
+ (id)defaultStore;
+ (id)defaultURL;
+ (id)legacyDefaultURL;
- (NADApplicationStore)init;
- (NADApplicationStore)initWithURL:(id)a3;
- (NADEntityStore)applicationStore;
- (NSFileManager)fileManager;
- (NSURL)applicationDirectory;
- (OS_dispatch_queue)queue;
- (id)UUID;
- (id)_allApplicationsIncludingHidden:(BOOL)a3;
- (id)_applicationBundleIdentifiersForParentApplicationBundleIdentifier:(id)a3;
- (id)_storeMetadataURL;
- (id)allApplicationsIncludingHidden:(BOOL)a3;
- (id)beginTransaction;
- (id)description;
- (id)sequenceNumber;
- (id)watchAppIDsForParentBundleID:(id)a3;
- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3;
- (void)_insertApplication:(id)a3;
- (void)_insertApplicationIntoCache:(id)a3;
- (void)_loadEntitiesFromDisk;
- (void)_removeApplicationFromCache:(id)a3;
- (void)_removeApplicationWithBundleIdentifier:(id)a3;
- (void)_resetStores;
- (void)_writeStoreMetadata;
- (void)getAllApplications:(id *)a3 UUID:(id *)a4 sequenceNumber:(id *)a5 includeHidden:(BOOL)a6;
- (void)insertApplication:(id)a3;
- (void)performTransactionWithBlock:(id)a3;
- (void)removeAllEntities;
- (void)removeApplicationWithBundleIdentifier:(id)a3;
- (void)removeApplicationsWithParentApplicationBundleIdentifier:(id)a3;
- (void)setSequenceNumber:(id)a3 UUID:(id)a4;
@end

@implementation NADApplicationStore

+ (id)defaultStore
{
  if (qword_100021268 != -1) {
    dispatch_once(&qword_100021268, &stru_100018490);
  }
  v2 = (void *)qword_100021260;

  return v2;
}

- (NADApplicationStore)init
{
  return [(NADApplicationStore *)self initWithURL:0];
}

+ (id)legacyDefaultURL
{
  id v2 = objc_alloc_init((Class)NSFileManager);
  v3 = [v2 URLsForDirectory:5 inDomains:1];
  v4 = [v3 firstObject];

  v5 = [v4 URLByAppendingPathComponent:@"NanoAppRegistry" isDirectory:1];

  return v5;
}

+ (id)defaultURL
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000050D8;
  v10 = sub_1000050E8;
  id v11 = 0;
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000050F0;
  v5[3] = &unk_1000184B8;
  v5[4] = &v6;
  [v2 waitForPairingStorePathPairingID:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NADApplicationStore)initWithURL:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)NADApplicationStore;
  v5 = [(NADApplicationStore *)&v47 init];
  if (v5)
  {
    uint64_t v6 = (NSFileManager *)objc_alloc_init((Class)NSFileManager);
    fileManager = v5->_fileManager;
    v5->_fileManager = v6;

    if (!v4)
    {
      id v4 = [(id)objc_opt_class() defaultURL];
    }
    uint64_t v8 = [v4 URLByAppendingPathComponent:@"Applications" isDirectory:1];
    applicationDirectory = v5->_applicationDirectory;
    v5->_applicationDirectory = (NSURL *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.nanoappregistry.applicationstore", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    v12 = [v4 URLByAppendingPathComponent:@"Applications" isDirectory:1];
    v13 = +[NADAppSerializer applicationSerializer];
    v14 = [[NADEntityStore alloc] initWithDirectory:v12 serializer:v13 identifierBlock:&stru_1000184F8];
    applicationStore = v5->_applicationStore;
    v5->_applicationStore = v14;

    v16 = [v4 URLByAppendingPathComponent:@"Glances" isDirectory:1];
    v17 = +[NSFileManager defaultManager];
    [v17 removeItemAtURL:v16 error:0];

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    parentBundleIDToWatchAppMap = v5->_parentBundleIDToWatchAppMap;
    v5->_parentBundleIDToWatchAppMap = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bundleIDToApplicationMap = v5->_bundleIDToApplicationMap;
    v5->_bundleIDToApplicationMap = v20;

    v22 = [(NADApplicationStore *)v5 _storeMetadataURL];
    v23 = +[NSData dataWithContentsOfURL:v22];

    if (v23)
    {
      v43 = v12;
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, v25, v26, v27, objc_opt_class(), 0);
      id v46 = 0;
      v29 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v28 fromData:v23 error:&v46];
      id v30 = v46;
      v31 = (NSMutableDictionary *)[v29 mutableCopy];
      storeMetadata = v5->_storeMetadata;
      v5->_storeMetadata = v31;

      if (v30)
      {
        v33 = nar_workspace_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10000F574((uint64_t)v30, v33, v34, v35, v36, v37, v38, v39);
        }
      }
      v12 = v43;
    }
    if (![(NSMutableDictionary *)v5->_storeMetadata count])
    {
      v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v41 = v5->_storeMetadata;
      v5->_storeMetadata = v40;
    }
    [(NADApplicationStore *)v5 _loadEntitiesFromDisk];
    objc_initWeak(&location, v5);
    objc_copyWeak(&v44, &location);
    v5->_stateHandle = os_state_add_handler();
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)removeAllEntities
{
  id v3 = [(NADApplicationStore *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = nar_workspace_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Remove all entities", v5, 2u);
  }

  [(NADApplicationStore *)self _resetStores];
  [(NSMutableDictionary *)self->_parentBundleIDToWatchAppMap removeAllObjects];
  [(NSMutableDictionary *)self->_bundleIDToApplicationMap removeAllObjects];
}

- (void)insertApplication:(id)a3
{
  id v5 = a3;
  id v4 = [(NADApplicationStore *)self queue];
  dispatch_assert_queue_V2(v4);

  [(NADApplicationStore *)self _insertApplication:v5];
}

- (void)removeApplicationWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = [(NADApplicationStore *)self queue];
  dispatch_assert_queue_V2(v4);

  [(NADApplicationStore *)self _removeApplicationWithBundleIdentifier:v5];
}

- (void)removeApplicationsWithParentApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NADApplicationStore *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(NADApplicationStore *)self _applicationBundleIdentifiersForParentApplicationBundleIdentifier:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      dispatch_queue_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NADApplicationStore *)self removeApplicationWithBundleIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        dispatch_queue_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_applicationBundleIdentifiersForParentApplicationBundleIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_parentBundleIDToWatchAppMap objectForKeyedSubscript:a3];
  id v4 = [v3 allObjects];

  return v4;
}

- (id)allApplicationsIncludingHidden:(BOOL)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = sub_1000050D8;
  long long v14 = sub_1000050E8;
  id v15 = 0;
  id v5 = [(NADApplicationStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000059C0;
  block[3] = &unk_100018548;
  block[4] = self;
  block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)getAllApplications:(id *)a3 UUID:(id *)a4 sequenceNumber:(id *)a5 includeHidden:(BOOL)a6
{
  long long v11 = [(NADApplicationStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005AC0;
  block[3] = &unk_100018570;
  block[4] = self;
  block[5] = a3;
  BOOL v13 = a6;
  void block[6] = a4;
  block[7] = a5;
  dispatch_sync(v11, block);
}

- (void)_loadEntitiesFromDisk
{
  id v3 = [(NADEntityStore *)self->_applicationStore allEntities];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NADApplicationStore *)self _insertApplicationIntoCache:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_resetStores
{
}

- (void)_insertApplication:(id)a3
{
  applicationStore = self->_applicationStore;
  id v5 = a3;
  [(NADEntityStore *)applicationStore addEntity:v5];
  [(NADApplicationStore *)self _insertApplicationIntoCache:v5];
}

- (void)_insertApplicationIntoCache:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parentApplicationBundleIdentifier];
  id v7 = [(NADApplicationStore *)self watchAppIDsForParentBundleID:v5];

  uint64_t v6 = [v4 applicationIdentifier];
  [v7 addObject:v6];
  [(NSMutableDictionary *)self->_bundleIDToApplicationMap setObject:v4 forKeyedSubscript:v6];
}

- (id)watchAppIDsForParentBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_parentBundleIDToWatchAppMap objectForKeyedSubscript:v4];
  uint64_t v6 = (void *)v5;
  if (v4 && !v5)
  {
    uint64_t v6 = +[NSMutableSet set];
    [(NSMutableDictionary *)self->_parentBundleIDToWatchAppMap setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (void)_removeApplicationWithBundleIdentifier:(id)a3
{
  uint64_t v4 = [(NSMutableDictionary *)self->_bundleIDToApplicationMap objectForKeyedSubscript:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    [(NADEntityStore *)self->_applicationStore removeEntity:v4];
    [(NADApplicationStore *)self _removeApplicationFromCache:v5];
  }

  _objc_release_x1();
}

- (void)_removeApplicationFromCache:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 parentApplicationBundleIdentifier];
  id v7 = [(NADApplicationStore *)self watchAppIDsForParentBundleID:v5];

  uint64_t v6 = [v4 applicationIdentifier];

  [v7 removeObject:v6];
  [(NSMutableDictionary *)self->_bundleIDToApplicationMap removeObjectForKey:v6];
}

- (id)_allApplicationsIncludingHidden:(BOOL)a3
{
  uint64_t v4 = [(NSMutableDictionary *)self->_bundleIDToApplicationMap allValues];
  uint64_t v5 = (void *)v4;
  if (a3)
  {
    uint64_t v6 = (void *)v4;
  }
  else
  {
    uint64_t v6 = +[NSMutableArray array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isHidden", (void)v14) & 1) == 0) {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }

  return v6;
}

- (id)UUID
{
  return [(NSMutableDictionary *)self->_storeMetadata objectForKeyedSubscript:@"UUID"];
}

- (void)setSequenceNumber:(id)a3 UUID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NADApplicationStore *)self queue];
  dispatch_assert_queue_V2(v7);

  if (v8) {
    [(NSMutableDictionary *)self->_storeMetadata setObject:v8 forKeyedSubscript:@"sequenceNumber"];
  }
  if (v6) {
    [(NSMutableDictionary *)self->_storeMetadata setObject:v6 forKeyedSubscript:@"UUID"];
  }
  [(NADApplicationStore *)self _writeStoreMetadata];
}

- (id)sequenceNumber
{
  return [(NSMutableDictionary *)self->_storeMetadata objectForKeyedSubscript:@"sequenceNumber"];
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [(NADApplicationStore *)self applicationDirectory];
  id v6 = +[NSString stringWithFormat:@"<%@ %p path=%@>", v4, self, v5];;

  return v6;
}

- (id)_storeMetadataURL
{
  id v2 = [(NADApplicationStore *)self applicationDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"storeMetadata.dat" isDirectory:0];

  return v3;
}

- (void)_writeStoreMetadata
{
  id v3 = nar_workspace_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    storeMetadata = self->_storeMetadata;
    *(_DWORD *)buf = 138412290;
    v18 = storeMetadata;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Writing store metadata: %@", buf, 0xCu);
  }

  uint64_t v5 = +[NSKeyedArchiver archivedDataWithRootObject:self->_storeMetadata];
  if (v5)
  {
    id v6 = [(NADApplicationStore *)self _storeMetadataURL];
    id v16 = 0;
    unsigned __int8 v7 = [v5 writeToURL:v6 options:268435457 error:&v16];
    id v8 = v16;

    if ((v7 & 1) == 0)
    {
      id v9 = nar_workspace_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000F64C((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
}

- (id)beginTransaction
{
  id v2 = [[NADApplicationStoreTransaction alloc] initWithApplicationStore:self];

  return v2;
}

- (void)performTransactionWithBlock:(id)a3
{
  queue = self->_queue;
  uint64_t v5 = (void (**)(id, id))a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)queue);
  id v6 = [(NADApplicationStore *)self beginTransaction];
  v5[2](v5, v6);

  [v6 commit:0];
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  uint64_t v4 = [(NADApplicationStore *)self _allApplicationsIncludingHidden:1];
  id v5 = [v4 count];

  id v6 = [(NADApplicationStore *)self UUID];
  unsigned __int8 v7 = [(NADApplicationStore *)self sequenceNumber];
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = [v6 UUIDString];
  uint64_t v11 = +[NSNumber numberWithInteger:v5];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; UUID=%@; sequenceNumber=%@; applicationCount=%@>",
    v9,
    self,
    v10,
    v7,
  uint64_t v12 = v11);

  uint64_t v18 = 0;
  uint64_t v13 = +[NSPropertyListSerialization dataWithPropertyList:v12 format:200 options:0 error:&v18];
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = [v13 length];
    id v16 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v15 + 200, 0x986E2D00uLL);
    v16->var0 = 1;
    v16->var1.var1 = v15;
    __strlcpy_chk();
    memcpy(v16->var4, [v14 bytes], (size_t)v15);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (NSURL)applicationDirectory
{
  return self->_applicationDirectory;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (NADEntityStore)applicationStore
{
  return self->_applicationStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStore, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationDirectory, 0);
  objc_storeStrong((id *)&self->_bundleIDToApplicationMap, 0);
  objc_storeStrong((id *)&self->_parentBundleIDToWatchAppMap, 0);

  objc_storeStrong((id *)&self->_storeMetadata, 0);
}

@end