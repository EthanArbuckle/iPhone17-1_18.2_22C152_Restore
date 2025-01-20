@interface OTAuthKitActualAdapter
- (BOOL)accountIsCDPCapableByAltDSID:(id)a3;
- (BOOL)accountIsDemoAccountByAltDSID:(id)a3 error:(id *)a4;
- (OTAuthKitAdapterNotifier)notifiers;
- (id)machineID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(id *)a7;
- (void)deliverAKDeviceListDeltaMessagePayload:(id)a3;
- (void)fetchCurrentDeviceListByAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 reply:(id)a6;
- (void)notifyAKDeviceList:(id)a3;
- (void)registerNotification:(id)a3;
- (void)setNotifiers:(id)a3;
@end

@implementation OTAuthKitActualAdapter

- (void).cxx_destruct
{
}

- (void)setNotifiers:(id)a3
{
}

- (OTAuthKitAdapterNotifier)notifiers
{
  return (OTAuthKitAdapterNotifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)deliverAKDeviceListDeltaMessagePayload:(id)a3
{
  v4 = sub_10000B070("authkit");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received notifyAKDeviceListDeltaMessagePayload", v6, 2u);
  }

  v5 = [(OTAuthKitActualAdapter *)self notifiers];
  [v5 iterateListeners:&stru_1002FB880];
}

- (void)notifyAKDeviceList:(id)a3
{
  id v4 = a3;
  if (objc_opt_class())
  {
    if (v4)
    {
      v5 = [v4 userInfo];
    }
    else
    {
      v5 = 0;
    }
    [(OTAuthKitActualAdapter *)self deliverAKDeviceListDeltaMessagePayload:v5];
  }
  else
  {
    v6 = sub_10000B070("authkit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AuthKit not available; dropping device list notification",
        v7,
        2u);
    }
  }
}

- (void)registerNotification:(id)a3
{
  id v4 = a3;
  v5 = [(OTAuthKitActualAdapter *)self notifiers];

  if (!v5)
  {
    v6 = [[CKKSListenerCollection alloc] initWithName:@"otauthkitadapter-notifiers"];
    [(OTAuthKitActualAdapter *)self setNotifiers:v6];

    v7 = +[NSDistributedNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"notifyAKDeviceList:" name:AKDeviceListChangedNotification object:0];
  }
  id v8 = [(OTAuthKitActualAdapter *)self notifiers];
  [v8 registerListener:v4];
}

- (void)fetchCurrentDeviceListByAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_opt_class() && objc_opt_class())
  {
    id v13 = objc_alloc_init((Class)AKDeviceListRequestContext);
    if (v13)
    {
      v14 = v13;
      [v13 setAltDSID:v9];
      [v14 setType:3];
      id v15 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
      if (v15)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100135164;
        v21[3] = &unk_1002FB840;
        id v22 = v9;
        id v23 = v10;
        id v24 = v11;
        id v25 = v12;
        [v15 deviceListWithContext:v14 completion:v21];
      }
      else
      {
        v19 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:45 description:@"can't get authController"];
        v20 = +[CKKSAnalytics logger];
        [v20 logUnrecoverableError:v19 forEvent:@"OctagonEventAuthKitDeviceList" withAttributes:0];

        (*((void (**)(id, void, void, void, void, void, void, void, void, void *))v12 + 2))(v12, 0, 0, 0, 0, 0, 0, 0, 0, v19);
      }
    }
    else
    {
      v17 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:43 description:@"can't get AKDeviceListRequestContextClass"];
      v18 = +[CKKSAnalytics logger];
      [v18 logUnrecoverableError:v17 forEvent:@"OctagonEventAuthKitDeviceList" withAttributes:0];

      (*((void (**)(id, void, void, void, void, void, void, void, void, void *))v12 + 2))(v12, 0, 0, 0, 0, 0, 0, 0, 0, v17);
      v14 = 0;
    }
  }
  else
  {
    v16 = sub_10000B070("authkit");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AuthKit not available", buf, 2u);
    }

    v14 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:50 description:@"AKAnisette not available"];
    (*((void (**)(id, void, void, void, void, void, void, void, void, void *))v12 + 2))(v12, 0, 0, 0, 0, 0, 0, 0, 0, v14);
  }
}

- (id)machineID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  LOBYTE(v28) = a6;
  id v15 = [v14 initWithKeychainCircleMetrics:0 altDSID:v13 flowID:v12 deviceSessionID:v11 eventName:kSecurityRTCEventNameFetchMachineID testsAreEnabled:0 canSendMetrics:v28 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];

  if (objc_opt_class() && objc_opt_class())
  {
    id v16 = objc_alloc_init((Class)AKAnisetteProvisioningController);
    id v29 = 0;
    v17 = [v16 anisetteDataWithError:&v29];
    id v18 = v29;
    if (v17)
    {
      v19 = [v17 machineID];
      v20 = sub_10000B070("authkit");
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "fetched current machine ID as: %@", buf, 0xCu);
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v15 success:1 error:0];
        id v22 = v19;
      }
      else
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Anisette data does not have machineID", buf, 2u);
        }

        v26 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:46 description:@"Anisette data does not have machineID"];
        if (a7)
        {
          +[SecABC triggerAutoBugCaptureWithType:@"AuthKit" subType:@"missingMID"];
          *a7 = v26;
        }
        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v15 success:0 error:v26];
      }
    }
    else
    {
      id v25 = sub_10000B070("authkit");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v18;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Unable to fetch data: %@", buf, 0xCu);
      }

      if (a7) {
        *a7 = v18;
      }
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v15 success:0 error:v18];
      v19 = 0;
    }
  }
  else
  {
    id v23 = sub_10000B070("authkit");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AKAnisette not available", buf, 2u);
    }

    id v24 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:50 description:@"AKAnisette not available"];
    id v16 = v24;
    if (a7) {
      *a7 = v24;
    }
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v15 success:0 error:v16];
    v19 = 0;
  }

  return v19;
}

- (BOOL)accountIsDemoAccountByAltDSID:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = +[AKAccountManager sharedInstance];
  v6 = [v5 authKitAccountWithAltDSID:v4];
  unsigned int v7 = [v5 demoAccountForAccount:v6];
  id v8 = sub_10000B070("authkit");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Account with altDSID %@ is a demo account: %{BOOL}d", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

- (BOOL)accountIsCDPCapableByAltDSID:(id)a3
{
  id v3 = a3;
  if (objc_opt_class() && objc_opt_class())
  {
    id v4 = +[AKAccountManager sharedInstance];
    id v13 = 0;
    v5 = [v4 authKitAccountWithAltDSID:v3 error:&v13];
    id v6 = v13;
    if (v5)
    {
      unint64_t v7 = (unint64_t)[v4 securityLevelForAccount:v5];
      BOOL v8 = (v7 & 0xFFFFFFFFFFFFFFFELL) == 4;
      CFStringRef v9 = @"Unknown";
      switch(v7)
      {
        case 0uLL:
          break;
        case 1uLL:
          CFStringRef v9 = @"PasswordOnly";
          break;
        case 2uLL:
          CFStringRef v9 = @"Standard";
          break;
        case 3uLL:
          CFStringRef v9 = @"HSA1";
          break;
        case 4uLL:
          CFStringRef v9 = @"HSA2";
          break;
        case 5uLL:
          CFStringRef v9 = @"Managed";
          break;
        default:
          CFStringRef v9 = @"oh no please file a radar to Security | iCloud Keychain security level";
          break;
      }
    }
    else
    {
      int v10 = sub_10000B070("authkit");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to get AK account: %@", buf, 0xCu);
      }

      BOOL v8 = 0;
      unint64_t v7 = 0;
      CFStringRef v9 = @"Unknown";
    }
    id v11 = sub_10000B070("authkit");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v3;
      __int16 v16 = 2048;
      unint64_t v17 = v7;
      __int16 v18 = 2112;
      CFStringRef v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Security level for altDSID %@ is %lu.  Account type: %@", buf, 0x20u);
    }
  }
  else
  {
    id v4 = sub_10000B070("authkit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AuthKit not available", buf, 2u);
    }
    BOOL v8 = 0;
  }

  return v8;
}

@end