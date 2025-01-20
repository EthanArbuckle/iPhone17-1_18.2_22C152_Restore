@interface DMDRemoveAppOperation
+ (BOOL)removeAppMetadataForBundleIdentifier:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
+ (void)removeAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDRemoveAppOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3008;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  v6 = +[DMDAppController sharedController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006B5E4;
  v8[3] = &unk_1000C9B78;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  [v6 setRemovability:0 forBundleIdentifier:v7 completion:v8];
}

+ (BOOL)removeAppMetadataForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"DMDRemoveAppOperation.m", 77, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v12 = +[NSAssertionHandler currentHandler];
  [v12 handleFailureInMethod:a2, a1, @"DMDRemoveAppOperation.m", 78, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

LABEL_3:
  v8 = +[DMDAppController sharedController];
  if (([v8 setVPNUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087DA0();
    }
    goto LABEL_42;
  }
  if (([v8 setCellularSliceUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087D30();
    }
    goto LABEL_42;
  }
  if (([v8 setContentFilterUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087CC0();
    }
    goto LABEL_42;
  }
  if (([v8 setDNSProxyUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087C50();
    }
    goto LABEL_42;
  }
  if (([v8 setRelayUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087BE0();
    }
    goto LABEL_42;
  }
  if (([v8 setAssociatedDomains:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087B70();
    }
    goto LABEL_42;
  }
  if (([v8 setAssociatedDomainsEnableDirectDownloads:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087B00();
    }
    goto LABEL_42;
  }
  if (([v8 setAllowUserToHide:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087A90();
    }
    goto LABEL_42;
  }
  if (([v8 setAllowUserToLock:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087A20();
    }
    goto LABEL_42;
  }
  if (([v8 setConfiguration:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000879B0();
    }
    goto LABEL_42;
  }
  if (([v8 setManagementInformation:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087940();
    }
    goto LABEL_42;
  }
  if (([v8 removePersonaMappingForBundleID:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000878D0();
    }
LABEL_42:
    BOOL v10 = 0;
    goto LABEL_43;
  }
  id v9 = +[DMDAppController sharedController];
  [v9 sendManagedAppsChangedNotification];

  BOOL v10 = 1;
LABEL_43:

  return v10;
}

+ (void)removeAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"DMDRemoveAppOperation.m", 151, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v20 = +[NSAssertionHandler currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"DMDRemoveAppOperation.m", 152, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  BOOL v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remove app with bundle identifier: %{public}@", buf, 0xCu);
  }

  v11 = +[DMDAppController sharedController];
  v12 = +[DMDAppLifeCycle lifeCycleForBundleIdentifier:v7];
  switch((unint64_t)[v12 currentState])
  {
    case 0uLL:
    case 4uLL:
      v16 = DMFAppLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Start uninstalling app with bundle identifier: %{public}@", buf, 0xCu);
      }

      [v11 startUninstallingAppWithBundleIdentifier:v7 completion:v9];
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v13 = DMFAppLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cancel app installation with bundle identifier: %{public}@", buf, 0xCu);
      }

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10006C148;
      v25[3] = &unk_1000C9DA0;
      id v26 = v7;
      id v27 = v11;
      v28 = v9;
      [v27 cancelAppInstallationWithBundleIdentifier:v26 completion:v25];

      v14 = v26;
      goto LABEL_12;
    case 5uLL:
    case 6uLL:
    case 7uLL:
      v15 = DMFAppLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cancel app update with bundle identifier: %{public}@", buf, 0xCu);
      }

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10006C1FC;
      v21[3] = &unk_1000C9DA0;
      id v22 = v7;
      id v23 = v11;
      v24 = v9;
      [v23 cancelAppUpdateWithBundleIdentifier:v22 completion:v21];

      v14 = v22;
LABEL_12:

      break;
    case 8uLL:
      v9[2](v9, 0);
      break;
    default:
      uint64_t v29 = DMFBundleIdentifierErrorKey;
      id v30 = v7;
      v17 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v18 = DMFErrorWithCodeAndUserInfo();
      ((void (**)(void, void *))v9)[2](v9, v18);

      break;
  }
}

@end