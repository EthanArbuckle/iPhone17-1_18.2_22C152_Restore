@interface APAttributionCacheElement
+ (id)cachedElementForBundleIdentifier:(id)a3;
+ (id)elementWithToken:(id)a3 andBundle:(id)a4 andAppTrackingStatus:(BOOL)a5 andToroID:(id)a6;
+ (void)cacheStore;
+ (void)cleanCache;
+ (void)clearCache;
- (APAttributionCacheElement)initWith:(id)a3 andToken:(id)a4 andAppTrackingStatus:(BOOL)a5 andToroID:(id)a6;
- (BOOL)appAdTrackingStatus;
- (BOOL)checkExpiry;
- (BOOL)didAppTrackingStateChange:(BOOL)a3;
- (BOOL)didToroIDChange:(id)a3;
- (BOOL)isExpired;
- (BOOL)isValidCheckWithToroID:(id)a3 andTrackingStatus:(BOOL)a4;
- (NSString)bundleID;
- (NSString)token;
- (NSUUID)toroID;
- (double)timestamp;
- (void)setAppAdTrackingStatus:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setToken:(id)a3;
- (void)setToroID:(id)a3;
@end

@implementation APAttributionCacheElement

- (APAttributionCacheElement)initWith:(id)a3 andToken:(id)a4 andAppTrackingStatus:(BOOL)a5 andToroID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)APAttributionCacheElement;
  v14 = [(APAttributionCacheElement *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bundleID, a3);
    objc_storeStrong((id *)&v15->_token, a4);
    v15->_appAdTrackingStatus = a5;
    objc_storeStrong((id *)&v15->_toroID, a6);
    v16 = +[NSDate date];
    [v16 timeIntervalSince1970];
    v15->_timestamp = v17;
  }
  return v15;
}

+ (id)elementWithToken:(id)a3 andBundle:(id)a4 andAppTrackingStatus:(BOOL)a5 andToroID:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  +[APAttributionCacheElement cacheStore];
  id v12 = [[APAttributionCacheElement alloc] initWith:v9 andToken:v11 andAppTrackingStatus:v7 andToroID:v10];

  if (v12)
  {
    [(id)qword_1002889B0 lock];
    [(id)qword_1002889B8 setObject:v12 forKey:v9];
    [(id)qword_1002889B0 unlock];
  }
  +[APAttributionCacheElement cleanCache];

  return v12;
}

+ (id)cachedElementForBundleIdentifier:(id)a3
{
  id v3 = a3;
  +[APAttributionCacheElement cacheStore];
  [(id)qword_1002889B0 lock];
  v4 = [(id)qword_1002889B8 objectForKeyedSubscript:v3];

  if (v4)
  {
    v4 = [(id)qword_1002889B8 objectForKeyedSubscript:v3];
  }
  [(id)qword_1002889B0 unlock];

  return v4;
}

+ (void)cacheStore
{
  if (qword_1002889C0[0] != -1) {
    dispatch_once(qword_1002889C0, &stru_100234300);
  }
}

- (BOOL)isExpired
{
  [(id)qword_1002889B0 lock];
  id v3 = (void *)qword_1002889B8;
  v4 = [(APAttributionCacheElement *)self bundleID];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    v6 = +[NSDate date];
    [v6 timeIntervalSince1970];
    double v8 = v7;
    id v9 = (void *)qword_1002889B8;
    id v10 = [(APAttributionCacheElement *)self bundleID];
    id v11 = [v9 objectForKeyedSubscript:v10];
    [v11 timestamp];
    double v13 = v8 - v12;

    if (v13 <= 300.0)
    {
      BOOL v16 = 0;
      goto LABEL_6;
    }
    v14 = (void *)qword_1002889B8;
    v15 = [(APAttributionCacheElement *)self bundleID];
    [v14 removeObjectForKey:v15];
  }
  BOOL v16 = 1;
LABEL_6:
  [(id)qword_1002889B0 unlock];
  return v16;
}

- (BOOL)didAppTrackingStateChange:(BOOL)a3
{
  unsigned int v4 = [(APAttributionCacheElement *)self appAdTrackingStatus] ^ a3;
  if (v4 == 1)
  {
    [(id)qword_1002889B0 lock];
    v5 = (void *)qword_1002889B8;
    v6 = [(APAttributionCacheElement *)self bundleID];
    [v5 removeObjectForKey:v6];

    [(id)qword_1002889B0 unlock];
  }
  return v4;
}

- (BOOL)didToroIDChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APAttributionCacheElement *)self toroID];
  if (v5
    && (v6 = (void *)v5,
        [(APAttributionCacheElement *)self toroID],
        double v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isEqual:v4],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    BOOL v9 = 0;
  }
  else
  {
    +[APAttributionCacheElement clearCache];
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)checkExpiry
{
  id v3 = +[NSDate date];
  [v3 timeIntervalSince1970];
  double v5 = v4;
  v6 = (void *)qword_1002889B8;
  double v7 = [(APAttributionCacheElement *)self bundleID];
  unsigned __int8 v8 = [v6 objectForKeyedSubscript:v7];
  [v8 timestamp];
  BOOL v10 = v5 - v9 > 300.0;

  return v10;
}

- (BOOL)isValidCheckWithToroID:(id)a3 andTrackingStatus:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(APAttributionCacheElement *)self didToroIDChange:a3]
    || [(APAttributionCacheElement *)self didAppTrackingStateChange:v4])
  {
    return 0;
  }
  else
  {
    return ![(APAttributionCacheElement *)self isExpired];
  }
}

+ (void)cleanCache
{
  [(id)qword_1002889B0 lock];
  v2 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(id)qword_1002889B8 allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 136643075;
    long long v13 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        BOOL v10 = [(id)qword_1002889B8 objectForKeyedSubscript:v9, v13];
        unsigned int v11 = [v10 checkExpiry];

        if (v11)
        {
          double v12 = APLogForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v13;
            objc_super v19 = "+[APAttributionCacheElement cleanCache]";
            __int16 v20 = 2114;
            uint64_t v21 = v9;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{sensitive}s Removing expired token from bundleID %{public}@", buf, 0x16u);
          }

          [v2 addObject:v9];
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  [(id)qword_1002889B8 removeObjectsForKeys:v2];
  [(id)qword_1002889B0 unlock];
}

+ (void)clearCache
{
  [(id)qword_1002889B0 lock];
  [(id)qword_1002889B8 removeAllObjects];
  v2 = (void *)qword_1002889B0;

  [v2 unlock];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSUUID)toroID
{
  return self->_toroID;
}

- (void)setToroID:(id)a3
{
}

- (BOOL)appAdTrackingStatus
{
  return self->_appAdTrackingStatus;
}

- (void)setAppAdTrackingStatus:(BOOL)a3
{
  self->_appAdTrackingStatus = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end