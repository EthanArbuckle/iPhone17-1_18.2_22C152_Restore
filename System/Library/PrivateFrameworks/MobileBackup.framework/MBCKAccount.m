@interface MBCKAccount
+ (double)timeoutIntervalForFetch;
+ (id)fetchAccountWithOperationTracker:(id)a3 cache:(id)a4 create:(BOOL)a5 error:(id *)a6;
+ (id)fetchAccountWithOperationTracker:(id)a3 cache:(id)a4 error:(id *)a5;
+ (id)fetchDeviceRecordAndSnapshots:(id)a3 account:(id)a4 manager:(id)a5 tracker:(id)a6 error:(id *)a7;
- (BOOL)addDevice:(id)a3 error:(id *)a4;
- (BOOL)backupsDisabledFromAnotherDeviceForUUID:(id)a3;
- (BOOL)deleteDeviceWithOperationTracker:(id)a3 deviceUUID:(id)a4 error:(id *)a5;
- (BOOL)fetchDevicesWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)hasDevice:(id)a3;
- (BOOL)hasFetchedDevices;
- (BOOL)isFetched;
- (BOOL)setupDeviceWithOperationTracker:(id)a3 deviceUUID:(id)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)setupDeviceWithOperationTracker:(id)a3 deviceUUID:(id)a4 passcode:(id)a5 hasNewOTAKeyBag:(BOOL *)a6 error:(id *)a7;
- (MBCKAccount)initWithRecord:(id)a3;
- (MBCKAccount)initWithRecord:(id)a3 cache:(id)a4;
- (NSData)hmacKey;
- (NSDictionary)devicesByUUID;
- (NSMutableArray)deviceRefs;
- (id)_getRecordIDString;
- (id)deviceForUUID:(id)a3;
- (id)mergeRecordsWithOperationTracker:(id)a3 serverRecord:(id)a4 originalRecord:(id)a5;
- (id)recordRepresentation;
- (id)recordType;
- (unint64_t)recordZone;
- (void)fetchDevicesWithOperationTracker:(id)a3 completion:(id)a4;
- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4;
- (void)refreshWithRecord:(id)a3;
- (void)removeDeviceForUUID:(id)a3;
- (void)saveToCacheWithCompletion:(id)a3;
- (void)setDeviceRefs:(id)a3;
- (void)setHasFetchedDevices:(BOOL)a3;
- (void)setHmacKey:(id)a3;
- (void)setIsFetched:(BOOL)a3;
@end

@implementation MBCKAccount

+ (id)fetchAccountWithOperationTracker:(id)a3 cache:(id)a4 create:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (!v10) {
    __assert_rtn("+[MBCKAccount fetchAccountWithOperationTracker:cache:create:error:]", "MBCKAccount.m", 48, "tracker");
  }
  v12 = v11;
  v13 = [v10 account];
  if (!v13) {
    __assert_rtn("+[MBCKAccount fetchAccountWithOperationTracker:cache:create:error:]", "MBCKAccount.m", 50, "serviceAccount");
  }
  uint64_t v53 = 0;
  v54 = (id *)&v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_100107B70;
  v57 = sub_100107B80;
  id v58 = 0;
  [a1 timeoutIntervalForFetch];
  double v15 = v14;
  v16 = [v10 ckOperationPolicy];
  v17 = v16;
  if (!v16) {
    __assert_rtn("+[MBCKAccount fetchAccountWithOperationTracker:cache:create:error:]", "MBCKAccount.m", 55, "policy");
  }
  [v16 timeoutIntervalForFetch];
  if (v15 == v18)
  {
    id v19 = v17;
LABEL_8:
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = sub_100107B70;
    v50 = sub_100107B80;
    id v51 = 0;
    id v22 = objc_alloc((Class)CKRecordID);
    v23 = [v10 syncZoneID];
    id v24 = [v22 initWithRecordName:@"BackupAccount" zoneID:v23];

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100107B88;
    v42[3] = &unk_1004136B0;
    v44 = &v53;
    v45 = &v46;
    v25 = dispatch_semaphore_create(0);
    v43 = v25;
    [v10 fetchRecordWithID:v24 completion:v42];
    MBSemaphoreWaitForever();
    if (v47[5])
    {
      v26 = [MBCKAccount alloc];
      v27 = [(MBCKAccount *)v26 initWithRecord:v47[5] cache:v12];
    }
    else if (v7 {
           && +[MBError isError:v54[5] withCode:204])
    }
    {
      v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Resetting the cache - creating a new account", buf, 2u);
        _MBLog();
      }

      v29 = +[MBCKManager sharedInstance];
      [v29 resetCacheWithAccount:v13 error:0];

      v30 = +[MBCKManager sharedInstance];
      v31 = v54 + 5;
      id v41 = v54[5];
      uint64_t v32 = [v30 openCacheWithAccount:v13 accessType:1 error:&v41];
      objc_storeStrong(v31, v41);

      if (!v32)
      {
        v37 = MBGetDefaultLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          id v38 = v54[5];
          *(_DWORD *)buf = 138412290;
          id v60 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to open the cache: %@", buf, 0xCu);
          _MBLog();
        }

        v12 = 0;
        v27 = 0;
        if (!a6) {
          goto LABEL_26;
        }
LABEL_25:
        v27 = 0;
        *a6 = v54[5];
LABEL_26:

        _Block_object_dispose(&v46, 8);
        goto LABEL_27;
      }
      v27 = [[MBCKAccount alloc] initWithRecord:0 cache:v32];
      [(MBCKAccount *)v27 setIsFetched:1];
      id v40 = 0;
      unsigned __int8 v33 = [(MBCKModel *)v27 saveWithOperationTracker:v10 error:&v40];
      id v34 = v40;
      id v39 = v40;
      if ((v33 & 1) == 0)
      {
        v35 = MBGetDefaultLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v60 = v39;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to save account record: %@", buf, 0xCu);
          _MBLog();
        }

        objc_storeStrong(v54 + 5, v34);
        v27 = 0;
      }

      v12 = (void *)v32;
    }
    else
    {
      v27 = 0;
    }
    if (!a6 || v27) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  id v19 = [v17 copy];

  [v19 setTimeoutIntervalForFetch:v15];
  v20 = v54 + 5;
  id obj = v54[5];
  uint64_t v21 = +[MBCKOperationTracker operationTrackerWithParentTracker:v10 policy:v19 error:&obj];
  objc_storeStrong(v20, obj);

  if (v21)
  {
    id v10 = (id)v21;
    goto LABEL_8;
  }
  v27 = 0;
  if (a6) {
    *a6 = v54[5];
  }
LABEL_27:

  _Block_object_dispose(&v53, 8);
  return v27;
}

+ (id)fetchAccountWithOperationTracker:(id)a3 cache:(id)a4 error:(id *)a5
{
  return [a1 fetchAccountWithOperationTracker:a3 cache:a4 create:0 error:a5];
}

- (MBCKAccount)initWithRecord:(id)a3 cache:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MBCKAccount;
  v5 = [(MBCKModel *)&v12 initWithRecord:a3 cache:a4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    devicesByUUID = v5->_devicesByUUID;
    v5->_devicesByUUID = (NSMutableDictionary *)v6;

    if (!v5->_hmacKey)
    {
      if (CCRandomGenerateBytes(bytes, 0x14uLL))
      {
        p_super = MBGetDefaultLog();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Unable to generate account hmac key", v11, 2u);
          _MBLog();
        }
      }
      else
      {
        v9 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:bytes length:20];
        p_super = &v5->_hmacKey->super;
        v5->_hmacKey = v9;
      }
    }
    if (a3) {
      [(MBCKAccount *)v5 setIsFetched:1];
    }
  }
  return v5;
}

- (MBCKAccount)initWithRecord:(id)a3
{
  return [(MBCKAccount *)self initWithRecord:a3 cache:0];
}

- (BOOL)hasDevice:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_devicesByUUID objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)deviceForUUID:(id)a3
{
  return [(NSMutableDictionary *)self->_devicesByUUID objectForKeyedSubscript:a3];
}

- (void)removeDeviceForUUID:(id)a3
{
  id v5 = a3;
  BOOL v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devicesByUUID, "objectForKeyedSubscript:");

  if (v4) {
    [(MBCKModel *)self setIsPersistedToServer:0];
  }
  [(NSMutableDictionary *)self->_devicesByUUID removeObjectForKey:v5];
}

- (BOOL)addDevice:(id)a3 error:(id *)a4
{
  devicesByUUID = self->_devicesByUUID;
  id v6 = a3;
  BOOL v7 = [v6 deviceUUID];
  v8 = [(NSMutableDictionary *)devicesByUUID objectForKeyedSubscript:v7];

  if (!v8) {
    [(MBCKModel *)self setIsPersistedToServer:0];
  }
  v9 = self->_devicesByUUID;
  id v10 = [v6 deviceUUID];
  [(NSMutableDictionary *)v9 setObject:v6 forKeyedSubscript:v10];

  return 1;
}

- (BOOL)deleteDeviceWithOperationTracker:(id)a3 deviceUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBCKAccount deleteDeviceWithOperationTracker:deviceUUID:error:]", "MBCKAccount.m", 169, "tracker");
  }
  id v10 = v9;
  id v11 = [(NSMutableDictionary *)self->_devicesByUUID objectForKeyedSubscript:v9];
  if (v11)
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    id v34 = sub_100107B70;
    v35 = sub_100107B80;
    id v36 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    id v13 = objc_alloc((Class)CKModifyRecordsOperation);
    double v14 = [v11 recordID];
    v37 = v14;
    double v15 = +[NSArray arrayWithObjects:&v37 count:1];
    id v16 = [v13 initWithRecordsToSave:0 recordIDsToDelete:v15];

    objc_initWeak(&location, v16);
    uint64_t v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_1001082D4;
    id v24 = &unk_1004136D8;
    objc_copyWeak(&v29, &location);
    v28 = &v31;
    v25 = self;
    id v26 = v10;
    v17 = v12;
    v27 = v17;
    [v16 setModifyRecordsCompletionBlock:&v21];
    objc_msgSend(v8, "addDatabaseOperation:", v16, v21, v22, v23, v24, v25);
    MBSemaphoreWaitForever();
    double v18 = (void *)v32[5];
    BOOL v19 = v18 == 0;
    if (a5 && v18) {
      *a5 = v18;
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v31, 8);
  }
  else if (a5)
  {
    +[MBError errorWithCode:1 format:@"No such device"];
    BOOL v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)fetchDevicesWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKAccount fetchDevicesWithOperationTracker:completion:]", "MBCKAccount.m", 203, "tracker");
  }
  id v8 = (void (**)(void, void))v7;
  if (!v7) {
    __assert_rtn("-[MBCKAccount fetchDevicesWithOperationTracker:completion:]", "MBCKAccount.m", 204, "completion");
  }
  if ([(MBCKAccount *)self hasFetchedDevices])
  {
    v8[2](v8, 0);
  }
  else
  {
    id v9 = [(MBCKAccount *)self deviceRefs];
    id v10 = [v9 copy];

    if ([v10 count])
    {
      id v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fetching devices from the server: %@", buf, 0xCu);
        _MBLog();
      }

      uint64_t v12 = objc_opt_class();
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100108644;
      v13[3] = &unk_100413700;
      v13[4] = self;
      id v14 = v10;
      double v15 = v8;
      [(MBCKModel *)self fetchFromServerWithOperationTracker:v6 childrenOfClass:v12 refs:v14 completion:v13];
    }
    else
    {
      self->_hasFetchedDevices = 1;
      v8[2](v8, 0);
    }
  }
}

- (BOOL)fetchDevicesWithOperationTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100107B70;
  id v17 = sub_100107B80;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100108964;
  v10[3] = &unk_100410FC8;
  uint64_t v12 = &v13;
  id v7 = dispatch_semaphore_create(0);
  id v11 = v7;
  [(MBCKAccount *)self fetchDevicesWithOperationTracker:v6 completion:v10];
  MBSemaphoreWaitForever();
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v8 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)backupsDisabledFromAnotherDeviceForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKAccount *)self deviceForUUID:v4];
  id v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 backupsDisabledFromAnotherDevice];
  }
  else
  {
    BOOL v8 = [(MBCKModel *)self cache];
    id v9 = [v8 fetchMostRecentSnapshotForDevice:v4 error:0];
    unsigned __int8 v7 = v9 != 0;
  }
  return v7;
}

- (BOOL)setupDeviceWithOperationTracker:(id)a3 deviceUUID:(id)a4 passcode:(id)a5 hasNewOTAKeyBag:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12) {
    __assert_rtn("-[MBCKAccount setupDeviceWithOperationTracker:deviceUUID:passcode:hasNewOTAKeyBag:error:]", "MBCKAccount.m", 257, "tracker");
  }
  if (!a6) {
    __assert_rtn("-[MBCKAccount setupDeviceWithOperationTracker:deviceUUID:passcode:hasNewOTAKeyBag:error:]", "MBCKAccount.m", 258, "hasNewOTAKeyBag");
  }
  uint64_t v15 = v14;
  uint64_t v16 = [v12 account];
  if (!v16) {
    __assert_rtn("-[MBCKAccount setupDeviceWithOperationTracker:deviceUUID:passcode:hasNewOTAKeyBag:error:]", "MBCKAccount.m", 260, "serviceAccount");
  }
  id v17 = (void *)v16;
  *a6 = 0;
  if (![(MBCKAccount *)self hasFetchedDevices]
    && ![(MBCKAccount *)self fetchDevicesWithOperationTracker:v12 error:a7])
  {
    BOOL v34 = 0;
    goto LABEL_77;
  }
  id v18 = MBDeviceUUID();
  if (([v13 isEqualToString:v18] & 1) == 0)
  {
    if (a7)
    {
      +[MBError errorWithCode:1 format:@"Refusing to set up backups for non-local device"];
      BOOL v34 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v34 = 0;
    }
    goto LABEL_76;
  }
  v73 = a6;
  v80 = a7;
  v81 = [v17 accountIdentifier];
  BOOL v19 = [(MBCKAccount *)self devicesByUUID];
  v20 = [v19 objectForKeyedSubscript:v13];

  v79 = [(MBCKDevice *)v20 assetIDPrefix];

  v84 = v20;
  v82 = self;
  if (!v20)
  {
    v35 = MBGetDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v95 = v13;
      __int16 v96 = 2114;
      *(void *)v97 = v81;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No device record found for %{public}@ (%{public}@) - creating a new keybag and assetID prefix", buf, 0x16u);
      v64 = v13;
      id v68 = v81;
      _MBLog();
    }

    BOOL v36 = 0;
    goto LABEL_36;
  }
  id v76 = v12;
  v77 = v18;
  v74 = v15;
  id v75 = v13;
  v83 = v17;
  uint64_t v21 = [v17 persona];
  uint64_t v22 = [v21 volumesToBackUp];

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = v22;
  id v23 = [obj countByEnumeratingWithState:&v90 objects:v100 count:16];
  if (!v23)
  {
    v25 = 0;
    goto LABEL_30;
  }
  id v24 = v23;
  v25 = 0;
  uint64_t v26 = *(void *)v91;
  do
  {
    for (i = 0; i != v24; i = (char *)i + 1)
    {
      if (*(void *)v91 != v26) {
        objc_enumerationMutation(obj);
      }
      v28 = *(void **)(*((void *)&v90 + 1) + 8 * i);
      id v89 = 0;
      id v29 = +[MBKeyBag OTAKeybagUUIDStringWithVolume:error:](MBKeyBag, "OTAKeybagUUIDStringWithVolume:error:", v28, &v89, v64, v68, v71, v72);
      id v30 = v89;
      if (v29)
      {
        uint64_t v31 = [(MBCKDevice *)v20 keybagManager];
        unsigned int v32 = [v31 hasKeybagWithUUID:v29];

        v25 += v32;
        uint64_t v33 = MBGetDefaultLog();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 138544130;
        id v95 = v29;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = v32;
        *(_WORD *)&v97[4] = 2112;
        *(void *)&v97[6] = v28;
        __int16 v98 = 2114;
        v99 = v83;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Fetched OTAKeyBagUUID:%{public}@(%d) volumeMountPoint:%@ account:%{public}@", buf, 0x26u);
        v71 = v28;
        v72 = v83;
        v20 = v84;
        v64 = v29;
        id v68 = (id)v32;
      }
      else
      {
        uint64_t v33 = MBGetDefaultLog();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 138412546;
        id v95 = v28;
        __int16 v96 = 2112;
        *(void *)v97 = v30;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to fetch keybagUUID string for volume %@: %@", buf, 0x16u);
        v64 = v28;
        id v68 = v30;
      }
      _MBLog();
LABEL_19:
    }
    id v24 = [obj countByEnumeratingWithState:&v90 objects:v100 count:16];
  }
  while (v24);
LABEL_30:

  v37 = (char *)[obj count];
  BOOL v36 = v25 == v37;
  id v38 = MBGetDefaultLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    id v39 = [(MBCKDevice *)v84 assetIDPrefix];
    *(_DWORD *)buf = 138412290;
    id v95 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Fetched assetID prefix of %@ from device", buf, 0xCu);

    v64 = [(MBCKDevice *)v84 assetIDPrefix];
    _MBLog();
  }
  id v13 = v75;
  id v12 = v76;
  uint64_t v15 = v74;
  id v17 = v83;
  id v18 = v77;
  if (v25 == v37)
  {
    self = v82;
    if (v79)
    {
      id v40 = 0;
      BOOL v34 = 1;
      id v41 = v84;
      goto LABEL_75;
    }
  }
  else
  {
    self = v82;
  }
LABEL_36:
  v42 = [(MBCKModel *)self cache];
  id v88 = 0;
  [v42 propertyForKey:@"DeviceID" error:&v88];
  v44 = v43 = self;
  id obja = v88;

  if (!v44)
  {
    id v50 = [(MBCKModel *)v43 cache];
    id v51 = [v50 setProperty:v13 forKey:@"DeviceID"];
LABEL_44:

LABEL_45:
    id v41 = v84;
    if (!v84)
    {
      v52 = [MBCKDevice alloc];
      uint64_t v53 = [(MBCKModel *)v82 cache];
      id v41 = [(MBCKDevice *)v52 initWithUUID:v13 cache:v53 backupEnabled:1];
    }
    unsigned __int8 v54 = [(MBCKDevice *)v41 backupEnabled];
    [(MBCKDevice *)v41 setBackupEnabled:1];
    if (!v36)
    {
      uint64_t v55 = MBGetDefaultLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v95 = v13;
        __int16 v96 = 2114;
        *(void *)v97 = v81;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Setting up new keybag(s) for %{public}@ (%{public}@)", buf, 0x16u);
        id v66 = v13;
        v70 = v81;
        _MBLog();
      }

      if (![(MBCKDevice *)v41 setupKeybagWithOperationTracker:v12 passcode:v15 error:v80])
      {
        id v40 = obja;
        if ((v54 & 1) == 0) {
          [(MBCKDevice *)v41 setBackupEnabled:0];
        }
LABEL_65:
        BOOL v34 = 0;
        goto LABEL_74;
      }
      BOOL *v73 = 1;
    }
    v56 = v82;
    v57 = [(MBCKAccount *)v82 hmacKey];
    [(MBCKDevice *)v41 setHmacKey:v57];

    if (!v79)
    {
      id v58 = MBDeviceUUID();
      v59 = [v58 substringToIndex:4];

      id v60 = MBGetDefaultLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v95 = v59;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Generated assetID prefix for device: %@", buf, 0xCu);
        v67 = v59;
        _MBLog();
      }

      [(MBCKDevice *)v41 setAssetIDPrefix:v59];
      if (![(MBCKModel *)v41 saveWithOperationTracker:v12 error:v80])
      {
        v62 = MBGetDefaultLog();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Failed to save device with assetID prefix to server", buf, 2u);
          _MBLog();
        }

        goto LABEL_69;
      }

      v56 = v82;
    }
    if (-[MBCKAccount addDevice:error:](v56, "addDevice:error:", v41, v80, v67))
    {
      if ([(MBCKModel *)v56 saveWithOperationTracker:v12 error:v80])
      {
        BOOL v34 = 1;
        goto LABEL_73;
      }
      v61 = MBGetDefaultLog();
      id v40 = obja;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Unable to save account", buf, 2u);
        _MBLog();
      }

      goto LABEL_65;
    }
LABEL_69:
    BOOL v34 = 0;
    goto LABEL_73;
  }
  if ([v44 isEqualToString:v13]) {
    goto LABEL_45;
  }
  v78 = v18;
  v45 = MBGetDefaultLog();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v95 = v44;
    __int16 v96 = 2112;
    *(void *)v97 = v13;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "Resetting the cache- cached device:%@, deviceUUID:%@", buf, 0x16u);
    v65 = v44;
    id v69 = v13;
    _MBLog();
  }

  uint64_t v46 = +[MBCKManager sharedInstance];
  unsigned int v47 = [v46 resetCacheWithAccount:v17 error:v80];

  uint64_t v48 = +[MBCKManager sharedInstance];
  id v87 = 0;
  v49 = [v48 openCacheWithAccount:v17 accessType:1 error:&v87];
  id v50 = v87;

  [(MBCKModel *)v82 setCache:v49];
  [(MBCKModel *)v84 setCache:v49];
  if (v47)
  {
    if (v49)
    {

      id v18 = v78;
      goto LABEL_44;
    }
    if (v80) {
      id *v80 = v50;
    }
  }

  BOOL v34 = 0;
  id v18 = v78;
  id v41 = v84;
LABEL_73:
  id v40 = obja;
LABEL_74:

LABEL_75:
LABEL_76:

LABEL_77:
  return v34;
}

- (BOOL)setupDeviceWithOperationTracker:(id)a3 deviceUUID:(id)a4 passcode:(id)a5 error:(id *)a6
{
  char v7 = 0;
  return [(MBCKAccount *)self setupDeviceWithOperationTracker:a3 deviceUUID:a4 passcode:a5 hasNewOTAKeyBag:&v7 error:a6];
}

- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKAccount prepareForSaveWithOperationTracker:completion:]", "MBCKAccount.m", 374, "completion");
  }
  char v7 = v6;
  if (self->_hasFetchedDevices) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
  else {
    [(MBCKAccount *)self fetchDevicesWithOperationTracker:v8 completion:v6];
  }
}

- (void)saveToCacheWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(MBCKModel *)self cache];
  id v7 = 0;
  [v5 saveAccount:self error:&v7];
  id v6 = v7;

  v4[2](v4, v6);
}

- (id)recordRepresentation
{
  v30.receiver = self;
  v30.super_class = (Class)MBCKAccount;
  id v24 = [(MBCKModel *)&v30 recordRepresentation];
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableDictionary count](self->_devicesByUUID, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = self->_devicesByUUID;
  id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v9 = MBGetDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [(NSMutableDictionary *)self->_devicesByUUID objectForKeyedSubscript:v8];
          *(_DWORD *)buf = 138412546;
          uint64_t v32 = v8;
          __int16 v33 = 2112;
          BOOL v34 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Adding device record reference %@:%@ to account", buf, 0x16u);

          [(NSMutableDictionary *)self->_devicesByUUID objectForKeyedSubscript:v8];
          v22 = uint64_t v21 = v8;
          _MBLog();
        }
        id v11 = [(NSMutableDictionary *)self->_devicesByUUID objectForKeyedSubscript:v8];
        id v12 = objc_alloc((Class)CKReference);
        id v13 = [v11 recordID];
        id v14 = [v12 initWithRecordID:v13 action:0];
        [v3 addObject:v14];
      }
      id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v5);
  }

  [v24 setObject:v3 forKeyedSubscript:@"devices"];
  hmacKey = self->_hmacKey;
  if (!hmacKey)
  {
    v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MBCKAccount.m" lineNumber:399 description:@"No _hmacKey"];

    hmacKey = self->_hmacKey;
  }
  uint64_t v16 = objc_msgSend(v24, "encryptedValues", v21, v22);
  [v16 setObject:hmacKey forKeyedSubscript:@"HMACKey"];

  id v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v18;
    __int16 v33 = 2112;
    BOOL v34 = v24;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@ record representation: %@", buf, 0x16u);
    objc_opt_class();
    _MBLog();
  }

  return v24;
}

- (void)refreshWithRecord:(id)a3
{
  self->_hasFetchedDevices = 0;
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"devices"];
  [(MBCKAccount *)self setDeviceRefs:v5];

  uint64_t v6 = [v4 encryptedValues];
  id v7 = [v6 objectForKeyedSubscript:@"HMACKey"];
  [(MBCKAccount *)self setHmacKey:v7];

  v8.receiver = self;
  v8.super_class = (Class)MBCKAccount;
  [(MBCKModel *)&v8 refreshWithRecord:v4];
}

- (id)mergeRecordsWithOperationTracker:(id)a3 serverRecord:(id)a4 originalRecord:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 recordType];
  id v10 = [(MBCKAccount *)self recordType];
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    uint64_t v12 = MBDeviceUUID();
    id v13 = [(MBCKAccount *)self devicesByUUID];
    __int16 v33 = (void *)v12;
    uint64_t v32 = [v13 objectForKeyedSubscript:v12];

    id obj = [(NSMutableDictionary *)self->_devicesByUUID mutableCopy];
    p_hmacKey = &self->_hmacKey;
    id v15 = [(NSData *)self->_hmacKey copy];
    [(MBCKAccount *)self refreshWithRecord:v8];
    [(NSMutableDictionary *)self->_devicesByUUID removeAllObjects];
    if (![(MBCKAccount *)self fetchDevicesWithOperationTracker:v7 error:0])goto LABEL_10; {
    uint64_t v16 = [(MBCKAccount *)self devicesByUUID];
    }
    id v17 = [v16 count];
    uint64_t v18 = [(MBCKAccount *)self deviceRefs];
    id v19 = [v18 count];

    if (v17 == v19)
    {
      if (!*p_hmacKey) {
        objc_storeStrong((id *)p_hmacKey, v15);
      }
      v20 = v32;
      if (v32)
      {
        [v32 setHmacKey:*p_hmacKey];
        devicesByUUID = self->_devicesByUUID;
        uint64_t v22 = [v32 deviceUUID];
        [(NSMutableDictionary *)devicesByUUID setObject:v32 forKeyedSubscript:v22];
      }
      id v23 = [(MBCKAccount *)self recordRepresentation];
      id v24 = obj;
    }
    else
    {
LABEL_10:
      v25 = MBGetDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        long long v26 = [(MBCKAccount *)self devicesByUUID];
        long long v27 = [(MBCKAccount *)self deviceRefs];
        *(_DWORD *)buf = 138412546;
        v35 = v26;
        __int16 v36 = 2112;
        v37 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "|devicesByUUID| != |deviceRefs| %@ %@", buf, 0x16u);

        long long v28 = [(MBCKAccount *)self devicesByUUID];
        objc_super v30 = [(MBCKAccount *)self deviceRefs];
        _MBLog();
      }
      id v24 = obj;
      objc_storeStrong((id *)&self->_devicesByUUID, obj);
      objc_storeStrong((id *)p_hmacKey, v15);
      id v23 = 0;
      v20 = v32;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)_getRecordIDString
{
  return @"BackupAccount";
}

- (id)recordType
{
  return @"BackupAccount";
}

- (unint64_t)recordZone
{
  return 2;
}

+ (double)timeoutIntervalForFetch
{
  return 3600.0;
}

+ (id)fetchDeviceRecordAndSnapshots:(id)a3 account:(id)a4 manager:(id)a5 tracker:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = [a5 openCacheWithAccount:a4 accessType:1 error:a7];
  if (!v13)
  {
    id v18 = 0;
    goto LABEL_14;
  }
  id v14 = +[MBCKAccount fetchAccountWithOperationTracker:v12 cache:v13 error:a7];
  id v15 = v14;
  if (v14 && [v14 fetchDevicesWithOperationTracker:v12 error:a7])
  {
    uint64_t v16 = [v15 deviceForUUID:v11];
    id v17 = v16;
    if (v16)
    {
      if ([v16 fetchSnapshotsWithOperationTracker:v12 error:a7])
      {
        id v18 = v17;
LABEL_12:

        goto LABEL_13;
      }
    }
    else if (a7)
    {
      +[MBError errorWithCode:204, @"No device record found for %@", v11 format];
      id v18 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    id v18 = 0;
    goto LABEL_12;
  }
  id v18 = 0;
LABEL_13:

LABEL_14:
  return v18;
}

- (NSDictionary)devicesByUUID
{
  return &self->_devicesByUUID->super;
}

- (NSMutableArray)deviceRefs
{
  return self->_deviceRefs;
}

- (void)setDeviceRefs:(id)a3
{
}

- (NSData)hmacKey
{
  return self->_hmacKey;
}

- (void)setHmacKey:(id)a3
{
}

- (BOOL)isFetched
{
  return self->_isFetched;
}

- (void)setIsFetched:(BOOL)a3
{
  self->_isFetched = a3;
}

- (BOOL)hasFetchedDevices
{
  return self->_hasFetchedDevices;
}

- (void)setHasFetchedDevices:(BOOL)a3
{
  self->_hasFetchedDevices = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmacKey, 0);
  objc_storeStrong((id *)&self->_deviceRefs, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_devicesByUUID, 0);
}

@end