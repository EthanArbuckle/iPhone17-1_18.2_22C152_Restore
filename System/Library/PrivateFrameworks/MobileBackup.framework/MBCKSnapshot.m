@interface MBCKSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)_createDomainRecordQuotaFromBaseRecordIDs:(id)a3 domainQuotas:(id)a4;
+ (id)_createDomainReferencesFromBaseRecordIDs:(id)a3 pageCounts:(id)a4 checksums:(id)a5;
+ (id)snapshotForDevice:(id)a3 reason:(int64_t)a4 type:(int64_t)a5 snapshotFormat:(int64_t)a6;
+ (id)snapshotForDevice:(id)a3 reason:(int64_t)a4 type:(int64_t)a5 snapshotFormat:(int64_t)a6 accountType:(int64_t)a7;
+ (id)snapshotForDevice:(id)a3 reason:(int64_t)a4 type:(int64_t)a5 snapshotFormat:(int64_t)a6 snapshotID:(id)a7;
+ (id)snapshotIDFromSnapshotRecordID:(id)a3;
+ (id)sortedSnapshots:(id)a3;
+ (int64_t)_accountTypeFromAccountClass:(int64_t)a3;
+ (void)_createBaseRecordIDs:(id *)a3 pageCounts:(id *)a4 checksums:(id *)a5 fromReferences:(id)a6;
- (BOOL)addDomainRecordIDsFromPendingSnapshotDatabase:(id)a3 attemptSummary:(id)a4 error:(id *)a5;
- (BOOL)addFileChange:(id)a3 batchSave:(id)a4 engine:(id)a5 skipped:(BOOL *)a6 error:(id *)a7;
- (BOOL)addManifest:(id)a3;
- (BOOL)committed;
- (BOOL)fetchManifestsWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)hasFetchedManifests;
- (BOOL)isBackupAllowedOnCellular;
- (BOOL)isInherited;
- (BOOL)testCommitRepairChecksumOnLightrailChecksumMismatch;
- (MBCKDevice)device;
- (MBCKSnapshot)initWithCoder:(id)a3;
- (MBCKSnapshot)initWithDevice:(id)a3 reason:(int64_t)a4 type:(int64_t)a5 snapshotFormat:(int64_t)a6 backupPolicy:(int64_t)a7;
- (MBCKSnapshot)initWithDictionary:(id)a3 cache:(id)a4;
- (NSArray)domainHmacsToRemove;
- (NSArray)domainRecordQuotas;
- (NSArray)manifestChecksums;
- (NSArray)manifestIDs;
- (NSArray)modifiedDomainRecordReferences;
- (NSData)backupProperties;
- (NSDate)created;
- (NSDate)modificationDate;
- (NSDictionary)manifestsByDomainName;
- (NSMutableDictionary)manifestIDsToCounts;
- (NSString)buildVersion;
- (NSString)commitID;
- (NSString)deviceName;
- (NSString)deviceUUID;
- (NSString)productVersion;
- (NSString)requiredProductVersion;
- (NSString)snapshotID;
- (id)_decodeBackupPropertiesWithValue:(id)a3;
- (id)_getManifestForDomain:(id)a3;
- (id)_getRecordIDString;
- (id)_manifestDomainNameForDomainName:(id)a3;
- (id)description;
- (id)manifestForDomainName:(id)a3;
- (id)recordRepresentation;
- (id)recordType;
- (int64_t)accountType;
- (int64_t)backupPolicy;
- (int64_t)backupReason;
- (int64_t)cameraRollBackupState;
- (int64_t)estimatedRestoreSize;
- (int64_t)quotaUsed;
- (int64_t)snapshotFormat;
- (int64_t)type;
- (unint64_t)recordZone;
- (void)encodeWithCoder:(id)a3;
- (void)fetchManifestsWithOperationTracker:(id)a3 referenceFetchProgress:(id)a4 manifestProgress:(id)a5 snapshotCompletion:(id)a6;
- (void)forgetManifests;
- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4;
- (void)refreshWithRecord:(id)a3;
- (void)saveToCacheWithCompletion:(id)a3;
- (void)setAccountType:(int64_t)a3;
- (void)setBackupPolicy:(int64_t)a3;
- (void)setBackupProperties:(id)a3;
- (void)setCameraRollBackupState:(int64_t)a3;
- (void)setCommitted:(BOOL)a3;
- (void)setCreated:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEstimatedRestoreSize:(int64_t)a3;
- (void)setIsBackupAllowedOnCellular:(BOOL)a3;
- (void)setIsInherited:(BOOL)a3;
- (void)setManifestIDsToCounts:(id)a3;
- (void)setSnapshotID:(id)a3;
- (void)setTestCommitRepairChecksumOnLightrailChecksumMismatch:(BOOL)a3;
@end

@implementation MBCKSnapshot

+ (id)sortedSnapshots:(id)a3
{
  v3 = [a3 sortedArrayUsingComparator:&stru_1004112E0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (![v9 type] || MBSnapshotTypeIsFull()) {
          uint64_t v6 = 0;
        }
        v6 += (uint64_t)[v9 quotaUsed];
        if (v6 % 100000000) {
          uint64_t v10 = v6 + 100000000 - v6 % 100000000;
        }
        else {
          uint64_t v10 = v6;
        }
        [v9 setEstimatedRestoreSize:v10];
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return v3;
}

+ (id)snapshotForDevice:(id)a3 reason:(int64_t)a4 type:(int64_t)a5 snapshotFormat:(int64_t)a6
{
  id v9 = a3;
  uint64_t v10 = [v9 pendingSnapshot];
  v11 = v10;
  if (v10) {
    long long v12 = v10;
  }
  else {
    long long v12 = [[MBCKSnapshot alloc] initWithDevice:v9 reason:a4 type:a5 snapshotFormat:a6 backupPolicy:0];
  }
  long long v13 = v12;

  return v13;
}

+ (id)snapshotForDevice:(id)a3 reason:(int64_t)a4 type:(int64_t)a5 snapshotFormat:(int64_t)a6 accountType:(int64_t)a7
{
  id v12 = a3;
  if (!a7) {
    __assert_rtn("+[MBCKSnapshot snapshotForDevice:reason:type:snapshotFormat:accountType:]", "MBCKSnapshot.m", 73, "accountType != MBAccountTypeUnspecified");
  }
  long long v13 = v12;
  long long v14 = [a1 snapshotForDevice:v12 reason:a4 type:a5 snapshotFormat:a6];
  [v14 setAccountType:a7];

  return v14;
}

+ (id)snapshotForDevice:(id)a3 reason:(int64_t)a4 type:(int64_t)a5 snapshotFormat:(int64_t)a6 snapshotID:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  long long v13 = [[MBCKSnapshot alloc] initWithDevice:v12 reason:a4 type:a5 snapshotFormat:a6 backupPolicy:0];

  [(MBCKSnapshot *)v13 setSnapshotID:v11];
  return v13;
}

+ (id)snapshotIDFromSnapshotRecordID:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"S:"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"S:", "length")];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (MBCKSnapshot)initWithDevice:(id)a3 reason:(int64_t)a4 type:(int64_t)a5 snapshotFormat:(int64_t)a6 backupPolicy:(int64_t)a7
{
  id v12 = a3;
  if (!v12) {
    __assert_rtn("-[MBCKSnapshot initWithDevice:reason:type:snapshotFormat:backupPolicy:]", "MBCKSnapshot.m", 97, "device");
  }
  long long v13 = v12;
  long long v14 = [v12 cache];
  v29.receiver = self;
  v29.super_class = (Class)MBCKSnapshot;
  long long v15 = [(MBCKModel *)&v29 initWithRecord:0 cache:v14];

  if (v15)
  {
    v16 = [v13 pendingSnapshotRecordID];
    [(MBCKSnapshot *)v15 setSnapshotID:v16];

    v17 = [v13 pendingSnapshotRecordID];
    if (v17) {
      BOOL v18 = [v13 pendingSnapshotQuotaReserved] != 0;
    }
    else {
      BOOL v18 = 0;
    }
    [v13 setResumingSnapshot:v18];

    [(MBCKSnapshot *)v15 setDevice:v13];
    deviceName = v15->_deviceName;
    v15->_deviceName = 0;

    v15->_hasCachedDeviceName = 0;
    v15->_backupReason = a4;
    v15->_type = a5;
    v15->_backupPolicy = a7;
    uint64_t v20 = MBProductVersion();
    productVersion = v15->_productVersion;
    v15->_productVersion = (NSString *)v20;

    uint64_t v22 = MBBuildVersion();
    buildVersion = v15->_buildVersion;
    v15->_buildVersion = (NSString *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    manifestsByDomainName = v15->_manifestsByDomainName;
    v15->_manifestsByDomainName = v24;

    v15->_isInherited = 0;
    v15->_estimatedRestoreSize = -1;
    v15->_accountType = 1;
    v15->_snapshotFormat = a6;
    uint64_t v26 = [(MBCKSnapshot *)v15 snapshotID];
    commitID = v15->_commitID;
    v15->_commitID = (NSString *)v26;
  }
  return v15;
}

- (MBCKSnapshot)initWithDictionary:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MBCKSnapshot;
  v8 = [(MBCKModel *)&v34 initWithRecord:0 cache:v7];
  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:@"snapshotID"];
    [(MBCKSnapshot *)v8 setSnapshotID:v9];

    uint64_t v10 = [v6 objectForKeyedSubscript:@"deviceName"];
    [(MBCKSnapshot *)v8 setDeviceName:v10];

    id v11 = [v6 objectForKeyedSubscript:@"committed"];
    v8->_committed = [v11 BOOLValue];

    uint64_t v12 = [v6 objectForKeyedSubscript:@"created"];
    created = v8->_created;
    v8->_created = (NSDate *)v12;

    long long v14 = [v6 objectForKeyedSubscript:@"backupReason"];
    v8->_backupReason = (int)[v14 intValue];

    long long v15 = [v6 objectForKeyedSubscript:@"backupType"];
    v8->_type = (int)[v15 intValue];

    v16 = [v6 objectForKeyedSubscript:@"backupPolicy"];
    v8->_backupPolicy = (int64_t)[v16 integerValue];

    uint64_t v17 = [v6 objectForKeyedSubscript:@"buildVersion"];
    buildVersion = v8->_buildVersion;
    v8->_buildVersion = (NSString *)v17;

    uint64_t v19 = [v6 objectForKeyedSubscript:@"productVersion"];
    productVersion = v8->_productVersion;
    v8->_productVersion = (NSString *)v19;

    v21 = [v6 objectForKeyedSubscript:@"quotaUsed"];
    v8->_quotaUsed = (int64_t)[v21 longLongValue];

    uint64_t v22 = [v6 objectForKeyedSubscript:@"modificationDate"];
    modificationDate = v8->_modificationDate;
    v8->_modificationDate = (NSDate *)v22;

    uint64_t v24 = [v6 objectForKeyedSubscript:@"backupProperties"];
    backupProperties = v8->_backupProperties;
    v8->_backupProperties = (NSData *)v24;

    uint64_t v26 = [v6 objectForKeyedSubscript:@"requiredProductVersion"];
    requiredProductVersion = v8->_requiredProductVersion;
    v8->_requiredProductVersion = (NSString *)v26;

    v28 = [v6 objectForKeyedSubscript:@"cameraRollBackupState"];
    v8->_cameraRollBackupState = (int64_t)[v28 integerValue];

    objc_super v29 = [v6 objectForKeyedSubscript:@"backupAllowedOnCellular"];
    v8->_isBackupAllowedOnCellular = [v29 BOOLValue];

    v8->_estimatedRestoreSize = -1;
    v30 = [v6 objectForKeyedSubscript:@"accountType"];
    v31 = v30;
    if (v30)
    {
      id v32 = [v30 integerValue];
      v8->_accountType = (int64_t)v32;
      if (!v32) {
        __assert_rtn("-[MBCKSnapshot initWithDictionary:cache:]", "MBCKSnapshot.m", 139, "_accountType != MBAccountTypeUnspecified");
      }
    }
    else
    {
      v8->_accountType = 1;
    }
  }
  return v8;
}

- (NSString)deviceName
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_deviceName;
  if (!v3)
  {
    if (v2->_hasCachedDeviceName)
    {
      id v3 = 0;
    }
    else
    {
      MBDeviceName();
      id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      deviceName = v2->_deviceName;
      v2->_deviceName = v4;

      id v3 = v4;
      v2->_hasCachedDeviceName = 1;
    }
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setDeviceName:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  deviceName = obj->_deviceName;
  obj->_deviceName = v4;

  obj->_hasCachedDeviceName = 1;
  objc_sync_exit(obj);
}

- (void)setDevice:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_device, obj);
    id v5 = [obj deviceUUID];
    deviceUUID = self->_deviceUUID;
    self->_deviceUUID = v5;
  }
}

- (MBCKDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  return (MBCKDevice *)WeakRetained;
}

- (id)manifestForDomainName:(id)a3
{
  manifestsByDomainName = self->_manifestsByDomainName;
  id v4 = [(MBCKSnapshot *)self _manifestDomainNameForDomainName:a3];
  id v5 = [(NSMutableDictionary *)manifestsByDomainName objectForKeyedSubscript:v4];

  return v5;
}

- (id)_manifestDomainNameForDomainName:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (+[MBDomain isAppPlaceholderName:v3])
  {
    id v5 = +[MBDomain containerIDWithName:v3];
    id v4 = +[MBDomain nameWithAppID:v5];
  }
  return v4;
}

- (id)_getManifestForDomain:(id)a3
{
  id v4 = [(MBCKSnapshot *)self _manifestDomainNameForDomainName:a3];
  id v5 = [(NSMutableDictionary *)self->_manifestsByDomainName objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [(MBCKModel *)self cache];
    id v5 = +[MBCKManifest manifestWithSnapshot:self domainName:v4 count:1 cache:v6];
  }
  [(NSMutableDictionary *)self->_manifestsByDomainName setObject:v5 forKeyedSubscript:v4];

  return v5;
}

- (BOOL)addFileChange:(id)a3 batchSave:(id)a4 engine:(id)a5 skipped:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12) {
    __assert_rtn("-[MBCKSnapshot addFileChange:batchSave:engine:skipped:error:]", "MBCKSnapshot.m", 202, "fileChange");
  }
  if (!v13) {
    __assert_rtn("-[MBCKSnapshot addFileChange:batchSave:engine:skipped:error:]", "MBCKSnapshot.m", 203, "batchSave");
  }
  long long v15 = v14;
  v16 = [v12 domain];
  uint64_t v17 = [v16 name];
  BOOL v18 = [(MBCKSnapshot *)self _getManifestForDomain:v17];

  if (!v18) {
    __assert_rtn("-[MBCKSnapshot addFileChange:batchSave:engine:skipped:error:]", "MBCKSnapshot.m", 205, "manifestForDomain");
  }
  if ([v12 changeType])
  {
    id v19 = [v12 changeType];
    uint64_t v20 = MBGetDefaultLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v19 == (id)3)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Deleting file %@", buf, 0xCu);
        _MBLog();
      }
    }
    else if (v21)
    {
      v23 = [v12 changeTypeString];
      *(_DWORD *)buf = 138412546;
      id v27 = v12;
      __int16 v28 = 2112;
      objc_super v29 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Adding file %@ (%@)", buf, 0x16u);

      v25 = [v12 changeTypeString];
      _MBLog();
    }
    unsigned __int8 v22 = [v18 queueUploadOfFileChange:v12 batchSave:v13 engine:v15 skipped:a6 error:a7];
  }
  else
  {
    unsigned __int8 v22 = 1;
    if (a6) {
      *a6 = 1;
    }
  }

  return v22;
}

- (NSDictionary)manifestsByDomainName
{
  return (NSDictionary *)self->_manifestsByDomainName;
}

- (BOOL)addManifest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domainName];

  if (v5)
  {
    manifestsByDomainName = self->_manifestsByDomainName;
    id v7 = [v4 domainName];
    [(NSMutableDictionary *)manifestsByDomainName setObject:v4 forKeyedSubscript:v7];

    [(MBCKModel *)self setIsPersistedToServer:0];
  }

  return v5 != 0;
}

- (void)fetchManifestsWithOperationTracker:(id)a3 referenceFetchProgress:(id)a4 manifestProgress:(id)a5 snapshotCompletion:(id)a6
{
  id v10 = a3;
  id v43 = a4;
  id v42 = a5;
  id v11 = a6;
  if (!v10) {
    __assert_rtn("-[MBCKSnapshot fetchManifestsWithOperationTracker:referenceFetchProgress:manifestProgress:snapshotCompletion:]", "MBCKSnapshot.m", 233, "tracker");
  }
  id v12 = (void (**)(void, void))v11;
  if (!v11) {
    __assert_rtn("-[MBCKSnapshot fetchManifestsWithOperationTracker:referenceFetchProgress:manifestProgress:snapshotCompletion:]", "MBCKSnapshot.m", 234, "snapshotCompletion");
  }
  if (v43)
  {
LABEL_4:
    +[MBCKModel timeoutIntervalForFetch];
    double v14 = v13;
    long long v15 = [v10 ckOperationPolicy];
    if (!v15) {
      __assert_rtn("-[MBCKSnapshot fetchManifestsWithOperationTracker:referenceFetchProgress:manifestProgress:snapshotCompletion:]", "MBCKSnapshot.m", 249, "policy");
    }
    v16 = v15;
    if ([v15 fetchAssets] && (objc_msgSend(v16, "timeoutIntervalForFetch"), v14 == v17))
    {
      id v36 = v16;
    }
    else
    {
      id v18 = [v16 copy];

      [v18 setFetchAssets:1];
      [v18 setTimeoutIntervalForFetch:v14];
      id v57 = 0;
      uint64_t v19 = +[MBCKOperationTracker operationTrackerWithParentTracker:v10 policy:v18 error:&v57];
      id v20 = v57;

      if (!v19)
      {
        ((void (**)(void, id))v12)[2](v12, v20);
        id v10 = 0;
LABEL_26:

        goto LABEL_27;
      }
      id v36 = v18;

      id v10 = (id)v19;
    }
    v37 = v12;
    if (!self->_manifestsByDomainName)
    {
      v23 = (NSMutableDictionary *)objc_opt_new();
      manifestsByDomainName = self->_manifestsByDomainName;
      self->_manifestsByDomainName = v23;
    }
    v41 = objc_opt_new();
    v38 = v10;
    id v20 = [v10 startBatchFetch];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = [(MBCKSnapshot *)self manifestIDs];
    id v25 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v40 = *(void *)v54;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v54 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          objc_super v29 = [(MBCKSnapshot *)self manifestIDsToCounts];
          v30 = [v29 objectForKeyedSubscript:v28];
          id v31 = [v30 unsignedIntegerValue];
          id v32 = [(MBCKModel *)self cache];
          v33 = +[MBCKManifest manifestWithSnapshot:self manifestID:v28 count:v31 cache:v32];

          if (!v33) {
            __assert_rtn("-[MBCKSnapshot fetchManifestsWithOperationTracker:referenceFetchProgress:manifestProgress:snapshotCompletion:]", "MBCKSnapshot.m", 269, "manifest");
          }
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_100067718;
          v48[3] = &unk_100411308;
          v48[4] = v28;
          id v49 = v41;
          id v50 = v33;
          v51 = self;
          id v52 = v42;
          id v34 = v33;
          [v34 updateFromServerWithBatchFetch:v20 referenceFetchProgress:v43 manifestCompletion:v48];
        }
        id v26 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v26);
    }

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000679DC;
    v44[3] = &unk_100411330;
    id v45 = v41;
    v46 = self;
    id v12 = v37;
    v47 = v37;
    id v35 = v41;
    id v10 = v38;
    [v38 finishBatchFetch:v20 completion:v44];

    id v18 = v36;
    goto LABEL_26;
  }
  if (![(MBCKSnapshot *)self hasFetchedManifests])
  {
    BOOL v21 = [(MBCKSnapshot *)self manifestIDs];
    id v22 = [v21 count];

    if (v22) {
      goto LABEL_4;
    }
    self->_hasFetchedManifests = 1;
  }
  v12[2](v12, 0);
LABEL_27:
}

- (BOOL)fetchManifestsWithOperationTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100067D3C;
  double v17 = sub_100067D4C;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100067D54;
  v10[3] = &unk_100410FC8;
  id v12 = &v13;
  id v7 = dispatch_semaphore_create(0);
  id v11 = v7;
  [(MBCKSnapshot *)self fetchManifestsWithOperationTracker:v6 referenceFetchProgress:0 manifestProgress:0 snapshotCompletion:v10];
  MBSemaphoreWaitForever();
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v8 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)forgetManifests
{
  self->_hasFetchedManifests = 0;
  self->_manifestsByDomainName = 0;
  _objc_release_x1();
}

- (void)saveToCacheWithCompletion:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  id v4 = [(MBCKModel *)self cache];
  id v5 = [v4 addPendingSnapshot:self];

  if (!v5)
  {
    id v6 = [(MBCKModel *)self cache];
    id v5 = [v6 commitSnapshot:self];
  }
  v7[2](v7, v5);
}

- (NSString)snapshotID
{
  snapshotID = self->_snapshotID;
  if (!snapshotID)
  {
    MBRandomUUID();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_snapshotID;
    self->_snapshotID = v4;

    snapshotID = self->_snapshotID;
  }
  return snapshotID;
}

- (void)setSnapshotID:(id)a3
{
  id v6 = a3;
  if ([v6 hasPrefix:@"S:"])
  {
    id v4 = [v6 substringFromIndex:objc_msgSend(@"S:", "length")];
  }
  else
  {
    id v4 = (NSString *)v6;
  }
  snapshotID = self->_snapshotID;
  self->_snapshotID = v4;
}

- (NSDate)created
{
  created = self->_created;
  if (created)
  {
    id v3 = created;
  }
  else
  {
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [(MBCKSnapshot *)self snapshotID];
      id v7 = [(MBCKSnapshot *)self modificationDate];
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      double v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Snapshot %@ is missing created date, using modification date: %@", buf, 0x16u);

      BOOL v8 = [(MBCKSnapshot *)self snapshotID];
      id v10 = [(MBCKSnapshot *)self modificationDate];
      _MBLog();
    }
    id v3 = [(MBCKSnapshot *)self modificationDate];
  }
  return v3;
}

- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v58 = v6;
  if (!v6) {
    __assert_rtn("-[MBCKSnapshot prepareForSaveWithOperationTracker:completion:]", "MBCKSnapshot.m", 396, "tracker");
  }
  long long v55 = v7;
  v65 = self;
  id v57 = [(MBCKSnapshot *)self snapshotID];
  BOOL v8 = [(MBCKSnapshot *)self manifestsByDomainName];
  id v9 = [v8 allValues];

  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = [v9 count];
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v57;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleting %lu old manifests from snapshot %{public}@", buf, 0x16u);
    id v52 = [v9 count];
    long long v53 = v57;
    _MBLog();
  }

  id v11 = dispatch_group_create();
  id v12 = [v58 startBatchDelete];
  [v12 setRetryWhenNetworkDisconnected:0];
  dispatch_group_enter(v11);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = v9;
  id v13 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v97;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v97 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        dispatch_group_enter(v11);
        v94[0] = _NSConcreteStackBlock;
        v94[1] = 3221225472;
        v94[2] = sub_100068BE8;
        v94[3] = &unk_100411128;
        v95 = v11;
        [v16 deletePendingManifestPagesWithBatchDelete:v12 completion:v94];
      }
      id v13 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
    }
    while (v13);
  }

  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_100068BF0;
  v92[3] = &unk_100411060;
  id v18 = v11;
  v93 = v18;
  [v58 finishBatchDelete:v12 completion:v92];
  v64 = [v58 startBatchDelete];

  [v64 setRetryWhenNetworkDisconnected:0];
  dispatch_group_enter(v18);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v60 = obj;
  id v19 = [v60 countByEnumeratingWithState:&v88 objects:v105 count:16];
  if (v19)
  {
    id obja = *(id *)v89;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(id *)v89 != obja) {
          objc_enumerationMutation(v60);
        }
        BOOL v21 = *(void **)(*((void *)&v88 + 1) + 8 * (void)j);
        v23 = [v21 manifestID];
        uint64_t v24 = [v21 domainName];
        id v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v23;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Reclaiming quota for replaced files from manifest %{public}@ (%@)", buf, 0x16u);
          id v52 = v23;
          long long v53 = v24;
          _MBLog();
        }

        dispatch_group_enter(v18);
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_100068CCC;
        v85[3] = &unk_100411358;
        v85[4] = v65;
        id v86 = v23;
        v87 = v18;
        id v26 = v23;
        [v21 deletePendingCloudFilesWithBatchDelete:v64 completion:v85];
      }
      id v19 = [v60 countByEnumeratingWithState:&v88 objects:v105 count:16];
    }
    while (v19);
  }

  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100068D24;
  v83[3] = &unk_100411060;
  long long v56 = v18;
  v84 = v56;
  [v58 finishBatchDelete:v64 completion:v83];
  MBGroupWaitForever();
  id v27 = MBGetDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v60 count];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v28;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v57;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Preparing %lu manifests for snapshot %{public}@", buf, 0x16u);
    id v52 = [v60 count];
    long long v53 = v57;
    _MBLog();
  }

  id objb = [v58 startBatchSave];
  objc_super v29 = dispatch_group_create();
  v30 = objc_opt_new();
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v31 = v60;
  id v32 = [v31 countByEnumeratingWithState:&v79 objects:v104 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v80;
    while (2)
    {
      id v34 = 0;
      id v59 = v32;
      do
      {
        if (*(void *)v80 != v33) {
          objc_enumerationMutation(v31);
        }
        id v35 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v34);
        id v36 = [(MBCKModel *)v65 cache];
        id v78 = 0;
        id v37 = [v36 countFilesForManifest:v35 error:&v78];
        id v38 = v78;

        if (v38)
        {
          id v39 = v30;
          objc_sync_enter(v39);
          [v39 addObject:v38];
          objc_sync_exit(v39);
LABEL_38:

          goto LABEL_39;
        }
        id v38 = [v35 manifestID];
        id v39 = [v35 domainName];
        if (v37)
        {
          dispatch_group_enter(v29);
          v75[0] = _NSConcreteStackBlock;
          v75[1] = 3221225472;
          v75[2] = sub_100068E00;
          v75[3] = &unk_100411380;
          id v40 = v30;
          id v76 = v40;
          v77 = v29;
          [v35 saveWithBatchSave:objb completion:v75];
          id v41 = v40;
          objc_sync_enter(v41);
          BOOL v42 = [v41 count] == 0;
          objc_sync_exit(v41);

          if (!v42) {
            goto LABEL_38;
          }
        }
        else
        {
          id v43 = MBGetDefaultLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v38;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v39;
            *(_WORD *)&buf[22] = 2114;
            v101 = v57;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Removing manifest %{public}@ (%@) with 0 files from snapshot %{public}@", buf, 0x20u);
            long long v53 = (uint64_t (*)(uint64_t, uint64_t))v39;
            long long v54 = v57;
            id v32 = v59;
            id v52 = v38;
            _MBLog();
          }

          v44 = [(MBCKModel *)v65 cache];
          id v45 = [v44 removeManifestAndFiles:v35];

          [(NSMutableDictionary *)v65->_manifestsByDomainName removeObjectForKey:v39];
        }

        id v34 = (char *)v34 + 1;
      }
      while (v32 != v34);
      id v32 = [v31 countByEnumeratingWithState:&v79 objects:v104 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }
LABEL_39:

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v101 = sub_100067D3C;
  v102 = sub_100067D4C;
  id v103 = 0;
  dispatch_group_enter(v29);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100068E8C;
  v72[3] = &unk_100410FC8;
  v74 = buf;
  v46 = v29;
  v73 = v46;
  [v58 finishBatchSave:objb completion:v72];
  v47 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068EEC;
  block[3] = &unk_1004113A8;
  v71 = buf;
  id v67 = v30;
  v68 = v57;
  v69 = v65;
  id v70 = v55;
  id v48 = v55;
  id v49 = v57;
  id v50 = v30;
  dispatch_block_t v51 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_group_notify(v46, v47, v51);

  _Block_object_dispose(buf, 8);
}

- (id)recordRepresentation
{
  v86.receiver = self;
  v86.super_class = (Class)MBCKSnapshot;
  uint64_t v66 = [(MBCKModel *)&v86 recordRepresentation];
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(MBCKSnapshot *)self manifestsByDomainName];
  id v5 = [v4 allKeys];
  id v73 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  id v6 = objc_alloc((Class)NSMutableArray);
  id v7 = [(MBCKSnapshot *)self manifestsByDomainName];
  BOOL v8 = [v7 allKeys];
  id v72 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v8, "count"));

  id v9 = objc_alloc((Class)NSMutableArray);
  id v10 = [(MBCKSnapshot *)self manifestsByDomainName];
  id v11 = [v10 allKeys];
  id v71 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v11, "count"));

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v70 = self;
  id obj = [(MBCKSnapshot *)self manifestsByDomainName];
  id v74 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (v74)
  {
    char v67 = 0;
    id v12 = 0;
    uint64_t v69 = *(void *)v83;
    do
    {
      for (i = 0; i != v74; i = (char *)i + 1)
      {
        uint64_t v14 = v12;
        if (*(void *)v83 != v69) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        v16 = [(MBCKSnapshot *)v70 manifestsByDomainName];
        double v17 = [v16 objectForKeyedSubscript:v15];

        id v18 = [v17 baseRecordIDString];
        [v73 addObject:v18];

        id v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 manifestCount]);
        [v72 addObject:v19];

        id v20 = [(MBCKModel *)v70 cache];
        BOOL v21 = [v17 manifestID];
        id v81 = v12;
        id v22 = [v20 checksumForManifest:v21 shouldLog:0 error:&v81];
        id v12 = v81;

        v23 = +[NSNumber numberWithLongLong:v22];
        [v71 addObject:v23];

        uint64_t v24 = [(MBCKModel *)v70 cache];
        id v80 = 0;
        id v25 = [v24 countFilesForManifest:v17 error:&v80];
        id v26 = v80;

        id v27 = [(MBCKModel *)v70 cache];
        id v79 = 0;
        id v28 = [v27 countDomainHmacForManifest:v17 error:&v79];
        id v29 = v79;

        if (!v26 && !v29 && v25 != v28)
        {
          v30 = MBGetDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)long long v88 = v15;
            *(_WORD *)&v88[8] = 2048;
            *(void *)&v88[10] = v25;
            __int16 v89 = 2048;
            id v90 = v28;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Domain Hmac collision detected on manifest: %@ (%llu files != %llu hmac)", buf, 0x20u);
            id v63 = v25;
            id v64 = v28;
            id v62 = v15;
            _MBLog();
          }

          char v67 = 1;
        }
      }
      id v74 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
    }
    while (v74);
  }
  else
  {
    char v67 = 0;
    id v12 = 0;
  }

  id v31 = [(MBCKModel *)v70 cache];
  id v78 = v12;
  id v32 = [v31 countManifestsForSnapshot:v70 error:&v78];
  id v33 = v78;

  if (v33 || [v73 count] == (id)(int)v32)
  {
    id v34 = (void *)v66;
    id v35 = ATClientController_ptr;
    if ((v67 & 1) == 0) {
      goto LABEL_26;
    }
  }
  else
  {
    id v36 = MBGetDefaultLog();
    id v34 = (void *)v66;
    id v35 = ATClientController_ptr;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = [v73 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)long long v88 = v32;
      *(_WORD *)&v88[4] = 2048;
      *(void *)&v88[6] = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Local cache manifest count (%d) does not match CK manifest (%lu) counts on upload", buf, 0x12u);
      id v62 = v32;
      id v63 = [v73 count];
      _MBLog();
    }
  }
  id v38 = [(MBCKModel *)v70 cache];
  [v38 flush];

  id v39 = MBGetDefaultLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "Local cache <-> CK representation mismatch on upload", buf, 2u);
    _MBLog();
  }

  id v40 = +[NSAssertionHandler currentHandler];
  [v40 handleFailureInMethod:a2 object:v70 file:@"MBCKSnapshot.m" lineNumber:555 description:@"Local cache <-> CK representation mismatch on upload"];

LABEL_26:
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v73, @"manifestIDs", v62, v63);
  [v34 setObject:v72 forKeyedSubscript:@"manifestCounts"];
  [v34 setObject:v71 forKeyedSubscript:@"manifestChecksums"];
  id v41 = objc_msgSend(v35[132], "numberWithInteger:", -[MBCKSnapshot backupReason](v70, "backupReason"));
  [v34 setObject:v41 forKeyedSubscript:@"backupReason"];

  BOOL v42 = objc_msgSend(v35[132], "numberWithInteger:", -[MBCKSnapshot type](v70, "type"));
  [v34 setObject:v42 forKeyedSubscript:@"backupType"];

  if (MBSnapshotFormatContainsFileLists())
  {
    uint64_t v43 = [(MBCKSnapshot *)v70 commitID];
    if (!v43) {
      __assert_rtn("-[MBCKSnapshot recordRepresentation]", "MBCKSnapshot.m", 567, "commitID");
    }
    v44 = (void *)v43;
    [v34 setObject:v43 forKeyedSubscript:@"originalSnapshotID"];
    id v45 = [v35[132] numberWithLongLong:v70->_snapshotFormat];
    [v34 setObject:v45 forKeyedSubscript:@"snapshotFormat"];

    if ([(NSArray *)v70->_modifiedDomainRecordReferences count])
    {
      id v76 = 0;
      id v77 = 0;
      id v75 = 0;
      [(id)objc_opt_class() _createBaseRecordIDs:&v77 pageCounts:&v76 checksums:&v75 fromReferences:v70->_modifiedDomainRecordReferences];
      id v46 = v77;
      id v47 = v76;
      id v48 = v75;
      [v34 setObject:v46 forKeyedSubscript:@"domainBaseRecordIDs"];
      [v34 setObject:v47 forKeyedSubscript:@"domainRecordCounts"];
      [v34 setObject:v48 forKeyedSubscript:@"domainRecordCumulativeChecksums"];
    }
    if ([(NSArray *)v70->_domainHmacsToRemove count]) {
      [v34 setObject:v70->_domainHmacsToRemove forKeyedSubscript:@"domainHMACsToRemove"];
    }
  }
  if ([(MBCKSnapshot *)v70 backupPolicy])
  {
    id v49 = objc_msgSend(v35[132], "numberWithInteger:", -[MBCKSnapshot backupPolicy](v70, "backupPolicy"));
    [v34 setObject:v49 forKeyedSubscript:@"backupPolicy"];
  }
  id v50 = [(MBCKSnapshot *)v70 deviceName];
  [v34 setObject:v50 forKeyedSubscript:@"deviceName"];

  dispatch_block_t v51 = [(MBCKSnapshot *)v70 buildVersion];
  [v34 setObject:v51 forKeyedSubscript:@"buildVersion"];

  id v52 = [(MBCKSnapshot *)v70 productVersion];
  [v34 setObject:v52 forKeyedSubscript:@"productVersion"];

  long long v53 = objc_msgSend(v35[132], "numberWithBool:", -[MBCKSnapshot isBackupAllowedOnCellular](v70, "isBackupAllowedOnCellular"));
  [v34 setObject:v53 forKeyedSubscript:@"backupAllowedOnCellular"];

  if ([(MBCKSnapshot *)v70 cameraRollBackupState])
  {
    long long v54 = objc_msgSend(v35[132], "numberWithInteger:", -[MBCKSnapshot cameraRollBackupState](v70, "cameraRollBackupState"));
    [v34 setObject:v54 forKeyedSubscript:@"cameraRollBackupState"];
  }
  long long v55 = [(MBCKSnapshot *)v70 backupProperties];

  if (v55)
  {
    long long v56 = [(MBCKSnapshot *)v70 backupProperties];
    id v57 = [v34 encryptedValueStore];
    [v57 setObject:v56 forKeyedSubscript:@"backupProperties"];
  }
  v58 = objc_opt_new();
  if ([(MBCKSnapshot *)v70 isInherited]) {
    [v58 setObject:&__kCFBooleanTrue forKeyedSubscript:@"inherited"];
  }
  if ([(MBCKSnapshot *)v70 testCommitRepairChecksumOnLightrailChecksumMismatch])
  {
    [v58 setObject:&__kCFBooleanTrue forKeyedSubscript:@"testCommitRepairChecksumOnLightrailChecksumMismatch"];
  }
  if ([v58 count]) {
    [v34 setPluginFields:v58];
  }
  id v59 = MBGetDefaultLog();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v60 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(void *)long long v88 = v60;
    *(_WORD *)&v88[8] = 2112;
    *(void *)&v88[10] = v34;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "%{public}@ record representation: %@", buf, 0x16u);
    objc_opt_class();
    _MBLog();
  }

  return v34;
}

- (id)_decodeBackupPropertiesWithValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = 0;
      id v4 = [(MBProperties *)[MBCKProperties alloc] initWithData:v3 error:&v9];
      id v5 = v9;
      if (v4)
      {
        id v6 = v4;
      }
      else
      {
        id v7 = MBGetDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v11 = v5;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to decode backup properties: %@", buf, 0xCu);
          _MBLog();
        }
      }
    }
    else
    {
      id v5 = MBGetDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Invalid type for backup properties: %@", buf, 0xCu);
        _MBLog();
      }
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (int64_t)_accountTypeFromAccountClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2) {
    __assert_rtn("+[MBCKSnapshot _accountTypeFromAccountClass:]", "MBCKSnapshot.m", 646, "0 && \"Unexpected value\"");
  }
  return a3;
}

+ (void)_createBaseRecordIDs:(id *)a3 pageCounts:(id *)a4 checksums:(id *)a5 fromReferences:(id)a6
{
  id v6 = a6;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v16 = [v15 baseRecordID];
        [v7 addObject:v16];

        double v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 pageCount]);
        [v8 addObject:v17];

        id v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v15 checksum]);
        [v9 addObject:v18];
      }
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  id v19 = v7;
  *a3 = v19;
  id v20 = v8;
  *a4 = v20;
  id v21 = v9;
  *a5 = v21;
}

+ (id)_createDomainReferencesFromBaseRecordIDs:(id)a3 pageCounts:(id)a4 checksums:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (char *)[v7 count];
  if (v10 != [v8 count]) {
    __assert_rtn("+[MBCKSnapshot _createDomainReferencesFromBaseRecordIDs:pageCounts:checksums:]", "MBCKSnapshot.m", 668, "baseRecordIDCount == pageCounts.count");
  }
  if (v10 != [v9 count]) {
    __assert_rtn("+[MBCKSnapshot _createDomainReferencesFromBaseRecordIDs:pageCounts:checksums:]", "MBCKSnapshot.m", 669, "baseRecordIDCount == checksums.count");
  }
  id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10];
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      uint64_t v13 = [v7 objectAtIndexedSubscript:i];
      uint64_t v14 = [v8 objectAtIndexedSubscript:i];
      id v15 = [v14 unsignedLongLongValue];

      v16 = [v9 objectAtIndexedSubscript:i];
      id v17 = [v16 unsignedLongLongValue];

      id v18 = [[MBCKSnapshotToDomainRecordReference alloc] initWithBaseRecordID:v13 pageCount:v15 checksum:v17];
      [v11 addObject:v18];
    }
  }

  return v11;
}

+ (id)_createDomainRecordQuotaFromBaseRecordIDs:(id)a3 domainQuotas:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (char *)[v5 count];
  if (v7 != [v6 count]) {
    __assert_rtn("+[MBCKSnapshot _createDomainRecordQuotaFromBaseRecordIDs:domainQuotas:]", "MBCKSnapshot.m", 684, "baseRecordIDCount == domainQuotas.count");
  }
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v7];
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      id v10 = [v5 objectAtIndexedSubscript:i];
      id v11 = [v6 objectAtIndexedSubscript:i];
      id v12 = [v11 unsignedLongLongValue];

      uint64_t v13 = +[MBDomainRecordQuota domainRecordQuotaWithBaseRecordID:v10 quota:v12];
      [v8 addObject:v13];
    }
  }

  return v8;
}

- (void)refreshWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordID];
  id v6 = [v5 recordName];
  [(MBCKSnapshot *)self setSnapshotID:v6];

  id v7 = [v4 objectForKeyedSubscript:@"originalSnapshotID"];
  commitID = self->_commitID;
  self->_commitID = v7;

  id v9 = [v4 objectForKeyedSubscript:@"manifestIDs"];
  manifestIDs = self->_manifestIDs;
  self->_manifestIDs = v9;

  id v11 = [v4 objectForKeyedSubscript:@"manifestChecksums"];
  manifestChecksums = self->_manifestChecksums;
  self->_manifestChecksums = v11;

  uint64_t v13 = [v4 objectForKeyedSubscript:@"backupReason"];
  self->_backupReason = (int)[v13 intValue];

  uint64_t v14 = [v4 objectForKeyedSubscript:@"backupType"];
  self->_type = (int)[v14 intValue];

  id v15 = [v4 objectForKeyedSubscript:@"backupPolicy"];
  self->_backupPolicy = (int64_t)[v15 integerValue];

  v16 = [v4 objectForKeyedSubscript:@"snapshotFormat"];
  self->_snapshotFormat = (int64_t)[v16 integerValue];

  id v17 = [v4 objectForKeyedSubscript:@"deviceName"];
  [(MBCKSnapshot *)self setDeviceName:v17];

  id v18 = [v4 objectForKeyedSubscript:@"buildVersion"];
  buildVersion = self->_buildVersion;
  self->_buildVersion = v18;

  id v20 = [v4 objectForKeyedSubscript:@"productVersion"];
  productVersion = self->_productVersion;
  self->_productVersion = v20;

  id v22 = [v4 objectForKeyedSubscript:@"quotaUsed"];
  self->_quotaUsed = (int64_t)[v22 longLongValue];

  v23 = [v4 modificationDate];
  modificationDate = self->_modificationDate;
  self->_modificationDate = v23;

  long long v25 = [v4 encryptedValues];
  long long v26 = [v25 objectForKeyedSubscript:@"backupProperties"];

  long long v27 = [(MBCKSnapshot *)self _decodeBackupPropertiesWithValue:v26];
  long long v28 = [v27 requiredProductVersion];
  requiredProductVersion = self->_requiredProductVersion;
  self->_requiredProductVersion = v28;

  uint64_t v30 = [v4 objectForKeyedSubscript:@"domainBaseRecordIDs"];
  id v76 = [v4 objectForKeyedSubscript:@"domainRecordCounts"];
  id v75 = [v4 objectForKeyedSubscript:@"domainRecordCumulativeChecksums"];
  id v31 = MBGetDefaultLog();
  id v74 = v27;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = [(MBCKSnapshot *)self snapshotID];
    *(_DWORD *)buf = 138412546;
    long long v84 = v32;
    __int16 v85 = 2112;
    uint64_t v86 = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Snapshot %@ refreshWithRecord->domainBaseRecordIDs: %@", buf, 0x16u);

    char v67 = [(MBCKSnapshot *)self snapshotID];
    uint64_t v68 = v30;
    _MBLog();

    long long v27 = v74;
  }

  id v33 = [(id)objc_opt_class() _createDomainReferencesFromBaseRecordIDs:v30 pageCounts:v76 checksums:v75];
  modifiedDomainRecordReferences = self->_modifiedDomainRecordReferences;
  self->_modifiedDomainRecordReferences = v33;

  id v73 = [v4 objectForKeyedSubscript:@"domainQuota"];
  if (v73 && self->_snapshotFormat == 3)
  {
    id v35 = [(id)objc_opt_class() _createDomainRecordQuotaFromBaseRecordIDs:v30 domainQuotas:v73];
    domainRecordQuotas = self->_domainRecordQuotas;
    self->_domainRecordQuotas = v35;
  }
  else
  {
    domainRecordQuotas = self->_domainRecordQuotas;
    self->_domainRecordQuotas = 0;
  }

  id v37 = [v4 objectForKeyedSubscript:@"domainHMACsToRemove"];
  domainHmacsToRemove = self->_domainHmacsToRemove;
  self->_domainHmacsToRemove = v37;

  id v39 = [v27 accountType];
  id v40 = v39;
  if (v39)
  {
    id v41 = [v39 integerValue];
    self->_accountType = (int64_t)v41;
    if (v41) {
      goto LABEL_9;
    }
LABEL_33:
    __assert_rtn("-[MBCKSnapshot refreshWithRecord:]", "MBCKSnapshot.m", 736, "_accountType != MBAccountTypeUnspecified");
  }
  v65 = [v27 accountClass];
  if (v65) {
    int64_t v66 = (int64_t)objc_msgSend((id)objc_opt_class(), "_accountTypeFromAccountClass:", objc_msgSend(v65, "integerValue"));
  }
  else {
    int64_t v66 = 1;
  }
  self->_accountType = v66;

  if (!self->_accountType) {
    goto LABEL_33;
  }
LABEL_9:
  uint64_t v69 = v40;
  id v70 = (void *)v30;
  id v71 = v26;
  objc_storeStrong((id *)&self->_backupProperties, v26);
  BOOL v42 = [v4 objectForKeyedSubscript:@"cameraRollBackupState"];
  self->_cameraRollBackupState = (int64_t)[v42 integerValue];

  uint64_t v43 = [v4 objectForKeyedSubscript:@"backupAllowedOnCellular"];
  self->_isBackupAllowedOnCellular = [v43 BOOLValue];

  id v72 = v4;
  v44 = [v4 objectForKeyedSubscript:@"manifestCounts"];
  id v45 = (NSMutableDictionary *)objc_opt_new();
  manifestIDsToCounts = self->_manifestIDsToCounts;
  self->_manifestIDsToCounts = v45;

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v47 = self->_manifestIDs;
  id v48 = [(NSArray *)v47 countByEnumeratingWithState:&v78 objects:v82 count:16];
  if (v48)
  {
    id v49 = v48;
    int v50 = 0;
    uint64_t v51 = *(void *)v79;
LABEL_11:
    uint64_t v52 = 0;
    uint64_t v53 = v50;
    while (1)
    {
      if (*(void *)v79 != v51) {
        objc_enumerationMutation(v47);
      }
      uint64_t v54 = *(void *)(*((void *)&v78 + 1) + 8 * v52);
      if ([(NSArray *)v44 count] <= v53 + v52) {
        break;
      }
      long long v55 = [(NSArray *)v44 objectAtIndexedSubscript:v53 + v52];
      [(NSMutableDictionary *)self->_manifestIDsToCounts setObject:v55 forKeyedSubscript:v54];

      if (v49 == (id)++v52)
      {
        id v49 = [(NSArray *)v47 countByEnumeratingWithState:&v78 objects:v82 count:16];
        int v50 = v53 + v52;
        if (v49) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  long long v56 = [(NSArray *)self->_manifestIDs count];
  if (v56 != (void *)[(NSArray *)self->_manifestChecksums count]
    || (id v57 = [(NSArray *)self->_manifestIDs count], v57 != (id)[(NSArray *)v44 count]))
  {
    v58 = MBGetDefaultLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      snapshotID = self->_snapshotID;
      *(_DWORD *)buf = 138412290;
      long long v84 = (NSArray *)snapshotID;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Snapshot refreshWithRecord: %@ parallel array count mismatch", buf, 0xCu);
      char v67 = self->_snapshotID;
      _MBLog();
    }

    uint64_t v60 = MBGetDefaultLog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = self->_manifestIDs;
      *(_DWORD *)buf = 138412290;
      long long v84 = v61;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "manifestIDs: %@", buf, 0xCu);
      char v67 = self->_manifestIDs;
      _MBLog();
    }

    id v62 = MBGetDefaultLog();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v84 = v44;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "manifestCounts: %@", buf, 0xCu);
      char v67 = v44;
      _MBLog();
    }

    id v63 = MBGetDefaultLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      id v64 = self->_manifestChecksums;
      *(_DWORD *)buf = 138412290;
      long long v84 = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "manifestChecksums: %@", buf, 0xCu);
      char v67 = self->_manifestChecksums;
      _MBLog();
    }
  }
  self->_hasFetchedManifests = 0;
  v77.receiver = self;
  v77.super_class = (Class)MBCKSnapshot;
  -[MBCKModel refreshWithRecord:](&v77, "refreshWithRecord:", v72, v67);
}

- (id)_getRecordIDString
{
  id v4 = [(MBCKSnapshot *)self snapshotID];

  if (!v4)
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MBCKSnapshot.m" lineNumber:766 description:@"Snapshot is missing an identifier"];
  }
  id v5 = objc_alloc((Class)NSString);
  id v6 = [(MBCKSnapshot *)self snapshotID];
  id v7 = [v5 initWithFormat:@"S:%@", v6];

  return v7;
}

- (id)recordType
{
  return @"Snapshot";
}

- (unint64_t)recordZone
{
  return 2;
}

- (id)description
{
  id v17 = objc_alloc((Class)NSString);
  v18.receiver = self;
  v18.super_class = (Class)MBCKSnapshot;
  v16 = [(MBCKSnapshot *)&v18 description];
  id v15 = [(MBCKSnapshot *)self snapshotID];
  uint64_t v14 = [(MBCKSnapshot *)self commitID];
  uint64_t v13 = [(MBCKSnapshot *)self created];
  int64_t v12 = [(MBCKSnapshot *)self backupReason];
  int64_t v11 = [(MBCKSnapshot *)self type];
  int64_t v10 = [(MBCKSnapshot *)self backupPolicy];
  int64_t v9 = [(MBCKSnapshot *)self snapshotFormat];
  id v3 = [(MBCKSnapshot *)self deviceName];
  id v4 = [(MBCKSnapshot *)self buildVersion];
  id v5 = [(MBCKSnapshot *)self productVersion];
  id v6 = [(MBCKSnapshot *)self requiredProductVersion];
  id v7 = objc_msgSend(v17, "initWithFormat:", @"%@ <%@, commitID=%@, created=%@, backupReason=%d, type=%d, backupPolicy=%ld, format=%lld deviceName=%@, buildVersion=%@, productVersion=%@, requiredProductVersion=%@, cameraRollBackupState=%ld, isBackupAllowedOnCellular=%ld, quotaUsed=%lld, estimatedRestoreSize=%llu, accountType=%ld, modifiedDomainRefs=%lu>", v16, v15, v14, v13, v12, v11, v10, v9, v3, v4, v5, v6, -[MBCKSnapshot cameraRollBackupState](self, "cameraRollBackupState"), -[MBCKSnapshot isBackupAllowedOnCellular](self, "isBackupAllowedOnCellular"), -[MBCKSnapshot quotaUsed](self, "quotaUsed"), -[MBCKSnapshot estimatedRestoreSize](self, "estimatedRestoreSize"),
         [(MBCKSnapshot *)self accountType],
         [(NSArray *)self->_modifiedDomainRecordReferences count]);

  return v7;
}

- (BOOL)addDomainRecordIDsFromPendingSnapshotDatabase:(id)a3 attemptSummary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 performSanityChecksBeforeCommitWithError:a5])
  {
    int64_t v10 = objc_opt_new();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    int64_t v12 = [WeakRetained domainHMACsToRepair];

    if ([v12 count]) {
      id v13 = [v12 mutableCopy];
    }
    else {
      id v13 = 0;
    }
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10006B638;
    v51[3] = &unk_1004113D0;
    id v15 = v10;
    id v52 = v15;
    id v16 = v9;
    id v53 = v16;
    id v17 = v12;
    id v54 = v17;
    id v18 = v13;
    id v55 = v18;
    if (![v8 enumerateUploadedDomains:a5 block:v51])
    {
      BOOL v14 = 0;
LABEL_22:

      goto LABEL_23;
    }
    id obj = v10;
    id v19 = objc_opt_new();
    if (MBSnapshotTypeIsFull())
    {
      id v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        MBStringForSnapshotType();
        id v22 = v21 = v19;
        *(_DWORD *)buf = 138412290;
        id v57 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=commit= Not marking any domains to delete for snapshot type: %@", buf, 0xCu);

        id v38 = MBStringForSnapshotType();
        _MBLog();

        id v19 = v21;
      }
    }
    else
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10006B7E8;
      v46[3] = &unk_1004113F8;
      v44 = v19;
      id v23 = v19;
      id v47 = v23;
      id v43 = v16;
      id v48 = v43;
      id v24 = v17;
      id v49 = v24;
      id v42 = v18;
      id v50 = v42;
      unsigned int v25 = [v8 enumerateDomainsDeletedSincePreviousSnapshot:a5 block:v46];
      if ([v24 count])
      {
        unsigned int v41 = v25;
        [v23 unionSet:v24];
        long long v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v40 = [v24 allObjects];
          long long v27 = objc_msgSend(v40, "sortedArrayUsingSelector:");
          long long v28 = [v27 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138412290;
          id v57 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "=domain repair= Repaired domain HMACs: %@", buf, 0xCu);

          id v29 = [v24 allObjects];
          uint64_t v30 = [v29 sortedArrayUsingSelector:"compare:"];
          id v39 = [v30 componentsJoinedByString:@", "];
          _MBLog();
        }
        [v43 setUnknownDomainHMACsToRepair:v42];
        unsigned int v25 = v41;
      }

      id v19 = v44;
      if (!v25)
      {
        BOOL v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    id v31 = MBGetDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = v19;
      id v33 = [v15 count];
      id v34 = [v32 count];
      *(_DWORD *)buf = 134218240;
      id v57 = v33;
      __int16 v58 = 2048;
      id v59 = v34;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "=commit= Finished marking domains in snapshot - modified:%lu deleted:%lu", buf, 0x16u);
      [v15 count];
      [v32 count];
      id v19 = v32;
      _MBLog();
    }

    objc_storeStrong((id *)&self->_modifiedDomainRecordReferences, obj);
    id v35 = [v19 allObjects];
    domainHmacsToRemove = self->_domainHmacsToRemove;
    self->_domainHmacsToRemove = v35;

    BOOL v14 = 1;
    goto LABEL_21;
  }
  BOOL v14 = 0;
LABEL_23:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MBCKSnapshot;
  [(MBCKModel *)&v17 encodeWithCoder:v4];
  id v6 = [(MBCKSnapshot *)self snapshotID];
  [v4 encodeObject:v6 forKey:@"SnapshotID"];

  id v7 = [(MBCKSnapshot *)self deviceUUID];
  [v4 encodeObject:v7 forKey:@"DeviceUUID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MBCKSnapshot committed](self, "committed"), @"SnapshotCommitted");
  id v8 = [(MBCKSnapshot *)self created];
  [v4 encodeObject:v8 forKey:@"SnapshotCreated"];

  id v9 = [(MBCKSnapshot *)self manifestIDs];
  [v4 encodeObject:v9 forKey:@"ManifestIDs"];

  int64_t v10 = [(MBCKSnapshot *)self manifestChecksums];
  [v4 encodeObject:v10 forKey:@"ManifestChecksums"];

  int64_t v11 = [(MBCKSnapshot *)self deviceName];
  [v4 encodeObject:v11 forKey:@"DeviceName"];

  int64_t v12 = [(MBCKSnapshot *)self buildVersion];
  [v4 encodeObject:v12 forKey:@"BuildVersion"];

  id v13 = [(MBCKSnapshot *)self productVersion];
  [v4 encodeObject:v13 forKey:@"ProductVersion"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MBCKSnapshot backupReason](self, "backupReason"), @"BackupReason");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MBCKSnapshot type](self, "type"), @"BackupType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MBCKSnapshot backupPolicy](self, "backupPolicy"), @"BackupPolicy");
  objc_msgSend(v4, "encodeInt64:forKey:", -[MBCKSnapshot quotaUsed](self, "quotaUsed"), @"SnapshotQuotaUsed");
  BOOL v14 = [(MBCKSnapshot *)self modificationDate];
  [v4 encodeObject:v14 forKey:@"SnapshotModificationDate"];

  id v15 = [(MBCKSnapshot *)self backupProperties];
  [v4 encodeObject:v15 forKey:@"BackupProperties"];

  id v16 = [(MBCKSnapshot *)self requiredProductVersion];
  [v4 encodeObject:v16 forKey:@"RequiredProductVersion"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MBCKSnapshot cameraRollBackupState](self, "cameraRollBackupState"), @"CameraRollBackupState");
  objc_msgSend(v4, "encodeBool:forKey:", -[MBCKSnapshot isBackupAllowedOnCellular](self, "isBackupAllowedOnCellular"), @"IsBackupAllowedOnCellular");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MBCKSnapshot accountType](self, "accountType"), @"AccountType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MBCKSnapshot snapshotFormat](self, "snapshotFormat"), @"SnapshotFormat");
}

- (MBCKSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MBCKSnapshot;
  id v6 = [(MBCKModel *)&v34 initWithCoder:v4];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SnapshotID"];
    snapshotID = v6->_snapshotID;
    v6->_snapshotID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceUUID"];
    deviceUUID = v6->_deviceUUID;
    v6->_deviceUUID = (NSString *)v9;

    v6->_committed = [v4 decodeBoolForKey:@"SnapshotCommitted"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SnapshotCreated"];
    created = v6->_created;
    v6->_created = (NSDate *)v11;

    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    id v13 = +[NSArray arrayWithObjects:v36 count:2];
    BOOL v14 = +[NSSet setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"ManifestIDs"];
    manifestIDs = v6->_manifestIDs;
    v6->_manifestIDs = (NSArray *)v15;

    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v35[2] = objc_opt_class();
    objc_super v17 = +[NSArray arrayWithObjects:v35 count:3];
    id v18 = +[NSSet setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"ManifestChecksums"];
    manifestChecksums = v6->_manifestChecksums;
    v6->_manifestChecksums = (NSArray *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceName"];
    [(MBCKSnapshot *)v6 setDeviceName:v21];

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BuildVersion"];
    buildVersion = v6->_buildVersion;
    v6->_buildVersion = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductVersion"];
    productVersion = v6->_productVersion;
    v6->_productVersion = (NSString *)v24;

    v6->_backupReason = (int64_t)[v4 decodeIntegerForKey:@"BackupReason"];
    v6->_type = (int64_t)[v4 decodeIntegerForKey:@"BackupType"];
    v6->_backupPolicy = (int64_t)[v4 decodeIntegerForKey:@"BackupPolicy"];
    v6->_quotaUsed = (int64_t)[v4 decodeInt64ForKey:@"SnapshotQuotaUsed"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SnapshotModificationDate"];
    modificationDate = v6->_modificationDate;
    v6->_modificationDate = (NSDate *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BackupProperties"];
    backupProperties = v6->_backupProperties;
    v6->_backupProperties = (NSData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequiredProductVersion"];
    requiredProductVersion = v6->_requiredProductVersion;
    v6->_requiredProductVersion = (NSString *)v30;

    v6->_cameraRollBackupState = (int64_t)[v4 decodeIntegerForKey:@"CameraRollBackupState"];
    v6->_isBackupAllowedOnCellular = [v4 decodeBoolForKey:@"IsBackupAllowedOnCellular"];
    v6->_accountType = (int64_t)[v4 decodeIntegerForKey:@"AccountType"];
    v6->_snapshotFormat = (int64_t)[v4 decodeIntegerForKey:@"SnapshotFormat"];
  }
  id v32 = v6;

  return v32;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (NSString)commitID
{
  return self->_commitID;
}

- (BOOL)committed
{
  return self->_committed;
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (void)setCreated:(id)a3
{
}

- (NSArray)manifestIDs
{
  return self->_manifestIDs;
}

- (NSArray)manifestChecksums
{
  return self->_manifestChecksums;
}

- (NSArray)modifiedDomainRecordReferences
{
  return self->_modifiedDomainRecordReferences;
}

- (NSArray)domainRecordQuotas
{
  return self->_domainRecordQuotas;
}

- (NSArray)domainHmacsToRemove
{
  return self->_domainHmacsToRemove;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)requiredProductVersion
{
  return self->_requiredProductVersion;
}

- (int64_t)snapshotFormat
{
  return self->_snapshotFormat;
}

- (int64_t)backupReason
{
  return self->_backupReason;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)backupPolicy
{
  return self->_backupPolicy;
}

- (void)setBackupPolicy:(int64_t)a3
{
  self->_backupPolicy = a3;
}

- (int64_t)quotaUsed
{
  return self->_quotaUsed;
}

- (BOOL)hasFetchedManifests
{
  return self->_hasFetchedManifests;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSData)backupProperties
{
  return self->_backupProperties;
}

- (void)setBackupProperties:(id)a3
{
}

- (int64_t)cameraRollBackupState
{
  return self->_cameraRollBackupState;
}

- (void)setCameraRollBackupState:(int64_t)a3
{
  self->_cameraRollBackupState = a3;
}

- (BOOL)isBackupAllowedOnCellular
{
  return self->_isBackupAllowedOnCellular;
}

- (void)setIsBackupAllowedOnCellular:(BOOL)a3
{
  self->_isBackupAllowedOnCellular = a3;
}

- (BOOL)isInherited
{
  return self->_isInherited;
}

- (void)setIsInherited:(BOOL)a3
{
  self->_isInherited = a3;
}

- (int64_t)estimatedRestoreSize
{
  return self->_estimatedRestoreSize;
}

- (void)setEstimatedRestoreSize:(int64_t)a3
{
  self->_estimatedRestoreSize = a3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (BOOL)testCommitRepairChecksumOnLightrailChecksumMismatch
{
  return self->_testCommitRepairChecksumOnLightrailChecksumMismatch;
}

- (void)setTestCommitRepairChecksumOnLightrailChecksumMismatch:(BOOL)a3
{
  self->_testCommitRepairChecksumOnLightrailChecksumMismatch = a3;
}

- (NSMutableDictionary)manifestIDsToCounts
{
  return self->_manifestIDsToCounts;
}

- (void)setManifestIDsToCounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestIDsToCounts, 0);
  objc_storeStrong((id *)&self->_backupProperties, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_requiredProductVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_domainHmacsToRemove, 0);
  objc_storeStrong((id *)&self->_domainRecordQuotas, 0);
  objc_storeStrong((id *)&self->_modifiedDomainRecordReferences, 0);
  objc_storeStrong((id *)&self->_manifestChecksums, 0);
  objc_storeStrong((id *)&self->_manifestIDs, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_commitID, 0);
  objc_storeStrong((id *)&self->_snapshotID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_manifestsByDomainName, 0);
}

@end