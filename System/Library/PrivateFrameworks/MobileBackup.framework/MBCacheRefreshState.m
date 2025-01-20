@interface MBCacheRefreshState
+ (BOOL)saveRefreshState:(id)a3 toCache:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)loadFromCache:(id)a3;
- (BOOL)hasRefreshedSnapshotID:(id)a3;
- (BOOL)isExpired;
- (MBCacheRefreshState)init;
- (MBCacheRefreshState)initWithCoder:(id)a3;
- (NSDate)expirationDate;
- (id)description;
- (id)queryCursorForSnapshotID:(id)a3;
- (void)addQueryCursor:(id)a3 forSnapshotID:(id)a4;
- (void)addRefreshedSnapshotID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)forgetSnapshotID:(id)a3;
@end

@implementation MBCacheRefreshState

- (MBCacheRefreshState)init
{
  v10.receiver = self;
  v10.super_class = (Class)MBCacheRefreshState;
  v2 = [(MBCacheRefreshState *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    queryCursorsBySnapshotIDs = v2->_queryCursorsBySnapshotIDs;
    v2->_queryCursorsBySnapshotIDs = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    refreshedSnapshotIDs = v2->_refreshedSnapshotIDs;
    v2->_refreshedSnapshotIDs = (NSMutableSet *)v5;

    uint64_t v7 = +[NSDate dateWithTimeIntervalSinceNow:172800.0];
    expiryDate = v2->_expiryDate;
    v2->_expiryDate = (NSDate *)v7;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBCacheRefreshState)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MBCacheRefreshState;
  uint64_t v5 = [(MBCacheRefreshState *)&v17 init];
  if (v5)
  {
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v6 = +[NSArray arrayWithObjects:v19 count:3];
    uint64_t v7 = +[NSSet setWithArray:v6];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"queryCursorsBySnapshotIDs"];
    queryCursorsBySnapshotIDs = v5->_queryCursorsBySnapshotIDs;
    v5->_queryCursorsBySnapshotIDs = (NSMutableDictionary *)v8;

    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_super v10 = +[NSArray arrayWithObjects:v18 count:2];
    v11 = +[NSSet setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"refreshedSnapshotIDs"];
    refreshedSnapshotIDs = v5->_refreshedSnapshotIDs;
    v5->_refreshedSnapshotIDs = (NSMutableSet *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  queryCursorsBySnapshotIDs = self->_queryCursorsBySnapshotIDs;
  id v5 = a3;
  [v5 encodeObject:queryCursorsBySnapshotIDs forKey:@"queryCursorsBySnapshotIDs"];
  [v5 encodeObject:self->_refreshedSnapshotIDs forKey:@"refreshedSnapshotIDs"];
  [v5 encodeObject:self->_expiryDate forKey:@"expiryDate"];
}

- (BOOL)isExpired
{
  uint64_t v3 = +[NSDate now];
  [v3 timeIntervalSinceDate:self->_expiryDate];
  LOBYTE(self) = v4 > 0.0;

  return (char)self;
}

- (void)forgetSnapshotID:(id)a3
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("-[MBCacheRefreshState forgetSnapshotID:]", "MBCacheRefreshState.m", 59, "snapshotID");
  }
  double v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_queryCursorsBySnapshotIDs removeObjectForKey:v5];
  [(NSMutableSet *)v4->_refreshedSnapshotIDs removeObject:v5];
  objc_sync_exit(v4);
}

- (void)addRefreshedSnapshotID:(id)a3
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("-[MBCacheRefreshState addRefreshedSnapshotID:]", "MBCacheRefreshState.m", 67, "snapshotID");
  }
  double v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_queryCursorsBySnapshotIDs removeObjectForKey:v5];
  [(NSMutableSet *)v4->_refreshedSnapshotIDs addObject:v5];
  objc_sync_exit(v4);
}

- (BOOL)hasRefreshedSnapshotID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCacheRefreshState hasRefreshedSnapshotID:]", "MBCacheRefreshState.m", 75, "snapshotID");
  }
  id v5 = v4;
  v6 = self;
  objc_sync_enter(v6);
  unsigned __int8 v7 = [(NSMutableSet *)v6->_refreshedSnapshotIDs containsObject:v5];
  objc_sync_exit(v6);

  return v7;
}

- (void)addQueryCursor:(id)a3 forSnapshotID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!v8) {
    __assert_rtn("-[MBCacheRefreshState addQueryCursor:forSnapshotID:]", "MBCacheRefreshState.m", 82, "queryCursor");
  }
  if (!v6) {
    __assert_rtn("-[MBCacheRefreshState addQueryCursor:forSnapshotID:]", "MBCacheRefreshState.m", 83, "snapshotID");
  }
  unsigned __int8 v7 = self;
  objc_sync_enter(v7);
  [(NSMutableSet *)v7->_refreshedSnapshotIDs removeObject:v6];
  [(NSMutableDictionary *)v7->_queryCursorsBySnapshotIDs setObject:v8 forKeyedSubscript:v6];
  objc_sync_exit(v7);
}

- (id)queryCursorForSnapshotID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCacheRefreshState queryCursorForSnapshotID:]", "MBCacheRefreshState.m", 91, "snapshotID");
  }
  id v5 = v4;
  id v6 = self;
  objc_sync_enter(v6);
  unsigned __int8 v7 = [(NSMutableDictionary *)v6->_queryCursorsBySnapshotIDs objectForKeyedSubscript:v5];
  objc_sync_exit(v6);

  return v7;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; expiryDate=%@, refreshedSnapshotIDs=%@, queryCursors=%@",
    objc_opt_class(),
    v2,
    v2->_expiryDate,
    v2->_refreshedSnapshotIDs,
  uint64_t v3 = v2->_queryCursorsBySnapshotIDs);
  objc_sync_exit(v2);

  return v3;
}

+ (id)loadFromCache:(id)a3
{
  id v17 = 0;
  uint64_t v3 = [a3 propertyForKey:@"CacheRefreshState" error:&v17];
  id v4 = v17;
  if (!v4)
  {
    if (!v3)
    {
      unsigned __int8 v7 = objc_opt_new();
      goto LABEL_19;
    }
    id v8 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];
    id v16 = 0;
    v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v16];
    id v10 = v16;
    if (v9)
    {
      unsigned int v11 = [v9 isExpired];
      uint64_t v12 = MBGetDefaultLog();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (!v11)
      {
        if (v13)
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loaded cache refresh state: %@", buf, 0xCu);
          _MBLog();
        }

        id v14 = v9;
        goto LABEL_18;
      }
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not using expired cache refresh state: %@", buf, 0xCu);
LABEL_13:
        _MBLog();
      }
    }
    else
    {
      uint64_t v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Not using invalid cache refresh state: %@", buf, 0xCu);
        goto LABEL_13;
      }
    }

    id v14 = (id)objc_opt_new();
LABEL_18:
    unsigned __int8 v7 = v14;

    goto LABEL_19;
  }
  id v5 = v4;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to load cache refresh state from cache: %@", buf, 0xCu);
    _MBLog();
  }

  unsigned __int8 v7 = objc_opt_new();
LABEL_19:

  return v7;
}

+ (BOOL)saveRefreshState:(id)a3 toCache:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Saving cache refresh state: %@", buf, 0xCu);
    _MBLog();
  }

  if (v7)
  {
    id v18 = 0;
    id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v18];
    id v11 = v18;
    if (v10)
    {
      uint64_t v12 = [v10 base64EncodedStringWithOptions:0];
      id v13 = [v8 setProperty:v12 forKey:@"CacheRefreshState"];

      BOOL v14 = v13 == 0;
      if (a5 && v13) {
        *a5 = v13;
      }
    }
    else
    {
      id v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v7;
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to serialize %@: %@", buf, 0x16u);
        _MBLog();
      }

      if (a5)
      {
        id v13 = v11;
        BOOL v14 = 0;
        *a5 = v13;
      }
      else
      {
        BOOL v14 = 0;
        id v13 = v11;
      }
    }
  }
  else
  {
    v15 = [v8 setProperty:0 forKey:@"CacheRefreshState"];
    id v13 = v15;
    if (a5) {
      *a5 = v15;
    }
    BOOL v14 = v13 == 0;
  }

  return v14;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_refreshedSnapshotIDs, 0);
  objc_storeStrong((id *)&self->_queryCursorsBySnapshotIDs, 0);
}

@end