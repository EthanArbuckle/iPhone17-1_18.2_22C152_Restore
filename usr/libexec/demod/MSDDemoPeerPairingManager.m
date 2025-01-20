@interface MSDDemoPeerPairingManager
+ (id)sharedInstance;
- (BOOL)_savePairedPeer:(id)a3;
- (BOOL)_setupPairingManagerIfNeeded;
- (CUPairingManager)pairingManager;
- (id)_findPairedPeerWithUUID:(id)a3;
- (id)_getAllPairedPeers;
- (id)_readPairedPeersIntoData;
- (void)_restorePairedPeersFromData:(id)a3;
- (void)preservePairedPeersData;
- (void)removePairedPeer:(id)a3 withCompletion:(id)a4;
- (void)restorePairedPeersDataIfNeeded;
- (void)setPairingManager:(id)a3;
- (void)updateDeviceNameForPairedPeerOfUUID:(id)a3 withNewName:(id)a4;
@end

@implementation MSDDemoPeerPairingManager

+ (id)sharedInstance
{
  if (qword_1001899F0 != -1) {
    dispatch_once(&qword_1001899F0, &stru_1001529F0);
  }
  v2 = (void *)qword_1001899F8;

  return v2;
}

- (void)preservePairedPeersData
{
  v3 = +[NSFileManager defaultManager];
  v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Preserving paired peers data from system.", buf, 2u);
  }

  if ([v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data"])
  {
    v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Deleting existing pairing data file.", buf, 2u);
    }

    id v16 = 0;
    unsigned __int8 v6 = [v3 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data" error:&v16];
    id v7 = v16;
    if ((v6 & 1) == 0)
    {
      v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000CD6CC();
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  v9 = [(MSDDemoPeerPairingManager *)self _readPairedPeersIntoData];
  if (!v9)
  {
    v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000CD5FC();
    }
    goto LABEL_19;
  }
  v10 = +[MSDCryptoHandler sharedInstance];
  v11 = [v10 performCryptoWithSecretKeyOnData:v9 isDecipher:0];

  if (!v11)
  {
    v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000CD630();
    }
LABEL_19:
    v11 = 0;
LABEL_23:

    id v13 = v7;
    goto LABEL_14;
  }
  id v15 = v7;
  unsigned __int8 v12 = [v11 writeToFile:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data" options:0 error:&v15];
  id v13 = v15;

  if ((v12 & 1) == 0)
  {
    v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000CD664();
    }
    id v7 = v13;
    goto LABEL_23;
  }
LABEL_14:
}

- (void)restorePairedPeersDataIfNeeded
{
  v3 = +[MSDTargetDevice sharedInstance];
  v4 = +[NSFileManager defaultManager];
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Restoring paired peers data to system.", buf, 2u);
  }

  if (([v4 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data"] & 1) == 0)
  {
    unsigned __int8 v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: No encrypted paired peers data file found.", buf, 2u);
    }
    id v11 = 0;
    v9 = 0;
    unsigned __int8 v6 = 0;
    goto LABEL_13;
  }
  id v15 = 0;
  unsigned __int8 v6 = +[NSData dataWithContentsOfFile:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data" options:0 error:&v15];
  id v7 = v15;
  if (v6)
  {
    v8 = +[MSDCryptoHandler sharedInstance];
    v9 = [v8 performCryptoWithSecretKeyOnData:v6 isDecipher:1];

    if (v9)
    {
      [(MSDDemoPeerPairingManager *)self _restorePairedPeersFromData:v9];
      goto LABEL_7;
    }
    id v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000CD79C();
    }
  }
  else
  {
    id v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000CD734();
    }
  }

  v9 = 0;
LABEL_7:
  id v14 = v7;
  unsigned __int8 v10 = [v4 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data" error:&v14];
  id v11 = v14;

  if ((v10 & 1) == 0)
  {
    unsigned __int8 v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CD6CC();
    }
LABEL_13:
  }
}

- (void)updateDeviceNameForPairedPeerOfUUID:(id)a3 withNewName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Assign new name '%{public}@' to paired peer '%{public}@'", (uint8_t *)&v12, 0x16u);
  }

  v9 = [(MSDDemoPeerPairingManager *)self _findPairedPeerWithUUID:v6];
  unsigned __int8 v10 = v9;
  if (v9)
  {
    [v9 setName:v7];
    [(MSDDemoPeerPairingManager *)self _savePairedPeer:v10];
  }
  else
  {
    id v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CD7D0();
    }
  }
}

- (void)removePairedPeer:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Remove paired peer with ID '%{public}@'", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100044870;
  v31 = sub_100044880;
  id v32 = 0;
  v9 = [(MSDDemoPeerPairingManager *)self _findPairedPeerWithUUID:v6];
  if (v9)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = [(MSDDemoPeerPairingManager *)self pairingManager];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100044888;
    v23[3] = &unk_100152A18;
    p_long long buf = &buf;
    id v12 = v9;
    id v24 = v12;
    id v13 = v10;
    v25 = v13;
    [v11 removePairedPeer:v12 options:4 completion:v23];

    dispatch_time_t v14 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v13, v14))
    {
      id v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000CD86C((uint64_t)v12, v15);
      }

      id v16 = (id *)(*((void *)&buf + 1) + 40);
      id obj = *(id *)(*((void *)&buf + 1) + 40);
      v17 = +[NSString stringWithFormat:@"Timeout 5 seconds to remove peer '%@'", v12];
      sub_1000C3188(&obj, 3727741111, @"Peer removal timeout", (uint64_t)v17);
      objc_storeStrong(v16, obj);
    }
    v18 = v24;
  }
  else
  {
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000CD804();
    }

    uint64_t v20 = *((void *)&buf + 1);
    id v27 = *(id *)(*((void *)&buf + 1) + 40);
    id v13 = +[NSString stringWithFormat:@"Failed to find peer with ID '%@'", v6];
    sub_1000C3188(&v27, 3727741104, @"Cannot find specified demo peer.", (uint64_t)v13);
    id v21 = v27;
    v18 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v21;
  }

  v7[2](v7, *(void *)(*((void *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);
}

- (BOOL)_setupPairingManagerIfNeeded
{
  v3 = [(MSDDemoPeerPairingManager *)self pairingManager];

  if (v3) {
    return 1;
  }
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)CUPairingManager);
  [(MSDDemoPeerPairingManager *)self setPairingManager:v5];

  id v6 = dispatch_get_global_queue(21, 0);
  id v7 = [(MSDDemoPeerPairingManager *)self pairingManager];
  [v7 setDispatchQueue:v6];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100044B00;
  v14[3] = &unk_100151AC8;
  objc_copyWeak(&v15, &location);
  v8 = [(MSDDemoPeerPairingManager *)self pairingManager];
  [v8 setInterruptionHandler:v14];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100044B6C;
  v12[3] = &unk_100151AC8;
  objc_copyWeak(&v13, &location);
  v9 = [(MSDDemoPeerPairingManager *)self pairingManager];
  [v9 setInvalidationHandler:v12];

  dispatch_semaphore_t v10 = [(MSDDemoPeerPairingManager *)self pairingManager];
  BOOL v4 = v10 != 0;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v4;
}

- (id)_getAllPairedPeers
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_100044870;
  v28 = sub_100044880;
  id v29 = 0;
  uint64_t v21 = 0;
  v22[0] = &v21;
  v22[1] = 0x3032000000;
  v22[2] = sub_100044870;
  v22[3] = sub_100044880;
  id v23 = 0;
  if ([(MSDDemoPeerPairingManager *)self _setupPairingManagerIfNeeded])
  {
    BOOL v4 = [(MSDDemoPeerPairingManager *)self pairingManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100044E48;
    v17[3] = &unk_100152A40;
    v19 = &v24;
    uint64_t v20 = &v21;
    id v5 = v3;
    v18 = v5;
    [v4 getPairedPeersWithOptions:134 completion:v17];

    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      dispatch_semaphore_t v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000CDA50();
      }
    }
    else
    {
      if (v25[5])
      {

        id v7 = (id)v25[5];
        goto LABEL_5;
      }
      dispatch_semaphore_t v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000CD9DC((uint64_t)v22, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000CDA84();
    }
  }
  id v7 = 0;
LABEL_5:
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v24, 8);

  return v7;
}

- (BOOL)_savePairedPeer:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100044870;
  uint64_t v20 = sub_100044880;
  id v21 = 0;
  if ([(MSDDemoPeerPairingManager *)self _setupPairingManagerIfNeeded])
  {
    dispatch_time_t v6 = [(MSDDemoPeerPairingManager *)self pairingManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100045100;
    v13[3] = &unk_100151CE0;
    uint64_t v15 = &v16;
    id v7 = v5;
    uint64_t v14 = v7;
    [v6 savePairedPeer:v4 options:5 completion:v13];

    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v7, v8))
    {
      uint64_t v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000CDB34();
      }
    }
    else
    {
      if (!v17[5])
      {
        BOOL v9 = 1;
LABEL_5:
        dispatch_semaphore_t v10 = v14;
        goto LABEL_6;
      }
      uint64_t v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000CDAB8();
      }
    }

    BOOL v9 = 0;
    goto LABEL_5;
  }
  dispatch_semaphore_t v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000CDA84();
  }
  BOOL v9 = 0;
LABEL_6:

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)_findPairedPeerWithUUID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(MSDDemoPeerPairingManager *)self _getAllPairedPeers];
  dispatch_time_t v6 = v5;
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = [v11 identifier:v16];
          uint64_t v13 = [v12 UUIDString];
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_readPairedPeersIntoData
{
  v2 = [(MSDDemoPeerPairingManager *)self _getAllPairedPeers];
  dispatch_semaphore_t v3 = v2;
  if (v2)
  {
    [v2 enumerateObjectsUsingBlock:&stru_100152A80];
    id v9 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
    dispatch_semaphore_t v5 = v9;
    if (v4)
    {
      dispatch_time_t v6 = v4;
      id v7 = v5;
      dispatch_semaphore_t v5 = v6;
    }
    else
    {
      id v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000CDB68();
      }
      dispatch_time_t v6 = 0;
    }
  }
  else
  {
    dispatch_time_t v6 = 0;
  }

  return v6;
}

- (void)_restorePairedPeersFromData:(id)a3
{
  id v20 = 0;
  id v4 = +[NSKeyedUnarchiver unarchiveTopLevelObjectWithData:a3 error:&v20];
  id v5 = v20;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    dispatch_time_t v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      id v14 = v5;
      uint64_t v15 = v4;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = sub_100068600();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = [v11 detailedDescription];
            *(_DWORD *)long long buf = 138543362;
            v22 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Saving paired peer: %{public}@", buf, 0xCu);
          }
          [(MSDDemoPeerPairingManager *)self _savePairedPeer:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v8);
      id v5 = v14;
      id v4 = v15;
    }
  }
  else
  {
    dispatch_time_t v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CDBD0();
    }
  }
}

- (CUPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end