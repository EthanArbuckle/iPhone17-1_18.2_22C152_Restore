@interface MBCKStatusRequest
+ (void)sendStatusRequestForBackgroundRestoreCompletionWithAccount:(id)a3 databaseManager:(id)a4 sourceDeviceID:(id)a5 snapshotUUID:(id)a6 snapshotIndex:(unint64_t)a7 snapshotFormat:(int64_t)a8 isRestoringUsingFileLists:(BOOL)a9 plan:(id)a10 duration:(double)a11 error:(id)a12;
+ (void)sendStatusRequestWithEngine:(id)a3 duration:(double)a4 error:(id)a5;
- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtFinish;
- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtStart;
- (BOOL)backgroundVerificationEnabled;
- (BOOL)backupOnWiFiWithDAS;
- (BOOL)foregroundRestoreVerificationEnabled;
- (BOOL)hasNetworkConnectivityInfo;
- (BOOL)hasNewOTAKeyBag;
- (BOOL)isForegroundRestore;
- (BOOL)isRestoringWithFileLists;
- (BOOL)snapshotVerificationEnabled;
- (BOOL)usedAPFSSnapshots;
- (CKOperationGroup)ckOperationGroup;
- (MBCKDevice)device;
- (MBCKOperationPolicy)ckOperationPolicy;
- (MBCKStatusRequest)initWithRequestType:(unint64_t)a3 device:(id)a4 duration:(double)a5 error:(id)a6;
- (MBCacheRefreshSummary)cacheRefreshSummary;
- (NSArray)lastOnConditionEvents;
- (NSArray)serializedUnderlyingErrors;
- (NSArray)throughputs;
- (NSArray)topDomainsWithMissingEncryptionKeys;
- (NSArray)wifiQuality;
- (NSError)errorToReport;
- (NSError)snapshotVerificationCancellationError;
- (NSNumber)backgroundRestorableFileCount;
- (NSNumber)backgroundRestorableSize;
- (NSNumber)backupDirectoryCount;
- (NSNumber)backupFileCount;
- (NSNumber)backupTotalSize;
- (NSNumber)cacheSize;
- (NSNumber)classAFilesMissingEncryptionKeys;
- (NSNumber)classBFilesMissingEncryptionKeys;
- (NSNumber)deletedFileCount;
- (NSNumber)emptyDomainCount;
- (NSNumber)enabledDomainsCount;
- (NSNumber)foregroundRestorableFileCount;
- (NSNumber)foregroundRestorableSize;
- (NSNumber)freeDiskSpace;
- (NSNumber)minutesRemaining;
- (NSNumber)modifiedDirectoryCount;
- (NSNumber)modifiedRegularFileCount;
- (NSNumber)peakMemoryUsage;
- (NSNumber)queuedFileCount;
- (NSNumber)queuedSize;
- (NSNumber)remainingCellularBalance;
- (NSNumber)scannedDomainsCount;
- (NSNumber)skippedFilesCount;
- (NSNumber)snapshotIndex;
- (NSNumber)unmodifiedDirectoryCount;
- (NSNumber)unmodifiedRegularFileCount;
- (NSNumber)uploadedAssetCount;
- (NSNumber)uploadedAssetSize;
- (NSNumber)uploadedFileCount;
- (NSNumber)uploadedSize;
- (NSString)backgroundRestoreVerificationStatus;
- (NSString)foregroundRestoreVerificationStatus;
- (NSString)pendingSnapshotID;
- (NSString)restoreBuildVersion;
- (NSString)snapshotUUID;
- (NSString)snapshotVerificationStatus;
- (NSString)sourceDeviceID;
- (NSString)stateDescription;
- (NSString)uuid;
- (double)duration;
- (double)fseventDuration;
- (double)snapshotVerificationDuration;
- (id)recordRepresentation;
- (id)recordType;
- (id)stringForRestorePhase;
- (int)allowedCellularCost;
- (int64_t)backupPolicy;
- (int64_t)backupReason;
- (int64_t)snapshotFormat;
- (int64_t)snapshotType;
- (unint64_t)chargingType;
- (unint64_t)eventType;
- (unint64_t)pendingSnapshotQuotaReserved;
- (unint64_t)recordZone;
- (unint64_t)uploadedFileListSize;
- (void)_addMetricsWithTracker:(id)a3;
- (void)_sendWithAccount:(id)a3 databaseManager:(id)a4;
- (void)setAllowedCellularCost:(int)a3;
- (void)setBackgroundRestorableFileCount:(id)a3;
- (void)setBackgroundRestorableSize:(id)a3;
- (void)setBackgroundRestoreVerificationStatus:(id)a3;
- (void)setBackgroundVerificationEnabled:(BOOL)a3;
- (void)setBackupDirectoryCount:(id)a3;
- (void)setBackupFileCount:(id)a3;
- (void)setBackupOnWiFiWithDAS:(BOOL)a3;
- (void)setBackupPolicy:(int64_t)a3;
- (void)setBackupReason:(int64_t)a3;
- (void)setBackupTotalSize:(id)a3;
- (void)setCacheRefreshSummary:(id)a3;
- (void)setCacheSize:(id)a3;
- (void)setChargingType:(unint64_t)a3;
- (void)setCkOperationGroup:(id)a3;
- (void)setCkOperationPolicy:(id)a3;
- (void)setClassAFilesMissingEncryptionKeys:(id)a3;
- (void)setClassBFilesMissingEncryptionKeys:(id)a3;
- (void)setDeletedFileCount:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEmptyDomainCount:(id)a3;
- (void)setEnabledDomainsCount:(id)a3;
- (void)setErrorToReport:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setForegroundRestorableFileCount:(id)a3;
- (void)setForegroundRestorableSize:(id)a3;
- (void)setForegroundRestoreVerificationEnabled:(BOOL)a3;
- (void)setForegroundRestoreVerificationStatus:(id)a3;
- (void)setFreeDiskSpace:(id)a3;
- (void)setFseventDuration:(double)a3;
- (void)setHasNetworkConnectivityInfo:(BOOL)a3;
- (void)setHasNewOTAKeyBag:(BOOL)a3;
- (void)setIsForegroundRestore:(BOOL)a3;
- (void)setIsRestoringWithFileLists:(BOOL)a3;
- (void)setLastOnConditionEvents:(id)a3;
- (void)setMinutesRemaining:(id)a3;
- (void)setModifiedDirectoryCount:(id)a3;
- (void)setModifiedRegularFileCount:(id)a3;
- (void)setNetworkConnectivityAtFinish:(id)a3;
- (void)setNetworkConnectivityAtStart:(id)a3;
- (void)setPeakMemoryUsage:(id)a3;
- (void)setPendingSnapshotID:(id)a3;
- (void)setPendingSnapshotQuotaReserved:(unint64_t)a3;
- (void)setQueuedFileCount:(id)a3;
- (void)setQueuedSize:(id)a3;
- (void)setRemainingCellularBalance:(id)a3;
- (void)setRestoreBuildVersion:(id)a3;
- (void)setScannedDomainsCount:(id)a3;
- (void)setSerializedUnderlyingErrors:(id)a3;
- (void)setSkippedFilesCount:(id)a3;
- (void)setSnapshotFormat:(int64_t)a3;
- (void)setSnapshotIndex:(id)a3;
- (void)setSnapshotType:(int64_t)a3;
- (void)setSnapshotUUID:(id)a3;
- (void)setSnapshotVerificationCancellationError:(id)a3;
- (void)setSnapshotVerificationDuration:(double)a3;
- (void)setSnapshotVerificationEnabled:(BOOL)a3;
- (void)setSnapshotVerificationStatus:(id)a3;
- (void)setSourceDeviceID:(id)a3;
- (void)setStateDescription:(id)a3;
- (void)setThroughputs:(id)a3;
- (void)setTopDomainsWithMissingEncryptionKeys:(id)a3;
- (void)setUnmodifiedDirectoryCount:(id)a3;
- (void)setUnmodifiedRegularFileCount:(id)a3;
- (void)setUploadedAssetCount:(id)a3;
- (void)setUploadedAssetSize:(id)a3;
- (void)setUploadedFileCount:(id)a3;
- (void)setUploadedFileListSize:(unint64_t)a3;
- (void)setUploadedSize:(id)a3;
- (void)setUsedAPFSSnapshots:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setWifiQuality:(id)a3;
@end

@implementation MBCKStatusRequest

- (void)_addMetricsWithTracker:(id)a3
{
  id v22 = a3;
  v4 = +[NSDate date];
  [(MBCKStatusRequest *)self duration];
  v6 = [v4 dateByAddingTimeInterval:-v5];
  v7 = [(MBCKStatusRequest *)self errorToReport];
  CFStringRef v8 = @"1";
  if (v7)
  {
    v9 = [(MBCKStatusRequest *)self errorToReport];
    if (!+[MBError isError:v9 withCode:0]) {
      CFStringRef v8 = @"0";
    }
  }
  unint64_t v10 = [(MBCKStatusRequest *)self eventType];
  if (v10 != 1)
  {
    if (v10) {
      goto LABEL_23;
    }
    if ((id)[(MBCKStatusRequest *)self backupReason] == (id)1)
    {
      CFStringRef v11 = @"ManualBackup";
    }
    else
    {
      if ((id)[(MBCKStatusRequest *)self backupReason] != (id)2)
      {
        id v12 = 0;
        goto LABEL_18;
      }
      CFStringRef v11 = @"AutomaticBackup";
    }
    id v12 = [objc_alloc((Class)CKEventMetric) initWithEventName:v11];
LABEL_18:
    [(MBCKStatusRequest *)self snapshotType];
    v20 = MBStringForSnapshotType();
    [v12 setMetricValue:v20 forKey:@"backupType"];

    [v12 setMetricValue:v8 forKey:@"succeeded"];
    v21 = [(MBCKStatusRequest *)self backupTotalSize];

    if (!v21) {
      goto LABEL_21;
    }
    v17 = [(MBCKStatusRequest *)self backupTotalSize];
    v18 = [v17 stringValue];
    CFStringRef v19 = @"backupSize";
    goto LABEL_20;
  }
  if (![(MBCKStatusRequest *)self isForegroundRestore]) {
    goto LABEL_23;
  }
  id v12 = [objc_alloc((Class)CKEventMetric) initWithEventName:@"ForegroundRestore"];
  [v12 setMetricValue:v8 forKey:@"succeeded"];
  v13 = [(MBCKStatusRequest *)self foregroundRestorableSize];

  if (v13)
  {
    v14 = [(MBCKStatusRequest *)self foregroundRestorableSize];
    v15 = [v14 stringValue];
    [v12 setMetricValue:v15 forKey:@"foregroundRestorableSize"];
  }
  v16 = [(MBCKStatusRequest *)self backgroundRestorableSize];

  if (v16)
  {
    v17 = [(MBCKStatusRequest *)self backgroundRestorableSize];
    v18 = [v17 stringValue];
    CFStringRef v19 = @"backgroundRestorableSize";
LABEL_20:
    [v12 setMetricValue:v18 forKey:v19];
  }
LABEL_21:
  if (v12)
  {
    [v12 setStartTime:v6];
    [v12 setEndTime:v4];
    [v22 addCKMetric:v12];
  }
LABEL_23:
}

- (void)_sendWithAccount:(id)a3 databaseManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKStatusRequest _sendWithAccount:databaseManager:]", "MBCKStatusRequest.m", 187, "account");
  }
  CFStringRef v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBCKStatusRequest _sendWithAccount:databaseManager:]", "MBCKStatusRequest.m", 188, "databaseManager");
  }
  v9 = [(MBCKStatusRequest *)self ckOperationPolicy];
  unint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  id v18 = 0;
  v13 = +[MBCKOperationTracker operationTrackerWithAccount:v6 databaseManager:v8 policy:v12 error:&v18];
  id v14 = v18;
  if (v13)
  {
    v15 = [(MBCKStatusRequest *)self ckOperationGroup];
    [v13 setCkOperationGroup:v15];

    [(MBCKStatusRequest *)self _addMetricsWithTracker:v13];
    v16 = [(MBCKStatusRequest *)self recordRepresentation];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001B4228;
    v17[3] = &unk_100415930;
    v17[4] = self;
    [v13 saveRecord:v16 delegate:0 completion:v17];

    [v13 drain];
  }
}

+ (void)sendStatusRequestWithEngine:(id)a3 duration:(double)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8) {
    __assert_rtn("+[MBCKStatusRequest sendStatusRequestWithEngine:duration:error:]", "MBCKStatusRequest.m", 212, "engine");
  }
  unint64_t v10 = v9;
  id v11 = [v8 serviceAccount];
  if (v11)
  {
    id v12 = v8;
    unsigned int v13 = [v12 engineMode];
    uint64_t v14 = v13 - 1;
    if (v14 >= 3) {
      __assert_rtn("typeForEngine", "MBCKStatusRequest.m", 138, "0");
    }
    unsigned int v15 = v13;

    id v16 = objc_alloc((Class)a1);
    v17 = [v12 device];
    id v18 = [v16 initWithRequestType:v14 device:v17 duration:v10 error:a4];

    CFStringRef v19 = [v12 ckOperationPolicy];
    id v20 = [v19 copy];
    if (v20)
    {
      [v18 setCkOperationPolicy:v20];
    }
    else
    {
      id v22 = objc_opt_new();
      [v18 setCkOperationPolicy:v22];
    }
    if (v15 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        __assert_rtn("+[MBCKStatusRequest sendStatusRequestWithEngine:duration:error:]", "MBCKStatusRequest.m", 278, "[engine isKindOfClass:[MBCKRestoreEngine class]]");
      }
      id v76 = v12;
      id v77 = [v76 isForegroundRestore];
      if (v77)
      {
        v78 = +[MBCellularAccess expensiveCellularAccess];
        v79 = [v18 ckOperationPolicy];
        [v79 setCellularAccess:v78];
      }
      else
      {
        v80 = [v76 serviceAccount];
        v81 = +[MBCKManager restoreInfoForAccount:v80];
        v78 = [v81 deviceBuildVersion];

        v79 = MBBuildVersion();
        if ([v78 isEqualToString:v79]) {
          v82 = 0;
        }
        else {
          v82 = v78;
        }
        [v18 setRestoreBuildVersion:v82];
      }

      [v18 setIsForegroundRestore:v77];
      v83 = [v76 context];
      v84 = [v83 backupUDID];
      [v18 setSourceDeviceID:v84];

      v85 = [v76 context];
      v86 = [v85 snapshotUUID];
      [v18 setSnapshotUUID:v86];

      v87 = [v76 foregroundRestorableSize];
      [v18 setForegroundRestorableSize:v87];

      v88 = [v76 backgroundRestorableSize];
      [v18 setBackgroundRestorableSize:v88];

      v89 = [v76 foregroundRestorableFileCount];
      [v18 setForegroundRestorableFileCount:v89];

      v90 = [v76 backgroundRestorableFileCount];
      [v18 setBackgroundRestorableFileCount:v90];

      objc_msgSend(v18, "setChargingType:", objc_msgSend(v76, "chargingType"));
      v91 = [v76 minutesRemaining];
      [v18 setMinutesRemaining:v91];

      v92 = [v76 restoreStateDescription];
      [v18 setStateDescription:v92];

      v93 = [v76 freeDiskSpace];
      [v18 setFreeDiskSpace:v93];

      objc_msgSend(v18, "setAllowedCellularCost:", objc_msgSend(v76, "allowedCellularCost"));
      id v94 = [v76 networkConnectivityAtStart];
      objc_msgSend(v18, "setNetworkConnectivityAtStart:", v94, v95);
      id v96 = [v76 networkConnectivityAtFinish];
      objc_msgSend(v18, "setNetworkConnectivityAtFinish:", v96, v97);
      v98 = [v76 foregroundRestoreVerificationStatus];
      [v18 setForegroundRestoreVerificationStatus:v98];

      objc_msgSend(v18, "setForegroundRestoreVerificationEnabled:", objc_msgSend(v76, "foregroundRestoreVerificationEnabled"));
      v99 = [v76 targetSnapshot];
      objc_msgSend(v18, "setSnapshotFormat:", objc_msgSend(v99, "snapshotFormat"));

      objc_msgSend(v18, "setIsRestoringWithFileLists:", objc_msgSend(v76, "useFileLists"));
    }
    else
    {
      if (v15 != 1)
      {
LABEL_24:
        [v18 setHasNetworkConnectivityInfo:1];
        v100 = [v12 ckOperationTracker];
        v101 = [v100 ckOperationGroup];
        [v18 setCkOperationGroup:v101];

        objc_msgSend(v18, "setBackupPolicy:", objc_msgSend(v12, "backupPolicy"));
        v102 = [v12 serviceManager];
        v103 = [v102 databaseManager];
        [v18 _sendWithAccount:v11 databaseManager:v103];

        goto LABEL_25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        __assert_rtn("+[MBCKStatusRequest sendStatusRequestWithEngine:duration:error:]", "MBCKStatusRequest.m", 223, "[engine isKindOfClass:[MBCKBackupEngine class]]");
      }
      v23 = +[MBCellularAccess expensiveCellularAccess];
      v24 = [v18 ckOperationPolicy];
      [v24 setCellularAccess:v23];

      id v25 = v12;
      if (![v25 backupReason]) {
        __assert_rtn("+[MBCKStatusRequest sendStatusRequestWithEngine:duration:error:]", "MBCKStatusRequest.m", 226, "backupEngine.backupReason != kMBBackupReasonUnspecified");
      }
      v26 = [v25 pendingSnapshotID];
      [v18 setPendingSnapshotID:v26];

      v27 = [v25 device];
      objc_msgSend(v18, "setPendingSnapshotQuotaReserved:", objc_msgSend(v27, "pendingSnapshotQuotaReserved"));

      objc_msgSend(v18, "setBackupReason:", objc_msgSend(v25, "backupReason"));
      objc_msgSend(v18, "setSnapshotType:", objc_msgSend(v25, "snapshotType"));
      v28 = [v25 backupStateDescription];
      [v18 setStateDescription:v28];

      [v18 setUsedAPFSSnapshots:1];
      v29 = [v25 telemetry];
      v30 = [v29 backupTotalSize];
      [v18 setBackupTotalSize:v30];

      v31 = [v29 topDomainsWithMissingEncryptionKeys];
      [v18 setTopDomainsWithMissingEncryptionKeys:v31];

      v32 = [v29 backupFileCount];
      [v18 setBackupFileCount:v32];

      v33 = [v29 backupDirectoryCount];
      [v18 setBackupDirectoryCount:v33];

      v34 = [v29 queuedSize];
      [v18 setQueuedSize:v34];

      v35 = [v29 queuedFileCount];
      [v18 setQueuedFileCount:v35];

      v36 = [v29 uploadedSize];
      [v18 setUploadedSize:v36];

      v37 = [v29 uploadedFileCount];
      [v18 setUploadedFileCount:v37];

      objc_msgSend(v18, "setChargingType:", objc_msgSend(v29, "chargingType"));
      v38 = +[MBBackupScheduler lastOnConditionEventsForAccount:v11];
      [v18 setLastOnConditionEvents:v38];

      v39 = [v29 minutesRemaining];
      [v18 setMinutesRemaining:v39];

      v40 = [v29 freeDiskSpace];
      [v18 setFreeDiskSpace:v40];

      objc_msgSend(v18, "setHasNewOTAKeyBag:", objc_msgSend(v29, "createdNewOTAKeybag"));
      v41 = [v29 throughputs];
      [v18 setThroughputs:v41];

      v42 = [v29 wifiQuality];
      [v18 setWifiQuality:v42];

      v43 = [v29 cacheSize];
      [v18 setCacheSize:v43];

      v44 = [v29 remainingCellularBalance];
      [v18 setRemainingCellularBalance:v44];

      v45 = [v29 classAFilesMissingEncryptionKeys];
      [v18 setClassAFilesMissingEncryptionKeys:v45];

      v46 = [v29 classBFilesMissingEncryptionKeys];
      [v18 setClassBFilesMissingEncryptionKeys:v46];

      [v29 fseventDuration];
      objc_msgSend(v18, "setFseventDuration:");
      v47 = [v29 enabledDomainsCount];
      [v18 setEnabledDomainsCount:v47];

      v48 = [v29 scannedDomainsCount];
      [v18 setScannedDomainsCount:v48];

      v49 = [v29 skippedFilesCount];
      [v18 setSkippedFilesCount:v49];

      objc_msgSend(v18, "setAllowedCellularCost:", objc_msgSend(v29, "allowedCellularCost"));
      id v50 = [v29 networkConnectivityAtStart];
      objc_msgSend(v18, "setNetworkConnectivityAtStart:", v50, v51);
      id v52 = [v29 networkConnectivityAtFinish];
      objc_msgSend(v18, "setNetworkConnectivityAtFinish:", v52, v53);
      v54 = [v25 cacheRefreshSummary];
      [v18 setCacheRefreshSummary:v54];

      objc_msgSend(v18, "setBackupOnWiFiWithDAS:", +[MBBackupScheduler backupOnWiFiWithDAS](MBBackupScheduler, "backupOnWiFiWithDAS"));
      v55 = [v29 snapshotVerificationStatus];
      [v18 setSnapshotVerificationStatus:v55];

      [v29 snapshotVerificationDuration];
      objc_msgSend(v18, "setSnapshotVerificationDuration:");
      objc_msgSend(v18, "setSnapshotFormat:", objc_msgSend(v25, "snapshotFormat"));
      objc_msgSend(v18, "setSnapshotVerificationEnabled:", objc_msgSend(v29, "snapshotVerificationEnabled"));
      v56 = [v25 attemptSummary];
      v57 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v56 emptyDomainCount]);
      [v18 setEmptyDomainCount:v57];

      v58 = [v25 attemptSummary];
      v59 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v58 deletedFileCount]);
      [v18 setDeletedFileCount:v59];

      v60 = [v25 attemptSummary];
      v61 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v60 unmodifiedDirectoryCount]);
      [v18 setUnmodifiedDirectoryCount:v61];

      v62 = [v25 attemptSummary];
      v63 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v62 modifiedDirectoryCount]);
      [v18 setModifiedDirectoryCount:v63];

      v64 = [v25 attemptSummary];
      v65 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v64 uploadedAssetCount]);
      [v18 setUploadedAssetCount:v65];

      v66 = [v25 attemptSummary];
      v67 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v66 uploadedAssetSize]);
      [v18 setUploadedAssetSize:v67];

      v68 = [v25 attemptSummary];
      v69 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v68 unmodifiedRegularFileCount]);
      [v18 setUnmodifiedRegularFileCount:v69];

      v70 = [v25 attemptSummary];
      v71 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v70 modifiedRegularFileCount]);
      [v18 setModifiedRegularFileCount:v71];

      v72 = [v25 attemptSummary];
      v73 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v72 peakMemoryUsage]);
      [v18 setPeakMemoryUsage:v73];

      v74 = [v25 attemptSummary];
      objc_msgSend(v18, "setUploadedFileListSize:", objc_msgSend(v74, "uploadedFileListSize"));

      v75 = [v29 snapshotVerificationCancellationError];
      [v18 setSnapshotVerificationCancellationError:v75];
    }
    goto LABEL_24;
  }
  v21 = MBGetDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v104 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "nil account", v104, 2u);
    _MBLog();
  }

LABEL_25:
}

+ (void)sendStatusRequestForBackgroundRestoreCompletionWithAccount:(id)a3 databaseManager:(id)a4 sourceDeviceID:(id)a5 snapshotUUID:(id)a6 snapshotIndex:(unint64_t)a7 snapshotFormat:(int64_t)a8 isRestoringUsingFileLists:(BOOL)a9 plan:(id)a10 duration:(double)a11 error:(id)a12
{
  id v35 = a3;
  id v34 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  id v21 = a12;
  if (v20)
  {
    id v36 = 0;
    id v22 = [v20 restoreVerificationSummary:&v36];
    id v23 = v36;
    if (!v22)
    {
      v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Could not fetch restore verification summary from plan: %@", buf, 0xCu);
        id v33 = v23;
        _MBLog();
      }
    }
  }
  else
  {
    id v22 = 0;
  }
  id v25 = [[MBCKStatusRequest alloc] initWithRequestType:1 device:0 duration:v21 error:a11];
  [(MBCKStatusRequest *)v25 setIsForegroundRestore:0];
  [(MBCKStatusRequest *)v25 setSourceDeviceID:v18];
  [(MBCKStatusRequest *)v25 setSnapshotUUID:v19];
  v26 = +[NSNumber numberWithUnsignedInteger:a7];
  [(MBCKStatusRequest *)v25 setSnapshotIndex:v26];

  [(MBCKStatusRequest *)v25 setSnapshotFormat:a8];
  [(MBCKStatusRequest *)v25 setIsRestoringWithFileLists:a9];
  if (v22)
  {
    -[MBCKStatusRequest setBackgroundVerificationEnabled:](v25, "setBackgroundVerificationEnabled:", [v22 verifierWasRun]);
    v27 = [v22 statusToReport];
    [(MBCKStatusRequest *)v25 setBackgroundRestoreVerificationStatus:v27];
  }
  else
  {
    [(MBCKStatusRequest *)v25 setBackgroundVerificationEnabled:0];
    [(MBCKStatusRequest *)v25 setBackgroundRestoreVerificationStatus:0];
  }
  v28 = +[MBCKOperationPolicy expensiveCellularPolicy];
  [(MBCKStatusRequest *)v25 setCkOperationPolicy:v28];
  v29 = [(MBCKStatusRequest *)v25 stringForRestorePhase];
  v30 = [v29 capitalizedString];

  id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%@ Restore", v30];
  v32 = [v28 operationGroupWithName:v31];
  [(MBCKStatusRequest *)v25 setCkOperationGroup:v32];

  [(MBCKStatusRequest *)v25 _sendWithAccount:v35 databaseManager:v34];
}

- (MBCKStatusRequest)initWithRequestType:(unint64_t)a3 device:(id)a4 duration:(double)a5 error:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MBCKStatusRequest;
  id v12 = [(MBCKModel *)&v19 initWithRecord:0 cache:0];
  if (v12)
  {
    if (!v11)
    {
      CFStringRef v13 = @"Backup";
      if (a3 == 1) {
        CFStringRef v13 = @"Restore";
      }
      if (a3 == 2) {
        CFStringRef v13 = @"Usage";
      }
      id v11 = +[MBError errorWithCode:0, @"%@ completed successfully", v13 format];
    }
    [(MBCKStatusRequest *)v12 setDevice:v10];
    [(MBCKStatusRequest *)v12 setEventType:a3];
    [(MBCKStatusRequest *)v12 setDuration:a5];
    id v18 = 0;
    uint64_t v14 = MBSerializeErrors(v11, &v18);
    id v15 = v18;
    [(MBCKStatusRequest *)v12 setSerializedUnderlyingErrors:v14];

    [(MBCKStatusRequest *)v12 setErrorToReport:v15];
    id v16 = MBRandomUUID();
    [(MBCKStatusRequest *)v12 setUuid:v16];

    [(MBCKStatusRequest *)v12 setBackupReason:0];
    [(MBCKStatusRequest *)v12 setSnapshotType:-1];
    [(MBCKStatusRequest *)v12 setBackupPolicy:0];
  }

  return v12;
}

- (id)stringForRestorePhase
{
  if ([(MBCKStatusRequest *)self isForegroundRestore]) {
    return @"foreground";
  }
  else {
    return @"background";
  }
}

- (id)recordType
{
  return @"StatusRequest";
}

- (unint64_t)recordZone
{
  return 1;
}

- (id)recordRepresentation
{
  v203.receiver = self;
  v203.super_class = (Class)MBCKStatusRequest;
  v3 = [(MBCKModel *)&v203 recordRepresentation];
  v4 = [(MBCKStatusRequest *)self device];
  double v5 = [v3 objectForKeyedSubscript:@"device"];

  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    id v7 = objc_alloc((Class)CKReference);
    id v8 = [v4 recordID];
    id v9 = [v7 initWithRecordID:v8 action:0];
    [v3 setObject:v9 forKeyedSubscript:@"device"];
  }
  id v10 = [v3 objectForKeyedSubscript:@"eventType"];

  if (!v10)
  {
    id v11 = +[NSNumber numberWithLongLong:[(MBCKStatusRequest *)self eventType]];
    [v3 setObject:v11 forKeyedSubscript:@"eventType"];
  }
  id v12 = [v3 objectForKeyedSubscript:@"errorCode"];

  if (!v12)
  {
    CFStringRef v13 = [(MBCKStatusRequest *)self errorToReport];
    uint64_t v14 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v13 code]);
    [v3 setObject:v14 forKeyedSubscript:@"errorCode"];
  }
  id v15 = [v3 objectForKeyedSubscript:@"errorDescription"];

  if (!v15)
  {
    id v16 = [(MBCKStatusRequest *)self errorToReport];
    v17 = [v16 localizedDescription];
    [v3 setObject:v17 forKeyedSubscript:@"errorDescription"];
  }
  id v18 = [v3 objectForKeyedSubscript:@"errorDomain"];

  if (!v18)
  {
    objc_super v19 = [(MBCKStatusRequest *)self errorToReport];
    id v20 = [v19 domain];
    [v3 setObject:v20 forKeyedSubscript:@"errorDomain"];
  }
  id v21 = +[NSMutableDictionary dictionary];
  id v22 = [v3 objectForKeyedSubscript:@"duration"];
  if (!v22)
  {
    [(MBCKStatusRequest *)self duration];
    [(MBCKStatusRequest *)self duration];
    id v22 = +[NSNumber numberWithLongLong:(uint64_t)(v23 * 1000.0)];
    [v21 setObject:v22 forKeyedSubscript:@"duration"];
  }

  v24 = [(MBCKStatusRequest *)self errorToReport];

  if (v24)
  {
    id v25 = [(MBCKStatusRequest *)self errorToReport];
    v26 = [v25 localizedDescription];
    [v21 setObject:v26 forKeyedSubscript:@"shortErrorDescription"];
  }
  v27 = [(MBCKStatusRequest *)self serializedUnderlyingErrors];
  id v28 = [v27 count];

  if (v28)
  {
    v29 = [(MBCKStatusRequest *)self serializedUnderlyingErrors];
    [v21 setObject:v29 forKeyedSubscript:@"underlyingErrors"];
  }
  uint64_t v30 = [(MBCKStatusRequest *)self errorToReport];
  if (v30)
  {
    id v31 = (void *)v30;
    v32 = [(MBCKStatusRequest *)self errorToReport];
    unsigned __int8 v33 = +[MBError isError:v32 withCode:0];

    if (v33)
    {
      CFStringRef v34 = @"YES";
    }
    else
    {
      id v35 = [(MBCKStatusRequest *)self minutesRemaining];

      if (v35)
      {
        id v36 = [(MBCKStatusRequest *)self minutesRemaining];
        [v21 setObject:v36 forKeyedSubscript:@"minutesRemaining"];
      }
      CFStringRef v34 = @"NO";
    }
  }
  else
  {
    CFStringRef v34 = @"YES";
  }
  v37 = +[NSNumber numberWithLongLong:[(MBCKStatusRequest *)self chargingType]];
  [v21 setObject:v37 forKeyedSubscript:@"chargingType"];

  id v38 = [(MBCKStatusRequest *)self stateDescription];

  if (v38)
  {
    v39 = [(MBCKStatusRequest *)self stateDescription];
    [v21 setObject:v39 forKeyedSubscript:@"state"];
  }
  v40 = [(MBCKStatusRequest *)self freeDiskSpace];

  if (v40)
  {
    v41 = [(MBCKStatusRequest *)self freeDiskSpace];
    [v21 setObject:v41 forKeyedSubscript:@"freeDiskSpace"];
  }
  v42 = +[NSNumber numberWithInteger:[(MBCKStatusRequest *)self backupPolicy]];
  [v21 setObject:v42 forKeyedSubscript:@"backupPolicy"];

  if ([(MBCKStatusRequest *)self allowedCellularCost])
  {
    v43 = +[NSNumber numberWithInt:[(MBCKStatusRequest *)self allowedCellularCost]];
    [v21 setObject:v43 forKeyedSubscript:@"allowedCellularCost"];
  }
  v44 = +[NSNumber numberWithLongLong:[(MBCKStatusRequest *)self snapshotFormat]];
  [v21 setObject:v44 forKeyedSubscript:@"snapshotFormat"];

  if ([(MBCKStatusRequest *)self hasNetworkConnectivityInfo])
  {
    unint64_t v45 = (unint64_t)[(MBCKStatusRequest *)self networkConnectivityAtStart];
    v46 = +[NSNumber numberWithBool:v45 & 1];
    [v21 setObject:v46 forKeyedSubscript:@"onWiFiAtStart"];

    v47 = +[NSNumber numberWithBool:(v45 >> 8) & 1];
    [v21 setObject:v47 forKeyedSubscript:@"onCellularAtStart"];

    if ((v45 & 0x100) != 0)
    {
      if ((v45 & 0x10000) != 0) {
        v48 = &off_10043A050;
      }
      else {
        v48 = &off_10043A068;
      }
      [v21 setObject:v48 forKeyedSubscript:@"cellularCostAtStart"];
      v49 = +[NSNumber numberWithInt:HIDWORD(v45)];
      [v21 setObject:v49 forKeyedSubscript:@"cellularRadioTypeAtStart"];
    }
    unint64_t v50 = (unint64_t)[(MBCKStatusRequest *)self networkConnectivityAtFinish];
    uint64_t v51 = +[NSNumber numberWithBool:v50 & 1];
    [v21 setObject:v51 forKeyedSubscript:@"onWiFiAtFinish"];

    id v52 = +[NSNumber numberWithBool:(v50 >> 8) & 1];
    [v21 setObject:v52 forKeyedSubscript:@"onCellularAtFinish"];

    if ((v50 & 0x100) != 0)
    {
      if ((v50 & 0x10000) != 0) {
        uint64_t v53 = &off_10043A050;
      }
      else {
        uint64_t v53 = &off_10043A068;
      }
      [v21 setObject:v53 forKeyedSubscript:@"cellularCostAtFinish"];
      v54 = +[NSNumber numberWithInt:HIDWORD(v50)];
      [v21 setObject:v54 forKeyedSubscript:@"cellularRadioTypeAtFinish"];
    }
  }
  if ([(MBCKStatusRequest *)self eventType])
  {
    if ((id)[(MBCKStatusRequest *)self eventType] != (id)1) {
      goto LABEL_161;
    }
    v55 = [(MBCKStatusRequest *)self sourceDeviceID];
    v56 = [v3 objectForKeyedSubscript:@"device"];

    if (!v56 && v55)
    {
      v57 = objc_msgSend(v55, "mb_backupIDByAddingCKPrefix");
      id v58 = objc_alloc((Class)CKRecordID);
      v59 = +[MBCKDatabaseManager zoneIDOfType:2];
      id v60 = [v58 initWithRecordName:v57 zoneID:v59];

      id v61 = [objc_alloc((Class)CKReference) initWithRecordID:v60 action:0];
      [v3 setObject:v61 forKeyedSubscript:@"device"];
    }
    v62 = [(MBCKStatusRequest *)self snapshotUUID];
    v63 = [(MBCKStatusRequest *)self snapshotIndex];
    v64 = v63;
    if (v63)
    {
      id v65 = v63;
    }
    else
    {
      v167 = [v4 snapshots];
      id v168 = v62;
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1001B7E60;
      v205 = &unk_100415958;
      v206[0] = v168;
      id v169 = [v167 indexOfObjectPassingTest:buf];
      if (v169 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v65 = 0;
      }
      else
      {
        id v65 = +[NSNumber numberWithUnsignedInteger:v169];
      }
    }
    v170 = [(MBCKStatusRequest *)self stringForRestorePhase];
    [v21 setObject:v170 forKeyedSubscript:@"restoreType"];

    [v21 setObject:v62 forKeyedSubscript:@"snapshot"];
    [v21 setObject:v55 forKeyedSubscript:@"sourceDeviceID"];
    v171 = MBDeviceUUID();
    [v21 setObject:v171 forKeyedSubscript:@"targetDeviceID"];

    [v21 setObject:v34 forKeyedSubscript:@"restoreSucceeded"];
    if (v65) {
      [v21 setObject:v65 forKeyedSubscript:@"snapshotIndex"];
    }
    v172 = [(MBCKStatusRequest *)self foregroundRestorableSize];

    if (v172)
    {
      v173 = [(MBCKStatusRequest *)self foregroundRestorableSize];
      [v21 setObject:v173 forKeyedSubscript:@"foregroundRestorableSize"];
    }
    v174 = [(MBCKStatusRequest *)self backgroundRestorableSize];

    if (v174)
    {
      v175 = [(MBCKStatusRequest *)self backgroundRestorableSize];
      [v21 setObject:v175 forKeyedSubscript:@"backgroundRestorableSize"];
    }
    v176 = [(MBCKStatusRequest *)self foregroundRestorableFileCount];

    if (v176)
    {
      v177 = [(MBCKStatusRequest *)self foregroundRestorableFileCount];
      [v21 setObject:v177 forKeyedSubscript:@"foregroundRestorableFileCount"];
    }
    v178 = [(MBCKStatusRequest *)self backgroundRestorableFileCount];

    if (v178)
    {
      v179 = [(MBCKStatusRequest *)self backgroundRestorableFileCount];
      [v21 setObject:v179 forKeyedSubscript:@"backgroundRestorableFileCount"];
    }
    v180 = [(MBCKStatusRequest *)self restoreBuildVersion];

    if (v180)
    {
      v181 = [(MBCKStatusRequest *)self restoreBuildVersion];
      [v21 setObject:v181 forKeyedSubscript:@"restoreBuildVersion"];
    }
    if ([(MBCKStatusRequest *)self isForegroundRestore])
    {
      v182 = +[NSNumber numberWithBool:[(MBCKStatusRequest *)self foregroundRestoreVerificationEnabled]];
      [v21 setObject:v182 forKeyedSubscript:@"foregroundRestoreVerificationEnabled"];

      v183 = [(MBCKStatusRequest *)self foregroundRestoreVerificationStatus];

      if (v183)
      {
        v184 = [(MBCKStatusRequest *)self foregroundRestoreVerificationStatus];
        CFStringRef v185 = @"foregroundRestoreVerificationStatus";
LABEL_155:
        [v21 setObject:v184 forKeyedSubscript:v185];
      }
    }
    else
    {
      v186 = +[NSNumber numberWithBool:[(MBCKStatusRequest *)self backgroundVerificationEnabled]];
      [v21 setObject:v186 forKeyedSubscript:@"backgroundRestoreVerificationEnabled"];

      v187 = [(MBCKStatusRequest *)self backgroundRestoreVerificationStatus];

      if (v187)
      {
        v184 = [(MBCKStatusRequest *)self backgroundRestoreVerificationStatus];
        CFStringRef v185 = @"backgroundRestoreVerificationStatus";
        goto LABEL_155;
      }
    }
    v188 = [(MBCKStatusRequest *)self errorToReport];

    if (v188)
    {
      v189 = [(MBCKStatusRequest *)self errorToReport];
      v190 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[MBError isRetryableRestoreError:v189]);
      [v21 setObject:v190 forKeyedSubscript:@"isRetryableRestoreError"];
    }
    v191 = +[NSNumber numberWithBool:[(MBCKStatusRequest *)self isRestoringWithFileLists]];
    [v21 setObject:v191 forKeyedSubscript:@"isRestoringWithFileLists"];

    goto LABEL_159;
  }
  v66 = +[NSNumber numberWithLongLong:[(MBCKStatusRequest *)self backupReason]];
  [v21 setObject:v66 forKeyedSubscript:@"backupReason"];

  if ([(MBCKStatusRequest *)self snapshotType] != -1)
  {
    v67 = +[NSNumber numberWithLongLong:[(MBCKStatusRequest *)self snapshotType]];
    [v21 setObject:v67 forKeyedSubscript:@"backupType"];
  }
  v68 = [v4 pendingSnapshot];
  v62 = v68;
  if (v68)
  {
    v55 = [v68 snapshotID];
    v69 = [v4 dateOfLastBackup];
    if (v69) {
      [v21 setObject:v69 forKeyedSubscript:@"lastBackupDate"];
    }

    if (!v55) {
      goto LABEL_58;
    }
  }
  else
  {
    v55 = [(MBCKStatusRequest *)self pendingSnapshotID];
    if (!v55) {
      goto LABEL_58;
    }
  }
  [v21 setObject:v55 forKeyedSubscript:@"snapshot"];
LABEL_58:
  v70 = [(MBCKStatusRequest *)self errorToReport];
  unsigned int v71 = +[MBError isCKError:v70 withCode:25];

  if (v71)
  {
    v72 = +[NSNumber numberWithUnsignedLongLong:[(MBCKStatusRequest *)self pendingSnapshotQuotaReserved]];
    [v21 setObject:v72 forKeyedSubscript:@"quotaReserved"];
  }
  if ([(MBCKStatusRequest *)self usedAPFSSnapshots]) {
    CFStringRef v73 = @"YES";
  }
  else {
    CFStringRef v73 = @"NO";
  }
  [v21 setObject:v73 forKeyedSubscript:@"usedAPFSSnapshots"];
  v74 = [(MBCKStatusRequest *)self topDomainsWithMissingEncryptionKeys];
  id v75 = [v74 count];

  if (v75)
  {
    id v76 = [(MBCKStatusRequest *)self topDomainsWithMissingEncryptionKeys];
    [v21 setObject:v76 forKeyedSubscript:@"topDomainsWithMissingEncryptionKeys"];
  }
  id v77 = [(MBCKStatusRequest *)self backupTotalSize];

  if (v77)
  {
    v78 = [(MBCKStatusRequest *)self backupTotalSize];
    [v21 setObject:v78 forKeyedSubscript:@"backupSize"];
  }
  v79 = [(MBCKStatusRequest *)self backupFileCount];

  if (v79)
  {
    v80 = [(MBCKStatusRequest *)self backupFileCount];
    [v21 setObject:v80 forKeyedSubscript:@"backupFileCount"];
  }
  v81 = [(MBCKStatusRequest *)self backupDirectoryCount];

  if (v81)
  {
    v82 = [(MBCKStatusRequest *)self backupDirectoryCount];
    [v21 setObject:v82 forKeyedSubscript:@"backupDirectoryCount"];
  }
  v83 = [(MBCKStatusRequest *)self queuedSize];

  if (v83)
  {
    v84 = [(MBCKStatusRequest *)self queuedSize];
    [v21 setObject:v84 forKeyedSubscript:@"queuedSize"];
  }
  v85 = [(MBCKStatusRequest *)self queuedFileCount];

  if (v85)
  {
    v86 = [(MBCKStatusRequest *)self queuedFileCount];
    [v21 setObject:v86 forKeyedSubscript:@"queuedFileCount"];
  }
  v87 = [(MBCKStatusRequest *)self uploadedSize];

  if (v87)
  {
    v88 = [(MBCKStatusRequest *)self uploadedSize];
    [v21 setObject:v88 forKeyedSubscript:@"uploadedSize"];
  }
  v89 = [(MBCKStatusRequest *)self uploadedFileCount];

  if (v89)
  {
    v90 = [(MBCKStatusRequest *)self uploadedFileCount];
    [v21 setObject:v90 forKeyedSubscript:@"uploadedFileCount"];
  }
  v91 = [(MBCKStatusRequest *)self lastOnConditionEvents];

  if (v91)
  {
    v92 = [(MBCKStatusRequest *)self lastOnConditionEvents];
    [v21 setObject:v92 forKeyedSubscript:@"lastOnConditionEvents"];
  }
  if ([(MBCKStatusRequest *)self hasNewOTAKeyBag]) {
    CFStringRef v93 = @"YES";
  }
  else {
    CFStringRef v93 = @"NO";
  }
  [v21 setObject:v93 forKeyedSubscript:@"newOTAKeyBag"];
  id v94 = [(MBCKStatusRequest *)self throughputs];
  id v95 = [v94 count];

  if (v95)
  {
    id v96 = [(MBCKStatusRequest *)self throughputs];
    [v21 setObject:v96 forKeyedSubscript:@"throughputs"];
  }
  uint64_t v97 = [(MBCKStatusRequest *)self wifiQuality];
  id v98 = [v97 count];

  if (v98)
  {
    v99 = [(MBCKStatusRequest *)self wifiQuality];
    [v21 setObject:v99 forKeyedSubscript:@"wifiQuality"];
  }
  v100 = [(MBCKStatusRequest *)self cacheSize];

  if (v100)
  {
    v101 = [(MBCKStatusRequest *)self cacheSize];
    [v21 setObject:v101 forKeyedSubscript:@"cacheSize"];
  }
  v102 = [(MBCKStatusRequest *)self remainingCellularBalance];

  if (v102)
  {
    v103 = [(MBCKStatusRequest *)self remainingCellularBalance];
    [v21 setObject:v103 forKeyedSubscript:@"remainingCellularBalance"];
  }
  v104 = [(MBCKStatusRequest *)self classAFilesMissingEncryptionKeys];

  if (v104)
  {
    v105 = [(MBCKStatusRequest *)self classAFilesMissingEncryptionKeys];
    [v21 setObject:v105 forKeyedSubscript:@"classAFilesMissingEncryptionKeys"];
  }
  v106 = [(MBCKStatusRequest *)self classBFilesMissingEncryptionKeys];

  if (v106)
  {
    v107 = [(MBCKStatusRequest *)self classBFilesMissingEncryptionKeys];
    [v21 setObject:v107 forKeyedSubscript:@"classBFilesMissingEncryptionKeys"];
  }
  [(MBCKStatusRequest *)self fseventDuration];
  if (v108 != 0.0)
  {
    [(MBCKStatusRequest *)self fseventDuration];
    v109 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v21 setObject:v109 forKeyedSubscript:@"fseventDuration"];
  }
  v110 = [(MBCKStatusRequest *)self enabledDomainsCount];

  if (v110)
  {
    v111 = [(MBCKStatusRequest *)self enabledDomainsCount];
    [v21 setObject:v111 forKeyedSubscript:@"enabledDomainsCount"];
  }
  v112 = [(MBCKStatusRequest *)self scannedDomainsCount];

  if (v112)
  {
    v113 = [(MBCKStatusRequest *)self scannedDomainsCount];
    [v21 setObject:v113 forKeyedSubscript:@"scannedDomainsCount"];
  }
  v114 = [(MBCKStatusRequest *)self skippedFilesCount];

  if (v114)
  {
    v115 = [(MBCKStatusRequest *)self skippedFilesCount];
    [v21 setObject:v115 forKeyedSubscript:@"skippedFilesCount"];
  }
  uint64_t v116 = [(MBCKStatusRequest *)self cacheRefreshSummary];
  if (v116)
  {
    v117 = (void *)v116;
    v118 = [(MBCKStatusRequest *)self cacheRefreshSummary];
    id v119 = [v118 downloadedSnapshotCount];

    if (v119)
    {
      v120 = [(MBCKStatusRequest *)self cacheRefreshSummary];
      v121 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v120 cachedSnapshotCount]);
      [v21 setObject:v121 forKeyedSubscript:@"cachedSnapshotCount"];

      v122 = [(MBCKStatusRequest *)self cacheRefreshSummary];
      v123 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v122 serverSnapshotCount]);
      [v21 setObject:v123 forKeyedSubscript:@"serverSnapshotCount"];

      v124 = [(MBCKStatusRequest *)self cacheRefreshSummary];
      v125 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v124 journalActionCount]);
      [v21 setObject:v125 forKeyedSubscript:@"journalActionCount"];

      v126 = [(MBCKStatusRequest *)self cacheRefreshSummary];
      v127 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v126 journalReplaySucceeded]);
      [v21 setObject:v127 forKeyedSubscript:@"journalReplaySucceeded"];

      v128 = [(MBCKStatusRequest *)self cacheRefreshSummary];
      v129 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v128 journalVerificationErrorCount]);
      [v21 setObject:v129 forKeyedSubscript:@"journalVerificationErrorCount"];

      v130 = [(MBCKStatusRequest *)self cacheRefreshSummary];
      v131 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v130 downloadedSnapshotCount]);
      [v21 setObject:v131 forKeyedSubscript:@"downloadedSnapshotCount"];

      v132 = [(MBCKStatusRequest *)self cacheRefreshSummary];
      v133 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v132 downloadedSnapshotVerificationFailureCount]);
      [v21 setObject:v133 forKeyedSubscript:@"downloadedSnapshotVerificationFailureCount"];

      v134 = [(MBCKStatusRequest *)self cacheRefreshSummary];
      v135 = [v134 verificationFailureStrings];

      if ([v135 count]) {
        [v21 setObject:v135 forKeyedSubscript:@"verificationFailures"];
      }
    }
  }
  v136 = +[NSNumber numberWithBool:[(MBCKStatusRequest *)self backupOnWiFiWithDAS]];
  [v21 setObject:v136 forKeyedSubscript:@"backupOnWiFiWithDAS"];

  v137 = [(MBCKStatusRequest *)self snapshotVerificationStatus];

  if (v137)
  {
    v138 = [(MBCKStatusRequest *)self snapshotVerificationStatus];
    [v21 setObject:v138 forKeyedSubscript:@"snapshotVerificationStatus"];

    [(MBCKStatusRequest *)self snapshotVerificationDuration];
    [(MBCKStatusRequest *)self snapshotVerificationDuration];
    v140 = +[NSNumber numberWithLongLong:(uint64_t)(v139 * 1000.0)];
    [v21 setObject:v140 forKeyedSubscript:@"snapshotVerificationDuration"];

    v141 = [(MBCKStatusRequest *)self snapshotVerificationCancellationError];

    if (v141)
    {
      v142 = [(MBCKStatusRequest *)self snapshotVerificationCancellationError];
      v143 = [v142 domain];
      [v21 setObject:v143 forKeyedSubscript:@"verificationCancellationErrorDomain"];

      v144 = [(MBCKStatusRequest *)self snapshotVerificationCancellationError];
      v145 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v144 code]);
      [v21 setObject:v145 forKeyedSubscript:@"verificationCancellationErrorCode"];

      v146 = [(MBCKStatusRequest *)self snapshotVerificationCancellationError];
      v147 = [v146 localizedDescription];
      [v21 setObject:v147 forKeyedSubscript:@"verificationCancellationErrorDescription"];
    }
  }
  v148 = +[NSNumber numberWithBool:[(MBCKStatusRequest *)self snapshotVerificationEnabled]];
  [v21 setObject:v148 forKeyedSubscript:@"snapshotVerificationEnabled"];

  v149 = [(MBCKStatusRequest *)self emptyDomainCount];

  if (v149)
  {
    v150 = [(MBCKStatusRequest *)self emptyDomainCount];
    [v21 setObject:v150 forKeyedSubscript:@"emptyDomainCount"];
  }
  v151 = [(MBCKStatusRequest *)self deletedFileCount];

  if (v151)
  {
    v152 = [(MBCKStatusRequest *)self deletedFileCount];
    [v21 setObject:v152 forKeyedSubscript:@"deletedFileCount"];
  }
  v153 = [(MBCKStatusRequest *)self unmodifiedDirectoryCount];

  if (v153)
  {
    v154 = [(MBCKStatusRequest *)self unmodifiedDirectoryCount];
    [v21 setObject:v154 forKeyedSubscript:@"unmodifiedDirectoryCount"];
  }
  v155 = [(MBCKStatusRequest *)self modifiedDirectoryCount];

  if (v155)
  {
    v156 = [(MBCKStatusRequest *)self modifiedDirectoryCount];
    [v21 setObject:v156 forKeyedSubscript:@"modifiedDirectoryCount"];
  }
  v157 = [(MBCKStatusRequest *)self uploadedAssetSize];

  if (v157)
  {
    v158 = [(MBCKStatusRequest *)self uploadedAssetSize];
    [v21 setObject:v158 forKeyedSubscript:@"uploadedAssetSize"];
  }
  v159 = [(MBCKStatusRequest *)self uploadedAssetCount];

  if (v159)
  {
    v160 = [(MBCKStatusRequest *)self uploadedAssetCount];
    [v21 setObject:v160 forKeyedSubscript:@"uploadedAssetCount"];
  }
  v161 = [(MBCKStatusRequest *)self unmodifiedRegularFileCount];

  if (v161)
  {
    v162 = [(MBCKStatusRequest *)self unmodifiedRegularFileCount];
    [v21 setObject:v162 forKeyedSubscript:@"unmodifiedRegularFileCount"];
  }
  v163 = [(MBCKStatusRequest *)self modifiedRegularFileCount];

  if (v163)
  {
    v164 = [(MBCKStatusRequest *)self modifiedRegularFileCount];
    [v21 setObject:v164 forKeyedSubscript:@"modifiedRegularFileCount"];
  }
  v165 = [(MBCKStatusRequest *)self peakMemoryUsage];

  if (v165)
  {
    v166 = [(MBCKStatusRequest *)self peakMemoryUsage];
    [v21 setObject:v166 forKeyedSubscript:@"peakMemoryUsage"];
  }
  if (![(MBCKStatusRequest *)self uploadedFileListSize]) {
    goto LABEL_160;
  }
  id v65 = +[NSNumber numberWithUnsignedInteger:[(MBCKStatusRequest *)self uploadedFileListSize]];
  [v21 setObject:v65 forKeyedSubscript:@"uploadedFileListSize"];
LABEL_159:

LABEL_160:
LABEL_161:
  if ([v21 count]) {
    [v3 setPluginFields:v21];
  }
  v192 = MBGetDefaultLog();
  if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
  {
    v193 = v192;
    if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v194 = objc_opt_class();
      v195 = [v3 recordID];
      v196 = [v195 recordName];
      v197 = [v3 pluginFields];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v194;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v196;
      *(_WORD *)&buf[22] = 2112;
      v205 = v3;
      LOWORD(v206[0]) = 2112;
      *(id *)((char *)v206 + 2) = v197;
      _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_DEFAULT, "Saving %{public}@(%{public}@) record:%@, pluginFields:%@", buf, 0x2Au);
    }
    objc_opt_class();
    v198 = [v3 recordID];
    v199 = [v198 recordName];
    v202 = [v3 pluginFields];
    _MBLog();
  }
  id v200 = v3;

  return v200;
}

- (MBCKOperationPolicy)ckOperationPolicy
{
  return self->_ckOperationPolicy;
}

- (void)setCkOperationPolicy:(id)a3
{
}

- (CKOperationGroup)ckOperationGroup
{
  return self->_ckOperationGroup;
}

- (void)setCkOperationGroup:(id)a3
{
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSError)errorToReport
{
  return self->_errorToReport;
}

- (void)setErrorToReport:(id)a3
{
}

- (NSArray)serializedUnderlyingErrors
{
  return self->_serializedUnderlyingErrors;
}

- (void)setSerializedUnderlyingErrors:(id)a3
{
}

- (MBCKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)chargingType
{
  return self->_chargingType;
}

- (void)setChargingType:(unint64_t)a3
{
  self->_chargingType = a3;
}

- (NSNumber)minutesRemaining
{
  return self->_minutesRemaining;
}

- (void)setMinutesRemaining:(id)a3
{
}

- (NSString)stateDescription
{
  return self->_stateDescription;
}

- (void)setStateDescription:(id)a3
{
}

- (NSNumber)freeDiskSpace
{
  return self->_freeDiskSpace;
}

- (void)setFreeDiskSpace:(id)a3
{
}

- (int64_t)backupPolicy
{
  return self->_backupPolicy;
}

- (void)setBackupPolicy:(int64_t)a3
{
  self->_backupPolicy = a3;
}

- (int)allowedCellularCost
{
  return self->_allowedCellularCost;
}

- (void)setAllowedCellularCost:(int)a3
{
  self->_allowedCellularCost = a3;
}

- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtStart
{
  p_networkConnectivityAtStart = &self->_networkConnectivityAtStart;
  uint64_t v3 = *(void *)&self->_networkConnectivityAtStart.isOnWiFi;
  unint64_t backupOnCellularSupport = p_networkConnectivityAtStart->backupOnCellularSupport;
  result.var4 = backupOnCellularSupport;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = HIDWORD(v3);
  return result;
}

- (void)setNetworkConnectivityAtStart:(id)a3
{
  self->_networkConnectivityAtStart = ($74774DBE0C4D9345BF9CF39D18F4694C)a3;
}

- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtFinish
{
  p_networkConnectivityAtFinish = &self->_networkConnectivityAtFinish;
  uint64_t v3 = *(void *)&self->_networkConnectivityAtFinish.isOnWiFi;
  unint64_t backupOnCellularSupport = p_networkConnectivityAtFinish->backupOnCellularSupport;
  result.var4 = backupOnCellularSupport;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = HIDWORD(v3);
  return result;
}

- (void)setNetworkConnectivityAtFinish:(id)a3
{
  self->_networkConnectivityAtFinish = ($74774DBE0C4D9345BF9CF39D18F4694C)a3;
}

- (BOOL)hasNetworkConnectivityInfo
{
  return self->_hasNetworkConnectivityInfo;
}

- (void)setHasNetworkConnectivityInfo:(BOOL)a3
{
  self->_hasNetworkConnectivityInfo = a3;
}

- (int64_t)snapshotFormat
{
  return self->_snapshotFormat;
}

- (void)setSnapshotFormat:(int64_t)a3
{
  self->_snapshotFormat = a3;
}

- (int64_t)backupReason
{
  return self->_backupReason;
}

- (void)setBackupReason:(int64_t)a3
{
  self->_backupReason = a3;
}

- (int64_t)snapshotType
{
  return self->_snapshotType;
}

- (void)setSnapshotType:(int64_t)a3
{
  self->_snapshotType = a3;
}

- (BOOL)usedAPFSSnapshots
{
  return self->_usedAPFSSnapshots;
}

- (void)setUsedAPFSSnapshots:(BOOL)a3
{
  self->_usedAPFSSnapshots = a3;
}

- (NSString)pendingSnapshotID
{
  return self->_pendingSnapshotID;
}

- (void)setPendingSnapshotID:(id)a3
{
}

- (unint64_t)pendingSnapshotQuotaReserved
{
  return self->_pendingSnapshotQuotaReserved;
}

- (void)setPendingSnapshotQuotaReserved:(unint64_t)a3
{
  self->_pendingSnapshotQuotaReserved = a3;
}

- (NSArray)topDomainsWithMissingEncryptionKeys
{
  return self->_topDomainsWithMissingEncryptionKeys;
}

- (void)setTopDomainsWithMissingEncryptionKeys:(id)a3
{
}

- (NSNumber)backupTotalSize
{
  return self->_backupTotalSize;
}

- (void)setBackupTotalSize:(id)a3
{
}

- (NSNumber)backupFileCount
{
  return self->_backupFileCount;
}

- (void)setBackupFileCount:(id)a3
{
}

- (NSNumber)backupDirectoryCount
{
  return self->_backupDirectoryCount;
}

- (void)setBackupDirectoryCount:(id)a3
{
}

- (NSNumber)queuedSize
{
  return self->_queuedSize;
}

- (void)setQueuedSize:(id)a3
{
}

- (NSNumber)queuedFileCount
{
  return self->_queuedFileCount;
}

- (void)setQueuedFileCount:(id)a3
{
}

- (NSNumber)uploadedSize
{
  return self->_uploadedSize;
}

- (void)setUploadedSize:(id)a3
{
}

- (NSNumber)uploadedFileCount
{
  return self->_uploadedFileCount;
}

- (void)setUploadedFileCount:(id)a3
{
}

- (NSArray)lastOnConditionEvents
{
  return self->_lastOnConditionEvents;
}

- (void)setLastOnConditionEvents:(id)a3
{
}

- (BOOL)hasNewOTAKeyBag
{
  return self->_hasNewOTAKeyBag;
}

- (void)setHasNewOTAKeyBag:(BOOL)a3
{
  self->_hasNewOTAKeyBag = a3;
}

- (NSArray)throughputs
{
  return self->_throughputs;
}

- (void)setThroughputs:(id)a3
{
}

- (NSArray)wifiQuality
{
  return self->_wifiQuality;
}

- (void)setWifiQuality:(id)a3
{
}

- (NSNumber)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(id)a3
{
}

- (NSNumber)remainingCellularBalance
{
  return self->_remainingCellularBalance;
}

- (void)setRemainingCellularBalance:(id)a3
{
}

- (NSNumber)classAFilesMissingEncryptionKeys
{
  return self->_classAFilesMissingEncryptionKeys;
}

- (void)setClassAFilesMissingEncryptionKeys:(id)a3
{
}

- (NSNumber)classBFilesMissingEncryptionKeys
{
  return self->_classBFilesMissingEncryptionKeys;
}

- (void)setClassBFilesMissingEncryptionKeys:(id)a3
{
}

- (double)fseventDuration
{
  return self->_fseventDuration;
}

- (void)setFseventDuration:(double)a3
{
  self->_fseventDuration = a3;
}

- (NSNumber)enabledDomainsCount
{
  return self->_enabledDomainsCount;
}

- (void)setEnabledDomainsCount:(id)a3
{
}

- (NSNumber)scannedDomainsCount
{
  return self->_scannedDomainsCount;
}

- (void)setScannedDomainsCount:(id)a3
{
}

- (NSNumber)skippedFilesCount
{
  return self->_skippedFilesCount;
}

- (void)setSkippedFilesCount:(id)a3
{
}

- (MBCacheRefreshSummary)cacheRefreshSummary
{
  return self->_cacheRefreshSummary;
}

- (void)setCacheRefreshSummary:(id)a3
{
}

- (BOOL)backupOnWiFiWithDAS
{
  return self->_backupOnWiFiWithDAS;
}

- (void)setBackupOnWiFiWithDAS:(BOOL)a3
{
  self->_backupOnWiFiWithDAS = a3;
}

- (NSString)snapshotVerificationStatus
{
  return self->_snapshotVerificationStatus;
}

- (void)setSnapshotVerificationStatus:(id)a3
{
  self->_snapshotVerificationStatus = (NSString *)a3;
}

- (double)snapshotVerificationDuration
{
  return self->_snapshotVerificationDuration;
}

- (void)setSnapshotVerificationDuration:(double)a3
{
  self->_snapshotVerificationDuration = a3;
}

- (BOOL)snapshotVerificationEnabled
{
  return self->_snapshotVerificationEnabled;
}

- (void)setSnapshotVerificationEnabled:(BOOL)a3
{
  self->_snapshotVerificationEnabled = a3;
}

- (NSNumber)emptyDomainCount
{
  return self->_emptyDomainCount;
}

- (void)setEmptyDomainCount:(id)a3
{
}

- (NSNumber)deletedFileCount
{
  return self->_deletedFileCount;
}

- (void)setDeletedFileCount:(id)a3
{
}

- (NSNumber)unmodifiedDirectoryCount
{
  return self->_unmodifiedDirectoryCount;
}

- (void)setUnmodifiedDirectoryCount:(id)a3
{
}

- (NSNumber)modifiedDirectoryCount
{
  return self->_modifiedDirectoryCount;
}

- (void)setModifiedDirectoryCount:(id)a3
{
}

- (NSNumber)uploadedAssetCount
{
  return self->_uploadedAssetCount;
}

- (void)setUploadedAssetCount:(id)a3
{
}

- (NSNumber)uploadedAssetSize
{
  return self->_uploadedAssetSize;
}

- (void)setUploadedAssetSize:(id)a3
{
}

- (NSNumber)unmodifiedRegularFileCount
{
  return self->_unmodifiedRegularFileCount;
}

- (void)setUnmodifiedRegularFileCount:(id)a3
{
}

- (NSNumber)modifiedRegularFileCount
{
  return self->_modifiedRegularFileCount;
}

- (void)setModifiedRegularFileCount:(id)a3
{
}

- (NSNumber)peakMemoryUsage
{
  return self->_peakMemoryUsage;
}

- (void)setPeakMemoryUsage:(id)a3
{
}

- (unint64_t)uploadedFileListSize
{
  return self->_uploadedFileListSize;
}

- (void)setUploadedFileListSize:(unint64_t)a3
{
  self->_uploadedFileListSize = a3;
}

- (NSError)snapshotVerificationCancellationError
{
  return self->_snapshotVerificationCancellationError;
}

- (void)setSnapshotVerificationCancellationError:(id)a3
{
}

- (NSString)snapshotUUID
{
  return self->_snapshotUUID;
}

- (void)setSnapshotUUID:(id)a3
{
}

- (NSString)sourceDeviceID
{
  return self->_sourceDeviceID;
}

- (void)setSourceDeviceID:(id)a3
{
}

- (NSNumber)snapshotIndex
{
  return self->_snapshotIndex;
}

- (void)setSnapshotIndex:(id)a3
{
}

- (NSString)restoreBuildVersion
{
  return self->_restoreBuildVersion;
}

- (void)setRestoreBuildVersion:(id)a3
{
}

- (BOOL)isForegroundRestore
{
  return self->_isForegroundRestore;
}

- (void)setIsForegroundRestore:(BOOL)a3
{
  self->_isForegroundRestore = a3;
}

- (NSNumber)foregroundRestorableSize
{
  return self->_foregroundRestorableSize;
}

- (void)setForegroundRestorableSize:(id)a3
{
}

- (NSNumber)backgroundRestorableSize
{
  return self->_backgroundRestorableSize;
}

- (void)setBackgroundRestorableSize:(id)a3
{
}

- (NSNumber)foregroundRestorableFileCount
{
  return self->_foregroundRestorableFileCount;
}

- (void)setForegroundRestorableFileCount:(id)a3
{
}

- (NSNumber)backgroundRestorableFileCount
{
  return self->_backgroundRestorableFileCount;
}

- (void)setBackgroundRestorableFileCount:(id)a3
{
}

- (NSString)foregroundRestoreVerificationStatus
{
  return self->_foregroundRestoreVerificationStatus;
}

- (void)setForegroundRestoreVerificationStatus:(id)a3
{
  self->_foregroundRestoreVerificationStatus = (NSString *)a3;
}

- (BOOL)foregroundRestoreVerificationEnabled
{
  return self->_foregroundRestoreVerificationEnabled;
}

- (void)setForegroundRestoreVerificationEnabled:(BOOL)a3
{
  self->_foregroundRestoreVerificationEnabled = a3;
}

- (BOOL)isRestoringWithFileLists
{
  return self->_isRestoringWithFileLists;
}

- (void)setIsRestoringWithFileLists:(BOOL)a3
{
  self->_isRestoringWithFileLists = a3;
}

- (BOOL)backgroundVerificationEnabled
{
  return self->_backgroundVerificationEnabled;
}

- (void)setBackgroundVerificationEnabled:(BOOL)a3
{
  self->_backgroundVerificationEnabled = a3;
}

- (NSString)backgroundRestoreVerificationStatus
{
  return self->_backgroundRestoreVerificationStatus;
}

- (void)setBackgroundRestoreVerificationStatus:(id)a3
{
  self->_backgroundRestoreVerificationStatus = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundRestorableFileCount, 0);
  objc_storeStrong((id *)&self->_foregroundRestorableFileCount, 0);
  objc_storeStrong((id *)&self->_backgroundRestorableSize, 0);
  objc_storeStrong((id *)&self->_foregroundRestorableSize, 0);
  objc_storeStrong((id *)&self->_restoreBuildVersion, 0);
  objc_storeStrong((id *)&self->_snapshotIndex, 0);
  objc_storeStrong((id *)&self->_sourceDeviceID, 0);
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_snapshotVerificationCancellationError, 0);
  objc_storeStrong((id *)&self->_peakMemoryUsage, 0);
  objc_storeStrong((id *)&self->_modifiedRegularFileCount, 0);
  objc_storeStrong((id *)&self->_unmodifiedRegularFileCount, 0);
  objc_storeStrong((id *)&self->_uploadedAssetSize, 0);
  objc_storeStrong((id *)&self->_uploadedAssetCount, 0);
  objc_storeStrong((id *)&self->_modifiedDirectoryCount, 0);
  objc_storeStrong((id *)&self->_unmodifiedDirectoryCount, 0);
  objc_storeStrong((id *)&self->_deletedFileCount, 0);
  objc_storeStrong((id *)&self->_emptyDomainCount, 0);
  objc_storeStrong((id *)&self->_cacheRefreshSummary, 0);
  objc_storeStrong((id *)&self->_skippedFilesCount, 0);
  objc_storeStrong((id *)&self->_scannedDomainsCount, 0);
  objc_storeStrong((id *)&self->_enabledDomainsCount, 0);
  objc_storeStrong((id *)&self->_classBFilesMissingEncryptionKeys, 0);
  objc_storeStrong((id *)&self->_classAFilesMissingEncryptionKeys, 0);
  objc_storeStrong((id *)&self->_remainingCellularBalance, 0);
  objc_storeStrong((id *)&self->_cacheSize, 0);
  objc_storeStrong((id *)&self->_wifiQuality, 0);
  objc_storeStrong((id *)&self->_throughputs, 0);
  objc_storeStrong((id *)&self->_lastOnConditionEvents, 0);
  objc_storeStrong((id *)&self->_uploadedFileCount, 0);
  objc_storeStrong((id *)&self->_uploadedSize, 0);
  objc_storeStrong((id *)&self->_queuedFileCount, 0);
  objc_storeStrong((id *)&self->_queuedSize, 0);
  objc_storeStrong((id *)&self->_backupDirectoryCount, 0);
  objc_storeStrong((id *)&self->_backupFileCount, 0);
  objc_storeStrong((id *)&self->_backupTotalSize, 0);
  objc_storeStrong((id *)&self->_topDomainsWithMissingEncryptionKeys, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotID, 0);
  objc_storeStrong((id *)&self->_freeDiskSpace, 0);
  objc_storeStrong((id *)&self->_stateDescription, 0);
  objc_storeStrong((id *)&self->_minutesRemaining, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_serializedUnderlyingErrors, 0);
  objc_storeStrong((id *)&self->_errorToReport, 0);
  objc_storeStrong((id *)&self->_ckOperationGroup, 0);
  objc_storeStrong((id *)&self->_ckOperationPolicy, 0);
}

@end