@interface FMDRealmSupport
+ (id)redirectedHostForHost:(id)a3 withContext:(id)a4;
+ (void)_updateRealmPrefs;
+ (void)clearCachedHostsWithContext:(id)a3;
+ (void)initialize;
+ (void)setRedirectedHost:(id)a3 forHost:(id)a4 withContext:(id)a5;
@end

@implementation FMDRealmSupport

+ (void)initialize
{
  if (!qword_10031E808)
  {
    id v2 = objc_alloc_init((Class)NSMutableDictionary);
    v3 = (void *)qword_10031E808;
    qword_10031E808 = (uint64_t)v2;

    id v4 = objc_alloc_init((Class)NSRecursiveLock);
    v5 = (void *)qword_10031E810;
    qword_10031E810 = (uint64_t)v4;

    v6 = +[FMPreferencesUtil dictionaryForKey:@"RealmRedirects" inDomain:kFMDPrefDomain];
    v7 = [v6 allKeys];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v13 = [v6 objectForKeyedSubscript:v12];
          id v14 = [v13 mutableCopy];
          [(id)qword_10031E808 setObject:v14 forKeyedSubscript:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

+ (id)redirectedHostForHost:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  id v8 = @"DefaultContext";
  if (v6) {
    id v8 = v6;
  }
  id v9 = v8;
  [(id)qword_10031E810 lock];
  uint64_t v10 = [(id)qword_10031E808 objectForKeyedSubscript:v9];
  v11 = [v10 objectForKeyedSubscript:v5];

  [(id)qword_10031E810 unlock];
  if ([v11 isEqualToString:v5])
  {

    v11 = 0;
  }

  return v11;
}

+ (void)setRedirectedHost:(id)a3 forHost:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (__CFString *)a5;
  uint64_t v10 = v9;
  v11 = @"DefaultContext";
  if (v9) {
    v11 = v9;
  }
  uint64_t v12 = v11;
  if (!v8)
  {
    v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Can't cache realm host - NULL host value", (uint8_t *)v15, 2u);
    }
  }
  [(id)qword_10031E810 lock];
  id v14 = [(id)qword_10031E808 objectForKeyedSubscript:v12];
  if (!v14)
  {
    id v14 = +[NSMutableDictionary dictionary];
    [(id)qword_10031E808 setObject:v14 forKeyedSubscript:v12];
  }
  if (v7) {
    [v14 setObject:v7 forKeyedSubscript:v8];
  }
  else {
    [v14 removeObjectForKey:v8];
  }
  +[FMDRealmSupport _updateRealmPrefs];

  [(id)qword_10031E810 unlock];
}

+ (void)clearCachedHostsWithContext:(id)a3
{
  v3 = (__CFString *)a3;
  id v4 = v3;
  id v5 = @"DefaultContext";
  if (v3) {
    id v5 = v3;
  }
  v6 = v5;
  [(id)qword_10031E810 lock];
  if (qword_10031E808)
  {
    id v7 = [(id)qword_10031E808 objectForKeyedSubscript:v6];

    if (v7)
    {
      [(id)qword_10031E808 removeObjectForKey:v6];
      +[FMDRealmSupport _updateRealmPrefs];
    }
  }
  [(id)qword_10031E810 unlock];
}

+ (void)_updateRealmPrefs
{
  id v2 = +[FMXPCTransactionManager sharedInstance];
  [v2 beginTransaction:@"UpdatingRealmPrefs"];

  +[FMPreferencesUtil setDictionary:qword_10031E808 forKey:@"RealmRedirects" inDomain:kFMDPrefDomain];
  id v3 = +[FMXPCTransactionManager sharedInstance];
  [v3 endTransaction:@"UpdatingRealmPrefs"];
}

@end