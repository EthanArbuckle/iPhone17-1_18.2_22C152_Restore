@interface MBCKTelemetry
+ (id)_dictToJSONString:(id)a3;
+ (void)sendBackgroundRestoreCompletion:(unint64_t)a3 snapshotUUID:(id)a4 snapshotIndex:(unint64_t)a5 snapshotFormat:(int64_t)a6 isRestoringUsingFileLists:(BOOL)a7 duration:(double)a8 peakMemoryUsage:(unint64_t)a9 error:(id)a10 fatalErrors:(id)a11 domainsTopNSizes:(id)a12 domainsTopNFileCount:(id)a13 failedDomains:(id)a14;
+ (void)sendBackgroundRestoreHeartbeat:(unint64_t)a3 restoreInfo:(id)a4;
+ (void)sendBackupEngineCompletionStatus:(id)a3 duration:(double)a4 peakMemoryUsage:(unint64_t)a5 error:(id)a6;
+ (void)sendBackupEngineStateChangeStatus:(id)a3 state:(unint64_t)a4 start:(id)a5 end:(id)a6;
+ (void)sendDryRestoreEvent:(id)a3;
+ (void)sendRestoreEngineCompletionStatus:(id)a3 duration:(double)a4 peakMemoryUsage:(unint64_t)a5 error:(id)a6;
+ (void)sendRestoreEngineStateChangeStatus:(id)a3 state:(unint64_t)a4 start:(id)a5 end:(id)a6;
@end

@implementation MBCKTelemetry

+ (id)_dictToJSONString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSString);
  v5 = +[NSJSONSerialization dataWithJSONObject:v3 options:1 error:0];

  id v6 = [v4 initWithData:v5 encoding:4];
  return v6;
}

+ (void)sendBackupEngineCompletionStatus:(id)a3 duration:(double)a4 peakMemoryUsage:(unint64_t)a5 error:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  v10 = [v8 serviceAccount];
  if (v10)
  {
    v11 = objc_opt_new();
    v12 = [v8 telemetry];
    v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 telemetryID]);
    [v11 setObject:v13 forKeyedSubscript:@"sessionID"];

    [v11 setObject:@"BackupCompletion" forKeyedSubscript:@"telemetryType"];
    [v8 backupPolicy];
    v14 = MBStringForBackupPolicy();
    [v11 setObject:v14 forKeyedSubscript:@"policy"];

    if (!+[MBBackupScheduler backupOnWiFiWithDAS])
    {
      v15 = +[NSNumber numberWithBool:0];
      [v11 setObject:v15 forKeyedSubscript:@"backupOnWiFiWithDAS"];
    }
    [v8 backupReason];
    v16 = MBStringForBackupReason();
    [v11 setObject:v16 forKeyedSubscript:@"reason"];

    v17 = [v8 backupStateDescription];
    [v11 setObject:v17 forKeyedSubscript:@"state"];

    v18 = MBStringForCameraRollState((uint64_t)[v8 cameraRollBackupState]);
    [v11 setObject:v18 forKeyedSubscript:@"cameraRollBackupState"];

    v81 = v10;
    id v82 = 0;
    v19 = +[L28BackupStats l28BackupStatsForAccount:backupReason:backupError:error:](L28BackupStats, "l28BackupStatsForAccount:backupReason:backupError:error:", v10, [v8 backupReason], v9, &v82);
    id v20 = v82;
    if (v19) {
      [v11 addEntriesFromDictionary:v19];
    }
    if (v20)
    {
      v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v84 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to generate L28 stats: %@", buf, 0xCu);
        id v80 = v20;
        _MBLog();
      }
    }
    v22 = objc_msgSend(v8, "telemetry", v80);
    v23 = [v22 backupTotalSize];
    [v11 setObject:v23 forKeyedSubscript:@"totalSize"];

    v24 = [v22 queuedSize];
    [v11 setObject:v24 forKeyedSubscript:@"queuedSize"];

    v25 = [v22 uploadedSize];
    [v11 setObject:v25 forKeyedSubscript:@"uploadedSize"];

    v26 = [v22 scannedDomainsCount];
    [v11 setObject:v26 forKeyedSubscript:@"scannedDomainsCount"];

    v27 = [v22 enabledDomainsCount];
    [v11 setObject:v27 forKeyedSubscript:@"enabledDomainsCount"];

    v28 = [v8 attemptSummary];
    v29 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v28 emptyDomainCount]);
    [v11 setObject:v29 forKeyedSubscript:@"emptyDomainsCount"];

    v30 = [v22 backupFileCount];
    [v11 setObject:v30 forKeyedSubscript:@"fileCount"];

    v31 = [v22 queuedFileCount];
    [v11 setObject:v31 forKeyedSubscript:@"queuedFileCount"];

    v32 = [v22 uploadedFileCount];
    [v11 setObject:v32 forKeyedSubscript:@"uploadedFileCount"];

    v33 = [v22 skippedFilesCount];
    [v11 setObject:v33 forKeyedSubscript:@"skippedFilesCount"];

    v34 = [v8 attemptSummary];
    v35 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v34 deletedFileCount]);
    [v11 setObject:v35 forKeyedSubscript:@"deletedFileCount"];

    v36 = [v22 backupDirectoryCount];
    [v11 setObject:v36 forKeyedSubscript:@"directoryCount"];

    v37 = [v8 attemptSummary];
    v38 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v37 unmodifiedDirectoryCount]);
    [v11 setObject:v38 forKeyedSubscript:@"unmodifiedDirectoryCount"];

    v39 = [v8 attemptSummary];
    v40 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v39 modifiedDirectoryCount]);
    [v11 setObject:v40 forKeyedSubscript:@"modifiedDirectoryCount"];

    v41 = [v8 cacheRefreshSummary];
    v42 = v41;
    if (v41 && [v41 downloadedSnapshotCount])
    {
      v43 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v42 cachedSnapshotCount]);
      [v11 setObject:v43 forKeyedSubscript:@"cachedSnapshotCount"];

      v44 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v42 serverSnapshotCount]);
      [v11 setObject:v44 forKeyedSubscript:@"serverSnapshotCount"];

      v45 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v42 journalActionCount]);
      [v11 setObject:v45 forKeyedSubscript:@"journalActionCount"];

      v46 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v42 journalReplaySucceeded]);
      [v11 setObject:v46 forKeyedSubscript:@"journalReplaySucceeded"];

      v47 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v42 journalVerificationErrorCount]);
      [v11 setObject:v47 forKeyedSubscript:@"journalVerificationErrorCount"];

      v48 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v42 downloadedSnapshotCount]);
      [v11 setObject:v48 forKeyedSubscript:@"downloadedSnapshotCount"];

      v49 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v42 downloadedSnapshotVerificationFailureCount]);
      [v11 setObject:v49 forKeyedSubscript:@"downloadedSnapshotVerificationFailureCount"];

      v50 = [v42 verificationFailureStrings];
      if ([v50 count])
      {
        v51 = [v50 componentsJoinedByString:@" "];
        [v11 setObject:v51 forKeyedSubscript:@"verificationFailures"];
      }
    }
    v52 = +[NSNumber numberWithDouble:a4];
    [v11 setObject:v52 forKeyedSubscript:@"duration"];

    v53 = [v22 cacheSize];
    [v11 setObject:v53 forKeyedSubscript:@"cacheSize"];

    v54 = [v22 freeDiskSpace];
    [v11 setObject:v54 forKeyedSubscript:@"freeDiskSpace"];

    [v22 fseventDuration];
    v55 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v55 forKeyedSubscript:@"fseventDuration"];

    v56 = [v8 attemptSummary];
    v57 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v56 peakMemoryUsage]);
    [v11 setObject:v57 forKeyedSubscript:@"peakMemoryUsage"];

    v58 = [v8 attemptSummary];
    v59 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v58 uploadedFileListSize]);
    [v11 setObject:v59 forKeyedSubscript:@"uploadedFileListSize"];

    v60 = MBStringForChargingType((uint64_t)[v22 chargingType]);
    [v11 setObject:v60 forKeyedSubscript:@"chargingType"];

    v61 = [v22 topDomainsWithMissingEncryptionKeys];
    id v62 = [v61 count];

    if (v62)
    {
      v63 = [v22 topDomainsWithMissingEncryptionKeys];
      v64 = [v63 componentsJoinedByString:@" "];
      [v11 setObject:v64 forKeyedSubscript:@"topDomainsWithMissingEncryptionKeys"];
    }
    v65 = [v22 classAFilesMissingEncryptionKeys];
    [v11 setObject:v65 forKeyedSubscript:@"classAFilesMissingEncryptionKeys"];

    v66 = [v22 classBFilesMissingEncryptionKeys];
    [v11 setObject:v66 forKeyedSubscript:@"classBFilesMissingEncryptionKeys"];

    v67 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 backupAttemptCount]);
    [v11 setObject:v67 forKeyedSubscript:@"attemptCount"];

    v68 = [v8 device];
    v69 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v68 pendingSnapshotQuotaReserved]);
    [v11 setObject:v69 forKeyedSubscript:@"pendingSnapshotQuotaReserved"];

    [v8 snapshotType];
    v70 = MBStringForSnapshotType();
    [v11 setObject:v70 forKeyedSubscript:@"snapshotType"];

    [v8 snapshotFormat];
    v71 = MBStringForSnapshotFormat();
    [v11 setObject:v71 forKeyedSubscript:@"snapshotFormat"];

    if (v9) {
      uint64_t v72 = (uint64_t)+[MBError isError:v9 withCode:0];
    }
    else {
      uint64_t v72 = 1;
    }
    v73 = MBExtractFirstMBErrorOrCKError(v9);
    v74 = +[NSNumber numberWithBool:v72];
    [v11 setObject:v74 forKeyedSubscript:@"success"];

    if (v73)
    {
      v75 = [v73 domain];
      [v11 setObject:v75 forKeyedSubscript:@"errorDomain"];

      v76 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v73 code]);
      [v11 setObject:v76 forKeyedSubscript:@"errorCode"];
    }
    v77 = [v22 snapshotVerificationStatus];

    if (v77)
    {
      v78 = [v22 snapshotVerificationStatus];
      [v11 setObject:v78 forKeyedSubscript:@"snapshotVerificationStatus"];

      [v22 snapshotVerificationDuration];
      v79 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v11 setObject:v79 forKeyedSubscript:@"snapshotVerificationDuration"];
    }
    else
    {
      [v11 setObject:@"Skipped" forKeyedSubscript:@"snapshotVerificationStatus"];
    }
    +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.Backup_1" metrics:v11];

    v10 = v81;
  }
  else
  {
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "nil account", buf, 2u);
      _MBLog();
    }
  }
}

+ (void)sendRestoreEngineCompletionStatus:(id)a3 duration:(double)a4 peakMemoryUsage:(unint64_t)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if ([v9 isForegroundRestore])
  {
    v11 = objc_opt_new();
    v12 = [v9 serviceManager];
    v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 restoreTelemetryID]);
    [v11 setObject:v13 forKeyedSubscript:@"sessionID"];

    [v11 setObject:@"ForegroundRestoreCompletion" forKeyedSubscript:@"telemetryType"];
    v14 = [v9 engineError];
    if (v14)
    {
      v15 = [v9 engineError];
      uint64_t v16 = (uint64_t)+[MBError isError:v15 withCode:0];
    }
    else
    {
      uint64_t v16 = 1;
    }

    [v9 backupPolicy];
    v17 = MBStringForBackupPolicy();
    [v11 setObject:v17 forKeyedSubscript:@"policy"];

    v18 = [v9 restoreStateDescription];
    [v11 setObject:v18 forKeyedSubscript:@"state"];

    v19 = +[NSNumber numberWithDouble:a4];
    [v11 setObject:v19 forKeyedSubscript:@"duration"];

    id v20 = +[NSNumber numberWithUnsignedLongLong:a5];
    [v11 setObject:v20 forKeyedSubscript:@"peakMemoryUsage"];

    v21 = [v9 freeDiskSpace];
    [v11 setObject:v21 forKeyedSubscript:@"freeDiskSpace"];

    v22 = MBStringForChargingType((uint64_t)[v9 chargingType]);
    [v11 setObject:v22 forKeyedSubscript:@"chargingType"];

    v23 = MBExtractFirstMBErrorOrCKError(v10);
    v24 = +[NSNumber numberWithBool:v16];
    [v11 setObject:v24 forKeyedSubscript:@"success"];

    if (v23)
    {
      v25 = [v23 domain];
      [v11 setObject:v25 forKeyedSubscript:@"errorDomain"];

      v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v23 code]);
      [v11 setObject:v26 forKeyedSubscript:@"errorCode"];
    }
    v27 = [v9 foregroundRestorableSize];
    [v11 setObject:v27 forKeyedSubscript:@"foregroundRestorableSize"];

    v28 = [v9 backgroundRestorableSize];
    [v11 setObject:v28 forKeyedSubscript:@"backgroundRestorableSize"];

    v29 = [v9 foregroundRestorableFileCount];
    [v11 setObject:v29 forKeyedSubscript:@"foregroundRestorableFileCount"];

    v30 = [v9 backgroundRestorableFileCount];
    [v11 setObject:v30 forKeyedSubscript:@"backgroundRestorableFileCount"];

    v31 = [v9 foregroundRestorableDomainCount];
    [v11 setObject:v31 forKeyedSubscript:@"foregroundRestoreDomainsCount"];

    uint64_t v32 = [v9 foregroundRestoreVerificationStatus];
    v33 = (void *)v32;
    if (v32) {
      CFStringRef v34 = (const __CFString *)v32;
    }
    else {
      CFStringRef v34 = @"Skipped";
    }
    [v11 setObject:v34 forKeyedSubscript:@"foregroundRestoreVerificationStatus"];

    v35 = [v9 targetSnapshot];
    [v35 snapshotFormat];
    v36 = MBStringForSnapshotFormat();
    [v11 setObject:v36 forKeyedSubscript:@"snapshotFormat"];

    char v47 = 0;
    v37 = [v9 serviceAccount];
    v38 = [v37 persona];
    id v46 = 0;
    unsigned __int8 v39 = +[MBRestoreCloudFormatPolicy isRestoringFromFileLists:&v47 persona:v38 error:&v46];
    id v40 = v46;

    if (v39)
    {
      if (v47) {
        CFStringRef v41 = @"Lightrail";
      }
      else {
        CFStringRef v41 = @"Legacy";
      }
      [v11 setObject:v41 forKeyedSubscript:@"snapshotFormatRestored"];
    }
    else
    {
      v42 = MBGetDefaultLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v40;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Could not determine if restoring using file lists: %@", buf, 0xCu);
        id v45 = v40;
        _MBLog();
      }
    }
    v43 = objc_msgSend(v9, "context", v45);
    v44 = [v43 snapshotUUID];
    [v11 setObject:v44 forKeyedSubscript:@"snapshotUUID"];

    +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.FGRestore_1" metrics:v11];
  }
}

+ (void)sendBackupEngineStateChangeStatus:(id)a3 state:(unint64_t)a4 start:(id)a5 end:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a3;
  id v21 = (id)objc_opt_new();
  v11 = [v10 telemetry];
  v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 telemetryID]);
  [v21 setObject:v12 forKeyedSubscript:@"sessionID"];

  [v21 setObject:@"BackupStateChange" forKeyedSubscript:@"telemetryType"];
  v13 = [v10 backupStateDescription];
  [v21 setObject:v13 forKeyedSubscript:@"state"];

  [v8 timeIntervalSinceDate:v9];
  double v15 = v14;

  uint64_t v16 = +[NSNumber numberWithDouble:v15];
  [v21 setObject:v16 forKeyedSubscript:@"duration"];

  v17 = [v10 engineError];

  v18 = MBExtractFirstMBErrorOrCKError(v17);

  if (v18)
  {
    v19 = [v18 domain];
    [v21 setObject:v19 forKeyedSubscript:@"errorDomain"];

    id v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v18 code]);
    [v21 setObject:v20 forKeyedSubscript:@"errorCode"];
  }
  +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.Backup_1" metrics:v21];
}

+ (void)sendRestoreEngineStateChangeStatus:(id)a3 state:(unint64_t)a4 start:(id)a5 end:(id)a6
{
  id v20 = a3;
  id v9 = a5;
  id v10 = a6;
  if ([v20 isForegroundRestore])
  {
    v11 = objc_opt_new();
    v12 = [v20 serviceManager];
    v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 restoreTelemetryID]);
    [v11 setObject:v13 forKeyedSubscript:@"sessionID"];

    [v11 setObject:@"ForegroundRestoreStateChange" forKeyedSubscript:@"telemetryType"];
    double v14 = MBCKStringForRestoreState(a4);
    [v11 setObject:v14 forKeyedSubscript:@"state"];

    [v10 timeIntervalSinceDate:v9];
    double v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v15 forKeyedSubscript:@"duration"];

    uint64_t v16 = [v20 engineError];
    v17 = MBExtractFirstMBErrorOrCKError(v16);

    if (v17)
    {
      v18 = [v17 domain];
      [v11 setObject:v18 forKeyedSubscript:@"errorDomain"];

      v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 code]);
      [v11 setObject:v19 forKeyedSubscript:@"errorCode"];
    }
    +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.FGRestore_1" metrics:v11];
  }
}

+ (void)sendBackgroundRestoreHeartbeat:(unint64_t)a3 restoreInfo:(id)a4
{
  id v5 = a4;
  id v6 = +[NSMutableDictionary dictionary];
  v7 = +[NSNumber numberWithUnsignedInteger:a3];
  [v6 setObject:v7 forKeyedSubscript:@"sessionID"];

  [v6 setObject:@"BackgroundRestoreHeartbeat" forKeyedSubscript:@"telemetryType"];
  id v8 = +[NSNumber numberWithInt:BYSetupAssistantNeedsToRun() ^ 1];
  [v6 setObject:v8 forKeyedSubscript:@"setupAssistantFinished"];

  if (v5)
  {
    id v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 appDataDidFinishRestore]);
    [v6 setObject:v9 forKeyedSubscript:@"appRestoreComplete"];

    id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 airTrafficDidFinishRestore]);
    [v6 setObject:v10 forKeyedSubscript:@"atcRestoreComplete"];

    v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 dataClassesRemaining]);
    [v6 setObject:v11 forKeyedSubscript:@"dataClassesRemaining"];

    v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 bytesRemaining]);
    [v6 setObject:v12 forKeyedSubscript:@"bytesRemaining"];

    v13 = [v5 recentATCErrors];
    id v14 = [v13 count];

    if (v14)
    {
      double v15 = [v5 recentATCErrors];
      uint64_t v16 = +[MBCKTelemetry _dictToJSONString:v15];
      [v6 setObject:v16 forKeyedSubscript:@"recentATCErrors"];
    }
  }
  +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.BGRestore_1" metrics:v6];
  v17 = [v5 perClassItemsRemaining];
  id v18 = [v17 count];

  if (v18)
  {
    v29 = v6;
    v19 = +[NSMutableDictionary dictionary];
    id v20 = +[NSNumber numberWithUnsignedInteger:a3];
    [v19 setObject:v20 forKeyedSubscript:@"sessionID"];

    [v19 setObject:@"BackgroundRestoreHeartbeat-Items" forKeyedSubscript:@"telemetryType"];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [v5 perClassItemsRemaining];
    id v21 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          [v19 setObject:v25 forKeyedSubscript:@"perClassItemsRemaining"];
          [v5 perClassItemsRemaining];
          v27 = id v26 = v5;
          v28 = [v27 objectForKeyedSubscript:v25];
          [v19 setObject:v28 forKeyedSubscript:@"fileCounts"];

          id v5 = v26;
          +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.BGRestore_1" metrics:v19];
        }
        id v22 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v22);
    }

    id v6 = v29;
  }
}

+ (void)sendBackgroundRestoreCompletion:(unint64_t)a3 snapshotUUID:(id)a4 snapshotIndex:(unint64_t)a5 snapshotFormat:(int64_t)a6 isRestoringUsingFileLists:(BOOL)a7 duration:(double)a8 peakMemoryUsage:(unint64_t)a9 error:(id)a10 fatalErrors:(id)a11 domainsTopNSizes:(id)a12 domainsTopNFileCount:(id)a13 failedDomains:(id)a14
{
  BOOL obj = a7;
  id v68 = a4;
  id v18 = a10;
  id v19 = a11;
  id v69 = a12;
  id v67 = a13;
  id v20 = a14;
  id v21 = objc_opt_new();
  unint64_t v72 = a3;
  id v22 = +[NSNumber numberWithUnsignedInteger:a3];
  [v21 setObject:v22 forKeyedSubscript:@"sessionID"];

  [v21 setObject:@"BackgroundRestoreCompletion" forKeyedSubscript:@"telemetryType"];
  if ([v19 count])
  {
    uint64_t v23 = 0;
  }
  else if (v18)
  {
    uint64_t v23 = (uint64_t)+[MBError isError:v18 withCode:0];
  }
  else
  {
    uint64_t v23 = 1;
  }
  if (+[MBError shouldReportLowDiskSpaceForError:v18])
  {
    v24 = +[NSNumber numberWithUnsignedLongLong:MBFreeDiskSpace()];
    [v21 setObject:v24 forKeyedSubscript:@"freeDiskSpace"];
  }
  uint64_t v25 = +[NSNumber numberWithDouble:a8];
  [v21 setObject:v25 forKeyedSubscript:@"duration"];

  id v26 = +[NSNumber numberWithUnsignedLongLong:a9];
  [v21 setObject:v26 forKeyedSubscript:@"peakMemoryUsage"];

  [v21 setObject:v68 forKeyedSubscript:@"snapshotUUID"];
  v27 = +[NSNumber numberWithUnsignedInteger:a5];
  [v21 setObject:v27 forKeyedSubscript:@"snapshotIndex"];

  v28 = MBStringForSnapshotFormat();
  [v21 setObject:v28 forKeyedSubscript:@"snapshotFormat"];

  if (obj) {
    CFStringRef v29 = @"Lightrail";
  }
  else {
    CFStringRef v29 = @"Legacy";
  }
  [v21 setObject:v29 forKeyedSubscript:@"snapshotFormatRestored"];
  v30 = MBExtractFirstMBErrorOrCKError(v18);
  long long v31 = +[NSNumber numberWithBool:v23];
  [v21 setObject:v31 forKeyedSubscript:@"success"];

  if (v30)
  {
    long long v32 = [v30 domain];
    [v21 setObject:v32 forKeyedSubscript:@"errorDomain"];

    long long v33 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 code]);
    [v21 setObject:v33 forKeyedSubscript:@"errorCode"];
  }
  v64 = v30;
  v66 = v18;
  if ([v20 count])
  {
    long long v34 = [v20 componentsJoinedByString:@" "];
    [v21 setObject:v34 forKeyedSubscript:@"failedDomains"];
  }
  v65 = v20;
  +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.BGRestore_1" metrics:v21];
  v35 = objc_opt_new();
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obja = v19;
  id v36 = [obja countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v82;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v82 != v38) {
          objc_enumerationMutation(obja);
        }
        id v40 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        CFStringRef v41 = +[NSNumber numberWithUnsignedInteger:a3];
        [v35 setObject:v41 forKeyedSubscript:@"sessionID"];

        [v35 setObject:@"BackgroundRestoreCompletion-Domains" forKeyedSubscript:@"telemetryType"];
        v42 = [v40 domain];
        [v35 setObject:v42 forKeyedSubscript:@"errorDomain"];

        v43 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v40 code]);
        [v35 setObject:v43 forKeyedSubscript:@"errorCode"];

        v44 = +[MBError signatureForError:v40];
        [v35 setObject:v44 forKeyedSubscript:@"errorSignature"];

        +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.BGRestore_1" metrics:v35];
      }
      id v37 = [obja countByEnumeratingWithState:&v81 objects:v87 count:16];
    }
    while (v37);
  }

  if ([v69 count])
  {
    id v45 = +[NSMutableDictionary dictionary];
    id v46 = +[NSNumber numberWithUnsignedInteger:a3];
    [v45 setObject:v46 forKeyedSubscript:@"sessionID"];

    [v45 setObject:@"BackgroundRestoreCompletion-Domains" forKeyedSubscript:@"telemetryType"];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v47 = v69;
    id v48 = [v47 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v78;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(void *)v78 != v50) {
            objc_enumerationMutation(v47);
          }
          uint64_t v52 = *(void *)(*((void *)&v77 + 1) + 8 * (void)j);
          [v45 setObject:v52 forKeyedSubscript:@"domainName"];
          v53 = [v47 objectForKeyedSubscript:v52];
          [v45 setObject:v53 forKeyedSubscript:@"domainSize"];

          +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.BGRestore_1" metrics:v45];
        }
        id v49 = [v47 countByEnumeratingWithState:&v77 objects:v86 count:16];
      }
      while (v49);
    }
  }
  v54 = v67;
  if ([v67 count])
  {
    v55 = +[NSMutableDictionary dictionary];
    v56 = +[NSNumber numberWithUnsignedInteger:v72];
    [v55 setObject:v56 forKeyedSubscript:@"sessionID"];

    [v55 setObject:@"BackgroundRestoreCompletion-Domains" forKeyedSubscript:@"telemetryType"];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v57 = v67;
    id v58 = [v57 countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v58)
    {
      id v59 = v58;
      uint64_t v60 = *(void *)v74;
      do
      {
        for (k = 0; k != v59; k = (char *)k + 1)
        {
          if (*(void *)v74 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void *)(*((void *)&v73 + 1) + 8 * (void)k);
          [v55 setObject:v62 forKeyedSubscript:@"domainName"];
          v63 = [v57 objectForKeyedSubscript:v62];
          [v55 setObject:v63 forKeyedSubscript:@"fileCounts"];

          +[MBAnalyticsEvent submitEventName:@"com.apple.massStorage.MobileBackupInfo.BGRestore_1" metrics:v55];
        }
        id v59 = [v57 countByEnumeratingWithState:&v73 objects:v85 count:16];
      }
      while (v59);
    }

    v54 = v67;
  }
}

+ (void)sendDryRestoreEvent:(id)a3
{
}

@end