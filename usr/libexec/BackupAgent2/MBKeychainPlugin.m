@interface MBKeychainPlugin
+ (BOOL)_exportKeychainForCKBackupEngine:(id)a3 error:(id *)a4;
+ (BOOL)exportKeychainForCKBackupEngine:(id)a3 error:(id *)a4;
+ (void)removeServiceKeychainBackup;
- (id)_endingRestoreWithDriveEngine:(id)a3;
- (id)_preparingBackupWithCKEngine:(id)a3;
- (id)_preparingBackupWithDriveEngine:(id)a3;
- (id)endingBackupWithEngine:(id)a3;
- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4;
- (id)preparingBackupWithEngine:(id)a3;
- (void)_endingRestoreWithServicePolicy:(id)a3 engine:(id)a4;
- (void)_restoreKeychainBackupAtPath:(id)a3 withEngine:(id)a4;
@end

@implementation MBKeychainPlugin

- (id)_preparingBackupWithDriveEngine:(id)a3
{
  id v3 = a3;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v27 = @"/var/Keychains/keychain-backup.plist";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Exporting keychain to %@", buf, 0xCu);
    CFStringRef v23 = @"/var/Keychains/keychain-backup.plist";
    _MBLog();
  }

  v6 = [v3 settingsContext];
  v7 = [v6 keybag];
  id v25 = 0;
  v8 = [v7 dataWithError:&v25];
  id v9 = v25;

  if (v8)
  {
    id v24 = v9;
    v10 = +[MBKeychainManager fetchLocalBackupPasswordAndReturnError:&v24];
    id v11 = v24;

    if (!v10)
    {
      if (!+[MBError isError:v11 withCode:4])
      {
        v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v27 = @"/var/Keychains/keychain-backup.plist";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Exporting keychain to %@ failed: no password", buf, 0xCu);
          _MBLog();
        }

        id v14 = v11;
        int v17 = 1;
        goto LABEL_18;
      }

      id v11 = 0;
    }
    v12 = [v10 dataUsingEncoding:4, v23];
    BOOL v13 = sub_100043D5C();
    id v14 = v11;

    v15 = MBGetDefaultLog();
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v27 = @"/var/Keychains/keychain-backup.plist";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Exporting keychain to %@ succeeded", buf, 0xCu);
        _MBLog();
      }

      int v17 = 0;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v27 = @"/var/Keychains/keychain-backup.plist";
        __int16 v28 = 2112;
        id v29 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Exporting keychain to %@ failed: %@", buf, 0x16u);
        _MBLog();
      }

      id v19 = v14;
      int v17 = 1;
    }

LABEL_18:
    goto LABEL_19;
  }
  v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v27 = @"/var/Keychains/keychain-backup.plist";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Exporting keychain to %@ failed: no keybag", buf, 0xCu);
    _MBLog();
  }

  id v14 = v9;
  int v17 = 1;
LABEL_19:

  if (v17) {
    v20 = v14;
  }
  else {
    v20 = 0;
  }

  return v20;
}

- (id)_preparingBackupWithCKEngine:(id)a3
{
  id v8 = 0;
  unsigned __int8 v3 = +[MBKeychainPlugin exportKeychainForCKBackupEngine:a3 error:&v8];
  id v4 = v8;
  v5 = v4;
  id v6 = 0;
  if ((v3 & 1) == 0) {
    id v6 = v4;
  }

  return v6;
}

+ (BOOL)_exportKeychainForCKBackupEngine:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  id v47 = 0;
  v7 = [v6 attributesOfItemAtPath:@"/var/Keychains/keychain-2.db-wal" error:&v47];
  id v8 = v47;
  id v9 = v8;
  if (v7)
  {
    id v46 = v8;
    v10 = [v6 attributesOfItemAtPath:@"/var/Keychains/keychain-ota-backup.plist" error:&v46];
    id v11 = v46;

    if (v10)
    {
      v12 = [v10 fileModificationDate];
      BOOL v13 = [v7 fileModificationDate];
      [v12 timeIntervalSinceReferenceDate];
      double v15 = v14 * 1000.0;
      [v13 timeIntervalSinceReferenceDate];
      double v17 = v16 * 1000.0;
      if (v15 > 1.84467441e19 || v17 > 1.84467441e19)
      {
        if ((-[NSObject isEqualToDate:](v12, "isEqualToDate:", v13, v17) & 1) == 0)
        {
LABEL_16:
          v21 = MBGetDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            [v12 timeIntervalSince1970];
            CFStringRef v23 = v22;
            [v13 timeIntervalSince1970];
            *(_DWORD *)buf = 134218240;
            CFStringRef v51 = v23;
            __int16 v52 = 2048;
            uint64_t v53 = v24;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Keychain database was modified since the last export (%.6f, %.6f)", buf, 0x16u);
            [v12 timeIntervalSince1970];
            CFStringRef v26 = v25;
            [v13 timeIntervalSince1970];
            CFStringRef v40 = v26;
            uint64_t v41 = v27;
            _MBLog();
          }

          goto LABEL_19;
        }
      }
      else if (*(uint64_t *)&v15 != *(uint64_t *)&v17)
      {
        goto LABEL_16;
      }

      unsigned __int8 v19 = 1;
LABEL_54:

      id v9 = v11;
      goto LABEL_55;
    }
    v20 = [v11 domain];
    if ([v20 isEqualToString:NSCocoaErrorDomain])
    {
      if ([v11 code] == (id)4)
      {

        goto LABEL_41;
      }
      id v36 = [v11 code];

      if (v36 == (id)260)
      {
LABEL_41:
        v12 = MBGetDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Keychain backup not found", buf, 2u);
          _MBLog();
        }
LABEL_19:

        if (!+[MBKeyBag isDeviceKeyBagLocked])
        {
          id v45 = v11;
          BOOL v29 = sub_100043D5C();
          id v30 = v11;

          if (v29)
          {
            if (v5)
            {
              int v31 = open_dprotected_np((const char *)[@"/var/Keychains/keychain-ota-backup.plist" fileSystemRepresentation], 0, 1, 0, 256);
              if (v31 < 0)
              {
                v32 = MBGetDefaultLog();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "Failed to verify keychain keybag because open_dprotected_np failed", buf, 2u);
                  _MBLog();
                }
              }
              else
              {
                uint64_t v44 = 0;
                v32 = _SecKeychainCopyKeybagUUIDFromFileDescriptor();
                if (v32)
                {
                  v33 = +[NSData mb_dataFromHexadecimalString:v32];
                  v34 = [v33 base64EncodedStringWithOptions:0];
                  if (([v5 checkIfBackupHasKeybagWithUUID:v34] & 1) == 0)
                  {
                    log = MBGetDefaultLog();
                    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      CFStringRef v51 = (const __CFString *)v32;
                      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Current backup doesn't have keybag %{public}@", buf, 0xCu);
                      CFStringRef v40 = (const __CFString *)v32;
                      _MBLog();
                    }
                  }
                }
                else
                {
                  v33 = MBGetDefaultLog();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    CFStringRef v51 = @"/var/Keychains/keychain-ota-backup.plist";
                    __int16 v52 = 2114;
                    uint64_t v53 = v44;
                    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Failed to copy the UUID from the keybag plist at %{public}@: %{public}@", buf, 0x16u);
                    CFStringRef v40 = @"/var/Keychains/keychain-ota-backup.plist";
                    uint64_t v41 = v44;
                    _MBLog();
                  }
                }
              }
              close(v31);
            }
            NSFileAttributeKey v48 = NSFileModificationDate;
            v37 = [v7 fileModificationDate:v40, v41];
            v49 = v37;
            v38 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];

            id v43 = v30;
            unsigned __int8 v19 = [v6 setAttributes:v38 ofItemAtPath:@"/var/Keychains/keychain-ota-backup.plist" error:&v43];
            id v11 = v43;

            if ((v19 & 1) == 0)
            {
              [v6 removeItemAtPath:@"/var/Keychains/keychain-ota-backup.plist" error:0];
              if (a4)
              {
                *a4 = +[MBError errorWithCode:100 error:v11 path:@"/var/Keychains/keychain-ota-backup.plist" format:@"Error setting keychain backup modification date"];
              }
            }

            goto LABEL_54;
          }
          if (!a4)
          {
            unsigned __int8 v19 = 0;
            id v11 = v30;
            goto LABEL_54;
          }
          id v35 = v30;
          id v11 = v35;
          goto LABEL_36;
        }
        if (a4)
        {
          __int16 v28 = +[MBError errorWithCode:208 format:@"Can't export modified keychain because the device is locked"];
LABEL_35:
          id v35 = v28;
LABEL_36:
          unsigned __int8 v19 = 0;
          *a4 = v35;
          goto LABEL_54;
        }
        goto LABEL_37;
      }
    }
    else
    {
    }
    if (a4)
    {
      __int16 v28 = +[MBError errorWithCode:100 error:v11 path:@"/var/Keychains/keychain-ota-backup.plist" format:@"Error getting keychain backup attributes"];
      goto LABEL_35;
    }
LABEL_37:
    unsigned __int8 v19 = 0;
    goto LABEL_54;
  }
  if (a4)
  {
    +[MBError errorWithCode:100 error:v8 path:@"/var/Keychains/keychain-2.db-wal" format:@"Error getting keychain database attributes"];
    unsigned __int8 v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v19 = 0;
  }
LABEL_55:

  return v19;
}

+ (BOOL)exportKeychainForCKBackupEngine:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v10 = 0;
  unsigned __int8 v7 = [(id)objc_opt_class() _exportKeychainForCKBackupEngine:v5 error:&v10];
  id v8 = v10;
  if (a4 && (v7 & 1) == 0) {
    *a4 = v8;
  }

  return v7;
}

+ (void)removeServiceKeychainBackup
{
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v5 = @"/var/Keychains/keychain-ota-backup.plist";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Removing %@", buf, 0xCu);
    _MBLog();
  }

  unsigned __int8 v3 = +[NSFileManager defaultManager];
  [v3 removeItemAtPath:@"/var/Keychains/keychain-ota-backup.plist" error:0];
}

- (id)preparingBackupWithEngine:(id)a3
{
  id v4 = a3;
  if ([v4 backsUpPrimaryAccount]
    && ([v4 isDeviceTransferEngine] & 1) == 0)
  {
    if ([v4 isDriveEngine])
    {
      CFStringRef v5 = [(MBKeychainPlugin *)self _preparingBackupWithDriveEngine:v4];
      goto LABEL_12;
    }
    if ([v4 isCloudKitEngine])
    {
      id v6 = [(MBKeychainPlugin *)self _preparingBackupWithCKEngine:v4];
      if (v6)
      {
        unsigned __int8 v7 = MBGetDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v10 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to back up the keychain: %@", buf, 0xCu);
          _MBLog();
        }
      }
    }
  }
  CFStringRef v5 = 0;
LABEL_12:

  return v5;
}

- (id)endingBackupWithEngine:(id)a3
{
  id v3 = a3;
  if ([v3 backsUpPrimaryAccount]
    && ([v3 isDeviceTransferEngine] & 1) == 0
    && [v3 isDriveEngine])
  {
    id v4 = +[NSFileManager defaultManager];
    [v4 removeItemAtPath:@"/var/Keychains/keychain-backup.plist" error:0];

    CFStringRef v5 = [v3 settingsContext];
    id v6 = [v5 encryptionManager];
    id v11 = 0;
    unsigned __int8 v7 = [v6 makeLockdownAndKeychainConsistentWithError:&v11];
    id v8 = v11;

    id v9 = 0;
    if ((v7 & 1) == 0)
    {
      id v9 = +[MBError errorWithCode:1 error:v8 format:@"Error making lockdown and keychain encryption state consistent"];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_endingRestoreWithDriveEngine:(id)a3
{
  id v3 = a3;
  CFStringRef v5 = [v3 persona];
  id v6 = [v5 sharedIncompleteRestoreDirectory];
  unsigned __int8 v7 = [v6 stringByAppendingPathComponent:@"/var/Keychains/keychain-backup.plist"];

  id v8 = [v3 settingsContext];
  id v9 = [v8 password];

  if (+[MBRestoreDirectoryAnnotator isRestoredPath:v7])
  {
    id v10 = [v3 keybag];
    id v31 = 0;
    id v11 = [v10 dataWithError:&v31];
    id v12 = v31;

    if (!v11)
    {
      id v21 = v12;
      int v24 = 1;
      id v15 = v21;
      goto LABEL_19;
    }
    BOOL v13 = [v9 dataUsingEncoding:4];
    id v30 = v12;
    BOOL v14 = sub_10004476C(v7, (uint64_t)v11, (uint64_t)v13, &v30);
    id v15 = v30;

    if (!v14)
    {
      id v21 = v15;

      int v24 = 1;
      id v15 = v21;
      goto LABEL_19;
    }
    double v16 = +[NSFileManager defaultManager];
    [v16 removeItemAtPath:v7 error:0];
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No keychain in backup", buf, 2u);
      _MBLog();
    }
    id v15 = 0;
  }

  double v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Restoring backup password to keychain", buf, 2u);
    _MBLog();
  }

  v18 = [v3 settingsContext];
  unsigned __int8 v19 = [v18 encryptionManager];

  id v28 = v15;
  unsigned __int8 v20 = [v19 setPasswordInKeychain:v9 error:&v28];
  id v21 = v28;

  if (v20)
  {
    id v27 = v21;
    unsigned __int8 v22 = [v19 setWillEncryptInLockdown:v9 != 0 error:&v27];
    id v23 = v27;

    if (v22)
    {
      int v24 = 0;
    }
    else
    {
      int v24 = 1;
      id v15 = +[MBError errorWithCode:1 error:v23 format:@"Error setting WillEncrypt value in lockdown"];
    }
    id v21 = v23;
  }
  else
  {
    int v24 = 1;
    id v15 = +[MBError errorWithCode:1 error:v21 format:@"Error restoring backup password to keychain"];
  }

LABEL_19:
  if (v24) {
    CFStringRef v25 = v15;
  }
  else {
    CFStringRef v25 = 0;
  }

  return v25;
}

- (void)_restoreKeychainBackupAtPath:(id)a3 withEngine:(id)a4
{
  CFStringRef v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)uint64_t v41 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Restoring keychain backup at %{public}@", buf, 0xCu);
    id v30 = v5;
    _MBLog();
  }

  id v39 = 0;
  unsigned int v8 = +[MBProtectionClassUtils getWithPath:v5 error:&v39];
  id v9 = v39;
  if (v8 == 1)
  {
    id v10 = +[NSURL fileURLWithPath:v5 isDirectory:0];
    id v38 = v9;
    id v11 = +[NSFileHandle fileHandleForReadingFromURL:v10 error:&v38];
    id v12 = v38;

    if (!v11)
    {
      id v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)uint64_t v41 = v5;
        *(_WORD *)&v41[8] = 2114;
        *(void *)&v41[10] = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to open the keychain backup at %{public}@: %{public}@", buf, 0x16u);
        _MBLog();
      }
      goto LABEL_39;
    }
    v37 = 0;
    if (objc_opt_respondsToSelector())
    {
      v32 = v11;
      BOOL v13 = [v6 lastKeyBag];
      uint64_t v14 = [v6 secret];
      id v36 = v12;
      id v15 = [v13 dataWithError:&v36];
      id v16 = v36;

      id v35 = v16;
      double v17 = [v13 UUIDWithError:&v35];
      id v18 = v35;

      unsigned __int8 v19 = (void *)v14;
      if (!v15)
      {
        id v11 = v32;
        goto LABEL_38;
      }
      id v11 = v32;
      if (!v17) {
        goto LABEL_38;
      }
LABEL_24:
      [v11 fileDescriptor:v30, v31];
      if ((_SecKeychainRestoreBackupFromFileDescriptor() & 1) == 0)
      {
        id v28 = v37;

        id v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)uint64_t v41 = v5;
          *(_WORD *)&v41[8] = 2114;
          *(void *)&v41[10] = v28;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "_SecKeychainRestoreBackupFromFileDescriptor failed for the keychain backup at %{public}@: %{public}@", buf, 0x16u);
          _MBLog();
        }
        goto LABEL_37;
      }
LABEL_38:

      id v12 = v18;
LABEL_39:

      id v9 = v12;
      goto LABEL_40;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      sub_100099E14();
    }
    [v11 fileDescriptor];
    uint64_t v20 = _SecKeychainCopyKeybagUUIDFromFileDescriptor();
    if (!v20)
    {
      id v28 = v37;

      id v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)uint64_t v41 = v5;
        *(_WORD *)&v41[8] = 2114;
        *(void *)&v41[10] = v37;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to copy the UUID from the keybag at %{public}@: %{public}@", buf, 0x16u);
        _MBLog();
      }
      unsigned __int8 v19 = 0;
      id v15 = 0;
      goto LABEL_37;
    }
    id v21 = v20;
    unsigned __int8 v22 = +[NSData mb_dataFromHexadecimalString:v20];
    id v23 = [v6 keyBagForUUID:v22];
    int v24 = v23;
    if (v23)
    {
      id v34 = v12;
      id v15 = [v23 dataWithError:&v34];
      id v18 = v34;

      if (v15)
      {
        v33 = v22;
        uint64_t v25 = [v6 secretForUUID:v22];
        CFStringRef v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [v15 length];
          *(_DWORD *)buf = 138543618;
          *(void *)uint64_t v41 = v21;
          *(_WORD *)&v41[8] = 2048;
          *(void *)&v41[10] = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Found keybag for keychain restore: %{public}@ (%ld bytes)", buf, 0x16u);
          id v30 = v21;
          id v31 = [v15 length];
          _MBLog();
        }

        unsigned __int8 v19 = (void *)v25;
        goto LABEL_24;
      }
      BOOL v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)uint64_t v41 = v21;
        *(_WORD *)&v41[8] = 2114;
        *(void *)&v41[10] = v18;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to fetch the keybag data for %{public}@: %{public}@", buf, 0x16u);
        _MBLog();
      }
      id v12 = v18;
    }
    else
    {
      BOOL v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)uint64_t v41 = v21;
        *(_WORD *)&v41[8] = 2114;
        *(void *)&v41[10] = v12;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to fetch the keybag for %{public}@: %{public}@", buf, 0x16u);
        _MBLog();
      }
    }

    unsigned __int8 v19 = 0;
    id v15 = 0;
    id v28 = v12;
LABEL_37:

    id v18 = v28;
    goto LABEL_38;
  }
  if (v8 == 255)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)uint64_t v41 = v5;
      *(_WORD *)&v41[8] = 2114;
      *(void *)&v41[10] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to fetch the keychain backup protection class at %{public}@: %{public}@", buf, 0x16u);
LABEL_14:
      _MBLog();
    }
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v41 = v8;
      *(_WORD *)&v41[4] = 2114;
      *(void *)&v41[6] = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Found an unexpected protection class (%d) for the keychain backup at %{public}@", buf, 0x12u);
      goto LABEL_14;
    }
  }
LABEL_40:
}

- (void)_endingRestoreWithServicePolicy:(id)a3 engine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 persona];
  id v9 = [v8 sharedIncompleteRestoreDirectory];
  id v10 = [v9 stringByAppendingPathComponent:@"/var/Keychains/keychain-ota-backup.plist"];

  if (+[MBRestoreDirectoryAnnotator isRestoredPath:v10])
  {
    if ([v6 isRestoringToSameDevice])
    {
      id v28 = 0;
      id v11 = +[MBKeychain allPasswordItemsForServices:&off_1000FDEA8 error:&v28];
      id v12 = v28;
      if (!v11)
      {
        BOOL v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v30 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to fetch the preserved keychain items: %{public}@", buf, 0xCu);
          _MBLog();
        }
      }
      uint64_t v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v11 count];
        id v16 = MBStringWithArray();
        *(_DWORD *)buf = 134218242;
        id v30 = v15;
        __int16 v31 = 2112;
        v32 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Preserving %ld keychain items: %@", buf, 0x16u);

        [v11 count];
        CFStringRef v26 = MBStringWithArray();
        _MBLog();
      }
      [(MBKeychainPlugin *)self _restoreKeychainBackupAtPath:v10 withEngine:v7];
      double v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removing the keychain backup at %{public}@", buf, 0xCu);
        _MBLog();
      }

      id v18 = +[NSFileManager defaultManager];
      [v18 removeItemAtPath:v10 error:0];

      id v27 = v12;
      unsigned __int8 v19 = +[MBKeychain addAllPasswordItems:v11 error:&v27];
      uint64_t v20 = v27;

      id v21 = MBGetDefaultLog();
      unsigned __int8 v22 = v21;
      if (v19)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v11 count];
          *(_DWORD *)buf = 134217984;
          id v30 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Added %ld preserved keychain items to the restored keychain", buf, 0xCu);
          [v11 count];
LABEL_21:
          _MBLog();
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v25 = [v11 count];
        *(_DWORD *)buf = 134218242;
        id v30 = v25;
        __int16 v31 = 2114;
        v32 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to add %ld items to the restored keychain: %{public}@", buf, 0x16u);
        [v11 count];
        goto LABEL_21;
      }

      goto LABEL_23;
    }
    int v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Can't migrate keychain - removing the keychain backup at %{public}@", buf, 0xCu);
      _MBLog();
    }

    uint64_t v20 = +[NSFileManager defaultManager];
    [v20 removeItemAtPath:v10 error:0];
  }
  else
  {
    uint64_t v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No keychain in backup", buf, 2u);
      _MBLog();
    }
  }
LABEL_23:
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 restoresPrimaryAccount]
    && ([v7 isDeviceTransferEngine] & 1) == 0)
  {
    if ([v7 isDriveEngine])
    {
      unsigned int v8 = [(MBKeychainPlugin *)self _endingRestoreWithDriveEngine:v7];
      goto LABEL_7;
    }
    [(MBKeychainPlugin *)self _endingRestoreWithServicePolicy:v6 engine:v7];
  }
  unsigned int v8 = 0;
LABEL_7:

  return v8;
}

@end