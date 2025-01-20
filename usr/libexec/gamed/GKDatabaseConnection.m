@interface GKDatabaseConnection
+ (GKDatabaseConnection)connectionWithDatabasePath:(id)a3;
- (GKDatabaseConnection)initWithDatabasePath:(id)a3;
- (NSString)path;
- (OS_dispatch_queue)databaseQueue;
- (int)getStatement:(sqlite3_stmt *)a3 forSQL:(id)a4;
- (sqlite3)database;
- (void)checkAndOpenDatabase;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)performAsync:(id)a3;
- (void)performAsyncTransaction:(id)a3 handler:(id)a4;
- (void)performSync:(id)a3;
- (void)setDatabase:(sqlite3 *)a3;
- (void)setDatabaseQueue:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation GKDatabaseConnection

+ (GKDatabaseConnection)connectionWithDatabasePath:(id)a3
{
  id v3 = a3;
  v4 = [[GKDatabaseConnection alloc] initWithDatabasePath:v3];

  return v4;
}

- (GKDatabaseConnection)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKDatabaseConnection;
  v5 = [(GKDatabaseConnection *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.gamecenter.GKDatabaseConnection", 0);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v6;

    v5->_stmtCache = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    [(GKDatabaseConnection *)v5 setPath:v4];
    [(GKDatabaseConnection *)v5 open];
    if (!v5->_database)
    {
      v8 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v9 = (id)GKOSLoggers();
        v8 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1000D9DE4();
      }

      v5 = 0;
    }
  }

  return v5;
}

- (void)checkAndOpenDatabase
{
  if (!self->_database)
  {
    [(GKDatabaseConnection *)self open];
    if (!self->_database)
    {
      id v3 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v4 = (id)GKOSLoggers();
        id v3 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        sub_1000D9DE4();
      }
    }
  }
}

- (void)dealloc
{
  if (self->_database) {
    [(GKDatabaseConnection *)self close];
  }
  stmtCache = self->_stmtCache;
  if (stmtCache) {
    CFRelease(stmtCache);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKDatabaseConnection;
  [(GKDatabaseConnection *)&v4 dealloc];
}

- (int)getStatement:(sqlite3_stmt *)a3 forSQL:(id)a4
{
  id v6 = a4;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_stmtCache, v6);
  ppStmt = Value;
  if (Value)
  {
LABEL_2:
    uint64_t v8 = sqlite3_reset(Value);
    if (v8)
    {
      id v9 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v10 = (id)GKOSLoggers();
        id v9 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000D9E18((uint64_t)v6, v9, v8);
      }
      ppStmt = 0;
    }
    goto LABEL_13;
  }
  database = self->_database;
  id v12 = v6;
  uint64_t v13 = sqlite3_prepare_v2(database, (const char *)[v12 UTF8String], (int)[v12 lengthOfBytesUsingEncoding:4], &ppStmt, 0);
  if (!v13)
  {
    CFDictionarySetValue(self->_stmtCache, v12, ppStmt);
    Value = ppStmt;
    goto LABEL_2;
  }
  uint64_t v8 = v13;
  v14 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v15 = (id)GKOSLoggers();
    v14 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1000D9ECC((uint64_t)v12, v14, v8);
  }
LABEL_13:
  *a3 = ppStmt;

  return v8;
}

- (void)open
{
  p_database = &self->_database;
  uint64_t v4 = sqlite3_open_v2([(NSString *)self->_path cStringUsingEncoding:4], &self->_database, 6, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    if (v4 != 23 && v4 != 14)
    {
      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers();
      }
      v16 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "GKDatabaseConnection can't open database due to rc=%d, throwing exception", buf, 8u);
      }
      sqlite3_close(*p_database);
      v17 = +[NSString stringWithFormat:@"failed to open database (%d)", v5];
      id v18 = +[NSException exceptionWithName:@"GKDatabaseInaccessibleException" reason:v17 userInfo:0];

      objc_exception_throw(v18);
    }
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    uint64_t v8 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKDatabaseConnection can't open database due to rc=%d", buf, 8u);
    }
    sqlite3_close(*p_database);
    *p_database = 0;
  }
  else if (![(NSString *)self->_path isEqualToString:@":memory:"])
  {
    *(void *)buf = 0;
    v40 = buf;
    uint64_t v41 = 0x2020000000;
    int v42 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    int v34 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    int v30 = 0;
    uint64_t v27 = 0;
    v28[0] = &v27;
    v28[1] = 0x2020000000;
    v28[2] = 0;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000D915C;
    v25[3] = &unk_1002D9818;
    v25[4] = self;
    v25[5] = buf;
    v25[6] = &v31;
    v25[7] = &v27;
    v25[8] = v29;
    int v26 = 0;
    [(GKDatabaseConnection *)self performSync:v25];
    int v9 = *((_DWORD *)v32 + 6);
    if (v9 == 5)
    {
      if (!os_log_GKGeneral) {
        id v10 = (id)GKOSLoggers();
      }
      objc_super v11 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        int v12 = *((_DWORD *)v32 + 6);
        *(_DWORD *)v35 = 67109120;
        int v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKDatabaseConnection couldn't exec on the database due to rc2=%d - closing and returning", v35, 8u);
      }
      if (!os_log_GKGeneral) {
        id v13 = (id)GKOSLoggers();
      }
      v14 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000D9F80((uint64_t)v28, v14);
      }
      sqlite3_close(*p_database);
      *p_database = 0;
    }
    else if (*((_DWORD *)v40 + 6) | v9)
    {
      if (!os_log_GKGeneral) {
        id v19 = (id)GKOSLoggers();
      }
      v20 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        int v21 = *((_DWORD *)v40 + 6);
        int v22 = *((_DWORD *)v32 + 6);
        *(_DWORD *)v35 = 67109376;
        int v36 = v21;
        __int16 v37 = 1024;
        int v38 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "GKDatabaseConnection couldn't exec on the database due to rc1=%d or rc2=%d - closing and throwing an exception", v35, 0xEu);
      }
      sqlite3_close(*p_database);
      v23 = +[NSString stringWithFormat:@"failed to set pragmas for database connection.(%d %d)", *((unsigned int *)v40 + 6), *((unsigned int *)v32 + 6)];
      id v24 = +[NSException exceptionWithName:@"GKDatabaseInaccessibleException" reason:v23 userInfo:0];

      objc_exception_throw(v24);
    }
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)close
{
  if (GKAtomicCompareAndSwap32Barrier())
  {
    databaseQueue = self->_databaseQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D9540;
    block[3] = &unk_1002D40E0;
    block[4] = self;
    dispatch_sync(databaseQueue, block);
  }
}

- (void)performSync:(id)a3
{
  id v4 = a3;
  if (!self->_database)
  {
    uint64_t v5 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v6 = (id)GKOSLoggers();
      uint64_t v5 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000DA0C8();
    }
    [(GKDatabaseConnection *)self open];
    if (!self->_database)
    {
      id v9 = +[NSException exceptionWithName:@"GKDatabaseInaccessibleException" reason:@"cannot perform operation on unopened database. Tried to re-open and failed. Restarting gamed" userInfo:0];
      objc_exception_throw(v9);
    }
  }
  databaseQueue = self->_databaseQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D9798;
  v10[3] = &unk_1002D3930;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  dispatch_sync(databaseQueue, v10);
}

- (void)performAsync:(id)a3
{
  id v4 = a3;
  if (!self->_database)
  {
    uint64_t v5 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v6 = (id)GKOSLoggers();
      uint64_t v5 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000DA0FC();
    }
    [(GKDatabaseConnection *)self open];
    if (!self->_database)
    {
      id v9 = +[NSException exceptionWithName:@"GKDatabaseInaccessibleException" reason:@"cannot perform operation on unopened database. Tried to re-open and failed. Restarting gamed" userInfo:0];
      objc_exception_throw(v9);
    }
  }
  databaseQueue = self->_databaseQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D98D4;
  v10[3] = &unk_1002D3930;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  dispatch_async(databaseQueue, v10);
}

- (void)performAsyncTransaction:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_database) {
    goto LABEL_7;
  }
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = (id)GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000DA130();
  }
  [(GKDatabaseConnection *)self open];
  if (self->_database)
  {
LABEL_7:
    databaseQueue = self->_databaseQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D9A48;
    block[3] = &unk_1002D9840;
    block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(databaseQueue, block);
  }
  else
  {
    id v11 = +[NSError userErrorForServerCode:1 reason:@"Database not available at this time"];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
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

- (OS_dispatch_queue)databaseQueue
{
  return self->_databaseQueue;
}

- (void)setDatabaseQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end