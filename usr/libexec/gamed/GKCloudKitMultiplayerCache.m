@interface GKCloudKitMultiplayerCache
- (BOOL)isValid;
- (CKRecordID)userRecordID;
- (GKCloudKitMultiplayerCache)init;
- (GKCloudPlayer)userPlayer;
- (NSDate)expiration;
- (NSMutableDictionary)bundleIDExpirations;
- (NSMutableDictionary)bundleIDsByContainerName;
- (NSString)databasePath;
- (id)bundleIDCacheURL;
- (id)bundleIDsForContainerName:(id)a3;
- (id)localPlayerAlias;
- (sqlite3)database;
- (void)clearWithHandler:(id)a3;
- (void)setBundleIDExpirations:(id)a3;
- (void)setBundleIDsByContainerName:(id)a3;
- (void)setDatabase:(sqlite3 *)a3;
- (void)setDatabasePath:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setUserRecordID:(id)a3;
- (void)updateBundleIDs:(id)a3 forContainerName:(id)a4;
- (void)updateUserWithHandler:(id)a3;
- (void)writeBundleIDsToDisk;
@end

@implementation GKCloudKitMultiplayerCache

- (GKCloudKitMultiplayerCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)GKCloudKitMultiplayerCache;
  v2 = [(GKCloudKitMultiplayerCache *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    bundleIDsByContainerName = v2->_bundleIDsByContainerName;
    v2->_bundleIDsByContainerName = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    bundleIDExpirations = v2->_bundleIDExpirations;
    v2->_bundleIDExpirations = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.GameCenter.GKCloudKitMultiplayerCache", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.GameCenter.GKCloudKitMultiplayerCache.User", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    cacheUserQueue = v2->_cacheUserQueue;
    v2->_cacheUserQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)clearWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKAccount;
  if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
    sub_1000BC674(v6);
  }
  cacheQueue = self->_cacheQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000BB470;
  v9[3] = &unk_1002D3C38;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_barrier_async(cacheQueue, v9);
}

- (BOOL)isValid
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BB594;
  v5[3] = &unk_1002D6B58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsValid:(BOOL)a3
{
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BB654;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_barrier_async(cacheQueue, block);
}

- (CKRecordID)userRecordID
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_1000BB798;
  id v10 = sub_1000BB7A8;
  id v11 = 0;
  cacheUserQueue = self->_cacheUserQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BB7B0;
  v5[3] = &unk_1002D6B58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheUserQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CKRecordID *)v3;
}

- (id)localPlayerAlias
{
  v2 = +[GKClientProxy gameCenterClient];
  id v3 = +[GKPlayerCredentialController sharedController];
  id v4 = +[GKDataRequestManager sharedManager];
  id v5 = [v3 primaryCredentialForEnvironment:[v4 currentEnvironment]];

  uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKCloudKitMultiplayerCache.m", 129, "-[GKCloudKitMultiplayerCache localPlayerAlias]");
  dispatch_queue_t v7 = [v5 playerInternal];
  uint64_t v8 = [v7 playerID];
  char v9 = [v2 transactionGroupWithName:v6 forPlayerID:v8];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BB96C;
  v13[3] = &unk_1002D51F8;
  id v14 = v9;
  id v10 = v9;
  [v10 performOnManagedObjectContext:v13];
  [v10 waitWithTimeout:60.0];
  id v11 = [v10 result];

  return v11;
}

- (GKCloudPlayer)userPlayer
{
  id v3 = [(GKCloudKitMultiplayerCache *)self userRecordID];

  if (v3)
  {
    id v3 = objc_alloc_init((Class)GKCloudPlayer);
    id v4 = [(GKCloudKitMultiplayerCache *)self userRecordID];
    id v5 = [v4 recordName];
    [v3 setIdentifier:v5];

    uint64_t v6 = [(GKCloudKitMultiplayerCache *)self localPlayerAlias];
    [v3 setName:v6];
  }

  return (GKCloudPlayer *)v3;
}

- (void)updateUserWithHandler:(id)a3
{
  id v4 = a3;
  cacheUserQueue = self->_cacheUserQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BBB50;
  v7[3] = &unk_1002D3C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(cacheUserQueue, v7);
}

- (id)bundleIDsForContainerName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1000BB798;
  v17 = sub_1000BB7A8;
  id v18 = 0;
  if (v4)
  {
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BC1D0;
    block[3] = &unk_1002D8F20;
    block[4] = self;
    id v11 = v4;
    objc_super v12 = &v13;
    dispatch_sync(cacheQueue, block);

    dispatch_queue_t v7 = (void *)v14[5];
  }
  else
  {
    dispatch_queue_t v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)updateBundleIDs:(id)a3 forContainerName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BC338;
    block[3] = &unk_1002D4888;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_barrier_async(cacheQueue, block);
  }
}

- (id)bundleIDCacheURL
{
  v2 = GKInsecureCacheRoot();
  id v3 = [v2 stringByAppendingPathComponent:@"sessions-bundleIDs"];
  id v4 = [v3 stringByAppendingPathExtension:@"data"];

  id v5 = +[NSURL fileURLWithPath:v4];

  return v5;
}

- (void)writeBundleIDsToDisk
{
  v11[0] = @"bundleIDs";
  v11[1] = @"expirations";
  bundleIDExpirations = self->_bundleIDExpirations;
  v12[0] = self->_bundleIDsByContainerName;
  v12[1] = bundleIDExpirations;
  id v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v10 = 0;
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v10];
  id v6 = v10;
  id v7 = [(GKCloudKitMultiplayerCache *)self bundleIDCacheURL];
  id v9 = v6;
  [v5 writeToURL:v7 options:1 error:&v9];
  id v8 = v9;
}

- (void)setUserRecordID:(id)a3
{
}

- (NSMutableDictionary)bundleIDsByContainerName
{
  return self->_bundleIDsByContainerName;
}

- (void)setBundleIDsByContainerName:(id)a3
{
}

- (NSMutableDictionary)bundleIDExpirations
{
  return self->_bundleIDExpirations;
}

- (void)setBundleIDExpirations:(id)a3
{
}

- (sqlite3)database
{
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_bundleIDExpirations, 0);
  objc_storeStrong((id *)&self->_bundleIDsByContainerName, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_cacheUserQueue, 0);

  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end