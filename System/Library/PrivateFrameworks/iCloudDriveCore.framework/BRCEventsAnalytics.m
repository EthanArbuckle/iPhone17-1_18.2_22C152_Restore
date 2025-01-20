@interface BRCEventsAnalytics
+ (id)sharedAnalytics;
- (void)_sendDictionaryToCoreAnalytics:(id)a3 eventName:(id)a4;
- (void)registerAndSendNewApplyFailureWithOutcome:(id)a3;
- (void)registerAndSendNewContainerResetWithOutcome:(id)a3;
- (void)registerAndSendNewFolderSharePCSChainingTime:(double)a3 chainedRecordsCount:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(BOOL)a6 itemIDString:(id)a7 error:(id)a8 analyticsReporter:(id)a9;
- (void)registerAndSendNewPeriodicSyncWithOutcome:(id)a3;
- (void)registerAndSendNewShareAcceptationWithLastStep:(id)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6 error:(id)a7 analyticsReporter:(id)a8;
@end

@implementation BRCEventsAnalytics

+ (id)sharedAnalytics
{
  if (sharedAnalytics_onceToken != -1) {
    dispatch_once(&sharedAnalytics_onceToken, &__block_literal_global_64);
  }
  v2 = (void *)sharedAnalytics_analytics;
  return v2;
}

void __37__BRCEventsAnalytics_sharedAnalytics__block_invoke()
{
  v0 = objc_alloc_init(BRCEventsAnalytics);
  v1 = (void *)sharedAnalytics_analytics;
  sharedAnalytics_analytics = (uint64_t)v0;
}

- (void)registerAndSendNewShareAcceptationWithLastStep:(id)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6 error:(id)a7 analyticsReporter:(id)a8
{
  BOOL v11 = a5;
  id v21 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if ((objc_msgSend(v16, "brc_isFrontBoardOpenApplicationRequestDenied") & 1) == 0)
  {
    if (v16)
    {
      v18 = +[BRCAutoBugCaptureReporter sharedABCReporter];
      [v18 captureLogsForOperationType:@"FolderSharing" ofSubtype:@"ShareAcceptation" forError:v16];
    }
    id v19 = +[AppTelemetryTimeSeriesEvent newShareAcceptationEventWithLastStep:v21 zoneMangledID:v14 enhancedDrivePrivacyEnabled:v11 itemIDString:v15 error:v16];
    [v17 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v19];
    v20 = objc_opt_new();
    [v20 setObject:v21 forKey:@"lastStep"];
    [v20 setObject:@"none" forKey:@"error"];
    register_error_in_dictionary(v20, v16);
    [(BRCEventsAnalytics *)self _sendDictionaryToCoreAnalytics:v20 eventName:@"com.apple.iCloudDrive.shareAcceptation"];
  }
}

- (void)registerAndSendNewPeriodicSyncWithOutcome:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setObject:v4 forKey:@"periodicSync"];

  [(BRCEventsAnalytics *)self _sendDictionaryToCoreAnalytics:v5 eventName:@"com.apple.iCloudDrive.periodicSync"];
}

- (void)registerAndSendNewContainerResetWithOutcome:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setObject:v4 forKey:@"containerReset"];

  [(BRCEventsAnalytics *)self _sendDictionaryToCoreAnalytics:v5 eventName:@"com.apple.iCloudDrive.containerReset"];
}

- (void)registerAndSendNewApplyFailureWithOutcome:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setObject:v4 forKey:@"applyFailure"];

  [(BRCEventsAnalytics *)self _sendDictionaryToCoreAnalytics:v5 eventName:@"com.apple.iCloudDrive.applyFailure"];
}

- (void)registerAndSendNewFolderSharePCSChainingTime:(double)a3 chainedRecordsCount:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(BOOL)a6 itemIDString:(id)a7 error:(id)a8 analyticsReporter:(id)a9
{
  BOOL v12 = a6;
  id v25 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (v18)
  {
    v20 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v20 captureLogsForOperationType:@"FolderSharing" ofSubtype:@"PCSChaining" forError:v18];
  }
  id v21 = objc_msgSend(v18, "brc_cloudKitErrorMessage");
  id v22 = +[AppTelemetryTimeSeriesEvent newFolderSharePCSChainingEventWithTime:v16 zoneMangledID:v12 enhancedDrivePrivacyEnabled:v17 itemIDString:v18 error:v21 errorDescription:a3];

  [v19 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v22];
  v23 = objc_opt_new();
  v24 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a3);
  [v23 setObject:v24 forKey:@"PCSChainingTime"];

  if (v25) {
    [v23 setObject:v25 forKey:@"numOfUnchainedFiles"];
  }
  register_error_in_dictionary(v23, v18);
  [(BRCEventsAnalytics *)self _sendDictionaryToCoreAnalytics:v23 eventName:@"com.apple.iCloudDrive.folderSharePCSChainingTime"];
}

- (void)_sendDictionaryToCoreAnalytics:(id)a3 eventName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[BRCAnalyticsReporter isTelemetryReportingEnabled])
  {
    v7 = [v5 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v7 isEqualToString:@"CKErrorDomain.2"])
      {
        v8 = brc_bread_crumbs();
        v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          -[BRCEventsAnalytics _sendDictionaryToCoreAnalytics:eventName:]((uint64_t)v8, v9);
        }
LABEL_9:
      }
    }
    else if (v7)
    {
      v8 = brc_bread_crumbs();
      v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BRCEventsAnalytics _sendDictionaryToCoreAnalytics:eventName:]((uint64_t)v7, (uint64_t)v8, v9);
      }
      goto LABEL_9;
    }
    AnalyticsIsEventUsed();
    id v10 = v5;
    AnalyticsSendEventLazy();
  }
}

id __63__BRCEventsAnalytics__sendDictionaryToCoreAnalytics_eventName___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_sendDictionaryToCoreAnalytics:(uint64_t)a1 eventName:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: ![errorString isEqualToString:@\"CKErrorDomain.2\"]%@", (uint8_t *)&v2, 0xCu);
}

- (void)_sendDictionaryToCoreAnalytics:(os_log_t)log eventName:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_23FA42000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: error string is not a string value %@%@", (uint8_t *)&v3, 0x16u);
}

@end