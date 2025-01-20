@interface MSDAccountManager
+ (id)sharedInstance;
- (BOOL)_setupiCloudAccountWithSettings:(id)a3 outError:(id *)a4;
- (BOOL)_setupiTunesAccountWithSettings:(id)a3 outError:(id *)a4;
- (BOOL)_signIniCloudAccount:(id)a3 password:(id)a4 features:(id)a5 recoveryKey:(id)a6 resetCDP:(BOOL)a7 outError:(id *)a8;
- (BOOL)_signIniTunesAccount:(id)a3 password:(id)a4 outError:(id *)a5;
- (BOOL)_signOutiCloudAccountWithPassword:(id)a3 outError:(id *)a4;
- (BOOL)_signOutiTunesAccount:(id *)a3;
- (BOOL)_trySetupAccounts:(id *)a3;
- (BOOL)removeAccounts:(id *)a3;
- (BOOL)setupAccounts:(id *)a3;
- (MSDAccountManager)init;
- (MSDAccountManagerHelper)accountManagerHelper;
- (id)existingAccounts;
- (int)peerChangeToken;
- (void)_forceiCloudKeychainToSyncWithServer;
- (void)disallowAccountModification;
- (void)setAccountManagerHelper:(id)a3;
- (void)setPeerChangeToken:(int)a3;
- (void)setupTrustedPeerChangeNotificationObserver;
- (void)syncAppsWithiCloud;
@end

@implementation MSDAccountManager

+ (id)sharedInstance
{
  if (qword_100189B28 != -1) {
    dispatch_once(&qword_100189B28, &stru_100153270);
  }
  v2 = (void *)qword_100189B20;

  return v2;
}

- (MSDAccountManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDAccountManager;
  v2 = [(MSDAccountManager *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(MSDAccountManagerHelper);
    [(MSDAccountManager *)v2 setAccountManagerHelper:v3];

    [(MSDAccountManager *)v2 setPeerChangeToken:0xFFFFFFFFLL];
  }
  return v2;
}

- (void)disallowAccountModification
{
  v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Disabling AppleID options in Settings!", v4, 2u);
  }

  v3 = +[MCProfileConnection sharedConnection];
  [v3 setBoolValue:0 forSetting:MCFeatureAccountModificationAllowed];
}

- (void)setupTrustedPeerChangeNotificationObserver
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting to observe trusted peer change!", v7, 2u);
  }

  uint32_t v4 = notify_register_dispatch("com.apple.security.octagon.peer-changed", &self->_peerChangeToken, (dispatch_queue_t)&_dispatch_main_q, &stru_1001532B0);
  if (v4)
  {
    int v5 = v4;
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000D2560(v5, v6);
    }
  }
}

- (id)existingAccounts
{
  v3 = +[MSDTargetDevice sharedInstance];
  uint32_t v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  int v5 = [(MSDAccountManager *)self accountManagerHelper];
  v6 = [v5 fetchiTunesiCloudAccountsInfo];

  if (v6) {
    [v4 addEntriesFromDictionary:v6];
  }
  v7 = [v3 iCloudAccountRecoveryKey];
  if (v7) {
    [v4 setObject:v7 forKey:@"iCloudRecoveryKey"];
  }
  if ([v3 iCloudAccountSyncNeeded]) {
    [v4 setObject:&__kCFBooleanTrue forKey:@"iCloudSyncNeeded"];
  }
  id v8 = [v4 copy];

  return v8;
}

- (BOOL)setupAccounts:(id *)a3
{
  BOOL v5 = +[MSDGreyMatterHelper isOptedIn];
  v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "GreyMatter opt-in status before iCloud account setup: %{BOOL}d", buf, 8u);
  }

  id v7 = 0;
  unint64_t v8 = 2;
  *(void *)&long long v9 = 134218498;
  long long v22 = v9;
  do
  {
    v10 = v7;
    id v23 = v7;
    BOOL v11 = -[MSDAccountManager _trySetupAccounts:](self, "_trySetupAccounts:", &v23, v22);
    id v7 = v23;

    if (v11) {
      break;
    }
    if ([v7 code] == (id)3727741185)
    {
      v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "Account setup cancelled. Not going to retry.";
        goto LABEL_18;
      }
LABEL_19:

      break;
    }
    id v12 = [v7 code];
    v13 = sub_100068600();
    v14 = v13;
    if (v12 == (id)3727741043)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "Account authentication failure. Not going to retry.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      }
      goto LABEL_19;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = [v7 localizedFailureReason];
      id v17 = [v7 code];
      *(_DWORD *)buf = v22;
      unint64_t v25 = v8 - 1;
      __int16 v26 = 2114;
      v27 = v16;
      __int16 v28 = 2048;
      id v29 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to setup accounts (retryCount = %td): %{public}@(0x%tx)", buf, 0x20u);
    }
    sleep(5u);
    char v15 = v8-- < 2 || v11;
  }
  while ((v15 & 1) == 0);
  unsigned int v19 = +[MSDGreyMatterHelper isOptedIn];
  v20 = sub_100068600();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "GreyMatter opt-in status after iCloud account setup: %{BOOL}d", buf, 8u);
  }

  if (v5 != v19) {
    +[MSDGreyMatterHelper setIsOptedIn:v5];
  }
  if (a3) {
    *a3 = v7;
  }
  [(MSDAccountManager *)self syncAppsWithiCloud];

  return v11;
}

- (BOOL)removeAccounts:(id *)a3
{
  id v6 = 0;
  uint64_t v7 = 1;
  *(void *)&long long v3 = 134218498;
  long long v17 = v3;
  while (1)
  {
    unint64_t v8 = v6;
    id v19 = v6;
    unsigned int v9 = -[MSDAccountManager _signOutiCloudAccountWithPassword:outError:](self, "_signOutiCloudAccountWithPassword:outError:", 0, &v19, v17);
    id v6 = v19;

    if (v9) {
      break;
    }
LABEL_5:
    id v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v6 localizedFailureReason];
      id v14 = [v6 code];
      *(_DWORD *)buf = v17;
      uint64_t v21 = v7;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2048;
      id v25 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove accounts (retryCount = %td): %{public}@(0x%tx)", buf, 0x20u);
    }
    if (--v7 == -1)
    {
      BOOL v15 = 0;
      id v11 = v6;
      if (!a3) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  id v18 = v6;
  unsigned __int8 v10 = [(MSDAccountManager *)self _signOutiTunesAccount:&v18];
  id v11 = v18;

  if ((v10 & 1) == 0)
  {
    id v6 = v11;
    goto LABEL_5;
  }
  BOOL v15 = 1;
  if (a3) {
LABEL_9:
  }
    *a3 = v11;
LABEL_10:

  return v15;
}

- (BOOL)_trySetupAccounts:(id *)a3
{
  BOOL v5 = +[MSDTargetDevice sharedInstance];
  id v6 = +[MSDProgressUpdater sharedInstance];
  uint64_t v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start setting up accounts with Continuity support.", buf, 2u);
  }

  [v6 updateStage:20];
  v52 = v6;
  if (([v5 allowAccountSetup] & 1) == 0)
  {
    v50 = v5;
    v51 = a3;
    v49 = sub_100068600();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_1000D2670(v49);
    }

    id v26 = +[NSError errorDomainMSDWithCode:3727740956 message:@"The operation is not allowed."];
    __int16 v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    v13 = 0;
    goto LABEL_62;
  }
  [v5 saveiCloudAccountSyncNeeded:0];
  if (!os_variant_has_internal_content())
  {
    id v14 = 0;
    goto LABEL_17;
  }
  unint64_t v8 = +[MSDTestPreferences sharedInstance];
  unsigned int v9 = [v8 mockAccountSettingsFile];

  if (!v9)
  {
    id v14 = 0;
LABEL_16:

LABEL_17:
    unsigned int v9 = objc_alloc_init(MSDGetAccountSettingsRequest);
    long long v17 = [(MSDAccountManager *)self existingAccounts];
    [(MSDGetAccountSettingsRequest *)v9 setExistingAccounts:v17];

    id v18 = +[MSDServerRequestHandler sharedInstance];
    v16 = [v18 handleRequestSync:v9];

    id v19 = [v16 error];
    v20 = v19;
    if (v19)
    {
      if ([v19 code] == (id)3727741185)
      {
        id v21 = v20;

        id v14 = v21;
        goto LABEL_20;
      }
      uint64_t v27 = +[NSError errorDomainMSDWithCode:3727744512 message:@"Unexpected server response."];

      id v14 = (id)v27;
    }
    if (!v14)
    {
      v13 = [v16 accountSettings];

      goto LABEL_25;
    }
LABEL_20:
    v50 = v5;
    v51 = a3;

    __int16 v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    v13 = 0;
    goto LABEL_21;
  }
  unsigned __int8 v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v59 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Loading account settings from file: %{public}@", buf, 0xCu);
  }

  id v11 = objc_alloc((Class)NSDictionary);
  id v12 = +[NSURL fileURLWithPath:v9];
  id v57 = 0;
  v13 = (MSDGetAccountSettingsRequest *)[v11 initWithContentsOfURL:v12 error:&v57];
  id v14 = v57;

  BOOL v15 = sub_100068600();
  v16 = v15;
  if (!v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000D25D8(v14, v16);
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v59 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Account settings successfully loaded: %{public}@", buf, 0xCu);
  }
LABEL_25:

  int has_internal_content = os_variant_has_internal_content();
  id v29 = sub_100068600();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (has_internal_content)
  {
    if (!v30) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138543362;
    v59 = v13;
    v31 = "Got account settings from hub: %{public}@";
    v32 = v29;
    uint32_t v33 = 12;
  }
  else
  {
    if (!v30) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    v31 = "Got account settings from hub";
    v32 = v29;
    uint32_t v33 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
LABEL_31:

  uint64_t v23 = [(MSDGetAccountSettingsRequest *)v13 objectForKey:@"iCloud"];
  uint64_t v24 = [(MSDGetAccountSettingsRequest *)v13 objectForKey:@"iTunes"];
  v34 = sub_100068600();
  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (v23 | v24)
  {
    v50 = v5;
    v51 = a3;
    if (v35)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Signing out existing iCloud account.", buf, 2u);
    }

    __int16 v22 = [(id)v23 objectForKey:@"PwdForExistingAccount"];
    id v56 = v14;
    unsigned int v36 = [(MSDAccountManager *)self _signOutiCloudAccountWithPassword:v22 outError:&v56];
    id v26 = v56;

    if (!v36) {
      goto LABEL_62;
    }
    v37 = sub_100068600();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Signing out existing iTunes account.", buf, 2u);
    }

    id v55 = v26;
    unsigned int v38 = [(MSDAccountManager *)self _signOutiTunesAccount:&v55];
    id v14 = v55;

    if (v38)
    {
      v39 = sub_100068600();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Wait for some extra time to make sure accounts complete signout.", buf, 2u);
      }

      sleep(0xAu);
      if (v23)
      {
        id v54 = v14;
        unsigned int v40 = [(MSDAccountManager *)self _setupiCloudAccountWithSettings:v23 outError:&v54];
        id v26 = v54;

        if (!v40)
        {
LABEL_62:
          BOOL v25 = 0;
          goto LABEL_51;
        }
        id v14 = v26;
      }
      if (v24)
      {
        id v53 = v14;
        unsigned int v41 = [(MSDAccountManager *)self _setupiTunesAccountWithSettings:v24 outError:&v53];
        id v26 = v53;

        if (!v41) {
          goto LABEL_62;
        }
      }
      else
      {
        id v26 = v14;
      }
      BOOL v25 = 1;
LABEL_51:
      v44 = [(MSDAccountManager *)self existingAccounts];
      if (v44)
      {
        v43 = v44;
        v45 = [v44 objectForKey:@"Account"];
        v46 = [v43 objectForKey:@"Account"];
        v42 = +[NSDictionary dictionaryWithObjectsAndKeys:v45, @"iCloudAccount", v46, @"iTunesAccount", 0];
      }
      else
      {
        v42 = 0;
        v43 = &__NSDictionary0__struct;
      }
      v47 = [v52 bundleInProgress];
      [v47 updateComponentProgress:@"Accounts" withResult:v25 withAdditionalInfo:v42];

      if (v51)
      {
        id v14 = v26;
        id *v51 = v14;
      }
      else
      {
        id v14 = v26;
      }
      BOOL v5 = v50;
      goto LABEL_58;
    }
LABEL_21:
    BOOL v25 = 0;
    id v26 = v14;
    goto LABEL_51;
  }
  if (v35)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No iCloud or iTunes account settings provided. Skip setting up any account.", buf, 2u);
  }

  [(MSDAccountManager *)self _forceiCloudKeychainToSyncWithServer];
  __int16 v22 = 0;
  v42 = 0;
  v43 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  LOBYTE(v25) = 1;
LABEL_58:

  return v25;
}

- (BOOL)_setupiCloudAccountWithSettings:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned int v40 = sub_100068600();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000D2980();
    }

    sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
    BOOL v22 = 0;
    unsigned __int8 v10 = 0;
    id v12 = 0;
    id v11 = 0;
    unsigned int v9 = 0;
    unint64_t v8 = 0;
    goto LABEL_20;
  }
  uint64_t v7 = [v6 objectForKey:@"Account"];
  if (!v7)
  {
    id v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No iCloud account information in settings. iCloud account setup skipped.", v58, 2u);
    }

    unsigned __int8 v10 = 0;
    id v12 = 0;
    id v11 = 0;
    unsigned int v9 = 0;
    unint64_t v8 = 0;
LABEL_19:
    BOOL v22 = 1;
    goto LABEL_20;
  }
  unint64_t v8 = (void *)v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned int v41 = sub_100068600();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1000D290C();
    }

    sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
    BOOL v22 = 0;
    unsigned __int8 v10 = 0;
    id v12 = 0;
    id v11 = 0;
    unsigned int v9 = 0;
    goto LABEL_20;
  }
  unsigned int v9 = [v6 objectForKey:@"Password"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v24 = sub_100068600();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000D26B4(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
    BOOL v22 = 0;
    unsigned __int8 v10 = 0;
    goto LABEL_27;
  }
  unsigned __int8 v10 = [v6 objectForKey:@"Features"];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v32 = sub_100068600();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000D272C(v32, v33, v34, v35, v36, v37, v38, v39);
    }

    sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
    BOOL v22 = 0;
LABEL_27:
    id v12 = 0;
    id v11 = 0;
    goto LABEL_20;
  }
  id v11 = [v6 objectForKey:@"RecoveryKey"];
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = [v6 objectForKey:@"CDPResetNeeded"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v50 = sub_100068600();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          sub_1000D281C(v50, v51, v52, v53, v54, v55, v56, v57);
        }

        sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
        goto LABEL_40;
      }
    }
    if (!-[MSDAccountManager _signIniCloudAccount:password:features:recoveryKey:resetCDP:outError:](self, "_signIniCloudAccount:password:features:recoveryKey:resetCDP:outError:", v8, v9, v10, v11, [v12 BOOLValue], a4))
    {
      v13 = sub_100068600();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000D27A4(v13, v14, v15, v16, v17, v18, v19, v20);
      }

LABEL_40:
      BOOL v22 = 0;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v42 = sub_100068600();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
    sub_1000D2894(v42, v43, v44, v45, v46, v47, v48, v49);
  }

  sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
  BOOL v22 = 0;
  id v12 = 0;
LABEL_20:

  return v22;
}

- (BOOL)_setupiTunesAccountWithSettings:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 objectForKey:@"Account"];
    if (!v7)
    {
      uint64_t v18 = sub_100068600();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No iTunes account information in settings. iTunes account setup skipped.", v31, 2u);
      }

      unsigned int v9 = 0;
      unint64_t v8 = 0;
LABEL_13:
      BOOL v19 = 1;
      goto LABEL_14;
    }
    unint64_t v8 = (void *)v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v9 = [v6 objectForKey:@"Password"];
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v21 = sub_100068600();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000D29F4(v21, v22, v23, v24, v25, v26, v27, v28);
        }

        sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
        goto LABEL_18;
      }
      if (![(MSDAccountManager *)self _signIniTunesAccount:v8 password:v9 outError:a4])
      {
        unsigned __int8 v10 = sub_100068600();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000D2A6C(v10, v11, v12, v13, v14, v15, v16, v17);
        }

LABEL_18:
        BOOL v19 = 0;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    uint64_t v30 = sub_100068600();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1000D2AE4();
    }

    sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
    BOOL v19 = 0;
    unsigned int v9 = 0;
  }
  else
  {
    uint64_t v29 = sub_100068600();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000D2B58();
    }

    sub_1000C3140(a4, 3727744512, @"Unexpected server response.");
    BOOL v19 = 0;
    unsigned int v9 = 0;
    unint64_t v8 = 0;
  }
LABEL_14:

  return v19;
}

- (BOOL)_signIniTunesAccount:(id)a3 password:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  unsigned __int8 v10 = objc_alloc_init(MSDAccountContext);
  [(MSDAccountContext *)v10 setUsername:v9];

  [(MSDAccountContext *)v10 setPassword:v8];
  uint64_t v11 = [(MSDAccountManager *)self accountManagerHelper];
  LOBYTE(a5) = [v11 performiTunesAccountSignInWithContext:v10 outError:a5];

  return (char)a5;
}

- (BOOL)_signOutiTunesAccount:(id *)a3
{
  BOOL v5 = objc_alloc_init(MSDAccountContext);
  id v6 = [(MSDAccountManager *)self accountManagerHelper];
  LOBYTE(a3) = [v6 performiTunesAccountSignOutWithContext:v5 outError:a3];

  return (char)a3;
}

- (BOOL)_signIniCloudAccount:(id)a3 password:(id)a4 features:(id)a5 recoveryKey:(id)a6 resetCDP:(BOOL)a7 outError:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = +[MSDTargetDevice sharedInstance];
  BOOL v19 = +[MSDMailProcessor sharedInstance];
  uint64_t v20 = objc_alloc_init(MSDAccountContext);
  [(MSDAccountContext *)v20 setUsername:v17];

  [(MSDAccountContext *)v20 setPassword:v16];
  [(MSDAccountContext *)v20 setRecoveryKey:v14];
  [(MSDAccountContext *)v20 setResetCDP:v9];
  [(MSDAccountContext *)v20 setFeatures:v15];

  [(MSDAccountContext *)v20 setLocalSecret:@"123456"];
  if (([v18 createTemporaryPasscodeIfNeeded] & 1) == 0)
  {
    sub_1000C3140(a8, 3727741045, @"Failed to setup device local secret.");
    LOBYTE(v22) = 0;
LABEL_15:
    uint64_t v25 = v14;
    goto LABEL_16;
  }
  [v18 unlockDeviceKeybagIfNeeded];
  [v18 acquireDeviceKeybagAssertionIfNeeded];
  id v21 = [(MSDAccountManager *)self accountManagerHelper];
  unsigned int v22 = [v21 performiCloudAccountSignInWithContext:v20 outError:a8];

  if (!v22 || !v9) {
    goto LABEL_15;
  }
  uint64_t v23 = sub_100068600();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received CDP reset request. Generate new recovery key for iCloud account!", v33, 2u);
  }

  uint64_t v24 = [(MSDAccountManager *)self accountManagerHelper];
  uint64_t v25 = [v24 generateiCloudAccountRecoveryKeyWithError:a8];

  if (!v25)
  {
    LOBYTE(v22) = 0;
    goto LABEL_16;
  }
  int has_internal_content = os_variant_has_internal_content();
  uint64_t v27 = sub_100068600();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (has_internal_content)
  {
    if (v28)
    {
      *(_DWORD *)uint64_t v33 = 138543362;
      *(void *)&v33[4] = v25;
      uint64_t v29 = "New recovery key generated: %{public}@";
      uint64_t v30 = v27;
      uint32_t v31 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, v33, v31);
    }
  }
  else if (v28)
  {
    *(_DWORD *)uint64_t v33 = 141558274;
    *(void *)&v33[4] = 1752392040;
    *(_WORD *)&v33[12] = 2112;
    *(void *)&v33[14] = v25;
    uint64_t v29 = "New recovery key generated: %{mask.hash}@";
    uint64_t v30 = v27;
    uint32_t v31 = 22;
    goto LABEL_12;
  }

  [v18 saveiCloudAccountRecoveryKey:v25];
  [v19 sendImmediateDeviceInfoPing];
  LOBYTE(v22) = 1;
LABEL_16:
  [v18 removeTemporaryPasscodeIfNeeded:*(_OWORD *)v33, *(void *)&v33[16]];
  [(MSDAccountManager *)self _forceiCloudKeychainToSyncWithServer];

  return v22;
}

- (BOOL)_signOutiCloudAccountWithPassword:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(MSDAccountContext);
  [(MSDAccountContext *)v7 setPassword:v6];

  id v8 = [(MSDAccountManager *)self accountManagerHelper];
  LOBYTE(a4) = [v8 performiCloudAccountSignOutWithContext:v7 outError:a4];

  return (char)a4;
}

- (void)_forceiCloudKeychainToSyncWithServer
{
  id v2 = [(MSDAccountManager *)self accountManagerHelper];
  [v2 forceiCloudKeychainToSyncWithServerAndError:0];
}

- (void)syncAppsWithiCloud
{
  uint64_t v21 = SBSOpenApplicationOptionKeyPreventDismissalOfTransientOverlays;
  unsigned int v22 = &__kCFBooleanTrue;
  long long v3 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  uint32_t v4 = [(MSDAccountManager *)self accountManagerHelper];
  BOOL v5 = [v4 fetchiTunesiCloudAccountsInfo];

  id v6 = [v5 objectForKey:@"iCloud"];

  if (v6)
  {
    uint64_t v7 = +[MSDAppSwitcherManager sharedInstance];
    [v7 stashSwitcherModelToPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/emptyAppSwitcherModel.plist" overwrite:1];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [&off_100162DB8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(&off_100162DB8);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          +[MSDAppLauncherTerminator launchApp:v12 withOptions:v3 outError:0];
          sleep(0x3Cu);
          +[MSDAppLauncherTerminator terminateApp:v12 outError:0];
        }
        id v9 = [&off_100162DB8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    uint64_t v13 = +[MSDAppSwitcherManager sharedInstance];
    [v13 loadStashedSwitcherModelFromPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/emptyAppSwitcherModel.plist"];
  }
  else
  {
    uint64_t v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = "-[MSDAccountManager syncAppsWithiCloud]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s - No iCloud account logged in. Not synching any apps", buf, 0xCu);
    }
  }
}

- (MSDAccountManagerHelper)accountManagerHelper
{
  return self->_accountManagerHelper;
}

- (void)setAccountManagerHelper:(id)a3
{
}

- (int)peerChangeToken
{
  return self->_peerChangeToken;
}

- (void)setPeerChangeToken:(int)a3
{
  self->_peerChangeToken = a3;
}

- (void).cxx_destruct
{
}

@end