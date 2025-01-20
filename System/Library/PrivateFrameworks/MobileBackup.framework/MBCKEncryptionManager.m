@interface MBCKEncryptionManager
+ (BOOL)_findMissingEncryptionKeysFromCKCacheWithAccount:(id)a3 serviceManager:(id)a4;
+ (BOOL)_findMissingEncryptionKeysFromPendingSnapshotDirectoryForPersona:(id)a3;
+ (BOOL)saveRestoreKeyBagsWithAccount:(id)a3 device:(id)a4 error:(id *)a5;
+ (BOOL)tearDownBackupForVolume:(id)a3 error:(id *)a4;
+ (id)loadRestoreKeyBagsWithAccount:(id)a3 error:(id *)a4;
+ (id)restoreKeyBagsForDevice:(id)a3;
+ (void)_exportKeychain;
+ (void)_findMissingEncryptionKeysWithAccount:(id)a3 serviceManager:(id)a4;
+ (void)keybagIsLockingWithAccount:(id)a3 serviceManager:(id)a4 completion:(id)a5;
+ (void)keybagIsUnlockedWithAccount:(id)a3 serviceManager:(id)a4;
+ (void)removeRestoreKeyBagsWithAccount:(id)a3 device:(id)a4;
+ (void)trackFoundEncryptionKeysForAccount:(id)a3;
+ (void)trackMissingEncryptionKeyForAccount:(id)a3;
@end

@implementation MBCKEncryptionManager

+ (void)trackMissingEncryptionKeyForAccount:(id)a3
{
  id v4 = a3;
  if (!atomic_fetch_add(dword_100482528, 1u))
  {
    id v5 = a1;
    objc_sync_enter(v5);
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "=encryption key= Asking the UEA plugin to wake backupd on next unlock", buf, 2u);
      _MBLog();
    }

    CFPreferencesSetValue(@"NotifyDaemonNextTimeKeyBagIsUnlocked", &__kCFBooleanTrue, @"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost);
    v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [v4 persona];
        *(_DWORD *)buf = 138412290;
        v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "=encryption key= Requesting backupd to fetch encryption keys for persona %@ on net unlock", buf, 0xCu);
      }
      v11 = [v4 persona];
      _MBLog();
    }
    v10 = [v4 persona];
    [v10 setPreferencesValue:&__kCFBooleanTrue forKey:@"FetchMissingKeysAtNextUnlock"];

    objc_sync_exit(v5);
  }
}

+ (void)trackFoundEncryptionKeysForAccount:(id)a3
{
  id v3 = a3;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "=encryption key= Asking the UEA plugin to not wake backupd on next unlock", buf, 2u);
    _MBLog();
  }

  CFPreferencesSetValue(@"NotifyDaemonNextTimeKeyBagIsUnlocked", &__kCFBooleanFalse, @"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost);
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v3 persona];
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "=encryption key= Requesting backupd to not fetch encryption keys for persona %@ on next unlock", buf, 0xCu);

    v8 = [v3 persona];
    _MBLog();
  }
  v7 = [v3 persona];
  [v7 setPreferencesValue:&__kCFBooleanFalse forKey:@"FetchMissingKeysAtNextUnlock"];
}

+ (void)keybagIsLockingWithAccount:(id)a3 serviceManager:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100146170;
  v23[3] = &unk_100411038;
  v23[4] = a1;
  if (qword_100482538 != -1) {
    dispatch_once(&qword_100482538, v23);
  }
  v11 = dispatch_group_create();
  v12 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100146218;
  block[3] = &unk_100412AB0;
  id v22 = a1;
  id v13 = v8;
  id v20 = v13;
  id v14 = v9;
  id v21 = v14;
  dispatch_group_async(v11, v12, block);

  if ([v13 isPrimaryAccount])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100146260;
    v18[3] = &unk_100411038;
    v18[4] = a1;
    dispatch_group_async(v11, (dispatch_queue_t)qword_100482530, v18);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100146268;
  v16[3] = &unk_100411B88;
  id v17 = v10;
  id v15 = v10;
  dispatch_group_notify(v11, v12, v16);
}

+ (void)keybagIsUnlockedWithAccount:(id)a3 serviceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("+[MBCKEncryptionManager keybagIsUnlockedWithAccount:serviceManager:]", "MBCKEncryptionManager.m", 95, "account");
  }
  id v8 = v7;
  uint64_t v9 = atomic_exchange(dword_100482528, 0);
  if (v9) {
    goto LABEL_5;
  }
  buf[0] = 0;
  id v10 = objc_opt_class();
  objc_sync_enter(v10);
  v11 = [v6 persona];
  unsigned int v12 = [v11 getBooleanValueForKey:@"FetchMissingKeysAtNextUnlock" keyExists:buf];

  objc_sync_exit(v10);
  if (buf[0])
  {
    if (v12)
    {
LABEL_5:
      id v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v20 = v9;
        __int16 v21 = 2112;
        CFStringRef v22 = @"FetchMissingKeysAtNextUnlock";
        __int16 v23 = 1024;
        int v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "=encryption key= Forcing missing encryption keys lookup, count:%lu, %@:%d", buf, 0x1Cu);
        _MBLog();
      }

      id v14 = dispatch_get_global_queue(9, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100146504;
      block[3] = &unk_100412AB0;
      id v18 = a1;
      id v16 = v6;
      id v17 = v8;
      dispatch_sync(v14, block);
    }
  }
}

+ (void)_findMissingEncryptionKeysWithAccount:(id)a3 serviceManager:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 persona];
  unsigned int v8 = [a1 _findMissingEncryptionKeysFromPendingSnapshotDirectoryForPersona:v7];
  unsigned int v9 = [a1 _findMissingEncryptionKeysFromCKCacheWithAccount:v11 serviceManager:v6];
  id v10 = objc_opt_class();
  objc_sync_enter(v10);
  if (v8 && v9) {
    [(id)objc_opt_class() trackFoundEncryptionKeysForAccount:v11];
  }
  else {
    [(id)objc_opt_class() trackMissingEncryptionKeyForAccount:v11];
  }
  objc_sync_exit(v10);
}

+ (BOOL)_findMissingEncryptionKeysFromPendingSnapshotDirectoryForPersona:(id)a3
{
  id v3 = [a3 snapshotDatabaseDirectory];
  id v4 = [v3 stringByAppendingPathComponent:@"pending"];
  id v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v39 = 0;
    id v7 = +[MBFileOperation symbolicLinkTargetWithPath:v4 error:&v39];
    unsigned int v8 = v39;
    if (v7)
    {
      if (MBSnapshotDirectoryExists(v3, v7))
      {
        id v38 = 0;
        id v9 = v3;
        id v37 = v7;
        id v10 = MBGetDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v37;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=encryption key= Finding missed encryption keys for pending commitID: %@", buf, 0xCu);
          _MBLog();
        }

        id v41 = 0;
        id v11 = +[MBMissedEncryptionKeysDB openDatabaseIn:v9 commitID:v37 readOnly:1 error:&v41];
        id v12 = v41;
        if (v11)
        {
          id v40 = v12;
          id v13 = +[MBMissedEncryptionKeysDB openDatabaseIn:v9 commitID:v37 readOnly:0 error:&v40];
          id v14 = v40;

          if (v13)
          {
            id v36 = [v13 countMissedEncryptionKeysWithError:&v38];
            if (v36 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              char v15 = 0;
LABEL_37:

              if (v11) {
                [v11 close:0];
              }
              if (v13) {
                [v13 close:0];
              }

              goto LABEL_42;
            }
            id v20 = v11;
            v34 = v13;
            id v32 = v37;
            v33 = +[NSDate now];
            uint64_t v47 = 0;
            v48 = &v47;
            uint64_t v49 = 0x2020000000;
            uint64_t v50 = 0;
            uint64_t v43 = 0;
            v44 = &v43;
            uint64_t v45 = 0x2020000000;
            uint64_t v46 = 0;
            id v42 = 0;
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = sub_10014A06C;
            v62 = &unk_1004146C8;
            id v13 = v34;
            v63 = v13;
            v64 = &v43;
            v65 = &v47;
            v31 = v20;
            LOBYTE(v20) = [v20 enumerateInodesMissingEncryptionKeys:&v42 block:buf];
            id v35 = v42;
            if ((v20 & 1) == 0)
            {
              v26 = MBGetDefaultLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v51 = 138412290;
                id v52 = v35;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "=encryption key= Error enumerating missed encryption keys: %@", v51, 0xCu);
                _MBLog();
              }

              char v15 = 0;
              id v38 = v35;
              v25 = v63;
              goto LABEL_36;
            }

            [v33 timeIntervalSinceNow];
            double v22 = -v21;
            if (v48[3] + v44[3] >= (unint64_t)v36)
            {
              MBGetDefaultLog();
              log = char v15 = 1;
              if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
              {
                v27 = (void *)v48[3];
                uint64_t v28 = v44[3];
                *(_DWORD *)v51 = 134219010;
                id v52 = v27;
                __int16 v53 = 2048;
                id v54 = v36;
                __int16 v55 = 2048;
                uint64_t v56 = v28;
                __int16 v57 = 2112;
                id v58 = v32;
                __int16 v59 = 2048;
                double v60 = v22;
                v25 = log;
                _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "=encryption key= Found %llu/%llu encryption keys (%llu deleted) for pending commitID %@ in %.2fs", v51, 0x34u);
                _MBLog();
                goto LABEL_36;
              }
            }
            else
            {
              log = MBGetDefaultLog();
              if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
              {
                __int16 v23 = (void *)v48[3];
                uint64_t v24 = v44[3];
                *(_DWORD *)v51 = 134219010;
                id v52 = v23;
                __int16 v53 = 2048;
                id v54 = v36;
                __int16 v55 = 2048;
                uint64_t v56 = v24;
                __int16 v57 = 2112;
                id v58 = v32;
                __int16 v59 = 2048;
                double v60 = v22;
                v25 = log;
                _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "=encryption key= Partially found %llu/%llu encryption keys (%llu deleted) for pending commitID %@ in %.2fs", v51, 0x34u);
                _MBLog();
                char v15 = 0;
LABEL_36:

                _Block_object_dispose(&v43, 8);
                _Block_object_dispose(&v47, 8);

                goto LABEL_37;
              }
              char v15 = 0;
            }
            v25 = log;
            goto LABEL_36;
          }
          v19 = MBGetDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v14;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=encryption key= Failed to open r/w missed encryption keys db: %@", buf, 0xCu);
            _MBLog();
          }

          id v18 = v14;
        }
        else
        {
          id v17 = MBGetDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v12;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "=encryption key= Failed to open r/o missed encryption keys db: %@", buf, 0xCu);
            _MBLog();
          }

          id v18 = v12;
        }
        id v14 = v18;
        id v13 = 0;
        char v15 = 0;
        id v38 = v18;
        goto LABEL_37;
      }
      id v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v3;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "=encryption key= Snapshot directory for commitID %@ does not exist under %@", buf, 0x16u);
        _MBLog();
      }
    }
    else
    {
      id v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "=encryption key= Failed to resolve symlink target at %@: %@", buf, 0x16u);
        _MBLog();
      }
    }

    char v15 = 0;
LABEL_42:

    goto LABEL_43;
  }
  unsigned int v8 = MBGetDefaultLog();
  char v15 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "=encryption key= Pending snapshot directory does not exist at %{public}@", buf, 0xCu);
    _MBLog();
  }
LABEL_43:

  return v15 & 1;
}

+ (BOOL)_findMissingEncryptionKeysFromCKCacheWithAccount:(id)a3 serviceManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    __assert_rtn("+[MBCKEncryptionManager _findMissingEncryptionKeysFromCKCacheWithAccount:serviceManager:]", "MBCKEncryptionManager.m", 160, "account");
  }
  id v7 = v6;
  unsigned int v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "=encryption key= Finding missing encryption keys from MBCKCache for:%@", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000;
  id v42 = sub_100147350;
  uint64_t v43 = sub_100147360;
  id v44 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100147350;
  uint64_t v28 = sub_100147360;
  id v29 = 0;
  id obj = 0;
  id v9 = [v7 openCacheWithAccount:v5 accessType:2 error:&obj];
  objc_storeStrong(&v29, obj);
  if (v9)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100147368;
    v16[3] = &unk_1004146A0;
    v19 = &v30;
    id v20 = &v24;
    p_long long buf = &buf;
    id v17 = v7;
    id v18 = v5;
    double v22 = &v34;
    id v10 = [v9 enumerateFilesMissingEncryptionKeys:v16];
    if (*((unsigned char *)v35 + 24)) {
      [*(id *)(*((void *)&buf + 1) + 40) flush];
    }
    id v11 = (void *)v25[5];
    if (v11)
    {
      id v12 = v11;

      id v10 = v12;
    }
    else if (!v10)
    {
LABEL_14:
      BOOL v13 = *((unsigned char *)v31 + 24) != 0;

      goto LABEL_15;
    }
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v38 = 138412290;
      id v39 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "=encryption key= Failed to enumerate files missing encryption keys: %@", v38, 0xCu);
      _MBLog();
    }

    goto LABEL_14;
  }
  BOOL v13 = 0;
LABEL_15:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&buf, 8);

  return v13;
}

+ (void)_exportKeychain
{
  id v7 = 0;
  unsigned __int8 v2 = +[MBKeychainPlugin exportKeychainForCKBackupEngine:0 error:&v7];
  id v3 = v7;
  if ((v2 & 1) == 0)
  {
    id v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = +[MBError descriptionForError:v3];
      *(_DWORD *)long long buf = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=encryption key= Error exporting keychain: %@", buf, 0xCu);

      id v6 = +[MBError descriptionForError:v3];
      _MBLog();
    }
  }
}

+ (BOOL)tearDownBackupForVolume:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=encryption key= Tearing down backup keybag", buf, 2u);
    _MBLog();
  }

  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=encryption key= Unregistering keybag for %@", buf, 0xCu);
    _MBLog();
  }

  id v12 = 0;
  BOOL v8 = +[MBKeyBag unregisterOTAKeyBagForVolume:v5 error:&v12];
  id v9 = v12;
  if (v8)
  {
    +[MBKeychainPlugin removeServiceKeychainBackup];
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=encryption key= Failed to unregister OTA keybag for %@: %{public}@", buf, 0x16u);
      _MBLog();
    }

    if (a4)
    {
      *a4 = +[MBError errorWithCode:1 error:v9 format:@"Error unregistering keybag"];
    }
  }

  return v8;
}

+ (id)loadRestoreKeyBagsWithAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("+[MBCKEncryptionManager loadRestoreKeyBagsWithAccount:error:]", "MBCKEncryptionManager.m", 262, "account");
  }
  id v6 = v5;
  id v7 = [v5 persona];
  BOOL v8 = [v7 restoreKeyBagsPath];

  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v49 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=encryption key= Loading restore keybags at %{public}@", buf, 0xCu);
    _MBLog();
  }

  id v46 = 0;
  id v10 = +[NSData dataWithContentsOfFile:v8 options:0 error:&v46];
  id v11 = v46;
  if (v10)
  {
    id v45 = 0;
    id v12 = +[NSPropertyListSerialization propertyListWithData:v10 options:0 format:0 error:&v45];
    id v13 = v45;

    if (v12)
    {
      id v35 = v13;
      uint64_t v36 = v10;
      char v37 = v8;
      id v38 = v6;
      id v40 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v12, "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v34 = v12;
      id v14 = v12;
      id v15 = [v14 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v39 = *(void *)v42;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v42 != v39) {
              objc_enumerationMutation(v14);
            }
            id v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            id v19 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v18 options:0];
            uint64_t v20 = +[MBKeychainManager fetchKeybagSecretForUUID:v18 error:a4];
            if (!v20)
            {

              id v30 = 0;
              BOOL v8 = v37;
              id v6 = v38;
              id v13 = v35;
              id v10 = v36;
              id v12 = v34;
              uint64_t v28 = v40;
              goto LABEL_24;
            }
            double v21 = (void *)v20;
            double v22 = a4;
            __int16 v23 = [v14 objectForKeyedSubscript:v18];
            id v24 = [v23 mutableCopy];

            [v24 setObject:v19 forKeyedSubscript:@"keybagUUID"];
            [v24 setObject:v21 forKeyedSubscript:@"secret"];
            v25 = [[MBCKKeyBag alloc] initWithDictionary:v24 device:0];
            [v40 setObject:v25 forKeyedSubscript:v18];
            uint64_t v26 = MBGetDefaultLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543362;
              id v49 = v18;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "=encryption key= Loaded secret for keybag %{public}@", buf, 0xCu);
              _MBLog();
            }

            a4 = v22;
          }
          id v16 = [v14 countByEnumeratingWithState:&v41 objects:v47 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      v27 = MBGetDefaultLog();
      uint64_t v28 = v40;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [v40 count];
        *(_DWORD *)long long buf = 134217984;
        id v49 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=encryption key= Loaded %ld keybag secrets from the keychain", buf, 0xCu);
        [v40 count];
        _MBLog();
      }

      id v30 = v40;
      BOOL v8 = v37;
      id v6 = v38;
      id v13 = v35;
      id v10 = v36;
      id v12 = v34;
LABEL_24:
    }
    else
    {
      uint64_t v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v49 = v13;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "=encryption key= Failed to deserialize the restore keybags: %{public}@", buf, 0xCu);
        _MBLog();
      }

      id v30 = 0;
      if (a4 && v13)
      {
        +[MBError errorWithCode:1 error:v13 format:@"Error deserializing restore keybag plist"];
        id v30 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v31 = MBGetDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v49 = v8;
      __int16 v50 = 2114;
      id v51 = v11;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "=encryption key= Failed to load the restore keybags from %{public}@: %{public}@", buf, 0x16u);
      _MBLog();
    }

    if (a4)
    {
      +[MBError errorForNSError:v11 path:v8 format:@"Error reading restore keybag file"];
      id v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v30 = 0;
    }
    id v13 = v11;
  }

  return v30;
}

+ (BOOL)saveRestoreKeyBagsWithAccount:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("+[MBCKEncryptionManager saveRestoreKeyBagsWithAccount:device:error:]", "MBCKEncryptionManager.m", 305, "account");
  }
  id v10 = v9;
  if (!v9) {
    __assert_rtn("+[MBCKEncryptionManager saveRestoreKeyBagsWithAccount:device:error:]", "MBCKEncryptionManager.m", 306, "device");
  }
  v69 = a5;
  [a1 removeRestoreKeyBagsWithAccount:v8 device:v9];
  id v70 = v8;
  id v11 = [v8 persona];
  uint64_t v12 = [v11 restoreKeyBagsPath];

  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v90 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=encryption key= Saving restore keybags at %{public}@", buf, 0xCu);
    uint64_t v65 = v12;
    _MBLog();
  }
  v71 = (void *)v12;

  id v14 = objc_alloc((Class)NSMutableDictionary);
  id v15 = [v10 keybagManager];
  id v16 = [v15 keybagsByUUIDString];
  id v75 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v16, "count"));

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v74 = v10;
  id v17 = [v10 keybagManager];
  id v18 = [v17 keybagsByUUIDString];

  id v19 = [v18 countByEnumeratingWithState:&v84 objects:v95 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v85;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v85 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v84 + 1) + 8 * i);
        id v24 = objc_msgSend(v74, "keybagManager", v65);
        v25 = [v24 keybagsByUUIDString];
        uint64_t v26 = [v25 objectForKeyedSubscript:v23];

        CFStringRef v93 = @"keybagData";
        v27 = [v26 keybagData];
        v94 = v27;
        uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];

        [v75 setObject:v28 forKeyedSubscript:v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v84 objects:v95 count:16];
    }
    while (v20);
  }

  id v83 = 0;
  id v29 = +[NSPropertyListSerialization dataWithPropertyList:v75 format:100 options:0 error:&v83];
  id v30 = v83;
  if (v29)
  {
    v31 = v71;
    uint64_t v32 = [v71 stringByDeletingLastPathComponent];
    char v33 = +[NSFileManager defaultManager];
    id v82 = v30;
    unsigned __int8 v34 = [v33 createDirectoryAtPath:v32 withIntermediateDirectories:1 attributes:0 error:&v82];
    id v35 = v82;

    if ((v34 & 1) == 0)
    {
      double v60 = MBGetDefaultLog();
      __int16 v57 = v70;
      char v37 = v74;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v90 = (uint64_t)v32;
        __int16 v91 = 2114;
        id v92 = v35;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "=encryption key= Failed create the directory at %{public}@: %{public}@", buf, 0x16u);
        _MBLog();
      }

      if (v69)
      {
        +[MBError errorForNSError:v35 path:v32 format:@"Error creating restore keybag dir"];
        BOOL v58 = 0;
        id *v69 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v58 = 0;
      }
      id v30 = v35;
      goto LABEL_56;
    }
    id v81 = v35;
    unsigned __int8 v36 = [v29 writeToFile:v71 options:1073741825 error:&v81];
    id v30 = v81;

    char v37 = v74;
    if ((v36 & 1) == 0)
    {
      v61 = MBGetDefaultLog();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v90 = (uint64_t)v71;
        __int16 v91 = 2114;
        id v92 = v30;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "=encryption key= Failed serialize restore keybags plist at %{public}@: %{public}@", buf, 0x16u);
        _MBLog();
      }

      __int16 v57 = v70;
      if (v69)
      {
        +[MBError errorWithCode:100 error:v30 path:v71 format:@"Error writing restore keybag plist"];
        BOOL v58 = 0;
        id *v69 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v58 = 0;
      }
      goto LABEL_56;
    }
    v72 = +[NSMutableArray array];
    id v38 = [v74 keybagManager];
    uint64_t v39 = [v38 keybagsByUUIDString];

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v40 = v39;
    id v41 = [v40 countByEnumeratingWithState:&v77 objects:v88 count:16];
    if (v41)
    {
      id v42 = v41;
      id obj = v40;
      id v66 = v30;
      v67 = v29;
      v68 = v32;
      char v43 = 1;
      uint64_t v44 = *(void *)v78;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v78 != v44) {
            objc_enumerationMutation(obj);
          }
          id v46 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
          uint64_t v47 = MBGetDefaultLog();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v90 = (uint64_t)v46;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "=encryption key= Saving secret for keybag %{public}@ into keychain", buf, 0xCu);
            _MBLog();
          }

          v48 = [v74 keybagManager];
          id v49 = [v48 keybagsByUUIDString];
          __int16 v50 = [v49 objectForKeyedSubscript:v46];

          id v51 = [v50 secret];
          id v76 = 0;
          unsigned __int8 v52 = +[MBKeychainManager addKeybagSecret:v51 forUUID:v46 error:&v76];
          id v53 = v76;

          if ((v52 & 1) == 0)
          {
            id v54 = MBGetDefaultLog();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543618;
              uint64_t v90 = (uint64_t)v46;
              __int16 v91 = 2114;
              id v92 = v53;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "=encryption key= Failed to save secret for keybag %{public}@ into keychain: %{public}@", buf, 0x16u);
              _MBLog();
            }

            if (v53) {
              +[MBError errorWithCode:1, v53, @"Failed to save secret for keybag %@ into keychain", v46 error format];
            }
            else {
            __int16 v55 = +[MBError errorWithCode:1, @"Failed to save secret for keybag %@ into keychain", v46 format];
            }
            [v72 addObject:v55];

            char v43 = 0;
          }
        }
        id v42 = [obj countByEnumeratingWithState:&v77 objects:v88 count:16];
      }
      while (v42);
      id v40 = obj;

      uint64_t v32 = v68;
      char v56 = v43;
      if (!((v69 == 0) | v43 & 1))
      {
        +[MBError errorWithErrors:v72];
        BOOL v58 = 0;
        id *v69 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v57 = v70;
        v31 = v71;
        id v30 = v66;
        id v29 = v67;
        goto LABEL_55;
      }
      __int16 v57 = v70;
      v31 = v71;
      id v30 = v66;
      id v29 = v67;
      if ((v56 & 1) == 0)
      {
        BOOL v58 = 0;
LABEL_55:

        char v37 = v74;
LABEL_56:

        goto LABEL_57;
      }
    }
    else
    {

      __int16 v57 = v70;
    }
    v62 = MBGetDefaultLog();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      id v63 = [v40 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v90 = (uint64_t)v63;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "=encryption key= Saved %ld keybag secrets into keychain", buf, 0xCu);
      [v40 count];
      _MBLog();
    }

    BOOL v58 = 1;
    goto LABEL_55;
  }
  __int16 v59 = MBGetDefaultLog();
  v31 = v71;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v90 = (uint64_t)v30;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "=encryption key= Failed serialize restore keybags plist: %{public}@", buf, 0xCu);
    _MBLog();
  }

  __int16 v57 = v70;
  char v37 = v74;
  if (v69)
  {
    +[MBError errorForNSError:v30 path:v71 format:@"Error serializing restore keybag plist"];
    BOOL v58 = 0;
    id *v69 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v58 = 0;
  }
LABEL_57:

  return v58;
}

+ (id)restoreKeyBagsForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(v3, "keybagManager", 0);
  id v6 = [v5 keybagsByUUIDString];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v3 keybagManager];
        id v13 = [v12 keybagsByUUIDString];
        id v14 = [v13 objectForKeyedSubscript:v11];

        [v4 setObject:v14 forKeyedSubscript:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (void)removeRestoreKeyBagsWithAccount:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    __assert_rtn("+[MBCKEncryptionManager removeRestoreKeyBagsWithAccount:device:]", "MBCKEncryptionManager.m", 383, "account");
  }
  uint64_t v21 = v6;
  double v22 = v5;
  id v7 = [v6 keybagManager];
  id v8 = [v7 keybagsByUUIDString];

  uint64_t v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    id v29 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=encryption key= Removing secrets for %ld keybags", buf, 0xCu);
    [v8 count];
    _MBLog();
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v16 = MBGetDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v29 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=encryption key= Removing the secret for keybag %{public}@", buf, 0xCu);
          _MBLog();
        }

        id v23 = 0;
        unsigned __int8 v17 = +[MBKeychainManager removeKeybagSecretForUUID:v15 error:&v23];
        id v18 = v23;
        if ((v17 & 1) == 0)
        {
          long long v19 = MBGetDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543618;
            id v29 = v15;
            __int16 v30 = 2114;
            id v31 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=encryption key= Failed to remove the secret for keybag %{public}@: %{public}@", buf, 0x16u);
            _MBLog();
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v12);
  }

  id v20 = [v22 persona];
  [v20 removeRestoreKeybags];
}

@end