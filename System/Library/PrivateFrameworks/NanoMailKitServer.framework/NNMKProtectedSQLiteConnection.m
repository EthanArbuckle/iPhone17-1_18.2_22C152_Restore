@interface NNMKProtectedSQLiteConnection
- (BOOL)protectedDatabaseAttached;
- (NNMKProtectedSQLiteConnection)initWithUnprotectedDatabaseFileName:(id)a3 protectedDatabaseFileName:(id)a4 inDirectory:(id)a5 protectedDatabaseName:(id)a6 errorCode:(int *)a7;
- (NSString)protectedDatabaseName;
- (NSString)protectedDatabasePath;
- (id)_vfsModuleName;
- (int)attachProtectedDatabase;
- (void)dettachProtectedDatabase;
- (void)setProtectedDatabaseName:(id)a3;
- (void)setProtectedDatabasePath:(id)a3;
@end

@implementation NNMKProtectedSQLiteConnection

- (NNMKProtectedSQLiteConnection)initWithUnprotectedDatabaseFileName:(id)a3 protectedDatabaseFileName:(id)a4 inDirectory:(id)a5 protectedDatabaseName:(id)a6 errorCode:(int *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 stringByAppendingPathComponent:a3];
  v20.receiver = self;
  v20.super_class = (Class)NNMKProtectedSQLiteConnection;
  v16 = [(NNMKSQLiteConnection *)&v20 initWithPath:v15 errorCode:a7];
  if (v16)
  {
    uint64_t v17 = [v13 stringByAppendingPathComponent:v12];
    protectedDatabasePath = v16->_protectedDatabasePath;
    v16->_protectedDatabasePath = (NSString *)v17;

    objc_storeStrong((id *)&v16->_protectedDatabaseName, a6);
    v16->_protectedDatabaseAttached = 0;
  }

  return v16;
}

- (int)attachProtectedDatabase
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_protectedDatabaseAttached) {
    return 0;
  }
  v4 = NSString;
  protectedDatabasePath = self->_protectedDatabasePath;
  v6 = [(NNMKProtectedSQLiteConnection *)self _vfsModuleName];
  v7 = [v4 stringWithFormat:@"ATTACH DATABASE \"file:%@?vfs=%@\" AS %@", protectedDatabasePath, v6, self->_protectedDatabaseName];

  int v2 = [(NNMKSQLiteConnection *)self executeSQL:v7];
  if (v2
    || (objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA %@.journal_mode = WAL;",
          self->_protectedDatabaseName),
        v8 = objc_claimAutoreleasedReturnValue(),
        int v2 = [(NNMKSQLiteConnection *)self executeSQL:v8],
        v8,
        v2))
  {
    v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
    {
      id v12 = self->_protectedDatabasePath;
      id v13 = v9;
      id v14 = [(NNMKSQLiteConnection *)self lastErrorMessage];
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      __int16 v17 = 1024;
      int v18 = v2;
      __int16 v19 = 2114;
      objc_super v20 = v14;
      _os_log_error_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_ERROR, "Error attaching protected database. Path: %{public}@, Error Code: %d, Error Message: %{public}@", buf, 0x1Cu);
    }
  }
  else
  {
    self->_protectedDatabaseAttached = 1;
    v11 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v11, OS_LOG_TYPE_DEFAULT, "Protected database attached.", buf, 2u);
      int v2 = 0;
    }
  }

  return v2;
}

- (void)dettachProtectedDatabase
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = a1;
  v6 = [a2 lastErrorMessage];
  v7[0] = 67109378;
  v7[1] = a3;
  __int16 v8 = 2114;
  v9 = v6;
  _os_log_error_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_ERROR, "Error detaching protected database (Error Code: %d, Error Message: %{public}@).", (uint8_t *)v7, 0x12u);
}

- (id)_vfsModuleName
{
  uint64_t v3 = [@"VFS-nanomaild-Protected" UTF8String];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__NNMKProtectedSQLiteConnection__vfsModuleName__block_invoke;
  v5[3] = &unk_264E99F98;
  v5[4] = self;
  v5[5] = v3;
  if (_vfsModuleName_vfsCreationOnceToken != -1) {
    dispatch_once(&_vfsModuleName_vfsCreationOnceToken, v5);
  }
  return @"VFS-nanomaild-Protected";
}

uint64_t __47__NNMKProtectedSQLiteConnection__vfsModuleName__block_invoke(uint64_t a1)
{
  __defaultVFS = (uint64_t)sqlite3_vfs_find(0);
  int v2 = malloc_type_calloc(1uLL, 0xA8uLL, 0x10F0040C767261AuLL);
  __protectionVFS = (uint64_t)v2;
  uint64_t v3 = __defaultVFS;
  long long v5 = *(_OWORD *)(__defaultVFS + 16);
  long long v4 = *(_OWORD *)(__defaultVFS + 32);
  *int v2 = *(_OWORD *)__defaultVFS;
  v2[1] = v5;
  v2[2] = v4;
  long long v6 = *(_OWORD *)(v3 + 96);
  long long v8 = *(_OWORD *)(v3 + 48);
  long long v7 = *(_OWORD *)(v3 + 64);
  v2[5] = *(_OWORD *)(v3 + 80);
  v2[6] = v6;
  v2[3] = v8;
  v2[4] = v7;
  long long v10 = *(_OWORD *)(v3 + 128);
  long long v9 = *(_OWORD *)(v3 + 144);
  long long v11 = *(_OWORD *)(v3 + 112);
  *((void *)v2 + 20) = *(void *)(v3 + 160);
  v2[8] = v10;
  v2[9] = v9;
  v2[7] = v11;
  *((_DWORD *)v2 + 1) = *(_DWORD *)(v3 + 4);
  *((void *)v2 + 3) = strdup(*(const char **)(a1 + 40));
  *(_DWORD *)int v2 = 1;
  *((void *)v2 + 5) = __protectedVFSxOpen;
  *((void *)v2 + 4) = *(void *)(a1 + 32);
  return sqlite3_vfs_register((sqlite3_vfs *)v2, 0);
}

- (BOOL)protectedDatabaseAttached
{
  return self->_protectedDatabaseAttached;
}

- (NSString)protectedDatabasePath
{
  return self->_protectedDatabasePath;
}

- (void)setProtectedDatabasePath:(id)a3
{
}

- (NSString)protectedDatabaseName
{
  return self->_protectedDatabaseName;
}

- (void)setProtectedDatabaseName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedDatabaseName, 0);
  objc_storeStrong((id *)&self->_protectedDatabasePath, 0);
}

@end