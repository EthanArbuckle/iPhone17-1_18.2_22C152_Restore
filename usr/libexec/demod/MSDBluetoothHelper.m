@interface MSDBluetoothHelper
+ (id)sharedInstance;
- (BOOL)preserveBTFiles;
- (BOOL)preserveBTPairingRecord;
- (BOOL)shouldRestoreBluetoothPairingRecord;
- (id)getKeychainInfoToSave:(id)a3;
- (void)removeBluetoothPairingRecordIfNeeded;
- (void)restoreBTPairingRecordIfNeeded;
@end

@implementation MSDBluetoothHelper

+ (id)sharedInstance
{
  if (qword_100189928 != -1) {
    dispatch_once(&qword_100189928, &stru_100152538);
  }
  v2 = (void *)qword_100189920;

  return v2;
}

- (BOOL)preserveBTPairingRecord
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "About to preserve bluetooth pairing records to ensure these pairings persist.", buf, 2u);
  }

  if (![(MSDBluetoothHelper *)self preserveBTFiles])
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CAEBC();
    }
    id v6 = 0;
    goto LABEL_21;
  }
  v4 = +[MSDPlatform sharedInstance];
  unsigned __int8 v5 = [v4 macOS];

  if (v5)
  {
    id v6 = 0;
LABEL_14:
    BOOL v15 = 1;
    goto LABEL_15;
  }
  v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving bluetooth pairing info stored in system keychain.", buf, 2u);
  }

  v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [v8 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"];

  if (v9)
  {
    v10 = +[NSFileManager defaultManager];
    id v22 = 0;
    unsigned __int8 v11 = [v10 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain" error:&v22];
    id v6 = v22;

    if ((v11 & 1) == 0)
    {
      v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000CAE54();
      }
      goto LABEL_21;
    }
  }
  else
  {
    id v6 = 0;
  }
  v13 = +[MSDCryptoHandler sharedInstance];
  unsigned __int8 v14 = [v13 preserveAndEncryptKeychainItemsForKey:@"com.appl.mobilestoredemo.bluetooth." toFile:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"];

  if (v14) {
    goto LABEL_14;
  }
  v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000CAE20();
  }
LABEL_21:

  v17 = +[NSFileManager defaultManager];
  unsigned int v18 = [v17 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"];

  if (v18)
  {
    v19 = +[NSFileManager defaultManager];
    id v21 = v6;
    [v19 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter" error:&v21];
    id v20 = v21;

    BOOL v15 = 0;
    id v6 = v20;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_15:

  return v15;
}

- (void)restoreBTPairingRecordIfNeeded
{
  if ([(MSDBluetoothHelper *)self shouldRestoreBluetoothPairingRecord])
  {
    v3 = +[MSDPlatform sharedInstance];
    unsigned __int8 v4 = [v3 macOS];

    if (v4)
    {
LABEL_9:
      [(MSDBluetoothHelper *)self removeBluetoothPairingRecordIfNeeded];
      return;
    }
    unsigned __int8 v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restoring bluetooth pairing information to system keychain.", buf, 2u);
    }

    id v6 = +[MSDCryptoHandler sharedInstance];
    unsigned __int8 v7 = [v6 restoreAndDecryptKeychainItemsForKey:@"com.appl.mobilestoredemo.bluetooth." fromFile:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"];

    v8 = sub_100068600();
    unsigned int v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Done restoring bluetooth keychain items.", v12, 2u);
      }

      v10 = +[MSDHelperAgent sharedInstance];
      [v10 restartBluetooth];

      goto LABEL_9;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CAEF0();
    }
  }
  else
  {
    unsigned __int8 v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CAF24();
    }
  }
}

- (BOOL)preserveBTFiles
{
  v51[1] = 0;
  v2 = +[NSFileManager defaultManager];
  id v3 = 0;
  if ([v2 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"])
  {
    v51[0] = 0;
    unsigned __int8 v4 = [v2 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter" error:v51];
    id v3 = v51[0];
    if ((v4 & 1) == 0)
    {
      unsigned int v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000CB0AC();
      }
      goto LABEL_27;
    }
  }
  unsigned __int8 v5 = v3;
  id v50 = v3;
  unsigned __int8 v6 = [v2 createDirectoryAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter" withIntermediateDirectories:1 attributes:0 error:&v50];
  id v3 = v50;

  if ((v6 & 1) == 0)
  {
    unsigned int v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000CB044();
    }
LABEL_27:
    BOOL v36 = 0;
    goto LABEL_28;
  }
  unsigned __int8 v7 = +[MSDPlatform sharedInstance];
  unsigned __int8 v8 = [v7 macOS];

  v44 = v3;
  if (v8)
  {
    unsigned int v9 = 0;
    v10 = &off_100162C08;
  }
  else
  {
    unsigned int v9 = +[NSString stringWithCString:container_system_group_path_for_identifier() encoding:4];
    v42 = [v9 stringByAppendingPathComponent:@"Library/Database/com.apple.MobileBluetooth.ledevices.paired.db"];
    v53[0] = v42;
    unsigned __int8 v11 = [v9 stringByAppendingPathComponent:@"Library/Database/com.apple.MobileBluetooth.ledevices.paired.db-shm"];
    v53[1] = v11;
    v12 = [v9 stringByAppendingPathComponent:@"Library/Database/com.apple.MobileBluetooth.ledevices.paired.db-wal"];
    v53[2] = v12;
    v13 = [v9 stringByAppendingPathComponent:@"Library/Database/com.apple.MobileBluetooth.ledevices.other.db"];
    v53[3] = v13;
    unsigned __int8 v14 = [v9 stringByAppendingPathComponent:@"Library/Database/com.apple.MobileBluetooth.ledevices.other.db-shm"];
    v53[4] = v14;
    BOOL v15 = [v9 stringByAppendingPathComponent:@"Library/Database/com.apple.MobileBluetooth.ledevices.other.db-wal"];
    v53[5] = v15;
    v16 = [v9 stringByAppendingPathComponent:@"Library/Preferences/com.apple.MobileBluetooth.devices.plist"];
    v53[6] = v16;
    v17 = [v9 stringByAppendingPathComponent:@"Library/Preferences/com.apple.BTMagic.plist"];
    v53[7] = v17;
    v10 = +[NSArray arrayWithObjects:v53 count:8];
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obj = v10;
  id v18 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (!v18) {
    goto LABEL_19;
  }
  id v19 = v18;
  v39 = v9;
  id v20 = 0;
  uint64_t v43 = *(void *)v47;
  p_vtable = MSDFileDownloadCredentials.vtable;
  while (2)
  {
    id v22 = 0;
    v23 = v20;
    do
    {
      if (*(void *)v47 != v43) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(id *)(*((void *)&v46 + 1) + 8 * (void)v22);

      v24 = [v20 stringByDeletingLastPathComponent];
      v25 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter" stringByAppendingPathComponent:v24];
      unsigned __int8 v26 = [v2 fileExistsAtPath:v25];

      if ((v26 & 1) == 0)
      {
        v27 = v2;
        v28 = p_vtable;
        id v29 = v19;
        v30 = [v20 stringByDeletingLastPathComponent];
        v31 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter" stringByAppendingPathComponent:v30];
        id v45 = v44;
        v32 = v27;
        unsigned __int8 v41 = [v27 createDirectoryAtPath:v31 withIntermediateDirectories:1 attributes:0 error:&v45];
        id v3 = v45;

        if ((v41 & 1) == 0)
        {
          v37 = sub_100068600();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v2 = v32;
            unsigned int v9 = v39;
            goto LABEL_26;
          }
          sub_1000CAFC0();
          v2 = v32;
LABEL_23:
          unsigned int v9 = v39;
LABEL_26:

          goto LABEL_27;
        }
        v44 = v3;
        v33 = v32;
        id v19 = v29;
        p_vtable = v28;
        v2 = v33;
      }
      v34 = [p_vtable + 307 sharedInstance:v39];
      unsigned __int8 v35 = [v34 preserveBluetoothFileToShelter:v20];

      if ((v35 & 1) == 0)
      {
        v37 = sub_100068600();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_1000CAF58();
        }
        id v3 = v44;
        goto LABEL_23;
      }
      id v22 = (char *)v22 + 1;
      v23 = v20;
    }
    while (v19 != v22);
    id v19 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v19) {
      continue;
    }
    break;
  }

  unsigned int v9 = v39;
LABEL_19:

  BOOL v36 = 1;
  id v3 = v44;
LABEL_28:

  return v36;
}

- (BOOL)shouldRestoreBluetoothPairingRecord
{
  v2 = +[MSDTargetDevice sharedInstance];
  id v3 = +[NSFileManager defaultManager];
  if ([v2 isContentFrozen])
  {
    unsigned __int8 v4 = [v2 getSavedRequest];
    if ([v4 isEqualToString:@"RevertSnapshot"]) {
      unsigned __int8 v5 = [v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"];
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    unsigned __int8 v5 = [v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain"];
  }

  return v5;
}

- (void)removeBluetoothPairingRecordIfNeeded
{
  id v3 = +[MSDTargetDevice sharedInstance];
  v2 = +[NSFileManager defaultManager];
  if (([v3 isContentFrozen] & 1) == 0)
  {
    [v2 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.btkeychain" error:0];
    [v2 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter" error:0];
  }
}

- (id)getKeychainInfoToSave:(id)a3
{
  id v3 = a3;
  v32[0] = kSecAttrService;
  v32[1] = kSecAttrAccount;
  v32[2] = kSecAttrLabel;
  v32[3] = kSecValueData;
  unsigned __int8 v4 = +[NSArray arrayWithObjects:v32 count:4];
  id v21 = objc_alloc_init((Class)NSMutableArray);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v9 = objc_alloc_init((Class)NSMutableDictionary);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = v8;
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
              if ([v4 containsObject:v15])
              {
                v16 = [v10 objectForKey:v15];
                [v9 setObject:v16 forKey:v15];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }

        [v21 addObject:v9];
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  v17 = +[NSPropertyListSerialization dataFromPropertyList:v21 format:200 errorDescription:0];

  return v17;
}

@end