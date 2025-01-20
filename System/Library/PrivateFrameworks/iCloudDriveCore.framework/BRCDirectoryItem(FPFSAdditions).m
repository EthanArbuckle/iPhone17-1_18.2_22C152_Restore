@interface BRCDirectoryItem(FPFSAdditions)
- (void)documentsDirectoryUpdatedDocumentsScopePublic;
- (void)handlePathMatchConflictForDirectoryCreationIfNecessary;
- (void)markDirectoryMergeOrCrossZonePropagationComplete;
@end

@implementation BRCDirectoryItem(FPFSAdditions)

- (void)_signalPropagationToChildrenForce:()FPFSAdditions .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [a1 diffAgainstOriginalItem];
  v4 = BRCItemFieldsPrettyPrint();
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_23FA42000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We seem to be in a lost scan loop.  Breaking the chain (diffs %@)%@", v5, 0x16u);
}

- (void)documentsDirectoryUpdatedDocumentsScopePublic
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't update document scope public when we aren't the documents folder %@%@");
}

- (void)markRemovedFromFilesystemRecursively:()FPFSAdditions .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = [*(id *)(a1 + 16) changeState];
  v5 = [v4 changeToken];
  uint64_t v6 = [v5 descriptionWithContext:0];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting deletion change token to %@ because item contains a dir faults%@", v7, 0x16u);
}

- (void)markDirectoryMergeOrCrossZonePropagationComplete
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: zombieItem%@", v2, v3, v4, v5, v6);
}

- (void)handlePathMatchConflictForDirectoryCreationIfNecessary
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Attempting to handle path match conflicts for directory creation of %@%@");
}

- (void)updateFromServerItem:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Server item is a directory fault so now our local item is a directory fault for %@%@");
}

- (void)mergeContentsIntoDirectory:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't merge into a folder which is already accepting a merge %@%@");
}

@end