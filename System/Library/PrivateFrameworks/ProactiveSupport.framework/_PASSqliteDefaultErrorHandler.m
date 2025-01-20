@interface _PASSqliteDefaultErrorHandler
- (BOOL)_abortDueToSqliteError:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_ABORT:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_ABORT_ROLLBACK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_AUTH:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_AUTH_USER:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_BUSY:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_BUSY_RECOVERY:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_BUSY_SNAPSHOT:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CANTOPEN:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CANTOPEN_CONVPATH:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CANTOPEN_FULLPATH:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CANTOPEN_ISDIR:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CANTOPEN_NOTEMPDIR:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_CHECK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_COMMITHOOK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_FOREIGNKEY:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_FUNCTION:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_NOTNULL:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_PRIMARYKEY:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_ROWID:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_TRIGGER:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_UNIQUE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CONSTRAINT_VTAB:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CORRUPT:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_CORRUPT_VTAB:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_EMPTY:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_ERROR:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_FORMAT:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_FULL:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_INTERNAL:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_INTERRUPT:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_ACCESS:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_AUTH:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_BLOCKED:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_CHECKRESERVEDLOCK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_CLOSE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_CONVPATH:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_DELETE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_DELETE_NOENT:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_DIR_CLOSE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_DIR_FSYNC:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_FSTAT:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_FSYNC:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_GETTEMPPATH:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_LOCK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_MMAP:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_NOMEM:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_RDLOCK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_READ:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_SEEK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_SHMLOCK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_SHMMAP:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_SHMOPEN:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_SHMSIZE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_SHORT_READ:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_TRUNCATE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_UNLOCK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_VNODE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_IOERR_WRITE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_LOCKED:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_LOCKED_SHAREDCACHE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_MISMATCH:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_MISUSE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_NOLFS:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_NOMEM:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_NOTADB:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_NOTFOUND:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_NOTICE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_NOTICE_RECOVER_ROLLBACK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_NOTICE_RECOVER_WAL:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_PERM:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_PROTOCOL:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_RANGE:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_READONLY:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_READONLY_CANTLOCK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_READONLY_DBMOVED:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_READONLY_RECOVERY:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_READONLY_ROLLBACK:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_SCHEMA:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_TOOBIG:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_WARNING:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_SQLITE_WARNING_AUTOINDEX:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)_handle_UNKNOWN_ERROR:(id)a3 onError:(id)a4 db:(id)a5;
- (BOOL)handleSqliteError:(int)a3 error:(id)a4 onError:(id)a5 db:(id)a6;
@end

@implementation _PASSqliteDefaultErrorHandler

- (BOOL)_handle_SQLITE_AUTH_USER:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_WARNING_AUTOINDEX:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_NOTICE_RECOVER_ROLLBACK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_NOTICE_RECOVER_WAL:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_ROWID:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_VTAB:(id)a3 onError:(id)a4 db:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_CONSTRAINT_VTAB error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(2);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_UNIQUE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_TRIGGER:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_PRIMARYKEY:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_NOTNULL:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_FUNCTION:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_FOREIGNKEY:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_COMMITHOOK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_CHECK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_ABORT_ROLLBACK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_READONLY_DBMOVED:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_READONLY_ROLLBACK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_READONLY_CANTLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_READONLY_RECOVERY:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CORRUPT_VTAB:(id)a3 onError:(id)a4 db:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_CORRUPT_VTAB error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(2);
}

- (BOOL)_handle_SQLITE_BUSY_SNAPSHOT:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_BUSY_RECOVERY:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_LOCKED_SHAREDCACHE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_WARNING:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_NOTICE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_RANGE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_FORMAT:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_AUTH:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_NOLFS:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_MISUSE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_MISMATCH:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CONSTRAINT:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_TOOBIG:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_SCHEMA:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_EMPTY:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_PROTOCOL:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_NOTFOUND:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_INTERRUPT:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_READONLY:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_NOMEM:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_LOCKED:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_BUSY:(id)a3 onError:(id)a4 db:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_BUSY error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(3);
}

- (BOOL)_handle_SQLITE_ABORT:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_PERM:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_INTERNAL:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_ERROR:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_AUTH:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_VNODE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_CONVPATH:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_GETTEMPPATH:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_MMAP:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_DELETE_NOENT:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_SEEK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_SHMMAP:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_SHMLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_SHMOPEN:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_DIR_CLOSE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_CLOSE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_LOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_CHECKRESERVEDLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_ACCESS:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_NOMEM:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_BLOCKED:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_DELETE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_RDLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_UNLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_FSTAT:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_TRUNCATE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_DIR_FSYNC:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_FSYNC:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_WRITE:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_READ:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_IOERR_SHMSIZE:(id)a3 onError:(id)a4 db:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 userInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"sql"];
  int v13 = [v12 containsString:@"PRAGMA journal_mode"];

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_IOERR_SHMSIZE error: %@", (uint8_t *)&v16, 0xCu);
    }
    _exit(1);
  }
  BOOL v14 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:v8 onError:v9 db:v10];

  return v14;
}

- (BOOL)_handle_SQLITE_IOERR:(id)a3 onError:(id)a4 db:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_IOERR error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(2);
}

- (BOOL)_handle_SQLITE_CANTOPEN_CONVPATH:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CANTOPEN:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CANTOPEN_FULLPATH:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CANTOPEN:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CANTOPEN_ISDIR:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CANTOPEN:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CANTOPEN_NOTEMPDIR:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CANTOPEN:a3 onError:a4 db:a5];
}

- (BOOL)_handle_SQLITE_CANTOPEN:(id)a3 onError:(id)a4 db:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (*__error() == 28) {
    [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_FULL:v8 onError:v9 db:v10];
  }
  BOOL v11 = [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:v8 onError:v9 db:v10];

  return v11;
}

- (BOOL)_handle_SQLITE_IOERR_SHORT_READ:(id)a3 onError:(id)a4 db:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v10 isInMemory] & 1) == 0) {
    [v10 placeCorruptionMarker];
  }
  BOOL v11 = [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:v8 onError:v9 db:v10];

  return v11;
}

- (BOOL)_handle_SQLITE_NOTADB:(id)a3 onError:(id)a4 db:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v10 isInMemory] & 1) == 0) {
    [v10 placeCorruptionMarker];
  }
  BOOL v11 = [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:v8 onError:v9 db:v10];

  return v11;
}

- (BOOL)_handle_SQLITE_CORRUPT:(id)a3 onError:(id)a4 db:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v10 isInMemory] & 1) == 0) {
    [v10 placeCorruptionMarker];
  }
  BOOL v11 = [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:v8 onError:v9 db:v10];

  return v11;
}

- (BOOL)_handle_SQLITE_FULL:(id)a3 onError:(id)a4 db:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_FULL error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(1);
}

- (BOOL)_handle_UNKNOWN_ERROR:(id)a3 onError:(id)a4 db:(id)a5
{
  return [(_PASSqliteDefaultErrorHandler *)self _abortDueToSqliteError:a3 onError:a4 db:a5];
}

- (BOOL)_abortDueToSqliteError:(id)a3 onError:(id)a4 db:(id)a5
{
  id v7 = a3;
  id v8 = (uint64_t (**)(id, id))a4;
  id v9 = a5;
  if (!v8)
  {
    BOOL v14 = (void *)MEMORY[0x1E4F1CA00];
    v15 = [v7 domain];
    int v16 = [v7 userInfo];
    id v17 = [v16 objectForKeyedSubscript:@"reason"];
    uint64_t v18 = [v7 userInfo];
    id v19 = [v14 exceptionWithName:v15 reason:v17 userInfo:v18];

    objc_exception_throw(v19);
  }
  int v10 = v9;
  id v11 = (void *)MEMORY[0x1A62450A0]();
  BOOL v12 = (v8[2](v8, v7) & 1) == 0;

  return v12;
}

- (BOOL)handleSqliteError:(int)a3 error:(id)a4 onError:(id)a5 db:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (a3 > 530)
  {
    if (a3 > 2569)
    {
      if (a3 > 4873)
      {
        if (a3 > 6153)
        {
          if (a3 <= 6665)
          {
            if (a3 == 6154)
            {
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_MMAP:v10 onError:v11 db:v12];
              goto LABEL_148;
            }
            if (a3 == 6410)
            {
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_GETTEMPPATH:v10 onError:v11 db:v12];
              goto LABEL_148;
            }
          }
          else
          {
            switch(a3)
            {
              case 6666:
                BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_CONVPATH:v10 onError:v11 db:v12];
                goto LABEL_148;
              case 6922:
                BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_VNODE:v10 onError:v11 db:v12];
                goto LABEL_148;
              case 7178:
                BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_AUTH:v10 onError:v11 db:v12];
                goto LABEL_148;
            }
          }
        }
        else if (a3 <= 5385)
        {
          if (a3 == 4874)
          {
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_SHMSIZE:v10 onError:v11 db:v12];
            goto LABEL_148;
          }
          if (a3 == 5130)
          {
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_SHMLOCK:v10 onError:v11 db:v12];
            goto LABEL_148;
          }
        }
        else
        {
          switch(a3)
          {
            case 5386:
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_SHMMAP:v10 onError:v11 db:v12];
              goto LABEL_148;
            case 5642:
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_SEEK:v10 onError:v11 db:v12];
              goto LABEL_148;
            case 5898:
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_DELETE_NOENT:v10 onError:v11 db:v12];
              goto LABEL_148;
          }
        }
      }
      else if (a3 > 3593)
      {
        if (a3 <= 4105)
        {
          if (a3 == 3594)
          {
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_CHECKRESERVEDLOCK:v10 onError:v11 db:v12];
            goto LABEL_148;
          }
          if (a3 == 3850)
          {
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_LOCK:v10 onError:v11 db:v12];
            goto LABEL_148;
          }
        }
        else
        {
          switch(a3)
          {
            case 4106:
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_CLOSE:v10 onError:v11 db:v12];
              goto LABEL_148;
            case 4362:
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_DIR_CLOSE:v10 onError:v11 db:v12];
              goto LABEL_148;
            case 4618:
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_SHMOPEN:v10 onError:v11 db:v12];
              goto LABEL_148;
          }
        }
      }
      else if (a3 <= 2825)
      {
        if (a3 == 2570)
        {
          BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_DELETE:v10 onError:v11 db:v12];
          goto LABEL_148;
        }
        if (a3 == 2579)
        {
          BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_ROWID:v10 onError:v11 db:v12];
          goto LABEL_148;
        }
      }
      else
      {
        switch(a3)
        {
          case 2826:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_BLOCKED:v10 onError:v11 db:v12];
            goto LABEL_148;
          case 3082:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_NOMEM:v10 onError:v11 db:v12];
            goto LABEL_148;
          case 3338:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_ACCESS:v10 onError:v11 db:v12];
            goto LABEL_148;
        }
      }
    }
    else if (a3 > 1289)
    {
      if (a3 > 1810)
      {
        if (a3 <= 2066)
        {
          if (a3 == 1811)
          {
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_TRIGGER:v10 onError:v11 db:v12];
            goto LABEL_148;
          }
          if (a3 == 2058)
          {
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_UNLOCK:v10 onError:v11 db:v12];
            goto LABEL_148;
          }
        }
        else
        {
          switch(a3)
          {
            case 2067:
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_UNIQUE:v10 onError:v11 db:v12];
              goto LABEL_148;
            case 2314:
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_RDLOCK:v10 onError:v11 db:v12];
              goto LABEL_148;
            case 2323:
              BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_VTAB:v10 onError:v11 db:v12];
              goto LABEL_148;
          }
        }
      }
      else if (a3 <= 1545)
      {
        if (a3 == 1290)
        {
          BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_DIR_FSYNC:v10 onError:v11 db:v12];
          goto LABEL_148;
        }
        if (a3 == 1299)
        {
          BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_NOTNULL:v10 onError:v11 db:v12];
          goto LABEL_148;
        }
      }
      else
      {
        switch(a3)
        {
          case 1546:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_TRUNCATE:v10 onError:v11 db:v12];
            goto LABEL_148;
          case 1555:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_PRIMARYKEY:v10 onError:v11 db:v12];
            goto LABEL_148;
          case 1802:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_FSTAT:v10 onError:v11 db:v12];
            goto LABEL_148;
        }
      }
    }
    else if (a3 > 786)
    {
      if (a3 <= 1033)
      {
        if (a3 == 787)
        {
          BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_FOREIGNKEY:v10 onError:v11 db:v12];
          goto LABEL_148;
        }
        if (a3 == 1032)
        {
          BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_READONLY_DBMOVED:v10 onError:v11 db:v12];
          goto LABEL_148;
        }
      }
      else
      {
        switch(a3)
        {
          case 1034:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_FSYNC:v10 onError:v11 db:v12];
            goto LABEL_148;
          case 1038:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CANTOPEN_CONVPATH:v10 onError:v11 db:v12];
            goto LABEL_148;
          case 1043:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_FUNCTION:v10 onError:v11 db:v12];
            goto LABEL_148;
        }
      }
    }
    else if (a3 <= 775)
    {
      if (a3 == 531)
      {
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_COMMITHOOK:v10 onError:v11 db:v12];
        goto LABEL_148;
      }
      if (a3 == 539)
      {
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_NOTICE_RECOVER_ROLLBACK:v10 onError:v11 db:v12];
        goto LABEL_148;
      }
    }
    else
    {
      switch(a3)
      {
        case 776:
          BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_READONLY_ROLLBACK:v10 onError:v11 db:v12];
          goto LABEL_148;
        case 778:
          BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_WRITE:v10 onError:v11 db:v12];
          goto LABEL_148;
        case 782:
          BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CANTOPEN_FULLPATH:v10 onError:v11 db:v12];
          goto LABEL_148;
      }
    }
LABEL_143:
    if (a3 >= 0x100)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v16[0] = 67109890;
        v16[1] = a3;
        __int16 v17 = 2080;
        uint64_t v18 = sqlite3_errstr(a3);
        __int16 v19 = 1024;
        int v20 = a3;
        __int16 v21 = 2080;
        v22 = sqlite3_errstr(a3);
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Converting SQLite extended error type %i (%s) to primary error type %i (%s)", (uint8_t *)v16, 0x22u);
      }
      BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self handleSqliteError:a3 error:v10 onError:v11 db:v12];
    }
    else
    {
      BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_UNKNOWN_ERROR:v10 onError:v11 db:v12];
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_ERROR:v10 onError:v11 db:v12];
        break;
      case 2:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_INTERNAL:v10 onError:v11 db:v12];
        break;
      case 3:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_PERM:v10 onError:v11 db:v12];
        break;
      case 4:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_ABORT:v10 onError:v11 db:v12];
        break;
      case 5:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_BUSY:v10 onError:v11 db:v12];
        break;
      case 6:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_LOCKED:v10 onError:v11 db:v12];
        break;
      case 7:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_NOMEM:v10 onError:v11 db:v12];
        break;
      case 8:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_READONLY:v10 onError:v11 db:v12];
        break;
      case 9:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_INTERRUPT:v10 onError:v11 db:v12];
        break;
      case 10:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR:v10 onError:v11 db:v12];
        break;
      case 11:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CORRUPT:v10 onError:v11 db:v12];
        break;
      case 12:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_NOTFOUND:v10 onError:v11 db:v12];
        break;
      case 13:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_FULL:v10 onError:v11 db:v12];
        break;
      case 14:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CANTOPEN:v10 onError:v11 db:v12];
        break;
      case 15:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_PROTOCOL:v10 onError:v11 db:v12];
        break;
      case 16:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_EMPTY:v10 onError:v11 db:v12];
        break;
      case 17:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_SCHEMA:v10 onError:v11 db:v12];
        break;
      case 18:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_TOOBIG:v10 onError:v11 db:v12];
        break;
      case 19:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT:v10 onError:v11 db:v12];
        break;
      case 20:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_MISMATCH:v10 onError:v11 db:v12];
        break;
      case 21:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_MISUSE:v10 onError:v11 db:v12];
        break;
      case 22:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_NOLFS:v10 onError:v11 db:v12];
        break;
      case 23:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_AUTH:v10 onError:v11 db:v12];
        break;
      case 24:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_FORMAT:v10 onError:v11 db:v12];
        break;
      case 25:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_RANGE:v10 onError:v11 db:v12];
        break;
      case 26:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_NOTADB:v10 onError:v11 db:v12];
        break;
      case 27:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_NOTICE:v10 onError:v11 db:v12];
        break;
      case 28:
        BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_WARNING:v10 onError:v11 db:v12];
        break;
      default:
        switch(a3)
        {
          case 261:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_BUSY_RECOVERY:v10 onError:v11 db:v12];
            break;
          case 262:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_LOCKED_SHAREDCACHE:v10 onError:v11 db:v12];
            break;
          case 263:
          case 265:
          case 268:
          case 269:
          case 271:
          case 272:
          case 273:
          case 274:
          case 276:
          case 277:
          case 278:
          case 280:
          case 281:
          case 282:
            goto LABEL_143;
          case 264:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_READONLY_RECOVERY:v10 onError:v11 db:v12];
            break;
          case 266:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_READ:v10 onError:v11 db:v12];
            break;
          case 267:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CORRUPT_VTAB:v10 onError:v11 db:v12];
            break;
          case 270:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CANTOPEN_NOTEMPDIR:v10 onError:v11 db:v12];
            break;
          case 275:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CONSTRAINT_CHECK:v10 onError:v11 db:v12];
            break;
          case 279:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_AUTH_USER:v10 onError:v11 db:v12];
            break;
          case 283:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_NOTICE_RECOVER_WAL:v10 onError:v11 db:v12];
            break;
          case 284:
            BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_WARNING_AUTOINDEX:v10 onError:v11 db:v12];
            break;
          default:
            switch(a3)
            {
              case 516:
                BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_ABORT_ROLLBACK:v10 onError:v11 db:v12];
                break;
              case 517:
                BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_BUSY_SNAPSHOT:v10 onError:v11 db:v12];
                break;
              case 520:
                BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_READONLY_CANTLOCK:v10 onError:v11 db:v12];
                break;
              case 522:
                BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_IOERR_SHORT_READ:v10 onError:v11 db:v12];
                break;
              case 526:
                BOOL v13 = [(_PASSqliteDefaultErrorHandler *)self _handle_SQLITE_CANTOPEN_ISDIR:v10 onError:v11 db:v12];
                break;
              default:
                goto LABEL_143;
            }
            break;
        }
        break;
    }
  }
LABEL_148:
  BOOL v14 = v13;

  return v14;
}

@end