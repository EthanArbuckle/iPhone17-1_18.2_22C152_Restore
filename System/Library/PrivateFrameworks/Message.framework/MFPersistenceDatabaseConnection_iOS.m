@interface MFPersistenceDatabaseConnection_iOS
- (BOOL)performWithOptions:(unint64_t)a3 transactionError:(id *)a4 block:(id)a5;
- (int)configureSQLConnection;
- (int64_t)transactionTypeForWriting;
- (uint64_t)_handleProtectedDataIOError;
- (void)_handleBusyError;
- (void)_handleCorruptDatabase;
- (void)_handleFullDatabase;
- (void)_handleIOError;
- (void)_handleInvalidDatabaseIOError;
- (void)_handleProtectedDataIOError;
- (void)_logFileSystemStats;
- (void)dealloc;
- (void)handleSQLResult:(int)a3 message:(id)a4;
@end

@implementation MFPersistenceDatabaseConnection_iOS

- (BOOL)performWithOptions:(unint64_t)a3 transactionError:(id *)a4 block:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MFPersistenceDatabaseConnection_iOS;
  BOOL v9 = [(EDPersistenceDatabaseConnection *)&v14 performWithOptions:a3 transactionError:a4 block:v8];
  if (!v9)
  {
    v10 = +[EDPersistenceDatabaseConnection log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Resetting mailbox cache after database transaction failed", v13, 2u);
    }

    v11 = +[MFMailMessageLibrary defaultInstance];
    [v11 reloadMailboxCacheWithConnection:self];
  }
  return v9;
}

- (int64_t)transactionTypeForWriting
{
  return 1;
}

- (void)handleSQLResult:(int)a3 message:(id)a4
{
  id v7 = a4;
  v6 = [(EDPersistenceDatabaseConnection *)self sqlDB];
  if ((a3 - 100) >= 2 && a3) {
    MFLogSQLiteError(v6, a3, v7);
  }
  switch((char)a3)
  {
    case 5:
      -[MFPersistenceDatabaseConnection_iOS _handleBusyError](self);
      break;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
      break;
    case 10:
      if ([(EDPersistenceDatabaseConnection *)self protectedDatabaseAttached])
      {
        -[MFPersistenceDatabaseConnection_iOS _handleProtectedDataIOError]((uint64_t)self);
      }
      else if ([(EDPersistenceDatabaseConnection *)self sqlDB])
      {
        -[MFPersistenceDatabaseConnection_iOS _handleIOError](self);
      }
      else
      {
        -[MFPersistenceDatabaseConnection_iOS _handleInvalidDatabaseIOError](self);
      }
      break;
    case 11:
      goto LABEL_7;
    case 13:
      -[MFPersistenceDatabaseConnection_iOS _handleFullDatabase](self);
      break;
    default:
      if (a3 == 26) {
LABEL_7:
      }
        -[MFPersistenceDatabaseConnection_iOS _handleCorruptDatabase](self);
      break;
  }
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  ICUSearchContext = self->_ICUSearchContext;
  if (ICUSearchContext) {
    freeICUSearchContext(ICUSearchContext, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFPersistenceDatabaseConnection_iOS;
  [(EDPersistenceDatabaseConnection *)&v4 dealloc];
}

- (int)configureSQLConnection
{
  v3 = [(EDPersistenceDatabaseConnection *)self sqlDB];
  int function = sqlite3_extended_result_codes(v3, 1);
  if (function)
  {
    v5 = @"enabling extended error codes";
  }
  else
  {
    inited = initICUSearchContext();
    self->_ICUSearchContext = inited;
    int function = sqlite3_create_function(v3, "icusearch", 3, 1, inited, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))ICUSearch, 0, 0);
    if (function)
    {
      v5 = @"creating custom icusearch function";
    }
    else
    {
      id v7 = objc_alloc_init(_MFSearchMatcherContext);
      CPSearchContext = self->_CPSearchContext;
      self->_CPSearchContext = v7;

      int function = sqlite3_create_function(v3, "cpsearch", 3, 1, self->_CPSearchContext, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))CPSearch, 0, 0);
      if (function)
      {
        v5 = @"creating custom cpsearch function";
      }
      else
      {
        int function = sqlite3_exec_retry(v3, "PRAGMA cache_size = 1000;", 0, 0, 0);
        if (function)
        {
          v5 = @"setting cache_size";
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)MFPersistenceDatabaseConnection_iOS;
          int function = [(EDPersistenceDatabaseConnection *)&v12 configureSQLConnection];
          if (!function)
          {
            v5 = 0;
            goto LABEL_12;
          }
          BOOL v9 = NSString;
          v10 = [(EDPersistenceDatabaseConnection *)self fullPath];
          v5 = [v9 stringWithFormat:@"configuring sql connection for %@", v10];
        }
      }
    }
  }
  MFLogSQLiteError(v3, function, v5);
LABEL_12:

  return function;
}

- (void)_handleCorruptDatabase
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_1A7EFF000, v0, v1, "Abort if mobilemail: database corrupt", v2, v3, v4, v5, v6);
}

- (void)_handleFullDatabase
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_1A7EFF000, v0, v1, "Abort if mobilemail: file system out of space", v2, v3, v4, v5, v6);
}

- (uint64_t)_handleProtectedDataIOError
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = (void *)result;
  uint64_t v2 = [MEMORY[0x1E4F60D58] currentDevice];
  if ([v2 isInternal])
  {

LABEL_5:
    uint64_t v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = EFContentProtectionDumpDiagnosticState();
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "#Warning %@", (uint8_t *)&v9, 0xCu);
    }
    uint8_t v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[MFPersistenceDatabaseConnection_iOS _handleProtectedDataIOError]();
    }

    goto LABEL_10;
  }
  char v3 = EFIsSeedBuild();

  if (v3) {
    goto LABEL_5;
  }
LABEL_10:
  id v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    MEMORY[0x1AD0E24D0]();
    id v8 = EFContentProtectionStateDescription();
    [(MFPersistenceDatabaseConnection_iOS *)v8 _handleProtectedDataIOError];
  }

  return [v1 setHadIOError:1];
}

- (void)_handleInvalidDatabaseIOError
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_1A7EFF000, v0, v1, "Abort if mobilemail: database I/O error, missing sqlDB pointer", v2, v3, v4, v5, v6);
}

- (void)_handleIOError
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_1A7EFF000, v0, v1, "Abort if mobilemail: database I/O error", v2, v3, v4, v5, v6);
}

- (void)_handleBusyError
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_1A7EFF000, v0, v1, "Abort if mobilemail: SQLITE_BUSY", v2, v3, v4, v5, v6);
}

- (void)_logFileSystemStats
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v2 = MFMailDirectory();
    id v8 = 0;
    uint64_t v3 = [v1 attributesOfFileSystemForPath:v2 error:&v8];
    id v4 = v8;

    if (v3)
    {
      uint64_t v5 = [v3 objectForKey:*MEMORY[0x1E4F283B0]];
      uint8_t v6 = [v3 objectForKey:*MEMORY[0x1E4F283A0]];
      id v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v10 = v6;
        __int16 v11 = 2112;
        objc_super v12 = v5;
        _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "#Warning %@/%@ bytes (free/total)", buf, 0x16u);
      }
    }
    else
    {
      if (!v4) {
        goto LABEL_7;
      }
      uint64_t v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "#Warning failure to get file system size: %@", buf, 0xCu);
      }
    }

LABEL_7:
  }
}

- (void)_handleProtectedDataIOError
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_1A7EFF000, v0, v1, "Access to protected data went away during transaction.", v2, v3, v4, v5, v6);
}

@end