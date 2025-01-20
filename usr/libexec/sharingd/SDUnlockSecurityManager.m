@interface SDUnlockSecurityManager
- (BOOL)checkForEscrowData;
- (BOOL)checkForLegacyEscrowData;
- (BOOL)confirmUnlockWithAuthSession:(int64_t)a3;
- (BOOL)ltkFileExists;
- (BOOL)ltksExist;
- (BOOL)setupWithAuthSession:(int64_t)a3 passcode:(id)a4;
- (BOOL)storeEscrowData:(id)a3;
- (NSData)localLongTermKey;
- (NSData)remoteLongTermKey;
- (NSString)deviceName;
- (NSString)keyDeviceID;
- (NSString)keybagUUID;
- (NSString)pairingID;
- (NSString)pairingStorePath;
- (SDUnlockSecurityManager)initWithPairingID:(id)a3 pairingStorePath:(id)a4 deviceName:(id)a5;
- (id)allKeychainItems;
- (id)baseDictionary;
- (id)escrowData;
- (id)escrowSecretWithAuthSession:(int64_t)a3;
- (id)generateLocalLongTermKey:(int64_t)a3;
- (id)legacyEscrowData;
- (id)legacyLocalLongTermKey;
- (id)legacyRemoteLongTermKey;
- (id)longTermKeyStorageFilePath;
- (id)signRemoteKey:(id)a3 withLocalKey:(id)a4 localKeyClass:(int64_t)a5 remoteKeyClass:(int64_t)a6;
- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4;
- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5;
- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5 errorCode:(int64_t *)a6;
- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4;
- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4 errorCode:(int *)a5;
- (int64_t)escrowCreationSessionAsOriginator:(BOOL)a3 errorCode:(int *)a4;
- (int64_t)stashBagSessionAsOriginator:(BOOL)a3 escrowSecret:(id)a4 manifest:(id)a5;
- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5;
- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5 errorCode:(int *)a6;
- (unsigned)lockState;
- (void)checkForBackupExclusion:(id)a3;
- (void)clearStateForSession:(int64_t)a3;
- (void)deleteEscrowData;
- (void)deleteLegacyEscrowData;
- (void)deleteLongTermKeys;
- (void)deletePersistedLongTermKeys;
- (void)loadLongTermKeys;
- (void)migrateEscrowDataIfNeeded;
- (void)migrateOldKeysIfNeeded;
- (void)resetEscrowRecord;
- (void)saveLongTermKeys;
- (void)setDeviceName:(id)a3;
- (void)setKeyDeviceID:(id)a3;
- (void)setKeybagUUID:(id)a3;
- (void)setLocalLongTermKey:(id)a3;
- (void)setPairingID:(id)a3;
- (void)setPairingStorePath:(id)a3;
- (void)setRemoteLongTermKey:(id)a3;
- (void)updateLocalLongTermKey:(id)a3 remoteLongTermKey:(id)a4;
- (void)validateKeybagUUID;
@end

@implementation SDUnlockSecurityManager

- (SDUnlockSecurityManager)initWithPairingID:(id)a3 pairingStorePath:(id)a4 deviceName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SDUnlockSecurityManager;
  v11 = [(SDUnlockSecurityManager *)&v21 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    pairingID = v11->_pairingID;
    v11->_pairingID = v12;

    v14 = (NSString *)[v9 copy];
    pairingStorePath = v11->_pairingStorePath;
    v11->_pairingStorePath = v14;

    v16 = (NSString *)[v10 copy];
    deviceName = v11->_deviceName;
    v11->_deviceName = v16;

    [(SDUnlockSecurityManager *)v11 migrateOldKeysIfNeeded];
    v18 = +[SDStatusMonitor sharedMonitor];
    unsigned int v19 = [v18 deviceKeyBagUnlocked];

    if (v19) {
      [(SDUnlockSecurityManager *)v11 migrateEscrowDataIfNeeded];
    }
  }

  return v11;
}

- (unsigned)lockState
{
  return 0;
}

- (BOOL)ltksExist
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self localLongTermKey];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(SDUnlockSecurityManager *)self remoteLongTermKey];

    if (v5)
    {
      v6 = paired_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LTKs exists", v8, 2u);
      }

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)generateLocalLongTermKey:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = 0;
  if (aks_create_signing_key() == -536870212 || v9 == 0)
  {
    v5 = paired_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10018E958();
    }
    v4 = 0;
  }
  else
  {
    v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10);
    v5 = paired_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Generated local key", v8, 2u);
    }
  }

  if (v10) {
    free(v10);
  }

  return v4;
}

- (id)signRemoteKey:(id)a3 withLocalKey:(id)a4 localKeyClass:(int64_t)a5 remoteKeyClass:(int64_t)a6
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
    [v10 bytes];
    [v10 length];
    id v11 = v7;
    [v11 bytes];
    [v11 length];
    aks_sign_signing_key();
    v12 = paired_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018E9F8();
    }
  }
  else
  {
    v12 = paired_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018E9C4();
    }
  }

  return 0;
}

- (void)updateLocalLongTermKey:(id)a3 remoteLongTermKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_localLongTermKey = &self->_localLongTermKey;
  if (*(_OWORD *)&self->_localLongTermKey != 0)
  {
    id v10 = paired_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      localLongTermKey = self->_localLongTermKey;
      remoteLongTermKey = self->_remoteLongTermKey;
      int v14 = 138412546;
      v15 = localLongTermKey;
      __int16 v16 = 2112;
      v17 = remoteLongTermKey;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Overriding existing long term keys (local %@, remote %@)", (uint8_t *)&v14, 0x16u);
    }
  }
  v13 = self;
  objc_sync_enter(v13);
  objc_storeStrong((id *)p_localLongTermKey, a3);
  objc_storeStrong((id *)&v13->_remoteLongTermKey, a4);
  [(SDUnlockSecurityManager *)v13 saveLongTermKeys];
  objc_sync_exit(v13);
}

- (void)deleteLongTermKeys
{
  v2 = self;
  objc_sync_enter(v2);
  localLongTermKey = v2->_localLongTermKey;
  v2->_localLongTermKey = 0;

  remoteLongTermKey = v2->_remoteLongTermKey;
  v2->_remoteLongTermKey = 0;

  [(SDUnlockSecurityManager *)v2 deletePersistedLongTermKeys];
  v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(SDUnlockSecurityManager *)v2 pairingID];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleted LTKs for %@", (uint8_t *)&v7, 0xCu);
  }
  objc_sync_exit(v2);
}

- (NSData)localLongTermKey
{
  v2 = self;
  objc_sync_enter(v2);
  localLongTermKey = v2->_localLongTermKey;
  if (!localLongTermKey)
  {
    [(SDUnlockSecurityManager *)v2 loadLongTermKeys];
    localLongTermKey = v2->_localLongTermKey;
  }
  v4 = localLongTermKey;
  objc_sync_exit(v2);

  return v4;
}

- (NSData)remoteLongTermKey
{
  v2 = self;
  objc_sync_enter(v2);
  remoteLongTermKey = v2->_remoteLongTermKey;
  if (!remoteLongTermKey)
  {
    [(SDUnlockSecurityManager *)v2 loadLongTermKeys];
    remoteLongTermKey = v2->_remoteLongTermKey;
  }
  v4 = remoteLongTermKey;
  objc_sync_exit(v2);

  return v4;
}

- (void)validateKeybagUUID
{
  if (self->_keybagUUID)
  {
    uint64_t v3 = sub_10001D144();
    v4 = [v3 UUIDString];
    unsigned int v5 = [v4 isEqualToString:self->_keybagUUID];

    v6 = paired_unlock_log();
    int v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "KeybagUUIDs match", v8, 2u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      sub_10018EA64();
    }
  }
  else
  {
    [(SDUnlockSecurityManager *)self saveLongTermKeys];
  }
}

- (void)checkForBackupExclusion:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"SDUnlockBackupExclusion"];
  unsigned int v5 = v4;
  if (self->_localLongTermKey && self->_remoteLongTermKey && ([v4 BOOLValue] & 1) == 0)
  {
    v6 = paired_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resaving LTKs with backup exclusion", v7, 2u);
    }

    [(SDUnlockSecurityManager *)self saveLongTermKeys];
  }
}

- (void)saveLongTermKeys
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self longTermKeyStorageFilePath];
  v4 = (void *)v3;
  if (!self->_localLongTermKey || (self->_remoteLongTermKey ? (BOOL v5 = v3 == 0) : (BOOL v5 = 1), v5))
  {
    v6 = paired_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v7 = @"YES";
      remoteLongTermKey = self->_remoteLongTermKey;
      if (self->_localLongTermKey) {
        CFStringRef v9 = @"YES";
      }
      else {
        CFStringRef v9 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      if (!remoteLongTermKey) {
        CFStringRef v7 = @"NO";
      }
      CFStringRef v28 = v9;
      __int16 v29 = 2112;
      CFStringRef v30 = v7;
      __int16 v31 = 2112;
      v32 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Save missing info (local %@, remote %@, pairing store path %@)", buf, 0x20u);
    }
  }
  else
  {
    id v10 = (__CFString *)objc_opt_new();
    [(__CFString *)v10 setObject:self->_localLongTermKey forKeyedSubscript:@"SDUnlockLocalLTK"];
    [(__CFString *)v10 setObject:self->_remoteLongTermKey forKeyedSubscript:@"SDUnlockRemoteLTK"];
    id v11 = [(SDUnlockSecurityManager *)self pairingID];
    [(__CFString *)v10 setObject:v11 forKeyedSubscript:@"SDUnlockPairingID"];

    [(__CFString *)v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SDUnlockBackupExclusion"];
    v12 = sub_10001D144();
    v13 = v12;
    if (v12)
    {
      int v14 = [v12 UUIDString];
      [(__CFString *)v10 setObject:v14 forKeyedSubscript:@"SDUnlockKeybagUUID"];
    }
    id v26 = 0;
    v15 = +[NSPropertyListSerialization dataWithPropertyList:v10 format:200 options:0 error:&v26];
    __int16 v16 = v26;
    v6 = v16;
    if (v15)
    {

      v17 = +[NSURL fileURLWithPath:v4];
      id v25 = 0;
      unsigned int v18 = [v15 writeToURL:v17 options:268435457 error:&v25];
      unsigned int v19 = v25;
      v20 = paired_unlock_log();
      objc_super v21 = v20;
      if (v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v28 = v10;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Saved LTKs %@", buf, 0xCu);
        }

        v24 = v19;
        unsigned int v22 = [v17 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v24];
        v6 = v24;

        objc_super v21 = paired_unlock_log();
        BOOL v23 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        if (v22)
        {
          if (v23) {
            sub_10018EB0C();
          }
        }
        else if (v23)
        {
          sub_10018EB40();
        }
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10018EBA8();
        }
        v6 = v19;
      }
    }
    else
    {
      v17 = paired_unlock_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10018EAA4();
      }
    }
  }
}

- (void)loadLongTermKeys
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self longTermKeyStorageFilePath];
  if (v3)
  {
    id v20 = 0;
    id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3 options:0 error:&v20];
    id v5 = v20;
    if (v4)
    {
      id v19 = 0;
      v6 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v19];
      id v7 = v19;

      if (v6)
      {
        id v8 = [v6 objectForKeyedSubscript:@"SDUnlockLocalLTK"];
        localLongTermKey = self->_localLongTermKey;
        self->_localLongTermKey = v8;

        id v10 = [v6 objectForKeyedSubscript:@"SDUnlockRemoteLTK"];
        remoteLongTermKey = self->_remoteLongTermKey;
        self->_remoteLongTermKey = v10;

        v12 = [v6 objectForKeyedSubscript:@"SDUnlockKeybagUUID"];
        keybagUUID = self->_keybagUUID;
        self->_keybagUUID = v12;

        int v14 = paired_unlock_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_localLongTermKey;
          __int16 v16 = self->_remoteLongTermKey;
          v17 = self->_keybagUUID;
          *(_DWORD *)buf = 138412802;
          unsigned int v22 = v15;
          __int16 v23 = 2112;
          v24 = v16;
          __int16 v25 = 2112;
          id v26 = v17;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Loaded LTKs\n local %@\nremote %@\nkeybag UUID %@)", buf, 0x20u);
        }

        [(SDUnlockSecurityManager *)self checkForBackupExclusion:v6];
        [(SDUnlockSecurityManager *)self validateKeybagUUID];
      }
      else
      {
        unsigned int v18 = paired_unlock_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10018EC78();
        }
      }
    }
    else
    {
      v6 = paired_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10018EC10();
      }
      id v7 = v5;
    }
  }
}

- (void)deletePersistedLongTermKeys
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self longTermKeyStorageFilePath];
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    id v12 = 0;
    unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:&v12];
    v6 = v12;

    if (v5)
    {
      id v7 = paired_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        id v8 = "Deleted LTKs";
        CFStringRef v9 = (uint8_t *)&v10;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else
    {
      if ([v6 code] != (id)-1100
        && [v6 code] != (id)260
        && [v6 code] != (id)4)
      {
        id v7 = paired_unlock_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10018ED74();
        }
        goto LABEL_13;
      }
      id v7 = paired_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v8 = "LTKs already deleted";
        CFStringRef v9 = buf;
        goto LABEL_12;
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  v6 = paired_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10018ECE0(self, v6);
  }
LABEL_14:
}

- (id)longTermKeyStorageFilePath
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self pairingStorePath];
  id v4 = [v3 stringByAppendingPathComponent:@"com.apple.sharing"];

  unsigned __int8 v5 = +[NSFileManager defaultManager];
  id v11 = 0;
  unsigned int v6 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
  id v7 = v11;

  if (v6)
  {
    id v8 = [v4 stringByAppendingPathComponent:@"ltk.plist"];
  }
  else
  {
    CFStringRef v9 = paired_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018EDDC(self);
    }

    id v8 = 0;
  }

  return v8;
}

- (BOOL)ltkFileExists
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self pairingID];

  if (v3)
  {
    id v4 = [(SDUnlockSecurityManager *)self longTermKeyStorageFilePath];
    if (v4)
    {
      unsigned __int8 v5 = +[NSURL fileURLWithPath:v4];
      id v9 = 0;
      LOBYTE(v3) = [v5 checkResourceIsReachableAndReturnError:&v9];
      id v6 = v9;
      if ((v3 & 1) == 0)
      {
        id v7 = auto_unlock_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10018EE78();
        }
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)legacyRemoteLongTermKey
{
  v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"UnlockSecurityRemoteLongTermKey"];

  return v3;
}

- (id)legacyLocalLongTermKey
{
  v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"UnlockSecurityLocalLongTermKey"];

  return v3;
}

- (void)migrateOldKeysIfNeeded
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self legacyLocalLongTermKey];
  uint64_t v4 = [(SDUnlockSecurityManager *)self legacyRemoteLongTermKey];
  unsigned __int8 v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = paired_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(SDUnlockSecurityManager *)self pairingID];
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migrating old keys to %@", (uint8_t *)&v11, 0xCu);
    }
    [(SDUnlockSecurityManager *)self updateLocalLongTermKey:v3 remoteLongTermKey:v5];
    id v8 = +[NSUserDefaults standardUserDefaults];
    [v8 removeObjectForKey:@"UnlockSecurityLocalLongTermKey"];

    id v9 = +[NSUserDefaults standardUserDefaults];
    [v9 removeObjectForKey:@"UnlockSecurityRemoteLongTermKey"];

    __int16 v10 = +[NSUserDefaults standardUserDefaults];
    [v10 synchronize];
  }
}

- (int64_t)escrowCreationSessionAsOriginator:(BOOL)a3 errorCode:(int *)a4
{
  if (a3) {
    uint64_t v4 = 132;
  }
  else {
    uint64_t v4 = 4;
  }
  return [(SDUnlockSecurityManager *)self authSessionWithFlags:v4 secret:0 errorCode:a4];
}

- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5
{
  return [(SDUnlockSecurityManager *)self unlockSessionAsOriginator:a3 usingEscrow:a4 escrowSecret:a5 errorCode:0];
}

- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5 errorCode:(int *)a6
{
  if (a3) {
    int v6 = 128;
  }
  else {
    int v6 = 0;
  }
  if (a4) {
    int v7 = 5;
  }
  else {
    int v7 = 2;
  }
  return [(SDUnlockSecurityManager *)self authSessionWithFlags:v7 | v6 secret:a5 errorCode:a6];
}

- (int64_t)stashBagSessionAsOriginator:(BOOL)a3 escrowSecret:(id)a4 manifest:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v8 == 0 && v6) {
    unsigned int v10 = 134;
  }
  else {
    unsigned int v10 = 137;
  }
  if (v6) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 9;
  }
  if (v8)
  {
    id v12 = a4;
    [v12 bytes];
    [v12 length];

    id v13 = v9;
    [v13 bytes];
    [v13 length];
    aks_create_escrow_blob();
    int v14 = paired_unlock_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10018EEE0();
    }
    int64_t v15 = 101;
  }
  else
  {
    int v14 = a4;
    int64_t v15 = [(SDUnlockSecurityManager *)self authSessionWithFlags:v11 secret:v14];
  }

  return v15;
}

- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4
{
  return [(SDUnlockSecurityManager *)self authSessionWithFlags:*(void *)&a3 secret:a4 errorCode:0];
}

- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4 errorCode:(int *)a5
{
  id v8 = a4;
  signed int v39 = 0;
  uint64_t v9 = [(SDUnlockSecurityManager *)self localLongTermKey];
  if (v9)
  {
    unsigned int v10 = (void *)v9;
    uint64_t v11 = [(SDUnlockSecurityManager *)self remoteLongTermKey];

    if (v11)
    {
      v36 = a5;
      id v38 = v8;
      id v12 = paired_unlock_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v41 = a3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating auth session with flags = %d", buf, 8u);
      }

      id v37 = [(SDUnlockSecurityManager *)self localLongTermKey];
      [v37 bytes];
      id v13 = [(SDUnlockSecurityManager *)self localLongTermKey];
      [v13 length];
      id v14 = [(SDUnlockSecurityManager *)self remoteLongTermKey];
      [v14 bytes];
      int64_t v15 = [(SDUnlockSecurityManager *)self remoteLongTermKey];
      [v15 length];
      id v16 = v8;
      [v16 bytes];
      id v34 = v16;
      [v16 length];
      unsigned int v35 = a3;
      int v17 = aks_remote_session();

      unsigned int v18 = paired_unlock_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v41 = v39;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Auth session -- create (session id: %d)", buf, 8u);
      }

      if (v17 == -536870211)
      {
        id v19 = paired_unlock_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received no memory error when creating session, clearing and retrying", buf, 2u);
        }

        sub_10001D42C();
        signed int v39 = 0;
        id v20 = [(SDUnlockSecurityManager *)self localLongTermKey];
        [v20 bytes];
        objc_super v21 = [(SDUnlockSecurityManager *)self localLongTermKey];
        [v21 length];
        id v22 = [(SDUnlockSecurityManager *)self remoteLongTermKey];
        [v22 bytes];
        __int16 v23 = [(SDUnlockSecurityManager *)self remoteLongTermKey];
        [v23 length];
        id v24 = v34;
        [v24 bytes];
        [v24 length];
        int v17 = aks_remote_session();
      }
      if (v17 <= -536870161)
      {
        id v8 = v38;
        __int16 v25 = v36;
        if (v17 != -536870207)
        {
          if (v17 != -536870184)
          {
LABEL_29:
            CFStringRef v30 = paired_unlock_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v32 = [(SDUnlockSecurityManager *)self localLongTermKey];
              v33 = [(SDUnlockSecurityManager *)self remoteLongTermKey];
              *(_DWORD *)buf = 67109890;
              unsigned int v41 = v17;
              __int16 v42 = 1024;
              unsigned int v43 = v35;
              __int16 v44 = 2112;
              v45 = v32;
              __int16 v46 = 2112;
              v47 = v33;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to setup session: (status = %x, flags = %d,\n localKey = %@,\n remoteKey = %@)", buf, 0x22u);
            }
            goto LABEL_32;
          }
LABEL_21:
          CFStringRef v28 = paired_unlock_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v41 = v17;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Escrow record exists, but not available (status = %d)", buf, 8u);
          }

          int64_t v26 = 0;
          goto LABEL_33;
        }
        __int16 v29 = paired_unlock_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10018EFC8();
        }
      }
      else
      {
        id v8 = v38;
        __int16 v25 = v36;
        if (v17 != -536870160)
        {
          if (v17 != -536363000)
          {
            if (!v17)
            {
              int64_t v26 = v39;
              goto LABEL_33;
            }
            goto LABEL_29;
          }
          goto LABEL_21;
        }
        __int16 v29 = paired_unlock_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v41 = -536870160;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Escrow record not found status = %d", buf, 8u);
        }
      }

LABEL_32:
      int64_t v26 = -1;
LABEL_33:
      if (v25) {
        *__int16 v25 = v17;
      }
      goto LABEL_35;
    }
  }
  v27 = paired_unlock_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_10018EF14(self);
  }

  int64_t v26 = -1;
LABEL_35:

  return v26;
}

- (BOOL)setupWithAuthSession:(int64_t)a3 passcode:(id)a4
{
  id v4 = a4;
  [v4 UTF8String];
  [v4 length];

  int v5 = aks_remote_peer_setup();
  BOOL v6 = paired_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setupWithAuthSession status = %d", (uint8_t *)v9, 8u);
  }

  if (v5 == -536870212)
  {
    int v7 = paired_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10018EFFC();
    }
  }
  return v5 != -536870212;
}

- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4
{
  return [(SDUnlockSecurityManager *)self stepWithAuthSession:a3 data:a4 authStep:0];
}

- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5
{
  return [(SDUnlockSecurityManager *)self stepWithAuthSession:a3 data:a4 authStep:a5 errorCode:0];
}

- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5 errorCode:(int64_t *)a6
{
  id v9 = a4;
  unsigned int v10 = v9;
  uint64_t v17 = 0;
  unsigned int v18 = 0;
  if (!a3)
  {
    id v14 = paired_unlock_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10018F030();
    }
    goto LABEL_10;
  }
  id v11 = v9;
  [v11 bytes];
  [v11 length];
  uint64_t v12 = aks_remote_session_step();
  uint64_t v13 = v12;
  if (v12 || !a5)
  {
    if (a6) {
      *a6 = (int)v12;
    }
    id v14 = paired_unlock_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10018F064((uint64_t)&v17, v13, v14);
    }
LABEL_10:

    int64_t v15 = 0;
    goto LABEL_11;
  }
  int64_t v15 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v18, v17, v17);
LABEL_11:
  if (v18) {
    free(v18);
  }

  return v15;
}

- (id)escrowSecretWithAuthSession:(int64_t)a3
{
  uint64_t v13 = 0;
  id v14 = 0;
  if (aks_remote_peer_confirm() == -536870212 || v13 == 0)
  {
    id v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10018F0E0((uint64_t)&v13, v4, v5, v6, v7, v8, v9, v10);
    }

    id v11 = 0;
  }
  else
  {
    id v11 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v14);
  }
  if (v14) {
    free(v14);
  }

  return v11;
}

- (BOOL)confirmUnlockWithAuthSession:(int64_t)a3
{
  return aks_remote_peer_confirm() == 0;
}

- (void)clearStateForSession:(int64_t)a3
{
  id v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109120;
    int v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reseting session id %d", (uint8_t *)&v14, 8u);
  }

  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = paired_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      int v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Auth session -- reset (session id: %d)", (uint8_t *)&v14, 8u);
    }

    if (aks_reset_session() == -536870212)
    {
      uint64_t v6 = paired_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10018F150(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

- (void)resetEscrowRecord
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self localLongTermKey];
  if (!v3
    || (id v4 = (void *)v3,
        [(SDUnlockSecurityManager *)self remoteLongTermKey],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    uint64_t v12 = paired_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018F1C8();
    }
    goto LABEL_10;
  }
  uint64_t v6 = paired_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resetting Escrow Record", buf, 2u);
  }

  id v7 = [(SDUnlockSecurityManager *)self localLongTermKey];
  [v7 bytes];
  uint64_t v8 = [(SDUnlockSecurityManager *)self localLongTermKey];
  [v8 length];
  id v9 = [(SDUnlockSecurityManager *)self remoteLongTermKey];
  [v9 bytes];
  uint64_t v10 = [(SDUnlockSecurityManager *)self remoteLongTermKey];
  [v10 length];
  int v11 = aks_remote_session();

  if (v11 == -536870212)
  {
    uint64_t v12 = paired_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018F1FC();
    }
LABEL_10:
  }
}

- (BOOL)storeEscrowData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SDStatusMonitor sharedMonitor];
  if ([v5 deviceKeyBagUnlocked])
  {
    uint64_t v6 = [(SDUnlockSecurityManager *)self pairingID];

    if (v6)
    {
      id v7 = [(SDUnlockSecurityManager *)self baseDictionary];
      uint64_t v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

      id v9 = [(SDUnlockSecurityManager *)self deviceName];
      [v8 setObject:v9 forKeyedSubscript:kSecAttrLabel];

      uint64_t v10 = objc_opt_new();
      [v10 setObject:kSecAttrAccessibleWhenUnlockedThisDeviceOnly forKeyedSubscript:kSecAttrAccessible];
      [v10 setObject:v4 forKeyedSubscript:kSecValueData];
      id v11 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v8];
      [v11 addEntriesFromDictionary:v10];
      if (SecItemAdd((CFDictionaryRef)v11, 0))
      {
        if (SecItemUpdate((CFDictionaryRef)v8, (CFDictionaryRef)v10))
        {
          uint64_t v12 = SecItemDelete((CFDictionaryRef)v8);
          uint64_t v13 = SecItemAdd((CFDictionaryRef)v11, 0);
          if (!v13)
          {
            BOOL v16 = 1;
            goto LABEL_18;
          }
          uint64_t v14 = v13;
          int v15 = paired_unlock_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_10018F230(v14, v12, v15);
          }
          BOOL v16 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        int v15 = paired_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v17 = "Updated escrow data";
          unsigned int v18 = buf;
          goto LABEL_15;
        }
      }
      else
      {
        int v15 = paired_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v20 = 0;
          uint64_t v17 = "Added escrow data";
          unsigned int v18 = (uint8_t *)&v20;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
        }
      }
      BOOL v16 = 1;
      goto LABEL_17;
    }
  }
  else
  {
  }
  BOOL v16 = 0;
LABEL_19:

  return v16;
}

- (id)escrowData
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self pairingID];

  if (v3)
  {
    CFTypeRef result = 0;
    id v4 = objc_alloc((Class)NSMutableDictionary);
    uint64_t v5 = [(SDUnlockSecurityManager *)self baseDictionary];
    id v6 = [v4 initWithDictionary:v5];

    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
    if (SecItemCopyMatching((CFDictionaryRef)v6, &result)) {
      id v7 = 0;
    }
    else {
      id v7 = (void *)result;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)checkForEscrowData
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self pairingID];

  if (v3)
  {
    id v4 = objc_alloc((Class)NSMutableDictionary);
    uint64_t v5 = [(SDUnlockSecurityManager *)self baseDictionary];
    id v6 = [v4 initWithDictionary:v5];

    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnPersistentRef];
    OSStatus v7 = SecItemCopyMatching((CFDictionaryRef)v6, 0);
    BOOL v8 = v7 == -25308 || v7 == 0;
    if (v7 != -25308 && v7 != -25300 && v7 != 0)
    {
      OSStatus v11 = v7;
      uint64_t v12 = paired_unlock_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 67109120;
        LODWORD(v20) = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received unexpected SecItem error = %d", (uint8_t *)&v19, 8u);
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v13 = paired_unlock_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    int v15 = [(SDUnlockSecurityManager *)self pairingID];
    int v19 = 138412546;
    CFStringRef v20 = v14;
    __int16 v21 = 2112;
    id v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Escrow data exist:%@, pairing id:%@", (uint8_t *)&v19, 0x16u);
  }
  if (v8) {
    goto LABEL_27;
  }
  BOOL v16 = [(SDUnlockSecurityManager *)self checkForLegacyEscrowData];
  if (v16)
  {
    uint64_t v17 = paired_unlock_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Escrow data hasn't been migrated", (uint8_t *)&v19, 2u);
    }

LABEL_27:
    LOBYTE(v16) = 1;
  }
  return v16;
}

- (void)deleteEscrowData
{
  uint64_t v3 = [(SDUnlockSecurityManager *)self pairingID];

  if (v3)
  {
    uint64_t v4 = SecItemDelete((CFDictionaryRef)[(SDUnlockSecurityManager *)self baseDictionary]);
    if (v4 != -25300)
    {
      uint64_t v5 = v4;
      if (v4)
      {
        id v6 = paired_unlock_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10018F2A8(v5, v6, v7, v8, v9, v10, v11, v12);
        }
      }
    }
  }
}

- (id)allKeychainItems
{
  CFTypeRef result = 0;
  uint64_t v3 = [(SDUnlockSecurityManager *)self pairingID];

  if (v3)
  {
    id v4 = objc_alloc((Class)NSMutableDictionary);
    uint64_t v5 = [(SDUnlockSecurityManager *)self baseDictionary];
    id v6 = [v4 initWithDictionary:v5];

    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
    [v6 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
    OSStatus v7 = SecItemCopyMatching((CFDictionaryRef)v6, &result);
    if (v7 == -25308)
    {
      uint64_t v3 = @"Items Exist | Device Locked";
    }
    else if (v7)
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v8 = (void *)result;
      uint64_t v3 = [(id)result description];
    }
  }

  return v3;
}

- (id)baseDictionary
{
  uint64_t v3 = objc_opt_new();
  [v3 setObject:kSecClassGenericPassword forKeyedSubscript:kSecClass];
  [v3 setObject:@"com.apple.sharingd.unlock" forKeyedSubscript:kSecAttrAccount];
  [v3 setObject:@"com.apple.sharingd" forKeyedSubscript:kSecAttrAccessGroup];
  id v4 = [(SDUnlockSecurityManager *)self pairingID];
  [v3 setObject:v4 forKeyedSubscript:kSecAttrService];

  id v5 = [v3 copy];

  return v5;
}

- (id)legacyEscrowData
{
  v5[0] = kSecClass;
  v5[1] = kSecAttrLabel;
  v6[0] = kSecClassGenericPassword;
  v6[1] = @"com.apple.Sharing.lock-escrow";
  v5[2] = kSecAttrAccessGroup;
  v5[3] = kSecReturnData;
  CFTypeRef v4 = 0;
  v6[2] = @"com.apple.sharingd";
  v6[3] = &__kCFBooleanTrue;
  v5[4] = kSecAttrService;
  v6[4] = @"UnlockServiceName";
  if (SecItemCopyMatching((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5], &v4))
  {
    v2 = 0;
  }
  else
  {
    v2 = (void *)v4;
  }

  return v2;
}

- (BOOL)checkForLegacyEscrowData
{
  v11[0] = kSecClass;
  v11[1] = kSecAttrLabel;
  v12[0] = kSecClassGenericPassword;
  v12[1] = @"com.apple.Sharing.lock-escrow";
  v11[2] = kSecAttrService;
  v11[3] = kSecAttrAccessGroup;
  v12[2] = @"UnlockServiceName";
  v12[3] = @"com.apple.sharingd";
  v11[4] = kSecReturnPersistentRef;
  v12[4] = &__kCFBooleanTrue;
  OSStatus v2 = SecItemCopyMatching((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5], 0);
  BOOL v3 = v2 == -25308 || v2 == 0;
  if (v2 != -25308)
  {
    OSStatus v4 = v2;
    if (v2 != -25300)
    {
      if (v2)
      {
        id v5 = paired_unlock_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 67109120;
          LODWORD(v10) = v4;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received unexpected SecItem error = %d", (uint8_t *)&v9, 8u);
        }
      }
    }
  }
  id v6 = paired_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    int v9 = 138412290;
    CFStringRef v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Legacy escrow data exist:%@", (uint8_t *)&v9, 0xCu);
  }

  return v3;
}

- (void)migrateEscrowDataIfNeeded
{
  BOOL v3 = [(SDUnlockSecurityManager *)self legacyEscrowData];
  if (v3)
  {
    OSStatus v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating escrow data", v6, 2u);
    }

    if ([(SDUnlockSecurityManager *)self storeEscrowData:v3])
    {
      [(SDUnlockSecurityManager *)self deleteLegacyEscrowData];
    }
    else
    {
      id v5 = paired_unlock_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10018F314();
      }
    }
  }
}

- (void)deleteLegacyEscrowData
{
  v11[0] = kSecClass;
  v11[1] = kSecAttrLabel;
  v12[0] = kSecClassGenericPassword;
  v12[1] = @"com.apple.Sharing.lock-escrow";
  v11[2] = kSecAttrService;
  v12[2] = @"UnlockServiceName";
  uint64_t v2 = SecItemDelete((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3]);
  if (v2)
  {
    uint64_t v3 = v2;
    OSStatus v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10018F348(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (void)setLocalLongTermKey:(id)a3
{
}

- (void)setRemoteLongTermKey:(id)a3
{
}

- (NSString)keybagUUID
{
  return self->_keybagUUID;
}

- (void)setKeybagUUID:(id)a3
{
}

- (NSString)keyDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeyDeviceID:(id)a3
{
}

- (NSString)pairingID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPairingID:(id)a3
{
}

- (NSString)pairingStorePath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPairingStorePath:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_pairingStorePath, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_keyDeviceID, 0);
  objc_storeStrong((id *)&self->_keybagUUID, 0);
  objc_storeStrong((id *)&self->_remoteLongTermKey, 0);

  objc_storeStrong((id *)&self->_localLongTermKey, 0);
}

@end