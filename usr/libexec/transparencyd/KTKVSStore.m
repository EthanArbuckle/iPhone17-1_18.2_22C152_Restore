@interface KTKVSStore
+ (BOOL)afterFirstUnlock;
+ (id)strictStore;
- (BOOL)storeReady;
- (NSString)accountMetricID;
- (void)forceSync:(id)a3;
- (void)handleKVSStoreChange:(id)a3;
- (void)processChangedKeys:(id)a3;
@end

@implementation KTKVSStore

- (void)processChangedKeys:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = kApplicationIdentifierMap;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = +[KTOptInManagerServer optInKeyForApplication:](KTOptInManagerServer, "optInKeyForApplication:", v9, (void)v13);
        if ([v3 containsObject:v10])
        {
          v11 = +[KTOptInManagerServer notificationKeyForApplication:v9];
          if (v11)
          {
            v12 = +[NSDistributedNotificationCenter defaultCenter];
            [v12 postNotificationName:v11 object:0 userInfo:0 deliverImmediately:1];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)handleKVSStoreChange:(id)a3
{
  id v9 = [a3 userInfo];
  id v4 = [v9 objectForKey:NSUbiquitousKeyValueStoreChangeReasonKey];
  id v5 = [v9 objectForKey:NSUbiquitousKeyValueStoreChangedKeysKey];
  id v6 = [v4 integerValue];
  if ((unint64_t)v6 < 2)
  {
LABEL_4:
    [(KTKVSStore *)self processChangedKeys:v5];
    goto LABEL_6;
  }
  if (v6 != (id)2)
  {
    if (v6 != (id)3) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  uint64_t v7 = +[TransparencyError errorWithDomain:kTransparencyErrorAccount code:-284 description:@"KVS store quota violation"];
  v8 = +[TransparencyAnalytics logger];
  [v8 logResultForEvent:@"KVSStoreQuotaViolation" hardFailure:1 result:v7];

LABEL_6:
}

+ (BOOL)afterFirstUnlock
{
  int v2 = MKBDeviceUnlockedSinceBoot();
  if (v2 != 1)
  {
    if (qword_10032F0B0 != -1) {
      dispatch_once(&qword_10032F0B0, &stru_1002C64D0);
    }
    id v3 = qword_10032F0B8;
    if (os_log_type_enabled((os_log_t)qword_10032F0B8, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unable to open KVS store, device never unlocked: %d", (uint8_t *)v5, 8u);
    }
  }
  return v2 == 1;
}

+ (id)strictStore
{
  if (+[KTKVSStore afterFirstUnlock] && qword_10032F0C8 != -1) {
    dispatch_once(&qword_10032F0C8, &stru_1002C64F0);
  }
  int v2 = (void *)qword_10032F0C0;

  return v2;
}

- (NSString)accountMetricID
{
  id v3 = [(KTKVSStore *)self objectForKey:@"accountMetricID"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = +[NSUUID UUID];
    uint64_t v5 = [v4 UUIDString];

    [(KTKVSStore *)self setObject:v5 forKey:@"accountMetricID"];
    id v3 = (void *)v5;
  }

  return (NSString *)v3;
}

- (void)forceSync:(id)a3
{
  id v4 = a3;
  if (qword_10032F0B0 != -1) {
    dispatch_once(&qword_10032F0B0, &stru_1002C6530);
  }
  uint64_t v5 = qword_10032F0B8;
  if (os_log_type_enabled((os_log_t)qword_10032F0B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "KTKVSStore calling synchronizeWithCompletionHandler", buf, 2u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C1838;
  v7[3] = &unk_1002B9CA0;
  id v8 = v4;
  id v6 = v4;
  [(KTKVSStore *)self synchronizeWithCompletionHandler:v7];
}

- (BOOL)storeReady
{
  return 1;
}

@end