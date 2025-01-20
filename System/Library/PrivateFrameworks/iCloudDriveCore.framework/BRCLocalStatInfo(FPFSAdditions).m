@interface BRCLocalStatInfo(FPFSAdditions)
- (void)clearBouncedName;
@end

@implementation BRCLocalStatInfo(FPFSAdditions)

- (void)_updateStatAliasMeta:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: aliasItem.isBRAlias%@", v2, v3, v4, v5, v6);
}

- (void)initWithImportObject:()FPFSAdditions error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: nobody should import an item from a fault%@", v2, v3, v4, v5, v6);
}

- (void)initWithImportObject:()FPFSAdditions error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: nobody should import an item from a BR Alias%@", v2, v3, v4, v5, v6);
}

- (void)initWithImportObject:()FPFSAdditions error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Unexpected import object %@%@");
}

+ (void)_finderTagsFromImportObject:()FPFSAdditions .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 componentsJoinedByString:@", "];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] read tags: [%@]%@", (uint8_t *)&v6, 0x16u);
}

+ (void)_finderTagsFromImportObject:()FPFSAdditions .cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] failed to fetch tags: %@%@", v1, 0x16u);
}

- (void)_updateStatMetaFromServer:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_aliasTarget || [_aliasTarget isEqualToString:st.aliasTarget]%@", v2, v3, v4, v5, v6);
}

- (void)updateFromImportObject:()FPFSAdditions onlyContentDependentProperties:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] dropping tags%@", v2, v3, v4, v5, v6);
}

- (void)clearBouncedName
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Clear bounced name because there is no item at the unbounced location%@", v2, v3, v4, v5, v6);
}

@end