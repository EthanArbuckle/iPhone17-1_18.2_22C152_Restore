@interface SDAppleIDDatabaseManager
+ (id)sharedManager;
- (NSDate)lastConnectionDate;
- (NSDate)lastSuccessfulConnectionDate;
- (NSDictionary)metaInfo;
- (NSMutableDictionary)personInfoCache;
- (SDAppleIDDatabaseManager)init;
- (SFAppleIDAccount)account;
- (id)_accountForAppleID:(id)a3;
- (id)_cachedPersonInfoWithEmailOrPhone:(id)a3;
- (id)_identityForAppleID:(id)a3;
- (id)_statusInfo;
- (id)accountForAppleID:(id)a3;
- (id)cachedPersonInfoWithEmailOrPhone:(id)a3;
- (id)identityForAppleID:(id)a3;
- (id)statusInfo;
- (void)_addAppleID:(id)a3;
- (void)_addPersonInfoToCache:(id)a3;
- (void)_clearLegacyPreferencesIfNeeded;
- (void)_clearPersonInfoCache;
- (void)_postNotificationWithName:(id)a3;
- (void)_readPrefs;
- (void)_removeAppleID:(id)a3;
- (void)_setAccount:(id)a3;
- (void)_setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5;
- (void)_setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5;
- (void)_setIdentity:(id)a3 forAppleID:(id)a4;
- (void)_setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4;
- (void)_setLastConnectionDate:(id)a3;
- (void)_setLastSuccessfulConnectionDate:(id)a3;
- (void)_setMetaInfo:(id)a3;
- (void)_updateAccountInfoPrefs;
- (void)_updateMetaInfoPrefs;
- (void)_updatePersonInfoCachePrefs;
- (void)addAppleID:(id)a3;
- (void)addPersonInfoToCache:(id)a3;
- (void)clearPersonInfoCache;
- (void)removeAppleID:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5;
- (void)setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5;
- (void)setIdentity:(id)a3 forAppleID:(id)a4;
- (void)setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4;
- (void)setLastConnectionDate:(id)a3;
- (void)setLastSuccessfulConnectionDate:(id)a3;
- (void)setMetaInfo:(id)a3;
- (void)setPersonInfoCache:(id)a3;
@end

@implementation SDAppleIDDatabaseManager

- (SDAppleIDDatabaseManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDAppleIDDatabaseManager;
  v2 = [(SDAppleIDDatabaseManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[SDAppleIDAccountInfoStoreFactory platformStore];
    accountInfoStore = v2->_accountInfoStore;
    v2->_accountInfoStore = (_TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    personInfoCache = v2->_personInfoCache;
    v2->_personInfoCache = (NSMutableDictionary *)v5;

    [(SDAppleIDDatabaseManager *)v2 _readPrefs];
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_10097FF80 != -1) {
    dispatch_once(&qword_10097FF80, &stru_1008CD398);
  }
  v2 = (void *)qword_10097FF88;

  return v2;
}

- (void)_readPrefs
{
  v2 = self;
  accountInfoStore = self->_accountInfoStore;
  if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
  {
    metaInfo = @"com.apple.sharingd";
    LogPrintF();
  }
  CFStringRef v4 = kCFPreferencesCurrentUser;
  uint64_t v5 = (void *)CFPreferencesCopyValue(@"AppleIDAgentMetaInfo", @"com.apple.sharingd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v2;
    v7 = accountInfoStore;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    id v38 = 0;
    v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v5 error:&v38];
    id v13 = v38;
    if (v12)
    {
      v35 = v12;
      objc_storeStrong((id *)&v6->_metaInfo, v12);
      accountInfoStore = v7;
      if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
      {
        metaInfo = (__CFString *)v6->_metaInfo;
        LogPrintF();
      }
    }
    else
    {
      accountInfoStore = v7;
      if (dword_1009678D8 <= 60)
      {
        v2 = v6;
        if (dword_1009678D8 != -1 || _LogCategory_Initialize())
        {
          metaInfo = @"AppleIDAgentMetaInfo";
          id v34 = v13;
          LogPrintF();
        }
        v35 = 0;
LABEL_18:
        CFStringRef v4 = kCFPreferencesCurrentUser;
        if (!accountInfoStore) {
          goto LABEL_21;
        }
        goto LABEL_19;
      }
      v35 = 0;
    }
    v2 = v6;
    goto LABEL_18;
  }
  v11 = 0;
  id v13 = 0;
  v35 = 0;
  if (!accountInfoStore) {
    goto LABEL_21;
  }
LABEL_19:
  if ([(SDAppleIDPlatformAccountInfoStore *)v2->_accountInfoStore storeExists])
  {
    v14 = 0;
    v15 = 0;
LABEL_53:
    if ([(SDAppleIDPlatformAccountInfoStore *)v2->_accountInfoStore storeExists])
    {
      v22 = [(SDAppleIDPlatformAccountInfoStore *)v2->_accountInfoStore read];
      v23 = v22;
      if (v22)
      {
        v24 = [v22 account];

        if (v24)
        {
          v25 = [v23 account];
          [(SDAppleIDDatabaseManager *)v2 _setAccount:v25];
        }
        v26 = [v23 personInfo];
        id v27 = [v26 mutableCopy];

        if (v27)
        {
          v28 = [v23 personInfo];
          id v29 = [v28 mutableCopy];
          [(SDAppleIDDatabaseManager *)v2 setPersonInfoCache:v29];
        }
      }
      else if (dword_1009678D8 <= 90 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SDAppleIDDatabaseManager *)v2 _clearLegacyPreferencesIfNeeded];
    }
    else
    {
      if (dword_1009678D8 <= 50 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v30 = v2->_accountInfoStore;
      v31 = [(SDAppleIDDatabaseManager *)v2 account];
      v32 = [(SDAppleIDDatabaseManager *)v2 personInfoCache];
      LODWORD(v30) = [(SDAppleIDPlatformAccountInfoStore *)v30 storeWithAccount:v31 personInfo:v32];

      if (v30) {
        [(SDAppleIDDatabaseManager *)v2 _clearLegacyPreferencesIfNeeded];
      }
    }
    goto LABEL_70;
  }
LABEL_21:
  if (dword_1009678D8 <= 50 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v16 = (void *)CFPreferencesCopyValue(@"AppleIDAccount", @"com.apple.sharingd", v4, kCFPreferencesCurrentHost);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_38;
  }

  id v37 = 0;
  v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v16 error:&v37];
  id v13 = v37;
  if (!v15)
  {
    if (dword_1009678D8 <= 60 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
    {
      metaInfo = @"AppleIDAccount";
      id v34 = v13;
      LogPrintF();
    }
LABEL_38:
    v15 = 0;
    goto LABEL_39;
  }
  [(SDAppleIDDatabaseManager *)v2 _setAccount:v15];
  if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
  {
    metaInfo = [(SDAppleIDDatabaseManager *)v2 account];
    LogPrintF();
  }
LABEL_39:
  uint64_t v5 = (void *)CFPreferencesCopyValue(@"PersonInfoCache", @"com.apple.sharingd", v4, kCFPreferencesCurrentHost);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, objc_opt_class(), 0);

    id v36 = 0;
    v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v19 fromData:v5 error:&v36];
    id v13 = v36;
    if (v14)
    {
      v20 = +[NSMutableDictionary dictionaryWithDictionary:v14];
      [(SDAppleIDDatabaseManager *)v2 setPersonInfoCache:v20];

      if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
      {
        v21 = [(SDAppleIDDatabaseManager *)v2 personInfoCache];
        metaInfo = (__CFString *)[v21 count];
        LogPrintF();
      }
    }
    else
    {
      if (dword_1009678D8 <= 60 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
      {
        metaInfo = @"PersonInfoCache";
        id v34 = v13;
        LogPrintF();
      }
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    uint64_t v19 = (uint64_t)v11;
  }
  v11 = (void *)v19;
  if (accountInfoStore) {
    goto LABEL_53;
  }
LABEL_70:
}

- (void)_clearLegacyPreferencesIfNeeded
{
  accountInfoStore = self->_accountInfoStore;
  unsigned int v3 = [(SDAppleIDPlatformAccountInfoStore *)accountInfoStore storeExists];
  if (accountInfoStore) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    if (dword_1009678D8 <= 50 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFPreferencesSetValue(@"AppleIDAccount", 0, @"com.apple.sharingd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSetValue(@"PersonInfoCache", 0, @"com.apple.sharingd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(@"com.apple.sharingd");
  }
}

- (id)_identityForAppleID:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(SDAppleIDDatabaseManager *)self account],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 appleID],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:v4],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(SDAppleIDDatabaseManager *)self account];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [v8 identity];

  return v9;
}

- (id)_accountForAppleID:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(SDAppleIDDatabaseManager *)self account],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 appleID],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:v4],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(SDAppleIDDatabaseManager *)self account];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)accountForAppleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v6 = [(SDAppleIDDatabaseManager *)v5 _accountForAppleID:v4];
  id v7 = [v6 copy];

  objc_sync_exit(v5);

  return v7;
}

- (id)identityForAppleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v6 = [(SDAppleIDDatabaseManager *)v5 _identityForAppleID:v4];
  id v7 = [v6 copy];

  objc_sync_exit(v5);

  return v7;
}

- (id)_statusInfo
{
  unsigned int v3 = +[NSMutableDictionary dictionary];
  if (v3)
  {
    id v4 = +[NSNumber numberWithInt:MKBDeviceUnlockedSinceBoot()];
    [v3 setObject:v4 forKeyedSubscript:@"DeviceUnlockedSinceBoot"];

    uint64_t v5 = +[NSNumber numberWithInt:getpid()];
    [v3 setObject:v5 forKeyedSubscript:@"PID"];

    [v3 setObject:self->_lastConnectionDate forKeyedSubscript:@"LastConnectAttempt"];
    [v3 setObject:self->_lastSuccessfulConnectionDate forKeyedSubscript:@"LastSuccessfulConnect"];
    [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"AccountRequiresUserAction"];
    id v6 = v3;
  }

  return v3;
}

- (id)statusInfo
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(SDAppleIDDatabaseManager *)v2 _statusInfo];
  objc_sync_exit(v2);

  return v3;
}

- (void)_updateAccountInfoPrefs
{
  accountInfoStore = self->_accountInfoStore;
  uint64_t v4 = [(SDAppleIDDatabaseManager *)self account];
  uint64_t v5 = (void *)v4;
  if (accountInfoStore)
  {
    id v6 = [(SDAppleIDDatabaseManager *)self personInfoCache];
    [(SDAppleIDPlatformAccountInfoStore *)accountInfoStore storeWithAccount:v5 personInfo:v6];

    id v7 = v5;
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = [(SDAppleIDDatabaseManager *)self account];
      CFPropertyListRef value = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
    }
    else
    {
      CFPropertyListRef value = 0;
    }

    CFPreferencesSetValue(@"AppleIDAccount", value, @"com.apple.sharingd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(@"com.apple.sharingd");
    if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = (void *)value;
  }
}

- (void)_updateMetaInfoPrefs
{
  id v2 = +[NSKeyedArchiver archivedDataWithRootObject:self->_metaInfo requiringSecureCoding:1 error:0];
  CFPreferencesSetValue(@"AppleIDAgentMetaInfo", v2, @"com.apple.sharingd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFPreferencesAppSynchronize(@"com.apple.sharingd");
  if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_updatePersonInfoCachePrefs
{
  accountInfoStore = self->_accountInfoStore;
  if (accountInfoStore)
  {
    CFPropertyListRef value = [(SDAppleIDDatabaseManager *)self account];
    uint64_t v4 = [(SDAppleIDDatabaseManager *)self personInfoCache];
    [(SDAppleIDPlatformAccountInfoStore *)accountInfoStore storeWithAccount:value personInfo:v4];
  }
  else
  {
    uint64_t v5 = [(SDAppleIDDatabaseManager *)self personInfoCache];
    CFPropertyListRef value = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];

    CFPreferencesSetValue(@"PersonInfoCache", value, @"com.apple.sharingd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(@"com.apple.sharingd");
    if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_setAccount:(id)a3
{
  id v23 = a3;
  uint64_t v4 = [(SDAppleIDDatabaseManager *)self account];
  unsigned __int8 v5 = [v23 isEqual:v4];

  id v6 = v23;
  if ((v5 & 1) == 0)
  {
    id v7 = [v23 identity];
    uint64_t v8 = [(SDAppleIDDatabaseManager *)self account];
    uint64_t v9 = [v8 identity];
    if (v7 == v9)
    {
      unsigned int v13 = 0;
    }
    else
    {
      uint64_t v10 = [v23 identity];
      v11 = [(SDAppleIDDatabaseManager *)self account];
      v12 = [v11 identity];
      unsigned int v13 = [v10 isEqual:v12] ^ 1;
    }
    v14 = [v23 validationRecord];
    v15 = [(SDAppleIDDatabaseManager *)self account];
    v16 = [v15 validationRecord];
    if (v14 == v16)
    {
      unsigned int v20 = 0;
    }
    else
    {
      uint64_t v17 = [v23 validationRecord];
      uint64_t v18 = [(SDAppleIDDatabaseManager *)self account];
      uint64_t v19 = [v18 validationRecord];
      unsigned int v20 = [v17 isEqual:v19] ^ 1;
    }
    v21 = [(SDAppleIDDatabaseManager *)self account];
    v22 = [v21 identity];
    [v22 removeFromKeychain];

    [(SDAppleIDDatabaseManager *)self setAccount:v23];
    [(SDAppleIDDatabaseManager *)self _updateAccountInfoPrefs];
    if (v13) {
      [(SDAppleIDDatabaseManager *)self _postNotificationWithName:SFAppleIDIdentityDidChangeNotification];
    }
    id v6 = v23;
    if (v20)
    {
      [(SDAppleIDDatabaseManager *)self _postNotificationWithName:SFAppleIDValidationRecordDidChangeNotification];
      id v6 = v23;
    }
  }
}

- (void)_addAppleID:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    uint64_t v5 = [(SDAppleIDDatabaseManager *)self _accountForAppleID:v4];
    if (v5) {
      id v6 = (id)v5;
    }
    else {
      id v6 = [objc_alloc((Class)SFAppleIDAccount) initWithAppleID:v7];
    }
    [(SDAppleIDDatabaseManager *)self _setAccount:v6];
    if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (void)addAppleID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(SDAppleIDDatabaseManager *)v4 _addAppleID:v5];
  objc_sync_exit(v4);
}

- (void)_removeAppleID:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = [(SDAppleIDDatabaseManager *)self account];
    id v5 = [v4 appleID];
    unsigned int v6 = [v5 isEqualToString:v7];

    if (v6)
    {
      [(SDAppleIDDatabaseManager *)self _setAccount:0];
      if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)removeAppleID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(SDAppleIDDatabaseManager *)v4 _removeAppleID:v5];
  objc_sync_exit(v4);
}

- (void)_addPersonInfoToCache:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [v8 matchedValue];

    if (v4)
    {
      id v5 = [(SDAppleIDDatabaseManager *)self personInfoCache];
      unsigned int v6 = [v8 matchedValue];
      [v5 setObject:v8 forKeyedSubscript:v6];

      [(SDAppleIDDatabaseManager *)self _updatePersonInfoCachePrefs];
      if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
      {
        id v7 = [v8 matchedValue];
        LogPrintF();
      }
    }
  }
}

- (void)addPersonInfoToCache:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(SDAppleIDDatabaseManager *)v4 _addPersonInfoToCache:v5];
  objc_sync_exit(v4);
}

- (id)_cachedPersonInfoWithEmailOrPhone:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SDAppleIDDatabaseManager *)self personInfoCache];
    unsigned int v6 = [v5 objectForKeyedSubscript:v4];

    if (v6 && ([v6 isStale] & 1) == 0)
    {
      id v7 = v6;
      unsigned int v6 = v7;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
    unsigned int v6 = 0;
  }

  return v7;
}

- (id)cachedPersonInfoWithEmailOrPhone:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = [(SDAppleIDDatabaseManager *)v5 _cachedPersonInfoWithEmailOrPhone:v4];
  objc_sync_exit(v5);

  if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
  {
    id v8 = [v6 matchedValue];
    LogPrintF();
  }

  return v6;
}

- (void)_clearPersonInfoCache
{
  accountInfoStore = self->_accountInfoStore;
  id v4 = [(SDAppleIDDatabaseManager *)self personInfoCache];
  [v4 removeAllObjects];

  if (accountInfoStore)
  {
    id v5 = self->_accountInfoStore;
    id v6 = [(SDAppleIDDatabaseManager *)self account];
    [(SDAppleIDPlatformAccountInfoStore *)v5 deletePersonInfoCacheWithAccount:v6];
  }
  else
  {
    [(SDAppleIDDatabaseManager *)self _updatePersonInfoCachePrefs];
  }
}

- (void)clearPersonInfoCache
{
  obj = self;
  objc_sync_enter(obj);
  [(SDAppleIDDatabaseManager *)obj _clearPersonInfoCache];
  objc_sync_exit(obj);
}

- (void)_setLastConnectionDate:(id)a3
{
}

- (void)setLastConnectionDate:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(SDAppleIDDatabaseManager *)v4 _setLastConnectionDate:v5];
  objc_sync_exit(v4);
}

- (void)_setLastSuccessfulConnectionDate:(id)a3
{
}

- (void)setLastSuccessfulConnectionDate:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(SDAppleIDDatabaseManager *)v4 _setLastSuccessfulConnectionDate:v5];
  objc_sync_exit(v4);
}

- (void)_setIdentity:(id)a3 forAppleID:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if (!v6)
  {
LABEL_33:
    id v9 = 0;
    v14 = 0;
    id v8 = 0;
    goto LABEL_26;
  }
  id v7 = [(SDAppleIDDatabaseManager *)self _accountForAppleID:v6];
  if (!v7)
  {
    if (dword_1009678D8 <= 90 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_33;
  }
  id v8 = v7;
  id v9 = [v7 identity];
  uint64_t v10 = v22;
  if (v9 == v22)
  {
    int v11 = 0;
  }
  else
  {
    if ([v22 isEqual:v9])
    {
      int v11 = 0;
    }
    else
    {
      v12 = [v8 identity];
      [v12 removeFromKeychain];

      [v8 setIdentity:v22];
      if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
      {
        unsigned int v13 = "Replaced";
        if (!v9) {
          unsigned int v13 = "Added";
        }
        id v20 = v6;
        id v21 = v22;
        uint64_t v19 = v13;
        LogPrintF();
      }
      -[SDAppleIDDatabaseManager _postNotificationWithName:](self, "_postNotificationWithName:", SFAppleIDIdentityDidChangeNotification, v19, v20, v21);
      int v11 = 1;
    }
    uint64_t v10 = v22;
  }
  v14 = [v10 altDSID];
  uint64_t v15 = [v8 altDSID];
  if (v14 != (void *)v15)
  {
    v16 = (void *)v15;
    uint64_t v17 = [v8 altDSID];
    unsigned __int8 v18 = [v14 isEqual:v17];

    if (v18)
    {
      if (!v11) {
        goto LABEL_26;
      }
    }
    else
    {
      [v8 setAltDSID:v14];
      if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        [(SDAppleIDDatabaseManager *)self _updateAccountInfoPrefs];
        goto LABEL_26;
      }
    }
LABEL_25:
    [(SDAppleIDDatabaseManager *)self _updateAccountInfoPrefs];
    goto LABEL_26;
  }

  if (v11) {
    goto LABEL_25;
  }
LABEL_26:
}

- (void)setIdentity:(id)a3 forAppleID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 copy];
  id v8 = self;
  objc_sync_enter(v8);
  [(SDAppleIDDatabaseManager *)v8 _setIdentity:v7 forAppleID:v6];
  objc_sync_exit(v8);
}

- (void)_setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v11 = v6;
  if (!v6)
  {
LABEL_16:
    uint64_t v10 = 0;
    id v8 = 0;
    goto LABEL_6;
  }
  id v7 = [(SDAppleIDDatabaseManager *)self _accountForAppleID:v6];
  if (!v7)
  {
    if (dword_1009678D8 <= 90 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_16;
  }
  id v8 = v7;
  id v9 = [v7 identity];
  if (v9)
  {
    uint64_t v10 = v9;
    if ([v9 linkedToCurrentUser] != v4)
    {
      [v10 setLinkedToCurrentUser:v4];
      [(SDAppleIDDatabaseManager *)self _updateAccountInfoPrefs];
    }
  }
  else
  {
    if (dword_1009678D8 <= 90 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v10 = 0;
  }
LABEL_6:
}

- (void)setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  [(SDAppleIDDatabaseManager *)v6 _setIdentityLinkedToCurrentUser:v4 forAppleID:v7];
  objc_sync_exit(v6);
}

- (void)_setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [(SDAppleIDDatabaseManager *)self _accountForAppleID:v9];
    if (v10)
    {
      id v11 = v10;
      id v12 = [v10 certificateToken];
      unsigned int v13 = v26;
      BOOL v14 = v12 != v26;
      if (v12 != v26)
      {
        uint64_t v15 = [v11 certificateToken];
        unsigned __int8 v16 = [v26 isEqual:v15];

        if (v16)
        {
          BOOL v14 = 0;
          goto LABEL_19;
        }
        [v11 setCertificateToken:v26];
        if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
        {
          id v23 = v26;
          id v25 = v9;
          LogPrintF();
        }
        uint64_t v17 = [v11 certificateToken:v23, v25];
        if (v17)
        {
          unsigned __int8 v18 = +[NSDate date];
          [v11 setCertificateTokenCreationDate:v18];
        }
        else
        {
          [v11 setCertificateTokenCreationDate:0];
        }

        if (dword_1009678D8 > 30 || dword_1009678D8 == -1 && !_LogCategory_Initialize())
        {
          BOOL v14 = 1;
LABEL_19:
          uint64_t v19 = [v11 privateKeyPersistentReference:v23];
          if ((id)v19 == v8)
          {
          }
          else
          {
            id v20 = (void *)v19;
            id v21 = [v11 privateKeyPersistentReference];
            unsigned __int8 v22 = [v8 isEqual:v21];

            if ((v22 & 1) == 0)
            {
              [v11 setPrivateKeyPersistentReference:v8];
              if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
                [(SDAppleIDDatabaseManager *)self _updateAccountInfoPrefs];
                goto LABEL_27;
              }
LABEL_26:
              [(SDAppleIDDatabaseManager *)self _updateAccountInfoPrefs];
              goto LABEL_27;
            }
          }
          if (!v14) {
            goto LABEL_27;
          }
          goto LABEL_26;
        }
        unsigned int v13 = [v11 certificateTokenCreationDate];
        id v23 = v13;
        LogPrintF();
      }

      goto LABEL_19;
    }
    if (dword_1009678D8 <= 90 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  id v11 = 0;
LABEL_27:
}

- (void)setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  [(SDAppleIDDatabaseManager *)v10 _setCertificateToken:v11 privateKeyPersistentReference:v8 forAppleID:v9];
  objc_sync_exit(v10);
}

- (void)_setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
LABEL_30:
    id v11 = 0;
    goto LABEL_23;
  }
  uint64_t v10 = [(SDAppleIDDatabaseManager *)self _accountForAppleID:v9];
  if (!v10)
  {
    if (dword_1009678D8 <= 90 && (dword_1009678D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_30;
  }
  id v11 = v10;
  id v12 = [v10 contactInfo];
  if (v12 == v24)
  {
  }
  else
  {
    unsigned int v13 = [v11 contactInfo];
    unsigned __int8 v14 = [v24 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      [v11 setContactInfo:v24];
      if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
      {
        id v20 = v24;
        id v22 = v9;
        LogPrintF();
      }
      int v15 = 1;
      goto LABEL_12;
    }
  }
  int v15 = 0;
LABEL_12:
  uint64_t v16 = [v11 validationRecord:v20, v22];
  if ((id)v16 == v8)
  {
  }
  else
  {
    uint64_t v17 = (void *)v16;
    unsigned __int8 v18 = [v11 validationRecord];
    unsigned __int8 v19 = [v8 isEqual:v18];

    if ((v19 & 1) == 0)
    {
      [v11 setValidationRecord:v8];
      if (dword_1009678D8 <= 30 && (dword_1009678D8 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[SDAppleIDDatabaseManager _postNotificationWithName:](self, "_postNotificationWithName:", SFAppleIDValidationRecordDidChangeNotification, v8, v9);
      }
      else
      {
        -[SDAppleIDDatabaseManager _postNotificationWithName:](self, "_postNotificationWithName:", SFAppleIDValidationRecordDidChangeNotification, v21, v23);
      }
      goto LABEL_22;
    }
  }
  if (v15) {
LABEL_22:
  }
    [(SDAppleIDDatabaseManager *)self _updateAccountInfoPrefs];
LABEL_23:
}

- (void)setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v13 copy];
  id v11 = [v8 copy];
  id v12 = self;
  objc_sync_enter(v12);
  [(SDAppleIDDatabaseManager *)v12 _setContactInfo:v10 validationRecord:v11 forAppleID:v9];
  objc_sync_exit(v12);
}

- (void)_setMetaInfo:(id)a3
{
  BOOL v4 = (NSDictionary *)a3;
  metaInfo = self->_metaInfo;
  if (metaInfo != v4)
  {
    id v9 = v4;
    unsigned __int8 v6 = [(NSDictionary *)metaInfo isEqual:v4];
    BOOL v4 = v9;
    if ((v6 & 1) == 0)
    {
      id v7 = (NSDictionary *)[(NSDictionary *)v9 copy];
      id v8 = self->_metaInfo;
      self->_metaInfo = v7;

      [(SDAppleIDDatabaseManager *)self _updateMetaInfoPrefs];
      BOOL v4 = v9;
    }
  }
}

- (void)setMetaInfo:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(SDAppleIDDatabaseManager *)v4 _setMetaInfo:v5];
  objc_sync_exit(v4);
}

- (NSDictionary)metaInfo
{
  id v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = v2->_metaInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)_postNotificationWithName:(id)a3
{
  id v3 = a3;
  BOOL v4 = SFMainQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FA3F8;
  block[3] = &unk_1008CA4B8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (NSDate)lastConnectionDate
{
  return self->_lastConnectionDate;
}

- (NSDate)lastSuccessfulConnectionDate
{
  return self->_lastSuccessfulConnectionDate;
}

- (SFAppleIDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSMutableDictionary)personInfoCache
{
  return self->_personInfoCache;
}

- (void)setPersonInfoCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personInfoCache, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulConnectionDate, 0);
  objc_storeStrong((id *)&self->_lastConnectionDate, 0);
  objc_storeStrong((id *)&self->_accountInfoStore, 0);

  objc_storeStrong((id *)&self->_metaInfo, 0);
}

@end