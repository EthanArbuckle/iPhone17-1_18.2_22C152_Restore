@interface AppleAccountUtility
+ (void)_handleDiscoveredAccount:(id)a3 completion:(id)a4;
+ (void)checkForProvisionedAppleAccount:(id)a3;
@end

@implementation AppleAccountUtility

+ (void)checkForProvisionedAppleAccount:(id)a3
{
  v3 = (void (**)(id, uint64_t, uint64_t, id))a3;
  os_log_t v4 = os_log_create("com.apple.journal", "datastack");
  v5 = (void *)qword_100815DE0;
  qword_100815DE0 = (uint64_t)v4;

  v6 = qword_100815DE0;
  if (os_log_type_enabled((os_log_t)qword_100815DE0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "(checkForProvisionedAppleAccount) checking...", buf, 2u);
  }
  v7 = +[ACAccountStore defaultStore];
  v8 = [v7 aa_primaryAppleAccount];
  v9 = qword_100815DE0;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_100815DE0, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "(checkForProvisionedAppleAccount) There is primary account signed in", buf, 2u);
    }
    uint64_t v11 = ACAccountDataclassMoments;
    if ([v8 isProvisionedForDataclass:ACAccountDataclassMoments])
    {
      v12 = qword_100815DE0;
      if (os_log_type_enabled((os_log_t)qword_100815DE0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "(checkForProvisionedAppleAccount) Signed in and dataclass is provisioned.", buf, 2u);
      }
      v3[2](v3, 1, 1, [v8 isEnabledForDataclass:v11]);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100005F30;
      v13[3] = &unk_100790D88;
      v14 = v3;
      [v7 discoverPropertiesForAccount:v8 options:&__NSDictionary0__struct completion:v13];
    }
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "(checkForProvisionedAppleAccount) There is no account signed in.", buf, 2u);
    }
    v3[2](v3, 0, 1, [0 isEnabledForDataclass:ACAccountDataclassMoments]);
  }
}

+ (void)_handleDiscoveredAccount:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v6 = ACAccountDataclassMoments;
  id v7 = a3;
  unsigned int v8 = [v7 isProvisionedForDataclass:v6];
  LODWORD(v6) = [v7 isEnabledForDataclass:v6];

  v9 = qword_100815DE0;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_100815DE0, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "(checkForProvisionedAppleAccount) (_handleDiscoveredAccount) Dataclass is provisioned and enabled", buf, 2u);
    }
    v5[2](v5, 1, 1);
  }
  else
  {
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "(checkForProvisionedAppleAccount) (_handleDiscoveredAccount) Dataclass is provisioned and but not enabled", v15, 2u);
      }
      uint64_t v11 = v5[2];
      v12 = v5;
      uint64_t v13 = 1;
    }
    else
    {
      if (v10)
      {
        v14[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "(checkForProvisionedAppleAccount) (_handleDiscoveredAccount) Dataclass is not provisioned and not enabled. This account is not capable of using Journal due to some restriction.", (uint8_t *)v14, 2u);
      }
      uint64_t v11 = v5[2];
      v12 = v5;
      uint64_t v13 = 0;
    }
    v11(v12, v13, 0);
  }
}

@end