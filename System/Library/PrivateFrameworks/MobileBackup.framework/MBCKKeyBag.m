@interface MBCKKeyBag
+ (BOOL)setupKeybagForDevice:(id)a3 operationTracker:(id)a4 error:(id *)a5;
+ (BOOL)setupKeybagForDevice:(id)a3 operationTracker:(id)a4 passcode:(id)a5 error:(id *)a6;
+ (BOOL)unlockKeybag:(id)a3 accountType:(int64_t)a4 error:(id *)a5 block:(id)a6;
+ (MBCKKeyBag)keybagWithDevice:(id)a3 keybagUUID:(id)a4 operationTracker:(id)a5 error:(id *)a6;
+ (id)UUIDStringForKeyBagUUID:(id)a3;
+ (id)UUIDStringFromRecordID:(id)a3;
+ (id)recordIDStringWithUUID:(id)a3;
+ (id)recordIDStringWithUUIDString:(id)a3;
+ (id)recordType;
+ (unint64_t)recordZone;
- (BOOL)isEqual:(id)a3;
- (BOOL)unlockWithAccountType:(int64_t)a3 error:(id *)a4;
- (CKRecordID)recordID;
- (MBCKDevice)device;
- (MBCKKeyBag)initWithDictionary:(id)a3 device:(id)a4;
- (MBCKKeyBag)initWithRecord:(id)a3 device:(id)a4;
- (MBCKKeyBag)initWithUUID:(id)a3 data:(id)a4 secret:(id)a5 device:(id)a6;
- (MBKeyBag)keybag;
- (NSData)keybagData;
- (NSData)keybagUUID;
- (NSData)secret;
- (NSString)keybagUUIDString;
- (id)OTAKeybagWithError:(id *)a3;
- (id)_getRecordIDString;
- (id)recordRepresentation;
- (id)recordType;
- (int64_t)savePolicy;
- (unint64_t)hash;
- (unint64_t)recordZone;
- (void)lock;
- (void)refreshWithRecord:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation MBCKKeyBag

+ (BOOL)setupKeybagForDevice:(id)a3 operationTracker:(id)a4 error:(id *)a5
{
  return [a1 setupKeybagForDevice:a3 operationTracker:a4 passcode:0 error:a5];
}

+ (BOOL)setupKeybagForDevice:(id)a3 operationTracker:(id)a4 passcode:(id)a5 error:(id *)a6
{
  id v71 = a3;
  id v9 = a4;
  id v70 = a5;
  if (!v9) {
    __assert_rtn("+[MBCKKeyBag setupKeybagForDevice:operationTracker:passcode:error:]", "MBCKKeyBag.m", 43, "tracker");
  }
  if (!a6) {
    __assert_rtn("+[MBCKKeyBag setupKeybagForDevice:operationTracker:passcode:error:]", "MBCKKeyBag.m", 44, "error");
  }
  v68 = a6;
  v66 = v9;
  v10 = [v9 account];
  v69 = v10;
  if (!v10) {
    __assert_rtn("+[MBCKKeyBag setupKeybagForDevice:operationTracker:passcode:error:]", "MBCKKeyBag.m", 46, "serviceAccount");
  }
  v73 = [v10 accountIdentifier];
  v76 = [v71 keybagManager];
  if (!v76) {
    __assert_rtn("+[MBCKKeyBag setupKeybagForDevice:operationTracker:passcode:error:]", "MBCKKeyBag.m", 49, "keybagManager");
  }
  v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v71 deviceUUID];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v73;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting up a new keybag for device %{public}@ (%{public}@)", buf, 0x16u);

    v63 = [v71 deviceUUID];
    id v64 = v73;
    _MBLog();
  }
  v67 = [v69 persona];
  [v67 volumesToBackUp];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  id v14 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v101;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v101 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        id v99 = 0;
        v18 = +[MBKeyBag OTAKeybagUUIDStringWithVolume:error:](MBKeyBag, "OTAKeybagUUIDStringWithVolume:error:", v17, &v99, v63, v64);
        id v19 = v99;
        if (!v18 && !+[MBError isError:v19 withCode:4])
        {
          v23 = v19;
          BOOL v22 = 0;
          id *v68 = v23;
          id v24 = obj;
          goto LABEL_27;
        }
        v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v17;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetched OTAKeybagUUID:%{public}@ for %@", buf, 0x16u);
          v63 = v18;
          id v64 = v17;
          _MBLog();
        }

        if (v18 && [v76 hasKeybagWithUUID:v18])
        {
          ++v13;
        }
        else
        {
          v21 = MBGetDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v73;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Replacing existing backup keybag (%{public}@)", buf, 0xCu);
            v63 = v73;
            _MBLog();
          }
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
    }
    while (v14);
  }

  if (v13 == [obj count])
  {
    BOOL v22 = 1;
    goto LABEL_28;
  }
  v26 = MBGetDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v73;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Registering new keybags for (%{public}@)", buf, 0xCu);
    v63 = v73;
    _MBLog();
  }

  id v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v72 = obj;
  id v27 = [v72 countByEnumeratingWithState:&v95 objects:v115 count:16];
  if (!v27) {
    goto LABEL_49;
  }
  uint64_t v74 = *(void *)v96;
  while (2)
  {
    for (j = 0; j != v27; j = (char *)j + 1)
    {
      if (*(void *)v96 != v74) {
        objc_enumerationMutation(v72);
      }
      v29 = *(void **)(*((void *)&v95 + 1) + 8 * (void)j);
      v30 = MBGetDefaultLog();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
      if (v70)
      {
        if (v31)
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Using passcode as keybag secret for %{public}@", buf, 0xCu);
          v63 = v29;
          _MBLog();
        }

        uint64_t v32 = [v70 dataUsingEncoding:4];
      }
      else
      {
        if (v31)
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Creating random secret for %{public}@", buf, 0xCu);
          v63 = v29;
          _MBLog();
        }

        uint64_t v32 = +[MBKeyBag randomSecret];
      }
      v33 = (void *)v32;
      if (!v32)
      {
        +[MBError errorWithCode:1 format:@"Failed to generate secret for keybag"];
        BOOL v22 = 0;
        id *v68 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:
        v23 = v72;
        goto LABEL_27;
      }
      id v94 = 0;
      v34 = +[MBKeyBag registerOTAKeyBagWithVolume:v29 secret:v32 keybagUUIDData:&v94 error:v68];
      id v35 = v94;
      v36 = v35;
      if (!v34)
      {
        v50 = MBGetDefaultLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = (uint64_t (*)(uint64_t, uint64_t))*v68;
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v73;
          *(_WORD *)&buf[22] = 2112;
          v111 = v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to register keybag for volume %{public}@ (%{public}@): %@", buf, 0x20u);
          _MBLog();
        }

        BOOL v22 = 0;
        goto LABEL_62;
      }
      v37 = [v35 base64EncodedStringWithOptions:0];
      v38 = MBGetDefaultLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = [v34 length];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2114;
        v111 = v37;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Registered a new keybag for %@ (%lu bytes): %{public}@", buf, 0x20u);
        id v64 = [v34 length];
        v65 = v37;
        v63 = v29;
        _MBLog();
      }

      v40 = [[MBCKKeyBag alloc] initWithUUID:v36 data:v34 secret:v33 device:v71];
      [v24 addObject:v40];
    }
    id v27 = [v72 countByEnumeratingWithState:&v95 objects:v115 count:16];
    if (v27) {
      continue;
    }
    break;
  }
LABEL_49:

  v41 = dispatch_group_create();
  v42 = [v66 startBatchSave];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v24 = v24;
  id v43 = [v24 countByEnumeratingWithState:&v90 objects:v114 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v91;
    do
    {
      for (k = 0; k != v43; k = (char *)k + 1)
      {
        if (*(void *)v91 != v44) {
          objc_enumerationMutation(v24);
        }
        v46 = *(void **)(*((void *)&v90 + 1) + 8 * (void)k);
        dispatch_group_enter(v41);
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_10007ED88;
        v88[3] = &unk_100411380;
        v88[4] = v46;
        v89 = v41;
        [v46 saveWithBatchSave:v42 completion:v88];
      }
      id v43 = [v24 countByEnumeratingWithState:&v90 objects:v114 count:16];
    }
    while (v43);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v111 = sub_10007EE98;
  v112 = sub_10007EEA8;
  id v113 = 0;
  dispatch_group_enter(v41);
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_10007EEB0;
  v85[3] = &unk_100410FC8;
  v87 = buf;
  v47 = v41;
  v86 = v47;
  [v66 finishBatchSave:v42 completion:v85];
  dispatch_group_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
  v48 = *(void **)(*(void *)&buf[8] + 40);
  if (v48)
  {
    v49 = v47;
    BOOL v22 = 0;
    id *v68 = v48;
  }
  else
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v52 = v24;
    id v53 = [v52 countByEnumeratingWithState:&v81 objects:v109 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v82;
      do
      {
        for (m = 0; m != v53; m = (char *)m + 1)
        {
          if (*(void *)v82 != v54) {
            objc_enumerationMutation(v52);
          }
          objc_msgSend(v76, "addKeybag:", *(void *)(*((void *)&v81 + 1) + 8 * (void)m), v63, v64, v65);
        }
        id v53 = [v52 countByEnumeratingWithState:&v81 objects:v109 count:16];
      }
      while (v53);
    }
    v49 = v47;

    if ([v71 saveWithOperationTracker:v66 error:v68])
    {
      BOOL v22 = 1;
    }
    else
    {
      v56 = MBGetDefaultLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        id v57 = *v68;
        *(_DWORD *)v105 = 138543618;
        v106 = v73;
        __int16 v107 = 2112;
        id v108 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to save device record with new keybags references (%{public}@): %@", v105, 0x16u);
        v63 = v73;
        id v64 = *v68;
        _MBLog();
      }

      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v58 = v52;
      id v59 = [v58 countByEnumeratingWithState:&v77 objects:v104 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v78;
        do
        {
          for (n = 0; n != v59; n = (char *)n + 1)
          {
            if (*(void *)v78 != v60) {
              objc_enumerationMutation(v58);
            }
            v62 = objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * (void)n), "keybagUUIDString", v63, v64);
            [v76 removeKeybagWithUUID:v62];
          }
          id v59 = [v58 countByEnumeratingWithState:&v77 objects:v104 count:16];
        }
        while (v59);
      }

      BOOL v22 = 0;
    }
  }

  _Block_object_dispose(buf, 8);
  v23 = v49;
LABEL_27:

LABEL_28:
  return v22;
}

+ (MBCKKeyBag)keybagWithDevice:(id)a3 keybagUUID:(id)a4 operationTracker:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12) {
    __assert_rtn("+[MBCKKeyBag keybagWithDevice:keybagUUID:operationTracker:error:]", "MBCKKeyBag.m", 152, "tracker");
  }
  v13 = v12;
  if (!v10)
  {
LABEL_9:
    id v26 = 0;
    goto LABEL_10;
  }
  if (!v11)
  {
    if (a6)
    {
      +[MBError errorWithCode:1, @"Invalid keybag UUID (%@)", 0 format];
      id v26 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_10007EE98;
  v48 = sub_10007EEA8;
  id v49 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_10007EE98;
  v42 = sub_10007EEA8;
  id v43 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  id v15 = objc_alloc((Class)CKRecordID);
  v16 = [a1 recordIDStringWithUUID:v11];
  v17 = [v13 syncZoneID];
  id v18 = [v15 initWithRecordName:v16 zoneID:v17];

  id v19 = +[NSPredicate predicateWithFormat:@"recordID==%@", v18];
  id v20 = objc_alloc((Class)CKQuery);
  v21 = +[MBCKModel privilegedQueryType];
  id v22 = [v20 initWithRecordType:v21 predicate:v19];

  id v23 = [objc_alloc((Class)CKQueryOperation) initWithQuery:v22];
  id v24 = [v13 syncZoneID];
  [v23 setZoneID:v24];
  v28 = v18;

  objc_initWeak(&location, v23);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10007F3D8;
  v34[3] = &unk_1004117F0;
  v36 = &v44;
  id v35 = v10;
  [v23 setRecordFetchedBlock:v34];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10007F44C;
  v29[3] = &unk_100411818;
  objc_copyWeak(&v33, &location);
  uint64_t v32 = &v38;
  id v30 = v11;
  v25 = v14;
  BOOL v31 = v25;
  [v23 setQueryCompletionBlock:v29];
  [v13 addDatabaseOperation:v23];
  MBSemaphoreWaitForever();
  if (a6) {
    *a6 = (id) v39[5];
  }
  id v26 = (id)v45[5];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

LABEL_10:
  return (MBCKKeyBag *)v26;
}

+ (id)recordIDStringWithUUID:(id)a3
{
  v4 = [a3 base64EncodedStringWithOptions:0];
  v5 = [a1 recordIDStringWithUUIDString:v4];

  return v5;
}

+ (id)recordIDStringWithUUIDString:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", @"K:", v3];

  return v4;
}

+ (id)UUIDStringFromRecordID:(id)a3
{
  id v3 = [a3 recordName];
  id v4 = [v3 substringFromIndex:objc_msgSend(@"K:", "length")];

  return v4;
}

- (MBCKKeyBag)initWithRecord:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 cache];
  v11.receiver = self;
  v11.super_class = (Class)MBCKKeyBag;
  id v9 = [(MBCKModel *)&v11 initWithRecord:v6 cache:v8];

  if (v9)
  {
    objc_storeWeak((id *)&v9->_device, v7);
    [(MBCKKeyBag *)v9 refreshWithRecord:v6];
  }

  return v9;
}

- (MBCKKeyBag)initWithUUID:(id)a3 data:(id)a4 secret:(id)a5 device:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  dispatch_semaphore_t v14 = [(MBCKKeyBag *)self initWithRecord:0 device:a6];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_keybagData, a4);
    objc_storeStrong((id *)&v15->_keybagUUID, a3);
    objc_storeStrong((id *)&v15->_secret, a5);
  }

  return v15;
}

- (MBCKKeyBag)initWithDictionary:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MBCKKeyBag *)self initWithRecord:0 device:v7];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_device, v7);
    uint64_t v10 = [v6 objectForKeyedSubscript:@"keybagUUID"];
    keybagUUID = v9->_keybagUUID;
    v9->_keybagUUID = (NSData *)v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"keybagData"];
    keybagData = v9->_keybagData;
    v9->_keybagData = (NSData *)v12;

    uint64_t v14 = [v6 objectForKeyedSubscript:@"secret"];
    secret = v9->_secret;
    v9->_secret = (NSData *)v14;
  }
  return v9;
}

- (void)refreshWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 recordID];
  id v6 = [v5 recordName];
  id v7 = [v6 substringFromIndex:objc_msgSend(@"K:", "length")];

  if (v7)
  {
    v8 = (NSData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:v7 options:0];
    keybagUUID = self->_keybagUUID;
    self->_keybagUUID = v8;
  }
  uint64_t v10 = [v4 encryptedValues];
  id v11 = [v10 objectForKeyedSubscript:@"keybagData"];
  keybagData = self->_keybagData;
  self->_keybagData = v11;

  id v13 = [v4 encryptedValues];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"secret"];
  secret = self->_secret;
  self->_secret = v14;

  v16.receiver = self;
  v16.super_class = (Class)MBCKKeyBag;
  [(MBCKModel *)&v16 refreshWithRecord:v4];
}

+ (id)UUIDStringForKeyBagUUID:(id)a3
{
  return [a3 base64EncodedStringWithOptions:0];
}

- (NSString)keybagUUIDString
{
  id v3 = objc_opt_class();
  keybagUUID = self->_keybagUUID;
  return (NSString *)[v3 UUIDStringForKeyBagUUID:keybagUUID];
}

- (id)OTAKeybagWithError:(id *)a3
{
  keybag = self->_keybag;
  if (!keybag)
  {
    id v6 = [(MBCKKeyBag *)self keybagData];
    id v7 = [(MBCKKeyBag *)self secret];
    v8 = +[MBKeyBag OTAKeyBagWithData:v6 secret:v7 error:a3];
    id v9 = self->_keybag;
    self->_keybag = v8;

    keybag = self->_keybag;
  }
  uint64_t v10 = keybag;
  return v10;
}

- (MBKeyBag)keybag
{
  id v8 = 0;
  id v3 = [(MBCKKeyBag *)self OTAKeybagWithError:&v8];
  id v4 = v8;

  if (!v3)
  {
    v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error opening keybag with data: %@", buf, 0xCu);
      _MBLog();
    }
  }
  id v6 = self->_keybag;

  return v6;
}

- (BOOL)unlockWithAccountType:(int64_t)a3 error:(id *)a4
{
  p_keybag = &self->_keybag;
  id v7 = self->_keybag;
  id v8 = v7;
  if (v7 && [(MBKeyBag *)v7 isUnlocked])
  {
    unsigned __int8 v9 = 1;
    id v10 = v8;
  }
  else
  {
    id v11 = [(MBCKKeyBag *)self keybagData];
    uint64_t v12 = [(MBCKKeyBag *)self secret];
    id v10 = +[MBKeyBag OTAKeyBagWithData:v11 secret:v12 error:a4];

    if (v10)
    {
      id v13 = [(MBCKKeyBag *)self secret];
      id v20 = 0;
      unsigned __int8 v9 = [v10 unlockWithSecret:v13 error:&v20];
      id v14 = v20;

      if (v9)
      {
        objc_storeStrong((id *)p_keybag, v10);
        id v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          objc_super v16 = [(MBCKKeyBag *)self keybagUUIDString];
          *(_DWORD *)buf = 138543362;
          id v22 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Unlocked keybag %{public}@", buf, 0xCu);

          id v19 = [(MBCKKeyBag *)self keybagUUIDString];
          _MBLog();
        }
      }
      else
      {
        v17 = MBGetDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v22 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to unlock key bag: %{public}@", buf, 0xCu);
          _MBLog();
        }

        if (a4) {
          *a4 = v14;
        }
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (void)lock
{
  keybag = self->_keybag;
  if (keybag)
  {
    self->_keybag = 0;

    id v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = [(MBCKKeyBag *)self keybagUUIDString];
      *(_DWORD *)buf = 138543362;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Locked keybag %{public}@", buf, 0xCu);

      id v6 = [(MBCKKeyBag *)self keybagUUIDString];
      _MBLog();
    }
  }
}

- (CKRecordID)recordID
{
  id v3 = objc_alloc((Class)CKRecordID);
  id v4 = [(MBCKKeyBag *)self keybagUUIDString];
  v5 = +[MBCKKeyBag recordIDStringWithUUIDString:v4];
  id v6 = +[MBCKDatabaseManager syncZoneID];
  id v7 = [v3 initWithRecordName:v5 zoneID:v6];

  return (CKRecordID *)v7;
}

- (unint64_t)hash
{
  id v3 = [(MBCKKeyBag *)self keybagUUID];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(MBCKKeyBag *)self keybagData];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  id v7 = [(MBCKKeyBag *)self secret];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(MBCKKeyBag *)self keybagUUID];
    id v7 = [v5 keybagUUID];
    if ([v6 isEqualToData:v7])
    {
      unint64_t v8 = [(MBCKKeyBag *)self keybagData];
      unsigned __int8 v9 = [v5 keybagData];
      if ([v8 isEqualToData:v9])
      {
        id v10 = [(MBCKKeyBag *)self secret];
        id v11 = [v5 secret];
        unsigned __int8 v12 = [v10 isEqualToData:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)recordRepresentation
{
  v9.receiver = self;
  v9.super_class = (Class)MBCKKeyBag;
  id v3 = [(MBCKModel *)&v9 recordRepresentation];
  keybagData = self->_keybagData;
  id v5 = [v3 encryptedValues];
  [v5 setObject:keybagData forKeyedSubscript:@"keybagData"];

  secret = self->_secret;
  id v7 = [v3 encryptedValues];
  [v7 setObject:secret forKeyedSubscript:@"secret"];

  return v3;
}

- (id)_getRecordIDString
{
  id v4 = [(MBCKKeyBag *)self keybagUUID];

  if (!v4)
  {
    unint64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MBCKKeyBag.m" lineNumber:326 description:@"Keybag is missing a UUID"];
  }
  id v5 = [(MBCKKeyBag *)self keybagUUID];
  unint64_t v6 = +[MBCKKeyBag recordIDStringWithUUID:v5];

  return v6;
}

- (int64_t)savePolicy
{
  return 2;
}

+ (id)recordType
{
  return @"Keybag";
}

- (id)recordType
{
  return +[MBCKKeyBag recordType];
}

+ (unint64_t)recordZone
{
  return 2;
}

- (unint64_t)recordZone
{
  return +[MBCKKeyBag recordZone];
}

+ (BOOL)unlockKeybag:(id)a3 accountType:(int64_t)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (!v10) {
    __assert_rtn("+[MBCKKeyBag unlockKeybag:accountType:error:block:]", "MBCKKeyBag.m", 343, "keybag");
  }
  if (!a5) {
    __assert_rtn("+[MBCKKeyBag unlockKeybag:accountType:error:block:]", "MBCKKeyBag.m", 344, "error");
  }
  unsigned __int8 v12 = (void (**)(void, void))v11;
  if (!v11) {
    __assert_rtn("+[MBCKKeyBag unlockKeybag:accountType:error:block:]", "MBCKKeyBag.m", 345, "block");
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100080758;
  v37[3] = &unk_100411038;
  v37[4] = a1;
  if (qword_100482388 != -1) {
    dispatch_once(&qword_100482388, v37);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_100482370, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_10007EE98;
  id v35 = sub_10007EEA8;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_10007EE98;
  v29 = sub_10007EEA8;
  id v30 = 0;
  id v13 = qword_100482378;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080804;
  block[3] = &unk_100411840;
  id v14 = v10;
  id v21 = v14;
  id v22 = &v31;
  id v23 = &v25;
  int64_t v24 = a4;
  dispatch_sync(v13, block);
  uint64_t v15 = v32[5];
  if (v15)
  {
    objc_super v16 = [(id)v32[5] keybag];
    if (!v16) {
      __assert_rtn("+[MBCKKeyBag unlockKeybag:accountType:error:block:]", "MBCKKeyBag.m", 433, "keybag");
    }
    ((void (**)(void, void *))v12)[2](v12, v16);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100080C80;
    v19[3] = &unk_100411868;
    v19[4] = &v31;
    dispatch_sync((dispatch_queue_t)qword_100482378, v19);
  }
  else
  {
    v17 = (void *)v26[5];
    if (!v17) {
      __assert_rtn("+[MBCKKeyBag unlockKeybag:accountType:error:block:]", "MBCKKeyBag.m", 429, "unlockError");
    }
    *a5 = v17;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_100482370);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v15 != 0;
}

- (MBCKDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  return (MBCKDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (NSData)keybagUUID
{
  return self->_keybagUUID;
}

- (NSData)keybagData
{
  return self->_keybagData;
}

- (NSData)secret
{
  return self->_secret;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);
  objc_storeStrong((id *)&self->_keybagData, 0);
  objc_storeStrong((id *)&self->_keybagUUID, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_keybag, 0);
}

@end