@interface BRCClientZone(BRCZoneReset)
- (void)_cancelAllOperationsForReset;
@end

@implementation BRCClientZone(BRCZoneReset)

- (void)_reset:()BRCZoneReset completionHandler:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v4 = [a1 mangledID];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[NOTIF] Can't reset %@ because its deactivated%@", v5, 0x16u);
}

- (void)_reset:()BRCZoneReset completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: not implemented%@", v2, v3, v4, v5, v6);
}

- (void)_deleteRelevantPackageItemsWithDB:()BRCZoneReset error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 lastError];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_23FA42000, a3, v5, "[ERROR] failed pruning client_pkg_upload_items: %@%@", v6);
}

- (void)_performHardResetOnClientItemsAndWantsUnlink:()BRCZoneReset db:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 lastError];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_23FA42000, a3, v5, "[ERROR] failed pruning client_items: %@%@", v6);
}

- (void)_performAfterResetServerAndClientSharedTruthsAndUnlinkData:()BRCZoneReset .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isSharedZone%@", v2, v3, v4, v5, v6);
}

- (void)_cancelAllOperationsForReset
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] cancelling sync up operation %@%@");
}

@end