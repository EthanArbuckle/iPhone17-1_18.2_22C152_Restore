@interface BRCLocalItem(BRCSharedToMeTopLevel)
@end

@implementation BRCLocalItem(BRCSharedToMeTopLevel)

- (void)diffAgainstServerAliasItem:()BRCSharedToMeTopLevel .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isSharedToMeTopLevelItem%@", v2, v3, v4, v5, v6);
}

- (void)structureRecordBeingDeadInServerTruth:()BRCSharedToMeTopLevel shouldPCSChainStatus:inZone:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] %@ has been CZM but we don't know it yet.  Not allowing alias sync%@", v1, 0x16u);
}

- (void)structureRecordBeingDeadInServerTruth:()BRCSharedToMeTopLevel shouldPCSChainStatus:inZone:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: aliasZone.isPrivateZone%@", v2, v3, v4, v5, v6);
}

- (void)structureRecordBeingDeadInServerTruth:()BRCSharedToMeTopLevel shouldPCSChainStatus:inZone:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _serverZone.isSharedZone%@", v2, v3, v4, v5, v6);
}

- (void)insertTombstoneAliasRecordInZone:()BRCSharedToMeTopLevel .cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] No need to insert a dead alias because there is no server item%@", v1, 0xCu);
}

- (void)insertTombstoneAliasRecordInZone:()BRCSharedToMeTopLevel .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] No need to insert a dead alias when one already exists for %@%@");
}

- (void)insertTombstoneAliasRecordInZone:()BRCSharedToMeTopLevel .cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Insering alias tombstone for %@%@");
}

- (void)insertTombstoneAliasRecordInZone:()BRCSharedToMeTopLevel .cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Strange... An alias exists which isn't dead. Converting it to be dead for %@%@", v1, 0x16u);
}

- (void)updateParentZoneRowID:()BRCSharedToMeTopLevel .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't update to nil zone row id%@", v2, v3, v4, v5, v6);
}

- (void)updateParentZoneRowID:()BRCSharedToMeTopLevel .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] deleting existing alias %@ because the shared item moved here%@");
}

- (void)updateParentZoneRowID:()BRCSharedToMeTopLevel .cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: existingAlias.isDead%@", v2, v3, v4, v5, v6);
}

- (void)updateParentZoneRowID:()BRCSharedToMeTopLevel .cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _db.isBatchSuspended%@", v2, v3, v4, v5, v6);
}

@end