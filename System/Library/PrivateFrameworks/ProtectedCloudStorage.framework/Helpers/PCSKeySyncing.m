@interface PCSKeySyncing
+ (id)defaultSyncingManager;
- (BOOL)companionCircleMember;
- (BOOL)iCDPStatus;
- (BOOL)saveClient:(id)a3;
- (BOOL)setCompanionCircleMember:(BOOL)a3;
- (BOOL)setiCDPStatus:(BOOL)a3;
- (BOOL)storePCSKeyData:(id)a3 current:(BOOL)a4;
- (BOOL)updateSyncDevice:(id)a3 version:(id)a4;
- (BOOL)updateSyncedKeysToDevice:(id)a3 type:(int)a4 keys:(id)a5;
- (NSMutableArray)notifyHooks;
- (NSUserDefaults)settings;
- (PCSAccountsModel)accounts;
- (PCSKeySyncing)init;
- (UserRegistryDB)database;
- (_PCSIdentitySetData)copyIdentitySet;
- (id)allClients;
- (id)copyAllPCSKeys:(id *)a3;
- (id)copySHA256Hash:(id)a3;
- (id)dsid;
- (id)getClientWithIdentifier:(id)a3;
- (id)outStandingPCSKeys:(id)a3;
- (id)pcsKeyData:(id)a3;
- (id)syncDevices;
- (id)userRegistry;
- (void)addUpdateNotify:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setNotifyHooks:(id)a3;
- (void)setSettings:(id)a3;
- (void)signalComplete:(id)a3;
- (void)syncKeysWithDatabase;
- (void)updateClient:(id)a3;
- (void)updateProtocolVersionIfNeeded:(id)a3;
@end

@implementation PCSKeySyncing

+ (id)defaultSyncingManager
{
  if (qword_100040E90 != -1) {
    dispatch_once(&qword_100040E90, &stru_100039550);
  }
  v2 = (void *)qword_100040E88;
  return v2;
}

- (PCSKeySyncing)init
{
  v6.receiver = self;
  v6.super_class = (Class)PCSKeySyncing;
  v2 = [(PCSKeySyncing *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSUserDefaults);
    [(PCSKeySyncing *)v2 setSettings:v3];

    v4 = +[PCSAccountsModel defaultAccountsModel];
    [(PCSKeySyncing *)v2 setAccounts:v4];
  }
  return v2;
}

- (id)userRegistry
{
  v2 = [(PCSKeySyncing *)self dsid];
  if (v2) {
    id v3 = [objc_alloc((Class)UserRegistryDB) initWithDSID:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)dsid
{
  v2 = [(PCSKeySyncing *)self accounts];
  id v3 = [v2 dsid];

  return v3;
}

- (void)addUpdateNotify:(id)a3
{
  id v4 = a3;
  notifyHooks = self->_notifyHooks;
  id v9 = v4;
  if (!notifyHooks)
  {
    objc_super v6 = +[NSMutableArray array];
    v7 = self->_notifyHooks;
    self->_notifyHooks = v6;

    id v4 = v9;
    notifyHooks = self->_notifyHooks;
  }
  id v8 = objc_retainBlock(v4);
  [(NSMutableArray *)notifyHooks addObject:v8];
}

- (void)signalComplete:(id)a3
{
  id v4 = a3;
  notifyHooks = self->_notifyHooks;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001B1E4;
  v7[3] = &unk_100039578;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)notifyHooks enumerateObjectsUsingBlock:v7];
}

- (_PCSIdentitySetData)copyIdentitySet
{
  id v3 = [(PCSKeySyncing *)self accounts];
  id v4 = [v3 dsid];

  if (v4)
  {
    uint64_t v10 = kPCSSetupDSID;
    v11 = v4;
    v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v6 = (_PCSIdentitySetData *)PCSIdentitySetCreate();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(PCSKeySyncing *)self accounts];
      id v8 = [v7 lastError];
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to fetch dsid from accounts: %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)pcsKeyData:(id)a3
{
  id v4 = a3;
  v5 = [(PCSKeySyncing *)self copyIdentitySet];
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "Failed to get identity set for pcsKey extraction";
      uint32_t v10 = 2;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
    }
LABEL_12:
    id v8 = 0;
    goto LABEL_13;
  }
  id v6 = v5;
  v7 = (void *)PCSIdentitySetCopyIdentity();
  CFRelease(v6);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      id v9 = "Failed to get identity for public key %@";
      uint32_t v10 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v8 = (void *)PCSIdentityCopyExportedPrivateKey();
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get exported data for identity %@: %@", buf, 0x16u);
  }
  CFRelease(v7);
LABEL_13:

  return v8;
}

- (BOOL)storePCSKeyData:(id)a3 current:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PCSKeySyncing *)self copyIdentitySet];
  if (!v7)
  {
    BOOL v13 = 0;
    goto LABEL_19;
  }
  id v8 = v7;
  uint64_t v9 = PCSIdentityCreateWithExportedPrivateKey();
  if (!v9)
  {
    CFRelease(v8);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to parse key data: %@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  uint32_t v10 = (const void *)v9;
  PCSIdentityGetPublicKey();
  uint64_t v11 = PCSIdentitySetCopyIdentity();
  if (v11)
  {
    v12 = (const void *)v11;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Already have a local copy of: %@", buf, 0xCu);
    }
    CFRelease(v12);
    goto LABEL_11;
  }
  if ((PCSIdentitySetAddIdentityWithError() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to store identity %@: %@", buf, 0x16u);
    }
    CFRelease(v10);
    CFRelease(v8);
LABEL_17:
    BOOL v13 = 0;
    goto LABEL_19;
  }
LABEL_11:
  if (v4) {
    PCSIdentitySetSetCurrentIdentity();
  }
  CFRelease(v10);
  CFRelease(v8);
  BOOL v13 = 1;
LABEL_19:

  return v13;
}

- (BOOL)iCDPStatus
{
  v2 = [(PCSKeySyncing *)self copyIdentitySet];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  char IsICDP = PCSIdentitySetIsICDP();
  CFRelease(v3);
  return IsICDP;
}

- (BOOL)setiCDPStatus:(BOOL)a3
{
  id v3 = [(PCSKeySyncing *)self copyIdentitySet];
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  char v5 = PCSIdentitySetEnableICDP();
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set iCDP: %@", buf, 0xCu);
    }
    CFRelease(v4);
    return 0;
  }
  CFRelease(v4);
  return v5;
}

- (BOOL)companionCircleMember
{
  return SOSCCThisDeviceIsInCircle() == 0;
}

- (BOOL)setCompanionCircleMember:(BOOL)a3
{
  return 0;
}

- (id)copyAllPCSKeys:(id *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100025880();
  }
  BOOL v4 = [(PCSKeySyncing *)self copyIdentitySet];
  if (!v4) {
    return 0;
  }
  char v5 = v4;
  ExternalForm = (void *)PCSIdentitySetCreateExternalForm();
  CFRelease(v5);
  return ExternalForm;
}

- (void)syncKeysWithDatabase
{
  id v3 = [(PCSKeySyncing *)self copyIdentitySet];
  if (v3)
  {
    BOOL v4 = v3;
    char v5 = [(PCSKeySyncing *)self userRegistry];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
      PCSServiceItemsGetEachName();
      CFRelease(v4);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get database", buf, 2u);
      }
      CFRelease(v4);
    }
  }
}

- (BOOL)updateSyncDevice:(id)a3 version:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PCSKeySyncing *)self userRegistry];
  unsigned int v9 = [v8 beginExclusiveTransaction];
  if (v9)
  {
    uint32_t v10 = +[NSDate date];
    uint64_t v11 = [v10 description];
    [v8 updateSyncDevice:v6 seen:v11 version:v7];

    [v8 endTransaction:1];
  }

  return v9;
}

- (BOOL)updateSyncedKeysToDevice:(id)a3 type:(int)a4 keys:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint32_t v10 = [(PCSKeySyncing *)self userRegistry];
  unsigned int v11 = [v10 beginExclusiveTransaction];
  if (v11)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(v10, "syncedKeyToDevice:type:device:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v16), v6, v8, (void)v18);
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }

    [v10 endTransaction:1];
  }

  return v11;
}

- (id)syncDevices
{
  v2 = [(PCSKeySyncing *)self userRegistry];
  id v3 = [v2 syncDevices];

  return v3;
}

- (id)outStandingPCSKeys:(id)a3
{
  id v4 = a3;
  char v5 = [(PCSKeySyncing *)self userRegistry];
  uint64_t v6 = [v5 missingKeysFromDevice:v4 type:1];

  return v6;
}

- (id)copySHA256Hash:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableData dataWithLength:32];
  ccsha256_di();
  [v3 length];
  id v5 = v3;
  [v5 bytes];

  id v6 = v4;
  [v6 mutableBytes];
  ccdigest();
  return v6;
}

- (id)getClientWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PCSKeySyncing *)self settings];
  id v6 = [v5 dictionaryForKey:@"clients"];

  id v7 = [PCSKeyClient alloc];
  id v8 = [v6 objectForKeyedSubscript:v4];
  id v9 = [(PCSKeySyncing *)self accounts];
  uint32_t v10 = [v9 dsid];
  unsigned int v11 = [(PCSKeyClient *)v7 initWithName:v4 values:v8 dsid:v10];

  return v11;
}

- (void)updateClient:(id)a3
{
  id v12 = a3;
  id v4 = [(PCSKeySyncing *)self settings];
  id v5 = [v4 dictionaryForKey:@"clients"];

  id v6 = [v12 uuid];
  id v7 = [v5 objectForKeyedSubscript:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(PCSKeySyncing *)self accounts];
    id v9 = [v8 dsid];
    [v12 updateWithValues:v7 dsid:v9];

    uint32_t v10 = [v12 uuid];
    unsigned int v11 = [v12 buildVersion];
    [(PCSKeySyncing *)self updateSyncDevice:v10 version:v11];
  }
}

- (BOOL)saveClient:(id)a3
{
  id v4 = a3;
  [v4 setIsNewWatch:0];
  id v5 = [v4 uuid];

  if (v5)
  {
    id v6 = [(PCSKeySyncing *)self accounts];
    id v7 = [v6 dsid];
    id v8 = [v4 getValues:v7];

    id v9 = [(PCSKeySyncing *)self settings];
    uint32_t v10 = [v9 dictionaryForKey:@"clients"];

    unsigned int v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];
    id v12 = [v4 uuid];
    [v11 setObject:v8 forKey:v12];

    id v13 = [(PCSKeySyncing *)self settings];
    [v13 setObject:v11 forKey:@"clients"];
  }
  return v5 != 0;
}

- (void)updateProtocolVersionIfNeeded:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 protocolVersion] <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "updating protocol for client %@", (uint8_t *)&v5, 0xCu);
    }
    [v4 setProtocolVersion:1];
    [(PCSKeySyncing *)self saveClient:v4];
  }
}

- (id)allClients
{
  id v3 = [(PCSKeySyncing *)self settings];
  id v4 = [v3 dictionaryForKey:@"clients"];

  +[NSMutableArray array];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001C75C;
  v9[3] = &unk_1000395A0;
  v9[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (NSUserDefaults)settings
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSettings:(id)a3
{
}

- (PCSAccountsModel)accounts
{
  return (PCSAccountsModel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccounts:(id)a3
{
}

- (UserRegistryDB)database
{
  return (UserRegistryDB *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDatabase:(id)a3
{
}

- (NSMutableArray)notifyHooks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNotifyHooks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyHooks, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end