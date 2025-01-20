@interface UserRegistryDB
- (BOOL)beginExclusiveTransaction;
- (BOOL)deleteEscrowKey:(id)a3;
- (BOOL)deleteMirrorKeys:(int)a3;
- (BOOL)deleteRecordAll;
- (BOOL)deleteRecordID:(id)a3;
- (BOOL)endTransaction:(BOOL)a3;
- (BOOL)markMirrorKey:(int)a3 type:(int)a4;
- (BOOL)prepare:(const char *)a3 statement:(sqlite3_stmt *)a4;
- (BOOL)replaceConfigRecord:(id)a3 data:(id)a4;
- (BOOL)replaceRecord:(id)a3 type:(int)a4 data:(id)a5 publicKey:(id)a6;
- (BOOL)replaceRecordID:(id)a3 data:(id)a4 publicKey:(id)a5;
- (BOOL)setEscrowKey:(id)a3 escrowBlob:(id)a4;
- (BOOL)setMirrorKey:(id)a3 service:(int)a4 type:(int)a5 publicIdentity:(id)a6;
- (BOOL)setupDatabase;
- (BOOL)syncedKeyToDevice:(id)a3 type:(int)a4 device:(id)a5;
- (BOOL)updateEscrowKey:(id)a3 escrowBlob:(id)a4;
- (BOOL)updateMirrorKey:(id)a3 service:(int)a4 type:(int)a5 newType:(int)a6 current:(BOOL)a7;
- (BOOL)updateSyncDevice:(id)a3 seen:(id)a4 version:(id)a5;
- (NSString)dsid;
- (OS_os_log)oslog;
- (UserRegistryDB)initWithDSID:(id)a3;
- (id)getConfigData:(id)a3;
- (id)getData:(id)a3 type:(int)a4;
- (id)getRecordIDData:(id)a3;
- (id)missingKeysFromDevice:(id)a3 type:(int)a4;
- (id)queryEscrowKey:(id)a3;
- (id)queryEscrowKeys;
- (id)syncDevices;
- (sqlite3)sqliteHandle;
- (sqlite3_stmt)deleteEscrowKey;
- (sqlite3_stmt)deleteMirrorKeys;
- (sqlite3_stmt)deleteStatment;
- (sqlite3_stmt)insertEscrowKey;
- (sqlite3_stmt)insertMirrorKey;
- (sqlite3_stmt)insertWatch;
- (sqlite3_stmt)insertWatchKey;
- (sqlite3_stmt)markMirrorKey;
- (sqlite3_stmt)queryEscrowKey;
- (sqlite3_stmt)queryEscrowKeysAll;
- (sqlite3_stmt)queryMissingKeys;
- (sqlite3_stmt)queryWatches;
- (sqlite3_stmt)recordIDStatment;
- (sqlite3_stmt)replaceStatment;
- (sqlite3_stmt)resetCurrentMirrorKey;
- (sqlite3_stmt)updateEscrowKey;
- (sqlite3_stmt)updateMirrorKey;
- (sqlite3_stmt)updateWatch;
- (void)dealloc;
- (void)setDeleteEscrowKey:(sqlite3_stmt *)a3;
- (void)setDeleteMirrorKeys:(sqlite3_stmt *)a3;
- (void)setDeleteStatment:(sqlite3_stmt *)a3;
- (void)setDsid:(id)a3;
- (void)setInsertEscrowKey:(sqlite3_stmt *)a3;
- (void)setInsertMirrorKey:(sqlite3_stmt *)a3;
- (void)setInsertWatch:(sqlite3_stmt *)a3;
- (void)setInsertWatchKey:(sqlite3_stmt *)a3;
- (void)setMarkMirrorKey:(sqlite3_stmt *)a3;
- (void)setOslog:(id)a3;
- (void)setQueryEscrowKey:(sqlite3_stmt *)a3;
- (void)setQueryEscrowKeysAll:(sqlite3_stmt *)a3;
- (void)setQueryMissingKeys:(sqlite3_stmt *)a3;
- (void)setQueryWatches:(sqlite3_stmt *)a3;
- (void)setRecordIDStatment:(sqlite3_stmt *)a3;
- (void)setReplaceStatment:(sqlite3_stmt *)a3;
- (void)setResetCurrentMirrorKey:(sqlite3_stmt *)a3;
- (void)setSqliteHandle:(sqlite3 *)a3;
- (void)setUpdateEscrowKey:(sqlite3_stmt *)a3;
- (void)setUpdateMirrorKey:(sqlite3_stmt *)a3;
- (void)setUpdateWatch:(sqlite3_stmt *)a3;
@end

@implementation UserRegistryDB

- (UserRegistryDB)initWithDSID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UserRegistryDB;
  v5 = [(UserRegistryDB *)&v9 init];
  if (v5
    && (os_log_t v6 = os_log_create("com.apple.ProtectedCloudStorage", "UserDB"),
        [(UserRegistryDB *)v5 setOslog:v6],
        v6,
        [(UserRegistryDB *)v5 setDsid:v4],
        [(UserRegistryDB *)v5 setupDatabase]))
  {
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
}

- (BOOL)prepare:(const char *)a3 statement:(sqlite3_stmt *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = sqlite3_prepare_v2(self->_sqliteHandle, a3, -1, a4, 0);
  if (v6)
  {
    v8 = [(UserRegistryDB *)self oslog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = v6;
      __int16 v10 = 2080;
      v11 = a3;
      _os_log_impl(&dword_1ACF98000, v8, OS_LOG_TYPE_DEFAULT, "failed to prepare (%d): %s", (uint8_t *)v9, 0x12u);
    }
  }
  return v6 == 0;
}

- (BOOL)setupDatabase
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  errmsg = 0;
  v3 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  if ([v3 count])
  {
    id v4 = NSString;
    v5 = [v3 objectAtIndexedSubscript:0];
    int v6 = [v4 stringWithFormat:@"%@/com.apple.ProtectedCloudStorage", v5];

    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v31 = 0;
    char v8 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v31];
    id v9 = v31;

    if (v8)
    {
      __int16 v10 = NSString;
      v11 = [(UserRegistryDB *)self dsid];
      uint64_t v12 = [v10 stringWithFormat:@"KeysSyncing{,Version2}-%@-%@*", v11, kPCSServiceName[0]];
      v13 = [v6 stringByAppendingPathComponent:v12];

      memset(&v35, 0, sizeof(v35));
      id v14 = v13;
      if (!glob((const char *)[v14 UTF8String], 128, 0, &v35))
      {
        id v30 = v9;
        v15 = [(UserRegistryDB *)self oslog];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v34) = v35.gl_matchc;
          _os_log_impl(&dword_1ACF98000, v15, OS_LOG_TYPE_DEFAULT, "Found %d PCS databases files to delete", buf, 8u);
        }

        if (v35.gl_matchc >= 1)
        {
          uint64_t v16 = 0;
          do
          {
            v17 = v35.gl_pathv[v16];
            v18 = [(UserRegistryDB *)self oslog];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v34 = v17;
              _os_log_impl(&dword_1ACF98000, v18, OS_LOG_TYPE_DEFAULT, "removing: %s", buf, 0xCu);
            }

            removefile(v17, 0, 0);
            ++v16;
          }
          while (v16 < v35.gl_matchc);
        }
        globfree(&v35);
        id v9 = v30;
      }

      v19 = NSString;
      v20 = [(UserRegistryDB *)self dsid];
      v21 = [v19 stringWithFormat:@"KeysSyncingVersion3-%@-%@.db", v20, kPCSServiceName[0]];
      v22 = [v6 stringByAppendingPathComponent:v21];

      v23 = v22;
      p_sqliteHandle = &self->_sqliteHandle;
      if (sqlite3_open_v2((const char *)[v23 UTF8String], &self->_sqliteHandle, 6, 0))
      {
        v25 = [(UserRegistryDB *)self oslog];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = sqlite3_errmsg(*p_sqliteHandle);
          LODWORD(v35.gl_pathc) = 136315138;
          *(size_t *)((char *)&v35.gl_pathc + 4) = (size_t)v26;
          _os_log_impl(&dword_1ACF98000, v25, OS_LOG_TYPE_DEFAULT, "Failed to open userDB database: %s", (uint8_t *)&v35, 0xCu);
        }
      }
      else
      {
        [(UserRegistryDB *)self beginExclusiveTransaction];
        if (sqlite3_exec(self->_sqliteHandle, "CREATE TABLE IF NOT EXISTS PCSKeys(recordID TEXT PRIMARY KEY, type INTEGER NOT NULL, data BLOB, publicKey TEXT);CREATE TABLE IF NOT EXISTS SyncDevices(deviceID TEXT PRIMARY KEY NOT NULL, lastSeen TEXT, firs"
               "tSeen TEXT, version TEXT);CREATE TABLE IF NOT EXISTS MirrorKeys(publicKey TEXT PRIMARY KEY NOT NULL, e"
               "scrow BLOB, dsid TEXT NOT NULL, service INTEGER NOT NULL, current INTEGER NOT NULL, type INTEGER NOT NULL"
               ",publicIdentity BLOB);CREATE TABLE IF NOT EXISTS SyncedKeys(deviceNumber INTEGER NOT NULL, pubkeyNumbe"
               "r INTEGER NOT NULL, current INTEGER DEFAULT 0, PRIMARY KEY (deviceNumber,pubkeyNumber)) ;CREATE TABLE IF"
               " NOT EXISTS EscrowedKeys(publicKey TEXT PRIMARY KEY NOT NULL, escrow BLOB,dsid TEXT NOT NULL);CREATE T"
               "RIGGER IF NOT EXISTS removeSyncedKeys DELETE ON SyncDevices    FOR EACH ROW BEGIN        DELETE FROM Sync"
               "edKeys WHERE OLD.rowid = SyncedKeys.deviceNumber ;    END  ; CREATE TRIGGER IF NOT EXISTS removeMirrorKey"
               "s DELETE ON MirrorKeys    FOR EACH ROW BEGIN        DELETE FROM SyncedKeys WHERE OLD.rowid = SyncedKeys.p"
               "ubkeyNumber ;    END  ; CREATE TABLE IF NOT EXISTS UpdateLimits(updateType TEXT PRIMARY KEY NOT NULL, m"
               "od_date DATETIME DEFAULT CURRENT_TIMESTAMP, counter INTEGER, digest TEXT);",
               0,
               0,
               &errmsg))
        {
          v28 = [(UserRegistryDB *)self oslog];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v35.gl_pathc) = 136315138;
            *(size_t *)((char *)&v35.gl_pathc + 4) = (size_t)errmsg;
            _os_log_impl(&dword_1ACF98000, v28, OS_LOG_TYPE_DEFAULT, "Create schema for database: %s", (uint8_t *)&v35, 0xCu);
          }

          sqlite3_free(errmsg);
          [(UserRegistryDB *)self endTransaction:0];
        }
        else
        {
          [(UserRegistryDB *)self endTransaction:1];
          sqlite3_exec(self->_sqliteHandle, "PRAGMA journal_mode=WAL;", 0, 0, 0);
          if (-[UserRegistryDB prepare:statement:](self, "prepare:statement:", "SELECT data FROM PCSKeys WHERE recordID = ? AND type = ?;",
                 &self->_recordIDStatment)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "REPLACE INTO PCSKeys (recordID,type,data,publicKey) VALUES(?,?,?,?);",
                 &self->_replaceStatment)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "DELETE FROM PCSKeys WHERE recordID = ?;",
                 &self->_deleteStatment)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "INSERT OR IGNORE INTO SyncDevices (deviceID,firstSeen) VALUES(?,?);",
                 &self->_insertWatch)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE SyncDevices SET lastSeen = ? AND version = ? WHERE deviceID = ?;",
                 &self->_updateWatch)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "INSERT INTO MirrorKeys (publicKey,dsid,service,current,type,publicIdentity) VALUES(?,?,?,0,?,?);",
                 &self->_insertMirrorKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE MirrorKeys SET current=?,type=? WHERE publicKey = ? AND type = ? AND dsid = ?;",
                 &self->_updateMirrorKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE MirrorKeys SET type=? WHERE service = ? AND dsid = ?;",
                 &self->_markMirrorKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "DELETE FROM MirrorKeys WHERE service = ?;",
                 &self->_deleteMirrorKeys)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "INSERT OR REPLACE INTO EscrowedKeys (publicKey,escrow,dsid) VALUES(?,?,?);",
                 &self->_insertEscrowKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE EscrowedKeys SET escrow=? WHERE publicKey = ? AND dsid = ?;",
                 &self->_updateEscrowKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "DELETE FROM EscrowedKeys WHERE publicKey = ? AND dsid = ?;",
                 &self->_deleteEscrowKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "SELECT escrow FROM EscrowedKeys WHERE publicKey = ? AND dsid = ?", &self->_queryEscrowKey)&& -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "SELECT publicKey,escrow FROM EscrowedKeys WHERE dsid = ?", &self->_queryEscrowKeysAll)&& -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "INSERT INTO SyncedKeys (deviceNumber,pubkeyNumber) SELECT SyncDevices.rowid,MirrorKeys.rowid FROM SyncDevices,MirrorKeys WHERE (SyncDevices.deviceID = ? AND MirrorKeys.publicKey = ? AND MirrorKeys.type = ? AND MirrorKeys.dsid = ?);",
                 &self->_insertWatchKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE MirrorKeys SET current = 0 WHERE service=? AND dsid=?;",
                 &self->_resetCurrentMirrorKey)
            && [(UserRegistryDB *)self prepare:"SELECT MirrorKeys.publicKey FROM MirrorKeys WHERE MirrorKeys.dsid = ? AND MirrorKeys.type = ? AND (MirrorKeys.rowid NOT IN   (SELECT SyncedKeys.pubkeyNumber FROM SyncedKeys,SyncDevices WHERE (SyncDevices.deviceID = ? AND SyncedKeys.deviceNumber = SyncDevices.rowid))) ORDER BY MirrorKeys.current != 0" statement:&self->_queryMissingKeys])
          {
            BOOL v27 = -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "SELECT deviceID FROM SyncDevices;",
                    &self->_queryWatches);
LABEL_44:

            goto LABEL_45;
          }
        }
      }
    }
    else
    {
      v23 = [(UserRegistryDB *)self oslog];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v35.gl_pathc) = 138412290;
        *(size_t *)((char *)&v35.gl_pathc + 4) = (size_t)v9;
        _os_log_impl(&dword_1ACF98000, v23, OS_LOG_TYPE_DEFAULT, "Failed to create ApplicationSupport directory: %@", (uint8_t *)&v35, 0xCu);
      }
    }
    BOOL v27 = 0;
    goto LABEL_44;
  }
  int v6 = [(UserRegistryDB *)self oslog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v35.gl_pathc) = 0;
    _os_log_impl(&dword_1ACF98000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get ApplicationSupport directory", (uint8_t *)&v35, 2u);
  }
  BOOL v27 = 0;
LABEL_45:

  return v27;
}

- (BOOL)deleteRecordAll
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  errmsg = 0;
  int v3 = sqlite3_exec(v2->_sqliteHandle, "DELETE FROM PCSKeys; DELETE FROM SyncedKeys; DELETE FROM MirrorKeys; DELETE FROM SyncDevices;DELETE FROM UpdateLimits;",
         0,
         0,
         &errmsg);
  if (v3)
  {
    v5 = [(UserRegistryDB *)v2 oslog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      char v8 = errmsg;
      _os_log_impl(&dword_1ACF98000, v5, OS_LOG_TYPE_DEFAULT, "Failed deleting all records: %s", buf, 0xCu);
    }
  }
  if (errmsg) {
    sqlite3_free(errmsg);
  }
  objc_sync_exit(v2);

  return v3 == 0;
}

- (BOOL)beginExclusiveTransaction
{
  errmsg = 0;
  int v2 = sqlite3_exec(self->_sqliteHandle, "BEGIN EXCLUSIVE TRANSACTION;", 0, 0, &errmsg);
  if (errmsg) {
    sqlite3_free(errmsg);
  }
  return v2 == 0;
}

- (BOOL)endTransaction:(BOOL)a3
{
  if (a3) {
    int v3 = "COMMIT TRANSACTION;";
  }
  else {
    int v3 = "ROLLBACK TRANSACTION;";
  }
  sqlite3_exec(self->_sqliteHandle, v3, 0, 0, 0);
  return 1;
}

- (id)getData:(id)a3 type:(int)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  recordIDStatment = v7->_recordIDStatment;
  id v9 = v6;
  if (sqlite3_bind_text(recordIDStatment, 1, (const char *)[v9 UTF8String], -1, 0)
    || sqlite3_bind_int(v7->_recordIDStatment, 2, a4)
    || sqlite3_step(v7->_recordIDStatment) != 100)
  {
    uint64_t v12 = 0;
  }
  else
  {
    __int16 v10 = sqlite3_column_blob(v7->_recordIDStatment, 0);
    int v11 = sqlite3_column_bytes(v7->_recordIDStatment, 0);
    uint64_t v12 = 0;
    if (v10 && v11 >= 1)
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v10 length:v11];
    }
  }
  sqlite3_reset(v7->_recordIDStatment);
  objc_sync_exit(v7);

  return v12;
}

- (BOOL)replaceRecord:(id)a3 type:(int)a4 data:(id)a5 publicKey:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = self;
  objc_sync_enter(v13);
  replaceStatment = v13->_replaceStatment;
  id v15 = v10;
  v18 = !sqlite3_bind_text(replaceStatment, 1, (const char *)[v15 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)&& !sqlite3_bind_int(v13->_replaceStatment, 2, a4)&& (uint64_t v16 = v13->_replaceStatment, v17 = v11, !sqlite3_bind_blob(v16, 3, (const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))&& !sqlite3_bind_text(v13->_replaceStatment, 4, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), -1,
           (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
     && sqlite3_step(v13->_replaceStatment) == 101;
  sqlite3_reset(v13->_replaceStatment);
  objc_sync_exit(v13);

  return v18;
}

- (id)getConfigData:(id)a3
{
  return [(UserRegistryDB *)self getData:a3 type:0];
}

- (BOOL)replaceConfigRecord:(id)a3 data:(id)a4
{
  return [(UserRegistryDB *)self replaceRecord:a3 type:0 data:a4 publicKey:&stru_1F03DBED0];
}

- (id)getRecordIDData:(id)a3
{
  return [(UserRegistryDB *)self getData:a3 type:1];
}

- (BOOL)replaceRecordID:(id)a3 data:(id)a4 publicKey:(id)a5
{
  return [(UserRegistryDB *)self replaceRecord:a3 type:1 data:a4 publicKey:a5];
}

- (BOOL)deleteRecordID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  deleteStatment = v5->_deleteStatment;
  id v7 = v4;
  if (sqlite3_bind_text(deleteStatment, 1, (const char *)[v7 UTF8String], -1, 0)) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = sqlite3_step(v5->_deleteStatment) == 101;
  }
  sqlite3_reset(v5->_deleteStatment);
  objc_sync_exit(v5);

  return v8;
}

- (BOOL)setMirrorKey:(id)a3 service:(int)a4 type:(int)a5 publicIdentity:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = self;
  objc_sync_enter(v12);
  insertMirrorKey = v12->_insertMirrorKey;
  id v14 = v10;
  BOOL v17 = !sqlite3_bind_text(insertMirrorKey, 1, (const char *)[v14 UTF8String], -1, 0)
     && !sqlite3_bind_text(v12->_insertMirrorKey, 2, [(NSString *)v12->_dsid UTF8String], -1, 0)
     && !sqlite3_bind_int(v12->_insertMirrorKey, 3, a4)
     && !sqlite3_bind_int(v12->_insertMirrorKey, 4, a5)
     && (id v15 = v12->_insertMirrorKey,
         id v16 = v11,
         !sqlite3_bind_blob(v15, 5, (const void *)[v16 bytes], objc_msgSend(v16, "length"), 0))
     && sqlite3_step(v12->_insertMirrorKey) == 101;
  sqlite3_reset(v12->_insertMirrorKey);
  objc_sync_exit(v12);

  return v17;
}

- (BOOL)markMirrorKey:(int)a3 type:(int)a4
{
  id v6 = self;
  objc_sync_enter(v6);
  if (sqlite3_bind_int(v6->_markMirrorKey, 1, a4)
    || sqlite3_bind_int(v6->_markMirrorKey, 2, a3)
    || sqlite3_bind_text(v6->_markMirrorKey, 3, [(NSString *)v6->_dsid UTF8String], -1, 0))
  {
    BOOL v7 = 0;
  }
  else
  {
    while (sqlite3_step(v6->_markMirrorKey) == 100)
      ;
    BOOL v7 = 1;
  }
  sqlite3_reset(v6->_markMirrorKey);
  objc_sync_exit(v6);

  return v7;
}

- (BOOL)updateMirrorKey:(id)a3 service:(int)a4 type:(int)a5 newType:(int)a6 current:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  v13 = self;
  objc_sync_enter(v13);
  if (v7)
  {
    if (sqlite3_bind_int(v13->_resetCurrentMirrorKey, 1, a4)
      || sqlite3_bind_text(v13->_resetCurrentMirrorKey, 2, [(NSString *)v13->_dsid UTF8String], -1, 0))
    {
      goto LABEL_12;
    }
    while (sqlite3_step(v13->_resetCurrentMirrorKey) == 100)
      ;
  }
  if (sqlite3_bind_int(v13->_updateMirrorKey, 1, v7)
    || sqlite3_bind_int(v13->_updateMirrorKey, 2, a6)
    || sqlite3_bind_text(v13->_updateMirrorKey, 3, (const char *)[v12 UTF8String], -1, 0)|| sqlite3_bind_int(v13->_updateMirrorKey, 4, a5)|| sqlite3_bind_text(v13->_updateMirrorKey, 5, -[NSString UTF8String](v13->_dsid, "UTF8String"), -1, 0))
  {
LABEL_12:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  BOOL v14 = sqlite3_step(v13->_updateMirrorKey) == 101;
LABEL_11:
  sqlite3_reset(v13->_resetCurrentMirrorKey);
  sqlite3_reset(v13->_updateMirrorKey);
  objc_sync_exit(v13);

  return v14;
}

- (BOOL)deleteMirrorKeys:(int)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (sqlite3_bind_int(v4->_deleteMirrorKeys, 1, a3)) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = sqlite3_step(v4->_deleteMirrorKeys) == 101;
  }
  sqlite3_reset(v4->_deleteMirrorKeys);
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)setEscrowKey:(id)a3 escrowBlob:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self;
  objc_sync_enter(v8);
  insertEscrowKey = v8->_insertEscrowKey;
  id v10 = v6;
  if (sqlite3_bind_text(insertEscrowKey, 1, (const char *)[v10 UTF8String], -1, 0)
    || (id v11 = v8->_insertEscrowKey,
        id v12 = v7,
        sqlite3_bind_blob(v11, 2, (const void *)[v12 bytes], objc_msgSend(v12, "length"), 0))
    || sqlite3_bind_text(v8->_insertEscrowKey, 3, [(NSString *)v8->_dsid UTF8String], -1, 0))
  {
    int v13 = -1;
  }
  else
  {
    int v13 = sqlite3_step(v8->_insertEscrowKey);
    if (v13 == 101)
    {
      BOOL v14 = 1;
      goto LABEL_10;
    }
  }
  id v15 = [(UserRegistryDB *)v8 oslog];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v13;
    _os_log_impl(&dword_1ACF98000, v15, OS_LOG_TYPE_DEFAULT, "failed to set escrow key (%d)", (uint8_t *)v17, 8u);
  }

  BOOL v14 = 0;
LABEL_10:
  sqlite3_reset(v8->_insertEscrowKey);
  objc_sync_exit(v8);

  return v14;
}

- (BOOL)updateEscrowKey:(id)a3 escrowBlob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self;
  objc_sync_enter(v8);
  updateEscrowKey = v8->_updateEscrowKey;
  id v10 = v7;
  BOOL v11 = !sqlite3_bind_blob(updateEscrowKey, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), 0)&& !sqlite3_bind_text(v8->_updateEscrowKey, 2, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0)&& !sqlite3_bind_text(v8->_updateEscrowKey, 3, -[NSString UTF8String](v8->_dsid, "UTF8String"), -1, 0)&& sqlite3_step(v8->_updateEscrowKey) == 101;
  sqlite3_reset(v8->_updateEscrowKey);
  objc_sync_exit(v8);

  return v11;
}

- (BOOL)deleteEscrowKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  deleteEscrowKey = v5->_deleteEscrowKey;
  id v7 = v4;
  BOOL v8 = !sqlite3_bind_text(deleteEscrowKey, 1, (const char *)[v7 UTF8String], -1, 0)
    && !sqlite3_bind_text(v5->_deleteEscrowKey, 2, [(NSString *)v5->_dsid UTF8String], -1, 0)
    && sqlite3_step(v5->_deleteEscrowKey) == 101;
  sqlite3_reset(v5->_deleteEscrowKey);
  objc_sync_exit(v5);

  return v8;
}

- (id)queryEscrowKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  queryEscrowKey = v5->_queryEscrowKey;
  id v7 = v4;
  if (sqlite3_bind_text(queryEscrowKey, 1, (const char *)[v7 UTF8String], -1, 0)
    || sqlite3_bind_text(v5->_queryEscrowKey, 2, [(NSString *)v5->_dsid UTF8String], -1, 0)
    || sqlite3_step(v5->_queryEscrowKey) != 100)
  {
    id v10 = 0;
    goto LABEL_7;
  }
  BOOL v8 = sqlite3_column_blob(v5->_queryEscrowKey, 0);
  unsigned int v9 = sqlite3_column_bytes(v5->_queryEscrowKey, 0);
  if (v8 && (v9 & 0x80000000) == 0)
  {
    id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:v9];
LABEL_7:
    sqlite3_reset(v5->_queryEscrowKey);
    goto LABEL_9;
  }
  sqlite3_reset(v5->_queryEscrowKey);
  id v10 = 0;
LABEL_9:
  objc_sync_exit(v5);

  return v10;
}

- (id)queryEscrowKeys
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!sqlite3_bind_text(self->_queryEscrowKeysAll, 1, [(NSString *)self->_dsid UTF8String], -1, 0)
    && sqlite3_step(self->_queryEscrowKeysAll) == 100)
  {
    do
    {
      id v4 = sqlite3_column_text(self->_queryEscrowKeysAll, 0);
      if (v4)
      {
        BOOL v5 = v4;
        id v6 = sqlite3_column_blob(self->_queryEscrowKeysAll, 1);
        int v7 = sqlite3_column_bytes(self->_queryEscrowKeysAll, 1);
        BOOL v8 = (void *)[[NSString alloc] initWithUTF8String:v5];
        unsigned int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v6 length:v7];
        [v3 setValue:v9 forKey:v8];
      }
    }
    while (sqlite3_step(self->_queryEscrowKeysAll) == 100);
  }
  sqlite3_reset(self->_queryEscrowKeysAll);
  return v3;
}

- (BOOL)updateSyncDevice:(id)a3 seen:(id)a4 version:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = self;
  objc_sync_enter(v11);
  insertWatch = v11->_insertWatch;
  id v13 = v8;
  BOOL v16 = !sqlite3_bind_text(insertWatch, 1, (const char *)[v13 UTF8String], -1, 0)
     && (BOOL v14 = v11->_insertWatch,
         id v15 = v9,
         !sqlite3_bind_text(v14, 2, (const char *)[v15 UTF8String], -1, 0))
     && (sqlite3_step(v11->_insertWatch),
         !sqlite3_bind_text(v11->_updateWatch, 1, (const char *)[v15 UTF8String], -1, 0))&& !sqlite3_bind_text(v11->_updateWatch, 2, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), -1, 0)&& !sqlite3_bind_text(v11->_updateWatch, 3, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), -1, 0)&& sqlite3_step(v11->_updateWatch) == 101;
  sqlite3_reset(v11->_insertWatch);
  sqlite3_reset(v11->_updateWatch);
  objc_sync_exit(v11);

  return v16;
}

- (BOOL)syncedKeyToDevice:(id)a3 type:(int)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = self;
  objc_sync_enter(v10);
  insertWatchKey = v10->_insertWatchKey;
  id v12 = v9;
  BOOL v13 = !sqlite3_bind_text(insertWatchKey, 1, (const char *)[v12 UTF8String], -1, 0)
     && !sqlite3_bind_text(v10->_insertWatchKey, 2, (const char *)[v8 UTF8String], -1, 0)&& !sqlite3_bind_int(v10->_insertWatchKey, 3, a4)&& !sqlite3_bind_text(v10->_insertWatchKey, 4, -[NSString UTF8String](v10->_dsid, "UTF8String"), -1, 0)&& sqlite3_step(v10->_insertWatchKey) == 101;
  sqlite3_reset(v10->_insertWatchKey);
  objc_sync_exit(v10);

  return v13;
}

- (id)syncDevices
{
  int v2 = self;
  objc_sync_enter(v2);
  id v3 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    int v4 = sqlite3_step(v2->_queryWatches);
    queryWatches = v2->_queryWatches;
    if (v4 != 100) {
      break;
    }
    id v6 = sqlite3_column_text(queryWatches, 0);
    if (v6)
    {
      int v7 = [NSString stringWithUTF8String:v6];
      [v3 addObject:v7];
    }
  }
  sqlite3_reset(queryWatches);
  objc_sync_exit(v2);

  return v3;
}

- (id)missingKeysFromDevice:(id)a3 type:(int)a4
{
  id v6 = a3;
  int v7 = self;
  objc_sync_enter(v7);
  id v8 = [MEMORY[0x1E4F1CA48] array];
  if (!sqlite3_bind_text(v7->_queryMissingKeys, 1, [(NSString *)v7->_dsid UTF8String], -1, 0)
    && !sqlite3_bind_int(v7->_queryMissingKeys, 2, a4)
    && !sqlite3_bind_text(v7->_queryMissingKeys, 3, (const char *)[v6 UTF8String], -1, 0))
  {
    while (sqlite3_step(v7->_queryMissingKeys) == 100)
    {
      id v9 = sqlite3_column_text(v7->_queryMissingKeys, 0);
      if (v9)
      {
        id v10 = [NSString stringWithUTF8String:v9];
        [v8 addObject:v10];
      }
    }
  }
  sqlite3_reset(v7->_queryMissingKeys);
  objc_sync_exit(v7);

  return v8;
}

- (sqlite3)sqliteHandle
{
  return self->_sqliteHandle;
}

- (void)setSqliteHandle:(sqlite3 *)a3
{
  self->_sqliteHandle = a3;
}

- (sqlite3_stmt)recordIDStatment
{
  return self->_recordIDStatment;
}

- (void)setRecordIDStatment:(sqlite3_stmt *)a3
{
  self->_recordIDStatment = a3;
}

- (sqlite3_stmt)replaceStatment
{
  return self->_replaceStatment;
}

- (void)setReplaceStatment:(sqlite3_stmt *)a3
{
  self->_replaceStatment = a3;
}

- (sqlite3_stmt)deleteStatment
{
  return self->_deleteStatment;
}

- (void)setDeleteStatment:(sqlite3_stmt *)a3
{
  self->_deleteStatment = a3;
}

- (sqlite3_stmt)insertWatch
{
  return self->_insertWatch;
}

- (void)setInsertWatch:(sqlite3_stmt *)a3
{
  self->_insertWatch = a3;
}

- (sqlite3_stmt)updateWatch
{
  return self->_updateWatch;
}

- (void)setUpdateWatch:(sqlite3_stmt *)a3
{
  self->_updateWatch = a3;
}

- (sqlite3_stmt)insertMirrorKey
{
  return self->_insertMirrorKey;
}

- (void)setInsertMirrorKey:(sqlite3_stmt *)a3
{
  self->_insertMirrorKey = a3;
}

- (sqlite3_stmt)updateMirrorKey
{
  return self->_updateMirrorKey;
}

- (void)setUpdateMirrorKey:(sqlite3_stmt *)a3
{
  self->_updateMirrorKey = a3;
}

- (sqlite3_stmt)markMirrorKey
{
  return self->_markMirrorKey;
}

- (void)setMarkMirrorKey:(sqlite3_stmt *)a3
{
  self->_markMirrorKey = a3;
}

- (sqlite3_stmt)deleteMirrorKeys
{
  return self->_deleteMirrorKeys;
}

- (void)setDeleteMirrorKeys:(sqlite3_stmt *)a3
{
  self->_deleteMirrorKeys = a3;
}

- (sqlite3_stmt)resetCurrentMirrorKey
{
  return self->_resetCurrentMirrorKey;
}

- (void)setResetCurrentMirrorKey:(sqlite3_stmt *)a3
{
  self->_resetCurrentMirrorKey = a3;
}

- (sqlite3_stmt)insertEscrowKey
{
  return self->_insertEscrowKey;
}

- (void)setInsertEscrowKey:(sqlite3_stmt *)a3
{
  self->_insertEscrowKey = a3;
}

- (sqlite3_stmt)updateEscrowKey
{
  return self->_updateEscrowKey;
}

- (void)setUpdateEscrowKey:(sqlite3_stmt *)a3
{
  self->_updateEscrowKey = a3;
}

- (sqlite3_stmt)deleteEscrowKey
{
  return self->_deleteEscrowKey;
}

- (void)setDeleteEscrowKey:(sqlite3_stmt *)a3
{
  self->_deleteEscrowKey = a3;
}

- (sqlite3_stmt)queryEscrowKey
{
  return self->_queryEscrowKey;
}

- (void)setQueryEscrowKey:(sqlite3_stmt *)a3
{
  self->_queryEscrowKey = a3;
}

- (sqlite3_stmt)queryEscrowKeysAll
{
  return self->_queryEscrowKeysAll;
}

- (void)setQueryEscrowKeysAll:(sqlite3_stmt *)a3
{
  self->_queryEscrowKeysAll = a3;
}

- (sqlite3_stmt)insertWatchKey
{
  return self->_insertWatchKey;
}

- (void)setInsertWatchKey:(sqlite3_stmt *)a3
{
  self->_insertWatchKey = a3;
}

- (sqlite3_stmt)queryMissingKeys
{
  return self->_queryMissingKeys;
}

- (void)setQueryMissingKeys:(sqlite3_stmt *)a3
{
  self->_queryMissingKeys = a3;
}

- (sqlite3_stmt)queryWatches
{
  return self->_queryWatches;
}

- (void)setQueryWatches:(sqlite3_stmt *)a3
{
  self->_queryWatches = a3;
}

- (OS_os_log)oslog
{
  return (OS_os_log *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOslog:(id)a3
{
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_oslog, 0);
}

@end