@interface QLSqliteDatabase(SqliteHelpers)
- (void)beginTransaction;
- (void)endTransaction;
@end

@implementation QLSqliteDatabase(SqliteHelpers)

- (void)beginTransaction
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DDC5E000, v0, v1, "Begin transaction error: %s (%i)", v2, v3);
}

- (void)endTransaction
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DDC5E000, v0, v1, "End transaction error: %s (%i)", v2, v3);
}

- (void)executeWithCallback:()SqliteHelpers context:rollbackOnError:sql:arguments:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "sqlite_exec %p %s", v2, v3);
}

- (void)prepareStatement:()SqliteHelpers .cold.1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "prepare statement %p", v2, v3, v4, v5, 0);
}

- (void)prepareStatement:()SqliteHelpers .cold.2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "sqlite3_prepare %p %s", v2, v3);
}

- (void)_cachedStatementForKey:()SqliteHelpers .cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "found cached prepared statement %p", v2, v3, v4, v5, v6);
}

- (void)stepStatement:()SqliteHelpers didReturnData:.cold.1(void *a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  uint64_t v4 = a1;
  uint64_t v5 = [v3 stringWithUTF8String:sqlite3_errstr(a2)];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1DDC5E000, v4, OS_LOG_TYPE_ERROR, "sqliteCrappedOut about to be called for %p with retval %@", v6, 0x16u);
}

- (void)stepStatement:()SqliteHelpers didReturnData:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "stepStatement %p (YES)", v2, v3, v4, v5, v6);
}

- (void)stepStatement:()SqliteHelpers didReturnData:.cold.4(void *a1)
{
  uint64_t v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v1 stringWithUTF8String:sqlite3_errstr(4)];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_1DDC5E000, v4, v5, "stepStatement %p (NO) with retval %@", v6, v7, v8, v9, v10);
}

- (void)setSqliteCacheSize:()SqliteHelpers .cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Database - Setting cache size to %ld pages.", v2, v3, v4, v5, v6);
}

@end