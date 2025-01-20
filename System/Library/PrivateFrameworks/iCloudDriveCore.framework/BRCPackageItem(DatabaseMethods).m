@interface BRCPackageItem(DatabaseMethods)
@end

@implementation BRCPackageItem(DatabaseMethods)

- (void)saveToDBWithSession:()DatabaseMethods .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: saving package items should really always work%@", v2, v3, v4, v5, v6);
}

- (void)saveToDBWithSession:()DatabaseMethods .cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: doInsert != nil%@", v2, v3, v4, v5, v6);
}

- (void)saveToDBWithSession:()DatabaseMethods .cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: should never attempt to save tombstones to db%@", v2, v3, v4, v5, v6);
}

@end