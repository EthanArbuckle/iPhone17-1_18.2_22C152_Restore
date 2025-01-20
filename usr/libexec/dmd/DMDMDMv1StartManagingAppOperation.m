@interface DMDMDMv1StartManagingAppOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (DMDAppMetadata)metadata;
- (void)_attemptSINFSwap;
- (void)_endOperationWithBundleIdentifier:(id)a3;
- (void)_manageApp;
- (void)_promptIfPermittedByPolicyToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6;
- (void)_promptToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6;
- (void)_runWithRequest:(id)a3;
- (void)_setRemovability:(id)a3;
- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4;
- (void)_setTapToPayScreenLock:(id)a3;
- (void)runWithRequest:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation DMDMDMv1StartManagingAppOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v5 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v5 count:1];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000D2F30;
}

- (DMDAppMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[DMDAppController sharedController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005D064;
  v7[3] = &unk_1000CB228;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getMetadataForAppRequest:v6 completion:v7];
}

- (void)_runWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DMDMDMv1StartManagingAppOperation *)self metadata];
  id v6 = [v5 bundleIdentifier];
  v7 = [v5 displayName];
  id v8 = +[DMDAppController sharedController];
  id v9 = [v8 stateForBundleIdentifier:v6];

  if (v9 == (id)17)
  {
    v10 = DMFErrorWithCodeAndUserInfo();
    [(DMDMDMv1StartManagingAppOperation *)self endOperationWithError:v10];
  }
  else
  {
    v11 = +[MCCloudConfiguration sharedConfiguration];
    unsigned int v12 = [v11 isSupervised];

    v13 = [v4 internal];
    unsigned int v14 = [v13 BOOLValue];

    if ((v12 & 1) != 0 || v14)
    {
      v17 = DMFAppLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v18 = @"NO";
        if (v12) {
          CFStringRef v19 = @"YES";
        }
        else {
          CFStringRef v19 = @"NO";
        }
        if (v14) {
          CFStringRef v18 = @"YES";
        }
        *(_DWORD *)buf = 138543618;
        CFStringRef v25 = v19;
        __int16 v26 = 2114;
        CFStringRef v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Request to manage app fast-tracked, supervised: %{public}@ internal: %{public}@", buf, 0x16u);
      }

      [(DMDMDMv1StartManagingAppOperation *)self _manageApp];
      [(DMDMDMv1StartManagingAppOperation *)self _endOperationWithBundleIdentifier:v6];
    }
    else
    {
      [(DMDMDMv1StartManagingAppOperation *)self _setState:17 forBundleIdentifier:v6];
      v15 = [v4 originator];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005D384;
      v20[3] = &unk_1000CB9E8;
      id v21 = v7;
      v22 = self;
      id v16 = v6;
      id v23 = v16;
      [(DMDMDMv1StartManagingAppOperation *)self _promptIfPermittedByPolicyToManageApp:v16 appDisplayName:v21 originator:v15 completion:v20];

      [(DMDMDMv1StartManagingAppOperation *)self _endOperationWithBundleIdentifier:v16];
    }
  }
}

- (void)_promptIfPermittedByPolicyToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = objc_opt_new();
  [v14 readTimestampsFromFile];
  if ([v14 isPromptAllowedRightNow])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10005D5F8;
    v15[3] = &unk_1000CBA10;
    id v17 = v13;
    id v16 = v14;
    [(DMDMDMv1StartManagingAppOperation *)self _promptToManageApp:v10 appDisplayName:v11 originator:v12 completion:v15];
  }
  else
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 2);
  }
}

- (void)_promptToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6
{
  id v22 = a6;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_opt_new();
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"Would you like to let %@ take management of the app “%@”? Your app data will become managed." value:&stru_1000CC390 table:@"DMFNotifications"];

  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v14 = [v13 localizedStringForKey:@"App Management Change" value:&stru_1000CC390 table:@"DMFNotifications"];
  [v10 setHeader:v14];

  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v8, v9);

  [v10 setMessage:v15];
  id v16 = +[NSBundle bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"Manage" value:&stru_1000CC390 table:@"DMFNotifications"];
  [v10 setDefaultButtonTitle:v17];

  CFStringRef v18 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v19 = [v18 localizedStringForKey:@"Cancel" value:&stru_1000CC390 table:@"DMFNotifications"];
  [v10 setAlternateButtonTitle:v19];

  v20 = +[DMDUserNotificationController sharedController];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10005D8E8;
  v23[3] = &unk_1000CBA38;
  id v24 = v22;
  id v21 = v22;
  [v20 showNotification:v10 completion:v23];
}

- (void)_manageApp
{
  [(DMDMDMv1StartManagingAppOperation *)self _attemptSINFSwap];
  v3 = [(DMDMDMv1StartManagingAppOperation *)self metadata];
  id v4 = [v3 lifeCycle];
  id v5 = [v4 currentState];
  v36 = v3;
  if (v5 && v5 != (id)8)
  {
    if (v5 != (id)2)
    {
      uint64_t v7 = 7;
      goto LABEL_9;
    }
    id v6 = DMFAppLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Marking an app in the installing state as managed but uninstalled", buf, 2u);
    }
  }
  uint64_t v7 = 8;
LABEL_9:
  id v8 = +[DMDAppController sharedController];
  [v4 addObserver:v8];

  id v9 = [(DMDMDMv1StartManagingAppOperation *)self metadata];
  id v10 = [v9 bundleIdentifier];
  v32 = self;
  [(DMDMDMv1StartManagingAppOperation *)self _setState:v7 forBundleIdentifier:v10];

  id v11 = [(DMDMDMv1StartManagingAppOperation *)self request];
  v35 = +[DMDAppController sharedController];
  v34 = [v11 VPNUUIDString];
  v31 = [v11 cellularSliceUUIDString];
  id v12 = [v11 contentFilterUUIDString];
  v30 = [v11 DNSProxyUUIDString];
  v29 = [v11 relayUUIDString];
  id v13 = [v11 associatedDomains];
  v28 = [v11 associatedDomainsEnableDirectDownloads];
  CFStringRef v27 = [v11 allowUserToHide];
  unsigned int v14 = [v11 allowUserToLock];
  v15 = [v11 configuration];
  id v16 = [v11 managementOptions];
  id v17 = [v11 sourceIdentifier];
  [v36 bundleIdentifier];
  CFStringRef v18 = v33 = v4;
  [v35 setVPNUUIDString:v34 cellularSliceUUIDString:v31 contentFilterUUIDString:v12 DNSProxyUUIDString:v30 relayUUIDString:v29 associatedDomains:v13 enableDirectDownloads:v28 allowUserToHide:v27 allowUserToLock:v14 configuration:v15 options:v16 sourceIdentifier:v17 forBundleIdentifier:v18];

  CFStringRef v19 = [v11 removable];
  [(DMDMDMv1StartManagingAppOperation *)v32 _setRemovability:v19];

  v20 = [v11 tapToPayScreenLock];
  [(DMDMDMv1StartManagingAppOperation *)v32 _setTapToPayScreenLock:v20];

  id v21 = +[DMDAppController sharedController];
  [v21 sendManagedAppsChangedNotification];

  id v22 = +[DMDAppController sharedController];
  id v23 = [v11 personaIdentifier];
  id v24 = [v36 bundleIdentifier];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10005DCE0;
  v37[3] = &unk_1000C9B78;
  id v38 = v36;
  id v39 = v11;
  id v25 = v11;
  id v26 = v36;
  [v22 updateBundleIDPersonaIDMappingForPersonaID:v23 addingBundleID:v24 completionHandler:v37];
}

- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = +[DMDAppController sharedController];
  id v10 = 0;
  unsigned __int8 v7 = [v6 setState:a3 forBundleIdentifier:v5 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    id v9 = DMFAppLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000865C4(a3, (uint64_t)v5, v9);
    }
  }
}

- (void)_attemptSINFSwap
{
  v3 = [(DMDMDMv1StartManagingAppOperation *)self metadata];
  id v7 = [v3 storeItemIdentifier];

  if (v7)
  {
    id v4 = [(DMDMDMv1StartManagingAppOperation *)self request];
    id v5 = +[DMDAppController sharedController];
    id v6 = [v4 personaIdentifier];
    [v5 sendAppRequestWithBundleIdentifier:0 storeItemIdentifier:v7 personaIdentifier:v6 type:2 skipDownloads:1 completion:&stru_1000CBA78];
  }
}

- (void)_endOperationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[DMDAppController sharedController];
  id v6 = [v5 stateForBundleIdentifier:v4];

  id v7 = [objc_alloc((Class)DMFMDMv1InstallAppResultObject) initWithBundleIdentifier:v4 state:v6];
  [(DMDMDMv1StartManagingAppOperation *)self endOperationWithResultObject:v7];
}

- (void)_setRemovability:(id)a3
{
  id v4 = a3;
  id v5 = +[DMDAppController sharedController];
  id v6 = [(DMDMDMv1StartManagingAppOperation *)self metadata];
  id v7 = [v6 bundleIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005E120;
  v9[3] = &unk_1000CADD0;
  id v10 = v4;
  id v8 = v4;
  [v5 setRemovability:v8 forBundleIdentifier:v7 completion:v9];
}

- (void)_setTapToPayScreenLock:(id)a3
{
  id v4 = a3;
  id v5 = +[DMDAppController sharedController];
  id v6 = [(DMDMDMv1StartManagingAppOperation *)self metadata];
  id v7 = [v6 bundleIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005E26C;
  v9[3] = &unk_1000CADD0;
  id v10 = v4;
  id v8 = v4;
  [v5 setTapToPayScreenLock:v8 forBundleIdentifier:v7 completion:v9];
}

@end