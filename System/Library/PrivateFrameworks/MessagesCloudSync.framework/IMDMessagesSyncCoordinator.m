@interface IMDMessagesSyncCoordinator
+ (BOOL)isSyncing;
+ (id)configureWithDelegate:(id)a3;
+ (id)readServerCountsFromDefaults;
+ (id)scheduleAttachmentAssetDownloadWithDelegate:(id)a3;
+ (id)scheduleBackfillSyncWithDelegate:(id)a3;
+ (id)scheduleBackupSyncWithDelegate:(id)a3;
+ (id)schedulePeriodicSyncWithDelegate:(id)a3;
+ (id)scheduleTelemetrySyncWithDelegate:(id)a3;
+ (id)startInitialSyncWithDelegate:(id)a3;
+ (id)startUserInitiatedSyncWithDelegate:(id)a3;
+ (int64_t)currentTelemetryVersion;
+ (void)clearLocalCountsWhenSafe;
+ (void)clearSyncStoreWhenSafe;
+ (void)fetchSyncStoreCountsWithCompletion:(id)a3;
+ (void)initiateSync:(id)a3 forceRunNow:(BOOL)a4 reply:(id)a5;
+ (void)registerBackupController:(id)a3;
+ (void)registerErrorAnalyzer:(id)a3;
+ (void)registerNotifier:(id)a3;
+ (void)registerPreReqsVerifier:(id)a3;
+ (void)registerStore:(id)a3 asType:(int64_t)a4;
+ (void)registerSyncStateManager:(id)a3;
+ (void)registerSyncTokenStore:(id)a3;
@end

@implementation IMDMessagesSyncCoordinator

+ (id)configureWithDelegate:(id)a3
{
  id v6 = 0;
  objc_msgSend_configureWith_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v6, v3);
  id v4 = v6;
  return v4;
}

+ (id)startInitialSyncWithDelegate:(id)a3
{
  id v9 = 0;
  int started = objc_msgSend_startInitialSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  id v5 = v9;
  id v6 = v5;
  if (started) {
    id v5 = 0;
  }
  id v7 = v5;

  return v7;
}

+ (id)scheduleBackfillSyncWithDelegate:(id)a3
{
  id v9 = 0;
  int v4 = objc_msgSend_scheduleBackfillSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  id v5 = v9;
  id v6 = v5;
  if (v4) {
    id v5 = 0;
  }
  id v7 = v5;

  return v7;
}

+ (id)schedulePeriodicSyncWithDelegate:(id)a3
{
  id v9 = 0;
  int v4 = objc_msgSend_schedulePeriodicSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  id v5 = v9;
  id v6 = v5;
  if (v4) {
    id v5 = 0;
  }
  id v7 = v5;

  return v7;
}

+ (id)scheduleBackupSyncWithDelegate:(id)a3
{
  id v9 = 0;
  int v4 = objc_msgSend_scheduleBackupSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  id v5 = v9;
  id v6 = v5;
  if (v4) {
    id v5 = 0;
  }
  id v7 = v5;

  return v7;
}

+ (id)scheduleAttachmentAssetDownloadWithDelegate:(id)a3
{
  id v9 = 0;
  int v4 = objc_msgSend_scheduleAttachmentAssetDownloadSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  id v5 = v9;
  id v6 = v5;
  if (v4) {
    id v5 = 0;
  }
  id v7 = v5;

  return v7;
}

+ (id)scheduleTelemetrySyncWithDelegate:(id)a3
{
  id v9 = 0;
  int v4 = objc_msgSend_scheduleTelemetrySyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  id v5 = v9;
  id v6 = v5;
  if (v4) {
    id v5 = 0;
  }
  id v7 = v5;

  return v7;
}

+ (id)startUserInitiatedSyncWithDelegate:(id)a3
{
  id v9 = 0;
  int started = objc_msgSend_startUserInitiatedSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  id v5 = v9;
  id v6 = v5;
  if (started) {
    id v5 = 0;
  }
  id v7 = v5;

  return v7;
}

+ (void)registerErrorAnalyzer:(id)a3
{
}

+ (void)registerSyncTokenStore:(id)a3
{
}

+ (void)registerSyncStateManager:(id)a3
{
}

+ (void)registerBackupController:(id)a3
{
}

+ (void)registerStore:(id)a3 asType:(int64_t)a4
{
}

+ (void)registerPreReqsVerifier:(id)a3
{
}

+ (void)registerNotifier:(id)a3
{
}

+ (void)initiateSync:(id)a3 forceRunNow:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v7 = (void (**)(id, BOOL, void *))a5;
  uint64_t v10 = 0;
  id v9 = objc_msgSend_initiateSyncFor_delegate_forceRunNow_error_(IMDMessagesSyncCoordinatorInternal, v8, (uint64_t)a3, 0, v5, &v10);
  if (v7) {
    v7[2](v7, v10 == 0, v9);
  }
}

+ (id)readServerCountsFromDefaults
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x270F9A6D0])(IMDMessagesSyncCoordinatorInternal, sel_readServerCountsFromDefaults);
}

+ (void)fetchSyncStoreCountsWithCompletion:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_22331A5F8;
  v8[3] = &unk_2646A9420;
  id v9 = v3;
  id v4 = v3;
  objc_msgSend_fetchSyncStoreCountsWithCompletion_(IMDMessagesSyncCoordinatorInternal, v5, (uint64_t)v8, v6, v7);
}

+ (void)clearSyncStoreWhenSafe
{
}

+ (void)clearLocalCountsWhenSafe
{
}

+ (BOOL)isSyncing
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x270F9A6D0])(IMDMessagesSyncCoordinatorInternal, sel_isSyncing);
}

+ (int64_t)currentTelemetryVersion
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x270F9A6D0])(IMDMessagesSyncCoordinatorInternal, sel_currentTelemetrySyncVersion);
}

@end