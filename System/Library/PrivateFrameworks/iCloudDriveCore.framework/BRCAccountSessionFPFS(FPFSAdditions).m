@interface BRCAccountSessionFPFS(FPFSAdditions)
- (BRCFSImporter)fsImporter;
- (void)_sendFPFSImportStartTelemetryEvent;
- (void)_sendFPFSImportStatusTelemetryEvent;
- (void)markMigrationToFPFSComplete;
- (void)triggerFPFSImportFinishedTelemetryEventIfNeeded;
@end

@implementation BRCAccountSessionFPFS(FPFSAdditions)

- (BRCFSImporter)fsImporter
{
  return self->_fsImporter;
}

- (void)_updateFPFSMigrationBouncedItemType:()FPFSAdditions withExistingItemType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Unknown migration item type%@", v2, v3, v4, v5, v6);
}

- (void)setFPFSMigrationState:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Signalling fsimporter to clean un-migrated items%@", v2, v3, v4, v5, v6);
}

- (void)setFPFSMigrationState:()FPFSAdditions .cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting FPFS Migration State: %d%@", (uint8_t *)v3, 0x12u);
}

- (void)sendNonMigratedItemTelemetryWithfileIDs:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sending FPFS non migrated fileIDs telemetry event: %@%@");
}

- (void)markMigrationToFPFSComplete
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Received notification that reimport domain was finished%@", v2, v3, v4, v5, v6);
}

- (void)_sendFPFSImportStartTelemetryEvent
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Sending FPFS Import start telemetry event%@", v2, v3, v4, v5, v6);
}

- (void)_sendFPFSImportStatusTelemetryEvent
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Sending FPFS Import status telemetry event%@", v2, v3, v4, v5, v6);
}

- (void)triggerFPFSImportFinishedTelemetryEventIfNeeded
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] FPFS Migration is not running, no need to trigger FPFS import finished telemetry%@", v2, v3, v4, v5, v6);
}

- (void)_sendFPFSImportFinishedTelemetryEvent:()FPFSAdditions .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] This is a test device, not sending ABC report or TTR%@", v2, v3, v4, v5, v6);
}

- (void)_sendFPFSImportFinishedTelemetryEvent:()FPFSAdditions .cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Sending TTR is disabled by user default%@", v2, v3, v4, v5, v6);
}

- (void)_sendFPFSImportFinishedTelemetryEvent:()FPFSAdditions .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 investigation];
  uint8_t v6 = [v5 fpfsMigrationInvestigation];
  int v7 = 138412546;
  v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished FPFS migration investigation info: %@%@", (uint8_t *)&v7, 0x16u);
}

- (void)_sendFPFSImportFinishedTelemetryEvent:()FPFSAdditions .cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sending Success FPFS Import finished telemetry event (%@)%@");
}

@end