@interface BRCAnalyticsReporter
+ (BOOL)isTelemetryReportingEnabled;
+ (id)_aggregatedTelemetryDescription:(id)a3;
+ (void)_enumerateAggregatedTelemetryForSession:(id)a3 withBlock:(id)a4;
+ (void)cancelSyncConsistencyReportWithMountPath:(id)a3 queue:(id)a4;
- (BOOL)_resumePausedTreeConsistencyCheckOperationWithActivity:(id)a3;
- (BOOL)_shouldDeferForExistingSnapshot;
- (BRCAnalyticsReporter)initWithSession:(id)a3;
- (void)_checkSyncConsistencyWithActivity:(id)a3;
- (void)_cleanupTimedOutEventMetrics:(id)a3;
- (void)_forgetEventMetrics:(id)a3;
- (void)_gatherAppTelemetryEventsWithActivity:(id)a3;
- (void)_handleApplySchedulerTimeoutWithActivity:(id)a3 telemetryEventType:(int)a4;
- (void)_reportSyncUpBackoffInfo;
- (void)_setupSyncConsistencyCancellationTimerWithActivity:(id)a3 session:(id)a4;
- (void)_setupSyncConsistencyDeferralTimerWithActivity:(id)a3;
- (void)_waitForApplySchedulerToBeIdleWithCompletion:(id)a3;
- (void)_withEventMetricsOfKind:(id)a3 accessor:(id)a4;
- (void)aggregateReportForAppTelemetryIdentifier:(int)a3 error:(id)a4;
- (void)aggregateReportForAppTelemetryIdentifier:(int)a3 itemID:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(id)a6 error:(id)a7;
- (void)close;
- (void)createFSEventToSyncUpEventForFileID:(unint64_t)a3 genID:(unsigned int)a4;
- (void)createUserDownloadEventForOperationID:(id)a3 isRecursive:(BOOL)a4 isForBackup:(BOOL)a5;
- (void)deleteMissingErrorThrottles;
- (void)didApplyItemInsideSharedItemID:(id)a3;
- (void)dumpDatabaseInfoToContext:(id)a3;
- (void)dumpToContext:(id)a3;
- (void)forgetEventMetric:(id)a3;
- (void)lookupFSEventToSyncUpEventByFileID:(unint64_t)a3 genID:(unsigned int)a4 accessor:(id)a5;
- (void)lookupFSEventToSyncUpEventByItemID:(id)a3 accessor:(id)a4;
- (void)lookupUserDownloadEventByFileObjectID:(id)a3 accessor:(id)a4;
- (void)lookupUserDownloadEventByOperationID:(id)a3 accessor:(id)a4;
- (void)postReportForDefaultSubCategoryWithCategory:(unint64_t)a3 telemetryTimeEvent:(id)a4;
- (void)registerBackgroundXPCActivities;
- (void)submitEventMetric:(id)a3;
@end

@implementation BRCAnalyticsReporter

- (BRCAnalyticsReporter)initWithSession:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BRCAnalyticsReporter;
  v6 = [(BRCAnalyticsReporter *)&v27 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("analytics-reporter", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("wait-on-idle", v13);

    waitOnIdleQueue = v7->_waitOnIdleQueue;
    v7->_waitOnIdleQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = objc_opt_new();
    eventsByKind = v7->_eventsByKind;
    v7->_eventsByKind = (NSMutableDictionary *)v16;

    v18 = objc_alloc_init(BRCSyncHealthReport);
    syncHealthReport = v7->_syncHealthReport;
    v7->_syncHealthReport = v18;

    v20 = [[BRCCKMetricEndpoint alloc] initWithSession:v5];
    metricEndpoint = v7->_metricEndpoint;
    v7->_metricEndpoint = &v20->super;

    v22 = objc_alloc_init(BRCRTCReporter);
    rtcReporter = v7->_rtcReporter;
    v7->_rtcReporter = v22;

    v24 = objc_alloc_init(BRCAppTelemetryConverter);
    appTelemetryConvertor = v7->_appTelemetryConvertor;
    v7->_appTelemetryConvertor = v24;
  }
  return v7;
}

- (void)close
{
}

- (void)registerBackgroundXPCActivities
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] iCloud Analytics collection is disabled, unregistering xpc_activity%@", v2, v3, v4, v5, v6);
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    BOOL v4 = xpc_activity_set_state(v3, 3);

    if (v4) {
      return;
    }
    brc_bread_crumbs();
    uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
    uint8_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  xpc_activity_state_t state = xpc_activity_get_state(v3);

  if (state != 2) {
    return;
  }
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_2();
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v11 = [WeakRetained[1] clientTruthWorkloop];

    if (v11)
    {
      uint8_t v6 = [v5[1] clientTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_28;
      block[3] = &unk_26507ED70;
      block[4] = v5;
      dispatch_async_and_wait(v6, block);
LABEL_11:
    }
  }
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_28(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[BRCAccountsManager sharedManager];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) accountHandler];
  BOOL v4 = [v3 acAccountID];
  uint64_t v5 = [v2 personaIdentifierForACAccountID:v4];

  if ([v5 isEqualToString:@"__defaultPersonaID__"]) {
    uint8_t v6 = 0;
  }
  else {
    uint8_t v6 = v5;
  }
  id v7 = v6;
  id v8 = v5;
  if (!v7)
  {
    if (BRCEventKindUserDownload_block_invoke___personaOnceToken != -1) {
      dispatch_once(&BRCEventKindUserDownload_block_invoke___personaOnceToken, &__block_literal_global_9);
    }
    id v8 = (id)BRCEventKindUserDownload_block_invoke___personalPersona;
  }
  v9 = [MEMORY[0x263F841B0] sharedManager];
  v37 = [v9 currentPersona];

  id v51 = 0;
  id v10 = [v37 userPersonaUniqueString];
  v11 = v10;
  if (v10 == v8 || ([v10 isEqualToString:v8] & 1) != 0)
  {
    v12 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v50 = 0;
    v28 = (void *)[v37 copyCurrentPersonaContextWithError:&v50];
    id v29 = v50;
    id v30 = v51;
    id v51 = v28;

    if (v29)
    {
      v31 = brc_bread_crumbs();
      v32 = brc_default_log();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u)) {
        -[_BRCOperation completedWithResult:error:]();
      }
    }
    v12 = [v37 generateAndRestorePersonaContextWithPersonaUniqueString:v8];

    if (v12)
    {
      v33 = brc_bread_crumbs();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v56 = v5;
        __int16 v57 = 2112;
        v58 = v12;
        __int16 v59 = 2112;
        v60 = v33;
        _os_log_error_impl(&dword_23FA42000, v34, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_49:
    }
  }
  else
  {
    if (!v7 && ([v37 isDataSeparatedPersona] & 1) == 0)
    {
      v33 = brc_bread_crumbs();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      v12 = 0;
      goto LABEL_49;
    }
    v35 = brc_bread_crumbs();
    v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_3();
    }

    v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
  }
LABEL_11:
  v13 = objc_alloc_init(BRCSyncHealthReport);
  [(BRCSyncHealthReport *)v13 generateReportWithSession:*(void *)(*(void *)(a1 + 32) + 8)];
  +[BRCCoreAnalyticsReporter uploadMetricsReport:v13];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  dispatch_queue_t v14 = [(BRCSyncHealthReport *)v13 telemetryErrorEvents];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(a1 + 32) postReportForDefaultSubCategoryWithCategory:7 telemetryTimeEvent:*(void *)(*((void *)&v46 + 1) + 8 * i)];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v15);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v18 = [(BRCSyncHealthReport *)v13 telemetryOtherEvents];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v43 != v20) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(a1 + 32) postReportForDefaultSubCategoryWithCategory:7 telemetryTimeEvent:*(void *)(*((void *)&v42 + 1) + 8 * j)];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v19);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v22 = [(BRCSyncHealthReport *)v13 aggregatedEvents];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(a1 + 32) postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:*(void *)(*((void *)&v38 + 1) + 8 * k)];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v23);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) _sendFPFSImportStatusTelemetryEvent];
  uint64_t v26 = *(void *)(a1 + 32);
  objc_super v27 = *(void **)(v26 + 56);
  *(void *)(v26 + 56) = v13;

  _BRRestorePersona();
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_2()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)BRCEventKindUserDownload_block_invoke___personalPersona;
  BRCEventKindUserDownload_block_invoke___personalPersona = v0;
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  if (!xpc_activity_should_defer(v3))
  {
    if (xpc_activity_get_state(v3) != 2) {
      goto LABEL_27;
    }
    uint8_t v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_2();
    }

    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    BOOL v4 = WeakRetained;
    if (!WeakRetained) {
      goto LABEL_26;
    }
    v9 = [WeakRetained[1] clientTruthWorkloop];
    BOOL v10 = v9 == 0;

    if (v10) {
      goto LABEL_26;
    }
    if (!xpc_activity_set_state(v3, 4))
    {
      v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
        __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_38_cold_5();
      }
    }
    v13 = +[BRCAccountsManager sharedManager];
    dispatch_queue_t v14 = [v4[1] accountHandler];
    uint64_t v15 = [v14 acAccountID];
    uint64_t v5 = [v13 personaIdentifierForACAccountID:v15];

    if ([v5 isEqualToString:@"__defaultPersonaID__"]) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v5;
    }
    v17 = v16;
    v18 = v5;
    if (!v17)
    {
      if (BRCEventKindUserDownload_block_invoke_2___personaOnceToken != -1) {
        dispatch_once(&BRCEventKindUserDownload_block_invoke_2___personaOnceToken, &__block_literal_global_41);
      }
      v18 = (id)BRCEventKindUserDownload_block_invoke_2___personalPersona;
    }
    uint64_t v19 = [MEMORY[0x263F841B0] sharedManager];
    uint64_t v20 = [v19 currentPersona];

    id v34 = 0;
    v21 = [v20 userPersonaUniqueString];
    v22 = v21;
    if (v21 == v18 || ([v21 isEqualToString:v18] & 1) != 0)
    {
      uint64_t v23 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        id v33 = 0;
        uint64_t v24 = (void *)[v20 copyCurrentPersonaContextWithError:&v33];
        id v25 = v33;
        id v26 = v34;
        id v34 = v24;

        if (v25)
        {
          objc_super v27 = brc_bread_crumbs();
          v28 = brc_default_log();
          if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
            -[_BRCOperation completedWithResult:error:]();
          }
        }
        uint64_t v23 = [v20 generateAndRestorePersonaContextWithPersonaUniqueString:v18];

        if (!v23) {
          goto LABEL_24;
        }
        id v29 = brc_bread_crumbs();
        id v30 = brc_default_log();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          v36 = v5;
          __int16 v37 = 2112;
          long long v38 = v23;
          __int16 v39 = 2112;
          long long v40 = v29;
          _os_log_error_impl(&dword_23FA42000, v30, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
      }
      else
      {
        if (v17 || ([v20 isDataSeparatedPersona] & 1) != 0)
        {
          v31 = brc_bread_crumbs();
          v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            __br_notify_register_dispatch_block_invoke_cold_3();
          }

          uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
          goto LABEL_24;
        }
        id v29 = brc_bread_crumbs();
        id v30 = brc_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          __br_notify_register_dispatch_block_invoke_cold_4();
        }
        uint64_t v23 = 0;
      }
    }
LABEL_24:
    [v4 _gatherAppTelemetryEventsWithActivity:v3];

    _BRRestorePersona();
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (!xpc_activity_set_state(v3, 3))
  {
    brc_bread_crumbs();
    BOOL v4 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_1();
    }
    goto LABEL_25;
  }
LABEL_27:
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_39()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)BRCEventKindUserDownload_block_invoke_2___personalPersona;
  BRCEventKindUserDownload_block_invoke_2___personalPersona = v0;
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  if (!xpc_activity_should_defer(v3))
  {
    if (xpc_activity_get_state(v3) != 2) {
      goto LABEL_27;
    }
    uint8_t v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_42_cold_6();
    }

    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    BOOL v4 = WeakRetained;
    if (!WeakRetained) {
      goto LABEL_26;
    }
    v9 = [WeakRetained[1] clientTruthWorkloop];
    BOOL v10 = v9 == 0;

    if (v10) {
      goto LABEL_26;
    }
    if (!xpc_activity_set_state(v3, 4))
    {
      v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
        __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_38_cold_5();
      }
    }
    v13 = +[BRCAccountsManager sharedManager];
    dispatch_queue_t v14 = [v4[1] accountHandler];
    uint64_t v15 = [v14 acAccountID];
    uint64_t v5 = [v13 personaIdentifierForACAccountID:v15];

    if ([v5 isEqualToString:@"__defaultPersonaID__"]) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v5;
    }
    v17 = v16;
    v18 = v5;
    if (!v17)
    {
      if (BRCEventKindUserDownload_block_invoke_3___personaOnceToken != -1) {
        dispatch_once(&BRCEventKindUserDownload_block_invoke_3___personaOnceToken, &__block_literal_global_45_0);
      }
      v18 = (id)BRCEventKindUserDownload_block_invoke_3___personalPersona;
    }
    uint64_t v19 = [MEMORY[0x263F841B0] sharedManager];
    uint64_t v20 = [v19 currentPersona];

    id v34 = 0;
    v21 = [v20 userPersonaUniqueString];
    v22 = v21;
    if (v21 == v18 || ([v21 isEqualToString:v18] & 1) != 0)
    {
      uint64_t v23 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        id v33 = 0;
        uint64_t v24 = (void *)[v20 copyCurrentPersonaContextWithError:&v33];
        id v25 = v33;
        id v26 = v34;
        id v34 = v24;

        if (v25)
        {
          objc_super v27 = brc_bread_crumbs();
          v28 = brc_default_log();
          if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
            -[_BRCOperation completedWithResult:error:]();
          }
        }
        uint64_t v23 = [v20 generateAndRestorePersonaContextWithPersonaUniqueString:v18];

        if (!v23) {
          goto LABEL_24;
        }
        id v29 = brc_bread_crumbs();
        id v30 = brc_default_log();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          v36 = v5;
          __int16 v37 = 2112;
          long long v38 = v23;
          __int16 v39 = 2112;
          long long v40 = v29;
          _os_log_error_impl(&dword_23FA42000, v30, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
      }
      else
      {
        if (v17 || ([v20 isDataSeparatedPersona] & 1) != 0)
        {
          v31 = brc_bread_crumbs();
          v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            __br_notify_register_dispatch_block_invoke_cold_3();
          }

          uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
          goto LABEL_24;
        }
        id v29 = brc_bread_crumbs();
        id v30 = brc_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          __br_notify_register_dispatch_block_invoke_cold_4();
        }
        uint64_t v23 = 0;
      }
    }
LABEL_24:
    [v4 _checkSyncConsistencyWithActivity:v3];

    _BRRestorePersona();
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (!xpc_activity_set_state(v3, 3))
  {
    brc_bread_crumbs();
    BOOL v4 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_1();
    }
    goto LABEL_25;
  }
LABEL_27:
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_43()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)BRCEventKindUserDownload_block_invoke_3___personalPersona;
  BRCEventKindUserDownload_block_invoke_3___personalPersona = v0;
}

- (void)_waitForApplySchedulerToBeIdleWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_session;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke;
  v16[3] = &unk_26507F828;
  uint8_t v6 = v5;
  v17 = v6;
  id v7 = v4;
  id v18 = v7;
  id v8 = (void (**)(void, void))MEMORY[0x2455D9A50](v16);
  v9 = [(BRCAccountSessionFPFS *)v6 applyScheduler];
  BOOL v10 = [v9 hasActiveWorkGroup];
  intptr_t v11 = dispatch_group_wait(v10, 0);

  if (v11)
  {
    waitOnIdleQueue = self->_waitOnIdleQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke_3;
    v13[3] = &unk_26507F850;
    dispatch_queue_t v14 = v6;
    uint64_t v15 = v8;
    dispatch_async(waitOnIdleQueue, v13);
  }
  else
  {
    v8[2](v8, 0);
  }
}

void __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) clientTruthWorkloop];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke_2;
  v5[3] = &unk_26507F800;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = +[BRCUserDefaults defaultsForMangledID:0];
  [v2 telemetryApplySchedulerTimeout];
  int64_t v4 = (uint64_t)(v3 * 1000000000.0);

  uint64_t v5 = [*(id *)(a1 + 32) applyScheduler];
  id v6 = [v5 hasActiveWorkGroup];
  dispatch_time_t v7 = dispatch_time(0, v4);
  dispatch_group_wait(v6, v7);

  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v8();
}

- (void)_handleApplySchedulerTimeoutWithActivity:(id)a3 telemetryEventType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  activity = (_xpc_activity_s *)a3;
  id v6 = self->_session;
  dispatch_time_t v7 = [(BRCAccountSessionFPFS *)v6 cloudDocsClientZone];
  id v8 = [v7 rootItemID];

  v9 = [NSNumber numberWithInt:v4];
  BOOL v10 = brc_bread_crumbs();
  intptr_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Telemetry timed out waiting for the apply scheduler%@", buf, 0xCu);
  }

  v12 = [(BRCAccountSessionFPFS *)v6 clientDB];
  v13 = (void *)[v12 numberWithSQL:@"SELECT retry_count FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@", v8, v9];

  uint64_t v14 = [v13 longLongValue];
  uint64_t v15 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v16 = [v15 telemetryRetryCountForPermenentFailure];

  if (v14 < v16)
  {
    v17 = [(BRCAccountSessionFPFS *)v6 clientDB];
    [v17 execute:@"INSERT OR REPLACE INTO telemetry_failure_counts (retry_count, item_id, zone_rowid) VALUES (%lld, %@, %@)", v14 + 1, v8, v9];

    id v18 = activity;
    if (xpc_activity_set_state(activity, 3))
    {
      uint64_t v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:]();
      }
    }
    else
    {
      uint64_t v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:]();
      }
    }
LABEL_17:

    goto LABEL_18;
  }
  if (v4 == -2)
  {
    id v21 = +[AppTelemetryTimeSeriesEvent newConsistencyCheckerFailedEvent];
    [(BRCAnalyticsReporter *)self postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v21];
  }
  else
  {
    if (v4 != -1) {
      goto LABEL_14;
    }
    id v21 = +[BRCUserDefaults defaultsForMangledID:0];
    id v22 = +[AppTelemetryTimeSeriesEvent newPermanentlyInconsistentEventWithZoneMangledID:enhancedDrivePrivacyEnabled:](AppTelemetryTimeSeriesEvent, "newPermanentlyInconsistentEventWithZoneMangledID:enhancedDrivePrivacyEnabled:", 0, [v21 supportsEnhancedDrivePrivacy]);
    [(BRCAnalyticsReporter *)self postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v22];
  }
LABEL_14:
  uint64_t v23 = [(BRCAccountSessionFPFS *)v6 clientDB];
  [v23 execute:@"DELETE FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@", v8, v9];

  id v18 = activity;
  if (!xpc_activity_set_state(activity, 5))
  {
    uint64_t v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
      -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:]();
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (void)_gatherAppTelemetryEventsWithActivity:(id)a3
{
  uint64_t v4 = (_xpc_activity_s *)a3;
  uint64_t v5 = self->_session;
  uint64_t v6 = [(BRCAccountSessionFPFS *)v5 clientTruthWorkloop];
  if (!v6) {
    goto LABEL_7;
  }
  dispatch_time_t v7 = (void *)v6;
  id v8 = [(BRCAccountSessionFPFS *)v5 applyScheduler];
  v9 = [v8 hasActiveWorkGroup];

  if (!v9)
  {
LABEL_7:
    if (xpc_activity_set_state(v4, 5))
    {
      BOOL v10 = brc_bread_crumbs();
      intptr_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[BRCAnalyticsReporter _gatherAppTelemetryEventsWithActivity:]();
      }
    }
    else
    {
      BOOL v10 = brc_bread_crumbs();
      intptr_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
        -[BRCAnalyticsReporter _gatherAppTelemetryEventsWithActivity:]();
      }
    }
    goto LABEL_15;
  }
  if (xpc_activity_should_defer(v4))
  {
    if (xpc_activity_set_state(v4, 3))
    {
      BOOL v10 = brc_bread_crumbs();
      intptr_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:]();
      }
    }
    else
    {
      BOOL v10 = brc_bread_crumbs();
      intptr_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:]();
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke;
  v12[3] = &unk_26507F8A0;
  v13 = v5;
  uint64_t v14 = self;
  uint64_t v15 = v4;
  [(BRCAnalyticsReporter *)self _waitForApplySchedulerToBeIdleWithCompletion:v12];

  BOOL v10 = v13;
LABEL_16:
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) cloudDocsClientZone];
  uint64_t v5 = [v4 rootItemID];

  uint64_t v6 = [*(id *)(a1 + 32) cloudDocsClientZone];
  dispatch_time_t v7 = [v6 dbRowID];

  id v8 = *(void **)(a1 + 40);
  if (v8[8])
  {
    v9 = brc_bread_crumbs();
    BOOL v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_4(a1 + 40);
    }

    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 48), 3))
    {
      intptr_t v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:]();
      }
    }
  }
  else if (a2)
  {
    [v8 _handleApplySchedulerTimeoutWithActivity:*(void *)(a1 + 48) telemetryEventType:0xFFFFFFFFLL];
  }
  else
  {
    v13 = [*(id *)(a1 + 32) clientDB];
    [v13 execute:@"DELETE FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@", v5, v7];

    uint64_t v14 = +[BRCPersistedState loadFromClientStateInSession:*(void *)(a1 + 32)];
    uint64_t v15 = [*(id *)(a1 + 32) clientDB];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_59;
    v31[3] = &unk_26507F1E8;
    id v32 = *(id *)(a1 + 32);
    uint64_t v16 = (void *)[v15 fetchObject:v31, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE (item_sharing_options & 4) != 0 AND item_type IN (0, 9, 10) AND rowid > %llu ORDER BY rowid ASC LIMIT 1", objc_msgSend(v14, "telemetryMinRowID") sql];

    objc_msgSend(v14, "setTelemetryMinRowID:", objc_msgSend(v16, "dbRowID"));
    if (v16)
    {
      if ([v16 isDirectory])
      {
        uint64_t v17 = [v16 itemGlobalID];
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = *(void **)(v18 + 64);
        *(void *)(v18 + 64) = v17;

        uint64_t v20 = [v16 asDirectory];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_66;
        v27[3] = &unk_26507F878;
        id v28 = v16;
        int8x16_t v26 = *(int8x16_t *)(a1 + 32);
        id v21 = (id)v26.i64[0];
        int8x16_t v29 = vextq_s8(v26, v26, 8uLL);
        id v30 = *(id *)(a1 + 48);
        +[BRCItemCountMismatchReport generateReportForSharedFolder:v20 qualityOfService:17 completionHandler:v27];
      }
      else
      {
        uint64_t v24 = brc_bread_crumbs();
        id v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_2();
        }

        [*(id *)(a1 + 40) _gatherAppTelemetryEventsWithActivity:*(void *)(a1 + 48)];
      }
    }
    else
    {
      [*(id *)(a1 + 40) _reportSyncUpBackoffInfo];
      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 48), 5))
      {
        id v22 = brc_bread_crumbs();
        uint64_t v23 = brc_default_log();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
          __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_1();
        }
      }
    }
  }
}

id __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_59(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  dispatch_time_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(v5 + 64);
    if (!v6)
    {
      [v3 shareChangedDuringCheckWithSession:*(void *)(a1 + 48)];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void **)(v5 + 64);
    }
    *(void *)(v5 + 64) = 0;

    dispatch_time_t v7 = [*(id *)(a1 + 48) clientDB];
    [v7 assertOnQueue];

    id v8 = [v4 telemetryEvent];
    if (v8) {
      [*(id *)(a1 + 40) postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v8];
    }
    [*(id *)(a1 + 40) _gatherAppTelemetryEventsWithActivity:*(void *)(a1 + 56)];
  }
  else
  {
    id v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_66_cold_1(a1);
    }
  }
}

- (void)_setupSyncConsistencyDeferralTimerWithActivity:(id)a3
{
  id v4 = a3;
  if (self->_syncConsistencyDeferralTimer)
  {
    uint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCAnalyticsReporter _setupSyncConsistencyDeferralTimerWithActivity:]();
    }
  }
  else
  {
    uint64_t v5 = +[BRCUserDefaults defaultsForMangledID:0];
    [v5 syncConsistencyXPCActivityDeferralCheckInterval];
    int64_t v7 = brc_interval_to_nsec();
    dispatch_time_t v8 = dispatch_time(0, v7);
    v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
    [v5 syncConsistencyXPCActivityDeferralCheckInterval];
    uint64_t v10 = brc_interval_to_nsec();
    [v5 syncConsistencyXPCActivityCheckLeeway];
    uint64_t v11 = brc_interval_to_nsec();
    dispatch_source_set_timer(v9, v8, v10, v11);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke;
    handler[3] = &unk_26507ED98;
    id v22 = v4;
    v12 = v9;
    uint64_t v23 = v12;
    dispatch_source_set_event_handler(v12, handler);
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke_68;
    v18[3] = &unk_26507ED20;
    objc_copyWeak(&v19, &location);
    v13 = v12;
    uint64_t v14 = v18;
    uint64_t v15 = v14;
    if (*MEMORY[0x263F32768])
    {
      uint64_t v16 = ((void (*)(void *))*MEMORY[0x263F32768])(v14);

      uint64_t v15 = (void *)v16;
    }
    dispatch_source_set_cancel_handler(v13, v15);

    dispatch_resume(v13);
    syncConsistencyDeferralTimer = self->_syncConsistencyDeferralTimer;
    self->_syncConsistencyDeferralTimer = (OS_dispatch_source *)v13;
    uint64_t v6 = v13;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      id v2 = brc_bread_crumbs();
      id v3 = brc_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke_cold_1();
      }
    }
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Deferring the sync consistency checker%@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = BRDiskCheckerServiceConnection();
    int64_t v7 = [v6 remoteObjectProxy];
    [v7 pauseTreeConsistencyCheck];

    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  }
}

void __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke_68(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[9];
    WeakRetained[9] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

+ (void)cancelSyncConsistencyReportWithMountPath:(id)a3 queue:(id)a4
{
  id v5 = a3;
  uint64_t v6 = a4;
  int64_t v7 = BRDiskCheckerServiceConnection();
  int v8 = [v7 remoteObjectProxy];
  [v8 cancelTreeConsistencyCheck];

  v9 = +[BRCUserDefaults defaultsForMangledID:0];
  int v10 = [v9 syncConsistencyCheckerSnapshotting];

  if (v10)
  {
    int64_t v11 = brc_interval_to_nsec();
    dispatch_time_t v12 = dispatch_time(0, v11);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__BRCAnalyticsReporter_cancelSyncConsistencyReportWithMountPath_queue___block_invoke;
    block[3] = &unk_26507ED70;
    id v14 = v5;
    dispatch_after(v12, v6, block);
  }
}

uint64_t __71__BRCAnalyticsReporter_cancelSyncConsistencyReportWithMountPath_queue___block_invoke(uint64_t a1)
{
  return +[BRCSyncConsistencyReport cleanupApfsSnapshotWithMountPath:*(void *)(a1 + 32)];
}

- (void)_setupSyncConsistencyCancellationTimerWithActivity:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_syncConsistencyCancellationTimer)
  {
    int v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAnalyticsReporter _setupSyncConsistencyCancellationTimerWithActivity:session:]();
    }
  }
  else
  {
    int v8 = +[BRCUserDefaults defaultsForMangledID:0];
    [v8 syncConsistencyTimeout];
    int64_t v10 = brc_interval_to_nsec();
    int64_t v11 = [v7 volume];
    dispatch_time_t v12 = [v11 mountPath];

    objc_initWeak(&location, self);
    dispatch_time_t v13 = dispatch_time(0, v10);
    id v14 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
    [v8 syncConsistencyXPCActivityCheckLeeway];
    dispatch_source_set_timer(v14, v13, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v15 * 1000000000.0));
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __83__BRCAnalyticsReporter__setupSyncConsistencyCancellationTimerWithActivity_session___block_invoke;
    handler[3] = &unk_26507EDC0;
    v9 = v12;
    int8x16_t v26 = v9;
    id v27 = v7;
    uint64_t v16 = v14;
    id v28 = v16;
    dispatch_source_set_event_handler(v16, handler);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __83__BRCAnalyticsReporter__setupSyncConsistencyCancellationTimerWithActivity_session___block_invoke_71;
    v23[3] = &unk_26507ED20;
    objc_copyWeak(&v24, &location);
    uint64_t v17 = v16;
    uint64_t v18 = v23;
    id v19 = v18;
    if (*MEMORY[0x263F32768])
    {
      uint64_t v20 = ((void (*)(void *))*MEMORY[0x263F32768])(v18);

      id v19 = (void *)v20;
    }
    dispatch_source_set_cancel_handler(v17, v19);

    dispatch_resume(v17);
    syncConsistencyCancellationTimer = self->_syncConsistencyCancellationTimer;
    self->_syncConsistencyCancellationTimer = (OS_dispatch_source *)v17;
    id v22 = v17;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __83__BRCAnalyticsReporter__setupSyncConsistencyCancellationTimerWithActivity_session___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling the sync consistency checker because it timed out%@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) resetQueue];
  +[BRCAnalyticsReporter cancelSyncConsistencyReportWithMountPath:v4 queue:v5];

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

void __83__BRCAnalyticsReporter__setupSyncConsistencyCancellationTimerWithActivity_session___block_invoke_71(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[10];
    WeakRetained[10] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (BOOL)_resumePausedTreeConsistencyCheckOperationWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = BRDiskCheckerServiceConnection();
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke;
  v12[3] = &unk_26507F8C8;
  void v12[4] = &v13;
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_73;
  v11[3] = &unk_26507F8C8;
  v11[4] = &v13;
  [v6 resumeTreeConsistencyCheckWithReply:v11];

  [(BRCAnalyticsReporter *)self _setupSyncConsistencyDeferralTimerWithActivity:v4];
  uint64_t v7 = v14[5];
  if (v7)
  {
    uint64_t v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAnalyticsReporter _resumePausedTreeConsistencyCheckOperationWithActivity:]();
    }
  }
  else
  {
    uint64_t v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAnalyticsReporter _resumePausedTreeConsistencyCheckOperationWithActivity:]();
    }
  }

  _Block_object_dispose(&v13, 8);
  return v7 == 0;
}

void __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_73(uint64_t a1, void *a2)
{
}

- (BOOL)_shouldDeferForExistingSnapshot
{
  id v2 = [(BRCAccountSessionFPFS *)self->_session volume];
  id v3 = [v2 mountPath];

  id v4 = v3;
  uint64_t v5 = open((const char *)[v4 UTF8String], 0);
  if ((v5 & 0x80000000) != 0)
  {
    BOOL v7 = 0;
  }
  else
  {
    int v6 = v5;
    BOOL v7 = BRCHasAPFSSnapshot(v5, 0);
    close(v6);
  }

  return v7;
}

- (void)_checkSyncConsistencyWithActivity:(id)a3
{
  id v4 = a3;
  if (![(BRCAnalyticsReporter *)self _resumePausedTreeConsistencyCheckOperationWithActivity:v4])
  {
    uint64_t v5 = self->_session;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke;
    v7[3] = &unk_26507F8A0;
    v7[4] = self;
    id v8 = v4;
    v9 = v5;
    int v6 = v5;
    [(BRCAnalyticsReporter *)self _waitForApplySchedulerToBeIdleWithCompletion:v7];
  }
}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _handleApplySchedulerTimeoutWithActivity:v4 telemetryEventType:4294967294];
  }
  else if ([v3 _shouldDeferForExistingSnapshot])
  {
    uint64_t v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_cold_2();
    }

    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      BOOL v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_cold_1();
      }
    }
  }
  else
  {
    v9 = [*(id *)(a1 + 48) resetQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_74;
    block[3] = &unk_26507EDC0;
    int64_t v10 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v12 = v10;
    id v13 = *(id *)(a1 + 48);
    dispatch_async(v9, block);
  }
}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_74(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupSyncConsistencyDeferralTimerWithActivity:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setupSyncConsistencyCancellationTimerWithActivity:*(void *)(a1 + 40) session:*(void *)(a1 + 48)];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_2;
  v4[3] = &unk_26507F8F0;
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  +[BRCSyncConsistencyReport generateReportWithSession:v3 mangledIDs:0 completion:v4];
}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 80);
  if (v5)
  {
    dispatch_source_cancel(v5);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  int v6 = *(NSObject **)(v4 + 72);
  if (v6) {
    dispatch_source_cancel(v6);
  }
  if ([v3 wasAbleToRun])
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
    {
      BOOL v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:]();
      }
    }
    v9 = [v3 telemetryErrorEvents];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = [v3 telemetryErrorEvents];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(a1 + 32) postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v13);
      }
    }
    else
    {
      uint64_t v16 = *(void **)(a1 + 32);
      id v11 = +[AppTelemetryTimeSeriesEvent newFullyConsistentEvent];
      [v16 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v11];
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = objc_msgSend(v3, "telemetryWarningEvents", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(a1 + 32) postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:*(void *)(*((void *)&v22 + 1) + 8 * j)];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v19);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _handleApplySchedulerTimeoutWithActivity:*(void *)(a1 + 40) telemetryEventType:4294967294];
  }
}

- (void)_reportSyncUpBackoffInfo
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = [(BRCAccountSessionFPFS *)self->_session clientZones];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int v24 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v9 = [v8 mangledID];
        if (([v8 isSyncBlocked] & 1) == 0)
        {
          uint64_t v10 = +[BRCUserDefaults defaultsForMangledID:v9];
          [v8 syncUpBackoffRatio];
          float v12 = v11;
          [v8 syncUpBackoffDelay];
          float v14 = v13;
          [v10 syncUpBackoffRatioForFailure];
          if (v12 > v15)
          {
            uint64_t v16 = brc_bread_crumbs();
            uint64_t v17 = brc_default_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v30 = v8;
              __int16 v31 = 2048;
              double v32 = v12;
              __int16 v33 = 2112;
              id v34 = v16;
              _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Client zone %@ has a sync up backoff ratio of %f which is too large%@", buf, 0x20u);
            }

            uint64_t v5 = (v5 + 1);
          }
          [v10 syncUpBackoffDelayForFailure];
          if (v14 > v18)
          {
            uint64_t v19 = brc_bread_crumbs();
            uint64_t v20 = brc_default_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v30 = v8;
              __int16 v31 = 2048;
              double v32 = v14;
              __int16 v33 = 2112;
              id v34 = v19;
              _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Client zone %@ has a sync up backoff delay of %f which is too large%@", buf, 0x20u);
            }

            ++v24;
          }
          [v8 resetSyncUpBackoffRatio];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned int v24 = 0;
    uint64_t v5 = 0;
  }

  id v21 = +[AppTelemetryTimeSeriesEvent newSyncUpBackoffRatioSummaryEventWithNumberOfFailedZones:v5];
  [(BRCAnalyticsReporter *)self postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v21];
  id v22 = +[AppTelemetryTimeSeriesEvent newSyncUpBackoffDelaySummaryEventWithNumberOfFailedZones:v24];
  [(BRCAnalyticsReporter *)self postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v22];
}

- (void)submitEventMetric:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(BRCMetricEndpoint *)self->_metricEndpoint submitEventMetric:v4];
    uint64_t v5 = [v4 associatedAppTelemetryEvent];
    if (v5) {
      [(BRCAnalyticsReporter *)self postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v5];
    }
    v7[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [(BRCAnalyticsReporter *)self _forgetEventMetrics:v6];
  }
}

- (void)forgetEventMetric:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

    -[BRCAnalyticsReporter _forgetEventMetrics:](self, "_forgetEventMetrics:", v6, v7, v8);
  }
}

- (void)_forgetEventMetrics:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 firstObject];
  uint64_t v6 = [v5 eventName];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v9 = 138412290;
    long long v19 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        float v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v12), "eventName", v19, (void)v20);
        char v14 = [v13 isEqualToString:v6];

        if ((v14 & 1) == 0)
        {
          float v15 = brc_bread_crumbs();
          uint64_t v16 = brc_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v19;
            long long v25 = v15;
            _os_log_fault_impl(&dword_23FA42000, v16, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [metric.eventName isEqualToString:kind]%@", buf, 0xCu);
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v17 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      uint64_t v10 = v17;
    }
    while (v17);
  }

  float v18 = [(NSMutableDictionary *)self->_eventsByKind objectForKeyedSubscript:v6];
  [v18 removeObjectsInArray:v7];
}

- (void)_cleanupTimedOutEventMetrics:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = +[BRCUserDefaults defaultsForMangledID:0];
  [v6 eventMetricTimeout];
  double v8 = v7;

  long long v9 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        float v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "startTime", (void)v19);
        [v5 timeIntervalSinceDate:v16];
        double v18 = v17;

        if (v18 > v8) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)_withEventMetricsOfKind:(id)a3 accessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__BRCAnalyticsReporter__withEventMetricsOfKind_accessor___block_invoke;
  block[3] = &unk_26507F918;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __57__BRCAnalyticsReporter__withEventMetricsOfKind_accessor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v3 = (id)objc_opt_new();
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
    id v2 = v3;
  }
  id v4 = v2;
  if ([v2 count] == 10) {
    [*(id *)(a1 + 32) _cleanupTimedOutEventMetrics:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)_aggregatedTelemetryDescription:(id)a3
{
  id v3 = (void *)MEMORY[0x263F089D8];
  id v4 = a3;
  uint64_t v5 = [v4 telemetrySchema];
  if ((int)v5 > 299)
  {
    switch((int)v5)
    {
      case 500:
        id v6 = @"ITEM_BOUNCE_APPLY_NEW_WITH_EXISTING";
        break;
      case 501:
        id v6 = @"ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW";
        break;
      case 502:
        id v6 = @"ITEM_BOUNCE_APPLY_EXISTING_WITH_EXISTING";
        break;
      case 503:
        id v6 = @"ITEM_BOUNCE_BY_SERVER";
        break;
      case 504:
        id v6 = @"ITEM_BOUNCE_CREATE_ITEM_WITH_EXISTING";
        break;
      case 505:
        id v6 = @"ITEM_BOUNCE_CHANGE_ITEM_WITH_EXISTING";
        break;
      case 506:
        id v6 = @"ITEM_BOUNCE_SHARE_ACCEPT_EXISTING_WITH_NEW";
        break;
      case 507:
        id v6 = @"ITEM_BOUNCE_SHARE_ACCEPT_NEW_WITH_EXISTING";
        break;
      case 508:
        id v6 = @"ITEM_BOUNCE_TRASHED_ITEM";
        break;
      case 509:
        id v6 = @"ITEM_BOUNCE_ITEM_DIRECTORY_MERGE";
        break;
      case 510:
        id v6 = @"ITEM_BOUNCE_NEW_DIRECTORY_WITH_EXISTING";
        break;
      case 511:
        id v6 = @"ITEM_BOUNCE_EXISTING_WITH_NEW_DIRECTORY";
        break;
      case 512:
        id v6 = @"ITEM_BOUNCE_ITEM_WITH_DOCUMENTS_FOLDER";
        break;
      case 513:
        id v6 = @"ITEM_BOUNCE_APPLY_DEAD_EXISTING_WITH_NEW";
        break;
      case 514:
        id v6 = @"ITEM_BOUNCE_APPLY_NOT_KNOWN_BY_SERVER_WITH_NEW";
        break;
      case 515:
        id v6 = @"ITEM_BOUNCE_APPLY_LOCAL_DIFF_REPARENT_WITH_NEW";
        break;
      case 516:
        id v6 = @"ITEM_BOUNCE_APPLY_LOCAL_DIFF_FILE_NAME_WITH_NEW";
        break;
      case 517:
        id v6 = @"ITEM_BOUNCE_APPLY_INITIAL_SCAN_WITH_NEW";
        break;
      case 518:
        id v6 = @"ITEM_BOUNCE_APPLY_SHARED_ITEM_WITH_NEW_SHARED_ITEM_UNTITLED_FILE_NAME";
        break;
      case 519:
        id v6 = @"ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW_UNTITLED_FILE_NAME";
        break;
      default:
        switch((int)v5)
        {
          case 400:
            id v6 = @"FPFS_MIGRATION_STARTED";
            break;
          case 401:
            id v6 = @"FPFS_MIGRATION_FINISHED";
            break;
          case 402:
            id v6 = @"FPFS_MIGRATION_STATUS_REPORT";
            break;
          case 403:
            id v6 = @"FPFS_MIGRATION_NON_MIGRATED_ITEM_REPORT";
            break;
          case 404:
            id v6 = @"FPFS_MIGRATION_STUCK_STATUS";
            break;
          default:
            if (v5 == 300)
            {
              id v6 = @"INITIAL_SCAN_REJECTED_MISMATCH_TYPE";
            }
            else
            {
LABEL_35:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
              id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            break;
        }
        break;
    }
  }
  else
  {
    id v6 = @"UNKNOWN";
    switch((int)v5)
    {
      case 0:
        break;
      case 1:
        id v6 = @"_UNUSED_SYNC_UP_BACKOFF_RATIO";
        break;
      case 2:
        id v6 = @"FOLDER_SHARING_ITEM_COUNT_MISMATCH";
        break;
      case 3:
        id v6 = @"MISSING_PUSH";
        break;
      case 4:
        id v6 = @"PERMANENTLY_INCONSISTENT";
        break;
      case 5:
        id v6 = @"DROPPED_EVENTS";
        break;
      case 6:
        id v6 = @"TEST_METRIC";
        break;
      case 7:
        id v6 = @"SHARE_ALIAS_IN_SHARED_FOLDER";
        break;
      case 8:
        id v6 = @"MALIGNANT_ZONE_RESET";
        break;
      case 9:
        id v6 = @"BENIGN_ZONE_RESET";
        break;
      case 10:
        id v6 = @"DB_RESET";
        break;
      case 11:
        id v6 = @"APPLY_SCHEDULER_MISSING_JOBS";
        break;
      case 12:
        id v6 = @"SYNC_UP_MISSING_JOBS";
        break;
      case 13:
        id v6 = @"READER_MISSING_JOBS";
        break;
      case 14:
        id v6 = @"UPLOADER_MISSING_JOBS";
        break;
      case 15:
        id v6 = @"DOWNLOADER_MISSING_JOBS";
        break;
      case 16:
        id v6 = @"_UNUSED_SYNC_UP_BACKOFF_DELAY";
        break;
      case 17:
        id v6 = @"FOLDER_SHARING_PCS_CHAINING";
        break;
      case 18:
        id v6 = @"NEW_SHARE_ACCEPTATION";
        break;
      case 19:
        id v6 = @"FS_EVENT_TO_SYNC_UP";
        break;
      case 20:
        id v6 = @"USER_DOWNLOAD";
        break;
      case 21:
        id v6 = @"CORRUPT_PACKAGE_DOWNLOAD";
        break;
      case 22:
        id v6 = @"DIRECTORY_MISSING_CHAINPCS";
        break;
      case 23:
        id v6 = @"SYNC_BOOSTING_PROBLEM_COUNT";
        break;
      case 24:
        id v6 = @"DEEP_SCAN";
        break;
      case 25:
        id v6 = @"OPERATION_TIMED_OUT";
        break;
      case 26:
        id v6 = @"MISSING_SHARE_ALIAS";
        break;
      case 27:
        id v6 = @"ASSET_CONTENT_NOT_FOUND";
        break;
      case 28:
        id v6 = @"QBS_DIR_FAULT_COUNT";
        break;
      case 29:
        id v6 = @"FILE_BOUNCED_MANY_TIMES";
        break;
      case 30:
        id v6 = @"SYNC_UP_BACKOFF_RATIO_SUMMARY";
        break;
      case 31:
        id v6 = @"SYNC_UP_BACKOFF_DELAY_SUMMARY";
        break;
      case 32:
        id v6 = @"QBS_PERFORMANCE";
        break;
      case 33:
        id v6 = @"ACCOUNT_SESSION_OPEN_ERROR";
        break;
      case 34:
        id v6 = @"CORRUPT_SHARING_OPTIONS";
        break;
      case 35:
        id v6 = @"INCORRECT_CONTENT_POLICY_COUNT";
        break;
      case 36:
        id v6 = @"CORRUPT_BASEHASH_SALT_COUNT";
        break;
      case 37:
        id v6 = @"EDP_KEYS_MISMATCH";
        break;
      case 38:
        id v6 = @"DATABASE_ID_MISMATCH";
        break;
      case 39:
        id v6 = @"COLLABORATION_UPLOAD";
        break;
      case 40:
        id v6 = @"DANGLING_ZOMBIE_DIRECTORY_COUNT";
        break;
      case 41:
        id v6 = @"RECORD_VALUE_ERROR";
        break;
      case 42:
        id v6 = @"AGGRESSIVE_SALTING";
        break;
      case 43:
        id v6 = @"REIMPORT_DOMAIN_FAILED_ON_STARTUP";
        break;
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
        goto LABEL_35;
      case 100:
        id v6 = @"FULLY_CONSISTENT";
        break;
      case 101:
        id v6 = @"FILE_CHECKSUM_MISMATCH";
        break;
      case 102:
        id v6 = @"PACKAGE_CHECKSUM_MISMATCH";
        break;
      case 103:
        id v6 = @"CHILD_COUNT_MISMATCH";
        break;
      case 104:
        id v6 = @"RECURSIVE_ITEM_COUNT_MISMATCH";
        break;
      case 105:
        id v6 = @"SHARE_ALIAS_COUNT_MISMATCH";
        break;
      case 106:
        id v6 = @"SHARE_COUNT_MISMATCH";
        break;
      case 107:
        id v6 = @"CONSISTENCY_CHECKER_FAILED";
        break;
      case 108:
        id v6 = @"FILE_READ_ERROR";
        break;
      default:
        switch((int)v5)
        {
          case 200:
            id v6 = @"CA_TOTAL_ERROR_COUNT";
            break;
          case 201:
            id v6 = @"CA_UPLOAD_ERROR_COUNT";
            break;
          case 202:
            id v6 = @"CA_DOWNLOAD_ERROR_COUNT";
            break;
          case 203:
            id v6 = @"CA_SYNC_UP_ITEM_ERROR_COUNT";
            break;
          case 204:
            id v6 = @"CA_SYNC_UP_ZONE_ERROR_COUNT";
            break;
          case 205:
            id v6 = @"CA_SYNC_DOWN_ERROR_COUNT";
            break;
          case 210:
            id v6 = @"CA_UPLOAD_ERROR";
            break;
          case 211:
            id v6 = @"CA_DOWNLOAD_ERROR";
            break;
          case 212:
            id v6 = @"CA_SYNC_UP_ITEM_ERROR";
            break;
          case 213:
            id v6 = @"CA_SYNC_UP_ZONE_ERROR";
            break;
          case 214:
            id v6 = @"CA_SYNC_DOWN_ERROR";
            break;
          case 215:
            id v6 = @"CA_DAMAGED_FILE_UPLOAD_ERROR";
            break;
          case 216:
            id v6 = @"CA_NIL_APP_LIBRARY";
            break;
          default:
            goto LABEL_35;
        }
        break;
    }
  }
  id v7 = [v3 stringWithFormat:@"|id = %@|count = %lld|", v6, objc_msgSend(v4, "magnitudeLong")];

  double v8 = [v4 investigation];

  if ([v8 hasZoneName])
  {
    id v9 = [NSString alloc];
    id v10 = [v8 zoneName];
    uint64_t v11 = (void *)[v9 initWithData:v10 encoding:4];
    [v7 appendFormat:@"zoneID = %@|", v11];
  }
  if ([v8 hasItemID])
  {
    id v12 = [v8 itemID];
    [v7 appendFormat:@"itemID = %@|", v12];
  }
  if ([v8 hasErrorDomain])
  {
    id v13 = [v8 errorDomain];
    uint64_t v14 = [v8 errorCode];
    float v15 = [v8 errorDescription];
    uint64_t v16 = [v8 underlyingErrorDomain];
    [v7 appendFormat:@"errorDomain = %@|errorCode = %lld| errorDescription = %@| underlyingErrorDomain = %@| underlyingErrorCode = %lld", v13, v14, v15, v16, objc_msgSend(v8, "underlyingErrorCode")];
  }
  return v7;
}

- (void)dumpDatabaseInfoToContext:(id)a3
{
  id v4 = a3;
  [v4 writeLineWithFormat:@"Pending Aggregated Telemetry"];
  [v4 writeLineWithFormat:@"-----------------------------------------------------"];
  session = self->_session;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __50__BRCAnalyticsReporter_dumpDatabaseInfoToContext___block_invoke;
  v7[3] = &unk_26507F940;
  id v8 = v4;
  id v6 = v4;
  +[BRCAnalyticsReporter _enumerateAggregatedTelemetryForSession:session withBlock:v7];
  [v6 writeEmptyLine];
}

void __50__BRCAnalyticsReporter_dumpDatabaseInfoToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[BRCAnalyticsReporter _aggregatedTelemetryDescription:a2];
  [v2 writeLineWithFormat:@"%@", v3];
}

- (void)dumpToContext:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29[0] = BRCEventKindFSEventToSyncUp;
  v29[1] = BRCEventKindUserDownload;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  [v4 writeLineWithFormat:@"analytics metrics"];
  [v4 writeLineWithFormat:@"-----------------------------------------------------"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x2455D97F0]();
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __38__BRCAnalyticsReporter_dumpToContext___block_invoke;
        v21[3] = &unk_26507F968;
        id v22 = v4;
        uint64_t v23 = v10;
        [(BRCAnalyticsReporter *)self _withEventMetricsOfKind:v10 accessor:v21];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  [v4 writeLineWithFormat:@"SyncHealthReport:"];
  syncHealthReport = self->_syncHealthReport;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __38__BRCAnalyticsReporter_dumpToContext___block_invoke_2;
  v19[3] = &unk_26507F990;
  id v13 = v4;
  id v20 = v13;
  [(BRCSyncHealthReport *)syncHealthReport syncErrors:v19];
  [v13 writeLineWithFormat:&stru_26F3822F0];
  [v13 writeLineWithFormat:@"Aggregated Telemetry:"];
  uint64_t v14 = self->_syncHealthReport;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __38__BRCAnalyticsReporter_dumpToContext___block_invoke_3;
  v17[3] = &unk_26507F990;
  id v18 = v13;
  id v15 = v13;
  [(BRCSyncHealthReport *)v14 dumpAggregatedEvents:v17];
  [v15 writeLineWithFormat:&stru_26F3822F0];
}

uint64_t __38__BRCAnalyticsReporter_dumpToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@: %@", *(void *)(a1 + 40), a2];
}

uint64_t __38__BRCAnalyticsReporter_dumpToContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@", a2];
}

uint64_t __38__BRCAnalyticsReporter_dumpToContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@", a2];
}

- (void)createFSEventToSyncUpEventForFileID:(unint64_t)a3 genID:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__BRCAnalyticsReporter_createFSEventToSyncUpEventForFileID_genID___block_invoke;
  v4[3] = &__block_descriptor_44_e24_v16__0__NSMutableArray_8l;
  v4[4] = a3;
  unsigned int v5 = a4;
  [(BRCAnalyticsReporter *)self _withEventMetricsOfKind:BRCEventKindFSEventToSyncUp accessor:v4];
}

void __66__BRCAnalyticsReporter_createFSEventToSyncUpEventForFileID_genID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = [v3 objectAtIndexedSubscript:v4];
      uint64_t v7 = [v6 fileID];

      if (v5 == v7) {
        break;
      }
      if (++v4 >= (unint64_t)[v3 count]) {
        goto LABEL_8;
      }
    }
    int v8 = *(_DWORD *)(a1 + 40);
    uint64_t v9 = [v3 objectAtIndexedSubscript:v4];
    int v10 = [v9 genID];

    if (v8 != v10) {
      [v3 removeObjectAtIndex:v4];
    }
  }
LABEL_8:
  if ((unint64_t)[v3 count] <= 9)
  {
    uint64_t v11 = [BRCFSEventToSyncUpEvent alloc];
    id v12 = [(BRCEventMetric *)v11 initWithEventName:BRCEventKindFSEventToSyncUp];
    id v13 = [MEMORY[0x263EFF910] date];
    [(BRCEventMetric *)v12 setStartTime:v13];

    [(BRCFSEventToSyncUpEvent *)v12 setFileID:*(void *)(a1 + 32)];
    [(BRCFSEventToSyncUpEvent *)v12 setGenID:*(unsigned int *)(a1 + 40)];
    [v3 addObject:v12];
    uint64_t v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __66__BRCAnalyticsReporter_createFSEventToSyncUpEventForFileID_genID___block_invoke_cold_1();
    }
  }
}

- (void)lookupFSEventToSyncUpEventByFileID:(unint64_t)a3 genID:(unsigned int)a4 accessor:(id)a5
{
  id v8 = a5;
  uint64_t v9 = BRCEventKindFSEventToSyncUp;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__BRCAnalyticsReporter_lookupFSEventToSyncUpEventByFileID_genID_accessor___block_invoke;
  v11[3] = &unk_26507F9D8;
  unsigned int v14 = a4;
  id v12 = v8;
  unint64_t v13 = a3;
  id v10 = v8;
  [(BRCAnalyticsReporter *)self _withEventMetricsOfKind:v9 accessor:v11];
}

void __74__BRCAnalyticsReporter_lookupFSEventToSyncUpEventByFileID_genID_accessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = *(void *)(a1 + 40);
        if (v9 == objc_msgSend(v8, "fileID", (void)v11))
        {
          int v10 = *(_DWORD *)(a1 + 48);
          if (v10 == [v8 genID])
          {
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)lookupFSEventToSyncUpEventByItemID:(id)a3 accessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BRCEventKindFSEventToSyncUp;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__BRCAnalyticsReporter_lookupFSEventToSyncUpEventByItemID_accessor___block_invoke;
  v11[3] = &unk_26507FA00;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(BRCAnalyticsReporter *)self _withEventMetricsOfKind:v8 accessor:v11];
}

void __68__BRCAnalyticsReporter_lookupFSEventToSyncUpEventByItemID_accessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(a1 + 32);
        id v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "itemID", (void)v10);
        LODWORD(v8) = [v8 isEqualToItemID:v9];

        if (v8)
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)createUserDownloadEventForOperationID:(id)a3 isRecursive:(BOOL)a4 isForBackup:(BOOL)a5
{
  id v8 = a3;
  uint64_t v9 = BRCEventKindUserDownload;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__BRCAnalyticsReporter_createUserDownloadEventForOperationID_isRecursive_isForBackup___block_invoke;
  v11[3] = &unk_26507FA28;
  id v12 = v8;
  BOOL v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  [(BRCAnalyticsReporter *)self _withEventMetricsOfKind:v9 accessor:v11];
}

void __86__BRCAnalyticsReporter_createUserDownloadEventForOperationID_isRecursive_isForBackup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 count] <= 9)
  {
    uint64_t v4 = [BRCUserDownloadEvent alloc];
    uint64_t v5 = [(BRCEventMetric *)v4 initWithEventName:BRCEventKindUserDownload];
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    [(BRCEventMetric *)v5 setStartTime:v6];

    [(BRCUserDownloadEvent *)v5 setOperationID:*(void *)(a1 + 32)];
    [(BRCUserDownloadEvent *)v5 setIsRecursiveDownload:*(unsigned __int8 *)(a1 + 40)];
    [(BRCUserDownloadEvent *)v5 setIsDownloadingForBackup:*(unsigned __int8 *)(a1 + 41)];
    [v3 addObject:v5];
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __86__BRCAnalyticsReporter_createUserDownloadEventForOperationID_isRecursive_isForBackup___block_invoke_cold_1();
    }
  }
}

- (void)lookupUserDownloadEventByOperationID:(id)a3 accessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BRCEventKindUserDownload;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__BRCAnalyticsReporter_lookupUserDownloadEventByOperationID_accessor___block_invoke;
  v11[3] = &unk_26507FA00;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(BRCAnalyticsReporter *)self _withEventMetricsOfKind:v8 accessor:v11];
}

void __70__BRCAnalyticsReporter_lookupUserDownloadEventByOperationID_accessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "operationID", (void)v10);
        int v9 = [v8 isEqual:*(void *)(a1 + 32)];

        if (v9)
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)lookupUserDownloadEventByFileObjectID:(id)a3 accessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BRCEventKindUserDownload;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__BRCAnalyticsReporter_lookupUserDownloadEventByFileObjectID_accessor___block_invoke;
  v11[3] = &unk_26507FA00;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(BRCAnalyticsReporter *)self _withEventMetricsOfKind:v8 accessor:v11];
}

void __71__BRCAnalyticsReporter_lookupUserDownloadEventByFileObjectID_accessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "fileObjectIDs", (void)v10);
        int v9 = [v8 containsObject:*(void *)(a1 + 32)];

        if (v9)
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)postReportForDefaultSubCategoryWithCategory:(unint64_t)a3 telemetryTimeEvent:(id)a4
{
  id v6 = [(BRCAppTelemetryConverter *)self->_appTelemetryConvertor dictionaryRepresentationFromEvent:a4];
  [(BRCRTCReporter *)self->_rtcReporter postReportWithCategory:a3 type:1 payload:v6 error:0];
}

+ (void)_enumerateAggregatedTelemetryForSession:(id)a3 withBlock:(id)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v27 = (void (**)(id, id))a4;
  uint64_t v23 = v5;
  id v6 = [v5 clientDB];
  id v7 = (void *)[v6 fetch:@"SELECT app_telemetry_identifier, zone_mangled_id, item_id, enhanced_drive_privacy_enabled, error_domain, error_code, error_description, underlying_error_domain, underlying_error_code, count FROM aggregated_daily_telemetry"];

  if ([v7 next])
  {
    uint64_t v24 = *MEMORY[0x263F08608];
    do
    {
      uint64_t v8 = MEMORY[0x2455D97F0]();
      uint64_t v9 = [v7 intAtIndex:0];
      long long v10 = [v7 stringAtIndex:1];
      if ([v10 length]) {
        double v32 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithMangledString:v10];
      }
      else {
        double v32 = 0;
      }
      long long v11 = [v7 stringAtIndex:2];
      if (![v11 length])
      {

        long long v11 = 0;
      }
      long long v12 = [v7 stringAtIndex:3];
      if ([v12 length])
      {
        __int16 v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isEqualToString:", @"1"));
      }
      else
      {
        __int16 v31 = 0;
      }
      long long v13 = [v7 stringAtIndex:4];
      uint64_t v14 = [v7 longLongAtIndex:5];
      __int16 v33 = [v7 stringAtIndex:6];
      uint64_t v15 = [v7 stringAtIndex:7];
      uint64_t v16 = [v7 longLongAtIndex:8];
      id v30 = v12;
      if ([v13 length])
      {
        long long v28 = v10;
        long long v29 = (void *)v8;
        double v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = [v15 length];
        if (v18)
        {
          uint64_t v34 = v24;
          long long v26 = [MEMORY[0x263F087E8] errorWithDomain:v15 code:v16 userInfo:0];
          v35[0] = v26;
          long long v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
          long long v19 = v25;
        }
        else
        {
          long long v19 = 0;
        }
        id v20 = objc_msgSend(v17, "br_errorWithDomain:code:userInfo:description:", v13, v14, v19, @"%@", v33);
        uint64_t v9 = v9;
        if (v18)
        {
        }
        long long v10 = v28;
        long long v21 = v29;
      }
      else
      {
        id v20 = 0;
        long long v21 = (void *)v8;
      }
      id v22 = +[AppTelemetryTimeSeriesEvent newAggregatedEventWithIdentifier:recordID:zoneMangledID:enhancedDrivePrivacyEnabled:error:count:](AppTelemetryTimeSeriesEvent, "newAggregatedEventWithIdentifier:recordID:zoneMangledID:enhancedDrivePrivacyEnabled:error:count:", v9, v11, v32, v31, v20, [v7 longLongAtIndex:9]);
      v27[2](v27, v22);
    }
    while (([v7 next] & 1) != 0);
  }
}

- (void)aggregateReportForAppTelemetryIdentifier:(int)a3 itemID:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(id)a6 error:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __120__BRCAnalyticsReporter_aggregateReportForAppTelemetryIdentifier_itemID_zoneMangledID_enhancedDrivePrivacyEnabled_error___block_invoke;
  v21[3] = &unk_26507FA78;
  void v21[4] = self;
  id v22 = v14;
  int v26 = a3;
  id v23 = v15;
  id v24 = v13;
  id v25 = v12;
  id v17 = v12;
  id v18 = v13;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(v16, v21);
}

void __120__BRCAnalyticsReporter_aggregateReportForAppTelemetryIdentifier_itemID_zoneMangledID_enhancedDrivePrivacyEnabled_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __120__BRCAnalyticsReporter_aggregateReportForAppTelemetryIdentifier_itemID_zoneMangledID_enhancedDrivePrivacyEnabled_error___block_invoke_2;
  v3[3] = &unk_26507FA50;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  int v8 = *(_DWORD *)(a1 + 72);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 performWithFlags:4 action:v3];
}

uint64_t __120__BRCAnalyticsReporter_aggregateReportForAppTelemetryIdentifier_itemID_zoneMangledID_enhancedDrivePrivacyEnabled_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v24 = a2;
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    int v4 = [v3 BOOLValue];
    id v5 = @"0";
    if (v4) {
      id v5 = @"1";
    }
    id v6 = v5;
  }
  else
  {
    id v6 = &stru_26F3822F0;
  }
  id v7 = [*(id *)(a1 + 40) userInfo];
  int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  uint64_t v9 = *(unsigned int *)(a1 + 64);
  long long v10 = [*(id *)(a1 + 48) mangledIDString];
  long long v11 = *(__CFString **)(a1 + 56);
  id v12 = [*(id *)(a1 + 40) domain];
  uint64_t v13 = [*(id *)(a1 + 40) code];
  objc_msgSend(*(id *)(a1 + 40), "br_errorDescription");
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v15 = [v8 domain];
  if (v8) {
    uint64_t v16 = [v8 code];
  }
  else {
    uint64_t v16 = 0;
  }
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = &stru_26F3822F0;
  }
  if (v14) {
    id v18 = v14;
  }
  else {
    id v18 = &stru_26F3822F0;
  }
  if (v12) {
    id v19 = v12;
  }
  else {
    id v19 = &stru_26F3822F0;
  }
  if (v11) {
    id v20 = v11;
  }
  else {
    id v20 = &stru_26F3822F0;
  }
  if (v10) {
    long long v21 = v10;
  }
  else {
    long long v21 = &stru_26F3822F0;
  }
  uint64_t v22 = [v24 execute:@"INSERT INTO aggregated_daily_telemetry (app_telemetry_identifier, zone_mangled_id, item_id, enhanced_drive_privacy_enabled, error_domain, error_code, error_description, underlying_error_domain, underlying_error_code) VALUES (%d, %@, %@, %@, %@, %ld, %@, %@, %ld) ON CONFLICT DO UPDATE SET count=count+1", v9, v21, v20, v6, v19, v13, v18, v17, v16];

  return v22;
}

- (void)aggregateReportForAppTelemetryIdentifier:(int)a3 error:(id)a4
{
}

- (void)deleteMissingErrorThrottles
{
  id v2 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  [v2 execute:@"DELETE FROM telemetry_failure_counts AS tf WHERE NOT EXISTS (SELECT 1 FROM server_items AS si WHERE si.item_id = tf.item_id AND si.zone_rowid = tf.zone_rowid) AND NOT item_id_is_root(tf.item_id)"];
}

- (void)didApplyItemInsideSharedItemID:(id)a3
{
  session = self->_session;
  id v5 = a3;
  id v6 = [(BRCAccountSessionFPFS *)session clientDB];
  [v6 assertOnQueue];

  LODWORD(v6) = [v5 isEqualToItemGlobalID:self->_currentTelemetryItemGlobalID];
  if (v6)
  {
    currentTelemetryItemGlobalID = self->_currentTelemetryItemGlobalID;
    self->_currentTelemetryItemGlobalID = 0;
  }
}

+ (BOOL)isTelemetryReportingEnabled
{
  id v2 = +[BRCUserDefaults defaultsForMangledID:0];
  int v3 = [v2 shouldReportTelemetryEvents];

  if (!v3) {
    return 0;
  }
  if (CFPreferencesGetAppBooleanValue(@"AllowiCloudAnalytics", @"com.apple.Preferences", 0)) {
    return 1;
  }
  id v5 = (void *)MEMORY[0x263F32628];
  return [v5 isInternalBuild];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appTelemetryConvertor, 0);
  objc_storeStrong((id *)&self->_rtcReporter, 0);
  objc_storeStrong((id *)&self->_syncConsistencyCancellationTimer, 0);
  objc_storeStrong((id *)&self->_syncConsistencyDeferralTimer, 0);
  objc_storeStrong((id *)&self->_currentTelemetryItemGlobalID, 0);
  objc_storeStrong((id *)&self->_syncHealthReport, 0);
  objc_storeStrong((id *)&self->_eventsByKind, 0);
  objc_storeStrong((id *)&self->_metricEndpoint, 0);
  objc_storeStrong((id *)&self->_waitOnIdleQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Failed to defer the activity for analytics%@", v2, v3, v4, v5, v6);
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Reporting analytics metrics%@", v2, v3, v4, v5, v6);
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_38_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] Failed to continue the xpc activity%@", v2, v3, v4, v5, v6);
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_42_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Checking sync consistency%@", v2, v3, v4, v5, v6);
}

- (void)_handleApplySchedulerTimeoutWithActivity:telemetryEventType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Defering app telemetry gather for now%@", v2, v3, v4, v5, v6);
}

- (void)_handleApplySchedulerTimeoutWithActivity:telemetryEventType:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] Failed to defer the app telemetry xpc activity%@", v2, v3, v4, v5, v6);
}

- (void)_handleApplySchedulerTimeoutWithActivity:telemetryEventType:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] Failed to finish the app telemetry xpc activity%@", v2, v3, v4, v5, v6);
}

- (void)_gatherAppTelemetryEventsWithActivity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Finishing app telemetry gather because the session logged out%@", v2, v3, v4, v5, v6);
}

- (void)_gatherAppTelemetryEventsWithActivity:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] Failed to set the app telemetry xpc activity state to done%@", v2, v3, v4, v5, v6);
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] Failed to finish the app telemetry activity%@", v2, v3, v4, v5, v6);
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: %@ should be a directory%@");
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)a1 + 64);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: We are already checking telemetry on %@%@", (void)v3, DWORD2(v3));
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_66_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] Failed to generate a report for shared folder %@%@", (void)v3, DWORD2(v3));
}

- (void)_setupSyncConsistencyDeferralTimerWithActivity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Already have a deferral timer registered%@", v2, v3, v4, v5, v6);
}

void __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Can't defer the sync consistency activity%@", v2, v3, v4, v5, v6);
}

- (void)_setupSyncConsistencyCancellationTimerWithActivity:session:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Already have a cancellation timer registered%@", v2, v3, v4, v5, v6);
}

- (void)_resumePausedTreeConsistencyCheckOperationWithActivity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Successfully resumed existing tree consistency operation%@", v2, v3, v4, v5, v6);
}

- (void)_resumePausedTreeConsistencyCheckOperationWithActivity:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Failed resuming tree consistency operation%@", v2, v3, v4, v5, v6);
}

void __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] error connecting to telemetry-disk-checker xpc service: %@%@");
}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Failed to defer the xpc activity%@", v2, v3, v4, v5, v6);
}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Deferring activity because a snapshot already exists%@", v2, v3, v4, v5, v6);
}

void __66__BRCAnalyticsReporter_createFSEventToSyncUpEventForFileID_genID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  [v0 fileID];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_12_0(&dword_23FA42000, v1, v2, "[DEBUG] analytics: creating %@ event for fileID %lld%@", v3, v4, v5, v6, 2u);
}

void __86__BRCAnalyticsReporter_createUserDownloadEventForOperationID_isRecursive_isForBackup___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_13_1();
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v1, v2, "[DEBUG] analytics: creating %@ event%@", v3);
}

@end