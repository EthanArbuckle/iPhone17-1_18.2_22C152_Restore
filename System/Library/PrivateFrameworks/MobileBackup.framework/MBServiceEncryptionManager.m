@interface MBServiceEncryptionManager
- (BOOL)_registerKeyBag:(id)a3 withID:(unsigned int)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)removeRestoreKeyBagsWithError:(id *)a3;
- (BOOL)rollKeyBagWithKeyBagID:(unsigned int *)a3 forEngine:(id)a4 error:(id *)a5;
- (BOOL)saveRestoreKeyBagDatasByID:(id)a3 secret:(id)a4 error:(id *)a5;
- (BOOL)setupBackupWithPasscode:(id)a3 userInitiated:(BOOL)a4 keybagID:(unsigned int *)a5 error:(id *)a6;
- (BOOL)suppressAuthorization;
- (BOOL)tearDownBackupWithError:(id *)a3;
- (MBKeyBag)keybag;
- (MBServiceEncryptionManager)initWithEngine:(id)a3;
- (MBServiceEncryptionManager)initWithSettingsContext:(id)a3;
- (NSData)keybagUUID;
- (id)keybagPath;
- (id)keysetForBackupUDID:(id)a3 lastModified:(int64_t *)a4 userInitiated:(BOOL)a5 error:(id *)a6;
- (id)keysetForBackupUDID:(id)a3 lastModified:(int64_t *)a4 userInitiated:(BOOL)a5 willVerifyCredentialsCallback:(id)a6 error:(id *)a7;
- (id)loadRestoreKeyBagsByIDWithError:(id *)a3;
- (void)_exportKeychain;
- (void)_findMissingEncryptionKeys;
- (void)dealloc;
- (void)keybagIsLocking;
- (void)keybagIsUnlocked;
- (void)setSuppressAuthorization:(BOOL)a3;
@end

@implementation MBServiceEncryptionManager

- (MBServiceEncryptionManager)initWithSettingsContext:(id)a3
{
  id v5 = [a3 account];
  id v6 = objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", objc_msgSend(v5, "persona"));
  v9.receiver = self;
  v9.super_class = (Class)MBServiceEncryptionManager;
  v7 = [(MBServiceEncryptionManager *)&v9 init];
  if (v7)
  {
    v7->_settingsContext = (MBServiceSettingsContext *)a3;
    v7->_service = [[MBService alloc] initWithAccount:v5];
    v7->_cache = -[MBServiceCache initWithPath:domainManager:]([MBServiceCache alloc], "initWithPath:domainManager:", [a3 cachePath], v6);
  }
  return v7;
}

- (MBServiceEncryptionManager)initWithEngine:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBServiceEncryptionManager;
  v4 = [(MBServiceEncryptionManager *)&v6 init];
  if (v4)
  {
    v4->_settingsContext = (MBServiceSettingsContext *)[a3 settingsContext];
    v4->_service = (MBService *)[a3 service];
    v4->_cache = (MBServiceCache *)[a3 cache];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBServiceEncryptionManager;
  [(MBServiceEncryptionManager *)&v3 dealloc];
}

- (id)keybagPath
{
  return 0;
}

- (MBKeyBag)keybag
{
  return (MBKeyBag *)+[MBKeyBag sharedOTAKeyBag];
}

- (NSData)keybagUUID
{
  keybagUUID = self->_keybagUUID;
  if (!keybagUUID)
  {
    uint64_t v9 = 0;
    if ([(MBServiceEncryptionManager *)self keybag])
    {
      objc_super v6 = [(MBKeyBag *)[(MBServiceEncryptionManager *)self keybag] UUIDWithError:&v9];
      if (v6)
      {
        v7 = v6;
        self->_keybagUUID = v6;
        return v7;
      }
      if ((+[MBError isError:v9 withCode:4] & 1) == 0)
      {
        id v8 = objc_alloc((Class)MBException);
        objc_exception_throw([v8 initWithCode:1, @"Error getting registered OTA keybag UUID: %@", v9 format]);
      }
    }
    return 0;
  }
  objc_super v3 = keybagUUID;
  return v3;
}

- (id)keysetForBackupUDID:(id)a3 lastModified:(int64_t *)a4 userInitiated:(BOOL)a5 willVerifyCredentialsCallback:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  v32 = 0;
  -[MBService setSuppressUnauthorizedAlert:](self->_service, "setSuppressUnauthorizedAlert:", 1, a4);
  id v12 = [(MBService *)self->_service keysetForBackupUDID:a3 lastModified:0 error:&v32];
  [(MBService *)self->_service setSuppressUnauthorizedAlert:0];
  if (v12)
  {
    id v26 = a3;
    v27 = self;
    id v13 = +[NSMutableArray array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = [v12 keys];
    id v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v19 keyID] >= 2)
          {
            if ([v19 keyData])
            {
              id v20 = objc_msgSend(+[MBKeyBag OTAKeyBagWithData:error:](MBKeyBag, "OTAKeyBagWithData:error:", objc_msgSend(v19, "keyData"), 0), "UUIDWithError:", 0);
              if (v20) {
                objc_msgSend(v13, "addObject:", +[MBKeyBagInfo infoWithID:uuid:](MBKeyBagInfo, "infoWithID:uuid:", objc_msgSend(v19, "keyID"), objc_msgSend(v20, "bytes")));
              }
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v16);
    }
    [(MBServiceCache *)v27->_cache open];
    [(MBServiceCache *)v27->_cache setKeyBagInfo:v13 forBackupUDID:v26];
    [(MBServiceCache *)v27->_cache close];
    return v12;
  }
  if (!+[MBError isError:v32 withCode:305]
    || [(MBServiceEncryptionManager *)self suppressAuthorization])
  {
    if (a7) {
      *a7 = v32;
    }
    return v12;
  }
  if (!a6 || ((*((uint64_t (**)(id))a6 + 2))(a6) & 1) != 0)
  {
    [(MBServiceLockManager *)[(MBServiceSettingsContext *)self->_settingsContext lockManager] stopRenewingLock];
    [(MBService *)self->_service removeLockForBackupUDID:a3];
    [(MBWatchdog *)[(MBServiceSettingsContext *)self->_settingsContext watchdog] suspend];
    [(MBPowerAssertion *)[(MBServiceSettingsContext *)self->_settingsContext powerAssertion] drop];
    [+[MBDaemon sharedDaemon] holdWorkAssertion:"verifyAppleAccountCredentialsWithContext:"];
    if ([(MBServiceAccount *)[(MBServiceSettingsContext *)self->_settingsContext account] verifyAppleAccountCredentialsWithContext:!v9])
    {
      id v21 = [(MBService *)self->_service lockForBackupUDID:a3];
      if ([v21 state] == 1) {
        [v21 setState:0];
      }
      [(MBWatchdog *)[(MBServiceSettingsContext *)self->_settingsContext watchdog] resume];
      [(MBServiceLockManager *)[(MBServiceSettingsContext *)self->_settingsContext lockManager] startRenewingLock];
      [(MBPowerAssertion *)[(MBServiceSettingsContext *)self->_settingsContext powerAssertion] hold];
      [(MBServiceCache *)self->_cache forceRefreshForBackupUDID:a3];
      if (!a7) {
        goto LABEL_28;
      }
      CFStringRef v22 = @"Apple account updated; sequence should be retried.";
      uint64_t v23 = 17;
    }
    else
    {
      [(MBWatchdog *)[(MBServiceSettingsContext *)self->_settingsContext watchdog] resume];
      if (!a7)
      {
LABEL_28:
        [+[MBDaemon sharedDaemon] holdWorkAssertion:"verifyAppleAccountCredentialsWithContext:"];
        return v12;
      }
      CFStringRef v22 = @"Error verifying account credentials";
      uint64_t v23 = 305;
    }
    *a7 = +[MBError errorWithCode:v23 format:v22];
    goto LABEL_28;
  }
  if (a7) {
    *a7 = +[MBError errorWithCode:202 format:@"Cancelled"];
  }
  return v12;
}

- (id)keysetForBackupUDID:(id)a3 lastModified:(int64_t *)a4 userInitiated:(BOOL)a5 error:(id *)a6
{
  return [(MBServiceEncryptionManager *)self keysetForBackupUDID:a3 lastModified:a4 userInitiated:a5 willVerifyCredentialsCallback:0 error:a6];
}

- (BOOL)_registerKeyBag:(id)a3 withID:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registering keybag: %u", buf, 8u);
    uint64_t v25 = v8;
    _MBLog();
  }

  self->_keybagUUID = 0;
  if (([a3 registerWithPasscode:a5 error:a6] & 1) == 0)
  {
    if (!a6) {
      return 0;
    }
    id v18 = *a6;
    CFStringRef v19 = @"Error registering keybag";
    uint64_t v20 = 1;
LABEL_13:
    id v21 = +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v20, v18, v19, v25);
LABEL_14:
    CFStringRef v22 = v21;
    BOOL result = 0;
    *a6 = v22;
    return result;
  }
  id v12 = [(MBServiceEncryptionManager *)self keybagUUID];
  uint64_t v13 = MBDeviceUDID_Legacy();
  [(MBServiceCache *)self->_cache open];
  [(MBServiceCache *)self->_cache refreshForBackupUDID:v13 service:self->_service deleted:0 error:a6];
  id v14 = [(MBServiceCache *)self->_cache backupForUDID:v13 lastModified:0];
  [(MBServiceCache *)self->_cache close];
  id v15 = objc_msgSend(objc_msgSend(v14, "snapshots"), "lastObject");
  if (objc_msgSend(objc_msgSend(objc_msgSend(v15, "attributes"), "keybagUUID"), "isEqualToData:", v12)) {
    return 1;
  }
  id v16 = +[MBSSnapshot snapshot];
  *(void *)buf = 0;
  objc_msgSend(v16, "setAttributes:", +[MBSSnapshotAttributes systemAttributes](MBSSnapshotAttributes, "systemAttributes"));
  objc_msgSend(objc_msgSend(v16, "attributes"), "setKeybagID:", v8);
  objc_msgSend(objc_msgSend(v16, "attributes"), "setKeybagUUID:", v12);
  if (!v15 || [v15 committed])
  {
    uint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Creating snapshot", v26, 2u);
      _MBLog();
    }
    objc_msgSend(v16, "setQuotaReserved:", 0, v25);
    objc_msgSend(objc_msgSend(v16, "attributes"), "setBackupReason:", 0);
    objc_msgSend(objc_msgSend(v16, "attributes"), "setBackupType:", v15 != 0);
    *(_DWORD *)id v26 = 0;
    if (![(MBService *)self->_service createSnapshot:v16 backupUDID:v13 lastModified:buf error:a6 snapshotID:v26])
    {
      [(MBServiceCache *)self->_cache forceRefreshForBackupUDID:v13];
      if (a6) {
        *a6 = +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", [*a6 code], *a6, @"Error creating snapshot");
      }
      return 0;
    }
    [v16 setSnapshotID:*(unsigned int *)v26];
    goto LABEL_20;
  }
  v24 = MBGetDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updating last snapshot", v26, 2u);
    _MBLog();
  }
  objc_msgSend(v16, "setSnapshotID:", objc_msgSend(v15, "snapshotID", v25));
  objc_msgSend(v16, "setQuotaReserved:", objc_msgSend(v15, "quotaReserved"));
  if (![(MBService *)self->_service updateSnapshot:v16 backupUDID:v13 lastModified:buf error:a6])
  {
    [(MBServiceCache *)self->_cache forceRefreshForBackupUDID:v13];
    if (!a6) {
      return 0;
    }
    uint64_t v20 = (uint64_t)[*a6 code];
    id v18 = *a6;
    CFStringRef v19 = @"Error updating snapshot";
    goto LABEL_13;
  }
LABEL_20:
  if (*(uint64_t *)buf > 0)
  {
    objc_msgSend(v16, "setLastModified:");
    [(MBServiceCache *)self->_cache open];
    [(MBServiceCache *)self->_cache begin];
    [(MBServiceCache *)self->_cache addSnapshot:v16 backupUDID:v13];
    [(MBServiceCache *)self->_cache setLastModified:*(void *)buf forBackupUDID:v13];
    [(MBServiceCache *)self->_cache end];
    [(MBServiceCache *)self->_cache close];
    return 1;
  }
  if (a6)
  {
    id v21 = +[MBError errorWithCode:309 format:@"No Last-Modified value in response to creating or updating snapshot"];
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)setupBackupWithPasscode:(id)a3 userInitiated:(BOOL)a4 keybagID:(unsigned int *)a5 error:(id *)a6
{
  BOOL v6 = a4;
  uint64_t v75 = 0;
  id v76 = 0;
  uint64_t v8 = MBDeviceUDID_Legacy();
  BOOL v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Setting up backup keybag", buf, 2u);
    _MBLog();
  }
  if (![(MBServiceSettingsContext *)self->_settingsContext account])
  {
    if (a6)
    {
      uint64_t v23 = +[MBError errorWithCode:210 format:@"No account"];
      goto LABEL_37;
    }
LABEL_132:
    LOBYTE(v23) = 0;
    return (char)v23;
  }
  id v74 = 0;
  unsigned int v10 = objc_msgSend(-[MBService lockForBackupUDID:](self->_service, "lockForBackupUDID:", v8), "state");
  id v11 = 0;
  char v12 = 0;
  BOOL v66 = v10 != 1;
  while (1)
  {
    while (1)
    {
      char v13 = v12;
      if (objc_msgSend(-[MBService lockForBackupUDID:](self->_service, "lockForBackupUDID:", v8), "state") != 1)
      {
        id v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Acquiring lock", buf, 2u);
          _MBLog();
        }
        [(MBService *)self->_service setLock:+[MBSLock lockWithState:0 type:0 timeout:600] forBackupUDID:v8];
        BOOL v66 = 0;
      }
      if ((v13 & 1) != 0 && [(MBService *)self->_service wasCancelled])
      {
        id v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Postponing cancel until we get the keybag after verifying credentials", buf, 2u);
          _MBLog();
        }
        [(MBService *)self->_service setCancelled:0];
        int v67 = 1;
      }
      else
      {
        int v67 = 0;
      }
      unsigned int v73 = 0;
      [(MBServiceCache *)self->_cache open];
      if ([(MBServiceCache *)self->_cache refreshForBackupUDID:v8 service:self->_service deleted:0 error:&v76])
      {
        id v16 = [(MBServiceCache *)self->_cache backupForUDID:v8 lastModified:0];
        [(MBServiceCache *)self->_cache keybagUUID:&v74 keybagID:&v73 forBackupUDID:v8];
        int v17 = 1;
        id v11 = v16;
      }
      else if (a6)
      {
        id v18 = [v76 code];
        int v17 = 0;
        *a6 = +[MBError errorWithCode:v18 error:v76 format:@"Error refreshing cache"];
      }
      else
      {
        int v17 = 0;
      }
      [(MBServiceCache *)self->_cache close];
      if (!v17) {
        goto LABEL_132;
      }
      CFStringRef v19 = [(MBServiceEncryptionManager *)self keybagUUID];
      if (v19 && v74 && -[NSData isEqualToData:](v19, "isEqualToData:"))
      {
        id v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v80 = v74;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Skipping setting up backup because local and remote keybags match: %@", buf, 0xCu);
          _MBLog();
        }
        if (a5) {
          *a5 = v73;
        }
        goto LABEL_46;
      }
      if (v11) {
        break;
      }
      char v12 = 1;
      if ((v13 & 1) == 0)
      {
        v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Creating backup", buf, 2u);
          _MBLog();
        }
        id v29 = +[MBSBackup backup];
        [v29 setBackupUDID:MBDataWithString()];
        if (![v29 backupUDID]) {
          [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBServiceEncryptionManager.m", 499, @"Failed to convert backup UDID: \"%@\"", v8 object file lineNumber description];
        }
        objc_msgSend(v29, "setAttributes:", +[MBSBackupAttributes systemAttributes](MBSBackupAttributes, "systemAttributes"));
        if (![(MBService *)self->_service postBackup:v29 lastModified:&v75 error:&v76])
        {
          [(MBServiceCache *)self->_cache forceRefreshForBackupUDID:v8];
          if (a6)
          {
            id v59 = [v76 code];
            uint64_t v23 = +[MBError errorWithCode:v59 error:v76 format:@"Error creating backup"];
            goto LABEL_37;
          }
          goto LABEL_132;
        }
        if (v75 <= 0)
        {
          if (a6)
          {
            uint64_t v23 = +[MBError errorWithCode:309 format:@"No Last-Modified value in response to creating backup"];
            goto LABEL_37;
          }
          goto LABEL_132;
        }
        [(MBServiceCache *)self->_cache open];
        [(MBServiceCache *)self->_cache addBackup:v29 lastModified:v75];
        [(MBServiceCache *)self->_cache close];
        goto LABEL_59;
      }
    }
    uint64_t v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Getting keybag from existing backup", buf, 2u);
      _MBLog();
    }
    id v21 = [(MBServiceEncryptionManager *)self keysetForBackupUDID:v8 lastModified:0 userInitiated:v6 error:&v76];
    CFStringRef v22 = v21;
    if (v21) {
      break;
    }
    if ((v13 & 1) != 0
      || (+[MBError isError:v76 withCode:17] & 1) == 0)
    {
      if (!a6) {
        goto LABEL_132;
      }
      id v24 = [v76 code];
      uint64_t v23 = +[MBError errorWithCode:v24 error:v76 format:@"Error getting backup keys"];
      goto LABEL_37;
    }
    char v12 = 1;
  }
  if (![v21 keysCount])
  {
    long long v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Keys not found in backup", buf, 2u);
      _MBLog();
    }
    [(MBServiceCache *)self->_cache open];
    unsigned int v31 = [(MBServiceCache *)self->_cache encryptedFilesExistForBackupUDID:v8];
    [(MBServiceCache *)self->_cache close];
    if (v31)
    {
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:205 format:@"Backup contains encrypted files but no keys"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
LABEL_59:
    v32 = MBGetDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Creating random secret", buf, 2u);
      _MBLog();
    }
    id v33 = +[MBKeyBag randomSecret];
    v34 = MBGetDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Creating keybag", buf, 2u);
      _MBLog();
    }
    id v35 = +[MBKeyBag OTAKeyBagWithSecret:v33 error:&v76];
    if (!v35)
    {
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:1 error:v76 format:@"Error creating keybag"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    v36 = MBGetDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Serializing keybag", buf, 2u);
      _MBLog();
    }
    id v37 = [v35 dataWithError:&v76];
    if (!v37)
    {
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:1 error:v76 format:@"Error getting keybag data"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    v38 = MBGetDefaultLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Getting keybag UUID", buf, 2u);
      _MBLog();
    }
    id v74 = [v35 UUIDWithError:&v76];
    if (!v74)
    {
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:1 error:v76 format:@"Error getting backup keybag UUID"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    v39 = MBGetDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Creating backup keys", buf, 2u);
      _MBLog();
    }
    v40 = objc_alloc_init(MBSKeySet);
    v41 = objc_alloc_init(MBSKey);
    [(MBSKey *)v41 setKeyID:1];
    [(MBSKey *)v41 setKeyData:v33];
    [(MBSKeySet *)v40 addKey:v41];
    v42 = objc_alloc_init(MBSKey);
    [(MBSKey *)v42 setKeyID:2];
    [(MBSKey *)v42 setKeyData:v37];
    [(MBSKeySet *)v40 addKey:v42];
    unsigned __int8 v43 = [(MBService *)self->_service createKeySet:v40 forBackupUDID:v8 lastModified:&v75 error:&v76];
    cache = self->_cache;
    if ((v43 & 1) == 0)
    {
      [(MBServiceCache *)cache forceRefreshForBackupUDID:v8];
      if (a6)
      {
        id v60 = [v76 code];
        uint64_t v23 = +[MBError errorWithCode:v60 error:v76 format:@"Error creating backup keys"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    [(MBServiceCache *)cache open];
    [(MBServiceCache *)self->_cache setLastModified:v75 forBackupUDID:v8];
    v45 = self->_cache;
    v77 = +[MBKeyBagInfo infoWithID:uuid:](MBKeyBagInfo, "infoWithID:uuid:", 2, [v74 bytes]);
    [(MBServiceCache *)v45 setKeyBagInfo:+[NSArray arrayWithObjects:&v77 count:1] forBackupUDID:v8];
    [(MBServiceCache *)self->_cache close];
    uint64_t v46 = 2;
LABEL_98:
    LODWORD(v23) = [(MBServiceEncryptionManager *)self _registerKeyBag:v35 withID:v46 passcode:a3 error:&v76];
    if (!v23) {
      return (char)v23;
    }
    if (v66)
    {
      v58 = MBGetDefaultLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Releasing lock", buf, 2u);
        _MBLog();
      }
      objc_msgSend(-[MBService lockForBackupUDID:](self->_service, "lockForBackupUDID:", v8), "setState:", 2);
      if (![(MBService *)self->_service backupForUDID:v8 lastModified:0 error:&v76])
      {
        if (a6)
        {
          id v61 = [v76 code];
          uint64_t v23 = +[MBError errorWithCode:v61 error:v76 format:@"Error releasing lock"];
          goto LABEL_37;
        }
        goto LABEL_132;
      }
    }
    if (v67)
    {
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:202 format:@"Request cancelled"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    if (a5) {
      *a5 = v46;
    }
LABEL_46:
    LOBYTE(v23) = 1;
    return (char)v23;
  }
  if ((unint64_t)[v22 keysCount] > 1)
  {
    v47 = MBGetDefaultLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Finding secret and keybag in keys", buf, 2u);
      _MBLog();
    }
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v48 = [v22 keys];
    id v49 = [v48 countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (!v49) {
      goto LABEL_108;
    }
    id v50 = 0;
    id v51 = 0;
    uint64_t v52 = *(void *)v70;
    uint64_t v46 = 2;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v70 != v52) {
          objc_enumerationMutation(v48);
        }
        v54 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        if ([v54 keyID] == 1)
        {
          id v50 = [v54 keyData];
        }
        else if ([v54 keyID] >= v46)
        {
          uint64_t v46 = (uint64_t)[v54 keyID];
          id v51 = [v54 keyData];
        }
      }
      id v49 = [v48 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v49);
    if (!v50)
    {
LABEL_108:
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:205 format:@"Secret not found in backup keys"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    if (!v51)
    {
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:205 format:@"Keybag not found in backup keys"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    v55 = MBGetDefaultLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Deserializing keybag", buf, 2u);
      _MBLog();
    }
    id v35 = +[MBKeyBag OTAKeyBagWithData:v51 error:&v76];
    if (!v35)
    {
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:205 error:v76 format:@"Error deserializing backup keybag"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    v56 = MBGetDefaultLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Getting keybag UUID", buf, 2u);
      _MBLog();
    }
    id v74 = [v35 UUIDWithError:&v76];
    if (!v74)
    {
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:205 error:v76 format:@"Error getting backup keybag UUID"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    v57 = MBGetDefaultLog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Unlocking keybag", buf, 2u);
      _MBLog();
    }
    if (([v35 unlockWithSecret:v50 error:&v76] & 1) == 0)
    {
      if (a6)
      {
        uint64_t v23 = +[MBError errorWithCode:205 error:v76 format:@"Error unlocking keybag"];
        goto LABEL_37;
      }
      goto LABEL_132;
    }
    goto LABEL_98;
  }
  if (!a6) {
    goto LABEL_132;
  }
  uint64_t v23 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, @"Unexpected number of backup keys: %lu", [v22 keysCount]);
LABEL_37:
  uint64_t v25 = v23;
  LOBYTE(v23) = 0;
  *a6 = v25;
  return (char)v23;
}

- (BOOL)tearDownBackupWithError:(id *)a3
{
  uint64_t v12 = 0;
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tearing down backup keybag", buf, 2u);
    _MBLog();
  }
  BOOL v6 = [(MBServiceEncryptionManager *)self keybagUUID];
  v7 = MBGetDefaultLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregistering keybag: %@", buf, 0xCu);
      id v11 = v6;
      _MBLog();
    }
    [(MBServiceCache *)self->_cache open];
    [(MBServiceCache *)self->_cache removeAllFileEncryptionKeys];
    [(MBServiceCache *)self->_cache removeAllFilesMissingEncryptionKey];
    [(MBServiceCache *)self->_cache close];
    if (+[MBKeyBag unregisterOTAKeyBagWithError:&v12])
    {
      +[MBKeychainPlugin removeServiceKeychainBackup];
      return 1;
    }
    else
    {
      BOOL v9 = 0;
      if (a3) {
        *a3 = +[MBError errorWithCode:1 error:v12 format:@"Error unregistering keybag"];
      }
    }
  }
  else
  {
    BOOL v9 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No keybag registered", buf, 2u);
      _MBLog();
    }
  }
  return v9;
}

- (BOOL)rollKeyBagWithKeyBagID:(unsigned int *)a3 forEngine:(id)a4 error:(id *)a5
{
  id v50 = 0;
  uint64_t v9 = MBDeviceUDID_Legacy();
  unsigned int v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Rolling keybag", buf, 2u);
    _MBLog();
  }
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updating account", buf, 2u);
    _MBLog();
  }
  id v12 = [(MBServiceAccount *)[(MBServiceSettingsContext *)self->_settingsContext account] updateAppleAccountSync];
  id v50 = v12;
  if (v12)
  {
    if (a5)
    {
      BOOL v13 = 0;
      *a5 = +[MBError errorWithCode:1 error:v12 format:@"Error updating account while rolling keybag"];
      return v13;
    }
    return 0;
  }
  id v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Refreshing cache", buf, 2u);
    _MBLog();
  }
  [(MBServiceCache *)self->_cache open];
  if ([(MBServiceCache *)self->_cache refreshForBackupUDID:v9 service:self->_service deleted:0 error:&v50])
  {
    int v15 = 1;
  }
  else if (a5)
  {
    id v16 = [v50 code];
    int v15 = 0;
    *a5 = +[MBError errorWithCode:v16 error:v50 format:@"Error refreshing cache"];
  }
  else
  {
    int v15 = 0;
  }
  [(MBServiceCache *)self->_cache close];
  if (!v15) {
    return 0;
  }
  int v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Getting keys from backup", buf, 2u);
    _MBLog();
  }
  v40 = a3;
  uint64_t v18 = -1;
  while (1)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100277264;
    v47[3] = &unk_100417940;
    int v48 = v18 + 1;
    v47[4] = a4;
    v47[5] = self;
    v47[6] = v9;
    id v19 = [(MBServiceEncryptionManager *)self keysetForBackupUDID:v9 lastModified:0 userInitiated:1 willVerifyCredentialsCallback:v47 error:&v50];
    uint64_t v20 = v19;
    if (v19) {
      break;
    }
    if (+[MBError isError:v50 withCode:17])
    {
      if ((unint64_t)objc_msgSend(objc_msgSend(a4, "retryStrategy"), "softConsecutiveRetryLimit") > ++v18) {
        continue;
      }
    }
    if (a5)
    {
      id v21 = [v50 code];
      CFStringRef v22 = +[MBError errorWithCode:v21 error:v50 format:@"Error getting backup keys while rolling keybag"];
LABEL_64:
      BOOL v13 = 0;
      *a5 = v22;
      goto LABEL_76;
    }
    goto LABEL_75;
  }
  if ((unint64_t)[v19 keysCount] > 1)
  {
    [a4 disableCancel];
    if ([a4 isCanceled])
    {
      if (a5)
      {
        CFStringRef v22 = +[MBError errorWithCode:202 format:@"Cancelled"];
        goto LABEL_64;
      }
    }
    else
    {
      v42 = objc_alloc_init(MBSKeySet);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v23 = [v20 keys];
      id v24 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v24)
      {
        id v25 = 0;
        unsigned int v41 = 0;
        uint64_t v26 = *(void *)v44;
        while (2)
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v23);
            }
            long long v28 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            if ([v28 keyID] == 1)
            {
              [(MBSKeySet *)v42 addKey:v28];
              id v25 = [v28 keyData];
            }
            else
            {
              if ([v28 keyID] < 2)
              {
                if (!a5) {
                  goto LABEL_75;
                }
                CFStringRef v22 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, @"Invalid backup key ID: %u", [v28 keyID]);
                goto LABEL_64;
              }
              [(MBSKeySet *)v42 addKey:v28];
              if ([v28 keyID] > v41) {
                unsigned int v41 = [v28 keyID];
              }
            }
          }
          id v24 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v24) {
            continue;
          }
          break;
        }
        if (!v25) {
          goto LABEL_62;
        }
        if (v41)
        {
          id v29 = MBGetDefaultLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Creating new keybag", buf, 2u);
            _MBLog();
          }
          id v30 = +[MBKeyBag OTAKeyBagWithSecret:v25 error:&v50];
          if (v30)
          {
            unsigned int v31 = MBGetDefaultLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Getting new keybag UUID", buf, 2u);
              _MBLog();
            }
            id v32 = [v30 UUIDWithError:&v50];
            if (v32)
            {
              id v33 = MBGetDefaultLog();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Serializing new keybag", buf, 2u);
                _MBLog();
              }
              id v34 = [v30 dataWithError:&v50];
              if (v34)
              {
                id v35 = MBGetDefaultLog();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Updating backup keys", buf, 2u);
                  _MBLog();
                }
                v36 = objc_alloc_init(MBSKey);
                uint64_t v37 = v41 + 1;
                [(MBSKey *)v36 setKeyID:v37];
                [(MBSKey *)v36 setKeyData:v34];
                [(MBSKeySet *)v42 addKey:v36];
                if ([(MBService *)self->_service updateKeySet:v42 forBackupUDID:v9 lastModified:0 error:&v50])
                {
                  [(MBServiceCache *)self->_cache open];
                  [(MBServiceCache *)self->_cache removeAllFileEncryptionKeys];
                  -[MBServiceCache addKeyBagInfo:forBackupUDID:](self->_cache, "addKeyBagInfo:forBackupUDID:", +[MBKeyBagInfo infoWithID:uuid:](MBKeyBagInfo, "infoWithID:uuid:", v37, [v32 bytes]), v9);
                  [(MBServiceCache *)self->_cache close];
                  if (![(MBServiceEncryptionManager *)self _registerKeyBag:v30 withID:v37 passcode:0 error:&v50])goto LABEL_75; {
                  if (v40)
                  }
                    unsigned int *v40 = v37;
                  BOOL v13 = 1;
                  goto LABEL_76;
                }
                if (!a5) {
                  goto LABEL_75;
                }
                id v38 = [v50 code];
                CFStringRef v22 = +[MBError errorWithCode:v38 error:v50 format:@"Error updating backup keys while rolling keybag"];
              }
              else
              {
                if (!a5) {
                  goto LABEL_75;
                }
                CFStringRef v22 = +[MBError errorWithCode:1 error:v50 format:@"Error getting new keybag data while rolling keybag"];
              }
            }
            else
            {
              if (!a5) {
                goto LABEL_75;
              }
              CFStringRef v22 = +[MBError errorWithCode:1 error:v50 format:@"Error getting new keybag UUID while rolling keybag"];
            }
          }
          else
          {
            if (!a5) {
              goto LABEL_75;
            }
            CFStringRef v22 = +[MBError errorWithCode:1 error:v50 format:@"Error creating new keybag while rolling keybag"];
          }
        }
        else
        {
          if (!a5) {
            goto LABEL_75;
          }
          CFStringRef v22 = +[MBError errorWithCode:205 format:@"Keybag not found in backup keys"];
        }
        goto LABEL_64;
      }
LABEL_62:
      if (a5)
      {
        CFStringRef v22 = +[MBError errorWithCode:205 format:@"Secret not found in backup keys"];
        goto LABEL_64;
      }
    }
  }
  else if (a5)
  {
    CFStringRef v22 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, @"Unexpected number of backup keys: %lu", [v20 keysCount]);
    goto LABEL_64;
  }
LABEL_75:
  BOOL v13 = 0;
LABEL_76:
  [a4 enableCancel];
  return v13;
}

- (id)loadRestoreKeyBagsByIDWithError:(id *)a3
{
  id v28 = 0;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Loading restore keybag", buf, 2u);
    _MBLog();
  }
  BOOL v6 = +[NSData dataWithContentsOfFile:@"/var/mobile/Library/Backup/RestoreKeyBag.plist" options:0 error:&v28];
  if (!v6)
  {
    if (!a3) {
      return 0;
    }
    id v19 = (MBError *)+[MBError errorForNSError:v28 path:@"/var/mobile/Library/Backup/RestoreKeyBag.plist" format:@"Error reading restore keybag file"];
    goto LABEL_28;
  }
  id v7 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v28];
  if (!v7)
  {
    id v4 = 0;
    if (!a3 || !v28) {
      return v4;
    }
    uint64_t v20 = 1;
LABEL_27:
    id v19 = +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v20);
LABEL_28:
    id v4 = 0;
    *a3 = v19;
    return v4;
  }
  uint64_t v8 = v7;
  id v9 = [v7 objectForKeyedSubscript:@"keybagSecret"];
  id v10 = [v8 objectForKeyedSubscript:@"keybagDatasByID"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v11) {
    return v4;
  }
  id v12 = v11;
  CFStringRef v22 = a3;
  uint64_t v13 = *(void *)v24;
  while (2)
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v10);
      }
      int v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      id v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 integerValue]);
      id v17 = +[MBKeyBag OTAKeyBagWithData:error:](MBKeyBag, "OTAKeyBagWithData:error:", [v10 objectForKeyedSubscript:v15], &v28);
      if (!v17)
      {
        id v4 = 0;
        a3 = v22;
        if (!v22 || !v28) {
          return v4;
        }
LABEL_26:
        uint64_t v20 = (uint64_t)[v28 code];
        goto LABEL_27;
      }
      id v18 = v17;
      if (([v17 unlockWithSecret:v9 error:&v28] & 1) == 0)
      {
        id v4 = 0;
        a3 = v22;
        if (!v22 || !v28) {
          return v4;
        }
        goto LABEL_26;
      }
      [v4 setObject:v18 forKeyedSubscript:v16];
    }
    id v12 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v12) {
      continue;
    }
    return v4;
  }
}

- (BOOL)saveRestoreKeyBagDatasByID:(id)a3 secret:(id)a4 error:(id *)a5
{
  uint64_t v27 = 0;
  uint64_t v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saving restore keybags", buf, 2u);
    _MBLog();
  }
  id v9 = +[NSMutableDictionary dictionary];
  [v9 setObject:a4 forKeyedSubscript:@"keybagSecret"];
  id v10 = +[NSMutableDictionary dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = [a3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * i)), objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "description"));
      }
      id v12 = [a3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v12);
  }
  [v9 setObject:v10 forKeyedSubscript:@"keybagDatasByID"];
  int v15 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:100 options:0 error:&v27];
  if (!v15)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v18 = v27;
    CFStringRef v19 = @"Error serializing restore keybag plist";
LABEL_18:
    uint64_t v20 = (MBError *)+[MBError errorForNSError:v18 path:@"/var/mobile/Library/Backup" format:v19];
LABEL_19:
    id v21 = v20;
    BOOL result = 0;
    *a5 = v21;
    return result;
  }
  id v16 = v15;
  if (![+[NSFileManager defaultManager] createDirectoryAtPath:@"/var/mobile/Library/Backup" withIntermediateDirectories:1 attributes:0 error:&v27])
  {
    if (!a5) {
      return 0;
    }
    uint64_t v18 = v27;
    CFStringRef v19 = @"Error creating restore keybag dir";
    goto LABEL_18;
  }
  if ([(NSData *)v16 writeToFile:@"/var/mobile/Library/Backup/RestoreKeyBag.plist" options:536870913 error:&v27])
  {
    return 1;
  }
  if (a5)
  {
    uint64_t v20 = +[MBError errorWithCode:100 error:v27 path:@"/var/mobile/Library/Backup/RestoreKeyBag.plist" format:@"Error writing restore keybag plist"];
    goto LABEL_19;
  }
  return 0;
}

- (BOOL)removeRestoreKeyBagsWithError:(id *)a3
{
  uint64_t v9 = 0;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing restore keybags", v8, 2u);
    _MBLog();
  }
  unsigned __int8 v5 = [+[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Library/Backup/RestoreKeyBag.plist" error:&v9];
  BOOL v6 = v5;
  if (a3 && (v5 & 1) == 0) {
    *a3 = +[MBError errorForNSError:v9 path:@"/var/mobile/Library/Backup/RestoreKeyBag.plist" format:@"Error removing restore keybag"];
  }
  return v6;
}

- (void)keybagIsLocking
{
  [(MBServiceEncryptionManager *)self _findMissingEncryptionKeys];
  [(MBServiceEncryptionManager *)self _exportKeychain];
}

- (void)_findMissingEncryptionKeys
{
}

- (void)_exportKeychain
{
  uint64_t v4 = 0;
  if (!+[MBKeychainPlugin exportKeychainForCKBackupEngine:0 error:&v4])
  {
    v2 = MBGetDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = +[MBError descriptionForError:v4];
      *(_DWORD *)buf = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Error exporting keychain: %@", buf, 0xCu);
      +[MBError descriptionForError:v4];
      _MBLog();
    }
  }
}

- (void)keybagIsUnlocked
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100277F18;
  v2[3] = &unk_100417988;
  v2[4] = self;
  MBPerformWithCache((uint64_t)v2);
}

- (BOOL)suppressAuthorization
{
  return self->_suppressAuthorization;
}

- (void)setSuppressAuthorization:(BOOL)a3
{
  self->_suppressAuthorization = a3;
}

@end