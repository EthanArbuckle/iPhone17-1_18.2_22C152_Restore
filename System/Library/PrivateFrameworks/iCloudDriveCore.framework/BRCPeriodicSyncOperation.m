@interface BRCPeriodicSyncOperation
- (BOOL)scheduleSyncDownIfNeededForZoneID:(id)a3 zoneIfAny:(id)a4;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCContainerScheduler)scheduler;
- (BRCPeriodicSyncOperation)initWithContainerScheduler:(id)a3 metadataChangeToken:(id)a4 zoneHealthChangeToken:(id)a5 sideCarChangeToken:(id)a6 sessionContext:(id)a7;
- (CKServerChangeToken)metadataChangeToken;
- (CKServerChangeToken)sideCarChangeToken;
- (CKServerChangeToken)zoneHealthChangeToken;
- (id)createActivity;
- (void)main;
@end

@implementation BRCPeriodicSyncOperation

- (BRCPeriodicSyncOperation)initWithContainerScheduler:(id)a3 metadataChangeToken:(id)a4 zoneHealthChangeToken:(id)a5 sideCarChangeToken:(id)a6 sessionContext:(id)a7
{
  id v13 = a3;
  id v22 = a4;
  id v21 = a5;
  id v20 = a6;
  id v14 = a7;
  v15 = [v13 session];
  v16 = [v15 syncContextProvider];
  v17 = [v16 defaultSyncContext];

  v23.receiver = self;
  v23.super_class = (Class)BRCPeriodicSyncOperation;
  v18 = [(_BRCOperation *)&v23 initWithName:@"sync-down/periodic-sync" syncContext:v17 sessionContext:v14];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_scheduler, a3);
    objc_storeStrong((id *)&v18->_metadataChangeToken, a4);
    objc_storeStrong((id *)&v18->_zoneHealthChangeToken, a5);
    objc_storeStrong((id *)&v18->_sideCarChangeToken, a6);
    [(BRCPeriodicSyncOperation *)v18 setQualityOfService:9];
  }

  return v18;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sync-down/periodic-sync", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldRetryForError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRCPeriodicSyncOperation;
  return [(_BRCOperation *)&v4 shouldRetryForError:a3];
}

- (BOOL)scheduleSyncDownIfNeededForZoneID:(id)a3 zoneIfAny:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(BRCContainerScheduler *)self->_scheduler session];
  v9 = [v6 zoneName];
  memset(v60, 0, sizeof(v60));
  __brc_create_section(0, (uint64_t)"-[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:]", 74, v60);
  v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v62 = v60[0];
    __int16 v63 = 2112;
    v64 = v9;
    __int16 v65 = 2112;
    v66 = v10;
    _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx considering whether or not to schedule sync down for %@%@", buf, 0x20u);
  }

  if (![v9 isEqualToString:*MEMORY[0x263F324D8]])
  {
    if ([v9 isEqualToString:*MEMORY[0x263F32550]])
    {
      zoneHealthChangeToken = self->_zoneHealthChangeToken;
      v19 = [v7 currentServerChangeToken];
      id v14 = zoneHealthChangeToken;
      id v20 = v19;
      if (v14 != v20)
      {
        id v21 = v20;
        if (v20)
        {
          char v22 = [(CKServerChangeToken *)v14 isEqual:v20];

          if (v22) {
            goto LABEL_17;
          }
        }
        else
        {
        }
        v41 = brc_bread_crumbs();
        v42 = brc_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:]();
        }

        scheduler = self->_scheduler;
        v30 = [(_BRCOperation *)self group];
        [(BRCContainerScheduler *)scheduler scheduleSyncDownForZoneHealthWithGroup:v30];
        goto LABEL_41;
      }
      goto LABEL_18;
    }
    if ([v9 isEqualToString:*MEMORY[0x263F327C8]])
    {
      sideCarChangeToken = self->_sideCarChangeToken;
      v24 = [v7 currentServerChangeToken];
      id v14 = sideCarChangeToken;
      v25 = v24;
      if (v14 != v25)
      {
        v26 = v25;
        if (v25)
        {
          char v27 = [(CKServerChangeToken *)v14 isEqual:v25];

          if (v27) {
            goto LABEL_17;
          }
        }
        else
        {
        }
        v44 = brc_bread_crumbs();
        v45 = brc_default_log();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:]();
        }

        v46 = self->_scheduler;
        v30 = [(_BRCOperation *)self group];
        [(BRCContainerScheduler *)v46 scheduleSyncDownForSideCarWithGroup:v30];
        goto LABEL_41;
      }
      goto LABEL_18;
    }
    v30 = [v8 privateServerZoneByID:v9];
    v29 = [v30 clientZone];
    if (!v30)
    {
      v57 = brc_bread_crumbs();
      v58 = brc_default_log();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS serverZoneByRowID:]();
      }
    }
    if ([v29 isSyncBlocked])
    {
      v31 = brc_bread_crumbs();
      v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v33 = [v30 clientZone];
        -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:].cold.5(v33, (uint64_t)v31, (uint64_t)buf);
      }
    }
    else
    {
      v31 = [v30 changeState];
      v37 = [v31 changeToken];
      v38 = [v7 currentServerChangeToken];
      v32 = v37;
      v39 = v38;
      if (v32 != v39)
      {
        v40 = v39;
        if (v39)
        {
          char v59 = [v32 isEqual:v39];

          if (v59)
          {
            BOOL v28 = 0;
            goto LABEL_51;
          }
        }
        else
        {
        }
        v48 = brc_bread_crumbs();
        v49 = brc_default_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v50 = [v30 clientZone];
          -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:].cold.6(v50, (uint64_t)v48, (uint64_t)buf);
        }

        v31 = [v30 clientZone];
        v32 = [(_BRCOperation *)self group];
        [v31 scheduleSyncDownWithGroup:v32];
        BOOL v28 = 1;
LABEL_50:

LABEL_51:
        if (!v7) {
          goto LABEL_20;
        }
        if ([v29 enhancedDrivePrivacyEnabled]) {
          goto LABEL_20;
        }
        v51 = [v29 mangledID];
        v52 = +[BRCUserDefaults defaultsForMangledID:v51];
        int v53 = [v52 supportsEnhancedDrivePrivacy];

        if (!v53) {
          goto LABEL_20;
        }
        v54 = [v7 requiredFeatures];
        id v14 = [v54 recordFeatures];

        if ([(CKServerChangeToken *)v14 hasValue:*MEMORY[0x263F323C8] forName:*MEMORY[0x263F323C0]])
        {
          v55 = brc_bread_crumbs();
          v56 = brc_notifications_log();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
            -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:].cold.4();
          }

          [v29 setStateBits:0x400000];
        }
LABEL_19:

LABEL_20:
LABEL_42:

        goto LABEL_43;
      }
    }
    BOOL v28 = 0;
    goto LABEL_50;
  }
  metadataChangeToken = self->_metadataChangeToken;
  id v13 = [v7 currentServerChangeToken];
  id v14 = metadataChangeToken;
  v15 = v13;
  if (v14 == v15)
  {
LABEL_18:
    BOOL v28 = 0;
    v29 = v14;
    v30 = v14;
    goto LABEL_19;
  }
  v16 = v15;
  if (!v15)
  {

LABEL_26:
    v34 = brc_bread_crumbs();
    v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:]();
    }

    v36 = self->_scheduler;
    v30 = [(_BRCOperation *)self group];
    [(BRCContainerScheduler *)v36 scheduleSyncDownForContainerMetadataWithGroup:v30];
LABEL_41:
    BOOL v28 = 1;
    goto LABEL_42;
  }
  char v17 = [(CKServerChangeToken *)v14 isEqual:v15];

  if ((v17 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_17:
  BOOL v28 = 0;
LABEL_43:
  __brc_leave_section(v60);

  return v28;
}

- (void)main
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.group%@", v2, v3, v4, v5, v6);
}

uint64_t __32__BRCPeriodicSyncOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 clientZone];
  if (([v4 isSyncBlocked] & 1) == 0
    && ([v4 syncState] & 3) == 0
    && [v3 hasFetchedRecentsAndFavorites])
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint8_t v6 = [v3 zoneID];
    [v5 addObject:v6];
  }
  return 1;
}

void __32__BRCPeriodicSyncOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  memset(v21, 0, sizeof(v21));
  id v7 = *(void **)(a1 + 32);
  if (v7) {
    [v7 logSections];
  }
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v23 = v21[0];
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 2112;
    char v27 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx completed fetching changed zone\nzones: %@%@", buf, 0x20u);
  }

  v10 = +[BRCEventsAnalytics sharedAnalytics];
  if (!v5)
  {
    if (!v6)
    {
      v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_2();
      }

      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: No error found");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
      __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_1();
    }
    goto LABEL_18;
  }
  if (v6 && (objc_msgSend(v6, "brc_containsCloudKitErrorCode:", 2) & 1) == 0)
  {
    id v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
      __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_1();
    }
LABEL_18:

    [*(id *)(a1 + 32) completedWithResult:0 error:v6];
    [v10 registerAndSendNewPeriodicSyncWithOutcome:@"failed"];
    goto LABEL_19;
  }
  v11 = [*(id *)(a1 + 40) clientTruthWorkloop];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __32__BRCPeriodicSyncOperation_main__block_invoke_18;
  v16[3] = &unk_2650850C8;
  v16[4] = *(void *)(a1 + 32);
  id v17 = v10;
  id v18 = v5;
  id v6 = v6;
  id v19 = v6;
  id v20 = *(id *)(a1 + 40);
  dispatch_async(v11, v16);

LABEL_19:
  __brc_leave_section(v21);
}

void __32__BRCPeriodicSyncOperation_main__block_invoke_18(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) finishIfCancelled])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    [v2 registerAndSendNewPeriodicSyncWithOutcome:@"cancelled"];
  }
  else
  {
    uint64_t v14 = 0;
    v15 = (int *)&v14;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    id v3 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __32__BRCPeriodicSyncOperation_main__block_invoke_2_22;
    v13[3] = &unk_2650862F0;
    v13[4] = *(void *)(a1 + 32);
    v13[5] = &v14;
    [v3 enumerateKeysAndObjectsUsingBlock:v13];
    uint64_t v4 = [*(id *)(a1 + 56) userInfo];
    id v5 = [v4 objectForKey:*MEMORY[0x263EFD4C8]];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __32__BRCPeriodicSyncOperation_main__block_invoke_3;
    v12[3] = &unk_265086318;
    v12[4] = *(void *)(a1 + 32);
    v12[5] = &v14;
    [v5 enumerateKeysAndObjectsUsingBlock:v12];
    if (v15[6] <= 0) {
      id v6 = @"useless";
    }
    else {
      id v6 = @"useful";
    }
    [*(id *)(a1 + 40) registerAndSendNewPeriodicSyncWithOutcome:v6];
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v15[6] <= 0) {
        v9 = "useless";
      }
      else {
        v9 = "useful";
      }
      *(_DWORD *)buf = 136315394;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] scheduled a %s periodic sync%@", buf, 0x16u);
    }

    v10 = [*(id *)(a1 + 64) analyticsReporter];
    id v11 = +[AppTelemetryTimeSeriesEvent newMissingPushEventWithNumberOutOfSync:v15[6]];
    [v10 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v11];

    [*(id *)(a1 + 32) completedWithResult:0 error:0];
    _Block_object_dispose(&v14, 8);
  }
}

uint64_t __32__BRCPeriodicSyncOperation_main__block_invoke_2_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) scheduleSyncDownIfNeededForZoneID:a2 zoneIfAny:a3];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

void __32__BRCPeriodicSyncOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(a1 + 32) scheduleSyncDownIfNeededForZoneID:v3 zoneIfAny:0];
  }
}

- (BRCContainerScheduler)scheduler
{
  return self->_scheduler;
}

- (CKServerChangeToken)metadataChangeToken
{
  return self->_metadataChangeToken;
}

- (CKServerChangeToken)zoneHealthChangeToken
{
  return self->_zoneHealthChangeToken;
}

- (CKServerChangeToken)sideCarChangeToken
{
  return self->_sideCarChangeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sideCarChangeToken, 0);
  objc_storeStrong((id *)&self->_zoneHealthChangeToken, 0);
  objc_storeStrong((id *)&self->_metadataChangeToken, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

- (void)scheduleSyncDownIfNeededForZoneID:zoneIfAny:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] container-metadata appears to be out of sync in the periodic check, forcing sync%@", v2, v3, v4, v5, v6);
}

- (void)scheduleSyncDownIfNeededForZoneID:zoneIfAny:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] zone health appears to be out of sync in the periodic check, forcing sync%@", v2, v3, v4, v5, v6);
}

- (void)scheduleSyncDownIfNeededForZoneID:zoneIfAny:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] side-car appears to be out of sync in the periodic check, forcing sync%@", v2, v3, v4, v5, v6);
}

- (void)scheduleSyncDownIfNeededForZoneID:zoneIfAny:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[NOTIF] Enhanced Drive Privacy enablement detected via periodic sync for %@%@", v1, 0x16u);
}

- (void)scheduleSyncDownIfNeededForZoneID:(uint64_t)a3 zoneIfAny:.cold.5(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Not considering %@ for periodic sync because it is blocked from sync%@", v4, 0x16u);
}

- (void)scheduleSyncDownIfNeededForZoneID:(uint64_t)a3 zoneIfAny:.cold.6(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ appears to be out of sync in the periodic check, forcing sync%@", v4, 0x16u);
}

void __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] can't fetch all changed zones: %@%@");
}

void __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: No error found%@", v2, v3, v4, v5, v6);
}

@end