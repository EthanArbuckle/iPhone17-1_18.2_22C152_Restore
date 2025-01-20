@interface MBBackupTelemetry
- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtFinish;
- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtStart;
- (BOOL)createdNewOTAKeybag;
- (BOOL)snapshotVerificationEnabled;
- (MBBackupTelemetry)init;
- (NSArray)throughputs;
- (NSError)snapshotVerificationCancellationError;
- (NSMutableArray)wifiQuality;
- (NSMutableDictionary)domainsWithMissingEncryptionKeys;
- (NSNumber)backupDirectoryCount;
- (NSNumber)backupFileCount;
- (NSNumber)backupTotalSize;
- (NSNumber)cacheSize;
- (NSNumber)classAFilesMissingEncryptionKeys;
- (NSNumber)classBFilesMissingEncryptionKeys;
- (NSNumber)enabledDomainsCount;
- (NSNumber)freeDiskSpace;
- (NSNumber)minutesRemaining;
- (NSNumber)queuedFileCount;
- (NSNumber)queuedSize;
- (NSNumber)remainingCellularBalance;
- (NSNumber)scannedDomainsCount;
- (NSNumber)skippedFilesCount;
- (NSNumber)uploadedFileCount;
- (NSNumber)uploadedSize;
- (NSString)snapshotVerificationStatus;
- (OS_dispatch_group)wifiQualityGroup;
- (OS_dispatch_source)wifiQualityMeasurementTimer;
- (double)fseventDuration;
- (double)snapshotVerificationDuration;
- (id)_serializedWiFiQualityMeasurementFromInterface:(id)a3;
- (id)topDomainsWithMissingEncryptionKeys;
- (int)allowedCellularCost;
- (unint64_t)backupAttemptCount;
- (unint64_t)chargingType;
- (unint64_t)telemetryID;
- (void)_countMissingEncryptionKeyForFile:(id)a3;
- (void)_startCollectingWiFiQualityMeasurements;
- (void)_stopCollectingWiFiQualityMeasurements;
- (void)countUploadedFileWithSize:(unint64_t)a3;
- (void)setAllowedCellularCost:(int)a3;
- (void)setBackupAttemptCount:(unint64_t)a3;
- (void)setBackupDirectoryCount:(id)a3;
- (void)setBackupFileCount:(id)a3;
- (void)setBackupTotalSize:(id)a3;
- (void)setCacheSize:(id)a3;
- (void)setChargingType:(unint64_t)a3;
- (void)setClassAFilesMissingEncryptionKeys:(id)a3;
- (void)setClassBFilesMissingEncryptionKeys:(id)a3;
- (void)setCreatedNewOTAKeybag:(BOOL)a3;
- (void)setDomainsWithMissingEncryptionKeys:(id)a3;
- (void)setEnabledDomainsCount:(id)a3;
- (void)setFreeDiskSpace:(id)a3;
- (void)setFseventDuration:(double)a3;
- (void)setMinutesRemaining:(id)a3;
- (void)setNetworkConnectivityAtFinish:(id)a3;
- (void)setNetworkConnectivityAtStart:(id)a3;
- (void)setQueuedFileCount:(id)a3;
- (void)setQueuedSize:(id)a3;
- (void)setRemainingCellularBalance:(id)a3;
- (void)setScannedDomainsCount:(id)a3;
- (void)setSkippedFilesCount:(id)a3;
- (void)setSnapshotVerificationCancellationError:(id)a3;
- (void)setSnapshotVerificationDuration:(double)a3;
- (void)setSnapshotVerificationEnabled:(BOOL)a3;
- (void)setSnapshotVerificationStatus:(id)a3;
- (void)setTelemetryID:(unint64_t)a3;
- (void)setThroughputs:(id)a3;
- (void)setUploadedFileCount:(id)a3;
- (void)setUploadedSize:(id)a3;
- (void)setWifiQuality:(id)a3;
- (void)setWifiQualityGroup:(id)a3;
- (void)setWifiQualityMeasurementTimer:(id)a3;
@end

@implementation MBBackupTelemetry

- (MBBackupTelemetry)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBBackupTelemetry;
  v2 = [(MBBackupTelemetry *)&v4 init];
  if (v2)
  {
    v2->_telemetryID = arc4random_uniform(0xFFFFu);
    v2->_allowedCellularCost = 0;
  }
  return v2;
}

- (id)topDomainsWithMissingEncryptionKeys
{
  v2 = [(NSMutableDictionary *)self->_domainsWithMissingEncryptionKeys keysSortedByValueUsingComparator:&stru_100411AA8];
  id v3 = [v2 count];
  if ((unint64_t)v3 >= 5) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = (uint64_t)v3;
  }
  v5 = objc_msgSend(v2, "subarrayWithRange:", 0, v4);

  return v5;
}

- (void)countUploadedFileWithSize:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = [(MBBackupTelemetry *)obj uploadedSize];
  v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v4 unsignedLongLongValue] + a3);
  [(MBBackupTelemetry *)obj setUploadedSize:v5];

  v6 = [(MBBackupTelemetry *)obj uploadedFileCount];
  v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v6 unsignedLongLongValue] + 1);
  [(MBBackupTelemetry *)obj setUploadedFileCount:v7];

  objc_sync_exit(obj);
}

- (void)_countMissingEncryptionKeyForFile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 protectionClass];
  if (v5 == 2)
  {
    v7 = [(MBBackupTelemetry *)self classBFilesMissingEncryptionKeys];
    v8 = +[NSNumber numberWithUnsignedInt:[v7 unsignedIntValue] + 1];
    [(MBBackupTelemetry *)self setClassBFilesMissingEncryptionKeys:v8];
    goto LABEL_5;
  }
  id v6 = v5;
  if (v5 == 1)
  {
    v7 = [(MBBackupTelemetry *)self classAFilesMissingEncryptionKeys];
    v8 = +[NSNumber numberWithUnsignedInt:[v7 unsignedIntValue] + 1];
    [(MBBackupTelemetry *)self setClassAFilesMissingEncryptionKeys:v8];
LABEL_5:

    goto LABEL_6;
  }
  if (!MBIsInternalInstall()
    || dword_100482398
    || atomic_fetch_add_explicit(&dword_100482398, 1u, memory_order_relaxed))
  {
    goto LABEL_7;
  }
  v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    v15 = [v4 domain];
    v16 = [v15 name];
    v17 = [v4 relativePath];
    *(_DWORD *)buf = 67109634;
    int v24 = (int)v6;
    __int16 v25 = 2112;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "=cloud-backup= =cloud-backup= Unexpected pc:%d for file missing encryption key:%@ %@", buf, 0x1Cu);

    v18 = [v4 domain];
    v19 = [v18 name];
    [v4 relativePath];
    v22 = v21 = v19;
    id v20 = v6;
    _MBLog();
  }
LABEL_6:

LABEL_7:
  v9 = objc_msgSend(v4, "domain", v20, v21, v22);
  v10 = [v9 name];

  v11 = [(MBBackupTelemetry *)self domainsWithMissingEncryptionKeys];
  v12 = [v11 objectForKeyedSubscript:v10];

  if (v12)
  {
    v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 unsignedIntValue] + 1);
    v14 = [(MBBackupTelemetry *)self domainsWithMissingEncryptionKeys];
    [v14 setObject:v13 forKeyedSubscript:v10];
  }
  else
  {
    v13 = [(MBBackupTelemetry *)self domainsWithMissingEncryptionKeys];
    [v13 setObject:&off_100439EB8 forKeyedSubscript:v10];
  }
}

- (void)_startCollectingWiFiQualityMeasurements
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092EE0;
  block[3] = &unk_100411128;
  block[4] = self;
  if (qword_1004823A8 != -1) {
    dispatch_once(&qword_1004823A8, block);
  }
  id v3 = objc_opt_new();
  [v3 activate];
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:30];
  [(MBBackupTelemetry *)self setWifiQuality:v4];

  id v5 = [(MBBackupTelemetry *)self _serializedWiFiQualityMeasurementFromInterface:v3];
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1004823A0);
  [(MBBackupTelemetry *)self setWifiQualityMeasurementTimer:v6];

  v7 = [(MBBackupTelemetry *)self wifiQualityMeasurementTimer];
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v7, v8, 0xDF8475800uLL, 0);

  v9 = [(MBBackupTelemetry *)self wifiQualityMeasurementTimer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100092F88;
  handler[3] = &unk_1004110B0;
  handler[4] = self;
  id v10 = v3;
  id v25 = v10;
  dispatch_source_set_event_handler(v9, handler);

  dispatch_group_t v11 = dispatch_group_create();
  [(MBBackupTelemetry *)self setWifiQualityGroup:v11];

  v12 = [(MBBackupTelemetry *)self wifiQualityGroup];
  dispatch_group_enter(v12);

  v13 = [(MBBackupTelemetry *)self wifiQualityMeasurementTimer];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100093020;
  id v20 = &unk_100411358;
  v21 = self;
  id v22 = v5;
  id v23 = v10;
  id v14 = v10;
  id v15 = v5;
  dispatch_source_set_cancel_handler(v13, &v17);

  v16 = [(MBBackupTelemetry *)self wifiQualityMeasurementTimer];
  dispatch_resume(v16);
}

- (void)_stopCollectingWiFiQualityMeasurements
{
  id v3 = [(MBBackupTelemetry *)self wifiQualityMeasurementTimer];

  if (v3)
  {
    id v4 = [(MBBackupTelemetry *)self wifiQualityMeasurementTimer];
    dispatch_source_cancel(v4);

    id v5 = [(MBBackupTelemetry *)self wifiQualityGroup];
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    intptr_t v7 = dispatch_group_wait(v5, v6);

    if (v7)
    {
      dispatch_time_t v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = 10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "=cloud-backup= Timed out after %ld seconds when cancelling WiFi quality measurements", buf, 0xCu);
        uint64_t v9 = 10;
        _MBLog();
      }
    }
    -[MBBackupTelemetry setWifiQualityMeasurementTimer:](self, "setWifiQualityMeasurementTimer:", 0, v9);
  }
}

- (id)_serializedWiFiQualityMeasurementFromInterface:(id)a3
{
  id v3 = a3;
  id v4 = +[NSDateFormatter ISO8601Formatter];
  id v5 = +[NSDate now];
  dispatch_time_t v6 = [v4 stringFromDate:v5];

  intptr_t v7 = [v3 RSSI];
  int64_t v8 = v7 - (unsigned char *)[v3 noise];
  [v3 txRate];
  uint64_t v10 = v9;

  uint64_t v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    id v15 = v7;
    __int16 v16 = 2048;
    int64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "=cloud-backup= WiFi quality RSSI:%ld SNR:%ld txRate:%.3f", buf, 0x20u);
    _MBLog();
  }

  v12 = +[NSString stringWithFormat:@"%@|%ld|%ld|%.3f", v6, v7, v8, v10];

  return v12;
}

- (unint64_t)telemetryID
{
  return self->_telemetryID;
}

- (void)setTelemetryID:(unint64_t)a3
{
  self->_telemetryID = a3;
}

- (unint64_t)backupAttemptCount
{
  return self->_backupAttemptCount;
}

- (void)setBackupAttemptCount:(unint64_t)a3
{
  self->_backupAttemptCount = a3;
}

- (unint64_t)chargingType
{
  return self->_chargingType;
}

- (void)setChargingType:(unint64_t)a3
{
  self->_chargingType = a3;
}

- (NSNumber)freeDiskSpace
{
  return self->_freeDiskSpace;
}

- (void)setFreeDiskSpace:(id)a3
{
}

- (NSArray)throughputs
{
  return self->_throughputs;
}

- (void)setThroughputs:(id)a3
{
}

- (BOOL)createdNewOTAKeybag
{
  return self->_createdNewOTAKeybag;
}

- (void)setCreatedNewOTAKeybag:(BOOL)a3
{
  self->_createdNewOTAKeybag = a3;
}

- (NSNumber)remainingCellularBalance
{
  return self->_remainingCellularBalance;
}

- (void)setRemainingCellularBalance:(id)a3
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

- (NSNumber)scannedDomainsCount
{
  return self->_scannedDomainsCount;
}

- (void)setScannedDomainsCount:(id)a3
{
}

- (NSNumber)enabledDomainsCount
{
  return self->_enabledDomainsCount;
}

- (void)setEnabledDomainsCount:(id)a3
{
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
  unint64_t backupOnCellularSupport = self->_networkConnectivityAtStart.backupOnCellularSupport;
  uint64_t v3 = *(void *)&self->_networkConnectivityAtStart.isOnWiFi;
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
  unint64_t backupOnCellularSupport = self->_networkConnectivityAtFinish.backupOnCellularSupport;
  uint64_t v3 = *(void *)&self->_networkConnectivityAtFinish.isOnWiFi;
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

- (NSString)snapshotVerificationStatus
{
  return self->_snapshotVerificationStatus;
}

- (void)setSnapshotVerificationStatus:(id)a3
{
}

- (NSError)snapshotVerificationCancellationError
{
  return self->_snapshotVerificationCancellationError;
}

- (void)setSnapshotVerificationCancellationError:(id)a3
{
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

- (NSNumber)minutesRemaining
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMinutesRemaining:(id)a3
{
}

- (NSMutableArray)wifiQuality
{
  return self->_wifiQuality;
}

- (void)setWifiQuality:(id)a3
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

- (NSNumber)skippedFilesCount
{
  return self->_skippedFilesCount;
}

- (void)setSkippedFilesCount:(id)a3
{
}

- (NSNumber)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(id)a3
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

- (NSMutableDictionary)domainsWithMissingEncryptionKeys
{
  return self->_domainsWithMissingEncryptionKeys;
}

- (void)setDomainsWithMissingEncryptionKeys:(id)a3
{
}

- (OS_dispatch_source)wifiQualityMeasurementTimer
{
  return self->_wifiQualityMeasurementTimer;
}

- (void)setWifiQualityMeasurementTimer:(id)a3
{
}

- (OS_dispatch_group)wifiQualityGroup
{
  return self->_wifiQualityGroup;
}

- (void)setWifiQualityGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiQualityGroup, 0);
  objc_storeStrong((id *)&self->_wifiQualityMeasurementTimer, 0);
  objc_storeStrong((id *)&self->_domainsWithMissingEncryptionKeys, 0);
  objc_storeStrong((id *)&self->_classBFilesMissingEncryptionKeys, 0);
  objc_storeStrong((id *)&self->_classAFilesMissingEncryptionKeys, 0);
  objc_storeStrong((id *)&self->_cacheSize, 0);
  objc_storeStrong((id *)&self->_skippedFilesCount, 0);
  objc_storeStrong((id *)&self->_uploadedFileCount, 0);
  objc_storeStrong((id *)&self->_uploadedSize, 0);
  objc_storeStrong((id *)&self->_queuedFileCount, 0);
  objc_storeStrong((id *)&self->_queuedSize, 0);
  objc_storeStrong((id *)&self->_backupDirectoryCount, 0);
  objc_storeStrong((id *)&self->_backupFileCount, 0);
  objc_storeStrong((id *)&self->_backupTotalSize, 0);
  objc_storeStrong((id *)&self->_wifiQuality, 0);
  objc_storeStrong((id *)&self->_minutesRemaining, 0);
  objc_storeStrong((id *)&self->_snapshotVerificationCancellationError, 0);
  objc_storeStrong((id *)&self->_snapshotVerificationStatus, 0);
  objc_storeStrong((id *)&self->_enabledDomainsCount, 0);
  objc_storeStrong((id *)&self->_scannedDomainsCount, 0);
  objc_storeStrong((id *)&self->_remainingCellularBalance, 0);
  objc_storeStrong((id *)&self->_throughputs, 0);
  objc_storeStrong((id *)&self->_freeDiskSpace, 0);
}

@end