@interface DMDiphoneOSAppController
+ (id)_appStoreAccountIdentifierForPersona:(id)a3;
+ (id)_appleAccountForPersona:(id)a3;
+ (id)changeTypeAsString:(int64_t)a3;
+ (id)enumeratorForOrdinaryApps;
+ (id)enumeratorForSystemAppPlaceholders;
+ (id)enumeratorForUserAppPlaceholders;
+ (id)metadataPath;
- (ASDJobManager)jobManager;
- (ASDUpdatesService)updatesService;
- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)userIsSignedIn;
- (BOOL)writeManagementInformationToDiskWithError:(id *)a3;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (NSArray)_foregroundBundleIdentifiers;
- (NSMutableDictionary)bundleIDsToAssertions;
- (NSString)singleAppModeBundleIndentifier;
- (id)_allPropertyKeys;
- (id)_managedDefaultsForBundleIdentifier:(id)a3;
- (id)configurationForBundleIdentifier:(id)a3;
- (id)feedbackForBundleIdentifier:(id)a3;
- (id)foregroundBundleIdentifiers;
- (id)initPrivate;
- (unint64_t)appTypeFromProxy:(id)a3;
- (void)_applyStoreDictionary:(id)a3 toAppMetadata:(id)a4;
- (void)_downloadAppForRequest:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)_getMetadataForBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 completion:(id)a6;
- (void)_installDeviceLicensedAppForRequest:(id)a3 completion:(id)a4;
- (void)_installUserAppForRequest:(id)a3 completion:(id)a4;
- (void)_startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)_uninstallAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)_updateEndedForLifeCycle:(id)a3;
- (void)_updateForegroundBundleIdentifiers;
- (void)_withSandboxExtensionForApp:(id)a3 do:(id)a4;
- (void)addTerminationAssertion:(id)a3 forBundleIdentifier:(id)a4;
- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)didCancelUpdatingForLifeCycle:(id)a3;
- (void)didFailUpdatingForLifeCycle:(id)a3;
- (void)didFinishUpdatingForLifeCycle:(id)a3;
- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5;
- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4;
- (void)handleFetchRequest:(id)a3 completion:(id)a4;
- (void)installSystemAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)promptUserToSignInWithCompletion:(id)a3;
- (void)removeTerminationAssertionForBundleIdentifier:(id)a3;
- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)sendAppRequestWithBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 type:(int64_t)a6 skipDownloads:(BOOL)a7 completion:(id)a8;
- (void)sendManagedAppsChangedNotification;
- (void)setBundleIDsToAssertions:(id)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setSingleAppModeBundleIndentifier:(id)a3;
- (void)set_foregroundBundleIdentifiers:(id)a3;
- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4;
- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4;
- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4;
- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5;
@end

@implementation DMDiphoneOSAppController

- (void)_updateForegroundBundleIdentifiers
{
  if (!+[NSThread isMainThread])
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"DMDAppController+iphoneOS.m" lineNumber:689 description:@"_updateForegroundBundleIdentifiers should always be called on the main thread"];
  }
  v4 = [(DMDiphoneOSAppController *)self layoutMonitor];
  v5 = [v4 currentLayout];
  v6 = [v5 elements];

  v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) bundleIdentifier:v17];
        if (v13) {
          [v7 addObject:v13];
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v14 = [v7 copy];
  [(DMDiphoneOSAppController *)self set_foregroundBundleIdentifiers:v14];

  v15 = DMFAppLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10007FE80((uint64_t)v7, v15);
  }
}

- (void)set_foregroundBundleIdentifiers:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)handleFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [(DMDiphoneOSAppController *)self updatesService];
  [v6 storeItemIdentifier];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001B98C;
  v15[3] = &unk_1000CA088;
  id v16 = v8;
  id v17 = v9;
  id v18 = v6;
  long long v19 = self;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v7;
  id v10 = v7;
  id v11 = v20;
  id v12 = v6;
  id v13 = v9;
  id v14 = v8;
  [v13 getManagedUpdatesWithCompletionBlock:v15];
}

+ (id)enumeratorForUserAppPlaceholders
{
  return +[LSApplicationRecord enumeratorWithOptions:64];
}

+ (id)enumeratorForSystemAppPlaceholders
{
  return +[LSApplicationRecord systemPlaceholderEnumerator];
}

+ (id)enumeratorForOrdinaryApps
{
  return +[LSApplicationRecord enumeratorWithOptions:0];
}

- (unint64_t)appTypeFromProxy:(id)a3
{
  v3 = [a3 applicationType];
  if ([v3 isEqualToString:LSUserApplicationType]) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = [v3 isEqualToString:LSSystemApplicationType];
  }

  return v4;
}

- (id)_allPropertyKeys
{
  if (qword_1000FB988 != -1) {
    dispatch_once(&qword_1000FB988, &stru_1000CA0A8);
  }
  v2 = (void *)qword_1000FB980;

  return v2;
}

- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)ASDExternalManifestRequestOptions) initWithURL:v6];

  [v7 setShouldHideUserPrompts:1];
  id v8 = [objc_alloc((Class)ASDExternalManifestRequest) initWithOptions:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C9E4;
  v10[3] = &unk_1000CA0D0;
  id v11 = v5;
  id v9 = v5;
  [v8 startWithCompletionBlock:v10];
}

- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 bundleIdentifier];
  id v9 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifierOfSystemPlaceholder:v8 error:0];
  uint64_t v10 = [v9 compatibilityObject];
  id v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    unsigned __int8 v13 = [v6 licenseType];
    if (v13)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10001CCAC;
      v15[3] = &unk_1000CA0F8;
      char v18 = (v13 & 2) >> 1;
      void v15[4] = self;
      id v16 = v6;
      id v17 = v7;
      [(DMDiphoneOSAppController *)self _installDeviceLicensedAppForRequest:v16 completion:v15];
    }
    else if ((v13 & 2) != 0)
    {
      [(DMDiphoneOSAppController *)self _installUserAppForRequest:v6 completion:v7];
    }
    else
    {
      id v14 = DMFErrorWithCodeAndUserInfo();
      (*((void (**)(id, void *))v7 + 2))(v7, v14);
    }
  }
  else
  {
    [(DMDiphoneOSAppController *)self installSystemAppWithBundleIdentifier:v8 completion:v7];
  }
}

- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = DMFAppLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resume app installation for bundle identifier: %{public}@", buf, 0xCu);
  }

  [(DMDiphoneOSAppController *)self jobManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001CE94;
  v12[3] = &unk_1000CA148;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v7;
  id v13 = v6;
  id v9 = v14;
  id v10 = v7;
  id v11 = v6;
  [v9 getJobsUsingBlock:v12];
}

- (void)_installDeviceLicensedAppForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = DMFAppLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Install device licensed app for request: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  [(DMDiphoneOSAppController *)self _downloadAppForRequest:v6 type:2 completion:v7];
}

- (void)_installUserAppForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = DMFAppLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Install user licensed app for request: %{public}@", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D3F4;
  v11[3] = &unk_1000C9DA0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(DMDiphoneOSAppController *)self _downloadAppForRequest:v10 type:1 completion:v11];
}

- (void)_downloadAppForRequest:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 bundleIdentifier];
  id v11 = [v9 storeItemIdentifier];
  id v12 = [v9 personaIdentifier];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001D5F8;
  v14[3] = &unk_1000CA170;
  id v15 = v8;
  id v13 = v8;
  [(DMDiphoneOSAppController *)self sendAppRequestWithBundleIdentifier:v10 storeItemIdentifier:v11 personaIdentifier:v12 type:a4 skipDownloads:0 completion:v14];
}

- (id)initPrivate
{
  v14.receiver = self;
  v14.super_class = (Class)DMDiphoneOSAppController;
  v2 = [(DMDAppController *)&v14 initPrivate];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (void *)v2[7];
    v2[7] = &__NSArray0__struct;

    unint64_t v4 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_100005ECC;
    id v11 = &unk_1000CA198;
    objc_copyWeak(&v12, &location);
    [v4 setTransitionHandler:&v8];
    uint64_t v5 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v4, v8, v9, v10, v11);
    id v6 = (void *)v2[6];
    v2[6] = v5;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)foregroundBundleIdentifiers
{
  return [(DMDiphoneOSAppController *)self _foregroundBundleIdentifiers];
}

- (ASDJobManager)jobManager
{
  if (qword_1000FB998 != -1) {
    dispatch_once(&qword_1000FB998, &stru_1000CA1B8);
  }
  v2 = (void *)qword_1000FB990;

  return (ASDJobManager *)v2;
}

- (ASDUpdatesService)updatesService
{
  if (qword_1000FB9A8 != -1) {
    dispatch_once(&qword_1000FB9A8, &stru_1000CA1D8);
  }
  v2 = (void *)qword_1000FB9A0;

  return (ASDUpdatesService *)v2;
}

- (void)addTerminationAssertion:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = DMFAppLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Add termination assertion for bundle identifier: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v9 = [(DMDiphoneOSAppController *)self bundleIDsToAssertions];

  if (!v9)
  {
    id v10 = objc_opt_new();
    [(DMDiphoneOSAppController *)self setBundleIDsToAssertions:v10];
  }
  id v11 = [(DMDiphoneOSAppController *)self bundleIDsToAssertions];
  [v11 setObject:v7 forKeyedSubscript:v6];
}

- (void)removeTerminationAssertionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMFAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remove termination assertion for bundle identifier: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(DMDiphoneOSAppController *)self bundleIDsToAssertions];
  id v7 = [v6 objectForKeyedSubscript:v4];
  [v7 invalidate];

  id v8 = [(DMDiphoneOSAppController *)self bundleIDsToAssertions];
  [v8 setObject:0 forKeyedSubscript:v4];
}

- (BOOL)userIsSignedIn
{
  v2 = +[SSAccountStore defaultStore];
  v3 = [v2 activeAccount];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)promptUserToSignInWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[SSAccountStore defaultStore];
  uint64_t v5 = [v4 activeAccount];

  if (v5)
  {
    id v6 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v5];
  }
  else
  {
    id v6 = +[SSMutableAuthenticationContext contextForSignIn];
  }
  id v7 = v6;
  [v6 setPromptStyle:0];
  [v7 setAccountNameEditable:0];
  [v7 setCanCreateNewAccount:1];
  id v8 = [objc_alloc((Class)SSAuthenticateRequest) initWithAuthenticationContext:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001DD30;
  v10[3] = &unk_1000CA200;
  id v11 = v3;
  id v9 = v3;
  [v8 startWithAuthenticateResponseBlock:v10];
}

- (void)sendAppRequestWithBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 type:(int64_t)a6 skipDownloads:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (!v9)
  {

    id v14 = 0;
  }
  if ((unint64_t)(a6 - 1) > 2) {
    CFStringRef v18 = @"Undefined";
  }
  else {
    CFStringRef v18 = off_1000CA310[a6 - 1];
  }
  long long v19 = DMFAppLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v20 = @"YES";
    *(_DWORD *)buf = 138544386;
    id v29 = v14;
    if (v9) {
      CFStringRef v20 = @"NO";
    }
    CFStringRef v21 = @"override";
    __int16 v30 = 2114;
    CFStringRef v33 = v18;
    id v31 = v15;
    __int16 v32 = 2114;
    if (!v16) {
      CFStringRef v21 = @"default";
    }
    __int16 v34 = 2114;
    CFStringRef v35 = v20;
    __int16 v36 = 2114;
    CFStringRef v37 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Send app store request for bundle identifier: %{public}@, store item identifier: %{public}@, type: %{public}@, download: %{public}@, persona: %{public}@", buf, 0x34u);
  }

  id v22 = [objc_alloc((Class)ASDManagedApplicationRequestOptions) initWithItemIdentifer:v15 externalVersionIdentifier:0 bundleIdentifier:v14 bundleVersion:0 skipDownloads:v9];
  [v22 setRequestType:a6];
  v23 = [(id)objc_opt_class() _appStoreAccountIdentifierForPersona:v16];
  [v22 setAccountIdentifier:v23];

  id v24 = [objc_alloc((Class)ASDManagedApplicationRequest) initWithOptions:v22];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001E034;
  v26[3] = &unk_1000CA228;
  v26[4] = self;
  id v27 = v17;
  id v25 = v17;
  [v24 sendRequestWithCompletionBlock:v26];
}

+ (id)_appStoreAccountIdentifierForPersona:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = [(id)objc_opt_class() _appleAccountForPersona:v3];
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = [v4 ams_DSID];
      id v7 = DMFAppLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543618;
        id v10 = v3;
        __int16 v11 = 2114;
        int v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "persona:%{public}@ -> accountIdentifier:%{public}@", (uint8_t *)&v9, 0x16u);
      }
    }
    else
    {
      id v7 = DMFAppLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "persona:%{public}@ -> accountIdentifier:<none>", (uint8_t *)&v9, 0xCu);
      }
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_appleAccountForPersona:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[ACAccountStore defaultStore];
  uint64_t v5 = [v4 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierAppleAccount];
  [v4 accountsWithAccountType:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    id v16 = v5;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = ACAccountPropertyPersonaIdentifier;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v13 isEqualToString:v3])
        {
          id v14 = v12;

          goto LABEL_12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    id v14 = 0;
LABEL_12:
    uint64_t v5 = v16;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)changeTypeAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"default";
  }
  else {
    return off_1000CA328[a3];
  }
}

- (void)installSystemAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    __int16 v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"DMDAppController+iphoneOS.m" lineNumber:328 description:@"We must have a bundle identifier to be installing a system app"];
  }
  id v9 = [objc_alloc((Class)ASDSystemAppRequest) initWithBundleID:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001E608;
  v12[3] = &unk_1000CA250;
  id v13 = v8;
  id v10 = v8;
  [v9 startWithErrorHandler:v12];
}

- (BOOL)writeManagementInformationToDiskWithError:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMDiphoneOSAppController;
  BOOL v3 = [(DMDAppController *)&v6 writeManagementInformationToDiskWithError:a3];
  if (v3)
  {
    BOOL v4 = +[MCProfileConnection sharedConnection];
    [v4 rereadManagedAppAttributes];
  }
  return v3;
}

+ (id)metadataPath
{
  return +[DMDPaths managedAppsManifest];
}

- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001E820;
  v9[3] = &unk_1000C9D78;
  id v10 = a5;
  id v8 = v10;
  [(DMDiphoneOSAppController *)self _getMetadataForBundleIdentifier:0 storeItemIdentifier:a3 personaIdentifier:a4 completion:v9];
}

- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4
{
  id v22 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = v22;
  if (v22)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2, self, @"DMDAppController+iphoneOS.m", 390, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    id v8 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  CFStringRef v21 = +[NSAssertionHandler currentHandler];
  [v21 handleFailureInMethod:a2, self, @"DMDAppController+iphoneOS.m", 391, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

  id v8 = v22;
LABEL_3:
  id v9 = [v8 bundleIdentifier];
  id v10 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifierOfSystemPlaceholder:v9 error:0];
  uint64_t v11 = [v10 compatibilityObject];
  int v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v15 = [v22 storeItemIdentifier];
    id v14 = [v22 personaIdentifier];
    [(DMDiphoneOSAppController *)self _getMetadataForBundleIdentifier:v9 storeItemIdentifier:v15 personaIdentifier:v14 completion:v7];
  }
  else
  {
    id v15 = objc_opt_new();
    [v15 setBundleIdentifier:v9];
    id v16 = [v12 itemID];
    [v15 setStoreItemIdentifier:v16];

    uint64_t v17 = [v12 localizedName];
    long long v18 = (void *)v17;
    if (v17)
    {
      [v15 setDisplayName:v17];
    }
    else
    {
      long long v19 = [v12 itemName];
      [v15 setDisplayName:v19];
    }
    [v15 setIsStoreApp:0];
    [v15 setIsFree:1];
    [v15 setIsUserLicensed:1];
    v7[2](v7, v15, 0);
  }
}

- (void)sendManagedAppsChangedNotification
{
}

- (id)configurationForBundleIdentifier:(id)a3
{
  BOOL v3 = [(DMDiphoneOSAppController *)self _managedDefaultsForBundleIdentifier:a3];
  BOOL v4 = [v3 objectForKeyedSubscript:@"com.apple.configuration.managed"];

  return v4;
}

- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = DMFAppLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"non-nil";
    if (!v7) {
      CFStringRef v10 = @"nil";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v17 = v10;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Set configuration: %{public}@, for bundle identifier: %{public}@", buf, 0x16u);
  }

  uint64_t v11 = [(DMDiphoneOSAppController *)self _managedDefaultsForBundleIdentifier:v8];
  id v12 = [v11 mutableCopy];

  if (!v12) {
    id v12 = (id)objc_opt_new();
  }
  [v12 setObject:v7 forKeyedSubscript:@"com.apple.configuration.managed"];
  _CFPreferencesWriteManagedDomain();
  id v15 = v8;
  BOOL v13 = +[NSArray arrayWithObjects:&v15 count:1];
  _CFPreferencesManagementStatusChangedForDomains();
  _CFPreferencesPostValuesChangedInDomains();

  return 1;
}

- (void)_withSandboxExtensionForApp:(id)a3 do:(id)a4
{
  id v5 = a3;
  objc_super v6 = (void (**)(id, void *, uint64_t))a4;
  if (v6)
  {
    id v7 = v5;
    [v7 UTF8String];
    if (container_create_or_lookup_for_current_user())
    {
      uint64_t v8 = container_copy_path();
      if (v8)
      {
        id v9 = (void *)v8;
        CFStringRef v10 = +[NSString stringWithUTF8String:v8];
        if (v10)
        {
          free(v9);
          int v11 = container_acquire_sandbox_extension();
          id v12 = DMFAppLog();
          BOOL v13 = v12;
          if (v11)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v15 = v7;
              __int16 v16 = 2114;
              uint64_t v17 = (uint64_t)v10;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "container_acquire_sandbox_extension %{public}@ succeeded for path '%{public}@'", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            id v15 = v7;
            __int16 v16 = 2048;
            uint64_t v17 = 1;
            __int16 v18 = 2114;
            id v19 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "container_acquire_sandbox_extension %{public}@ failed, error %llu, path '%{public}@'", buf, 0x20u);
          }

          v6[2](v6, v10, 1);
          container_free_object();
        }
        else
        {
          v6[2](v6, 0, 1);
          container_free_object();
          free(v9);
        }
      }
      else
      {
        v6[2](v6, 0, 1);
        container_free_object();
      }
    }
    else
    {
      v6[2](v6, 0, 1);
    }
  }
}

- (id)feedbackForBundleIdentifier:(id)a3
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = sub_10001F074;
  id v14 = sub_10001F084;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F08C;
  v7[3] = &unk_1000CA278;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  [(DMDiphoneOSAppController *)self _withSandboxExtensionForApp:v4 do:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"non-nil";
    if (!v8) {
      CFStringRef v11 = @"nil";
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set feedback: %{public}@, for bundle identifier: %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001F388;
  v16[3] = &unk_1000CA2A0;
  id v12 = v9;
  id v17 = v12;
  long long v20 = a5;
  id v13 = v8;
  id v18 = v13;
  id v19 = buf;
  [(DMDiphoneOSAppController *)self _withSandboxExtensionForApp:v12 do:v16];
  BOOL v14 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v14;
}

- (id)_managedDefaultsForBundleIdentifier:(id)a3
{
  BOOL v3 = (void *)_CFPreferencesCopyPathForManagedDomain();
  id v4 = +[NSDictionary dictionaryWithContentsOfFile:v3];

  return v4;
}

- (void)_applyStoreDictionary:(id)a3 toAppMetadata:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  objc_super v6 = [v13 objectForKeyedSubscript:ASDManagedLookupBundleID];
  if (v6) {
    [v5 setBundleIdentifier:v6];
  }
  id v7 = [v13 objectForKeyedSubscript:ASDManagedLookupItemID];
  if (v7) {
    [v5 setStoreItemIdentifier:v7];
  }
  id v8 = [v13 objectForKeyedSubscript:ASDManagedLookupBundleDisplayName];
  if (v8) {
    [v5 setDisplayName:v8];
  }
  id v9 = [v13 objectForKeyedSubscript:ASDManagedLookupIsAppFree];
  uint64_t v10 = v9;
  if (v9) {
    [v5 setIsFree:[v9 BOOLValue]];
  }
  CFStringRef v11 = [v13 objectForKeyedSubscript:ASDManagedLookupIsActiveAccountAppOwner];
  id v12 = v11;
  if (v11) {
    [v5 setIsUserLicensed:[v11 BOOLValue]];
  }
}

- (void)_getMetadataForBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = DMFAppLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v27 = v10;
    __int16 v28 = 2114;
    id v29 = v11;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Get metadata for bundle identifier: %{public}@, store item identifier: %{public}@, persona: %{public}@", buf, 0x20u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001F7F4;
  v20[3] = &unk_1000CA2F0;
  id v21 = v10;
  id v22 = v11;
  id v24 = v12;
  id v25 = v13;
  v23 = self;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  id v19 = objc_retainBlock(v20);
  [(DMDiphoneOSAppController *)self sendAppRequestWithBundleIdentifier:v18 storeItemIdentifier:v17 personaIdentifier:v15 type:3 skipDownloads:1 completion:v19];
}

- (NSString)singleAppModeBundleIndentifier
{
  return self->_singleAppModeBundleIndentifier;
}

- (void)setSingleAppModeBundleIndentifier:(id)a3
{
}

- (NSMutableDictionary)bundleIDsToAssertions
{
  return self->_bundleIDsToAssertions;
}

- (void)setBundleIDsToAssertions:(id)a3
{
}

- (void)setLayoutMonitor:(id)a3
{
}

- (NSArray)_foregroundBundleIdentifiers
{
  return self->__foregroundBundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__foregroundBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_bundleIDsToAssertions, 0);

  objc_storeStrong((id *)&self->_singleAppModeBundleIndentifier, 0);
}

- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001FCD0;
  v8[3] = &unk_1000CA388;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [(DMDiphoneOSAppController *)self promptUserToSignInWithCompletion:v8];
}

- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(DMDiphoneOSAppController *)self jobManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000200AC;
  v11[3] = &unk_1000CA148;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v12 = v6;
  id v8 = v13;
  id v9 = v7;
  id v10 = v6;
  [v8 getJobsUsingBlock:v11];
}

- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)BKSTerminationAssertion);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1000204F0;
  id v16 = &unk_1000CA3B0;
  id v17 = self;
  id v18 = v7;
  id v19 = v8;
  SEL v20 = a2;
  id v10 = v8;
  id v11 = v7;
  id v12 = [v9 initWithBundleIdentifier:v11 efficacy:3 name:@"com.apple.dmd.remove-foreground-app" withHandler:&v13];
  -[DMDiphoneOSAppController addTerminationAssertion:forBundleIdentifier:](self, "addTerminationAssertion:forBundleIdentifier:", v12, v11, v13, v14, v15, v16, v17);
}

- (void)_uninstallAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)IXUninstallOptions);
  [v7 setRequestUserConfirmation:0];
  [v7 setWaitForDeletion:0];
  [v7 setIgnoreRemovability:1];
  [v7 setIgnoreRestrictions:1];
  [v7 setIgnoreAppProtection:1];
  id v8 = +[UMUserManager sharedManager];
  if ([v8 isMultiUser])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100020828;
    v15[3] = &unk_1000CA400;
    id v9 = &v16;
    id v16 = v5;
    id v17 = v7;
    id v10 = v8;
    id v18 = v10;
    id v19 = v6;
    id v11 = v6;
    [v10 terminateSyncWithCompletionHandler:v15];
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100020948;
    v13[3] = &unk_1000CA428;
    id v9 = &v14;
    id v14 = v6;
    id v12 = v6;
    +[IXAppInstallCoordinator uninstallAppWithBundleID:v5 options:v7 completion:v13];
  }
}

- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 bundleIdentifier];
  id v12 = [(DMDiphoneOSAppController *)self foregroundBundleIdentifiers];
  unsigned __int8 v13 = [v12 containsObject:v11];

  if (v13)
  {
    id v14 = DMFAppLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating foreground app for request: %{public}@, so will take termination assertion", (uint8_t *)&v19, 0xCu);
    }

    id v15 = +[DMDDeviceController shared];
    id v16 = [v15 isInSingleAppMode];
    unsigned int v17 = [v16 BOOLValue];

    if (v17)
    {
      id v18 = DMFAppLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        id v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "We will need to restart the app after updating bundle identifier: %{public}@", (uint8_t *)&v19, 0xCu);
      }

      [(DMDiphoneOSAppController *)self setSingleAppModeBundleIndentifier:v11];
    }
  }
  [(DMDiphoneOSAppController *)self _startUpdatingAppForRequest:v8 metadata:v9 completion:v10];
}

- (void)didCancelUpdatingForLifeCycle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DMDiphoneOSAppController;
  id v4 = a3;
  [(DMDAppController *)&v5 didCancelUpdatingForLifeCycle:v4];
  -[DMDiphoneOSAppController _updateEndedForLifeCycle:](self, "_updateEndedForLifeCycle:", v4, v5.receiver, v5.super_class);
}

- (void)didFailUpdatingForLifeCycle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DMDiphoneOSAppController;
  id v4 = a3;
  [(DMDAppController *)&v5 didFailUpdatingForLifeCycle:v4];
  -[DMDiphoneOSAppController _updateEndedForLifeCycle:](self, "_updateEndedForLifeCycle:", v4, v5.receiver, v5.super_class);
}

- (void)didFinishUpdatingForLifeCycle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DMDiphoneOSAppController;
  id v4 = a3;
  [(DMDAppController *)&v5 didFinishUpdatingForLifeCycle:v4];
  -[DMDiphoneOSAppController _updateEndedForLifeCycle:](self, "_updateEndedForLifeCycle:", v4, v5.receiver, v5.super_class);
}

- (void)_startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 lifeCycle];
  [v10 addObserver:self];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100020F0C;
  v22[3] = &unk_1000C9DA0;
  v22[4] = self;
  id v11 = v10;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  unsigned __int8 v13 = objc_retainBlock(v22);
  id v14 = [v8 manifestURL];
  if (v14)
  {
    id v15 = DMFAppLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v14 host];
      *(_DWORD *)buf = 138543362;
      id v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Start updating enterprise app with manifest URL from: %{public}@", buf, 0xCu);
    }
    [(DMDiphoneOSAppController *)self startInstallingEnterpriseAppWithManifestURL:v14 completion:v13];
  }
  else
  {
    unsigned int v17 = objc_opt_new();
    [v17 setLicenseType:3];
    id v18 = [v8 bundleIdentifier];
    [v17 setBundleIdentifier:v18];

    int v19 = [v8 storeItemIdentifier];
    [v17 setStoreItemIdentifier:v19];

    id v20 = [v8 personaIdentifier];
    [v17 setPersonaIdentifier:v20];

    id v21 = DMFAppLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = v8;
      __int16 v27 = 2114;
      __int16 v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Start updating non-enterprise app for request: %{public}@, new install request: %{public}@", buf, 0x16u);
    }

    [(DMDiphoneOSAppController *)self startInstallingNonEnterpriseAppForRequest:v17 completion:v13];
  }
}

- (void)_updateEndedForLifeCycle:(id)a3
{
  id v4 = [a3 bundleIdentifier];
  objc_super v5 = DMFAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unsigned int v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DMF registered app update complete for bundle identifier: %{public}@", buf, 0xCu);
  }

  id v6 = [(DMDiphoneOSAppController *)self singleAppModeBundleIndentifier];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  id v8 = DMFAppLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DMF restarting app with bundle identifier: %{public}@...", buf, 0xCu);
    }

    v14[0] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v14[1] = FBSOpenApplicationOptionKeyUnlockDevice;
    v15[0] = &__kCFBooleanTrue;
    v15[1] = &__kCFBooleanTrue;
    v14[2] = FBSOpenApplicationOptionKeyLaunchOrigin;
    v15[2] = @"com.apple.dmd.restart-single-app-mode";
    id v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    id v8 = +[FBSOpenApplicationOptions optionsWithDictionary:v10];

    id v11 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000211F8;
    v12[3] = &unk_1000CA450;
    id v13 = v4;
    [v11 openApplication:v13 withOptions:v8 completion:v12];

    [(DMDiphoneOSAppController *)self setSingleAppModeBundleIndentifier:0];
  }
  else if (v9)
  {
    *(_DWORD *)buf = 138543362;
    unsigned int v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DMF ignoring app restart for bundle identifier: %{public}@", buf, 0xCu);
  }
}

@end