@interface TransparencyAccount
+ (BOOL)eligibleForOptIn;
+ (BOOL)initiateCredentialRenewal:(id *)a3 completionHandler:(id)a4;
+ (BOOL)isAccountsErrorRetryable:(id)a3;
+ (id)authToken:(id *)a3;
+ (id)cloudKitAccount:(id)a3;
+ (id)createAuthToken:(id)a3 authToken:(id)a4;
+ (id)createAuthkitSession;
+ (id)primaryAccount:(id *)a3;
+ (id)sharedAccountStore;
+ (id)sharedManager;
+ (int64_t)accountLevelErrorCodeForLevel:(id)a3;
+ (unint64_t)accountLevel:(id)a3;
+ (void)startMetrics:(id)a3 idsAccountTracker:(id)a4;
- (ACAccountStore)store;
- (BOOL)eligibleForOptIn:(id)a3;
- (TransparencyAccount)init;
- (double)accountsdRetryTimeout;
- (id)cloudKitAccount:(id)a3;
- (id)fetchAccountsRetryingWithTimeout:(double)a3 error:(id *)a4;
- (id)primaryAccount:(id *)a3;
- (int64_t)ktAccountStatus:(id)a3 idsAccountsTracker:(id)a4 error:(id *)a5;
- (unint64_t)accountLevel:(id)a3;
- (void)setAccountsdRetryTimeout:(double)a3;
- (void)setStore:(id)a3;
@end

@implementation TransparencyAccount

+ (id)createAuthkitSession
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 bundleIdentifier];

  id v4 = [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:v3];

  return v4;
}

- (TransparencyAccount)init
{
  v6.receiver = self;
  v6.super_class = (Class)TransparencyAccount;
  v2 = [(TransparencyAccount *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)ACAccountStore);
    [(TransparencyAccount *)v2 setStore:v3];

    [(TransparencyAccount *)v2 setAccountsdRetryTimeout:30.0];
    id v4 = v2;
  }

  return v2;
}

- (unint64_t)accountLevel:(id)a3
{
  id v3 = a3;
  id v4 = +[AKAccountManager sharedInstance];
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 altDSIDForAccount:v3];
    if (v6)
    {
      id v12 = 0;
      v7 = [v5 authKitAccountWithAltDSID:v6 error:&v12];
      id v8 = v12;
      if (v7)
      {
        id v9 = [v5 securityLevelForAccount:v7];
      }
      else
      {
        if (qword_10032F338 != -1) {
          dispatch_once(&qword_10032F338, &stru_1002C96F0);
        }
        v10 = qword_10032F340;
        if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v14 = v8;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "TransparencyAccount authKitAccountWithAltDSID failed: %{public}@", buf, 0xCu);
        }
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return (unint64_t)v9;
}

+ (BOOL)isAccountsErrorRetryable:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:NSCocoaErrorDomain]) {
      BOOL v6 = [v4 code] == (id)4097 || [v4 code] == (id)4099;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)fetchAccountsRetryingWithTimeout:(double)a3 error:(id *)a4
{
  v7 = +[NSDate date];
  id v8 = [v7 dateByAddingTimeInterval:a3];

  id v9 = [(TransparencyAccount *)self store];
  id v24 = 0;
  [v9 aa_appleAccountsWithError:&v24];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v24;

  if (v10)
  {
    int v12 = 0;
LABEL_3:
    if (qword_10032F338 != -1) {
      dispatch_once(&qword_10032F338, &stru_1002C9710);
    }
    v13 = qword_10032F340;
    if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "TransparencyAccount found accounts after (%d) attempts", buf, 8u);
    }
    id v10 = v10;
  }
  else
  {
    v23 = a4;
    int v12 = 0;
    while (1)
    {
      v15 = +[NSDate date];
      id v16 = [v8 compare:v15];

      if (v16 == (id)-1) {
        break;
      }
      if (v12 == 5 || ![(id)objc_opt_class() isAccountsErrorRetryable:v11])
      {
        v19 = v23;
        if (qword_10032F338 != -1) {
          dispatch_once(&qword_10032F338, &stru_1002C9770);
        }
        v20 = qword_10032F340;
        if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v26 = v11;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "TransparencyAccount: Can't talk with accountsd: %@", buf, 0xCu);
        }
        if (v23)
        {
          id v21 = v11;
LABEL_33:
          id *v19 = v21;
          goto LABEL_8;
        }
        goto LABEL_8;
      }
      if (qword_10032F338 != -1) {
        dispatch_once(&qword_10032F338, &stru_1002C9750);
      }
      v17 = qword_10032F340;
      if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v26 = v12;
        *(_WORD *)&v26[4] = 2112;
        *(void *)&v26[6] = v11;
        __int16 v27 = 2112;
        v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "TransparencyAccount retrying accountsd XPC, (%d, %@) timeout: %@", buf, 0x1Cu);
      }
      ++v12;

      v18 = [(TransparencyAccount *)self store];
      id v24 = 0;
      [v18 aa_appleAccountsWithError:&v24];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = v24;

      if (v10) {
        goto LABEL_3;
      }
    }
    if (qword_10032F338 != -1) {
      dispatch_once(&qword_10032F338, &stru_1002C9730);
    }
    v19 = v23;
    v22 = qword_10032F340;
    if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "TransparencyAccount timed out, retry try: %d", buf, 8u);
    }
    if (v23)
    {
      id v21 = +[TransparencyError errorWithDomain:kTransparencyErrorAccount code:-394 underlyingError:v11 description:@"Account framework timeout"];
      goto LABEL_33;
    }
  }
LABEL_8:

  return v10;
}

- (id)primaryAccount:(id *)a3
{
  v5 = [(TransparencyAccount *)self store];
  if (v5)
  {
    [(TransparencyAccount *)self accountsdRetryTimeout];
    id v25 = 0;
    BOOL v6 = -[TransparencyAccount fetchAccountsRetryingWithTimeout:error:](self, "fetchAccountsRetryingWithTimeout:error:", &v25);
    id v7 = v25;
    id v8 = v7;
    if (v6)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v22;
        uint64_t v13 = AAAccountClassPrimary;
LABEL_5:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
          if (objc_msgSend(v15, "aa_isAccountClass:", v13, (void)v21)) {
            break;
          }
          if (v11 == (id)++v14)
          {
            id v11 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v17 = v15;

        if (v17) {
          goto LABEL_29;
        }
      }
      else
      {
LABEL_11:
      }
      if (qword_10032F338 != -1) {
        dispatch_once(&qword_10032F338, &stru_1002C97B0);
      }
      v18 = qword_10032F340;
      if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "No primary AppleAccount found: %@", buf, 0xCu);
      }
      if (a3)
      {
        id v19 = +[TransparencyError errorWithDomain:kTransparencyErrorAccount code:-117 underlyingError:v8 description:@"No primary AppleAccount found"];
LABEL_27:
        id v17 = 0;
        *a3 = v19;
LABEL_29:

        goto LABEL_30;
      }
    }
    else if (a3)
    {
      id v19 = v7;
      goto LABEL_27;
    }
    id v17 = 0;
    goto LABEL_29;
  }
  if (qword_10032F338 != -1) {
    dispatch_once(&qword_10032F338, &stru_1002C9790);
  }
  id v16 = qword_10032F340;
  if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No ACAccountStore found", buf, 2u);
  }
  if (a3)
  {
    +[TransparencyError errorWithDomain:kTransparencyErrorAccount code:-116 description:@"No account store found"];
    id v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }
LABEL_30:

  return v17;
}

- (id)cloudKitAccount:(id)a3
{
  id v3 = [a3 childAccountsWithAccountTypeIdentifier:ACAccountTypeIdentifierCloudKit];
  id v4 = [v3 firstObject];

  return v4;
}

+ (id)sharedManager
{
  if (qword_10032F350 != -1) {
    dispatch_once(&qword_10032F350, &stru_1002C97D0);
  }
  v2 = (void *)qword_10032F348;

  return v2;
}

+ (id)sharedAccountStore
{
  v2 = +[TransparencyAccount sharedManager];
  id v3 = [v2 store];

  return v3;
}

+ (void)startMetrics:(id)a3 idsAccountTracker:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10032F338 != -1) {
    dispatch_once(&qword_10032F338, &stru_1002C97F0);
  }
  id v7 = qword_10032F340;
  if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "TransparencyAccount startMetrics", buf, 2u);
  }
  double v8 = SFAnalyticsSamplerIntervalOncePerReport;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100202A94;
  v10[3] = &unk_1002C9838;
  id v11 = v6;
  id v9 = v6;
  [v5 addMultiSamplerForName:@"TransparencyAccountMultiSampler" withTimeInterval:v10 block:v8];
}

+ (int64_t)accountLevelErrorCodeForLevel:(id)a3
{
  id v3 = (char *)[a3 unsignedIntegerValue];
  if ((unint64_t)(v3 - 1) >= 5) {
    return -153;
  }
  else {
    return -153 - (void)v3;
  }
}

+ (id)createAuthToken:(id)a3 authToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableString);
  [v7 appendString:v6];

  [v7 appendString:@":"];
  [v7 appendString:v5];

  id v8 = objc_alloc_init((Class)NSMutableString);
  [v8 appendString:@"X-MobileMe-AuthToken "];
  id v9 = [v7 dataUsingEncoding:4];
  id v10 = [v9 base64EncodedStringWithOptions:0];
  [v8 appendString:v10];

  return v8;
}

+ (unint64_t)accountLevel:(id)a3
{
  id v3 = a3;
  id v4 = +[TransparencyAccount sharedManager];
  id v5 = [v4 accountLevel:v3];

  return (unint64_t)v5;
}

+ (BOOL)eligibleForOptIn
{
  v2 = +[TransparencyAccount primaryAccount:0];
  if (v2) {
    BOOL v3 = (id)+[TransparencyAccount accountLevel:v2] == (id)4;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)eligibleForOptIn:(id)a3
{
  return (id)+[TransparencyAccount accountLevel:a3] == (id)4;
}

- (int64_t)ktAccountStatus:(id)a3 idsAccountsTracker:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
LABEL_4:
    unint64_t v12 = [(TransparencyAccount *)self accountLevel:v8];
    if (v12 == 4)
    {
      uint64_t v13 = [v8 aa_personID];
      if (v13)
      {
        uint64_t v14 = [(TransparencyAccount *)self cloudKitAccount:v8];
        if (v14)
        {
          v15 = [v9 messagesStatus];

          if (v15)
          {
            if ([v9 haveIDSAccount:v13])
            {
              int64_t v16 = 0;
            }
            else
            {
              if (qword_10032F338 != -1) {
                dispatch_once(&qword_10032F338, &stru_1002C98F8);
              }
              long long v23 = qword_10032F340;
              if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "TransparencyAccount ids and CK doesn't match", buf, 2u);
              }
              int64_t v16 = 5;
            }
          }
          else
          {
            if (qword_10032F338 != -1) {
              dispatch_once(&qword_10032F338, &stru_1002C98D8);
            }
            long long v22 = qword_10032F340;
            if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "TransparencyAccount no IDS account", buf, 2u);
            }
            int64_t v16 = 4;
          }
        }
        else
        {
          if (qword_10032F338 != -1) {
            dispatch_once(&qword_10032F338, &stru_1002C98B8);
          }
          long long v21 = qword_10032F340;
          if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v8;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "TransparencyAccount no cloudkit account: %@", buf, 0xCu);
          }
          int64_t v16 = 3;
        }
      }
      else
      {
        if (qword_10032F338 != -1) {
          dispatch_once(&qword_10032F338, &stru_1002C9898);
        }
        id v19 = qword_10032F340;
        if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v8;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "TransparencyAccount no account dsid: %@", buf, 0xCu);
        }
        int64_t v16 = 2;
      }
    }
    else
    {
      int v17 = v12;
      if (qword_10032F338 != -1) {
        dispatch_once(&qword_10032F338, &stru_1002C9878);
      }
      v18 = qword_10032F340;
      if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "TransparencyAccount level not HSA2: %d", buf, 8u);
      }
      int64_t v16 = 2;
    }
    goto LABEL_44;
  }
  id v25 = 0;
  uint64_t v10 = [(TransparencyAccount *)self primaryAccount:&v25];
  id v11 = v25;
  id v8 = v11;
  if (v10)
  {

    id v8 = (id)v10;
    goto LABEL_4;
  }
  if (qword_10032F338 != -1) {
    dispatch_once(&qword_10032F338, &stru_1002C9858);
  }
  v20 = qword_10032F340;
  if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "TransparencyAccount no default: %@", buf, 0xCu);
  }
  if (a5)
  {
    id v8 = v8;
    *a5 = v8;
  }
  int64_t v16 = 1;
LABEL_44:

  return v16;
}

+ (id)primaryAccount:(id *)a3
{
  id v4 = [a1 sharedManager];
  id v5 = [v4 primaryAccount:a3];

  return v5;
}

+ (id)cloudKitAccount:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedManager];
  id v6 = [v5 cloudKitAccount:v4];

  return v6;
}

+ (id)authToken:(id *)a3
{
  id v4 = +[TransparencyAccount primaryAccount:](TransparencyAccount, "primaryAccount:");
  id v5 = v4;
  if (!v4)
  {
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  id v6 = [v4 credential];
  if (v6)
  {
    id v7 = [v5 aa_personID];
    if (v7)
    {
      unint64_t v8 = +[TransparencyAccount accountLevel:v5];
      if (qword_10032F338 != -1) {
        dispatch_once(&qword_10032F338, &stru_1002C9958);
      }
      id v9 = (void *)qword_10032F340;
      if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = v9;
        id v11 = +[NSNumber numberWithUnsignedInteger:v8];
        *(_DWORD *)buf = 138412290;
        v34 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Obtaining credential from account of security level %@", buf, 0xCu);
      }
      unint64_t v12 = [v6 credentialItemForKey:ACKeyTransparencyTokenKey];
      if (v12)
      {
        uint64_t v13 = +[TransparencyAccount createAuthToken:v7 authToken:v12];
        if (qword_10032F338 != -1) {
          dispatch_once(&qword_10032F338, &stru_1002C9998);
        }
        uint64_t v14 = qword_10032F340;
        if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Authorization token: %@", buf, 0xCu);
        }
      }
      else
      {
        if (qword_10032F338 != -1) {
          dispatch_once(&qword_10032F338, &stru_1002C9978);
        }
        long long v23 = (void *)qword_10032F340;
        if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
        {
          long long v24 = v23;
          id v25 = [v5 username];
          v26 = +[NSNumber numberWithUnsignedInteger:v8];
          *(_DWORD *)buf = 138412802;
          v34 = v25;
          __int16 v35 = 2112;
          v36 = v26;
          __int16 v37 = 2112;
          v38 = v7;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Account %@ of level %@ does not have KeyTransparencyToken(%@)", buf, 0x20u);
        }
        if (a3)
        {
          uint64_t v32 = kTransparencyErrorAccount;
          id v27 = +[NSNumber numberWithUnsignedInteger:v8];
          int64_t v28 = +[TransparencyAccount accountLevelErrorCodeForLevel:v27];
          v29 = [v5 username];
          v30 = +[NSNumber numberWithUnsignedInteger:v8];
          *a3 = +[TransparencyError errorWithDomain:v32, v28, @"Account %@ of level %@ does not have KeyTransparencyToken(%@)", v29, v30, v7 code description];
        }
        uint64_t v13 = 0;
      }
    }
    else
    {
      if (qword_10032F338 != -1) {
        dispatch_once(&qword_10032F338, &stru_1002C9938);
      }
      id v19 = (void *)qword_10032F340;
      if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        long long v21 = [v5 username];
        *(_DWORD *)buf = 138412546;
        v34 = v21;
        __int16 v35 = 2112;
        v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Account %@ does not have personId(%@)", buf, 0x16u);
      }
      if (!a3)
      {
        uint64_t v13 = 0;
        goto LABEL_34;
      }
      uint64_t v22 = kTransparencyErrorAccount;
      unint64_t v12 = [v5 username];
      +[TransparencyError errorWithDomain:v22, -152, @"Account %@ does not have personId(%@)", v12, 0 code description];
      uint64_t v13 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (qword_10032F338 != -1) {
      dispatch_once(&qword_10032F338, &stru_1002C9918);
    }
    v15 = (void *)qword_10032F340;
    if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
    {
      int64_t v16 = v15;
      int v17 = [v5 username];
      *(_DWORD *)buf = 138412290;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Account %@ missing credentials", buf, 0xCu);
    }
    if (!a3)
    {
      uint64_t v13 = 0;
      goto LABEL_35;
    }
    uint64_t v18 = kTransparencyErrorAccount;
    id v7 = [v5 username];
    +[TransparencyError errorWithDomain:v18, -118, @"Account %@ missing credentials", v7 code description];
    uint64_t v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_34:

LABEL_35:
LABEL_36:

  return v13;
}

+ (BOOL)initiateCredentialRenewal:(id *)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[TransparencyAccount primaryAccount:a3];
  if (v6)
  {
    id v7 = +[TransparencyAccount sharedAccountStore];
    v14[0] = kACRenewCredentialsShouldAvoidUIKey;
    v14[1] = kACRenewCredentialsShouldForceKey;
    v15[0] = &__kCFBooleanTrue;
    v15[1] = &__kCFBooleanFalse;
    unint64_t v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100203F88;
    v11[3] = &unk_1002BAF70;
    id v12 = v5;
    [v7 renewCredentialsForAccount:v6 options:v8 completion:v11];
  }
  else
  {
    if (qword_10032F338 != -1) {
      dispatch_once(&qword_10032F338, &stru_1002C99B8);
    }
    id v9 = qword_10032F340;
    if (os_log_type_enabled((os_log_t)qword_10032F340, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to renew credentials -- no primary account", buf, 2u);
    }
    id v7 = +[TransparencyError errorWithDomain:kTransparencyErrorAccount code:-117 description:@"Account credential renewal failed -- no account"];
    (*((void (**)(id, void *))v5 + 2))(v5, v7);
  }

  return v6 != 0;
}

- (ACAccountStore)store
{
  return (ACAccountStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStore:(id)a3
{
}

- (double)accountsdRetryTimeout
{
  return self->_accountsdRetryTimeout;
}

- (void)setAccountsdRetryTimeout:(double)a3
{
  self->_accountsdRetryTimeout = a3;
}

- (void).cxx_destruct
{
}

@end