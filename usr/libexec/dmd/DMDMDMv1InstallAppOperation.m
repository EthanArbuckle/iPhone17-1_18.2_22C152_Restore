@interface DMDMDMv1InstallAppOperation
+ (id)descriptionForChangeType:(int64_t)a3;
+ (id)whitelistedClassesForRequest;
- (BOOL)_canManageBundleIdentifier:(id)a3;
- (id)_getRequiredAppIDFromDisk;
- (id)_storeAppFormat;
- (void)_applyManagementPiecesForRequest:(id)a3;
- (void)_attemptSINFSwapForRequest:(id)a3 completion:(id)a4;
- (void)_downloadStoreAppForRequest:(id)a3 type:(int64_t)a4;
- (void)_endOperationWithBundleIdentifier:(id)a3;
- (void)_installEnterpriseAppForRequest:(id)a3;
- (void)_installStoreAppForRequest:(id)a3;
- (void)_installSystemAppWithBundleIdentifier:(id)a3;
- (void)_promptIfNeededWithMessageFormat:(id)a3 success:(id)a4;
- (void)_promptToSignInAndInstallAppForRequest:(id)a3;
- (void)_purchaseFreeAppForRequest:(id)a3;
- (void)_redeemAppWithRedemptionCode:(id)a3;
- (void)_redownloadDeviceAppForRequest:(id)a3;
- (void)_redownloadUserAppForRequest:(id)a3;
- (void)_resetRemovabilityWithBundleIdentifier:(id)a3;
- (void)_resetTapToPayScreenLock;
- (void)_setRedemptionCode:(id)a3;
- (void)_setRemovability:(id)a3;
- (void)_setState:(unint64_t)a3;
- (void)_setTapToPayScreenLock:(id)a3;
- (void)_setUnusedRedemptionCode:(id)a3;
- (void)_showInstallationFailurePromptIfNeeded;
- (void)_showStorePromptToSignInAndInstallAppForRequest:(id)a3;
- (void)_updateManagementInfoWithBlock:(id)a3;
- (void)endOperationWithError:(id)a3;
- (void)endOperationWithResultObject:(id)a3;
- (void)installAppForRequest:(id)a3;
@end

@implementation DMDMDMv1InstallAppOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

- (void)endOperationWithResultObject:(id)a3
{
  id v4 = a3;
  if (([(DMDMDMv1InstallAppOperation *)self isFinished] & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)DMDMDMv1InstallAppOperation;
    [(DMDMDMv1InstallAppOperation *)&v5 endOperationWithResultObject:v4];
  }
}

- (void)endOperationWithError:(id)a3
{
  id v4 = a3;
  if (([(DMDMDMv1InstallAppOperation *)self isFinished] & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)DMDMDMv1InstallAppOperation;
    [(DMDMDMv1InstallAppOperation *)&v5 endOperationWithError:v4];
  }
}

- (void)installAppForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DMDInstallAppOperation *)self metadata];
  v6 = [v5 bundleIdentifier];

  v7 = +[DMDAppController sharedController];
  id v8 = [v7 stateForBundleIdentifier:v6];

  if (v8 == (id)3)
  {
    v9 = DMFAppLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100085EA4(self, v9);
    }

    uint64_t v16 = DMFBundleIdentifierErrorKey;
    v10 = [(DMDInstallAppOperation *)self metadata];
    id v11 = [v10 bundleIdentifier];
    id v17 = v11;
    v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v13 = DMFErrorWithCodeAndUserInfo();
    [(DMDMDMv1InstallAppOperation *)self endOperationWithError:v13];
  }
  else
  {
    v10 = [v4 redemptionCode];
    if (v10)
    {
      [(DMDMDMv1InstallAppOperation *)self _redeemAppWithRedemptionCode:v10];
      goto LABEL_10;
    }
    v14 = [v4 manifestURL];

    if (v14)
    {
      [(DMDMDMv1InstallAppOperation *)self _installEnterpriseAppForRequest:v4];
      goto LABEL_10;
    }
    id v11 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifierOfSystemPlaceholder:v6 error:0];
    uint64_t v15 = [v11 compatibilityObject];
    v12 = (void *)v15;
    if (v11 && v15) {
      [(DMDMDMv1InstallAppOperation *)self _installSystemAppWithBundleIdentifier:v6];
    }
    else {
      [(DMDMDMv1InstallAppOperation *)self _installStoreAppForRequest:v4];
    }
  }

LABEL_10:
}

- (id)_storeAppFormat
{
  if (qword_1000FBB88 != -1) {
    dispatch_once(&qword_1000FBB88, &stru_1000CB720);
  }
  uint64_t v2 = (void *)qword_1000FBB80;

  return v2;
}

- (id)_getRequiredAppIDFromDisk
{
  uint64_t v2 = +[DMDPaths mdmFilePath];
  v3 = +[NSDictionary dictionaryWithContentsOfFile:v2];

  id v4 = [v3 objectForKeyedSubscript:@"RequiredAppIDForMDM"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v5 = v4;
  }
  else {
    objc_super v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_redeemAppWithRedemptionCode:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DMDInstallAppOperation *)self metadata];
  id v6 = [v5 bundleIdentifier];

  v7 = +[DMDAppController sharedController];
  if ([v7 stateForBundleIdentifier:v6] == (id)1)
  {
    [(DMDMDMv1InstallAppOperation *)self _setRedemptionCode:v4];
    id v8 = [(DMDMDMv1InstallAppOperation *)self _storeAppFormat];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000594F4;
    v9[3] = &unk_1000CB770;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    id v13 = v4;
    [(DMDMDMv1InstallAppOperation *)self _promptIfNeededWithMessageFormat:v8 success:v9];
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:2611];
  }
}

- (void)_installEnterpriseAppForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"%@ is about to install and manage the app “%@”.\nYour iTunes account will not be charged for this app." value:&stru_1000CC390 table:@"DMFNotifications"];

  v7 = [v4 manifestURL];
  id v8 = +[DMDAppController sharedController];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10005994C;
  v29[3] = &unk_1000CADD0;
  v29[4] = self;
  v9 = objc_retainBlock(v29);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000599F8;
  v24[3] = &unk_1000CB798;
  v24[4] = self;
  id v10 = v4;
  id v25 = v10;
  id v26 = v7;
  id v11 = v8;
  id v27 = v11;
  id v12 = v9;
  id v28 = v12;
  id v13 = v7;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100059C84;
  v18[3] = &unk_1000CB7E8;
  id v19 = v11;
  id v20 = v10;
  v21 = self;
  id v22 = v12;
  v23 = objc_retainBlock(v24);
  v14 = v23;
  uint64_t v15 = v12;
  id v16 = v10;
  id v17 = v11;
  [(DMDMDMv1InstallAppOperation *)self _promptIfNeededWithMessageFormat:v6 success:v18];
}

- (void)_installSystemAppWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"%@ is about to install the app “%@”.\nYour iTunes account will not be charged for this app." value:&stru_1000CC390 table:@"DMFNotifications"];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100059F84;
  v8[3] = &unk_1000C9BE0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [(DMDMDMv1InstallAppOperation *)self _promptIfNeededWithMessageFormat:v6 success:v8];
}

+ (id)descriptionForChangeType:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
  {
    v3 = +[NSString stringWithFormat:@"unknown change type (%ld)", a3];
  }
  else
  {
    v3 = off_1000CB9B0[a3];
  }

  return v3;
}

- (void)_installStoreAppForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DMDInstallAppOperation *)self metadata];
  id v6 = [v5 bundleIdentifier];

  id v7 = [(DMDInstallAppOperation *)self metadata];
  unsigned int v8 = [v7 needsRedownload];

  id v9 = DMFAppLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting re-download of app because metadata says it is necessary: %{public}@", buf, 0xCu);
    }

    [(DMDMDMv1InstallAppOperation *)self _redownloadDeviceAppForRequest:v4];
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting SINF swap to install app: %{public}@", buf, 0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005A34C;
    v11[3] = &unk_1000CB810;
    id v12 = v6;
    id v13 = self;
    id v14 = v4;
    [(DMDMDMv1InstallAppOperation *)self _attemptSINFSwapForRequest:v14 completion:v11];
  }
}

- (void)_attemptSINFSwapForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005ABA0;
  v15[3] = &unk_1000CA170;
  id v7 = a4;
  id v16 = v7;
  unsigned int v8 = objc_retainBlock(v15);
  id v9 = +[DMDAppController sharedController];
  BOOL v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v6 personaIdentifier];
    *(_DWORD *)buf = 138543362;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "attempt SINF swap, persona:%{public}@", buf, 0xCu);
  }
  id v12 = [(DMDInstallAppOperation *)self metadata];
  id v13 = [v12 storeItemIdentifier];
  id v14 = [v6 personaIdentifier];
  [v9 sendAppRequestWithBundleIdentifier:0 storeItemIdentifier:v13 personaIdentifier:v14 type:2 skipDownloads:1 completion:v8];
}

- (void)_redownloadDeviceAppForRequest:(id)a3
{
}

- (void)_redownloadUserAppForRequest:(id)a3
{
}

- (void)_purchaseFreeAppForRequest:(id)a3
{
}

- (void)_downloadStoreAppForRequest:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[DMDAppController sharedController];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10005AE50;
  v29[3] = &unk_1000CADD0;
  v29[4] = self;
  unsigned int v8 = objc_retainBlock(v29);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005AEB8;
  v25[3] = &unk_1000CB838;
  v25[4] = self;
  id v9 = v7;
  id v26 = v9;
  id v10 = v6;
  id v27 = v10;
  id v11 = v8;
  id v28 = v11;
  id v12 = objc_retainBlock(v25);
  id v13 = [(DMDMDMv1InstallAppOperation *)self _storeAppFormat];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005B120;
  v18[3] = &unk_1000CB888;
  id v19 = v9;
  id v20 = v10;
  v21 = self;
  id v22 = v11;
  id v23 = v12;
  int64_t v24 = a4;
  id v14 = v12;
  uint64_t v15 = v11;
  id v16 = v10;
  id v17 = v9;
  [(DMDMDMv1InstallAppOperation *)self _promptIfNeededWithMessageFormat:v13 success:v18];
}

- (void)_applyManagementPiecesForRequest:(id)a3
{
  id v4 = a3;
  id v19 = +[DMDAppController sharedController];
  v18 = [v4 VPNUUIDString];
  objc_super v5 = [v4 cellularSliceUUIDString];
  id v6 = [v4 contentFilterUUIDString];
  id v17 = [v4 DNSProxyUUIDString];
  id v16 = [v4 relayUUIDString];
  uint64_t v15 = [v4 associatedDomains];
  id v14 = [v4 associatedDomainsEnableDirectDownloads];
  id v13 = [v4 allowUserToHide];
  id v7 = [v4 allowUserToLock];
  unsigned int v8 = [v4 configuration];
  id v9 = [v4 managementOptions];
  id v10 = [v4 sourceIdentifier];

  id v11 = [(DMDInstallAppOperation *)self metadata];
  id v12 = [v11 bundleIdentifier];
  [v19 setVPNUUIDString:v18 cellularSliceUUIDString:v5 contentFilterUUIDString:v6 DNSProxyUUIDString:v17 relayUUIDString:v16 associatedDomains:v15 enableDirectDownloads:v14 allowUserToHide:v13 allowUserToLock:v7 configuration:v8 options:v9 sourceIdentifier:v10 forBundleIdentifier:v12];
}

- (void)_promptIfNeededWithMessageFormat:(id)a3 success:(id)a4
{
  id v37 = a3;
  id v7 = a4;
  if (!v7)
  {
    v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2, self, @"DMDMDMv1InstallAppOperation+iphoneOS.m", 446, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10005BB30;
  v41[3] = &unk_1000CA828;
  v41[4] = self;
  id v8 = v7;
  id v42 = v8;
  id v9 = objc_retainBlock(v41);
  id v10 = +[MCCloudConfiguration sharedConfiguration];
  unsigned int v11 = [v10 isSupervised];

  if (v11)
  {
    ((void (*)(void *))v9[2])(v9);
  }
  else
  {
    id v12 = [(DMDMDMv1InstallAppOperation *)self _getRequiredAppIDFromDisk];
    if (v12
      && ([(DMDInstallAppOperation *)self metadata],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v13 storeItemIdentifier],
          id v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = [v14 isEqualToNumber:v12],
          v14,
          v13,
          v15))
    {
      ((void (*)(void *))v9[2])(v9);
    }
    else
    {
      id v16 = [(DMDMDMv1InstallAppOperation *)self request];
      uint64_t v17 = [v16 originator];

      v18 = [(DMDInstallAppOperation *)self metadata];
      id v19 = [v18 displayName];

      id v20 = DMFAppLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Prompting user to install app: %{public}@", buf, 0xCu);
      }
      v36 = v12;

      id v40 = 0;
      v21 = +[NSString stringWithValidatedFormat:v37, @"%@%@", &v40, v17, v19 validFormatSpecifiers error];
      id v22 = v40;
      if (!v21)
      {
        id v23 = DMFAppLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_1000861DC();
        }
      }
      v35 = (void *)v17;
      int64_t v24 = objc_opt_new();
      id v25 = +[NSBundle bundleForClass:objc_opt_class()];
      id v26 = [v25 localizedStringForKey:@"App Installation" value:&stru_1000CC390 table:@"DMFNotifications"];
      [v24 setHeader:v26];

      [v24 setMessage:v21];
      id v27 = +[NSBundle bundleForClass:objc_opt_class()];
      id v28 = [v27 localizedStringForKey:@"Install" value:&stru_1000CC390 table:@"DMFNotifications"];
      [v24 setDefaultButtonTitle:v28];

      v29 = +[NSBundle bundleForClass:objc_opt_class()];
      v30 = [v29 localizedStringForKey:@"Cancel" value:&stru_1000CC390 table:@"DMFNotifications"];
      [v24 setAlternateButtonTitle:v30];

      [(DMDMDMv1InstallAppOperation *)self _setState:3];
      v31 = +[DMDUserNotificationController sharedController];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10005BBC8;
      v38[3] = &unk_1000CB8B0;
      v38[4] = self;
      v39 = v9;
      [v31 showNotification:v24 completion:v38];

      v32 = [(DMDInstallAppOperation *)self metadata];
      v33 = [v32 bundleIdentifier];
      [(DMDMDMv1InstallAppOperation *)self _endOperationWithBundleIdentifier:v33];

      id v12 = v36;
    }
  }
}

- (void)_promptToSignInAndInstallAppForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = DMFAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Show our prompt to sign in", buf, 2u);
  }

  [(DMDMDMv1InstallAppOperation *)self _setState:4];
  id v6 = objc_opt_new();
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"App Installation" value:&stru_1000CC390 table:@"DMFNotifications"];
  [v6 setHeader:v8];

  id v9 = [v4 originator];
  id v10 = +[NSString localizedStringWithFormat:@"Sign in to iTunes to allow %1$@ to manage and install apps.", v9];
  [v6 setMessage:v10];

  unsigned int v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"Sign In" value:&stru_1000CC390 table:@"DMFNotifications"];
  [v6 setDefaultButtonTitle:v12];

  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"Cancel" value:&stru_1000CC390 table:@"DMFNotifications"];
  [v6 setAlternateButtonTitle:v14];

  unsigned int v15 = +[DMDUserNotificationController sharedController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005BEC4;
  v17[3] = &unk_1000CB8D8;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  [v15 showNotification:v6 completion:v17];
}

- (void)_showStorePromptToSignInAndInstallAppForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = DMFAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Show store prompt to sign in", buf, 2u);
  }

  +[DMDAppController sharedController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005C03C;
  v8[3] = &unk_1000CB928;
  void v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v4;
  id v6 = v4;
  id v7 = v9;
  [v7 promptUserToSignInWithCompletion:v8];
}

- (void)_showInstallationFailurePromptIfNeeded
{
  v3 = +[MCCloudConfiguration sharedConfiguration];
  unsigned __int8 v4 = [v3 isSupervised];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"The app “%@” could not be installed." value:&stru_1000CC390 table:@"DMFNotifications"];

    id v7 = objc_opt_new();
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"App Installation" value:&stru_1000CC390 table:@"DMFNotifications"];
    [v7 setHeader:v9];

    id v10 = [(DMDInstallAppOperation *)self metadata];
    unsigned int v11 = [v10 displayName];
    id v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v11);
    [v7 setMessage:v12];

    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"Dismiss" value:&stru_1000CC390 table:@"DMFNotifications"];
    [v7 setDefaultButtonTitle:v14];

    unsigned int v15 = DMFAppLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100086244(v15);
    }

    id v16 = +[DMDUserNotificationController sharedController];
    [v16 showNotification:v7 completion:0];
  }
}

- (void)_setState:(unint64_t)a3
{
  objc_super v5 = [(DMDInstallAppOperation *)self metadata];
  id v6 = [v5 bundleIdentifier];

  if ([(DMDMDMv1InstallAppOperation *)self _canManageBundleIdentifier:v6])
  {
    id v7 = +[DMDAppController sharedController];
    id v11 = 0;
    unsigned __int8 v8 = [v7 setState:a3 forBundleIdentifier:v6 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      id v10 = DMFAppLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100086288();
      }
    }
  }
}

- (void)_setRedemptionCode:(id)a3
{
  id v4 = a3;
  objc_super v5 = DMFAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DMDInstallAppOperation *)self metadata];
    id v7 = [v6 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set redemption code for bundle identifier: %{public}@", buf, 0xCu);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005C5FC;
  v9[3] = &unk_1000CB950;
  id v10 = v4;
  id v8 = v4;
  [(DMDMDMv1InstallAppOperation *)self _updateManagementInfoWithBlock:v9];
}

- (void)_setUnusedRedemptionCode:(id)a3
{
  id v4 = a3;
  objc_super v5 = DMFAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DMDInstallAppOperation *)self metadata];
    id v7 = [v6 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set unused redemption code for bundle identifier: %{public}@", buf, 0xCu);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005C750;
  v9[3] = &unk_1000CB950;
  id v10 = v4;
  id v8 = v4;
  [(DMDMDMv1InstallAppOperation *)self _updateManagementInfoWithBlock:v9];
}

- (void)_updateManagementInfoWithBlock:(id)a3
{
  objc_super v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"DMDMDMv1InstallAppOperation+iphoneOS.m", 608, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  id v6 = [(DMDInstallAppOperation *)self metadata];
  id v7 = [v6 bundleIdentifier];

  if ([(DMDMDMv1InstallAppOperation *)self _canManageBundleIdentifier:v7])
  {
    id v8 = DMFAppLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Update management information for bundle identifier: %{public}@", buf, 0xCu);
    }

    id v9 = +[DMDAppController sharedController];
    id v10 = [v9 managementInformationForBundleIdentifier:v7];
    if (!v10) {
      id v10 = objc_opt_new();
    }
    v5[2](v5, v10);
    id v15 = 0;
    unsigned __int8 v11 = [v9 setManagementInformation:v10 forBundleIdentifier:v7 error:&v15];
    id v12 = v15;
    if ((v11 & 1) == 0)
    {
      id v13 = DMFAppLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100086320((uint64_t)v7);
      }
    }
  }
}

- (BOOL)_canManageBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifierOfSystemPlaceholder:v3 error:0];

  return v4 == 0;
}

- (void)_endOperationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[DMDAppController sharedController];
  id v6 = [v5 stateForBundleIdentifier:v4];

  id v7 = [objc_alloc((Class)DMFMDMv1InstallAppResultObject) initWithBundleIdentifier:v4 state:v6];
  [(DMDMDMv1InstallAppOperation *)self endOperationWithResultObject:v7];
}

- (void)_resetRemovabilityWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[DMDAppController sharedController];
  [v4 setRemovability:0 forBundleIdentifier:v3 completion:&stru_1000CB970];
}

- (void)_resetTapToPayScreenLock
{
  id v5 = +[DMDAppController sharedController];
  id v3 = [(DMDInstallAppOperation *)self metadata];
  id v4 = [v3 bundleIdentifier];
  [v5 setTapToPayScreenLock:0 forBundleIdentifier:v4 completion:&stru_1000CB990];
}

- (void)_setRemovability:(id)a3
{
  id v4 = a3;
  id v5 = +[DMDAppController sharedController];
  id v6 = [(DMDInstallAppOperation *)self metadata];
  id v7 = [v6 bundleIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005CCDC;
  v9[3] = &unk_1000CADD0;
  id v10 = v4;
  id v8 = v4;
  [v5 setRemovability:v8 forBundleIdentifier:v7 completion:v9];
}

- (void)_setTapToPayScreenLock:(id)a3
{
  id v4 = a3;
  id v5 = +[DMDAppController sharedController];
  id v6 = [(DMDInstallAppOperation *)self metadata];
  id v7 = [v6 bundleIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005CE28;
  v9[3] = &unk_1000CADD0;
  id v10 = v4;
  id v8 = v4;
  [v5 setTapToPayScreenLock:v8 forBundleIdentifier:v7 completion:v9];
}

@end