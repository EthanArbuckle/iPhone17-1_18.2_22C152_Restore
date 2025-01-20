@interface BRCItemCountMismatchReport
+ (void)_finishReport:(id)a3 session:(id)a4 completionHandler:(id)a5;
+ (void)generateReportForSharedFolder:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (BOOL)wasAbleToRun;
- (BRCItemCountMismatchReport)initWithURL:(id)a3;
- (BRCItemGlobalID)itemGlobalID;
- (BRMangledID)zoneMangledID;
- (NSError)lastError;
- (id)telemetryEvent;
- (int64_t)itemCountDifference;
- (void)incrementErrorRetryCountWithSession:(id)a3;
- (void)shareChangedDuringCheckWithSession:(id)a3;
@end

@implementation BRCItemCountMismatchReport

- (BRCItemCountMismatchReport)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCItemCountMismatchReport;
  v6 = [(BRCItemCountMismatchReport *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileURL, a3);
  }

  return v7;
}

- (void)shareChangedDuringCheckWithSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientDB];
  [v5 assertOnQueue];

  if (self->_lastError)
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCItemCountMismatchReport shareChangedDuringCheckWithSession:]((uint64_t)self);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemChanged");
    v8 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v8;

    [(BRCItemCountMismatchReport *)self incrementErrorRetryCountWithSession:v4];
  }
}

- (void)incrementErrorRetryCountWithSession:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 clientDB];
  v6 = [(BRCItemGlobalID *)self->_itemGlobalID itemID];
  v7 = [(BRCItemGlobalID *)self->_itemGlobalID zoneRowID];
  v8 = (void *)[v5 numberWithSQL:@"SELECT retry_count FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@", v6, v7];

  self->_int64_t failureRetryCount = [v8 longLongValue] + 1;
  objc_super v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(NSURL *)self->_fileURL path];
    v12 = objc_msgSend(v11, "fp_obfuscatedPath");
    lastError = self->_lastError;
    int64_t failureRetryCount = self->_failureRetryCount;
    *(_DWORD *)buf = 138413058;
    v20 = v12;
    __int16 v21 = 2112;
    v22 = lastError;
    __int16 v23 = 2048;
    int64_t v24 = failureRetryCount;
    __int16 v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Telemetry report at %@ finished with error %@ retry count %llu%@", buf, 0x2Au);
  }
  v15 = [v4 clientDB];

  int64_t v16 = self->_failureRetryCount;
  v17 = [(BRCItemGlobalID *)self->_itemGlobalID itemID];
  v18 = [(BRCItemGlobalID *)self->_itemGlobalID zoneRowID];
  [v15 execute:@"INSERT OR REPLACE INTO telemetry_failure_counts (retry_count, item_id, zone_rowid) VALUES (%lld, %@, %@)", v16, v17, v18];
}

+ (void)_finishReport:(id)a3 session:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 clientTruthWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__BRCItemCountMismatchReport__finishReport_session_completionHandler___block_invoke;
  block[3] = &unk_26507F918;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

uint64_t __70__BRCItemCountMismatchReport__finishReport_session_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) lastError];
  if (v3)
  {
LABEL_2:

    goto LABEL_3;
  }
  if ([*v2 wasAbleToRun])
  {
    v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) itemGlobalID];
    id v8 = [v6 itemByItemGlobalID:v7];
    v3 = [v8 asDirectory];

    if ([v3 containsPendingUploadOrSyncUp])
    {
      id v9 = (void *)MEMORY[0x263F087E8];
      v10 = [*((id *)*v2 + 2) path];
      uint64_t v11 = objc_msgSend(v9, "brc_errorNotInCloud:", v10);
      id v12 = (void *)*((void *)*v2 + 5);
      *((void *)*v2 + 5) = v11;
    }
    goto LABEL_2;
  }
LABEL_3:
  id v4 = [*v2 lastError];

  id v5 = *v2;
  if (v4)
  {
    [v5 incrementErrorRetryCountWithSession:*(void *)(a1 + 40)];
  }
  else if ([v5 wasAbleToRun])
  {
    id v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __70__BRCItemCountMismatchReport__finishReport_session_completionHandler___block_invoke_cold_1();
    }

    id v15 = [*(id *)(a1 + 40) clientDB];
    id v16 = [*(id *)(a1 + 32) itemGlobalID];
    id v17 = [v16 itemID];
    v18 = [*(id *)(a1 + 32) itemGlobalID];
    v19 = [v18 zoneRowID];
    [v15 execute:@"DELETE FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@", v17, v19];
  }
  else
  {
    v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [*((id *)*v2 + 2) path];
      __int16 v23 = objc_msgSend(v22, "fp_obfuscatedPath");
      *(_DWORD *)buf = 138412546;
      v26 = v23;
      __int16 v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Telemetry report at %@ did not run%@", buf, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)generateReportForSharedFolder:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke;
  v22[3] = &unk_26507FBB8;
  id v24 = a1;
  id v10 = v9;
  id v23 = v10;
  int64_t v25 = a4;
  uint64_t v11 = (void *)MEMORY[0x2455D9A50](v22);
  id v12 = [v8 session];
  id v13 = [v12 personaIdentifier];
  v18 = v8;
  v19 = v12;
  v20 = v10;
  __int16 v21 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v8;
  id v17 = v10;
  BRPerformWithPersonaAndError();
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_cold_1();
  }

  id v9 = [[BRCItemCountMismatchReport alloc] initWithURL:v5];
  id v10 = [v6 clientZone];
  uint64_t v11 = [v6 itemID];
  id v12 = [v10 serverItemByItemID:v11];

  id v13 = [v12 serverMetrics];
  id v14 = [v13 recursiveChildCount];

  id v15 = [v6 session];
  id v16 = [v12 serverZone];
  uint64_t v17 = [v16 mangledID];
  zoneMangledID = v9->_zoneMangledID;
  v9->_zoneMangledID = (BRMangledID *)v17;

  v19 = [v12 clientZone];
  v9->_isEnhancedDrivePrivacyEnabled = [v19 enhancedDrivePrivacyEnabled];

  uint64_t v20 = [v6 itemGlobalID];
  itemGlobalID = v9->_itemGlobalID;
  v9->_itemGlobalID = (BRCItemGlobalID *)v20;

  v9->_containsSharedToMeItem = [v6 isSharedToMeOrContainsSharedToMeItem];
  if (v14 && ![v6 containsPendingUploadOrSyncUp])
  {
    v26 = brc_bread_crumbs();
    __int16 v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v44 = [v5 path];
      v40 = objc_msgSend(v44, "fp_obfuscatedPath");
      *(_DWORD *)buf = 138412802;
      v60 = v14;
      __int16 v61 = 2112;
      v62 = v40;
      __int16 v63 = 2112;
      v64 = v26;
      _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Telemetry - Server metrics found %@ items under %@%@", buf, 0x20u);
    }
    id v58 = 0;
    v28 = [MEMORY[0x263F054E0] wrapperWithURL:v5 readonly:1 error:&v58];
    id v29 = v58;
    id v30 = v58;
    if (v30)
    {
      objc_storeStrong((id *)&v9->_lastError, v29);
      [*(id *)(a1 + 40) _finishReport:v9 session:v15 completionHandler:*(void *)(a1 + 32)];
    }
    else
    {
      v31 = BRDiskCheckerServiceConnection();
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_653;
      v53[3] = &unk_26507FB68;
      v32 = v9;
      uint64_t v33 = *(void *)(a1 + 40);
      v54 = v32;
      uint64_t v57 = v33;
      v43 = v28;
      id v34 = v15;
      id v55 = v34;
      id v56 = *(id *)(a1 + 32);
      v41 = [v31 remoteObjectProxyWithErrorHandler:v53];
      uint64_t v42 = *(void *)(a1 + 48);
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_654;
      v45[3] = &unk_26507FB90;
      v35 = v32;
      uint64_t v36 = *(void *)(a1 + 40);
      v46 = v35;
      uint64_t v52 = v36;
      id v37 = v34;
      v28 = v43;
      id v47 = v37;
      id v51 = *(id *)(a1 + 32);
      v38 = v31;
      id v30 = 0;
      id v48 = v38;
      id v49 = v5;
      id v50 = v14;
      id v39 = v38;
      [v41 checkRecursiveChildItemCountFromURLWrapper:v43 qualityOfService:v42 reply:v45];
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x263F087E8];
    id v23 = [v5 path];
    uint64_t v24 = objc_msgSend(v22, "brc_errorNotInCloud:", v23);
    lastError = v9->_lastError;
    v9->_lastError = (NSError *)v24;

    [*(id *)(a1 + 40) _finishReport:v9 session:v15 completionHandler:*(void *)(a1 + 32)];
  }
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_653(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
    [*(id *)(a1 + 56) _finishReport:*(void *)(a1 + 32) session:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_654(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a3);
  }
  else
  {
    [*(id *)(a1 + 48) invalidate];
    *(unsigned char *)(*(void *)(a1 + 32) + 26) = 1;
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [*(id *)(a1 + 56) path];
      uint64_t v11 = objc_msgSend(v10, "fp_obfuscatedPath");
      int v12 = 138412802;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Telemetry - Disk checker found %@ items under %@%@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v9 = [v5 longLongValue];
    *(void *)(*(void *)(a1 + 32) + 32) = v9 - [*(id *)(a1 + 64) longLongValue];
  }
  [*(id *)(a1 + 80) _finishReport:*(void *)(a1 + 32) session:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 72)];
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_657(id *a1, uint64_t a2)
{
  if (a2)
  {
    v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_657_cold_2();
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v5 = [a1[4] itemGlobalID];
    id v6 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
    if (v6)
    {
      id v7 = [a1[4] fileObjectID];
      id v8 = [v7 asString];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_659;
      v11[3] = &unk_26507FC08;
      id v12 = v5;
      id v14 = a1[6];
      id v13 = a1[5];
      id v15 = a1[7];
      [v6 getUserVisibleURLForItemIdentifier:v8 completionHandler:v11];
    }
    else
    {
      uint64_t v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
        __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_657_cold_1();
      }

      (*((void (**)(void))a1[6] + 2))();
    }
  }
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_659(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      v22 = v9;
      _os_log_error_impl(&dword_23FA42000, v10, (os_log_type_t)0x90u, "[ERROR] Can't find the user visible URL for %@ - %@%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) clientTruthWorkloop];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_660;
    v12[3] = &unk_26507FBE0;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 56);
    id v15 = v5;
    dispatch_async(v8, v12);
  }
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_660(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemByItemGlobalID:*(void *)(a1 + 40)];
  id v3 = [v2 asDirectory];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)telemetryEvent
{
  if (self->_lastError)
  {
    int64_t failureRetryCount = self->_failureRetryCount;
    id v4 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v5 = [v4 telemetryRetryCountForPermenentFailure];

    id v6 = 0;
    if (failureRetryCount > v5) {
      id v6 = +[AppTelemetryTimeSeriesEvent newPermanentlyInconsistentEventWithZoneMangledID:self->_zoneMangledID enhancedDrivePrivacyEnabled:self->_isEnhancedDrivePrivacyEnabled];
    }
  }
  else if (self->_wasAbleToRun)
  {
    if (self->_itemCountDifference >= 1 && self->_containsSharedToMeItem) {
      id v6 = +[AppTelemetryTimeSeriesEvent newShareAliasInSharedFolderEventWithZoneMangledID:self->_zoneMangledID enhancedDrivePrivacyEnabled:self->_isEnhancedDrivePrivacyEnabled];
    }
    else {
      id v6 = +[AppTelemetryTimeSeriesEvent newFolderSharingCountMismatchEventWithCount:zoneMangledID:enhancedDrivePrivacyEnabled:](AppTelemetryTimeSeriesEvent, "newFolderSharingCountMismatchEventWithCount:zoneMangledID:enhancedDrivePrivacyEnabled:");
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (int64_t)itemCountDifference
{
  return self->_itemCountDifference;
}

- (BOOL)wasAbleToRun
{
  return self->_wasAbleToRun;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (BRCItemGlobalID)itemGlobalID
{
  return self->_itemGlobalID;
}

- (BRMangledID)zoneMangledID
{
  return self->_zoneMangledID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneMangledID, 0);
  objc_storeStrong((id *)&self->_itemGlobalID, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)shareChangedDuringCheckWithSession:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 48);
  int v3 = 138412546;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v2, (uint64_t)v2, "[DEBUG] The share changed while we were checking telemetry on %@ but we already reported an error%@", (uint8_t *)&v3);
}

void __70__BRCItemCountMismatchReport__finishReport_session_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)v1 + 16) path];
  int v3 = objc_msgSend(v2, "fp_obfuscatedPath");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v4, "[DEBUG] Telemetry report at %@ succeeded%@", v5);
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = [v1 path];
  int v3 = objc_msgSend(v2, "fp_obfuscatedPath");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v4, "[DEBUG] Generating telemetry report at %@%@", v5);
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_657_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] Can't get a shared provider manager%@", v2, v3, v4, v5, v6);
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_657_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Failed adopting persona%@", v2, v3, v4, v5, v6);
}

@end