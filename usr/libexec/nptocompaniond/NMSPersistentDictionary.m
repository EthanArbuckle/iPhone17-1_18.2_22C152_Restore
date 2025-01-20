@interface NMSPersistentDictionary
- (NMSPersistentDictionary)initWithPath:(id)a3 objectClass:(Class)a4;
- (id)_dataFromObj:(id)a3;
- (id)_objectFromData:(id)a3;
- (id)objectForKey:(id)a3;
- (void)_GENERIC_ERROR:(id)a3;
- (void)_SQLITE_ABORT:(id)a3;
- (void)_SQLITE_AUTH:(id)a3;
- (void)_SQLITE_BUSY:(id)a3;
- (void)_SQLITE_CANTOPEN:(id)a3;
- (void)_SQLITE_CONSTRAINT:(id)a3;
- (void)_SQLITE_CORRUPT:(id)a3;
- (void)_SQLITE_DONE:(id)a3;
- (void)_SQLITE_EMPTY:(id)a3;
- (void)_SQLITE_ERROR:(id)a3;
- (void)_SQLITE_FORMAT:(id)a3;
- (void)_SQLITE_FULL:(id)a3;
- (void)_SQLITE_INTERNAL:(id)a3;
- (void)_SQLITE_INTERRUPT:(id)a3;
- (void)_SQLITE_IOERR:(id)a3;
- (void)_SQLITE_LOCKED:(id)a3;
- (void)_SQLITE_MISMATCH:(id)a3;
- (void)_SQLITE_MISUSE:(id)a3;
- (void)_SQLITE_NOLFS:(id)a3;
- (void)_SQLITE_NOMEM:(id)a3;
- (void)_SQLITE_NOTADB:(id)a3;
- (void)_SQLITE_NOTFOUND:(id)a3;
- (void)_SQLITE_NOTICE:(id)a3;
- (void)_SQLITE_PERM:(id)a3;
- (void)_SQLITE_PROTOCOL:(id)a3;
- (void)_SQLITE_RANGE:(id)a3;
- (void)_SQLITE_READONLY:(id)a3;
- (void)_SQLITE_ROW:(id)a3;
- (void)_SQLITE_SCHEMA:(id)a3;
- (void)_SQLITE_TOOBIG:(id)a3;
- (void)_SQLITE_WARNING:(id)a3;
- (void)_openDBForceRecreate:(BOOL)a3;
- (void)_raiseExceptionWithError:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsSortedByExpirationDate:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 expires:(id)a5;
@end

@implementation NMSPersistentDictionary

- (NMSPersistentDictionary)initWithPath:(id)a3 objectClass:(Class)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMSPersistentDictionary;
  v8 = [(NMSPersistentDictionary *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    v9->_objectClass = a4;
    [(NMSPersistentDictionary *)v9 _openDBForceRecreate:0];
  }

  return v9;
}

- (void)dealloc
{
  if (self->_db)
  {
    sqlite3_finalize(self->_fetch);
    sqlite3_finalize(self->_insert);
    sqlite3_finalize(self->_remove);
    sqlite3_finalize(self->_removeAll);
    sqlite3_finalize(self->_byDate);
    sqlite3_close(self->_db);
  }
  v3.receiver = self;
  v3.super_class = (Class)NMSPersistentDictionary;
  [(NMSPersistentDictionary *)&v3 dealloc];
}

- (void)_openDBForceRecreate:(BOOL)a3
{
  v5 = self->_path;
  v6 = +[NSFileManager defaultManager];
  id v7 = [(NSString *)v5 stringByDeletingLastPathComponent];
  unsigned __int8 v8 = [v6 fileExistsAtPath:v5];
  if ((v8 & 1) == 0)
  {
    id v52 = 0;
    unsigned __int8 v9 = [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v52];
    id v10 = v52;
    if ((v9 & 1) == 0)
    {
      objc_super v11 = sub_10005CDAC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v56 = v7;
        *(_WORD *)&v56[8] = 2112;
        *(void *)&v56[10] = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Could not create directory %@: %@", buf, 0x16u);
      }

      [(NMSPersistentDictionary *)self _raiseExceptionWithError:v10];
    }
  }
  v12 = v5;
  p_db = &self->_db;
  int v14 = sqlite3_open_v2([(NSString *)v12 UTF8String], &self->_db, 6, 0);
  db = self->_db;
  if (v14)
  {
    BOOL v49 = a3;
    v16 = v12;
    v50 = v6;
    v17 = v7;
    uint64_t v18 = v14;
    NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
    v19 = &self->_db;
    if (db)
    {
      v20 = +[NSString stringWithUTF8String:sqlite3_errmsg(db)];
      char v21 = 0;
LABEL_34:
      v54 = v20;
      v38 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      v36 = +[NSError errorWithDomain:@"SQLITE" code:v18 userInfo:v38];

      if ((v21 & 1) == 0) {
      v39 = sub_10005CDAC();
      }
      v12 = v16;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v56 = v16;
        *(_WORD *)&v56[8] = 2112;
        *(void *)&v56[10] = v36;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Could not open database (%@): %@", buf, 0x16u);
      }

      if (*v19) {
        sqlite3_close(*v19);
      }
      *v19 = 0;
      id v7 = v17;
      if (v49)
      {
        v40 = sub_10005CDAC();
        v6 = v50;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v56 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Database %@ open has failed after second try", buf, 0xCu);
        }

        [(NMSPersistentDictionary *)self _raiseExceptionWithError:v36];
      }
      else
      {
        v6 = v50;
        if (v14 == 11)
        {
          v41 = sub_10005CDAC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Database is corrupted, attempting to delete..", buf, 2u);
          }

          v51 = v36;
          unsigned __int8 v42 = [v50 removeItemAtPath:v12 error:&v51];
          v43 = v51;

          if ((v42 & 1) == 0)
          {
            v44 = sub_10005CDAC();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v56 = v12;
              *(_WORD *)&v56[8] = 2112;
              *(void *)&v56[10] = v43;
              _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Could not delete database (%@): %@", buf, 0x16u);
            }
          }
        }
        else
        {
          v43 = v36;
        }
        [(NMSPersistentDictionary *)self _openDBForceRecreate:1];
        v36 = v43;
      }
LABEL_53:

      goto LABEL_54;
    }
LABEL_33:
    v20 = &stru_1000946D0;
    char v21 = 1;
    goto LABEL_34;
  }
  if (!db)
  {
    BOOL v49 = a3;
    v19 = &self->_db;
    v16 = v12;
    v50 = v6;
    v17 = v7;
    uint64_t v18 = 0;
    NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
    goto LABEL_33;
  }
  sqlite3_busy_timeout(db, 60000);
  if ((v8 & 1) == 0)
  {
    sub_1000656C0(*p_db, "CREATE TABLE kvs (k0 text, d0 real, v0 blob)");
    sub_1000656C0(*p_db, "CREATE UNIQUE INDEX k0 on kvs (k0)");
    sub_1000656C0(*p_db, "CREATE INDEX d0 on kvs (d0)");
  }
  int v22 = sqlite3_prepare_v2(self->_db, "INSERT OR REPLACE INTO kvs (k0, d0, v0) VALUES (?, ?, ?)", 56, &self->_insert, 0);
  if (v22)
  {
    int v23 = v22;
    v24 = sub_10005CDAC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v45 = sqlite3_errmsg(*p_db);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v56 = v23;
      *(_WORD *)&v56[4] = 2080;
      *(void *)&v56[6] = v45;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "SQL error: (%d) %s", buf, 0x12u);
    }
  }
  int v25 = sqlite3_prepare_v2(self->_db, "SELECT v0 FROM kvs WHERE k0 = ?", 31, &self->_fetch, 0);
  if (v25)
  {
    int v26 = v25;
    v27 = sub_10005CDAC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v46 = sqlite3_errmsg(*p_db);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v56 = v26;
      *(_WORD *)&v56[4] = 2080;
      *(void *)&v56[6] = v46;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "SQL error: (%d) %s", buf, 0x12u);
    }
  }
  int v28 = sqlite3_prepare_v2(self->_db, "DELETE FROM kvs WHERE k0 = ?", 28, &self->_remove, 0);
  if (v28)
  {
    int v29 = v28;
    v30 = sub_10005CDAC();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v47 = sqlite3_errmsg(*p_db);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v56 = v29;
      *(_WORD *)&v56[4] = 2080;
      *(void *)&v56[6] = v47;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "SQL error: (%d) %s", buf, 0x12u);
    }
  }
  int v31 = sqlite3_prepare_v2(self->_db, "DELETE FROM kvs", 15, &self->_removeAll, 0);
  if (v31)
  {
    int v32 = v31;
    v33 = sub_10005CDAC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v48 = sqlite3_errmsg(*p_db);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v56 = v32;
      *(_WORD *)&v56[4] = 2080;
      *(void *)&v56[6] = v48;
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "SQL error: (%d) %s", buf, 0x12u);
    }
  }
  int v34 = sqlite3_prepare_v2(self->_db, "SELECT k0, d0, v0 FROM kvs ORDER BY d0 ASC", 42, &self->_byDate, 0);
  if (v34)
  {
    int v35 = v34;
    v36 = sub_10005CDAC();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = sqlite3_errmsg(*p_db);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v56 = v35;
      *(_WORD *)&v56[4] = 2080;
      *(void *)&v56[6] = v37;
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "SQL error: (%d) %s", buf, 0x12u);
    }
    goto LABEL_53;
  }
LABEL_54:
}

- (void)setObject:(id)a3 forKey:(id)a4 expires:(id)a5
{
  insert = self->_insert;
  id v9 = a5;
  id v10 = a3;
  sub_1000658F8(insert, a4);
  objc_super v11 = self->_insert;
  [v9 timeIntervalSinceReferenceDate];
  double v13 = v12;

  sqlite3_bind_double(v11, 2, v13);
  int v14 = [(NMSPersistentDictionary *)self _dataFromObj:v10];

  v15 = self->_insert;
  id v16 = v14;
  sqlite3_bind_blob(v15, 3, [v16 bytes], (int)[v16 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  int v17 = sqlite3_step(self->_insert);
  if (v17)
  {
    int v18 = v17;
    if (v17 != 101)
    {
      v19 = sub_10005CDAC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = sqlite3_errmsg(self->_db);
        v21[0] = 67109378;
        v21[1] = v18;
        __int16 v22 = 2080;
        int v23 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "SQL error: (%d) %s", (uint8_t *)v21, 0x12u);
      }
    }
  }
  sqlite3_reset(self->_insert);
  sqlite3_clear_bindings(self->_insert);
}

- (id)_objectFromData:(id)a3
{
  if (a3)
  {
    Class objectClass = self->_objectClass;
    id v9 = 0;
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objectClass fromData:a3 error:&v9];
    id v6 = v9;
    if (v6)
    {
      id v7 = sub_10005CDAC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to unarchive persistent dictionary object: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_dataFromObj:(id)a3
{
  id v7 = 0;
  objc_super v3 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    v5 = sub_10005CDAC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to archive persistent dictionary object: %@", buf, 0xCu);
    }
  }

  return v3;
}

- (id)objectForKey:(id)a3
{
  sub_1000658F8(self->_fetch, a3);
  int v4 = sqlite3_step(self->_fetch);
  if (v4 != 101)
  {
    int v5 = v4;
    if (v4 == 100)
    {
      id v6 = sub_100065C90(self->_fetch, 0);
      goto LABEL_8;
    }
    id v7 = sub_10005CDAC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v10 = sqlite3_errmsg(self->_db);
      v11[0] = 67109378;
      v11[1] = v5;
      __int16 v12 = 2080;
      double v13 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "SQL error: (%d) %s", (uint8_t *)v11, 0x12u);
    }
  }
  id v6 = 0;
LABEL_8:
  sqlite3_reset(self->_fetch);
  sqlite3_clear_bindings(self->_fetch);
  unsigned __int8 v8 = [(NMSPersistentDictionary *)self _objectFromData:v6];

  return v8;
}

- (void)removeObjectForKey:(id)a3
{
  sub_1000658F8(self->_remove, a3);
  int v4 = sqlite3_step(self->_remove);
  if (v4 != 101)
  {
    int v5 = v4;
    id v6 = sub_10005CDAC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = sqlite3_errmsg(self->_db);
      v8[0] = 67109378;
      v8[1] = v5;
      __int16 v9 = 2080;
      id v10 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "SQL error: (%d) %s", (uint8_t *)v8, 0x12u);
    }
  }
  sqlite3_reset(self->_remove);
  sqlite3_clear_bindings(self->_remove);
}

- (void)removeAllObjects
{
  int v3 = sqlite3_step(self->_removeAll);
  if (v3 != 101)
  {
    int v4 = v3;
    int v5 = sub_10005CDAC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = sqlite3_errmsg(self->_db);
      v7[0] = 67109378;
      v7[1] = v4;
      __int16 v8 = 2080;
      __int16 v9 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "SQL error: (%d) %s", (uint8_t *)v7, 0x12u);
    }
  }
  sqlite3_reset(self->_removeAll);
}

- (void)enumerateObjectsSortedByExpirationDate:(id)a3
{
  int v4 = (void (**)(id, NSObject *, void *, void *, uint8_t *))a3;
  int v5 = +[NSMutableSet set];
  while (1)
  {
    int v6 = sqlite3_step(self->_byDate);
    if (v6 != 100) {
      break;
    }
    id v7 = +[NSString stringWithUTF8String:sqlite3_column_text(self->_byDate, 0)];
    __int16 v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:sqlite3_column_double(self->_byDate, 1)];
    __int16 v9 = sub_100065C90(self->_byDate, 2);
    id v10 = [(NMSPersistentDictionary *)self _objectFromData:v9];
    if (v10)
    {
      buf[0] = 0;
      v4[2](v4, v7, v10, v8, buf);
      if (buf[0])
      {

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      [v5 addObject:v7];
    }
  }
  int v11 = v6;
  if (v6 && v6 != 101)
  {
    id v7 = sub_10005CDAC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = sqlite3_errmsg(self->_db);
      *(_DWORD *)buf = 67109378;
      int v24 = v11;
      __int16 v25 = 2080;
      int v26 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "SQL Error %d: %s", buf, 0x12u);
    }
    goto LABEL_12;
  }
LABEL_13:
  sqlite3_reset(self->_byDate);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[NMSPersistentDictionary removeObjectForKey:](self, "removeObjectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)_SQLITE_ERROR:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_INTERNAL:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_PERM:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_ABORT:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_BUSY:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_LOCKED:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_NOMEM:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_READONLY:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_INTERRUPT:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_IOERR:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_CORRUPT:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_NOTFOUND:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_FULL:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_CANTOPEN:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_PROTOCOL:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_EMPTY:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_SCHEMA:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_TOOBIG:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_CONSTRAINT:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_MISMATCH:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_MISUSE:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_NOLFS:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_AUTH:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_FORMAT:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_RANGE:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_NOTADB:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_NOTICE:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_WARNING:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_ROW:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_SQLITE_DONE:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_GENERIC_ERROR:(id)a3
{
  id v4 = [a3 localizedDescription];
  int v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  [v3 raise];
}

- (void)_raiseExceptionWithError:(id)a3
{
  id v6 = a3;
  +[NPTOTransaction _deleteKeepAliveFile];
  id v4 = [v6 domain];
  unsigned int v5 = [v4 isEqualToString:@"SQLITE"];

  if (!v5) {
    goto LABEL_62;
  }
  if ([v6 code] == (id)1)
  {
    [(NMSPersistentDictionary *)self _SQLITE_ERROR:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)2)
  {
    [(NMSPersistentDictionary *)self _SQLITE_INTERNAL:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)3)
  {
    [(NMSPersistentDictionary *)self _SQLITE_PERM:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)4)
  {
    [(NMSPersistentDictionary *)self _SQLITE_ABORT:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)5)
  {
    [(NMSPersistentDictionary *)self _SQLITE_BUSY:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)6)
  {
    [(NMSPersistentDictionary *)self _SQLITE_LOCKED:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)7)
  {
    [(NMSPersistentDictionary *)self _SQLITE_NOMEM:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)8)
  {
    [(NMSPersistentDictionary *)self _SQLITE_READONLY:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)9)
  {
    [(NMSPersistentDictionary *)self _SQLITE_INTERRUPT:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)10)
  {
    [(NMSPersistentDictionary *)self _SQLITE_IOERR:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)11)
  {
    [(NMSPersistentDictionary *)self _SQLITE_CORRUPT:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)12)
  {
    [(NMSPersistentDictionary *)self _SQLITE_NOTFOUND:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)13)
  {
    [(NMSPersistentDictionary *)self _SQLITE_FULL:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)14)
  {
    [(NMSPersistentDictionary *)self _SQLITE_CANTOPEN:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)15)
  {
    [(NMSPersistentDictionary *)self _SQLITE_PROTOCOL:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)16)
  {
    [(NMSPersistentDictionary *)self _SQLITE_EMPTY:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)17)
  {
    [(NMSPersistentDictionary *)self _SQLITE_SCHEMA:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)18)
  {
    [(NMSPersistentDictionary *)self _SQLITE_TOOBIG:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)19)
  {
    [(NMSPersistentDictionary *)self _SQLITE_CONSTRAINT:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)20)
  {
    [(NMSPersistentDictionary *)self _SQLITE_MISMATCH:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)21)
  {
    [(NMSPersistentDictionary *)self _SQLITE_MISUSE:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)22)
  {
    [(NMSPersistentDictionary *)self _SQLITE_NOLFS:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)23)
  {
    [(NMSPersistentDictionary *)self _SQLITE_AUTH:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)24)
  {
    [(NMSPersistentDictionary *)self _SQLITE_FORMAT:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)25)
  {
    [(NMSPersistentDictionary *)self _SQLITE_RANGE:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)26)
  {
    [(NMSPersistentDictionary *)self _SQLITE_NOTADB:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)27)
  {
    [(NMSPersistentDictionary *)self _SQLITE_NOTICE:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)28)
  {
    [(NMSPersistentDictionary *)self _SQLITE_WARNING:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)100)
  {
    [(NMSPersistentDictionary *)self _SQLITE_ROW:v6];
    goto LABEL_63;
  }
  if ([v6 code] == (id)101) {
    [(NMSPersistentDictionary *)self _SQLITE_DONE:v6];
  }
  else {
LABEL_62:
  }
    [(NMSPersistentDictionary *)self _GENERIC_ERROR:v6];
LABEL_63:
}

- (void).cxx_destruct
{
}

@end