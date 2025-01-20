@interface BRCAppLibrary(FPFSAdditions)
- (void)deleteAppLibrary;
- (void)documentsFolderFileObjectID;
- (void)recreateDocumentsFolderIfNeededInDB;
@end

@implementation BRCAppLibrary(FPFSAdditions)

- (void)documentsFolderFileObjectID
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: App library %@ doesn't have a documents folder%@", v1, 0x16u);
}

- (void)recreateDocumentsFolderIfNeededInDB
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_23FA42000, log, (os_log_type_t)0x90u, "[ERROR] Failed to create documents folder for app library %@%@", (uint8_t *)&v4, 0x16u);
}

- (void)_recursivelyDeleteItemsUnderItemID:()FPFSAdditions filterPredicate:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to save to db without an error%@", (uint8_t *)&v2, 0xCu);
}

- (void)deleteAppLibrary
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleting app library %@%@", v1, 0x16u);
}

@end