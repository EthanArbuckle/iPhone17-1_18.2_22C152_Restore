@interface FMFCloudKitCache
+ (id)cacheDirectory;
+ (id)pathToAllUnacceptedCKSharesInDatabaseWithScope:(int64_t)a3;
+ (id)pathToDataForRecordWithID:(id)a3 inDatabaseWithScope:(int64_t)a4;
+ (id)pathToDataForUnacceptedCKShareTokenForShareURL:(id)a3 InDatabaseWithScope:(int64_t)a4;
+ (id)pathToServerChangeTokenDataForScope:(int64_t)a3;
+ (id)pathToServerChangeTokenDataForZoneWithID:(id)a3 inDatabaseWithScope:(int64_t)a4;
- (BOOL)removeRecordWithID:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5;
- (BOOL)removeServerChangeTokenForZoneWithID:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5;
- (BOOL)removeUnacceptedShareInvitationWithShareURLString:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5;
- (BOOL)updateRecord:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5;
- (BOOL)updateServerChangeToken:(id)a3 forDatabaseWithScope:(int64_t)a4 error:(id *)a5;
- (BOOL)updateServerChangeToken:(id)a3 forZoneWithID:(id)a4 inDatabaseWithScope:(int64_t)a5 error:(id *)a6;
- (BOOL)updateUnacceptedShareInvitationsWithShareURLString:(id)a3 invitationTokenBase64String:(id)a4 InDatabaseWithScope:(int64_t)a5 error:(id *)a6;
- (FMFCloudKitCache)init;
- (NSMutableDictionary)records;
- (NSMutableDictionary)serverChangeTokens;
- (NSMutableDictionary)zoneServerChangeTokens;
- (OS_dispatch_queue)accountQueue;
- (id)recordWithID:(id)a3 inDatabaseWithScope:(int64_t)a4;
- (id)scopeStringForAccountWithScope:(int64_t)a3;
- (id)serverChangeTokenForDatabaseWithScope:(int64_t)a3;
- (id)serverChangeTokenForZoneWithID:(id)a3 inDatabaseWithScope:(int64_t)a4;
- (id)unacceptedShareInvitationsInDatabaseWithScope:(int64_t)a3;
- (void)setAccountQueue:(id)a3;
- (void)setRecords:(id)a3;
- (void)setServerChangeTokens:(id)a3;
- (void)setZoneServerChangeTokens:(id)a3;
@end

@implementation FMFCloudKitCache

- (FMFCloudKitCache)init
{
  v26.receiver = self;
  v26.super_class = (Class)FMFCloudKitCache;
  v2 = [(FMFCloudKitCache *)&v26 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.icloud.fmfd.cloudkitCache.accountQueue", 0);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    v5 = [(FMFCloudKitCache *)v2 scopeStringForAccountWithScope:2];
    v29[0] = v5;
    v6 = objc_opt_new();
    v30[0] = v6;
    v7 = [(FMFCloudKitCache *)v2 scopeStringForAccountWithScope:3];
    v29[1] = v7;
    v8 = objc_opt_new();
    v30[1] = v8;
    v9 = [(FMFCloudKitCache *)v2 scopeStringForAccountWithScope:1];
    v29[2] = v9;
    v10 = objc_opt_new();
    v30[2] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
    v12 = (NSMutableDictionary *)[v11 mutableCopy];
    records = v2->_records;
    v2->_records = v12;

    v14 = [(FMFCloudKitCache *)v2 scopeStringForAccountWithScope:2];
    v27[0] = v14;
    v15 = objc_opt_new();
    v28[0] = v15;
    v16 = [(FMFCloudKitCache *)v2 scopeStringForAccountWithScope:3];
    v27[1] = v16;
    v17 = objc_opt_new();
    v28[1] = v17;
    v18 = [(FMFCloudKitCache *)v2 scopeStringForAccountWithScope:1];
    v27[2] = v18;
    v19 = objc_opt_new();
    v28[2] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
    v21 = (NSMutableDictionary *)[v20 mutableCopy];
    zoneServerChangeTokens = v2->_zoneServerChangeTokens;
    v2->_zoneServerChangeTokens = v21;

    uint64_t v23 = objc_opt_new();
    serverChangeTokens = v2->_serverChangeTokens;
    v2->_serverChangeTokens = (NSMutableDictionary *)v23;
  }
  return v2;
}

+ (id)cacheDirectory
{
  v2 = +[FMFAccountManager sharedInstance];
  dispatch_queue_t v3 = [v2 storedDSID];

  v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = [v4 firstObject];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 bundleIdentifier];
  v8 = [v5 stringByAppendingPathComponent:v7];

  v9 = [v8 stringByAppendingPathComponent:@"FMFCloudKitCache"];

  v10 = [v9 stringByAppendingPathComponent:v3];

  v11 = +[NSString stringWithFormat:@"_v%@", @"1"];
  v12 = [v10 stringByAppendingString:v11];

  return v12;
}

+ (id)pathToServerChangeTokenDataForScope:(int64_t)a3
{
  dispatch_queue_t v3 = [a1 cacheDirectory];
  v4 = [v3 stringByAppendingPathComponent:@"serverChangeTokens"];

  v5 = CKDatabaseScopeString();
  v6 = [v4 stringByAppendingPathComponent:v5];

  v7 = [v6 stringByAppendingPathExtension:@"data"];

  return v7;
}

+ (id)pathToServerChangeTokenDataForZoneWithID:(id)a3 inDatabaseWithScope:(int64_t)a4
{
  id v5 = a3;
  v6 = [a1 cacheDirectory];
  v7 = [v6 stringByAppendingPathComponent:@"zoneServerChangeToken"];

  v8 = CKDatabaseScopeString();
  v9 = [v7 stringByAppendingPathComponent:v8];

  v10 = [v5 ownerName];
  v11 = [v10 lastPathComponent];
  v12 = [v9 stringByAppendingPathComponent:v11];

  v13 = [v5 zoneName];

  v14 = [v13 lastPathComponent];
  v15 = [v12 stringByAppendingPathComponent:v14];

  v16 = [v15 stringByAppendingPathExtension:@"data"];

  return v16;
}

+ (id)pathToDataForRecordWithID:(id)a3 inDatabaseWithScope:(int64_t)a4
{
  id v5 = a3;
  v6 = [a1 cacheDirectory];
  v7 = [v6 stringByAppendingPathComponent:@"records"];

  v8 = CKDatabaseScopeString();
  v9 = [v7 stringByAppendingPathComponent:v8];

  v10 = [v5 zoneID];
  v11 = [v10 ownerName];
  v12 = [v11 lastPathComponent];
  v13 = [v9 stringByAppendingPathComponent:v12];

  v14 = [v5 zoneID];
  v15 = [v14 zoneName];
  v16 = [v15 lastPathComponent];
  v17 = [v13 stringByAppendingPathComponent:v16];

  v18 = [v5 recordName];

  v19 = [v18 lastPathComponent];
  v20 = [v17 stringByAppendingPathComponent:v19];

  v21 = [v20 stringByAppendingPathExtension:@"data"];

  return v21;
}

+ (id)pathToDataForUnacceptedCKShareTokenForShareURL:(id)a3 InDatabaseWithScope:(int64_t)a4
{
  id v5 = a3;
  v6 = [a1 cacheDirectory];
  v7 = [v6 stringByAppendingPathComponent:@"unacceptedShares"];

  v8 = CKDatabaseScopeString();
  v9 = [v7 stringByAppendingPathComponent:v8];

  v10 = [v9 stringByAppendingPathComponent:v5];

  v11 = [v10 stringByAppendingPathComponent:@"data"];

  return v11;
}

+ (id)pathToAllUnacceptedCKSharesInDatabaseWithScope:(int64_t)a3
{
  dispatch_queue_t v3 = [a1 cacheDirectory];
  v4 = [v3 stringByAppendingPathComponent:@"unacceptedShares"];

  id v5 = CKDatabaseScopeString();
  v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

- (id)scopeStringForAccountWithScope:(int64_t)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_100007658;
  v12 = sub_1000075F0;
  id v13 = 0;
  v4 = [(FMFCloudKitCache *)self accountQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047694;
  v7[3] = &unk_1000A2D80;
  v7[4] = &v8;
  v7[5] = a3;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (BOOL)updateUnacceptedShareInvitationsWithShareURLString:(id)a3 invitationTokenBase64String:(id)a4 InDatabaseWithScope:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v9 lastPathComponent];
    *(_DWORD *)buf = 136315394;
    v31 = "-[FMFCloudKitCache updateUnacceptedShareInvitationsWithShareURLString:invitationTokenBase64String:InDatabaseWithScope:error:]";
    __int16 v32 = 2112;
    v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: share path: %@", buf, 0x16u);
  }
  id v29 = 0;
  id v13 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v29];

  id v14 = v29;
  if (v14)
  {
    v15 = v14;
    v16 = sub_100005560();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10006C620();
    }

    id v17 = v15;
    BOOL v18 = 0;
    *a6 = v17;
  }
  else
  {
    v19 = objc_opt_class();
    v20 = [v9 lastPathComponent];
    v21 = [v19 pathToDataForUnacceptedCKShareTokenForShareURL:v20 InDatabaseWithScope:a5];

    v22 = +[NSFileManager defaultManager];
    uint64_t v23 = [v21 stringByDeletingLastPathComponent];
    id v28 = 0;
    [v22 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:0 error:&v28];
    id v24 = v28;

    id v27 = v24;
    [v13 writeToFile:v21 options:0 error:&v27];
    id v17 = v27;

    BOOL v18 = v17 == 0;
    if (v17)
    {
      v25 = sub_100005560();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10006C5AC();
      }

      *a6 = v17;
    }
  }
  return v18;
}

- (id)unacceptedShareInvitationsInDatabaseWithScope:(int64_t)a3
{
  dispatch_queue_t v3 = [(id)objc_opt_class() pathToAllUnacceptedCKSharesInDatabaseWithScope:a3];
  id v29 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (id *)NSFileManager_ptr;
  id v5 = +[NSFileManager defaultManager];
  v6 = [v5 enumeratorAtPath:v3];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    uint64_t v30 = *(void *)v35;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(NSObject **)(*((void *)&v34 + 1) + 8 * (void)v10);
        v12 = sub_100005560();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v39 = "-[FMFCloudKitCache unacceptedShareInvitationsInDatabaseWithScope:]";
          __int16 v40 = 2112;
          v41 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Unaccepted Share at path: %@", buf, 0x16u);
        }

        id v13 = [v3 stringByAppendingPathComponent:v11];
        id v14 = [v13 stringByAppendingPathComponent:@"data"];

        v15 = [*v4 defaultManager];
        unsigned __int8 v16 = [v15 fileExistsAtPath:v14];

        if (v16)
        {
          id v33 = 0;
          id v17 = +[NSData dataWithContentsOfFile:v14 options:0 error:&v33];
          BOOL v18 = v33;
          if (v18)
          {
            v19 = sub_100005560();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[FMFCloudKitCache unacceptedShareInvitationsInDatabaseWithScope:]";
              __int16 v40 = 2112;
              v41 = v18;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: read error: %@", buf, 0x16u);
            }
          }
          id v20 = v8;
          v21 = v3;
          v22 = +[NSSet setWithObject:objc_opt_class()];
          __int16 v32 = v18;
          uint64_t v23 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v22 fromData:v17 error:&v32];
          id v24 = v32;

          if (v24)
          {
            v25 = sub_100005560();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[FMFCloudKitCache unacceptedShareInvitationsInDatabaseWithScope:]";
              __int16 v40 = 2112;
              v41 = v24;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s: unarchive error: %@", buf, 0x16u);
            }
          }
          else
          {
            v25 = +[NSURL URLWithString:@"https://www.icloud.com/share/"];
            objc_super v26 = [v25 absoluteString];
            id v27 = [v26 stringByAppendingPathComponent:v11];

            [v29 setValue:v23 forKey:v27];
          }
          id v8 = v20;

          dispatch_queue_t v3 = v21;
          v4 = (id *)NSFileManager_ptr;
          uint64_t v9 = v30;
        }
        else
        {
          id v24 = sub_100005560();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v39 = "-[FMFCloudKitCache unacceptedShareInvitationsInDatabaseWithScope:]";
            __int16 v40 = 2112;
            v41 = v3;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s: no file at %@", buf, 0x16u);
          }
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v8);
  }

  return v29;
}

- (BOOL)removeUnacceptedShareInvitationWithShareURLString:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_opt_class();
  uint64_t v9 = [v7 lastPathComponent];
  id v10 = [v8 pathToDataForUnacceptedCKShareTokenForShareURL:v9 InDatabaseWithScope:a4];

  v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v7 lastPathComponent];
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[FMFCloudKitCache removeUnacceptedShareInvitationWithShareURLString:inDatabaseWithScope:error:]";
    __int16 v24 = 2112;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: share path: %@", buf, 0x16u);
  }
  id v13 = +[NSFileManager defaultManager];
  unsigned __int8 v14 = [v13 fileExistsAtPath:v10];

  if (v14)
  {
    v15 = +[NSFileManager defaultManager];
    unsigned __int8 v16 = [v10 stringByDeletingLastPathComponent];
    id v21 = 0;
    unsigned __int8 v17 = [v15 removeItemAtPath:v16 error:&v21];
    BOOL v18 = v21;

    if ((v17 & 1) == 0)
    {
      v19 = sub_100005560();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10006C694();
      }

      BOOL v18 = v18;
      *a5 = v18;
    }
  }
  else
  {
    BOOL v18 = sub_100005560();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10006C708();
    }
    unsigned __int8 v17 = 1;
  }

  return v17;
}

- (id)serverChangeTokenForDatabaseWithScope:(int64_t)a3
{
  id v5 = -[FMFCloudKitCache scopeStringForAccountWithScope:](self, "scopeStringForAccountWithScope:");
  v6 = [(FMFCloudKitCache *)self serverChangeTokens];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = v8;
    goto LABEL_13;
  }
  id v10 = [(id)objc_opt_class() pathToServerChangeTokenDataForScope:a3];
  v11 = +[NSFileManager defaultManager];
  unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

  if ((v12 & 1) == 0)
  {
    id v13 = sub_100005560();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10006C864();
    }
    goto LABEL_10;
  }
  id v23 = 0;
  id v13 = +[NSData dataWithContentsOfFile:v10 options:0 error:&v23];
  id v14 = v23;
  if (v14)
  {
    v15 = v14;
    unsigned __int8 v16 = sub_100005560();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10006C7F0();
    }

LABEL_10:
    id v8 = 0;
    goto LABEL_11;
  }
  id v22 = 0;
  id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:&v22];
  id v18 = v22;
  if (!v18)
  {
    id v21 = [(FMFCloudKitCache *)self serverChangeTokens];
    [v21 setObject:v8 forKeyedSubscript:v5];

    id v8 = v8;
    uint64_t v9 = v8;
    goto LABEL_12;
  }
  v19 = v18;
  id v20 = sub_100005560();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10006C77C();
  }

LABEL_11:
  uint64_t v9 = 0;
LABEL_12:

LABEL_13:

  return v9;
}

- (BOOL)updateServerChangeToken:(id)a3 forDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(FMFCloudKitCache *)self scopeStringForAccountWithScope:a4];
  id v25 = 0;
  id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v25];
  id v11 = v25;
  if (v11)
  {
    unsigned __int8 v12 = v11;
    id v13 = sub_100005560();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10006C958();
    }

    id v14 = v12;
    BOOL v15 = 0;
    *a5 = v14;
  }
  else
  {
    unsigned __int8 v16 = [(id)objc_opt_class() pathToServerChangeTokenDataForScope:a4];
    unsigned __int8 v17 = +[NSFileManager defaultManager];
    id v18 = [v16 stringByDeletingLastPathComponent];
    id v24 = 0;
    [v17 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v19 = v24;

    id v23 = v19;
    [v10 writeToFile:v16 options:0 error:&v23];
    id v14 = v23;

    BOOL v15 = v14 == 0;
    if (v14)
    {
      id v20 = sub_100005560();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10006C8E4();
      }

      *a5 = v14;
    }
    else
    {
      id v21 = [(FMFCloudKitCache *)self serverChangeTokens];
      [v21 setObject:v8 forKeyedSubscript:v9];
    }
  }

  return v15;
}

- (BOOL)removeServerChangeTokenForZoneWithID:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(FMFCloudKitCache *)self scopeStringForAccountWithScope:a4];
  id v10 = [(id)objc_opt_class() pathToServerChangeTokenDataForZoneWithID:v8 inDatabaseWithScope:a4];
  id v11 = +[NSFileManager defaultManager];
  unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

  if (v12)
  {
    id v13 = +[NSFileManager defaultManager];
    id v20 = 0;
    unsigned __int8 v14 = [v13 removeItemAtPath:v10 error:&v20];
    BOOL v15 = v20;

    if (v14)
    {
      unsigned __int8 v16 = [(FMFCloudKitCache *)self zoneServerChangeTokens];
      unsigned __int8 v17 = [v16 objectForKeyedSubscript:v9];
      [v17 setObject:0 forKeyedSubscript:v8];
    }
    else
    {
      id v18 = sub_100005560();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10006C9CC();
      }

      BOOL v15 = v15;
      *a5 = v15;
    }
  }
  else
  {
    BOOL v15 = sub_100005560();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10006CA40();
    }
    unsigned __int8 v14 = 1;
  }

  return v14;
}

- (BOOL)updateServerChangeToken:(id)a3 forZoneWithID:(id)a4 inDatabaseWithScope:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned __int8 v12 = [(FMFCloudKitCache *)self scopeStringForAccountWithScope:a5];
  id v29 = 0;
  id v13 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v29];
  id v14 = v29;
  if (v14)
  {
    BOOL v15 = v14;
    unsigned __int8 v16 = sub_100005560();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10006CB28();
    }

    id v17 = v15;
    BOOL v18 = 0;
    *a6 = v17;
  }
  else
  {
    id v19 = [(id)objc_opt_class() pathToServerChangeTokenDataForZoneWithID:v11 inDatabaseWithScope:a5];
    id v20 = +[NSFileManager defaultManager];
    id v21 = [v19 stringByDeletingLastPathComponent];
    id v28 = 0;
    [v20 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v28];
    id v22 = v28;

    id v27 = v22;
    [v13 writeToFile:v19 options:0 error:&v27];
    id v17 = v27;

    BOOL v18 = v17 == 0;
    if (v17)
    {
      id v23 = sub_100005560();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10006CAB4();
      }

      *a6 = v17;
    }
    else
    {
      id v24 = [(FMFCloudKitCache *)self zoneServerChangeTokens];
      id v25 = [v24 objectForKeyedSubscript:v12];
      [v25 setObject:v10 forKeyedSubscript:v11];
    }
  }

  return v18;
}

- (id)serverChangeTokenForZoneWithID:(id)a3 inDatabaseWithScope:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(FMFCloudKitCache *)self scopeStringForAccountWithScope:a4];
  id v8 = [(FMFCloudKitCache *)self zoneServerChangeTokens];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    id v11 = v10;
    unsigned __int8 v12 = v11;
    goto LABEL_18;
  }
  id v13 = [(id)objc_opt_class() pathToServerChangeTokenDataForZoneWithID:v6 inDatabaseWithScope:a4];
  id v14 = +[NSFileManager defaultManager];
  unsigned __int8 v15 = [v14 fileExistsAtPath:v13];

  if ((v15 & 1) == 0)
  {
    unsigned __int8 v16 = sub_100005560();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10006CC84();
    }
    goto LABEL_15;
  }
  id v26 = 0;
  unsigned __int8 v16 = +[NSData dataWithContentsOfFile:v13 options:0 error:&v26];
  id v17 = v26;
  if (v17 || !v16)
  {
    id v21 = sub_100005560();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10006CC10();
    }

LABEL_15:
    id v11 = 0;
    goto LABEL_16;
  }
  id v25 = 0;
  id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v16 error:&v25];
  id v18 = v25;
  if (!v18)
  {
    if (v6 && v11 && v7)
    {
      id v23 = [(FMFCloudKitCache *)self zoneServerChangeTokens];
      id v24 = [v23 objectForKeyedSubscript:v7];
      [v24 setObject:v11 forKeyedSubscript:v6];
    }
    else
    {
      id v23 = sub_100005560();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        id v28 = "-[FMFCloudKitCache serverChangeTokenForZoneWithID:inDatabaseWithScope:]";
        __int16 v29 = 2112;
        uint64_t v30 = 0;
        __int16 v31 = 2112;
        id v32 = v6;
        __int16 v33 = 2112;
        id v34 = v11;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Invalid scope, ID, or zoneServerChangeToken. Scope: %@, zoneID: %@, zoneServerChangeToken: %@", buf, 0x2Au);
      }
    }

    id v11 = v11;
    unsigned __int8 v12 = v11;
    goto LABEL_17;
  }
  id v19 = v18;
  id v20 = sub_100005560();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10006CB9C();
  }

LABEL_16:
  unsigned __int8 v12 = 0;
LABEL_17:

LABEL_18:

  return v12;
}

- (BOOL)updateRecord:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(FMFCloudKitCache *)self scopeStringForAccountWithScope:a4];
  id v10 = [v8 recordID];
  id v27 = 0;
  id v11 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v27];
  id v12 = v27;
  if (v12)
  {
    id v13 = v12;
    id v14 = sub_100005560();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10006CD78();
    }

    id v15 = v13;
    BOOL v16 = 0;
    *a5 = v15;
  }
  else
  {
    id v17 = [(id)objc_opt_class() pathToDataForRecordWithID:v10 inDatabaseWithScope:a4];
    id v18 = +[NSFileManager defaultManager];
    id v19 = [v17 stringByDeletingLastPathComponent];
    id v26 = 0;
    [v18 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:&v26];
    id v20 = v26;

    id v25 = v20;
    [v11 writeToFile:v17 options:0 error:&v25];
    id v15 = v25;

    BOOL v16 = v15 == 0;
    if (v15)
    {
      id v21 = sub_100005560();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10006CD04();
      }

      *a5 = v15;
    }
    else
    {
      id v22 = [(FMFCloudKitCache *)self records];
      id v23 = [v22 objectForKeyedSubscript:v9];
      [v23 setObject:v8 forKeyedSubscript:v10];
    }
  }

  return v16;
}

- (BOOL)removeRecordWithID:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(FMFCloudKitCache *)self scopeStringForAccountWithScope:a4];
  id v10 = [(id)objc_opt_class() pathToDataForRecordWithID:v8 inDatabaseWithScope:a4];
  id v11 = +[NSFileManager defaultManager];
  unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

  if (v12)
  {
    id v13 = +[NSFileManager defaultManager];
    id v20 = 0;
    unsigned __int8 v14 = [v13 removeItemAtPath:v10 error:&v20];
    id v15 = v20;

    if (v14)
    {
      BOOL v16 = [(FMFCloudKitCache *)self records];
      id v17 = [v16 objectForKeyedSubscript:v9];
      [v17 setObject:0 forKeyedSubscript:v8];
    }
    else
    {
      id v18 = sub_100005560();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10006CDEC();
      }

      id v15 = v15;
      *a5 = v15;
    }
  }
  else
  {
    id v15 = sub_100005560();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10006CE60();
    }
    unsigned __int8 v14 = 1;
  }

  return v14;
}

- (id)recordWithID:(id)a3 inDatabaseWithScope:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(FMFCloudKitCache *)self scopeStringForAccountWithScope:a4];
  id v8 = [(FMFCloudKitCache *)self records];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    id v11 = v10;
    unsigned __int8 v12 = v11;
    goto LABEL_18;
  }
  id v13 = [(id)objc_opt_class() pathToDataForRecordWithID:v6 inDatabaseWithScope:a4];
  unsigned __int8 v14 = +[NSFileManager defaultManager];
  unsigned __int8 v15 = [v14 fileExistsAtPath:v13];

  if ((v15 & 1) == 0)
  {
    id v18 = sub_100005560();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10006CFBC();
    }
    id v11 = 0;
    unsigned __int8 v12 = 0;
    goto LABEL_17;
  }
  id v26 = 0;
  BOOL v16 = +[NSData dataWithContentsOfFile:v13 options:0 error:&v26];
  id v17 = v26;
  if (v17)
  {
    id v18 = v17;
    id v19 = sub_100005560();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10006CF48();
    }
    id v11 = 0;
  }
  else
  {
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    id v20 = +[NSArray arrayWithObjects:v27 count:2];
    id v19 = +[NSSet setWithArray:v20];

    id v25 = 0;
    id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v19 fromData:v16 error:&v25];
    id v18 = v25;
    if (!v18)
    {
      id v23 = [(FMFCloudKitCache *)self records];
      id v24 = [v23 objectForKeyedSubscript:v7];
      [v24 setObject:v11 forKeyedSubscript:v6];

      id v11 = v11;
      unsigned __int8 v12 = v11;
      goto LABEL_16;
    }
    id v21 = sub_100005560();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10006CED4();
    }
  }
  unsigned __int8 v12 = 0;
LABEL_16:

LABEL_17:
LABEL_18:

  return v12;
}

- (NSMutableDictionary)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (NSMutableDictionary)zoneServerChangeTokens
{
  return self->_zoneServerChangeTokens;
}

- (void)setZoneServerChangeTokens:(id)a3
{
}

- (NSMutableDictionary)serverChangeTokens
{
  return self->_serverChangeTokens;
}

- (void)setServerChangeTokens:(id)a3
{
}

- (OS_dispatch_queue)accountQueue
{
  return self->_accountQueue;
}

- (void)setAccountQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountQueue, 0);
  objc_storeStrong((id *)&self->_serverChangeTokens, 0);
  objc_storeStrong((id *)&self->_zoneServerChangeTokens, 0);

  objc_storeStrong((id *)&self->_records, 0);
}

@end