@interface TCCDDatabaseRegistry
+ (char)getRegistryDir;
+ (id)stringFromBacktrace;
- (BOOL)checkIfAlreadySetUp:(BOOL)a3;
- (BOOL)checkIfKnownDBAtPath:(const char *)a3 isKnown:(BOOL *)a4;
- (BOOL)checkRegistryVersion:(BOOL)a3;
- (BOOL)registryDBUnavailable;
- (OS_dispatch_queue)registryQueue;
- (TCCDDatabaseRegistry)init;
- (id)dumpState;
- (id)fetchAllKnownDBEntries;
- (id)registryEntryFromStep:(sqlite3_stmt *)a3;
- (int)commitDB;
- (int)createDBWithSQL:(const char *)a3 atPath:(const char *)a4 withFilename:(const char *)a5;
- (int)evalDB:(const char *)a3 locked:(BOOL)a4 bind:(id)a5 step:(id)a6;
- (int)executeWithTransaction:(id)a3;
- (int)extendedErrorCode;
- (int)getVersion;
- (int)registerNewDBAtPath:(const char *)a3;
- (int)setupDB;
- (int)version;
- (sqlite3)registryDBHandle;
- (void)closeDB;
- (void)handleDBErrorAndForceCrash:(BOOL)a3;
- (void)notifyRegistryChanged;
- (void)setRegistryDBHandle:(sqlite3 *)a3;
@end

@implementation TCCDDatabaseRegistry

- (TCCDDatabaseRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)TCCDDatabaseRegistry;
  v2 = [(TCCDDatabaseRegistry *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.tcc.registry_queue", 0);
    registryQueue = v2->_registryQueue;
    v2->_registryQueue = (OS_dispatch_queue *)v3;

    if (!v3) {
      sub_100058EA4();
    }
    v2->_registryDBHandle = 0;
    v2->_extendedErrorCode = 0;
    *(_WORD *)&v2->_isSetup = 0;
  }
  return v2;
}

- (int)getVersion
{
  return self->_version;
}

+ (char)getRegistryDir
{
  v2 = +[TCCDPlatform currentPlatform];
  dispatch_queue_t v3 = [v2 server];
  v4 = [v3 stateDirectory];

  if (!v4) {
    sub_100058EC0();
  }
  id v5 = v4;
  objc_super v6 = strdup((const char *)[v5 UTF8String]);
  if (!v6) {
    sub_100058EDC();
  }
  v7 = v6;

  return v7;
}

+ (id)stringFromBacktrace
{
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)v8 = 0u;
  long long v9 = 0u;
  int v2 = backtrace(v8, 1024);
  dispatch_queue_t v3 = backtrace_symbols(v8, v2);
  id v4 = objc_alloc_init((Class)NSMutableString);
  if (v3)
  {
    if (v2 >= 1)
    {
      for (unint64_t i = 0; i != v2; objc_msgSend(v4, "appendFormat:", v6, v3[i++]))
      {
        if (!v3[i]) {
          break;
        }
        objc_super v6 = i >= (v2 - 1) ? @"%s" : @"%s\n";
      }
    }
    free(v3);
  }
  return v4;
}

- (void)handleDBErrorAndForceCrash:(BOOL)a3
{
  BOOL v3 = a3;
  long long v13 = 0;
  id v5 = +[TCCDDatabaseRegistry stringFromBacktrace];
  objc_super v6 = sqlite3_errmsg([(TCCDDatabaseRegistry *)self registryDBHandle]);
  if (asprintf(&v13, "database error: %s", v6) != -1)
  {
    v7 = +[TCCDPlatform currentPlatform];
    v8 = [v7 server];
    long long v9 = [v8 logHandle];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v12 = "";
      *(_DWORD *)buf = 136446722;
      if (v3) {
        long long v12 = " aborting...";
      }
      long long v15 = v13;
      __int16 v16 = 2080;
      long long v17 = v12;
      __int16 v18 = 2112;
      long long v19 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s%s\n%@", buf, 0x20u);
    }
  }
  int v10 = sqlite3_errcode([(TCCDDatabaseRegistry *)self registryDBHandle]);
  sqlite3_close([(TCCDDatabaseRegistry *)self registryDBHandle]);
  [(TCCDDatabaseRegistry *)self setRegistryDBHandle:0];
  if (v10 == 26 || v10 == 11)
  {
    long long v11 = +[TCCDDatabaseRegistry getRegistryDir];
    removefile(v11, 0, 3u);
    free(v11);
  }
  if (v3) {
    sub_100058EF8();
  }
}

- (int)evalDB:(const char *)a3 locked:(BOOL)a4 bind:(id)a5 step:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100016B68;
  v19[3] = &unk_100095168;
  v19[4] = self;
  long long v22 = &v24;
  long long v23 = a3;
  id v12 = v10;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  long long v14 = objc_retainBlock(v19);
  long long v15 = v14;
  if (v7)
  {
    ((void (*)(void *))v14[2])(v14);
  }
  else
  {
    __int16 v16 = [(TCCDDatabaseRegistry *)self registryQueue];
    dispatch_sync(v16, v15);
  }
  int v17 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v24, 8);
  return v17;
}

- (int)createDBWithSQL:(const char *)a3 atPath:(const char *)a4 withFilename:(const char *)a5
{
  filename = 0;
  long long v9 = mkpath_np(a4, 0x1C0u);
  id v10 = v9;
  if (v9 && v9 != 17)
  {
    long long v15 = +[TCCDPlatform currentPlatform];
    __int16 v16 = [v15 server];
    int v17 = [v16 logHandle];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100059068((uint64_t)a4, (uint64_t)v10, v17);
    }
  }
  else
  {
    if (asprintf(&filename, "%s/%s", a4, a5) == -1) {
      sub_1000590E0();
    }
    ppDb = [(TCCDDatabaseRegistry *)self registryDBHandle];
    if (sqlite3_open_v2(filename, &ppDb, 4227078, 0))
    {
      id v11 = +[TCCDPlatform currentPlatform];
      id v12 = [v11 server];
      id v13 = [v12 logHandle];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000590FC(self, v13);
      }

      self->_registryDBHandle = ppDb;
      if ([(TCCDDatabaseRegistry *)self registryDBHandle])
      {
        long long v14 = self;
        LODWORD(v10) = sqlite3_errcode((sqlite3 *)[v14 registryDBHandle]);
      }
      else
      {
        LODWORD(v10) = 12;
      }
    }
    else if (sqlite3_exec(ppDb, "PRAGMA foreign_keys=ON;", 0, 0, 0) {
           || sqlite3_exec(ppDb, "BEGIN", 0, 0, 0)
    }
           || sqlite3_exec(ppDb, a3, 0, 0, 0))
    {
      [(TCCDDatabaseRegistry *)self handleDBErrorAndForceCrash:0];
    }
    else
    {
      id v20 = +[TCCDPlatform currentPlatform];
      id v21 = [v20 server];
      id v10 = [v21 logHandle];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        long long v25 = filename;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "using database: %{public}s", buf, 0xCu);
      }

      LODWORD(v10) = 0;
    }
    __int16 v18 = filename;
    self->_registryDBHandle = ppDb;
    if (v18) {
      free(v18);
    }
  }
  return (int)v10;
}

- (id)registryEntryFromStep:(sqlite3_stmt *)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = +[NSString stringWithUTF8String:sqlite3_column_text(a3, 0)];
  [v4 setObject:v5 forKeyedSubscript:@"kTCCDDatabaseRegistryPathKey"];

  objc_super v6 = +[NSNumber numberWithDouble:sqlite3_column_double(a3, 1)];
  [v4 setObject:v6 forKeyedSubscript:@"kTCCDDatabaseRegistryFirstSeenKey"];

  BOOL v7 = +[NSNumber numberWithDouble:sqlite3_column_double(a3, 2)];
  [v4 setObject:v7 forKeyedSubscript:@"kTCCDDatabaseRegistryLastSeenKey"];

  v8 = +[NSNumber numberWithInt:sqlite3_column_int(a3, 3)];
  [v4 setObject:v8 forKeyedSubscript:@"kTCCDDatabaseRegistryTrustedKey"];

  return v4;
}

- (int)registerNewDBAtPath:(const char *)a3
{
  id v5 = +[NSDate now];
  [v5 timeIntervalSince1970];
  uint64_t v7 = v6;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000171D8;
  v9[3] = &unk_100095190;
  v9[6] = v7;
  v9[4] = self;
  v9[5] = a3;
  return [(TCCDDatabaseRegistry *)self evalDB:"INSERT OR REPLACE INTO registry (abs_path, first_seen, last_seen, trusted)VALUES (?,?,?,?)" locked:0 bind:v9 step:0];
}

- (id)dumpState
{
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = sub_10000F8B4;
  long long v19 = sub_10000F86C;
  id v20 = &stru_100096EC0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001740C;
  v14[3] = &unk_1000951B8;
  v14[4] = &v15;
  uint64_t v2 = [(TCCDDatabaseRegistry *)self evalDB:"SELECT * FROM registry" locked:0 bind:0 step:v14];
  if (v2)
  {
    BOOL v3 = +[TCCDPlatform currentPlatform];
    id v4 = [v3 server];
    id v5 = [v4 logHandle];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000591A8(v2, v5, v6, v7, v8, v9, v10, v11);
    }

    id v12 = &stru_100096EC0;
  }
  else
  {
    id v12 = (__CFString *)(id)v16[5];
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (BOOL)checkIfKnownDBAtPath:(const char *)a3 isKnown:(BOOL *)a4
{
  *a4 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100017680;
  v12[3] = &unk_1000951E0;
  v12[4] = self;
  v12[5] = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000176E4;
  v11[3] = &unk_100095200;
  v11[4] = a4;
  v11[5] = a3;
  uint64_t v6 = -[TCCDDatabaseRegistry evalDB:locked:bind:step:](self, "evalDB:locked:bind:step:", [@"SELECT * FROM registry WHERE abs_path = ?" UTF8String], 0, v12, v11);
  if (v6)
  {
    uint64_t v7 = +[TCCDPlatform currentPlatform];
    uint64_t v8 = [v7 server];
    uint64_t v9 = [v8 logHandle];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100059214((uint64_t)a3, v6, v9);
    }

    *a4 = 0;
  }
  return v6 == 0;
}

- (id)fetchAllKnownDBEntries
{
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  long long v19 = sub_10001794C;
  id v20 = &unk_100095228;
  id v21 = self;
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v22 = v2;
  uint64_t v3 = [(TCCDDatabaseRegistry *)v21 evalDB:"SELECT * FROM registry" locked:0 bind:0 step:&v17];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = +[TCCDPlatform currentPlatform];
    uint64_t v6 = [v5 server];
    uint64_t v7 = [v6 logHandle];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10005928C(v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  long long v14 = v22;
  id v15 = v2;

  return v15;
}

- (int)setupDB
{
  if ([(TCCDDatabaseRegistry *)self registryDBUnavailable]) {
    return 1;
  }
  uint64_t v4 = +[TCCDDatabaseRegistry getRegistryDir];
  if (-[TCCDDatabaseRegistry createDBWithSQL:atPath:withFilename:](self, "createDBWithSQL:atPath:withFilename:", "CREATE TABLE IF NOT EXISTS admin (key TEXT PRIMARY KEY NOT NULL, value INTEGER NOT NULL);INSERT OR IGNORE INTO "
         "admin VALUES ('version', 0);INSERT OR IGNORE INTO admin VALUES ('setup', 0);CREATE TABLE IF NOT EXISTS registry"
         "(   abs_path    TEXT    NOT NULL,     first_seen  REAL    NOT NULL,     last_seen   REAL    NOT NULL,     tru"
         "sted     INTEGER NOT NULL,      PRIMARY KEY (abs_path));",
         v4,
         "REG.db")
    || (v17[0] = _NSConcreteStackBlock,
        v17[1] = 3221225472,
        v17[2] = sub_100017D00,
        v17[3] = &unk_1000950A8,
        v17[4] = self,
        [(TCCDDatabaseRegistry *)self evalDB:"SELECT value FROM admin WHERE key = 'version'" locked:1 bind:0 step:v17]))
  {
LABEL_5:
    free(v4);
    return 0;
  }
  if (![(TCCDDatabaseRegistry *)self version])
  {
    if (!sqlite3_exec([(TCCDDatabaseRegistry *)self registryDBHandle], "COMMIT", 0, 0, 0))
    {
      uint64_t v13 = +[TCCDPlatform currentPlatform];
      long long v14 = [v13 server];
      id v15 = [v14 logHandle];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = [(TCCDDatabaseRegistry *)self version];
        *(_DWORD *)buf = 67109120;
        unsigned int v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "using registry version: %d", buf, 8u);
      }

      goto LABEL_5;
    }
    [(TCCDDatabaseRegistry *)self handleDBErrorAndForceCrash:0];
    free(v4);
    int v3 = 1;
LABEL_18:
    self->_registryDBUnavailable = 1;
    self->_extendedErrorCode = sqlite3_extended_errcode([(TCCDDatabaseRegistry *)self registryDBHandle]);
    sqlite3_close([(TCCDDatabaseRegistry *)self registryDBHandle]);
    self->_registryDBHandle = 0;
    return v3;
  }
  uint64_t v6 = +[TCCDPlatform currentPlatform];
  uint64_t v7 = [v6 server];
  uint64_t v8 = [v7 logHandle];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(TCCDDatabaseRegistry *)self version];
    *(_DWORD *)buf = 67109376;
    unsigned int v19 = v9;
    __int16 v20 = 1024;
    int v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Downgrading registry from version %d to %d", buf, 0xEu);
  }

  sqlite3_close([(TCCDDatabaseRegistry *)self registryDBHandle]);
  [(TCCDDatabaseRegistry *)self setRegistryDBHandle:0];
  if (removefile(v4, 0, 3u))
  {
    uint64_t v10 = +[TCCDPlatform currentPlatform];
    uint64_t v11 = [v10 server];
    uint64_t v12 = [v11 logHandle];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000592F8();
    }

    int v3 = 1;
  }
  else
  {
    int v3 = [(TCCDDatabaseRegistry *)self setupDB];
  }
  [(TCCDDatabaseRegistry *)self notifyRegistryChanged];
  free(v4);
  if (v3) {
    goto LABEL_18;
  }
  return v3;
}

- (int)executeWithTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  id v5 = [(TCCDDatabaseRegistry *)self registryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017E34;
  block[3] = &unk_100095250;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

- (BOOL)checkIfAlreadySetUp:(BOOL)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018008;
  v9[3] = &unk_1000951B8;
  v9[4] = &v10;
  unsigned int v4 = [(TCCDDatabaseRegistry *)self evalDB:"SELECT value FROM admin WHERE key = 'setup'" locked:a3 bind:0 step:v9];
  if (v4)
  {
    id v5 = +[TCCDPlatform currentPlatform];
    id v6 = [v5 server];
    uint64_t v7 = [v6 logHandle];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10005932C();
    }
  }
  else
  {
    self->_isSetup = *((_DWORD *)v11 + 6) != 0;
  }
  _Block_object_dispose(&v10, 8);
  return v4 == 0;
}

- (BOOL)checkRegistryVersion:(BOOL)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018188;
  v9[3] = &unk_1000951B8;
  v9[4] = &v10;
  unsigned int v4 = [(TCCDDatabaseRegistry *)self evalDB:"SELECT value FROM admin WHERE key = 'version'" locked:a3 bind:0 step:v9];
  if (v4)
  {
    id v5 = +[TCCDPlatform currentPlatform];
    id v6 = [v5 server];
    uint64_t v7 = [v6 logHandle];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100059360();
    }
  }
  else
  {
    self->_version = *((_DWORD *)v11 + 6);
  }
  _Block_object_dispose(&v10, 8);
  return v4 == 0;
}

- (int)commitDB
{
  id v2 = [(TCCDDatabaseRegistry *)self registryDBHandle];
  return sqlite3_exec(v2, "COMMIT", 0, 0, 0);
}

- (void)closeDB
{
  int v3 = [(TCCDDatabaseRegistry *)self registryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018284;
  block[3] = &unk_100094E78;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)notifyRegistryChanged
{
  uint64_t v2 = notify_post("com.apple.tcc.registry.changed");
  if (v2)
  {
    uint64_t v3 = v2;
    unsigned int v4 = +[TCCDPlatform currentPlatform];
    id v5 = [v4 server];
    id v6 = [v5 logHandle];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000593C8(v3, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (OS_dispatch_queue)registryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (int)version
{
  return self->_version;
}

- (BOOL)registryDBUnavailable
{
  return self->_registryDBUnavailable;
}

- (int)extendedErrorCode
{
  return self->_extendedErrorCode;
}

- (sqlite3)registryDBHandle
{
  return self->_registryDBHandle;
}

- (void)setRegistryDBHandle:(sqlite3 *)a3
{
  self->_registryDBHandle = a3;
}

- (void).cxx_destruct
{
}

@end