@interface EPMigrationKeyPusher
+ (id)newService:(id)a3;
+ (id)prefsKeyForPairingID:(id)a3;
- (BOOL)flagsUpdatedForcePush;
- (BOOL)isUIUnlocked;
- (BOOL)sendingTheKey;
- (BOOL)shouldConfirmKeyForWatch:(id)a3;
- (BOOL)wasUIUnlocked;
- (BOOL)wasUnlocked;
- (EPKey)key;
- (EPKeymaster)keymaster;
- (EPMigrationKeyPusher)initWithServiceRegistry:(id)a3;
- (EPServiceRegistry)serviceRegistry;
- (NRKeychainSyncStatusManager)keychainSyncStatusManager;
- (NROSTransaction)transaction;
- (NROSTransaction)transactionForBackup;
- (NRPreferences)prefs;
- (NRRegistry)registry;
- (NRRemoteObjectClassA)keyChannel;
- (NRSecureDevicePropertyStore)secureProperties;
- (NSUUID)lastActiveDeviceID;
- (SecureBackup)secureBackupManager;
- (int)keybagNotifyToken;
- (int)uiUnlockedNotifyToken;
- (void)dealloc;
- (void)didConfirmKeyForWatch:(id)a3;
- (void)forceSecureBackup;
- (void)registerForNotifications;
- (void)sendMessageToWatch:(id)a3 withCompletion:(id)a4;
- (void)setFlagsUpdatedForcePush:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setKeybagNotifyToken:(int)a3;
- (void)setLastActiveDeviceID:(id)a3;
- (void)setPrefs:(id)a3;
- (void)setSecureBackupManager:(id)a3;
- (void)setSendingTheKey:(BOOL)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setTransactionForBackup:(id)a3;
- (void)setUiUnlockedNotifyToken:(int)a3;
- (void)setWasUIUnlocked:(BOOL)a3;
- (void)setWasUnlocked:(BOOL)a3;
- (void)tagInBluetoothWatches:(id)a3 withCompletion:(id)a4;
- (void)unregisterForNotifications;
- (void)update;
@end

@implementation EPMigrationKeyPusher

+ (id)newService:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithServiceRegistry:v4];

  return v5;
}

- (NRRegistry)registry
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (NRRegistry *)[(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (EPKeymaster)keymaster
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (EPKeymaster *)[(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (NRKeychainSyncStatusManager)keychainSyncStatusManager
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (NRKeychainSyncStatusManager *)[(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (NRRemoteObjectClassA)keyChannel
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (NRRemoteObjectClassA *)[(EPServiceRegistry *)serviceRegistry optionalServiceFromClass:v3];
}

- (NRSecureDevicePropertyStore)secureProperties
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (NRSecureDevicePropertyStore *)[(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (EPMigrationKeyPusher)initWithServiceRegistry:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_serviceRegistry, a3);
  v6 = [(EPMigrationKeyPusher *)self init];
  if (v6)
  {
    v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPMigrationKeyPusher: Init", (uint8_t *)buf, 2u);
      }
    }
    v10 = [(EPMigrationKeyPusher *)v6 keychainSyncStatusManager];
    [v10 addObserver:v6];

    *(void *)&v6->_uiUnlockedNotifyToken = -1;
    v11 = [[NRPreferences alloc] initWithDomain:@"com.apple.nanoregistryd"];
    prefs = v6->_prefs;
    v6->_prefs = v11;

    objc_initWeak(buf, v6);
    lastActiveDeviceID = v6->_lastActiveDeviceID;
    v6->_lastActiveDeviceID = 0;

    v14 = [(EPMigrationKeyPusher *)v6 registry];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100016968;
    v20[3] = &unk_100165CE8;
    objc_copyWeak(&v21, buf);
    id v15 = [v14 addDiffObserverWithWriteBlock:v20];

    v16 = +[NRQueue registryDaemonQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100016F08;
    v18[3] = &unk_1001655F8;
    v19 = v6;
    [v16 dispatchAsync:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }

  return v6;
}

- (void)registerForNotifications
{
  p_uiUnlockedNotifyToken = &self->_uiUnlockedNotifyToken;
  if (self->_uiUnlockedNotifyToken == -1)
  {
    id v4 = +[NRQueue registryDaemonQueue];
    id v5 = [v4 queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100017130;
    handler[3] = &unk_100165958;
    handler[4] = self;
    uint32_t v6 = notify_register_dispatch("com.apple.springboard.lockstate", p_uiUnlockedNotifyToken, v5, handler);

    if (v6)
    {
      v7 = nr_daemon_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (v8)
      {
        v9 = nr_daemon_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000F6A6C();
        }
      }
    }
  }
  if (self->_keybagNotifyToken == -1)
  {
    v10 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    v11 = +[NRQueue registryDaemonQueue];
    v12 = [v11 queue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000171CC;
    v17[3] = &unk_100165958;
    v17[4] = self;
    uint32_t v13 = notify_register_dispatch(v10, &self->_keybagNotifyToken, v12, v17);

    if (v13)
    {
      v14 = nr_daemon_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (v15)
      {
        v16 = nr_daemon_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000F6A04();
        }
      }
    }
  }
}

- (void)unregisterForNotifications
{
  int uiUnlockedNotifyToken = self->_uiUnlockedNotifyToken;
  if (uiUnlockedNotifyToken != -1)
  {
    notify_cancel(uiUnlockedNotifyToken);
    self->_int uiUnlockedNotifyToken = -1;
  }
  int keybagNotifyToken = self->_keybagNotifyToken;
  if (keybagNotifyToken != -1)
  {
    notify_cancel(keybagNotifyToken);
    self->_int keybagNotifyToken = -1;
  }
}

- (BOOL)isUIUnlocked
{
  uint64_t state64 = 0;
  int uiUnlockedNotifyToken = self->_uiUnlockedNotifyToken;
  if (uiUnlockedNotifyToken != -1)
  {
    if (notify_get_state(uiUnlockedNotifyToken, &state64))
    {
      uint64_t v3 = nr_daemon_log();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (v4)
      {
        id v5 = nr_daemon_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1000F6AD4();
        }
      }
    }
  }
  return state64 == 0;
}

- (void)dealloc
{
  [(EPMigrationKeyPusher *)self unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)EPMigrationKeyPusher;
  [(EPMigrationKeyPusher *)&v3 dealloc];
}

- (void)sendMessageToWatch:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(EPKey *)self->_key key];
  v9 = sub_10001D51C((uint64_t)v8);

  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = [(EPMigrationKeyPusher *)self keyChannel];
  if (!v10) {
    goto LABEL_9;
  }
  v11 = (void *)v10;
  v12 = [(EPMigrationKeyPusher *)self keyChannel];
  uint32_t v13 = [v12 defaultPairedDevice];
  unsigned int v14 = [v13 isConnected];

  if (v14)
  {
    BOOL v15 = sub_1000A3CF0();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      v17 = sub_1000A3CF0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v9 SHA256Data];
        v19 = [v18 base64EncodedStringWithOptions:0];
        v20 = [v19 substringToIndex:6];
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EPMigrationKeyPusher: sendKeyWithRemoteObject sending key data digest %@", buf, 0xCu);
      }
    }
    id v21 = [(EPMigrationKeyPusher *)self keyChannel];
    v22 = [(EPKey *)self->_key key];
    uint64_t v23 = sub_10001D530((uint64_t)v22);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001766C;
    v27[3] = &unk_100165D38;
    v27[4] = self;
    id v28 = v6;
    id v29 = v7;
    [v21 sendMigrationSetKeyRequestToBTUUID:v28 withKey:v9 withRevision:v23 withResponseBlock:v27];
  }
  else
  {
LABEL_9:
    v24 = nr_daemon_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

    if (v25)
    {
      v26 = nr_daemon_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000F6B3C(v9 == 0, self, v26);
      }
    }
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

+ (id)prefsKeyForPairingID:(id)a3
{
  uint64_t v3 = [a3 UUIDString];
  BOOL v4 = (void *)v3;
  if (v3) {
    CFStringRef v5 = (const __CFString *)v3;
  }
  else {
    CFStringRef v5 = @"none";
  }
  id v6 = [@"migrationKeyCheckDate." stringByAppendingString:v5];

  return v6;
}

- (BOOL)shouldConfirmKeyForWatch:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = +[EPMigrationKeyPusher prefsKeyForPairingID:](EPMigrationKeyPusher, "prefsKeyForPairingID:");
  CFStringRef v5 = [(NRPreferences *)self->_prefs objectForKeyedSubscript:v4];
  if (!v5) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  [v5 doubleValue];
  double v7 = v6;
  BOOL v8 = +[NSDate date];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  double v11 = v7 - v10 + 86400.0;
  if (v11 < -86400.0) {
    goto LABEL_7;
  }
  if (v11 < 86400.0) {
    BOOL v12 = 0;
  }
  else {
LABEL_7:
  }
    BOOL v12 = 1;

  return v12;
}

- (void)didConfirmKeyForWatch:(id)a3
{
  id v6 = +[EPMigrationKeyPusher prefsKeyForPairingID:a3];
  BOOL v4 = +[NSDate date];
  [v4 timeIntervalSinceReferenceDate];
  CFStringRef v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(NRPreferences *)self->_prefs setObject:v5 forKeyedSubscript:v6];

  [(NRPreferences *)self->_prefs synchronize];
}

- (void)update
{
  uint64_t v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    CFStringRef v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPMigrationKeyPusher: Update called!", buf, 2u);
    }
  }
  BOOL v6 = [(EPMigrationKeyPusher *)self isUIUnlocked];
  BOOL v7 = v6 && !self->_wasUIUnlocked;
  self->_wasUIUnlocked = v6;
  CFStringRef v35 = @"ExtendedDeviceLockState";
  v36 = &__kCFBooleanTrue;
  +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  unsigned int v8 = MKBGetDeviceLockState();
  BOOL v9 = 0;
  BOOL v10 = v8 == 3;
  if (v8 > 7)
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = 0;
    if (((1 << v8) & 0xC1) != 0)
    {
      BOOL v11 = !self->_wasUnlocked;
      BOOL v9 = 1;
    }
  }
  self->_wasUnlocked = v9;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  *(void *)buf = 0;
  v22 = buf;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100017D58;
  BOOL v25 = sub_100017D68;
  id v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100017D58;
  v19[4] = sub_100017D68;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100017D58;
  v17[4] = sub_100017D68;
  id v18 = +[NROSTransaction transactionWithName:@"migrationKeyPusher"];
  BOOL v12 = [(EPMigrationKeyPusher *)self registry];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100017D70;
  v13[3] = &unk_100165DB0;
  v13[6] = buf;
  v13[7] = v31;
  v13[4] = self;
  v13[5] = v33;
  v13[8] = v27;
  v13[9] = v29;
  BOOL v14 = v10;
  BOOL v15 = v7;
  BOOL v16 = v11;
  v13[10] = v19;
  v13[11] = v17;
  [v12 grabRegistryWithReadBlock:v13];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

- (void)tagInBluetoothWatches:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    if (!self->_transactionForBackup)
    {
      unsigned int v8 = +[NROSTransaction transactionWithName:@"secureBackupTransaction"];
      transactionForBackup = self->_transactionForBackup;
      self->_transactionForBackup = v8;
    }
    BOOL v10 = [EPPeripheralProcessor alloc];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000188BC;
    v11[3] = &unk_100165E18;
    objc_copyWeak(&v13, &location);
    BOOL v12 = v7;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (void)forceSecureBackup
{
  secureBackupManager = self->_secureBackupManager;
  BOOL v4 = nr_daemon_log();
  CFStringRef v5 = v4;
  if (secureBackupManager)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      BOOL v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000F6C58(v7);
      }
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      BOOL v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Forcing secure backup", buf, 2u);
      }
    }
    BOOL v10 = (SecureBackup *)objc_opt_new();
    BOOL v11 = self->_secureBackupManager;
    self->_secureBackupManager = v10;

    BOOL v12 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018AF4;
    block[3] = &unk_1001655F8;
    block[4] = self;
    dispatch_async(v12, block);
  }
}

- (NROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NROSTransaction)transactionForBackup
{
  return self->_transactionForBackup;
}

- (void)setTransactionForBackup:(id)a3
{
}

- (BOOL)wasUIUnlocked
{
  return self->_wasUIUnlocked;
}

- (void)setWasUIUnlocked:(BOOL)a3
{
  self->_wasUIUnlocked = a3;
}

- (BOOL)wasUnlocked
{
  return self->_wasUnlocked;
}

- (void)setWasUnlocked:(BOOL)a3
{
  self->_wasUnlocked = a3;
}

- (int)uiUnlockedNotifyToken
{
  return self->_uiUnlockedNotifyToken;
}

- (void)setUiUnlockedNotifyToken:(int)a3
{
  self->_int uiUnlockedNotifyToken = a3;
}

- (int)keybagNotifyToken
{
  return self->_keybagNotifyToken;
}

- (void)setKeybagNotifyToken:(int)a3
{
  self->_int keybagNotifyToken = a3;
}

- (EPKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (SecureBackup)secureBackupManager
{
  return self->_secureBackupManager;
}

- (void)setSecureBackupManager:(id)a3
{
}

- (BOOL)sendingTheKey
{
  return self->_sendingTheKey;
}

- (void)setSendingTheKey:(BOOL)a3
{
  self->_sendingTheKey = a3;
}

- (BOOL)flagsUpdatedForcePush
{
  return self->_flagsUpdatedForcePush;
}

- (void)setFlagsUpdatedForcePush:(BOOL)a3
{
  self->_flagsUpdatedForcePush = a3;
}

- (NSUUID)lastActiveDeviceID
{
  return self->_lastActiveDeviceID;
}

- (void)setLastActiveDeviceID:(id)a3
{
}

- (NRPreferences)prefs
{
  return self->_prefs;
}

- (void)setPrefs:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_lastActiveDeviceID, 0);
  objc_storeStrong((id *)&self->_secureBackupManager, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_transactionForBackup, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end