@interface ICAccount(Management)
+ (void)clearAccountForAppleCloudKitTable;
@end

@implementation ICAccount(Management)

+ (void)newAccountWithIdentifier:()Management type:context:persistentStore:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "nil context passed to %@, returning nil", v4, v5, v6, v7, v8);
}

+ (void)deleteAccount:()Management .cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Error removing account files subdirectory %@ %@");
}

+ (void)deleteAccount:()Management .cold.2(void *a1)
{
  os_log_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Deleting modern account %@", v4, v5, v6, v7, v8);
}

+ (void)deleteAccountWithBatchDelete:()Management .cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error saving after account deletion: %@", v2, v3, v4, v5, v6);
}

+ (void)deleteAccountWithBatchDelete:()Management .cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Falling back to non-batch deletion", v2, v3, v4, v5, v6);
}

+ (void)deleteAccountWithBatchDelete:()Management .cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error deleting account with batch deletion: %@", v2, v3, v4, v5, v6);
}

+ (void)cloudKitAccountInContext:()Management .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetching account for primary iCloud Apple Account", v2, v3, v4, v5, v6);
}

+ (void)cloudKitAccountInContext:()Management .cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Not fetching account for primary iCloud Apple Account because Notes data class is disabled", v2, v3, v4, v5, v6);
}

+ (void)cloudKitAccountInContext:()Management .cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Refetching account for primary iCloud Apple Account", v2, v3, v4, v5, v6);
}

+ (void)cloudKitAccountInContext:()Management .cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Account for primary iCloud Apple Account has been deleted — returning nil", v2, v3, v4, v5, v6);
}

+ (void)cloudKitAccountInContext:()Management .cold.5(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Retrieved primary iCloud Apple Account {identifier: %@}", buf, 0xCu);
}

+ (void)defaultAccountInContext:()Management .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Default account (%@) via Settings didn't match CK Account or Local Account.", v2, v3, v4, v5, v6);
}

+ (void)defaultAccountInContext:()Management .cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Overriding default account ID for testing {accountID: %@}", v2, v3, v4, v5, v6);
}

+ (void)defaultAccountInContext:()Management .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)numberOfCloudKitAccountsInContext:()Management onlyMigrated:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error counting CK account: %@", v2, v3, v4, v5, v6);
}

+ (void)clearAccountForAppleCloudKitTable
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Clearing cache for account table.", v2, v3, v4, v5, v6);
}

@end