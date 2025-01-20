@interface NEKSeenMap
- (BOOL)_createDb;
- (BOOL)_executeSql:(id)a3;
- (BOOL)_prepareStatements;
- (BOOL)shouldShowInvite:(id)a3 withUUID:(id)a4;
- (NEKSeenMap)initWithDatabaseManager:(id)a3;
- (NSString)dbFilename;
- (void)dealloc;
- (void)deleteInviteByUUID:(id)a3;
- (void)didShowInvite:(id)a3 withUUID:(id)a4;
- (void)setDbFilename:(id)a3;
- (void)sweep;
@end

@implementation NEKSeenMap

- (NEKSeenMap)initWithDatabaseManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEKSeenMap;
  v5 = [(NEKSeenMap *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 syncStateDBPathFor:@"SeenMap.db"];
    dbFilename = v5->_dbFilename;
    v5->_dbFilename = (NSString *)v6;

    uint64_t v8 = sub_100006A20("com.apple.eventkitsync.seenmap");
    dbQueue = v5->_dbQueue;
    v5->_dbQueue = (OS_dispatch_queue *)v8;

    if (![(NEKSeenMap *)v5 _createDb] || ![(NEKSeenMap *)v5 _prepareStatements])
    {

      v5 = 0;
    }
  }

  return v5;
}

- (void)dealloc
{
  objc_initWeak(&location, self);
  dbQueue = self->_dbQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C268;
  block[3] = &unk_1000A8B48;
  objc_copyWeak(&v6, &location);
  dispatch_sync(dbQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  v4.receiver = self;
  v4.super_class = (Class)NEKSeenMap;
  [(NEKSeenMap *)&v4 dealloc];
}

- (BOOL)_executeSql:(id)a3
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_dbConn, (const char *)[a3 UTF8String], -1, &ppStmt, 0))
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = ppStmt == 0;
  }
  BOOL v4 = !v3;
  if (!v3)
  {
    sqlite3_step(ppStmt);
    sqlite3_finalize(ppStmt);
  }
  return v4;
}

- (BOOL)_createDb
{
  id v3 = [(NEKSeenMap *)self dbFilename];
  BOOL v4 = (const char *)[v3 UTF8String];

  int v5 = sqlite3_open_v2(v4, &self->_dbConn, 6, 0);
  if (v5)
  {
    int v6 = v5;
    v7 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006ED04((uint64_t)v4, v6, v7);
    }
    return 0;
  }
  else
  {
    [(NEKSeenMap *)self _executeSql:@"pragma journal_mode=wal"];
    [(NEKSeenMap *)self _executeSql:@"drop table if exists seen"];
    return [(NEKSeenMap *)self _executeSql:@"create table if not exists seendata (uuid TEXT, start_date REAL, end_date REAL, location TEXT, primary key (uuid))"];
  }
}

- (BOOL)_prepareStatements
{
  dbConn = self->_dbConn;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C54C;
  v7[3] = &unk_1000A98B0;
  v7[4] = dbConn;
  BOOL v4 = objc_retainBlock(v7);
  if (((unsigned int (*)(void *, sqlite3_stmt **, const char *))v4[2])(v4, &self->_update, "insert or replace into seendata values(?, ?, ?, ?);")
    && ((unsigned int (*)(void *, sqlite3_stmt **, const char *))v4[2])(v4, &self->_fetch, "select start_date, end_date, location from seendata where uuid = ?;")
    && ((unsigned int (*)(void *, sqlite3_stmt **, const char *))v4[2])(v4, &self->_delete, "delete from seendata where uuid = ?;"))
  {
    char v5 = ((uint64_t (*)(void *, sqlite3_stmt **, const char *))v4[2])(v4, &self->_sweep, "delete from seendata where end_date < ?;");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowInvite:(id)a3 withUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  v34 = (double *)&v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_10003C818;
  v31 = sub_10003C828;
  id v32 = 0;
  fetch = self->_fetch;
  dbQueue = self->_dbQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C830;
  block[3] = &unk_1000A98D8;
  id v10 = v7;
  v25 = &v27;
  v26 = fetch;
  id v22 = v10;
  v23 = &v37;
  v24 = &v33;
  dispatch_sync(dbQueue, block);
  objc_super v11 = [v6 startDate];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  v14 = [v6 endDate];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  v17 = [v6 location];
  BOOL v18 = v13 != v38[3] || v16 != v34[3];
  id v19 = (id)v28[5];
  if (v17)
  {
    if (!v19)
    {
      BOOL v18 = 1;
      goto LABEL_10;
    }
    id v19 = [v19 localizedStandardCompare:v17];
  }
  if (v19) {
    BOOL v18 = 1;
  }
LABEL_10:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v18;
}

- (void)didShowInvite:(id)a3 withUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)os_transaction_create();
  id v9 = v7;
  id v10 = [v9 UTF8String];

  objc_super v11 = [v6 location];
  double v12 = v11;
  if (v11) {
    double v13 = strdup((const char *)[v11 UTF8String]);
  }
  else {
    double v13 = 0;
  }
  v14 = [v6 startDate];
  [v14 timeIntervalSinceReferenceDate];
  uint64_t v16 = v15;

  v17 = [v6 endDate];
  [v17 timeIntervalSinceReferenceDate];
  uint64_t v19 = v18;

  update = self->_update;
  dbQueue = self->_dbQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10003CA78;
  v23[3] = &unk_1000A9900;
  v25 = update;
  id v26 = v10;
  uint64_t v27 = v16;
  uint64_t v28 = v19;
  uint64_t v29 = v13;
  id v24 = v8;
  id v22 = v8;
  dispatch_async(dbQueue, v23);
}

- (void)deleteInviteByUUID:(id)a3
{
  id v4 = a3;
  char v5 = (void *)os_transaction_create();
  id v6 = v4;
  id v7 = [v6 UTF8String];

  delete = self->_delete;
  dbQueue = self->_dbQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CBF8;
  block[3] = &unk_1000A9928;
  double v13 = delete;
  id v14 = v7;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(dbQueue, block);
}

- (void)sweep
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v4 = (void *)os_transaction_create();
  sweep = self->_sweep;
  dbQueue = self->_dbQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CD0C;
  block[3] = &unk_1000A9928;
  CFAbsoluteTime v11 = Current;
  id v9 = v4;
  id v10 = sweep;
  id v7 = v4;
  dispatch_async(dbQueue, block);
}

- (NSString)dbFilename
{
  return self->_dbFilename;
}

- (void)setDbFilename:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbFilename, 0);

  objc_storeStrong((id *)&self->_dbQueue, 0);
}

@end