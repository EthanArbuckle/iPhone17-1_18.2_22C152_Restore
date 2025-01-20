@interface MBManager
- (BOOL)addFileToBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 fromPath:(id)a7 error:(id *)a8;
- (BOOL)airTrafficShouldCreateAppPlaceholdersWithError:(id *)a3;
- (BOOL)allowiTunesBackup;
- (BOOL)archiveLogsTo:(id)a3 error:(id *)a4;
- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4;
- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4;
- (BOOL)clearAllPendingFollowUpsWithError:(id *)a3;
- (BOOL)countCameraRollQuota;
- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4;
- (BOOL)deleteBackupUDID:(id)a3 error:(id *)a4;
- (BOOL)deleteItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 error:(id *)a7;
- (BOOL)discountCameraRollQuota;
- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4;
- (BOOL)exitMegaBackupMode:(id *)a3;
- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 error:(id *)a8;
- (BOOL)inheritSnapshot:(id)a3 fromDevice:(id)a4 error:(id *)a5;
- (BOOL)isBackupEnabled;
- (BOOL)isBackupEnabledForDomainName:(id)a3;
- (BOOL)isBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4;
- (BOOL)isBackupOnCellularEnabledWithError:(id *)a3;
- (BOOL)isInitialMegaBackupCompleted:(id *)a3;
- (BOOL)isLocalBackupPasswordSetWithError:(id *)a3;
- (BOOL)isManualBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4;
- (BOOL)logPrebuddyFlowTelemetry:(int64_t)a3 error:(id *)a4;
- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 error:(id *)a5;
- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5;
- (BOOL)postFollowUpForBackgroundRestoreProgress:(id)a3 error:(id *)a4;
- (BOOL)postFollowUpForDrySpellWithDuration:(double)a3 firstBackup:(BOOL)a4 error:(id *)a5;
- (BOOL)postFollowUpForRestoreFailedWithDomainNames:(id)a3 error:(id *)a4;
- (BOOL)postFollowUpForRestoreFinishedWithError:(id *)a3 skipiCloudQuotaOffer:(BOOL)a4;
- (BOOL)postFollowUpForRestoreTimeoutWithError:(id *)a3;
- (BOOL)prepareForBackgroundRestoreWithError:(id *)a3;
- (BOOL)recordRestoreFailure:(id)a3 error:(id *)a4;
- (BOOL)removeDomainName:(id)a3 error:(id *)a4;
- (BOOL)requestMegaBackupExpirationDate:(id)a3 error:(id *)a4;
- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 context:(id)a5 error:(id *)a6;
- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 error:(id *)a5;
- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 withQOS:(int64_t)a5 context:(id)a6 error:(id *)a7;
- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)restoreBookWithPath:(id)a3 error:(id *)a4;
- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4;
- (BOOL)restoreFileExistsWithPath:(id)a3;
- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)restoreFileWithPath:(id)a3 error:(id *)a4;
- (BOOL)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7 progress:(id)a8;
- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)restoreFilesWithPaths:(id)a3 error:(id *)a4;
- (BOOL)restorePreviousSettingsEnabledForMegaBackup:(id *)a3;
- (BOOL)restoreSupportsBatching;
- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4;
- (BOOL)saveKeybagsForBackupUDID:(id)a3 withError:(id *)a4;
- (BOOL)setBackupOnCellularEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setEntryPointForMegaBackupTelemetry:(int64_t)a3 error:(id *)a4;
- (BOOL)setMegaBackupTurnOnAllAppsSyncTelemetry:(BOOL)a3 error:(id *)a4;
- (BOOL)setMegaBackupTurnOniCloudBackupTelemetry:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrebuddyUIDeltaTelemetry:(id)a3 date:(id)a4 error:(id *)a5;
- (BOOL)setupBackupWithPasscode:(id)a3 error:(id *)a4;
- (BOOL)startBackupWithError:(id *)a3;
- (BOOL)startBackupWithOptions:(id)a3 error:(id *)a4;
- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 error:(id *)a5;
- (BOOL)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5;
- (BOOL)startScanForBundleIDs:(id)a3 error:(id *)a4;
- (BOOL)startScanWithError:(id *)a3;
- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5;
- (BOOL)unsetLocalBackupPasswordWithError:(id *)a3;
- (BOOL)updateMegaBackupExpirationDate:(id)a3 error:(id *)a4;
- (BOOL)wasBackupEnabledForMegaBackup:(id *)a3;
- (MBManager)init;
- (MBManager)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5;
- (MBManager)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5 error:(id *)a6;
- (MBManager)initWithDelegate:(id)a3;
- (MBManager)initWithDelegate:(id)a3 eventQueue:(id)a4;
- (MBManager)initWithDelegate:(id)a3 eventQueue:(id)a4 personaIdentifier:(id)a5;
- (MBManagerDelegate)delegate;
- (id)_init;
- (id)backgroundRestoreCellularAccessWithError:(id *)a3;
- (id)backgroundRestoreInfo;
- (id)backupDeviceUDID;
- (id)backupDeviceUUID;
- (id)backupList;
- (id)backupState;
- (id)dateOfLastBackup;
- (id)dateOfLastBackupWithError:(id *)a3;
- (id)dateOfNextScheduledBackup;
- (id)dateOfNextScheduledBackupWithError:(id *)a3;
- (id)disabledDomainInfos;
- (id)domainInfoForName:(id)a3;
- (id)domainInfoList;
- (id)dryRestore:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- (id)fetchBackupCKRecordsIntoDB:(id *)a3;
- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5;
- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6;
- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5;
- (id)getAppleIDsMapForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6;
- (id)getBackupListWithError:(id *)a3;
- (id)getBackupListWithFiltering:(BOOL)a3 error:(id *)a4;
- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5;
- (id)journalForBackupUUID:(id)a3 error:(id *)a4;
- (id)journalLastModifiedForBackupUUID:(id)a3 error:(id *)a4;
- (id)nextBackupSizeInfo;
- (id)personalPersonaIdentifier;
- (id)reservedBackupSizeListWithError:(id *)a3;
- (id)restoreFailuresForDataclass:(id)a3 assetType:(id)a4 range:(_NSRange)a5;
- (id)restoreFilesForDomain:(id)a3 error:(id *)a4;
- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 error:(id *)a6;
- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7;
- (id)restoreInfo;
- (id)restoreState;
- (id)restoreStateWithError:(id *)a3;
- (id)scheduleActivities:(id)a3 error:(id *)a4;
- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 error:(id *)a5;
- (unint64_t)backupOnCellularSupportWithAccount:(id)a3 error:(id *)a4;
- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4;
- (unint64_t)nextBackupSize;
- (void)cancel;
- (void)cancelRestore;
- (void)clearRestoreSession;
- (void)fetchAppBundleIDsForSnapshot:(id)a3 completion:(id)a4;
- (void)fetchBackgroundRestoreCellularAccessWithCompletion:(id)a3;
- (void)fetchRestorableSnapshotsWithCompletion:(id)a3;
- (void)fetchiCloudRestoreIsCompleteWithCompletion:(id)a3;
- (void)finishRestore;
- (void)insufficientFreeSpaceToRestore;
- (void)prioritizeRestoreFileWithPath:(id)a3;
- (void)rebootDevice;
- (void)rebootDevice:(BOOL)a3;
- (void)restoreFileWithPath:(id)a3;
- (void)saveBackgroundRestoreCellularAccess:(id)a3 completion:(id)a4;
- (void)saveBackupDomainsEnabledForMegaBackup:(id)a3;
- (void)saveBackupEnabledForMegaBackup;
- (void)saveSyncSettingsEnabledForMegaBackup:(id)a3;
- (void)setAllowiTunesBackup:(BOOL)a3;
- (void)setBackupEnabled:(BOOL)a3;
- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRestoreQualityOfService:(int64_t)a3;
- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4;
- (void)setSupportsiTunes:(BOOL)a3;
- (void)startBackup;
- (void)startDataTransferWithPreflightInfo:(id)a3 completionHandler:(id)a4;
- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completionHandler:(id)a4;
- (void)startKeychainDataTransferWithCompletionHandler:(id)a3;
- (void)startKeychainTransferWithCompletionHandler:(id)a3;
- (void)startPreflightWithCompletionHandler:(id)a3;
- (void)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4;
- (void)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 options:(id)a5 completion:(id)a6;
- (void)startRestoreForSnapshot:(id)a3 options:(id)a4 completion:(id)a5;
- (void)syncBackupEnabled;
@end

@implementation MBManager

- (void).cxx_destruct
{
}

- (MBManager)initWithDelegate:(id)a3
{
  return [(MBManager *)self initWithDelegate:a3 eventQueue:MEMORY[0x1E4F14428]];
}

- (MBManager)initWithDelegate:(id)a3 eventQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[MBXPCClient alloc] initWithDelegate:v7 eventQueue:v6];

  return &v8->super;
}

- (void)setDelegate:(id)a3
{
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MBManager;
  return [(MBManager *)&v3 init];
}

- (MBManager)init
{
  return [(MBManager *)self initWithDelegate:0 eventQueue:MEMORY[0x1E4F14428]];
}

- (MBManager)initWithDelegate:(id)a3 eventQueue:(id)a4 personaIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[MBXPCClient alloc] initWithDelegate:v10 eventQueue:v9 personaIdentifier:v8];

  return &v11->super;
}

- (MBManager)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[MBXPCClient alloc] initWithAccount:v10 delegate:v9 eventQueue:v8];

  return &v11->super;
}

- (MBManager)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[MBXPCClient alloc] initWithAccount:v12 delegate:v11 eventQueue:v10 error:a6];

  return &v13->super;
}

- (void)setSupportsiTunes:(BOOL)a3
{
}

- (BOOL)setupBackupWithPasscode:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)isBackupEnabled
{
  return 0;
}

- (void)setBackupEnabled:(BOOL)a3
{
}

- (void)syncBackupEnabled
{
}

- (BOOL)isLocalBackupPasswordSetWithError:(id *)a3
{
  return 0;
}

- (BOOL)unsetLocalBackupPasswordWithError:(id *)a3
{
  return 0;
}

- (id)backupState
{
  return 0;
}

- (id)backupDeviceUUID
{
  return 0;
}

- (id)backupDeviceUDID
{
  return 0;
}

- (id)backupList
{
  return 0;
}

- (id)getBackupListWithError:(id *)a3
{
  return 0;
}

- (id)getBackupListWithFiltering:(BOOL)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)inheritSnapshot:(id)a3 fromDevice:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)recordRestoreFailure:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)restoreFailuresForDataclass:(id)a3 assetType:(id)a4 range:(_NSRange)a5
{
  return 0;
}

- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4
{
  return 0;
}

- (void)startBackup
{
}

- (BOOL)startBackupWithError:(id *)a3
{
  return 0;
}

- (BOOL)startBackupWithOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)journalLastModifiedForBackupUUID:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)journalForBackupUUID:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)restoreState
{
  return 0;
}

- (id)restoreStateWithError:(id *)a3
{
  return 0;
}

- (unint64_t)backupOnCellularSupportWithAccount:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)fetchiCloudRestoreIsCompleteWithCompletion:(id)a3
{
  id v5 = a3;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (id)backgroundRestoreInfo
{
  return 0;
}

- (BOOL)restoreFileExistsWithPath:(id)a3
{
  return 0;
}

- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4
{
  return 0;
}

- (id)restoreFilesForDomain:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 error:(id *)a6
{
  return 0;
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7
{
  return 0;
}

- (BOOL)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7 progress:(id)a8
{
  return 0;
}

- (void)prioritizeRestoreFileWithPath:(id)a3
{
}

- (id)dateOfLastBackup
{
  return 0;
}

- (id)dateOfNextScheduledBackup
{
  return 0;
}

- (id)dateOfLastBackupWithError:(id *)a3
{
  return 0;
}

- (id)dateOfNextScheduledBackupWithError:(id *)a3
{
  return 0;
}

- (BOOL)restoreSupportsBatching
{
  return 0;
}

- (void)setRestoreQualityOfService:(int64_t)a3
{
}

- (void)saveBackgroundRestoreCellularAccess:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  v6[2](v6, 0);
}

- (void)fetchBackgroundRestoreCellularAccessWithCompletion:(id)a3
{
  id v5 = a3;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (id)backgroundRestoreCellularAccessWithError:(id *)a3
{
  return 0;
}

- (void)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4
{
}

- (BOOL)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

- (void)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  id v8 = (void (**)(id, void))a6;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  v8[2](v8, 0);
}

- (BOOL)restoreFileWithPath:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)restoreFileWithPath:(id)a3
{
}

- (BOOL)restoreFilesWithPaths:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)restoreBookWithPath:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 withQOS:(int64_t)a5 context:(id)a6 error:(id *)a7
{
  return 0;
}

- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)saveKeybagsForBackupUDID:(id)a3 withError:(id *)a4
{
  return 0;
}

- (void)finishRestore
{
}

- (void)insufficientFreeSpaceToRestore
{
}

- (void)cancel
{
}

- (void)cancelRestore
{
}

- (BOOL)deleteBackupUDID:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)startScanWithError:(id *)a3
{
  return 0;
}

- (BOOL)startScanForBundleIDs:(id)a3 error:(id *)a4
{
  return 0;
}

- (unint64_t)nextBackupSize
{
  return 0;
}

- (id)nextBackupSizeInfo
{
  return 0;
}

- (id)domainInfoForName:(id)a3
{
  return 0;
}

- (id)domainInfoList
{
  return 0;
}

- (id)disabledDomainInfos
{
  return 0;
}

- (BOOL)removeDomainName:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)reservedBackupSizeListWithError:(id *)a3
{
  return 0;
}

- (BOOL)isBackupEnabledForDomainName:(id)a3
{
  return 0;
}

- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4
{
}

- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 error:(id *)a8
{
  return 0;
}

- (BOOL)addFileToBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 fromPath:(id)a7 error:(id *)a8
{
  return 0;
}

- (BOOL)deleteItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 error:(id *)a7
{
  return 0;
}

- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6
{
  return 0;
}

- (id)getAppleIDsMapForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6
{
  return 0;
}

- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

- (id)restoreInfo
{
  return 0;
}

- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4
{
}

- (void)clearRestoreSession
{
}

- (void)setAllowiTunesBackup:(BOOL)a3
{
}

- (BOOL)allowiTunesBackup
{
  return 0;
}

- (BOOL)airTrafficShouldCreateAppPlaceholdersWithError:(id *)a3
{
  return 1;
}

- (BOOL)countCameraRollQuota
{
  return 0;
}

- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)discountCameraRollQuota
{
  return 0;
}

- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)rebootDevice
{
}

- (void)rebootDevice:(BOOL)a3
{
}

- (BOOL)prepareForBackgroundRestoreWithError:(id *)a3
{
  return 0;
}

- (BOOL)archiveLogsTo:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)fetchAppBundleIDsForSnapshot:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
}

- (void)fetchRestorableSnapshotsWithCompletion:(id)a3
{
  id v5 = a3;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void)startRestoreForSnapshot:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void))a5;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  v7[2](v7, 0);
}

- (BOOL)isBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)isManualBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)isBackupOnCellularEnabledWithError:(id *)a3
{
  return 0;
}

- (BOOL)setBackupOnCellularEnabled:(BOOL)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)setEntryPointForMegaBackupTelemetry:(int64_t)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)setPrebuddyUIDeltaTelemetry:(id)a3 date:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)logPrebuddyFlowTelemetry:(int64_t)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4
{
  return 0;
}

- (void)startPreflightWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void)startKeychainTransferWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  v5[2](v5, 0);
}

- (void)startKeychainDataTransferWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  v6[2](v6, 0);
}

- (void)startDataTransferWithPreflightInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  [(MBManager *)self doesNotRecognizeSelector:a2];
  v6[2](v6, 0);
}

- (BOOL)isInitialMegaBackupCompleted:(id *)a3
{
  return 0;
}

- (void)saveBackupEnabledForMegaBackup
{
}

- (BOOL)wasBackupEnabledForMegaBackup:(id *)a3
{
  return 0;
}

- (void)saveSyncSettingsEnabledForMegaBackup:(id)a3
{
}

- (void)saveBackupDomainsEnabledForMegaBackup:(id)a3
{
}

- (BOOL)restorePreviousSettingsEnabledForMegaBackup:(id *)a3
{
  return 0;
}

- (BOOL)requestMegaBackupExpirationDate:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)updateMegaBackupExpirationDate:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)exitMegaBackupMode:(id *)a3
{
  return 0;
}

- (BOOL)setMegaBackupTurnOniCloudBackupTelemetry:(BOOL)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)setMegaBackupTurnOnAllAppsSyncTelemetry:(BOOL)a3 error:(id *)a4
{
  return 0;
}

- (id)personalPersonaIdentifier
{
  return 0;
}

- (BOOL)postFollowUpForDrySpellWithDuration:(double)a3 firstBackup:(BOOL)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)postFollowUpForRestoreTimeoutWithError:(id *)a3
{
  return 0;
}

- (BOOL)clearAllPendingFollowUpsWithError:(id *)a3
{
  return 0;
}

- (BOOL)postFollowUpForBackgroundRestoreProgress:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)postFollowUpForRestoreFinishedWithError:(id *)a3 skipiCloudQuotaOffer:(BOOL)a4
{
  return 0;
}

- (BOOL)postFollowUpForRestoreFailedWithDomainNames:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)fetchBackupCKRecordsIntoDB:(id *)a3
{
  return 0;
}

- (id)scheduleActivities:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)dryRestore:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  return 0;
}

- (MBManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MBManagerDelegate *)WeakRetained;
}

@end