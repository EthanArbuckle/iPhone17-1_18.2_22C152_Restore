@interface BRCLocalItem(FPFSAdditions)
- (void)logicalNameNeedsRename;
- (void)markFromInitialScan;
@end

@implementation BRCLocalItem(FPFSAdditions)

- (void)logicalNameNeedsRename
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Needs rename because the original name has been vacated%@", v2, v3, v4, v5, v6);
}

- (void)markFromInitialScan
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Marking %@ from initial scan%@", v1, 0x16u);
}

- (void)updateWithLogicalName:()FPFSAdditions newParent:forceTopLevelShareMove:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Ignoring name and parent change on immutable documents folder%@", v2, v3, v4, v5, v6);
}

- (void)updateFromServerItem:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't update from server item when not idle for %@%@");
}

- (void)updateToBeInTrashWithParent:()FPFSAdditions trashPutBackPath:trashPutBackParentID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [_parentZoneRowID br_isEqualToNumber:newParentID.zoneRowID] || [_session serverZoneByRowID:_parentZoneRowID].isSharedZone%@", v2, v3, v4, v5, v6);
}

- (void)updateToBeUntrashedWithParent:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [_parentZoneRowID br_isEqualToNumber:newParentID.zoneRowID]%@", v2, v3, v4, v5, v6);
}

- (void)markImportedItemAsSharedWithImportBookmark:()FPFSAdditions parent:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _clientZone != nil%@", v2, v3, v4, v5, v6);
}

+ (void)computeItemScopeFromParentIsRoot:()FPFSAdditions parentIsDocuments:parentScope:logicalName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: parentScope == BRC_ITEM_SCOPE_DOCUMENTS%@", v2, v3, v4, v5, v6);
}

@end