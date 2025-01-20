@interface KTSDBObjc
- (BOOL)executeSQL:(id)a3;
- (BOOL)executeSQL:(id)a3 arguments:(char *)a4;
- (BOOL)executeSQLStmt:(id)a3;
- (OS_os_log)log;
- (id)initDatabaseWithURL:(id)a3;
- (id)prepareStatement:(id)a3 error:(id *)a4;
- (int)autoVacuumSetting;
- (sqlite3)db;
- (void)close;
- (void)dealloc;
- (void)setDb:(sqlite3 *)a3;
- (void)setLog:(id)a3;
@end

@implementation KTSDBObjc

- (id)initDatabaseWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KTSDBObjc;
  v5 = [(KTSDBObjc *)&v11 init];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = (const char *)[v4 fileSystemRepresentation];
  if (v6) {
    int v7 = 6;
  }
  else {
    int v7 = 134;
  }
  v8 = 0;
  if (!sqlite3_open_v2(v6, &v5->_db, v7, 0))
  {
    os_log_t v9 = os_log_create("KTSDBObjc", "db");
    [(KTSDBObjc *)v5 setLog:v9];

    if ([(KTSDBObjc *)v5 executeSQL:@"pragma journal_mode = WAL"]
      && ([(KTSDBObjc *)v5 autoVacuumSetting] == 2
       || [(KTSDBObjc *)v5 executeSQL:@"pragma auto_vacuum = incremental"]
       && [(KTSDBObjc *)v5 executeSQL:@"VACUUM"]))
    {
      v8 = v5;
      goto LABEL_12;
    }
LABEL_11:
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (BOOL)executeSQLStmt:(id)a3
{
  return [(KTSDBObjc *)self executeSQL:@"%@", a3];
}

- (BOOL)executeSQL:(id)a3
{
  return [(KTSDBObjc *)self executeSQL:a3 arguments:&v4];
}

- (BOOL)executeSQL:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:a4];

  if ([(KTSDBObjc *)self db])
  {
    int v8 = sqlite3_exec(-[KTSDBObjc db](self, "db"), (const char *)[v7 UTF8String], 0, 0, 0);
    if (!v8)
    {
      BOOL v11 = 1;
      goto LABEL_8;
    }
    int v9 = v8;
    v10 = [(KTSDBObjc *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      v14 = sqlite3_errmsg([(KTSDBObjc *)self db]);
      __int16 v15 = 1024;
      int v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sqlite3_exec: %s[%d]", (uint8_t *)&v13, 0x12u);
    }
  }
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (int)autoVacuumSetting
{
  ppStmt = 0;
  int v3 = sqlite3_prepare_v2([(KTSDBObjc *)self db], "PRAGMA auto_vacuum", -1, &ppStmt, 0);
  if (!v3)
  {
    int v8 = sqlite3_step(ppStmt);
    if (v8 != 101)
    {
      int v9 = v8;
      if (v8 == 100)
      {
        int v7 = sqlite3_column_int(ppStmt, 0);
LABEL_12:
        sqlite3_finalize(ppStmt);
        return v7;
      }
      v10 = [(KTSDBObjc *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = sqlite3_errmsg([(KTSDBObjc *)self db]);
        *(_DWORD *)buf = 136315394;
        __int16 v15 = v11;
        __int16 v16 = 1024;
        int v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sqlite3_step: %s[%d]", buf, 0x12u);
      }
    }
    int v7 = -1;
    goto LABEL_12;
  }
  int v4 = v3;
  v5 = [(KTSDBObjc *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sqlite3_errmsg([(KTSDBObjc *)self db]);
    *(_DWORD *)buf = 136315394;
    __int16 v15 = v6;
    __int16 v16 = 1024;
    int v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sqlite3_prepare_v2: %s[%d]", buf, 0x12u);
  }

  return -1;
}

- (void)close
{
  if ([(KTSDBObjc *)self db]) {
    sqlite3_close([(KTSDBObjc *)self db]);
  }

  [(KTSDBObjc *)self setDb:0];
}

- (void)dealloc
{
  if ([(KTSDBObjc *)self db]) {
    sqlite3_close([(KTSDBObjc *)self db]);
  }
  v3.receiver = self;
  v3.super_class = (Class)KTSDBObjc;
  [(KTSDBObjc *)&v3 dealloc];
}

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [[KTSDBStmt alloc] initWithStatement:v6 db:self error:a4];

  return v7;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end