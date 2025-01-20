@interface FMFAccountManager
+ (id)sharedInstance;
- (BOOL)hasCredentials;
- (BOOL)hasFirstUnlocked;
- (BOOL)isAccountAuthorized;
- (BOOL)isAccountSignedIn;
- (BOOL)isRenewingAccountCredentials;
- (BOOL)isUpdatingAccountCredentials;
- (BOOL)storedDSIDMatchesDSID:(id)a3;
- (FMFAccount)account;
- (NSDate)latest401TS;
- (NSString)appHostnameFromSettings;
- (double)graceInterval401InSec;
- (id)_clearOldMappingPacketsOverLimit:(id)a3;
- (id)apsEnvironmentConstantForiCloudBagKey:(id)a3;
- (id)authTokenFromKeychain;
- (id)fmfAccountToken;
- (id)storedDSID;
- (int64_t)retryAfterRenewCount;
- (void)clearSavedInvalidMappingPackets;
- (void)clearSavedMappingPackets;
- (void)forwardSavedMappingPacketsToServer;
- (void)iCloudAccountChanged:(id)a3;
- (void)iCloudAccountRemoved:(id)a3;
- (void)iCloudAccountWasAdded:(id)a3;
- (void)invalidateSavedInvalidPackets;
- (void)renewAccountCredentials:(BOOL)a3;
- (void)retryAfterCredentialUpdate;
- (void)setAccount:(id)a3;
- (void)setAccountStateAuthorizedDueTo401;
- (void)setAccountStateUnauthorizedDueTo401;
- (void)setAppHostnameFromSettings:(id)a3;
- (void)setIsRenewingAccountCredentials:(BOOL)a3;
- (void)setIsUpdatingAccountCredentials:(BOOL)a3;
- (void)setLatest401TS:(id)a3;
- (void)setRetryAfterRenewCount:(int64_t)a3;
- (void)setStoredDSID:(id)a3;
- (void)storeInvalidMappingPacketsForFutureRemoval:(id)a3;
- (void)storeMappingPacket:(id)a3;
- (void)updateAccountCredentials:(BOOL)a3;
- (void)updateAccountInfo;
- (void)updateAccountWithFMFTokens;
- (void)updateStoredDSID:(id)a3;
@end

@implementation FMFAccountManager

- (BOOL)hasCredentials
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_account;
  v4 = [(FMFAccount *)v3 dsid];
  v5 = [(FMFAccount *)v3 fmfAppToken];
  v6 = sub_100005560();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138413314;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2048;
    v12 = v2;
    __int16 v13 = 2112;
    v14 = v3;
    __int16 v15 = 1024;
    BOOL v16 = v4 != 0;
    __int16 v17 = 1024;
    BOOL v18 = v5 != 0;
    id v7 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> hasCredentials acc:%@, hasDSID: %i, hasFMFAppToken: %i", (uint8_t *)&v9, 0x2Cu);
  }
  objc_sync_exit(v2);

  return v4 != 0 && v5 != 0;
}

+ (id)sharedInstance
{
  if (qword_1000BB7D0 != -1) {
    dispatch_once(&qword_1000BB7D0, &stru_1000A2518);
  }
  v2 = (void *)qword_1000BB7C8;

  return v2;
}

- (FMFAccount)account
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FMFAccount *)v2->_account copy];
  objc_sync_exit(v2);

  return (FMFAccount *)v3;
}

- (void)iCloudAccountChanged:(id)a3
{
  id v4 = a3;
  v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received iCloud account changed notification: %@", buf, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  if ((byte_1000BB7D8 & 1) == 0)
  {
    byte_1000BB7D8 = 1;
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100029638;
    block[3] = &unk_1000A14E8;
    block[4] = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_sync_exit(v6);
}

- (void)iCloudAccountWasAdded:(id)a3
{
}

- (void)iCloudAccountRemoved:(id)a3
{
}

- (void)updateAccountInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_opt_new();
  [v3 aa_primaryAppleAccount];
  id v4 = (FMFAccountManager *)objc_claimAutoreleasedReturnValue();

  v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v52 = (id)objc_opt_class();
    __int16 v53 = 2048;
    v54 = v2;
    __int16 v55 = 2112;
    v56 = v4;
    id v6 = v52;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Updating iCloud Account Info for account: %@", buf, 0x20u);
  }
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_24;
  }
  uint64_t v7 = kAccountDataclassShareLocation;
  if (([(FMFAccountManager *)v4 isProvisionedForDataclass:kAccountDataclassShareLocation] & 1) == 0)
  {
    v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006BE94(v8);
    }
    id v10 = 0;
    goto LABEL_23;
  }
  v8 = [(FMFAccountManager *)v4 dataclassProperties];
  int v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = objc_alloc_init(FMFAccount);
  __int16 v11 = [(FMFAccountManager *)v4 username];
  [(FMFAccount *)v10 setICloudId:v11];

  v12 = [(FMFAccountManager *)v4 aa_personID];
  [(FMFAccount *)v10 setDsid:v12];

  __int16 v13 = [(FMFAccountManager *)v4 aa_authToken];
  [(FMFAccount *)v10 setAuthToken:v13];

  v14 = [(FMFAccountManager *)v4 aa_authToken];
  BOOL v15 = v14 == 0;

  [(FMFAccount *)v10 setAuthTokenStatus:v15];
  v49 = [v9 objectForKeyedSubscript:@"apsEnv"];
  BOOL v16 = [v9 objectForKeyedSubscript:@"appHostname"];
  [(FMFAccountManager *)v2 setAppHostnameFromSettings:v16];

  __int16 v17 = [(FMFAccountManager *)v2 appHostnameFromSettings];
  BOOL v18 = +[FMFCommandManager sharedInstance];
  v19 = [v18 cachedRedirects];

  v20 = [v19 allKeys];
  if (([v20 containsObject:v17] & 1) == 0)
  {

    goto LABEL_14;
  }
  v21 = [v19 objectForKeyedSubscript:v17];
  BOOL v22 = v21 == 0;

  if (v22)
  {
LABEL_14:
    v25 = sub_100005560();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v52 = v19;
      __int16 v53 = 2112;
      v54 = 0;
      __int16 v55 = 2112;
      v56 = v17;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No cached redirect value found, clearing caches. cachedRedirects: %@, cachedRedirectHost: %@, appHostName: %@", buf, 0x20u);
    }

    v24 = +[FMFCommandManager sharedInstance];
    [v24 clearRedirectsCache];
    v23 = 0;
    goto LABEL_17;
  }
  v23 = [v19 objectForKeyedSubscript:v17];
  v24 = sub_100005560();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v52 = v19;
    __int16 v53 = 2112;
    v54 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Found cached redirect value, cachedRedirects: %@, cachedRedirectHost: %@", buf, 0x16u);
  }
LABEL_17:

  if (v23) {
    v26 = v23;
  }
  else {
    v26 = v17;
  }
  [(FMFAccount *)v10 setFmfAppHostName:v26];
  v27 = sub_100005560();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [(FMFAccount *)v10 fmfAppHostName];
    v29 = [v9 objectForKeyedSubscript:@"appHostname"];
    *(_DWORD *)buf = 138412802;
    id v52 = v28;
    __int16 v53 = 2112;
    v54 = v23;
    __int16 v55 = 2112;
    v56 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Using host name: %@, cachedRedirectHost(%@), myDataclassProps[appHostname](%@)", buf, 0x20u);
  }
  [(FMFAccount *)v10 setServerProtocolScheme:@"https"];
  v30 = [(FMFAccountManager *)v2 apsEnvironmentConstantForiCloudBagKey:v49];
  [(FMFAccount *)v10 setApsEnvironment:v30];

  id v4 = 0;
LABEL_23:

LABEL_24:
  v31 = [(FMFAccount *)v10 dsid];
  if (v31)
  {
    v32 = [(FMFAccount *)v10 dsid];
    unsigned int v33 = [(FMFAccountManager *)v2 storedDSIDMatchesDSID:v32];

    int v34 = v33 ^ 1;
  }
  else
  {
    int v34 = 1;
  }

  p_account = (id *)&v2->_account;
  if (v10) {
    BOOL v36 = v2->_account == 0;
  }
  else {
    BOOL v36 = 0;
  }
  int v37 = v36;
  [(FMFAccountManager *)v2 setAccountStateAuthorizedDueTo401];
  objc_storeStrong((id *)&v2->_account, v10);
  v38 = [*p_account dsid];
  BOOL v39 = v38 == 0;

  if (!v39) {
    [(FMFAccountManager *)v2 updateAccountWithFMFTokens];
  }
  v40 = [*p_account authToken];
  if (v40) {
    goto LABEL_36;
  }
  v46 = [*p_account dsid];
  if (v46)
  {
    v47 = [*p_account fmfAppToken];
    BOOL v48 = v47 == 0;

    if (!v48)
    {
      v40 = sub_100005560();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "iCloud token missing but fmf token eists. Radar with Apple Account logs. (File to PEP AppleAccount.)", buf, 2u);
      }
LABEL_36:
    }
  }
  if (v34)
  {
    v41 = sub_100005560();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Sending account was removed notification", buf, 2u);
    }

    v42 = +[NSNotificationCenter defaultCenter];
    [v42 postNotificationName:off_1000BAFC0 object:0];
  }
  if (v37)
  {
    v43 = sub_100005560();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Sending account was added notification", buf, 2u);
    }

    v44 = +[NSNotificationCenter defaultCenter];
    [v44 postNotificationName:off_1000BAFC8 object:0];
  }
  v45 = [(FMFAccount *)v10 dsid];
  [(FMFAccountManager *)v2 updateStoredDSID:v45];

  objc_sync_exit(v2);
}

- (void)updateAccountCredentials:(BOOL)a3
{
  v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updateAccountCredentials...", buf, 2u);
  }

  if (![(FMFAccountManager *)self isUpdatingAccountCredentials])
  {
    id v6 = sub_100005560();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updateAccountCredentials because we are not in the process of updating", buf, 2u);
    }

    [(FMFAccountManager *)self setIsUpdatingAccountCredentials:1];
    uint64_t v7 = objc_opt_new();
    [v7 aa_primaryAppleAccount];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100029F3C;
    v10[3] = &unk_1000A2568;
    BOOL v13 = a3;
    v10[4] = self;
    id v11 = v7;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v12;
    id v9 = v7;
    [v9 aa_updatePropertiesForAppleAccount:v8 completion:v10];
  }
}

- (void)renewAccountCredentials:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_opt_new();
  id v6 = [v5 aa_primaryAppleAccount];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 aa_fmfAccount];
    id v18 = 0;
    id v9 = [v5 credentialForAccount:v8 error:&v18];
    id v10 = v18;
    id v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "credential: %@, error :%@", buf, 0x16u);
    }

    if (![(FMFAccountManager *)self isRenewingAccountCredentials])
    {
      [(FMFAccountManager *)self setIsRenewingAccountCredentials:1];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10002A4B4;
      v15[3] = &unk_1000A2590;
      id v12 = v7;
      id v16 = v12;
      __int16 v17 = self;
      BOOL v13 = objc_retainBlock(v15);
      v14 = sub_100005560();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v20) = v3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Requesting renewal of account credentials with force: %d", buf, 8u);
      }

      [v5 renewCredentialsForAccount:v12 force:v3 reason:0 completion:v13];
    }
  }
  else
  {
    id v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "credential: no icloudAccount or failed to get one. unable to renew credentials", buf, 2u);
    }
    id v10 = 0;
  }
}

- (void)retryAfterCredentialUpdate
{
  BOOL v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    int64_t v6 = [(FMFAccountManager *)self retryAfterRenewCount];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "retryAfterCredentialUpdate %lu", (uint8_t *)&v5, 0xCu);
  }

  if ([(FMFAccountManager *)self retryAfterRenewCount] > 1)
  {
    id v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not refreshing data because we exceeeded maximum retry count", (uint8_t *)&v5, 2u);
    }
  }
  else
  {
    [(FMFAccountManager *)self setRetryAfterRenewCount:(char *)[(FMFAccountManager *)self retryAfterRenewCount] + 1];
    [(FMFAccountManager *)self updateAccountInfo];
    id v4 = +[FMFCommandManager sharedInstance];
    [v4 refreshForSession:0 withReason:12 withCompletion:&stru_1000A25B0];
  }
}

- (void)updateAccountWithFMFTokens
{
  BOOL v3 = [(FMFAccountManager *)self fmfAccountToken];
  [(FMFAccount *)self->_account setFmfAppToken:v3];
  id v4 = [(FMFAccount *)self->_account fmfAppHostName];

  if (!v4)
  {
    int v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006BFA8(self, v5);
    }

    int64_t v6 = [(FMFAccountManager *)self appHostnameFromSettings];
    [(FMFAccount *)self->_account setFmfAppHostName:v6];
  }
  uint64_t v7 = sub_100005560();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3 == 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating FMF account tokens, is nil: %d", (uint8_t *)v8, 8u);
  }
}

- (id)fmfAccountToken
{
  v2 = objc_opt_new();
  BOOL v3 = [v2 aa_primaryAppleAccount];
  id v4 = [v3 aa_fmfAccount];

  id v10 = 0;
  int v5 = [v2 credentialForAccount:v4 error:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006C03C();
    }
  }
  id v8 = [v5 credentialItemForKey:ACFindMyFriendsAppTokenKey];

  return v8;
}

- (BOOL)hasFirstUnlocked
{
  return (int)MKBDeviceUnlockedSinceBoot() > 0;
}

- (id)authTokenFromKeychain
{
  return 0;
}

- (id)apsEnvironmentConstantForiCloudBagKey:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 compare:@"production" options:1])
  {
    if (![v4 compare:@"development" options:1])
    {
      id v6 = (id *)&APSEnvironmentDevelopment;
      goto LABEL_9;
    }
    if (![v4 compare:@"demo" options:1])
    {
      id v6 = (id *)&APSEnvironmentDemo;
      goto LABEL_9;
    }
    int v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006C0A4();
    }
  }
  id v6 = (id *)&APSEnvironmentProduction;
LABEL_9:
  id v7 = *v6;

  return v7;
}

- (void)storeMappingPacket:(id)a3
{
  id v12 = 0;
  id v4 = a3;
  unsigned int v5 = +[KeychainUtil keychainItemForService:@"fmfd-daemon" withUsername:@"fmfd" returningItem:&v12];
  id v6 = v12;
  id v7 = sub_100005560();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received stored packets in keychain: %@ with status: %d", buf, 0x12u);
  }

  if (v6)
  {
    id v8 = [v6 mutableCopy];
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }
  id v9 = +[NSDate date];
  [v8 setObject:v4 forKey:v9];

  id v10 = [(FMFAccountManager *)self _clearOldMappingPacketsOverLimit:v8];

  id v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Storing packets in keychain: %@", buf, 0xCu);
  }

  +[KeychainUtil setKeychainItemForService:@"fmfd-daemon" withUsername:@"fmfd" value:v10 accessibility:3];
}

- (id)_clearOldMappingPacketsOverLimit:(id)a3
{
  id v3 = a3;
  id v4 = [v3 allKeys];
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 6)
  {
    id v6 = [v3 allKeys];
    id v7 = [v6 sortedArrayUsingSelector:"compare:"];

    id v8 = [v7 subarrayWithRange:0, (char *)[v7 count] - 5];
    [v3 removeObjectsForKeys:v8];
  }

  return v3;
}

- (void)forwardSavedMappingPacketsToServer
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Forwarding saved mapping packets to server", buf, 2u);
  }

  id v19 = 0;
  unsigned int v4 = +[KeychainUtil keychainItemForService:@"fmfd-daemon" withUsername:@"fmfd" returningItem:&v19];
  id v5 = v19;
  id v6 = sub_100005560();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received stored packets in keychain: %@ with status: %d", buf, 0x12u);
  }

  id v7 = [v5 count];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v21 = 0;
  if (!v5
    || (id v8 = v7,
        [v5 allKeys],
        id v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = v9 == 0,
        v9,
        v10))
  {
    id v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No saved packets to import.", v18, 2u);
    }
  }
  else
  {
    id v11 = +[FMFCommandManager sharedInstance];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002B048;
    v13[3] = &unk_1000A2628;
    unsigned int v16 = buf;
    id v17 = v8;
    id v14 = v5;
    __int16 v15 = self;
    [v11 refreshForSession:0 withReason:8 withCompletion:v13];

    id v12 = v14;
  }

  _Block_object_dispose(buf, 8);
}

- (void)clearSavedMappingPackets
{
  v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Clearing stored packets in keychain", v3, 2u);
  }

  +[KeychainUtil removeKeychainItemForService:@"fmfd-daemon" withUsername:@"fmfd"];
}

- (void)storeInvalidMappingPacketsForFutureRemoval:(id)a3
{
  id v10 = 0;
  id v3 = a3;
  unsigned int v4 = +[KeychainUtil keychainItemForService:@"fmfd-daemon-invalid-packet-service-name" withUsername:@"fmfd-daemon-invalid-packets-username" returningItem:&v10];
  id v5 = v10;
  id v6 = sub_100005560();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v5;
    __int16 v13 = 1024;
    unsigned int v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received stored invalid packets in keychain: %@ with status: %d", buf, 0x12u);
  }

  if (v5)
  {
    id v7 = [v5 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
  }
  id v8 = +[NSDate date];
  [v7 setObject:v3 forKey:v8];

  id v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Storing packets in keychain: %@", buf, 0xCu);
  }

  +[KeychainUtil setKeychainItemForService:@"fmfd-daemon-invalid-packet-service-name" withUsername:@"fmfd-daemon-invalid-packets-username" value:v7 accessibility:3];
}

- (void)invalidateSavedInvalidPackets
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating saved mapping packets", buf, 2u);
  }

  id v24 = 0;
  unsigned int v4 = +[KeychainUtil keychainItemForService:@"fmfd-daemon-invalid-packet-service-name" withUsername:@"fmfd-daemon-invalid-packets-username" returningItem:&v24];
  id v5 = v24;
  id v6 = sub_100005560();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v5;
    __int16 v28 = 1024;
    unsigned int v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received stored invalid packets in keychain: %@ with status: %d", buf, 0x12u);
  }

  if (v5 && ([v5 allKeys], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = [v5 allValues];
    id v9 = +[NSMutableSet set];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        unsigned int v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          [v9 unionSet:*(void *)(*((void *)&v20 + 1) + 8 * (void)v14)];
          unsigned int v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      __int16 v15 = +[FMFCommandManager sharedInstance];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10002B870;
      v16[3] = &unk_1000A2650;
      id v17 = v10;
      id v18 = self;
      id v19 = v9;
      [v15 invalidateMappingPackets:v19 completion:v16];
    }
  }
  else
  {
    id v10 = sub_100005560();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No saved packets to invalidate.", buf, 2u);
    }
  }
}

- (void)clearSavedInvalidMappingPackets
{
  v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Clearing stored invalid packets from keychain", v3, 2u);
  }

  +[KeychainUtil removeKeychainItemForService:@"fmfd-daemon-invalid-packet-service-name" withUsername:@"fmfd-daemon-invalid-packets-username"];
}

- (BOOL)storedDSIDMatchesDSID:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(FMFAccountManager *)self storedDSID];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [(FMFAccountManager *)self storedDSID];
    BOOL v7 = (v4 | v8) == 0;
  }
  return v7;
}

- (void)updateStoredDSID:(id)a3
{
}

- (id)storedDSID
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"storedDSID"];

  return v3;
}

- (void)setStoredDSID:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:v3 forKey:@"storedDSID"];

  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 synchronize];
}

- (void)setAccountStateAuthorizedDueTo401
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "setAccountStateAuthorizedDueTo401: setting account status to authorized", v4, 2u);
  }

  [(FMFAccountManager *)self setLatest401TS:0];
}

- (void)setAccountStateUnauthorizedDueTo401
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "setAccountStateUnauthorizedDueTo401: setting account status to unauthorized", v5, 2u);
  }

  unint64_t v4 = +[NSDate date];
  [(FMFAccountManager *)self setLatest401TS:v4];
}

- (BOOL)isAccountAuthorized
{
  id v3 = [(FMFAccountManager *)self latest401TS];

  if (!v3)
  {
    id v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "isAccountAuthorized: account is authorized due to latest401TS == nil", (uint8_t *)&v16, 2u);
    }
    goto LABEL_11;
  }
  unint64_t v4 = [(FMFAccountManager *)self latest401TS];

  if (v4)
  {
    id v5 = +[NSDate date];
    unsigned __int8 v6 = [(FMFAccountManager *)self latest401TS];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    [(FMFAccountManager *)self graceInterval401InSec];
    double v10 = v9;
    id v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      double v17 = v8;
      __int16 v18 = 2048;
      double v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "isAccountAuthorized: intervalSinceLast401 is %f, graceInterval401InSec is %f", (uint8_t *)&v16, 0x16u);
    }

    id v12 = sub_100005560();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v8 < v10)
    {
      if (v13)
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "isAccountAuthorized: account is unauthorized", (uint8_t *)&v16, 2u);
      }
      BOOL v14 = 0;
      goto LABEL_16;
    }
    if (v13)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "isAccountAuthorized: account is authorized", (uint8_t *)&v16, 2u);
    }

    [(FMFAccountManager *)self setLatest401TS:0];
    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 postNotificationName:off_1000BAFB8 object:0];
LABEL_11:
    BOOL v14 = 1;
LABEL_16:

    return v14;
  }
  return 1;
}

- (double)graceInterval401InSec
{
  v2 = +[FMFDataManager sharedInstance];
  [v2 graceInterval401InSec];
  double v4 = v3;

  if (v4 <= 0.0) {
    double v4 = 900.0;
  }
  id v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    double v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "graceInterval401InSec: %f", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (BOOL)isAccountSignedIn
{
  v2 = objc_opt_new();
  double v3 = [v2 aa_primaryAppleAccount];

  return v3 != 0;
}

- (void)setAccount:(id)a3
{
}

- (NSString)appHostnameFromSettings
{
  return self->_appHostnameFromSettings;
}

- (void)setAppHostnameFromSettings:(id)a3
{
}

- (int64_t)retryAfterRenewCount
{
  return self->_retryAfterRenewCount;
}

- (void)setRetryAfterRenewCount:(int64_t)a3
{
  self->_retryAfterRenewCount = a3;
}

- (NSDate)latest401TS
{
  return self->_latest401TS;
}

- (void)setLatest401TS:(id)a3
{
}

- (BOOL)isRenewingAccountCredentials
{
  return self->_isRenewingAccountCredentials;
}

- (void)setIsRenewingAccountCredentials:(BOOL)a3
{
  self->_isRenewingAccountCredentials = a3;
}

- (BOOL)isUpdatingAccountCredentials
{
  return self->_isUpdatingAccountCredentials;
}

- (void)setIsUpdatingAccountCredentials:(BOOL)a3
{
  self->_isUpdatingAccountCredentials = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latest401TS, 0);
  objc_storeStrong((id *)&self->_appHostnameFromSettings, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end