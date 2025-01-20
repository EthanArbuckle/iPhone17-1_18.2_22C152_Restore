@interface ABSContactsShadow
+ (id)instance;
- (ABSContactsShadow)init;
- (BOOL)_createDb;
- (BOOL)_execSql:(const char *)a3;
- (BOOL)_prepareStatements;
- (BOOL)contains:(id)a3;
- (int64_t)_userSchema;
- (void)_closeDb;
- (void)_openDb;
- (void)beginTransaction;
- (void)commitTransaction;
- (void)dealloc;
- (void)insert:(id)a3;
- (void)purge;
- (void)remove:(id)a3;
- (void)rollbackTransaction;
@end

@implementation ABSContactsShadow

+ (id)instance
{
  if (qword_100069CD0 != -1) {
    dispatch_once(&qword_100069CD0, &stru_1000553A8);
  }
  v2 = (void *)qword_100069CD8;

  return v2;
}

- (ABSContactsShadow)init
{
  v3.receiver = self;
  v3.super_class = (Class)ABSContactsShadow;
  result = [(ABSContactsShadow *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)_openDb
{
  id v3 = +[ABSDatabaseFileManager syncStateDBPathFor:@"ABSABShadow.db"];
  v4 = (const char *)[v3 UTF8String];

  if (!sqlite3_open_v2(v4, &self->_db, 6, 0) && [(ABSContactsShadow *)self _createDb])
  {
    [(ABSContactsShadow *)self _prepareStatements];
  }
}

- (void)_closeDb
{
  id v3 = (void *)os_transaction_create();
  uint64_t v4 = 0;
  statements = self->statements;
  do
  {
    v6 = statements[v4];
    if (v6)
    {
      sqlite3_finalize(v6);
      statements[v4] = 0;
    }
    ++v4;
  }
  while (v4 != 4);
  uint64_t v7 = sqlite3_close(self->_db);
  self->_db = 0;
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100037770(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)dealloc
{
  if (self->_db) {
    [(ABSContactsShadow *)self _closeDb];
  }
  v3.receiver = self;
  v3.super_class = (Class)ABSContactsShadow;
  [(ABSContactsShadow *)&v3 dealloc];
}

- (BOOL)_createDb
{
  [(ABSContactsShadow *)self _execSql:"PRAGMA journal_mode=WAL;"];
  int64_t v3 = [(ABSContactsShadow *)self _userSchema];
  switch(v3)
  {
    case 2:
      goto LABEL_6;
    case 1:
LABEL_5:
      [(ABSContactsShadow *)self _execSql:"alter table ABSyncState add column account_id TEXT;"];
      [(ABSContactsShadow *)self _execSql:"pragma user_version=2;"];
LABEL_6:
      [(ABSContactsShadow *)self _execSql:"drop table if exists ABSyncState"];
      [(ABSContactsShadow *)self _execSql:"create table if not exists SyncState (guid TEXT UNIQUE)"];
      [(ABSContactsShadow *)self _execSql:"pragma user_version=3;"];
      return 1;
    case 0:
      [(ABSContactsShadow *)self _execSql:"create table if not exists ABSyncState (guid TEXT, hash INT);"];
      [(ABSContactsShadow *)self _execSql:"create unique index if not exists ABGUIDIndex on ABSyncState (guid);"];
      [(ABSContactsShadow *)self _execSql:"alter table ABSyncState add column mark INT;"];
      goto LABEL_5;
  }
  return 1;
}

- (BOOL)_execSql:(const char *)a3
{
  errmsg = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v6 = sqlite3_exec(self->_db, a3, 0, 0, &errmsg);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000377DC((uint64_t *)&errmsg, v6, v7);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v6 == 0;
}

- (BOOL)_prepareStatements
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B238;
  v5[3] = &unk_1000553D0;
  v5[4] = self;
  v2 = objc_retainBlock(v5);
  char v3 = 0;
  if (((unsigned int (*)(void *, void, const char *))v2[2])(v2, 0, "insert or replace into SyncState (guid) values (?)"))
  {
    if (((unsigned int (*)(void *, uint64_t, const char *))v2[2])(v2, 1, "delete from SyncState where guid = ?")&& ((unsigned int (*)(void *, uint64_t, const char *))v2[2])(v2, 2, "select count() from SyncState where guid = ?"))
    {
      char v3 = ((uint64_t (*)(void *, uint64_t, const char *))v2[2])(v2, 3, "delete from SyncState");
    }
    else
    {
      char v3 = 0;
    }
  }

  return v3;
}

- (void)insert:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self->statements[0];
    v5 = (const char *)[a3 UTF8String];
    p_lock = &self->_lock;
    os_unfair_lock_lock(p_lock);
    sqlite3_bind_text(v4, 1, v5, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = sqlite3_step(v4);
    if (v7 != 101)
    {
      uint64_t v8 = v7;
      v9 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000378E0(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    sqlite3_reset(v4);
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)remove:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self->statements[1];
    v5 = (const char *)[a3 UTF8String];
    p_lock = &self->_lock;
    os_unfair_lock_lock(p_lock);
    sqlite3_bind_text(v4, 1, v5, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = sqlite3_step(v4);
    if (v7 != 101)
    {
      uint64_t v8 = v7;
      v9 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003794C(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    sqlite3_reset(v4);
    os_unfair_lock_unlock(p_lock);
  }
}

- (BOOL)contains:(id)a3
{
  char v3 = self->statements[2];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = v5;
  uint64_t v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v3, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  BOOL v8 = sqlite3_step(v3) == 100 && sqlite3_column_int(v3, 0) != 0;
  sqlite3_reset(v3);
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)purge
{
  v2 = self->statements[3];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sqlite3_step(v2);
  sqlite3_reset(v2);

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)_userSchema
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "pragma user_version;", -1, &ppStmt, 0))
  {
    v2 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000379B8(v2);
    }
    return 0;
  }
  else
  {
    if (sqlite3_step(ppStmt) == 100) {
      sqlite3_int64 v3 = sqlite3_column_int64(ppStmt, 0);
    }
    else {
      sqlite3_int64 v3 = 0;
    }
    sqlite3_finalize(ppStmt);
  }
  return v3;
}

- (void)beginTransaction
{
  [(ABSContactsShadow *)self _openDb];
  [(ABSContactsShadow *)self _execSql:"BEGIN"];
  sqlite3_int64 v3 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Started shadow transaction", v4, 2u);
  }
}

- (void)commitTransaction
{
  [(ABSContactsShadow *)self _execSql:"COMMIT"];
  [(ABSContactsShadow *)self _closeDb];
  sqlite3_int64 v3 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committed shadow transaction", v4, 2u);
  }
}

- (void)rollbackTransaction
{
  [(ABSContactsShadow *)self _execSql:"ROLLBACK"];
  [(ABSContactsShadow *)self _closeDb];
  sqlite3_int64 v3 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Rolled back shadow transaction", v4, 2u);
  }
}

- (void).cxx_destruct
{
}

@end