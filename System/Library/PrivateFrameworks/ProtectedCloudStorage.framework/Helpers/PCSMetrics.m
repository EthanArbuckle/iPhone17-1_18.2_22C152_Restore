@interface PCSMetrics
+ (id)metrics;
- (BOOL)addKeyWithDSID:(id)a3 service:(unsigned int)a4 publicKey:(id)a5;
- (BOOL)markKeyNegativeWithDSID:(id)a3 service:(unsigned int)a4;
- (BOOL)setupDatabase;
- (NSUserDefaults)settings;
- (OS_os_log)log;
- (PCSMetrics)init;
- (id)databaseURL;
- (id)keyRegistryCallback;
- (id)markNegativeCallback;
- (int)updateCurrentWState:(_PCSIdentitySetData *)a3;
- (sqlite3)db;
- (sqlite3_stmt)addKeyStmt;
- (sqlite3_stmt)getKeyStmt;
- (sqlite3_stmt)markKeyStmt;
- (unsigned)getKeyInfoWithDSID:(id)a3 service:(unsigned int)a4 publicKey:(id)a5;
- (void)addIdentityInfoToHealthSummary:(id)a3 dsid:(id)a4 wState:(int)a5;
- (void)addMetricsToHealthSummary:(id)a3 withIdentitySet:(_PCSIdentitySetData *)a4;
- (void)dealloc;
- (void)setAddKeyStmt:(sqlite3_stmt *)a3;
- (void)setDb:(sqlite3 *)a3;
- (void)setGetKeyStmt:(sqlite3_stmt *)a3;
- (void)setLog:(id)a3;
- (void)setMarkKeyStmt:(sqlite3_stmt *)a3;
- (void)setSettings:(id)a3;
- (void)storeEventTimestamp:(unint64_t)a3;
@end

@implementation PCSMetrics

- (PCSMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)PCSMetrics;
  v2 = [(PCSMetrics *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.ProtectedCloudStorage", "PCSMetrics");
    [(PCSMetrics *)v2 setLog:v3];

    id v4 = objc_alloc_init((Class)NSUserDefaults);
    [(PCSMetrics *)v2 setSettings:v4];

    if (![(PCSMetrics *)v2 setupDatabase])
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  sqlite3_finalize([(PCSMetrics *)self addKeyStmt]);
  sqlite3_finalize([(PCSMetrics *)self markKeyStmt]);
  sqlite3_finalize([(PCSMetrics *)self getKeyStmt]);
  if (sqlite3_close([(PCSMetrics *)self db])) {
    sub_100025864();
  }
  v3.receiver = self;
  v3.super_class = (Class)PCSMetrics;
  [(PCSMetrics *)&v3 dealloc];
}

+ (id)metrics
{
  if (qword_100040E78 != -1) {
    dispatch_once(&qword_100040E78, &stru_100039410);
  }
  v2 = (void *)qword_100040E80;
  return v2;
}

- (void)addMetricsToHealthSummary:(id)a3 withIdentitySet:(_PCSIdentitySetData *)a4
{
  id v24 = a3;
  objc_super v6 = [(PCSMetrics *)self settings];
  v7 = [v6 fuzzyDaysSinceKey:kPCSSettingStingrayRoll];
  [v24 setObject:v7 forKeyedSubscript:@"rollSettingDays"];

  v8 = [(PCSMetrics *)self settings];
  v9 = [v8 fuzzyDaysSinceKey:@"timestampWEnable"];
  [v24 setObject:v9 forKeyedSubscript:@"wEnableThisDeviceDays"];

  v10 = [(PCSMetrics *)self settings];
  v11 = [v10 fuzzyDaysSinceKey:@"timestampWDisable"];
  [v24 setObject:v11 forKeyedSubscript:@"wDisableThisDeviceDays"];

  v12 = [(PCSMetrics *)self settings];
  v13 = [v12 fuzzyDaysSinceKey:@"timestampKeyrollSuccess"];
  [v24 setObject:v13 forKeyedSubscript:@"keyrollSucceededDays"];

  v14 = [(PCSMetrics *)self settings];
  v15 = [v14 fuzzyDaysSinceKey:@"timestampKeyrollAttempted"];
  [v24 setObject:v15 forKeyedSubscript:@"keyrollAttemptedDays"];

  v16 = [(PCSMetrics *)self settings];
  v17 = [v16 fuzzyDaysSinceKey:@"timestampObserveWEnable"];
  [v24 setObject:v17 forKeyedSubscript:@"wEnableObservedDays"];

  v18 = [(PCSMetrics *)self settings];
  v19 = [v18 fuzzyDaysSinceKey:@"timestampObserveWDisable"];
  [v24 setObject:v19 forKeyedSubscript:@"wDisableObservedDays"];

  uint64_t v20 = [(PCSMetrics *)self updateCurrentWState:a4];
  v21 = +[NSNumber numberWithInt:v20];
  [v24 setObject:v21 forKeyedSubscript:@"wState"];

  v22 = [(PCSMetrics *)self settings];
  v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v22 tristateForBoolKey:@"initialWState"]);
  [v24 setObject:v23 forKeyedSubscript:@"initialWState"];

  [(PCSMetrics *)self addIdentityInfoToHealthSummary:v24 dsid:_PCSIdentitySetGetDSID() wState:v20];
}

- (void)addIdentityInfoToHealthSummary:(id)a3 dsid:(id)a4 wState:(int)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  _PCSServiceItemsGetNoRollStingrayServiceTypes();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v7;
  id v13 = v6;
  PCSServiceItemsGetEachName();
  v8 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v23[3], _NSConcreteStackBlock, 3221225472, sub_100019500, &unk_100039460);
  [v13 setObject:v8 forKeyedSubscript:@"currentInStingray"];

  v9 = +[NSNumber numberWithUnsignedLong:v19[3]];
  [v13 setObject:v9 forKeyedSubscript:@"currentMarkedForRolling"];

  v10 = +[NSNumber numberWithUnsignedLong:v15[3]];
  [v13 setObject:v10 forKeyedSubscript:@"currentWasMarkedForRolling"];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

- (int)updateCurrentWState:(_PCSIdentitySetData *)a3
{
  if (a3)
  {
    uint64_t v4 = PCSIdentitySetIsWalrusWithForceFetch();
    v5 = [(PCSMetrics *)self settings];
    id v6 = [v5 objectForKey:@"initialWState"];

    if (!v6)
    {
      id v7 = [(PCSMetrics *)self settings];
      [v7 setBool:v4 forKey:@"initialWState"];
    }
    v8 = [(PCSMetrics *)self settings];
    unsigned int v9 = [v8 tristateForBoolKey:@"knownWState"];

    if (v9 == -1 || ((v4 ^ (v9 == 0)) & 1) == 0)
    {
      v10 = [(PCSMetrics *)self settings];
      [v10 setBool:v4 forKey:@"knownWState"];

      if (v4) {
        uint64_t v11 = 5;
      }
      else {
        uint64_t v11 = 6;
      }
      [(PCSMetrics *)self storeEventTimestamp:v11];
    }
  }
  else
  {
    LODWORD(v4) = -1;
  }
  return v4;
}

- (void)storeEventTimestamp:(unint64_t)a3
{
  id v6 = objc_alloc_init((Class)NSUserDefaults);
  if (a3 - 1 > 5) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_100039520 + a3 - 1);
  }
  v5 = +[NSDate now];
  [v6 setObject:v5 forKey:v4];
}

- (id)keyRegistryCallback
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019BEC;
  v4[3] = &unk_1000394D8;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (id)markNegativeCallback
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019E24;
  v4[3] = &unk_100039500;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (id)databaseURL
{
  objc_super v3 = +[NSFileManager defaultManager];
  id v9 = 0;
  uint64_t v4 = [v3 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v9];
  id v5 = v9;

  if (v4)
  {
    id v6 = [v4 URLByAppendingPathComponent:@"com.apple.ProtectedCloudStorage"];

    id v7 = [v6 URLByAppendingPathComponent:@"metrics.db"];
  }
  else
  {
    id v6 = [(PCSMetrics *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to locate Application Support directory: %@", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (BOOL)setupDatabase
{
  objc_super v3 = [(PCSMetrics *)self databaseURL];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = (const char *)[v5 fileSystemRepresentation];
    if (v6)
    {
      if (sqlite3_open_v2(v6, &self->_db, 6, 0))
      {
        id v7 = [(PCSMetrics *)self log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v16 = v5;
          __int16 v17 = 2080;
          uint64_t v18 = (void *)sqlite3_errmsg([(PCSMetrics *)self db]);
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "opening %@ failed: %s", buf, 0x16u);
        }
      }
      else
      {
        [(PCSMetrics *)self db];
        int factor = _sqlite3_maintain_load_factor();
        if (factor)
        {
          int v9 = factor;
          v10 = [(PCSMetrics *)self log];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v16 = v5;
            __int16 v17 = 1024;
            LODWORD(v18) = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_sqlite3_maintain_load_factor for %@ failed: %d", buf, 0x12u);
          }
        }
        errmsg = 0;
        if (sqlite3_exec([(PCSMetrics *)self db], "PRAGMA journal_mode = WAL;CREATE TABLE IF NOT EXISTS keys(    dsid TEXT NOT NULL,    service INTEGER NOT "
               "NULL,    pubkey TEXT NOT NULL,    marked INTEGER NOT NULL DEFAULT 0,    PRIMARY KEY (dsid, service, pubkey));",
               0,
               0,
               &errmsg))
        {
          id v11 = [(PCSMetrics *)self log];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v16 = v5;
            __int16 v17 = 2080;
            uint64_t v18 = errmsg;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "table create for %@ failed: %s", buf, 0x16u);
          }

          sqlite3_free(errmsg);
        }
        else if (!sqlite3_prepare_v2([(PCSMetrics *)self db], "INSERT OR IGNORE INTO keys (dsid, service, pubkey) VALUES (?, ?, ?);", {
                     -1,
        }
                     &self->_addKeyStmt,
                     0)
               && !sqlite3_prepare_v2([(PCSMetrics *)self db], "UPDATE keys SET marked=? WHERE dsid=? AND service=?;",
                     -1,
                     &self->_markKeyStmt,
                     0))
        {
          BOOL v12 = sqlite3_prepare_v2([(PCSMetrics *)self db], "SELECT marked FROM keys WHERE dsid=? AND service=? AND pubkey=?;",
                  -1,
                  &self->_getKeyStmt,
                  0) == 0;
          goto LABEL_18;
        }
      }
    }
  }
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (BOOL)addKeyWithDSID:(id)a3 service:(unsigned int)a4 publicKey:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(PCSMetrics *)self addKeyStmt];
  id v11 = v9;
  BOOL v12 = (const char *)[v11 UTF8String];

  BOOL v13 = !sqlite3_bind_text(v10, 1, v12, -1, 0)
     && !sqlite3_bind_int64([(PCSMetrics *)self addKeyStmt], 2, a4)
     && !sqlite3_bind_text(-[PCSMetrics addKeyStmt](self, "addKeyStmt"), 3, (const char *)[v8 UTF8String], -1, 0)&& sqlite3_step(-[PCSMetrics addKeyStmt](self, "addKeyStmt")) == 101;
  sqlite3_reset([(PCSMetrics *)self addKeyStmt]);

  return v13;
}

- (BOOL)markKeyNegativeWithDSID:(id)a3 service:(unsigned int)a4
{
  id v6 = a3;
  BOOL v7 = !sqlite3_bind_int([(PCSMetrics *)self markKeyStmt], 1, 1)
    && !sqlite3_bind_text(-[PCSMetrics markKeyStmt](self, "markKeyStmt"), 2, (const char *)[v6 UTF8String], -1, 0)&& !sqlite3_bind_int64(-[PCSMetrics markKeyStmt](self, "markKeyStmt"), 3, a4)&& sqlite3_step(-[PCSMetrics markKeyStmt](self, "markKeyStmt")) == 101;
  sqlite3_reset([(PCSMetrics *)self markKeyStmt]);

  return v7;
}

- (unsigned)getKeyInfoWithDSID:(id)a3 service:(unsigned int)a4 publicKey:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(PCSMetrics *)self getKeyStmt];
  id v11 = v9;
  BOOL v12 = (const char *)[v11 UTF8String];

  if (sqlite3_bind_text(v10, 1, v12, -1, 0)
    || sqlite3_bind_int64([(PCSMetrics *)self getKeyStmt], 2, a4)
    || sqlite3_bind_text(-[PCSMetrics getKeyStmt](self, "getKeyStmt"), 3, (const char *)[v8 UTF8String], -1, 0)|| sqlite3_step(-[PCSMetrics getKeyStmt](self, "getKeyStmt")) != 100)
  {
    unsigned int v13 = 0;
  }
  else if (sqlite3_column_int([(PCSMetrics *)self getKeyStmt], 0))
  {
    unsigned int v13 = 3;
  }
  else
  {
    unsigned int v13 = 1;
  }
  sqlite3_reset([(PCSMetrics *)self getKeyStmt]);

  return v13;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLog:(id)a3
{
}

- (NSUserDefaults)settings
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSettings:(id)a3
{
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (sqlite3_stmt)addKeyStmt
{
  return self->_addKeyStmt;
}

- (void)setAddKeyStmt:(sqlite3_stmt *)a3
{
  self->_addKeyStmt = a3;
}

- (sqlite3_stmt)markKeyStmt
{
  return self->_markKeyStmt;
}

- (void)setMarkKeyStmt:(sqlite3_stmt *)a3
{
  self->_markKeyStmt = a3;
}

- (sqlite3_stmt)getKeyStmt
{
  return self->_getKeyStmt;
}

- (void)setGetKeyStmt:(sqlite3_stmt *)a3
{
  self->_getKeyStmt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end