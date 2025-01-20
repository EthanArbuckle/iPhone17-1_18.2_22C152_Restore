@interface MBSQLiteDB
- (BOOL)_invalidate:(id *)a3;
- (BOOL)_openWithFlags:(int)a3 usePQLBatching:(BOOL)a4 error:(id *)a5;
- (BOOL)_removeDatabaseAtPath:(id)a3 error:(id *)a4;
- (BOOL)close:(id *)a3;
- (BOOL)executeStatements:(id)a3 error:(id *)a4;
- (BOOL)executeWithError:(id *)a3 sql:(id)a4;
- (BOOL)groupInTransaction:(id)a3 error:(id *)a4;
- (BOOL)performWithConnection:(id)a3 error:(id *)a4;
- (BOOL)readOnly;
- (BOOL)shouldDeleteOnFailureToOpen;
- (MBSQLiteDB)initWithPath:(id)a3 readOnly:(BOOL)a4 shouldDeleteOnFailureToOpen:(BOOL)a5 usePQLBatching:(BOOL)a6 schemaCurrentVersion:(int)a7 schemaMinDatabaseVersionForUpgrade:(int)a8 error:(id *)a9 schemaUpgrades:(id)a10;
- (NSArray)schemaUpgrades;
- (NSString)path;
- (OS_dispatch_queue)sharedQueue;
- (PQLConnection)pdb;
- (id)_invalidatedError;
- (id)_makePQLConnectionWithFlags:(int)a3 usePQLBatching:(BOOL)a4 error:(id *)a5;
- (id)_openPQLConnectionWithFlags:(int)a3 error:(id *)a4;
- (id)fetchObjectOfClass:(Class)a3 error:(id *)a4 sql:(id)a5;
- (id)fetchSQL:(id)a3;
- (id)openReadOnlyInstance:(Class)a3 error:(id *)a4;
- (int)schemaCurrentVersion;
- (int)schemaMinDatabaseVersionForUpgrade;
- (unint64_t)fetchCountWithError:(id *)a3 sql:(id)a4;
- (void)_perform:(id)a3;
- (void)_removeCorruptDatabaseWithError:(id)a3;
- (void)_removeCorruptDatabaseWithError:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setPdb:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setSharedQueue:(id)a3;
@end

@implementation MBSQLiteDB

- (MBSQLiteDB)initWithPath:(id)a3 readOnly:(BOOL)a4 shouldDeleteOnFailureToOpen:(BOOL)a5 usePQLBatching:(BOOL)a6 schemaCurrentVersion:(int)a7 schemaMinDatabaseVersionForUpgrade:(int)a8 error:(id *)a9 schemaUpgrades:(id)a10
{
  id v16 = a3;
  id v17 = a10;
  v48.receiver = self;
  v48.super_class = (Class)MBSQLiteDB;
  v18 = [(MBSQLiteDB *)&v48 init];
  if (!v18)
  {
    v28 = 0;
LABEL_9:
    v28 = v28;
    v30 = v28;
    goto LABEL_10;
  }
  v19 = v18;
  v20 = (NSString *)[v16 copy];
  path = v19->_path;
  v19->_path = v20;

  v19->_shouldDeleteOnFailureToOpen = a5;
  v19->_schemaCurrentVersion = a7;
  v19->_schemaMinDatabaseVersionForUpgrade = a8;
  objc_storeStrong((id *)&v19->_schemaUpgrades, a10);
  v22 = (objc_class *)objc_opt_class();
  Name = class_getName(v22);
  v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v25 = dispatch_queue_create(Name, v24);
  sharedQueue = v19->_sharedQueue;
  v19->_sharedQueue = (OS_dispatch_queue *)v25;

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100055078;
  v42 = sub_100055088;
  id v43 = 0;
  v27 = v19->_sharedQueue;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100055090;
  v32[3] = &unk_1000F1CA0;
  BOOL v36 = a4;
  v34 = &v44;
  v28 = v19;
  BOOL v37 = a6;
  v33 = v28;
  v35 = &v38;
  dispatch_sync(v27, v32);
  int v29 = *((unsigned __int8 *)v45 + 24);
  if (!*((unsigned char *)v45 + 24))
  {
    if (a9) {
      *a9 = (id) v39[5];
    }

    v28 = 0;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  if (v29) {
    goto LABEL_9;
  }
  v30 = 0;
LABEL_10:

  return v30;
}

- (id)openReadOnlyInstance:(Class)a3 error:(id *)a4
{
  id v4 = [[a3 alloc] initWithPath:self->_path readOnly:1 shouldDeleteOnFailureToOpen:self->_shouldDeleteOnFailureToOpen usePQLBatching:0 schemaCurrentVersion:self->_schemaCurrentVersion schemaMinDatabaseVersionForUpgrade:self->_schemaMinDatabaseVersionForUpgrade error:a4 schemaUpgrades:0];

  return v4;
}

- (BOOL)close:(id *)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sharedQueue);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100055078;
  v18 = sub_100055088;
  id v19 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  sharedQueue = self->_sharedQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055380;
  block[3] = &unk_1000F1CC8;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v14;
  dispatch_sync(sharedQueue, block);
  int v6 = *((unsigned __int8 *)v11 + 24);
  if (a3 && !*((unsigned char *)v11 + 24))
  {
    *a3 = (id) v15[5];
    int v6 = *((unsigned __int8 *)v11 + 24);
  }
  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (BOOL)_invalidate:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  pdb = self->_pdb;
  if (!pdb) {
    return 1;
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100055078;
  int v29 = sub_100055088;
  v30 = pdb;
  int v6 = self->_pdb;
  self->_pdb = 0;

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100055078;
  v23 = sub_100055088;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  BOOL v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Invalidating cache connection %p", buf, 0xCu);
    _MBLog();
  }

  v8 = [(id)v26[5] serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055734;
  block[3] = &unk_1000F1CF0;
  block[4] = &v25;
  block[5] = &v15;
  block[6] = &v19;
  dispatch_sync(v8, block);

  if (!*((unsigned char *)v16 + 24))
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (MBSQLiteDB *)v26[5];
      uint64_t v11 = v20[5];
      *(_DWORD *)buf = 134218242;
      v32 = v10;
      __int16 v33 = 2112;
      uint64_t v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to close the PQL connection %p: %@", buf, 0x16u);
      _MBLog();
    }

    if (a3) {
      *a3 = (id) v20[5];
    }
  }
  BOOL v12 = *((unsigned char *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

- (void)dealloc
{
  pdb = self->_pdb;
  if (pdb)
  {
    id v4 = pdb;
    v5 = self->_pdb;
    self->_pdb = 0;

    int v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = path;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Database (%@) should be closed before dealloc", buf, 0xCu);
      uint64_t v10 = self->_path;
      _MBLog();
    }

    v8 = [(PQLConnection *)v4 serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000559D0;
    block[3] = &unk_1000F1A78;
    char v13 = v4;
    v9 = v4;
    dispatch_async(v8, block);
  }
  v11.receiver = self;
  v11.super_class = (Class)MBSQLiteDB;
  [(MBSQLiteDB *)&v11 dealloc];
}

- (void)_removeCorruptDatabaseWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedQueue = self->_sharedQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055AA0;
  block[3] = &unk_1000F1D18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedQueue, block);
}

- (void)_removeCorruptDatabaseWithError:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_100099EF0();
  }
  v5 = v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  uint64_t v6 = [(MBSQLiteDB *)self path];
  if (!v6) {
    sub_100099F1C();
  }
  id v7 = v6;
  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v33 = v7;
    __int16 v34 = 2112;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "The database at %@ is corrupted and will be removed: %@", buf, 0x16u);
    _MBLog();
  }

  if (!sub_100092304())
  {
    id v29 = 0;
    unsigned __int8 v26 = [(MBSQLiteDB *)self _removeDatabaseAtPath:v7 error:&v29];
    v20 = v29;
    if (v26)
    {
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v33 = v7;
      __int16 v34 = 2112;
      v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to delete the database at %@: %@", buf, 0x16u);
LABEL_22:
      _MBLog();
    }
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v9 = [(NSString *)self->_path stringByDeletingLastPathComponent];
  if (!v9) {
    sub_100099F48();
  }
  id v10 = (void *)v9;
  objc_super v11 = [(NSString *)self->_path lastPathComponent];
  id v12 = [v11 stringByDeletingPathExtension];
  id v13 = +[NSString stringWithFormat:@"%@_corrupted.db", v12];
  uint64_t v14 = [v10 stringByAppendingPathComponent:v13];

  if (!v14) {
    sub_100099F74();
  }
  id v31 = 0;
  unsigned __int8 v15 = +[MBSQLiteFileHandle copySQLiteFileAtPath:v7 toPath:v14 error:&v31];
  uint64_t v16 = v31;
  if ((v15 & 1) == 0)
  {
    uint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v33 = v7;
      __int16 v34 = 2112;
      v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to SQLite copy the database at %@: %@", buf, 0x16u);
      _MBLog();
    }
  }
  char v18 = +[NSFileManager defaultManager];
  id v30 = 0;
  unsigned __int8 v19 = [v18 mb_moveAsideAndMarkPurgeableDBFilesAtPath:v7 error:&v30];
  v20 = v30;

  if ((v19 & 1) == 0)
  {
    uint64_t v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v33 = v7;
      __int16 v34 = 2112;
      v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to move aside the database at %@: %@", buf, 0x16u);
      goto LABEL_22;
    }
    goto LABEL_23;
  }

  uint64_t v21 = [v5 domain];
  unsigned int v22 = [v21 isEqualToString:PQLSqliteErrorDomain];

  if (!v22)
  {
    v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v33 = v5;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Removed database, error: %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_24;
  }
  if ([v5 code] != (id)13)
  {
    v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v23 = [v5 code];
      id v24 = [v5 extendedSqliteCode];
      uint64_t v25 = [v5 description];
      *(_DWORD *)buf = 134218498;
      __int16 v33 = v23;
      __int16 v34 = 2048;
      v35 = v24;
      __int16 v36 = 2112;
      BOOL v37 = v25;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Removed database, code:%ld, extendedCode:%ld, description:\"%@\"", buf, 0x20u);

      [v5 code];
      [v5 extendedSqliteCode];
      v28 = [v5 description];
      _MBLog();
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (BOOL)_openWithFlags:(int)a3 usePQLBatching:(BOOL)a4 error:(id *)a5
{
  BOOL v38 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  id v7 = self->_path;
  v8 = 0;
  uint64_t v9 = 0;
  unsigned int v37 = a3;
  BOOL v10 = a3 & 1;
  char v11 = 1;
  uint64_t v36 = PQLSqliteErrorDomain;
  while (1)
  {
    char v12 = v11;

    if (v10)
    {
      id v13 = 0;
    }
    else
    {
      uint64_t v14 = [(NSString *)v7 stringByDeletingLastPathComponent];
      unsigned __int8 v15 = +[NSFileManager defaultManager];
      v44[0] = NSFileOwnerAccountName;
      v44[1] = NSFileGroupOwnerAccountName;
      v45[0] = @"mobile";
      v45[1] = @"mobile";
      uint64_t v16 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      id v41 = 0;
      unsigned __int8 v17 = [v15 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v16 error:&v41];
      id v13 = v41;

      if ((v17 & 1) == 0)
      {
        uint64_t v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          path = self->_path;
          *(_DWORD *)buf = 138412546;
          *(void *)id v43 = path;
          *(_WORD *)&v43[8] = 2112;
          *(void *)&v43[10] = v13;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to create the directory at %@: %@", buf, 0x16u);
          _MBLog();
        }

        v8 = v13;
        goto LABEL_37;
      }
    }
    uint64_t v40 = v13;
    char v18 = -[MBSQLiteDB _makePQLConnectionWithFlags:usePQLBatching:error:](self, "_makePQLConnectionWithFlags:usePQLBatching:error:", v37, v38, &v40, v32, v33, v34);
    v8 = v40;

    if (v18 || v10) {
      break;
    }
    v20 = [v8 domain];
    if ([v20 isEqualToString:v36])
    {
      BOOL v21 = [v8 code] == (id)13;

      if (v21)
      {
        id v29 = MBGetDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v43 = 30;
          *(_WORD *)&v43[4] = 2114;
          *(void *)&v43[6] = v8;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Sleeping for %d seconds: %{public}@", buf, 0x12u);
          _MBLog();
        }

        sleep(0x1Eu);
        goto LABEL_37;
      }
    }
    else
    {
    }
    if (self->_shouldDeleteOnFailureToOpen)
    {
      id v39 = 0;
      unsigned __int8 v22 = [(MBSQLiteDB *)self _removeDatabaseAtPath:v7 error:&v39];
      v23 = v39;
      if ((v22 & 1) == 0)
      {
        id v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)id v43 = v9;
          *(_WORD *)&v43[4] = 2112;
          *(void *)&v43[6] = v7;
          *(_WORD *)&v43[14] = 2112;
          *(void *)&v43[16] = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to remove the DB on attempt %d opening at %@: %@", buf, 0x1Cu);
          __int16 v33 = v7;
          __int16 v34 = v23;
          uint64_t v32 = v9;
          _MBLog();
        }
      }
    }
    else
    {
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v43 = v9;
        *(_WORD *)&v43[4] = 2112;
        *(void *)&v43[6] = v7;
        *(_WORD *)&v43[14] = 2112;
        *(void *)&v43[16] = v8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Not deleting DB on attempt %d opening at %@: %@", buf, 0x1Cu);
        __int16 v33 = v7;
        __int16 v34 = v8;
        uint64_t v32 = v9;
        _MBLog();
      }
    }

    if (!v8) {
      sub_100099FCC();
    }
    char v11 = 0;
    uint64_t v9 = 1;
    if ((v12 & 1) == 0) {
      goto LABEL_38;
    }
  }
  if (!v18)
  {
LABEL_37:
    if (!v8) {
      sub_100099FA0();
    }
LABEL_38:
    if (a5)
    {
      v8 = v8;
      char v18 = 0;
      *a5 = v8;
    }
    else
    {
      char v18 = 0;
    }
    goto LABEL_41;
  }
  self->_readOnly = v10;
  objc_storeStrong((id *)&self->_pdb, v18);
  uint64_t v25 = MBGetDefaultLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    if (v10) {
      unsigned __int8 v26 = "o";
    }
    else {
      unsigned __int8 v26 = "w";
    }
    *(void *)id v43 = v26;
    *(_WORD *)&v43[8] = 2112;
    *(void *)&v43[10] = v18;
    *(_WORD *)&v43[18] = 2112;
    *(void *)&v43[20] = v7;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Opened r/%s PQL connection %@ at path %@", buf, 0x20u);
    _MBLog();
  }

LABEL_41:
  return v18 != 0;
}

- (id)_makePQLConnectionWithFlags:(int)a3 usePQLBatching:(BOOL)a4 error:(id *)a5
{
  if (!a5) {
    sub_100099FF8();
  }
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  uint64_t v9 = [(MBSQLiteDB *)self _openPQLConnectionWithFlags:v7 error:a5];
  if (!v9) {
    goto LABEL_32;
  }
  int v10 = [(MBSQLiteDB *)self schemaMinDatabaseVersionForUpgrade];
  if (v10 > [(MBSQLiteDB *)self schemaCurrentVersion]) {
    sub_10009A024();
  }
  char v11 = [v9 userVersion];
  id v12 = [v11 unsignedIntValue];

  if ((v12 & 0x80000000) == 0
    && (int)v12 < [(MBSQLiteDB *)self schemaMinDatabaseVersionForUpgrade])
  {
    if (v7)
    {
      [v9 close:0];
      +[MBError errorWithCode:1 format:@"Can't upgrade RO database"];
      id v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    uint64_t v14 = [v9 url];
    unsigned __int8 v15 = [v14 path];

    if (!v15) {
      sub_10009A050();
    }
    uint64_t v16 = (sqlite3 *)[v9 dbHandle];
    if (!v16) {
      sub_10009A07C();
    }
    unsigned __int8 v17 = v16;
    int v44 = 61;
    char v18 = (void *)sqlite3_file_control(v16, 0, 101, &v44);
    if (v18)
    {
      unsigned __int8 v19 = v18;
      uint64_t v20 = sqlite3_extended_errcode(v17);
      BOOL v21 = +[NSString stringWithUTF8String:sqlite3_errmsg(v17)];
      unsigned __int8 v22 = +[NSError errorWithSqliteCode:v20 andMessage:v21];
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v46 = v15;
        __int16 v47 = 1024;
        *(_DWORD *)objc_super v48 = v19;
        *(_WORD *)&v48[4] = 2112;
        *(void *)&v48[6] = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to truncate the database at %@: %d: %@", buf, 0x1Cu);
        id v41 = v19;
        v42 = v22;
        uint64_t v40 = v15;
        _MBLog();
      }

      [v9 close:0];
      if (!self->_shouldDeleteOnFailureToOpen)
      {
        id v38 = v22;
        *a5 = v38;
        uint64_t v9 = MBGetDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v46 = v15;
          __int16 v47 = 2112;
          *(void *)objc_super v48 = v38;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Not deleting DB while creating SQLite connection at %@: %@", buf, 0x16u);
          _MBLog();
        }
        goto LABEL_30;
      }
      id v43 = 0;
      unsigned __int8 v24 = [(MBSQLiteDB *)self _removeDatabaseAtPath:v15 error:&v43];
      uint64_t v25 = v43;
      uint64_t v9 = v25;
      if ((v24 & 1) == 0)
      {
        v49[0] = v22;
        v49[1] = v25;
        unsigned __int8 v26 = +[NSArray arrayWithObjects:v49 count:2];
        *a5 = +[MBError errorWithErrors:v26];

        uint64_t v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v46 = v15;
          __int16 v47 = 2112;
          *(void *)objc_super v48 = v22;
          *(_WORD *)&v48[8] = 2112;
          *(void *)&v48[10] = v9;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to remove the database while creating SQLite connection at %@: %@, remove error: %@", buf, 0x20u);
          _MBLog();
        }

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {
      v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v29 = [(MBSQLiteDB *)self schemaMinDatabaseVersionForUpgrade];
        *(_DWORD *)buf = 138412802;
        uint64_t v46 = v15;
        __int16 v47 = 1024;
        *(_DWORD *)objc_super v48 = v12;
        *(_WORD *)&v48[4] = 1024;
        *(_DWORD *)&v48[6] = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Truncated the database at %@, databaseVersion:%d, minDatabaseVersionForUpgrade:%d", buf, 0x18u);
        id v41 = v12;
        v42 = (void *)[(MBSQLiteDB *)self schemaMinDatabaseVersionForUpgrade];
        uint64_t v40 = v15;
        _MBLog();
      }

      [v9 close:0];
      unsigned __int8 v22 = 0;
    }

    id v30 = [(MBSQLiteDB *)self _openPQLConnectionWithFlags:v7 error:a5];
    if (!v30)
    {
LABEL_31:

      uint64_t v9 = 0;
LABEL_32:
      id v13 = 0;
      goto LABEL_33;
    }
    uint64_t v9 = v30;
    [v30 setUserVersion:0];
  }
  schemaUpgrades = self->_schemaUpgrades;
  if (schemaUpgrades
    && ![v9 performSchemaUpgrades:schemaUpgrades isReadOnly:v7 & 1 error:a5])
  {
    goto LABEL_32;
  }
  if (v6)
  {
    uint64_t v32 = +[MBBehaviorOptions sharedOptions];
    [v32 sqlBatchTime];
    double v34 = v33;

    v35 = +[MBBehaviorOptions sharedOptions];
    id v36 = [v35 sqlBatchCount];

    [v9 useBatchingWithDelay:v36 changeCount:v34];
  }
  [v9 useSerialQueue];
  unsigned int v37 = [v9 serialQueue];
  dispatch_queue_set_specific(v37, self, self, 0);

  uint64_t v9 = v9;
  id v13 = v9;
LABEL_33:

  return v13;
}

- (id)_openPQLConnectionWithFlags:(int)a3 error:(id *)a4
{
  if (!a4) {
    sub_10009A0A8();
  }
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  uint64_t v7 = self->_path;
  if (!v7) {
    sub_10009A0D4();
  }
  v8 = v7;
  uint64_t v9 = +[NSURL fileURLWithPath:v7];
  if (!v9) {
    sub_10009A100();
  }
  int v10 = (void *)v9;
  objc_initWeak(&location, self);
  id v11 = objc_alloc_init((Class)PQLConnection);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100056F8C;
  v30[3] = &unk_1000F1D60;
  objc_copyWeak(&v32, &location);
  id v12 = v8;
  id v31 = v12;
  [v11 setSqliteErrorHandler:v30];
  id v13 = [v11 sqliteErrorHandler];
  [v11 setAutoRollbackHandler:v13];

  id v14 = objc_alloc((Class)NSString);
  unsigned __int8 v15 = (objc_class *)objc_opt_class();
  id v16 = [v14 initWithFormat:@"%s-%p", class_getName(v15), self];
  [v11 setLabel:v16];

  unsigned __int8 v17 = +[MBBehaviorOptions sharedOptions];
  [v11 setTraced:[v17 sqlTrace]];

  [v11 setCrashIfUsedAfterClose:1];
  [v11 setStatementCacheMaxCount:30];
  id v29 = 0;
  unsigned __int8 v18 = [v11 openAtURL:v10 withFlags:v5 error:&v29];
  id v19 = v29;
  id v20 = v19;
  if ((v18 & 1) == 0)
  {
    if (!v19)
    {
      BOOL v21 = "localError";
      int v22 = 400;
      goto LABEL_27;
    }
    if ((v5 & 1) != 0 && [v19 code] == (id)14)
    {
      v23 = [v20 domain];
      unsigned int v24 = [v23 isEqualToString:PQLSqliteErrorDomain];

      if (v24)
      {
        uint64_t v25 = [(MBSQLiteDB *)self path];
        uint64_t v26 = +[MBError errorWithCode:4, v20, @"Can't find the database: %@", v25 error format];

        id v20 = (id)v26;
      }
    }
LABEL_17:

    if (v20)
    {
      id v20 = v20;
      id v11 = 0;
      *a4 = v20;
      goto LABEL_19;
    }
    BOOL v21 = "pdb || localError";
    int v22 = 415;
LABEL_27:
    __assert_rtn("-[MBSQLiteDB _openPQLConnectionWithFlags:error:]", "MBSQLiteDB.m", v22, v21);
  }
  if ((v5 & 1) == 0 && ([v11 setupPragmas] & 1) == 0)
  {
    uint64_t v27 = [v11 lastError];

    id v20 = (id)v27;
    if (!v27)
    {
      id v20 = +[MBError errorWithCode:1 format:@"setupPragmas failed"];
    }
    [v11 close:0];
    goto LABEL_17;
  }
  if (!v11)
  {
    BOOL v21 = "pdb";
    int v22 = 411;
    goto LABEL_27;
  }
LABEL_19:

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v11;
}

- (BOOL)_removeDatabaseAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    sub_10009A12C();
  }
  if (!a4) {
    sub_10009A158();
  }
  uint64_t v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Deleting DB at %@", buf, 0xCu);
    id v29 = v7;
    _MBLog();
  }

  uint64_t v9 = +[NSFileManager defaultManager];
  if ([v9 fileExistsAtPath:v7])
  {
    id v36 = 0;
    unsigned __int8 v10 = [v9 removeItemAtPath:v7 error:&v36];
    id v11 = v36;
    id v12 = v11;
    if ((v10 & 1) == 0)
    {
      if ([v11 code] != (id)4
        || ([v12 domain],
            id v13 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v14 = [v13 isEqualToString:NSCocoaErrorDomain],
            v13,
            (v14 & 1) == 0))
      {
        unsigned __int8 v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v39 = v7;
          __int16 v40 = 2112;
          id v41 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
          _MBLog();
        }

        id v12 = v12;
        BOOL v16 = 0;
        *a4 = v12;
        goto LABEL_31;
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  MBSQLiteJournalSuffixes();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v18)
  {
    id v19 = v18;
    id v30 = a4;
    uint64_t v20 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        int v22 = [v7 stringByAppendingString:*(void *)(*((void *)&v32 + 1) + 8 * i) v29];

        if ([v9 fileExistsAtPath:v22])
        {
          id v31 = 0;
          unsigned __int8 v23 = [v9 removeItemAtPath:v22 error:&v31];
          id v24 = v31;
          id v12 = v24;
          if ((v23 & 1) == 0)
          {
            if ([v24 code] != (id)4
              || ([v12 domain],
                  uint64_t v25 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v26 = [v25 isEqualToString:NSCocoaErrorDomain],
                  v25,
                  (v26 & 1) == 0))
            {
              uint64_t v27 = MBGetDefaultLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v39 = v22;
                __int16 v40 = 2112;
                id v41 = v12;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
                _MBLog();
              }

              id v12 = v12;
              id *v30 = v12;

              BOOL v16 = 0;
              goto LABEL_30;
            }
          }
        }
        else
        {
          id v12 = 0;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_30:

LABEL_31:
  return v16;
}

- (BOOL)performWithConnection:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  unsigned __int8 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = sub_100055078;
  id v17 = sub_100055088;
  id v18 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100057820;
  v8[3] = &unk_1000F1D88;
  uint64_t v9 = self;
  id v11 = &v13;
  id v12 = &v19;
  id v5 = a3;
  id v10 = v5;
  [(MBSQLiteDB *)v9 _perform:v8];
  if (a4 && !*((unsigned char *)v20 + 24)) {
    *a4 = (id) v14[5];
  }
  BOOL v6 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (void)_perform:(id)a3
{
  block = (void (**)(void))a3;
  specific = (MBSQLiteDB *)dispatch_get_specific(self);
  id v5 = [(PQLConnection *)self->_pdb serialQueue];
  BOOL v6 = v5;
  if (specific == self)
  {
    dispatch_assert_queue_V2(v5);

    block[2]();
  }
  else
  {
    dispatch_assert_queue_not_V2(v5);

    uint64_t v7 = [(PQLConnection *)self->_pdb serialQueue];
    dispatch_sync(v7, block);
  }
}

- (BOOL)groupInTransaction:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100057A44;
  v8[3] = &unk_1000F1DB0;
  id v9 = a3;
  id v6 = v9;
  LOBYTE(a4) = [(MBSQLiteDB *)self performWithConnection:v8 error:a4];

  return (char)a4;
}

- (id)_invalidatedError
{
  path = self->_path;
  v3 = (objc_class *)objc_opt_class();
  return +[MBError errorWithCode:16, path, @"%s database is closed", class_getName(v3) path format];
}

- (BOOL)executeWithError:(id *)a3 sql:(id)a4
{
  id v11 = &v12;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100057B60;
  v8[3] = &unk_1000F1DD8;
  id v9 = a4;
  id v10 = &v11;
  id v6 = v9;
  LOBYTE(a3) = [(MBSQLiteDB *)self performWithConnection:v8 error:a3];

  return (char)a3;
}

- (id)fetchObjectOfClass:(Class)a3 error:(id *)a4 sql:(id)a5
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100055078;
  uint64_t v21 = sub_100055088;
  id v22 = 0;
  BOOL v16 = &v24;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100057D1C;
  v11[3] = &unk_1000F1E00;
  uint64_t v13 = &v17;
  Class v14 = a3;
  id v7 = a5;
  id v12 = v7;
  uint64_t v15 = &v16;
  if ([(MBSQLiteDB *)self performWithConnection:v11 error:a4]) {
    v8 = (void *)v18[5];
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  _Block_object_dispose(&v17, 8);

  return v9;
}

- (unint64_t)fetchCountWithError:(id *)a3 sql:(id)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100055078;
  id v22 = sub_100055088;
  id v23 = 0;
  uint64_t v17 = &v24;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100057F14;
  uint64_t v13 = &unk_1000F1E28;
  uint64_t v15 = &v18;
  id v6 = a4;
  id v14 = v6;
  BOOL v16 = &v17;
  if ([(MBSQLiteDB *)self performWithConnection:&v10 error:a3]
    && (id v7 = (void *)v19[5]) != 0)
  {
    unint64_t v8 = [(unint64_t)[v7 unsignedIntegerValue:v10, v11, v12, v13]];
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (BOOL)executeStatements:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100058064;
  v8[3] = &unk_1000F1E50;
  id v9 = a3;
  id v6 = v9;
  LOBYTE(a4) = [(MBSQLiteDB *)self performWithConnection:v8 error:a4];

  return (char)a4;
}

- (id)fetchSQL:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100055078;
  uint64_t v21 = sub_100055088;
  id v22 = 0;
  BOOL v16 = &v24;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000581F4;
  v12[3] = &unk_1000F1E28;
  id v14 = &v17;
  id v4 = a3;
  id v13 = v4;
  uint64_t v15 = &v16;
  id v11 = 0;
  unsigned __int8 v5 = [(MBSQLiteDB *)self performWithConnection:v12 error:&v11];
  id v6 = v11;
  if ((v5 & 1) == 0)
  {
    id v7 = (void *)v18[5];
    v18[5] = 0;
  }
  unint64_t v8 = [MBSQLiteResultSet alloc];
  id v9 = [(MBSQLiteResultSet *)v8 _initWithDatabase:self creationError:v6 resultSet:v18[5]];

  _Block_object_dispose(&v17, 8);

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (int)schemaCurrentVersion
{
  return self->_schemaCurrentVersion;
}

- (int)schemaMinDatabaseVersionForUpgrade
{
  return self->_schemaMinDatabaseVersionForUpgrade;
}

- (NSArray)schemaUpgrades
{
  return self->_schemaUpgrades;
}

- (PQLConnection)pdb
{
  return self->_pdb;
}

- (void)setPdb:(id)a3
{
}

- (OS_dispatch_queue)sharedQueue
{
  return self->_sharedQueue;
}

- (void)setSharedQueue:(id)a3
{
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)shouldDeleteOnFailureToOpen
{
  return self->_shouldDeleteOnFailureToOpen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_pdb, 0);
  objc_storeStrong((id *)&self->_schemaUpgrades, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end