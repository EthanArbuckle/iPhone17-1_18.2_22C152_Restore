@interface MRDExternalDeviceCredentialDatabase
- (BOOL)clearExpiredTokenRecords;
- (BOOL)saveTokenRecord:(id)a3;
- (MRDExternalDeviceCredentialDatabase)init;
- (MRDExternalDeviceCredentialDatabase)initWithPath:(id)a3;
- (NSArray)tokenRecords;
- (NSString)path;
- (id)_loadTokenRecords;
- (void)_initializeDatabaseSchema;
- (void)_openDatabase;
- (void)_validateDatabase;
- (void)dealloc;
@end

@implementation MRDExternalDeviceCredentialDatabase

- (MRDExternalDeviceCredentialDatabase)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRDExternalDeviceCredentialDatabase;
  v5 = [(MRDExternalDeviceCredentialDatabase *)&v10 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    path = v5->_path;
    v5->_path = v6;

    tokenRecords = v5->_tokenRecords;
    v5->_tokenRecords = 0;

    [(MRDExternalDeviceCredentialDatabase *)v5 _openDatabase];
    [(MRDExternalDeviceCredentialDatabase *)v5 _validateDatabase];
    [(MRDExternalDeviceCredentialDatabase *)v5 clearExpiredTokenRecords];
  }

  return v5;
}

- (MRDExternalDeviceCredentialDatabase)init
{
  return [(MRDExternalDeviceCredentialDatabase *)self initWithPath:0];
}

- (void)dealloc
{
  sqlite3_close_v2(self->_dbHandle);
  v3.receiver = self;
  v3.super_class = (Class)MRDExternalDeviceCredentialDatabase;
  [(MRDExternalDeviceCredentialDatabase *)&v3 dealloc];
}

- (NSArray)tokenRecords
{
  tokenRecords = self->_tokenRecords;
  if (!tokenRecords)
  {
    id v4 = [(MRDExternalDeviceCredentialDatabase *)self _loadTokenRecords];
    v5 = (NSMutableArray *)[v4 mutableCopy];
    v6 = self->_tokenRecords;
    self->_tokenRecords = v5;

    tokenRecords = self->_tokenRecords;
  }
  id v7 = [(NSMutableArray *)tokenRecords copy];

  return (NSArray *)v7;
}

- (BOOL)saveTokenRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v9 = 0;
    goto LABEL_27;
  }
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(self->_dbHandle, "INSERT INTO auth_tokens (device_id, auth_token, date_created, expiration_date) VALUES (?, ?, ?, ?);",
         -1,
         &ppStmt,
         0);
  if (!v5)
  {
    objc_super v10 = ppStmt;
    v11 = [v4 deviceID];
    int v6 = sub_10007A354(v10, 1, v11);

    if (!v6) {
      goto LABEL_20;
    }
    v12 = ppStmt;
    v13 = [v4 token];
    int v6 = sub_10007A354(v12, 2, v13);

    if (!v6) {
      goto LABEL_20;
    }
    v14 = ppStmt;
    v15 = [v4 dateCreated];
    [v15 timeIntervalSince1970];
    int v6 = sqlite3_bind_int64(v14, 3, (uint64_t)v16);

    if (v6)
    {
      id v7 = _MRLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      *(_WORD *)v24 = 0;
      v8 = "Error binding statement to database query";
    }
    else
    {
      v17 = ppStmt;
      v18 = [v4 expirationDate];
      [v18 timeIntervalSince1970];
      int v6 = sqlite3_bind_int64(v17, 4, (uint64_t)v19);

      if (v6)
      {
        id v7 = _MRLogForCategory();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        *(_WORD *)v24 = 0;
        v8 = "Error binding statement to database query";
      }
      else
      {
        int v20 = sqlite3_step(ppStmt);
        int v6 = v20;
        if (!v20 || v20 == 101)
        {
          tokenRecords = self->_tokenRecords;
          if (tokenRecords) {
            [(NSMutableArray *)tokenRecords addObject:v4];
          }
          goto LABEL_20;
        }
        id v7 = _MRLogForCategory();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        *(_WORD *)v24 = 0;
        v8 = "Error executing statement to insert auth token";
      }
    }
    goto LABEL_5;
  }
  int v6 = v5;
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    v8 = "Error preparing statement to insert auth token";
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v24, 2u);
  }
LABEL_6:

LABEL_20:
  if (ppStmt)
  {
    if (sqlite3_finalize(ppStmt))
    {
      v22 = _MRLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to finalize database statement", v24, 2u);
      }

      int v6 = 1;
    }
    else
    {
      int v6 = 0;
    }
  }
  BOOL v9 = v6 == 0;
LABEL_27:

  return v9;
}

- (BOOL)clearExpiredTokenRecords
{
  ppStmt = 0;
  int v3 = sqlite3_prepare_v2(self->_dbHandle, "DELETE FROM auth_tokens WHERE expiration_date < ?;", -1, &ppStmt, 0);
  if (!v3)
  {
    int v5 = +[NSDate date];
    int v6 = ppStmt;
    [v5 timeIntervalSince1970];
    int v8 = sqlite3_bind_int64(v6, 1, (uint64_t)v7);
    if (v8)
    {
      int v4 = v8;
      p_super = _MRLogForCategory();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        goto LABEL_12;
      }
      *(_WORD *)v14 = 0;
      objc_super v10 = "Failed to bind date param";
    }
    else
    {
      int v11 = sqlite3_step(ppStmt);
      int v4 = v11;
      if (!v11 || v11 == 101)
      {
        p_super = &self->_tokenRecords->super.super;
        self->_tokenRecords = 0;
        goto LABEL_11;
      }
      p_super = _MRLogForCategory();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_WORD *)v14 = 0;
      objc_super v10 = "Error executing statement to delete expired tokens";
    }
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, v10, v14, 2u);
    goto LABEL_11;
  }
  int v4 = v3;
  int v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error preparing statement to delete expired auth tokens", v14, 2u);
  }
LABEL_12:

  if (ppStmt)
  {
    if (sqlite3_finalize(ppStmt))
    {
      v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to finalize database statement", v14, 2u);
      }

      int v4 = 1;
    }
    else
    {
      int v4 = 0;
    }
  }
  return v4 == 0;
}

- (void)_openDatabase
{
  int v3 = +[NSFileManager defaultManager];
  int v4 = [(NSString *)self->_path stringByDeletingLastPathComponent];
  if (([v3 fileExistsAtPath:v4] & 1) == 0)
  {
    uint64_t v11 = 0;
    [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
  }
  p_dbHandle = &self->_dbHandle;
  sqlite3_open_v2([(NSString *)self->_path fileSystemRepresentation], &self->_dbHandle, 6, 0);
  dbHandle = self->_dbHandle;
  int v10 = 1;
  if (sqlite3_file_control(dbHandle, 0, 10, &v10))
  {
    double v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WARNING: could not enable WAL option on database file", v9, 2u);
    }
  }
  if (sqlite3_exec(*p_dbHandle, "PRAGMA journal_mode=WAL", 0, 0, 0))
  {
    int v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WARNING: could not enable WAL option on database connection", v9, 2u);
    }
  }
}

- (void)_validateDatabase
{
  dbHandle = self->_dbHandle;
  ppStmt = 0;
  if (sqlite3_prepare_v2(dbHandle, "PRAGMA user_version;", -1, &ppStmt, 0))
  {
    int v4 = _MRLogForCategory();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      unint64_t v6 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "PRAGMA user_version;";
    int v5 = "Error preparing database statement: %s";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
    goto LABEL_5;
  }
  int v9 = sqlite3_step(ppStmt);
  unint64_t v6 = 0;
  if (v9 && v9 != 101)
  {
    if (v9 == 100)
    {
      unint64_t v6 = sqlite3_column_int64(ppStmt, 0);
      goto LABEL_6;
    }
    int v4 = _MRLogForCategory();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "PRAGMA user_version;";
    int v5 = "Error stepping database statement: %s";
    goto LABEL_4;
  }
LABEL_6:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    double v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = ppStmt;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error finalizing database statement %p", buf, 0xCu);
    }
  }
  if (v6 < 2)
  {
    if (v6) {
      return;
    }
  }
  else
  {
    path = self->_path;
    *(void *)buf = 0;
    if (!sqlite3_open_v2([(NSString *)path fileSystemRepresentation], (sqlite3 **)buf, 2, 0))
    {
      LODWORD(ppStmt) = 129;
      sqlite3_file_control(*(sqlite3 **)buf, 0, 101, &ppStmt);
      sqlite3_close(*(sqlite3 **)buf);
    }
  }
  [(MRDExternalDeviceCredentialDatabase *)self _initializeDatabaseSchema];
}

- (void)_initializeDatabaseSchema
{
  sqlite3_exec(self->_dbHandle, "CREATE TABLE 'auth_tokens' ('id' INTEGER PRIMARY KEY AUTOINCREMENT,'auth_token' TEXT NOT NULL,'date_created' INTEGER,'expiration_date' INTEGER,'device_id' TEXT);",
    0,
    0,
    0);
  int v3 = +[NSString stringWithFormat:@"PRAGMA user_version = %d", 1];
  dbHandle = self->_dbHandle;
  id v5 = v3;
  sqlite3_exec(dbHandle, (const char *)[v5 UTF8String], 0, 0, 0);
}

- (id)_loadTokenRecords
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_dbHandle, "SELECT auth_token, date_created, expiration_date, device_id FROM auth_tokens;",
         -1,
         &ppStmt,
         0))
  {
    int v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      id v5 = "Error reading from auth token database";
      unint64_t v6 = (uint8_t *)&v18;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  while (1)
  {
    do
      int v7 = sqlite3_step(ppStmt);
    while (!v7);
    if (v7 != 100) {
      break;
    }
    int v8 = objc_alloc_init(MRDMutableExternalDeviceAuthTokenRecord);
    int v9 = +[NSString stringWithUTF8String:sqlite3_column_text(ppStmt, 0)];
    [(MRDMutableExternalDeviceAuthTokenRecord *)v8 setToken:v9];

    int v10 = +[NSDate dateWithTimeIntervalSince1970:(double)sqlite3_column_int64(ppStmt, 1)];
    [(MRDMutableExternalDeviceAuthTokenRecord *)v8 setDateCreated:v10];

    uint64_t v11 = +[NSDate dateWithTimeIntervalSince1970:(double)sqlite3_column_int64(ppStmt, 2)];
    [(MRDMutableExternalDeviceAuthTokenRecord *)v8 setExpirationDate:v11];

    v12 = sqlite3_column_text(ppStmt, 3);
    if (v12)
    {
      v13 = +[NSString stringWithUTF8String:v12];
      [(MRDMutableExternalDeviceAuthTokenRecord *)v8 setDeviceID:v13];
    }
    [v3 addObject:v8];
  }
  if (v7 != 101)
  {
    int v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "Error stepping database statement";
      unint64_t v6 = buf;
      goto LABEL_12;
    }
LABEL_13:
  }
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    v14 = _MRLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to finalize database statement", v16, 2u);
    }
  }

  return v3;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_tokenRecords, 0);
}

@end