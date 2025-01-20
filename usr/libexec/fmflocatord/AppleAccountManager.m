@interface AppleAccountManager
+ (id)sharedInstance;
- (ACAccountStore)accountStore;
- (AppleAccountManager)init;
- (id)fmfACAccount;
- (id)iCloudACAccount;
- (id)initSingleton;
- (void)dealloc;
- (void)iCloudAccountChanged:(id)a3;
- (void)requestAuthenticationShouldForce:(BOOL)a3 completion:(id)a4;
- (void)setAccountStore:(id)a3;
- (void)syncFMFAccountInfo;
@end

@implementation AppleAccountManager

+ (id)sharedInstance
{
  if (qword_10006D5D0 != -1) {
    dispatch_once(&qword_10006D5D0, &stru_10005A008);
  }
  v2 = (void *)qword_10006D5C8;
  if (!qword_10006D5C8)
  {
    v3 = sub_10001B6D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The AppleAccountManager singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10006D5C8;
  }

  return v2;
}

- (AppleAccountManager)init
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100038634(v3);
  }

  return 0;
}

- (id)initSingleton
{
  v5.receiver = self;
  v5.super_class = (Class)AppleAccountManager;
  v2 = [(AppleAccountManager *)&v5 init];
  if (v2)
  {
    objc_storeStrong((id *)&qword_10006D5C8, v2);
    id v3 = objc_alloc_init((Class)ACAccountStore);
    [(AppleAccountManager *)v2 setAccountStore:v3];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100036CAC(self, v3);
  }

  v4 = (void *)qword_10006D5C8;
  qword_10006D5C8 = 0;

  v5.receiver = self;
  v5.super_class = (Class)AppleAccountManager;
  [(AppleAccountManager *)&v5 dealloc];
}

- (void)syncFMFAccountInfo
{
  v2 = [(AppleAccountManager *)self iCloudACAccount];
  id v3 = v2;
  if (v2)
  {
    if ([v2 isProvisionedForDataclass:@"com.apple.Dataclass.ShareLocation"])
    {
      v4 = +[AccountManager sharedInstance];
      objc_super v5 = [v4 allAccountsOfType:objc_opt_class()];

      if ([v5 count])
      {
        v6 = [v5 objectAtIndexedSubscript:0];
        v7 = v6;
        if (v6)
        {
          v8 = [v6 dsid];
          v9 = [v3 aa_personID];
          unsigned __int8 v10 = [v8 isEqualToString:v9];

          if (v10)
          {
LABEL_15:
            v15 = objc_alloc_init(FMFAccount);
            [(FMFAccount *)v15 copyInfoFromAccount:v7];
            [(FMFAccount *)v15 applyPropertiesFromACAccount:v3 includingTokens:1];
            v16 = +[AccountManager sharedInstance];
            [v16 addAccount:v15];

            goto LABEL_16;
          }
          v11 = +[StartupRegisterManager sharedInstance];
          [v11 eventDidOccur:1];
        }
      }
      else
      {
        v7 = 0;
      }
      v14 = +[StartupRegisterManager sharedInstance];
      [v14 eventDidOccur:0];

      goto LABEL_15;
    }
    v13 = sub_10001B6D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "ShareLocation is not provisioned in the iCloud account", v17, 2u);
    }
  }
  else
  {
    v12 = sub_10001B6D4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Deleting FMF acount", buf, 2u);
    }

    v13 = +[AccountManager sharedInstance];
    [v13 deactivateAllAccountsOfType:objc_opt_class()];
  }

LABEL_16:
}

- (id)iCloudACAccount
{
  v2 = [(AppleAccountManager *)self accountStore];
  id v3 = [v2 aa_primaryAppleAccount];

  return v3;
}

- (id)fmfACAccount
{
  id v3 = [(AppleAccountManager *)self iCloudACAccount];
  if ([v3 isProvisionedForDataclass:@"com.apple.Dataclass.ShareLocation"])
  {
    v4 = [(AppleAccountManager *)self iCloudACAccount];
    objc_super v5 = [v4 aa_fmfAccount];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (void)iCloudAccountChanged:(id)a3
{
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "iCloudAccountChanged notification - looking for changes in fmf accounts", buf, 2u);
  }

  v4 = +[AppleAccountManager sharedInstance];
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EDB4;
  block[3] = &unk_100059350;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)requestAuthenticationShouldForce:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(AppleAccountManager *)self iCloudACAccount];
  if (v7)
  {
    id v8 = [(AppleAccountManager *)self accountStore];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001EEA0;
    v9[3] = &unk_10005A030;
    v9[4] = self;
    id v10 = v6;
    [v8 renewCredentialsForAccount:v7 force:v4 reason:0 completion:v9];
  }
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end