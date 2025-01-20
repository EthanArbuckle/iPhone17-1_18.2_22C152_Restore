@interface ICAuthenticationState
+ (ICAuthenticationState)sharedState;
+ (double)defaultDeauthenticationTimeInterval;
+ (void)setSharedState:(id)a3;
- (BOOL)addMainKeyToKeychainForObject:(id)a3;
- (BOOL)authenticateAllNotesInAccount:(id)a3 withPassphrase:(id)a4;
- (BOOL)authenticateObject:(id)a3 withPassphrase:(id)a4;
- (BOOL)authenticateObjectWithKeychain:(id)a3;
- (BOOL)biometricsEnabledForAccount:(id)a3;
- (BOOL)checkSupportsBiometrics;
- (BOOL)didAttemptToDeauthenticateWhileBlocked;
- (BOOL)hasAuthenticatedObject;
- (BOOL)isAuthenticated;
- (BOOL)isAuthenticatedWithDevicePassword;
- (BOOL)isBlockingDeauthentication;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeAllMainKeysFromKeychain;
- (BOOL)removeMainKeyFromKeychainForObject:(id)a3;
- (BOOL)removeMainKeysFromKeychainForAccount:(id)a3;
- (BOOL)setCachedMainKey:(id)a3 forObject:(id)a4;
- (BOOL)setMainKeyInKeychain:(id)a3 forObject:(id)a4;
- (ICAuthenticationState)init;
- (NSArray)deauthenticationTimerRunLoopModes;
- (NSMutableDictionary)objectIDsToMainKey;
- (NSObject)passphraseChangeObserver;
- (NSTimer)deauthenticationTimer;
- (double)deauthenticationTimeInterval;
- (id)cachedMainKeyForIdentifier:(id)a3;
- (id)cachedMainKeyForKeyObject:(id)a3 decryptingObject:(id)a4;
- (id)cachedMainKeyForObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)faceIDEnabledKeyForAccountIdentifier:(id)a3;
- (id)mainKeyFromKeychainForKeyObject:(id)a3 decryptingObject:(id)a4 cipherVersion:(int64_t)a5;
- (id)mainKeyFromKeychainForObject:(id)a3;
- (id)mainKeyFromKeychainForObject:(id)a3 cipherVersion:(int64_t)a4;
- (id)mainKeyIdentifierForKeyObject:(id)a3 cipherVersion:(int64_t)a4;
- (id)touchIDEnabledKeyForAccountIdentifier:(id)a3;
- (int64_t)blockingDeauthenticationCount;
- (unint64_t)hash;
- (void)authenticateWithDevicePassword;
- (void)beginBlockingDeauthentication;
- (void)dealloc;
- (void)deauthenticate;
- (void)deauthenticateAllObjects;
- (void)deauthenticateWithDevicePassword;
- (void)endBlockingDeauthentication;
- (void)extendDeauthenticationTimer;
- (void)localAuthenticationDidChangeBiometricsPolicyState:(id)a3;
- (void)setAuthenticatedWithDevicePassword:(BOOL)a3;
- (void)setBiometricsEnabled:(BOOL)a3 forAccount:(id)a4;
- (void)setBlockingDeauthenticationCount:(int64_t)a3;
- (void)setCachedMainKey:(id)a3 forIdentifier:(id)a4;
- (void)setDeauthenticationTimeInterval:(double)a3;
- (void)setDeauthenticationTimer:(id)a3;
- (void)setDeauthenticationTimerRunLoopModes:(id)a3;
- (void)setDidAttemptToDeauthenticateWhileBlocked:(BOOL)a3;
- (void)setObjectIDsToMainKey:(id)a3;
- (void)setPassphraseChangeObserver:(id)a3;
@end

@implementation ICAuthenticationState

+ (ICAuthenticationState)sharedState
{
  if (sharedState_onceToken != -1) {
    dispatch_once(&sharedState_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)_sharedState;
  return (ICAuthenticationState *)v2;
}

- (void)extendDeauthenticationTimer
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(ICAuthenticationState *)v2 deauthenticationTimer];
  [v3 invalidate];

  if ([(ICAuthenticationState *)v2 isAuthenticated])
  {
    [(ICAuthenticationState *)v2 deauthenticationTimeInterval];
    if (v4 != 0.0)
    {
      objc_initWeak(&location, v2);
      v5 = (void *)MEMORY[0x1E4F1CB00];
      [(ICAuthenticationState *)v2 deauthenticationTimeInterval];
      double v7 = v6;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__ICAuthenticationState_extendDeauthenticationTimer__block_invoke;
      v20[3] = &unk_1E64A5F10;
      objc_copyWeak(&v21, &location);
      v8 = [v5 timerWithTimeInterval:0 repeats:v20 block:v7];
      [(ICAuthenticationState *)v2 setDeauthenticationTimer:v8];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v9 = [(ICAuthenticationState *)v2 deauthenticationTimerRunLoopModes];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v17;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
            v14 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
            v15 = [(ICAuthenticationState *)v2 deauthenticationTimer];
            [v14 addTimer:v15 forMode:v13];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
        }
        while (v10);
      }

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  objc_sync_exit(v2);
}

- (BOOL)isAuthenticated
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(ICAuthenticationState *)v2 hasAuthenticatedObject]) {
    char v3 = 1;
  }
  else {
    char v3 = [(ICAuthenticationState *)v2 isAuthenticatedWithDevicePassword];
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isAuthenticatedWithDevicePassword
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL authenticatedWithDevicePassword = v2->_authenticatedWithDevicePassword;
  objc_sync_exit(v2);

  return authenticatedWithDevicePassword;
}

- (BOOL)hasAuthenticatedObject
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = [(ICAuthenticationState *)v2 objectIDsToMainKey];
  BOOL v4 = [v3 count] != 0;

  objc_sync_exit(v2);
  return v4;
}

- (NSMutableDictionary)objectIDsToMainKey
{
  return self->_objectIDsToMainKey;
}

- (NSTimer)deauthenticationTimer
{
  return self->_deauthenticationTimer;
}

void __36__ICAuthenticationState_sharedState__block_invoke()
{
  if (_sharedState) {
    v0 = (ICAuthenticationState *)(id)_sharedState;
  }
  else {
    v0 = objc_alloc_init(ICAuthenticationState);
  }
  v1 = (void *)_sharedState;
  _sharedState = (uint64_t)v0;
}

- (ICAuthenticationState)init
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)ICAuthenticationState;
  v2 = [(ICAuthenticationState *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    objectIDsToMainKey = v2->_objectIDsToMainKey;
    v2->_objectIDsToMainKey = (NSMutableDictionary *)v3;

    [(id)objc_opt_class() defaultDeauthenticationTimeInterval];
    v2->_deauthenticationTimeInterval = v5;
    v21[0] = *MEMORY[0x1E4F1C3A0];
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    deauthenticationTimerRunLoopModes = v2->_deauthenticationTimerRunLoopModes;
    v2->_deauthenticationTimerRunLoopModes = (NSArray *)v6;

    objc_initWeak(&location, v2);
    v8 = +[ICNoteContext sharedContext];
    v9 = [v8 crossProcessChangeCoordinator];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __29__ICAuthenticationState_init__block_invoke;
    long long v17 = &unk_1E64A4758;
    objc_copyWeak(&v18, &location);
    uint64_t v10 = [v9 registerForCrossProcessNotificationName:@"ICAccountWillChangePassphraseNotification" block:&v14];
    passphraseChangeObserver = v2->_passphraseChangeObserver;
    v2->_passphraseChangeObserver = v10;

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v14, v15, v16, v17);
    [v12 addObserver:v2 selector:sel_localAuthenticationDidChangeBiometricsPolicyState_ name:@"ICLocalAuthenticationDidChangeBiometricsPolicyStateNotification" object:objc_opt_class()];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (double)defaultDeauthenticationTimeInterval
{
  if (defaultDeauthenticationTimeInterval_onceToken != -1) {
    dispatch_once(&defaultDeauthenticationTimeInterval_onceToken, &__block_literal_global_61);
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"TimeIntervalBeforeClearingCachedKeys"];
  double v4 = v3;

  return v4;
}

void __60__ICAuthenticationState_defaultDeauthenticationTimeInterval__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v2 = @"TimeIntervalBeforeClearingCachedKeys";
  v3[0] = &unk_1F1F62820;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  [v0 registerDefaults:v1];
}

- (BOOL)authenticateObjectWithKeychain:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  obj = self;
  objc_sync_enter(obj);
  double v4 = +[ICAuthenticationState sharedState];
  double v5 = [v4 mainKeyFromKeychainForObject:v23];

  if (v5
    && (+[ICAuthenticationState sharedState],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 setCachedMainKey:v5 forObject:v23],
        v6,
        (v7 & 1) != 0))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v8 = [v23 managedObjectContext];
    v9 = +[ICAccount allActiveAccountsInContext:v8];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v14 = +[ICAuthenticationState sharedState];
          uint64_t v15 = [v14 mainKeyFromKeychainForObject:v13 cipherVersion:0];

          if (v15)
          {
            long long v16 = +[ICAuthenticationState sharedState];
            [v16 setCachedMainKey:v15 forObject:v13];
          }
          long long v17 = +[ICAuthenticationState sharedState];
          id v18 = [v17 mainKeyFromKeychainForObject:v13 cipherVersion:2];

          if (v18)
          {
            long long v19 = +[ICAuthenticationState sharedState];
            [v19 setCachedMainKey:v18 forObject:v13];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = 0;
  }

  objc_sync_exit(obj);
  return v20;
}

- (BOOL)checkSupportsBiometrics
{
  if (+[ICLocalAuthentication biometricsAvailable])
  {
    if (+[ICLocalAuthentication biometricsEnrolled]) {
      return 1;
    }
    double v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v7 = 0;
      double v5 = "Biometrics are not enrolled — deleting all Keychain items";
      uint64_t v6 = (uint8_t *)&v7;
      goto LABEL_8;
    }
  }
  else
  {
    double v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = 0;
      double v5 = "Biometrics are not available — deleting all Keychain items";
      uint64_t v6 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }

  [(ICAuthenticationState *)self removeAllMainKeysFromKeychain];
  return 0;
}

- (id)touchIDEnabledKeyForAccountIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%@", @"ICPasswordTouchIDEnabledKey", a3];
}

- (id)faceIDEnabledKeyForAccountIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%@", @"ICPasswordFaceIDEnabledKey", a3];
}

- (BOOL)biometricsEnabledForAccount:(id)a3
{
  id v4 = a3;
  double v5 = [v4 identifier];
  if ([v5 length])
  {
    uint64_t v6 = [(ICAuthenticationState *)self touchIDEnabledKeyForAccountIdentifier:v5];
    BOOL v7 = +[ICKeychain BOOLeanForIdentifier:v6 account:0];

    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v10 = [(ICAuthenticationState *)self faceIDEnabledKeyForAccountIdentifier:v5];
      BOOL v8 = +[ICKeychain BOOLeanForIdentifier:v10 account:0];
    }
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICAuthenticationState(Keychain) biometricsEnabledForAccount:](v4);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (void)setBiometricsEnabled:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [v6 identifier];
  if ([v7 length])
  {
    BOOL v8 = [(ICAuthenticationState *)self touchIDEnabledKeyForAccountIdentifier:v7];
    +[ICKeychain setBoolean:v4 forIdentifier:v8 account:0 shouldSync:0 error:0];

    v9 = [(ICAuthenticationState *)self faceIDEnabledKeyForAccountIdentifier:v7];
    +[ICKeychain setBoolean:v4 forIdentifier:v9 account:0 shouldSync:0 error:0];
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICAuthenticationState(Keychain) setBiometricsEnabled:forAccount:](v6);
    }
  }
}

- (BOOL)addMainKeyToKeychainForObject:(id)a3
{
  id v4 = a3;
  double v5 = [(ICAuthenticationState *)self cachedMainKeyForObject:v4];
  if (v5)
  {
    BOOL v6 = [(ICAuthenticationState *)self setMainKeyInKeychain:v5 forObject:v4];
  }
  else
  {
    BOOL v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ICAuthenticationState(Keychain) addMainKeyToKeychainForObject:](v4);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)removeMainKeyFromKeychainForObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 shortLoggingDescription];
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2080;
    uint64_t v12 = "-[ICAuthenticationState(Keychain) removeMainKeyFromKeychainForObject:]";
    __int16 v13 = 1024;
    int v14 = 146;
    _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEFAULT, "Removing main key from Keychain… {object: %@}%s:%d", (uint8_t *)&v9, 0x1Cu);
  }
  BOOL v7 = [(ICAuthenticationState *)self setMainKeyInKeychain:0 forObject:v4];

  return v7;
}

- (BOOL)removeMainKeysFromKeychainForAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 identifier];
  if ([v5 length])
  {
    [(ICAuthenticationState *)self setMainKeyInKeychain:0 forObject:v4];
    BOOL v6 = [v4 accountData];
    [(ICAuthenticationState *)self setMainKeyInKeychain:0 forObject:v6];

    id v13 = 0;
    +[ICKeychain deleteItemsOfType:1 account:v5 error:&v13];
    BOOL v7 = v13;
    BOOL v8 = v7;
    if (v7 && [v7 code] != -25300)
    {
      int v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ICAuthenticationState(Keychain) removeMainKeysFromKeychainForAccount:](v4);
      }
      BOOL v11 = 0;
    }
    else
    {
      int v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v4 shortLoggingDescription];
        *(_DWORD *)buf = 138412802;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        long long v17 = "-[ICAuthenticationState(Keychain) removeMainKeysFromKeychainForAccount:]";
        __int16 v18 = 1024;
        int v19 = 170;
        _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEFAULT, "Removed main keys from Keychain {account: %@}%s:%d", buf, 0x1Cu);
      }
      BOOL v11 = 1;
    }
  }
  else
  {
    int v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICAuthenticationState(Keychain) removeMainKeysFromKeychainForAccount:](v4);
    }
    BOOL v11 = 0;
    BOOL v8 = v9;
  }

  return v11;
}

- (BOOL)removeAllMainKeysFromKeychain
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  +[ICKeychain deleteItemsOfType:1 account:0 error:&v7];
  id v2 = v7;
  double v3 = v2;
  if (v2 && [v2 code] != -25300)
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ICAuthenticationState(Keychain) removeAllMainKeysFromKeychain](v4);
    }
    BOOL v5 = 0;
  }
  else
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v9 = "-[ICAuthenticationState(Keychain) removeAllMainKeysFromKeychain]";
      __int16 v10 = 1024;
      int v11 = 184;
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEFAULT, "Removed main keys from Keychain%s:%d", buf, 0x12u);
    }
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)setMainKeyInKeychain:(id)a3 forObject:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 metadata];
  int v9 = -[ICAuthenticationState mainKeyIdentifierForKeyObject:cipherVersion:](self, "mainKeyIdentifierForKeyObject:cipherVersion:", v7, [v8 cipherVersion]);

  __int16 v10 = [v7 cloudAccount];
  int v11 = [v10 identifier];

  if ([v9 length] && objc_msgSend(v11, "length"))
  {
    if (![(ICAuthenticationState *)self checkSupportsBiometrics]) {
      goto LABEL_18;
    }
    uint64_t v12 = [v7 cloudAccount];
    if (!v12
      || (id v13 = (void *)v12,
          [v7 cloudAccount],
          int v14 = objc_claimAutoreleasedReturnValue(),
          BOOL v15 = [(ICAuthenticationState *)self biometricsEnabledForAccount:v14],
          v14,
          v13,
          !v15))
    {
LABEL_18:
      BOOL v23 = 0;
      goto LABEL_19;
    }
    +[ICKeychain deleteItemsForIdentifier:v9 account:v11 error:0];
    if (!v6)
    {
      id v21 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:](v7);
      }
      BOOL v23 = 1;
      goto LABEL_16;
    }
    __int16 v16 = [v7 cryptoStrategy];
    char v17 = [v16 mainKeyDecryptsPrimaryData:v6];

    if (v17)
    {
      __int16 v18 = [v6 serializedData];
      int v19 = ICGroupContainerIdentifier();
      id v25 = 0;
      +[ICKeychain setData:v18 forIdentifier:v9 account:v11 type:1 shouldSync:0 accessFlags:0 accessGroup:v19 error:&v25];
      uint64_t v20 = v25;

      if (v20 && [v20 code] != -25299)
      {
        id v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:](v7, (uint64_t)v20, v21);
        }
        BOOL v23 = 0;
      }
      else
      {
        id v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [v7 shortLoggingDescription];
          *(_DWORD *)buf = 138412802;
          long long v27 = v22;
          __int16 v28 = 2080;
          uint64_t v29 = "-[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:]";
          __int16 v30 = 1024;
          int v31 = 237;
          _os_log_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_DEFAULT, "Added main key to Keychain {object: %@}%s:%d", buf, 0x1Cu);
        }
        BOOL v23 = 1;
      }

      goto LABEL_17;
    }
    id v21 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:].cold.4(v7);
    }
  }
  else
  {
    id v21 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ICAuthenticationState(Keychain) setMainKeyInKeychain:forObject:](v7);
    }
  }
  BOOL v23 = 0;
LABEL_16:
  uint64_t v20 = v21;
LABEL_17:

LABEL_19:
  return v23;
}

- (id)mainKeyFromKeychainForObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
    while (1)
    {
      uint64_t v7 = [(ICAuthenticationState *)self mainKeyFromKeychainForKeyObject:v6 decryptingObject:v5 cipherVersion:+[ICCryptoStrategyFactory cipherVersionForObject:v5]];
      if (v7) {
        break;
      }
      BOOL v8 = [v6 parentEncryptableObject];

      id v6 = v8;
      if (!v8) {
        goto LABEL_8;
      }
    }
    BOOL v8 = (void *)v7;
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)mainKeyFromKeychainForObject:(id)a3 cipherVersion:(int64_t)a4
{
  return [(ICAuthenticationState *)self mainKeyFromKeychainForKeyObject:a3 decryptingObject:a3 cipherVersion:a4];
}

- (id)mainKeyFromKeychainForKeyObject:(id)a3 decryptingObject:(id)a4 cipherVersion:(int64_t)a5
{
  id v8 = a4;
  int v9 = [(ICAuthenticationState *)self mainKeyIdentifierForKeyObject:a3 cipherVersion:a5];
  if (!v9)
  {
    char v17 = 0;
    goto LABEL_14;
  }
  __int16 v10 = +[ICKeychain dataForIdentifier:v9 account:0];
  if (!v10)
  {
    __int16 v16 = 0;
    goto LABEL_12;
  }
  if (+[ICCryptoStrategyFactory cipherVersionForObject:](ICCryptoStrategyFactory, "cipherVersionForObject:", v8)|| [v10 length] != 16)
  {
    __int16 v16 = [[ICEncryptionKey alloc] initWithSerializedData:v10];
    if (!v16)
    {
LABEL_12:
      char v17 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    int v11 = [v8 identifier];
    uint64_t v12 = [v8 cryptoSalt];
    uint64_t v13 = [v8 cryptoIterationCount];
    int v14 = [v8 passwordHint];
    BOOL v15 = +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:v11 salt:v12 iterationCount:v13 hint:v14];

    if (v15) {
      __int16 v16 = [[ICEncryptionKey alloc] initWithKeyData:v10 metadata:v15];
    }
    else {
      __int16 v16 = 0;
    }

    if (!v16) {
      goto LABEL_12;
    }
  }
  __int16 v18 = [v8 cryptoStrategy];
  int v19 = [v18 mainKeyDecryptsPrimaryData:v16];

  if (!v19) {
    goto LABEL_12;
  }
  __int16 v16 = v16;
  char v17 = v16;
LABEL_13:

LABEL_14:
  return v17;
}

void __29__ICAuthenticationState_init__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  performBlockOnMainThread();
  objc_destroyWeak(&v1);
}

void __29__ICAuthenticationState_init__block_invoke_2(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C3A61000, v2, OS_LOG_TYPE_INFO, "Deauthenticating because another process will change a passphrase", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained deauthenticate];
}

- (void)dealloc
{
  double v3 = [(ICAuthenticationState *)self deauthenticationTimer];
  [v3 invalidate];

  id v4 = +[ICNoteContext sharedContext];
  BOOL v5 = [v4 crossProcessChangeCoordinator];
  id v6 = [(ICAuthenticationState *)self passphraseChangeObserver];
  [v5 removeCrossProcessNotificationObserver:v6];

  v7.receiver = self;
  v7.super_class = (Class)ICAuthenticationState;
  [(ICAuthenticationState *)&v7 dealloc];
}

- (id)description
{
  double v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAuthenticationState isAuthenticated](self, "isAuthenticated"));
  objc_super v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAuthenticationState hasAuthenticatedObject](self, "hasAuthenticatedObject"));
  id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAuthenticationState isAuthenticatedWithDevicePassword](self, "isAuthenticatedWithDevicePassword"));
  int v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAuthenticationState isBlockingDeauthentication](self, "isBlockingDeauthentication"));
  __int16 v10 = [v3 stringWithFormat:@"<%@: %p, isAuthenticated: %@, hasAuthenticatedObject: %@, isAuthenticatedWithDevicePassword: %@, isBlockingDeauthentication: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    id v4 = a3;
    objc_opt_class();
    BOOL v5 = ICDynamicCast();

    id v6 = [(ICAuthenticationState *)self objectIDsToMainKey];
    objc_super v7 = [v5 objectIDsToMainKey];
    if ([v6 isEqual:v7])
    {
      BOOL v8 = [(ICAuthenticationState *)self isAuthenticatedWithDevicePassword];
      int v9 = v8 ^ [v5 isAuthenticatedWithDevicePassword] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICAuthenticationState *)self objectIDsToMainKey];
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [v5 hash];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v7 objectForKeyedSubscript:v12];
        uint64_t v14 = ICHashWithObject(v12);
        uint64_t v6 = ICHashWithObject(v13) + v6 - v14 + 32 * v14;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  char v15 = [(ICAuthenticationState *)self isAuthenticatedWithDevicePassword];
  unint64_t v23 = ICHashWithHashKeys(v6, v16, v17, v18, v19, v20, v21, v22, v15);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = [+[ICAuthenticationState allocWithZone:](ICAuthenticationState, "allocWithZone:") init];
  uint64_t v6 = [(ICAuthenticationState *)self objectIDsToMainKey];
  id v7 = (void *)[v6 mutableCopyWithZone:a3];
  [(ICAuthenticationState *)v5 setObjectIDsToMainKey:v7];

  [(ICAuthenticationState *)v5 setAuthenticatedWithDevicePassword:[(ICAuthenticationState *)self isAuthenticatedWithDevicePassword]];
  [(ICAuthenticationState *)v5 setBlockingDeauthenticationCount:[(ICAuthenticationState *)self blockingDeauthenticationCount]];
  [(ICAuthenticationState *)v5 setDidAttemptToDeauthenticateWhileBlocked:[(ICAuthenticationState *)self didAttemptToDeauthenticateWhileBlocked]];
  [(ICAuthenticationState *)self deauthenticationTimeInterval];
  -[ICAuthenticationState setDeauthenticationTimeInterval:](v5, "setDeauthenticationTimeInterval:");
  uint64_t v8 = [(ICAuthenticationState *)self deauthenticationTimerRunLoopModes];
  [(ICAuthenticationState *)v5 setDeauthenticationTimerRunLoopModes:v8];

  return v5;
}

+ (void)setSharedState:(id)a3
{
}

- (void)deauthenticate
{
  id v2 = self;
  objc_sync_enter(v2);
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthenticationState deauthenticate]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if ([(ICAuthenticationState *)v2 isBlockingDeauthentication])
  {
    [(ICAuthenticationState *)v2 setDidAttemptToDeauthenticateWhileBlocked:1];
    id v3 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_INFO, "Not deauthenticating because deauthentication is blocked", v5, 2u);
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"ICAuthenticationStateWillDeauthenticateNotification" object:v2];

    [(ICAuthenticationState *)v2 deauthenticateAllObjects];
    [(ICAuthenticationState *)v2 deauthenticateWithDevicePassword];
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"ICAuthenticationStateDidDeauthenticateNotification" object:v2];
  }

  objc_sync_exit(v2);
}

- (BOOL)isBlockingDeauthentication
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(ICAuthenticationState *)v2 blockingDeauthenticationCount] > 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)beginBlockingDeauthentication
{
  obj = self;
  objc_sync_enter(obj);
  [(ICAuthenticationState *)obj setBlockingDeauthenticationCount:[(ICAuthenticationState *)obj blockingDeauthenticationCount] + 1];
  objc_sync_exit(obj);
}

- (void)endBlockingDeauthentication
{
  id v2 = self;
  objc_sync_enter(v2);
  if (![(ICAuthenticationState *)v2 isBlockingDeauthentication]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isBlockingDeauthentication" functionName:"-[ICAuthenticationState endBlockingDeauthentication]" simulateCrash:1 showAlert:0 format:@"Unbalanced calls to begin/end blocking deauthentication"];
  }
  uint64_t v3 = [(ICAuthenticationState *)v2 blockingDeauthenticationCount];
  if (v3 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  [(ICAuthenticationState *)v2 setBlockingDeauthenticationCount:v4 - 1];
  objc_sync_exit(v2);

  performBlockOnMainThread();
}

uint64_t __52__ICAuthenticationState_endBlockingDeauthentication__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isBlockingDeauthentication];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) didAttemptToDeauthenticateWhileBlocked];
    if (result)
    {
      [*(id *)(a1 + 32) deauthenticate];
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 setDidAttemptToDeauthenticateWhileBlocked:0];
    }
  }
  return result;
}

- (BOOL)authenticateObject:(id)a3 withPassphrase:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  int v9 = [v6 isPassphraseCorrect:v7];
  uint64_t v10 = [v6 cloudAccount];
  int v11 = [v10 isPassphraseCorrect:v7];

  if ((v9 | v11))
  {
    if (v9)
    {
      uint64_t v12 = [v6 cryptoStrategy];
      LOBYTE(v9) = [v12 authenticateWithPassphrase:v7];
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v13 = [v6 managedObjectContext];
    uint64_t v14 = +[ICAccount allActiveAccountsInContext:v13];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (([v18 isAuthenticated] & 1) == 0
            && [v18 isPassphraseCorrect:v7])
          {
            uint64_t v19 = [v18 cryptoStrategy];
            [v19 authenticateWithPassphrase:v7];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v15);
    }

    objc_sync_exit(v8);
    objc_opt_class();
    uint64_t v20 = ICDynamicCast();
    uint64_t v21 = [v20 objectID];

    if (v21)
    {
      uint64_t v22 = objc_alloc_init(ICCryptoConvergenceControllerConfiguration);
      [(ICCryptoConvergenceControllerConfiguration *)v22 setPassphrase:v7];
      unint64_t v23 = +[ICCryptoConvergenceController sharedController];
      [v23 convergeAttachmentsInNoteWithID:v21 configuration:v22];
    }
    objc_opt_class();
    long long v24 = ICDynamicCast();
    long long v25 = [v24 objectID];

    if (v25 && ([MEMORY[0x1E4F83738] isRunningUnitTests] & 1) == 0)
    {
      long long v26 = dispatch_get_global_queue(-32768, 0);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __59__ICAuthenticationState_authenticateObject_withPassphrase___block_invoke;
      v28[3] = &unk_1E64A4218;
      id v29 = v7;
      id v30 = v25;
      dispatch_async(v26, v28);
    }
  }
  else
  {
    objc_sync_exit(v8);

    LOBYTE(v9) = 0;
  }

  return v9;
}

void __59__ICAuthenticationState_authenticateObject_withPassphrase___block_invoke(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(ICCryptoConvergenceControllerConfiguration);
  [(ICCryptoConvergenceControllerConfiguration *)v3 setPassphrase:*(void *)(a1 + 32)];
  id v2 = +[ICCryptoConvergenceController sharedController];
  [v2 convergeNotesInAccountWithID:*(void *)(a1 + 40) configuration:v3 progress:0];
}

- (BOOL)authenticateAllNotesInAccount:(id)a3 withPassphrase:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  int v9 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [v6 shortLoggingDescription];
    -[ICAuthenticationState authenticateAllNotesInAccount:withPassphrase:](v10, buf, v9);
  }

  if ([v6 isPassphraseCorrect:v7]) {
    [(ICAuthenticationState *)v8 authenticateObject:v6 withPassphrase:v7];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v11 = objc_msgSend(v6, "passwordProtectedNotes", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([v15 isAuthenticated] & 1) == 0
          && [v15 isPassphraseCorrect:v7])
        {
          uint64_t v16 = [v15 cryptoStrategy];
          [v16 authenticateWithPassphrase:v7];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  char v17 = [v6 isAuthenticated];
  objc_sync_exit(v8);

  return v17;
}

- (void)deauthenticateAllObjects
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Deauthenticated all objects with custom password", v2, v3, v4, v5, v6);
}

- (void)authenticateWithDevicePassword
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Authenticated with device password", v2, v3, v4, v5, v6);
}

- (void)deauthenticateWithDevicePassword
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Deauthenticated with device password", v2, v3, v4, v5, v6);
}

- (id)mainKeyIdentifierForKeyObject:(id)a3 cipherVersion:(int64_t)a4
{
  id v5 = a3;
  uint8_t v6 = v5;
  if (a4 == 2)
  {
    objc_opt_class();
    uint64_t v8 = ICDynamicCast();
    int v9 = [v8 accountData];
    uint64_t v10 = [v9 identifier];
    int v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v6 identifier];
    }
    id v7 = v12;
  }
  else if (a4)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 identifier];
  }

  return v7;
}

- (BOOL)setCachedMainKey:(id)a3 forObject:(id)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  int v9 = [v6 metadata];
  uint64_t v10 = -[ICAuthenticationState mainKeyIdentifierForKeyObject:cipherVersion:](v8, "mainKeyIdentifierForKeyObject:cipherVersion:", v7, [v9 cipherVersion]);

  if ([v10 length])
  {
    if (v6)
    {
      int v11 = [v7 cryptoStrategy];
      char v12 = [v11 mainKeyDecryptsPrimaryData:v6];

      if ((v12 & 1) == 0)
      {
        long long v22 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          unint64_t v23 = [v7 shortLoggingDescription];
          -[ICAuthenticationState setCachedMainKey:forObject:](v23, (uint8_t *)&v36, v22);
        }
        BOOL v21 = 0;
        uint64_t v13 = v22;
        goto LABEL_34;
      }
    }
    uint64_t v13 = [(ICAuthenticationState *)v8 cachedMainKeyForIdentifier:v10];
    uint64_t v14 = (void *)*MEMORY[0x1E4F1D260];
    if ((id)*MEMORY[0x1E4F1D260] == v6) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = v6;
    }
    unint64_t v16 = v15;
    if (v14 == v13) {
      char v17 = 0;
    }
    else {
      char v17 = v13;
    }
    unint64_t v18 = v17;
    if (v16 | v18)
    {
      long long v19 = (void *)v18;
      if (v16 && v18)
      {
        char v20 = [(id)v16 isEqual:v18];

        if (v20) {
          goto LABEL_27;
        }
      }
      else
      {
      }
      long long v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      if (v6)
      {
        v48 = @"ICAuthenticationStateKeyObjectID";
        uint64_t v25 = [v7 objectID];
        v49[0] = v25;
        long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
        [v24 postNotificationName:@"ICAuthenticationStateWillAuthenticateNotification" object:v8 userInfo:v26];
      }
      else
      {
        v46 = @"ICAuthenticationStateKeyObjectID";
        uint64_t v25 = [v7 objectID];
        v47 = v25;
        long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        [v24 postNotificationName:@"ICAuthenticationStateWillDeauthenticateNotification" object:v8 userInfo:v26];
      }

      [(ICAuthenticationState *)v8 setCachedMainKey:v6 forIdentifier:v10];
      [(ICAuthenticationState *)v8 setMainKeyInKeychain:v6 forObject:v7];
      long long v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      if (v6)
      {
        v44 = @"ICAuthenticationStateKeyObjectID";
        long long v28 = [v7 objectID];
        v45 = v28;
        id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        [v27 postNotificationName:@"ICAuthenticationStateDidAuthenticateNotification" object:v8 userInfo:v29];
      }
      else
      {
        v42 = @"ICAuthenticationStateKeyObjectID";
        long long v28 = [v7 objectID];
        v43 = v28;
        id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        [v27 postNotificationName:@"ICAuthenticationStateDidDeauthenticateNotification" object:v8 userInfo:v29];
      }
    }
LABEL_27:
    id v30 = [v7 parentEncryptableObject];
    long long v22 = v30;
    if (v6)
    {
      if (v30)
      {
        long long v31 = [v30 cryptoStrategy];
        int v32 = [v31 mainKeyDecryptsPrimaryData:v6];

        if (v32) {
          [(ICAuthenticationState *)v8 setCachedMainKey:v6 forObject:v22];
        }
      }
    }
    [(ICAuthenticationState *)v8 extendDeauthenticationTimer];
    long long v33 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v35 = [v7 shortLoggingDescription];
      int v36 = 138412802;
      v37 = v35;
      __int16 v38 = 2112;
      v39 = v13;
      __int16 v40 = 2112;
      id v41 = v6;
      _os_log_debug_impl(&dword_1C3A61000, v33, OS_LOG_TYPE_DEBUG, "Set cached main key for object {object: %@, oldMainKey: %@, newMainKey: %@}", (uint8_t *)&v36, 0x20u);
    }
    BOOL v21 = 1;
LABEL_34:

    goto LABEL_35;
  }
  BOOL v21 = 0;
LABEL_35:

  objc_sync_exit(v8);
  return v21;
}

- (id)cachedMainKeyForObject:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = v6;
    do
    {
      int v9 = [(ICAuthenticationState *)v5 cachedMainKeyForKeyObject:v8 decryptingObject:v7];
      if (v9) {
        goto LABEL_9;
      }
      uint64_t v10 = [v8 parentEncryptableObject];

      uint64_t v8 = (void *)v10;
    }
    while (v10);
  }
  int v11 = [v7 primaryEncryptedData];
  if (v11)
  {

LABEL_8:
    uint64_t v8 = [(ICAuthenticationState *)v5 objectIDsToMainKey];
    uint64_t v13 = [v8 allValues];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__ICAuthenticationState_cachedMainKeyForObject___block_invoke;
    v15[3] = &unk_1E64A5EE8;
    id v16 = v7;
    int v9 = objc_msgSend(v13, "ic_objectPassingTest:", v15);

LABEL_9:
    goto LABEL_10;
  }
  char v12 = [v7 unappliedEncryptedRecord];

  if (v12) {
    goto LABEL_8;
  }
  int v9 = 0;
LABEL_10:
  objc_sync_exit(v5);

  return v9;
}

uint64_t __48__ICAuthenticationState_cachedMainKeyForObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 cryptoStrategy];
  uint64_t v5 = [v4 mainKeyDecryptsPrimaryData:v3];

  return v5;
}

- (id)cachedMainKeyForKeyObject:(id)a3 decryptingObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  int v9 = [(ICAuthenticationState *)v8 mainKeyIdentifierForKeyObject:v6 cipherVersion:+[ICCryptoStrategyFactory cipherVersionForObject:v7]];
  if ([v9 length])
  {
    uint64_t v10 = [(ICAuthenticationState *)v8 cachedMainKeyForIdentifier:v9];
    if (v10
      && ([v7 cryptoStrategy],
          int v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v11 mainKeyDecryptsPrimaryData:v10],
          v11,
          (v12 & 1) != 0))
    {
      id v13 = v10;
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  objc_sync_exit(v8);
  return v13;
}

- (void)setCachedMainKey:(id)a3 forIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(ICAuthenticationState *)v7 objectIDsToMainKey];
  [v8 setObject:v9 forKeyedSubscript:v6];

  objc_sync_exit(v7);
}

- (id)cachedMainKeyForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(ICAuthenticationState *)v5 objectIDsToMainKey];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  return v7;
}

- (void)setDeauthenticationTimeInterval:(double)a3
{
  self->_deauthenticationTimeInterval = a3;
  [(ICAuthenticationState *)self extendDeauthenticationTimer];
}

- (void)setDeauthenticationTimerRunLoopModes:(id)a3
{
  objc_storeStrong((id *)&self->_deauthenticationTimerRunLoopModes, a3);
  [(ICAuthenticationState *)self extendDeauthenticationTimer];
}

void __52__ICAuthenticationState_extendDeauthenticationTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__ICAuthenticationState_extendDeauthenticationTimer__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained deauthenticate];

  [v3 invalidate];
}

- (void)localAuthenticationDidChangeBiometricsPolicyState:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Cached biometrics policy state became invalid — deleting all Keychain items", v5, 2u);
  }

  [(ICAuthenticationState *)self removeAllMainKeysFromKeychain];
}

- (void)setAuthenticatedWithDevicePassword:(BOOL)a3
{
  self->_BOOL authenticatedWithDevicePassword = a3;
}

- (double)deauthenticationTimeInterval
{
  return self->_deauthenticationTimeInterval;
}

- (NSArray)deauthenticationTimerRunLoopModes
{
  return self->_deauthenticationTimerRunLoopModes;
}

- (void)setObjectIDsToMainKey:(id)a3
{
}

- (int64_t)blockingDeauthenticationCount
{
  return self->_blockingDeauthenticationCount;
}

- (void)setBlockingDeauthenticationCount:(int64_t)a3
{
  self->_blockingDeauthenticationCount = a3;
}

- (void)setDeauthenticationTimer:(id)a3
{
}

- (BOOL)didAttemptToDeauthenticateWhileBlocked
{
  return self->_didAttemptToDeauthenticateWhileBlocked;
}

- (void)setDidAttemptToDeauthenticateWhileBlocked:(BOOL)a3
{
  self->_didAttemptToDeauthenticateWhileBlocked = a3;
}

- (NSObject)passphraseChangeObserver
{
  return self->_passphraseChangeObserver;
}

- (void)setPassphraseChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passphraseChangeObserver, 0);
  objc_storeStrong((id *)&self->_deauthenticationTimer, 0);
  objc_storeStrong((id *)&self->_objectIDsToMainKey, 0);
  objc_storeStrong((id *)&self->_deauthenticationTimerRunLoopModes, 0);
}

- (void)authenticateAllNotesInAccount:(os_log_t)log withPassphrase:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Authenticating all notes… {account: %@}", buf, 0xCu);
}

- (void)setCachedMainKey:(os_log_t)log forObject:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Cannot set main key because it doesn't decrypt object {object: %@}", buf, 0xCu);
}

void __52__ICAuthenticationState_extendDeauthenticationTimer__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Deauthenticating after timer expired…", v2, v3, v4, v5, v6);
}

@end