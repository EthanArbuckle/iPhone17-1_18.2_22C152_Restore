@interface FMDAssetRegistry
+ (id)defaultStorageLocation;
- (FMDAssetRegistry)initWithStorageLocation:(id)a3 identifier:(id)a4;
- (FMDServerInteractionController)serverInteractionController;
- (FMDataArchiver)dataArchiver;
- (NSDictionary)assetsByURL;
- (NSString)storeIdentifier;
- (NSURL)baseStoragePath;
- (OS_dispatch_queue)serialQueue;
- (id)assetForURL:(id)a3;
- (id)generateAssetURL;
- (id)newAssetForURL:(id)a3 type:(unint64_t)a4;
- (id)newAssetWithDictionary:(id)a3;
- (id)registryFileURL;
- (unint64_t)assetTypeForString:(id)a3;
- (void)_removeUntrackedAssets:(id)a3;
- (void)clearAssetRegistry;
- (void)downloadAssets:(id)a3;
- (void)removeUntrackedAssets:(id)a3;
- (void)resumeBackgroundAssetDownloads:(id)a3;
- (void)saveAssetMetadata:(id)a3;
- (void)setAssetsByURL:(id)a3;
- (void)setBaseStoragePath:(id)a3;
- (void)setDataArchiver:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)storeAsset:(id)a3 fromLocation:(id)a4;
@end

@implementation FMDAssetRegistry

- (FMDAssetRegistry)initWithStorageLocation:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FMDAssetRegistry;
  v8 = [(FMDAssetRegistry *)&v22 init];
  v9 = v8;
  if (v8)
  {
    [(FMDAssetRegistry *)v8 setStoreIdentifier:v7];
    [(FMDAssetRegistry *)v9 setBaseStoragePath:v6];
    id v10 = objc_alloc((Class)FMDataArchiver);
    v11 = [(FMDAssetRegistry *)v9 registryFileURL];
    id v12 = [v10 initWithFileURL:v11];
    [(FMDAssetRegistry *)v9 setDataArchiver:v12];

    v13 = [(FMDAssetRegistry *)v9 dataArchiver];
    [v13 setDataProtectionClass:4];

    v14 = [(FMDAssetRegistry *)v9 dataArchiver];
    [v14 setBackedUp:0];

    v15 = [(FMDAssetRegistry *)v9 dataArchiver];
    [v15 setCreateDirectories:1];

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.icloud.findmydeviced.FMDAssetRegistry.serialqueue", 0);
    [(FMDAssetRegistry *)v9 setSerialQueue:v16];

    v17 = objc_alloc_init(FMDBackgroundServerChannel);
    v18 = [FMDServerInteractionController alloc];
    v23 = v17;
    v19 = +[NSArray arrayWithObjects:&v23 count:1];
    v20 = [(FMDServerInteractionController *)v18 initWithChannels:v19 delegate:0];
    [(FMDAssetRegistry *)v9 setServerInteractionController:v20];

    [(FMDAssetRegistry *)v9 resumeBackgroundAssetDownloads:v17];
  }

  return v9;
}

+ (id)defaultStorageLocation
{
  id v2 = objc_alloc((Class)FMSharedFileContainer);
  id v3 = [v2 initWithIdentifier:off_10031CBE0];
  v4 = [v3 url];
  v5 = [v4 URLByAppendingPathComponent:@"Caches/com.apple.icloud.findmydeviced.FMDAssetRegistry" isDirectory:1];

  return v5;
}

- (void)storeAsset:(id)a3 fromLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSFileManager defaultManager];
  v9 = [v6 fileURL];
  id v18 = 0;
  unsigned int v10 = [v8 copyItemAtURL:v7 toURL:v9 error:&v18];

  id v11 = v18;
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    v14 = [v6 fileURL];
    v15 = +[NSNumber numberWithBool:1];
    id v17 = 0;
    [v14 setResourceValue:v15 forKey:NSURLIsExcludedFromBackupKey error:&v17];
    v13 = v17;

    if (v13)
    {
      dispatch_queue_t v16 = sub_100004238();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1002413C0(v6);
      }
    }
    [(FMDAssetRegistry *)self saveAssetMetadata:v6];
  }
  else
  {
    v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10024146C(v11, v10, v13);
    }
  }
}

- (id)assetForURL:(id)a3
{
  id v4 = a3;
  v5 = [(FMDAssetRegistry *)self assetsByURL];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)newAssetWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"url"];
  id v6 = +[NSURL URLWithString:v5];
  id v7 = [v4 objectForKeyedSubscript:@"type"];

  id v8 = [(FMDAssetRegistry *)self newAssetForURL:v6 type:[(FMDAssetRegistry *)self assetTypeForString:v7]];
  return v8;
}

- (void)removeUntrackedAssets:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDAssetRegistry *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008723C;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)clearAssetRegistry
{
  id v3 = [(FMDAssetRegistry *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087314;
  block[3] = &unk_1002D9378;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)newAssetForURL:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(FMDAssetRegistry *)self assetForURL:v6];
  if (!v7)
  {
    id v8 = [FMDStandardAsset alloc];
    id v9 = [(FMDAssetRegistry *)self generateAssetURL];
    id v7 = [(FMDStandardAsset *)v8 initWithFileURL:v9 lastModified:0 etag:0 type:a4 url:v6];
  }
  return v7;
}

- (unint64_t)assetTypeForString:(id)a3
{
  return [@"locate_sound" isEqualToString:a3];
}

- (void)_removeUntrackedAssets:(id)a3
{
  id v4 = a3;
  v30 = self;
  id v33 = [(NSDictionary *)self->_assetsByURL copy];
  v5 = +[NSMutableArray array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v39 + 1) + 8 * i) url];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v8);
  }
  v31 = v6;

  v32 = +[NSMutableArray array];
  BOOL v12 = [v33 allKeys];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * (void)j);
        if (([v5 containsObject:v17] & 1) == 0)
        {
          id v18 = [v33 objectForKeyedSubscript:v17];
          v19 = +[NSFileManager defaultManager];
          v20 = [v18 fileURL];
          id v34 = 0;
          [v19 removeItemAtURL:v20 error:&v34];
          id v21 = v34;

          if (v21)
          {
            if ((objc_msgSend(v21, "fm_isFileNotFoundError") & 1) == 0)
            {
              objc_super v22 = sub_100004238();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                id v23 = [v21 code];
                *(_DWORD *)buf = 138412546;
                id v44 = v21;
                __int16 v45 = 2048;
                id v46 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Could not delete the file %@ %li", buf, 0x16u);
              }
            }
          }
          else
          {
            [v32 addObject:v17];
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v14);
  }
  v24 = (NSDictionary *)[v33 mutableCopy];
  [(NSDictionary *)v24 removeObjectsForKeys:v32];
  assetsByURL = v30->_assetsByURL;
  v30->_assetsByURL = v24;
  v26 = v24;

  v27 = [(FMDAssetRegistry *)v30 dataArchiver];
  v28 = [v27 saveDictionary:v26];

  if (v28)
  {
    v29 = sub_100004238();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10023EA80();
    }
  }
}

- (void)saveAssetMetadata:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDAssetRegistry *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087928;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSDictionary)assetsByURL
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned int v10 = sub_100087B20;
  id v11 = sub_100087B30;
  id v12 = 0;
  id v3 = [(FMDAssetRegistry *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100087B38;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)registryFileURL
{
  id v3 = [(FMDAssetRegistry *)self storeIdentifier];
  if (v3)
  {
    id v4 = [(FMDAssetRegistry *)self storeIdentifier];
    v5 = +[NSString stringWithFormat:@".%@", v4];
  }
  else
  {
    v5 = &stru_1002E7428;
  }

  id v6 = +[NSString stringWithFormat:@"com.apple.icloud.findmydeviced.FMDAssetRegistry%@.plist", v5];
  uint64_t v7 = [(FMDAssetRegistry *)self baseStoragePath];
  id v8 = [v7 URLByAppendingPathComponent:v6 isDirectory:0];

  return v8;
}

- (id)generateAssetURL
{
  id v3 = +[NSUUID UUID];
  id v4 = [v3 UUIDString];

  v5 = [(FMDAssetRegistry *)self baseStoragePath];
  id v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  return v6;
}

- (void)downloadAssets:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100087E7C;
  v3[3] = &unk_1002DC218;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (void)resumeBackgroundAssetDownloads:(id)a3
{
  id v3 = a3;
  xpc_set_event_stream_handler("com.apple.nsurlsessiond-events", (dispatch_queue_t)&_dispatch_main_q, &stru_1002DC258);
  [v3 resumeBackgroundTasks];
}

- (NSURL)baseStoragePath
{
  return self->_baseStoragePath;
}

- (void)setBaseStoragePath:(id)a3
{
}

- (void)setAssetsByURL:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_assetsByURL, 0);

  objc_storeStrong((id *)&self->_baseStoragePath, 0);
}

@end