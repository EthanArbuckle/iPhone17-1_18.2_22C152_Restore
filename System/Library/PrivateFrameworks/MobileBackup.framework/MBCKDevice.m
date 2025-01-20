@interface MBCKDevice
+ (BOOL)performKeyBagReferenceValidationOnDeviceWithRecordID:(id)a3 tracker:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (void)fetchSnapshotsWithRefs:(id)a3 operationTracker:(id)a4 completion:(id)a5;
- (BOOL)addPendingSnapshot:(id)a3 error:(id *)a4;
- (BOOL)addUnreferencedKeybagsFromCacheWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)backupEnabled;
- (BOOL)backupsDisabledFromAnotherDevice;
- (BOOL)canRestoreSystemFiles;
- (BOOL)fetchSnapshotsWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)fetchSnapshotsWithOperationTracker:(id)a3 retry:(BOOL)a4 error:(id *)a5;
- (BOOL)hasBackupEnabledState;
- (BOOL)hasFetchedSnapshots;
- (BOOL)pinSnapshot:(id)a3 error:(id *)a4;
- (BOOL)requiresFullBackupForAccount:(id)a3;
- (BOOL)resumingSnapshot;
- (BOOL)serverRequestedFullBackup;
- (BOOL)setupKeybagWithOperationTracker:(id)a3 passcode:(id)a4 error:(id *)a5;
- (BOOL)shouldDeleteDevice;
- (BOOL)shouldRepairDomain:(id)a3;
- (BOOL)shouldRetrySaveWithRetryAfterInterval:(double)a3 recordID:(id)a4 error:(id)a5;
- (BOOL)synchronizeFileListsWithOperationTracker:(id)a3 snapshotDirectory:(id)a4 snapshotUUID:(id)a5 error:(id *)a6 fetchedFileListBlock:(id)a7;
- (BOOL)unpinSnapshot:(id)a3 error:(id *)a4;
- (BOOL)validateCache;
- (CKReference)latestGMSnapshot;
- (MBCKDevice)initWithCoder:(id)a3;
- (MBCKDevice)initWithUUID:(id)a3 cache:(id)a4 backupEnabled:(BOOL)a5;
- (MBCKKeyBagManager)keybagManager;
- (MBCKSnapshot)pendingSnapshot;
- (NSArray)snapshotCommitDates;
- (NSArray)snapshotRefs;
- (NSArray)snapshots;
- (NSData)hmacKey;
- (NSMutableSet)pinnedSnapshotRefs;
- (NSSet)domainHMACsToRepair;
- (NSSet)domainHMACsToRepairOnDisk;
- (NSSet)pendingRepairedDomainHMACs;
- (NSString)assetIDPrefix;
- (NSString)deviceBackingColor;
- (NSString)deviceClass;
- (NSString)deviceColor;
- (NSString)deviceCoverGlassColor;
- (NSString)deviceEnclosureColor;
- (NSString)deviceHousingColor;
- (NSString)deviceName;
- (NSString)deviceUUID;
- (NSString)hardwareModel;
- (NSString)marketingName;
- (NSString)pendingSnapshotBuildVersion;
- (NSString)pendingSnapshotRecordID;
- (NSString)productType;
- (NSString)serialNumber;
- (id)_fileListReferencesMatching:(id)a3;
- (id)_getRecordIDString;
- (id)dateOfLastBackup;
- (id)mergeRecordsWithOperationTracker:(id)a3 serverRecord:(id)a4 originalRecord:(id)a5;
- (id)recordRepresentation;
- (id)recordType;
- (id)synchronizeFileListsWithOperationTracker:(id)a3 snapshotDirectory:(id)a4 commitID:(id)a5 error:(id *)a6 fetchedFileListBlock:(id)a7;
- (int64_t)backupReason;
- (int64_t)pendingSnapshotBackupPolicy;
- (int64_t)pendingSnapshotFormat;
- (int64_t)pendingSnapshotType;
- (unint64_t)pendingSnapshotQuotaReserved;
- (unint64_t)recordZone;
- (void)_fetchSnapshotsWithOperationTracker:(id)a3 retry:(BOOL)a4 completion:(id)a5;
- (void)addRepairDomainHMAC:(id)a3;
- (void)addSavesWithOperationTracker:(id)a3 completion:(id)a4;
- (void)clearPendingSnapshotAndRebuildFileChanges:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchSnapshotsWithOperationTracker:(id)a3 completion:(id)a4;
- (void)fetchSnapshotsWithOperationTracker:(id)a3 retry:(BOOL)a4 completion:(id)a5;
- (void)handleSaveComplete:(id)a3 withError:(id)a4 completion:(id)a5;
- (void)pinLatestGMSnapshotIfNeeded;
- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4;
- (void)refreshWithRecord:(id)a3;
- (void)saveToCacheWithCompletion:(id)a3;
- (void)setAssetIDPrefix:(id)a3;
- (void)setBackupEnabled:(BOOL)a3;
- (void)setBackupReason:(int64_t)a3;
- (void)setDeviceName:(id)a3;
- (void)setDomainHMACsToRepairOnDisk:(id)a3;
- (void)setHmacKey:(id)a3;
- (void)setKeybagManager:(id)a3;
- (void)setLatestGMSnapshot:(id)a3;
- (void)setPendingRepairedDomainHMACs:(id)a3;
- (void)setPendingSnapshot:(id)a3;
- (void)setPendingSnapshotBackupPolicy:(int64_t)a3;
- (void)setPendingSnapshotFormat:(int64_t)a3;
- (void)setPendingSnapshotQuotaReserved:(unint64_t)a3;
- (void)setPendingSnapshotType:(int64_t)a3;
- (void)setPinnedSnapshotRefs:(id)a3;
- (void)setResumingSnapshot:(BOOL)a3;
- (void)setSnapshotCommitDates:(id)a3;
- (void)setSnapshotRefs:(id)a3;
- (void)unpinGMSnapshotAndSaveNewSnapshotIfNeeded:(id)a3;
- (void)validateCacheWithCompletion:(id)a3;
@end

@implementation MBCKDevice

- (MBCKDevice)initWithUUID:(id)a3 cache:(id)a4 backupEnabled:(BOOL)a5
{
  id v9 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MBCKDevice;
  v10 = [(MBCKModel *)&v36 initWithRecord:0 cache:a4];
  v11 = v10;
  if (v10)
  {
    deviceName = v10->_deviceName;
    v10->_deviceName = 0;

    v11->_hasCachedDeviceName = 0;
    objc_storeStrong((id *)&v11->_deviceUUID, a3);
    uint64_t v13 = MBDeviceClass();
    deviceClass = v11->_deviceClass;
    v11->_deviceClass = (NSString *)v13;

    uint64_t v15 = MBDeviceColor();
    deviceColor = v11->_deviceColor;
    v11->_deviceColor = (NSString *)v15;

    uint64_t v17 = MBDeviceEnclosureColor();
    deviceEnclosureColor = v11->_deviceEnclosureColor;
    v11->_deviceEnclosureColor = (NSString *)v17;

    uint64_t v19 = MBDeviceCoverGlassColor();
    deviceCoverGlassColor = v11->_deviceCoverGlassColor;
    v11->_deviceCoverGlassColor = (NSString *)v19;

    uint64_t v21 = MBDeviceHousingColor();
    deviceHousingColor = v11->_deviceHousingColor;
    v11->_deviceHousingColor = (NSString *)v21;

    uint64_t v23 = MBDeviceBackingColor();
    deviceBackingColor = v11->_deviceBackingColor;
    v11->_deviceBackingColor = (NSString *)v23;

    uint64_t v25 = MBHardwareModel();
    hardwareModel = v11->_hardwareModel;
    v11->_hardwareModel = (NSString *)v25;

    uint64_t v27 = MBMarketingName();
    marketingName = v11->_marketingName;
    v11->_marketingName = (NSString *)v27;

    uint64_t v29 = MBProductType();
    productType = v11->_productType;
    v11->_productType = (NSString *)v29;

    uint64_t v31 = MBSerialNumber();
    serialNumber = v11->_serialNumber;
    v11->_serialNumber = (NSString *)v31;

    v11->_hasBackupEnabledState = 1;
    v11->_backupEnabled = a5;
    v33 = [[MBCKKeyBagManager alloc] initWithDevice:v11 keybagRefs:0];
    keybagManager = v11->_keybagManager;
    v11->_keybagManager = v33;
  }
  return v11;
}

- (NSString)deviceName
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceName;
  if (!v3)
  {
    if (v2->_hasCachedDeviceName)
    {
      v3 = 0;
    }
    else
    {
      MBDeviceName();
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      deviceName = v2->_deviceName;
      v2->_deviceName = v4;

      v3 = v4;
      v2->_hasCachedDeviceName = 1;
    }
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setDeviceName:(id)a3
{
  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  deviceName = obj->_deviceName;
  obj->_deviceName = v4;

  obj->_hasCachedDeviceName = 1;
  objc_sync_exit(obj);
}

- (BOOL)backupEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_hasBackupEnabledState && v2->_backupEnabled;
  objc_sync_exit(v2);

  return v3;
}

- (void)setBackupEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (v3) {
      v6 = "YES";
    }
    else {
      v6 = "NO";
    }
    *(_DWORD *)buf = 136315394;
    id v9 = v6;
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting backupEnabled=%s into the device record %@", buf, 0x16u);
    _MBLog();
  }

  v7 = self;
  objc_sync_enter(v7);
  v7->_backupEnabled = v3;
  v7->_hasBackupEnabledState = 1;
  objc_sync_exit(v7);
}

- (BOOL)validateCache
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FFAB0;
  v5[3] = &unk_100413418;
  v7 = &v8;
  BOOL v3 = dispatch_semaphore_create(0);
  v6 = v3;
  [(MBCKDevice *)self validateCacheWithCompletion:v5];
  MBSemaphoreWaitForever();
  LOBYTE(self) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (void)validateCacheWithCompletion:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  if ([(MBCKDevice *)self hasFetchedSnapshots])
  {
    v5 = [(MBCKDevice *)self snapshots];
    v6 = [v5 valueForKey:@"snapshotID"];
    v7 = +[NSMutableSet setWithArray:v6];

    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    uint64_t v8 = [(MBCKModel *)self cache];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000FFD84;
    v13[3] = &unk_100413440;
    id v9 = v7;
    id v14 = v9;
    uint64_t v15 = &v16;
    uint64_t v10 = [v8 enumerateSnapshotIDs:v13];

    if (v10)
    {
      char v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error enumerating snapshot IDs: %@", buf, 0xCu);
        _MBLog();
      }
    }
    else
    {
      if (![v9 count])
      {
        BOOL v12 = *((unsigned char *)v17 + 24) != 0;
        goto LABEL_11;
      }
      char v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cache is out of date (snapshot list does not match)", buf, 2u);
        _MBLog();
      }
    }

    BOOL v12 = 0;
    *((unsigned char *)v17 + 24) = 0;
LABEL_11:
    v4[2](v4, v12);

    _Block_object_dispose(&v16, 8);
    goto LABEL_12;
  }
  v4[2](v4, 0);
LABEL_12:
}

- (BOOL)canRestoreSystemFiles
{
  BOOL v3 = MBDeviceClass();
  v4 = [(MBCKDevice *)self deviceClass];
  char v5 = MBSCanRestoreSystemFilesBetweenProductClasses(v3, v4);

  return v5;
}

- (BOOL)addPendingSnapshot:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  pendingSnapshot = self->_pendingSnapshot;
  if (pendingSnapshot)
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Attempted to add a snapshot without committing a pending snapshot", v13, 2u);
      _MBLog();
    }

    if (a4)
    {
      *a4 = +[MBError errorWithCode:1 format:@"Attempted to add a snapshot without committing a pending snapshot"];
    }
  }
  else
  {
    uint64_t v10 = [v6 recordIDString];
    pendingSnapshotRecordID = self->_pendingSnapshotRecordID;
    self->_pendingSnapshotRecordID = v10;

    -[MBCKDevice setBackupReason:](self, "setBackupReason:", [v7 backupReason]);
    [v7 setDevice:self];
    [(MBCKModel *)self setIsPersistedToServer:0];
  }

  return pendingSnapshot == 0;
}

- (void)clearPendingSnapshotAndRebuildFileChanges:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_pendingSnapshotRecordID)
  {
    char v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      pendingSnapshotRecordID = self->_pendingSnapshotRecordID;
      deviceUUID = self->_deviceUUID;
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = (MBCKSnapshot *)pendingSnapshotRecordID;
      __int16 v24 = 1024;
      LODWORD(v25[0]) = v3;
      WORD2(v25[0]) = 2114;
      *(void *)((char *)v25 + 6) = deviceUUID;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing the pending snapshot %{public}@ (%d) on %{public}@", buf, 0x1Cu);
      _MBLog();
    }
  }
  pendingSnapshot = self->_pendingSnapshot;
  self->_pendingSnapshot = 0;

  id v9 = self->_pendingSnapshotRecordID;
  self->_pendingSnapshotRecordID = 0;

  self->_pendingSnapshotQuotaReserved = 0;
  self->_pendingSnapshotType = 0;
  self->_pendingSnapshotBackupPolicy = 0;
  uint64_t v10 = [(MBCKModel *)self cache];
  id v11 = [v10 removeAllOrphanedItems];

  BOOL v12 = +[MBCKSnapshot snapshotForDevice:self reason:0 type:0 snapshotFormat:0];
  uint64_t v13 = [v12 recordIDString];
  id v14 = self->_pendingSnapshotRecordID;
  self->_pendingSnapshotRecordID = v13;

  uint64_t v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = self->_pendingSnapshot;
    uint64_t v17 = self->_deviceUUID;
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = v16;
    __int16 v24 = 2112;
    v25[0] = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created a new pending snapshot %@ for %@", buf, 0x16u);
    _MBLog();
  }

  [(MBCKDevice *)self setBackupReason:0];
  if (v3)
  {
    uint64_t v18 = [(MBCKModel *)self cache];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10010033C;
    v21[3] = &unk_100411908;
    v21[4] = self;
    char v19 = [v18 performInTransaction:v21];

    if (v19)
    {
      v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to rebuild FileChanges table: %@", buf, 0xCu);
        _MBLog();
      }
    }
  }
}

- (id)dateOfLastBackup
{
  BOOL v3 = [(NSArray *)self->_snapshotRefs count];
  if (v3)
  {
    BOOL v3 = [(NSArray *)self->_snapshotCommitDates lastObject];
  }
  return v3;
}

- (BOOL)backupsDisabledFromAnotherDevice
{
  BOOL v3 = [(MBCKDevice *)self snapshotRefs];
  id v4 = [v3 count];

  if (v4) {
    return 0;
  }
  id v6 = [(MBCKModel *)self cache];
  v7 = [(MBCKDevice *)self deviceUUID];
  uint64_t v8 = [v6 fetchMostRecentSnapshotForDevice:v7 error:0];

  return v8 != 0;
}

- (BOOL)shouldDeleteDevice
{
  BOOL v3 = [(MBCKDevice *)self snapshotRefs];
  if ([v3 count])
  {
    unsigned __int8 v4 = [(MBCKDevice *)self hasFetchedSnapshots];

    if ((v4 & 1) == 0) {
      return 0;
    }
  }
  else
  {
  }
  char v5 = [(MBCKDevice *)self snapshotRefs];
  id v6 = [v5 count];
  v7 = [(MBCKDevice *)self snapshotCommitDates];
  id v8 = [v7 count];

  if (v6 == v8) {
    return 0;
  }
  uint64_t v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Mismatched valance: snapshots, snapshotCommitDates.  Forcing full backup", v11, 2u);
    _MBLog();
  }

  return 1;
}

- (BOOL)requiresFullBackupForAccount:(id)a3
{
  char v13 = 0;
  unsigned __int8 v4 = [a3 persona];
  unsigned int v5 = [v4 getBooleanValueForKey:@"ForceFullBackup" keyExists:&v13];

  if (v13) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    self->_requiresFullBackup |= 1uLL;
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Performing full backup because of user preference override", buf, 2u);
      _MBLog();
    }
LABEL_11:

    LOBYTE(v7) = 1;
    return v7;
  }
  BOOL v7 = [(MBCKDevice *)self serverRequestedFullBackup];
  if (v7)
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v8 = +[NSNumber numberWithInteger:self->_requiresFullBackup];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Performing full backup because server requested it: %@", buf, 0xCu);

      BOOL v12 = +[NSNumber numberWithInteger:self->_requiresFullBackup];
      _MBLog();
    }
    goto LABEL_11;
  }
  return v7;
}

- (BOOL)shouldRepairDomain:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self->_domainHMACsToRepair;
  if ([(NSSet *)v5 count])
  {
    BOOL v6 = [(MBCKDevice *)self hmacKey];
    BOOL v7 = +[MBDomainRecord domainHmacForDomainName:v4 hmacKey:v6];

    unsigned __int8 v8 = [(NSSet *)v5 containsObject:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)addRepairDomainHMAC:(id)a3
{
  domainHMACsToRepair = self->_domainHMACsToRepair;
  id v5 = a3;
  id v6 = [(NSSet *)domainHMACsToRepair mutableCopy];
  BOOL v7 = v6;
  if (v6)
  {
    unsigned __int8 v8 = (NSSet *)v6;
  }
  else
  {
    unsigned __int8 v8 = +[NSMutableSet set];
  }
  id v9 = v8;

  [(NSSet *)v9 addObject:v5];
  uint64_t v10 = self->_domainHMACsToRepair;
  self->_domainHMACsToRepair = v9;
}

- (BOOL)serverRequestedFullBackup
{
  return self->_requiresFullBackup & 1;
}

+ (void)fetchSnapshotsWithRefs:(id)a3 operationTracker:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [a1 fetchFromServerWithOperationTracker:v9 childrenOfClass:objc_opt_class() refs:v10 cache:0 completion:v8];
}

- (void)_fetchSnapshotsWithOperationTracker:(id)a3 retry:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKDevice _fetchSnapshotsWithOperationTracker:retry:completion:]", "MBCKDevice.m", 337, "tracker");
  }
  id v10 = v9;
  uint64_t v11 = objc_opt_class();
  BOOL v12 = [(MBCKDevice *)self snapshotRefs];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100100C98;
  v15[3] = &unk_100413490;
  BOOL v19 = a4;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v10;
  id v13 = v10;
  id v14 = v8;
  [(MBCKModel *)self fetchFromServerWithOperationTracker:v14 childrenOfClass:v11 refs:v12 completion:v15];
}

- (void)fetchSnapshotsWithOperationTracker:(id)a3 retry:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (qword_100482470 != -1) {
    dispatch_once(&qword_100482470, &stru_1004134B0);
  }
  id v10 = qword_100482468;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10010125C;
  v13[3] = &unk_100413500;
  id v14 = v8;
  id v15 = v9;
  void v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)fetchSnapshotsWithOperationTracker:(id)a3 completion:(id)a4
{
}

- (BOOL)fetchSnapshotsWithOperationTracker:(id)a3 retry:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100101554;
  BOOL v19 = sub_100101564;
  id v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10010156C;
  v12[3] = &unk_100410FC8;
  id v14 = &v15;
  id v9 = dispatch_semaphore_create(0);
  id v13 = v9;
  [(MBCKDevice *)self fetchSnapshotsWithOperationTracker:v8 retry:v6 completion:v12];
  MBSemaphoreWaitForever();
  if (a5) {
    *a5 = (id) v16[5];
  }
  BOOL v10 = v16[5] == 0;

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)fetchSnapshotsWithOperationTracker:(id)a3 error:(id *)a4
{
  return [(MBCKDevice *)self fetchSnapshotsWithOperationTracker:a3 retry:0 error:a4];
}

- (BOOL)setupKeybagWithOperationTracker:(id)a3 passcode:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [(MBCKDevice *)self keybagManager];
  LOBYTE(a5) = [v10 setupKeybagWithOperationTracker:v9 passcode:v8 error:a5];

  return (char)a5;
}

- (BOOL)addUnreferencedKeybagsFromCacheWithOperationTracker:(id)a3 error:(id *)a4
{
  id v36 = a3;
  if (!v36) {
    __assert_rtn("-[MBCKDevice addUnreferencedKeybagsFromCacheWithOperationTracker:error:]", "MBCKDevice.m", 418, "tracker");
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  BOOL v7 = [(MBCKModel *)self cache];

  if (v7)
  {
    id v8 = [(MBCKModel *)self cache];
    id v54 = 0;
    uint64_t v34 = [v8 propertyForKey:@"KeybagsRebuilt" error:&v54];
    id v9 = v54;

    if (v9)
    {
      if (a4)
      {
        id v9 = v9;
        BOOL v10 = 0;
        *a4 = v9;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      id v12 = (void *)v34;
      if (v34)
      {
        id v9 = 0;
        BOOL v10 = 1;
LABEL_32:

        goto LABEL_33;
      }
      id v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Adding all unreferenced keybags to Device record", buf, 2u);
        _MBLog();
      }

      *(void *)buf = 0;
      v49 = buf;
      uint64_t v50 = 0x3032000000;
      v51 = sub_100101554;
      v52 = sub_100101564;
      id v14 = self;
      v53 = v14;
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x3032000000;
      v45 = sub_100101554;
      v46 = sub_100101564;
      id v47 = +[NSMutableSet set];
      v33 = v14;
      uint64_t v15 = [(MBCKModel *)v14 cache];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100101C54;
      v41[3] = &unk_100413528;
      v41[4] = buf;
      v41[5] = &v42;
      id v16 = [v15 enumerateKeybagUUIDsForAllFiles:v41];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v17 = (id)v43[5];
      id v18 = [v17 countByEnumeratingWithState:&v37 objects:v57 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v38;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            id v22 = objc_alloc((Class)CKRecordID);
            uint64_t v23 = +[MBCKKeyBag recordIDStringWithUUIDString:v21];
            __int16 v24 = [v36 syncZoneID];
            id v25 = [v22 initWithRecordName:v23 zoneID:v24];

            id v26 = [objc_alloc((Class)CKReference) initWithRecordID:v25 action:0];
            [0 addObject:v26];
          }
          id v18 = [v17 countByEnumeratingWithState:&v37 objects:v57 count:16];
        }
        while (v18);
      }

      uint64_t v27 = [(MBCKDevice *)v33 keybagManager];
      [v27 mergeKeybagRefs:0];

      if ([(MBCKModel *)v33 saveWithOperationTracker:v36 error:a4])
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v29 = v28;
        v30 = MBGetDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v55 = 67109120;
          int v56 = (int)(v29 - v6);
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Unreferenced keybag repair finished in %d", v55, 8u);
          _MBLog();
        }

        uint64_t v31 = [(MBCKModel *)v33 cache];
        id v9 = [v31 setProperty:@"YES" forKey:@"KeybagsRebuilt"];

        BOOL v10 = v9 == 0;
        if (a4 && v9)
        {
          id v9 = v9;
          BOOL v10 = 0;
          *a4 = v9;
        }
      }
      else
      {
        id v9 = 0;
        BOOL v10 = 0;
      }
      _Block_object_dispose(&v42, 8);

      _Block_object_dispose(buf, 8);
    }
    id v12 = (void *)v34;
    goto LABEL_32;
  }
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "No cache when repairing keybag references", buf, 2u);
    _MBLog();
  }

  if (a4)
  {
    +[MBError errorWithCode:1 format:@"No cache when repairing keybag references"];
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_33:

  return v10;
}

- (BOOL)pinSnapshot:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)CKReference);
  id v8 = [v6 recordID];

  id v9 = [v7 initWithRecordID:v8 action:0];
  BOOL v10 = [(MBCKDevice *)self pinnedSnapshotRefs];
  unsigned int v11 = [v10 containsObject:v9];

  if (v11)
  {
    if (a4)
    {
      *a4 = +[MBError errorWithCode:3 format:@"Snapshot is already pinned"];
    }
  }
  else
  {
    id v12 = [(MBCKDevice *)self pinnedSnapshotRefs];
    [v12 addObject:v9];

    [(MBCKModel *)self setIsPersistedToServer:0];
  }

  return v11 ^ 1;
}

- (BOOL)unpinSnapshot:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)CKReference);
  id v8 = [v6 recordID];

  id v9 = [v7 initWithRecordID:v8 action:0];
  BOOL v10 = [(MBCKDevice *)self pinnedSnapshotRefs];
  unsigned __int8 v11 = [v10 containsObject:v9];

  if (v11)
  {
    id v12 = [(MBCKDevice *)self pinnedSnapshotRefs];
    [v12 removeObject:v9];

    [(MBCKModel *)self setIsPersistedToServer:0];
  }
  else if (a4)
  {
    *a4 = +[MBError errorWithCode:4 format:@"Snapshot is not pinned"];
  }

  return v11;
}

- (void)pinLatestGMSnapshotIfNeeded
{
  if (MBBuildIsSeed())
  {
    BOOL v3 = [(MBCKDevice *)self latestGMSnapshot];
    if (v3)
    {
      id v4 = [(MBCKDevice *)self pinnedSnapshotRefs];
      [v4 addObject:v3];

      [(MBCKModel *)self setIsPersistedToServer:0];
      double v5 = MBGetDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v7 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinned snapshot: %@", buf, 0xCu);
        _MBLog();
      }
    }
  }
}

- (void)unpinGMSnapshotAndSaveNewSnapshotIfNeeded:(id)a3
{
  id v4 = a3;
  if ((MBBuildIsSeed() & 1) == 0)
  {
    double v5 = [(MBCKDevice *)self latestGMSnapshot];
    if (v5)
    {
      id v6 = [(MBCKDevice *)self pinnedSnapshotRefs];
      [v6 removeObject:v5];

      id v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unpinned snapshot: %@", buf, 0xCu);
        _MBLog();
      }
    }
    id v8 = objc_alloc((Class)CKReference);
    id v9 = [v4 recordID];
    id v10 = [v8 initWithRecordID:v9 action:0];
    [(MBCKDevice *)self setLatestGMSnapshot:v10];

    [(MBCKModel *)self setIsPersistedToServer:0];
  }
}

- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = self->_pendingSnapshot;
  id v8 = v7;
  if (v7 && ![(MBCKModel *)v7 isPersistedToServer]) {
    [(MBCKSnapshot *)v8 prepareForSaveWithOperationTracker:v9 completion:v6];
  }
  else {
    v6[2](v6, 0);
  }
}

- (void)saveToCacheWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  double v5 = [(MBCKModel *)self cache];
  id v7 = 0;
  [v5 saveDevice:self error:&v7];
  id v6 = v7;

  v4[2](v4, v6);
}

- (void)addSavesWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKDevice addSavesWithOperationTracker:completion:]", "MBCKDevice.m", 540, "tracker");
  }
  id v8 = v7;
  id v9 = [v6 startBatchSave];
  [v9 setSaveIncrementally:0];
  id v10 = objc_opt_new();
  unsigned __int8 v11 = self->_pendingSnapshot;
  id v12 = v11;
  if (v11 && ![(MBCKModel *)v11 isPersistedToServer])
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(MBCKModel *)v12 recordID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding pending snapshot record %{public}@ to %{public}@", buf, 0x16u);

      uint64_t v21 = [(MBCKModel *)v12 recordID];
      id v22 = v9;
      _MBLog();
    }
    uint64_t v15 = [(MBCKSnapshot *)v12 recordRepresentation];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10010263C;
    v31[3] = &unk_100413550;
    v32 = v12;
    id v33 = v15;
    id v34 = v10;
    id v16 = v15;
    [v9 saveRecord:v16 delegate:self completion:v31];
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v36 = sub_100101554;
  long long v37 = sub_100101564;
  id v38 = [(MBCKDevice *)self recordRepresentation];
  uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001028D8;
  v28[3] = &unk_100412780;
  v30 = buf;
  id v18 = v10;
  id v29 = v18;
  [v9 saveRecord:v17 delegate:self completion:v28];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100102AF4;
  v23[3] = &unk_100413578;
  id v19 = v18;
  id v24 = v19;
  id v25 = self;
  uint64_t v27 = buf;
  id v20 = v8;
  id v26 = v20;
  [v6 finishBatchSave:v9 completion:v23];

  _Block_object_dispose(buf, 8);
}

- (id)recordRepresentation
{
  v76.receiver = self;
  v76.super_class = (Class)MBCKDevice;
  BOOL v3 = [(MBCKModel *)&v76 recordRepresentation];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(MBCKDevice *)self snapshotRefs];
  [v4 addObjectsFromArray:v6];

  id v7 = [(MBCKDevice *)self snapshotCommitDates];
  [v5 addObjectsFromArray:v7];

  id v8 = self->_pendingSnapshot;
  if (v8)
  {
    id v9 = objc_alloc((Class)CKReference);
    id v10 = [(MBCKModel *)v8 recordID];
    id v11 = [v9 initWithRecordID:v10 action:0];

    if ([v4 containsObject:v11])
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        pendingSnapshotRecordID = self->_pendingSnapshotRecordID;
        *(_DWORD *)buf = 138412290;
        *(void *)v78 = pendingSnapshotRecordID;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Detecting duplicate snapshot: %@, marking as committed", buf, 0xCu);
        unint64_t v72 = (unint64_t)self->_pendingSnapshotRecordID;
        _MBLog();
      }

      id v14 = [(MBCKModel *)self cache];
      id v15 = [v14 addPendingSnapshot:v8];

      id v16 = [(MBCKModel *)self cache];
      id v17 = [v16 commitSnapshot:v8];
    }
    else
    {
      [v4 addObject:v11];
      id v22 = +[NSDate date];
      [(MBCKSnapshot *)v8 setCreated:v22];

      id v16 = [(MBCKSnapshot *)v8 created];
      [v5 addObject:v16];
    }

    [v3 setObject:0 forKeyedSubscript:@"domainHMACsToRepair"];
    [v3 setObject:v4 forKeyedSubscript:@"snapshots"];
    [v3 setObject:v5 forKeyedSubscript:@"snapshotCommittedDates"];
    goto LABEL_11;
  }
  [v3 setObject:v4 forKeyedSubscript:@"snapshots"];
  [v3 setObject:v5 forKeyedSubscript:@"snapshotCommittedDates"];
  id v18 = self->_pendingSnapshotRecordID;
  if (!v18)
  {
LABEL_11:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, @"pendingSnapshotID", v72);
    [v3 setObject:0 forKeyedSubscript:@"pendingSnapshotQuotaReserved"];
    [v3 setObject:0 forKeyedSubscript:@"pendingSnapshotBackupType"];
    [v3 setObject:0 forKeyedSubscript:@"pendingSnapshotBackupPolicy"];
    [v3 setObject:0 forKeyedSubscript:@"pendingSnapshotBuildVersion"];
    [v3 setObject:0 forKeyedSubscript:@"pendingSnapshotFormat"];
    if (MBIsInternalInstall())
    {
      uint64_t v23 = [(MBCKModel *)self cache];
      id v75 = 0;
      id v24 = (NSString *)[v23 sizeOfSnapshot:v8 error:&v75];
      id v25 = v75;

      if (!v24 && v25)
      {
        id v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v78 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to fetch the size of the snapshot from cache: %@", buf, 0xCu);
          unint64_t v72 = (unint64_t)v25;
          _MBLog();
        }
      }
      uint64_t v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v28 = [(MBCKDevice *)self pendingSnapshotQuotaReserved];
        *(_DWORD *)buf = 134218240;
        *(void *)v78 = v24;
        *(_WORD *)&v78[8] = 2048;
        *(void *)&v78[10] = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Snapshot sealed, size:%llu, pendingSnapshotQuotaReserved:%llu", buf, 0x16u);
        unint64_t v72 = (unint64_t)v24;
        unint64_t v73 = [(MBCKDevice *)self pendingSnapshotQuotaReserved];
        _MBLog();
      }
    }
    else
    {
      id v25 = MBGetDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v29 = [(MBCKDevice *)self pendingSnapshotQuotaReserved];
        *(_DWORD *)buf = 134217984;
        *(void *)v78 = v29;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Snapshot sealed, pendingSnapshotQuotaReserved:%llu", buf, 0xCu);
        unint64_t v72 = [(MBCKDevice *)self pendingSnapshotQuotaReserved];
        _MBLog();
      }
    }
    goto LABEL_26;
  }
  [v3 setObject:v18 forKeyedSubscript:@"pendingSnapshotID"];
  id v19 = +[NSNumber numberWithUnsignedLongLong:[(MBCKDevice *)self pendingSnapshotQuotaReserved]];
  [v3 setObject:v19 forKeyedSubscript:@"pendingSnapshotQuotaReserved"];

  id v20 = +[NSNumber numberWithInteger:[(MBCKDevice *)self pendingSnapshotType]];
  [v3 setObject:v20 forKeyedSubscript:@"pendingSnapshotBackupType"];

  if ([(MBCKDevice *)self pendingSnapshotBackupPolicy])
  {
    uint64_t v21 = +[NSNumber numberWithInteger:[(MBCKDevice *)self pendingSnapshotBackupPolicy]];
    [v3 setObject:v21 forKeyedSubscript:@"pendingSnapshotBackupPolicy"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"pendingSnapshotBackupPolicy"];
  }
  v30 = MBBuildVersion();
  [v3 setObject:v30 forKeyedSubscript:@"pendingSnapshotBuildVersion"];

  [(MBCKDevice *)self pendingSnapshotFormat];
  if (MBSnapshotFormatContainsFileLists())
  {
    uint64_t v31 = +[NSNumber numberWithLongLong:[(MBCKDevice *)self pendingSnapshotFormat]];
    [v3 setObject:v31 forKeyedSubscript:@"pendingSnapshotFormat"];

    if ([(NSSet *)self->_pendingRepairedDomainHMACs count])
    {
      id v25 = [(NSSet *)self->_pendingRepairedDomainHMACs allObjects];
      [v3 setObject:v25 forKeyedSubscript:@"pendingRepairedDomainHMACs"];
LABEL_26:

      goto LABEL_27;
    }
    [v3 setObject:0 forKeyedSubscript:@"pendingRepairedDomainHMACs"];
  }
LABEL_27:
  v32 = MBGetDefaultLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v33 = [(MBCKDevice *)self resumingSnapshot];
    [v3 objectForKeyedSubscript:@"pendingSnapshotID"];
    id v34 = v8;
    id v35 = v4;
    v37 = id v36 = v5;
    id v38 = [v3 objectForKeyedSubscript:@"pendingSnapshotQuotaReserved"];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v78 = v33;
    *(_WORD *)&v78[4] = 2114;
    *(void *)&v78[6] = v37;
    *(_WORD *)&v78[14] = 2114;
    *(void *)&v78[16] = v38;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "resumingSnapshot:%d, pendingSnapshotID:%{public}@, pendingSnapshotQuotaReserved:%{public}@", buf, 0x1Cu);

    id v5 = v36;
    id v4 = v35;
    id v8 = v34;
    LODWORD(v38) = [(MBCKDevice *)self resumingSnapshot];
    long long v39 = [v3 objectForKeyedSubscript:@"pendingSnapshotID"];
    [v3 objectForKeyedSubscript:@"pendingSnapshotQuotaReserved"];
    v74 = unint64_t v73 = (unint64_t)v39;
    unint64_t v72 = v38;
    _MBLog();
  }
  long long v40 = [(MBCKDevice *)self pinnedSnapshotRefs];
  v41 = [v40 allObjects];
  [v3 setObject:v41 forKeyedSubscript:@"pinnedSnapshots"];

  uint64_t v42 = [(MBCKDevice *)self latestGMSnapshot];
  [v3 setObject:v42 forKeyedSubscript:@"lastGMSnapshot"];

  v43 = [(MBCKDevice *)self keybagManager];
  uint64_t v44 = [v43 keybagRefs];
  [v3 setObject:v44 forKeyedSubscript:@"keybags"];

  v45 = [(MBCKDevice *)self deviceClass];
  [v3 setObject:v45 forKeyedSubscript:@"deviceClass"];

  v46 = [(MBCKDevice *)self deviceColor];
  [v3 setObject:v46 forKeyedSubscript:@"deviceColor"];

  id v47 = [(MBCKDevice *)self deviceEnclosureColor];
  [v3 setObject:v47 forKeyedSubscript:@"deviceEnclosureColor"];

  v48 = [(MBCKDevice *)self deviceCoverGlassColor];
  [v3 setObject:v48 forKeyedSubscript:@"deviceCoverGlassColor"];

  v49 = [(MBCKDevice *)self deviceHousingColor];
  [v3 setObject:v49 forKeyedSubscript:@"deviceHousingColor"];

  uint64_t v50 = [(MBCKDevice *)self deviceBackingColor];
  [v3 setObject:v50 forKeyedSubscript:@"deviceBackingColor"];

  v51 = [(MBCKDevice *)self hardwareModel];
  [v3 setObject:v51 forKeyedSubscript:@"hardwareModel"];

  v52 = [(MBCKDevice *)self productType];
  [v3 setObject:v52 forKeyedSubscript:@"productType"];

  v53 = [(MBCKDevice *)self assetIDPrefix];
  [v3 setObject:v53 forKeyedSubscript:@"deviceIdPrefix"];

  deviceUUID = self->_deviceUUID;
  v55 = MBDeviceUUID();
  LODWORD(deviceUUID) = [(NSString *)deviceUUID isEqualToString:v55];

  if (deviceUUID)
  {
    int v56 = MBMarketingName();
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"marketingName"];
    }
    else
    {
      v59 = [(MBCKDevice *)self marketingName];
      [v3 setObject:v59 forKeyedSubscript:@"marketingName"];
    }
    uint64_t v58 = MBSerialNumber();
  }
  else
  {
    v57 = [(MBCKDevice *)self marketingName];
    [v3 setObject:v57 forKeyedSubscript:@"marketingName"];

    uint64_t v58 = [(MBCKDevice *)self serialNumber];
  }
  v60 = (void *)v58;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, @"serialNumber", v72, v73, v74);

  v61 = self;
  objc_sync_enter(v61);
  LODWORD(v60) = v61->_hasBackupEnabledState;
  BOOL backupEnabled = v61->_backupEnabled;
  objc_sync_exit(v61);

  if (v60)
  {
    v63 = +[NSNumber numberWithBool:backupEnabled];
    [v3 setObject:v63 forKeyedSubscript:@"backupEnabled"];
  }
  v64 = [(MBCKDevice *)v61 deviceName];
  [v3 setObject:v64 forKeyedSubscript:@"deviceName"];

  v65 = objc_opt_new();
  if (![(MBCKModel *)v61 isPersistedToServer])
  {
    v66 = MBDeviceUDID_Legacy();
    [v65 setObject:v66 forKeyedSubscript:@"deviceUDID"];
  }
  if (v61->_pendingSnapshotRecordID && ![(MBCKDevice *)v61 resumingSnapshot])
  {
    v67 = +[NSNumber numberWithInteger:[(MBCKDevice *)v61 backupReason]];
    [v65 setObject:v67 forKeyedSubscript:@"backupReason"];
  }
  if ([v65 count]) {
    [v3 setPluginFields:v65];
  }
  v68 = MBGetDefaultLog();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    uint64_t v69 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(void *)v78 = v69;
    *(_WORD *)&v78[8] = 2112;
    *(void *)&v78[10] = v3;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "%{public}@ record representation: %@", buf, 0x16u);
    objc_opt_class();
    _MBLog();
  }

  id v70 = v3;
  return v70;
}

- (void)refreshWithRecord:(id)a3
{
  id v83 = a3;
  BOOL v3 = [v83 recordID];
  id v4 = [v3 recordName];
  unsigned int v5 = [v4 hasPrefix:@"D:"];

  id v6 = [v83 recordID];
  id v7 = [v6 recordName];
  id v8 = v7;
  if (v5)
  {
    -[NSString substringFromIndex:](v7, "substringFromIndex:", [@"D:" length]);
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceUUID = self->_deviceUUID;
    self->_deviceUUID = v9;
  }
  else
  {
    id v11 = self->_deviceUUID;
    self->_deviceUUID = v7;
    id v8 = v11;
  }

  id v12 = [v83 objectForKeyedSubscript:@"deviceClass"];
  deviceClass = self->_deviceClass;
  self->_deviceClass = v12;

  id v14 = [v83 objectForKeyedSubscript:@"deviceColor"];
  deviceColor = self->_deviceColor;
  self->_deviceColor = v14;

  id v16 = [v83 objectForKeyedSubscript:@"deviceEnclosureColor"];
  deviceEnclosureColor = self->_deviceEnclosureColor;
  self->_deviceEnclosureColor = v16;

  id v18 = [v83 objectForKeyedSubscript:@"deviceCoverGlassColor"];
  deviceCoverGlassColor = self->_deviceCoverGlassColor;
  self->_deviceCoverGlassColor = v18;

  id v20 = [v83 objectForKeyedSubscript:@"deviceHousingColor"];
  deviceHousingColor = self->_deviceHousingColor;
  self->_deviceHousingColor = v20;

  id v22 = [v83 objectForKeyedSubscript:@"deviceBackingColor"];
  deviceBackingColor = self->_deviceBackingColor;
  self->_deviceBackingColor = v22;

  id v24 = [v83 objectForKeyedSubscript:@"hardwareModel"];
  hardwareModel = self->_hardwareModel;
  self->_hardwareModel = v24;

  id v26 = [v83 objectForKeyedSubscript:@"marketingName"];
  marketingName = self->_marketingName;
  self->_marketingName = v26;

  unint64_t v28 = [v83 objectForKeyedSubscript:@"productType"];
  productType = self->_productType;
  self->_productType = v28;

  v30 = [v83 objectForKeyedSubscript:@"serialNumber"];
  serialNumber = self->_serialNumber;
  self->_serialNumber = v30;

  v32 = [v83 objectForKeyedSubscript:@"deviceIdPrefix"];
  assetIDPrefix = self->_assetIDPrefix;
  self->_assetIDPrefix = v32;

  v81 = [v83 objectForKeyedSubscript:@"domainHMACsToRepair"];
  if (v81)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = [v81 sortedArrayUsingSelector:"compare:"];
        id v36 = [v35 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412290;
        v91 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "=domain repair= Found domainHMACsToRepair on device record: %@", buf, 0xCu);

        long long v37 = [v81 sortedArrayUsingSelector:"compare:"];
        v80 = [v37 componentsJoinedByString:@", "];
        _MBLog();
      }
      id v38 = (NSSet *)objc_opt_new();
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v39 = v81;
      id v40 = [v39 countByEnumeratingWithState:&v85 objects:v89 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v86;
        do
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v86 != v41) {
              objc_enumerationMutation(v39);
            }
            v43 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(NSSet *)v38 addObject:v43];
            }
            else
            {
              uint64_t v44 = MBGetDefaultLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v91 = v43;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Could not parse domain hmac to repair: %@", buf, 0xCu);
                v80 = v43;
                _MBLog();
              }
            }
          }
          id v40 = [v39 countByEnumeratingWithState:&v85 objects:v89 count:16];
        }
        while (v40);
      }

      domainHMACsToRepair = self->_domainHMACsToRepair;
      self->_domainHMACsToRepair = v38;
    }
  }
  MBDeviceCoverGlassColor();
  v46 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v47 = self->_deviceCoverGlassColor;
  self->_deviceCoverGlassColor = v46;

  MBDeviceHousingColor();
  v48 = (NSString *)objc_claimAutoreleasedReturnValue();
  v49 = self->_deviceHousingColor;
  self->_deviceHousingColor = v48;

  MBDeviceBackingColor();
  uint64_t v50 = (NSString *)objc_claimAutoreleasedReturnValue();
  v51 = self->_deviceBackingColor;
  self->_deviceBackingColor = v50;

  v52 = [v83 objectForKeyedSubscript:@"pendingSnapshotID"];
  pendingSnapshotRecordID = self->_pendingSnapshotRecordID;
  self->_pendingSnapshotRecordID = v52;

  id v54 = [v83 objectForKeyedSubscript:@"pendingSnapshotQuotaReserved"];
  self->_pendingSnapshotQuotaReserved = (unint64_t)[v54 longLongValue];

  v55 = [v83 objectForKeyedSubscript:@"pendingSnapshotBackupType"];
  self->_pendingSnapshotType = (int64_t)[v55 integerValue];

  int v56 = [v83 objectForKeyedSubscript:@"pendingSnapshotBackupPolicy"];
  self->_pendingSnapshotBackupPolicy = (int64_t)[v56 integerValue];

  v57 = [v83 objectForKeyedSubscript:@"pendingSnapshotFormat"];
  self->_pendingSnapshotFormat = (int64_t)[v57 integerValue];

  uint64_t v58 = [v83 objectForKeyedSubscript:@"pendingSnapshotBuildVersion"];
  pendingSnapshotBuildVersion = self->_pendingSnapshotBuildVersion;
  self->_pendingSnapshotBuildVersion = v58;

  v60 = [v83 objectForKeyedSubscript:@"snapshots"];
  snapshotRefs = self->_snapshotRefs;
  self->_snapshotRefs = v60;

  v62 = [v83 objectForKeyedSubscript:@"snapshotCommittedDates"];
  snapshotCommitDates = self->_snapshotCommitDates;
  self->_snapshotCommitDates = v62;

  uint64_t v64 = [v83 objectForKeyedSubscript:@"pinnedSnapshots"];
  v65 = (void *)v64;
  if (v64) {
    v66 = (void *)v64;
  }
  else {
    v66 = &__NSArray0__struct;
  }
  +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v66, v80);
  v67 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  pinnedSnapshotRefs = self->_pinnedSnapshotRefs;
  self->_pinnedSnapshotRefs = v67;

  uint64_t v69 = [v83 objectForKeyedSubscript:@"lastGMSnapshot"];
  latestGMSnapshot = self->_latestGMSnapshot;
  self->_latestGMSnapshot = v69;

  v71 = [v83 objectForKeyedSubscript:@"requiresFullBackup"];

  if (v71)
  {
    unint64_t v72 = [v83 objectForKeyedSubscript:@"requiresFullBackup"];
    self->_requiresFullBackup = (int64_t)[v72 integerValue];
  }
  unint64_t v73 = [v83 objectForKeyedSubscript:@"backupEnabled"];
  v74 = self;
  objc_sync_enter(v74);
  if (v73)
  {
    v74->_BOOL backupEnabled = [v73 BOOLValue];
    char v75 = 1;
  }
  else
  {
    char v75 = 0;
    v74->_BOOL backupEnabled = 0;
  }
  v74->_hasBackupEnabledState = v75;
  objc_sync_exit(v74);

  v74->_hasFetchedSnapshots = 0;
  objc_super v76 = [v83 objectForKeyedSubscript:@"keybags"];
  keybagManager = v74->_keybagManager;
  if (keybagManager)
  {
    [(MBCKKeyBagManager *)keybagManager mergeKeybagRefs:v76];
  }
  else
  {
    v78 = [[MBCKKeyBagManager alloc] initWithDevice:v74 keybagRefs:v76];
    v79 = v74->_keybagManager;
    v74->_keybagManager = v78;
  }
  v84.receiver = v74;
  v84.super_class = (Class)MBCKDevice;
  [(MBCKModel *)&v84 refreshWithRecord:v83];
}

- (void)handleSaveComplete:(id)a3 withError:(id)a4 completion:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MBCKDevice;
  [(MBCKModel *)&v5 handleSaveComplete:a3 withError:a4 completion:a5];
}

- (id)mergeRecordsWithOperationTracker:(id)a3 serverRecord:(id)a4 originalRecord:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 recordType];
  id v10 = [(MBCKDevice *)self recordType];
  unsigned int v11 = [v9 isEqualToString:v10];

  if (!v11)
  {
    id v16 = 0;
    goto LABEL_18;
  }
  id v12 = self->_pendingSnapshot;
  id v13 = v12;
  if (v12 && [(MBCKModel *)v12 isPersistedToServer])
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(MBCKSnapshot *)v13 snapshotID];
      *(_DWORD *)buf = 138543362;
      id v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not merging with the server record since there's a pending snapshot: %{public}@", buf, 0xCu);

      unint64_t v29 = [(MBCKSnapshot *)v13 snapshotID];
      _MBLog();
    }
    id v16 = v7;
    goto LABEL_17;
  }
  id v17 = self->_domainHMACsToRepair;
  if (v17)
  {
    p_super = MBGetDefaultLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v31 = [(NSSet *)v17 count];
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Not handling merge conflict with server record because the local device record has %lu domain hmacs to repair", buf, 0xCu);
      [(NSSet *)v17 count];
      _MBLog();
    }
  }
  else
  {
    [(MBCKDevice *)self refreshWithRecord:v7];
    id v19 = self->_domainHMACsToRepair;
    if (!v19)
    {
      id v22 = [v8 objectForKeyedSubscript:@"pendingSnapshotID"];
      pendingSnapshotRecordID = self->_pendingSnapshotRecordID;
      self->_pendingSnapshotRecordID = v22;

      id v24 = [v8 objectForKeyedSubscript:@"pendingSnapshotQuotaReserved"];
      self->_pendingSnapshotQuotaReserved = (unint64_t)[v24 longLongValue];

      id v25 = [v8 objectForKeyedSubscript:@"pendingSnapshotBackupType"];
      self->_pendingSnapshotType = (int64_t)[v25 integerValue];

      id v26 = [v8 objectForKeyedSubscript:@"pendingSnapshotBackupPolicy"];
      self->_pendingSnapshotBackupPolicy = (int64_t)[v26 integerValue];

      uint64_t v27 = [v8 objectForKeyedSubscript:@"deviceIdPrefix"];
      assetIDPrefix = self->_assetIDPrefix;
      self->_assetIDPrefix = v27;

      id v16 = [(MBCKDevice *)self recordRepresentation];
      p_super = 0;
      goto LABEL_16;
    }
    p_super = &v19->super;
    id v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v31 = [p_super count];
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not handling merge conflict with server record because the refreshed device record has %lu domain hmacs to repair", buf, 0xCu);
      [p_super count];
      _MBLog();
    }
  }
  id v16 = 0;
LABEL_16:

LABEL_17:
LABEL_18:

  return v16;
}

- (id)_getRecordIDString
{
  id v4 = [(MBCKDevice *)self deviceUUID];

  if (!v4)
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MBCKDevice.m" lineNumber:817 description:@"Device is missing UUID"];
  }
  id v5 = objc_alloc((Class)NSString);
  id v6 = [(MBCKDevice *)self deviceUUID];
  id v7 = [v5 initWithFormat:@"D:%@", v6];

  return v7;
}

- (id)recordType
{
  return @"Device";
}

- (unint64_t)recordZone
{
  return 2;
}

- (BOOL)shouldRetrySaveWithRetryAfterInterval:(double)a3 recordID:(id)a4 error:(id)a5
{
  return a3 < 14400.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MBCKDevice;
  [(MBCKModel *)&v12 encodeWithCoder:v4];
  [v4 encodeObject:self->_deviceUUID forKey:@"DeviceUUID"];
  [v4 encodeObject:self->_deviceClass forKey:@"DeviceClass"];
  [v4 encodeObject:self->_deviceColor forKey:@"DeviceColor"];
  [v4 encodeObject:self->_deviceEnclosureColor forKey:@"DeviceEnclosureColor"];
  [v4 encodeObject:self->_deviceCoverGlassColor forKey:@"DeviceCoverGlassColor"];
  [v4 encodeObject:self->_deviceHousingColor forKey:@"DeviceHousingColor"];
  [v4 encodeObject:self->_deviceBackingColor forKey:@"DeviceBackingColor"];
  [v4 encodeObject:self->_hardwareModel forKey:@"HardwareModel"];
  [v4 encodeObject:self->_marketingName forKey:@"MarketingName"];
  [v4 encodeObject:self->_productType forKey:@"ProductType"];
  [v4 encodeObject:self->_serialNumber forKey:@"SerialNumber"];
  [v4 encodeObject:self->_pendingSnapshotRecordID forKey:@"PendingSnapshotID"];
  [v4 encodeInt64:self->_pendingSnapshotQuotaReserved forKey:@"PendingSnapshotQuotaReserved"];
  [v4 encodeInteger:self->_pendingSnapshotType forKey:@"PendingSnapshotBackupType"];
  [v4 encodeInteger:self->_pendingSnapshotBackupPolicy forKey:@"PendingSnapshotBackupPolicy"];
  [v4 encodeObject:self->_hmacKey forKey:@"HMACKey"];
  [v4 encodeObject:self->_assetIDPrefix forKey:@"AssetIDPrefix"];
  id v6 = [(MBCKKeyBagManager *)self->_keybagManager keybagRefs];
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  [v4 encodeObject:v7 forKey:@"KeybagRefs"];

  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:self->_snapshotRefs requiringSecureCoding:1 error:0];
  [v4 encodeObject:v8 forKey:@"SnapshotRefs"];

  id v9 = +[NSKeyedArchiver archivedDataWithRootObject:self->_snapshotCommitDates requiringSecureCoding:1 error:0];
  [v4 encodeObject:v9 forKey:@"SnapshotCommitDates"];

  id v10 = self;
  objc_sync_enter(v10);
  BOOL backupEnabled = v10->_backupEnabled;
  LODWORD(v6) = v10->_hasBackupEnabledState;
  objc_sync_exit(v10);

  if (v6) {
    [v4 encodeBool:backupEnabled forKey:@"BackupEnabled"];
  }
}

- (MBCKDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)MBCKDevice;
  id v6 = [(MBCKModel *)&v53 initWithCoder:v4];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceUUID"];
    deviceUUID = v6->_deviceUUID;
    v6->_deviceUUID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceClass"];
    deviceClass = v6->_deviceClass;
    v6->_deviceClass = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceColor"];
    deviceColor = v6->_deviceColor;
    v6->_deviceColor = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceEnclosureColor"];
    deviceEnclosureColor = v6->_deviceEnclosureColor;
    v6->_deviceEnclosureColor = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceCoverGlassColor"];
    deviceCoverGlassColor = v6->_deviceCoverGlassColor;
    v6->_deviceCoverGlassColor = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceHousingColor"];
    deviceHousingColor = v6->_deviceHousingColor;
    v6->_deviceHousingColor = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceBackingColor"];
    deviceBackingColor = v6->_deviceBackingColor;
    v6->_deviceBackingColor = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HardwareModel"];
    hardwareModel = v6->_hardwareModel;
    v6->_hardwareModel = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MarketingName"];
    marketingName = v6->_marketingName;
    v6->_marketingName = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductType"];
    productType = v6->_productType;
    v6->_productType = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SerialNumber"];
    serialNumber = v6->_serialNumber;
    v6->_serialNumber = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PendingSnapshotID"];
    pendingSnapshotRecordID = v6->_pendingSnapshotRecordID;
    v6->_pendingSnapshotRecordID = (NSString *)v29;

    v6->_pendingSnapshotQuotaReserved = (unint64_t)[v4 decodeInt64ForKey:@"PendingSnapshotQuotaReserved"];
    v6->_pendingSnapshotType = (int64_t)[v4 decodeIntegerForKey:@"PendingSnapshotBackupType"];
    v6->_pendingSnapshotBackupPolicy = (int64_t)[v4 decodeIntegerForKey:@"PendingSnapshotBackupPolicy"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMACKey"];
    hmacKey = v6->_hmacKey;
    v6->_hmacKey = (NSData *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssetIDPrefix"];
    assetIDPrefix = v6->_assetIDPrefix;
    v6->_assetIDPrefix = (NSString *)v33;

    v56[0] = objc_opt_class();
    v56[1] = objc_opt_class();
    id v35 = +[NSArray arrayWithObjects:v56 count:2];
    id v36 = +[NSSet setWithArray:v35];
    long long v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KeybagRefs"];
    id v38 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v36 fromData:v37 error:0];

    id v39 = [[MBCKKeyBagManager alloc] initWithDevice:v6 keybagRefs:v38];
    keybagManager = v6->_keybagManager;
    v6->_keybagManager = v39;

    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    uint64_t v41 = +[NSArray arrayWithObjects:v55 count:2];
    uint64_t v42 = +[NSSet setWithArray:v41];
    v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SnapshotRefs"];
    uint64_t v44 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v42 fromData:v43 error:0];
    snapshotRefs = v6->_snapshotRefs;
    v6->_snapshotRefs = (NSArray *)v44;

    v54[0] = objc_opt_class();
    v54[1] = objc_opt_class();
    v46 = +[NSArray arrayWithObjects:v54 count:2];
    id v47 = +[NSSet setWithArray:v46];
    v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SnapshotCommitDates"];
    uint64_t v49 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v47 fromData:v48 error:0];
    snapshotCommitDates = v6->_snapshotCommitDates;
    v6->_snapshotCommitDates = (NSArray *)v49;

    if ([v4 containsValueForKey:@"BackupEnabled"])
    {
      v6->_BOOL backupEnabled = [v4 decodeBoolForKey:@"BackupEnabled"];
      v6->_hasBackupEnabledState = 1;
    }
  }
  v51 = v6;

  return v51;
}

+ (BOOL)performKeyBagReferenceValidationOnDeviceWithRecordID:(id)a3 tracker:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("+[MBCKDevice performKeyBagReferenceValidationOnDeviceWithRecordID:tracker:error:]", "MBCKDevice.m", 924, "recordID");
  }
  uint64_t v9 = v8;
  if (!v8) {
    __assert_rtn("+[MBCKDevice performKeyBagReferenceValidationOnDeviceWithRecordID:tracker:error:]", "MBCKDevice.m", 925, "tracker");
  }
  id v10 = [v8 account];
  uint64_t v11 = [v10 persona];

  id v12 = [v11 copyPreferencesValueForKey:@"KeyBagReferenceValidationDateKey" class:objc_opt_class()];
  uint64_t v13 = +[NSDate now];
  id v14 = v13;
  if (v12 && ([v13 timeIntervalSinceDate:v12], double v16 = v15, v15 < 259200.0))
  {
    id v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v54 = v12;
      __int16 v55 = 2048;
      double v56 = v16;
      __int16 v57 = 2048;
      uint64_t v58 = 0x410FA40000000000;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=keybag ref= Skipping keybag reference validation, last check %@ (%.2f < %.2f)", buf, 0x20u);
      _MBLog();
    }
    BOOL v29 = 1;
  }
  else
  {
    uint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v7;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=keybag ref= Performing keybag reference validation for device recordID %@", buf, 0xCu);
      _MBLog();
    }

    id v18 = [v9 fetchRecordWithID:v7 error:a5];
    if (v18)
    {
      uint64_t v19 = [(MBCKModel *)[MBCKDevice alloc] initWithRecord:v18 cache:0];
      id v20 = [(MBCKDevice *)v19 keybagManager];
      unsigned int v21 = [v20 fetchKeybagsWithOperationTracker:v9 error:a5];

      if (v21)
      {
        v46 = v14;
        id v47 = v11;
        id v22 = [(MBCKDevice *)v19 keybagManager];
        uint64_t v23 = [v22 keybagRefs];
        id v24 = [v23 count];

        uint64_t v25 = [(MBCKDevice *)v19 keybagManager];
        id v26 = [v25 keybagsByUUIDString];
        id v27 = [v26 count];

        id v44 = v27;
        if (v24 == v27)
        {
          unint64_t v28 = MBGetDefaultLog();
          id v14 = v46;
          uint64_t v11 = v47;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=keybag ref= Key bag reference validation passed", buf, 2u);
            _MBLog();
          }

          [v47 setPreferencesValue:v46 forKey:@"KeyBagReferenceValidationDateKey"];
          BOOL v29 = 1;
        }
        else
        {
          v43 = a5;
          uint64_t v41 = v18;
          uint64_t v42 = v9;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          v45 = v19;
          v30 = [(MBCKDevice *)v19 keybagManager];
          uint64_t v31 = [v30 keybagRefs];

          id v32 = [v31 countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v49;
            do
            {
              for (i = 0; i != v33; i = (char *)i + 1)
              {
                if (*(void *)v49 != v34) {
                  objc_enumerationMutation(v31);
                }
                id v36 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                long long v37 = MBGetDefaultLog();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v54 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "=keybag ref= Fetched keybag ref: %@", buf, 0xCu);
                  _MBLog();
                }
              }
              id v33 = [v31 countByEnumeratingWithState:&v48 objects:v52 count:16];
            }
            while (v33);
          }

          id v38 = [(MBCKDevice *)v45 keybagManager];
          id v39 = [v38 keybagsByUUIDString];
          [v39 enumerateKeysAndObjectsUsingBlock:&stru_1004135B8];

          if (v43)
          {
            +[MBError errorWithCode:243, @"Invalid keybag references (%llu != %llu)", v24, v44 format];
            BOOL v29 = 0;
            id *v43 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v29 = 0;
          }
          uint64_t v9 = v42;
          id v14 = v46;
          uint64_t v11 = v47;
          id v18 = v41;
          uint64_t v19 = v45;
        }
      }
      else
      {
        BOOL v29 = 0;
      }
    }
    else
    {
      BOOL v29 = 0;
    }
  }

  return v29;
}

- (id)_fileListReferencesMatching:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKDevice *)self snapshots];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001057F4;
  v14[3] = &unk_1004135E0;
  id v6 = v4;
  id v15 = v6;
  id v7 = (char *)[v5 indexOfObjectPassingTest:v14];
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = objc_msgSend(v5, "subarrayWithRange:", 0, v7 + 1);
  id v8 = MBGetLatestDomainRecordReferencesFromSnapshots(v9);
  id v10 = [v8 count];
  uint64_t v11 = MBGetDefaultLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "=sync= Synchronizing file lists: %ld references", buf, 0xCu);
LABEL_8:
      _MBLog();
    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "=sync= No snapshot to domain references to synchronize", buf, 2u);
    goto LABEL_8;
  }

LABEL_10:
  return v8;
}

- (id)synchronizeFileListsWithOperationTracker:(id)a3 snapshotDirectory:(id)a4 commitID:(id)a5 error:(id *)a6 fetchedFileListBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100105AC0;
  v26[3] = &unk_100411D90;
  id v16 = v14;
  id v27 = v16;
  id v17 = [(MBCKDevice *)self _fileListReferencesMatching:v26];
  id v18 = v17;
  if (v17)
  {
    if (![v17 count]
      || ([(MBCKDevice *)self hmacKey],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = MBSynchronizeFileListsWithSnapshotDirectory(v13, v16, v19, v18, v12, 0, a6, v15),
          v19,
          (v20 & 1) != 0))
    {
      unsigned int v21 = [v13 stringByAppendingPathComponent:v16];
      goto LABEL_14;
    }
    id v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=sync= Error synchronizing file lists for commitID: %@", buf, 0xCu);
      _MBLog();
    }
  }
  else
  {
    id v22 = [(MBCKDevice *)self deviceUUID];
    uint64_t v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No snapshot found with deviceUUID:%@ commitID:%@", buf, 0x16u);
      _MBLog();
    }

    if (a6)
    {
      *a6 = +[MBError errorWithCode:1, @"No snapshot found with deviceUUID:%@ commitID:%@", v22, v16 format];
    }
  }
  unsigned int v21 = 0;
LABEL_14:

  return v21;
}

- (BOOL)synchronizeFileListsWithOperationTracker:(id)a3 snapshotDirectory:(id)a4 snapshotUUID:(id)a5 error:(id *)a6 fetchedFileListBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100105D9C;
  void v25[3] = &unk_100411D90;
  id v16 = v14;
  id v26 = v16;
  id v17 = [(MBCKDevice *)self _fileListReferencesMatching:v25];
  id v18 = v17;
  if (!v17)
  {
    id v22 = [(MBCKDevice *)self deviceUUID];
    uint64_t v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v28 = v22;
      __int16 v29 = 2112;
      __int16 v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No snapshot found with deviceUUID:%@ snapshotUUID:%@", buf, 0x16u);
      _MBLog();
    }

    if (a6)
    {
      *a6 = +[MBError errorWithCode:1, @"No snapshot found with deviceUUID:%@ snapshotUUID:%@", v22, v16 format];
    }
    goto LABEL_11;
  }
  if ([v17 count])
  {
    uint64_t v19 = [(MBCKDevice *)self hmacKey];
    char v20 = MBSynchronizeFileListsWithSnapshotDirectory(v13, v16, v19, v18, v12, 0, a6, v15);

    if ((v20 & 1) == 0)
    {
      id v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v28 = v16;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "=sync= Error synchronizing file lists for snapshotUUID: %@", buf, 0xCu);
        _MBLog();
      }
LABEL_11:

      BOOL v21 = 0;
      goto LABEL_12;
    }
  }
  BOOL v21 = 1;
LABEL_12:

  return v21;
}

- (NSArray)snapshotRefs
{
  return self->_snapshotRefs;
}

- (void)setSnapshotRefs:(id)a3
{
}

- (NSArray)snapshotCommitDates
{
  return self->_snapshotCommitDates;
}

- (void)setSnapshotCommitDates:(id)a3
{
}

- (NSArray)snapshots
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (MBCKSnapshot)pendingSnapshot
{
  return self->_pendingSnapshot;
}

- (void)setPendingSnapshot:(id)a3
{
}

- (NSString)pendingSnapshotRecordID
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (unint64_t)pendingSnapshotQuotaReserved
{
  return self->_pendingSnapshotQuotaReserved;
}

- (void)setPendingSnapshotQuotaReserved:(unint64_t)a3
{
  self->_pendingSnapshotQuotaReserved = a3;
}

- (int64_t)pendingSnapshotType
{
  return self->_pendingSnapshotType;
}

- (void)setPendingSnapshotType:(int64_t)a3
{
  self->_pendingSnapshotType = a3;
}

- (int64_t)pendingSnapshotBackupPolicy
{
  return self->_pendingSnapshotBackupPolicy;
}

- (void)setPendingSnapshotBackupPolicy:(int64_t)a3
{
  self->_pendingSnapshotBackupPolicy = a3;
}

- (int64_t)pendingSnapshotFormat
{
  return self->_pendingSnapshotFormat;
}

- (void)setPendingSnapshotFormat:(int64_t)a3
{
  self->_pendingSnapshotFormat = a3;
}

- (NSString)pendingSnapshotBuildVersion
{
  return self->_pendingSnapshotBuildVersion;
}

- (NSSet)pendingRepairedDomainHMACs
{
  return self->_pendingRepairedDomainHMACs;
}

- (void)setPendingRepairedDomainHMACs:(id)a3
{
}

- (MBCKKeyBagManager)keybagManager
{
  return self->_keybagManager;
}

- (void)setKeybagManager:(id)a3
{
}

- (NSString)deviceUUID
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSString)deviceColor
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (NSString)deviceEnclosureColor
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (NSString)deviceCoverGlassColor
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (NSString)deviceHousingColor
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (NSString)deviceBackingColor
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (NSString)hardwareModel
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)marketingName
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (NSString)productType
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (NSString)assetIDPrefix
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setAssetIDPrefix:(id)a3
{
}

- (NSData)hmacKey
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
}

- (void)setHmacKey:(id)a3
{
}

- (BOOL)hasFetchedSnapshots
{
  return self->_hasFetchedSnapshots;
}

- (BOOL)resumingSnapshot
{
  return self->_resumingSnapshot;
}

- (void)setResumingSnapshot:(BOOL)a3
{
  self->_resumingSnapshot = a3;
}

- (BOOL)hasBackupEnabledState
{
  return self->_hasBackupEnabledState;
}

- (NSSet)domainHMACsToRepair
{
  return self->_domainHMACsToRepair;
}

- (NSSet)domainHMACsToRepairOnDisk
{
  return self->_domainHMACsToRepairOnDisk;
}

- (void)setDomainHMACsToRepairOnDisk:(id)a3
{
}

- (int64_t)backupReason
{
  return self->_backupReason;
}

- (void)setBackupReason:(int64_t)a3
{
  self->_backupReason = a3;
}

- (NSMutableSet)pinnedSnapshotRefs
{
  return self->_pinnedSnapshotRefs;
}

- (void)setPinnedSnapshotRefs:(id)a3
{
}

- (CKReference)latestGMSnapshot
{
  return self->_latestGMSnapshot;
}

- (void)setLatestGMSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestGMSnapshot, 0);
  objc_storeStrong((id *)&self->_pinnedSnapshotRefs, 0);
  objc_storeStrong((id *)&self->_domainHMACsToRepairOnDisk, 0);
  objc_storeStrong((id *)&self->_domainHMACsToRepair, 0);
  objc_storeStrong((id *)&self->_hmacKey, 0);
  objc_storeStrong((id *)&self->_assetIDPrefix, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_deviceBackingColor, 0);
  objc_storeStrong((id *)&self->_deviceHousingColor, 0);
  objc_storeStrong((id *)&self->_deviceCoverGlassColor, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_keybagManager, 0);
  objc_storeStrong((id *)&self->_pendingRepairedDomainHMACs, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotBuildVersion, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotRecordID, 0);
  objc_storeStrong((id *)&self->_pendingSnapshot, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_snapshotCommitDates, 0);
  objc_storeStrong((id *)&self->_snapshotRefs, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end