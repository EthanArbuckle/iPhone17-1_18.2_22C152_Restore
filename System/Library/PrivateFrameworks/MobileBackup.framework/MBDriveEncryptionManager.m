@interface MBDriveEncryptionManager
+ (id)encryptionManagerWithSettingsContext:(id)a3;
- (BOOL)_changeBackupKeyBagPasswordInProperties:(id)a3 fromPassword:(id)a4 toPassword:(id)a5 error:(id *)a6;
- (BOOL)changePasswordFrom:(id)a3 toPassword:(id)a4 error:(id *)a5;
- (BOOL)makeLockdownAndKeychainConsistentWithError:(id *)a3;
- (BOOL)setPasswordInKeychain:(id)a3 error:(id *)a4;
- (BOOL)setWillEncryptInLockdown:(BOOL)a3 error:(id *)a4;
- (MBDriveEncryptionManager)initWithSettingsContext:(id)a3;
- (MBDriveSettingsContext)settingsContext;
- (void)dealloc;
@end

@implementation MBDriveEncryptionManager

+ (id)encryptionManagerWithSettingsContext:(id)a3
{
  v3 = [[MBDriveEncryptionManager alloc] initWithSettingsContext:a3];
  return v3;
}

- (MBDriveEncryptionManager)initWithSettingsContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBDriveEncryptionManager;
  v4 = [(MBDriveEncryptionManager *)&v6 init];
  if (v4) {
    v4->_settingsContext = (MBDriveSettingsContext *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDriveEncryptionManager;
  [(MBDriveEncryptionManager *)&v3 dealloc];
}

- (BOOL)_changeBackupKeyBagPasswordInProperties:(id)a3 fromPassword:(id)a4 toPassword:(id)a5 error:(id *)a6
{
  id v10 = [a3 keybagData];
  if (v10)
  {
    id v11 = v10;
    v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Decoding backup keybag", buf, 2u);
      _MBLog();
    }
    v13 = +[MBKeyBag keybagWithData:v11 error:a6];
    if (v13)
    {
      v14 = v13;
      v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Changing backup keybag password", v20, 2u);
        _MBLog();
      }
      LODWORD(v13) = [(MBKeyBag *)v14 changePasswordFrom:a4 toPassword:a5 error:a6];
      if (v13)
      {
        v16 = MBGetDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Encoding backup keybag", v19, 2u);
          _MBLog();
        }
        v13 = [(MBKeyBag *)v14 dataWithError:a6];
        if (v13)
        {
          [a3 setKeybagData:v13];
          LOBYTE(v13) = 1;
        }
      }
    }
  }
  else if (a6)
  {
    v17 = +[MBError errorWithCode:205 format:@"No backup keybag data in encrypted backup properties"];
    LOBYTE(v13) = 0;
    *a6 = v17;
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return (char)v13;
}

- (BOOL)changePasswordFrom:(id)a3 toPassword:(id)a4 error:(id *)a5
{
  v50 = 0;
  uint64_t v9 = objc_opt_new();
  if (!v9) {
    __assert_rtn("-[MBDriveEncryptionManager changePasswordFrom:toPassword:error:]", "MBDriveEncryptionManager.m", 86, "passcodePromptContext");
  }
  id v10 = (void *)v9;
  uint64_t v11 = objc_opt_new();
  if (!v11) {
    __assert_rtn("-[MBDriveEncryptionManager changePasswordFrom:toPassword:error:]", "MBDriveEncryptionManager.m", 88, "laOptions");
  }
  uint64_t v12 = v11;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  v13 = dispatch_semaphore_create(0);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100082498;
  v45[3] = &unk_1004118B8;
  v45[4] = v13;
  v45[5] = &v46;
  [v10 evaluatePolicy:1013 options:v12 reply:v45];
  dispatch_time_t v14 = dispatch_time(0, 1800000000000);
  if (!dispatch_semaphore_wait(v13, v14))
  {

    if (!*((unsigned char *)v47 + 24))
    {
      if (a5)
      {
        v16 = +[MBError errorWithCode:208 format:@"Device locked"];
        goto LABEL_8;
      }
      goto LABEL_91;
    }
    v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Changing backup password", buf, 2u);
      _MBLog();
    }
    BOOL v19 = a3 == 0;
    if (!a3)
    {
      v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "oldPassword is NULL", buf, 2u);
        _MBLog();
      }
    }
    if (!a4)
    {
      v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "newPassword is NULL", buf, 2u);
        _MBLog();
      }
    }
    id v22 = +[MBKeychainManager fetchLocalBackupPasswordAndReturnError:&v50];
    if (v22)
    {
      if (![a3 isEqualToString:v22])
      {
        v29 = MBGetDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Passwords don't match", buf, 2u);
          _MBLog();
        }
        unsigned int v30 = ![(MBDriveEncryptionManager *)self setWillEncryptInLockdown:1 error:a5];
        if (!a5) {
          LOBYTE(v30) = 1;
        }
        if ((v30 & 1) == 0)
        {
          v16 = +[MBError errorWithCode:207 format:@"Invalid password"];
          goto LABEL_8;
        }
        goto LABEL_91;
      }
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Password matches", buf, 2u);
        _MBLog();
      }
      if (!a4)
      {
        if (![(MBDriveEncryptionManager *)self setWillEncryptInLockdown:0 error:a5])goto LABEL_91; {
        unsigned __int8 v31 = +[MBKeychainManager removeLocalBackupPasswordAndReturnError:a5];
        }
        goto LABEL_52;
      }
      if (!+[MBKeychainManager updateLocalBackupPassword:a4 error:a5])goto LABEL_91; {
      BOOL v19 = 0;
      }
      BOOL v17 = 0;
      if (![(MBDriveEncryptionManager *)self setWillEncryptInLockdown:1 error:a5])goto LABEL_92; {
    }
      }
    else
    {
      if (!+[MBError isError:v50 withCode:4]) {
        goto LABEL_89;
      }
      v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "No password is currently set", buf, 2u);
        _MBLog();
      }
      if (!a4)
      {
        v32 = MBGetDefaultLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "No password given to add either", buf, 2u);
          _MBLog();
        }
        unsigned __int8 v31 = [(MBDriveEncryptionManager *)self setWillEncryptInLockdown:0 error:a5];
LABEL_52:
        if (v31)
        {
LABEL_53:
          BOOL v17 = 1;
          goto LABEL_92;
        }
LABEL_91:
        BOOL v17 = 0;
        goto LABEL_92;
      }
      if (!+[MBKeychainManager addLocalBackupPassword:a4 error:a5]|| ![(MBDriveEncryptionManager *)self setWillEncryptInLockdown:1 error:a5])
      {
        goto LABEL_91;
      }
    }
    v25 = +[MBDriveProperties propertiesWithDrive:[(MBDriveSettingsContext *)self->_settingsContext drive] path:[(MBDriveSettingsContext *)self->_settingsContext driveSnapshotPropertiesPath] error:&v50];
    v26 = v25;
    if (v25)
    {
      if (![(MBProperties *)v25 encrypted])
      {
        v38 = MBGetDefaultLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Snapshot not encrypted", buf, 2u);
          _MBLog();
        }
        goto LABEL_53;
      }
      v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Changing snapshot properties password", buf, 2u);
        _MBLog();
      }
      if (v19)
      {
        v28 = MBGetDefaultLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Skipping change snapshot properties password - oldPassword is NULL", buf, 2u);
          _MBLog();
        }
        goto LABEL_53;
      }
      if ([(MBDriveEncryptionManager *)self _changeBackupKeyBagPasswordInProperties:v26 fromPassword:a3 toPassword:a4 error:&v50])
      {
        unsigned __int8 v31 = [[(MBDriveSettingsContext *)self->_settingsContext drive] uploadPropertyList:[(MBProperties *)v26 propertyList] toPath:[(MBDriveSettingsContext *)self->_settingsContext driveSnapshotPropertiesPath] options:0 error:&v50];
        goto LABEL_52;
      }
      if (+[MBError isError:v50 withCode:207])
      {
        v39 = MBGetDefaultLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Password in keychain doesn't match snapshot keybag", buf, 2u);
          _MBLog();
        }
        goto LABEL_78;
      }
LABEL_89:
      if (a5)
      {
        BOOL v17 = 0;
        *a5 = v50;
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    if (!+[MBError isError:v50 withCode:4])
    {
      if (a5)
      {
        v16 = +[MBBackupHelper driveReadError:v50 description:@"Error reading snapshot manifest properties"];
        goto LABEL_8;
      }
      goto LABEL_91;
    }
    v33 = MBGetDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "No snapshot properties found", buf, 2u);
      _MBLog();
    }
    v34 = +[MBDriveProperties propertiesWithDrive:[(MBDriveSettingsContext *)self->_settingsContext drive] path:[(MBDriveSettingsContext *)self->_settingsContext driveBackupPropertiesPath] error:&v50];
    v35 = v34;
    if (v34)
    {
      if (![(MBProperties *)v34 encrypted])
      {
        v41 = MBGetDefaultLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Backup not encrypted", buf, 2u);
          _MBLog();
        }
        goto LABEL_78;
      }
      v36 = MBGetDefaultLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Changing backup properties password", buf, 2u);
        _MBLog();
      }
      if (v19)
      {
        v37 = MBGetDefaultLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Skipping change backup properties password - oldPassword is NULL", buf, 2u);
          _MBLog();
        }
        goto LABEL_78;
      }
      if (![(MBDriveEncryptionManager *)self _changeBackupKeyBagPasswordInProperties:v35 fromPassword:a3 toPassword:a4 error:&v50])
      {
        if (+[MBError isError:v50 withCode:207])
        {
          v42 = MBGetDefaultLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Password in keychain doesn't match backup keybag", buf, 2u);
            _MBLog();
          }
          goto LABEL_78;
        }
        goto LABEL_89;
      }
      if (![[(MBDriveSettingsContext *)self->_settingsContext drive] uploadPropertyList:[(MBProperties *)v35 propertyList] toPath:[(MBDriveSettingsContext *)self->_settingsContext driveBackupPropertiesPath] options:0 error:a5])goto LABEL_91; {
    }
      }
    else
    {
      if (!+[MBError isError:v50 withCode:4])
      {
        if (a5)
        {
          v16 = +[MBBackupHelper driveReadError:v50 description:@"Error reading backup manifest properties"];
          goto LABEL_8;
        }
        goto LABEL_91;
      }
      v40 = MBGetDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "No properties found in backup or snapshot", buf, 2u);
        _MBLog();
      }
    }
LABEL_78:
    v50 = 0;
    goto LABEL_53;
  }
  v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v52 = 30;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Timed out waiting %lld minutes for passcode", buf, 0xCu);
    uint64_t v44 = 30;
    _MBLog();
  }
  objc_msgSend(v10, "invalidate", v44);

  if (!a5) {
    goto LABEL_91;
  }
  v16 = +[MBError errorWithCode:208 format:@"Device locked - timeout waiting for passcode entry"];
LABEL_8:
  BOOL v17 = 0;
  *a5 = v16;
LABEL_92:
  _Block_object_dispose(&v46, 8);
  return v17;
}

- (BOOL)setPasswordInKeychain:(id)a3 error:(id *)a4
{
  v7 = 0;
  if (+[MBKeychainManager fetchLocalBackupPasswordAndReturnError:&v7])
  {
    if (a3) {
      return +[MBKeychainManager updateLocalBackupPassword:a3 error:a4];
    }
    else {
      return +[MBKeychainManager removeLocalBackupPasswordAndReturnError:a4];
    }
  }
  else if (+[MBError isError:v7 withCode:4])
  {
    if (a3) {
      return +[MBKeychainManager addLocalBackupPassword:a3 error:a4];
    }
    else {
      return 1;
    }
  }
  else
  {
    BOOL result = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  return result;
}

- (BOOL)makeLockdownAndKeychainConsistentWithError:(id *)a3
{
  id v10 = 0;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Making lockdown and keychain consistent", v9, 2u);
    _MBLog();
  }
  if (+[MBKeychainManager fetchLocalBackupPasswordAndReturnError:&v10])
  {
    objc_super v6 = self;
    uint64_t v7 = 1;
    return [(MBDriveEncryptionManager *)v6 setWillEncryptInLockdown:v7 error:a3];
  }
  if (+[MBError isError:v10 withCode:4])
  {
    objc_super v6 = self;
    uint64_t v7 = 0;
    return [(MBDriveEncryptionManager *)v6 setWillEncryptInLockdown:v7 error:a3];
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v10;
  }
  return result;
}

- (BOOL)setWillEncryptInLockdown:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  objc_super v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting WillEncrypt=%d in lockdown", buf, 8u);
    BOOL v13 = v5;
    _MBLog();
  }
  id v7 = +[MBLockdown connect];
  if (!v5)
  {
    id v8 = +[MCProfileConnection sharedConnection];
    if ([v8 effectiveBoolValueForSetting:MCFeatureEncryptedBackupRequired] == 1)
    {
      if (a4)
      {
        CFStringRef v9 = @"Cannot remove iTunes Backup Encryption - Encrypted Backup MDM setting present on device";
        uint64_t v10 = 22;
LABEL_11:
        unsigned __int8 v11 = 0;
        *a4 = +[MBError errorWithCode:v10 format:v9];
        return v11;
      }
      return 0;
    }
  }
  if (!v7)
  {
    if (a4)
    {
      CFStringRef v9 = @"Error connecting to lockdown";
      uint64_t v10 = 1;
      goto LABEL_11;
    }
    return 0;
  }
  unsigned __int8 v11 = objc_msgSend(v7, "setObject:forDomain:andKey:withError:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5), @"com.apple.mobile.backup", @"WillEncrypt", a4);
  [v7 disconnect];
  return v11;
}

- (MBDriveSettingsContext)settingsContext
{
  return self->_settingsContext;
}

@end