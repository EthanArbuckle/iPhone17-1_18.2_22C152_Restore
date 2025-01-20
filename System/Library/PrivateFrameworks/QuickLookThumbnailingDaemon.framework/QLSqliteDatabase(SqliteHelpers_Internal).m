@interface QLSqliteDatabase(SqliteHelpers_Internal)
- (void)_databaseCorrupted;
@end

@implementation QLSqliteDatabase(SqliteHelpers_Internal)

- (void)_finalizeStatement:()SqliteHelpers_Internal .cold.1(sqlite3 **a1, void *a2)
{
  v2 = *a1;
  id v3 = a2;
  sqlite3_errcode(v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1DDC5E000, v4, v5, "Database - While finalizing statement, error when statement last was executed : (%ld) %s", v6, v7, v8, v9, v10);
}

- (void)_finalizeStatement:()SqliteHelpers_Internal .cold.2(sqlite3 **a1, void *a2)
{
  v2 = *a1;
  id v3 = a2;
  sqlite3_errcode(v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1DDC5E000, v4, v5, "QLSqliteDatabase: While finalizing statement, error when statement last was executed  : (%ld) %s", v6, v7, v8, v9, v10);
}

- (void)_finalizeStatement:()SqliteHelpers_Internal .cold.3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "finalize %p", v2, v3, v4, v5, 0);
}

- (void)_databaseCorrupted
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "corrupted database", v1, 2u);
}

@end